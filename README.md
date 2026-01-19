# Snake-Bootloader


<img width="1918" height="1043" alt="Screenshot from 2026-01-19 00-38-00" src="https://github.com/user-attachments/assets/12713a43-a50e-4cb5-8c8c-ad69cc1febc1" />

---

A Snake game developed in x86 Assembly, designed to run directly in the boot sector of a Legacy BIOS in Real Mode
---

## How to Build and Run

### Requirements: **NASM** and **QEMU**

###  run:
```bash
nasm -f bin main.asm -o main.bin

qemu-system-x86_64 main.bin 
