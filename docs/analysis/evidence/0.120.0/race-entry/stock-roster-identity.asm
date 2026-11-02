0000000145b1409b  4a8b442730             mov rax, qword ptr [rdi + r12 + 0x30]
0000000145b140a0  488985201d0000         mov qword ptr [rbp + 0x1d20], rax
0000000145b140a7  f3420f6f442710         movdqu xmm0, xmmword ptr [rdi + r12 + 0x10]
0000000145b140ae  420f104c2720           movups xmm1, xmmword ptr [rdi + r12 + 0x20]
0000000145b140b4  0f298d101d0000         movaps xmmword ptr [rbp + 0x1d10], xmm1
0000000145b140bb  660f7f85001d0000       movdqa xmmword ptr [rbp + 0x1d00], xmm0
0000000145b140c3  48898d082d0000         mov qword ptr [rbp + 0x2d08], rcx
0000000145b140ca  48898d482c0000         mov qword ptr [rbp + 0x2c48], rcx
0000000145b140d1  f30f7f85502c0000       movdqu xmmword ptr [rbp + 0x2c50], xmm0
0000000145b140d9  0f118d602c0000         movups xmmword ptr [rbp + 0x2c60], xmm1
0000000145b140e0  488985702c0000         mov qword ptr [rbp + 0x2c70], rax
0000000145b140e7  488995802d0000         mov qword ptr [rbp + 0x2d80], rdx
0000000145b140ee  488995402c0000         mov qword ptr [rbp + 0x2c40], rdx
0000000145b140f5  488d43c8               lea rax, [rbx - 0x38]
0000000145b140f9  4c39e0                 cmp rax, r12
0000000145b140fc  4c8bad882d0000         mov r13, qword ptr [rbp + 0x2d88]
0000000145b14103  744d                   je 0x145b14152
0000000145b14105  4c29e3                 sub rbx, r12
0000000145b14108  4883c3c8               add rbx, -0x38
0000000145b1410c  4e8d3c27               lea r15, [rdi + r12]
0000000145b14110  4983c740               add r15, 0x40
0000000145b14114  48c1eb03               shr rbx, 3
0000000145b14118  48b99324499224499224   movabs rcx, 0x2492492492492493
0000000145b14122  4889d8                 mov rax, rbx
0000000145b14125  48f7e1                 mul rcx
0000000145b14128  4889d3                 mov rbx, rdx
0000000145b1412b  eb0c                   jmp 0x145b14139
0000000145b1412d  0f1f00                 nop dword ptr [rax]
0000000145b14130  4983c738               add r15, 0x38
0000000145b14134  48ffcb                 dec rbx
0000000145b14137  7419                   je 0x145b14152
0000000145b14139  498b57f8               mov rdx, qword ptr [r15 - 8]
0000000145b1413d  4885d2                 test rdx, rdx
0000000145b14140  74ee                   je 0x145b14130
0000000145b14142  498b0f                 mov rcx, qword ptr [r15]
0000000145b14145  41b801000000           mov r8d, 1
0000000145b1414b  e880e04efa             call 0x1400021d0
0000000145b14150  ebde                   jmp 0x145b14130
0000000145b14152  4d85f6                 test r14, r14
0000000145b14155  7412                   je 0x145b14169
0000000145b14157  496bd638               imul rdx, r14, 0x38
0000000145b1415b  41b808000000           mov r8d, 8
0000000145b14161  4889f9                 mov rcx, rdi
0000000145b14164  e867e04efa             call 0x1400021d0
0000000145b14169  488b9618100000         mov rdx, qword ptr [rsi + 0x1018]
0000000145b14170  4939d5                 cmp r13, rdx
0000000145b14173  0f8336360000           jae 0x145b177af
0000000145b14179  488b8e10100000         mov rcx, qword ptr [rsi + 0x1010]
0000000145b14180  4969c5b0000000         imul rax, r13, 0xb0
0000000145b14187  c68401a800000001       mov byte ptr [rcx + rax + 0xa8], 1
0000000145b1418f  4c89e9                 mov rcx, r13
0000000145b14192  4c8bad582c0000         mov r13, qword ptr [rbp + 0x2c58]
0000000145b14199  4c89aec8170000         mov qword ptr [rsi + 0x17c8], r13
