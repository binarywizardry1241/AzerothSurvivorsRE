14595a60b: 8b19 mov ebx, dword ptr [rcx]
14595a60d: f3440f104104 movss xmm8, dword ptr [rcx + 4]
14595a613: f3440f104908 movss xmm9, dword ptr [rcx + 8]
14595a619: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14595a61e: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
14595a623: 31ff xor edi, edi
14595a625: 4889f1 mov rcx, rsi
14595a628: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595a62f: 0f28d6 movaps xmm2, xmm6
14595a632: 4531c9 xor r9d, r9d
14595a635: e8e6ccffff call 0x145957320
14595a63a: 4889f1 mov rcx, rsi
14595a63d: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a644: 4189d8 mov r8d, ebx
14595a647: 0f28de movaps xmm3, xmm6
14595a64a: e8a1d1ffff call 0x1459577f0
14595a64f: 0f57c0 xorps xmm0, xmm0
14595a652: 440f2ec0 ucomiss xmm8, xmm0
14595a656: 0f8620180000 jbe 0x14595be7c
14595a65c: f3440f114d14 movss dword ptr [rbp + 0x14], xmm9
14595a662: bf01000000 mov edi, 1
14595a667: e914180000 jmp 0x14595be80
