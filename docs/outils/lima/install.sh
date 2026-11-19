#!/usr/bin/env bash

set -euo pipefail

# Default version to install (VERSION=latest for the latest release)
DEFAULT_VERSION="2.3.0"
VERSION="${VERSION:-${DEFAULT_VERSION}}"
INSTALL_PREFIX="${INSTALL_PREFIX:-/usr/local}"
INSTALL_BIN_DIR="${INSTALL_BIN_DIR:-${INSTALL_PREFIX}/bin}"
INSTALL_SHARE_DIR="${INSTALL_SHARE_DIR:-${INSTALL_PREFIX}/share}"

if [[ "$(uname -s)" != "Linux" ]]; then
	echo "[ERROR] This script only supports Linux."
	exit 1
fi

ARCH="$(uname -m)"
if [[ "$ARCH" != "x86_64" ]] && [[ "$ARCH" != "aarch64" ]]; then
	echo "[ERROR] Unsupported architecture: $ARCH (supported: x86_64, aarch64)"
	exit 1
fi

for cmd in curl jq tar install sha256sum; do
	if ! command -v "$cmd" >/dev/null 2>&1; then
		echo "[ERROR] Missing required command: $cmd"
		if [[ "$cmd" == "jq" ]]; then
			echo "[ERROR] Install it with: sudo apt-get update && sudo apt-get install -y jq"
		fi
		exit 1
	fi
done

# Latest release (exit on failure: GitHub API unreachable or rate limited)
LATEST_VERSION="$(
	curl -fsSL --max-time 10 "https://api.github.com/repos/lima-vm/lima/releases/latest" \
		| jq -r '.tag_name // empty'
)" || LATEST_VERSION=""
LATEST_VERSION="${LATEST_VERSION#v}"
if [[ -z "$LATEST_VERSION" ]]; then
	echo "[ERROR] Unable to retrieve the latest version from GitHub API."
	exit 1
fi

if [[ "$VERSION" == "latest" ]]; then
	VERSION="$LATEST_VERSION"
fi
VERSION="${VERSION#v}"

ARCHIVE_NAME="lima-${VERSION}-Linux-${ARCH}.tar.gz"
RELEASE_URL="https://github.com/lima-vm/lima/releases/download/v${VERSION}"
ARCHIVE_URL="${ARCHIVE_URL:-${RELEASE_URL}/${ARCHIVE_NAME}}"
CHECKSUMS_URL="${RELEASE_URL}/SHA256SUMS"

echo "-------------------------------------------------------------------"
echo "-- lima/install.sh - v${VERSION} (latest=${LATEST_VERSION})"
echo "-------------------------------------------------------------------"

if [[ "$VERSION" != "$LATEST_VERSION" ]]; then
	echo "[WARN] Latest version is ${LATEST_VERSION} (installing: ${VERSION}, use VERSION=latest to install it)"
fi

# Check write access on the first existing directory (INSTALL_PREFIX may not exist yet)
WRITE_CHECK_DIR="$INSTALL_PREFIX"
while [[ ! -e "$WRITE_CHECK_DIR" ]]; do
	WRITE_CHECK_DIR="$(dirname "$WRITE_CHECK_DIR")"
done

SUDO=""
if [[ ! -w "$WRITE_CHECK_DIR" ]]; then
	if command -v sudo >/dev/null 2>&1; then
		SUDO="sudo"
	else
		echo "[ERROR] No write access to $INSTALL_PREFIX and sudo is not available."
		exit 1
	fi
fi

WORK_DIR="$(mktemp -d)"
ARCHIVE_PATH="$WORK_DIR/lima.tar.gz"
EXTRACT_DIR="$WORK_DIR/extract"

cleanup() {
	rm -rf "$WORK_DIR"
}
trap cleanup EXIT

echo "[INFO] Downloading ${ARCHIVE_URL}..."
curl -fL --retry 3 --retry-delay 2 -o "$ARCHIVE_PATH" "$ARCHIVE_URL"

echo "[INFO] Verifying checksum with ${CHECKSUMS_URL}..."
EXPECTED_SHA256="$(
	curl -fsSL --retry 3 --retry-delay 2 "$CHECKSUMS_URL" \
		| awk -v name="$ARCHIVE_NAME" '$2 == name || $2 == "*" name { print $1 }'
)" || true
if [[ -z "$EXPECTED_SHA256" ]]; then
	echo "[ERROR] Unable to find checksum for ${ARCHIVE_NAME} in ${CHECKSUMS_URL}."
	exit 1
fi
if ! echo "${EXPECTED_SHA256}  ${ARCHIVE_PATH}" | sha256sum -c --status -; then
	echo "[ERROR] Checksum mismatch for ${ARCHIVE_NAME}."
	exit 1
fi

echo "[INFO] Extracting archive..."
mkdir -p "$EXTRACT_DIR"
tar -xzf "$ARCHIVE_PATH" -C "$EXTRACT_DIR"

if [[ ! -f "$EXTRACT_DIR/bin/lima" ]] || [[ ! -f "$EXTRACT_DIR/bin/limactl" ]]; then
	echo "[ERROR] Archive does not contain expected binaries (lima, limactl)."
	exit 1
fi

echo "[INFO] Installing binaries to ${INSTALL_BIN_DIR}..."
$SUDO install -d -m 0755 "$INSTALL_BIN_DIR"
while IFS= read -r -d '' file; do
	filename="$(basename "$file")"
	$SUDO install -m 0755 "$file" "$INSTALL_BIN_DIR/$filename"
done < <(find "$EXTRACT_DIR/bin" -maxdepth 1 -type f -print0)

if [[ -d "$EXTRACT_DIR/share/man" ]]; then
	echo "[INFO] Installing man pages to ${INSTALL_SHARE_DIR}/man..."
	$SUDO install -d -m 0755 "$INSTALL_SHARE_DIR/man"
	$SUDO cp -R "$EXTRACT_DIR/share/man/." "$INSTALL_SHARE_DIR/man/"
fi

if [[ -d "$EXTRACT_DIR/share/lima" ]]; then
	echo "[INFO] Installing Lima runtime resources to ${INSTALL_SHARE_DIR}/lima..."
	$SUDO install -d -m 0755 "$INSTALL_SHARE_DIR/lima"
	$SUDO cp -R "$EXTRACT_DIR/share/lima/." "$INSTALL_SHARE_DIR/lima/"
else
	echo "[ERROR] Archive does not contain expected runtime resources (share/lima)."
	exit 1
fi

echo "[INFO] Installation complete."
"$INSTALL_BIN_DIR/limactl" --version || true
