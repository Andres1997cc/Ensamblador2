%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data
    msj db "Ingrese Numeros: ",10
    lengmsj equ $-msj

    msj_par db " ES PAR: ",10
    lengmsj_par equ $-msj_par

    msj_impar db " ES IMPAR: ",10
    lengmsj_impar equ $-msj_impar

    espacio db 10
    lengespacio equ $-espacio
section .bss
    numero resb 2
section .text
    global _start:
_start:

    mov ecx,5
IngresarNumeros:
    push ecx
    escribir msj,lengmsj
    leer numero,2
    pop ecx

    mov eax,[numero]
    sub eax,'0'
    push eax

    loop IngresarNumeros
    mov ecx,5

bucle:
    pop eax
    push ecx
    push eax
    call imprimirNum
    pop ebx

    mov al,bl
    mov bl,2
    div bl

    call comparar
    pop ecx
    loop bucle
    jmp salir


comparar:
    cmp ah,0
    je m_par
    jmp m_impar
imprimirNum:
    add eax,'0'
    mov [numero],eax

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 1
    int 80h
    ret
m_par:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_par
    mov edx, lengmsj_par
    int 80h
    ret
m_impar:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_impar
    mov edx, lengmsj_impar
    int 80h
    ret
salir: 
    mov eax,1
    int 80h
