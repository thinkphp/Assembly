section .data
    num1 dd 5
    num2 dd 10
    newline db 10    ; caracterul newline
    
section .bss
    rezultat resb 8  ; rezervăm spațiu pentru rezultat în ASCII

section .text
    global _start

_start:
    ; adunarea numerelor
    mov eax, [num1]
    add eax, [num2]
    
    ; convertim numărul din EAX în ASCII
    mov ecx, 10      ; baza în care convertim (zecimal)
    mov edi, rezultat
    add edi, 7       ; începem de la sfârșitul buffer-ului
    mov byte [edi], 0
    dec edi
    mov byte [edi], 10  ; newline
    
convert_loop:
    dec edi
    xor edx, edx     ; curățăm EDX pentru div
    div ecx          ; împărțim EAX la 10
    add dl, '0'      ; convertim restul în ASCII
    mov [edi], dl    ; salvăm cifra
    test eax, eax    ; verificăm dacă mai avem cifre
    jnz convert_loop
    
    ; afișăm rezultatul
    mov ecx, edi     ; adresa string-ului
    mov edx, rezultat
    add edx, 8
    sub edx, edi     ; calculăm lungimea
    mov eax, 4       ; syscall pentru write
    mov ebx, 1       ; stdout
    int 0x80
    
    ; ieșim din program
    mov eax, 1
    mov ebx, 0
    int 0x80
