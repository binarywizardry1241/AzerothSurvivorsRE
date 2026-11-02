0000000145b92444 4c89a5a80b0000                 mov qword ptr [rbp + 0xba8], r12
0000000145b9244b 488d85780b0000                 lea rax, [rbp + 0xb78]
0000000145b92452 0f1000                         movups xmm0, xmmword ptr [rax]
0000000145b92455 0f104810                       movups xmm1, xmmword ptr [rax + 0x10]
0000000145b92459 0f298d300b0000                 movaps xmmword ptr [rbp + 0xb30], xmm1
0000000145b92460 0f2985200b0000                 movaps xmmword ptr [rbp + 0xb20], xmm0
0000000145b92467 e8948e4700                     call 0x14600b300
0000000145b9246c 90                             nop 
0000000145b9246d 488985080b0000                 mov qword ptr [rbp + 0xb08], rax
0000000145b92474 8995100b0000                   mov dword ptr [rbp + 0xb10], edx
0000000145b9247a 488bb5280b0000                 mov rsi, qword ptr [rbp + 0xb28]
0000000145b92481 4c8ba5300b0000                 mov r12, qword ptr [rbp + 0xb30]
0000000145b92488 488d8dd00a0000                 lea rcx, [rbp + 0xad0]
0000000145b9248f e8bc8f4700                     call 0x14600b450
0000000145b92494 90                             nop 
0000000145b92495 4869c040420f00                 imul rax, rax, 0xf4240
0000000145b9249c 89d1                           mov ecx, edx
0000000145b9249e 4869c9d34d6210                 imul rcx, rcx, 0x10624dd3
0000000145b924a5 48c1e926                       shr rcx, 0x26
0000000145b924a9 4801c1                         add rcx, rax
0000000145b924ac 48894c2420                     mov qword ptr [rsp + 0x20], rcx
0000000145b924b1 488d8dd0040000                 lea rcx, [rbp + 0x4d0]
0000000145b924b8 488b95400c0000                 mov rdx, qword ptr [rbp + 0xc40]
0000000145b924bf 4989f0                         mov r8, rsi
0000000145b924c2 4d89e1                         mov r9, r12
0000000145b924c5 e886c10000                     call 0x145b9e650
