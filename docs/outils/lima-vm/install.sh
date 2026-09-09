#!/usr/bin/env bash

set -euo pipefail

VERSION="${VERSION:-2.2.0}"
ARCHIVE_URL="${ARCHIVE_URL:-https://github.com/lima-vm/lima/releases/download/v2.2.0/lima-2.2.0-Linux-x86_64.tar.gz}"
INSTALL_PREFIX="${INSTALL_PREFIX:-/usr/local}"
INSTALL_BIN_DIR="${INSTALL_BIN_DIR:-${INSTALL_PREFIX}/bin}"
INSTALL_SHARE_DIR="${INSTALL_SHARE_DIR:-${INSTALL_PREFIX}/share}"

echo "-------------------------------------------------------------------"
echo "-- lima-vm/install.sh - v${VERSION}"
echo "-------------------------------------------------------------------"

if [[ "$(uname -s)" != "Linux" ]]; then
	echo "[ERROR] This script only supports Linux."
	exit 1
fi

if [[ "$(uname -m)" != "x86_64" ]]; then
	echo "[ERROR] This installer is for Linux x86_64 only."
	echo "[ERROR] Current architecture: $(uname -m)"
	exit 1
fi

for cmd in curl tar install; do
	if ! command -v "$cmd" >/dev/null 2>&1; then
		echo "[ERROR] Missing required command: $cmd"
		exit 1
	fi
done

SUDO=""
if [[ ! -w "$INSTALL_PREFIX" ]]; then
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

echo "[INFO] Installation complete."
"$INSTALL_BIN_DIR/lima" --version || true
"$INSTALL_BIN_DIR/limactl" --version || true
