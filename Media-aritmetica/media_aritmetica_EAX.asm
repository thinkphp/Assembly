section .data
    ; aici definim cele 8 numere pornind de la adresa simbolica WERTE
    werte dd 10, 20, 30, 40, 50, 60, 70, 80   ; poti sa schimbi numerele, nu este nicio problema.
    count equ 8                                  ;stabilim numarul de numere in count

section .text
global _start

_start:
    mov eax, 0          ; initializam suma cu 0
    mov ecx, count      ; loop counter
    mov esi, 0          ; array index

sum_loop:
    add eax, [werte + esi*4]  ; adunam numarul curent la suma
    add esi, 1                  ; ne deplasam pe urmatorul element din arr
    loop sum_loop              ; decrementam ecx and loop if not zero

    ; acum EAX contine suma
    ; Divide by count (8) to get the mean
    mov ecx, count
    cdq                        ;
    idiv ecx                   ; impartim edx:eax by ecx, result in eax

    ; Acuma EAX contine media aritmetica
    mov ebx, eax              ; pune rezultatul în ebx pentru codul de output
    mov eax, 1                ; system call pentru exit
    int 0x80
