# test-codex

This repository contains simple shell scripts and helpers for running tests.

## Running tests

Run `./all.sh` directly or invoke `make` to execute the default test script.

## FreeBSD Development Environment

We provide a script to launch a FreeBSD 14.3-RELEASE virtual machine inside the
codex environment. The VM uses the official cloud image and is configured with
`cloud-init` for a ready-to-use `codex` user.

### Usage

1. Run `./freebsd-setup.sh` in its own terminal to boot the VM.
2. In another terminal, run `./freebsd-run.sh` for an interactive shell or append a
   command, e.g. `./freebsd-run.sh uname -a`.
3. Transfer files as needed using `scp -P 2222 <path> codex@localhost:`.
4. Shut down the VM with `sudo shutdown -p now` inside the guest.

### Details

- Image: `FreeBSD-14.3-RELEASE-amd64-BASIC-CLOUDINIT-ufs.qcow2`
- The setup script installs required packages (`qemu-system-x86`, `qemu-utils`,
  `cloud-image-utils`, `xz-utils`) if missing.
- SSH is forwarded to host port `2222`.
- The `codex` user is in the `wheel` group with passwordless `sudo`.

This setup allows future tasks to run in a FreeBSD environment while still
working from the existing codex container.
