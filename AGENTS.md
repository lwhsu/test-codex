# AGENTS Instructions

All code in this repository must be tested on FreeBSD.

## Programmatic checks

1. Launch the FreeBSD virtual machine:
   ```sh
   ./freebsd-setup.sh
   ```
2. After the VM boots and is reachable via `ssh codex@localhost -p 2222` (password `codex`), run the repository tests inside the VM:
   ```sh
   ./all.sh
   ```
3. Ensure all changes are validated using this FreeBSD environment.

