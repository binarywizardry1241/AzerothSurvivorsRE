1400ecc30: 55 push rbp
1400ecc31: 4157 push r15
1400ecc33: 4156 push r14
1400ecc35: 4155 push r13
1400ecc37: 4154 push r12
1400ecc39: 56 push rsi
1400ecc3a: 57 push rdi
1400ecc3b: 53 push rbx
1400ecc3c: 4881eca8040000 sub rsp, 0x4a8
1400ecc43: 488dac2480000000 lea rbp, [rsp + 0x80]
1400ecc4b: 440f29bd10040000 movaps xmmword ptr [rbp + 0x410], xmm15
1400ecc53: 440f29b500040000 movaps xmmword ptr [rbp + 0x400], xmm14
1400ecc5b: 440f29adf0030000 movaps xmmword ptr [rbp + 0x3f0], xmm13
1400ecc63: 440f29a5e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm12
1400ecc6b: 440f299dd0030000 movaps xmmword ptr [rbp + 0x3d0], xmm11
1400ecc73: 440f2995c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm10
1400ecc7b: 440f298db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm9
1400ecc83: 440f2985a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm8
1400ecc8b: 0f29bd90030000 movaps xmmword ptr [rbp + 0x390], xmm7
1400ecc92: 0f29b580030000 movaps xmmword ptr [rbp + 0x380], xmm6
1400ecc99: 48c78578030000feffffff mov qword ptr [rbp + 0x378], 0xfffffffffffffffe
1400ecca4: 44888d75030000 mov byte ptr [rbp + 0x375], r9b
1400eccab: 44888577030000 mov byte ptr [rbp + 0x377], r8b
1400eccb2: 4989d6 mov r14, rdx
1400eccb5: 48898d28030000 mov qword ptr [rbp + 0x328], rcx
1400eccbc: f30f1085a0040000 movss xmm0, dword ptr [rbp + 0x4a0]
1400eccc4: f30f109d98040000 movss xmm3, dword ptr [rbp + 0x498]
1400ecccc: 4c8b8590040000 mov r8, qword ptr [rbp + 0x490]
1400eccd3: 48c7850803000000000000 mov qword ptr [rbp + 0x308], 0
1400eccde: 48c7851003000004000000 mov qword ptr [rbp + 0x310], 4
1400ecce9: 48c7851803000000000000 mov qword ptr [rbp + 0x318], 0
1400eccf4: 4883bdb004000000 cmp qword ptr [rbp + 0x4b0], 0
1400eccfc: 0f84ce070000 je 0x1400ed4d0
1400ecd02: 49c7461000000000 mov qword ptr [r14 + 0x10], 0
1400ecd0a: 498b7618 mov rsi, qword ptr [r14 + 0x18]
1400ecd0e: 488d8df0020000 lea rcx, [rbp + 0x2f0]
1400ecd15: 4c89c2 mov rdx, r8
1400ecd18: e8b3c14f01 call 0x1415e8ed0
1400ecd1d: 90 nop
1400ecd1e: 488b8590040000 mov rax, qword ptr [rbp + 0x490]
1400ecd25: f30f104014 movss xmm0, dword ptr [rax + 0x14]
1400ecd2a: f30f104818 movss xmm1, dword ptr [rax + 0x18]
1400ecd2f: f30f118560030000 movss dword ptr [rbp + 0x360], xmm0
1400ecd37: f30f5cc8 subss xmm1, xmm0
1400ecd3b: 0f57c0 xorps xmm0, xmm0
1400ecd3e: f30f118d64030000 movss dword ptr [rbp + 0x364], xmm1
1400ecd46: 0f2ec1 ucomiss xmm0, xmm1
1400ecd49: 0f8314070000 jae 0x1400ed463
1400ecd4f: f30f10481c movss xmm1, dword ptr [rax + 0x1c]
1400ecd54: f3440f105820 movss xmm11, dword ptr [rax + 0x20]
1400ecd5a: f3440f5cd9 subss xmm11, xmm1
1400ecd5f: 410f2ec3 ucomiss xmm0, xmm11
1400ecd63: 0f83fa060000 jae 0x1400ed463
1400ecd69: 440f28c9 movaps xmm9, xmm1
1400ecd6d: 488b0e mov rcx, qword ptr [rsi]
1400ecd70: 488b4608 mov rax, qword ptr [rsi + 8]
1400ecd74: 48898548030000 mov qword ptr [rbp + 0x348], rax
1400ecd7b: 488b91f8000000 mov rdx, qword ptr [rcx + 0xf8]
1400ecd82: 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400ecd89: 48899550030000 mov qword ptr [rbp + 0x350], rdx
1400ecd90: 488d0482 lea rax, [rdx + rax*4]
1400ecd94: 48898520030000 mov qword ptr [rbp + 0x320], rax
1400ecd9b: 48898d38030000 mov qword ptr [rbp + 0x338], rcx
1400ecda2: 0fb68108010000 movzx eax, byte ptr [rcx + 0x108]
1400ecda9: 888576030000 mov byte ptr [rbp + 0x376], al
1400ecdaf: 488b8590040000 mov rax, qword ptr [rbp + 0x490]
1400ecdb6: f3440f1020 movss xmm12, dword ptr [rax]
1400ecdbb: f3440f106808 movss xmm13, dword ptr [rax + 8]
1400ecdc1: f3440f107010 movss xmm14, dword ptr [rax + 0x10]
1400ecdc7: f3440f10780c movss xmm15, dword ptr [rax + 0xc]
1400ecdcd: 48c7855803000000000000 mov qword ptr [rbp + 0x358], 0
1400ecdd8: b808000000 mov eax, 8
1400ecddd: 48898530030000 mov qword ptr [rbp + 0x330], rax
1400ecde4: 48c7856803000000000000 mov qword ptr [rbp + 0x368], 0
1400ecdef: c7857003000000000000 mov dword ptr [rbp + 0x370], 0
1400ecdf9: 80bd7603000000 cmp byte ptr [rbp + 0x376], 0
1400ece00: 0f84aa000000 je 0x1400eceb0
1400ece06: 4c8b8d58030000 mov r9, qword ptr [rbp + 0x358]
1400ece0d: 8b8570030000 mov eax, dword ptr [rbp + 0x370]
1400ece13: 4439c8 cmp eax, r9d
1400ece16: 4c8b8550030000 mov r8, qword ptr [rbp + 0x350]
1400ece1d: 0f854c010000 jne 0x1400ecf6f
1400ece23: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ece30: 4c3b8520030000 cmp r8, qword ptr [rbp + 0x320]
1400ece37: 0f8426060000 je 0x1400ed463
1400ece3d: 418b08 mov ecx, dword ptr [r8]
1400ece40: 4983c004 add r8, 4
1400ece44: 488b8548030000 mov rax, qword ptr [rbp + 0x348]
1400ece4b: 488b80a8010000 mov rax, qword ptr [rax + 0x1a8]
1400ece52: 488d0cc9 lea rcx, [rcx + rcx*8]
1400ece56: 4c8b4cc810 mov r9, qword ptr [rax + rcx*8 + 0x10]
1400ece5b: 4d85c9 test r9, r9
1400ece5e: 74d0 je 0x1400ece30
1400ece60: 488d04c8 lea rax, [rax + rcx*8]
1400ece64: 488b8d38030000 mov rcx, qword ptr [rbp + 0x338]
1400ece6b: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400ece72: 483b4840 cmp rcx, qword ptr [rax + 0x40]
1400ece76: 0f83e6000000 jae 0x1400ecf62
1400ece7c: 488b5038 mov rdx, qword ptr [rax + 0x38]
1400ece80: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
1400ece84: 4885c9 test rcx, rcx
1400ece87: 0f84d5000000 je 0x1400ecf62
1400ece8d: 488b4018 mov rax, qword ptr [rax + 0x18]
1400ece91: 48f7d1 not rcx
1400ece94: 488d0c49 lea rcx, [rcx + rcx*2]
1400ece98: 48c1e104 shl rcx, 4
1400ece9c: 488b440810 mov rax, qword ptr [rax + rcx + 0x10]
1400ecea1: 48898568030000 mov qword ptr [rbp + 0x368], rax
1400ecea8: e9c0000000 jmp 0x1400ecf6d
1400ecead: 0f1f00 nop dword ptr [rax]
1400eceb0: 4c8b9558030000 mov r10, qword ptr [rbp + 0x358]
1400eceb7: 8b8570030000 mov eax, dword ptr [rbp + 0x370]
1400ecebd: 4439d0 cmp eax, r10d
1400ecec0: 4c8b8d50030000 mov r9, qword ptr [rbp + 0x350]
1400ecec7: 0f85d2000000 jne 0x1400ecf9f
1400ececd: 0f1f00 nop dword ptr [rax]
1400eced0: 4c3b8d20030000 cmp r9, qword ptr [rbp + 0x320]
1400eced7: 0f8486050000 je 0x1400ed463
1400ecedd: 418b09 mov ecx, dword ptr [r9]
1400ecee0: 4983c104 add r9, 4
1400ecee4: 488b8548030000 mov rax, qword ptr [rbp + 0x348]
1400eceeb: 488b8008010000 mov rax, qword ptr [rax + 0x108]
1400ecef2: 488d0c89 lea rcx, [rcx + rcx*4]
1400ecef6: 48c1e105 shl rcx, 5
1400ecefa: 4c8b540858 mov r10, qword ptr [rax + rcx + 0x58]
1400eceff: 4d85d2 test r10, r10
1400ecf02: 74cc je 0x1400eced0
1400ecf04: 4801c8 add rax, rcx
1400ecf07: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400ecf0d: 488b9548030000 mov rdx, qword ptr [rbp + 0x348]
1400ecf14: 488b92a8010000 mov rdx, qword ptr [rdx + 0x1a8]
1400ecf1b: 4c8d04c9 lea r8, [rcx + rcx*8]
1400ecf1f: 488b8d38030000 mov rcx, qword ptr [rbp + 0x338]
1400ecf26: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400ecf2d: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
1400ecf32: 7353 jae 0x1400ecf87
1400ecf34: 4a8d14c2 lea rdx, [rdx + r8*8]
1400ecf38: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
1400ecf3c: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
1400ecf40: 4885c9 test rcx, rcx
1400ecf43: 7442 je 0x1400ecf87
1400ecf45: 488b5218 mov rdx, qword ptr [rdx + 0x18]
1400ecf49: 48f7d1 not rcx
1400ecf4c: 488d0c49 lea rcx, [rcx + rcx*2]
1400ecf50: 48c1e104 shl rcx, 4
1400ecf54: 488b4c0a10 mov rcx, qword ptr [rdx + rcx + 0x10]
1400ecf59: 48898d68030000 mov qword ptr [rbp + 0x368], rcx
1400ecf60: eb30 jmp 0x1400ecf92
1400ecf62: 48c7856803000000000000 mov qword ptr [rbp + 0x368], 0
1400ecf6d: 31c0 xor eax, eax
1400ecf6f: 4c898d58030000 mov qword ptr [rbp + 0x358], r9
1400ecf76: 4c898550030000 mov qword ptr [rbp + 0x350], r8
1400ecf7d: 898570030000 mov dword ptr [rbp + 0x370], eax
1400ecf83: 89c0 mov eax, eax
1400ecf85: eb3f jmp 0x1400ecfc6
1400ecf87: 48c7856803000000000000 mov qword ptr [rbp + 0x368], 0
1400ecf92: 488b4050 mov rax, qword ptr [rax + 0x50]
1400ecf96: 48898530030000 mov qword ptr [rbp + 0x330], rax
1400ecf9d: 31c0 xor eax, eax
1400ecf9f: 4c899558030000 mov qword ptr [rbp + 0x358], r10
1400ecfa6: 4c898d50030000 mov qword ptr [rbp + 0x350], r9
1400ecfad: 898570030000 mov dword ptr [rbp + 0x370], eax
1400ecfb3: 89c0 mov eax, eax
1400ecfb5: 48c1e004 shl rax, 4
1400ecfb9: 488b8d30030000 mov rcx, qword ptr [rbp + 0x330]
1400ecfc0: 8b440108 mov eax, dword ptr [rcx + rax + 8]
1400ecfc4: f7d0 not eax
1400ecfc6: 488d0440 lea rax, [rax + rax*2]
1400ecfca: 48c1e004 shl rax, 4
1400ecfce: 48038568030000 add rax, qword ptr [rbp + 0x368]
1400ecfd5: 488b08 mov rcx, qword ptr [rax]
1400ecfd8: 488b5008 mov rdx, qword ptr [rax + 8]
1400ecfdc: 488b4210 mov rax, qword ptr [rdx + 0x10]
1400ecfe0: 48ffc8 dec rax
1400ecfe3: 4883e0f0 and rax, 0xfffffffffffffff0
1400ecfe7: 4801c1 add rcx, rax
1400ecfea: 4883c110 add rcx, 0x10
1400ecfee: e8cd610d02 call 0x1421c31c0
1400ecff3: 90 nop
1400ecff4: ff8570030000 inc dword ptr [rbp + 0x370]
1400ecffa: 4885c0 test rax, rax
1400ecffd: 0f84f6fdffff je 0x1400ecdf9
1400ed003: 488d8de0000000 lea rcx, [rbp + 0xe0]
1400ed00a: 4889c2 mov rdx, rax
1400ed00d: 48898540030000 mov qword ptr [rbp + 0x340], rax
1400ed014: e897b90d02 call 0x1421c89b0
1400ed019: 90 nop
1400ed01a: 0f1085f4020000 movups xmm0, xmmword ptr [rbp + 0x2f4]
1400ed021: 0f28c8 movaps xmm1, xmm0
1400ed024: 0f128df0000000 movlps xmm1, qword ptr [rbp + 0xf0]
1400ed02b: 660f1485e0000000 unpcklpd xmm0, xmmword ptr [rbp + 0xe0]
1400ed033: 0fc2c106 cmpnleps xmm0, xmm1
1400ed037: 0f50c0 movmskps eax, xmm0
1400ed03a: 85c0 test eax, eax
1400ed03c: 488b9540030000 mov rdx, qword ptr [rbp + 0x340]
1400ed043: 0f85b0fdffff jne 0x1400ecdf9
1400ed049: f30f1085ec000000 movss xmm0, dword ptr [rbp + 0xec]
1400ed051: 0f2e85f0020000 ucomiss xmm0, dword ptr [rbp + 0x2f0]
1400ed058: 0f829bfdffff jb 0x1400ecdf9
1400ed05e: f30f108504030000 movss xmm0, dword ptr [rbp + 0x304]
1400ed066: 0f2e85e8000000 ucomiss xmm0, dword ptr [rbp + 0xe8]
1400ed06d: 0f8286fdffff jb 0x1400ecdf9
1400ed073: 488d4dc0 lea rcx, [rbp - 0x40]
1400ed077: 4c8d85f0020000 lea r8, [rbp + 0x2f0]
1400ed07e: e8cdec0e02 call 0x1421dbd50
1400ed083: 90 nop
1400ed084: 41b820010000 mov r8d, 0x120
1400ed08a: 488d8de0000000 lea rcx, [rbp + 0xe0]
1400ed091: 488d55c0 lea rdx, [rbp - 0x40]
1400ed095: e8a158b005 call 0x145bf293b
1400ed09a: 90 nop
1400ed09b: 0f1f440000 nop dword ptr [rax + rax]
1400ed0a0: 488d8de0000000 lea rcx, [rbp + 0xe0]
1400ed0a7: e844f70200 call 0x14011c7f0
1400ed0ac: 90 nop
1400ed0ad: 83f801 cmp eax, 1
1400ed0b0: 0f8581030000 jne 0x1400ed437
1400ed0b6: 89d1 mov ecx, edx
1400ed0b8: 488b8540030000 mov rax, qword ptr [rbp + 0x340]
1400ed0bf: 488b9080000000 mov rdx, qword ptr [rax + 0x80]
1400ed0c6: 4839ca cmp rdx, rcx
1400ed0c9: 0f8634060000 jbe 0x1400ed703
1400ed0cf: 488b5068 mov rdx, qword ptr [rax + 0x68]
1400ed0d3: 4c8b4078 mov r8, qword ptr [rax + 0x78]
1400ed0d7: 4c8d0c49 lea r9, [rcx + rcx*2]
1400ed0db: 438b0c88 mov ecx, dword ptr [r8 + r9*4]
1400ed0df: 4839ca cmp rdx, rcx
1400ed0e2: 0f86fa050000 jbe 0x1400ed6e2
1400ed0e8: 4b8d0488 lea rax, [r8 + r9*4]
1400ed0ec: 8b4004 mov eax, dword ptr [rax + 4]
1400ed0ef: 4839c2 cmp rdx, rax
1400ed0f2: 0f861a060000 jbe 0x1400ed712
1400ed0f8: 478b4c8808 mov r9d, dword ptr [r8 + r9*4 + 8]
1400ed0fd: 4c39ca cmp rdx, r9
1400ed100: 0f86eb050000 jbe 0x1400ed6f1
1400ed106: 488b9540030000 mov rdx, qword ptr [rbp + 0x340]
1400ed10d: 488b5260 mov rdx, qword ptr [rdx + 0x60]
1400ed111: 488d0440 lea rax, [rax + rax*2]
1400ed115: 488d0c49 lea rcx, [rcx + rcx*2]
1400ed119: 4f8d0449 lea r8, [r9 + r9*2]
1400ed11d: 448b4c8a08 mov r9d, dword ptr [rdx + rcx*4 + 8]
1400ed122: 44898d88020000 mov dword ptr [rbp + 0x288], r9d
1400ed129: 488b0c8a mov rcx, qword ptr [rdx + rcx*4]
1400ed12d: 48898d80020000 mov qword ptr [rbp + 0x280], rcx
1400ed134: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
1400ed138: 4c8d8d8c020000 lea r9, [rbp + 0x28c]
1400ed13f: 41894908 mov dword ptr [r9 + 8], ecx
1400ed143: 488b0482 mov rax, qword ptr [rdx + rax*4]
1400ed147: 498901 mov qword ptr [r9], rax
1400ed14a: 428b448208 mov eax, dword ptr [rdx + r8*4 + 8]
1400ed14f: 41894114 mov dword ptr [r9 + 0x14], eax
1400ed153: 4a8b0482 mov rax, qword ptr [rdx + r8*4]
1400ed157: 4989410c mov qword ptr [r9 + 0xc], rax
1400ed15b: 488d8d08020000 lea rcx, [rbp + 0x208]
1400ed162: 488d9580020000 lea rdx, [rbp + 0x280]
1400ed169: 4c8b8590040000 mov r8, qword ptr [rbp + 0x490]
1400ed170: e85bc84f01 call 0x1415e99d0
1400ed175: 90 nop
1400ed176: 0f108564020000 movups xmm0, xmmword ptr [rbp + 0x264]
1400ed17d: 0f1185dc020000 movups xmmword ptr [rbp + 0x2dc], xmm0
1400ed184: 0f108558020000 movups xmm0, xmmword ptr [rbp + 0x258]
1400ed18b: 0f2985d0020000 movaps xmmword ptr [rbp + 0x2d0], xmm0
1400ed192: 0f108548020000 movups xmm0, xmmword ptr [rbp + 0x248]
1400ed199: 0f2985c0020000 movaps xmmword ptr [rbp + 0x2c0], xmm0
1400ed1a0: 0f108508020000 movups xmm0, xmmword ptr [rbp + 0x208]
1400ed1a7: 0f108d18020000 movups xmm1, xmmword ptr [rbp + 0x218]
1400ed1ae: 0f109528020000 movups xmm2, xmmword ptr [rbp + 0x228]
1400ed1b5: 0f109d38020000 movups xmm3, xmmword ptr [rbp + 0x238]
1400ed1bc: 0f299db0020000 movaps xmmword ptr [rbp + 0x2b0], xmm3
1400ed1c3: 0f2995a0020000 movaps xmmword ptr [rbp + 0x2a0], xmm2
1400ed1ca: 0f298d90020000 movaps xmmword ptr [rbp + 0x290], xmm1
1400ed1d1: 0f298580020000 movaps xmmword ptr [rbp + 0x280], xmm0
1400ed1d8: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
1400ed1df: 4983ff03 cmp r15, 3
1400ed1e3: 0f82b7feffff jb 0x1400ed0a0
1400ed1e9: 49ffcf dec r15
1400ed1ec: f20f10b580020000 movsd xmm6, qword ptr [rbp + 0x280]
1400ed1f4: f30f10bd88020000 movss xmm7, dword ptr [rbp + 0x288]
1400ed1fc: 0f28c6 movaps xmm0, xmm6
1400ed1ff: f3410f5cc4 subss xmm0, xmm12
1400ed204: 0f28cf movaps xmm1, xmm7
1400ed207: f3410f5ccd subss xmm1, xmm13
1400ed20c: 410f28d6 movaps xmm2, xmm14
1400ed210: f30f59d0 mulss xmm2, xmm0
1400ed214: 410f28df movaps xmm3, xmm15
1400ed218: f30f59d9 mulss xmm3, xmm1
1400ed21c: f30f5cd3 subss xmm2, xmm3
1400ed220: f3410f59ce mulss xmm1, xmm14
1400ed225: f3410f59c7 mulss xmm0, xmm15
1400ed22a: f30f58c1 addss xmm0, xmm1
1400ed22e: f30f5c9560030000 subss xmm2, dword ptr [rbp + 0x360]
1400ed236: f30f5e9564030000 divss xmm2, dword ptr [rbp + 0x364]
1400ed23e: f3410f5cc1 subss xmm0, xmm9
1400ed243: f3410f5ec3 divss xmm0, xmm11
1400ed248: 660f7ed6 movd esi, xmm2
1400ed24c: 660f7ec0 movd eax, xmm0
1400ed250: 48c1e020 shl rax, 0x20
1400ed254: 4809c6 or rsi, rax
1400ed257: 41bd01000000 mov r13d, 1
1400ed25d: e99b000000 jmp 0x1400ed2fd
1400ed262: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ed270: 410f28c0 movaps xmm0, xmm8
1400ed274: f3410f5cc4 subss xmm0, xmm12
1400ed279: 410f28ca movaps xmm1, xmm10
1400ed27d: f3410f5ccd subss xmm1, xmm13
1400ed282: 410f28d6 movaps xmm2, xmm14
1400ed286: f30f59d0 mulss xmm2, xmm0
1400ed28a: 410f28df movaps xmm3, xmm15
1400ed28e: f30f59d9 mulss xmm3, xmm1
1400ed292: f30f5cd3 subss xmm2, xmm3
1400ed296: f3410f59ce mulss xmm1, xmm14
1400ed29b: f3410f59c7 mulss xmm0, xmm15
1400ed2a0: f30f58c1 addss xmm0, xmm1
1400ed2a4: f30f5c9560030000 subss xmm2, dword ptr [rbp + 0x360]
1400ed2ac: f30f5e9564030000 divss xmm2, dword ptr [rbp + 0x364]
1400ed2b4: f3410f5cc1 subss xmm0, xmm9
1400ed2b9: f3410f5ec3 divss xmm0, xmm11
1400ed2be: 660f7ed0 movd eax, xmm2
1400ed2c2: 660f7ec1 movd ecx, xmm0
1400ed2c6: 48c1e120 shl rcx, 0x20
1400ed2ca: 4809c8 or rax, rcx
1400ed2cd: 498b4e08 mov rcx, qword ptr [r14 + 8]
1400ed2d1: 4b8d14e4 lea rdx, [r12 + r12*8]
1400ed2d5: 440f130491 movlps qword ptr [rcx + rdx*4], xmm8
1400ed2da: f3440f11549108 movss dword ptr [rcx + rdx*4 + 8], xmm10
1400ed2e1: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
1400ed2e6: 0f280513a3ca05 movaps xmm0, xmmword ptr [rip + 0x5caa313]
1400ed2ed: 0f11449114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm0
1400ed2f2: 4883c303 add rbx, 3
1400ed2f6: 49895e10 mov qword ptr [r14 + 0x10], rbx
1400ed2fa: 4989fd mov r13, rdi
1400ed2fd: 4d39fd cmp r13, r15
1400ed300: 0f839afdffff jae 0x1400ed0a0
1400ed306: 498b5e10 mov rbx, qword ptr [r14 + 0x10]
1400ed30a: 493b1e cmp rbx, qword ptr [r14]
1400ed30d: 7509 jne 0x1400ed318
1400ed30f: 4c89f1 mov rcx, r14
1400ed312: e8093eb505 call 0x145c41120
1400ed317: 90 nop
1400ed318: 498b4608 mov rax, qword ptr [r14 + 8]
1400ed31c: 488d0cdb lea rcx, [rbx + rbx*8]
1400ed320: 0f133488 movlps qword ptr [rax + rcx*4], xmm6
1400ed324: f30f117c8808 movss dword ptr [rax + rcx*4 + 8], xmm7
1400ed32a: 488974880c mov qword ptr [rax + rcx*4 + 0xc], rsi
1400ed32f: 0f2805caa2ca05 movaps xmm0, xmmword ptr [rip + 0x5caa2ca]
1400ed336: 0f11448814 movups xmmword ptr [rax + rcx*4 + 0x14], xmm0
1400ed33b: 4c8d6301 lea r12, [rbx + 1]
1400ed33f: 4d896610 mov qword ptr [r14 + 0x10], r12
1400ed343: 4a8d046d00000000 lea rax, [r13*2]
1400ed34b: 4c01e8 add rax, r13
1400ed34e: f2440f10848580020000 movsd xmm8, qword ptr [rbp + rax*4 + 0x280]
1400ed358: f3440f10948588020000 movss xmm10, dword ptr [rbp + rax*4 + 0x288]
1400ed362: 4d3b26 cmp r12, qword ptr [r14]
1400ed365: 7509 jne 0x1400ed370
1400ed367: 4c89f1 mov rcx, r14
1400ed36a: e8b13db505 call 0x145c41120
1400ed36f: 90 nop
1400ed370: 498d7d01 lea rdi, [r13 + 1]
1400ed374: 410f28c0 movaps xmm0, xmm8
1400ed378: f3410f5cc4 subss xmm0, xmm12
1400ed37d: 410f28ca movaps xmm1, xmm10
1400ed381: f3410f5ccd subss xmm1, xmm13
1400ed386: 410f28d6 movaps xmm2, xmm14
1400ed38a: f30f59d0 mulss xmm2, xmm0
1400ed38e: 410f28df movaps xmm3, xmm15
1400ed392: f30f59d9 mulss xmm3, xmm1
1400ed396: f30f5cd3 subss xmm2, xmm3
1400ed39a: f3410f59ce mulss xmm1, xmm14
1400ed39f: f3410f59c7 mulss xmm0, xmm15
1400ed3a4: f30f58c1 addss xmm0, xmm1
1400ed3a8: f30f5c9560030000 subss xmm2, dword ptr [rbp + 0x360]
1400ed3b0: f30f5e9564030000 divss xmm2, dword ptr [rbp + 0x364]
1400ed3b8: f3410f5cc1 subss xmm0, xmm9
1400ed3bd: f3410f5ec3 divss xmm0, xmm11
1400ed3c2: 660f7ed0 movd eax, xmm2
1400ed3c6: 660f7ec1 movd ecx, xmm0
1400ed3ca: 48c1e120 shl rcx, 0x20
1400ed3ce: 4809c8 or rax, rcx
1400ed3d1: 498b4e08 mov rcx, qword ptr [r14 + 8]
1400ed3d5: 4b8d14e4 lea rdx, [r12 + r12*8]
1400ed3d9: 440f130491 movlps qword ptr [rcx + rdx*4], xmm8
1400ed3de: f3440f11549108 movss dword ptr [rcx + rdx*4 + 8], xmm10
1400ed3e5: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
1400ed3ea: 0f28050fa2ca05 movaps xmm0, xmmword ptr [rip + 0x5caa20f]
1400ed3f1: 0f11449114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm0
1400ed3f6: 4c8d6302 lea r12, [rbx + 2]
1400ed3fa: 4d896610 mov qword ptr [r14 + 0x10], r12
1400ed3fe: 4983fd08 cmp r13, 8
1400ed402: 0f84c3020000 je 0x1400ed6cb
1400ed408: 488d047f lea rax, [rdi + rdi*2]
1400ed40c: f2440f10848580020000 movsd xmm8, qword ptr [rbp + rax*4 + 0x280]
1400ed416: f3440f10948588020000 movss xmm10, dword ptr [rbp + rax*4 + 0x288]
1400ed420: 4d3b26 cmp r12, qword ptr [r14]
1400ed423: 0f8547feffff jne 0x1400ed270
1400ed429: 4c89f1 mov rcx, r14
1400ed42c: e8ef3cb505 call 0x145c41120
1400ed431: 90 nop
1400ed432: e939feffff jmp 0x1400ed270
1400ed437: 488b95f8010000 mov rdx, qword ptr [rbp + 0x1f8]
1400ed43e: 4883fa21 cmp rdx, 0x21
1400ed442: 0f82b1f9ffff jb 0x1400ecdf9
1400ed448: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
1400ed44f: 48c1e203 shl rdx, 3
1400ed453: 41b808000000 mov r8d, 8
1400ed459: e8724df1ff call 0x1400021d0
1400ed45e: e996f9ffff jmp 0x1400ecdf9
1400ed463: 488bb5a8040000 mov rsi, qword ptr [rbp + 0x4a8]
1400ed46a: 488b85b0040000 mov rax, qword ptr [rbp + 0x4b0]
1400ed471: 488d0440 lea rax, [rax + rax*2]
1400ed475: 488d1cc6 lea rbx, [rsi + rax*8]
1400ed479: 488dbd08030000 lea rdi, [rbp + 0x308]
1400ed480: 4839de cmp rsi, rbx
1400ed483: 7473 je 0x1400ed4f8
1400ed485: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ed490: 498b4e08 mov rcx, qword ptr [r14 + 8]
1400ed494: 498b5610 mov rdx, qword ptr [r14 + 0x10]
1400ed498: 4889742428 mov qword ptr [rsp + 0x28], rsi
1400ed49d: f30f1085a0040000 movss xmm0, dword ptr [rbp + 0x4a0]
1400ed4a5: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1400ed4ab: 48c744243002000000 mov qword ptr [rsp + 0x30], 2
1400ed4b4: 4989f8 mov r8, rdi
1400ed4b7: f30f109d98040000 movss xmm3, dword ptr [rbp + 0x498]
1400ed4bf: e81cb10000 call 0x1400f85e0
1400ed4c4: 90 nop
1400ed4c5: 4883c618 add rsi, 0x18
1400ed4c9: 4839de cmp rsi, rbx
1400ed4cc: 75c2 jne 0x1400ed490
1400ed4ce: eb28 jmp 0x1400ed4f8
1400ed4d0: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1400ed4d6: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
1400ed4df: 48c744242804000000 mov qword ptr [rsp + 0x28], 4
1400ed4e8: 488d9508030000 lea rdx, [rbp + 0x308]
1400ed4ef: 4c89f1 mov rcx, r14
1400ed4f2: e8d9140000 call 0x1400ee9d0
1400ed4f7: 90 nop
1400ed4f8: 498b7620 mov rsi, qword ptr [r14 + 0x20]
1400ed4fc: 0fb69d75030000 movzx ebx, byte ptr [rbp + 0x375]
1400ed503: 885dc0 mov byte ptr [rbp - 0x40], bl
1400ed506: 48837e1800 cmp qword ptr [rsi + 0x18], 0
1400ed50b: 0f84d5000000 je 0x1400ed5e6
1400ed511: 488d4e20 lea rcx, [rsi + 0x20]
1400ed515: 488d55c0 lea rdx, [rbp - 0x40]
1400ed519: e8a2a1f2ff call 0x1400176c0
1400ed51e: 4989c0 mov r8, rax
1400ed521: 49c1e839 shr r8, 0x39
1400ed525: 488b0e mov rcx, qword ptr [rsi]
1400ed528: 488b5608 mov rdx, qword ptr [rsi + 8]
1400ed52c: 66410f6ec0 movd xmm0, r8d
1400ed531: 660f60c0 punpcklbw xmm0, xmm0
1400ed535: f20f70c000 pshuflw xmm0, xmm0, 0
1400ed53a: 660f70c044 pshufd xmm0, xmm0, 0x44
1400ed53f: 4531c0 xor r8d, r8d
1400ed542: 660f76c9 pcmpeqd xmm1, xmm1
1400ed546: 4821d0 and rax, rdx
1400ed549: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
1400ed54e: 660f6fda movdqa xmm3, xmm2
1400ed552: 660f74d8 pcmpeqb xmm3, xmm0
1400ed556: 66440fd7cb pmovmskb r9d, xmm3
1400ed55b: 4585c9 test r9d, r9d
1400ed55e: 7430 je 0x1400ed590
1400ed560: f3450fbcd9 tzcnt r11d, r9d
1400ed565: 4901c3 add r11, rax
1400ed568: 4921d3 and r11, rdx
1400ed56b: 49c1e305 shl r11, 5
1400ed56f: 4989ca mov r10, rcx
1400ed572: 4d29da sub r10, r11
1400ed575: 413a5ae0 cmp bl, byte ptr [r10 - 0x20]
1400ed579: 7430 je 0x1400ed5ab
1400ed57b: 458d51ff lea r10d, [r9 - 1]
1400ed57f: 664521ca and r10w, r9w
1400ed583: 4589d1 mov r9d, r10d
1400ed586: 75d8 jne 0x1400ed560
1400ed588: 0f1f840000000000 nop dword ptr [rax + rax]
1400ed590: 660f74d1 pcmpeqb xmm2, xmm1
1400ed594: 66440fd7ca pmovmskb r9d, xmm2
1400ed599: 4585c9 test r9d, r9d
1400ed59c: 7548 jne 0x1400ed5e6
1400ed59e: 4c01c0 add rax, r8
1400ed5a1: 4883c010 add rax, 0x10
1400ed5a5: 4983c010 add r8, 0x10
1400ed5a9: eb9b jmp 0x1400ed546
1400ed5ab: 41807ae800 cmp byte ptr [r10 - 0x18], 0
1400ed5b0: 7452 je 0x1400ed604
1400ed5b2: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
1400ed5b7: 8885e2000000 mov byte ptr [rbp + 0xe2], al
1400ed5bd: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
1400ed5c2: 668985e0000000 mov word ptr [rbp + 0xe0], ax
1400ed5c9: 498d52ec lea rdx, [r10 - 0x14]
1400ed5cd: 498d4af0 lea rcx, [r10 - 0x10]
1400ed5d1: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
1400ed5d5: 410fb642f8 movzx eax, byte ptr [r10 - 8]
1400ed5da: 48c1e020 shl rax, 0x20
1400ed5de: 4c09c0 or rax, r8
1400ed5e1: 41b001 mov r8b, 1
1400ed5e4: eb2d jmp 0x1400ed613
1400ed5e6: 488d0d2e40ce05 lea rcx, [rip + 0x5ce402e]
1400ed5ed: 4c8d054440ce05 lea r8, [rip + 0x5ce4044]
1400ed5f4: ba16000000 mov edx, 0x16
1400ed5f9: e8b261ca05 call 0x145d937b0
1400ed5fe: 90 nop
1400ed5ff: e91e010000 jmp 0x1400ed722
1400ed604: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
1400ed608: 488d5168 lea rdx, [rcx + 0x68]
1400ed60c: 4883c16c add rcx, 0x6c
1400ed610: 4531c0 xor r8d, r8d
1400ed613: 4c8b9528030000 mov r10, qword ptr [rbp + 0x328]
1400ed61a: 440fb69d77030000 movzx r11d, byte ptr [rbp + 0x377]
1400ed622: 8b12 mov edx, dword ptr [rdx]
1400ed624: 8b09 mov ecx, dword ptr [rcx]
1400ed626: 4c8b8d18030000 mov r9, qword ptr [rbp + 0x318]
1400ed62d: 4d894a10 mov qword ptr [r10 + 0x10], r9
1400ed631: 0f108508030000 movups xmm0, xmmword ptr [rbp + 0x308]
1400ed638: 410f1102 movups xmmword ptr [r10], xmm0
1400ed63c: 45885a2c mov byte ptr [r10 + 0x2c], r11b
1400ed640: 45884218 mov byte ptr [r10 + 0x18], r8b
1400ed644: 440fb785e0000000 movzx r8d, word ptr [rbp + 0xe0]
1400ed64c: 6645894219 mov word ptr [r10 + 0x19], r8w
1400ed651: 440fb685e2000000 movzx r8d, byte ptr [rbp + 0xe2]
1400ed659: 4588421b mov byte ptr [r10 + 0x1b], r8b
1400ed65d: 4189521c mov dword ptr [r10 + 0x1c], edx
1400ed661: 41894a20 mov dword ptr [r10 + 0x20], ecx
1400ed665: 49894224 mov qword ptr [r10 + 0x24], rax
1400ed669: 0f28b580030000 movaps xmm6, xmmword ptr [rbp + 0x380]
1400ed670: 0f28bd90030000 movaps xmm7, xmmword ptr [rbp + 0x390]
1400ed677: 440f2885a0030000 movaps xmm8, xmmword ptr [rbp + 0x3a0]
1400ed67f: 440f288db0030000 movaps xmm9, xmmword ptr [rbp + 0x3b0]
1400ed687: 440f2895c0030000 movaps xmm10, xmmword ptr [rbp + 0x3c0]
1400ed68f: 440f289dd0030000 movaps xmm11, xmmword ptr [rbp + 0x3d0]
1400ed697: 440f28a5e0030000 movaps xmm12, xmmword ptr [rbp + 0x3e0]
1400ed69f: 440f28adf0030000 movaps xmm13, xmmword ptr [rbp + 0x3f0]
1400ed6a7: 440f28b500040000 movaps xmm14, xmmword ptr [rbp + 0x400]
1400ed6af: 440f28bd10040000 movaps xmm15, xmmword ptr [rbp + 0x410]
1400ed6b7: 4881c4a8040000 add rsp, 0x4a8
1400ed6be: 5b pop rbx
1400ed6bf: 5f pop rdi
1400ed6c0: 5e pop rsi
1400ed6c1: 415c pop r12
1400ed6c3: 415d pop r13
1400ed6c5: 415e pop r14
1400ed6c7: 415f pop r15
1400ed6c9: 5d pop rbp
1400ed6ca: c3 ret
1400ed6cb: 4c8d05663bce05 lea r8, [rip + 0x5ce3b66]
1400ed6d2: ba09000000 mov edx, 9
1400ed6d7: 4889f9 mov rcx, rdi
1400ed6da: e8b461ca05 call 0x145d93893
1400ed6df: 90 nop
1400ed6e0: eb40 jmp 0x1400ed722
1400ed6e2: 4c8d05df3ece05 lea r8, [rip + 0x5ce3edf]
1400ed6e9: e8a561ca05 call 0x145d93893
1400ed6ee: 90 nop
1400ed6ef: eb31 jmp 0x1400ed722
1400ed6f1: 4c8d05003fce05 lea r8, [rip + 0x5ce3f00]
1400ed6f8: 4c89c9 mov rcx, r9
1400ed6fb: e89361ca05 call 0x145d93893
1400ed700: 90 nop
1400ed701: eb1f jmp 0x1400ed722
1400ed703: 4c8d05a63ece05 lea r8, [rip + 0x5ce3ea6]
1400ed70a: e88461ca05 call 0x145d93893
1400ed70f: 90 nop
1400ed710: eb10 jmp 0x1400ed722
1400ed712: 4c8d05c73ece05 lea r8, [rip + 0x5ce3ec7]
1400ed719: 4889c1 mov rcx, rax
1400ed71c: e87261ca05 call 0x145d93893
1400ed721: 90 nop
1400ed722: 0f0b ud2
