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
