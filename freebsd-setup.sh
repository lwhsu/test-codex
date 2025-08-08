#!/usr/bin/env bash
# Setup and launch a FreeBSD 14.3-RELEASE virtual machine using QEMU.
# The VM exposes SSH on localhost:2222 with user 'codex'/'codex'.

set -euo pipefail

FREEBSD_VERSION="14.3-RELEASE"
IMAGE_NAME="FreeBSD-${FREEBSD_VERSION}-amd64-BASIC-CLOUDINIT-ufs.qcow2"
IMAGE_URL="https://download.freebsd.org/releases/VM-IMAGES/${FREEBSD_VERSION}/amd64/Latest/${IMAGE_NAME}.xz"

# Ensure required packages are present
if ! command -v qemu-system-x86_64 >/dev/null 2>&1; then
  echo "Installing qemu-system-x86, qemu-utils and cloud-image-utils"
  apt-get update
  apt-get install -y qemu-system-x86 qemu-utils cloud-image-utils xz-utils
fi

# Download and decompress the FreeBSD image if needed
if [ ! -f "${IMAGE_NAME}" ]; then
  echo "Downloading FreeBSD image ${IMAGE_NAME}"
  curl -L -o "${IMAGE_NAME}.xz" "${IMAGE_URL}"
  unxz "${IMAGE_NAME}.xz"
fi

# Create cloud-init user-data image
if [ ! -f user-data.img ]; then
  cat > user-data <<'CLOUD'
#cloud-config
password: codex
chpasswd: { expire: False }
ssh_pwauth: True
users:
  - name: codex
    gecos: Codex User
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/sh
    groups: wheel
CLOUD
  cloud-localds user-data.img user-data
fi

# Launch the VM
qemu-system-x86_64 \
  -m 2048 \
  -smp 2 \
  -drive if=virtio,file="${IMAGE_NAME}",format=qcow2 \
  -drive if=virtio,file=user-data.img,format=raw \
  -nic user,model=virtio-net-pci,hostfwd=tcp::2222-:22 \
  -nographic
