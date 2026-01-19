# Rainbow-Snake-Bootloader Assembly x86 (Real Mode)

<img width="1916" height="986" alt="Screenshot from 2026-01-19 00-10-15" src="https://github.com/user-attachments/assets/0f636c39-d51a-4ef9-9c93-796344d1282d" />

---

This project is a **Bootloader Game**. It is designed to occupy exactly the first 512 bytes of a disk (the Boot Sector). When the computer is turned on, the processor loads this code before any operating system.

---

## How to Build and Run

Download **NASM** and **QEMU**.

###  run:
```bash
nasm -f bin main.asm -o main.bin

qemu-system-x86_64 main.bin 
