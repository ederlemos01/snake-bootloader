
bits 16          
org 0x7c00       

xor ax, ax

mov ds, ax
mov ss, ax
mov sp, 0x7c00

mov ax, 0xA000
mov es, ax

mov ax, 0x0013
int 0x10

mov word [0x1000], 32162
mov word [0x1002], 32167
mov word [0x1004], 32172


call makeApple
desenhar_paredes:

    mov cx, 637
        .tetos:
        
        add cx, 5

        call prep_Bloco

        
        cmp cx, 957
        jne .tetos

        .direita:
        
        add cx, 1600
        
        call prep_Bloco

        cmp cx, 63357
        jne .direita

       .piso:
        
        sub cx, 5
        
        call prep_Bloco
        

        cmp  cx, 63042
        jne .piso

        .esquerda:
       
        sub cx, 1600
        
        call prep_Bloco


        cmp cx, 642
        jne .esquerda
    
    xor cx, cx


gameLoop: 

teclado: 
    mov ah, 0x01 
    int 0x16
    jz moverCobra

    .limpaBuffer:
        mov ah, 0x00
        int 0x16
        mov [tecla], ah

        mov ah, 0x01
        int 0x16
        jnz .limpaBuffer

moverCobra:
    
    
    cmp byte [tecla], 0x11 ; w 17
    jne baixo
    sub byte [cursor_y], 5
        
    baixo:
        cmp byte [tecla], 0x1F ; s 31
        jne esquerda
        add byte [cursor_y], 5
        
    esquerda:
        cmp byte [tecla], 0x1E ; a 30
        jne direita
        sub word [cursor_x], 5
        
    direita:
        cmp byte [tecla], 0x20 ; d 32
        jne AttCords
        add word [cursor_x], 5

AttCords:
    
    mov cx, [tam]
    mov si, cx
    mov ax, [0x1000 + si]
    mov [blackTail], ax

    .cordLoop:
    cmp cx, 0
    je .fim

    mov si, cx
    mov ax, [0x1000 + si - 2]
    mov [0x1000+ si], ax
    sub cx, 2
    
    jmp .cordLoop
    
    .fim:
    
    call pixel_adress
    mov word [0x1000], ax
    

    
    
    
checkColision:


;colisao teto
    cmp byte [cursor_y], 7
    jb endGame

    cmp byte  [cursor_y], 193
    ja endGame

;colisao parede
    cmp word [cursor_x], 7
    jb endGame

    cmp word [cursor_x], 312
    ja endGame
    
;colisao com corpo
    mov si, 2
    mov ax, [0x1000] 
    
    .LoopCorpin:
    
    cmp ax, [0x1000 + si]
    je endGame
    
    add si, 2
    
    cmp si, [tam]
    jne .LoopCorpin

;colisao maca
    call pixel_adress
    push ax
    call apple_adress
    pop bx
    cmp ax, bx
    jne Draw
    call makeApple

Draw:
   
    .DrawApple:

    call apple_adress
    
    mov di, ax
    mov al, 0x04
    call bloco
 
 
 
    
    xor cx, cx
    mov al, 0x20
    .DrawSnake:
    
    mov si, cx
    mov di, [0x1000 + si]
    push cx
    call bloco
    pop cx
    add cx, 2
    inc al
    cmp cx, [tam]
    jbe .DrawSnake
    

    mov al, 0
    mov di, [blackTail]
    call bloco

    mov di, [0x1000]        
    sub di, 642              

    mov byte [es:di], 0       
    mov byte [es:di + 4], 0   
    mov byte [es:di + 1280], 0
    mov byte [es:di + 1284], 0



delay:
    mov ah, 0x86
    mov cx, 0x0001
    mov dx, 0x86A0
    int 0x15
    

jmp gameLoop



endGame:

 jmp $





tam:
    dw 2
tecla:
    db 0x20
cursor_x:
    dw 157

cursor_y:
    db 97

blackTail equ 997
 

maca_x:
    dw 0

maca_y:
    dw 0
 
makeApple:
    
    mov ah, 0x00
    int 0x1A
    
    mov bx, 33
    mov ax, dx
    xor dx, dx
    div bx
    
    mov ax,dx
    mov bx, 5
    mul bx

    add ax, 17
    mov [maca_y], ax

    mov ah, 0x00
    int 0x1A
    
    add dx, 0x92D3

    mov bx, 56
    mov ax, dx
    xor dx, dx
    div bx

    mov ax, dx
    mov bx, 5
    mul bx

    add ax, 17
    mov [maca_x], ax

    add word [tam], 2
    ret
    
    
apple_adress:
    mov ax, [maca_y]
    mov bx, 320
    mul bx
    add ax , [maca_x]
    ret



pixel_adress:
    xor ax, ax
    mov al, [cursor_y]
    mov bx, 320
    mul bx
    add ax , [cursor_x]
    ret
bloco:
    xor cx, cx
    xor ah,ah
    sub di,642
    
    linha:
    inc ah

    coluna:
    
    mov byte [es:di], al
    inc di
    inc cx 
    cmp cx, 5
    jne coluna
    xor cx, cx
    add di, 315
    cmp ah, 5
    jne linha
    sub di, 643
    xor cx, cx
    ret

prep_Bloco:
    mov di, cx 
    mov al, 0x05
    push cx
    call bloco
    pop cx
    ret
times 510-($-$$) db 0 

dw 0xAA55