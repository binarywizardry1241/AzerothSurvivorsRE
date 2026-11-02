1459f39e0: 55 push rbp
1459f39e1: 4157 push r15
1459f39e3: 4156 push r14
1459f39e5: 4155 push r13
1459f39e7: 4154 push r12
1459f39e9: 56 push rsi
1459f39ea: 57 push rdi
1459f39eb: 53 push rbx
1459f39ec: 4883ec58 sub rsp, 0x58
1459f39f0: 488d6c2450 lea rbp, [rsp + 0x50]
1459f39f5: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1459f39f9: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459f3a01: 488b31 mov rsi, qword ptr [rcx]
1459f3a04: 488b7908 mov rdi, qword ptr [rcx + 8]
1459f3a08: 488b02 mov rax, qword ptr [rdx]
1459f3a0b: 4c8b4208 mov r8, qword ptr [rdx + 8]
1459f3a0f: 4839fe cmp rsi, rdi
1459f3a12: 0f8489010000 je 0x1459f3ba1
1459f3a18: 488945d8 mov qword ptr [rbp - 0x28], rax
1459f3a1c: 488b5910 mov rbx, qword ptr [rcx + 0x10]
1459f3a20: 488b4210 mov rax, qword ptr [rdx + 0x10]
1459f3a24: 4829f7 sub rdi, rsi
1459f3a27: 48c1ef03 shr rdi, 3
1459f3a2b: 4c8945e0 mov qword ptr [rbp - 0x20], r8
1459f3a2f: 4e8d3cc0 lea r15, [rax + r8*8]
1459f3a33: 4531f6 xor r14d, r14d
1459f3a36: 4c8d25bf228501 lea r12, [rip + 0x18522bf]
1459f3a3d: f30f10354be03f00 movss xmm6, dword ptr [rip + 0x3fe04b]
1459f3a45: 4c8d2d6c2d8501 lea r13, [rip + 0x1852d6c]
1459f3a4c: eb19 jmp 0x1459f3a67
1459f3a4e: 89d1 mov ecx, edx
1459f3a50: 48c1e020 shl rax, 0x20
1459f3a54: 4809c8 or rax, rcx
1459f3a57: 4b8904f7 mov qword ptr [r15 + r14*8], rax
1459f3a5b: 49ffc6 inc r14
1459f3a5e: 4c39f7 cmp rdi, r14
1459f3a61: 0f842f010000 je 0x1459f3b96
1459f3a67: 488b0b mov rcx, qword ptr [rbx]
1459f3a6a: 4883f905 cmp rcx, 5
1459f3a6e: 0f8745010000 ja 0x1459f3bb9
1459f3a74: 4a8b14f6 mov rdx, qword ptr [rsi + r14*8]
1459f3a78: f3410f10048c movss xmm0, dword ptr [r12 + rcx*4]
1459f3a7e: f30f59c6 mulss xmm0, xmm6
1459f3a82: 4889d0 mov rax, rdx
1459f3a85: 48c1e820 shr rax, 0x20
1459f3a89: 89d1 mov ecx, edx
1459f3a8b: 49634c8d00 movsxd rcx, dword ptr [r13 + rcx*4]
1459f3a90: 4c01e9 add rcx, r13
1459f3a93: ffe1 jmp rcx
1459f3a95: 660f6ec8 movd xmm1, eax
1459f3a99: f30f59c1 mulss xmm0, xmm1
1459f3a9d: 660f7ec0 movd eax, xmm0
1459f3aa1: 31c9 xor ecx, ecx
1459f3aa3: ebab jmp 0x1459f3a50
1459f3aa5: 660f6ec8 movd xmm1, eax
1459f3aa9: f30f59c1 mulss xmm0, xmm1
1459f3aad: 660f7ec0 movd eax, xmm0
1459f3ab1: b904000000 mov ecx, 4
1459f3ab6: eb98 jmp 0x1459f3a50
1459f3ab8: 660f6ec8 movd xmm1, eax
1459f3abc: f30f59c1 mulss xmm0, xmm1
1459f3ac0: 660f7ec0 movd eax, xmm0
1459f3ac4: b90c000000 mov ecx, 0xc
1459f3ac9: eb85 jmp 0x1459f3a50
1459f3acb: 660f6ec8 movd xmm1, eax
1459f3acf: f30f59c1 mulss xmm0, xmm1
1459f3ad3: 660f7ec0 movd eax, xmm0
1459f3ad7: b909000000 mov ecx, 9
1459f3adc: e96fffffff jmp 0x1459f3a50
1459f3ae1: 660f6ec8 movd xmm1, eax
1459f3ae5: f30f59c1 mulss xmm0, xmm1
1459f3ae9: e82f692100 call 0x145c0a41d
1459f3aee: 660f7ec0 movd eax, xmm0
1459f3af2: b902000000 mov ecx, 2
1459f3af7: e954ffffff jmp 0x1459f3a50
1459f3afc: 660f6ec8 movd xmm1, eax
1459f3b00: f30f59c1 mulss xmm0, xmm1
1459f3b04: 660f7ec0 movd eax, xmm0
1459f3b08: b903000000 mov ecx, 3
1459f3b0d: e93effffff jmp 0x1459f3a50
1459f3b12: 660f6ec8 movd xmm1, eax
1459f3b16: f30f59c1 mulss xmm0, xmm1
1459f3b1a: 660f7ec0 movd eax, xmm0
1459f3b1e: b907000000 mov ecx, 7
1459f3b23: e928ffffff jmp 0x1459f3a50
1459f3b28: 660f6ec8 movd xmm1, eax
1459f3b2c: f30f59c1 mulss xmm0, xmm1
1459f3b30: 660f7ec0 movd eax, xmm0
1459f3b34: b901000000 mov ecx, 1
1459f3b39: e912ffffff jmp 0x1459f3a50
1459f3b3e: 660f6ec8 movd xmm1, eax
1459f3b42: f30f59c1 mulss xmm0, xmm1
1459f3b46: 660f7ec0 movd eax, xmm0
1459f3b4a: b905000000 mov ecx, 5
1459f3b4f: e9fcfeffff jmp 0x1459f3a50
1459f3b54: 660f6ec8 movd xmm1, eax
1459f3b58: f30f59c1 mulss xmm0, xmm1
1459f3b5c: 660f7ec0 movd eax, xmm0
1459f3b60: b906000000 mov ecx, 6
1459f3b65: e9e6feffff jmp 0x1459f3a50
1459f3b6a: 660f6ec8 movd xmm1, eax
1459f3b6e: f30f59c1 mulss xmm0, xmm1
1459f3b72: 660f7ec0 movd eax, xmm0
1459f3b76: b90a000000 mov ecx, 0xa
1459f3b7b: e9d0feffff jmp 0x1459f3a50
1459f3b80: 660f6ec8 movd xmm1, eax
1459f3b84: f30f59c1 mulss xmm0, xmm1
1459f3b88: 660f7ec0 movd eax, xmm0
1459f3b8c: b908000000 mov ecx, 8
1459f3b91: e9bafeffff jmp 0x1459f3a50
1459f3b96: 4c8b45e0 mov r8, qword ptr [rbp - 0x20]
1459f3b9a: 4d01f0 add r8, r14
1459f3b9d: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459f3ba1: 4c8900 mov qword ptr [rax], r8
1459f3ba4: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1459f3ba8: 4883c458 add rsp, 0x58
1459f3bac: 5b pop rbx
1459f3bad: 5f pop rdi
1459f3bae: 5e pop rsi
1459f3baf: 415c pop r12
1459f3bb1: 415d pop r13
1459f3bb3: 415e pop r14
1459f3bb5: 415f pop r15
1459f3bb7: 5d pop rbp
1459f3bb8: c3 ret
1459f3bb9: 4c0175e0 add qword ptr [rbp - 0x20], r14
1459f3bbd: 4c8d0574218501 lea r8, [rip + 0x1852174]
1459f3bc4: ba06000000 mov edx, 6
1459f3bc9: e8b55c3b00 call 0x145da9883
1459f3bce: 90 nop
1459f3bcf: 0f0b ud2
