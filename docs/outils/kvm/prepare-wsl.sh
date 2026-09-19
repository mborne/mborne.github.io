#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

if [ ! -e "/etc/wsl.conf" ];
then
    echo "${ICON_ERROR} kvm/prepare-wsl.sh is for WSL2 (/etc/wsl.conf not found)!"
    exit 1
fi

echo "${ICON_INFO} Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo "${ICON_WARN} Disable snap services..."
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo systemctl mask snapd.service

#----------------------------------------------------------------------
# Enable systemd in /etc/wsl.conf (per distribution settings)
#
# See https://learn.microsoft.com/en-us/windows/wsl/wsl-config
#----------------------------------------------------------------------

WSL_CONF="/etc/wsl.conf"

if grep -qE '^[[:space:]]*systemd[[:space:]]*=[[:space:]]*true' "${WSL_CONF}"; then
    echo "${ICON_OK} systemd is already enabled in ${WSL_CONF}"
elif grep -qE '^[[:space:]]*systemd[[:space:]]*=' "${WSL_CONF}"; then
    echo "${ICON_ERROR} systemd is explicitly disabled in ${WSL_CONF}, please review it manually"
    exit 1
else
    echo "${ICON_INFO} Enabling systemd in ${WSL_CONF} (backup : ${WSL_CONF}.bak) ..."
    sudo cp "${WSL_CONF}" "${WSL_CONF}.bak"
    printf '\n[boot]\nsystemd=true\n' | sudo tee -a "${WSL_CONF}" > /dev/null
fi

#----------------------------------------------------------------------
# Nested virtualization is NOT configurable from the distribution : it
# is a [wsl2] setting read from %UserProfile%\.wslconfig on the Windows
# side (and it defaults to true on Windows 11).
#----------------------------------------------------------------------

echo "${ICON_INFO} Nested virtualization (required by KVM) is enabled by default on Windows 11."
echo "${ICON_INFO} If needed, force it from Windows in %UserProfile%\\.wslconfig :"
echo ""
echo "    [wsl2]"
echo "    nestedVirtualization=true"
echo ""

echo "${ICON_WARN} WARNING : reboot required (exit, then : wsl --shutdown ; wsl)"
