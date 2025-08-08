# FreeBSD Development Environment

This repository provides a script to launch a FreeBSD 14.3-RELEASE virtual machine
inside the codex environment. The VM uses the official cloud image and is
configured with `cloud-init` for a ready-to-use `codex` user.

## Usage

1. Run `./freebsd-setup.sh`.
2. Once booted, connect via `ssh codex@localhost -p 2222` (password `codex`).
3. Shutdown the VM with `sudo shutdown -p now` inside the guest.

## Details

- Image: `FreeBSD-14.3-RELEASE-amd64-BASIC-CLOUDINIT-ufs.qcow2`
- The script installs required packages (`qemu-system-x86`, `qemu-utils`,
  `cloud-image-utils`, `xz-utils`) if missing.
- SSH is forwarded to host port `2222`.
- The `codex` user is in the `wheel` group with passwordless `sudo`.

This setup allows future tasks to run in a FreeBSD environment while still
working from the existing codex container.
