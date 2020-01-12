%macro escribir 2
        mov eax,4
        mov ebx,2
        mov ecx,%1
        mov edx,%2
        int 80h
%endmacro

%macro leer 2
        mov eax,3
        mov ebx,1
        mov ecx,%1
        mov edx,%2
        int 80h
%endmacro
 section .data
    msj db 10,"ingrese el primer numero",10
    len_msj equ $ - msj
    msj_2 db 10,"ingrese el segundo numero",10
    len_msj2 equ $ - msj_2
    msj_3 db 10,"va a resultar positivo",10
    len_msj3 equ $ - msj_3
    msj_4 db 10,"va a resultar negativo",10
    len_msj4 equ $ - msj_4


section .bss
        n1 resb 2
        n2 resb 2
section .text
        global _start
_start:
        escribir msj, len_msj
        leer n1,2

        escribir msj_2,len_msj2
        leer n2,2

        mov al,[n1]
        mov bl,[n2]
        cmp al,bl
        jg positivo
        jl negativo
positivo:
    escribir msj_3,len_msj3
    jmp salir
negativo:
    escribir msj_4,len_msj4
salir:
    mov eax,1
    int 80h