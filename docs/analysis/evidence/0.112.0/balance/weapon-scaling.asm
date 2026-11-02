1459f3c20: 55 push rbp
1459f3c21: 4157 push r15
1459f3c23: 4156 push r14
1459f3c25: 4155 push r13
1459f3c27: 4154 push r12
1459f3c29: 56 push rsi
1459f3c2a: 57 push rdi
1459f3c2b: 53 push rbx
1459f3c2c: 4883ec58 sub rsp, 0x58
1459f3c30: 488d6c2450 lea rbp, [rsp + 0x50]
1459f3c35: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1459f3c39: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459f3c41: 488b31 mov rsi, qword ptr [rcx]
1459f3c44: 488b7908 mov rdi, qword ptr [rcx + 8]
1459f3c48: 488b02 mov rax, qword ptr [rdx]
1459f3c4b: 4c8b4208 mov r8, qword ptr [rdx + 8]
1459f3c4f: 4839fe cmp rsi, rdi
1459f3c52: 0f8489010000 je 0x1459f3de1
1459f3c58: 488945d8 mov qword ptr [rbp - 0x28], rax
1459f3c5c: 488b5910 mov rbx, qword ptr [rcx + 0x10]
1459f3c60: 488b4210 mov rax, qword ptr [rdx + 0x10]
1459f3c64: 4829f7 sub rdi, rsi
1459f3c67: 48c1ef03 shr rdi, 3
1459f3c6b: 4c8945e0 mov qword ptr [rbp - 0x20], r8
1459f3c6f: 4e8d3cc0 lea r15, [rax + r8*8]
1459f3c73: 4531f6 xor r14d, r14d
1459f3c76: 4c8d257f208501 lea r12, [rip + 0x185207f]
1459f3c7d: f30f10350bde3f00 movss xmm6, dword ptr [rip + 0x3fde0b]
1459f3c85: 4c8d2d602b8501 lea r13, [rip + 0x1852b60]
1459f3c8c: eb19 jmp 0x1459f3ca7
1459f3c8e: 89d1 mov ecx, edx
1459f3c90: 48c1e020 shl rax, 0x20
1459f3c94: 4809c8 or rax, rcx
1459f3c97: 4b8904f7 mov qword ptr [r15 + r14*8], rax
1459f3c9b: 49ffc6 inc r14
1459f3c9e: 4c39f7 cmp rdi, r14
1459f3ca1: 0f842f010000 je 0x1459f3dd6
1459f3ca7: 488b0b mov rcx, qword ptr [rbx]
1459f3caa: 4883f905 cmp rcx, 5
1459f3cae: 0f8745010000 ja 0x1459f3df9
1459f3cb4: 4a8b14f6 mov rdx, qword ptr [rsi + r14*8]
1459f3cb8: f3410f10048c movss xmm0, dword ptr [r12 + rcx*4]
1459f3cbe: f30f59c6 mulss xmm0, xmm6
1459f3cc2: 4889d0 mov rax, rdx
1459f3cc5: 48c1e820 shr rax, 0x20
1459f3cc9: 89d1 mov ecx, edx
1459f3ccb: 49634c8d00 movsxd rcx, dword ptr [r13 + rcx*4]
1459f3cd0: 4c01e9 add rcx, r13
1459f3cd3: ffe1 jmp rcx
1459f3cd5: 660f6ec8 movd xmm1, eax
1459f3cd9: f30f59c1 mulss xmm0, xmm1
1459f3cdd: 660f7ec0 movd eax, xmm0
1459f3ce1: 31c9 xor ecx, ecx
1459f3ce3: ebab jmp 0x1459f3c90
1459f3ce5: 660f6ec8 movd xmm1, eax
1459f3ce9: f30f59c1 mulss xmm0, xmm1
1459f3ced: 660f7ec0 movd eax, xmm0
1459f3cf1: b904000000 mov ecx, 4
1459f3cf6: eb98 jmp 0x1459f3c90
1459f3cf8: 660f6ec8 movd xmm1, eax
1459f3cfc: f30f59c1 mulss xmm0, xmm1
1459f3d00: 660f7ec0 movd eax, xmm0
1459f3d04: b90c000000 mov ecx, 0xc
1459f3d09: eb85 jmp 0x1459f3c90
1459f3d0b: 660f6ec8 movd xmm1, eax
1459f3d0f: f30f59c1 mulss xmm0, xmm1
1459f3d13: 660f7ec0 movd eax, xmm0
1459f3d17: b909000000 mov ecx, 9
1459f3d1c: e96fffffff jmp 0x1459f3c90
1459f3d21: 660f6ec8 movd xmm1, eax
1459f3d25: f30f59c1 mulss xmm0, xmm1
1459f3d29: e8ef662100 call 0x145c0a41d
1459f3d2e: 660f7ec0 movd eax, xmm0
1459f3d32: b902000000 mov ecx, 2
1459f3d37: e954ffffff jmp 0x1459f3c90
1459f3d3c: 660f6ec8 movd xmm1, eax
1459f3d40: f30f59c1 mulss xmm0, xmm1
1459f3d44: 660f7ec0 movd eax, xmm0
1459f3d48: b903000000 mov ecx, 3
1459f3d4d: e93effffff jmp 0x1459f3c90
1459f3d52: 660f6ec8 movd xmm1, eax
1459f3d56: f30f59c1 mulss xmm0, xmm1
1459f3d5a: 660f7ec0 movd eax, xmm0
1459f3d5e: b907000000 mov ecx, 7
1459f3d63: e928ffffff jmp 0x1459f3c90
1459f3d68: 660f6ec8 movd xmm1, eax
1459f3d6c: f30f59c1 mulss xmm0, xmm1
1459f3d70: 660f7ec0 movd eax, xmm0
1459f3d74: b901000000 mov ecx, 1
1459f3d79: e912ffffff jmp 0x1459f3c90
1459f3d7e: 660f6ec8 movd xmm1, eax
1459f3d82: f30f59c1 mulss xmm0, xmm1
1459f3d86: 660f7ec0 movd eax, xmm0
1459f3d8a: b905000000 mov ecx, 5
1459f3d8f: e9fcfeffff jmp 0x1459f3c90
1459f3d94: 660f6ec8 movd xmm1, eax
1459f3d98: f30f59c1 mulss xmm0, xmm1
1459f3d9c: 660f7ec0 movd eax, xmm0
1459f3da0: b906000000 mov ecx, 6
1459f3da5: e9e6feffff jmp 0x1459f3c90
1459f3daa: 660f6ec8 movd xmm1, eax
1459f3dae: f30f59c1 mulss xmm0, xmm1
1459f3db2: 660f7ec0 movd eax, xmm0
1459f3db6: b90a000000 mov ecx, 0xa
1459f3dbb: e9d0feffff jmp 0x1459f3c90
1459f3dc0: 660f6ec8 movd xmm1, eax
1459f3dc4: f30f59c1 mulss xmm0, xmm1
1459f3dc8: 660f7ec0 movd eax, xmm0
1459f3dcc: b908000000 mov ecx, 8
1459f3dd1: e9bafeffff jmp 0x1459f3c90
1459f3dd6: 4c8b45e0 mov r8, qword ptr [rbp - 0x20]
1459f3dda: 4d01f0 add r8, r14
1459f3ddd: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459f3de1: 4c8900 mov qword ptr [rax], r8
1459f3de4: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1459f3de8: 4883c458 add rsp, 0x58
1459f3dec: 5b pop rbx
1459f3ded: 5f pop rdi
1459f3dee: 5e pop rsi
1459f3def: 415c pop r12
1459f3df1: 415d pop r13
1459f3df3: 415e pop r14
1459f3df5: 415f pop r15
1459f3df7: 5d pop rbp
1459f3df8: c3 ret
1459f3df9: 4c0175e0 add qword ptr [rbp - 0x20], r14
1459f3dfd: 4c8d054c1f8501 lea r8, [rip + 0x1851f4c]
1459f3e04: ba06000000 mov edx, 6
1459f3e09: e8755a3b00 call 0x145da9883
1459f3e0e: 90 nop
1459f3e0f: 0f0b ud2
