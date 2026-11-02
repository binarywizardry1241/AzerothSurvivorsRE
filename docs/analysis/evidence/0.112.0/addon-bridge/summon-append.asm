14592efba: f3440f108e4c0a0000 movss xmm9, dword ptr [rsi + 0xa4c]
14592efc3: 4c8bbed8000000 mov r15, qword ptr [rsi + 0xd8]
14592efca: 4c3bbec8000000 cmp r15, qword ptr [rsi + 0xc8]
14592efd1: 7511 jne 0x14592efe4
14592efd3: 488d8ec8000000 lea rcx, [rsi + 0xc8]
14592efda: c6456700 mov byte ptr [rbp + 0x67], 0
14592efde: e80deb2d00 call 0x145c0daf0
14592efe3: 90 nop
14592efe4: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592efeb: 4c89f9 mov rcx, r15
14592efee: 48c1e107 shl rcx, 7
14592eff2: 488b5310 mov rdx, qword ptr [rbx + 0x10]
14592eff6: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
14592effb: 0f1003 movups xmm0, xmmword ptr [rbx]
14592effe: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592f002: 48897c0818 mov qword ptr [rax + rcx + 0x18], rdi
14592f007: 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
14592f00c: 0f57c0 xorps xmm0, xmm0
14592f00f: 0f11440828 movups xmmword ptr [rax + rcx + 0x28], xmm0
14592f014: c744083800000000 mov dword ptr [rax + rcx + 0x38], 0
14592f01c: 660fd67c0840 movq qword ptr [rax + rcx + 0x40], xmm7
14592f022: 66440f7e440848 movd dword ptr [rax + rcx + 0x48], xmm8
14592f029: 660fd67c084c movq qword ptr [rax + rcx + 0x4c], xmm7
14592f02f: 66440f7e440854 movd dword ptr [rax + rcx + 0x54], xmm8
14592f036: 0f280523297500 movaps xmm0, xmmword ptr [rip + 0x752923]
14592f03d: f3410f10c1 movss xmm0, xmm9
14592f042: 0fc6c004 shufps xmm0, xmm0, 4
14592f046: 0f5805339d2d01 addps xmm0, xmmword ptr [rip + 0x12d9d33]
14592f04d: 0f11440858 movups xmmword ptr [rax + rcx + 0x58], xmm0
14592f052: f30f11740868 movss dword ptr [rax + rcx + 0x68], xmm6
14592f058: 0f280571234800 movaps xmm0, xmmword ptr [rip + 0x482371]
14592f05f: f3410f10c1 movss xmm0, xmm9
14592f064: 0f1344086c movlps qword ptr [rax + rcx + 0x6c], xmm0
14592f069: 49ffc7 inc r15
14592f06c: 48c744087400000000 mov qword ptr [rax + rcx + 0x74], 0
14592f075: c644087c00 mov byte ptr [rax + rcx + 0x7c], 0
14592f07a: 4c89bed8000000 mov qword ptr [rsi + 0xd8], r15
14592f081: 488d4d18 lea rcx, [rbp + 0x18]
14592f085: e8164b0900 call 0x1459c3ba0
