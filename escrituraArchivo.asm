%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    archivo db '/home/andres/Documents/ejerciciosEnsamblador/aba.txt',0
    msj_error db "error en el archivo",10
    len_error equ $ - msj_error
    msj_1 db " ingrese el texto",10
    len_msj1 equ $ -  msj_1
section .bss
    texto resb 40
    idarchivo resb 1
section .text
    global _start

_start:
    escribir msj_1,len_msj1
    mov eax,3
    mov ebx,2
    mov ecx,texto
    mov edx,35
    int 80h

    mov eax,8 ;subrutina
    mov ebx,archivo ; ruta
    mov ecx,1 ;acceso
    mov edx,0x1FF
    int 80h

    test eax,eax
    jz error
    mov dword [idarchivo], eax
;-----------vamos a realizar los movimientos  del lo escrito al archivo-------
    ;escritura hacia el archivo
    
    mov eax,4
    mov ebx,[idarchivo]
    mov ecx,texto
    mov edx,35
    int 80h
    jmp salir
error:
    escribir msj_error,len_error
salir:
    mov eax,1
    int 80h