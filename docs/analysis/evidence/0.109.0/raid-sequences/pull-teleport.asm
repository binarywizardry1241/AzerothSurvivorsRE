14594edf2: 450f28fe movaps xmm15, xmm14
14594edf6: f2440f108c1880010000 movsd xmm9, qword ptr [rax + rbx + 0x180]
14594ee00: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
14594ee0a: 488bb548020000 mov rsi, qword ptr [rbp + 0x248]
14594ee11: 4c8bac18f0000000 mov r13, qword ptr [rax + rbx + 0xf0]
14594ee19: f3440f10b4186c010000 movss xmm14, dword ptr [rax + rbx + 0x16c]
14594ee23: f30f108ec8040000 movss xmm1, dword ptr [rsi + 0x4c8]
14594ee2b: f30f1086cc040000 movss xmm0, dword ptr [rsi + 0x4cc]
14594ee33: f3450f16e9 movshdup xmm13, xmm9
14594ee38: f3410f5cc5 subss xmm0, xmm13
14594ee3d: f3410f5cc9 subss xmm1, xmm9
14594ee42: e8dcb22a00 call 0x145bfa123
14594ee47: 0f28f8 movaps xmm7, xmm0
14594ee4a: f3440f5835755e4800 addss xmm14, dword ptr [rip + 0x485e75]
14594ee53: e8c5b22a00 call 0x145bfa11d
14594ee58: 0f28f0 movaps xmm6, xmm0
14594ee5b: 0f28c7 movaps xmm0, xmm7
14594ee5e: e8b4b22a00 call 0x145bfa117
14594ee63: f3410f12ce movsldup xmm1, xmm14
14594ee68: 0f14f0 unpcklps xmm6, xmm0
14594ee6b: 0f59f1 mulps xmm6, xmm1
14594ee6e: 410f58f1 addps xmm6, xmm9
14594ee72: 488bbe98090000 mov rdi, qword ptr [rsi + 0x998]
14594ee79: 48837f40ff cmp qword ptr [rdi + 0x40], -1
14594ee7e: 0f848f000000 je 0x14594ef13
14594ee84: 488d4f40 lea rcx, [rdi + 0x40]
14594ee88: 66440f7eca movd edx, xmm9
14594ee8d: 66440f7ee8 movd eax, xmm13
14594ee92: 48c1e020 shl rax, 0x20
14594ee96: 4809c2 or rdx, rax
14594ee99: 66410f7ef0 movd r8d, xmm6
14594ee9e: f30f16c6 movshdup xmm0, xmm6
14594eea2: 660f7ec0 movd eax, xmm0
14594eea6: 48c1e020 shl rax, 0x20
14594eeaa: 4909c0 or r8, rax
14594eead: e82e25f8ff call 0x1458d13e0
14594eeb2: 0f2e05e7e34400 ucomiss xmm0, dword ptr [rip + 0x44e3e7]
14594eeb9: 7358 jae 0x14594ef13
14594eebb: 410f28c9 movaps xmm1, xmm9
14594eebf: 0f5cce subps xmm1, xmm6
14594eec2: 0f59c9 mulps xmm1, xmm1
14594eec5: f30f16d1 movshdup xmm2, xmm1
14594eec9: f30f58d1 addss xmm2, xmm1
14594eecd: 0f57c9 xorps xmm1, xmm1
14594eed0: f30f51ca sqrtss xmm1, xmm2
14594eed4: f30f1015c8e34400 movss xmm2, dword ptr [rip + 0x44e3c8]
14594eedc: f30f5fca maxss xmm1, xmm2
14594eee0: f30f5ed1 divss xmm2, xmm1
14594eee4: f30f5cc2 subss xmm0, xmm2
14594eee8: 0f57c9 xorps xmm1, xmm1
14594eeeb: f30f5fc1 maxss xmm0, xmm1
14594eeef: 410f5cf1 subps xmm6, xmm9
14594eef3: f30f12c8 movsldup xmm1, xmm0
14594eef7: 0f59ce mulps xmm1, xmm6
14594eefa: 410f58c9 addps xmm1, xmm9
14594eefe: 410f28d4 movaps xmm2, xmm12
14594ef02: f3410f5cd4 subss xmm2, xmm12
14594ef07: f30f59d0 mulss xmm2, xmm0
14594ef0b: f3440f58e2 addss xmm12, xmm2
14594ef10: 0f28f1 movaps xmm6, xmm1
14594ef13: 450f28f7 movaps xmm14, xmm15
14594ef17: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14594ef1e: 488b8890020000 mov rcx, qword ptr [rax + 0x290]
14594ef25: 488b9098020000 mov rdx, qword ptr [rax + 0x298]
14594ef2c: e89fe1f3ff call 0x14588d0d0
14594ef31: 4869f0f0000000 imul rsi, rax, 0xf0
14594ef38: 488d1d51f42801 lea rbx, [rip + 0x128f451]
14594ef3f: f2440f10ac1ec8000000 movsd xmm13, qword ptr [rsi + rbx + 0xc8]
14594ef49: 440f28ce movaps xmm9, xmm6
14594ef4d: 450f5ccd subps xmm9, xmm13
14594ef51: f3410f16c9 movshdup xmm1, xmm9
14594ef56: 410f28c1 movaps xmm0, xmm9
14594ef5a: e8d0b12a00 call 0x145bfa12f
14594ef5f: f30f108c1ed8000000 movss xmm1, dword ptr [rsi + rbx + 0xd8]
14594ef68: f30f580dd00c8b00 addss xmm1, dword ptr [rip + 0x8b0cd0]
14594ef70: f30f1015a4354900 movss xmm2, dword ptr [rip + 0x4935a4]
14594ef78: 0f2ed0 ucomiss xmm2, xmm0
14594ef7b: 7723 ja 0x14594efa0
14594ef7d: 0f2ec8 ucomiss xmm1, xmm0
14594ef80: 450f57ff xorps xmm15, xmm15
14594ef84: 731e jae 0x14594efa4
14594ef86: f30f12c0 movsldup xmm0, xmm0
14594ef8a: 440f5ec8 divps xmm9, xmm0
14594ef8e: f30f12c1 movsldup xmm0, xmm1
14594ef92: 410f59c1 mulps xmm0, xmm9
14594ef96: 440f58e8 addps xmm13, xmm0
14594ef9a: 410f28f5 movaps xmm6, xmm13
14594ef9e: eb04 jmp 0x14594efa4
14594efa0: 450f57ff xorps xmm15, xmm15
14594efa4: 4883c710 add rdi, 0x10
14594efa8: f30f16d6 movshdup xmm2, xmm6
14594efac: 4889f9 mov rcx, rdi
14594efaf: 0f28ce movaps xmm1, xmm6
14594efb2: e8d97ff8ff call 0x1458d6f90
14594efb7: 440f28c8 movaps xmm9, xmm0
14594efbb: a801 test al, 1
14594efbd: 7504 jne 0x14594efc3
14594efbf: 450f28cc movaps xmm9, xmm12
14594efc3: f3440f580dd8e24400 addss xmm9, dword ptr [rip + 0x44e2d8]
14594efcc: f30f583dcc334900 addss xmm7, dword ptr [rip + 0x4933cc]
14594efd4: 488bbd48020000 mov rdi, qword ptr [rbp + 0x248]
14594efdb: 448b8748050000 mov r8d, dword ptr [rdi + 0x548]
14594efe2: 418d4001 lea eax, [r8 + 1]
14594efe6: 898748050000 mov dword ptr [rdi + 0x548], eax
14594efec: 488b9760040000 mov rdx, qword ptr [rdi + 0x460]
14594eff3: 0f13b540010000 movlps qword ptr [rbp + 0x140], xmm6
14594effa: f3440f118d48010000 movss dword ptr [rbp + 0x148], xmm9
14594f003: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14594f009: 488d8de0010000 lea rcx, [rbp + 0x1e0]
14594f010: 4c8d8d40010000 lea r9, [rbp + 0x140]
14594f017: e824eef7ff call 0x1458cde40
14594f01c: 488bb728060000 mov rsi, qword ptr [rdi + 0x628]
14594f023: 483bb718060000 cmp rsi, qword ptr [rdi + 0x618]
14594f02a: 450f28eb movaps xmm13, xmm11
14594f02e: 750d jne 0x14594f03d
14594f030: 488b8d90020000 mov rcx, qword ptr [rbp + 0x290]
14594f037: e8d4bd2a00 call 0x145bfae10
14594f03c: 90 nop
14594f03d: 488bbd48020000 mov rdi, qword ptr [rbp + 0x248]
14594f044: 488b8720060000 mov rax, qword ptr [rdi + 0x620]
14594f04b: 4889f1 mov rcx, rsi
14594f04e: 48c1e105 shl rcx, 5
14594f052: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
14594f059: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
14594f060: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594f065: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594f069: 48ffc6 inc rsi
14594f06c: 4889b728060000 mov qword ptr [rdi + 0x628], rsi
14594f073: c787f809000001000000 mov dword ptr [rdi + 0x9f8], 1
14594f07d: 0f13b7fc090000 movlps qword ptr [rdi + 0x9fc], xmm6
14594f084: f3440f118f040a0000 movss dword ptr [rdi + 0xa04], xmm9
14594f08d: c687080a00000c mov byte ptr [rdi + 0xa08], 0xc
14594f094: 0f13b7c8040000 movlps qword ptr [rdi + 0x4c8], xmm6
14594f09b: f3440f118fd0040000 movss dword ptr [rdi + 0x4d0], xmm9
14594f0a4: 0f13b544010000 movlps qword ptr [rbp + 0x144], xmm6
14594f0ab: f3440f118d4c010000 movss dword ptr [rbp + 0x14c], xmm9
14594f0b4: c7854001000001000000 mov dword ptr [rbp + 0x140], 1
14594f0be: c785f000000000000000 mov dword ptr [rbp + 0xf0], 0
14594f0c8: 488d85f0000000 lea rax, [rbp + 0xf0]
14594f0cf: 4889442430 mov qword ptr [rsp + 0x30], rax
14594f0d4: 488d8540010000 lea rax, [rbp + 0x140]
14594f0db: 4889442428 mov qword ptr [rsp + 0x28], rax
14594f0e0: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14594f0e9: 41b908000000 mov r9d, 8
14594f0ef: 488d8de0010000 lea rcx, [rbp + 0x1e0]
14594f0f6: 4c89ea mov rdx, r13
14594f0f9: 41b89b520000 mov r8d, 0x529b
14594f0ff: e86ce6f7ff call 0x1458cd770
14594f104: 488bb728060000 mov rsi, qword ptr [rdi + 0x628]
14594f10b: 483bb718060000 cmp rsi, qword ptr [rdi + 0x618]
14594f112: 450f28da movaps xmm11, xmm10
14594f116: 750d jne 0x14594f125
14594f118: 488b8d90020000 mov rcx, qword ptr [rbp + 0x290]
14594f11f: e8ecbc2a00 call 0x145bfae10
14594f124: 90 nop
14594f125: 4c8bad48020000 mov r13, qword ptr [rbp + 0x248]
14594f12c: 498b8520060000 mov rax, qword ptr [r13 + 0x620]
14594f133: 4889f1 mov rcx, rsi
14594f136: 48c1e105 shl rcx, 5
14594f13a: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
14594f141: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
14594f148: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594f14d: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594f151: 48ffc6 inc rsi
14594f154: 4989b528060000 mov qword ptr [r13 + 0x628], rsi
14594f15b: 450f28d0 movaps xmm10, xmm8
14594f15f: f3440f1005d43c4800 movss xmm8, dword ptr [rip + 0x483cd4]
14594f168: 4d8bb5b0050000 mov r14, qword ptr [r13 + 0x5b0]
14594f16f: 488b8d38020000 mov rcx, qword ptr [rbp + 0x238]
14594f176: 4c39f1 cmp rcx, r14
14594f179: 0f824cfcffff jb 0x14594edcb
14594f17f: eb26 jmp 0x14594f1a7
