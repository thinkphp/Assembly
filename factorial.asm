;
; Author     : Adrian Statescu <mergesortv@gmail.com>
;  
; Description: A 64-bit Function Factorial Recursion.
;
; Assembly Code
;
; License: MIT
;

global fact

section .text

fact:
       cmp rdi, 1
       jnbe F1
       mov rax, 1
       ret
F1:
       push rdi
       dec rdi
       call fact
       pop rdi
       imul rax, rdi
       ret
