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
        msj_negativo db 'el resultado es negativo', 10
        len_negativo equ $ - msj_negativo
        msj_positivo db 'el resultado es positivo', 10
        len_positivo equ $ - msj_positivo
        msj_n1 db 'ingrese el primer numero', 10
        len_n1 equ $ - msj_n1
        msj_n2 db 'ingrese el segundo numero',10
        len_n2 equ $ - msj_n2
section .bss
        n1 resb 2
        n2 resb 2
section .text
        global _start
        
_start: 
    ;numero 1
        escribir msj_n1, len_n1
        leer n1, 2

    ;numero 2
        escribir msj_n2, len_n2
        leer n2, 2 

        mov ax, [n1]
        mov bx, [n2]
        sub ax,'0'
        sub bx, '0'
        sub ax, bx ;existe movimiento de las banderas cuando existen operaciones arismeticas logicas.
        js negativo
        jmp positivo
negativo:
        escribir msj_negativo, len_negativo
        int 80h
        jmp salir
positivo:
        escribir msj_positivo, len_positivo
        int 80h
        jmp salir
salir:
        mov eax, 1
        int 80h
