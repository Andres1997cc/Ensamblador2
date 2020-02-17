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
        msj2 db 'ingrese palabra :  ',10
        len2 equ $ - msj2

        msj db ':saludos',10
        len equ $ - msj
        new_line db 10,''

section .bss
        nota resb 2
        numero resb 1
section .text
        global _start
_start:
        escribir msj2,len2
        leer nota,5
        mov eax,[nota]
        mov ecx,20
ciclo:
        
        push ecx
        
        

        add ecx, '0'
        mov [numero],ecx
        mov eax, 4
        mov ebx, 1
        mov ecx, numero
        mov edx, 1
        int 80h

        mov eax,4
        mov ebx,1
        mov ecx,new_line
        mov edx,1
        int 80h

        mov eax,4
        mov ebx,1
        mov ecx,nota
        mov edx,2
        int 80h
        pop ecx

        loop ciclo ;cmp ecx,0

        mov eax,1
        int 80h
