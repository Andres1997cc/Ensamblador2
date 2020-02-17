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
    msj db 10,"El numero mayor es : "
    len1 equ $ - msj
    msj2 db 10,"El numero menor es : "
    len2 equ $ - msj2
    msj3 db 10,"Los numeros son iguales: "
    len3 equ $ - msj3
    msj4 db 10,"Ingrese numero 1: "
	len4 equ $ - msj4 
    msj5 db 10,"Ingrese el siguiente numero : "
	len5 equ $ - msj5 
    msjp db 'pueba'
    lp equ $ - msjp
section .bss
    n1 resb 2
    n2 resb 2
    auxiliar resb 2
    mayorn resb 2
    menorn resb 2
    contador resb 2
section .text
    global _start
_start:

   ;Ingrese el numero 1

	escribir msj4, len4
	leer n1, 2

ingresoaux:
    escribir msj5, len5
	leer n2, 2

    mov ecx,0
    mov al,[n1]
    mov bl,[n2]
    cmp al,bl
    jg mayor
    ;je igual
    jmp menor
mayor:
    push edx ;aux para el mayor
    push eax ; primero valor
    push ebx ;segundo valor

    mov [n1],bl
    add bl,'0'
    escribir n1,2
    escribir msj,len1
    
    add al,'0'
    mov [mayorn],al
    
    add cl,'0'
    sub cl,''
    mov [contador],cl
    escribir contador,1
    
    

    ;se intercambian los valores para ir ordenando y ver el menor
    pop eax ; al valor de ax, le damos el valor de bx
    pop ebx ;el valor de bc, le cambiamos por el de ax
    
    

    inc ecx; incrementamos contador
    cmp ecx,5 ;contador para los valores
    
    jmp ingresoaux
    je imprimir
    
menor:
    push eax
    push ebx

    mov [n2],al
    add al,'0'
    escribir n2,2
    ;mov [auxiliar],bl
    
    mov dl,al
    add dl,'0'
    mov [auxiliar],al

    ;se recuperan los mismos datos ya que el segundo numero comparado es mayor que el primero
    pop ebx
    pop eax
    inc ecx;contador
    cmp ecx,5
    jne salir
    jmp ingresoaux
igual:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj3
    mov edx, len3
    int 80h
imprimir:
    
    cmp ecx,5
    jmp ingresoaux
    je salir
salir:
    pop edx
    escribir msjp,lp
    escribir auxiliar,2

    escribir msj,len1
    escribir mayorn,2
    escribir msj2,len2
    escribir n2,2
    mov eax, 1
    int 80h