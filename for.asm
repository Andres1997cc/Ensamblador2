%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
        msj db 10,'Item:'
        len equ $ - msj
section .bss
        ite resb 1
section .text
        global _start:
_start:
        mov cx, 10
ciclo: 
        cmp cx, 0
        jz salir
;pila: guardar un valor y despues ocuparlo  
        dec cx
        jnz imprimir_mensaje
        
imprimir_mensaje:
        mov eax, 4
        mov ebx, 1
        push cx     ;base pointer, stack pointer
        add cx, '0'
        mov [ite], cx
        mov ecx, msj
        mov edx, len
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, ite
        mov edx, 1
        int 80h
        
        pop cx
        jmp ciclo
salir:
        mov eax, 1
        int 80h