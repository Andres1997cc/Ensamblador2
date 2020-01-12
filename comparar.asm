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
    msj db 10,"El numero es mayor: "
    len1 equ $ - msj
    msj2 db 10,"El numero es menor: "
    len2 equ $ - msj2
    msj3 db 10,"Los numeros son iguales: "
    len3 equ $ - msj3
    msj4 db 10,"Ingrese numero 1: "
	len4 equ $ - msj4 
    msj5 db 10,"Ingrese numero 2: "
	len5 equ $ - msj5 
section .bss
    n1 resb 2
    n2 resb 2
section .text
    global _start
_start:

    ;Ingrese el numero 1

	escribir msj4, len4
	leer n1, 2

;ingrese el numero 2
	escribir msj5, len5
	leer n2, 2

    mov al,[n1]
    mov bl,[n2]
    cmp al,bl
    jg mayor
    je igual
    jmp menor
mayor:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len1
    int 80h
    jmp salir
menor:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len2
    int 80h
    jmp salir
igual:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj3
    mov edx, len3
    int 80h
    
salir:
    mov eax, 1
    int 80h