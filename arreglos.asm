section .data
        msj db "ingrese 6 números",10
        len equ $ - msj
        msj1 db "El número mayor es",10
        len1 equ $ - msj1
        msj2 db "El número menor es",10
        len2 equ $ - msj2

        ;definimos el arreglo
        arreglo db 0,0,0,0,0,0
        len_arreglo equ $ - arreglo
        
section .bss
        numero resb 2
section .text
        global _start

_start:
        mov eax,4
        mov ebx,1
        mov ecx,msj
        mov edx,len
        int 80h

        ;asignacion del arreglo en las posiciones efectivas
        mov esi,arreglo
        mov edi,0

leer:   
        ;leemos el numero 
        mov eax,3
        mov ebx,0
        mov ecx,numero
        mov edx,2
        int 80h

        ;luego asignamos el valor a una variable y lo asignamos al esi
        mov al,[numero]
        sub al,'0'
        mov [esi],al

        ;incrementar una posicion en el arreglo
        add esi,1
        add edi,1

        ;comparar para el salto
        cmp edi,len_arreglo
        jb leer
        mov esi,arreglo
        mov edi,0
imprimir:
        mov al,[esi]
        add al,'0'
        mov [numero],al

        
        mov eax,4
        mov ebx,1
        mov ecx,numero
        mov edx,1
        int 80h

        add esi,1
        add edi,1

        cmp edi,len_arreglo
        jb imprimir
        

salir:
        mov eax,1
        int 80h