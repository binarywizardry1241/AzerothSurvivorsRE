; 0.120.2 SHA256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
0000000145e0c0ab 80bd8801000000                 cmp byte ptr [rbp + 0x188], 0
0000000145e0c0b2 7477                           je 0x145e0c12b
0000000145e0c0b4 49c1e720                       shl r15, 0x20
0000000145e0c0b8 4589e1                         mov r9d, r12d
0000000145e0c0bb 4d09f9                         or r9, r15
0000000145e0c0be 49c1e520                       shl r13, 0x20
0000000145e0c0c2 89f1                           mov ecx, esi
0000000145e0c0c4 4c09e9                         or rcx, r13
0000000145e0c0c7 4c8b4540                       mov r8, qword ptr [rbp + 0x40]
0000000145e0c0cb 488b8560010000                 mov rax, qword ptr [rbp + 0x160]
0000000145e0c0d2 4c894070                       mov qword ptr [rax + 0x70], r8
0000000145e0c0d6 0f284530                       movaps xmm0, xmmword ptr [rbp + 0x30]
0000000145e0c0da 0f114060                       movups xmmword ptr [rax + 0x60], xmm0
0000000145e0c0de 488910                         mov qword ptr [rax], rdx
0000000145e0c0e1 4c894808                       mov qword ptr [rax + 8], r9
0000000145e0c0e5 48897810                       mov qword ptr [rax + 0x10], rdi
0000000145e0c0e9 488b9598010000                 mov rdx, qword ptr [rbp + 0x198]
0000000145e0c0f0 48895018                       mov qword ptr [rax + 0x18], rdx
0000000145e0c0f4 48894820                       mov qword ptr [rax + 0x20], rcx
0000000145e0c0f8 4c895828                       mov qword ptr [rax + 0x28], r11
0000000145e0c0fc 488b8d68010000                 mov rcx, qword ptr [rbp + 0x168]
0000000145e0c103 48894830                       mov qword ptr [rax + 0x30], rcx
0000000145e0c107 4c895038                       mov qword ptr [rax + 0x38], r10
0000000145e0c10b 48895840                       mov qword ptr [rax + 0x40], rbx
0000000145e0c10f 488b8d50010000                 mov rcx, qword ptr [rbp + 0x150]
0000000145e0c116 48894848                       mov qword ptr [rax + 0x48], rcx
0000000145e0c11a 488b8d90010000                 mov rcx, qword ptr [rbp + 0x190]
0000000145e0c121 48894850                       mov qword ptr [rax + 0x50], rcx
0000000145e0c125 4c897058                       mov qword ptr [rax + 0x58], r14
0000000145e0c129 eb5f                           jmp 0x145e0c18a
0000000145e0c12b 488b8560010000                 mov rax, qword ptr [rbp + 0x160]
0000000145e0c132 48c700ffffffff                 mov qword ptr [rax], 0xffffffffffffffff
0000000145e0c139 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145e0c143 4831d1                         xor rcx, rdx
0000000145e0c146 4885d2                         test rdx, rdx
0000000145e0c149 41b80a000000                   mov r8d, 0xa
0000000145e0c14f 4c0f48c1                       cmovs r8, rcx
0000000145e0c153 4983f80a                       cmp r8, 0xa
0000000145e0c157 7731                           ja 0x145e0c18a
0000000145e0c159 488d0d90b28601                 lea rcx, [rip + 0x186b290]
0000000145e0c160 4e630481                       movsxd r8, dword ptr [rcx + r8*4]
0000000145e0c164 4901c8                         add r8, rcx
0000000145e0c167 41ffe0                         jmp r8
0000000145e0c16a 49c1e720                       shl r15, 0x20
0000000145e0c16e 4489e2                         mov edx, r12d
0000000145e0c171 4c09fa                         or rdx, r15
0000000145e0c174 7414                           je 0x145e0c18a
0000000145e0c176 4889c6                         mov rsi, rax
0000000145e0c179 41b801000000                   mov r8d, 1
0000000145e0c17f 4889f9                         mov rcx, rdi
0000000145e0c182 e849601ffa                     call 0x1400021d0
0000000145e0c187 4889f0                         mov rax, rsi
