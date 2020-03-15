%macro escribe 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

segment .data

    path db "/home/andres/Documents/carpeta",0
    len_path equ $ - path

	archivo db "/home/andres/Documents/carpeta/archivo1.txt",0

    msg2 db "Escribe un texto en el archivo :",0xA
	len2 equ $-msg2

segment .bss
	texto resb 30
	idarchivo resd 1

segment .text
leetecla:
	mov eax, 3 
	mov ebx, 0
    mov ecx, texto
	mov edx, 10	
	int 80H
	ret
	global _start

_start:

    mov eax, 39  ;servicio para crear un directorio
    mov ebx, path  ;define la ruta del servicio
    mov ecx, 0x1FF ; definimos el permiso 777
    int 80h


	mov eax, 8		; Servicios para el trabajo con archivos

	mov ebx, archivo	; EBX: la dirección de una cadena de caracteres terminada en nulo.
;	mov ecx, 1		; ECX: Modo de acceso.
	mov edx, 0x1FF		; EDX: permisos al archivo, si se abre creándolo.
	int 0x80


	test eax, eax		
	jz salir
	mov dword[idarchivo], eax

	escribe msg2, len2

	
	call leetecla

	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 10
	int 0x80


salir:
	mov eax, 1
	xor ebx, ebx
	int 0x80