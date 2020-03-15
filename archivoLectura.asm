%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    archvivo db '/home/andres/Documents/ejerciciosEnsamblador/codigo.txt',0
    msj_error db "error en el archivo",10
    len_error equ $ - msj_error
section .bss
    texto resb 35
    idarchivo resb 1

section .text
    global _start

_start:

;--------------acceso al archivo--------------

    mov eax,5 ; se convoca subrutina de lectura al SO
    mov ebx,archvivo
    mov ecx,0
            ;modos de acceso a un archivo
            ;Read-only : se establece el valor 0
            ;Write : se establece el valor de 1
            ;Red-Write : se estable el valor de 2
    mov edx,0
    int 80h

;--------------test del archvo-------------------

    test eax,eax ; verifica el valor de ecx(0) y si ZF =0 el archivo no existe
    jz error
    mov dword [idarchivo], eax

;--------------lectura del archivo---------------

    ;ebx es el estandar de entrada 
    mov eax,3
    mov ebx,[idarchivo]
    mov ecx,texto
    mov edx,35
    int 80h

    escribir texto,35

;--------------cerrar el archivo----------

    mov eax,6
    mov ebx,[idarchivo]
    mov ecx,0
    mov edx,0
    int 80h 
    
    jmp salir
error:
    escribir msj_error,len_error
salir:
    mov eax,1
    int 80h