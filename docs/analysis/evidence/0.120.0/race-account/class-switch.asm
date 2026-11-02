0000000145a8c0f0  55                     push rbp
0000000145a8c0f1  4156                   push r14
0000000145a8c0f3  56                     push rsi
0000000145a8c0f4  57                     push rdi
0000000145a8c0f5  53                     push rbx
0000000145a8c0f6  4881ec80000000         sub rsp, 0x80
0000000145a8c0fd  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145a8c105  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145a8c10d  4d89c3                 mov r11, r8
0000000145a8c110  4889ce                 mov rsi, rcx
0000000145a8c113  45884838               mov byte ptr [r8 + 0x38], r9b
0000000145a8c117  488b8270010000         mov rax, qword ptr [rdx + 0x170]
0000000145a8c11e  488b8a78010000         mov rcx, qword ptr [rdx + 0x178]
0000000145a8c125  48c1e103               shl rcx, 3
0000000145a8c129  4531c0                 xor r8d, r8d
0000000145a8c12c  4c895de8               mov qword ptr [rbp - 0x18], r11
0000000145a8c130  4c39c1                 cmp rcx, r8
0000000145a8c133  7423                   je 0x145a8c158
0000000145a8c135  4d8d5008               lea r10, [r8 + 8]
0000000145a8c139  46380c00               cmp byte ptr [rax + r8], r9b
0000000145a8c13d  4d89d0                 mov r8, r10
0000000145a8c140  75ee                   jne 0x145a8c130
0000000145a8c142  4a8b4c10f8             mov rcx, qword ptr [rax + r10 - 8]
0000000145a8c147  4889c8                 mov rax, rcx
0000000145a8c14a  48c1e818               shr rax, 0x18
0000000145a8c14e  c1e908                 shr ecx, 8
0000000145a8c151  6641894b39             mov word ptr [r11 + 0x39], cx
0000000145a8c156  eb5a                   jmp 0x145a8c1b2
0000000145a8c158  450fb64339             movzx r8d, byte ptr [r11 + 0x39]
0000000145a8c15d  c645f701               mov byte ptr [rbp - 9], 1
0000000145a8c161  4989d6                 mov r14, rdx
0000000145a8c164  4889d1                 mov rcx, rdx
0000000145a8c167  4489ca                 mov edx, r9d
0000000145a8c16a  e811feffff             call 0x145a8bf80
0000000145a8c16f  90                     nop
0000000145a8c170  88c3                   mov bl, al
0000000145a8c172  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145a8c176  885839                 mov byte ptr [rax + 0x39], bl
0000000145a8c179  408a783a               mov dil, byte ptr [rax + 0x3a]
0000000145a8c17d  c645f701               mov byte ptr [rbp - 9], 1
0000000145a8c181  e81a40ffff             call 0x145a801a0
0000000145a8c186  90                     nop
0000000145a8c187  4c8b5de8               mov r11, qword ptr [rbp - 0x18]
0000000145a8c18b  4885c0                 test rax, rax
0000000145a8c18e  741d                   je 0x145a8c1ad
0000000145a8c190  c645f701               mov byte ptr [rbp - 9], 1
0000000145a8c194  4889c1                 mov rcx, rax
0000000145a8c197  89da                   mov edx, ebx
0000000145a8c199  4189f8                 mov r8d, edi
0000000145a8c19c  e8ffd93900             call 0x145e29ba0
0000000145a8c1a1  90                     nop
0000000145a8c1a2  31c0                   xor eax, eax
0000000145a8c1a4  4c89f2                 mov rdx, r14
0000000145a8c1a7  4c8b5de8               mov r11, qword ptr [rbp - 0x18]
0000000145a8c1ab  eb05                   jmp 0x145a8c1b2
0000000145a8c1ad  31c0                   xor eax, eax
0000000145a8c1af  4c89f2                 mov rdx, r14
0000000145a8c1b2  4189433b               mov dword ptr [r11 + 0x3b], eax
0000000145a8c1b6  48c1e820               shr rax, 0x20
0000000145a8c1ba  4188433f               mov byte ptr [r11 + 0x3f], al
0000000145a8c1be  410f1003               movups xmm0, xmmword ptr [r11]
0000000145a8c1c2  410f104b10             movups xmm1, xmmword ptr [r11 + 0x10]
0000000145a8c1c7  410f105320             movups xmm2, xmmword ptr [r11 + 0x20]
0000000145a8c1cc  498b4330               mov rax, qword ptr [r11 + 0x30]
0000000145a8c1d0  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145a8c1d4  410fb64338             movzx eax, byte ptr [r11 + 0x38]
0000000145a8c1d9  8845d8                 mov byte ptr [rbp - 0x28], al
0000000145a8c1dc  410fb74339             movzx eax, word ptr [r11 + 0x39]
0000000145a8c1e1  668945d9               mov word ptr [rbp - 0x27], ax
0000000145a8c1e5  418b433b               mov eax, dword ptr [r11 + 0x3b]
0000000145a8c1e9  8945db                 mov dword ptr [rbp - 0x25], eax
0000000145a8c1ec  410fb6433f             movzx eax, byte ptr [r11 + 0x3f]
0000000145a8c1f1  8845df                 mov byte ptr [rbp - 0x21], al
0000000145a8c1f4  0f2955c0               movaps xmmword ptr [rbp - 0x40], xmm2
0000000145a8c1f8  0f294db0               movaps xmmword ptr [rbp - 0x50], xmm1
0000000145a8c1fc  0f2945a0               movaps xmmword ptr [rbp - 0x60], xmm0
0000000145a8c200  c645f700               mov byte ptr [rbp - 9], 0
0000000145a8c204  4c8d45a0               lea r8, [rbp - 0x60]
0000000145a8c208  4889f1                 mov rcx, rsi
0000000145a8c20b  e8b0f2ffff             call 0x145a8b4c0
0000000145a8c210  90                     nop
0000000145a8c211  4889f0                 mov rax, rsi
0000000145a8c214  4881c480000000         add rsp, 0x80
0000000145a8c21b  5b                     pop rbx
0000000145a8c21c  5f                     pop rdi
0000000145a8c21d  5e                     pop rsi
0000000145a8c21e  415e                   pop r14
0000000145a8c220  5d                     pop rbp
0000000145a8c221  c3                     ret
