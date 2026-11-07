0000000145b13f6e  488d8d001d0000         lea rcx, [rbp + 0x1d00]
0000000145b13f75  4889f2                 mov rdx, rsi
0000000145b13f78  e843760000             call 0x145b1b5c0
0000000145b13f7d  4c8bb5001d0000         mov r14, qword ptr [rbp + 0x1d00]
0000000145b13f84  488bbd081d0000         mov rdi, qword ptr [rbp + 0x1d08]
0000000145b13f8b  488b85101d0000         mov rax, qword ptr [rbp + 0x1d10]
0000000145b13f92  4885c0                 test rax, rax
0000000145b13f95  746e                   je 0x145b14005
0000000145b13f97  0fb6cb                 movzx ecx, bl
0000000145b13f9a  0fb695c82d0000         movzx edx, byte ptr [rbp + 0x2dc8]
0000000145b13fa1  440badb82d0000         or r13d, dword ptr [rbp + 0x2db8]
0000000145b13fa8  4109d5                 or r13d, edx
0000000145b13fab  4509e7                 or r15d, r12d
0000000145b13fae  4109cf                 or r15d, ecx
0000000145b13fb1  49c1e720               shl r15, 0x20
0000000145b13fb5  4d09ef                 or r15, r13
0000000145b13fb8  486bd838               imul rbx, rax, 0x38
0000000145b13fbc  4531e4                 xor r12d, r12d
0000000145b13fbf  eb22                   jmp 0x145b13fe3
0000000145b13fc1  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b13fd0  4883faff               cmp rdx, -1
0000000145b13fd4  0f85c1000000           jne 0x145b1409b
0000000145b13fda  4983c438               add r12, 0x38
0000000145b13fde  4c39e3                 cmp rbx, r12
0000000145b13fe1  7422                   je 0x145b14005
0000000145b13fe3  4a8b1427               mov rdx, qword ptr [rdi + r12]
0000000145b13fe7  4a8b4c2708             mov rcx, qword ptr [rdi + r12 + 8]
0000000145b13fec  4e397c2718             cmp qword ptr [rdi + r12 + 0x18], r15
0000000145b13ff1  74dd                   je 0x145b13fd0
0000000145b13ff3  4885d2                 test rdx, rdx
0000000145b13ff6  74e2                   je 0x145b13fda
0000000145b13ff8  41b801000000           mov r8d, 1
0000000145b13ffe  e8cde14efa             call 0x1400021d0
0000000145b14003  ebd5                   jmp 0x145b13fda
0000000145b14005  4d85f6                 test r14, r14
0000000145b14008  0f84901c0000           je 0x145b15c9e
0000000145b1400e  496bd638               imul rdx, r14, 0x38
0000000145b14012  41b808000000           mov r8d, 8
0000000145b14018  4889f9                 mov rcx, rdi
0000000145b1401b  0f28b5e02d0000         movaps xmm6, xmmword ptr [rbp + 0x2de0]
0000000145b14022  4881c4782e0000         add rsp, 0x2e78
0000000145b14029  5b                     pop rbx
0000000145b1402a  5f                     pop rdi
0000000145b1402b  5e                     pop rsi
0000000145b1402c  415c                   pop r12
0000000145b1402e  415d                   pop r13
0000000145b14030  415e                   pop r14
0000000145b14032  415f                   pop r15
0000000145b14034  5d                     pop rbp
0000000145b14035  e996e14efa             jmp 0x1400021d0
