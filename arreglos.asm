section .data
        msj db "ingrese 6 números",10
        len equ $ - msj
section .bss

section .text
        global _start

_start: