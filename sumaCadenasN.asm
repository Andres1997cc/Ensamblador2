section .data
    numero1 db '3277'
    numero2 db '2566'
    resultado db '     '
    len_resultado equ $ - resultado
section .text

    global _start

_start:
    mov esi,3 ; definimos la posición
    mov ecx,4 ; tamaño del arreglo
    clc         ;cls desacativa el bit(estado ativo) de la bandera carry

proceso_suma:    
    mov al,[numero1 + esi]
    ;mov ah,[numero2 + esi]
    ;adc al,ah
; ojo para el examen verificar como acceder desde numeros dinamicos

    adc al, [numero2 + esi]  ;si vale este movimiento indirecto/ proceso para verificar que la suma es mayor a 6
    aaa          ; esta instruccion trabaja con al / ajusta a bcd = +0110
    pushf  ; salvar los estado de la bander y envialos a pila
    or al, 30h ; es como trabajar con el aas, el aas no trabaja con el registro al
    popf

    mov[resultado+esi],al
    
    dec esi
    loop proceso_suma

    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,len_resultado
    int 80h
salir:
    mov eax,1
    int 80h