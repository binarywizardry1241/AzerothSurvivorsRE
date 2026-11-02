14594ea7b: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
14594ea82: f3440f1089340a0000 movss xmm9, dword ptr [rcx + 0xa34]
14594ea8b: f30f10841890010000 movss xmm0, dword ptr [rax + rbx + 0x190]
14594ea94: 440f2ef8 ucomiss xmm15, xmm0
14594ea98: 7367 jae 0x14594eb01
14594ea9a: 410f28c9 movaps xmm1, xmm9
14594ea9e: f30f5c8c188c010000 subss xmm1, dword ptr [rax + rbx + 0x18c]
14594eaa7: f30f5ec8 divss xmm1, xmm0
14594eaab: 0f57c0 xorps xmm0, xmm0
14594eaae: f30f5fc1 maxss xmm0, xmm1
14594eab2: f30f100de6e74400 movss xmm1, dword ptr [rip + 0x44e7e6]
14594eaba: f30f5dc8 minss xmm1, xmm0
14594eabe: f20f10841874010000 movsd xmm0, qword ptr [rax + rbx + 0x174]
14594eac7: f20f10941880010000 movsd xmm2, qword ptr [rax + rbx + 0x180]
14594ead0: 0f5cd0 subps xmm2, xmm0
14594ead3: f30f12f1 movsldup xmm6, xmm1
14594ead7: 0f59f2 mulps xmm6, xmm2
14594eada: 0f58f0 addps xmm6, xmm0
14594eadd: f30f1084187c010000 movss xmm0, dword ptr [rax + rbx + 0x17c]
14594eae6: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
14594eaf0: f3440f5ce0 subss xmm12, xmm0
14594eaf5: f3440f59e1 mulss xmm12, xmm1
14594eafa: f3440f58e0 addss xmm12, xmm0
14594eaff: eb13 jmp 0x14594eb14
14594eb01: f20f10b41880010000 movsd xmm6, qword ptr [rax + rbx + 0x180]
14594eb0a: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
14594eb14: 4c8bb418f0000000 mov r14, qword ptr [rax + rbx + 0xf0]
14594eb1c: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14594eb23: 488b8898090000 mov rcx, qword ptr [rax + 0x998]
14594eb2a: 4883c110 add rcx, 0x10
14594eb2e: f30f16d6 movshdup xmm2, xmm6
14594eb32: 0f28ce movaps xmm1, xmm6
14594eb35: e85684f8ff call 0x1458d6f90
14594eb3a: 0f28f8 movaps xmm7, xmm0
14594eb3d: a801 test al, 1
14594eb3f: 7504 jne 0x14594eb45
14594eb41: 410f28fc movaps xmm7, xmm12
14594eb45: 4c8b8da8010000 mov r9, qword ptr [rbp + 0x1a8]
14594eb4c: 66410f6ec1 movd xmm0, r9d
14594eb51: 448b8570020000 mov r8d, dword ptr [rbp + 0x270]
14594eb58: 66410f6ec8 movd xmm1, r8d
14594eb5d: 660f62c8 punpckldq xmm1, xmm0
14594eb61: 0f28c6 movaps xmm0, xmm6
14594eb64: 0f5cc1 subps xmm0, xmm1
14594eb67: 0f59c0 mulps xmm0, xmm0
14594eb6a: f30f16c8 movshdup xmm1, xmm0
14594eb6e: f30f58c8 addss xmm1, xmm0
14594eb72: 450f57e4 xorps xmm12, xmm12
14594eb76: f3440f51e1 sqrtss xmm12, xmm1
14594eb7b: f3450f5ee6 divss xmm12, xmm14
14594eb80: f3450f5fe5 maxss xmm12, xmm13
14594eb85: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
14594eb8c: 418b87640a0000 mov eax, dword ptr [r15 + 0xa64]
14594eb93: ffc0 inc eax
14594eb95: 410f28c4 movaps xmm0, xmm12
14594eb99: f3410f59c3 mulss xmm0, xmm11
14594eb9e: f3480f2cc8 cvttss2si rcx, xmm0
14594eba3: 410f2ec7 ucomiss xmm0, xmm15
14594eba7: ba00000000 mov edx, 0
14594ebac: 0f42ca cmovb ecx, edx
14594ebaf: 410f2ec2 ucomiss xmm0, xmm10
14594ebb3: 418987640a0000 mov dword ptr [r15 + 0xa64], eax
14594ebba: baffffffff mov edx, 0xffffffff
14594ebbf: 0f47ca cmova ecx, edx
14594ebc2: 0f13b5f0000000 movlps qword ptr [rbp + 0xf0], xmm6
14594ebc9: f30f11bdf8000000 movss dword ptr [rbp + 0xf8], xmm7
14594ebd1: 44898540010000 mov dword ptr [rbp + 0x140], r8d
14594ebd8: 4c898d44010000 mov qword ptr [rbp + 0x144], r9
14594ebdf: 89442420 mov dword ptr [rsp + 0x20], eax
14594ebe3: 894c2428 mov dword ptr [rsp + 0x28], ecx
14594ebe7: 488d8de0010000 lea rcx, [rbp + 0x1e0]
14594ebee: 4c89f2 mov rdx, r14
14594ebf1: 4c8d85f0000000 lea r8, [rbp + 0xf0]
14594ebf8: 4c8d8d40010000 lea r9, [rbp + 0x140]
14594ebff: e88c3ff7ff call 0x1458c2b90
14594ec04: 498bb728060000 mov rsi, qword ptr [r15 + 0x628]
14594ec0b: 493bb718060000 cmp rsi, qword ptr [r15 + 0x618]
14594ec12: 750d jne 0x14594ec21
14594ec14: 488b8d90020000 mov rcx, qword ptr [rbp + 0x290]
14594ec1b: e8f0c12a00 call 0x145bfae10
14594ec20: 90 nop
14594ec21: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
14594ec28: 498b8720060000 mov rax, qword ptr [r15 + 0x620]
14594ec2f: 4889f1 mov rcx, rsi
14594ec32: 48c1e105 shl rcx, 5
14594ec36: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
14594ec3d: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
14594ec44: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594ec49: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594ec4d: 48ffc6 inc rsi
14594ec50: 4989b728060000 mov qword ptr [r15 + 0x628], rsi
14594ec57: 8b8570020000 mov eax, dword ptr [rbp + 0x270]
14594ec5d: 898544010000 mov dword ptr [rbp + 0x144], eax
14594ec63: 488b85a8010000 mov rax, qword ptr [rbp + 0x1a8]
14594ec6a: 48898548010000 mov qword ptr [rbp + 0x148], rax
14594ec71: c7854001000001000000 mov dword ptr [rbp + 0x140], 1
14594ec7b: c785f000000000000000 mov dword ptr [rbp + 0xf0], 0
14594ec85: 488d85f0000000 lea rax, [rbp + 0xf0]
14594ec8c: 4889442430 mov qword ptr [rsp + 0x30], rax
14594ec91: 488d8540010000 lea rax, [rbp + 0x140]
14594ec98: 4889442428 mov qword ptr [rsp + 0x28], rax
14594ec9d: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14594eca6: 41b908000000 mov r9d, 8
14594ecac: 488d8de0010000 lea rcx, [rbp + 0x1e0]
14594ecb3: 4c89f2 mov rdx, r14
14594ecb6: 41b864000000 mov r8d, 0x64
14594ecbc: e8afeaf7ff call 0x1458cd770
14594ecc1: 498bb728060000 mov rsi, qword ptr [r15 + 0x628]
14594ecc8: 493bb718060000 cmp rsi, qword ptr [r15 + 0x618]
14594eccf: 750d jne 0x14594ecde
14594ecd1: 488b8d90020000 mov rcx, qword ptr [rbp + 0x290]
14594ecd8: e833c12a00 call 0x145bfae10
14594ecdd: 90 nop
14594ecde: 4c8bad48020000 mov r13, qword ptr [rbp + 0x248]
14594ece5: 498b8520060000 mov rax, qword ptr [r13 + 0x620]
14594ecec: 4889f1 mov rcx, rsi
14594ecef: 48c1e105 shl rcx, 5
14594ecf3: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
14594ecfa: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
14594ed01: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594ed06: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594ed0a: 48ffc6 inc rsi
14594ed0d: 4989b528060000 mov qword ptr [r13 + 0x628], rsi
14594ed14: 498b9568050000 mov rdx, qword ptr [r13 + 0x568]
14594ed1b: 4839d7 cmp rdi, rdx
14594ed1e: 0f83c64c0000 jae 0x1459539ea
14594ed24: 498b8560050000 mov rax, qword ptr [r13 + 0x560]
14594ed2b: 0f13b41874010000 movlps qword ptr [rax + rbx + 0x174], xmm6
14594ed33: f30f11bc187c010000 movss dword ptr [rax + rbx + 0x17c], xmm7
14594ed3c: 8b8d70020000 mov ecx, dword ptr [rbp + 0x270]
14594ed42: 898c1880010000 mov dword ptr [rax + rbx + 0x180], ecx
14594ed49: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
14594ed50: 48898c1884010000 mov qword ptr [rax + rbx + 0x184], rcx
14594ed58: f3440f118c188c010000 movss dword ptr [rax + rbx + 0x18c], xmm9
14594ed62: f3440f11a41890010000 movss dword ptr [rax + rbx + 0x190], xmm12
14594ed6c: f3450f58cc addss xmm9, xmm12
14594ed71: f3450f58c8 addss xmm9, xmm8
14594ed76: f3440f118c1894010000 movss dword ptr [rax + rbx + 0x194], xmm9
14594ed80: f30f10841898010000 movss xmm0, dword ptr [rax + rbx + 0x198]
14594ed89: f3440f582562344900 addss xmm12, dword ptr [rip + 0x493462]
14594ed92: 0f28c8 movaps xmm1, xmm0
14594ed95: f3410f5fcc maxss xmm1, xmm12
14594ed9a: 0f28d1 movaps xmm2, xmm1
14594ed9d: f30fc2d103 cmpunordss xmm2, xmm1
14594eda2: 0f54c2 andps xmm0, xmm2
14594eda5: 0f55d1 andnps xmm2, xmm1
14594eda8: 0f56d0 orps xmm2, xmm0
14594edab: f30f11941898010000 movss dword ptr [rax + rbx + 0x198], xmm2
