Pentru a rula acest program în Assembly (x86-64), veți avea nevoie de câțiva pași:

1. **Instalare unelte necesare**:
   - Veți avea nevoie de:
     - `nasm` (Netwide Assembler) pentru asamblare
     - `gcc` (GNU Compiler Collection) pentru legare
   - Pe sisteme Ubuntu/Debian: 
     ```
     sudo apt-get update
     sudo apt-get install nasm gcc
     ```
   - Pe sisteme Fedora: 
     ```
     sudo dnf install nasm gcc
     ```
   - Pe macOS cu Homebrew:
     ```
     brew install nasm gcc
     ```

2. **Salvare cod**:
   - Salvați codul într-un fișier, de exemplu `adunare.asm`

3. **Compilare și legare**:
   Veți folosi două comenzi:
   ```bash
   # Asamblare
   nasm -f elf64 adunare.asm -o adunare.o
   
   # Legare
   gcc -no-pie adunare.o -o adunare
   ```

4. **Rulare**:
   ```bash
   ./adunare
   ```

Exemplu complet pas cu pas:
```bash
# Salvați codul în adunare.asm
# Deschideți un terminal
# Rulați comenzile:

nasm -f elf64 adunare.asm -o adunare.o
gcc -no-pie adunare.o -o adunare
./adunare
```

Programul va afișa:
- "Enter the first number: "
- Așteptând primul număr
- "Enter the second number: "
- Așteptând al doilea număr
- "The sum is: [rezultat]"

Atenție:
- Trebuie să folosiți `nasm` pentru x86-64
- Opțiunea `-f elf64` specifică formatul de fișier pentru 64 de biți
- `-no-pie` este necesar pentru unele versiuni de gcc

Voi explica linie cu linie acest program scris în limbaj de asamblare x86-64 pentru a aduna două numere:

### Secțiunea .data
```nasm
section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    fmt_input db "%ld", 0
    fmt_output db "The sum is: %ld", 10, 0
```
- Această secțiune definește șirurile de caractere și formatele care vor fi folosite în program:
  - `prompt1`: Mesajul pentru introducerea primului număr
  - `prompt2`: Mesajul pentru introducerea celui de-al doilea număr
  - `fmt_input`: Formatul pentru citirea unui întreg lung (`%ld`)
  - `fmt_output`: Formatul pentru afișarea sumei, cu un nou rând la final (10 reprezintă caracterul de linie nouă)
- `db` înseamnă "define byte" și creează șiruri de caractere terminate cu 0

### Secțiunea .bss
```nasm
section .bss
    num1 resq 1
    num2 resq 1
```
- Această secțiune rezervă spațiu pentru variabilele nedefinite
- `resq` rezervă un cuvânt lung (quad word) de 64 de biți pentru fiecare variabilă
- `num1` și `num2` vor stoca numerele citite de la tastatură

### Secțiunea .text (Funcția principală)
```nasm
main:
    ; Prologue
    push rbp
    mov rbp, rsp
```
- Această secțiune reprezintă corpul programului
- Prologul pregătește cadrul de stivă pentru funcție:
  - `push rbp` salvează registrul bazei de stivă
  - `mov rbp, rsp` stabilește un nou cadru de stivă

```nasm
    ; Prompt pentru primul număr
    mov rdi, prompt1
    xor eax, eax
    call printf
```
- Afișează mesajul pentru primul număr
- `mov rdi, prompt1` încarcă adresa mesajului în registrul de argument
- `xor eax, eax` curăță registrul eax (pregătire pentru apelul printf)
- `call printf` apelează funcția de afișare

```nasm
    ; Citire primul număr
    mov rdi, fmt_input
    mov rsi, num1
    xor eax, eax
    call scanf
```
- Citește primul număr de la tastatură
- `mov rdi, fmt_input` setează formatul pentru citire
- `mov rsi, num1` indică unde va fi stocat numărul
- `call scanf` apelează funcția de citire

```nasm
    ; Prompt pentru al doilea număr
    mov rdi, prompt2
    xor eax, eax
    call printf
```
- Similar cu primul prompt, afișează mesajul pentru al doilea număr

```nasm
    ; Citire al doilea număr
    mov rdi, fmt_input
    mov rsi, num2
    xor eax, eax
    call scanf
```
- Citește al doilea număr folosind aceeași metodă ca prima dată

```nasm
    ; Efectuează adunarea
    mov rax, [num1]
    add rax, [num2]
```
- Încarcă primul număr în registrul `rax`
- Adună al doilea număr la valoarea din `rax`

```nasm
    ; Afișează rezultatul
    mov rdi, fmt_output
    mov rsi, rax
    xor eax, eax
    call printf
```
- Pregătește afișarea rezultatului
- `mov rdi, fmt_output` setează formatul de ieșire
- `mov rsi, rax` pune suma în registrul de argument
- `call printf` afișează suma

```nasm
    ; Epilog
    mov rsp, rbp
    pop rbp

    ; Ieșire din program
    xor eax, eax
    ret
```
- Epilogul restaurează cadrul de stivă
- `xor eax, eax` setează codul de retur la 0 (success)
- `ret` returnează din funcția principală, închizând programul

Acest program demonstrează procesul de:
1. Afișare prompt
2. Citire numere
3. Adunare
4. Afișare rezultat

Folosește apeluri către funcțiile C `printf` și `scanf` pentru intrare/ieșire, ceea ce face codul mai ușor de scris decât folosirea întreruperilor sistemului direct. 
