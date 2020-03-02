%macro imprimir 2
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
    msj db "Ingrese 6 numeros",10
    len equ $-msj

    msj1 db "El numero mayor es: ",10
    len1 equ $-msj1


    m_mayor db "El numero mayor es: "
    len_mayor equ $-m_mayor

    m_menor db "El numero menor es"
    len_menor equ $-m_menor
    
    arreglo db 0,0,0,0,0,0
    len_arreglo equ $-arreglo

section .bss
    numero resb 2
    mayor resb 2
    menor resb 2

section .text
    global _start

_start:
    imprimir msj, len

    ; asignacion del arreglo en las posiciones efectivas
    mov esi, arreglo
    mov edi, 0

lectura:
    leer numero, 2

    ; asignacion de un numero al arreglo
    mov al, [numero]
    sub al, '0'
    mov [esi], al

    add esi, 1
    add edi, 1

    cmp edi, len_arreglo
    jb lectura

    sub esi, len_arreglo
    mov edi, 0

    mov al, 0
    mov [mayor], al

    mov al, [esi]
    mov [menor], al

    

resultado:
    mov al, [esi]

    mov bl, [mayor]
    mov cl, [menor]

    cmp al, bl 
    jg verifica_mayor

    cmp cl, al
    jg verifica_menor
    
    add al, '0'
    mov [numero], al
    ;imprimir numero, 2 

    add esi, 1
    add edi, 1

    cmp edi, len_arreglo
    jb resultado

    mov al, [mayor]
    add al, '0'

    mov [mayor], al

    mov al, [menor]
    add al, '0'

    mov [menor], al    

    imprimir m_mayor, len_mayor
    imprimir mayor,2

    imprimir m_menor, len_menor
    imprimir menor,2


    jmp salida

verifica_mayor:
    mov [mayor], al
    jmp resultado

verifica_menor:
    mov [menor], al
    jmp resultado

salida:
    mov eax, 1
    int 80h