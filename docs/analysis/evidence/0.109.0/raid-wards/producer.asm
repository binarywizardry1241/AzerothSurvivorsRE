14595ace9: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
14595acf0: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595acf7: 483995f0000000 cmp qword ptr [rbp + 0xf0], rdx
14595acfe: 0f83911f0000 jae 0x14595cc95
14595ad04: 488b4110 mov rax, qword ptr [rcx + 0x10]
14595ad08: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
14595ad0f: 448b29 mov r13d, dword ptr [rcx]
14595ad12: 4c8d6104 lea r12, [rcx + 4]
14595ad16: f30f10411c movss xmm0, dword ptr [rcx + 0x1c]
14595ad1b: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
14595ad23: 8b4118 mov eax, dword ptr [rcx + 0x18]
14595ad26: 83f801 cmp eax, 1
14595ad29: 83d000 adc eax, 0
14595ad2c: f30f104124 movss xmm0, dword ptr [rcx + 0x24]
14595ad31: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
14595ad39: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14595ad40: 0f57c0 xorps xmm0, xmm0
14595ad43: f3480f2ac0 cvtsi2ss xmm0, rax
14595ad48: f30f104920 movss xmm1, dword ptr [rcx + 0x20]
14595ad4d: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
14595ad54: f30f101548254400 movss xmm2, dword ptr [rip + 0x442548]
14595ad5c: f30f59d0 mulss xmm2, xmm0
14595ad60: f30f115540 movss dword ptr [rbp + 0x40], xmm2
14595ad65: f3440f103d32764800 movss xmm15, dword ptr [rip + 0x487632]
14595ad6e: f3440f5ef8 divss xmm15, xmm0
14595ad73: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
14595ad7a: f30f598c085c010000 mulss xmm1, dword ptr [rax + rcx + 0x15c]
14595ad83: f30f118dcc000000 movss dword ptr [rbp + 0xcc], xmm1
14595ad8b: f3440f108db0000000 movss xmm9, dword ptr [rbp + 0xb0]
14595ad94: 660f6f8550010000 movdqa xmm0, xmmword ptr [rbp + 0x150]
14595ad9c: 660f7ec1 movd ecx, xmm0
14595ada0: 66440f7ed0 movd eax, xmm10
14595ada5: 48c1e020 shl rax, 0x20
14595ada9: 4809c1 or rcx, rax
14595adac: 48894d50 mov qword ptr [rbp + 0x50], rcx
14595adb0: 410f28c1 movaps xmm0, xmm9
14595adb4: f3410f5cc1 subss xmm0, xmm9
14595adb9: f30f114560 movss dword ptr [rbp + 0x60], xmm0
14595adbe: 4531ff xor r15d, r15d
14595adc1: f3440f101dfa224700 movss xmm11, dword ptr [rip + 0x4722fa]
14595adca: f3440f102555eb8c01 movss xmm12, dword ptr [rip + 0x18ceb55]
14595add3: f30f103d21234700 movss xmm7, dword ptr [rip + 0x472321]
14595addb: f3440f102dbc244400 movss xmm13, dword ptr [rip + 0x4424bc]
14595ade4: e981000000 jmp 0x14595ae6a
14595ade9: 41ffc7 inc r15d
14595adec: 0f13b560010000 movlps qword ptr [rbp + 0x160], xmm6
14595adf3: f30f118568010000 movss dword ptr [rbp + 0x168], xmm0
14595adfb: 4489ad10010000 mov dword ptr [rbp + 0x110], r13d
14595ae02: 418b442408 mov eax, dword ptr [r12 + 8]
14595ae07: 488d8d14010000 lea rcx, [rbp + 0x114]
14595ae0e: 894108 mov dword ptr [rcx + 8], eax
14595ae11: 498b0424 mov rax, qword ptr [r12]
14595ae15: 488901 mov qword ptr [rcx], rax
14595ae18: f30f10850c010000 movss xmm0, dword ptr [rbp + 0x10c]
14595ae20: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
14595ae26: f30f1085cc000000 movss xmm0, dword ptr [rbp + 0xcc]
14595ae2e: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
14595ae34: 488d8560010000 lea rax, [rbp + 0x160]
14595ae3b: 4889442420 mov qword ptr [rsp + 0x20], rax
14595ae40: 4889f1 mov rcx, rsi
14595ae43: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595ae4a: 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
14595ae51: 4c8d8d10010000 lea r9, [rbp + 0x110]
14595ae58: e88334ffff call 0x14594e2e0
14595ae5d: 443bbdb8000000 cmp r15d, dword ptr [rbp + 0xb8]
14595ae64: 0f84b80f0000 je 0x14595be22
14595ae6a: 488b96a0090000 mov rdx, qword ptr [rsi + 0x9a0]
14595ae71: 488b86a8090000 mov rax, qword ptr [rsi + 0x9a8]
14595ae78: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
14595ae7f: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
14595ae86: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14595ae90: 4e8d0c02 lea r9, [rdx + r8]
14595ae94: 49c1c117 rol r9, 0x17
14595ae98: 4901d1 add r9, rdx
14595ae9b: 4989c2 mov r10, rax
14595ae9e: 49c1e211 shl r10, 0x11
14595aea2: 4831d1 xor rcx, rdx
14595aea5: 4931c0 xor r8, rax
14595aea8: 4831c8 xor rax, rcx
14595aeab: 4c31c2 xor rdx, r8
14595aeae: 4c31d1 xor rcx, r10
14595aeb1: 49c1c02d rol r8, 0x2d
14595aeb5: 49c1e929 shr r9, 0x29
14595aeb9: 4181c90000803f or r9d, 0x3f800000
14595aec0: 66450f6ed1 movd xmm10, r9d
14595aec5: f3450f58d3 addss xmm10, xmm11
14595aeca: f3450f59d4 mulss xmm10, xmm12
14595aecf: f3440f58d7 addss xmm10, xmm7
14595aed4: 450f2eea ucomiss xmm13, xmm10
14595aed8: 76b6 jbe 0x14595ae90
14595aeda: 4589f9 mov r9d, r15d
14595aedd: 0f57f6 xorps xmm6, xmm6
14595aee0: f3490f2af1 cvtsi2ss xmm6, r9
14595aee5: f30f5835b7234400 addss xmm6, dword ptr [rip + 0x4423b7]
14595aeed: f30f5c7540 subss xmm6, dword ptr [rbp + 0x40]
14595aef2: f3410f59f7 mulss xmm6, xmm15
14595aef7: f30f58b578010000 addss xmm6, dword ptr [rbp + 0x178]
14595aeff: 488996a0090000 mov qword ptr [rsi + 0x9a0], rdx
14595af06: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
14595af0d: 488986a8090000 mov qword ptr [rsi + 0x9a8], rax
14595af14: 48898eb0090000 mov qword ptr [rsi + 0x9b0], rcx
14595af1b: f3440f5995e0000000 mulss xmm10, dword ptr [rbp + 0xe0]
14595af24: 0f28c6 movaps xmm0, xmm6
14595af27: e8f1f12900 call 0x145bfa11d
14595af2c: 440f28c0 movaps xmm8, xmm0
14595af30: 0f28c6 movaps xmm0, xmm6
14595af33: e8dff12900 call 0x145bfa117
14595af38: 440f14c0 unpcklps xmm8, xmm0
14595af3c: f3410f12f2 movsldup xmm6, xmm10
14595af41: 410f59f0 mulps xmm6, xmm8
14595af45: 0f58b550010000 addps xmm6, xmmword ptr [rbp + 0x150]
14595af4c: 4c8bb698090000 mov r14, qword ptr [rsi + 0x998]
14595af53: 49837e40ff cmp qword ptr [r14 + 0x40], -1
14595af58: 0f8488000000 je 0x14595afe6
14595af5e: 4983c640 add r14, 0x40
14595af62: 66410f7ef0 movd r8d, xmm6
14595af67: f30f16c6 movshdup xmm0, xmm6
14595af6b: 660f7ec0 movd eax, xmm0
14595af6f: 48c1e020 shl rax, 0x20
14595af73: 4909c0 or r8, rax
14595af76: 4c89f1 mov rcx, r14
14595af79: 488b5550 mov rdx, qword ptr [rbp + 0x50]
14595af7d: e85e64f7ff call 0x1458d13e0
14595af82: 410f2ec5 ucomiss xmm0, xmm13
14595af86: 7364 jae 0x14595afec
14595af88: 440f28c0 movaps xmm8, xmm0
14595af8c: 0f289550010000 movaps xmm2, xmmword ptr [rbp + 0x150]
14595af93: 0f28c2 movaps xmm0, xmm2
14595af96: 0f5cc6 subps xmm0, xmm6
14595af99: 0f59c0 mulps xmm0, xmm0
14595af9c: f30f16c8 movshdup xmm1, xmm0
14595afa0: f30f58c8 addss xmm1, xmm0
14595afa4: 0f57c0 xorps xmm0, xmm0
14595afa7: f30f51c1 sqrtss xmm0, xmm1
14595afab: f30f100df1224400 movss xmm1, dword ptr [rip + 0x4422f1]
14595afb3: f30f5fc1 maxss xmm0, xmm1
14595afb7: f30f5ec8 divss xmm1, xmm0
14595afbb: f3440f5cc1 subss xmm8, xmm1
14595afc0: 0f57c0 xorps xmm0, xmm0
14595afc3: f3440f5fc0 maxss xmm8, xmm0
14595afc8: 0f5cf2 subps xmm6, xmm2
14595afcb: f3410f12c0 movsldup xmm0, xmm8
14595afd0: 0f59c6 mulps xmm0, xmm6
14595afd3: 0f58c2 addps xmm0, xmm2
14595afd6: f3440f594560 mulss xmm8, dword ptr [rbp + 0x60]
14595afdc: f3450f58c1 addss xmm8, xmm9
14595afe1: 0f28f0 movaps xmm6, xmm0
14595afe4: eb0a jmp 0x14595aff0
14595afe6: 450f28c1 movaps xmm8, xmm9
14595afea: eb0b jmp 0x14595aff7
14595afec: 450f28c1 movaps xmm8, xmm9
14595aff0: 4c8bb698090000 mov r14, qword ptr [rsi + 0x998]
14595aff7: 488b8e90020000 mov rcx, qword ptr [rsi + 0x290]
14595affe: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
14595b005: e8c620f3ff call 0x14588d0d0
14595b00a: 4869f8f0000000 imul rdi, rax, 0xf0
14595b011: 488d1d78332801 lea rbx, [rip + 0x1283378]
14595b018: f2440f10b41fc8000000 movsd xmm14, qword ptr [rdi + rbx + 0xc8]
14595b022: 440f28d6 movaps xmm10, xmm6
14595b026: 450f5cd6 subps xmm10, xmm14
14595b02a: f3410f16ca movshdup xmm1, xmm10
14595b02f: 410f28c2 movaps xmm0, xmm10
14595b033: e8f7f02900 call 0x145bfa12f
14595b038: f30f108c1fd8000000 movss xmm1, dword ptr [rdi + rbx + 0xd8]
14595b041: f30f580df74b8a00 addss xmm1, dword ptr [rip + 0x8a4bf7]
14595b049: f30f1015cb744800 movss xmm2, dword ptr [rip + 0x4874cb]
14595b051: 0f2ed0 ucomiss xmm2, xmm0
14595b054: 771d ja 0x14595b073
14595b056: 0f2ec8 ucomiss xmm1, xmm0
14595b059: 7318 jae 0x14595b073
14595b05b: f30f12c0 movsldup xmm0, xmm0
14595b05f: 440f5ed0 divps xmm10, xmm0
14595b063: f30f12c1 movsldup xmm0, xmm1
14595b067: 410f59c2 mulps xmm0, xmm10
14595b06b: 440f58f0 addps xmm14, xmm0
14595b06f: 410f28f6 movaps xmm6, xmm14
14595b073: 4983c610 add r14, 0x10
14595b077: f30f16d6 movshdup xmm2, xmm6
14595b07b: 4c89f1 mov rcx, r14
14595b07e: 0f28ce movaps xmm1, xmm6
14595b081: e80abff7ff call 0x1458d6f90
14595b086: a801 test al, 1
14595b088: 0f855bfdffff jne 0x14595ade9
14595b08e: 410f28c0 movaps xmm0, xmm8
14595b092: e952fdffff jmp 0x14595ade9
