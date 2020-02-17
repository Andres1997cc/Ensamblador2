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
    msj1 db 10,"El numero es menor: "
    len11 equ $ - msj1
    msj2 db 10,"Ingrese numero 1: "
    len2 equ $ - msj2
    msj3 db 10,"Ingrese numero 2: "
	len3 equ $ - msj3
    msj4 db 10,"Ingrese numero 5: "
	len4 equ $ - msj4  
    msj5 db 10,"Ingrese numero 5: "
	len5 equ $ - msj5 
    msjp db 'pueba'
    lp equ $ - msjp

    msjcc db 'seguir',10
    lpc equ $ - msjcc
section .bss
    n1 resb 2
    n2 resb 2
    n3 resb 2
    n4 resb 2
    n5 resb 2

    auxiliar resb 2
    mayorn resb 2
    menorn resb 2
section .text
    global _start
_start:
    mov eax,4
    mov ebx,5
    mov ecx,1
    mov edx,2

primerpar:
    cmp al,bl
    jg mayor1
    ;je igual
    jmp menor1

mayor1:
    
    push eax
    push ebx
    escribir msjcc,lpc
    add al,'0'
    mov[n1],al
    
    pop eax
    pop ebx
    
    jmp segundopar

menor1:
    push eax
    push ebx
    escribir msjcc,lpc
    add bl,'0'
    mov[n2],bl

    pop ebx
    pop eax
    jmp segundopar
segundopar:
    cmp bl,cl
    jg mayor2
    ;je igual
    jmp menor2

mayor2:
    
    push ebx
    push ecx
    escribir msjcc,lpc
    add bl,'0'
    mov[n1],bl
    
    pop ebx
    pop ecx
    
    jmp tercerpar

menor2:
    push ebx
    push ecx
    escribir msjcc,lpc
    add cl,'0'
    mov[n2],cl

    pop ecx
    pop ebx
    jmp tercerpar

tercerpar:
    cmp cl,dl
    jg mayor3
    ;je igual
    jmp menor3
mayor3:
    
    push ecx
    push edx
    escribir msjcc,lpc
    add cl,'0'
    mov[n3],cl
    
    pop ecx
    pop edx
    
    jmp cuartopar

menor3:
    push ecx
    push edx
    escribir msjcc,lpc
    add cl,'0'
    mov[n3],cl

    pop edx
    pop ecx
    jmp cuartopar
cuartopar:
    mov eax,3
    cmp dl,al
    jg mayor4
    ;je igual
    jmp menor4
mayor4:
    
    push edx
    push eax
    escribir msjcc,lpc
    add dl,'0'
    mov[n4],dl
    
    pop edx
    pop eax
    
    jmp imprimir

menor4:
    push edx
    push eax
    escribir msjcc,lpc
    add al,'0'
    mov[n4],al

    pop eax
    pop edx
    jmp imprimir
imprimir:
    escribir n2,1
    escribir n3,1
    escribir n4,1
    escribir n1,1
salir:
   
    mov eax, 1
    int 80h