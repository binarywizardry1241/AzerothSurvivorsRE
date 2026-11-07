0x145900a09: 4180f902 cmp r9b, 2
0x145900a0d: 4488adc8030000 mov byte ptr [rbp + 0x3c8], r13b
0x145900a14: 750a jne 0x145900a20
0x145900a16: 4531ed xor r13d, r13d
0x145900a19: 31f6 xor esi, esi
0x145900a1b: e9c9000000 jmp 0x145900ae9
0x145900a20: 0f28c7 movaps xmm0, xmm7
0x145900a23: 41f6c201 test r10b, 1
0x145900a27: 488bb578020000 mov rsi, qword ptr [rbp + 0x278]
0x145900a2e: 480f45f7 cmovne rsi, rdi
0x145900a32: 4889b578020000 mov qword ptr [rbp + 0x278], rsi
0x145900a39: 7504 jne 0x145900a3f
0x145900a3b: 410f28c7 movaps xmm0, xmm15
0x145900a3f: 4180f901 cmp r9b, 1
0x145900a43: 0f8597000000 jne 0x145900ae0
0x145900a49: 4d8bb770050000 mov r14, qword ptr [r15 + 0x570]
0x145900a50: 4d85f6 test r14, r14
0x145900a53: 0f8487000000 je 0x145900ae0
0x145900a59: 498bb768050000 mov rsi, qword ptr [r15 + 0x568]
0x145900a60: 4d69f6d8010000 imul r14, r14, 0x1d8
0x145900a67: 4901f6 add r14, rsi
0x145900a6a: 4c89b580000000 mov qword ptr [rbp + 0x80], r14
0x145900a71: eb10 jmp 0x145900a83
0x145900a73: 4881c6d8010000 add rsi, 0x1d8
0x145900a7a: 4c39f6 cmp rsi, r14
0x145900a7d: 0f8483040000 je 0x145900f06
0x145900a83: 4839bef0000000 cmp qword ptr [rsi + 0xf0], rdi
0x145900a8a: 75e7 jne 0x145900a73
0x145900a8c: 83beb000000000 cmp dword ptr [rsi + 0xb0], 0
0x145900a93: 75de jne 0x145900a73
0x145900a95: 4c8b6e08 mov r13, qword ptr [rsi + 8]
0x145900a99: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
0x145900a9d: 49c1e604 shl r14, 4
0x145900aa1: 4f8d3c76 lea r15, [r14 + r14*2]
0x145900aa5: 4c8bb580000000 mov r14, qword ptr [rbp + 0x80]
0x145900aac: 0f1f4000 nop dword ptr [rax]
0x145900ab0: 4d85ff test r15, r15
0x145900ab3: 74be je 0x145900a73
0x145900ab5: 4983c7d0 add r15, -0x30
0x145900ab9: 41817d105c010000 cmp dword ptr [r13 + 0x10], 0x15c
0x145900ac1: 4d8d6d30 lea r13, [r13 + 0x30]
0x145900ac5: 75e9 jne 0x145900ab0
0x145900ac7: 4589d5 mov r13d, r10d
0x145900aca: 440f28f8 movaps xmm15, xmm0
0x145900ace: 48897d18 mov qword ptr [rbp + 0x18], rdi
0x145900ad2: f30f117d48 movss dword ptr [rbp + 0x48], xmm7
0x145900ad7: 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
0x145900ade: eb09 jmp 0x145900ae9
0x145900ae0: 31f6 xor esi, esi
0x145900ae2: 4589d5 mov r13d, r10d
0x145900ae5: 440f28f8 movaps xmm15, xmm0
0x145900ae9: 488995a0000000 mov qword ptr [rbp + 0xa0], rdx
0x145900af0: 4c899da8000000 mov qword ptr [rbp + 0xa8], r11
0x145900af7: 488b9530030000 mov rdx, qword ptr [rbp + 0x330]
0x145900afe: 4c8d9db0000000 lea r11, [rbp + 0xb0]
0x145900b05: 49895330 mov qword ptr [r11 + 0x30], rdx
0x145900b09: 0f288500030000 movaps xmm0, xmmword ptr [rbp + 0x300]
0x145900b10: 0f288d10030000 movaps xmm1, xmmword ptr [rbp + 0x310]
0x145900b17: 0f289520030000 movaps xmm2, xmmword ptr [rbp + 0x320]
0x145900b1e: 410f115320 movups xmmword ptr [r11 + 0x20], xmm2
0x145900b23: 410f114b10 movups xmmword ptr [r11 + 0x10], xmm1
0x145900b28: 410f1103 movups xmmword ptr [r11], xmm0
0x145900b2c: 448895e8000000 mov byte ptr [rbp + 0xe8], r10b
0x145900b33: 44888de9000000 mov byte ptr [rbp + 0xe9], r9b
0x145900b3a: 0fb75534 movzx edx, word ptr [rbp + 0x34]
0x145900b3e: 664189533e mov word ptr [r11 + 0x3e], dx
0x145900b43: 8b5530 mov edx, dword ptr [rbp + 0x30]
0x145900b46: 4189533a mov dword ptr [r11 + 0x3a], edx
0x145900b4a: 4889bdf0000000 mov qword ptr [rbp + 0xf0], rdi
0x145900b51: 4c8985f8000000 mov qword ptr [rbp + 0xf8], r8
0x145900b58: 0f288590030000 movaps xmm0, xmmword ptr [rbp + 0x390]
0x145900b5f: 488d9500010000 lea rdx, [rbp + 0x100]
0x145900b66: 0f1102 movups xmmword ptr [rdx], xmm0
0x145900b69: 899d10010000 mov dword ptr [rbp + 0x110], ebx
0x145900b6f: f30f11bd14010000 movss dword ptr [rbp + 0x114], xmm7
0x145900b77: 888518010000 mov byte ptr [rbp + 0x118], al
0x145900b7d: c6851901000000 mov byte ptr [rbp + 0x119], 0
0x145900b84: 888d1a010000 mov byte ptr [rbp + 0x11a], cl
0x145900b8a: 0fb64d5c movzx ecx, byte ptr [rbp + 0x5c]
0x145900b8e: 41884b6f mov byte ptr [r11 + 0x6f], cl
0x145900b92: 8b4d58 mov ecx, dword ptr [rbp + 0x58]
0x145900b95: 41894b6b mov dword ptr [r11 + 0x6b], ecx
0x145900b99: 488b8df0020000 mov rcx, qword ptr [rbp + 0x2f0]
0x145900ba0: f3440f1001 movss xmm8, dword ptr [rcx]
0x145900ba5: 410f2efa ucomiss xmm7, xmm10
0x145900ba9: 762a jbe 0x145900bd5
0x145900bab: 0fb68d1b010000 movzx ecx, byte ptr [rbp + 0x11b]
0x145900bb2: 88442428 mov byte ptr [rsp + 0x28], al
0x145900bb6: 884c2420 mov byte ptr [rsp + 0x20], cl
0x145900bba: c644243000 mov byte ptr [rsp + 0x30], 0
0x145900bbf: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900bc6: 4889fa mov rdx, rdi
0x145900bc9: 0f28d7 movaps xmm2, xmm7
0x145900bcc: 4189d9 mov r9d, ebx
0x145900bcf: e8bce00300 call 0x14593ec90
0x145900bd4: 90 nop
0x145900bd5: 80bdb000000000 cmp byte ptr [rbp + 0xb0], 0
0x145900bdc: 0f8404010000 je 0x145900ce6
0x145900be2: 448bbd00010000 mov r15d, dword ptr [rbp + 0x100]
0x145900be9: 4183ff05 cmp r15d, 5
0x145900bed: 7405 je 0x145900bf4
0x145900bef: 0f57c0 xorps xmm0, xmm0
0x145900bf2: eb08 jmp 0x145900bfc
0x145900bf4: f30f108504010000 movss xmm0, dword ptr [rbp + 0x104]
0x145900bfc: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900c03: 8b81c4040000 mov eax, dword ptr [rcx + 0x4c4]
0x145900c09: 83f803 cmp eax, 3
0x145900c0c: ba03000000 mov edx, 3
0x145900c11: 0f43c2 cmovae eax, edx
0x145900c14: 4c8b8170050000 mov r8, qword ptr [rcx + 0x570]
0x145900c1b: 4d85c0 test r8, r8
0x145900c1e: 0f8493000000 je 0x145900cb7
0x145900c24: f30f109db4000000 movss xmm3, dword ptr [rbp + 0xb4]
0x145900c2c: f30f108db8000000 movss xmm1, dword ptr [rbp + 0xb8]
0x145900c34: 8b95bc000000 mov edx, dword ptr [rbp + 0xbc]
0x145900c3a: ffc0 inc eax
0x145900c3c: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900c43: 488b8968050000 mov rcx, qword ptr [rcx + 0x568]
0x145900c4a: 4d69c0d8010000 imul r8, r8, 0x1d8
0x145900c51: eb1d jmp 0x145900c70
0x145900c53: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145900c60: 4881c1d8010000 add rcx, 0x1d8
0x145900c67: 4981c028feffff add r8, -0x1d8
0x145900c6e: 7447 je 0x145900cb7
0x145900c70: 4839b9f0000000 cmp qword ptr [rcx + 0xf0], rdi
0x145900c77: 75e7 jne 0x145900c60
0x145900c79: 83b9b000000001 cmp dword ptr [rcx + 0xb0], 1
0x145900c80: 74de je 0x145900c60
0x145900c82: 440fb6851b010000 movzx r8d, byte ptr [rbp + 0x11b]
0x145900c8a: f3440f11442450 movss dword ptr [rsp + 0x50], xmm8
0x145900c91: 4889442448 mov qword ptr [rsp + 0x48], rax
0x145900c96: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
0x145900c9c: 89542428 mov dword ptr [rsp + 0x28], edx
0x145900ca0: f30f114c2420 movss dword ptr [rsp + 0x20], xmm1
0x145900ca6: 48c744243800000000 mov qword ptr [rsp + 0x38], 0
0x145900caf: 89da mov edx, ebx
0x145900cb1: e80ac20900 call 0x14599cec0
0x145900cb6: 90 nop
0x145900cb7: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900cbe: 4889fa mov rdx, rdi
0x145900cc1: 4189d8 mov r8d, ebx
0x145900cc4: 41b101 mov r9b, 1
0x145900cc7: e854d00400 call 0x14594dd20
0x145900ccc: 90 nop
0x145900ccd: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900cd4: 4889fa mov rdx, rdi
0x145900cd7: 4189d8 mov r8d, ebx
0x145900cda: e821db0400 call 0x14594e800
0x145900cdf: 90 nop
0x145900ce0: 4183ff05 cmp r15d, 5
0x145900ce4: 741e je 0x145900d04
0x145900ce6: 895c2420 mov dword ptr [rsp + 0x20], ebx
0x145900cea: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900cf1: 4889fa mov rdx, rdi
0x145900cf4: 4c8d8500010000 lea r8, [rbp + 0x100]
0x145900cfb: 0f28df movaps xmm3, xmm7
0x145900cfe: e81d9b0200 call 0x14592a820
0x145900d03: 90 nop
0x145900d04: 41f6c501 test r13b, 1
0x145900d08: 0f8469020000 je 0x145900f77
0x145900d0e: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
0x145900d15: 488b80d8010000 mov rax, qword ptr [rax + 0x1d8]
0x145900d1c: 4885c0 test rax, rax
0x145900d1f: 0f8452020000 je 0x145900f77
0x145900d25: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900d2c: f3440f10894c0a0000 movss xmm9, dword ptr [rcx + 0xa4c]
0x145900d35: 488b89d0010000 mov rcx, qword ptr [rcx + 0x1d0]
0x145900d3c: 48c1e004 shl rax, 4
0x145900d40: 31d2 xor edx, edx
0x145900d42: eb19 jmp 0x145900d5d
0x145900d44: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145900d50: 4883c210 add rdx, 0x10
0x145900d54: 4839d0 cmp rax, rdx
0x145900d57: 0f841a020000 je 0x145900f77
0x145900d5d: 4c8b0411 mov r8, qword ptr [rcx + rdx]
0x145900d61: 4983783809 cmp qword ptr [r8 + 0x38], 9
0x145900d66: 75e8 jne 0x145900d50
0x145900d68: 4d8b4030 mov r8, qword ptr [r8 + 0x30]
0x145900d6c: 4d8b08 mov r9, qword ptr [r8]
0x145900d6f: 49ba6e6967687466616c movabs r10, 0x6c6166746867696e
0x145900d79: 4d31d1 xor r9, r10
0x145900d7c: 450fb64008 movzx r8d, byte ptr [r8 + 8]
0x145900d81: 4983f06c xor r8, 0x6c
0x145900d85: 4d09c8 or r8, r9
0x145900d88: 75c6 jne 0x145900d50
0x145900d8a: 807c110800 cmp byte ptr [rcx + rdx + 8], 0
0x145900d8f: 0f84e2010000 je 0x145900f77
0x145900d95: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
0x145900d9c: 488b8830080000 mov rcx, qword ptr [rax + 0x830]
0x145900da3: 4885c9 test rcx, rcx
0x145900da6: 0f84cb010000 je 0x145900f77
0x145900dac: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
0x145900db3: 488b8028080000 mov rax, qword ptr [rax + 0x828]
0x145900dba: 48c1e106 shl rcx, 6
0x145900dbe: 4801c1 add rcx, rax
0x145900dc1: 4531ed xor r13d, r13d
0x145900dc4: eb1a jmp 0x145900de0
0x145900dc6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145900dd0: 49ffc5 inc r13
0x145900dd3: 4883c040 add rax, 0x40
0x145900dd7: 4839c8 cmp rax, rcx
0x145900dda: 0f8497010000 je 0x145900f77
0x145900de0: 803809 cmp byte ptr [rax], 9
0x145900de3: 75eb jne 0x145900dd0
0x145900de5: 83781000 cmp dword ptr [rax + 0x10], 0
0x145900de9: 75e5 jne 0x145900dd0
0x145900deb: 80781801 cmp byte ptr [rax + 0x18], 1
0x145900def: 75df jne 0x145900dd0
0x145900df1: 488378280b cmp qword ptr [rax + 0x28], 0xb
0x145900df6: 75d8 jne 0x145900dd0
0x145900df8: 488b5020 mov rdx, qword ptr [rax + 0x20]
0x145900dfc: 4c8b02 mov r8, qword ptr [rdx]
0x145900dff: 49b9736861646f775f62 movabs r9, 0x625f776f64616873
0x145900e09: 4d31c8 xor r8, r9
0x145900e0c: 488b5203 mov rdx, qword ptr [rdx + 3]
0x145900e10: 49b9646f775f626f6c74 movabs r9, 0x746c6f625f776f64
0x145900e1a: 4c31ca xor rdx, r9
0x145900e1d: 4c09c2 or rdx, r8
0x145900e20: 75ae jne 0x145900dd0
0x145900e22: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900e29: 488b8970050000 mov rcx, qword ptr [rcx + 0x570]
0x145900e30: 4885c9 test rcx, rcx
0x145900e33: 0f843e010000 je 0x145900f77
0x145900e39: 8b7804 mov edi, dword ptr [rax + 4]
0x145900e3c: f30f107808 movss xmm7, dword ptr [rax + 8]
0x145900e41: f3440f10400c movss xmm8, dword ptr [rax + 0xc]
0x145900e47: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
0x145900e4e: 488b9868050000 mov rbx, qword ptr [rax + 0x568]
0x145900e55: 4869c1d8010000 imul rax, rcx, 0x1d8
0x145900e5c: eb13 jmp 0x145900e71
0x145900e5e: 4881c3d8010000 add rbx, 0x1d8
0x145900e65: 480528feffff add rax, -0x1d8
0x145900e6b: 0f8406010000 je 0x145900f77
0x145900e71: 488b8d78020000 mov rcx, qword ptr [rbp + 0x278]
0x145900e78: 48398bf0000000 cmp qword ptr [rbx + 0xf0], rcx
0x145900e7f: 75dd jne 0x145900e5e
0x145900e81: 83bbb000000001 cmp dword ptr [rbx + 0xb0], 1
0x145900e88: 74d4 je 0x145900e5e
0x145900e8a: 410f28c0 movaps xmm0, xmm8
0x145900e8e: e88a953000 call 0x145c0a41d
0x145900e93: f30f5f05c5c34a00 maxss xmm0, dword ptr [rip + 0x4ac3c5]
0x145900e9b: f3480f2cc0 cvttss2si rax, xmm0
0x145900ea0: 410f2ec2 ucomiss xmm0, xmm10
0x145900ea4: b900000000 mov ecx, 0
0x145900ea9: 0f42c1 cmovb eax, ecx
0x145900eac: 0f2e05915c4b00 ucomiss xmm0, dword ptr [rip + 0x4b5c91]
0x145900eb3: b9ffffffff mov ecx, 0xffffffff
0x145900eb8: 0f47c1 cmova eax, ecx
0x145900ebb: 488b4b10 mov rcx, qword ptr [rbx + 0x10]
0x145900ebf: 410f28c3 movaps xmm0, xmm11
0x145900ec3: 4885c9 test rcx, rcx
0x145900ec6: 744a je 0x145900f12
0x145900ec8: 488b5308 mov rdx, qword ptr [rbx + 8]
0x145900ecc: 4883c220 add rdx, 0x20
0x145900ed0: 410f28c3 movaps xmm0, xmm11
0x145900ed4: eb09 jmp 0x145900edf
0x145900ed6: 4883c230 add rdx, 0x30
0x145900eda: 48ffc9 dec rcx
0x145900edd: 7433 je 0x145900f12
0x145900edf: 397af0 cmp dword ptr [rdx - 0x10], edi
0x145900ee2: 75f2 jne 0x145900ed6
0x145900ee4: 807ae000 cmp byte ptr [rdx - 0x20], 0
0x145900ee8: 74ec je 0x145900ed6
0x145900eea: 4c396ae8 cmp qword ptr [rdx - 0x18], r13
0x145900eee: 75e6 jne 0x145900ed6
0x145900ef0: 448b02 mov r8d, dword ptr [rdx]
0x145900ef3: 0f57c9 xorps xmm1, xmm1
0x145900ef6: f3490f2ac8 cvtsi2ss xmm1, r8
0x145900efb: f30f594af4 mulss xmm1, dword ptr [rdx - 0xc]
0x145900f00: f30f58c1 addss xmm0, xmm1
0x145900f04: ebd0 jmp 0x145900ed6
0x145900f06: 4589d5 mov r13d, r10d
0x145900f09: 440f28f8 movaps xmm15, xmm0
0x145900f0d: e907fbffff jmp 0x145900a19
0x145900f12: f3410f59ff mulss xmm7, xmm15
0x145900f17: f30f58f8 addss xmm7, xmm0
0x145900f1b: f3440f114c2450 movss dword ptr [rsp + 0x50], xmm9
0x145900f22: 4c896c2440 mov qword ptr [rsp + 0x40], r13
0x145900f27: 89442428 mov dword ptr [rsp + 0x28], eax
0x145900f2b: f3440f11442420 movss dword ptr [rsp + 0x20], xmm8
0x145900f32: 48c744244801000000 mov qword ptr [rsp + 0x48], 1
0x145900f3b: 48c744243801000000 mov qword ptr [rsp + 0x38], 1
0x145900f44: c744243000000000 mov dword ptr [rsp + 0x30], 0
0x145900f4c: 4889d9 mov rcx, rbx
0x145900f4f: 89fa mov edx, edi
0x145900f51: 41b005 mov r8b, 5
0x145900f54: 0f28df movaps xmm3, xmm7
0x145900f57: e864bf0900 call 0x14599cec0
0x145900f5c: 90 nop
0x145900f5d: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
0x145900f64: 488b9578020000 mov rdx, qword ptr [rbp + 0x278]
0x145900f6b: 4189f8 mov r8d, edi
0x145900f6e: 41b101 mov r9b, 1
0x145900f71: e8aacd0400 call 0x14594dd20
0x145900f76: 90 nop
0x145900f77: 4084f6 test sil, sil
0x145900f7a: 4c8bad38040000 mov r13, qword ptr [rbp + 0x438]
0x145900f81: 49ba636f6e666c616772 movabs r10, 0x7267616c666e6f63
0x145900f8b: 49bb666c616772617465 movabs r11, 0x6574617267616c66
0x145900f95: 0f844b040000 je 0x1459013e6
0x145900f9b: 498b85d8010000 mov rax, qword ptr [r13 + 0x1d8]
0x145900fa2: 4885c0 test rax, rax
0x145900fa5: 0f843b040000 je 0x1459013e6
0x145900fab: 498b8dd0010000 mov rcx, qword ptr [r13 + 0x1d0]
0x145900fb2: 48c1e004 shl rax, 4
0x145900fb6: 31d2 xor edx, edx
0x145900fb8: eb13 jmp 0x145900fcd
0x145900fba: 660f1f440000 nop word ptr [rax + rax]
0x145900fc0: 4883c210 add rdx, 0x10
0x145900fc4: 4839d0 cmp rax, rdx
0x145900fc7: 0f8419040000 je 0x1459013e6
0x145900fcd: 4c8b0411 mov r8, qword ptr [rcx + rdx]
0x145900fd1: 498378380b cmp qword ptr [r8 + 0x38], 0xb
0x145900fd6: 75e8 jne 0x145900fc0
0x145900fd8: 4d8b4030 mov r8, qword ptr [r8 + 0x30]
0x145900fdc: 4d8b08 mov r9, qword ptr [r8]
0x145900fdf: 4d31d1 xor r9, r10
0x145900fe2: 4d8b4003 mov r8, qword ptr [r8 + 3]
0x145900fe6: 4d31d8 xor r8, r11
0x145900fe9: 4d09c8 or r8, r9
0x145900fec: 75d2 jne 0x145900fc0
0x145900fee: 807c110800 cmp byte ptr [rcx + rdx + 8], 0
0x145900ff3: 0f84ed030000 je 0x1459013e6
0x145900ff9: 488d8da0000000 lea rcx, [rbp + 0xa0]
0x145901000: 488b95e8030000 mov rdx, qword ptr [rbp + 0x3e8]
0x145901007: e87468f9ff call 0x145897880
0x14590100c: 90 nop
0x14590100d: 488b95d0000000 mov rdx, qword ptr [rbp + 0xd0]
0x145901014: 488b8dd8000000 mov rcx, qword ptr [rbp + 0xd8]
0x14590101b: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
0x145901022: 48c1e006 shl rax, 6
0x145901026: 4531c0 xor r8d, r8d
0x145901029: 4989c9 mov r9, rcx
0x14590102c: 4c8bad38040000 mov r13, qword ptr [rbp + 0x438]
0x145901033: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145901040: 4c39c0 cmp rax, r8
0x145901043: 0f84ca000000 je 0x145901113
0x145901049: 4d89ca mov r10, r9
0x14590104c: 4983c140 add r9, 0x40
0x145901050: 4983c040 add r8, 0x40
0x145901054: 41803a04 cmp byte ptr [r10], 4
0x145901058: 75e6 jne 0x145901040
0x14590105a: 41817a105c010000 cmp dword ptr [r10 + 0x10], 0x15c
0x145901062: 75dc jne 0x145901040
0x145901064: f3420f107c01c4 movss xmm7, dword ptr [rcx + r8 - 0x3c]
0x14590106b: f3460f104401c8 movss xmm8, dword ptr [rcx + r8 - 0x38]
0x145901072: 4885d2 test rdx, rdx
0x145901075: 740f je 0x145901086
0x145901077: 48c1e206 shl rdx, 6
0x14590107b: 41b808000000 mov r8d, 8
0x145901081: e84a1170fa call 0x1400021d0
0x145901086: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
0x14590108d: 4885d2 test rdx, rdx
0x145901090: 7416 je 0x1459010a8
0x145901092: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
0x145901099: 48c1e203 shl rdx, 3
0x14590109d: 41b804000000 mov r8d, 4
0x1459010a3: e8281170fa call 0x1400021d0
0x1459010a8: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
0x1459010af: 4885d2 test rdx, rdx
0x1459010b2: 7416 je 0x1459010ca
0x1459010b4: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
0x1459010bb: 48c1e205 shl rdx, 5
0x1459010bf: 41b808000000 mov r8d, 8
0x1459010c5: e8061170fa call 0x1400021d0
0x1459010ca: 488bbdf0000000 mov rdi, qword ptr [rbp + 0xf0]
0x1459010d1: 488bb5f8000000 mov rsi, qword ptr [rbp + 0xf8]
0x1459010d8: 4885f6 test rsi, rsi
0x1459010db: 0f84f6000000 je 0x1459011d7
0x1459010e1: 488d5f08 lea rbx, [rdi + 8]
0x1459010e5: eb0d jmp 0x1459010f4
0x1459010e7: 4883c328 add rbx, 0x28
0x1459010eb: 48ffce dec rsi
0x1459010ee: 0f84e3000000 je 0x1459011d7
0x1459010f4: 488b53f8 mov rdx, qword ptr [rbx - 8]
0x1459010f8: 4883faff cmp rdx, -1
0x1459010fc: 74e9 je 0x1459010e7
0x1459010fe: 4885d2 test rdx, rdx
0x145901101: 74e4 je 0x1459010e7
0x145901103: 488b0b mov rcx, qword ptr [rbx]
0x145901106: 41b801000000 mov r8d, 1
0x14590110c: e8bf1070fa call 0x1400021d0
0x145901111: ebd4 jmp 0x1459010e7
0x145901113: 4885d2 test rdx, rdx
0x145901116: 740f je 0x145901127
0x145901118: 48c1e206 shl rdx, 6
0x14590111c: 41b808000000 mov r8d, 8
0x145901122: e8a91070fa call 0x1400021d0
0x145901127: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
0x14590112e: 4885d2 test rdx, rdx
0x145901131: 7416 je 0x145901149
0x145901133: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
0x14590113a: 48c1e203 shl rdx, 3
0x14590113e: 41b804000000 mov r8d, 4
0x145901144: e8871070fa call 0x1400021d0
0x145901149: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
0x145901150: 4885d2 test rdx, rdx
0x145901153: 7416 je 0x14590116b
0x145901155: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
0x14590115c: 48c1e205 shl rdx, 5
0x145901160: 41b808000000 mov r8d, 8
0x145901166: e8651070fa call 0x1400021d0
0x14590116b: 488bbdf0000000 mov rdi, qword ptr [rbp + 0xf0]
0x145901172: 488bb5f8000000 mov rsi, qword ptr [rbp + 0xf8]
0x145901179: 4885f6 test rsi, rsi
0x14590117c: 742e je 0x1459011ac
0x14590117e: 488d5f08 lea rbx, [rdi + 8]
0x145901182: eb09 jmp 0x14590118d
0x145901184: 4883c328 add rbx, 0x28
0x145901188: 48ffce dec rsi
0x14590118b: 741f je 0x1459011ac
0x14590118d: 488b53f8 mov rdx, qword ptr [rbx - 8]
0x145901191: 4883faff cmp rdx, -1
0x145901195: 74ed je 0x145901184
0x145901197: 4885d2 test rdx, rdx
0x14590119a: 74e8 je 0x145901184
0x14590119c: 488b0b mov rcx, qword ptr [rbx]
0x14590119f: 41b801000000 mov r8d, 1
0x1459011a5: e8261070fa call 0x1400021d0
0x1459011aa: ebd8 jmp 0x145901184
0x1459011ac: 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
0x1459011b3: 4885c0 test rax, rax
0x1459011b6: 0f842a020000 je 0x1459013e6
0x1459011bc: 48c1e003 shl rax, 3
0x1459011c0: 488d1480 lea rdx, [rax + rax*4]
0x1459011c4: 41b808000000 mov r8d, 8
0x1459011ca: 4889f9 mov rcx, rdi
0x1459011cd: e8fe0f70fa call 0x1400021d0
0x1459011d2: e90f020000 jmp 0x1459013e6
0x1459011d7: 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
0x1459011de: 4885c0 test rax, rax
0x1459011e1: 7416 je 0x1459011f9
0x1459011e3: 48c1e003 shl rax, 3
0x1459011e7: 488d1480 lea rdx, [rax + rax*4]
0x1459011eb: 41b808000000 mov r8d, 8
0x1459011f1: 4889f9 mov rcx, rdi
0x1459011f4: e8d70f70fa call 0x1400021d0
0x1459011f9: 498b8568050000 mov rax, qword ptr [r13 + 0x568]
0x145901200: 48c7c128feffff mov rcx, 0xfffffffffffffe28
0x145901207: 4801c8 add rax, rcx
0x14590120a: 49698d70050000d8010000 imul rcx, qword ptr [r13 + 0x570], 0x1d8
0x145901215: 4c8b4518 mov r8, qword ptr [rbp + 0x18]
0x145901219: 4885c9 test rcx, rcx
0x14590121c: 0f84c4010000 je 0x1459013e6
0x145901222: 488d90d8010000 lea rdx, [rax + 0x1d8]
0x145901229: 4881c128feffff add rcx, -0x1d8
0x145901230: 4c3980c8020000 cmp qword ptr [rax + 0x2c8], r8
0x145901237: 4889d0 mov rax, rdx
0x14590123a: 75dd jne 0x145901219
0x14590123c: f3410f10954c0a0000 movss xmm2, dword ptr [r13 + 0xa4c]
0x145901245: 4c89c7 mov rdi, r8
0x145901248: 488db560030000 lea rsi, [rbp + 0x360]
0x14590124f: 4889f1 mov rcx, rsi
0x145901252: e839ba0900 call 0x14599cc90
0x145901257: 48897d68 mov qword ptr [rbp + 0x68], rdi
0x14590125b: 488d4568 lea rax, [rbp + 0x68]
0x14590125f: 4889442420 mov qword ptr [rsp + 0x20], rax
0x145901264: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
0x14590126d: 488d8da0000000 lea rcx, [rbp + 0xa0]
0x145901274: 4c89ea mov rdx, r13
0x145901277: 4989f0 mov r8, rsi
0x14590127a: 410f28d8 movaps xmm3, xmm8
0x14590127e: e86da00200 call 0x14592b2f0
0x145901283: 90 nop
0x145901284: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
0x14590128b: 48894550 mov qword ptr [rbp + 0x50], rax
0x14590128f: 488b85a8000000 mov rax, qword ptr [rbp + 0xa8]
0x145901296: 48898590000000 mov qword ptr [rbp + 0x90], rax
0x14590129d: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
0x1459012a4: 48898580000000 mov qword ptr [rbp + 0x80], rax
0x1459012ab: 4885c0 test rax, rax
0x1459012ae: 4c8bb538040000 mov r14, qword ptr [rbp + 0x438]
0x1459012b5: 488bb508040000 mov rsi, qword ptr [rbp + 0x408]
0x1459012bc: f30f104548 movss xmm0, dword ptr [rbp + 0x48]
0x1459012c1: 0f84f9000000 je 0x1459013c0
0x1459012c7: 48c1a58000000003 shl qword ptr [rbp + 0x80], 3
0x1459012cf: f30f59f8 mulss xmm7, xmm0
0x1459012d3: f3410f59fd mulss xmm7, xmm13
0x1459012d8: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
0x1459012df: 0fb65838 movzx ebx, byte ptr [rax + 0x38]
0x1459012e3: 410fb6bead010000 movzx edi, byte ptr [r14 + 0x1ad]
0x1459012eb: 4d8bbe88010000 mov r15, qword ptr [r14 + 0x188]
0x1459012f2: 4531ed xor r13d, r13d
0x1459012f5: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
0x1459012fc: 4a8b1428 mov rdx, qword ptr [rax + r13]
0x145901300: 41c686ad01000002 mov byte ptr [r14 + 0x1ad], 2
0x145901308: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
0x14590130f: 49898688010000 mov qword ptr [r14 + 0x188], rax
0x145901316: 0f1006 movups xmm0, xmmword ptr [rsi]
0x145901319: 0f104e10 movups xmm1, xmmword ptr [rsi + 0x10]
0x14590131d: 0f105620 movups xmm2, xmmword ptr [rsi + 0x20]
0x145901321: 0f2995c0000000 movaps xmmword ptr [rbp + 0xc0], xmm2
0x145901328: 0f298db0000000 movaps xmmword ptr [rbp + 0xb0], xmm1
0x14590132f: 0f2985a0000000 movaps xmmword ptr [rbp + 0xa0], xmm0
0x145901336: 488d05bba43001 lea rax, [rip + 0x130a4bb]
0x14590133d: 49898658010000 mov qword ptr [r14 + 0x158], rax
0x145901344: 49c786600100000b000000 mov qword ptr [r14 + 0x160], 0xb
0x14590134f: 49c7866801000000000000 mov qword ptr [r14 + 0x168], 0
0x14590135a: 6641c786800100000000 mov word ptr [r14 + 0x180], 0
0x145901364: 885c2420 mov byte ptr [rsp + 0x20], bl
0x145901368: c644243001 mov byte ptr [rsp + 0x30], 1
0x14590136d: c644242800 mov byte ptr [rsp + 0x28], 0
0x145901372: 4c89f1 mov rcx, r14
0x145901375: 0f28d7 movaps xmm2, xmm7
0x145901378: 4531c9 xor r9d, r9d
0x14590137b: e810d90300 call 0x14593ec90
0x145901380: 90 nop
0x145901381: 0f2885a0000000 movaps xmm0, xmmword ptr [rbp + 0xa0]
0x145901388: 0f288db0000000 movaps xmm1, xmmword ptr [rbp + 0xb0]
0x14590138f: 0f2895c0000000 movaps xmm2, xmmword ptr [rbp + 0xc0]
0x145901396: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
0x14590139a: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
0x14590139e: 0f1106 movups xmmword ptr [rsi], xmm0
0x1459013a1: 4d89be88010000 mov qword ptr [r14 + 0x188], r15
0x1459013a8: 4188bead010000 mov byte ptr [r14 + 0x1ad], dil
0x1459013af: 4983c508 add r13, 8
0x1459013b3: 4c39ad80000000 cmp qword ptr [rbp + 0x80], r13
0x1459013ba: 0f8535ffffff jne 0x1459012f5
0x1459013c0: 488b5550 mov rdx, qword ptr [rbp + 0x50]
0x1459013c4: 4885d2 test rdx, rdx
0x1459013c7: 7416 je 0x1459013df
0x1459013c9: 48c1e203 shl rdx, 3
0x1459013cd: 41b808000000 mov r8d, 8
0x1459013d3: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
0x1459013da: e8f10d70fa call 0x1400021d0
0x1459013df: 4c8bad38040000 mov r13, qword ptr [rbp + 0x438]
