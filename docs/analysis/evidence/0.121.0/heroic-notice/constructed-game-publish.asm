0000000145b25518 488d8dd01c0000                 lea rcx, [rbp + 0x1cd0]
0000000145b2551f 488d95d80d0000                 lea rdx, [rbp + 0xdd8]
0000000145b25526 41b8380d0000                   mov r8d, 0xd38
0000000145b2552c e8ea664c00                     call 0x145febc1b
0000000145b25531 488d4610                       lea rax, [rsi + 0x10]
0000000145b25535 48898578300000                 mov qword ptr [rbp + 0x3078], rax
0000000145b2553c 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145b25540 740a                           je 0x145b2554c
0000000145b25542 488d4e10                       lea rcx, [rsi + 0x10]
0000000145b25546 e8554cfeff                     call 0x145b0a1a0
0000000145b2554b 90                             nop
0000000145b2554c 488d95d01c0000                 lea rdx, [rbp + 0x1cd0]
0000000145b25553 41b8380d0000                   mov r8d, 0xd38
0000000145b25559 4c8d6610                       lea r12, [rsi + 0x10]
0000000145b2555d 4c89e1                         mov rcx, r12
0000000145b25560 e8b6664c00                     call 0x145febc1b
