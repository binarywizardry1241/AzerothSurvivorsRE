1400ec580: 55 push rbp
1400ec581: 4157 push r15
1400ec583: 4156 push r14
1400ec585: 4155 push r13
1400ec587: 4154 push r12
1400ec589: 56 push rsi
1400ec58a: 57 push rdi
1400ec58b: 53 push rbx
1400ec58c: 4881eca8010000 sub rsp, 0x1a8
1400ec593: 488dac2480000000 lea rbp, [rsp + 0x80]
1400ec59b: 440f29bd10010000 movaps xmmword ptr [rbp + 0x110], xmm15
1400ec5a3: 440f29b500010000 movaps xmmword ptr [rbp + 0x100], xmm14
1400ec5ab: 440f29adf0000000 movaps xmmword ptr [rbp + 0xf0], xmm13
1400ec5b3: 440f29a5e0000000 movaps xmmword ptr [rbp + 0xe0], xmm12
1400ec5bb: 440f299dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm11
1400ec5c3: 440f2995c0000000 movaps xmmword ptr [rbp + 0xc0], xmm10
1400ec5cb: 440f298db0000000 movaps xmmword ptr [rbp + 0xb0], xmm9
1400ec5d3: 440f2985a0000000 movaps xmmword ptr [rbp + 0xa0], xmm8
1400ec5db: 0f29bd90000000 movaps xmmword ptr [rbp + 0x90], xmm7
1400ec5e2: 0f29b580000000 movaps xmmword ptr [rbp + 0x80], xmm6
1400ec5e9: 48c74578feffffff mov qword ptr [rbp + 0x78], 0xfffffffffffffffe
1400ec5f1: 44884d76 mov byte ptr [rbp + 0x76], r9b
1400ec5f5: 44884577 mov byte ptr [rbp + 0x77], r8b
1400ec5f9: 4989d6 mov r14, rdx
1400ec5fc: 4889ce mov rsi, rcx
1400ec5ff: f3440f10bdb0010000 movss xmm15, dword ptr [rbp + 0x1b0]
1400ec608: f30f10bd98010000 movss xmm7, dword ptr [rbp + 0x198]
1400ec610: 488bbd90010000 mov rdi, qword ptr [rbp + 0x190]
1400ec617: f30f1085a8010000 movss xmm0, dword ptr [rbp + 0x1a8]
1400ec61f: 48c7450800000000 mov qword ptr [rbp + 8], 0
1400ec627: 48c7451004000000 mov qword ptr [rbp + 0x10], 4
1400ec62f: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
1400ec637: f30f5c85a0010000 subss xmm0, dword ptr [rbp + 0x1a0]
1400ec63f: 0f28354ab4ca05 movaps xmm6, xmmword ptr [rip + 0x5cab44a]
1400ec646: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
1400ec64a: 0f54f0 andps xmm6, xmm0
1400ec64d: 0f28cf movaps xmm1, xmm7
1400ec650: f30f5f0d4441ce05 maxss xmm1, dword ptr [rip + 0x5ce4144]
1400ec658: f30f10057441ce05 movss xmm0, dword ptr [rip + 0x5ce4174]
1400ec660: f30f5ec1 divss xmm0, xmm1
1400ec664: f30f5805a4afca05 addss xmm0, dword ptr [rip + 0x5caafa4]
1400ec66c: e82a63b005 call 0x145bf299b
1400ec671: f30f58c0 addss xmm0, xmm0
1400ec675: f30f5d055b41ce05 minss xmm0, dword ptr [rip + 0x5ce415b]
1400ec67d: f30f5ef0 divss xmm6, xmm0
1400ec681: 0f28c6 movaps xmm0, xmm6
1400ec684: e81863b005 call 0x145bf29a1
1400ec689: f3480f2cc0 cvttss2si rax, xmm0
1400ec68e: 4889c1 mov rcx, rax
1400ec691: 48c1f93f sar rcx, 0x3f
1400ec695: 0f28c8 movaps xmm1, xmm0
1400ec698: f30f5c0db0b2ca05 subss xmm1, dword ptr [rip + 0x5cab2b0]
1400ec6a0: f3480f2cd1 cvttss2si rdx, xmm1
1400ec6a5: 4821ca and rdx, rcx
1400ec6a8: 4809c2 or rdx, rax
1400ec6ab: 4531ed xor r13d, r13d
1400ec6ae: 0f57c9 xorps xmm1, xmm1
1400ec6b1: 0f2ec1 ucomiss xmm0, xmm1
1400ec6b4: 490f42d5 cmovb rdx, r13
1400ec6b8: 0f2e0595b2ca05 ucomiss xmm0, dword ptr [rip + 0x5cab295]
1400ec6bf: 48c7c0ffffffff mov rax, 0xffffffffffffffff
1400ec6c6: 480f46c2 cmovbe rax, rdx
1400ec6ca: 4883f804 cmp rax, 4
1400ec6ce: b903000000 mov ecx, 3
1400ec6d3: 480f43c8 cmovae rcx, rax
1400ec6d7: 4881f9a0000000 cmp rcx, 0xa0
1400ec6de: bba0000000 mov ebx, 0xa0
1400ec6e3: 480f42d9 cmovb rbx, rcx
1400ec6e7: 0f57c0 xorps xmm0, xmm0
1400ec6ea: f3480f2ac3 cvtsi2ss xmm0, rbx
1400ec6ef: f30f114564 movss dword ptr [rbp + 0x64], xmm0
1400ec6f4: f30f1007 movss xmm0, dword ptr [rdi]
1400ec6f8: f30f114570 movss dword ptr [rbp + 0x70], xmm0
1400ec6fd: f30f104704 movss xmm0, dword ptr [rdi + 4]
1400ec702: f30f11456c movss dword ptr [rbp + 0x6c], xmm0
1400ec707: f30f104708 movss xmm0, dword ptr [rdi + 8]
1400ec70c: f30f114568 movss dword ptr [rbp + 0x68], xmm0
1400ec711: 0f2805b85dcb05 movaps xmm0, xmmword ptr [rip + 0x5cb5db8]
1400ec718: 440f57f8 xorps xmm15, xmm0
1400ec71c: 440f297dd0 movaps xmmword ptr [rbp - 0x30], xmm15
1400ec721: f30f100dfb98cb05 movss xmm1, dword ptr [rip + 0x5cb98fb]
1400ec729: f30f59cf mulss xmm1, xmm7
1400ec72d: f30f580d03b1ca05 addss xmm1, dword ptr [rip + 0x5cab103]
1400ec735: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
1400ec739: 0f57c8 xorps xmm1, xmm0
1400ec73c: 0f294df0 movaps xmmword ptr [rbp - 0x10], xmm1
1400ec740: 488d7d4c lea rdi, [rbp + 0x4c]
1400ec744: 4c8d7d08 lea r15, [rbp + 8]
1400ec748: 4c8d6520 lea r12, [rbp + 0x20]
1400ec74c: 0f1f4000 nop dword ptr [rax]
1400ec750: 4939dd cmp r13, rbx
1400ec753: 0f832e020000 jae 0x1400ec987
1400ec759: 0f57ff xorps xmm7, xmm7
1400ec75c: f3490f2afd cvtsi2ss xmm7, r13
1400ec761: 49ffc5 inc r13
1400ec764: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
1400ec768: f30f59f9 mulss xmm7, xmm1
1400ec76c: f30f105564 movss xmm2, dword ptr [rbp + 0x64]
1400ec771: f30f5efa divss xmm7, xmm2
1400ec775: 450f57c0 xorps xmm8, xmm8
1400ec779: f34d0f2ac5 cvtsi2ss xmm8, r13
1400ec77e: f30f1085a0010000 movss xmm0, dword ptr [rbp + 0x1a0]
1400ec786: f30f58f8 addss xmm7, xmm0
1400ec78a: f3440f59c1 mulss xmm8, xmm1
1400ec78f: f3440f5ec2 divss xmm8, xmm2
1400ec794: f3440f58c0 addss xmm8, xmm0
1400ec799: 0f28c7 movaps xmm0, xmm7
1400ec79c: e8dc61b005 call 0x145bf297d
1400ec7a1: 440f28c8 movaps xmm9, xmm0
1400ec7a5: f3440f109d98010000 movss xmm11, dword ptr [rbp + 0x198]
1400ec7ae: f3450f59cb mulss xmm9, xmm11
1400ec7b3: f3440f106d70 movss xmm13, dword ptr [rbp + 0x70]
1400ec7b9: f3450f58cd addss xmm9, xmm13
1400ec7be: 0f28c7 movaps xmm0, xmm7
1400ec7c1: e8b161b005 call 0x145bf2977
1400ec7c6: 440f28d0 movaps xmm10, xmm0
1400ec7ca: f3450f59d3 mulss xmm10, xmm11
1400ec7cf: f30f10756c movss xmm6, dword ptr [rbp + 0x6c]
1400ec7d4: f3440f58d6 addss xmm10, xmm6
1400ec7d9: 410f28c0 movaps xmm0, xmm8
1400ec7dd: e89b61b005 call 0x145bf297d
1400ec7e2: 440f28e0 movaps xmm12, xmm0
1400ec7e6: f3450f59e3 mulss xmm12, xmm11
1400ec7eb: f3450f58e5 addss xmm12, xmm13
1400ec7f0: 410f28c0 movaps xmm0, xmm8
1400ec7f4: e87e61b005 call 0x145bf2977
1400ec7f9: 440f28e8 movaps xmm13, xmm0
1400ec7fd: f3450f59eb mulss xmm13, xmm11
1400ec802: f3440f58ee addss xmm13, xmm6
1400ec807: f3450f5ce1 subss xmm12, xmm9
1400ec80c: f3450f5cea subss xmm13, xmm10
1400ec811: 410f28c4 movaps xmm0, xmm12
1400ec815: 410f28cd movaps xmm1, xmm13
1400ec819: e87761b005 call 0x145bf2995
1400ec81e: 440f28d8 movaps xmm11, xmm0
1400ec822: 410f28c5 movaps xmm0, xmm13
1400ec826: 410f28cc movaps xmm1, xmm12
1400ec82a: e85461b005 call 0x145bf2983
1400ec82f: 440f28e0 movaps xmm12, xmm0
1400ec833: f3440f10bdb0010000 movss xmm15, dword ptr [rbp + 0x1b0]
1400ec83c: f3450f58df addss xmm11, xmm15
1400ec841: f3440f5825923fce05 addss xmm12, dword ptr [rip + 0x5ce3f92]
1400ec84a: 440f28357e5ccb05 movaps xmm14, xmmword ptr [rip + 0x5cb5c7e]
1400ec852: 450f57d6 xorps xmm10, xmm14
1400ec856: 450f57ce xorps xmm9, xmm14
1400ec85a: 410f28c4 movaps xmm0, xmm12
1400ec85e: e81461b005 call 0x145bf2977
1400ec863: 440f28e8 movaps xmm13, xmm0
1400ec867: 410f28c4 movaps xmm0, xmm12
1400ec86b: e80d61b005 call 0x145bf297d
1400ec870: f3440f115520 movss dword ptr [rbp + 0x20], xmm10
1400ec876: f30f104d68 movss xmm1, dword ptr [rbp + 0x68]
1400ec87b: f30f114d24 movss dword ptr [rbp + 0x24], xmm1
1400ec880: f3440f114d28 movss dword ptr [rbp + 0x28], xmm9
1400ec886: f3440f116d2c movss dword ptr [rbp + 0x2c], xmm13
1400ec88c: f30f114530 movss dword ptr [rbp + 0x30], xmm0
1400ec891: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1400ec895: f30f114534 movss dword ptr [rbp + 0x34], xmm0
1400ec89a: f3440f115d38 movss dword ptr [rbp + 0x38], xmm11
1400ec8a0: f30f11453c movss dword ptr [rbp + 0x3c], xmm0
1400ec8a5: f3440f117d40 movss dword ptr [rbp + 0x40], xmm15
1400ec8ab: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
1400ec8af: f30f114544 movss dword ptr [rbp + 0x44], xmm0
1400ec8b4: 0f2845e0 movaps xmm0, xmmword ptr [rbp - 0x20]
1400ec8b8: f30f114548 movss dword ptr [rbp + 0x48], xmm0
1400ec8bd: 0f28c7 movaps xmm0, xmm7
1400ec8c0: f3410f5dc0 minss xmm0, xmm8
1400ec8c5: 440f28c8 movaps xmm9, xmm0
1400ec8c9: f3440fc2c803 cmpunordss xmm9, xmm0
1400ec8cf: 410f28c9 movaps xmm1, xmm9
1400ec8d3: 0f55c8 andnps xmm1, xmm0
1400ec8d6: 440f54cf andps xmm9, xmm7
1400ec8da: 440f56c9 orps xmm9, xmm1
1400ec8de: 0f28c7 movaps xmm0, xmm7
1400ec8e1: f3410f5fc0 maxss xmm0, xmm8
1400ec8e6: 440f28c0 movaps xmm8, xmm0
1400ec8ea: f3440fc2c003 cmpunordss xmm8, xmm0
1400ec8f0: 410f28c8 movaps xmm1, xmm8
1400ec8f4: 0f55c8 andnps xmm1, xmm0
1400ec8f7: 440f54c7 andps xmm8, xmm7
1400ec8fb: 440f56c1 orps xmm8, xmm1
1400ec8ff: 410f28c1 movaps xmm0, xmm9
1400ec903: e87560b005 call 0x145bf297d
1400ec908: 0f28f8 movaps xmm7, xmm0
1400ec90b: 410f28c1 movaps xmm0, xmm9
1400ec90f: e86360b005 call 0x145bf2977
1400ec914: 440f28c8 movaps xmm9, xmm0
1400ec918: 450f57ce xorps xmm9, xmm14
1400ec91c: 410f28c0 movaps xmm0, xmm8
1400ec920: e85860b005 call 0x145bf297d
1400ec925: 440f28d0 movaps xmm10, xmm0
1400ec929: 410f28c0 movaps xmm0, xmm8
1400ec92d: e84560b005 call 0x145bf2977
1400ec932: 450f57d6 xorps xmm10, xmm14
1400ec936: f3440f114d4c movss dword ptr [rbp + 0x4c], xmm9
1400ec93c: f30f117d50 movss dword ptr [rbp + 0x50], xmm7
1400ec941: c7455400000000 mov dword ptr [rbp + 0x54], 0
1400ec948: f30f114558 movss dword ptr [rbp + 0x58], xmm0
1400ec94d: f3440f11555c movss dword ptr [rbp + 0x5c], xmm10
1400ec953: c7456000000000 mov dword ptr [rbp + 0x60], 0
1400ec95a: 48897c2428 mov qword ptr [rsp + 0x28], rdi
1400ec95f: f30f11742420 movss dword ptr [rsp + 0x20], xmm6
1400ec965: 48c744243002000000 mov qword ptr [rsp + 0x30], 2
1400ec96e: 4c89f1 mov rcx, r14
1400ec971: 4c89fa mov rdx, r15
1400ec974: 4d89e0 mov r8, r12
1400ec977: 660f6e5d70 movd xmm3, dword ptr [rbp + 0x70]
1400ec97c: e84f200000 call 0x1400ee9d0
1400ec981: 90 nop
1400ec982: e9c9fdffff jmp 0x1400ec750
1400ec987: 498b7e20 mov rdi, qword ptr [r14 + 0x20]
1400ec98b: 0fb65d76 movzx ebx, byte ptr [rbp + 0x76]
1400ec98f: 885d4c mov byte ptr [rbp + 0x4c], bl
1400ec992: 48837f1800 cmp qword ptr [rdi + 0x18], 0
1400ec997: 0f84d3000000 je 0x1400eca70
1400ec99d: 488d4f20 lea rcx, [rdi + 0x20]
1400ec9a1: 488d554c lea rdx, [rbp + 0x4c]
1400ec9a5: e816adf2ff call 0x1400176c0
1400ec9aa: 4989c0 mov r8, rax
1400ec9ad: 49c1e839 shr r8, 0x39
1400ec9b1: 488b0f mov rcx, qword ptr [rdi]
1400ec9b4: 488b5708 mov rdx, qword ptr [rdi + 8]
1400ec9b8: 66410f6ec0 movd xmm0, r8d
1400ec9bd: 660f60c0 punpcklbw xmm0, xmm0
1400ec9c1: f20f70c000 pshuflw xmm0, xmm0, 0
1400ec9c6: 660f70c044 pshufd xmm0, xmm0, 0x44
1400ec9cb: 4531c0 xor r8d, r8d
1400ec9ce: 660f76c9 pcmpeqd xmm1, xmm1
1400ec9d2: 4821d0 and rax, rdx
1400ec9d5: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
1400ec9da: 660f6fda movdqa xmm3, xmm2
1400ec9de: 660f74d8 pcmpeqb xmm3, xmm0
1400ec9e2: 66440fd7cb pmovmskb r9d, xmm3
1400ec9e7: 4585c9 test r9d, r9d
1400ec9ea: 7434 je 0x1400eca20
1400ec9ec: f3450fbcd9 tzcnt r11d, r9d
1400ec9f1: 4901c3 add r11, rax
1400ec9f4: 4921d3 and r11, rdx
1400ec9f7: 49c1e305 shl r11, 5
1400ec9fb: 4989ca mov r10, rcx
1400ec9fe: 4d29da sub r10, r11
1400eca01: 413a5ae0 cmp bl, byte ptr [r10 - 0x20]
1400eca05: 7434 je 0x1400eca3b
1400eca07: 458d51ff lea r10d, [r9 - 1]
1400eca0b: 664521ca and r10w, r9w
1400eca0f: 4589d1 mov r9d, r10d
1400eca12: 75d8 jne 0x1400ec9ec
1400eca14: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400eca20: 660f74d1 pcmpeqb xmm2, xmm1
1400eca24: 66440fd7ca pmovmskb r9d, xmm2
1400eca29: 4585c9 test r9d, r9d
1400eca2c: 7542 jne 0x1400eca70
1400eca2e: 4c01c0 add rax, r8
1400eca31: 4883c010 add rax, 0x10
1400eca35: 4983c010 add r8, 0x10
1400eca39: eb97 jmp 0x1400ec9d2
1400eca3b: 41807ae800 cmp byte ptr [r10 - 0x18], 0
1400eca40: 7449 je 0x1400eca8b
1400eca42: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
1400eca47: 884522 mov byte ptr [rbp + 0x22], al
1400eca4a: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
1400eca4f: 66894520 mov word ptr [rbp + 0x20], ax
1400eca53: 498d52ec lea rdx, [r10 - 0x14]
1400eca57: 498d4af0 lea rcx, [r10 - 0x10]
1400eca5b: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
1400eca5f: 410fb642f8 movzx eax, byte ptr [r10 - 8]
1400eca64: 48c1e020 shl rax, 0x20
1400eca68: 4c09c0 or rax, r8
1400eca6b: 41b001 mov r8b, 1
1400eca6e: eb2a jmp 0x1400eca9a
1400eca70: 488d0da44bce05 lea rcx, [rip + 0x5ce4ba4]
1400eca77: 4c8d05ba4bce05 lea r8, [rip + 0x5ce4bba]
1400eca7e: ba16000000 mov edx, 0x16
1400eca83: e8286dca05 call 0x145d937b0
1400eca88: 90 nop
1400eca89: 0f0b ud2
1400eca8b: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
1400eca8f: 488d5168 lea rdx, [rcx + 0x68]
1400eca93: 4883c16c add rcx, 0x6c
1400eca97: 4531c0 xor r8d, r8d
1400eca9a: 8b12 mov edx, dword ptr [rdx]
1400eca9c: 8b09 mov ecx, dword ptr [rcx]
1400eca9e: 4c8b4d18 mov r9, qword ptr [rbp + 0x18]
1400ecaa2: 4c894e10 mov qword ptr [rsi + 0x10], r9
1400ecaa6: 0f104508 movups xmm0, xmmword ptr [rbp + 8]
1400ecaaa: 0f1106 movups xmmword ptr [rsi], xmm0
1400ecaad: 440fb64d77 movzx r9d, byte ptr [rbp + 0x77]
1400ecab2: 44884e2c mov byte ptr [rsi + 0x2c], r9b
1400ecab6: 44884618 mov byte ptr [rsi + 0x18], r8b
1400ecaba: 440fb74520 movzx r8d, word ptr [rbp + 0x20]
1400ecabf: 6644894619 mov word ptr [rsi + 0x19], r8w
1400ecac4: 440fb64522 movzx r8d, byte ptr [rbp + 0x22]
1400ecac9: 4488461b mov byte ptr [rsi + 0x1b], r8b
1400ecacd: 89561c mov dword ptr [rsi + 0x1c], edx
1400ecad0: 894e20 mov dword ptr [rsi + 0x20], ecx
1400ecad3: 48894624 mov qword ptr [rsi + 0x24], rax
1400ecad7: 0f28b580000000 movaps xmm6, xmmword ptr [rbp + 0x80]
1400ecade: 0f28bd90000000 movaps xmm7, xmmword ptr [rbp + 0x90]
1400ecae5: 440f2885a0000000 movaps xmm8, xmmword ptr [rbp + 0xa0]
1400ecaed: 440f288db0000000 movaps xmm9, xmmword ptr [rbp + 0xb0]
1400ecaf5: 440f2895c0000000 movaps xmm10, xmmword ptr [rbp + 0xc0]
1400ecafd: 440f289dd0000000 movaps xmm11, xmmword ptr [rbp + 0xd0]
1400ecb05: 440f28a5e0000000 movaps xmm12, xmmword ptr [rbp + 0xe0]
1400ecb0d: 440f28adf0000000 movaps xmm13, xmmword ptr [rbp + 0xf0]
1400ecb15: 440f28b500010000 movaps xmm14, xmmword ptr [rbp + 0x100]
1400ecb1d: 440f28bd10010000 movaps xmm15, xmmword ptr [rbp + 0x110]
1400ecb25: 4881c4a8010000 add rsp, 0x1a8
1400ecb2c: 5b pop rbx
1400ecb2d: 5f pop rdi
1400ecb2e: 5e pop rsi
1400ecb2f: 415c pop r12
1400ecb31: 415d pop r13
1400ecb33: 415e pop r14
1400ecb35: 415f pop r15
1400ecb37: 5d pop rbp
1400ecb38: c3 ret
