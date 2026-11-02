145b98c90: 56 push rsi
145b98c91: 57 push rdi
145b98c92: 53 push rbx
145b98c93: 4883ec50 sub rsp, 0x50
145b98c97: 0f29742440 movaps xmmword ptr [rsp + 0x40], xmm6
145b98c9c: 66410f6ed0 movd xmm2, r8d
145b98ca1: 4d89c2 mov r10, r8
145b98ca4: 660f6fca movdqa xmm1, xmm2
145b98ca8: f30f5c4920 subss xmm1, dword ptr [rcx + 0x20]
145b98cad: 49c1ea20 shr r10, 0x20
145b98cb1: 0f57e4 xorps xmm4, xmm4
145b98cb4: 0f2ee1 ucomiss xmm4, xmm1
145b98cb7: 0f87e9000000 ja 0x145b98da6
145b98cbd: 66410f6eda movd xmm3, r10d
145b98cc2: 660f6fc3 movdqa xmm0, xmm3
145b98cc6: f30f5c4124 subss xmm0, dword ptr [rcx + 0x24]
145b98ccb: 0f2ee0 ucomiss xmm4, xmm0
145b98cce: 0f87d2000000 ja 0x145b98da6
145b98cd4: f30f1025e46d6b00 movss xmm4, dword ptr [rip + 0x6b6de4]
145b98cdc: 0f28e9 movaps xmm5, xmm1
145b98cdf: f30f5cec subss xmm5, xmm4
145b98ce3: f3480f2cc5 cvttss2si rax, xmm5
145b98ce8: f34c0f2cd9 cvttss2si r11, xmm1
145b98ced: 4d89d9 mov r9, r11
145b98cf0: 49c1f93f sar r9, 0x3f
145b98cf4: 4921c1 and r9, rax
145b98cf7: 4d09d9 or r9, r11
145b98cfa: 31c0 xor eax, eax
145b98cfc: 0f57ed xorps xmm5, xmm5
145b98cff: 0f2ecd ucomiss xmm1, xmm5
145b98d02: 4c0f42c8 cmovb r9, rax
145b98d06: f30f1035b66d6b00 movss xmm6, dword ptr [rip + 0x6b6db6]
145b98d0e: 0f2ece ucomiss xmm1, xmm6
145b98d11: 48c7c6ffffffff mov rsi, 0xffffffffffffffff
145b98d18: 4c0f47ce cmova r9, rsi
145b98d1c: 0f28c8 movaps xmm1, xmm0
145b98d1f: f30f5ccc subss xmm1, xmm4
145b98d23: f3480f2cf9 cvttss2si rdi, xmm1
145b98d28: f3480f2cd8 cvttss2si rbx, xmm0
145b98d2d: 4989db mov r11, rbx
145b98d30: 49c1fb3f sar r11, 0x3f
145b98d34: 4921fb and r11, rdi
145b98d37: 4909db or r11, rbx
145b98d3a: 0f2ec5 ucomiss xmm0, xmm5
145b98d3d: 4c0f42d8 cmovb r11, rax
145b98d41: 0f2ec6 ucomiss xmm0, xmm6
145b98d44: 4c0f47de cmova r11, rsi
145b98d48: 488b4118 mov rax, qword ptr [rcx + 0x18]
145b98d4c: 4939c1 cmp r9, rax
145b98d4f: 7355 jae 0x145b98da6
145b98d51: 4939c3 cmp r11, rax
145b98d54: 7350 jae 0x145b98da6
145b98d56: 490fafc3 imul rax, r11
145b98d5a: 4c01c8 add rax, r9
145b98d5d: 4c8b4910 mov r9, qword ptr [rcx + 0x10]
145b98d61: 4c39c8 cmp rax, r9
145b98d64: 736a jae 0x145b98dd0
145b98d66: 4c8b4908 mov r9, qword ptr [rcx + 8]
145b98d6a: 41803c0101 cmp byte ptr [r9 + rax], 1
145b98d6f: 7535 jne 0x145b98da6
145b98d71: 4889d6 mov rsi, rdx
145b98d74: c744242000002040 mov dword ptr [rsp + 0x20], 0x40200000
145b98d7c: 488d442434 lea rax, [rsp + 0x34]
145b98d81: 4889ca mov rdx, rcx
145b98d84: 4889c1 mov rcx, rax
145b98d87: 4889d7 mov rdi, rdx
145b98d8a: e8710c0000 call 0x145b99a00
145b98d8f: 807c243400 cmp byte ptr [rsp + 0x34], 0
145b98d94: 7436 je 0x145b98dcc
145b98d96: 448b442438 mov r8d, dword ptr [rsp + 0x38]
145b98d9b: 448b54243c mov r10d, dword ptr [rsp + 0x3c]
145b98da0: 4889f2 mov rdx, rsi
145b98da3: 4889f9 mov rcx, rdi
145b98da6: 49c1e220 shl r10, 0x20
145b98daa: 4589c0 mov r8d, r8d
145b98dad: 4d09d0 or r8, r10
145b98db0: e84bf5ffff call 0x145b98300
145b98db5: 0f2e0504a16900 ucomiss xmm0, dword ptr [rip + 0x69a104]
145b98dbc: 0f93c0 setae al
145b98dbf: 0f28742440 movaps xmm6, xmmword ptr [rsp + 0x40]
145b98dc4: 4883c450 add rsp, 0x50
145b98dc8: 5b pop rbx
145b98dc9: 5f pop rdi
145b98dca: 5e pop rsi
145b98dcb: c3 ret
145b98dcc: b001 mov al, 1
145b98dce: ebef jmp 0x145b98dbf
145b98dd0: 4c8d0581614e01 lea r8, [rip + 0x14e6181]
145b98dd7: 4889c1 mov rcx, rax
145b98dda: 4c89ca mov rdx, r9
145b98ddd: e821ff6600 call 0x146208d03
145b98de2: 0f0b ud2
