CC := gcc
CFLAGS := -O0 -g #-static 
LD := gcc
LDFLAGS := -O0 -g #-static 
NASM := as 

TARGET := bubble_sort
C_SRC := main.c random_numbers.c
ASM_SRC := bubble_sort.S
OBJECTS = $(C_SRC:.c=.o) $(ASM_SRC:.S=.o)

all: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJECTS) 
	$(LD) $(LDFLAGS) $^ -o $@

# Obtain object from C
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

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
