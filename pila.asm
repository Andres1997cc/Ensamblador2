section .data
        msj db '*',10
section .text
        global _start
_start:
        mov ecx, 9
        jmp principal
        

imprimir:
        dec ecx;
        push ecx
        mov eax, 4
        mov ebx, 1
        mov ecx, msj
        mov edx, 2
        int 80h
        pop ecx
        jmp principal
principal:
        cmp ecx,0
        jz salir
        jmp imprimir
salir:
        mov eax,1
        int 80h