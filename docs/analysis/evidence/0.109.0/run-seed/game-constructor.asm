0x14592da47: 488b85880d0000           mov rax, qword ptr [rbp + 0xd88]
0x14592da4e: 488b9010010000           mov rdx, qword ptr [rax + 0x110]
0x14592da55: c685960d000001           mov byte ptr [rbp + 0xd96], 1
0x14592da5c: c685950d000001           mov byte ptr [rbp + 0xd95], 1
0x14592da63: 488d4d10                 lea rcx, [rbp + 0x10]
0x14592da67: e864eafdff               call 0x14590c4d0
0x14592da6c: 90                       nop
0x14592eb55: e83681ffff               call 0x145926c90
0x14592eb5a: 90                       nop
0x14592eb5b: f30f1085a8040000         movss xmm0, dword ptr [rbp + 0x4a8]
0x14592eb63: f30f118510050000         movss dword ptr [rbp + 0x510], xmm0
0x14592eb6b: 488d5530                 lea rdx, [rbp + 0x30]
0x14592eb6f: 41b8c80a0000             mov r8d, 0xac8
0x14592eb75: 488bb5380c0000           mov rsi, qword ptr [rbp + 0xc38]
0x14592eb7c: 4889f1                   mov rcx, rsi
0x14592eb7f: e863b52c00               call 0x145bfa0e7
0x14592eb84: 4889f0                   mov rax, rsi
0x14592eb87: 0f28b5a00d0000           movaps xmm6, xmmword ptr [rbp + 0xda0]
0x14592eb8e: 0f28bdb00d0000           movaps xmm7, xmmword ptr [rbp + 0xdb0]
0x14592eb95: 440f2885c00d0000         movaps xmm8, xmmword ptr [rbp + 0xdc0]
0x14592eb9d: 440f288dd00d0000         movaps xmm9, xmmword ptr [rbp + 0xdd0]
0x14592eba5: 440f2895e00d0000         movaps xmm10, xmmword ptr [rbp + 0xde0]
0x14592ebad: 440f289df00d0000         movaps xmm11, xmmword ptr [rbp + 0xdf0]
0x14592ebb5: 440f28a5000e0000         movaps xmm12, xmmword ptr [rbp + 0xe00]
0x14592ebbd: 440f28ad100e0000         movaps xmm13, xmmword ptr [rbp + 0xe10]
0x14592ebc5: 440f28b5200e0000         movaps xmm14, xmmword ptr [rbp + 0xe20]
0x14592ebcd: 440f28bd300e0000         movaps xmm15, xmmword ptr [rbp + 0xe30]
0x14592ebd5: 4881c4c80e0000           add rsp, 0xec8
0x14592ebdc: 5b                       pop rbx
0x14592ebdd: 5f                       pop rdi
0x14592ebde: 5e                       pop rsi
0x14592ebdf: 415c                     pop r12
0x14592ebe1: 415d                     pop r13
0x14592ebe3: 415e                     pop r14
0x14592ebe5: 415f                     pop r15
0x14592ebe7: 5d                       pop rbp
0x14592ebe8: c3                       ret
0x14592ec37: c685960d000001           mov byte ptr [rbp + 0xd96], 1
0x14592ec3e: c685950d000001           mov byte ptr [rbp + 0xd95], 1
0x14592ec45: b908000000               mov ecx, 8
0x14592ec4a: ba68000000               mov edx, 0x68
0x14592ec4f: e84da64600               call 0x145d992a1
0x14592ec54: 90                       nop
0x14592ec55: e9bd000000               jmp 0x14592ed17
0x14592ec5a: b908000000               mov ecx, 8
0x14592ec5f: ba10000000               mov edx, 0x10
0x14592ec64: e838a64600               call 0x145d992a1
0x14592ec69: 90                       nop
0x14592ec6a: e9a8000000               jmp 0x14592ed17
0x14592ec6f: 488d85e00c0000           lea rax, [rbp + 0xce0]
0x14592ec76: 48894530                 mov qword ptr [rbp + 0x30], rax
0x14592ec7a: 488d053f346dfa           lea rax, [rip - 0x592cbc1]
0x14592ec81: 48894538                 mov qword ptr [rbp + 0x38], rax
0x14592ec85: c685960d000001           mov byte ptr [rbp + 0xd96], 1
0x14592ec8c: c685950d000001           mov byte ptr [rbp + 0xd95], 1
0x14592ec93: 488d0d5e212b01           lea rcx, [rip + 0x12b215e]
0x14592ec9a: 4c8d0567212b01           lea r8, [rip + 0x12b2167]
0x14592eca1: 488d5530                 lea rdx, [rbp + 0x30]
0x14592eca5: e886ab4600               call 0x145d99830
0x14592ecaa: 90                       nop
0x14592ecab: eb6a                     jmp 0x14592ed17
0x14592ecad: 488d85e00c0000           lea rax, [rbp + 0xce0]
0x14592ecb4: 48894530                 mov qword ptr [rbp + 0x30], rax
0x14592ecb8: 488d0501346dfa           lea rax, [rip - 0x592cbff]
0x14592ecbf: 48894538                 mov qword ptr [rbp + 0x38], rax
0x14592ecc3: c685960d000001           mov byte ptr [rbp + 0xd96], 1
0x14592ecca: c685950d000001           mov byte ptr [rbp + 0xd95], 1
0x14592ecd1: 488d0d20212b01           lea rcx, [rip + 0x12b2120]
0x14592ecd8: 4c8d0529212b01           lea r8, [rip + 0x12b2129]
0x14592ecdf: 488d5530                 lea rdx, [rbp + 0x30]
0x14592ece3: e848ab4600               call 0x145d99830
0x14592ece8: 90                       nop
0x14592ece9: eb2c                     jmp 0x14592ed17
0x14592eceb: c685970d000000           mov byte ptr [rbp + 0xd97], 0
0x14592ecf2: b904000000               mov ecx, 4
0x14592ecf7: 4889da                   mov rdx, rbx
0x14592ecfa: e8bca54600               call 0x145d992bb
0x14592ecff: 90                       nop
0x14592ed00: eb15                     jmp 0x14592ed17
0x14592ed02: c685970d000000           mov byte ptr [rbp + 0xd97], 0
0x14592ed09: b904000000               mov ecx, 4
0x14592ed0e: 4889da                   mov rdx, rbx
0x14592ed11: e8a5a54600               call 0x145d992bb
0x14592ed16: 90                       nop
0x14592ed17: 0f0b                     ud2
