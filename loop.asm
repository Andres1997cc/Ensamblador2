section .data
        msj2 db 'mensaje :  ',10
        len2 equ $ - msj2

        msj db 'saludos',10
        len equ $ - msj

section .bss
        numero resb 1
section .text
        global _start
_start:
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
        mov ecx,msj2
        mov edx,len2
        int 80h

        mov eax,4
        mov ebx,1
        mov ecx,msj
        mov edx,len
        int 80h
        pop ecx

        loop ciclo ;cmp ecx,0

        mov eax,1
        int 80h
