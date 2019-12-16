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

	

	mensajeP db "INGRESE LA OPCION: "
	lenP equ $-mensajeP
	mensajeSuma db "1. SUMA: "
	lenS equ $-mensajeSuma
	mensajeResta db 10,"2. RESTA: "
	lenR equ $-mensajeResta
	mensajeMul db 10,"3. MULTIPLICACION: "
	lenM equ $-mensajeMul
	mensajeDiv db 10,"4. DIVISION ",10
	lenD equ $-mensajeDiv

	mensaje db "El resultado es: "
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
	op resb 2
	n1 resb 2
	n2 resb 2
    respuesta resb 2
	residuo resb 2
section .text
	global _start
_start:
	
;Ingrese el numero 1

	escribir msj1, len1
	leer n1, 2

;ingrese el numero 2
	escribir msj2, len2
	leer n2, 2
	

	; menu de opciones
	escribir mensajeSuma,lenS
	escribir mensajeResta, lenR
	escribir mensajeMul, lenM
	escribir mensajeDiv, lenD
	; ingresar opcion
   escribir mensajeP, lenP
   mov ebx,0
   mov ecx,op
   mov edx,2
   mov eax,3
   int 80h

	mov ah,[op]
	sub ah, '0'


	cmp ah, 1
   je sumar
   cmp ah, 2
   je restar
   cmp ah, 3
   je multiplicar
   cmp ah, 4
   je dividir

	
;Proceso de suma
sumar:
    mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	add al,bl
	add al, '0'
	mov [respuesta], al
	;-----------------------suma-----------------------
    escribir msj6, len6
    escribir respuesta, 1
	;salir
	jmp salir

;Proceso de resta
restar:
    mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	sub al,bl
	add al, '0'
	mov [respuesta], al
	;-----------------------resta----------------------
    escribir msj7, len7
    escribir respuesta, 1
	;salir
	jmp salir
;Proceso de division:
dividir:
    escribir msj3, len3
	mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [respuesta], al
	add ah, '0'
    mov [residuo], ah
	; ----------------------cociente--------------------
    escribir msj4, len4
    escribir respuesta, 1
	
;-----------------------residuo---------------------
    escribir msj5, len5
    escribir residuo, 1
	;salir
	jmp salir
;Proceso de multiplicacion
multiplicar:
	mov al, [n1]
    mov bl, [n2]	
	sub ax, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [respuesta], al
	;-----------------------multiplicacion--------------	
    escribir msj8, len8
    escribir respuesta, 1
;salir
	jmp salir
;-----------------------final-----------------------

salir:
    escribir new_line, 1
        mov eax, 1
        int 80h
