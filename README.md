# Assembly Language Courseware: 

## 1. Introduction
   - What is assembly language?
   - Why learn assembly?
   - Brief history of assembly languages

## 2. Setting Up the Environment
   - Installing NASM
   - Setting up a text editor
   - Basic command-line usage for assembling and linking

## 3. NASM Syntax Basics
   - Structure of a NASM program
   - Comments, labels, and directives
   - Basic instructions (MOV, ADD, SUB)

## 4. Number Representation
   - Binary and hexadecimal systems
   - Signed and unsigned integers
   - Little-endian vs Big-endian

## 5. Memory and Registers
   - CPU registers (general-purpose, segment, and special registers)
   - Memory addressing modes
   - Stack operations

## 6. Basic Arithmetic Operations
   - Addition and subtraction
   - Multiplication and division
   - Bitwise operations

## 7. Adding Two Numbers: Step-by-Step
   1. Program structure
   2. Declaring variables
   3. Moving data into registers
   4. Performing addition
   5. Storing the result
   6. Displaying the result

## 8. Sample Program: Adding Two Numbers
   - Walkthrough of a complete NASM program
   - Explanation of each line of code
   - Assembling and running the program

## 9. Debugging and Troubleshooting
   - Common errors and how to fix them
   - Using a debugger (e.g., GDB) with assembly code

## 10. Practice Exercises
    - Modify the program to add three numbers
    - Implement subtraction of two numbers
    - Create a program that adds user input numbers

## 11. Advanced Topics (Optional)
    - Floating-point arithmetic
    - SIMD instructions for parallel addition
    - Optimizing addition operations

## 12. Resources for Further Learning
    - Recommended books and online tutorials
    - Assembly language forums and communities

# _________________    
## Assembly x86-64

```
admin@ironman:~$ nasm -felf64 factorial.asm && gcc -std=c99 factorial.o factorial.c && ./a.out
admin@ironman:~$ nasm -felf64 maxofthree.asm && gcc maxofthree.o max.c && ./a.out
```

### Adding Two Numbers in NASM
```
section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    fmt_input db "%ld", 0
    fmt_output db "The sum is: %ld", 10, 0

section .bss
    num1 resq 1
    num2 resq 1

section .text
    global main
    extern printf
    extern scanf

main:
    ; Prologue
    push rbp
    mov rbp, rsp

    ; Prompt for first number
    mov rdi, prompt1
    xor eax, eax
    call printf

    ; Read first number
    mov rdi, fmt_input
    mov rsi, num1
    xor eax, eax
    call scanf

    ; Prompt for second number
    mov rdi, prompt2
    xor eax, eax
    call printf

    ; Read second number
    mov rdi, fmt_input
    mov rsi, num2
    xor eax, eax
    call scanf

    ; Perform addition
    mov rax, [num1]
    add rax, [num2]

    ; Print result
    mov rdi, fmt_output
    mov rsi, rax
    xor eax, eax
    call printf

    ; Epilogue
    mov rsp, rbp
    pop rbp

    ; Exit program
    xor eax, eax
    ret   

```

```
Save the code to a file, e.g., max_numbers.asm
nasm -f elf64 max_numbers.asm
gcc max_numbers.o -o max_numbers -no-pie
```

#### Reference:
https://www.nasm.us/xdoc/2.15.05/html/nasmdoc0.html
