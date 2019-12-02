section .bss
        nombre resb 5
        len3 equ $-nombre
section .data
        mensaje db "Ingrese su nombre",10
        tamano equ $-mensaje
        mensaje1 db "Su nombre ingresado es:",10
        tamano1 equ $-mensaje
section .text
        global _start
_start:
        mov eax,4
        mov ebx,1
        mov ecx,mensaje
        mov edx,tamano
        int 80H
        mov eax,3
        mov ebx,2
        mov ecx,nombre
        mov edx,5
        int 80Hn
        mov eax,4
        mov ebx,1
        mov ecx,mensaje1
        mov edx,tamano1
        int 80H

        mov eax,1
        int 80h