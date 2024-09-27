# Assembly Language Courseware: Adding Two Numbers in NASM

## 1. Introduction to Assembly Language
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


#### Reference:
https://www.nasm.us/xdoc/2.15.05/html/nasmdoc0.html
