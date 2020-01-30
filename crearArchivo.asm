%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro
%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
segment .data
	msj db "Escribe la ruta:",10
	len_msj equ $ - msj
	;direction db "/home/andres/Desktop/hola.txt",0
     msj2 db 10,"Archivo creado",10
    len_msj2 equ $ - msj2
	msj3 db "Escribe el nombre del archivo archivo :",10
	len_msj3 equ $ - msj3
segment .bss
	nombre resb 30
	ruta resb 30
segment .text
    global _start

	

_start:

	escribir msj,len_msj
    leer ruta, 50
	push ebx
    mov ebx,ruta
;----------ruta
	mov eax,39 ;servicio para crear un directorio ver el numero en la tabla.
    mov ebx,ruta ;define la ruta del serivicio
    mov ecx,0x1FF ;definimos el permiso 777
    int 80h
;----------archivo
	escribir msj3,len_msj3
    leer nombre, 50
	mov eax, 8		
	mov ebx, nombre		
	mov edx, 0x1FF		
	int 80h
	pop ebx
	mov dword[ruta],ebx

    escribir msj2,len_msj2


salir:
	mov eax, 1
	xor ebx, ebx
	int 0x80
