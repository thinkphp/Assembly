;
; Author     : Adrian Statescu <mergesortv@gmail.com>
;  
; Description: A 64-bit function that returns the maximum value of its three 64-bit
;              integer arguments.
;
; Assembly Code
;
; License: MIT
;

global maxOf3

section .text

maxOf3:
      mov rax, rdi
      cmp rax, rsi
      cmovl rax, rsi
      cmp rax, rdx
      cmovl rax, rdx
      ret
