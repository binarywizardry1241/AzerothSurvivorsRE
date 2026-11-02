0000000145bb4b02 4c8bbd800d0000                 mov r15, qword ptr [rbp + 0xd80]
0000000145bb4b09 f2410f11b7280e0000             movsd qword ptr [r15 + 0xe28], xmm6
0000000145bb4b12 498b8f180e0000                 mov rcx, qword ptr [r15 + 0xe18]
0000000145bb4b19 498b87200e0000                 mov rax, qword ptr [r15 + 0xe20]
0000000145bb4b20 ff5018                         call qword ptr [rax + 0x18]
0000000145bb4b23 4885c0                         test rax, rax
0000000145bb4b26 0f8486030000                   je 0x145bb4eb2
0000000145bb4b2c 498db7c80d0000                 lea rsi, [r15 + 0xdc8]
0000000145bb4b33 488dbda8080000                 lea rdi, [rbp + 0x8a8]
0000000145bb4b3a bb01000000                     mov ebx, 1
0000000145bb4b3f 66450f57c0                     xorpd xmm8, xmm8
0000000145bb4b44 49bc000000000000f0ff           movabs r12, 0xfff0000000000000
0000000145bb4b4e 4c8db550060000                 lea r14, [rbp + 0x650]
