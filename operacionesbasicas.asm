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
	msj3 db 10,"Operaciones  de 8 bits "	
	len3 equ $ - msj3 

	msj1 db 10,"Ingrese el primer número: "
	len1 equ $ - msj1 

	msj2 db 10,"Ingrese el segundo número: "
	len2 equ $ - msj2

	mensaje db "El resutlado es: "
	len equ $-mensaje

	msj4 db 10,"El cociente es:  "
	len4 equ $ - msj4

    msj5 db 10,"El residuo es:  "
	len5 equ $ - msj5

    new_line db 10,""
    msj6 db 10,"SUMA:  "
	len6 equ $ - msj6

    msj7 db 10,"RESTA:  "
	len7 equ $ - msj7

    msj8 db 10,"MULTIPLICACION:  "
	len8 equ $ - msj8

section .bss
	n1 resb 1
	n2 resb 1
    multiplicacion resb 1
    resta resb 1
    suma resb 1
	residuo resb 1
    cociente resb 1
section .text
	global _start
_start:
;Ingrese el numero 1

	escribir msj1, len1
	leer n1, 2

;ingrese el numero 2
	escribir msj2, len2
	leer n2, 2

;Proceso de suma
    mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	add al,bl
	add al, '0'
	mov [suma], al
;Proceso de resta
    mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	sub al,bl
	add al, '0'
	mov [resta], al
;Proceso de division:
    escribir msj3, len3
	mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [cociente], al
	add ah, '0'
    mov [residuo], ah
;Proceso de multiplicacion
	mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [multiplicacion], al

;Imprime suma
;-----------------------suma-----------------------
    escribir msj6, len6
    escribir suma, 1
;-----------------------resta----------------------
    escribir msj7, len7
    escribir resta, 1
; ----------------------cociente--------------------
    escribir msj4, len4
    escribir cociente, 1
;-----------------------residuo---------------------
    escribir msj5, len5
    escribir residuo, 1
;-----------------------multiplicacion--------------	
    escribir msj8, len8
    escribir multiplicacion, 1
;-----------------------final-----------------------
    escribir new_line, 1
        mov eax, 1
        int 80h
