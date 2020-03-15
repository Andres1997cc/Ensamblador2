%macro write 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data

    mjsError db 'Error en el archivo',10
    lenError equ $-mjsError
   
   ;Dfenir arreglo 
    arreglo db 3,2,4,4,1,4,3
    len_arreglo equ $ -arreglo


section .bss
    valorN resb 1
    aux resb 1
    cont resb 1
    contador2 resb 1
section .text
    global _start
_start:

inicializar:
    ;dimensiones del arreglo ;puntero y tamaño
    mov esi, arreglo
    mov edi, 0

    mov eax,[esi] ;tomar el valor de posicion del esi y asignar a un registro y luego a una variable
    add eax,'0'

    ;mov [valorN],eax ;presentar el valor en una variable
    mov ecx,1
    mov [cont],ecx ; incrementar el valor del contador

    mov edx,1
    mov [contador2],edx

compareItems:
    mov ebx,[esi]
    add ebx,'0'

    cmp eax,ebx
    je incrementar
    
    inc esi
    inc edi
    cmp edi,len_arreglo
    jb compareItems
    jmp finalizacionComparacion
   

incrementar:
    inc ecx ; incrementar el contador de repeticiones
    add ecx,'0'
    mov [cont],ecx
    
    write cont,1
    inc esi
    inc edi
    cmp edi, len_arreglo
    jb compareItems
    jmp finalizacionComparacion
finalizacionComparacion:
    mov [cont],ecx
    inc edx
    cmp edx,len_arreglo
    jb compareItems
    jmp imprimir
imprimir:
    mov eax, 4
    mov ebx, 1
    mov ecx, cont
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, valorN
    mov edx, 1
    int 80h
salir:
    mov eax,1
    int 80h
