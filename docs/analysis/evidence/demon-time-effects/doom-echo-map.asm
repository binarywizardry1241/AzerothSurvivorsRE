0x1459eb780: 56 push rsi
0x1459eb781: 57 push rdi
0x1459eb782: 53 push rbx
0x1459eb783: 4889c8 mov rax, rcx
0x1459eb786: 488b0a mov rcx, qword ptr [rdx]
0x1459eb789: 4c8b4a08 mov r9, qword ptr [rdx + 8]
0x1459eb78d: 4c8b5218 mov r10, qword ptr [rdx + 0x18]
0x1459eb791: 4d89d0 mov r8, r10
0x1459eb794: 4d29c8 sub r8, r9
0x1459eb797: 49c1e806 shr r8, 6
0x1459eb79b: 488b5210 mov rdx, qword ptr [rdx + 0x10]
0x1459eb79f: 4d39ca cmp r10, r9
0x1459eb7a2: 0f84e3000000 je 0x1459eb88b
0x1459eb7a8: 4983f801 cmp r8, 1
0x1459eb7ac: 7508 jne 0x1459eb7b6
0x1459eb7ae: 4531d2 xor r10d, r10d
0x1459eb7b1: e995000000 jmp 0x1459eb84b
0x1459eb7b6: 4d89c3 mov r11, r8
0x1459eb7b9: 4983e3fe and r11, 0xfffffffffffffffe
0x1459eb7bd: be48000000 mov esi, 0x48
0x1459eb7c2: 4531d2 xor r10d, r10d
0x1459eb7c5: 488d3d1a928501 lea rdi, [rip + 0x185921a]
0x1459eb7cc: 0f1f4000 nop dword ptr [rax]
0x1459eb7d0: 498b5c31b8 mov rbx, qword ptr [r9 + rsi - 0x48]
0x1459eb7d5: f3410f104431c0 movss xmm0, dword ptr [r9 + rsi - 0x40]
0x1459eb7dc: 48895c31b8 mov qword ptr [rcx + rsi - 0x48], rbx
0x1459eb7e1: f30f114431c0 movss dword ptr [rcx + rsi - 0x40], xmm0
0x1459eb7e7: 48897c31c8 mov qword ptr [rcx + rsi - 0x38], rdi
0x1459eb7ec: 48c74431d00e000000 mov qword ptr [rcx + rsi - 0x30], 0xe
0x1459eb7f5: 48c74431d800000000 mov qword ptr [rcx + rsi - 0x28], 0
0x1459eb7fe: 66c74431f00000 mov word ptr [rcx + rsi - 0x10], 0
0x1459eb805: 498b5c31f8 mov rbx, qword ptr [r9 + rsi - 8]
0x1459eb80a: f3410f100431 movss xmm0, dword ptr [r9 + rsi]
0x1459eb810: 4983c202 add r10, 2
0x1459eb814: 48895c31f8 mov qword ptr [rcx + rsi - 8], rbx
0x1459eb819: f30f110431 movss dword ptr [rcx + rsi], xmm0
0x1459eb81e: 48897c3108 mov qword ptr [rcx + rsi + 8], rdi
0x1459eb823: 48c74431100e000000 mov qword ptr [rcx + rsi + 0x10], 0xe
0x1459eb82c: 48c744311800000000 mov qword ptr [rcx + rsi + 0x18], 0
0x1459eb835: 66c74431300000 mov word ptr [rcx + rsi + 0x30], 0
0x1459eb83c: 4883ee80 sub rsi, -0x80
0x1459eb840: 4d39d3 cmp r11, r10
0x1459eb843: 758b jne 0x1459eb7d0
0x1459eb845: 41f6c001 test r8b, 1
0x1459eb849: 7440 je 0x1459eb88b
0x1459eb84b: 49c1e206 shl r10, 6
0x1459eb84f: 4f8b1c11 mov r11, qword ptr [r9 + r10]
0x1459eb853: f3430f10441108 movss xmm0, dword ptr [r9 + r10 + 8]
0x1459eb85a: 4e891c11 mov qword ptr [rcx + r10], r11
0x1459eb85e: f3420f11441108 movss dword ptr [rcx + r10 + 8], xmm0
0x1459eb865: 4c8d0d7a918501 lea r9, [rip + 0x185917a]
0x1459eb86c: 4e894c1110 mov qword ptr [rcx + r10 + 0x10], r9
0x1459eb871: 4ac74411180e000000 mov qword ptr [rcx + r10 + 0x18], 0xe
0x1459eb87a: 4ac744112000000000 mov qword ptr [rcx + r10 + 0x20], 0
0x1459eb883: 6642c74411380000 mov word ptr [rcx + r10 + 0x38], 0
0x1459eb88b: 488910 mov qword ptr [rax], rdx
0x1459eb88e: 48894808 mov qword ptr [rax + 8], rcx
0x1459eb892: 4c894010 mov qword ptr [rax + 0x10], r8
0x1459eb896: 5b pop rbx
0x1459eb897: 5f pop rdi
0x1459eb898: 5e pop rsi
0x1459eb899: c3 ret
