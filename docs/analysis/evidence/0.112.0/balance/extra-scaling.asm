1459f3e60: 55 push rbp
1459f3e61: 4157 push r15
1459f3e63: 4156 push r14
1459f3e65: 4155 push r13
1459f3e67: 4154 push r12
1459f3e69: 56 push rsi
1459f3e6a: 57 push rdi
1459f3e6b: 53 push rbx
1459f3e6c: 4883ec58 sub rsp, 0x58
1459f3e70: 488d6c2450 lea rbp, [rsp + 0x50]
1459f3e75: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1459f3e79: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459f3e81: 488b31 mov rsi, qword ptr [rcx]
1459f3e84: 488b7908 mov rdi, qword ptr [rcx + 8]
1459f3e88: 488b02 mov rax, qword ptr [rdx]
1459f3e8b: 4c8b4208 mov r8, qword ptr [rdx + 8]
1459f3e8f: 4839fe cmp rsi, rdi
1459f3e92: 0f8489010000 je 0x1459f4021
1459f3e98: 488945d8 mov qword ptr [rbp - 0x28], rax
1459f3e9c: 488b5910 mov rbx, qword ptr [rcx + 0x10]
1459f3ea0: 488b4210 mov rax, qword ptr [rdx + 0x10]
1459f3ea4: 4829f7 sub rdi, rsi
1459f3ea7: 48c1ef03 shr rdi, 3
1459f3eab: 4c8945e0 mov qword ptr [rbp - 0x20], r8
1459f3eaf: 4e8d3cc0 lea r15, [rax + r8*8]
1459f3eb3: 4531f6 xor r14d, r14d
1459f3eb6: 4c8d25ab1e8501 lea r12, [rip + 0x1851eab]
1459f3ebd: f30f1035cbdb3f00 movss xmm6, dword ptr [rip + 0x3fdbcb]
1459f3ec5: 4c8d2d54298501 lea r13, [rip + 0x1852954]
1459f3ecc: eb19 jmp 0x1459f3ee7
1459f3ece: 89d1 mov ecx, edx
1459f3ed0: 48c1e020 shl rax, 0x20
1459f3ed4: 4809c8 or rax, rcx
1459f3ed7: 4b8904f7 mov qword ptr [r15 + r14*8], rax
1459f3edb: 49ffc6 inc r14
1459f3ede: 4c39f7 cmp rdi, r14
1459f3ee1: 0f842f010000 je 0x1459f4016
1459f3ee7: 488b0b mov rcx, qword ptr [rbx]
1459f3eea: 4883f905 cmp rcx, 5
1459f3eee: 0f8745010000 ja 0x1459f4039
1459f3ef4: 4a8b14f6 mov rdx, qword ptr [rsi + r14*8]
1459f3ef8: f3410f10048c movss xmm0, dword ptr [r12 + rcx*4]
1459f3efe: f30f59c6 mulss xmm0, xmm6
1459f3f02: 4889d0 mov rax, rdx
1459f3f05: 48c1e820 shr rax, 0x20
1459f3f09: 89d1 mov ecx, edx
1459f3f0b: 49634c8d00 movsxd rcx, dword ptr [r13 + rcx*4]
1459f3f10: 4c01e9 add rcx, r13
1459f3f13: ffe1 jmp rcx
1459f3f15: 660f6ec8 movd xmm1, eax
1459f3f19: f30f59c1 mulss xmm0, xmm1
1459f3f1d: 660f7ec0 movd eax, xmm0
1459f3f21: 31c9 xor ecx, ecx
1459f3f23: ebab jmp 0x1459f3ed0
1459f3f25: 660f6ec8 movd xmm1, eax
1459f3f29: f30f59c1 mulss xmm0, xmm1
1459f3f2d: 660f7ec0 movd eax, xmm0
1459f3f31: b904000000 mov ecx, 4
1459f3f36: eb98 jmp 0x1459f3ed0
1459f3f38: 660f6ec8 movd xmm1, eax
1459f3f3c: f30f59c1 mulss xmm0, xmm1
1459f3f40: 660f7ec0 movd eax, xmm0
1459f3f44: b90c000000 mov ecx, 0xc
1459f3f49: eb85 jmp 0x1459f3ed0
1459f3f4b: 660f6ec8 movd xmm1, eax
1459f3f4f: f30f59c1 mulss xmm0, xmm1
1459f3f53: 660f7ec0 movd eax, xmm0
1459f3f57: b909000000 mov ecx, 9
1459f3f5c: e96fffffff jmp 0x1459f3ed0
1459f3f61: 660f6ec8 movd xmm1, eax
1459f3f65: f30f59c1 mulss xmm0, xmm1
1459f3f69: e8af642100 call 0x145c0a41d
1459f3f6e: 660f7ec0 movd eax, xmm0
1459f3f72: b902000000 mov ecx, 2
1459f3f77: e954ffffff jmp 0x1459f3ed0
1459f3f7c: 660f6ec8 movd xmm1, eax
1459f3f80: f30f59c1 mulss xmm0, xmm1
1459f3f84: 660f7ec0 movd eax, xmm0
1459f3f88: b903000000 mov ecx, 3
1459f3f8d: e93effffff jmp 0x1459f3ed0
1459f3f92: 660f6ec8 movd xmm1, eax
1459f3f96: f30f59c1 mulss xmm0, xmm1
1459f3f9a: 660f7ec0 movd eax, xmm0
1459f3f9e: b907000000 mov ecx, 7
1459f3fa3: e928ffffff jmp 0x1459f3ed0
1459f3fa8: 660f6ec8 movd xmm1, eax
1459f3fac: f30f59c1 mulss xmm0, xmm1
1459f3fb0: 660f7ec0 movd eax, xmm0
1459f3fb4: b901000000 mov ecx, 1
1459f3fb9: e912ffffff jmp 0x1459f3ed0
1459f3fbe: 660f6ec8 movd xmm1, eax
1459f3fc2: f30f59c1 mulss xmm0, xmm1
1459f3fc6: 660f7ec0 movd eax, xmm0
1459f3fca: b905000000 mov ecx, 5
1459f3fcf: e9fcfeffff jmp 0x1459f3ed0
1459f3fd4: 660f6ec8 movd xmm1, eax
1459f3fd8: f30f59c1 mulss xmm0, xmm1
1459f3fdc: 660f7ec0 movd eax, xmm0
1459f3fe0: b906000000 mov ecx, 6
1459f3fe5: e9e6feffff jmp 0x1459f3ed0
1459f3fea: 660f6ec8 movd xmm1, eax
1459f3fee: f30f59c1 mulss xmm0, xmm1
1459f3ff2: 660f7ec0 movd eax, xmm0
1459f3ff6: b90a000000 mov ecx, 0xa
1459f3ffb: e9d0feffff jmp 0x1459f3ed0
1459f4000: 660f6ec8 movd xmm1, eax
1459f4004: f30f59c1 mulss xmm0, xmm1
1459f4008: 660f7ec0 movd eax, xmm0
1459f400c: b908000000 mov ecx, 8
1459f4011: e9bafeffff jmp 0x1459f3ed0
1459f4016: 4c8b45e0 mov r8, qword ptr [rbp - 0x20]
1459f401a: 4d01f0 add r8, r14
1459f401d: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459f4021: 4c8900 mov qword ptr [rax], r8
1459f4024: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1459f4028: 4883c458 add rsp, 0x58
1459f402c: 5b pop rbx
1459f402d: 5f pop rdi
1459f402e: 5e pop rsi
1459f402f: 415c pop r12
1459f4031: 415d pop r13
1459f4033: 415e pop r14
1459f4035: 415f pop r15
1459f4037: 5d pop rbp
1459f4038: c3 ret
1459f4039: 4c0175e0 add qword ptr [rbp - 0x20], r14
1459f403d: 4c8d053c1d8501 lea r8, [rip + 0x1851d3c]
1459f4044: ba06000000 mov edx, 6
1459f4049: e835583b00 call 0x145da9883
1459f404e: 90 nop
1459f404f: 0f0b ud2
