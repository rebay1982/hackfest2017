CC := clang 
CFLAGS := -target x86_64-pc-linux -Os #-static 
LD := clang 
LDFLAGS := -target x86_64-pc-linux -Os #-static 
NASM :=  nasm -felf64

TARGET := cj2
C_SRC := 
ASM_SRC := cj2.asm
OBJECTS = $(C_SRC:.c=.o) $(ASM_SRC:.asm=.o)

all: $(TARGET) incbin deobfuscate

deobfuscate: deobfuscate.o
	$(LD) $(LDFLAGS) $^ -o $@

incbin: incbin.o
	$(LD) $(LDFLAGS) $^ -o $@

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

# Obtain object from C
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
	$(CC) -S -masm=intel $(CFLAGS) $< 

# Obtain object from ASM
%.o: %.asm
	$(NASM) -g $< -o $@

gef: $(TARGET)
	gdb -q $(TARGET)

#.syntastic_clang_check_config: Makefile

clean:
	rm -rf $(TARGET) $(OBJECTS) $(C_SRC:.c=.s) incbin incbin.o deobfuscate.o deobfuscate

