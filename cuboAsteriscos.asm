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
        msj db '*'
        len equ $ - msj
        msj2 db 'ingrese las dimensiones',10
        len2 equ $ - msj2
        msj_enter db 10,''
section .bss
        x resb 2
        y resb 2
section .text
        global _start
_start:
        ;escribir msj2,len2
        ;leer x,2
        mov eax,5
        mov ebx,5
        jmp ciclo
        ;jmp imprimirfila

ciclo:
        dec ebx
        push ebx
        jmp imprimirfila
imprimirfila:
        dec eax
        push eax
        escribir msj,len
        pop eax

        cmp eax,0
        jz imprimircoluna
        jmp imprimirfila

imprimircoluna:
        escribir msj_enter,1
        pop ebx
        mov eax,5

        cmp ebx,0
        jz salir
        jmp imprimirfila
        
salir:
        mov eax,1
        int 80h