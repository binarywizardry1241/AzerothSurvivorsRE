14013b920: 55 push rbp
14013b921: 4157 push r15
14013b923: 4156 push r14
14013b925: 4155 push r13
14013b927: 4154 push r12
14013b929: 56 push rsi
14013b92a: 57 push rdi
14013b92b: 53 push rbx
14013b92c: 4881ec88010000 sub rsp, 0x188
14013b933: 488dac2480000000 lea rbp, [rsp + 0x80]
14013b93b: 440f299df0000000 movaps xmmword ptr [rbp + 0xf0], xmm11
14013b943: 440f2995e0000000 movaps xmmword ptr [rbp + 0xe0], xmm10
14013b94b: 440f298dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm9
14013b953: 440f2985c0000000 movaps xmmword ptr [rbp + 0xc0], xmm8
14013b95b: 0f29bdb0000000 movaps xmmword ptr [rbp + 0xb0], xmm7
14013b962: 0f29b5a0000000 movaps xmmword ptr [rbp + 0xa0], xmm6
14013b969: 48c78598000000feffffff mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
14013b974: 488b4210 mov rax, qword ptr [rdx + 0x10]
14013b978: 48898588000000 mov qword ptr [rbp + 0x88], rax
14013b97f: 4885c0 test rax, rax
14013b982: 0f841c040000 je 0x14013bda4
14013b988: 0fb6422c movzx eax, byte ptr [rdx + 0x2c]
14013b98c: 4c8d050192ca05 lea r8, [rip + 0x5ca9201]
14013b993: 49630480 movsxd rax, dword ptr [r8 + rax*4]
14013b997: 4c01c0 add rax, r8
14013b99a: ffe0 jmp rax
14013b99c: 488b01 mov rax, qword ptr [rcx]
14013b99f: 4c8b4108 mov r8, qword ptr [rcx + 8]
14013b9a3: f20f1000 movsd xmm0, qword ptr [rax]
14013b9a7: f30f107008 movss xmm6, dword ptr [rax + 8]
14013b9ac: 31c0 xor eax, eax
14013b9ae: 4183783000 cmp dword ptr [r8 + 0x30], 0
14013b9b3: 0f94c0 sete al
14013b9b6: 4c8d058368ca05 lea r8, [rip + 0x5ca6883]
14013b9bd: f3410f100c80 movss xmm1, dword ptr [r8 + rax*4]
14013b9c3: e992000000 jmp 0x14013ba5a
14013b9c8: 488b4108 mov rax, qword ptr [rcx + 8]
14013b9cc: 80787c00 cmp byte ptr [rax + 0x7c], 0
14013b9d0: 0f85ce030000 jne 0x14013bda4
14013b9d6: 488b01 mov rax, qword ptr [rcx]
14013b9d9: f20f1008 movsd xmm1, qword ptr [rax]
14013b9dd: 0f28057c14c905 movaps xmm0, xmmword ptr [rip + 0x5c9147c]
14013b9e4: 0f5cc1 subps xmm0, xmm1
14013b9e7: 0f5905f267ca05 mulps xmm0, xmmword ptr [rip + 0x5ca67f2]
14013b9ee: f30f105008 movss xmm2, dword ptr [rax + 8]
14013b9f3: 0f58c1 addps xmm0, xmm1
14013b9f6: f30f100da218c605 movss xmm1, dword ptr [rip + 0x5c618a2]
14013b9fe: 0f28f1 movaps xmm6, xmm1
14013ba01: f30f5cf2 subss xmm6, xmm2
14013ba05: f30f103de367ca05 movss xmm7, dword ptr [rip + 0x5ca67e3]
14013ba0d: f30f59f7 mulss xmm6, xmm7
14013ba11: f30f58f2 addss xmm6, xmm2
14013ba15: e941010000 jmp 0x14013bb5b
14013ba1a: 488b01 mov rax, qword ptr [rcx]
14013ba1d: f30f104808 movss xmm1, dword ptr [rax + 8]
14013ba22: f20f1010 movsd xmm2, qword ptr [rax]
14013ba26: 0f28053314c905 movaps xmm0, xmmword ptr [rip + 0x5c91433]
14013ba2d: 0f5cc2 subps xmm0, xmm2
14013ba30: 0f5905d967ca05 mulps xmm0, xmmword ptr [rip + 0x5ca67d9]
14013ba37: f30f10356118c605 movss xmm6, dword ptr [rip + 0x5c61861]
14013ba3f: f30f5cf1 subss xmm6, xmm1
14013ba43: f30f59353914c905 mulss xmm6, dword ptr [rip + 0x5c91439]
14013ba4b: 0f58c2 addps xmm0, xmm2
14013ba4e: f30f58f1 addss xmm6, xmm1
14013ba52: f30f100dc667ca05 movss xmm1, dword ptr [rip + 0x5ca67c6]
14013ba5a: 0f57ff xorps xmm7, xmm7
14013ba5d: e9f9000000 jmp 0x14013bb5b
14013ba62: 488b01 mov rax, qword ptr [rcx]
14013ba65: f30f104808 movss xmm1, dword ptr [rax + 8]
14013ba6a: f20f1010 movsd xmm2, qword ptr [rax]
14013ba6e: 0f2805eb13c905 movaps xmm0, xmmword ptr [rip + 0x5c913eb]
14013ba75: 0f5cc2 subps xmm0, xmm2
14013ba78: 0f59058167ca05 mulps xmm0, xmmword ptr [rip + 0x5ca6781]
14013ba7f: f30f10351918c605 movss xmm6, dword ptr [rip + 0x5c61819]
14013ba87: f30f5cf1 subss xmm6, xmm1
14013ba8b: f30f59356167ca05 mulss xmm6, dword ptr [rip + 0x5ca6761]
14013ba93: 0f58c2 addps xmm0, xmm2
14013ba96: f30f58f1 addss xmm6, xmm1
14013ba9a: f30f100d3a16c905 movss xmm1, dword ptr [rip + 0x5c9163a]
14013baa2: f30f103d8e73c905 movss xmm7, dword ptr [rip + 0x5c9738e]
14013baaa: e9ac000000 jmp 0x14013bb5b
14013baaf: 488b01 mov rax, qword ptr [rcx]
14013bab2: 4c8b4110 mov r8, qword ptr [rcx + 0x10]
14013bab6: f30f105008 movss xmm2, dword ptr [rax + 8]
14013babb: f20f1008 movsd xmm1, qword ptr [rax]
14013babf: 0f28059a13c905 movaps xmm0, xmmword ptr [rip + 0x5c9139a]
14013bac6: 0f5cc1 subps xmm0, xmm1
14013bac9: 0f59056067ca05 mulps xmm0, xmmword ptr [rip + 0x5ca6760]
14013bad0: 0f58c1 addps xmm0, xmm1
14013bad3: f30f100dc517c605 movss xmm1, dword ptr [rip + 0x5c617c5]
14013badb: 0f28f1 movaps xmm6, xmm1
14013bade: f30f5cf2 subss xmm6, xmm2
14013bae2: f30f59355273c905 mulss xmm6, dword ptr [rip + 0x5c97352]
14013baea: f30f58f2 addss xmm6, xmm2
14013baee: f3410f1038 movss xmm7, dword ptr [r8]
14013baf3: f30f593da917c605 mulss xmm7, dword ptr [rip + 0x5c617a9]
14013bafb: f30f583ded66ca05 addss xmm7, dword ptr [rip + 0x5ca66ed]
14013bb03: eb56 jmp 0x14013bb5b
14013bb05: 488b4108 mov rax, qword ptr [rcx + 8]
14013bb09: 80787c00 cmp byte ptr [rax + 0x7c], 0
14013bb0d: 0f8491020000 je 0x14013bda4
14013bb13: 488b01 mov rax, qword ptr [rcx]
14013bb16: f30f104808 movss xmm1, dword ptr [rax + 8]
14013bb1b: f20f1010 movsd xmm2, qword ptr [rax]
14013bb1f: 0f28053a13c905 movaps xmm0, xmmword ptr [rip + 0x5c9133a]
14013bb26: 0f5cc2 subps xmm0, xmm2
14013bb29: 0f5905b066ca05 mulps xmm0, xmmword ptr [rip + 0x5ca66b0]
14013bb30: f30f10356817c605 movss xmm6, dword ptr [rip + 0x5c61768]
14013bb38: f30f5cf1 subss xmm6, xmm1
14013bb3c: f30f5935ac66ca05 mulss xmm6, dword ptr [rip + 0x5ca66ac]
14013bb44: 0f58c2 addps xmm0, xmm2
14013bb47: f30f58f1 addss xmm6, xmm1
14013bb4b: f30f100d8915c905 movss xmm1, dword ptr [rip + 0x5c91589]
14013bb53: f30f103d9966ca05 movss xmm7, dword ptr [rip + 0x5ca6699]
14013bb5b: 488b4118 mov rax, qword ptr [rcx + 0x18]
14013bb5f: 4c8b4120 mov r8, qword ptr [rcx + 0x20]
14013bb63: f30f1010 movss xmm2, dword ptr [rax]
14013bb67: f30f12da movsldup xmm3, xmm2
14013bb6b: 0f59d8 mulps xmm3, xmm0
14013bb6e: 0f28c3 movaps xmm0, xmm3
14013bb71: 0f5d05e812c905 minps xmm0, xmmword ptr [rip + 0x5c912e8]
14013bb78: 440f28c0 movaps xmm8, xmm0
14013bb7c: 440fc2c003 cmpunordps xmm8, xmm0
14013bb81: 410f54d8 andps xmm3, xmm8
14013bb85: 440f55c0 andnps xmm8, xmm0
14013bb89: 440f56c3 orps xmm8, xmm3
14013bb8d: f30f59f2 mulss xmm6, xmm2
14013bb91: f30f5d350717c605 minss xmm6, dword ptr [rip + 0x5c61707]
14013bb99: f3410f1000 movss xmm0, dword ptr [r8]
14013bb9e: f30f59c8 mulss xmm1, xmm0
14013bba2: 488b4128 mov rax, qword ptr [rcx + 0x28]
14013bba6: f30f1010 movss xmm2, dword ptr [rax]
14013bbaa: f30f59ca mulss xmm1, xmm2
14013bbae: f30f59f8 mulss xmm7, xmm0
14013bbb2: f30f59fa mulss xmm7, xmm2
14013bbb6: c6456800 mov byte ptr [rbp + 0x68], 0
14013bbba: f30f114d6c movss dword ptr [rbp + 0x6c], xmm1
14013bbbf: c6457001 mov byte ptr [rbp + 0x70], 1
14013bbc3: f30f117d74 movss dword ptr [rbp + 0x74], xmm7
14013bbc8: 4c8b6930 mov r13, qword ptr [rcx + 0x30]
14013bbcc: 488b4138 mov rax, qword ptr [rcx + 0x38]
14013bbd0: 48894578 mov qword ptr [rbp + 0x78], rax
14013bbd4: 4c8b6140 mov r12, qword ptr [rcx + 0x40]
14013bbd8: 488d7d08 lea rdi, [rbp + 8]
14013bbdc: 488b5a08 mov rbx, qword ptr [rdx + 8]
14013bbe0: 4883c218 add rdx, 0x18
14013bbe4: 4c8bbd88000000 mov r15, qword ptr [rbp + 0x88]
14013bbeb: 49f7df neg r15
14013bbee: 31c0 xor eax, eax
14013bbf0: 450f57c9 xorps xmm9, xmm9
14013bbf4: 450f57d2 xorps xmm10, xmm10
14013bbf8: 48899580000000 mov qword ptr [rbp + 0x80], rdx
14013bbff: 90 nop
14013bc00: 488d7001 lea rsi, [rax + 1]
14013bc04: f3440f105cc56c movss xmm11, dword ptr [rbp + rax*8 + 0x6c]
14013bc0b: 450f2ecb ucomiss xmm9, xmm11
14013bc0f: 730f jae 0x14013bc20
14013bc11: 488d4d68 lea rcx, [rbp + 0x68]
14013bc15: 488d04c1 lea rax, [rcx + rax*8]
14013bc19: eb26 jmp 0x14013bc41
14013bc1b: 0f1f440000 nop dword ptr [rax + rax]
14013bc20: 4883fe02 cmp rsi, 2
14013bc24: 0f847a010000 je 0x14013bda4
14013bc2a: be02000000 mov esi, 2
14013bc2f: 440f2ecf ucomiss xmm9, xmm7
14013bc33: 488d4570 lea rax, [rbp + 0x70]
14013bc37: 440f28df movaps xmm11, xmm7
14013bc3b: 0f8363010000 jae 0x14013bda4
14013bc41: 0fb600 movzx eax, byte ptr [rax]
14013bc44: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
14013bc48: 488b09 mov rcx, qword ptr [rcx]
14013bc4b: 4d8b4d00 mov r9, qword ptr [r13]
14013bc4f: 4d8b4510 mov r8, qword ptr [r13 + 0x10]
14013bc53: 458b5110 mov r10d, dword ptr [r9 + 0x10]
14013bc57: 458b4d1c mov r9d, dword ptr [r13 + 0x1c]
14013bc5b: 458908 mov dword ptr [r8], r9d
14013bc5e: 4d8b7500 mov r14, qword ptr [r13]
14013bc62: 440f2955b0 movaps xmmword ptr [rbp - 0x50], xmm10
14013bc67: 48894dd0 mov qword ptr [rbp - 0x30], rcx
14013bc6b: 48c745d801000000 mov qword ptr [rbp - 0x28], 1
14013bc73: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
14013bc7b: 8b4a10 mov ecx, dword ptr [rdx + 0x10]
14013bc7e: 894f10 mov dword ptr [rdi + 0x10], ecx
14013bc81: 0f1002 movups xmm0, xmmword ptr [rdx]
14013bc84: 0f1107 movups xmmword ptr [rdi], xmm0
14013bc87: 418b4c2408 mov ecx, dword ptr [r12 + 8]
14013bc8c: 894f1c mov dword ptr [rdi + 0x1c], ecx
14013bc8f: 498b0c24 mov rcx, qword ptr [r12]
14013bc93: 48894f14 mov qword ptr [rdi + 0x14], rcx
14013bc97: 3401 xor al, 1
14013bc99: 48b900803bc700800000 movabs rcx, 0x8000c73b8000
14013bca3: 48894d28 mov qword ptr [rbp + 0x28], rcx
14013bca7: c7472b00000000 mov dword ptr [rdi + 0x2b], 0
14013bcae: c7472800000000 mov dword ptr [rdi + 0x28], 0
14013bcb5: 884537 mov byte ptr [rbp + 0x37], al
14013bcb8: 48c7453800000000 mov qword ptr [rbp + 0x38], 0
14013bcc0: 4c897540 mov qword ptr [rbp + 0x40], r14
14013bcc4: 44895548 mov dword ptr [rbp + 0x48], r10d
14013bcc8: 498b06 mov rax, qword ptr [r14]
14013bccb: 498b5610 mov rdx, qword ptr [r14 + 0x10]
14013bccf: 4829d0 sub rax, rdx
14013bcd2: 48398588000000 cmp qword ptr [rbp + 0x88], rax
14013bcd9: 0f8796000000 ja 0x14013bd75
14013bcdf: 488d04d2 lea rax, [rdx + rdx*8]
14013bce3: 48c1e002 shl rax, 2
14013bce7: 49034608 add rax, qword ptr [r14 + 8]
14013bceb: b920000000 mov ecx, 0x20
14013bcf0: 4531c0 xor r8d, r8d
14013bcf3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14013bd00: 4c8b4c0bec mov r9, qword ptr [rbx + rcx - 0x14]
14013bd05: f30f10040b movss xmm0, dword ptr [rbx + rcx]
14013bd0a: f3410f59c3 mulss xmm0, xmm11
14013bd0f: 448b540be8 mov r10d, dword ptr [rbx + rcx - 0x18]
14013bd14: 44895408e8 mov dword ptr [rax + rcx - 0x18], r10d
14013bd19: 4c8b540be0 mov r10, qword ptr [rbx + rcx - 0x20]
14013bd1e: 4c895408e0 mov qword ptr [rax + rcx - 0x20], r10
14013bd23: 4c894c08ec mov qword ptr [rax + rcx - 0x14], r9
14013bd28: 440f134408f4 movlps qword ptr [rax + rcx - 0xc], xmm8
14013bd2e: f30f117408fc movss dword ptr [rax + rcx - 4], xmm6
14013bd34: f30f110408 movss dword ptr [rax + rcx], xmm0
14013bd39: 49ffc8 dec r8
14013bd3c: 4883c124 add rcx, 0x24
14013bd40: 4d39c7 cmp r15, r8
14013bd43: 75bb jne 0x14013bd00
14013bd45: 4c29c2 sub rdx, r8
14013bd48: 49895610 mov qword ptr [r14 + 0x10], rdx
14013bd4c: c6859700000000 mov byte ptr [rbp + 0x97], 0
14013bd53: 488d4db0 lea rcx, [rbp - 0x50]
14013bd57: e814864801 call 0x1415c4370
14013bd5c: 90 nop
14013bd5d: b801000000 mov eax, 1
14013bd62: 4883fe02 cmp rsi, 2
14013bd66: 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
14013bd6d: 0f858dfeffff jne 0x14013bc00
14013bd73: eb2f jmp 0x14013bda4
14013bd75: c6859700000001 mov byte ptr [rbp + 0x97], 1
14013bd7c: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
14013bd85: 41b904000000 mov r9d, 4
14013bd8b: 4c89f1 mov rcx, r14
14013bd8e: 4c8b8588000000 mov r8, qword ptr [rbp + 0x88]
14013bd95: e8d6ebab05 call 0x145bfa970
14013bd9a: 90 nop
14013bd9b: 498b5610 mov rdx, qword ptr [r14 + 0x10]
14013bd9f: e93bffffff jmp 0x14013bcdf
14013bda4: 0f28b5a0000000 movaps xmm6, xmmword ptr [rbp + 0xa0]
14013bdab: 0f28bdb0000000 movaps xmm7, xmmword ptr [rbp + 0xb0]
14013bdb2: 440f2885c0000000 movaps xmm8, xmmword ptr [rbp + 0xc0]
14013bdba: 440f288dd0000000 movaps xmm9, xmmword ptr [rbp + 0xd0]
14013bdc2: 440f2895e0000000 movaps xmm10, xmmword ptr [rbp + 0xe0]
14013bdca: 440f289df0000000 movaps xmm11, xmmword ptr [rbp + 0xf0]
14013bdd2: 4881c488010000 add rsp, 0x188
14013bdd9: 5b pop rbx
14013bdda: 5f pop rdi
14013bddb: 5e pop rsi
14013bddc: 415c pop r12
14013bdde: 415d pop r13
14013bde0: 415e pop r14
14013bde2: 415f pop r15
14013bde4: 5d pop rbp
14013bde5: c3 ret
