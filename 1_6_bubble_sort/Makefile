CC := clang 
CFLAGS := -target i386-pc-linux -Os #-static 
LD := clang 
LDFLAGS := -target i386-pc-linux -Os #-static 
NASM :=  nasm -felf32

TARGET := bubble_sort
C_SRC := main.c random_numbers.c
ASM_SRC := bubble_sort.asm
OBJECTS = $(C_SRC:.c=.o) $(ASM_SRC:.asm=.o)

all: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJECTS) 
	$(LD) $(LDFLAGS) $^ -o $@

# Obtain object from C
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
	$(CC) -S -masm=intel $(CFLAGS) $< 

# Obtain object from ASM
%.o: %.asm
	$(NASM) $< -o $@

gef: $(TARGET)
	gdb -q $(TARGET)

#.syntastic_clang_check_config: Makefile

clean:
	rm -rf $(TARGET) $(OBJECTS) $(C_SRC:.c=.s) random_numbers.c

random_numbers.c:
	@echo "int random_numbers[] = {" $(num) "};"  > random_numbers.c

#Thunk
num := $(shell dd if=/dev/urandom count=10 bs=1 2>/dev/null | xxd -i)
