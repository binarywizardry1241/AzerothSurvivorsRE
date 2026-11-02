0000000145b924cb 488b85e0040000                 mov rax, qword ptr [rbp + 0x4e0]
0000000145b924d2 488985c00a0000                 mov qword ptr [rbp + 0xac0], rax
0000000145b924d9 0f1085d0040000                 movups xmm0, xmmword ptr [rbp + 0x4d0]
0000000145b924e0 0f2985b00a0000                 movaps xmmword ptr [rbp + 0xab0], xmm0
0000000145b924e7 0fb69de8040000                 movzx ebx, byte ptr [rbp + 0x4e8]
0000000145b924ee 4883bdb00a0000ff               cmp qword ptr [rbp + 0xab0], -1
0000000145b924f6 0f8424030000                   je 0x145b92820
0000000145b924fc 488d8d500b0000                 lea rcx, [rbp + 0xb50]
0000000145b92503 488d95b00a0000                 lea rdx, [rbp + 0xab0]
0000000145b9250a e821dc3200                     call 0x145ec0130
0000000145b9250f 90                             nop 
0000000145b92510 0f1085500b0000                 movups xmm0, xmmword ptr [rbp + 0xb50]
0000000145b92517 0f108d600b0000                 movups xmm1, xmmword ptr [rbp + 0xb60]
0000000145b9251e 488d85d8040000                 lea rax, [rbp + 0x4d8]
0000000145b92525 0f114810                       movups xmmword ptr [rax + 0x10], xmm1
0000000145b92529 0f1100                         movups xmmword ptr [rax], xmm0
0000000145b9252c 48c785d004000001000000         mov qword ptr [rbp + 0x4d0], 1
0000000145b92537 488d8de80a0000                 lea rcx, [rbp + 0xae8]
0000000145b9253e 488d55a8                       lea rdx, [rbp - 0x58]
0000000145b92542 4c8d85d0040000                 lea r8, [rbp + 0x4d0]
0000000145b92549 e8e2f3f5ff                     call 0x145af1930
0000000145b9254e 90                             nop 
0000000145b9254f 0fb685e80a0000                 movzx eax, byte ptr [rbp + 0xae8]
0000000145b92556 83f802                         cmp eax, 2
0000000145b92559 7445                           je 0x145b925a0
0000000145b9255b 3dff000000                     cmp eax, 0xff
0000000145b92560 0f84ba020000                   je 0x145b92820
0000000145b92566 e932070000                     jmp 0x145b92c9d
