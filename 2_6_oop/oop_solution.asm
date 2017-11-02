global oop
extern printf

section .rodata
animal_speak_fmt:
	db `Animals can't speak`, 0x0

dog_eat_fmt:
	db `Omnivor\n`, 0x0
dog_speak_fmt:
	db `Woof\n`, 0x0
dog_specie_fmt:
	db `Mammal\n`, 0x0
dog_fetch_fmt:
	db `Balls\n`, 0x0

cat_eat_fmt:
	db `Carnivor\n`, 0x0
cat_speak_fmt:
	db `Meow\n`, 0x0
cat_specie_fmt:
	db `Mammal\n`, 0x0
cat_purrs_fmt:
	db `Purrs\n`, 0x0

duck_eat_fmt:
	db `Omnivor\n`, 0x0
duck_speak_fmt:
	db `Quack\n`, 0x0
duck_specie_fmt:
	db `Bird\n`, 0x0
duck_flies_fmt:
	db `Fly\n`, 0x0

section .data

VTABLE_Animal:
	dd Animal_init
	dd Animal_eat 
	dd Animal_speak 
	dd Animal_specie 

VTABLE_Dog:
	dd Dog_init
	dd Animal_eat 
	dd Animal_speak 
	dd Animal_specie 
	dd Dog_fetch 

VTABLE_Cat:
	dd Cat_init
	dd Animal_eat 
	dd Animal_speak 
	dd Animal_specie 
	dd Cat_purrs

VTABLE_Duck:
	dd Duck_init
	dd Animal_eat 
	dd Animal_speak 
	dd Animal_specie 
	dd Duck_flies

Animal_init:
	push ebp
	mov ebp, esp

	pop ebp
	ret

Animal_eat:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 0x08] ; self
	mov eax, [eax + 0x04] ; eat_fmt is at self+0x04

	push eax
	call printf
	add esp, 0x04

	pop ebp
	ret

Animal_speak:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 0x08] ; self
	mov eax, [eax + 0x08] ; eat_fmt is at self+0x08

	push eax
	call printf
	add esp, 0x04

	pop ebp
	ret

Animal_specie:
	push ebp
	mov ebp, esp

	pop ebp
	ret

Dog_init:
	push ebp
	mov ebp, esp

	pop ebp
	ret

Dog_fetch:
	push ebp
	mov ebp, esp

	mov eax, dog_fetch_fmt

	push eax
	call printf
	add esp, 0x04

	pop ebp
	ret

Cat_init:
	push ebp
	mov ebp, esp

	pop ebp
	ret

Cat_purrs:
	push ebp
	mov ebp, esp

	mov eax, cat_purrs_fmt

	push eax
	call printf
	add esp, 0x04

	pop ebp
	ret

Duck_init:
	push ebp
	mov ebp, esp

	pop ebp
	ret

Duck_flies:
	push ebp
	mov ebp, esp

	pop ebp
	ret

a_Dog:
	dd VTABLE_Dog
	dd dog_eat_fmt
	dd dog_speak_fmt
	dd dog_specie_fmt

a_Cat:
	dd VTABLE_Cat
	dd cat_eat_fmt
	dd cat_speak_fmt
	dd cat_specie_fmt

a_Duck:
	dd VTABLE_Duck
	dd duck_eat_fmt
	dd duck_speak_fmt
	dd duck_specie_fmt

oop:
	push ebp
	mov ebp, esp

	; Initialize all objects 
	push a_Dog
	mov eax, [a_Dog]
	call [eax + 0x0]
	add esp, 0x04

	push a_Dog
	mov eax, [a_Cat]
	call [eax + 0x0]
	add esp, 0x04

	push a_Dog
	mov eax, [a_Duck]
	call [eax + 0x0]
	add esp, 0x04

	; Eat
	push a_Dog
	mov eax, [a_Dog]
	call [eax + 0x04]; 0x04 = Eat function
	add esp, 0x04
	
	push a_Cat
	mov eax, [a_Cat]
	call [eax + 0x04]; 0x04 = Eat function
	add esp, 0x04

	push a_Duck
	mov eax, [a_Duck]
	call [eax + 0x04]; 0x04 = Eat function
	add esp, 0x04

	; Speak
	push a_Dog
	mov eax, [a_Dog]
	call [eax + 0x08]; 0x04 = Eat function
	add esp, 0x04
	
	push a_Cat
	mov eax, [a_Cat]
	call [eax + 0x08]; 0x04 = Eat function
	add esp, 0x04

	push a_Duck
	mov eax, [a_Duck]
	call [eax + 0x08]; 0x04 = Eat function
	add esp, 0x04

	; Fetch
	push a_Dog
	mov eax, [a_Dog]
	call [eax + 0x10]; 0x04 = Eat function
	add esp, 0x04

	; Purrs
	push a_Cat
	mov eax, [a_Cat]
	call [eax + 0x10]; 0x04 = Eat function
	add esp, 0x04
	
	pop ebp
	ret
