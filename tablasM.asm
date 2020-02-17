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
        msj db 'ingrese un numero para la tabla',10
        len_msj equ $ - msj
        operador db '*'
        igual db '='
        new_line db 10,''

section .bss
        numero resb 2
        resultado resb 2
        ob resb 2
section .text
        global _start

_start:
        escribir msj,len_msj
        leer numero,1
        mov al,[numero]
        sub al, '0'
        mov dl,0
        jmp creartabla
creartabla:
        
        ;se tiene que tomar el valor de los dos registros para que no se pierdan, se pierden cuando se hace los movimientos en los macros
        inc dl
        push eax
        push edx
        mul dl
        
        mov cl,10
        div cl
        

        add ax, '00'
        mov [resultado],ax

        mov ax,dx
        div cl
        add ax, '00'
        mov [ob],ax

        escribir numero,2
        escribir operador,1
        escribir ob,2
        escribir igual,1
        escribir resultado,2
        escribir new_line,1
        pop edx
        pop eax

        cmp dl,12
        je salir
        jmp creartabla
salir:
        mov eax,1
        int 80h