section .data 
        asterisco db '*'
        new_line db 10,''
        espaciow db '_'
section .bss
        contardor_bx resb 1
        contardor_cx resb 1

section .text
        global _start
_start:
        mov ecx,9
        mov ebx,9
        mov edx,9

l1:
        
        push ecx
        call imprimir_nueva_linea
        pop ebx
        mov ecx, ebx
        call espacio
        push ebx
        
l3:     
        push edx
        mov edx,ecx
        call espacio
        pop edx
        loop l3
l2:
        push ecx
        ; imprimir el asterisco
        call imprimir_asterisco
        pop ecx
        loop l2
        
        pop ecx
        
        loop l1
        jmp salir
        

imprimir_nueva_linea:
        mov eax,4
        mov ebx,1
        mov ecx,new_line
        mov edx,1
        int 80h

        ret
imprimir_asterisco:
        mov eax,4
        mov ebx,1
        mov ecx,asterisco
        mov edx,1
        int 80h

        ret
espacio:
        mov eax,4
        mov ebx,1
        mov ecx,espaciow
        mov edx,1
        int 80h

        ret
salir:  
        mov eax,1
        int 80h