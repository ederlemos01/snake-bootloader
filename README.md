# Snake-Bootloader Assembly x86 (Real Mode)


<img width="1918" height="1043" alt="Screenshot from 2026-01-19 00-38-00" src="https://github.com/user-attachments/assets/12713a43-a50e-4cb5-8c8c-ad69cc1febc1" />

---

This project is a **Bootloader Game**. It is designed to occupy exactly the first 512 bytes of a disk (the Boot Sector). When the computer is turned on, the processor loads this code before any operating system.

---

## How to Build and Run

### Requirements: **NASM** and **QEMU**.

###  run:
```bash
nasm -f bin main.asm -o main.bin

qemu-system-x86_64 main.bin 
