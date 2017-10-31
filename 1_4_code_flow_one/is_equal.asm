global is_equal
section .text

is_equal:
  ; Please write your code here
  ;push ebp
  ;mov ebp, esp

  mov eax, [esp + 0x08]
  cmp eax, [esp + 0x0C]
  sete al

  ;pop ebp
  ret
