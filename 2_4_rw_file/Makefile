CC := clang 
CFLAGS := -target i386-pc-linux -Os #-static 
LD := clang 
LDFLAGS := -target i386-pc-linux -Os #-static 
NASM :=  nasm -felf32

TARGET := cat
C_SRC := main.c 
ASM_SRC := asm_cat.asm
OBJECTS = $(C_SRC:.c=.o) $(ASM_SRC:.asm=.o)

all: $(TARGET)
	strace ./$(TARGET) /var/log/kern.log

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
	rm -rf $(TARGET) $(OBJECTS) $(C_SRC:.c=.s)

