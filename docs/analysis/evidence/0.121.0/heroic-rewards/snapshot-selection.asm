0000000145b2ddad 837a1002                       cmp dword ptr [rdx + 0x10], 2
0000000145b2ddb1 0f85a4000000                   jne 0x145b2de5b
0000000145b2ddb7 83ba480d000001                 cmp dword ptr [rdx + 0xd48], 1
0000000145b2ddbe 0f87cd000000                   ja 0x145b2de91
0000000145b2ddc4 4883bac00f0000ff               cmp qword ptr [rdx + 0xfc0], -1
0000000145b2ddcc 0f84bf000000                   je 0x145b2de91
0000000145b2ddd2 4989cc                         mov r12, rcx
0000000145b2ddd5 488d82c00f0000                 lea rax, [rdx + 0xfc0]
0000000145b2dddc f30f10ba58100000               movss xmm7, dword ptr [rdx + 0x1058]
0000000145b2dde4 440f10825c100000               movups xmm8, xmmword ptr [rdx + 0x105c]
0000000145b2ddec f2440f108a6c100000             movsd xmm9, qword ptr [rdx + 0x106c]
0000000145b2ddf5 8bba74100000                   mov edi, dword ptr [rdx + 0x1074]
0000000145b2ddfb f20f10b278100000               movsd xmm6, qword ptr [rdx + 0x1078]
0000000145b2de03 f2440f109280100000             movsd xmm10, qword ptr [rdx + 0x1080]
0000000145b2de0c 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145b2de10 4989d5                         mov r13, rdx
0000000145b2de13 4889c2                         mov rdx, rax
0000000145b2de16 e815104900                     call 0x145fbee30
0000000145b2de1b 4d8bbde80f0000                 mov r15, qword ptr [r13 + 0xfe8]
0000000145b2de22 4a8d34fd00000000               lea rsi, [r15*8]
0000000145b2de2a 4c89f9                         mov rcx, r15
0000000145b2de2d 48c1e93d                       shr rcx, 0x3d
0000000145b2de31 0f95c1                         setne cl
0000000145b2de34 48bafcffffffffffff7f           movabs rdx, 0x7ffffffffffffffc
0000000145b2de3e 4839d6                         cmp rsi, rdx
0000000145b2de41 0f97c2                         seta dl
0000000145b2de44 08ca                           or dl, cl
0000000145b2de46 747e                           je 0x145b2dec6
0000000145b2de48 31db                           xor ebx, ebx
0000000145b2de4a 4889d9                         mov rcx, rbx
0000000145b2de4d 4889f2                         mov rdx, rsi
0000000145b2de50 e866626600                     call 0x1461940bb
0000000145b2de55 90                             nop
0000000145b2de56 e971020000                     jmp 0x145b2e0cc
0000000145b2de5b 4883c210                       add rdx, 0x10
0000000145b2de5f 0f287540                       movaps xmm6, xmmword ptr [rbp + 0x40]
0000000145b2de63 0f287d50                       movaps xmm7, xmmword ptr [rbp + 0x50]
0000000145b2de67 440f284560                     movaps xmm8, xmmword ptr [rbp + 0x60]
0000000145b2de6c 440f284d70                     movaps xmm9, xmmword ptr [rbp + 0x70]
0000000145b2de71 440f289580000000               movaps xmm10, xmmword ptr [rbp + 0x80]
0000000145b2de79 4881c418010000                 add rsp, 0x118
0000000145b2de80 5b                             pop rbx
0000000145b2de81 5f                             pop rdi
0000000145b2de82 5e                             pop rsi
0000000145b2de83 415c                           pop r12
0000000145b2de85 415d                           pop r13
0000000145b2de87 415e                           pop r14
0000000145b2de89 415f                           pop r15
0000000145b2de8b 5d                             pop rbp
0000000145b2de8c e93fd0fcff                     jmp 0x145afaed0
