0000000145ec2788 8b5a01                         mov ebx, dword ptr [rdx + 1]
0000000145ec278b 41b805000000                   mov r8d, 5
0000000145ec2791 4c898598010000                 mov qword ptr [rbp + 0x198], r8
0000000145ec2798 488d4d50                       lea rcx, [rbp + 0x50]
0000000145ec279c 488d9588010000                 lea rdx, [rbp + 0x188]
0000000145ec27a3 e8380f0000                     call 0x145ec36e0
0000000145ec27a8 488b5558                       mov rdx, qword ptr [rbp + 0x58]
0000000145ec27ac 4c8b4560                       mov r8, qword ptr [rbp + 0x60]
0000000145ec27b0 488d8d48010000                 lea rcx, [rbp + 0x148]
0000000145ec27b7 488995a8010000                 mov qword ptr [rbp + 0x1a8], rdx
0000000145ec27be e8cddfffff                     call 0x145ec0790
0000000145ec27c3 90                             nop 
0000000145ec27c4 448bbd48010000                 mov r15d, dword ptr [rbp + 0x148]
0000000145ec27cb 448ba54c010000                 mov r12d, dword ptr [rbp + 0x14c]
0000000145ec27d2 488bbd50010000                 mov rdi, qword ptr [rbp + 0x150]
0000000145ec27d9 488bb558010000                 mov rsi, qword ptr [rbp + 0x158]
0000000145ec27e0 488b5550                       mov rdx, qword ptr [rbp + 0x50]
0000000145ec27e4 4885d2                         test rdx, rdx
0000000145ec27e7 7412                           je 0x145ec27fb
0000000145ec27e9 41b801000000                   mov r8d, 1
0000000145ec27ef 488b8da8010000                 mov rcx, qword ptr [rbp + 0x1a8]
0000000145ec27f6 e8d5f913fa                     call 0x1400021d0
0000000145ec27fb 49be0d00000000000080           movabs r14, 0x800000000000000d
0000000145ec2805 4189da                         mov r10d, ebx
0000000145ec2808 e9ab010000                     jmp 0x145ec29b8
