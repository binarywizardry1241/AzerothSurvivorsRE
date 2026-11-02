1400ed910: 55 push rbp
1400ed911: 4157 push r15
1400ed913: 4156 push r14
1400ed915: 4155 push r13
1400ed917: 4154 push r12
1400ed919: 56 push rsi
1400ed91a: 57 push rdi
1400ed91b: 53 push rbx
1400ed91c: 4881ecb8040000 sub rsp, 0x4b8
1400ed923: 488dac2480000000 lea rbp, [rsp + 0x80]
1400ed92b: 440f29bd20040000 movaps xmmword ptr [rbp + 0x420], xmm15
1400ed933: 440f29b510040000 movaps xmmword ptr [rbp + 0x410], xmm14
1400ed93b: 440f29ad00040000 movaps xmmword ptr [rbp + 0x400], xmm13
1400ed943: 440f29a5f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm12
1400ed94b: 440f299de0030000 movaps xmmword ptr [rbp + 0x3e0], xmm11
1400ed953: 440f2995d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm10
1400ed95b: 440f298dc0030000 movaps xmmword ptr [rbp + 0x3c0], xmm9
1400ed963: 440f2985b0030000 movaps xmmword ptr [rbp + 0x3b0], xmm8
1400ed96b: 0f29bda0030000 movaps xmmword ptr [rbp + 0x3a0], xmm7
1400ed972: 0f29b590030000 movaps xmmword ptr [rbp + 0x390], xmm6
1400ed979: 48c78588030000feffffff mov qword ptr [rbp + 0x388], 0xfffffffffffffffe
1400ed984: 44888d86030000 mov byte ptr [rbp + 0x386], r9b
1400ed98b: 44888587030000 mov byte ptr [rbp + 0x387], r8b
1400ed992: 4989d6 mov r14, rdx
1400ed995: 48898d20030000 mov qword ptr [rbp + 0x320], rcx
1400ed99c: f30f10bda8040000 movss xmm7, dword ptr [rbp + 0x4a8]
1400ed9a4: 488b85a0040000 mov rax, qword ptr [rbp + 0x4a0]
1400ed9ab: 48c7853803000000000000 mov qword ptr [rbp + 0x338], 0
1400ed9b6: 48c7854003000004000000 mov qword ptr [rbp + 0x340], 4
1400ed9c1: 48c7854803000000000000 mov qword ptr [rbp + 0x348], 0
1400ed9cc: 48c7421000000000 mov qword ptr [rdx + 0x10], 0
1400ed9d4: 440f2805f44acb05 movaps xmm8, xmmword ptr [rip + 0x5cb4af4]
1400ed9dc: 0f28c7 movaps xmm0, xmm7
1400ed9df: 410f57c0 xorps xmm0, xmm8
1400ed9e3: f30f100d3986cb05 movss xmm1, dword ptr [rip + 0x5cb8639]
1400ed9eb: f30f59cf mulss xmm1, xmm7
1400ed9ef: f30f580d419eca05 addss xmm1, dword ptr [rip + 0x5ca9e41]
1400ed9f7: f30f105008 movss xmm2, dword ptr [rax + 8]
1400ed9fc: f20f1030 movsd xmm6, qword ptr [rax]
1400eda00: f3440f16fe movshdup xmm15, xmm6
1400eda05: 410f28df movaps xmm3, xmm15
1400eda09: 410f57d8 xorps xmm3, xmm8
1400eda0d: 0f28e6 movaps xmm4, xmm6
1400eda10: 410f57e0 xorps xmm4, xmm8
1400eda14: 0f28e9 movaps xmm5, xmm1
1400eda17: 410f57e8 xorps xmm5, xmm8
1400eda1b: f30f119df4020000 movss dword ptr [rbp + 0x2f4], xmm3
1400eda23: f30f1195f8020000 movss dword ptr [rbp + 0x2f8], xmm2
1400eda2b: f30f11a5fc020000 movss dword ptr [rbp + 0x2fc], xmm4
1400eda33: f20f1015a52dce05 movsd xmm2, qword ptr [rip + 0x5ce2da5]
1400eda3b: f20f119500030000 movsd qword ptr [rbp + 0x300], xmm2
1400eda43: f30f118508030000 movss dword ptr [rbp + 0x308], xmm0
1400eda4b: f30f11bd0c030000 movss dword ptr [rbp + 0x30c], xmm7
1400eda53: f30f118510030000 movss dword ptr [rbp + 0x310], xmm0
1400eda5b: f30f11bd14030000 movss dword ptr [rbp + 0x314], xmm7
1400eda63: f30f11ad18030000 movss dword ptr [rbp + 0x318], xmm5
1400eda6b: f30f118d1c030000 movss dword ptr [rbp + 0x31c], xmm1
1400eda73: 488b7218 mov rsi, qword ptr [rdx + 0x18]
1400eda77: 488d8ddc020000 lea rcx, [rbp + 0x2dc]
1400eda7e: 488d95f4020000 lea rdx, [rbp + 0x2f4]
1400eda85: e846b44f01 call 0x1415e8ed0
1400eda8a: 90 nop
1400eda8b: 440f28c7 movaps xmm8, xmm7
1400eda8f: f3440f58c7 addss xmm8, xmm7
1400eda94: 48c7855803000000000000 mov qword ptr [rbp + 0x358], 0
1400eda9f: 0f57c0 xorps xmm0, xmm0
1400edaa2: 410f2ec0 ucomiss xmm0, xmm8
1400edaa6: 0f8380060000 jae 0x1400ee12c
1400edaac: 488b0e mov rcx, qword ptr [rsi]
1400edaaf: 488b4608 mov rax, qword ptr [rsi + 8]
1400edab3: 48898568030000 mov qword ptr [rbp + 0x368], rax
1400edaba: 488b91f8000000 mov rdx, qword ptr [rcx + 0xf8]
1400edac1: 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400edac8: 48899560030000 mov qword ptr [rbp + 0x360], rdx
1400edacf: 488d0482 lea rax, [rdx + rax*4]
1400edad3: 48898550030000 mov qword ptr [rbp + 0x350], rax
1400edada: 48898d30030000 mov qword ptr [rbp + 0x330], rcx
1400edae1: 0fb68108010000 movzx eax, byte ptr [rcx + 0x108]
1400edae8: 888585030000 mov byte ptr [rbp + 0x385], al
1400edaee: b808000000 mov eax, 8
1400edaf3: 48898528030000 mov qword ptr [rbp + 0x328], rax
1400edafa: f3440f100ded2cce05 movss xmm9, dword ptr [rip + 0x5ce2ced]
1400edb03: 440f2815f59aca05 movaps xmm10, xmmword ptr [rip + 0x5ca9af5]
1400edb0b: 48c7857803000000000000 mov qword ptr [rbp + 0x378], 0
1400edb16: c7858003000000000000 mov dword ptr [rbp + 0x380], 0
1400edb20: 80bd8503000000 cmp byte ptr [rbp + 0x385], 0
1400edb27: 0f84a3000000 je 0x1400edbd0
1400edb2d: 4c8b8558030000 mov r8, qword ptr [rbp + 0x358]
1400edb34: 8b8580030000 mov eax, dword ptr [rbp + 0x380]
1400edb3a: 4439c0 cmp eax, r8d
1400edb3d: 4c8b8d60030000 mov r9, qword ptr [rbp + 0x360]
1400edb44: 0f8545010000 jne 0x1400edc8f
1400edb4a: 660f1f440000 nop word ptr [rax + rax]
1400edb50: 4c3b8d50030000 cmp r9, qword ptr [rbp + 0x350]
1400edb57: 0f84d3050000 je 0x1400ee130
1400edb5d: 418b09 mov ecx, dword ptr [r9]
1400edb60: 4983c104 add r9, 4
1400edb64: 488b8568030000 mov rax, qword ptr [rbp + 0x368]
1400edb6b: 488b80a8010000 mov rax, qword ptr [rax + 0x1a8]
1400edb72: 488d0cc9 lea rcx, [rcx + rcx*8]
1400edb76: 4c8b44c810 mov r8, qword ptr [rax + rcx*8 + 0x10]
1400edb7b: 4d85c0 test r8, r8
1400edb7e: 74d0 je 0x1400edb50
1400edb80: 488d04c8 lea rax, [rax + rcx*8]
1400edb84: 488b8d30030000 mov rcx, qword ptr [rbp + 0x330]
1400edb8b: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400edb92: 483b4840 cmp rcx, qword ptr [rax + 0x40]
1400edb96: 0f83e6000000 jae 0x1400edc82
1400edb9c: 488b5038 mov rdx, qword ptr [rax + 0x38]
1400edba0: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
1400edba4: 4885c9 test rcx, rcx
1400edba7: 0f84d5000000 je 0x1400edc82
1400edbad: 488b4018 mov rax, qword ptr [rax + 0x18]
1400edbb1: 48f7d1 not rcx
1400edbb4: 488d0c49 lea rcx, [rcx + rcx*2]
1400edbb8: 48c1e104 shl rcx, 4
1400edbbc: 488b440810 mov rax, qword ptr [rax + rcx + 0x10]
1400edbc1: 48898578030000 mov qword ptr [rbp + 0x378], rax
1400edbc8: e9c0000000 jmp 0x1400edc8d
1400edbcd: 0f1f00 nop dword ptr [rax]
1400edbd0: 4c8b8d58030000 mov r9, qword ptr [rbp + 0x358]
1400edbd7: 8b8580030000 mov eax, dword ptr [rbp + 0x380]
1400edbdd: 4439c8 cmp eax, r9d
1400edbe0: 4c8b9560030000 mov r10, qword ptr [rbp + 0x360]
1400edbe7: 0f85d2000000 jne 0x1400edcbf
1400edbed: 0f1f00 nop dword ptr [rax]
1400edbf0: 4c3b9550030000 cmp r10, qword ptr [rbp + 0x350]
1400edbf7: 0f8433050000 je 0x1400ee130
1400edbfd: 418b0a mov ecx, dword ptr [r10]
1400edc00: 4983c204 add r10, 4
1400edc04: 488b8568030000 mov rax, qword ptr [rbp + 0x368]
1400edc0b: 488b8008010000 mov rax, qword ptr [rax + 0x108]
1400edc12: 488d0c89 lea rcx, [rcx + rcx*4]
1400edc16: 48c1e105 shl rcx, 5
1400edc1a: 4c8b4c0858 mov r9, qword ptr [rax + rcx + 0x58]
1400edc1f: 4d85c9 test r9, r9
1400edc22: 74cc je 0x1400edbf0
1400edc24: 4801c8 add rax, rcx
1400edc27: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400edc2d: 488b9568030000 mov rdx, qword ptr [rbp + 0x368]
1400edc34: 488b92a8010000 mov rdx, qword ptr [rdx + 0x1a8]
1400edc3b: 4c8d04c9 lea r8, [rcx + rcx*8]
1400edc3f: 488b8d30030000 mov rcx, qword ptr [rbp + 0x330]
1400edc46: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400edc4d: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
1400edc52: 7353 jae 0x1400edca7
1400edc54: 4a8d14c2 lea rdx, [rdx + r8*8]
1400edc58: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
1400edc5c: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
1400edc60: 4885c9 test rcx, rcx
1400edc63: 7442 je 0x1400edca7
1400edc65: 488b5218 mov rdx, qword ptr [rdx + 0x18]
1400edc69: 48f7d1 not rcx
1400edc6c: 488d0c49 lea rcx, [rcx + rcx*2]
1400edc70: 48c1e104 shl rcx, 4
1400edc74: 488b4c0a10 mov rcx, qword ptr [rdx + rcx + 0x10]
1400edc79: 48898d78030000 mov qword ptr [rbp + 0x378], rcx
1400edc80: eb30 jmp 0x1400edcb2
1400edc82: 48c7857803000000000000 mov qword ptr [rbp + 0x378], 0
1400edc8d: 31c0 xor eax, eax
1400edc8f: 4c898d60030000 mov qword ptr [rbp + 0x360], r9
1400edc96: 4c898558030000 mov qword ptr [rbp + 0x358], r8
1400edc9d: 898580030000 mov dword ptr [rbp + 0x380], eax
1400edca3: 89c0 mov eax, eax
1400edca5: eb3f jmp 0x1400edce6
1400edca7: 48c7857803000000000000 mov qword ptr [rbp + 0x378], 0
1400edcb2: 488b4050 mov rax, qword ptr [rax + 0x50]
1400edcb6: 48898528030000 mov qword ptr [rbp + 0x328], rax
1400edcbd: 31c0 xor eax, eax
1400edcbf: 4c899560030000 mov qword ptr [rbp + 0x360], r10
1400edcc6: 4c898d58030000 mov qword ptr [rbp + 0x358], r9
1400edccd: 898580030000 mov dword ptr [rbp + 0x380], eax
1400edcd3: 89c0 mov eax, eax
1400edcd5: 48c1e004 shl rax, 4
1400edcd9: 488b8d28030000 mov rcx, qword ptr [rbp + 0x328]
1400edce0: 8b440108 mov eax, dword ptr [rcx + rax + 8]
1400edce4: f7d0 not eax
1400edce6: 488d0440 lea rax, [rax + rax*2]
1400edcea: 48c1e004 shl rax, 4
1400edcee: 48038578030000 add rax, qword ptr [rbp + 0x378]
1400edcf5: 488b08 mov rcx, qword ptr [rax]
1400edcf8: 488b5008 mov rdx, qword ptr [rax + 8]
1400edcfc: 488b4210 mov rax, qword ptr [rdx + 0x10]
1400edd00: 48ffc8 dec rax
1400edd03: 4883e0f0 and rax, 0xfffffffffffffff0
1400edd07: 4801c1 add rcx, rax
1400edd0a: 4883c110 add rcx, 0x10
1400edd0e: e8ad540d02 call 0x1421c31c0
1400edd13: 90 nop
1400edd14: ff8580030000 inc dword ptr [rbp + 0x380]
1400edd1a: 4885c0 test rax, rax
1400edd1d: 0f84fdfdffff je 0x1400edb20
1400edd23: 488d8d50010000 lea rcx, [rbp + 0x150]
1400edd2a: 4889c2 mov rdx, rax
1400edd2d: 48898570030000 mov qword ptr [rbp + 0x370], rax
1400edd34: e877ac0d02 call 0x1421c89b0
1400edd39: 90 nop
1400edd3a: 0f1085e0020000 movups xmm0, xmmword ptr [rbp + 0x2e0]
1400edd41: 0f28c8 movaps xmm1, xmm0
1400edd44: 0f128d60010000 movlps xmm1, qword ptr [rbp + 0x160]
1400edd4b: 660f148550010000 unpcklpd xmm0, xmmword ptr [rbp + 0x150]
1400edd53: 0fc2c106 cmpnleps xmm0, xmm1
1400edd57: 0f50c0 movmskps eax, xmm0
1400edd5a: 85c0 test eax, eax
1400edd5c: 488b9570030000 mov rdx, qword ptr [rbp + 0x370]
1400edd63: 0f85b7fdffff jne 0x1400edb20
1400edd69: f30f10855c010000 movss xmm0, dword ptr [rbp + 0x15c]
1400edd71: 0f2e85dc020000 ucomiss xmm0, dword ptr [rbp + 0x2dc]
1400edd78: 0f82a2fdffff jb 0x1400edb20
1400edd7e: f30f1085f0020000 movss xmm0, dword ptr [rbp + 0x2f0]
1400edd86: 0f2e8558010000 ucomiss xmm0, dword ptr [rbp + 0x158]
1400edd8d: 0f828dfdffff jb 0x1400edb20
1400edd93: 488d4db8 lea rcx, [rbp - 0x48]
1400edd97: 4c8d85dc020000 lea r8, [rbp + 0x2dc]
1400edd9e: e8addf0e02 call 0x1421dbd50
1400edda3: 90 nop
1400edda4: 41b820010000 mov r8d, 0x120
1400eddaa: 488d8d50010000 lea rcx, [rbp + 0x150]
1400eddb1: 488d55b8 lea rdx, [rbp - 0x48]
1400eddb5: e8814bb005 call 0x145bf293b
1400eddba: 90 nop
1400eddbb: 0f1f440000 nop dword ptr [rax + rax]
1400eddc0: 488d8d50010000 lea rcx, [rbp + 0x150]
1400eddc7: e824ea0200 call 0x14011c7f0
1400eddcc: 90 nop
1400eddcd: 83f801 cmp eax, 1
1400eddd0: 0f852a030000 jne 0x1400ee100
1400eddd6: 89d1 mov ecx, edx
1400eddd8: 488b8570030000 mov rax, qword ptr [rbp + 0x370]
1400edddf: 488b9080000000 mov rdx, qword ptr [rax + 0x80]
1400edde6: 4839ca cmp rdx, rcx
1400edde9: 0f86d4090000 jbe 0x1400ee7c3
1400eddef: 488b5068 mov rdx, qword ptr [rax + 0x68]
1400eddf3: 4c8b4078 mov r8, qword ptr [rax + 0x78]
1400eddf7: 4c8d0c49 lea r9, [rcx + rcx*2]
1400eddfb: 438b0c88 mov ecx, dword ptr [r8 + r9*4]
1400eddff: 4839ca cmp rdx, rcx
1400ede02: 0f869a090000 jbe 0x1400ee7a2
1400ede08: 4b8d0488 lea rax, [r8 + r9*4]
1400ede0c: 8b4004 mov eax, dword ptr [rax + 4]
1400ede0f: 4839c2 cmp rdx, rax
1400ede12: 0f86ba090000 jbe 0x1400ee7d2
1400ede18: 478b4c8808 mov r9d, dword ptr [r8 + r9*4 + 8]
1400ede1d: 4c39ca cmp rdx, r9
1400ede20: 0f868b090000 jbe 0x1400ee7b1
1400ede26: 488b9570030000 mov rdx, qword ptr [rbp + 0x370]
1400ede2d: 488b5260 mov rdx, qword ptr [rdx + 0x60]
1400ede31: 488d0440 lea rax, [rax + rax*2]
1400ede35: 488d0c49 lea rcx, [rcx + rcx*2]
1400ede39: 4f8d0449 lea r8, [r9 + r9*2]
1400ede3d: 448b4c8a08 mov r9d, dword ptr [rdx + rcx*4 + 8]
1400ede42: 44898d78020000 mov dword ptr [rbp + 0x278], r9d
1400ede49: 488b0c8a mov rcx, qword ptr [rdx + rcx*4]
1400ede4d: 48898d70020000 mov qword ptr [rbp + 0x270], rcx
1400ede54: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
1400ede58: 4c8d8d7c020000 lea r9, [rbp + 0x27c]
1400ede5f: 41894908 mov dword ptr [r9 + 8], ecx
1400ede63: 488b0482 mov rax, qword ptr [rdx + rax*4]
1400ede67: 498901 mov qword ptr [r9], rax
1400ede6a: 428b448208 mov eax, dword ptr [rdx + r8*4 + 8]
1400ede6f: 41894114 mov dword ptr [r9 + 0x14], eax
1400ede73: 4a8b0482 mov rax, qword ptr [rdx + r8*4]
1400ede77: 4989410c mov qword ptr [r9 + 0xc], rax
1400ede7b: 488d8dd8000000 lea rcx, [rbp + 0xd8]
1400ede82: 488d9570020000 lea rdx, [rbp + 0x270]
1400ede89: 4c8d85f4020000 lea r8, [rbp + 0x2f4]
1400ede90: e83bbb4f01 call 0x1415e99d0
1400ede95: 90 nop
1400ede96: 0f108534010000 movups xmm0, xmmword ptr [rbp + 0x134]
1400ede9d: 0f1185cc020000 movups xmmword ptr [rbp + 0x2cc], xmm0
1400edea4: 0f108528010000 movups xmm0, xmmword ptr [rbp + 0x128]
1400edeab: 0f2985c0020000 movaps xmmword ptr [rbp + 0x2c0], xmm0
1400edeb2: 0f108518010000 movups xmm0, xmmword ptr [rbp + 0x118]
1400edeb9: 0f2985b0020000 movaps xmmword ptr [rbp + 0x2b0], xmm0
1400edec0: 0f1085d8000000 movups xmm0, xmmword ptr [rbp + 0xd8]
1400edec7: 0f108de8000000 movups xmm1, xmmword ptr [rbp + 0xe8]
1400edece: 0f1095f8000000 movups xmm2, xmmword ptr [rbp + 0xf8]
1400eded5: 0f109d08010000 movups xmm3, xmmword ptr [rbp + 0x108]
1400ededc: 0f299da0020000 movaps xmmword ptr [rbp + 0x2a0], xmm3
1400edee3: 0f299590020000 movaps xmmword ptr [rbp + 0x290], xmm2
1400edeea: 0f298d80020000 movaps xmmword ptr [rbp + 0x280], xmm1
1400edef1: 0f298570020000 movaps xmmword ptr [rbp + 0x270], xmm0
1400edef8: 4c8ba548010000 mov r12, qword ptr [rbp + 0x148]
1400edeff: 4983fc03 cmp r12, 3
1400edf03: 0f82b7feffff jb 0x1400eddc0
1400edf09: 49ffcc dec r12
1400edf0c: f2440f109d70020000 movsd xmm11, qword ptr [rbp + 0x270]
1400edf15: f3440f10a578020000 movss xmm12, dword ptr [rbp + 0x278]
1400edf1e: 410f28c7 movaps xmm0, xmm15
1400edf22: f3410f58c3 addss xmm0, xmm11
1400edf27: 0f28ce movaps xmm1, xmm6
1400edf2a: f3410f58cc addss xmm1, xmm12
1400edf2f: 0f28d0 movaps xmm2, xmm0
1400edf32: f3410f59d1 mulss xmm2, xmm9
1400edf37: f30f5cd1 subss xmm2, xmm1
1400edf3b: f3410f59c9 mulss xmm1, xmm9
1400edf40: f30f58c8 addss xmm1, xmm0
1400edf44: f30f58d7 addss xmm2, xmm7
1400edf48: f3410f5ed0 divss xmm2, xmm8
1400edf4d: f30f58cf addss xmm1, xmm7
1400edf51: f3410f5ec8 divss xmm1, xmm8
1400edf56: 660f7ed3 movd ebx, xmm2
1400edf5a: 660f7ec8 movd eax, xmm1
1400edf5e: 48c1e020 shl rax, 0x20
1400edf62: 4809c3 or rbx, rax
1400edf65: 41bd01000000 mov r13d, 1
1400edf6b: eb74 jmp 0x1400edfe1
1400edf6d: 0f1f00 nop dword ptr [rax]
1400edf70: 410f28c7 movaps xmm0, xmm15
1400edf74: f3410f58c5 addss xmm0, xmm13
1400edf79: 0f28ce movaps xmm1, xmm6
1400edf7c: f3410f58ce addss xmm1, xmm14
1400edf81: 0f28d0 movaps xmm2, xmm0
1400edf84: f3410f59d1 mulss xmm2, xmm9
1400edf89: f30f5cd1 subss xmm2, xmm1
1400edf8d: f3410f59c9 mulss xmm1, xmm9
1400edf92: f30f58c8 addss xmm1, xmm0
1400edf96: f30f58d7 addss xmm2, xmm7
1400edf9a: f3410f5ed0 divss xmm2, xmm8
1400edf9f: f30f58cf addss xmm1, xmm7
1400edfa3: f3410f5ec8 divss xmm1, xmm8
1400edfa8: 660f7ed0 movd eax, xmm2
1400edfac: 660f7ec9 movd ecx, xmm1
1400edfb0: 48c1e120 shl rcx, 0x20
1400edfb4: 4809c8 or rax, rcx
1400edfb7: 498b4e08 mov rcx, qword ptr [r14 + 8]
1400edfbb: 488d14ff lea rdx, [rdi + rdi*8]
1400edfbf: 440f132c91 movlps qword ptr [rcx + rdx*4], xmm13
1400edfc4: f3440f11749108 movss dword ptr [rcx + rdx*4 + 8], xmm14
1400edfcb: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
1400edfd0: 440f11549114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm10
1400edfd6: 4983c703 add r15, 3
1400edfda: 4d897e10 mov qword ptr [r14 + 0x10], r15
1400edfde: 4989f5 mov r13, rsi
1400edfe1: 4d39e5 cmp r13, r12
1400edfe4: 0f83d6fdffff jae 0x1400eddc0
1400edfea: 4d8b7e10 mov r15, qword ptr [r14 + 0x10]
1400edfee: 4d3b3e cmp r15, qword ptr [r14]
1400edff1: 7509 jne 0x1400edffc
1400edff3: 4c89f1 mov rcx, r14
1400edff6: e82531b505 call 0x145c41120
1400edffb: 90 nop
1400edffc: 498b4608 mov rax, qword ptr [r14 + 8]
1400ee000: 4b8d0cff lea rcx, [r15 + r15*8]
1400ee004: 440f131c88 movlps qword ptr [rax + rcx*4], xmm11
1400ee009: f3440f11648808 movss dword ptr [rax + rcx*4 + 8], xmm12
1400ee010: 48895c880c mov qword ptr [rax + rcx*4 + 0xc], rbx
1400ee015: 440f11548814 movups xmmword ptr [rax + rcx*4 + 0x14], xmm10
1400ee01b: 498d7f01 lea rdi, [r15 + 1]
1400ee01f: 49897e10 mov qword ptr [r14 + 0x10], rdi
1400ee023: 4a8d046d00000000 lea rax, [r13*2]
1400ee02b: 4c01e8 add rax, r13
1400ee02e: f2440f10ac8570020000 movsd xmm13, qword ptr [rbp + rax*4 + 0x270]
1400ee038: f3440f10b48578020000 movss xmm14, dword ptr [rbp + rax*4 + 0x278]
1400ee042: 493b3e cmp rdi, qword ptr [r14]
1400ee045: 7509 jne 0x1400ee050
1400ee047: 4c89f1 mov rcx, r14
1400ee04a: e8d130b505 call 0x145c41120
1400ee04f: 90 nop
1400ee050: 498d7501 lea rsi, [r13 + 1]
1400ee054: 410f28c7 movaps xmm0, xmm15
1400ee058: f3410f58c5 addss xmm0, xmm13
1400ee05d: 0f28ce movaps xmm1, xmm6
1400ee060: f3410f58ce addss xmm1, xmm14
1400ee065: 0f28d0 movaps xmm2, xmm0
1400ee068: f3410f59d1 mulss xmm2, xmm9
1400ee06d: f30f5cd1 subss xmm2, xmm1
1400ee071: f3410f59c9 mulss xmm1, xmm9
1400ee076: f30f58c8 addss xmm1, xmm0
1400ee07a: f30f58d7 addss xmm2, xmm7
1400ee07e: f3410f5ed0 divss xmm2, xmm8
1400ee083: f30f58cf addss xmm1, xmm7
1400ee087: f3410f5ec8 divss xmm1, xmm8
1400ee08c: 660f7ed0 movd eax, xmm2
1400ee090: 660f7ec9 movd ecx, xmm1
1400ee094: 48c1e120 shl rcx, 0x20
1400ee098: 4809c8 or rax, rcx
1400ee09b: 498b4e08 mov rcx, qword ptr [r14 + 8]
1400ee09f: 488d14ff lea rdx, [rdi + rdi*8]
1400ee0a3: 440f132c91 movlps qword ptr [rcx + rdx*4], xmm13
1400ee0a8: f3440f11749108 movss dword ptr [rcx + rdx*4 + 8], xmm14
1400ee0af: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
1400ee0b4: 440f11549114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm10
1400ee0ba: 498d7f02 lea rdi, [r15 + 2]
1400ee0be: 49897e10 mov qword ptr [r14 + 0x10], rdi
1400ee0c2: 4983fd08 cmp r13, 8
1400ee0c6: 0f84bf060000 je 0x1400ee78b
1400ee0cc: 488d0476 lea rax, [rsi + rsi*2]
1400ee0d0: f2440f10ac8570020000 movsd xmm13, qword ptr [rbp + rax*4 + 0x270]
1400ee0da: f3440f10b48578020000 movss xmm14, dword ptr [rbp + rax*4 + 0x278]
1400ee0e4: 493b3e cmp rdi, qword ptr [r14]
1400ee0e7: 0f8583feffff jne 0x1400edf70
1400ee0ed: 4c89f1 mov rcx, r14
1400ee0f0: e82b30b505 call 0x145c41120
1400ee0f5: 90 nop
1400ee0f6: e975feffff jmp 0x1400edf70
1400ee0fb: 0f1f440000 nop dword ptr [rax + rax]
1400ee100: 488b9568020000 mov rdx, qword ptr [rbp + 0x268]
1400ee107: 4883fa21 cmp rdx, 0x21
1400ee10b: 0f820ffaffff jb 0x1400edb20
1400ee111: 488b8d68010000 mov rcx, qword ptr [rbp + 0x168]
1400ee118: 48c1e203 shl rdx, 3
1400ee11c: 41b808000000 mov r8d, 8
1400ee122: e8a940f1ff call 0x1400021d0
1400ee127: e9f4f9ffff jmp 0x1400edb20
1400ee12c: 31f6 xor esi, esi
1400ee12e: eb04 jmp 0x1400ee134
1400ee130: 498b7610 mov rsi, qword ptr [r14 + 0x10]
1400ee134: f30f10bdb0040000 movss xmm7, dword ptr [rbp + 0x4b0]
1400ee13c: 0f28cf movaps xmm1, xmm7
1400ee13f: f30f5f0d5526ce05 maxss xmm1, dword ptr [rip + 0x5ce2655]
1400ee147: f30f10058526ce05 movss xmm0, dword ptr [rip + 0x5ce2685]
1400ee14f: f30f5ec1 divss xmm0, xmm1
1400ee153: f30f5805b594ca05 addss xmm0, dword ptr [rip + 0x5ca94b5]
1400ee15b: e83b48b005 call 0x145bf299b
1400ee160: f30f58c0 addss xmm0, xmm0
1400ee164: f30f5d056c26ce05 minss xmm0, dword ptr [rip + 0x5ce266c]
1400ee16c: f3440f1035bb80cb05 movss xmm14, dword ptr [rip + 0x5cb80bb]
1400ee175: 410f28ce movaps xmm1, xmm14
1400ee179: f30f5ec8 divss xmm1, xmm0
1400ee17d: 0f28c1 movaps xmm0, xmm1
1400ee180: e81c48b005 call 0x145bf29a1
1400ee185: f3480f2cc0 cvttss2si rax, xmm0
1400ee18a: 4889c1 mov rcx, rax
1400ee18d: 0f28c8 movaps xmm1, xmm0
1400ee190: f30f5c0db897ca05 subss xmm1, dword ptr [rip + 0x5ca97b8]
1400ee198: f3480f2cd1 cvttss2si rdx, xmm1
1400ee19d: 48c1f93f sar rcx, 0x3f
1400ee1a1: 4821ca and rdx, rcx
1400ee1a4: 4809c2 or rdx, rax
1400ee1a7: 31c0 xor eax, eax
1400ee1a9: 0f57c9 xorps xmm1, xmm1
1400ee1ac: 0f2ec1 ucomiss xmm0, xmm1
1400ee1af: 480f43c2 cmovae rax, rdx
1400ee1b3: 0f2e059a97ca05 ucomiss xmm0, dword ptr [rip + 0x5ca979a]
1400ee1ba: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1400ee1c1: 480f46c8 cmovbe rcx, rax
1400ee1c5: 4883f904 cmp rcx, 4
1400ee1c9: b803000000 mov eax, 3
1400ee1ce: 480f42c8 cmovb rcx, rax
1400ee1d2: 4881f9a0000000 cmp rcx, 0xa0
1400ee1d9: bba0000000 mov ebx, 0xa0
1400ee1de: 480f42d9 cmovb rbx, rcx
1400ee1e2: 0f57c0 xorps xmm0, xmm0
1400ee1e5: f3480f2ac3 cvtsi2ss xmm0, rbx
1400ee1ea: f3440f5ef0 divss xmm14, xmm0
1400ee1ef: f30f10051d94ca05 movss xmm0, dword ptr [rip + 0x5ca941d]
1400ee1f7: f3410f59c6 mulss xmm0, xmm14
1400ee1fc: e87c47b005 call 0x145bf297d
1400ee201: f30f59c7 mulss xmm0, xmm7
1400ee205: f30f118570030000 movss dword ptr [rbp + 0x370], xmm0
1400ee20d: 48b9abaaaaaaaaaaaaaa movabs rcx, 0xaaaaaaaaaaaaaaab
1400ee217: 4889f0 mov rax, rsi
1400ee21a: 48f7e1 mul rcx
1400ee21d: 4d8b4608 mov r8, qword ptr [r14 + 8]
1400ee221: 48d1ea shr rdx, 1
1400ee224: f30f5f3ddc41cb05 maxss xmm7, dword ptr [rip + 0x5cb41dc]
1400ee22c: f30f593dbc95ca05 mulss xmm7, dword ptr [rip + 0x5ca95bc]
1400ee234: f30f11bd50030000 movss dword ptr [rbp + 0x350], xmm7
1400ee23c: 4c8d2452 lea r12, [rdx + rdx*2]
1400ee240: 4c8dad50010000 lea r13, [rbp + 0x150]
1400ee247: 488db538030000 lea rsi, [rbp + 0x338]
1400ee24e: eb07 jmp 0x1400ee257
1400ee250: 4c8b8568030000 mov r8, qword ptr [rbp + 0x368]
1400ee257: 4983fc02 cmp r12, 2
1400ee25b: 0f865e030000 jbe 0x1400ee5bf
1400ee261: 4c89c7 mov rdi, r8
1400ee264: 4983c06c add r8, 0x6c
1400ee268: 4983c4fd add r12, -3
1400ee26c: f30f100f movss xmm1, dword ptr [rdi]
1400ee270: f30f104708 movss xmm0, dword ptr [rdi + 8]
1400ee275: 0f14c1 unpcklps xmm0, xmm1
1400ee278: f30f105724 movss xmm2, dword ptr [rdi + 0x24]
1400ee27d: f30f104f2c movss xmm1, dword ptr [rdi + 0x2c]
1400ee282: 0f14ca unpcklps xmm1, xmm2
1400ee285: 440f28054342cb05 movaps xmm8, xmmword ptr [rip + 0x5cb4243]
1400ee28d: 410f57c8 xorps xmm1, xmm8
1400ee291: 0f5cce subps xmm1, xmm6
1400ee294: 0f28d1 movaps xmm2, xmm1
1400ee297: 0f59d1 mulps xmm2, xmm1
1400ee29a: f30f16da movshdup xmm3, xmm2
1400ee29e: f30f58da addss xmm3, xmm2
1400ee2a2: f30f51db sqrtss xmm3, xmm3
1400ee2a6: 410f57c0 xorps xmm0, xmm8
1400ee2aa: 0f5cc6 subps xmm0, xmm6
1400ee2ad: 0f28d0 movaps xmm2, xmm0
1400ee2b0: 0f59d0 mulps xmm2, xmm0
1400ee2b3: f30f16e2 movshdup xmm4, xmm2
1400ee2b7: f30f58e2 addss xmm4, xmm2
1400ee2bb: f30f51e4 sqrtss xmm4, xmm4
1400ee2bf: f30f106f48 movss xmm5, dword ptr [rdi + 0x48]
1400ee2c4: f30f105750 movss xmm2, dword ptr [rdi + 0x50]
1400ee2c9: 0f14d5 unpcklps xmm2, xmm5
1400ee2cc: 410f57d0 xorps xmm2, xmm8
1400ee2d0: 0f5cd6 subps xmm2, xmm6
1400ee2d3: 0f28ea movaps xmm5, xmm2
1400ee2d6: 0f59ea mulps xmm5, xmm2
1400ee2d9: f3440f16c5 movshdup xmm8, xmm5
1400ee2de: f3440f58c5 addss xmm8, xmm5
1400ee2e3: 0f57ed xorps xmm5, xmm5
1400ee2e6: f3410f51e8 sqrtss xmm5, xmm8
1400ee2eb: 440f28c4 movaps xmm8, xmm4
1400ee2ef: f3440f5fc3 maxss xmm8, xmm3
1400ee2f4: 450f28c8 movaps xmm9, xmm8
1400ee2f8: f3450fc2c803 cmpunordss xmm9, xmm8
1400ee2fe: 450f28d1 movaps xmm10, xmm9
1400ee302: 450f55d0 andnps xmm10, xmm8
1400ee306: 440f54cc andps xmm9, xmm4
1400ee30a: 450f56ca orps xmm9, xmm10
1400ee30e: 450f28c1 movaps xmm8, xmm9
1400ee312: f3440f5fc5 maxss xmm8, xmm5
1400ee317: 450f28d0 movaps xmm10, xmm8
1400ee31b: f3450fc2d003 cmpunordss xmm10, xmm8
1400ee321: 450f54ca andps xmm9, xmm10
1400ee325: 450f55d0 andnps xmm10, xmm8
1400ee329: 450f56d1 orps xmm10, xmm9
1400ee32d: f30f10bd70030000 movss xmm7, dword ptr [rbp + 0x370]
1400ee335: 410f2efa ucomiss xmm7, xmm10
1400ee339: 0f8318ffffff jae 0x1400ee257
1400ee33f: 440f28c4 movaps xmm8, xmm4
1400ee343: f3440f5dc3 minss xmm8, xmm3
1400ee348: 450f28c8 movaps xmm9, xmm8
1400ee34c: f3450fc2c803 cmpunordss xmm9, xmm8
1400ee352: 410f28d9 movaps xmm3, xmm9
1400ee356: 410f55d8 andnps xmm3, xmm8
1400ee35a: 440f54cc andps xmm9, xmm4
1400ee35e: 440f56cb orps xmm9, xmm3
1400ee362: 410f28e1 movaps xmm4, xmm9
1400ee366: f30f5de5 minss xmm4, xmm5
1400ee36a: 0f28dc movaps xmm3, xmm4
1400ee36d: f30fc2dc03 cmpunordss xmm3, xmm4
1400ee372: 440f54cb andps xmm9, xmm3
1400ee376: 0f55dc andnps xmm3, xmm4
1400ee379: 410f56d9 orps xmm3, xmm9
1400ee37d: 0f28e0 movaps xmm4, xmm0
1400ee380: 0f5ce1 subps xmm4, xmm1
1400ee383: 0f59e4 mulps xmm4, xmm4
1400ee386: f30f16ec movshdup xmm5, xmm4
1400ee38a: f30f58ec addss xmm5, xmm4
1400ee38e: 0f57e4 xorps xmm4, xmm4
1400ee391: f30f51e5 sqrtss xmm4, xmm5
1400ee395: 0f57ed xorps xmm5, xmm5
1400ee398: f30f5fe5 maxss xmm4, xmm5
1400ee39c: 0f5cca subps xmm1, xmm2
1400ee39f: 0f59c9 mulps xmm1, xmm1
1400ee3a2: f30f16e9 movshdup xmm5, xmm1
1400ee3a6: f30f58e9 addss xmm5, xmm1
1400ee3aa: 0f57c9 xorps xmm1, xmm1
1400ee3ad: f30f51cd sqrtss xmm1, xmm5
1400ee3b1: f30f5fcc maxss xmm1, xmm4
1400ee3b5: 0f5cd0 subps xmm2, xmm0
1400ee3b8: 0f59d2 mulps xmm2, xmm2
1400ee3bb: f30f16c2 movshdup xmm0, xmm2
1400ee3bf: f30f58c2 addss xmm0, xmm2
1400ee3c3: f30f51c0 sqrtss xmm0, xmm0
1400ee3c7: f30f5fc1 maxss xmm0, xmm1
1400ee3cb: f30f59c0 mulss xmm0, xmm0
1400ee3cf: f30f5e8550030000 divss xmm0, dword ptr [rbp + 0x350]
1400ee3d7: f30f5885b0040000 addss xmm0, dword ptr [rbp + 0x4b0]
1400ee3df: 0f2ed8 ucomiss xmm3, xmm0
1400ee3e2: 0f8338010000 jae 0x1400ee520
1400ee3e8: 4c898568030000 mov qword ptr [rbp + 0x368], r8
1400ee3ef: 4531ff xor r15d, r15d
1400ee3f2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ee400: 4939df cmp r15, rbx
1400ee403: 0f8347feffff jae 0x1400ee250
1400ee409: 450f57d2 xorps xmm10, xmm10
1400ee40d: f34d0f2ad7 cvtsi2ss xmm10, r15
1400ee412: 49ffc7 inc r15
1400ee415: f3450f59d6 mulss xmm10, xmm14
1400ee41a: 450f57c0 xorps xmm8, xmm8
1400ee41e: f34d0f2ac7 cvtsi2ss xmm8, r15
1400ee423: f3450f59c6 mulss xmm8, xmm14
1400ee428: 410f28c2 movaps xmm0, xmm10
1400ee42c: e84c45b005 call 0x145bf297d
1400ee431: 440f28c8 movaps xmm9, xmm0
1400ee435: 410f28c2 movaps xmm0, xmm10
1400ee439: e83945b005 call 0x145bf2977
1400ee43e: 440f28d8 movaps xmm11, xmm0
1400ee442: 0f283d8740cb05 movaps xmm7, xmmword ptr [rip + 0x5cb4087]
1400ee449: 440f57df xorps xmm11, xmm7
1400ee44d: 410f28c0 movaps xmm0, xmm8
1400ee451: e82745b005 call 0x145bf297d
1400ee456: 440f28e0 movaps xmm12, xmm0
1400ee45a: 410f28c0 movaps xmm0, xmm8
1400ee45e: e81445b005 call 0x145bf2977
1400ee463: 440f28e8 movaps xmm13, xmm0
1400ee467: 440f57e7 xorps xmm12, xmm7
1400ee46b: f3450f58c2 addss xmm8, xmm10
1400ee470: f3440f59059b91ca05 mulss xmm8, dword ptr [rip + 0x5ca919b]
1400ee479: 410f28c0 movaps xmm0, xmm8
1400ee47d: e8fb44b005 call 0x145bf297d
1400ee482: 440f28d0 movaps xmm10, xmm0
1400ee486: 410f28c0 movaps xmm0, xmm8
1400ee48a: e8e844b005 call 0x145bf2977
1400ee48f: f3440f119d50010000 movss dword ptr [rbp + 0x150], xmm11
1400ee498: f3440f118d54010000 movss dword ptr [rbp + 0x154], xmm9
1400ee4a1: c7855801000000000000 mov dword ptr [rbp + 0x158], 0
1400ee4ab: f3440f11ad5c010000 movss dword ptr [rbp + 0x15c], xmm13
1400ee4b4: f3440f11a560010000 movss dword ptr [rbp + 0x160], xmm12
1400ee4bd: c7856401000000000000 mov dword ptr [rbp + 0x164], 0
1400ee4c7: f3440f119568010000 movss dword ptr [rbp + 0x168], xmm10
1400ee4d0: f30f11856c010000 movss dword ptr [rbp + 0x16c], xmm0
1400ee4d8: f30f108570030000 movss xmm0, dword ptr [rbp + 0x370]
1400ee4e0: f30f118570010000 movss dword ptr [rbp + 0x170], xmm0
1400ee4e8: 4c896c2428 mov qword ptr [rsp + 0x28], r13
1400ee4ed: f3440f117c2420 movss dword ptr [rsp + 0x20], xmm15
1400ee4f4: 48c744243003000000 mov qword ptr [rsp + 0x30], 3
1400ee4fd: ba03000000 mov edx, 3
1400ee502: 4889f9 mov rcx, rdi
1400ee505: 4989f0 mov r8, rsi
1400ee508: 0f28de movaps xmm3, xmm6
1400ee50b: e8d0a00000 call 0x1400f85e0
1400ee510: 90 nop
1400ee511: e9eafeffff jmp 0x1400ee400
1400ee516: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ee520: 488b8538030000 mov rax, qword ptr [rbp + 0x338]
1400ee527: 488b9548030000 mov rdx, qword ptr [rbp + 0x348]
1400ee52e: 4829d0 sub rax, rdx
1400ee531: 4883f802 cmp rax, 2
1400ee535: 7658 jbe 0x1400ee58f
1400ee537: 488b8540030000 mov rax, qword ptr [rbp + 0x340]
1400ee53e: 488d0cd2 lea rcx, [rdx + rdx*8]
1400ee542: 0f10475c movups xmm0, xmmword ptr [rdi + 0x5c]
1400ee546: 0f1144885c movups xmmword ptr [rax + rcx*4 + 0x5c], xmm0
1400ee54b: 0f104750 movups xmm0, xmmword ptr [rdi + 0x50]
1400ee54f: 0f11448850 movups xmmword ptr [rax + rcx*4 + 0x50], xmm0
1400ee554: 0f104740 movups xmm0, xmmword ptr [rdi + 0x40]
1400ee558: 0f11448840 movups xmmword ptr [rax + rcx*4 + 0x40], xmm0
1400ee55d: 0f1007 movups xmm0, xmmword ptr [rdi]
1400ee560: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
1400ee564: 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
1400ee568: 0f105f30 movups xmm3, xmmword ptr [rdi + 0x30]
1400ee56c: 0f115c8830 movups xmmword ptr [rax + rcx*4 + 0x30], xmm3
1400ee571: 0f11548820 movups xmmword ptr [rax + rcx*4 + 0x20], xmm2
1400ee576: 0f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm1
1400ee57b: 0f110488 movups xmmword ptr [rax + rcx*4], xmm0
1400ee57f: 4883c203 add rdx, 3
1400ee583: 48899548030000 mov qword ptr [rbp + 0x348], rdx
1400ee58a: e9c8fcffff jmp 0x1400ee257
1400ee58f: 4d89c7 mov r15, r8
1400ee592: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1400ee59b: 41b803000000 mov r8d, 3
1400ee5a1: 41b904000000 mov r9d, 4
1400ee5a7: 4889f1 mov rcx, rsi
1400ee5aa: e8e164b005 call 0x145bf4a90
1400ee5af: 90 nop
1400ee5b0: 488b9548030000 mov rdx, qword ptr [rbp + 0x348]
1400ee5b7: 4d89f8 mov r8, r15
1400ee5ba: e978ffffff jmp 0x1400ee537
1400ee5bf: 498b7620 mov rsi, qword ptr [r14 + 0x20]
1400ee5c3: 0fb69d86030000 movzx ebx, byte ptr [rbp + 0x386]
1400ee5ca: 885db8 mov byte ptr [rbp - 0x48], bl
1400ee5cd: 48837e1800 cmp qword ptr [rsi + 0x18], 0
1400ee5d2: 0f84ce000000 je 0x1400ee6a6
1400ee5d8: 488d4e20 lea rcx, [rsi + 0x20]
1400ee5dc: 488d55b8 lea rdx, [rbp - 0x48]
1400ee5e0: e8db90f2ff call 0x1400176c0
1400ee5e5: 4989c0 mov r8, rax
1400ee5e8: 49c1e839 shr r8, 0x39
1400ee5ec: 488b0e mov rcx, qword ptr [rsi]
1400ee5ef: 488b5608 mov rdx, qword ptr [rsi + 8]
1400ee5f3: 66410f6ec0 movd xmm0, r8d
1400ee5f8: 660f60c0 punpcklbw xmm0, xmm0
1400ee5fc: f20f70c000 pshuflw xmm0, xmm0, 0
1400ee601: 660f70c044 pshufd xmm0, xmm0, 0x44
1400ee606: 4531c0 xor r8d, r8d
1400ee609: 660f76c9 pcmpeqd xmm1, xmm1
1400ee60d: 4821d0 and rax, rdx
1400ee610: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
1400ee615: 660f6fda movdqa xmm3, xmm2
1400ee619: 660f74d8 pcmpeqb xmm3, xmm0
1400ee61d: 66440fd7cb pmovmskb r9d, xmm3
1400ee622: 4585c9 test r9d, r9d
1400ee625: 7429 je 0x1400ee650
1400ee627: f3450fbcd9 tzcnt r11d, r9d
1400ee62c: 4901c3 add r11, rax
1400ee62f: 4921d3 and r11, rdx
1400ee632: 49c1e305 shl r11, 5
1400ee636: 4989ca mov r10, rcx
1400ee639: 4d29da sub r10, r11
1400ee63c: 413a5ae0 cmp bl, byte ptr [r10 - 0x20]
1400ee640: 7429 je 0x1400ee66b
1400ee642: 458d51ff lea r10d, [r9 - 1]
1400ee646: 664521ca and r10w, r9w
1400ee64a: 4589d1 mov r9d, r10d
1400ee64d: 75d8 jne 0x1400ee627
1400ee64f: 90 nop
1400ee650: 660f74d1 pcmpeqb xmm2, xmm1
1400ee654: 66440fd7ca pmovmskb r9d, xmm2
1400ee659: 4585c9 test r9d, r9d
1400ee65c: 7548 jne 0x1400ee6a6
1400ee65e: 4c01c0 add rax, r8
1400ee661: 4883c010 add rax, 0x10
1400ee665: 4983c010 add r8, 0x10
1400ee669: eba2 jmp 0x1400ee60d
1400ee66b: 41807ae800 cmp byte ptr [r10 - 0x18], 0
1400ee670: 7452 je 0x1400ee6c4
1400ee672: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
1400ee677: 888552010000 mov byte ptr [rbp + 0x152], al
1400ee67d: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
1400ee682: 66898550010000 mov word ptr [rbp + 0x150], ax
1400ee689: 498d4aec lea rcx, [r10 - 0x14]
1400ee68d: 498d52f0 lea rdx, [r10 - 0x10]
1400ee691: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
1400ee695: 410fb642f8 movzx eax, byte ptr [r10 - 8]
1400ee69a: 48c1e020 shl rax, 0x20
1400ee69e: 4c09c0 or rax, r8
1400ee6a1: 41b001 mov r8b, 1
1400ee6a4: eb2d jmp 0x1400ee6d3
1400ee6a6: 488d0d6e2fce05 lea rcx, [rip + 0x5ce2f6e]
1400ee6ad: 4c8d05842fce05 lea r8, [rip + 0x5ce2f84]
1400ee6b4: ba16000000 mov edx, 0x16
1400ee6b9: e8f250ca05 call 0x145d937b0
1400ee6be: 90 nop
1400ee6bf: e91e010000 jmp 0x1400ee7e2
1400ee6c4: 498b52f0 mov rdx, qword ptr [r10 - 0x10]
1400ee6c8: 488d4a68 lea rcx, [rdx + 0x68]
1400ee6cc: 4883c26c add rdx, 0x6c
1400ee6d0: 4531c0 xor r8d, r8d
1400ee6d3: 4c8b9520030000 mov r10, qword ptr [rbp + 0x320]
1400ee6da: 440fb69d87030000 movzx r11d, byte ptr [rbp + 0x387]
1400ee6e2: 8b12 mov edx, dword ptr [rdx]
1400ee6e4: 8b09 mov ecx, dword ptr [rcx]
1400ee6e6: 4c8b8d48030000 mov r9, qword ptr [rbp + 0x348]
1400ee6ed: 4d894a10 mov qword ptr [r10 + 0x10], r9
1400ee6f1: 0f108538030000 movups xmm0, xmmword ptr [rbp + 0x338]
1400ee6f8: 410f1102 movups xmmword ptr [r10], xmm0
1400ee6fc: 45885a2c mov byte ptr [r10 + 0x2c], r11b
1400ee700: 45884218 mov byte ptr [r10 + 0x18], r8b
1400ee704: 440fb78550010000 movzx r8d, word ptr [rbp + 0x150]
1400ee70c: 6645894219 mov word ptr [r10 + 0x19], r8w
1400ee711: 440fb68552010000 movzx r8d, byte ptr [rbp + 0x152]
1400ee719: 4588421b mov byte ptr [r10 + 0x1b], r8b
1400ee71d: 41894a1c mov dword ptr [r10 + 0x1c], ecx
1400ee721: 41895220 mov dword ptr [r10 + 0x20], edx
1400ee725: 49894224 mov qword ptr [r10 + 0x24], rax
1400ee729: 0f28b590030000 movaps xmm6, xmmword ptr [rbp + 0x390]
1400ee730: 0f28bda0030000 movaps xmm7, xmmword ptr [rbp + 0x3a0]
1400ee737: 440f2885b0030000 movaps xmm8, xmmword ptr [rbp + 0x3b0]
1400ee73f: 440f288dc0030000 movaps xmm9, xmmword ptr [rbp + 0x3c0]
1400ee747: 440f2895d0030000 movaps xmm10, xmmword ptr [rbp + 0x3d0]
1400ee74f: 440f289de0030000 movaps xmm11, xmmword ptr [rbp + 0x3e0]
1400ee757: 440f28a5f0030000 movaps xmm12, xmmword ptr [rbp + 0x3f0]
1400ee75f: 440f28ad00040000 movaps xmm13, xmmword ptr [rbp + 0x400]
1400ee767: 440f28b510040000 movaps xmm14, xmmword ptr [rbp + 0x410]
1400ee76f: 440f28bd20040000 movaps xmm15, xmmword ptr [rbp + 0x420]
1400ee777: 4881c4b8040000 add rsp, 0x4b8
1400ee77e: 5b pop rbx
1400ee77f: 5f pop rdi
1400ee780: 5e pop rsi
1400ee781: 415c pop r12
1400ee783: 415d pop r13
1400ee785: 415e pop r14
1400ee787: 415f pop r15
1400ee789: 5d pop rbp
1400ee78a: c3 ret
1400ee78b: 4c8d05a62ace05 lea r8, [rip + 0x5ce2aa6]
1400ee792: ba09000000 mov edx, 9
1400ee797: 4889f1 mov rcx, rsi
1400ee79a: e8f450ca05 call 0x145d93893
1400ee79f: 90 nop
1400ee7a0: eb40 jmp 0x1400ee7e2
1400ee7a2: 4c8d051f2ece05 lea r8, [rip + 0x5ce2e1f]
1400ee7a9: e8e550ca05 call 0x145d93893
1400ee7ae: 90 nop
1400ee7af: eb31 jmp 0x1400ee7e2
1400ee7b1: 4c8d05402ece05 lea r8, [rip + 0x5ce2e40]
1400ee7b8: 4c89c9 mov rcx, r9
1400ee7bb: e8d350ca05 call 0x145d93893
1400ee7c0: 90 nop
1400ee7c1: eb1f jmp 0x1400ee7e2
1400ee7c3: 4c8d05e62dce05 lea r8, [rip + 0x5ce2de6]
1400ee7ca: e8c450ca05 call 0x145d93893
1400ee7cf: 90 nop
1400ee7d0: eb10 jmp 0x1400ee7e2
1400ee7d2: 4c8d05072ece05 lea r8, [rip + 0x5ce2e07]
1400ee7d9: 4889c1 mov rcx, rax
1400ee7dc: e8b250ca05 call 0x145d93893
1400ee7e1: 90 nop
1400ee7e2: 0f0b ud2
