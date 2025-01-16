section .data
    numbers dd 10, 20, 30, 40, 50, 60, 70, 80   ; numerele de calculat
    count equ 8                                  ; număr de elemente
    msg db "Media este: "                        ; mesaj pentru afișare
    len equ $ - msg
    newline db 10                               ; caracter newline

section .bss
    digit_space resb 32                         ; spațiu pentru conversia în șir
    digit_space_pos resb 1                      ; poziție curentă în șir

section .text
global _start

_start:
    mov eax, 0          ; inițializare sumă cu 0
    mov ecx, count      ; contor pentru loop
    mov esi, 0          ; index array

sum_loop:
    add eax, [numbers + esi*4]  ; adună numărul curent la sumă
    add esi, 1                  ; trece la următorul element
    loop sum_loop              ; decrementează ecx și repetă dacă nu e zero

    ; Împarte suma la count pentru a obține media
    mov ecx, count
    cdq                        ; extinde semnul lui eax în edx:eax
    idiv ecx                   ; împarte edx:eax la ecx, rezultatul în eax

    ; Afișează mesajul "Media este: "
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Convertește numărul în șir și afișează-l
    call _print_number

    ; Afișează newline
    mov ecx, newline
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov ebx, 0
    mov eax, 1
    int 0x80

; Funcție pentru convertirea numărului în șir și afișare
_print_number:
    mov ecx, digit_space
    mov ebx, 10
    mov [digit_space_pos], ecx

next_digit:
    mov edx, 0
    div ebx
    add dl, '0'
    dec ecx
    mov [ecx], dl
    test eax, eax
    jnz next_digit

    ; Calculează lungimea șirului
    mov edx, digit_space
    sub edx, ecx
    
    ; Afișează numărul
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret
