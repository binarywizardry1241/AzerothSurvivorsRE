0000000145c15f50 4939dd                         cmp r13, rbx
0000000145c15f53 0f849e010000                   je 0x145c160f7
0000000145c15f59 4881c3e0010000                 add rbx, 0x1e0
0000000145c15f60 4839b8f0000000                 cmp qword ptr [rax + 0xf0], rdi
0000000145c15f67 488d80e0010000                 lea rax, [rax + 0x1e0]
0000000145c15f6e 75e0                           jne 0x145c15f50
0000000145c15f70 418b841cf0feffff               mov eax, dword ptr [r12 + rbx - 0x110]
0000000145c15f78 83f8ff                         cmp eax, -1
0000000145c15f7b 0f8476010000                   je 0x145c160f7
0000000145c15f81 83f803                         cmp eax, 3
0000000145c15f84 0f856d010000                   jne 0x145c160f7
0000000145c15f8a 4983bc1c00ffffff00             cmp qword ptr [r12 + rbx - 0x100], 0
0000000145c15f93 0f855e010000                   jne 0x145c160f7
0000000145c15f99 4c899d28010000                 mov qword ptr [rbp + 0x128], r11
0000000145c15fa0 4585ff                         test r15d, r15d
0000000145c15fa3 0f8409010000                   je 0x145c160b2
0000000145c15fa9 410fb68254030000               movzx eax, byte ptr [r10 + 0x354]
0000000145c15fb1 04fe                           add al, 0xfe
0000000145c15fb3 3c09                           cmp al, 9
0000000145c15fb5 4c89a5c0010000                 mov qword ptr [rbp + 0x1c0], r12
0000000145c15fbc 7710                           ja 0x145c15fce
0000000145c15fbe 0fb6c0                         movzx eax, al
0000000145c15fc1 488d0da8cca701                 lea rcx, [rip + 0x1a7cca8]
0000000145c15fc8 488b0cc1                       mov rcx, qword ptr [rcx + rax*8]
0000000145c15fcc eb07                           jmp 0x145c15fd5
0000000145c15fce 488d0dcba53a01                 lea rcx, [rip + 0x13aa5cb]
0000000145c15fd5 488b4130                       mov rax, qword ptr [rcx + 0x30]
0000000145c15fd9 488b4938                       mov rcx, qword ptr [rcx + 0x38]
0000000145c15fdd 48c1e104                       shl rcx, 4
0000000145c15fe1 4801c1                         add rcx, rax
0000000145c15fe4 48898db8010000                 mov qword ptr [rbp + 0x1b8], rcx
0000000145c15feb 498b8ab8000000                 mov rcx, qword ptr [r10 + 0xb8]
0000000145c15ff2 48898dd8010000                 mov qword ptr [rbp + 0x1d8], rcx
0000000145c15ff9 498b8ac0000000                 mov rcx, qword ptr [r10 + 0xc0]
0000000145c16000 48898d20010000                 mov qword ptr [rbp + 0x120], rcx
0000000145c16007 488d35eaba3a01                 lea rsi, [rip + 0x13abaea]
0000000145c1600e 6690                           nop
0000000145c16010 483b85b8010000                 cmp rax, qword ptr [rbp + 0x1b8]
0000000145c16017 0f8461030000                   je 0x145c1637e
0000000145c1601d 488d7810                       lea rdi, [rax + 0x10]
0000000145c16021 4c8b30                         mov r14, qword ptr [rax]
0000000145c16024 4c8b7808                       mov r15, qword ptr [rax + 8]
0000000145c16028 4c89b538010000                 mov qword ptr [rbp + 0x138], r14
0000000145c1602f 4c89bd40010000                 mov qword ptr [rbp + 0x140], r15
0000000145c16036 4531e4                         xor r12d, r12d
0000000145c16039 eb16                           jmp 0x145c16051
0000000145c1603b 0f1f440000                     nop dword ptr [rax + rax]
0000000145c16040 4983c478                       add r12, 0x78
0000000145c16044 4981fcf8340000                 cmp r12, 0x34f8
0000000145c1604b 0f84783c0000                   je 0x145c19cc9
0000000145c16051 4d397c3408                     cmp qword ptr [r12 + rsi + 8], r15
0000000145c16056 75e8                           jne 0x145c16040
0000000145c16058 498b0c34                       mov rcx, qword ptr [r12 + rsi]
0000000145c1605c 4c89f2                         mov rdx, r14
0000000145c1605f 4d89f8                         mov r8, r15
0000000145c16062 e8c05b3d00                     call 0x145febc27
0000000145c16067 85c0                           test eax, eax
0000000145c16069 75d5                           jne 0x145c16040
0000000145c1606b 448bbd1c010000                 mov r15d, dword ptr [rbp + 0x11c]
0000000145c16072 45397c3440                     cmp dword ptr [r12 + rsi + 0x40], r15d
0000000145c16077 740a                           je 0x145c16083
0000000145c16079 4889f8                         mov rax, rdi
0000000145c1607c 45397c3464                     cmp dword ptr [r12 + rsi + 0x64], r15d
0000000145c16081 758d                           jne 0x145c16010
0000000145c16083 4c01e6                         add rsi, r12
0000000145c16086 4c8b95e8010000                 mov r10, qword ptr [rbp + 0x1e8]
0000000145c1608d 488bbdd0010000                 mov rdi, qword ptr [rbp + 0x1d0]
0000000145c16094 4c8ba5c0010000                 mov r12, qword ptr [rbp + 0x1c0]
