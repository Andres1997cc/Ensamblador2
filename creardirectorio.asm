%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data
        msj db 10,"Carperta o directorio creado",10
        len_msj equ $ - msj

        msj2 db 10,"Ingrese el nombre del directorio",10
        len_msj2 equ $ - msj2
        ;path db '/home/andres/Desktop/',0
        ;len_path equ $ - path
section .bss
        nombre resb 1
section .text
        global _start
_start:
        escribir msj2,len_msj2
        leer nombre, 50

        mov ebx,nombre

        mov eax,39 ;servicio para crear un directorio ver el numero en la tabla.
        mov ebx,nombre ;define la ruta del serivicio
        mov ecx,0x1FF ;definimos el permiso 777
        int 80h
        
        escribir msj,len_msj
        
        mov eax, 1
        int 80h