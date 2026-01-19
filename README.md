# Rainbow-Snake-Bootloader Assembly x86 (Real Mode)

<img width="1916" height="986" alt="Screenshot from 2026-01-19 00-10-15" src="https://github.com/user-attachments/assets/0f636c39-d51a-4ef9-9c93-796344d1282d" />

---

## What is this?

Este projeto é um **Bootloader Game**. Ele foi projetado para ocupar exatamente os primeiros 512 bytes de um disco (o Setor de Boot). Ao ligar o computador, o processador carrega este código antes de qualquer sistema operacional.

###  Especificações Técnicas:
- **Linguagem:** Assembly x86 (Real Mode).
- **Tamanho:** 512 bytes (limite físico do MBR).
- **Vídeo:** Modo VGA 13h (320x200, 256 cores).
- **Efeito:** Arco-íris dinâmico que utiliza a paleta de cores da BIOS.
- **Bare Metal:** Roda direto no hardware, sem Kernel ou drivers externos.

---

### Controles (Keyboard):
- **W**: Cima / Up
- **A**: Esquerda / Left
- **S**: Baixo / Down
- **D**: Direita / Right

---

## How to Build and Run

Você precisará do compilador **NASM** e do emulador **QEMU**.

### 1. Compilar (Assemble):
```bash
nasm -f bin main.asm -o main.bin

qemu-system-x86_64 main.bin 
