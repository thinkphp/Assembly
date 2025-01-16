section .data
    n dd 5              ; n = 5
    k dd 2              ; k = 2

section .text
global _start

_start:
    mov eax, 1          ;
    mov ecx, 1          ;
    mov ebx, [k]        ;
    mov edx, [n]        ;

loop_start:
    cmp ecx, ebx        ; dacă i > k, exit loop
    jg done
    
    ; Calculăm (n-k+i)
    mov esi, edx        ; esi = n
    sub esi, ebx        ; esi = n-k
    add esi, ecx        ; esi = n-k+i
    
    ; eax = eax * (n-k+i)
    push edx            ; save EDX pe stiva
    mov edx, 0          ; reset edx inainte de mul
    mul esi             ; edx:eax = eax * esi
    pop edx             ; restaurare edx de pe stivă
    
    ; eax = eax / i
    push edx            ; save edx pe stack
    mov edx, 0          ; reset EDX before de div
    div ecx             ; eax /= ecx
    pop edx             ; restaurare edx de pe stack
    
    inc ecx             ; i++
    jmp loop_start      ; continuare loop

done:
    ; Rezultatul este în eax
    mov ebx, eax        ; mutam rezultatul în EBX pentru EXIT
    mov eax, 1          ; syscall: EXIT
    int 0x80            ; EXIT
