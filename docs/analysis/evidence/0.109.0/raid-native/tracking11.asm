14595a66c: 8b19 mov ebx, dword ptr [rcx]
14595a66e: 8b7904 mov edi, dword ptr [rcx + 4]
14595a671: f3440f104108 movss xmm8, dword ptr [rcx + 8]
14595a677: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14595a67c: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
14595a681: f3440f104914 movss xmm9, dword ptr [rcx + 0x14]
14595a687: f3440f105918 movss xmm11, dword ptr [rcx + 0x18]
14595a68d: f3440f10511c movss xmm10, dword ptr [rcx + 0x1c]
14595a693: 4889f1 mov rcx, rsi
14595a696: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a69d: 4189d8 mov r8d, ebx
14595a6a0: 0f28df movaps xmm3, xmm7
14595a6a3: e848d1ffff call 0x1459577f0
14595a6a8: 31c0 xor eax, eax
14595a6aa: 0f57c0 xorps xmm0, xmm0
14595a6ad: 440f2ed8 ucomiss xmm11, xmm0
14595a6b1: 7625 jbe 0x14595a6d8
14595a6b3: 410f28c7 movaps xmm0, xmm15
14595a6b7: f30f58c7 addss xmm0, xmm7
14595a6bb: f3410f58c3 addss xmm0, xmm11
14595a6c0: f3450f59d6 mulss xmm10, xmm14
14595a6c5: f30f114500 movss dword ptr [rbp], xmm0
14595a6ca: f3440f115504 movss dword ptr [rbp + 4], xmm10
14595a6d0: 897d08 mov dword ptr [rbp + 8], edi
14595a6d3: b802000000 mov eax, 2
14595a6d8: 8945fc mov dword ptr [rbp - 4], eax
14595a6db: f3440f118514010000 movss dword ptr [rbp + 0x114], xmm8
14595a6e4: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14595a6ee: f3450f59f1 mulss xmm14, xmm9
14595a6f3: 488d45fc lea rax, [rbp - 4]
14595a6f7: 4889442448 mov qword ptr [rsp + 0x48], rax
14595a6fc: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14595a703: 895c2438 mov dword ptr [rsp + 0x38], ebx
14595a707: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
14595a70d: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
14595a714: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14595a71a: c744242800000000 mov dword ptr [rsp + 0x28], 0
14595a722: 4c8d8510010000 lea r8, [rbp + 0x110]
14595a729: 4889f1 mov rcx, rsi
14595a72c: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a733: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
14595a73a: e8a1ceffff call 0x1459575e0
14595a73f: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595a746: 4839d0 cmp rax, rdx
14595a749: 0f83dc240000 jae 0x14595cc2b
14595a74f: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595a756: f30f583d96d24800 addss xmm7, dword ptr [rip + 0x48d296]
14595a75e: 0f28c6 movaps xmm0, xmm6
14595a761: f30f5dc7 minss xmm0, xmm7
14595a765: 0f28c8 movaps xmm1, xmm0
14595a768: f30fc2c803 cmpunordss xmm1, xmm0
14595a76d: 0f28d1 movaps xmm2, xmm1
14595a770: 0f55d0 andnps xmm2, xmm0
14595a773: 0f54ce andps xmm1, xmm6
14595a776: 0f56ca orps xmm1, xmm2
14595a779: 0f57c0 xorps xmm0, xmm0
14595a77c: f30f5fc8 maxss xmm1, xmm0
14595a780: 48c1e007 shl rax, 7
14595a784: f3440f58f9 addss xmm15, xmm1
14595a789: f3440f117c0158 movss dword ptr [rcx + rax + 0x58], xmm15
14595a790: e9e3d1ffff jmp 0x145957978
