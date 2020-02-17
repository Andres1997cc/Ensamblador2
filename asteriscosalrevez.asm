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