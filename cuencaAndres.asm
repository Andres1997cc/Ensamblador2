%macro escribir 2
        mov eax,4
        mov ebx,1
        mov ecx,%1
        mov edx,%2
        int 80h
%endmacro

%macro leer 2
        mov eax,3
        mov ebx,0
        mov ecx,%1
        mov edx,%2
        int 80h
%endmacro
%macro presentar 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro
section .data
    msj db 10,"ingrese un numero del 1 al 9",10
    len_msj equ $ - msj

    msj_2 db 10,"ingrese el segundo numero",10
    len_msj2 equ $ - msj_2
    

    msj_3 db 10,"es primo",10
    len_msj3 equ $ - msj_3

    msj_4 db 10," no es primo",10
    len_msj4 equ $ - msj_4
    
    msj_5 db 10," ingrese el mismo numero",10
    len_msj5 equ $ - msj_5

section .bss
        n1 resb 2
        n2 resb 2
        n3 resb 2
        n4 resb 2
section .text
        global _start
_start:
        mov cx,0
        
        escribir msj, len_msj
        leer n1,2
        
        mov al, [n1]
        mov bl, [n1]
        ;mov cx,0
        sub al, '0'
	    sub bl, '0'
        div bl
	    add al, '0'
	    cmp al,1 ; verificar si el valor es divisible para 1
        je segundo
segundo:
        escribir msj_5, len_msj5
        leer n2,2
        mov al, [n1]
        mov bl, '2'	
	    sub ax, '0'
	    sub bl, '0'
	    div bl
	    add al, '0'
	    mov [n3], al
	    add ah, '0'
        mov [n4], ah

        escribir n3, 1

       
        cmp [n3],al
        jne noPrimo
        je primo
primo:
    escribir msj_3,len_msj3
    jmp salir
noPrimo:
    escribir msj_4,len_msj4
    jmp salir

salir:
    mov eax,1
    int 80h