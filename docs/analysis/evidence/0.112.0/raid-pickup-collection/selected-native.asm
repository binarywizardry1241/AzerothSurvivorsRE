1459029f2: 488b8568030000 mov rax, qword ptr [rbp + 0x368]
1459029f9: 488d0c76 lea rcx, [rsi + rsi*2]
1459029fd: 4c893cc8 mov qword ptr [rax + rcx*8], r15
145902a01: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
145902a08: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145902a0d: 8b95a8000000 mov edx, dword ptr [rbp + 0xa8]
145902a13: 8954c810 mov dword ptr [rax + rcx*8 + 0x10], edx
145902a17: f3440f117cc814 movss dword ptr [rax + rcx*8 + 0x14], xmm15
145902a1e: 48ffc6 inc rsi
145902a21: 4889b570030000 mov qword ptr [rbp + 0x370], rsi
145902a28: 4c8b8df8030000 mov r9, qword ptr [rbp + 0x3f8]
145902a2f: 90 nop
145902a69: 31c9 xor ecx, ecx
145902a6b: 4b3914c1 cmp qword ptr [r9 + r8*8], rdx
145902a6f: 7441 je 0x145902ab2
145902a71: 4b3954c108 cmp qword ptr [r9 + r8*8 + 8], rdx
145902a76: 743a je 0x145902ab2
145902a78: 4b3954c110 cmp qword ptr [r9 + r8*8 + 0x10], rdx
145902a7d: 7433 je 0x145902ab2
145902a7f: 4b3954c118 cmp qword ptr [r9 + r8*8 + 0x18], rdx
145902a84: 742c je 0x145902ab2
145902a86: 4b3954c120 cmp qword ptr [r9 + r8*8 + 0x20], rdx
145902a8b: 7425 je 0x145902ab2
145902a8d: 4b3954c128 cmp qword ptr [r9 + r8*8 + 0x28], rdx
145902a92: 741e je 0x145902ab2
145902a94: 4b3954c130 cmp qword ptr [r9 + r8*8 + 0x30], rdx
145902a99: 7417 je 0x145902ab2
145902a9b: 4b3954c138 cmp qword ptr [r9 + r8*8 + 0x38], rdx
145902aa0: 4d8d4008 lea r8, [r8 + 8]
145902aa4: 75ba jne 0x145902a60
145902aa6: eb0a jmp 0x145902ab2
145902ab0: 31c9 xor ecx, ecx
145902aca: f20f104034 movsd xmm0, qword ptr [rax + 0x34]
145902acf: 0f5cc7 subps xmm0, xmm7
145902ad2: 0f59c0 mulps xmm0, xmm0
145902ad5: f30f16c8 movshdup xmm1, xmm0
145902ad9: f30f58c8 addss xmm1, xmm0
145902add: 450f57ff xorps xmm15, xmm15
145902ae1: f3440f51f9 sqrtss xmm15, xmm1
145902ae6: 450f2ecf ucomiss xmm9, xmm15
145902aea: 0f92c2 setb dl
145902aed: 4189c8 mov r8d, ecx
145902af0: 41f6d0 not r8b
145902af3: 4184d0 test r8b, dl
145902af6: 0f8534ffffff jne 0x145902a30
145902afc: 44889508040000 mov byte ptr [rbp + 0x408], r10b
145902b03: 410f28c3 movaps xmm0, xmm11
145902b07: f6c101 test cl, 1
145902b0a: 7504 jne 0x145902b10
145902b0c: 410f28c5 movaps xmm0, xmm13
145902b10: 488d4834 lea rcx, [rax + 0x34]
145902b14: f3440f5ef8 divss xmm15, xmm0
145902b19: f3450f5ffe maxss xmm15, xmm14
145902b1e: 410f28c0 movaps xmm0, xmm8
145902b22: f3410f58c7 addss xmm0, xmm15
145902b27: c7401801000000 mov dword ptr [rax + 0x18], 1
145902b2e: f30f11401c movss dword ptr [rax + 0x1c], xmm0
145902b33: 4c8b7828 mov r15, qword ptr [rax + 0x28]
145902b37: 8b4108 mov eax, dword ptr [rcx + 8]
145902b3a: 8985a8000000 mov dword ptr [rbp + 0xa8], eax
145902b40: 488b01 mov rax, qword ptr [rcx]
145902b43: 488985a0000000 mov qword ptr [rbp + 0xa0], rax
145902b4a: 488bb570030000 mov rsi, qword ptr [rbp + 0x370]
145902b51: 483bb560030000 cmp rsi, qword ptr [rbp + 0x360]
145902b58: 0f8594feffff jne 0x1459029f2
145902b5e: 4c89e9 mov rcx, r13
145902b61: e83aae3000 call 0x145c0d9a0
145902b66: 90 nop
145902b67: e986feffff jmp 0x1459029f2
145902b79: 4f8b04f1 mov r8, qword ptr [r9 + r14*8]
145902b7d: 4939d0 cmp r8, rdx
145902b80: 0f95c1 setne cl
145902b83: f6d9 neg cl
145902b85: 4939d0 cmp r8, rdx
145902b88: 0f8424ffffff je 0x145902ab2
145902b8e: 83fb08 cmp ebx, 8
145902b91: 0f841bffffff je 0x145902ab2
145902b97: 4f8b44f108 mov r8, qword ptr [r9 + r14*8 + 8]
145902b9c: 4939d0 cmp r8, rdx
145902b9f: 0f95c1 setne cl
145902ba2: f6d9 neg cl
145902ba4: 4939d0 cmp r8, rdx
145902ba7: 0f8405ffffff je 0x145902ab2
145902bad: 83fb10 cmp ebx, 0x10
145902bb0: 0f84fcfeffff je 0x145902ab2
145902bb6: 4f8b44f110 mov r8, qword ptr [r9 + r14*8 + 0x10]
145902bbb: 4939d0 cmp r8, rdx
145902bbe: 0f95c1 setne cl
145902bc1: f6d9 neg cl
145902bc3: 4939d0 cmp r8, rdx
145902bc6: 0f84e6feffff je 0x145902ab2
145902bcc: 83fb18 cmp ebx, 0x18
145902bcf: 0f84ddfeffff je 0x145902ab2
145902bd5: 4f8b44f118 mov r8, qword ptr [r9 + r14*8 + 0x18]
145902bda: 4939d0 cmp r8, rdx
145902bdd: 0f95c1 setne cl
145902be0: f6d9 neg cl
145902be2: 4939d0 cmp r8, rdx
145902be5: 0f84c7feffff je 0x145902ab2
145902beb: 83fb20 cmp ebx, 0x20
145902bee: 0f84befeffff je 0x145902ab2
145902bf4: 4f8b44f120 mov r8, qword ptr [r9 + r14*8 + 0x20]
145902bf9: 4939d0 cmp r8, rdx
145902bfc: 0f95c1 setne cl
145902bff: f6d9 neg cl
145902c01: 4939d0 cmp r8, rdx
145902c04: 0f84a8feffff je 0x145902ab2
145902c0a: 83fb28 cmp ebx, 0x28
145902c0d: 0f849ffeffff je 0x145902ab2
145902c13: 4f8b44f128 mov r8, qword ptr [r9 + r14*8 + 0x28]
145902c18: 4939d0 cmp r8, rdx
145902c1b: 0f95c1 setne cl
145902c1e: f6d9 neg cl
145902c20: 4939d0 cmp r8, rdx
145902c23: 0f8489feffff je 0x145902ab2
145902c29: 83fb30 cmp ebx, 0x30
145902c2c: 0f8480feffff je 0x145902ab2
145902c32: 4883fb38 cmp rbx, 0x38
145902c36: 410f94c0 sete r8b
145902c3a: 4b3954f130 cmp qword ptr [r9 + r14*8 + 0x30], rdx
145902c3f: 0f95c1 setne cl
145902c42: 4420c1 and cl, r8b
145902c45: e968feffff jmp 0x145902ab2
145902cc0: 4983c518 add r13, 0x18
145902cc4: 488b9538040000 mov rdx, qword ptr [rbp + 0x438]
145902ccb: 488b8228060000 mov rax, qword ptr [rdx + 0x628]
145902cd2: 4c89f9 mov rcx, r15
145902cd5: 48c1e105 shl rcx, 5
145902cd9: 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
145902ce0: 0f108db0000000 movups xmm1, xmmword ptr [rbp + 0xb0]
145902ce7: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145902cec: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145902cf0: 49ffc7 inc r15
145902cf3: 4c89ba30060000 mov qword ptr [rdx + 0x630], r15
145902d03: 498b5500 mov rdx, qword ptr [r13]
145902d07: 418b4510 mov eax, dword ptr [r13 + 0x10]
145902d0b: 898588020000 mov dword ptr [rbp + 0x288], eax
145902d11: 498b4508 mov rax, qword ptr [r13 + 8]
145902d15: 48898580020000 mov qword ptr [rbp + 0x280], rax
145902d1c: f3410f104514 movss xmm0, dword ptr [r13 + 0x14]
145902d22: 4c8b8538040000 mov r8, qword ptr [rbp + 0x438]
145902d29: 418b807c0a0000 mov eax, dword ptr [r8 + 0xa7c]
145902d30: ffc0 inc eax
145902d32: f3410f59c2 mulss xmm0, xmm10
145902d37: f3480f2cc8 cvttss2si rcx, xmm0
145902d3c: 410f2ec3 ucomiss xmm0, xmm11
145902d40: 410f42cc cmovb ecx, r12d
145902d44: 4189807c0a0000 mov dword ptr [r8 + 0xa7c], eax
145902d4b: 410f2ec4 ucomiss xmm0, xmm12
145902d4f: 41b8ffffffff mov r8d, 0xffffffff
145902d55: 7703 ja 0x145902d5a
145902d57: 4189c8 mov r8d, ecx
145902d5a: 0f13bd00030000 movlps qword ptr [rbp + 0x300], xmm7
145902d61: 8b8d10040000 mov ecx, dword ptr [rbp + 0x410]
145902d67: 898d08030000 mov dword ptr [rbp + 0x308], ecx
145902d6d: 4489442428 mov dword ptr [rsp + 0x28], r8d
145902d72: 89442420 mov dword ptr [rsp + 0x20], eax
145902d76: 4889f9 mov rcx, rdi
145902d79: 4989d8 mov r8, rbx
145902d7c: 4d89f1 mov r9, r14
145902d7f: e86c0efcff call 0x1458c3bf0
145902d84: 90 nop
145902d85: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145902d8c: 4c8bb830060000 mov r15, qword ptr [rax + 0x630]
145902d93: 4c3bb820060000 cmp r15, qword ptr [rax + 0x620]
145902d9a: 0f8520ffffff jne 0x145902cc0
145902dbe: 48c1e003 shl rax, 3
145902dc2: 488d1440 lea rdx, [rax + rax*2]
145902dc6: 41b808000000 mov r8d, 8
145902dcc: 488b8dd8030000 mov rcx, qword ptr [rbp + 0x3d8]
145902dd3: e8f8f36ffa call 0x1400021d0
145902e40: f20f104134 movsd xmm0, qword ptr [rcx + 0x34]
145902e45: 0f5cc7 subps xmm0, xmm7
145902e48: 0f59c0 mulps xmm0, xmm0
145902e4b: f30f16c8 movshdup xmm1, xmm0
145902e4f: f30f58c8 addss xmm1, xmm0
145902e53: 0f57c0 xorps xmm0, xmm0
145902e56: f30f51c1 sqrtss xmm0, xmm1
145902e5a: 440f2ed0 ucomiss xmm10, xmm0
145902e5e: 7349 jae 0x145902ea9
145902e60: 4883c148 add rcx, 0x48
145902e64: 49ffc6 inc r14
145902e67: 4839d1 cmp rcx, rdx
145902e6a: 0f8485000000 je 0x145902ef5
145903153: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
14590315a: ff81a4070000 inc dword ptr [rcx + 0x7a4]
145903160: e8ebb90400 call 0x14594eb50
145903165: 90 nop
145903166: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
14590316d: 488b8f18060000 mov rcx, qword ptr [rdi + 0x618]
145903174: 4885c9 test rcx, rcx
145903177: 4c8d352a236401 lea r14, [rip + 0x164232a]
14590317e: 0f84b1010000 je 0x145903335
145903184: f30f1087d0040000 movss xmm0, dword ptr [rdi + 0x4d0]
14590318c: f30f108fd4040000 movss xmm1, dword ptr [rdi + 0x4d4]
145903194: f30f10974c0a0000 movss xmm2, dword ptr [rdi + 0xa4c]
14590319c: 488b8710060000 mov rax, qword ptr [rdi + 0x610]
1459031a3: 48c1e103 shl rcx, 3
1459031a7: 488d0cc9 lea rcx, [rcx + rcx*8]
1459031ab: 31d2 xor edx, edx
1459031ad: eb0e jmp 0x1459031bd
1459031b0: 4883c248 add rdx, 0x48
1459031b4: 4839d1 cmp rcx, rdx
1459031b7: 0f8478010000 je 0x145903335
1459031bd: 837c102001 cmp dword ptr [rax + rdx + 0x20], 1
1459031c2: 75ec jne 0x1459031b0
1459031c4: 837c101800 cmp dword ptr [rax + rdx + 0x18], 0
1459031c9: 75e5 jne 0x1459031b0
1459031cb: f30f105c1034 movss xmm3, dword ptr [rax + rdx + 0x34]
1459031d1: f30f5cd8 subss xmm3, xmm0
1459031d5: f30f10641038 movss xmm4, dword ptr [rax + rdx + 0x38]
1459031db: f30f5ce1 subss xmm4, xmm1
1459031df: f30f59db mulss xmm3, xmm3
1459031e3: f30f59e4 mulss xmm4, xmm4
1459031e7: f30f58e3 addss xmm4, xmm3
1459031eb: 0f57db xorps xmm3, xmm3
1459031ee: f30f51dc sqrtss xmm3, xmm4
1459031f2: f30f5e1deaa24a00 divss xmm3, dword ptr [rip + 0x4aa2ea]
1459031fa: f3410f5fd8 maxss xmm3, xmm8
1459031ff: f30f58da addss xmm3, xmm2
145903203: c744101801000000 mov dword ptr [rax + rdx + 0x18], 1
14590320b: f30f115c101c movss dword ptr [rax + rdx + 0x1c], xmm3
145903211: eb9d jmp 0x1459031b0
145903335: e8c6ee6ffa call 0x140002200
14590333a: b920000000 mov ecx, 0x20
14590333f: ba01000000 mov edx, 1
145903344: e877ee6ffa call 0x1400021c0
145903349: 4885c0 test rax, rax
14590334c: 0f847f500000 je 0x1459083d1
145903352: 488985e0020000 mov qword ptr [rbp + 0x2e0], rax
145903359: c70078000000 mov dword ptr [rax], 0x78
14590335f: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145903366: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
14590336d: 750d jne 0x14590337c
14590337c: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
145903383: 4889f1 mov rcx, rsi
145903386: 48c1e105 shl rcx, 5
14590338a: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
145903392: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
145903399: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14590339e: 48c744081004000000 mov qword ptr [rax + rcx + 0x10], 4
1459033a7: 66c7440818d202 mov word ptr [rax + rcx + 0x18], 0x2d2
1459033ae: 48ffc6 inc rsi
1459033b1: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
1459033b8: ba2d000000 mov edx, 0x2d
1459033bd: 4c89f1 mov rcx, r14
1459033c0: e80baa0800 call 0x14598ddd0
1459033c5: 90 nop
1459033c6: bf1e000000 mov edi, 0x1e
1459033cb: 4989d6 mov r14, rdx
1459033ce: 4885c0 test rax, rax
1459033d1: 488d0dd0206401 lea rcx, [rip + 0x16420d0]
1459033d8: 480f44c1 cmove rax, rcx
1459033dc: b92d000000 mov ecx, 0x2d
1459033e1: 4c0f44f1 cmove r14, rcx
1459033e5: 4d85f6 test r14, r14
1459033e8: 0f88a8010000 js 0x145903596
1459033ee: 0f8419010000 je 0x14590350d
1459033f4: 4c89e6 mov rsi, r12
1459033f7: 4989c4 mov r12, rax
1459033fa: e801ee6ffa call 0x140002200
1459033ff: bf01000000 mov edi, 1
145903404: ba01000000 mov edx, 1
145903409: 4c89f1 mov rcx, r14
14590340c: e8afed6ffa call 0x1400021c0
145903411: 4885c0 test rax, rax
145903414: 0f847e010000 je 0x145903598
14590341a: 4989c5 mov r13, rax
14590341d: 4889c1 mov rcx, rax
145903420: 4c89e2 mov rdx, r12
145903423: 4d89f0 mov r8, r14
145903426: e8b06f3000 call 0x145c0a3db
14590342b: 4989f4 mov r12, rsi
14590342e: bf1e000000 mov edi, 0x1e
145903433: e9db000000 jmp 0x145903513
145903513: 488d05bb1f6401 lea rax, [rip + 0x1641fbb]
14590351a: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
145903521: 48c785d800000006000000 mov qword ptr [rbp + 0xd8], 6
14590352c: 4c89b5a0000000 mov qword ptr [rbp + 0xa0], r14
145903533: 4c89ada8000000 mov qword ptr [rbp + 0xa8], r13
14590353a: 4c89b5b0000000 mov qword ptr [rbp + 0xb0], r14
145903541: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
14590354c: 48c785c000000001000000 mov qword ptr [rbp + 0xc0], 1
145903557: 48c785c800000000000000 mov qword ptr [rbp + 0xc8], 0
145903562: c685e000000000 mov byte ptr [rbp + 0xe0], 0
145903569: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
145903570: 488d95a0000000 lea rdx, [rbp + 0xa0]
145903577: e824fa0000 call 0x145912fa0
14590357c: 90 nop
14590357d: e9bef9ffff jmp 0x145902f40
1459035de: 48c1e203 shl rdx, 3
1459035e2: 41b808000000 mov r8d, 8
1459035e8: 488b8df8030000 mov rcx, qword ptr [rbp + 0x3f8]
1459035ef: e8dceb6ffa call 0x1400021d0
14594d9e0: 55 push rbp
14594d9e1: 4157 push r15
14594d9e3: 4156 push r14
14594d9e5: 4154 push r12
14594d9e7: 56 push rsi
14594d9e8: 57 push rdi
14594d9e9: 53 push rbx
14594d9ea: 4883ec50 sub rsp, 0x50
14594d9ee: 488d6c2450 lea rbp, [rsp + 0x50]
14594d9f3: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14594d9fb: 4889d7 mov rdi, rdx
14594d9fe: 488b9918060000 mov rbx, qword ptr [rcx + 0x618]
14594da05: 4839da cmp rdx, rbx
14594da08: 0f83c5010000 jae 0x14594dbd3
14594da0e: 4889ce mov rsi, rcx
14594da11: 488b8110060000 mov rax, qword ptr [rcx + 0x610]
14594da18: 488d14ff lea rdx, [rdi + rdi*8]
14594da1c: 488d0cd0 lea rcx, [rax + rdx*8]
14594da20: 4c8b24d0 mov r12, qword ptr [rax + rdx*8]
14594da24: 4c8b44d008 mov r8, qword ptr [rax + rdx*8 + 8]
14594da29: 4c8945d8 mov qword ptr [rbp - 0x28], r8
14594da2d: 4c8b74d010 mov r14, qword ptr [rax + rdx*8 + 0x10]
14594da32: 4c8b7cd028 mov r15, qword ptr [rax + rdx*8 + 0x28]
14594da37: 488d14d0 lea rdx, [rax + rdx*8]
14594da3b: 4883c248 add rdx, 0x48
14594da3f: 4889f8 mov rax, rdi
14594da42: 48f7d0 not rax
14594da45: 4801d8 add rax, rbx
14594da48: 48c1e003 shl rax, 3
14594da4c: 4c8d04c0 lea r8, [rax + rax*8]
14594da50: e898c92b00 call 0x145c0a3ed
14594da55: 48ffcb dec rbx
14594da58: 48899e18060000 mov qword ptr [rsi + 0x618], rbx
14594da5f: 4983fcff cmp r12, -1
14594da63: 0f846a010000 je 0x14594dbd3
14594da69: 4c8965e8 mov qword ptr [rbp - 0x18], r12
14594da6d: e88e476bfa call 0x140002200
14594da72: b920000000 mov ecx, 0x20
14594da77: ba01000000 mov edx, 1
14594da7c: e83f476bfa call 0x1400021c0
14594da81: 4885c0 test rax, rax
14594da84: 0f845d010000 je 0x14594dbe7
14594da8a: 488dbe20060000 lea rdi, [rsi + 0x620]
14594da91: 488945e0 mov qword ptr [rbp - 0x20], rax
14594da95: 4c8938 mov qword ptr [rax], r15
14594da98: 488b9e30060000 mov rbx, qword ptr [rsi + 0x630]
14594da9f: 483b9e20060000 cmp rbx, qword ptr [rsi + 0x620]
14594daa6: 7509 jne 0x14594dab1
14594dab1: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594dab8: 4889d9 mov rcx, rbx
14594dabb: 48c1e105 shl rcx, 5
14594dabf: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14594dac7: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594dacb: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14594dad0: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14594dad9: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14594dae0: 48ffc3 inc rbx
14594dae3: 48899e30060000 mov qword ptr [rsi + 0x630], rbx
14594daea: 4d85f6 test r14, r14
14594daed: 0f8495000000 je 0x14594db88
14594daf3: 49c1e603 shl r14, 3
14594daf7: 31db xor ebx, ebx
14594daf9: eb47 jmp 0x14594db42
14594db00: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594db07: 4c89f9 mov rcx, r15
14594db0a: 48c1e105 shl rcx, 5
14594db0e: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14594db16: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594db1a: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14594db1f: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14594db28: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14594db2f: 49ffc7 inc r15
14594db32: 4c89be30060000 mov qword ptr [rsi + 0x630], r15
14594db39: 4883c308 add rbx, 8
14594db3d: 4939de cmp r14, rbx
14594db40: 7446 je 0x14594db88
14594db42: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14594db46: 4c8b3c18 mov r15, qword ptr [rax + rbx]
14594db4a: e8b1466bfa call 0x140002200
14594db4f: b920000000 mov ecx, 0x20
14594db54: ba01000000 mov edx, 1
14594db59: e862466bfa call 0x1400021c0
14594db5e: 4885c0 test rax, rax
14594db61: 745e je 0x14594dbc1
14594db63: 488945e0 mov qword ptr [rbp - 0x20], rax
14594db67: 4c8938 mov qword ptr [rax], r15
14594db6a: 4c8bbe30060000 mov r15, qword ptr [rsi + 0x630]
14594db71: 4c3bbe20060000 cmp r15, qword ptr [rsi + 0x620]
14594db78: 7586 jne 0x14594db00
14594db88: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14594db8c: 4885d2 test rdx, rdx
14594db8f: 7421 je 0x14594dbb2
14594db91: 48c1e203 shl rdx, 3
14594db95: 41b808000000 mov r8d, 8
14594db9b: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
14594db9f: 4883c450 add rsp, 0x50
14594dba3: 5b pop rbx
14594dba4: 5f pop rdi
14594dba5: 5e pop rsi
14594dba6: 415c pop r12
14594dba8: 415e pop r14
14594dbaa: 415f pop r15
14594dbac: 5d pop rbp
14594dbad: e91e466bfa jmp 0x1400021d0
14594dbb2: 4883c450 add rsp, 0x50
14594dbb6: 5b pop rbx
14594dbb7: 5f pop rdi
14594dbb8: 5e pop rsi
14594dbb9: 415c pop r12
14594dbbb: 415e pop r14
14594dbbd: 415f pop r15
14594dbbf: 5d pop rbp
14594dbc0: c3 ret
14595e4a4: 488b8618060000 mov rax, qword ptr [rsi + 0x618]
14595e4ab: 4885c0 test rax, rax
14595e4ae: 0f84c3000000 je 0x14595e577
14595e4b4: f20f10b6d0040000 movsd xmm6, qword ptr [rsi + 0x4d0]
14595e4bc: f30f10be98040000 movss xmm7, dword ptr [rsi + 0x498]
14595e4c4: 31ff xor edi, edi
14595e4c6: 31db xor ebx, ebx
14595e4c8: eb0e jmp 0x14595e4d8
14595e4d0: 48ffc7 inc rdi
14595e4d3: 4839c7 cmp rdi, rax
14595e4d6: 7355 jae 0x14595e52d
14595e4d8: 488b8e10060000 mov rcx, qword ptr [rsi + 0x610]
14595e4df: 488d14ff lea rdx, [rdi + rdi*8]
14595e4e3: 837cd12000 cmp dword ptr [rcx + rdx*8 + 0x20], 0
14595e4e8: 75e6 jne 0x14595e4d0
14595e4ea: 488d0cd1 lea rcx, [rcx + rdx*8]
14595e4ee: 83791800 cmp dword ptr [rcx + 0x18], 0
14595e4f2: 751f jne 0x14595e513
14595e4f4: f20f104134 movsd xmm0, qword ptr [rcx + 0x34]
14595e4f9: 0f5cc6 subps xmm0, xmm6
14595e4fc: 0f59c0 mulps xmm0, xmm0
14595e4ff: f30f16c8 movshdup xmm1, xmm0
14595e503: f30f58c8 addss xmm1, xmm0
14595e507: 0f57c0 xorps xmm0, xmm0
14595e50a: f30f51c1 sqrtss xmm0, xmm1
14595e50e: 0f2ef8 ucomiss xmm7, xmm0
14595e511: 72bd jb 0x14595e4d0
14595e513: 035924 add ebx, dword ptr [rcx + 0x24]
14595e516: 4889f1 mov rcx, rsi
14595e519: 4889fa mov rdx, rdi
14595e51c: e8bff4feff call 0x14594d9e0
14595e521: 488b8618060000 mov rax, qword ptr [rsi + 0x618]
14595e528: 4839c7 cmp rdi, rax
14595e52b: 72ab jb 0x14595e4d8
14595e52d: 85db test ebx, ebx
14595e52f: 7446 je 0x14595e577
14595e531: 89d8 mov eax, ebx
14595e533: 0f57c0 xorps xmm0, xmm0
14595e536: f3480f2ac0 cvtsi2ss xmm0, rax
14595e53b: f30f59869c040000 mulss xmm0, dword ptr [rsi + 0x49c]
14595e543: e8d5be2a00 call 0x145c0a41d
14595e548: f30f5f0510ed4400 maxss xmm0, dword ptr [rip + 0x44ed10]
14595e550: f3480f2cc0 cvttss2si rax, xmm0
14595e555: 31c9 xor ecx, ecx
14595e557: 0f57c9 xorps xmm1, xmm1
14595e55a: 0f2ec1 ucomiss xmm0, xmm1
14595e55d: 0f43c8 cmovae ecx, eax
14595e560: 0f2e05dd854500 ucomiss xmm0, dword ptr [rip + 0x4585dd]
14595e567: baffffffff mov edx, 0xffffffff
14595e56c: 0f46d1 cmovbe edx, ecx
14595e56f: 4889f1 mov rcx, rsi
14595e572: e80939fbff call 0x145911e80
1459d4d20: 55 push rbp
1459d4d21: 4157 push r15
1459d4d23: 4156 push r14
1459d4d25: 4155 push r13
1459d4d27: 4154 push r12
1459d4d29: 56 push rsi
1459d4d2a: 57 push rdi
1459d4d2b: 53 push rbx
1459d4d2c: 4883ec48 sub rsp, 0x48
1459d4d30: 488d6c2440 lea rbp, [rsp + 0x40]
1459d4d35: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459d4d3d: 4889ce mov rsi, rcx
1459d4d40: 4c8b32 mov r14, qword ptr [rdx]
1459d4d43: 4c8b7a08 mov r15, qword ptr [rdx + 8]
1459d4d47: 4d39fe cmp r14, r15
1459d4d4a: 7449 je 0x1459d4d95
1459d4d4c: 4c8b6210 mov r12, qword ptr [rdx + 0x10]
1459d4d50: 498b842458090000 mov rax, qword ptr [r12 + 0x958]
1459d4d58: 496b8c246009000070 imul rcx, qword ptr [r12 + 0x960], 0x70
1459d4d61: 498b7e28 mov rdi, qword ptr [r14 + 0x28]
1459d4d65: 4983c648 add r14, 0x48
1459d4d69: 4989c8 mov r8, rcx
1459d4d6c: 4989c1 mov r9, rax
1459d4d6f: 90 nop
1459d4d70: 4d85c0 test r8, r8
1459d4d73: 741b je 0x1459d4d90
1459d4d75: 4d89ca mov r10, r9
1459d4d78: 4983c170 add r9, 0x70
1459d4d7c: 4983c090 add r8, -0x70
1459d4d80: 41837a1801 cmp dword ptr [r10 + 0x18], 1
1459d4d85: 75e9 jne 0x1459d4d70
1459d4d87: 49397a20 cmp qword ptr [r10 + 0x20], rdi
1459d4d8b: 75e3 jne 0x1459d4d70
1459d4d8d: eb22 jmp 0x1459d4db1
1459d4d90: 4d39fe cmp r14, r15
1459d4d93: 75cc jne 0x1459d4d61
1459d4d95: 48c70600000000 mov qword ptr [rsi], 0
1459d4d9c: 48c7460808000000 mov qword ptr [rsi + 8], 8
1459d4da4: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1459d4dac: e906010000 jmp 0x1459d4eb7
1459d4db1: 4c8932 mov qword ptr [rdx], r14
1459d4db4: e847d462fa call 0x140002200
1459d4db9: b920000000 mov ecx, 0x20
1459d4dbe: ba08000000 mov edx, 8
1459d4dc3: e8f8d362fa call 0x1400021c0
1459d4dc8: 4885c0 test rax, rax
1459d4dcb: 0f84fa000000 je 0x1459d4ecb
1459d4dd1: 488938 mov qword ptr [rax], rdi
1459d4dd4: 48c745e804000000 mov qword ptr [rbp - 0x18], 4
1459d4ddc: 488945f0 mov qword ptr [rbp - 0x10], rax
1459d4de0: 48c745f801000000 mov qword ptr [rbp - 8], 1
1459d4de8: 4d39fe cmp r14, r15
1459d4deb: 0f84af000000 je 0x1459d4ea0
1459d4df1: bf01000000 mov edi, 1
1459d4df6: 488d5de8 lea rbx, [rbp - 0x18]
1459d4dfa: eb18 jmp 0x1459d4e14
1459d4e00: 4c892cf8 mov qword ptr [rax + rdi*8], r13
1459d4e04: 48ffc7 inc rdi
1459d4e07: 48897df8 mov qword ptr [rbp - 8], rdi
1459d4e0b: 4d39fe cmp r14, r15
1459d4e0e: 0f848c000000 je 0x1459d4ea0
1459d4e14: 498b8c2458090000 mov rcx, qword ptr [r12 + 0x958]
1459d4e1c: 496b94246009000070 imul rdx, qword ptr [r12 + 0x960], 0x70
1459d4e25: 4d8b6e28 mov r13, qword ptr [r14 + 0x28]
1459d4e29: 4983c648 add r14, 0x48
1459d4e2d: 4989d0 mov r8, rdx
1459d4e30: 4989c9 mov r9, rcx
1459d4e33: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459d4e40: 4d85c0 test r8, r8
1459d4e43: 741b je 0x1459d4e60
1459d4e45: 4d89ca mov r10, r9
1459d4e48: 4983c170 add r9, 0x70
1459d4e4c: 4983c090 add r8, -0x70
1459d4e50: 41837a1801 cmp dword ptr [r10 + 0x18], 1
1459d4e55: 75e9 jne 0x1459d4e40
1459d4e57: 4d396a20 cmp qword ptr [r10 + 0x20], r13
1459d4e5b: 75e3 jne 0x1459d4e40
1459d4e5d: eb11 jmp 0x1459d4e70
1459d4e60: 4d39fe cmp r14, r15
1459d4e63: 75c0 jne 0x1459d4e25
1459d4e65: eb39 jmp 0x1459d4ea0
1459d4e70: 483b7de8 cmp rdi, qword ptr [rbp - 0x18]
1459d4e74: 758a jne 0x1459d4e00
1459d4e76: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
1459d4e7f: 41b801000000 mov r8d, 1
1459d4e85: 41b908000000 mov r9d, 8
1459d4e8b: 4889d9 mov rcx, rbx
1459d4e8e: 4889fa mov rdx, rdi
1459d4e91: e8da852300 call 0x145c0d470
1459d4e96: 90 nop
1459d4e97: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459d4e9b: e960ffffff jmp 0x1459d4e00
1459d4ea0: 488b45f8 mov rax, qword ptr [rbp - 8]
1459d4ea4: 48894610 mov qword ptr [rsi + 0x10], rax
1459d4ea8: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459d4eac: 488906 mov qword ptr [rsi], rax
1459d4eaf: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459d4eb3: 48894608 mov qword ptr [rsi + 8], rax
1459d4eb7: 4889f0 mov rax, rsi
1459d4eba: 4883c448 add rsp, 0x48
1459d4ebe: 5b pop rbx
1459d4ebf: 5f pop rdi
1459d4ec0: 5e pop rsi
1459d4ec1: 415c pop r12
1459d4ec3: 415d pop r13
1459d4ec5: 415e pop r14
1459d4ec7: 415f pop r15
1459d4ec9: 5d pop rbp
1459d4eca: c3 ret
