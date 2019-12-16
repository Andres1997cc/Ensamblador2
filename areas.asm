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
        msj1 db 10,"Ingrese un lado: "
	    len1 equ $ - msj1 
        msj2 db 10,"Ingrese el valor de pi: "
	    len2 equ $ - msj2
        msj3 db 10,"Ingrese del radio: "
	    len3 equ $ - msj3
        msj4 db 10,"Ingrese la base: "
	    len4 equ $ - msj4 
        msj5 db 10,"Ingrese la altura: "
	    len5 equ $ - msj5 
        msj6 db 10,"El area es: "
	    len6 equ $ - msj6
        msj7 db 10,"1.CUUADRADO: "
	    len7 equ $ - msj7
        msj8 db 10,"2.CIRCULO: "
	    len8 equ $ - msj8
        msj9 db 10,"3.RECTANGULO: "
	    len9 equ $ - msj9
        mensajeP db 10,"INGRESE LA OPCION: "
	    lenP equ $-mensajeP
        new_line db 10,""
section .bss
        op resb 2
        lado resb 2
        pi resb 2
        radio resb 2
        aux resb 2
        base resb 2
        altura resb 2
        resultado resb 2
section .text
	global _start
_start:
        ; menu de opciones
        escribir msj7, len7
        escribir msj8, len8
        escribir msj9,len9
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
        je cuadrado
        cmp ah, 2
        je circulo
        cmp ah, 3
        je rectangulo

;Proceso de area del cuadrado
cuadrado:
;Ingreso del lado 

	escribir msj1, len1
	leer lado, 2

	mov al, [lado]
    mov bl, [lado]	
	sub ax, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [resultado], al
	;-----------------------cuadrado--------------	
    escribir msj6, len6
    escribir resultado, 1
;salir
	jmp salir
circulo:

;ingreso del radio
    escribir msj3, len3
	leer radio, 2

    mov al, [radio]
    mov bl, [radio]	
	sub ax, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [aux], al
    escribir aux,2

    mov al, '3,14'
    mov bl, [aux]	
	sub ax, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [resultado], al


;----------------------

	
    escribir msj6, len6


    escribir resultado, 1
;salir
	jmp salir
rectangulo:
;Ingreso del base 

	escribir msj4, len4
	leer base, 2
;Ingreso de la altura

	escribir msj5, len5
	leer altura, 2

	mov al, [base]
    mov bl, [altura]	
	sub ax, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [resultado], al
	;-----------------------rectangulo--------------	
    escribir msj6, len6
    escribir resultado, 1
;salir
	jmp salir
;-----------------------final-----------------------

salir:
    escribir new_line, 1
        mov eax, 1
        int 80h
