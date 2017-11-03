# unobfuscate.c

In this file we have routines to unobfuscate the text and the strings

# incbin

To disassemble the b6 routine that was extracted using unobfuscate


# Steps
 - Take the bytes of b5 and substract 0x55
 - The key for the xor is incremented by 1
 - Take the bytes from b1 b2 b3 b5 and deobfusate them
 - Follow the ROP chain
 - Realize all of this was useless, you only have to type the value
   being compared at line 175 by `asm cmp rax, 0x41424443`
 - Convert these bytes to ASCII and type them in the prompt
 - You are a reverse engineer 
