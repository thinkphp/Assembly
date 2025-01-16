section .data
    vec DD -5, -7, 3, -17, 8, -2, 0    ; vector exemplu

section .text
global _start

_start:
    xor ebx, ebx        ; ebx = 0 (maxim curent)
    mov esi, vec        ; esi = adresa vectorrului
    
next:
    mov eax, [esi]      ; eax = elementul curent
    cmp eax, 0          ; ne intrebam daca am ajuns la zero
    je done             ; dacă da, am terminat
    
    ; calculam valoarea absoluta
    mov edx, eax        ; save valoarea in EDX
    test eax, eax       ; check daca   e negativ <0
    jns skip_neg        ; dacă nu e negativ, jump
    neg eax             ; dacă e negativ, il negăm
    
skip_neg:
    ; comparam cu maximul current
    cmp eax, ebx        ; 
    jle not_greater     ; dacă nu e mai mare, sarim peste
    mov ebx, eax        ; facem update la  maximul
    
not_greater:
    add esi, 4          ; trecem la urmatorul element
    jmp next            ; repetam pentru urmatorul element

done:
    mov eax, ebx        ; punem rezultatul în eax
    
    ; exit
    mov ebx, eax        ; save the result pentru exit
    mov eax, 1          ; syscall exit
    int 0x80
