# Agent Instructions

This repository uses a FreeBSD virtual machine for development and testing.

## Running the VM
- Start the VM in a separate terminal with `./freebsd-setup.sh`.

## Running commands and tests
- Execute commands inside the VM using `./freebsd-run.sh <command>`.
- When editing code meant for the VM, run checks through `./freebsd-run.sh` (e.g., `./freebsd-run.sh make test` or `./freebsd-run.sh sh -n script.sh`).

## Host scripts
- Host-side helper scripts like `freebsd-setup.sh` and `freebsd-run.sh` should be linted on the host with:
  - `bash -n freebsd-setup.sh`
  - `sh -n freebsd-run.sh`
