0000000145999200: 0f1000                         movups xmm0, xmmword ptr [rax]
0000000145999203: 0f104810                       movups xmm1, xmmword ptr [rax + 0x10]
0000000145999207: 0f294db0                       movaps xmmword ptr [rbp - 0x50], xmm1
000000014599920b: 0f2945a0                       movaps xmmword ptr [rbp - 0x60], xmm0
000000014599920f: 488d5020                       lea rdx, [rax + 0x20]
0000000145999213: 48899580000000                 mov qword ptr [rbp + 0x80], rdx
000000014599921a: 48895108                       mov qword ptr [rcx + 8], rdx
000000014599921e: 0f1000                         movups xmm0, xmmword ptr [rax]
0000000145999221: 0f104810                       movups xmm1, xmmword ptr [rax + 0x10]
0000000145999225: 0f294d70                       movaps xmmword ptr [rbp + 0x70], xmm1
0000000145999229: 0f294560                       movaps xmmword ptr [rbp + 0x60], xmm0
