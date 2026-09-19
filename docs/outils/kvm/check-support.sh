#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

#----------------------------------------------------------------------
# Read-only diagnostic of KVM support.
#
# Nothing is installed or modified : each problem is reported along with
# the command to run.
#
# See https://mborne.github.io/outils/kvm/
#----------------------------------------------------------------------

STATUS=0

# $1 : icon, $2 : label, $3 : message
report() {
    printf '%-18s %s%s\n' "$2" "$1" "$3"
}

# $1 : hint
hint() {
    printf '%-18s    → %s\n' "" "$1"
}

#----------------------------------------------------------------------
# Detect execution context (WSL2, virtual machine or bare metal)
#----------------------------------------------------------------------

IS_WSL=false
if grep -qi 'microsoft' /proc/sys/kernel/osrelease; then
    IS_WSL=true
    report "${ICON_INFO}" "Contexte" "WSL2 (${WSL_DISTRO_NAME:-distribution inconnue})"
elif command -v systemd-detect-virt > /dev/null && systemd-detect-virt --quiet; then
    report "${ICON_INFO}" "Contexte" "machine virtuelle ($(systemd-detect-virt))"
else
    report "${ICON_INFO}" "Contexte" "machine physique"
fi

#----------------------------------------------------------------------
# CPU : hardware virtualization extensions
#
# Under WSL2, these flags reflect the nested virtualization setting.
#----------------------------------------------------------------------

CPU_OK=true
if grep -qE '^flags[[:space:]]*:.*[[:space:]](vmx|svm)([[:space:]]|$)' /proc/cpuinfo; then
    report "${ICON_OK}" "CPU" "virtualisation matérielle disponible"
else
    CPU_OK=false
    report "${ICON_ERROR}" "CPU" "pas d'extension VT-x (vmx) ni AMD-V (svm)"
    if [ "${IS_WSL}" = true ]; then
        hint "vérifier la virtualisation imbriquée côté Windows dans %UserProfile%\\.wslconfig :"
        hint "[wsl2] puis nestedVirtualization=true (actif par défaut sur Windows 11)"
        hint "puis redémarrer WSL avec : wsl --shutdown"
    else
        hint "activer VT-x / AMD-V dans le BIOS/UEFI"
    fi
    STATUS=1
fi

#----------------------------------------------------------------------
# /dev/kvm : the device actually used by qemu --virt-type kvm
#----------------------------------------------------------------------

if [ ! -e /dev/kvm ]; then
    report "${ICON_ERROR}" "/dev/kvm" "absent"
    if [ "${CPU_OK}" = true ]; then
        hint "installer KVM : curl -sS https://mborne.github.io/outils/kvm/install.sh | bash"
    else
        hint "conséquence de l'absence de support CPU ci-dessus"
    fi
    STATUS=1
elif [ -r /dev/kvm ] && [ -w /dev/kvm ]; then
    report "${ICON_OK}" "/dev/kvm" "présent et accessible"
else
    report "${ICON_ERROR}" "/dev/kvm" "présent mais inaccessible en lecture/écriture"
    hint "sudo adduser ${USER} kvm, puis se reconnecter"
    STATUS=1
fi

#----------------------------------------------------------------------
# systemd : required to run libvirtd
#----------------------------------------------------------------------

if [ "$(ps -p 1 -o comm=)" = "systemd" ]; then
    report "${ICON_OK}" "systemd" "actif"
else
    report "${ICON_WARN}" "systemd" "inactif (libvirtd ne pourra pas démarrer)"
    if [ "${IS_WSL}" = true ]; then
        hint "ajouter [boot] puis systemd=true dans /etc/wsl.conf"
        hint "puis redémarrer WSL avec : wsl --shutdown"
    else
        hint "distribution sans systemd : démarrer libvirtd selon son init"
    fi
fi

#----------------------------------------------------------------------
# Groups : the most common cause of "permission denied" with virsh
#----------------------------------------------------------------------

for GROUP_NAME in kvm libvirt; do
    if ! getent group "${GROUP_NAME}" > /dev/null; then
        report "${ICON_WARN}" "Groupe ${GROUP_NAME}" "inexistant (paquet non installé)"
    elif id -nG | grep -qw "${GROUP_NAME}"; then
        report "${ICON_OK}" "Groupe ${GROUP_NAME}" "${USER} est membre"
    else
        report "${ICON_WARN}" "Groupe ${GROUP_NAME}" "${USER} n'est pas membre"
        hint "sudo adduser ${USER} ${GROUP_NAME}, puis se reconnecter"
    fi
done

#----------------------------------------------------------------------
# Tools : qemu-kvm provides none of them
#----------------------------------------------------------------------

MISSING_TOOLS=""
for TOOL_NAME in virsh virt-install qemu-img; do
    command -v "${TOOL_NAME}" > /dev/null || MISSING_TOOLS="${MISSING_TOOLS} ${TOOL_NAME}"
done

if [ -z "${MISSING_TOOLS}" ]; then
    report "${ICON_OK}" "Outils" "virsh, virt-install et qemu-img sont disponibles"
else
    report "${ICON_WARN}" "Outils" "absent(s) :${MISSING_TOOLS}"
    hint "installer libvirt : curl -sS https://mborne.github.io/outils/libvirt/install.sh | bash"
fi

#----------------------------------------------------------------------

echo ""
if [ ${STATUS} -eq 0 ]; then
    echo "${ICON_OK} KVM est utilisable sur cette machine."
else
    echo "${ICON_ERROR} KVM n'est pas utilisable en l'état (voir ci-dessus)."
fi

exit ${STATUS}
