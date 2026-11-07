145973b45 movss     xmm9, dword ptr [r14 + 0x48]
145973b4b mov       r15, qword ptr [r14 + 0x20]
145973b4f mov       rax, qword ptr [r14 + 0x28]
145973b53 lea       rbx, [r15 + rax*4]
145973b57 xor       edi, edi
145973b59 jmp       0x145973bad
145973b5b nop       dword ptr [rax + rax]
145973b60 mov       rax, qword ptr [rbp + 0x230]
145973b67 imul      rcx, rsi, 0x38
145973b6b mov       rdx, qword ptr [rbp + 0x220]
145973b72 mov       qword ptr [rax + rcx], rdx
145973b76 movaps    xmm0, xmmword ptr [rbp - 0x30]
145973b7a movaps    xmm1, xmmword ptr [rbp - 0x20]
145973b7e movups    xmmword ptr [rax + rcx + 8], xmm0
145973b83 movups    xmmword ptr [rax + rcx + 0x18], xmm1
145973b88 movups    xmm0, xmmword ptr [rbp - 0x13]
145973b8c movups    xmmword ptr [rax + rcx + 0x25], xmm0
145973b91 mov       byte ptr [rax + rcx + 0x35], r13b
145973b96 mov       word ptr [rax + rcx + 0x36], r12w
145973b9c inc       rsi
145973b9f mov       qword ptr [rbp + 0x238], rsi
145973ba6 mov       r14, qword ptr [rbp + 0x310]
145973bad cmp       r15, rbx
145973bb0 je        0x145973d91
145973bb6 mov       rax, r15
145973bb9 movss     xmm0, dword ptr [r15]
145973bbe subss     xmm0, xmm7
145973bc2 movss     dword ptr [r15], xmm0
145973bc7 mov       rdx, qword ptr [r14 + 0x40]
145973bcb cmp       rdi, rdx
145973bce jae       0x1459764e3
145973bd4 lea       r15, [rax + 4]
145973bd8 mov       rcx, qword ptr [r14 + 0x38]
145973bdc imul      rdx, rdi, 0x38
145973be0 inc       rdi
145973be3 movups    xmm1, xmmword ptr [rcx + rdx]
145973be7 movups    xmm2, xmmword ptr [rcx + rdx + 0x10]
145973bec movups    xmm3, xmmword ptr [rcx + rdx + 0x1d]
145973bf1 movups    xmmword ptr [rbp - 0x13], xmm3
145973bf5 movaps    xmmword ptr [rbp - 0x20], xmm2
145973bf9 movaps    xmmword ptr [rbp - 0x30], xmm1
145973bfd ucomiss   xmm13, xmm0
145973c01 jb        0x145973bad
145973c03 movzx     r13d, byte ptr [rcx + rdx + 0x2d]
145973c09 movzx     r12d, word ptr [rcx + rdx + 0x2e]
145973c0f movss     xmm0, dword ptr [rcx + rdx + 0x30]
145973c15 ucomiss   xmm9, xmm6
145973c19 jbe       0x145973c50
145973c1b mov       edx, r13d
145973c1e sub       dl, 3
145973c21 movzx     ecx, dl
145973c24 mov       r8d, 0x1d
145973c2a cmovb     ecx, r8d
145973c2e cmp       cl, 0x1f
145973c31 ja        0x145973bad
145973c37 movzx     ecx, cl
145973c3a mov       r8d, 0xa0180006
145973c40 bt        r8d, ecx
145973c44 jb        0x145973c54
145973c46 jmp       0x145973bad
145973c4b nop       dword ptr [rax + rax]
145973c50 lea       edx, [r13 - 3]
145973c54 mov       rcx, qword ptr [rbp + 0x230]
145973c5b mov       r8, qword ptr [rbp + 0x238]
145973c62 cmp       r13b, 3
145973c66 movzx     edx, dl
145973c69 mov       r9d, 0x1d
145973c6f cmovb     edx, r9d
145973c73 cmp       dl, 0x1f
145973c76 ja        0x145973d28
145973c7c movzx     edx, dl
145973c7f mov       r9d, 0xa0180006
145973c85 bt        r9d, edx
145973c89 jae       0x145973d28
145973c8f cmp       byte ptr [r14 + 0x50], 0
145973c94 movss     xmm1, dword ptr [rip + 0x45941c] ; 145dcd0b8 3333333f00000000 f32=0.699999988
145973c9c jne       0x145973ca6
145973c9e movss     xmm1, dword ptr [rip + 0x42396a] ; 145d97610 0000803f0000003f f32=1
145973ca6 mulss     xmm0, xmm1
145973caa movss     dword ptr [rax], xmm0
145973cae mov       rsi, qword ptr [rbp + 0x238]
145973cb5 cmp       rsi, qword ptr [rbp + 0x228]
145973cbc jne       0x145973b60
145973cc2 mov       byte ptr [rbp + 0x337], 1
145973cc9 mov       byte ptr [rbp + 0x336], 1
145973cd0 mov       byte ptr [rbp + 0x335], 1
145973cd7 mov       byte ptr [rbp + 0x334], 1
145973cde mov       byte ptr [rbp + 0x333], 1
145973ce5 mov       byte ptr [rbp + 0x332], 1
145973cec mov       byte ptr [rbp + 0x331], 1
145973cf3 mov       byte ptr [rbp + 0x330], 1
145973cfa mov       byte ptr [rbp + 0x32f], 1
145973d01 mov       byte ptr [rbp + 0x32e], 1
145973d08 mov       byte ptr [rbp + 0x32d], 1
145973d0f mov       byte ptr [rbp + 0x32c], 1
145973d16 lea       rcx, [rbp + 0x228]
145973d1d call      0x145bf4e70
145973d22 nop
145973d23 jmp       0x145973b60
145973d28 test      r8, r8
145973d2b je        0x145973c8f
145973d31 imul      rdx, r8, 0x38
145973d35 xor       r8d, r8d
145973d38 jmp       0x145973d4d
145973d3a nop       word ptr [rax + rax]
145973d40 add       r8, 0x38
145973d44 cmp       rdx, r8
145973d47 je        0x145973c8f
145973d4d mov       r9, qword ptr [rbp + 0x220]
145973d54 cmp       qword ptr [rcx + r8], r9
145973d58 jne       0x145973d40
145973d5a movzx     r9d, byte ptr [rcx + r8 + 0x35]
145973d60 sub       r9b, 3
145973d64 movzx     r9d, r9b
145973d68 mov       r10d, 0x1d
145973d6e cmovb     r9d, r10d
145973d72 cmp       r9b, 0x1f
145973d76 ja        0x145973bad
145973d7c movzx     r9d, r9b
145973d80 mov       r10d, 0xa0180006
145973d86 bt        r10d, r9d
145973d8a jb        0x145973d40
145973d8c jmp       0x145973bad
