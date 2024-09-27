section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    fmt_input db "%ld", 0
    fmt_output db "The maximum is: %ld", 10, 0

section .bss
    num1 resq 1
    num2 resq 1

section .text
    global main
    extern printf
    extern scanf

main:
    push rbp
    mov rbp, rsp

    ; Prompt and read first number
    mov rdi, prompt1
    xor eax, eax
    call printf

    mov rdi, fmt_input
    mov rsi, num1
    xor eax, eax
    call scanf

    ; Prompt and read second number
    mov rdi, prompt2
    xor eax, eax
    call printf

    mov rdi, fmt_input
    mov rsi, num2
    xor eax, eax
    call scanf

    ; Compare numbers and find max
    mov rax, [num1]
    mov rbx, [num2]
    cmp rax, rbx
    jge print_result  ; Jump if num1 >= num2
    mov rax, rbx      ; If num2 > num1, move num2 to rax

print_result:
    mov rdi, fmt_output
    mov rsi, rax
    xor eax, eax
    call printf

    mov rsp, rbp
    pop rbp

    xor eax, eax
    ret
