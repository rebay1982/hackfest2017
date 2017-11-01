global sort_ascending

section .text

sort_ascending:
  ; Please write your code here
  push ebp
  mov ebp, esp


  xor eax, eax
  mov edx, [ebp + 0x08]   ; array pointer.
  mov ecx, [ebp + 0x0C]   ; array_len

  push ecx    ; array_len
  push eax    ; i
  push eax    ; tmp

  ; while (i < array_len)
sort_ascending_while:
  mov edx  [ebp - 0x04]   ; i
  cmp edx, [ebp]   ; comapre i with array_len
  jnge sort_ascending_while_end

  ; if construct
  dec ecx         ; contains array_len
  cmp edx, ecx
  jne sort_ascending_after_if

  mov [ebp], ecx
  mov [ebp - 0x04], 0x00

  jmp sort_ascending_while

  inc ecx   ; Undo what we did to ecx for the cmp

sort_ascending_after_if:
  mov eax, [ebp + 0x08]   ; *array
  imul ebx, [ebp - 0x04], 0x04   ; ebx contains i * 4

  push edx
  mov edx, [eax + ebx]      ; edx contains array[i]
  mov [ebp - 0x0C], edx
  pop edx

  add ebx, 0x04
  mov ecx, [eax, + ebx]     ; ecx contains array[i + 1]

  ; if tmp > array[i+1]
  cmp [ebp - 0x0C], ecx
  jnge sort_ascending_after_if_2

  mov


sort_ascending_after_if_2:
  inc [ebp - 0x04]
  jmp sort_ascending_while
sort_ascending_while_end:

  pop eax   ; tmp
  pop eax   ; i
  pop ecx

  pop ebp
  ret
