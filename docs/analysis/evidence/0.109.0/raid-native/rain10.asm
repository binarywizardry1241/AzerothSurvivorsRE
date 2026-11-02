14595950f: 8b19 mov ebx, dword ptr [rcx]
145959511: 448b6104 mov r12d, dword ptr [rcx + 4]
145959515: f30f107908 movss xmm7, dword ptr [rcx + 8]
14595951a: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14595951f: f30f105910 movss xmm3, dword ptr [rcx + 0x10]
145959524: f3440f105114 movss xmm10, dword ptr [rcx + 0x14]
14595952a: 4889f1 mov rcx, rsi
14595952d: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145959534: 4189d8 mov r8d, ebx
145959537: f30f119d50010000 movss dword ptr [rbp + 0x150], xmm3
14595953f: e8ace2ffff call 0x1459577f0
145959544: 4585e4 test r12d, r12d
145959547: 0f842be4ffff je 0x145957978
14595954d: f3440f1086340a0000 movss xmm8, dword ptr [rsi + 0xa34]
145959556: 488bbe98050000 mov rdi, qword ptr [rsi + 0x598]
14595955d: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
145959564: 448bb6380a0000 mov r14d, dword ptr [rsi + 0xa38]
14595956b: 41ffc6 inc r14d
14595956e: 4489b6380a0000 mov dword ptr [rsi + 0xa38], r14d
145959575: 4883c110 add rcx, 0x10
145959579: 4c8bbe88050000 mov r15, qword ptr [rsi + 0x588]
145959580: 0f288dd0000000 movaps xmm1, xmmword ptr [rbp + 0xd0]
145959587: 0f2895e0000000 movaps xmm2, xmmword ptr [rbp + 0xe0]
14595958e: e8eda7f7ff call 0x1458d3d80
145959593: 440f28c8 movaps xmm9, xmm0
145959597: 450f28de movaps xmm11, xmm14
14595959b: f3450f59da mulss xmm11, xmm10
1459595a0: 450f57d2 xorps xmm10, xmm10
1459595a4: f3440f589550010000 addss xmm10, dword ptr [rbp + 0x150]
1459595ad: 4c39ff cmp rdi, r15
1459595b0: 750c jne 0x1459595be
1459595b2: 488d8e88050000 lea rcx, [rsi + 0x588]
1459595b9: e872172a00 call 0x145bfad30
1459595be: f3450f58d0 addss xmm10, xmm8
1459595c3: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
1459595ca: 4889f9 mov rcx, rdi
1459595cd: 48c1e107 shl rcx, 7
1459595d1: 48c7040800000000 mov qword ptr [rax + rcx], 0
1459595d9: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
1459595e1: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459595e8: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
1459595ed: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
1459595f6: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
1459595fe: f30f117c0834 movss dword ptr [rax + rcx + 0x34], xmm7
145959604: 448974083c mov dword ptr [rax + rcx + 0x3c], r14d
145959609: 0f2885d0000000 movaps xmm0, xmmword ptr [rbp + 0xd0]
145959610: 0f13440840 movlps qword ptr [rax + rcx + 0x40], xmm0
145959615: f3440f114c0848 movss dword ptr [rax + rcx + 0x48], xmm9
14595961c: 0f57d2 xorps xmm2, xmm2
14595961f: 0f57c0 xorps xmm0, xmm0
145959622: f3410f10c0 movss xmm0, xmm8
145959627: 0f57c9 xorps xmm1, xmm1
14595962a: f3410f10ca movss xmm1, xmm10
14595962f: 0fc6c141 shufps xmm0, xmm1, 0x41
145959633: 0f1144084c movups xmmword ptr [rax + rcx + 0x4c], xmm0
145959638: 895c085c mov dword ptr [rax + rcx + 0x5c], ebx
14595963c: f3440f119d78010000 movss dword ptr [rbp + 0x178], xmm11
145959645: f3440f115c0860 movss dword ptr [rax + rcx + 0x60], xmm11
14595964c: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145959654: 48ffc7 inc rdi
145959657: 0f11540868 movups xmmword ptr [rax + rcx + 0x68], xmm2
14595965c: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145959665: 4889be98050000 mov qword ptr [rsi + 0x598], rdi
14595966c: 4183fc01 cmp r12d, 1
145959670: 0f8402e3ffff je 0x145957978
145959676: f30f1005223c4400 movss xmm0, dword ptr [rip + 0x443c22]
14595967e: f30f58c7 addss xmm0, xmm7
145959682: 0f28ce movaps xmm1, xmm6
145959685: f30f5fc8 maxss xmm1, xmm0
145959689: 440f28c9 movaps xmm9, xmm1
14595968d: f3440fc2c903 cmpunordss xmm9, xmm1
145959693: 410f28c1 movaps xmm0, xmm9
145959697: 0f55c1 andnps xmm0, xmm1
14595969a: 440f54ce andps xmm9, xmm6
14595969e: 440f56c8 orps xmm9, xmm0
1459596a2: 4c8dbea0090000 lea r15, [rsi + 0x9a0]
1459596a9: f3440f10ad50010000 movss xmm13, dword ptr [rbp + 0x150]
1459596b2: f3440f5f2dc5374700 maxss xmm13, dword ptr [rip + 0x4737c5]
1459596bb: 41be01000000 mov r14d, 1
1459596c1: f3440f1035fa394700 movss xmm14, dword ptr [rip + 0x4739fa]
1459596ca: f3440f103d6d3a4700 movss xmm15, dword ptr [rip + 0x473a6d]
1459596d3: 488b96a0090000 mov rdx, qword ptr [rsi + 0x9a0]
1459596da: 488b86a8090000 mov rax, qword ptr [rsi + 0x9a8]
1459596e1: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
1459596e8: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
1459596ef: 90 nop
1459596f0: 4e8d0c02 lea r9, [rdx + r8]
1459596f4: 49c1c117 rol r9, 0x17
1459596f8: 4901d1 add r9, rdx
1459596fb: 4989c2 mov r10, rax
1459596fe: 49c1e211 shl r10, 0x11
145959702: 4831d1 xor rcx, rdx
145959705: 4931c0 xor r8, rax
145959708: 4831c8 xor rax, rcx
14595970b: 4c31c2 xor rdx, r8
14595970e: 49c1c02d rol r8, 0x2d
145959712: 4c31d1 xor rcx, r10
145959715: 49c1e929 shr r9, 0x29
145959719: 4181c90000803f or r9d, 0x3f800000
145959720: 66450f6ed1 movd xmm10, r9d
145959725: f3450f58d6 addss xmm10, xmm14
14595972a: f3450f59d7 mulss xmm10, xmm15
14595972f: 450f2efa ucomiss xmm15, xmm10
145959733: 76bb jbe 0x1459596f0
145959735: 0f57c0 xorps xmm0, xmm0
145959738: f3440f58d0 addss xmm10, xmm0
14595973d: 488996a0090000 mov qword ptr [rsi + 0x9a0], rdx
145959744: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
14595974b: 488986a8090000 mov qword ptr [rsi + 0x9a8], rax
145959752: 48898eb0090000 mov qword ptr [rsi + 0x9b0], rcx
145959759: 4c89f9 mov rcx, r15
14595975c: 0f28cf movaps xmm1, xmm7
14595975f: 410f28d1 movaps xmm2, xmm9
145959763: e81879f9ff call 0x1458f1080
145959768: 440f28d8 movaps xmm11, xmm0
14595976c: 410f28c2 movaps xmm0, xmm10
145959770: e8a8092a00 call 0x145bfa11d
145959775: 440f28e0 movaps xmm12, xmm0
145959779: 410f28c2 movaps xmm0, xmm10
14595977d: e895092a00 call 0x145bfa117
145959782: 440f14e0 unpcklps xmm12, xmm0
145959786: f3450f12d3 movsldup xmm10, xmm11
14595978b: 450f59d4 mulps xmm10, xmm12
14595978f: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
145959797: 4489f0 mov eax, r14d
14595979a: f3480f2af0 cvtsi2ss xmm6, rax
14595979f: f3450f16e2 movshdup xmm12, xmm10
1459597a4: f30f59358c964700 mulss xmm6, dword ptr [rip + 0x47968c]
1459597ac: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
1459597b2: ffc7 inc edi
1459597b4: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
1459597ba: f3440f1086340a0000 movss xmm8, dword ptr [rsi + 0xa34]
1459597c3: 4c8bae98090000 mov r13, qword ptr [rsi + 0x998]
1459597ca: 498d4d10 lea rcx, [r13 + 0x10]
1459597ce: 410f28ca movaps xmm1, xmm10
1459597d2: 410f28d4 movaps xmm2, xmm12
1459597d6: e8b5d7f7ff call 0x1458d6f90
1459597db: a801 test al, 1
1459597dd: 7406 je 0x1459597e5
1459597df: 440f28d8 movaps xmm11, xmm0
1459597e3: eb3c jmp 0x145959821
1459597e5: 49837d68ff cmp qword ptr [r13 + 0x68], -1
1459597ea: 742c je 0x145959818
1459597ec: 498d5568 lea rdx, [r13 + 0x68]
1459597f0: 488d8d10010000 lea rcx, [rbp + 0x110]
1459597f7: 410f28d2 movaps xmm2, xmm10
1459597fb: 410f28dc movaps xmm3, xmm12
1459597ff: e87c29f8ff call 0x1458dc180
145959804: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
14595980b: 750b jne 0x145959818
14595980d: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
145959816: eb09 jmp 0x145959821
145959818: f3450f109db8000000 movss xmm11, dword ptr [r13 + 0xb8]
145959821: 4c8bae98050000 mov r13, qword ptr [rsi + 0x598]
145959828: 4c3bae88050000 cmp r13, qword ptr [rsi + 0x588]
14595982f: 750c jne 0x14595983d
145959831: 488d8e88050000 lea rcx, [rsi + 0x588]
145959838: e8f3142a00 call 0x145bfad30
14595983d: f30f58b550010000 addss xmm6, dword ptr [rbp + 0x150]
145959845: f3410f58f0 addss xmm6, xmm8
14595984a: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
145959851: 4c89e8 mov rax, r13
145959854: 48c1e007 shl rax, 7
145959858: 48c7040100000000 mov qword ptr [rcx + rax], 0
145959860: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
145959868: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595986f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145959874: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14595987d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145959885: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14595988b: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
14595988f: 440f13540140 movlps qword ptr [rcx + rax + 0x40], xmm10
145959895: f3440f115c0148 movss dword ptr [rcx + rax + 0x48], xmm11
14595989c: 0f57c0 xorps xmm0, xmm0
14595989f: f3410f10c0 movss xmm0, xmm8
1459598a4: 0f57c9 xorps xmm1, xmm1
1459598a7: f30f10ce movss xmm1, xmm6
1459598ab: 0fc6c141 shufps xmm0, xmm1, 0x41
1459598af: 0f1144014c movups xmmword ptr [rcx + rax + 0x4c], xmm0
1459598b4: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
1459598b8: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
1459598c0: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
1459598c6: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
1459598ce: 49ffc5 inc r13
1459598d1: 0f57c0 xorps xmm0, xmm0
1459598d4: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
1459598d9: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
1459598e2: 4c89ae98050000 mov qword ptr [rsi + 0x598], r13
1459598e9: 0f8483320000 je 0x14595cb72
1459598ef: 41ffc6 inc r14d
1459598f2: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
1459598f9: f3440f116c0164 movss dword ptr [rcx + rax + 0x64], xmm13
145959900: 4539e6 cmp r14d, r12d
145959903: 0f85cafdffff jne 0x1459596d3
145959909: e96ae0ffff jmp 0x145957978
