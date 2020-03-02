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
    msj db 'IDENTIFICACION DE CARACTERES',10
    len_msj equ $-msj

    msj_ingreso db 'Ingrese un valor: '
    len_msj_ingreso equ $-msj_ingreso

    msj_res_con db ' Es una consonante',10
    len_msj_res_con equ $-msj_res_con

    msj_res_voc db ' Es una vocal',10
    len_msj_res_voc equ $-msj_res_voc

    msj_res_num db 'Es un numero',10
    len_msj_res_num equ $-msj_res_num

    msj_res_esp db 'Es un caracter especial',10
    len_msj_res_esp equ $-msj_res_esp

    salto db '',10

section .bss
    valor resb 2

section .text
    global _start

_start:
    imprimir msj_ingreso, len_msj_ingreso
    leer valor, 2

    mov al, [valor]
    cmp al, 47
    jg comprobar_numero

    jmp Caracter

comprobar_numero:
    cmp al, 58
    jng Numero

    cmp al, 64
    jg comprobar_mayusculas

    jmp Caracter

comprobar_mayusculas:
    cmp al, 90
    jng comprobar_vocal_mayuscula

    cmp al, 96
    jg comprobar_minusculas

    jmp Caracter

comprobar_minusculas:
    cmp al, 122
    jng comprobar_vocal_minuscula

    jmp Caracter

comprobar_vocal_mayuscula:
    cmp al, 65
    je Vocal

    cmp al, 69
    je Vocal

    cmp al, 73
    je Vocal

    cmp al, 79
    je Vocal

    cmp al, 85
    je Vocal

    jmp Consonante

comprobar_vocal_minuscula:
    cmp al, 97
    je Vocal

    cmp al, 101
    je Vocal

    cmp al, 105
    je Vocal

    cmp al, 111
    je Vocal

    cmp al, 117
    je Vocal

    jmp Consonante

Numero:
    imprimir msj_res_num, len_msj_res_num
    jmp salir

Caracter:
    imprimir msj_res_esp, len_msj_res_esp
   jmp salir

Consonante:
    imprimir msj_res_con, len_msj_res_con
    jmp salir

Vocal:
    imprimir msj_res_voc, len_msj_res_voc
    jmp salir


salir:
    mov eax, 1
    int 80h
