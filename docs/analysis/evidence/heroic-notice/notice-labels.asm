0000000145b2e928 4c8d35f946b301                 lea r14, [rip + 0x1b346f9]
0000000145b2e92f bb51000000                     mov ebx, 0x51
0000000145b2e934 ba51000000                     mov edx, 0x51
0000000145b2e939 4c89f1                         mov rcx, r14
0000000145b2e93c e81fc6fbff                     call 0x145aeaf60
0000000145b2e941 90                             nop
0000000145b2e942 4989d5                         mov r13, rdx
0000000145b2e945 4885c0                         test rax, rax
0000000145b2e948 4c0f45f0                       cmovne r14, rax
0000000145b2e94c 4c0f44eb                       cmove r13, rbx
0000000145b2e950 488d8da0000000                 lea rcx, [rbp + 0xa0]
0000000145b2e957 4489fa                         mov edx, r15d
0000000145b2e95a e85117f9ff                     call 0x145ac00b0
0000000145b2e95f 90                             nop
0000000145b2e960 4c89ad58010000                 mov qword ptr [rbp + 0x158], r13
0000000145b2e967 4c89b550010000                 mov qword ptr [rbp + 0x150], r14
0000000145b2e96e 4c89a5b0020000                 mov qword ptr [rbp + 0x2b0], r12
0000000145b2e975 4969c4f0000000                 imul rax, r12, 0xf0
0000000145b2e97c 4c8d35cdf84801                 lea r14, [rip + 0x148f8cd]
0000000145b2e983 4901c6                         add r14, rax
0000000145b2e986 498d4608                       lea rax, [r14 + 8]
0000000145b2e98a 48898560010000                 mov qword ptr [rbp + 0x160], rax
0000000145b2e991 48898588020000                 mov qword ptr [rbp + 0x288], rax
0000000145b2e998 488d0521374dfa                 lea rax, [rip - 0x5b2c8df]
0000000145b2e99f 48898590020000                 mov qword ptr [rbp + 0x290], rax
0000000145b2e9a6 488d15e1384801                 lea rdx, [rip + 0x14838e1]
0000000145b2e9ad 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2e9b4 4c8d8588020000                 lea r8, [rbp + 0x288]
0000000145b2e9bb e8b0ff4800                     call 0x145fbe970
0000000145b2e9c0 90                             nop
0000000145b2e9c1 488b8d78010000                 mov rcx, qword ptr [rbp + 0x178]
0000000145b2e9c8 488b9580010000                 mov rdx, qword ptr [rbp + 0x180]
0000000145b2e9cf 498b5e18                       mov rbx, qword ptr [r14 + 0x18]
0000000145b2e9d3 4d8b6620                       mov r12, qword ptr [r14 + 0x20]
0000000145b2e9d7 48898d60020000                 mov qword ptr [rbp + 0x260], rcx
0000000145b2e9de e87dc5fbff                     call 0x145aeaf60
0000000145b2e9e3 90                             nop
0000000145b2e9e4 4989c6                         mov r14, rax
0000000145b2e9e7 4989d5                         mov r13, rdx
0000000145b2e9ea 488b9570010000                 mov rdx, qword ptr [rbp + 0x170]
0000000145b2e9f1 4885d2                         test rdx, rdx
0000000145b2e9f4 7412                           je 0x145b2ea08
0000000145b2e9f6 41b801000000                   mov r8d, 1
0000000145b2e9fc 488b8d60020000                 mov rcx, qword ptr [rbp + 0x260]
0000000145b2ea03 e8c8374dfa                     call 0x1400021d0
0000000145b2ea08 4d85f6                         test r14, r14
0000000145b2ea0b 48899d60020000                 mov qword ptr [rbp + 0x260], rbx
0000000145b2ea12 4c0f44f3                       cmove r14, rbx
0000000145b2ea16 4d0f44ec                       cmove r13, r12
0000000145b2ea1a 4c89b590000000                 mov qword ptr [rbp + 0x90], r14
0000000145b2ea21 4c89ad98000000                 mov qword ptr [rbp + 0x98], r13
0000000145b2ea28 0fb685a8020000                 movzx eax, byte ptr [rbp + 0x2a8]
0000000145b2ea2f 04fe                           add al, 0xfe
0000000145b2ea31 3c09                           cmp al, 9
0000000145b2ea33 7710                           ja 0x145b2ea45
0000000145b2ea35 0fb6c0                         movzx eax, al
0000000145b2ea38 488d0d0957b301                 lea rcx, [rip + 0x1b35709]
0000000145b2ea3f 488b1cc1                       mov rbx, qword ptr [rcx + rax*8]
0000000145b2ea43 eb07                           jmp 0x145b2ea4c
0000000145b2ea45 488d1d541b4901                 lea rbx, [rip + 0x1491b54]
0000000145b2ea4c 4c89a568010000                 mov qword ptr [rbp + 0x168], r12
0000000145b2ea53 488d4310                       lea rax, [rbx + 0x10]
0000000145b2ea57 48898588020000                 mov qword ptr [rbp + 0x288], rax
0000000145b2ea5e 488d055b364dfa                 lea rax, [rip - 0x5b2c9a5]
0000000145b2ea65 48898590020000                 mov qword ptr [rbp + 0x290], rax
0000000145b2ea6c 488d157d374801                 lea rdx, [rip + 0x148377d]
0000000145b2ea73 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2ea7a 4c8d8588020000                 lea r8, [rbp + 0x288]
0000000145b2ea81 e8eafe4800                     call 0x145fbe970
0000000145b2ea86 90                             nop
0000000145b2ea87 4488bda8020000                 mov byte ptr [rbp + 0x2a8], r15b
0000000145b2ea8e 488b8d78010000                 mov rcx, qword ptr [rbp + 0x178]
0000000145b2ea95 488b9580010000                 mov rdx, qword ptr [rbp + 0x180]
0000000145b2ea9c 4c8b6b20                       mov r13, qword ptr [rbx + 0x20]
0000000145b2eaa0 488b5b28                       mov rbx, qword ptr [rbx + 0x28]
0000000145b2eaa4 48898d38020000                 mov qword ptr [rbp + 0x238], rcx
0000000145b2eaab e8b0c4fbff                     call 0x145aeaf60
0000000145b2eab0 90                             nop
0000000145b2eab1 4989c6                         mov r14, rax
0000000145b2eab4 4989d4                         mov r12, rdx
0000000145b2eab7 488b9570010000                 mov rdx, qword ptr [rbp + 0x170]
0000000145b2eabe 4885d2                         test rdx, rdx
0000000145b2eac1 7412                           je 0x145b2ead5
0000000145b2eac3 41b801000000                   mov r8d, 1
0000000145b2eac9 488b8d38020000                 mov rcx, qword ptr [rbp + 0x238]
0000000145b2ead0 e8fb364dfa                     call 0x1400021d0
0000000145b2ead5 4d85f6                         test r14, r14
0000000145b2ead8 4d0f45ee                       cmovne r13, r14
0000000145b2eadc 4c0f44e3                       cmove r12, rbx
0000000145b2eae0 4c89ad80000000                 mov qword ptr [rbp + 0x80], r13
0000000145b2eae7 4c89a588000000                 mov qword ptr [rbp + 0x88], r12
0000000145b2eaee 4889f9                         mov rcx, rdi
0000000145b2eaf1 488b9568020000                 mov rdx, qword ptr [rbp + 0x268]
0000000145b2eaf8 e863c4fbff                     call 0x145aeaf60
0000000145b2eafd 90                             nop
0000000145b2eafe 0fb68da8020000                 movzx ecx, byte ptr [rbp + 0x2a8]
0000000145b2eb05 4885c0                         test rax, rax
0000000145b2eb08 480f449568020000               cmove rdx, qword ptr [rbp + 0x268]
0000000145b2eb10 480f45f8                       cmovne rdi, rax
0000000145b2eb14 4889bd88020000                 mov qword ptr [rbp + 0x288], rdi
0000000145b2eb1b 48899590020000                 mov qword ptr [rbp + 0x290], rdx
0000000145b2eb22 888da7020000                   mov byte ptr [rbp + 0x2a7], cl
0000000145b2eb28 488d054a45b301                 lea rax, [rip + 0x1b3454a]
0000000145b2eb2f 48898570010000                 mov qword ptr [rbp + 0x170], rax
0000000145b2eb36 48c7857801000006000000         mov qword ptr [rbp + 0x178], 6
0000000145b2eb41 488d85a0000000                 lea rax, [rbp + 0xa0]
0000000145b2eb48 48898580010000                 mov qword ptr [rbp + 0x180], rax
0000000145b2eb4f 4c8d2d4a41b301                 lea r13, [rip + 0x1b3414a]
0000000145b2eb56 4c89ad88010000                 mov qword ptr [rbp + 0x188], r13
0000000145b2eb5d 488d055d42b301                 lea rax, [rip + 0x1b3425d]
0000000145b2eb64 48898590010000                 mov qword ptr [rbp + 0x190], rax
0000000145b2eb6b 48c7859801000004000000         mov qword ptr [rbp + 0x198], 4
0000000145b2eb76 488d8590000000                 lea rax, [rbp + 0x90]
0000000145b2eb7d 488985a0010000                 mov qword ptr [rbp + 0x1a0], rax
0000000145b2eb84 488d050d42b301                 lea rax, [rip + 0x1b3420d]
0000000145b2eb8b 488985a8010000                 mov qword ptr [rbp + 0x1a8], rax
0000000145b2eb92 488d0d2342b301                 lea rcx, [rip + 0x1b34223]
0000000145b2eb99 48898db0010000                 mov qword ptr [rbp + 0x1b0], rcx
0000000145b2eba0 48c785b801000005000000         mov qword ptr [rbp + 0x1b8], 5
0000000145b2ebab 488d8d80000000                 lea rcx, [rbp + 0x80]
0000000145b2ebb2 48898dc0010000                 mov qword ptr [rbp + 0x1c0], rcx
0000000145b2ebb9 488985c8010000                 mov qword ptr [rbp + 0x1c8], rax
0000000145b2ebc0 488d0db844b301                 lea rcx, [rip + 0x1b344b8]
0000000145b2ebc7 48898dd0010000                 mov qword ptr [rbp + 0x1d0], rcx
0000000145b2ebce 48c785d801000003000000         mov qword ptr [rbp + 0x1d8], 3
0000000145b2ebd9 488d8d88020000                 lea rcx, [rbp + 0x288]
0000000145b2ebe0 48898de0010000                 mov qword ptr [rbp + 0x1e0], rcx
0000000145b2ebe7 488985e8010000                 mov qword ptr [rbp + 0x1e8], rax
0000000145b2ebee 488d058d44b301                 lea rax, [rip + 0x1b3448d]
0000000145b2ebf5 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145b2ebfc 48c785f801000005000000         mov qword ptr [rbp + 0x1f8], 5
0000000145b2ec07 488d85a7020000                 lea rax, [rbp + 0x2a7]
0000000145b2ec0e 48898500020000                 mov qword ptr [rbp + 0x200], rax
0000000145b2ec15 488d056442b301                 lea rax, [rip + 0x1b34264]
0000000145b2ec1c 48898508020000                 mov qword ptr [rbp + 0x208], rax
0000000145b2ec23 48c744242005000000             mov qword ptr [rsp + 0x20], 5
0000000145b2ec2c 4c8db570020000                 lea r14, [rbp + 0x270]
0000000145b2ec33 4c8d8d70010000                 lea r9, [rbp + 0x170]
0000000145b2ec3a 4c89f1                         mov rcx, r14
0000000145b2ec3d 488b9550010000                 mov rdx, qword ptr [rbp + 0x150]
0000000145b2ec44 4c8b8558010000                 mov r8, qword ptr [rbp + 0x158]
0000000145b2ec4b e8f0c6fbff                     call 0x145aeb340
0000000145b2ec50 90                             nop
