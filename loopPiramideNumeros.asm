;Imprime un mensaje 20 veces con el uso de loop
%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data
    msj db 10,"Numeros:  "
    lengmsj equ $-msj

    espacio db 10
    lengespacio equ $-espacio
section .bss
    nume resb 1
    nume2 resb 1

section .text
    global _start:
_start:
    mov ecx,9 ;siempre tiene q ser numerico
    mov ebx,1

l1:
    mov al, '1'
    mov [nume], al
    push ecx
	push ebx 
	call imprimir_enter 
	pop ecx 
    push ecx

l2:
    push ecx
    call imprimir_numero
    mov al, [nume]
    inc al
    mov [nume], al
    pop ecx
	loop l2		
			
	pop ebx 
	pop ecx 
	inc ebx
	loop l1 
	jmp salir


imprimir_enter:
	escribir espacio, lengespacio 
	ret 

imprimir_numero:
	escribir nume, 1 
	ret 
    

salir:
    mov eax,1
    int 80h