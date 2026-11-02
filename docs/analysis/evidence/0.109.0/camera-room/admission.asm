; admission 0x140946c80..0x1409472e3
140946c80: 4157 push r15
140946c82: 4156 push r14
140946c84: 4155 push r13
140946c86: 4154 push r12
140946c88: 56 push rsi
140946c89: 57 push rdi
140946c8a: 55 push rbp
140946c8b: 53 push rbx
140946c8c: 4881ec88010000 sub rsp, 0x188
140946c93: 440f29b42470010000 movaps xmmword ptr [rsp + 0x170], xmm14
140946c9c: 440f29ac2460010000 movaps xmmword ptr [rsp + 0x160], xmm13
140946ca5: 440f29a42450010000 movaps xmmword ptr [rsp + 0x150], xmm12
140946cae: 440f299c2440010000 movaps xmmword ptr [rsp + 0x140], xmm11
140946cb7: 66440f7f942430010000 movdqa xmmword ptr [rsp + 0x130], xmm10
140946cc1: 440f298c2420010000 movaps xmmword ptr [rsp + 0x120], xmm9
140946cca: 440f29842410010000 movaps xmmword ptr [rsp + 0x110], xmm8
140946cd3: 0f29bc2400010000 movaps xmmword ptr [rsp + 0x100], xmm7
140946cdb: 0f29b424f0000000 movaps xmmword ptr [rsp + 0xf0], xmm6
140946ce3: 44894c244c mov dword ptr [rsp + 0x4c], r9d
140946ce8: 4989cd mov r13, rcx
140946ceb: f30f10b424f0010000 movss xmm6, dword ptr [rsp + 0x1f0]
140946cf4: 498b08 mov rcx, qword ptr [r8]
140946cf7: 498b6808 mov rbp, qword ptr [r8 + 8]
140946cfb: 488b99f8000000 mov rbx, qword ptr [rcx + 0xf8]
140946d02: 488b8100010000 mov rax, qword ptr [rcx + 0x100]
140946d09: 4c8d3483 lea r14, [rbx + rax*4]
140946d0d: 48894c2450 mov qword ptr [rsp + 0x50], rcx
140946d12: 440fb69908010000 movzx r11d, byte ptr [rcx + 0x108]
140946d1a: f3410f107d00 movss xmm7, dword ptr [r13]
140946d20: f3450f104504 movss xmm8, dword ptr [r13 + 4]
140946d26: f3450f104d08 movss xmm9, dword ptr [r13 + 8]
140946d2c: 0fc6ff00 shufps xmm7, xmm7, 0
140946d30: 450fc6c000 shufps xmm8, xmm8, 0
140946d35: 450fc6c900 shufps xmm9, xmm9, 0
140946d3a: 488b4240 mov rax, qword ptr [rdx + 0x40]
140946d3e: 4889442458 mov qword ptr [rsp + 0x58], rax
140946d43: 488b7a48 mov rdi, qword ptr [rdx + 0x48]
140946d47: 488b8290000000 mov rax, qword ptr [rdx + 0x90]
140946d4e: 4889442478 mov qword ptr [rsp + 0x78], rax
140946d53: 488b8280000000 mov rax, qword ptr [rdx + 0x80]
140946d5a: 4889442460 mov qword ptr [rsp + 0x60], rax
140946d5f: 488b4278 mov rax, qword ptr [rdx + 0x78]
140946d63: 4889442470 mov qword ptr [rsp + 0x70], rax
140946d68: 4531c9 xor r9d, r9d
140946d6b: 41b808000000 mov r8d, 8
140946d71: 66450f76d2 pcmpeqd xmm10, xmm10
140946d76: f3440f101d21654505 movss xmm11, dword ptr [rip + 0x5456521]
140946d7f: 440f282519634805 movaps xmm12, xmmword ptr [rip + 0x5486319]
140946d87: 31f6 xor esi, esi
140946d89: 4531d2 xor r10d, r10d
140946d8c: 48897c2440 mov qword ptr [rsp + 0x40], rdi
140946d91: 4584db test r11b, r11b
140946d94: 747a je 0x140946e10
140946d96: 4139f2 cmp r10d, esi
140946d99: 0f85fd000000 jne 0x140946e9c
140946d9f: 90 nop 
140946da0: 4c39f3 cmp rbx, r14
140946da3: 0f84d1040000 je 0x14094727a
140946da9: 8b0b mov ecx, dword ptr [rbx]
140946dab: 4883c304 add rbx, 4
140946daf: 488b85a8010000 mov rax, qword ptr [rbp + 0x1a8]
140946db6: 488d0cc9 lea rcx, [rcx + rcx*8]
140946dba: 488b74c810 mov rsi, qword ptr [rax + rcx*8 + 0x10]
140946dbf: 4885f6 test rsi, rsi
140946dc2: 74dc je 0x140946da0
140946dc4: 488d04c8 lea rax, [rax + rcx*8]
140946dc8: 488b4c2450 mov rcx, qword ptr [rsp + 0x50]
140946dcd: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
140946dd4: 483b4840 cmp rcx, qword ptr [rax + 0x40]
140946dd8: 0f83b8000000 jae 0x140946e96
140946dde: 488b5038 mov rdx, qword ptr [rax + 0x38]
140946de2: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
140946de6: 4885c9 test rcx, rcx
140946de9: 0f84a7000000 je 0x140946e96
140946def: 488b4018 mov rax, qword ptr [rax + 0x18]
140946df3: 48f7d1 not rcx
140946df6: 488d0c49 lea rcx, [rcx + rcx*2]
140946dfa: 48c1e104 shl rcx, 4
140946dfe: 4c8b4c0810 mov r9, qword ptr [rax + rcx + 0x10]
140946e03: e991000000 jmp 0x140946e99
140946e08: 0f1f840000000000 nop dword ptr [rax + rax]
140946e10: 4139f2 cmp r10d, esi
140946e13: 0f8592000000 jne 0x140946eab
140946e19: 0f1f8000000000 nop dword ptr [rax]
140946e20: 4c39f3 cmp rbx, r14
140946e23: 0f8451040000 je 0x14094727a
140946e29: 8b0b mov ecx, dword ptr [rbx]
140946e2b: 4883c304 add rbx, 4
140946e2f: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
140946e36: 488d0c89 lea rcx, [rcx + rcx*4]
140946e3a: 48c1e105 shl rcx, 5
140946e3e: 488b740858 mov rsi, qword ptr [rax + rcx + 0x58]
140946e43: 4885f6 test rsi, rsi
140946e46: 74d8 je 0x140946e20
140946e48: 4801c8 add rax, rcx
140946e4b: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
140946e51: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
140946e58: 4c8d04c9 lea r8, [rcx + rcx*8]
140946e5c: 488b4c2450 mov rcx, qword ptr [rsp + 0x50]
140946e61: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
140946e68: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
140946e6d: 7332 jae 0x140946ea1
140946e6f: 4a8d14c2 lea rdx, [rdx + r8*8]
140946e73: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
140946e77: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
140946e7b: 4885c9 test rcx, rcx
140946e7e: 7421 je 0x140946ea1
140946e80: 488b5218 mov rdx, qword ptr [rdx + 0x18]
140946e84: 48f7d1 not rcx
140946e87: 488d0c49 lea rcx, [rcx + rcx*2]
140946e8b: 48c1e104 shl rcx, 4
140946e8f: 4c8b4c0a10 mov r9, qword ptr [rdx + rcx + 0x10]
140946e94: eb0e jmp 0x140946ea4
140946e96: 4531c9 xor r9d, r9d
140946e99: 4531d2 xor r10d, r10d
140946e9c: 4489d0 mov eax, r10d
140946e9f: eb18 jmp 0x140946eb9
140946ea1: 4531c9 xor r9d, r9d
140946ea4: 4c8b4050 mov r8, qword ptr [rax + 0x50]
140946ea8: 4531d2 xor r10d, r10d
140946eab: 4489d0 mov eax, r10d
140946eae: 48c1e004 shl rax, 4
140946eb2: 418b440008 mov eax, dword ptr [r8 + rax + 8]
140946eb7: f7d0 not eax
140946eb9: 488d0c40 lea rcx, [rax + rax*2]
140946ebd: 48c1e106 shl rcx, 6
140946ec1: 4c01c9 add rcx, r9
140946ec4: 41ffc2 inc r10d
140946ec7: 80794001 cmp byte ptr [rcx + 0x40], 1
140946ecb: 0f854f010000 jne 0x140947020
140946ed1: 48837c247800 cmp qword ptr [rsp + 0x78], 0
140946ed7: 0f84b4feffff je 0x140946d91
140946edd: 448954242c mov dword ptr [rsp + 0x2c], r10d
140946ee2: 4c894c2430 mov qword ptr [rsp + 0x30], r9
140946ee7: 4c89442438 mov qword ptr [rsp + 0x38], r8
140946eec: 0fb74141 movzx eax, word ptr [rcx + 0x41]
140946ef0: 0fb65143 movzx edx, byte ptr [rcx + 0x43]
140946ef4: c1e210 shl edx, 0x10
140946ef7: 4809c2 or rdx, rax
140946efa: 8b4144 mov eax, dword ptr [rcx + 0x44]
140946efd: 448b4148 mov r8d, dword ptr [rcx + 0x48]
140946f01: 440fb64950 movzx r9d, byte ptr [rcx + 0x50]
140946f06: 448b514c mov r10d, dword ptr [rcx + 0x4c]
140946f0a: 48c1e018 shl rax, 0x18
140946f0e: 4809d0 or rax, rdx
140946f11: 4489c2 mov edx, r8d
140946f14: c1ea08 shr edx, 8
140946f17: 49c1e038 shl r8, 0x38
140946f1b: 4909c0 or r8, rax
140946f1e: 49c1e218 shl r10, 0x18
140946f22: 49c1e138 shl r9, 0x38
140946f26: 4d09d1 or r9, r10
140946f29: 4909d1 or r9, rdx
140946f2c: 4c89c2 mov rdx, r8
140946f2f: 48b868ef5cfec09df1de movabs rax, 0xdef19dc0fe5cef68
140946f39: 4831c2 xor rdx, rax
140946f3c: 4c89c8 mov rax, r9
140946f3f: 49ba170947b5b5d5843f movabs r10, 0x3f84d5b5b5470917
140946f49: 4c31d0 xor rax, r10
140946f4c: 48f7e2 mul rdx
140946f4f: 4831c2 xor rdx, rax
140946f52: 4889d0 mov rax, rdx
140946f55: 48c1e839 shr rax, 0x39
140946f59: 660f6ec0 movd xmm0, eax
140946f5d: 660f60c0 punpcklbw xmm0, xmm0
140946f61: f20f70c000 pshuflw xmm0, xmm0, 0
140946f66: 660f70c044 pshufd xmm0, xmm0, 0x44
140946f6b: 31c0 xor eax, eax
140946f6d: 4c8b7c2470 mov r15, qword ptr [rsp + 0x70]
140946f72: 4823542460 and rdx, qword ptr [rsp + 0x60]
140946f77: f3410f6f0c17 movdqu xmm1, xmmword ptr [r15 + rdx]
140946f7d: 660f6fd1 movdqa xmm2, xmm1
140946f81: 660f74d0 pcmpeqb xmm2, xmm0
140946f85: 66440fd7d2 pmovmskb r10d, xmm2
140946f8a: 4585d2 test r10d, r10d
140946f8d: 7461 je 0x140946ff0
140946f8f: 4889442468 mov qword ptr [rsp + 0x68], rax
140946f94: 4489df mov edi, r11d
140946f97: 4c89e8 mov rax, r13
140946f9a: f3450fbcda tzcnt r11d, r10d
140946f9f: 4901d3 add r11, rdx
140946fa2: 4c235c2460 and r11, qword ptr [rsp + 0x60]
140946fa7: 49f7db neg r11
140946faa: 4f8d245b lea r12, [r11 + r11*2]
140946fae: 49c1e408 shl r12, 8
140946fb2: 4f8b9c2708fdffff mov r11, qword ptr [r15 + r12 - 0x2f8]
140946fba: 4d31cb xor r11, r9
140946fbd: 4f8bac2700fdffff mov r13, qword ptr [r15 + r12 - 0x300]
140946fc5: 4d31c5 xor r13, r8
140946fc8: 4d09dd or r13, r11
140946fcb: 0f84a6000000 je 0x140947077
140946fd1: 458d5aff lea r11d, [r10 - 1]
140946fd5: 664521d3 and r11w, r10w
140946fd9: 4589da mov r10d, r11d
140946fdc: 4989c5 mov r13, rax
140946fdf: 4189fb mov r11d, edi
140946fe2: 488b7c2440 mov rdi, qword ptr [rsp + 0x40]
140946fe7: 488b442468 mov rax, qword ptr [rsp + 0x68]
140946fec: 75a6 jne 0x140946f94
140946fee: 6690 nop 
140946ff0: 66410f74ca pcmpeqb xmm1, xmm10
140946ff5: 66440fd7d1 pmovmskb r10d, xmm1
140946ffa: 4585d2 test r10d, r10d
140946ffd: 0f8563020000 jne 0x140947266
140947003: 4801c2 add rdx, rax
140947006: 4883c210 add rdx, 0x10
14094700a: 4883c010 add rax, 0x10
14094700e: e95fffffff jmp 0x140946f72
140947013: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140947020: 488b4148 mov rax, qword ptr [rcx + 0x48]
140947024: 8b506c mov edx, dword ptr [rax + 0x6c]
140947027: 4839d7 cmp rdi, rdx
14094702a: 0f8661fdffff jbe 0x140946d91
140947030: 4c69e2f8020000 imul r12, rdx, 0x2f8
140947037: 488b542458 mov rdx, qword ptr [rsp + 0x58]
14094703c: 4a8b1422 mov rdx, qword ptr [rdx + r12]
140947040: 4883fafe cmp rdx, -2
140947044: 0f8447fdffff je 0x140946d91
14094704a: 4883faff cmp rdx, -1
14094704e: 0f843dfdffff je 0x140946d91
140947054: 8b4068 mov eax, dword ptr [rax + 0x68]
140947057: 4c03642458 add r12, qword ptr [rsp + 0x58]
14094705c: 41398424f0020000 cmp dword ptr [r12 + 0x2f0], eax
140947064: 0f8527fdffff jne 0x140946d91
14094706a: 49837c247000 cmp qword ptr [r12 + 0x70], 0
140947070: 7535 jne 0x1409470a7
140947072: e91afdffff jmp 0x140946d91
140947077: 4d01fc add r12, r15
14094707a: 4981c410fdffff add r12, -0x2f0
140947081: 4989c5 mov r13, rax
140947084: 4189fb mov r11d, edi
140947087: 488b7c2440 mov rdi, qword ptr [rsp + 0x40]
14094708c: 4c8b442438 mov r8, qword ptr [rsp + 0x38]
140947091: 4c8b4c2430 mov r9, qword ptr [rsp + 0x30]
140947096: 448b54242c mov r10d, dword ptr [rsp + 0x2c]
14094709b: 49837c247000 cmp qword ptr [r12 + 0x70], 0
1409470a1: 0f84eafcffff je 0x140946d91
1409470a7: 448954242c mov dword ptr [rsp + 0x2c], r10d
1409470ac: 4c894c2430 mov qword ptr [rsp + 0x30], r9
1409470b1: 4c89442438 mov qword ptr [rsp + 0x38], r8
1409470b6: 4589df mov r15d, r11d
1409470b9: 0f2801 movaps xmm0, xmmword ptr [rcx]
1409470bc: 0f286910 movaps xmm5, xmmword ptr [rcx + 0x10]
1409470c0: 0f286120 movaps xmm4, xmmword ptr [rcx + 0x20]
1409470c4: 0f284930 movaps xmm1, xmmword ptr [rcx + 0x30]
1409470c8: 0f28d5 movaps xmm2, xmm5
1409470cb: 0fc6d5d2 shufps xmm2, xmm5, 0xd2
1409470cf: 0f28d8 movaps xmm3, xmm0
1409470d2: 0fc6d8d2 shufps xmm3, xmm0, 0xd2
1409470d6: 440f28ea movaps xmm13, xmm2
1409470da: 440f59e8 mulps xmm13, xmm0
1409470de: 440f28f4 movaps xmm14, xmm4
1409470e2: 440fc6f4d2 shufps xmm14, xmm4, 0xd2
1409470e7: 410f59c6 mulps xmm0, xmm14
1409470eb: 440f59f5 mulps xmm14, xmm5
1409470ef: 0f59eb mulps xmm5, xmm3
1409470f2: 410f5ced subps xmm5, xmm13
1409470f6: 0fc6ed52 shufps xmm5, xmm5, 0x52
1409470fa: 0f59dc mulps xmm3, xmm4
1409470fd: 0f59d4 mulps xmm2, xmm4
140947100: 0f59e5 mulps xmm4, xmm5
140947103: f3440f16ec movshdup xmm13, xmm4
140947108: f3440f58ec addss xmm13, xmm4
14094710d: 0f12e4 movhlps xmm4, xmm4
140947110: f3410f58e5 addss xmm4, xmm13
140947115: 450f28eb movaps xmm13, xmm11
140947119: f3440f5eec divss xmm13, xmm4
14094711e: 450fc6ed00 shufps xmm13, xmm13, 0
140947123: 0f5cc3 subps xmm0, xmm3
140947126: 0fc6c052 shufps xmm0, xmm0, 0x52
14094712a: 410f5cd6 subps xmm2, xmm14
14094712e: 0fc6d252 shufps xmm2, xmm2, 0x52
140947132: 410f59d5 mulps xmm2, xmm13
140947136: 410f59c5 mulps xmm0, xmm13
14094713a: 440f59ed mulps xmm13, xmm5
14094713e: 0f28da movaps xmm3, xmm2
140947141: 0f16d8 movlhps xmm3, xmm0
140947144: 0f12c2 movhlps xmm0, xmm2
140947147: 0f28d3 movaps xmm2, xmm3
14094714a: 410fc6d508 shufps xmm2, xmm13, 8
14094714f: 410fc6dd5d shufps xmm3, xmm13, 0x5d
140947154: 410fc6c5a8 shufps xmm0, xmm13, 0xa8
140947159: 0f28e1 movaps xmm4, xmm1
14094715c: 0fc6e100 shufps xmm4, xmm1, 0
140947160: 0f59e2 mulps xmm4, xmm2
140947163: 0f28e9 movaps xmm5, xmm1
140947166: 0fc6e915 shufps xmm5, xmm1, 0x15
14094716a: 0f59eb mulps xmm5, xmm3
14094716d: 0f58ec addps xmm5, xmm4
140947170: 0fc6c92a shufps xmm1, xmm1, 0x2a
140947174: 0f59c8 mulps xmm1, xmm0
140947177: 0f58cd addps xmm1, xmm5
14094717a: 410f57cc xorps xmm1, xmm12
14094717e: 0f299424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm2
140947186: 0f299c24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm3
14094718e: 0f298424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm0
140947196: 0f298c24e0000000 movaps xmmword ptr [rsp + 0xe0], xmm1
14094719e: 0f59d7 mulps xmm2, xmm7
1409471a1: 410f59d8 mulps xmm3, xmm8
1409471a5: 0f58da addps xmm3, xmm2
1409471a8: 410f59c1 mulps xmm0, xmm9
1409471ac: 0f58c3 addps xmm0, xmm3
1409471af: 0f58c1 addps xmm0, xmm1
1409471b2: f30f16c8 movshdup xmm1, xmm0
1409471b6: 0fc6c0e2 shufps xmm0, xmm0, 0xe2
1409471ba: 410f57c4 xorps xmm0, xmm12
1409471be: 0f13842480000000 movlps qword ptr [rsp + 0x80], xmm0
1409471c6: f30f118c2488000000 movss dword ptr [rsp + 0x88], xmm1
1409471cf: 4531c9 xor r9d, r9d
1409471d2: f644244c01 test byte ptr [rsp + 0x4c], 1
1409471d7: 7419 je 0x1409471f2
1409471d9: 488d8c24b0000000 lea rcx, [rsp + 0xb0]
1409471e1: 4c89ea mov rdx, r13
1409471e4: 0f28d6 movaps xmm2, xmm6
1409471e7: e8f42cff00 call 0x141939ee0
1409471ec: 41b901000000 mov r9d, 1
1409471f2: 660f7e442420 movd dword ptr [rsp + 0x20], xmm0
1409471f8: 488d8c2490000000 lea rcx, [rsp + 0x90]
140947200: 4c89e2 mov rdx, r12
140947203: 4c8d842480000000 lea r8, [rsp + 0x80]
14094720b: e8e07e0401 call 0x14198f0f0
140947210: 83bc249000000001 cmp dword ptr [rsp + 0x90], 1
140947218: 7544 jne 0x14094725e
14094721a: 488b842498000000 mov rax, qword ptr [rsp + 0x98]
140947222: 493b842488000000 cmp rax, qword ptr [r12 + 0x88]
14094722a: 7332 jae 0x14094725e
14094722c: 498b8c2480000000 mov rcx, qword ptr [r12 + 0x80]
140947234: 486bc02c imul rax, rax, 0x2c
140947238: f6040108 test byte ptr [rcx + rax], 8
14094723c: 4589fb mov r11d, r15d
14094723f: 488b7c2440 mov rdi, qword ptr [rsp + 0x40]
140947244: 4c8b442438 mov r8, qword ptr [rsp + 0x38]
140947249: 4c8b4c2430 mov r9, qword ptr [rsp + 0x30]
14094724e: 448b54242c mov r10d, dword ptr [rsp + 0x2c]
140947253: 0f8538fbffff jne 0x140946d91
140947259: e981000000 jmp 0x1409472df
14094725e: 4589fb mov r11d, r15d
140947261: 488b7c2440 mov rdi, qword ptr [rsp + 0x40]
140947266: 4c8b442438 mov r8, qword ptr [rsp + 0x38]
14094726b: 4c8b4c2430 mov r9, qword ptr [rsp + 0x30]
140947270: 448b54242c mov r10d, dword ptr [rsp + 0x2c]
140947275: e917fbffff jmp 0x140946d91
14094727a: 31c0 xor eax, eax
14094727c: 0f28b424f0000000 movaps xmm6, xmmword ptr [rsp + 0xf0]
140947284: 0f28bc2400010000 movaps xmm7, xmmword ptr [rsp + 0x100]
14094728c: 440f28842410010000 movaps xmm8, xmmword ptr [rsp + 0x110]
140947295: 440f288c2420010000 movaps xmm9, xmmword ptr [rsp + 0x120]
14094729e: 440f28942430010000 movaps xmm10, xmmword ptr [rsp + 0x130]
1409472a7: 440f289c2440010000 movaps xmm11, xmmword ptr [rsp + 0x140]
1409472b0: 440f28a42450010000 movaps xmm12, xmmword ptr [rsp + 0x150]
1409472b9: 440f28ac2460010000 movaps xmm13, xmmword ptr [rsp + 0x160]
1409472c2: 440f28b42470010000 movaps xmm14, xmmword ptr [rsp + 0x170]
1409472cb: 4881c488010000 add rsp, 0x188
1409472d2: 5b pop rbx
1409472d3: 5d pop rbp
1409472d4: 5f pop rdi
1409472d5: 5e pop rsi
1409472d6: 415c pop r12
1409472d8: 415d pop r13
1409472da: 415e pop r14
1409472dc: 415f pop r15
1409472de: c3 ret 
1409472df: b001 mov al, 1
1409472e1: eb99 jmp 0x14094727c
