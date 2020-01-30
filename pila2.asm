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
        msj db 'ingrese un numero 1-9',10
        len equ $ - msj
        msj_enter db 10,''
section .bss
        numero resb 2
section .text
        global _start
_start:
        ;------MENSAJE : ingresar el numero -----
        escribir msj,len
        ;-----Lee numero------
        leer numero,1
        ;--- asigna el valor a una variable----
        
        jmp imprimir
        

imprimir:
        mov eax, [numero]
        push eax

        escribir numero,1
        escribir msj_enter,1

        pop eax
        ;--- transforma de cadena a numero---
        sub eax,'0'
        dec eax
        ;---rescatar el valor de eax que esta como numero
        mov ecx,eax
        ;--- transformar vuelta a cadena para poder ponerlo en la variable numero----
        add eax,'0'
        mov[numero], eax

        cmp ecx,0
        jz salir
        jmp imprimir

salir:
        mov eax,1
        int 80h