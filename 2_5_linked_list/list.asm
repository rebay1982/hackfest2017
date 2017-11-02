global __list_add	
global __list_del
global foobar_compare
global init_list_head
global list_add	
;global list_add_tail
global list_del
global list_is_last
;global list_next_entry
global list_prev_entry
;global list_search

section .data
; sl->list->prev = base + 0x0
; sl->list->next = base + 0x4
; sl->list->foo = base + 0x8
; sl->list->bar = base + 0x10

section .text
init_list_head:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; list

	mov [eax + 0x00], eax
	mov [eax + 0x04], eax

	pop ebp
	ret

__list_add:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; new
	mov edx, [ebp + 0x0C] ; prev
	mov ecx, [ebp + 0x10] ; next

	mov [ecx + 0x00], eax
	mov [eax + 0x04], ecx
	mov [eax + 0x00], edx
	mov [edx + 0x04], eax

	pop ebp
	ret

list_add:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; new
	mov edx, [ebp + 0x0C] ; head

	push dword [edx + 0x04]
	push edx
	push eax
	call __list_add
	add esp, 0x0C

	pop ebp
	ret

list_add_tail:
    ; Please write your code here

__list_del:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; prev
	mov edx, [ebp + 0x0C] ; next

	mov [edx + 0x00], eax
	mov [eax + 0x04], edx

	pop ebp
	ret

list_del:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; entry

	push dword [eax + 0x04]
	push dword [eax]
	call __list_del
	add esp, 0x08

	pop ebp
	ret

list_next_entry:
    ; Please write your code here

list_prev_entry:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; list
	mov eax, [eax + 0x00] ; list->prev

	pop ebp
	ret

list_is_last:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; list
	mov edx, [ebp + 0x0C] ; head

	mov eax, [eax + 0x04]
	and eax, edx

	pop ebp
	ret

foobar_compare:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 0x08] ; s1
	mov edx, [ebp + 0x0C] ; s2
	mov eax, [eax + 0x08] ; s1->foo
	mov edx, [edx + 0x08] ; s2->foo
	cmp eax, edx 
	jnz foobar_compare_bail
	mov ecx, eax ; keep a copy for later


	mov eax, [ebp + 0x08] ; s1
	mov edx, [ebp + 0x0C] ; s2
	mov eax, [eax + 0x0c] ; s1->bar
	mov edx, [edx + 0x0c] ; s2->bar
	cmp eax, edx
	jnz foobar_compare_bail
	
	mov eax, 0x01
	jmp foobar_compare_exit

foobar_compare_bail:
	xor eax, eax
foobar_compare_exit:
	pop ebp
	ret

list_search:
    ; Please implement your code here
