14013d890: 55 push rbp
14013d891: 4157 push r15
14013d893: 4156 push r14
14013d895: 4155 push r13
14013d897: 4154 push r12
14013d899: 56 push rsi
14013d89a: 57 push rdi
14013d89b: 53 push rbx
14013d89c: 4881eca8010000 sub rsp, 0x1a8
14013d8a3: 488dac2480000000 lea rbp, [rsp + 0x80]
14013d8ab: 440f29bd10010000 movaps xmmword ptr [rbp + 0x110], xmm15
14013d8b3: 440f29b500010000 movaps xmmword ptr [rbp + 0x100], xmm14
14013d8bb: 440f29adf0000000 movaps xmmword ptr [rbp + 0xf0], xmm13
14013d8c3: 440f29a5e0000000 movaps xmmword ptr [rbp + 0xe0], xmm12
14013d8cb: 440f299dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm11
14013d8d3: 440f2995c0000000 movaps xmmword ptr [rbp + 0xc0], xmm10
14013d8db: 440f298db0000000 movaps xmmword ptr [rbp + 0xb0], xmm9
14013d8e3: 440f2985a0000000 movaps xmmword ptr [rbp + 0xa0], xmm8
14013d8eb: 0f29bd90000000 movaps xmmword ptr [rbp + 0x90], xmm7
14013d8f2: 0f29b580000000 movaps xmmword ptr [rbp + 0x80], xmm6
14013d8f9: 48c74578feffffff mov qword ptr [rbp + 0x78], 0xfffffffffffffffe
14013d901: 44884d76 mov byte ptr [rbp + 0x76], r9b
14013d905: 44884577 mov byte ptr [rbp + 0x77], r8b
14013d909: 4989d6 mov r14, rdx
14013d90c: 4889ce mov rsi, rcx
14013d90f: f3440f10bdb0010000 movss xmm15, dword ptr [rbp + 0x1b0]
14013d918: f30f10bd98010000 movss xmm7, dword ptr [rbp + 0x198]
14013d920: 488bbd90010000 mov rdi, qword ptr [rbp + 0x190]
14013d927: f30f1085a8010000 movss xmm0, dword ptr [rbp + 0x1a8]
14013d92f: 48c7450800000000 mov qword ptr [rbp + 8], 0
14013d937: 48c7451004000000 mov qword ptr [rbp + 0x10], 4
14013d93f: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
14013d947: f30f5c85a0010000 subss xmm0, dword ptr [rbp + 0x1a0]
14013d94f: 0f2835dafdc505 movaps xmm6, xmmword ptr [rip + 0x5c5fdda]
14013d956: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
14013d95a: 0f54f0 andps xmm6, xmm0
14013d95d: 0f28cf movaps xmm1, xmm7
14013d960: f30f5f0d0849ca05 maxss xmm1, dword ptr [rip + 0x5ca4908]
14013d968: f30f10054049ca05 movss xmm0, dword ptr [rip + 0x5ca4940]
14013d970: f30f5ec1 divss xmm0, xmm1
14013d974: f30f580524f9c505 addss xmm0, dword ptr [rip + 0x5c5f924]
14013d97c: e8bac7ab05 call 0x145bfa13b
14013d981: f30f58c0 addss xmm0, xmm0
14013d985: f30f5d052749ca05 minss xmm0, dword ptr [rip + 0x5ca4927]
14013d98d: f30f5ef0 divss xmm6, xmm0
14013d991: 0f28c6 movaps xmm0, xmm6
14013d994: e8a8c7ab05 call 0x145bfa141
14013d999: f3480f2cc0 cvttss2si rax, xmm0
14013d99e: 4889c1 mov rcx, rax
14013d9a1: 48c1f93f sar rcx, 0x3f
14013d9a5: 0f28c8 movaps xmm1, xmm0
14013d9a8: f30f5c0d30fcc505 subss xmm1, dword ptr [rip + 0x5c5fc30]
14013d9b0: f3480f2cd1 cvttss2si rdx, xmm1
14013d9b5: 4821ca and rdx, rcx
14013d9b8: 4809c2 or rdx, rax
14013d9bb: 4531ed xor r13d, r13d
14013d9be: 0f57c9 xorps xmm1, xmm1
14013d9c1: 0f2ec1 ucomiss xmm0, xmm1
14013d9c4: 490f42d5 cmovb rdx, r13
14013d9c8: 0f2e0515fcc505 ucomiss xmm0, dword ptr [rip + 0x5c5fc15]
14013d9cf: 48c7c0ffffffff mov rax, 0xffffffffffffffff
14013d9d6: 480f46c2 cmovbe rax, rdx
14013d9da: 4883f804 cmp rax, 4
14013d9de: b903000000 mov ecx, 3
14013d9e3: 480f43c8 cmovae rcx, rax
14013d9e7: 4881f9a0000000 cmp rcx, 0xa0
14013d9ee: bba0000000 mov ebx, 0xa0
14013d9f3: 480f42d9 cmovb rbx, rcx
14013d9f7: 0f57c0 xorps xmm0, xmm0
14013d9fa: f3480f2ac3 cvtsi2ss xmm0, rbx
14013d9ff: f30f114568 movss dword ptr [rbp + 0x68], xmm0
14013da04: f30f1037 movss xmm6, dword ptr [rdi]
14013da08: f3440f107704 movss xmm14, dword ptr [rdi + 4]
14013da0e: f30f104708 movss xmm0, dword ptr [rdi + 8]
14013da13: f30f11456c movss dword ptr [rbp + 0x6c], xmm0
14013da18: 0f280581f6c805 movaps xmm0, xmmword ptr [rip + 0x5c8f681]
14013da1f: 440f57f8 xorps xmm15, xmm0
14013da23: 440f297dd0 movaps xmmword ptr [rbp - 0x30], xmm15
14013da28: f30f100d54f4c805 movss xmm1, dword ptr [rip + 0x5c8f454]
14013da30: f30f59cf mulss xmm1, xmm7
14013da34: f30f580d8cfac505 addss xmm1, dword ptr [rip + 0x5c5fa8c]
14013da3c: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
14013da40: 0f57c8 xorps xmm1, xmm0
14013da43: 0f294df0 movaps xmmword ptr [rbp - 0x10], xmm1
14013da47: 4c8d7d24 lea r15, [rbp + 0x24]
14013da4b: 488d7d50 lea rdi, [rbp + 0x50]
14013da4f: 4c8d6508 lea r12, [rbp + 8]
14013da53: f30f117570 movss dword ptr [rbp + 0x70], xmm6
14013da58: 0f1f840000000000 nop dword ptr [rax + rax]
14013da60: 4939dd cmp r13, rbx
14013da63: 0f834c020000 jae 0x14013dcb5
14013da69: 0f57ff xorps xmm7, xmm7
14013da6c: f3490f2afd cvtsi2ss xmm7, r13
14013da71: 49ffc5 inc r13
14013da74: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
14013da78: f30f59f9 mulss xmm7, xmm1
14013da7c: f30f105568 movss xmm2, dword ptr [rbp + 0x68]
14013da81: f30f5efa divss xmm7, xmm2
14013da85: 450f57c0 xorps xmm8, xmm8
14013da89: f34d0f2ac5 cvtsi2ss xmm8, r13
14013da8e: f30f1085a0010000 movss xmm0, dword ptr [rbp + 0x1a0]
14013da96: f30f58f8 addss xmm7, xmm0
14013da9a: f3440f59c1 mulss xmm8, xmm1
14013da9f: f3440f5ec2 divss xmm8, xmm2
14013daa4: f3440f58c0 addss xmm8, xmm0
14013daa9: 0f28c7 movaps xmm0, xmm7
14013daac: e86cc6ab05 call 0x145bfa11d
14013dab1: 440f28c8 movaps xmm9, xmm0
14013dab5: f3440f109d98010000 movss xmm11, dword ptr [rbp + 0x198]
14013dabe: f3450f59cb mulss xmm9, xmm11
14013dac3: f3440f58ce addss xmm9, xmm6
14013dac8: 0f28c7 movaps xmm0, xmm7
14013dacb: e847c6ab05 call 0x145bfa117
14013dad0: 440f28d0 movaps xmm10, xmm0
14013dad4: f3450f59d3 mulss xmm10, xmm11
14013dad9: f3450f58d6 addss xmm10, xmm14
14013dade: 410f28c0 movaps xmm0, xmm8
14013dae2: e836c6ab05 call 0x145bfa11d
14013dae7: 440f28e0 movaps xmm12, xmm0
14013daeb: f3450f59e3 mulss xmm12, xmm11
14013daf0: f3440f58e6 addss xmm12, xmm6
14013daf5: 410f28c0 movaps xmm0, xmm8
14013daf9: e819c6ab05 call 0x145bfa117
14013dafe: 440f28e8 movaps xmm13, xmm0
14013db02: f3450f59eb mulss xmm13, xmm11
14013db07: f3450f58ee addss xmm13, xmm14
14013db0c: f3450f5ce1 subss xmm12, xmm9
14013db11: f3450f5cea subss xmm13, xmm10
14013db16: 410f28c4 movaps xmm0, xmm12
14013db1a: 410f28cd movaps xmm1, xmm13
14013db1e: e80cc6ab05 call 0x145bfa12f
14013db23: 440f28d8 movaps xmm11, xmm0
14013db27: 410f28c5 movaps xmm0, xmm13
14013db2b: 410f28cc movaps xmm1, xmm12
14013db2f: e8efc5ab05 call 0x145bfa123
14013db34: 440f28e0 movaps xmm12, xmm0
14013db38: f3440f10bdb0010000 movss xmm15, dword ptr [rbp + 0x1b0]
14013db41: f3450f58df addss xmm11, xmm15
14013db46: f3440f58256947ca05 addss xmm12, dword ptr [rip + 0x5ca4769]
14013db4f: 410f28f6 movaps xmm6, xmm14
14013db53: 440f283545f5c805 movaps xmm14, xmmword ptr [rip + 0x5c8f545]
14013db5b: 450f57d6 xorps xmm10, xmm14
14013db5f: 450f57ce xorps xmm9, xmm14
14013db63: 410f28c4 movaps xmm0, xmm12
14013db67: e8abc5ab05 call 0x145bfa117
14013db6c: 440f28e8 movaps xmm13, xmm0
14013db70: 410f28c4 movaps xmm0, xmm12
14013db74: e8a4c5ab05 call 0x145bfa11d
14013db79: f3440f115524 movss dword ptr [rbp + 0x24], xmm10
14013db7f: f30f104d6c movss xmm1, dword ptr [rbp + 0x6c]
14013db84: f30f114d28 movss dword ptr [rbp + 0x28], xmm1
14013db89: f3440f114d2c movss dword ptr [rbp + 0x2c], xmm9
14013db8f: f3440f116d30 movss dword ptr [rbp + 0x30], xmm13
14013db95: f30f114534 movss dword ptr [rbp + 0x34], xmm0
14013db9a: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
14013db9e: f30f114538 movss dword ptr [rbp + 0x38], xmm0
14013dba3: f3440f115d3c movss dword ptr [rbp + 0x3c], xmm11
14013dba9: f30f114540 movss dword ptr [rbp + 0x40], xmm0
14013dbae: f3440f117d44 movss dword ptr [rbp + 0x44], xmm15
14013dbb4: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
14013dbb8: f30f114548 movss dword ptr [rbp + 0x48], xmm0
14013dbbd: 0f2845e0 movaps xmm0, xmmword ptr [rbp - 0x20]
14013dbc1: f30f11454c movss dword ptr [rbp + 0x4c], xmm0
14013dbc6: 0f28c7 movaps xmm0, xmm7
14013dbc9: f3410f5dc0 minss xmm0, xmm8
14013dbce: 440f28c8 movaps xmm9, xmm0
14013dbd2: f3440fc2c803 cmpunordss xmm9, xmm0
14013dbd8: 410f28c9 movaps xmm1, xmm9
14013dbdc: 0f55c8 andnps xmm1, xmm0
14013dbdf: 440f54cf andps xmm9, xmm7
14013dbe3: 440f56c9 orps xmm9, xmm1
14013dbe7: 0f28c7 movaps xmm0, xmm7
14013dbea: f3410f5fc0 maxss xmm0, xmm8
14013dbef: 440f28c0 movaps xmm8, xmm0
14013dbf3: f3440fc2c003 cmpunordss xmm8, xmm0
14013dbf9: 410f28c8 movaps xmm1, xmm8
14013dbfd: 0f55c8 andnps xmm1, xmm0
14013dc00: 440f54c7 andps xmm8, xmm7
14013dc04: 440f56c1 orps xmm8, xmm1
14013dc08: 410f28c1 movaps xmm0, xmm9
14013dc0c: e80cc5ab05 call 0x145bfa11d
14013dc11: 0f28f8 movaps xmm7, xmm0
14013dc14: 410f28c1 movaps xmm0, xmm9
14013dc18: e8fac4ab05 call 0x145bfa117
14013dc1d: 440f28c8 movaps xmm9, xmm0
14013dc21: 450f57ce xorps xmm9, xmm14
14013dc25: 410f28c0 movaps xmm0, xmm8
14013dc29: e8efc4ab05 call 0x145bfa11d
14013dc2e: 440f28d0 movaps xmm10, xmm0
14013dc32: 410f28c0 movaps xmm0, xmm8
14013dc36: e8dcc4ab05 call 0x145bfa117
14013dc3b: 450f57d6 xorps xmm10, xmm14
14013dc3f: 440f28f6 movaps xmm14, xmm6
14013dc43: f30f107570 movss xmm6, dword ptr [rbp + 0x70]
14013dc48: f3440f114d50 movss dword ptr [rbp + 0x50], xmm9
14013dc4e: f30f117d54 movss dword ptr [rbp + 0x54], xmm7
14013dc53: c7455800000000 mov dword ptr [rbp + 0x58], 0
14013dc5a: f30f11455c movss dword ptr [rbp + 0x5c], xmm0
14013dc5f: f3440f115560 movss dword ptr [rbp + 0x60], xmm10
14013dc65: c7456400000000 mov dword ptr [rbp + 0x64], 0
14013dc6c: 49c7461000000000 mov qword ptr [r14 + 0x10], 0
14013dc74: 498b5618 mov rdx, qword ptr [r14 + 0x18]
14013dc78: 4c89f1 mov rcx, r14
14013dc7b: 4d89f8 mov r8, r15
14013dc7e: 4d89f9 mov r9, r15
14013dc81: e89af3f4ff call 0x14008d020
14013dc86: 90 nop
14013dc87: 498b4e08 mov rcx, qword ptr [r14 + 8]
14013dc8b: 498b5610 mov rdx, qword ptr [r14 + 0x10]
14013dc8f: 48897c2428 mov qword ptr [rsp + 0x28], rdi
14013dc94: f3440f11742420 movss dword ptr [rsp + 0x20], xmm14
14013dc9b: 48c744243002000000 mov qword ptr [rsp + 0x30], 2
14013dca4: 4d89e0 mov r8, r12
14013dca7: 0f28de movaps xmm3, xmm6
14013dcaa: e821a10000 call 0x140147dd0
14013dcaf: 90 nop
14013dcb0: e9abfdffff jmp 0x14013da60
14013dcb5: 498b7e20 mov rdi, qword ptr [r14 + 0x20]
14013dcb9: 0fb65d76 movzx ebx, byte ptr [rbp + 0x76]
14013dcbd: 885d50 mov byte ptr [rbp + 0x50], bl
14013dcc0: 48837f1800 cmp qword ptr [rdi + 0x18], 0
14013dcc5: 0f84d5000000 je 0x14013dda0
14013dccb: 488d4f20 lea rcx, [rdi + 0x20]
14013dccf: 488d5550 lea rdx, [rbp + 0x50]
14013dcd3: e898f7ecff call 0x14000d470
14013dcd8: 4989c0 mov r8, rax
14013dcdb: 49c1e839 shr r8, 0x39
14013dcdf: 488b0f mov rcx, qword ptr [rdi]
14013dce2: 488b5708 mov rdx, qword ptr [rdi + 8]
14013dce6: 66410f6ec0 movd xmm0, r8d
14013dceb: 660f60c0 punpcklbw xmm0, xmm0
14013dcef: f20f70c000 pshuflw xmm0, xmm0, 0
14013dcf4: 660f70c044 pshufd xmm0, xmm0, 0x44
14013dcf9: 4531c0 xor r8d, r8d
14013dcfc: 660f76c9 pcmpeqd xmm1, xmm1
14013dd00: 4821d0 and rax, rdx
14013dd03: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14013dd08: 660f6fda movdqa xmm3, xmm2
14013dd0c: 660f74d8 pcmpeqb xmm3, xmm0
14013dd10: 66440fd7cb pmovmskb r9d, xmm3
14013dd15: 4585c9 test r9d, r9d
14013dd18: 7436 je 0x14013dd50
14013dd1a: f3450fbcd9 tzcnt r11d, r9d
14013dd1f: 4901c3 add r11, rax
14013dd22: 4921d3 and r11, rdx
14013dd25: 49c1e305 shl r11, 5
14013dd29: 4989ca mov r10, rcx
14013dd2c: 4d29da sub r10, r11
14013dd2f: 413a5ae0 cmp bl, byte ptr [r10 - 0x20]
14013dd33: 7436 je 0x14013dd6b
14013dd35: 458d51ff lea r10d, [r9 - 1]
14013dd39: 664521ca and r10w, r9w
14013dd3d: 4589d1 mov r9d, r10d
14013dd40: 75d8 jne 0x14013dd1a
14013dd42: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14013dd50: 660f74d1 pcmpeqb xmm2, xmm1
14013dd54: 66440fd7ca pmovmskb r9d, xmm2
14013dd59: 4585c9 test r9d, r9d
14013dd5c: 7542 jne 0x14013dda0
14013dd5e: 4c01c0 add rax, r8
14013dd61: 4883c010 add rax, 0x10
14013dd65: 4983c010 add r8, 0x10
14013dd69: eb95 jmp 0x14013dd00
14013dd6b: 41807ae800 cmp byte ptr [r10 - 0x18], 0
14013dd70: 7449 je 0x14013ddbb
14013dd72: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
14013dd77: 884526 mov byte ptr [rbp + 0x26], al
14013dd7a: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
14013dd7f: 66894524 mov word ptr [rbp + 0x24], ax
14013dd83: 498d52ec lea rdx, [r10 - 0x14]
14013dd87: 498d4af0 lea rcx, [r10 - 0x10]
14013dd8b: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
14013dd8f: 410fb642f8 movzx eax, byte ptr [r10 - 8]
14013dd94: 48c1e020 shl rax, 0x20
14013dd98: 4c09c0 or rax, r8
14013dd9b: 41b001 mov r8b, 1
14013dd9e: eb2a jmp 0x14013ddca
14013dda0: 488d0d5451ca05 lea rcx, [rip + 0x5ca5154]
14013dda7: 4c8d056a51ca05 lea r8, [rip + 0x5ca516a]
14013ddae: ba16000000 mov edx, 0x16
14013ddb3: e8b8b7c505 call 0x145d99570
14013ddb8: 90 nop
14013ddb9: 0f0b ud2
14013ddbb: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
14013ddbf: 488d5168 lea rdx, [rcx + 0x68]
14013ddc3: 4883c16c add rcx, 0x6c
14013ddc7: 4531c0 xor r8d, r8d
14013ddca: 440fb65577 movzx r10d, byte ptr [rbp + 0x77]
14013ddcf: 8b12 mov edx, dword ptr [rdx]
14013ddd1: 8b09 mov ecx, dword ptr [rcx]
14013ddd3: 4c8b4d18 mov r9, qword ptr [rbp + 0x18]
14013ddd7: 4c894e10 mov qword ptr [rsi + 0x10], r9
14013dddb: 0f104508 movups xmm0, xmmword ptr [rbp + 8]
14013dddf: 0f1106 movups xmmword ptr [rsi], xmm0
14013dde2: 4488562c mov byte ptr [rsi + 0x2c], r10b
14013dde6: 44884618 mov byte ptr [rsi + 0x18], r8b
14013ddea: 440fb74524 movzx r8d, word ptr [rbp + 0x24]
14013ddef: 6644894619 mov word ptr [rsi + 0x19], r8w
14013ddf4: 440fb64526 movzx r8d, byte ptr [rbp + 0x26]
14013ddf9: 4488461b mov byte ptr [rsi + 0x1b], r8b
14013ddfd: 89561c mov dword ptr [rsi + 0x1c], edx
14013de00: 894e20 mov dword ptr [rsi + 0x20], ecx
14013de03: 48894624 mov qword ptr [rsi + 0x24], rax
14013de07: 0f28b580000000 movaps xmm6, xmmword ptr [rbp + 0x80]
14013de0e: 0f28bd90000000 movaps xmm7, xmmword ptr [rbp + 0x90]
14013de15: 440f2885a0000000 movaps xmm8, xmmword ptr [rbp + 0xa0]
14013de1d: 440f288db0000000 movaps xmm9, xmmword ptr [rbp + 0xb0]
14013de25: 440f2895c0000000 movaps xmm10, xmmword ptr [rbp + 0xc0]
14013de2d: 440f289dd0000000 movaps xmm11, xmmword ptr [rbp + 0xd0]
14013de35: 440f28a5e0000000 movaps xmm12, xmmword ptr [rbp + 0xe0]
14013de3d: 440f28adf0000000 movaps xmm13, xmmword ptr [rbp + 0xf0]
14013de45: 440f28b500010000 movaps xmm14, xmmword ptr [rbp + 0x100]
14013de4d: 440f28bd10010000 movaps xmm15, xmmword ptr [rbp + 0x110]
14013de55: 4881c4a8010000 add rsp, 0x1a8
14013de5c: 5b pop rbx
14013de5d: 5f pop rdi
14013de5e: 5e pop rsi
14013de5f: 415c pop r12
14013de61: 415d pop r13
14013de63: 415e pop r14
14013de65: 415f pop r15
14013de67: 5d pop rbp
14013de68: c3 ret
