0000000145bb4eb2 31f6                           xor esi, esi
0000000145bb4eb4 4c8d75b8                       lea r14, [rbp - 0x48]
0000000145bb4eb8 f2440f10055f797b00             movsd xmm8, qword ptr [rip + 0x7b795f]
0000000145bb4ec1 4869fee8040000                 imul rdi, rsi, 0x4e8
0000000145bb4ec8 31db                           xor ebx, ebx
0000000145bb4eca eb21                           jmp 0x145bb4eed
0000000145bb4ecc 84c0                           test al, al
0000000145bb4ece 0f8594010000                   jne 0x145bb5068
0000000145bb4ed4 c6854f0d000001                 mov byte ptr [rbp + 0xd4f], 1
0000000145bb4edb 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb4ee2 4889f2                         mov rdx, rsi
0000000145bb4ee5 e8c62a0200                     call 0x145bd79b0
0000000145bb4eea 90                             nop 
0000000145bb4eeb 31db                           xor ebx, ebx
0000000145bb4eed 4c8bbd800d0000                 mov r15, qword ptr [rbp + 0xd80]
0000000145bb4ef4 4183bf980d000003               cmp dword ptr [r15 + 0xd98], 3
0000000145bb4efc 0f858b030000                   jne 0x145bb528d
0000000145bb4f02 498b97d80d0000                 mov rdx, qword ptr [r15 + 0xdd8]
0000000145bb4f09 4839d6                         cmp rsi, rdx
0000000145bb4f0c 0f835e010000                   jae 0x145bb5070
0000000145bb4f12 4881fbc7000000                 cmp rbx, 0xc7
0000000145bb4f19 0f8749010000                   ja 0x145bb5068
0000000145bb4f1f 4839d6                         cmp rsi, rdx
0000000145bb4f22 0f83265c0000                   jae 0x145bbab4e
0000000145bb4f28 4c8bbd800d0000                 mov r15, qword ptr [rbp + 0xd80]
0000000145bb4f2f 498b87d00d0000                 mov rax, qword ptr [r15 + 0xdd0]
0000000145bb4f36 488b9438c8040000               mov rdx, qword ptr [rax + rdi + 0x4c8]
0000000145bb4f3e 4c8b8438d0040000               mov r8, qword ptr [rax + rdi + 0x4d0]
0000000145bb4f46 4c89f1                         mov rcx, r14
0000000145bb4f49 e862cf1000                     call 0x145cc1eb0
0000000145bb4f4e 4183bf980d000003               cmp dword ptr [r15 + 0xd98], 3
0000000145bb4f56 7538                           jne 0x145bb4f90
0000000145bb4f58 498b97d80d0000                 mov rdx, qword ptr [r15 + 0xdd8]
0000000145bb4f5f 4839d6                         cmp rsi, rdx
0000000145bb4f62 0f832b5c0000                   jae 0x145bbab93
0000000145bb4f68 498b87d00d0000                 mov rax, qword ptr [r15 + 0xdd0]
0000000145bb4f6f 4c8b643810                     mov r12, qword ptr [rax + rdi + 0x10]
0000000145bb4f74 48837db8ff                     cmp qword ptr [rbp - 0x48], -1
0000000145bb4f79 7446                           je 0x145bb4fc1
0000000145bb4f7b 4d85e4                         test r12, r12
0000000145bb4f7e 741b                           je 0x145bb4f9b
0000000145bb4f80 48ffc3                         inc rbx
0000000145bb4f83 4c89f1                         mov rcx, r14
0000000145bb4f86 e84556ffff                     call 0x145baa5d0
0000000145bb4f8b e95dffffff                     jmp 0x145bb4eed
0000000145bb4f90 48837db8ff                     cmp qword ptr [rbp - 0x48], -1
0000000145bb4f95 0f8439ffffff                   je 0x145bb4ed4
0000000145bb4f9b c6854f0d000000                 mov byte ptr [rbp + 0xd4f], 0
0000000145bb4fa2 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb4fa9 4889f2                         mov rdx, rsi
0000000145bb4fac 4d89f0                         mov r8, r14
0000000145bb4faf 660f28de                       movapd xmm3, xmm6
0000000145bb4fb3 e8c8120200                     call 0x145bd6280
0000000145bb4fb8 90                             nop 
0000000145bb4fb9 48ffc3                         inc rbx
0000000145bb4fbc e92cffffff                     jmp 0x145bb4eed
