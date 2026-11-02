0000000145b2e8bd 4889f1                         mov rcx, rsi
0000000145b2e8c0 e8cb0bfeff                     call 0x145b0f490
0000000145b2e8c5 90                             nop
0000000145b2e8c6 4188c7                         mov r15b, al
0000000145b2e8c9 488d8e10110000                 lea rcx, [rsi + 0x1110]
0000000145b2e8d0 0fb695a8020000                 movzx edx, byte ptr [rbp + 0x2a8]
0000000145b2e8d7 4d89e0                         mov r8, r12
0000000145b2e8da 4189c1                         mov r9d, eax
0000000145b2e8dd e88e56f7ff                     call 0x145aa3f70
0000000145b2e8e2 90                             nop
0000000145b2e8e3 84c0                           test al, al
0000000145b2e8e5 0f84f5080000                   je 0x145b2f1e0
0000000145b2e8eb 488d4610                       lea rax, [rsi + 0x10]
0000000145b2e8ef 833802                         cmp dword ptr [rax], 2
0000000145b2e8f2 751a                           jne 0x145b2e90e
0000000145b2e8f4 83be480d000001                 cmp dword ptr [rsi + 0xd48], 1
0000000145b2e8fb 0f87df080000                   ja 0x145b2f1e0
0000000145b2e901 80bec510000000                 cmp byte ptr [rsi + 0x10c5], 0
0000000145b2e908 0f84d2080000                   je 0x145b2f1e0
0000000145b2e90e 488d05b346b301                 lea rax, [rip + 0x1b346b3]
0000000145b2e915 4a8b0ce0                       mov rcx, qword ptr [rax + r12*8]
0000000145b2e919 e82216fdff                     call 0x145afff40
0000000145b2e91e 48899568020000                 mov qword ptr [rbp + 0x268], rdx
0000000145b2e925 4889c7                         mov rdi, rax
