140115440: 55 push rbp
140115441: 4157 push r15
140115443: 4156 push r14
140115445: 4155 push r13
140115447: 4154 push r12
140115449: 56 push rsi
14011544a: 57 push rdi
14011544b: 53 push rbx
14011544c: 4881ec08020000 sub rsp, 0x208
140115453: 488dac2480000000 lea rbp, [rsp + 0x80]
14011545b: 440f29bd70010000 movaps xmmword ptr [rbp + 0x170], xmm15
140115463: 440f29b560010000 movaps xmmword ptr [rbp + 0x160], xmm14
14011546b: 440f29ad50010000 movaps xmmword ptr [rbp + 0x150], xmm13
140115473: 440f29a540010000 movaps xmmword ptr [rbp + 0x140], xmm12
14011547b: 440f299d30010000 movaps xmmword ptr [rbp + 0x130], xmm11
140115483: 440f299520010000 movaps xmmword ptr [rbp + 0x120], xmm10
14011548b: 440f298d10010000 movaps xmmword ptr [rbp + 0x110], xmm9
140115493: 440f298500010000 movaps xmmword ptr [rbp + 0x100], xmm8
14011549b: 0f29bdf0000000 movaps xmmword ptr [rbp + 0xf0], xmm7
1401154a2: 0f29b5e0000000 movaps xmmword ptr [rbp + 0xe0], xmm6
1401154a9: 48c785d8000000feffffff mov qword ptr [rbp + 0xd8], 0xfffffffffffffffe
1401154b4: 4c8b12 mov r10, qword ptr [rdx]
1401154b7: 488b4210 mov rax, qword ptr [rdx + 0x10]
1401154bb: 8b4a1c mov ecx, dword ptr [rdx + 0x1c]
1401154be: 4d8b28 mov r13, qword ptr [r8]
1401154c1: 4d8b7810 mov r15, qword ptr [r8 + 0x10]
1401154c5: 458b601c mov r12d, dword ptr [r8 + 0x1c]
1401154c9: 498b11 mov rdx, qword ptr [r9]
1401154cc: f30f10725c movss xmm6, dword ptr [rdx + 0x5c]
1401154d1: 8908 mov dword ptr [rax], ecx
1401154d3: 498b4208 mov rax, qword ptr [r10 + 8]
1401154d7: 498b4a10 mov rcx, qword ptr [r10 + 0x10]
1401154db: 49c7421000000000 mov qword ptr [r10 + 0x10], 0
1401154e3: 48894de0 mov qword ptr [rbp - 0x20], rcx
1401154e7: 48c1e105 shl rcx, 5
1401154eb: 4801c1 add rcx, rax
1401154ee: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
1401154f6: 488945c8 mov qword ptr [rbp - 0x38], rax
1401154fa: 48894dd0 mov qword ptr [rbp - 0x30], rcx
1401154fe: 4c8955d8 mov qword ptr [rbp - 0x28], r10
140115502: f30f10051a0bc905 movss xmm0, dword ptr [rip + 0x5c90b1a]
14011550a: f30f58c6 addss xmm0, xmm6
14011550e: f30f1185ac000000 movss dword ptr [rbp + 0xac], xmm0
140115516: 488dbd80000000 lea rdi, [rbp + 0x80]
14011551d: f2440f10057acdc805 movsd xmm8, qword ptr [rip + 0x5c8cd7a]
140115526: 66440f280d81cdc805 movapd xmm9, xmmword ptr [rip + 0x5c8cd81]
14011552f: 4489a5c8000000 mov dword ptr [rbp + 0xc8], r12d
140115536: 4c89bdb0000000 mov qword ptr [rbp + 0xb0], r15
14011553d: 4839c8 cmp rax, rcx
140115540: 0f84c1110000 je 0x140116707
140115546: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
140115550: 488d4820 lea rcx, [rax + 0x20]
140115554: 48894dc8 mov qword ptr [rbp - 0x38], rcx
140115558: 660f1000 movupd xmm0, xmmword ptr [rax]
14011555c: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140115560: 660f2945a0 movapd xmmword ptr [rbp - 0x60], xmm0
140115565: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
140115569: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
140115570: 660f298580000000 movapd xmmword ptr [rbp + 0x80], xmm0
140115578: ba04000000 mov edx, 4
14011557d: 488d0db5c7cb05 lea rcx, [rip + 0x5cbc7b5]
140115584: 4989f8 mov r8, rdi
140115587: e8940b9d02 call 0x142ae6120
14011558c: 90 nop
14011558d: 4885c0 test rax, rax
140115590: 7507 jne 0x140115599
140115592: 488b05f7fcf007 mov rax, qword ptr [rip + 0x7f0fcf7]
140115599: 803803 cmp byte ptr [rax], 3
14011559c: 0f855e010000 jne 0x140115700
1401155a2: 488b4810 mov rcx, qword ptr [rax + 0x10]
1401155a6: 488b4018 mov rax, qword ptr [rax + 0x18]
1401155aa: 4883f805 cmp rax, 5
1401155ae: 0f8433010000 je 0x1401156e7
1401155b4: 4883f803 cmp rax, 3
1401155b8: 0f84c3000000 je 0x140115681
1401155be: 4883f802 cmp rax, 2
1401155c2: 0f8538010000 jne 0x140115700
1401155c8: 668139687a cmp word ptr [rcx], 0x7a68
1401155cd: 0f852d010000 jne 0x140115700
1401155d3: ba05000000 mov edx, 5
1401155d8: 488d0d64c7cb05 lea rcx, [rip + 0x5cbc764]
1401155df: 4989f8 mov r8, rdi
1401155e2: e8390b9d02 call 0x142ae6120
1401155e7: 90 nop
1401155e8: 4885c0 test rax, rax
1401155eb: 7507 jne 0x1401155f4
1401155ed: 488b059cfcf007 mov rax, qword ptr [rip + 0x7f0fc9c]
1401155f4: 803803 cmp byte ptr [rax], 3
1401155f7: 0f8527030000 jne 0x140115924
1401155fd: 488b4810 mov rcx, qword ptr [rax + 0x10]
140115601: 488b4018 mov rax, qword ptr [rax + 0x18]
140115605: 4883f804 cmp rax, 4
140115609: 0f84fd020000 je 0x14011590c
14011560f: 4883f805 cmp rax, 5
140115613: 0f850b030000 jne 0x140115924
140115619: 8b01 mov eax, dword ptr [rcx]
14011561b: ba646f6e75 mov edx, 0x756e6f64
140115620: 31d0 xor eax, edx
140115622: 0fb64904 movzx ecx, byte ptr [rcx + 4]
140115626: 83f174 xor ecx, 0x74
140115629: 09c1 or ecx, eax
14011562b: 0f85f3020000 jne 0x140115924
140115631: ba05000000 mov edx, 5
140115636: 488d0d13c7cb05 lea rcx, [rip + 0x5cbc713]
14011563d: 4989f8 mov r8, rdi
140115640: e8db0a9d02 call 0x142ae6120
140115645: 90 nop
140115646: 4885c0 test rax, rax
140115649: 7507 jne 0x140115652
14011564b: 488b053efcf007 mov rax, qword ptr [rip + 0x7f0fc3e]
140115652: 450f57e4 xorps xmm12, xmm12
140115656: 803802 cmp byte ptr [rax], 2
140115659: 0f85d6080000 jne 0x140115f35
14011565f: 488b4808 mov rcx, qword ptr [rax + 8]
140115663: 4883f902 cmp rcx, 2
140115667: 0f8482080000 je 0x140115eef
14011566d: 83f901 cmp ecx, 1
140115670: 0f859c080000 jne 0x140115f12
140115676: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14011567c: e973080000 jmp 0x140115ef4
140115681: 0fb701 movzx eax, word ptr [rcx]
140115684: 35687a0000 xor eax, 0x7a68
140115689: 0fb64902 movzx ecx, byte ptr [rcx + 2]
14011568d: 83f174 xor ecx, 0x74
140115690: 6609c1 or cx, ax
140115693: 756b jne 0x140115700
140115695: ba01000000 mov edx, 1
14011569a: 488d0d9cc6cb05 lea rcx, [rip + 0x5cbc69c]
1401156a1: 4989f8 mov r8, rdi
1401156a4: e8770a9d02 call 0x142ae6120
1401156a9: 90 nop
1401156aa: 4885c0 test rax, rax
1401156ad: 7507 jne 0x1401156b6
1401156af: 488b05dafbf007 mov rax, qword ptr [rip + 0x7f0fbda]
1401156b6: 660f57c0 xorpd xmm0, xmm0
1401156ba: 803802 cmp byte ptr [rax], 2
1401156bd: 0f85c8020000 jne 0x14011598b
1401156c3: 488b4808 mov rcx, qword ptr [rax + 8]
1401156c7: 4885c9 test rcx, rcx
1401156ca: 0f8419020000 je 0x1401158e9
1401156d0: 83f901 cmp ecx, 1
1401156d3: 0f85a9020000 jne 0x140115982
1401156d9: 0f57c0 xorps xmm0, xmm0
1401156dc: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401156e2: e9a0020000 jmp 0x140115987
1401156e7: 8b01 mov eax, dword ptr [rcx]
1401156e9: ba687a656e mov edx, 0x6e657a68
1401156ee: 31d0 xor eax, edx
1401156f0: 0fb64904 movzx ecx, byte ptr [rcx + 4]
1401156f4: 83f164 xor ecx, 0x64
1401156f7: 09c1 or ecx, eax
1401156f9: 0f8468010000 je 0x140115867
1401156ff: 90 nop
140115700: 458927 mov dword ptr [r15], r12d
140115703: 498b7508 mov rsi, qword ptr [r13 + 8]
140115707: 498b5d10 mov rbx, qword ptr [r13 + 0x10]
14011570b: 49c7451000000000 mov qword ptr [r13 + 0x10], 0
140115713: 4885db test rbx, rbx
140115716: 0f842c010000 je 0x140115848
14011571c: 4d89ef mov r15, r13
14011571f: 31ff xor edi, edi
140115721: eb19 jmp 0x14011573c
140115723: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140115730: 48ffc7 inc rdi
140115733: 4839df cmp rdi, rbx
140115736: 0f84f4000000 je 0x140115830
14011573c: 4989fe mov r14, rdi
14011573f: 49c1e607 shl r14, 7
140115743: 4e8b643610 mov r12, qword ptr [rsi + r14 + 0x10]
140115748: 4d85e4 test r12, r12
14011574b: 7443 je 0x140115790
14011574d: 4e8b6c3608 mov r13, qword ptr [rsi + r14 + 8]
140115752: 4983c508 add r13, 8
140115756: eb11 jmp 0x140115769
140115758: 0f1f840000000000 nop dword ptr [rax + rax]
140115760: 4983c530 add r13, 0x30
140115764: 49ffcc dec r12
140115767: 7427 je 0x140115790
140115769: 498b45f8 mov rax, qword ptr [r13 - 8]
14011576d: 4885c0 test rax, rax
140115770: 74ee je 0x140115760
140115772: 498b4d00 mov rcx, qword ptr [r13]
140115776: 48c1e002 shl rax, 2
14011577a: 488d14c0 lea rdx, [rax + rax*8]
14011577e: 41b804000000 mov r8d, 4
140115784: e847caeeff call 0x1400021d0
140115789: ebd5 jmp 0x140115760
14011578b: 0f1f440000 nop dword ptr [rax + rax]
140115790: 4901f6 add r14, rsi
140115793: 498b06 mov rax, qword ptr [r14]
140115796: 4885c0 test rax, rax
140115799: 7417 je 0x1401157b2
14011579b: 498b4e08 mov rcx, qword ptr [r14 + 8]
14011579f: 48c1e004 shl rax, 4
1401157a3: 488d1440 lea rdx, [rax + rax*2]
1401157a7: 41b808000000 mov r8d, 8
1401157ad: e81ecaeeff call 0x1400021d0
1401157b2: 4d8b6628 mov r12, qword ptr [r14 + 0x28]
1401157b6: 4d85e4 test r12, r12
1401157b9: 7445 je 0x140115800
1401157bb: 4d8b6e20 mov r13, qword ptr [r14 + 0x20]
1401157bf: 4983c508 add r13, 8
1401157c3: eb14 jmp 0x1401157d9
1401157c5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401157d0: 4983c530 add r13, 0x30
1401157d4: 49ffcc dec r12
1401157d7: 7427 je 0x140115800
1401157d9: 498b45f8 mov rax, qword ptr [r13 - 8]
1401157dd: 4885c0 test rax, rax
1401157e0: 74ee je 0x1401157d0
1401157e2: 498b4d00 mov rcx, qword ptr [r13]
1401157e6: 48c1e002 shl rax, 2
1401157ea: 488d14c0 lea rdx, [rax + rax*8]
1401157ee: 41b804000000 mov r8d, 4
1401157f4: e8d7c9eeff call 0x1400021d0
1401157f9: ebd5 jmp 0x1401157d0
1401157fb: 0f1f440000 nop dword ptr [rax + rax]
140115800: 498b4618 mov rax, qword ptr [r14 + 0x18]
140115804: 4885c0 test rax, rax
140115807: 0f8423ffffff je 0x140115730
14011580d: 498b4e20 mov rcx, qword ptr [r14 + 0x20]
140115811: 48c1e004 shl rax, 4
140115815: 488d1440 lea rdx, [rax + rax*2]
140115819: 41b808000000 mov r8d, 8
14011581f: e8acc9eeff call 0x1400021d0
140115824: e907ffffff jmp 0x140115730
140115829: 0f1f8000000000 nop dword ptr [rax]
140115830: 4d89fd mov r13, r15
140115833: 4c8bbdb0000000 mov r15, qword ptr [rbp + 0xb0]
14011583a: 448ba5c8000000 mov r12d, dword ptr [rbp + 0xc8]
140115841: 488dbd80000000 lea rdi, [rbp + 0x80]
140115848: 4889f9 mov rcx, rdi
14011584b: e8c0f1fcff call 0x1400e4a10
140115850: 90 nop
140115851: 488b45c8 mov rax, qword ptr [rbp - 0x38]
140115855: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
140115859: 4839c8 cmp rax, rcx
14011585c: 0f85eefcffff jne 0x140115550
140115862: e9a00e0000 jmp 0x140116707
140115867: ba02000000 mov edx, 2
14011586c: 488d0dcec4cb05 lea rcx, [rip + 0x5cbc4ce]
140115873: 4989f8 mov r8, rdi
140115876: e8a5089d02 call 0x142ae6120
14011587b: 90 nop
14011587c: 4885c0 test rax, rax
14011587f: 7507 jne 0x140115888
140115881: 488b0508faf007 mov rax, qword ptr [rip + 0x7f0fa08]
140115888: 803802 cmp byte ptr [rax], 2
14011588b: 7507 jne 0x140115894
14011588d: 4883780800 cmp qword ptr [rax + 8], 0
140115892: 744f je 0x1401158e3
140115894: 31c0 xor eax, eax
140115896: 458927 mov dword ptr [r15], r12d
140115899: 498b4d08 mov rcx, qword ptr [r13 + 8]
14011589d: 498b5510 mov rdx, qword ptr [r13 + 0x10]
1401158a1: 48c1e207 shl rdx, 7
1401158a5: 4531c0 xor r8d, r8d
1401158a8: 4989c9 mov r9, rcx
1401158ab: 0f1f440000 nop dword ptr [rax + rax]
1401158b0: 4c39c2 cmp rdx, r8
1401158b3: 7493 je 0x140115848
1401158b5: 4983e880 sub r8, -0x80
1401158b9: 49394138 cmp qword ptr [r9 + 0x38], rax
1401158bd: 4d8d8980000000 lea r9, [r9 + 0x80]
1401158c4: 75ea jne 0x1401158b0
1401158c6: 42c74401b001000000 mov dword ptr [rcx + r8 - 0x50], 1
1401158cf: f30f1085ac000000 movss xmm0, dword ptr [rbp + 0xac]
1401158d7: f3420f114401b4 movss dword ptr [rcx + r8 - 0x4c], xmm0
1401158de: e965ffffff jmp 0x140115848
1401158e3: 488b4010 mov rax, qword ptr [rax + 0x10]
1401158e7: ebad jmp 0x140115896
1401158e9: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401158ee: 410f14c0 unpcklps xmm0, xmm8
1401158f2: 66410f5cc1 subpd xmm0, xmm9
1401158f7: 660f28c8 movapd xmm1, xmm0
1401158fb: 660f15c8 unpckhpd xmm1, xmm0
1401158ff: f20f58c8 addsd xmm1, xmm0
140115903: 0f57c0 xorps xmm0, xmm0
140115906: f20f5ac1 cvtsd2ss xmm0, xmm1
14011590a: eb7f jmp 0x14011598b
14011590c: 81396c696e65 cmp dword ptr [rcx], 0x656e696c
140115912: 0f8438050000 je 0x140115e50
140115918: 8139636f6e65 cmp dword ptr [rcx], 0x656e6f63
14011591e: 0f8478050000 je 0x140115e9c
140115924: ba01000000 mov edx, 1
140115929: 488d0d18c4cb05 lea rcx, [rip + 0x5cbc418]
140115930: 4989f8 mov r8, rdi
140115933: e8e8079d02 call 0x142ae6120
140115938: 90 nop
140115939: 4885c0 test rax, rax
14011593c: 7507 jne 0x140115945
14011593e: 488b054bf9f007 mov rax, qword ptr [rip + 0x7f0f94b]
140115945: 31f6 xor esi, esi
140115947: 450f57e4 xorps xmm12, xmm12
14011594b: 803802 cmp byte ptr [rax], 2
14011594e: 0f8532070000 jne 0x140116086
140115954: 488b4808 mov rcx, qword ptr [rax + 8]
140115958: 4883f902 cmp rcx, 2
14011595c: 0f84b3040000 je 0x140115e15
140115962: 83f901 cmp ecx, 1
140115965: 0f85bd040000 jne 0x140115e28
14011596b: 0f57c0 xorps xmm0, xmm0
14011596e: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140115974: 450f57e4 xorps xmm12, xmm12
140115978: f2440f5ae0 cvtsd2ss xmm12, xmm0
14011597d: e904070000 jmp 0x140116086
140115982: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115987: f20f5ac0 cvtsd2ss xmm0, xmm0
14011598b: f3410f114518 movss dword ptr [r13 + 0x18], xmm0
140115991: 458927 mov dword ptr [r15], r12d
140115994: f3410f11751c movss dword ptr [r13 + 0x1c], xmm6
14011599a: ba01000000 mov edx, 1
14011599f: 488d0d98c3cb05 lea rcx, [rip + 0x5cbc398]
1401159a6: 4989f8 mov r8, rdi
1401159a9: e872079d02 call 0x142ae6120
1401159ae: 90 nop
1401159af: 4885c0 test rax, rax
1401159b2: 7507 jne 0x1401159bb
1401159b4: 488b05d5f8f007 mov rax, qword ptr [rip + 0x7f0f8d5]
1401159bb: 803804 cmp byte ptr [rax], 4
1401159be: 0f857f020000 jne 0x140115c43
1401159c4: 488b4818 mov rcx, qword ptr [rax + 0x18]
1401159c8: 4885c9 test rcx, rcx
1401159cb: 0f8472020000 je 0x140115c43
1401159d1: 4c8b4010 mov r8, qword ptr [rax + 0x10]
1401159d5: 48c1e105 shl rcx, 5
1401159d9: 4c01c1 add rcx, r8
1401159dc: eb20 jmp 0x1401159fe
1401159de: f2410f104210 movsd xmm0, qword ptr [r10 + 0x10]
1401159e4: 0f57d2 xorps xmm2, xmm2
1401159e7: f20f5ad0 cvtsd2ss xmm2, xmm0
1401159eb: f3420f11540aec movss dword ptr [rdx + r9 - 0x14], xmm2
1401159f2: 4989c0 mov r8, rax
1401159f5: 4839c8 cmp rax, rcx
1401159f8: 0f8445020000 je 0x140115c43
1401159fe: 4983781800 cmp qword ptr [r8 + 0x18], 0
140115a03: 488b0586f8f007 mov rax, qword ptr [rip + 0x7f0f886]
140115a0a: 7404 je 0x140115a10
140115a0c: 498b4010 mov rax, qword ptr [r8 + 0x10]
140115a10: 41803804 cmp byte ptr [r8], 4
140115a14: 480f450574f8f007 cmovne rax, qword ptr [rip + 0x7f0f874]
140115a1c: 803802 cmp byte ptr [rax], 2
140115a1f: 750b jne 0x140115a2c
140115a21: 4883780800 cmp qword ptr [rax + 8], 0
140115a26: 0f8485000000 je 0x140115ab1
140115a2c: 4531d2 xor r10d, r10d
140115a2f: 498d4020 lea rax, [r8 + 0x20]
140115a33: 458927 mov dword ptr [r15], r12d
140115a36: 498b5508 mov rdx, qword ptr [r13 + 8]
140115a3a: 4d8b5d10 mov r11, qword ptr [r13 + 0x10]
140115a3e: 49c1e307 shl r11, 7
140115a42: 4531c9 xor r9d, r9d
140115a45: 4889d6 mov rsi, rdx
140115a48: 0f1f840000000000 nop dword ptr [rax + rax]
140115a50: 4d39cb cmp r11, r9
140115a53: 749d je 0x1401159f2
140115a55: 4983e980 sub r9, -0x80
140115a59: 4c395638 cmp qword ptr [rsi + 0x38], r10
140115a5d: 488db680000000 lea rsi, [rsi + 0x80]
140115a64: 75ea jne 0x140115a50
140115a66: 4d8b5818 mov r11, qword ptr [r8 + 0x18]
140115a6a: 4d8b5010 mov r10, qword ptr [r8 + 0x10]
140115a6e: 498d7220 lea rsi, [r10 + 0x20]
140115a72: 4983fb02 cmp r11, 2
140115a76: 4c8b3513f8f007 mov r14, qword ptr [rip + 0x7f0f813]
140115a7d: 490f42f6 cmovb rsi, r14
140115a81: 410fb618 movzx ebx, byte ptr [r8]
140115a85: 80fb04 cmp bl, 4
140115a88: 490f45f6 cmovne rsi, r14
140115a8c: 0f57c0 xorps xmm0, xmm0
140115a8f: 803e02 cmp byte ptr [rsi], 2
140115a92: 0f57c9 xorps xmm1, xmm1
140115a95: 7556 jne 0x140115aed
140115a97: 488b7e08 mov rdi, qword ptr [rsi + 8]
140115a9b: 4883ff02 cmp rdi, 2
140115a9f: 7419 je 0x140115aba
140115aa1: 83ff01 cmp edi, 1
140115aa4: 7522 jne 0x140115ac8
140115aa6: 0f57c9 xorps xmm1, xmm1
140115aa9: f2480f2a4e10 cvtsi2sd xmm1, qword ptr [rsi + 0x10]
140115aaf: eb0e jmp 0x140115abf
140115ab1: 4c8b5010 mov r10, qword ptr [rax + 0x10]
140115ab5: e975ffffff jmp 0x140115a2f
140115aba: f20f104e10 movsd xmm1, qword ptr [rsi + 0x10]
140115abf: 488dbd80000000 lea rdi, [rbp + 0x80]
140115ac6: eb21 jmp 0x140115ae9
140115ac8: 488dbd80000000 lea rdi, [rbp + 0x80]
140115acf: f20f105610 movsd xmm2, qword ptr [rsi + 0x10]
140115ad4: 410f14d0 unpcklps xmm2, xmm8
140115ad8: 66410f5cd1 subpd xmm2, xmm9
140115add: 660f28ca movapd xmm1, xmm2
140115ae1: 660f15ca unpckhpd xmm1, xmm2
140115ae5: f20f58ca addsd xmm1, xmm2
140115ae9: f20f5ac9 cvtsd2ss xmm1, xmm1
140115aed: 498d7240 lea rsi, [r10 + 0x40]
140115af1: 4983fb03 cmp r11, 3
140115af5: 4c8b3594f7f007 mov r14, qword ptr [rip + 0x7f0f794]
140115afc: 490f42f6 cmovb rsi, r14
140115b00: 80fb04 cmp bl, 4
140115b03: 490f45f6 cmovne rsi, r14
140115b07: 803e02 cmp byte ptr [rsi], 2
140115b0a: 754d jne 0x140115b59
140115b0c: 488b7e08 mov rdi, qword ptr [rsi + 8]
140115b10: 4883ff02 cmp rdi, 2
140115b14: 7410 je 0x140115b26
140115b16: 83ff01 cmp edi, 1
140115b19: 7519 jne 0x140115b34
140115b1b: 0f57c0 xorps xmm0, xmm0
140115b1e: f2480f2a4610 cvtsi2sd xmm0, qword ptr [rsi + 0x10]
140115b24: eb05 jmp 0x140115b2b
140115b26: f20f104610 movsd xmm0, qword ptr [rsi + 0x10]
140115b2b: 488dbd80000000 lea rdi, [rbp + 0x80]
140115b32: eb21 jmp 0x140115b55
140115b34: 488dbd80000000 lea rdi, [rbp + 0x80]
140115b3b: f20f105610 movsd xmm2, qword ptr [rsi + 0x10]
140115b40: 410f14d0 unpcklps xmm2, xmm8
140115b44: 66410f5cd1 subpd xmm2, xmm9
140115b49: 660f28c2 movapd xmm0, xmm2
140115b4d: 660f15c2 unpckhpd xmm0, xmm2
140115b51: f20f58c2 addsd xmm0, xmm2
140115b55: f20f5ac0 cvtsd2ss xmm0, xmm0
140115b59: 4983c260 add r10, 0x60
140115b5d: 4983fb04 cmp r11, 4
140115b61: 4c8b1d28f7f007 mov r11, qword ptr [rip + 0x7f0f728]
140115b68: 4d0f42d3 cmovb r10, r11
140115b6c: 80fb04 cmp bl, 4
140115b6f: 4d0f45d3 cmovne r10, r11
140115b73: 660f57d2 xorpd xmm2, xmm2
140115b77: 41803a02 cmp byte ptr [r10], 2
140115b7b: 0f57db xorps xmm3, xmm3
140115b7e: 7542 jne 0x140115bc2
140115b80: 4d8b5a08 mov r11, qword ptr [r10 + 8]
140115b84: 4983fb02 cmp r11, 2
140115b88: 7411 je 0x140115b9b
140115b8a: 4183fb01 cmp r11d, 1
140115b8e: 7513 jne 0x140115ba3
140115b90: 0f57db xorps xmm3, xmm3
140115b93: f2490f2a5a10 cvtsi2sd xmm3, qword ptr [r10 + 0x10]
140115b99: eb23 jmp 0x140115bbe
140115b9b: f2410f105a10 movsd xmm3, qword ptr [r10 + 0x10]
140115ba1: eb1b jmp 0x140115bbe
140115ba3: f2410f106210 movsd xmm4, qword ptr [r10 + 0x10]
140115ba9: 410f14e0 unpcklps xmm4, xmm8
140115bad: 66410f5ce1 subpd xmm4, xmm9
140115bb2: 660f28dc movapd xmm3, xmm4
140115bb6: 660f15dc unpckhpd xmm3, xmm4
140115bba: f20f58dc addsd xmm3, xmm4
140115bbe: f20f5adb cvtsd2ss xmm3, xmm3
140115bc2: f3420f114c0ae0 movss dword ptr [rdx + r9 - 0x20], xmm1
140115bc9: f3420f11440ae4 movss dword ptr [rdx + r9 - 0x1c], xmm0
140115bd0: f3420f115c0ae8 movss dword ptr [rdx + r9 - 0x18], xmm3
140115bd7: 4d8b5010 mov r10, qword ptr [r8 + 0x10]
140115bdb: 4983ea80 sub r10, -0x80
140115bdf: 4983781805 cmp qword ptr [r8 + 0x18], 5
140115be4: 4c8b1da5f6f007 mov r11, qword ptr [rip + 0x7f0f6a5]
140115beb: 4d0f42d3 cmovb r10, r11
140115bef: 41803804 cmp byte ptr [r8], 4
140115bf3: 4d0f45d3 cmovne r10, r11
140115bf7: 41803a02 cmp byte ptr [r10], 2
140115bfb: 0f85eafdffff jne 0x1401159eb
140115c01: 4d8b4208 mov r8, qword ptr [r10 + 8]
140115c05: 4983f802 cmp r8, 2
140115c09: 0f84cffdffff je 0x1401159de
140115c0f: 4183f801 cmp r8d, 1
140115c13: 750e jne 0x140115c23
140115c15: 0f57c0 xorps xmm0, xmm0
140115c18: f2490f2a4210 cvtsi2sd xmm0, qword ptr [r10 + 0x10]
140115c1e: e9c1fdffff jmp 0x1401159e4
140115c23: f2410f104a10 movsd xmm1, qword ptr [r10 + 0x10]
140115c29: 410f14c8 unpcklps xmm1, xmm8
140115c2d: 66410f5cc9 subpd xmm1, xmm9
140115c32: 660f28c1 movapd xmm0, xmm1
140115c36: 660f15c1 unpckhpd xmm0, xmm1
140115c3a: f20f58c1 addsd xmm0, xmm1
140115c3e: e9a1fdffff jmp 0x1401159e4
140115c43: ba02000000 mov edx, 2
140115c48: 488d0df0c0cb05 lea rcx, [rip + 0x5cbc0f0]
140115c4f: 4989f8 mov r8, rdi
140115c52: e8c9049d02 call 0x142ae6120
140115c57: 90 nop
140115c58: 4885c0 test rax, rax
140115c5b: 7507 jne 0x140115c64
140115c5d: 488b052cf6f007 mov rax, qword ptr [rip + 0x7f0f62c]
140115c64: 803804 cmp byte ptr [rax], 4
140115c67: 7527 jne 0x140115c90
140115c69: 488b5010 mov rdx, qword ptr [rax + 0x10]
140115c6d: 4c8b4018 mov r8, qword ptr [rax + 0x18]
140115c71: 49c1e005 shl r8, 5
140115c75: 4901d0 add r8, rdx
140115c78: 488d4df0 lea rcx, [rbp - 0x10]
140115c7c: e88f0b0a00 call 0x1401b6810
140115c81: 90 nop
140115c82: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
140115c86: 488b4df8 mov rcx, qword ptr [rbp - 8]
140115c8a: 488b4500 mov rax, qword ptr [rbp]
140115c8e: eb09 jmp 0x140115c99
140115c90: b908000000 mov ecx, 8
140115c95: 31d2 xor edx, edx
140115c97: 31c0 xor eax, eax
140115c99: 458927 mov dword ptr [r15], r12d
140115c9c: 4d8b4d08 mov r9, qword ptr [r13 + 8]
140115ca0: 4d8b4510 mov r8, qword ptr [r13 + 0x10]
140115ca4: 49c1e007 shl r8, 7
140115ca8: 4d01c8 add r8, r9
140115cab: 4989c2 mov r10, rax
140115cae: 49bbf8ffffffffffff0f movabs r11, 0xffffffffffffff8
140115cb8: 4d21da and r10, r11
140115cbb: c1e003 shl eax, 3
140115cbe: 83e038 and eax, 0x38
140115cc1: eb18 jmp 0x140115cdb
140115cc3: 31f6 xor esi, esi
140115cc5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
140115cd0: 4188737c mov byte ptr [r11 + 0x7c], sil
140115cd4: 488dbd80000000 lea rdi, [rbp + 0x80]
140115cdb: 4d39c1 cmp r9, r8
140115cde: 0f8414010000 je 0x140115df8
140115ce4: 4d89cb mov r11, r9
140115ce7: 4981c180000000 add r9, 0x80
140115cee: 41807b3000 cmp byte ptr [r11 + 0x30], 0
140115cf3: 75e6 jne 0x140115cdb
140115cf5: 498b7b38 mov rdi, qword ptr [r11 + 0x38]
140115cf9: 31db xor ebx, ebx
140115cfb: 0f1f440000 nop dword ptr [rax + rax]
140115d00: 4939da cmp r10, rbx
140115d03: 7440 je 0x140115d45
140115d05: 40b601 mov sil, 1
140115d08: 48393cd9 cmp qword ptr [rcx + rbx*8], rdi
140115d0c: 74c2 je 0x140115cd0
140115d0e: 48397cd908 cmp qword ptr [rcx + rbx*8 + 8], rdi
140115d13: 74bb je 0x140115cd0
140115d15: 48397cd910 cmp qword ptr [rcx + rbx*8 + 0x10], rdi
140115d1a: 74b4 je 0x140115cd0
140115d1c: 48397cd918 cmp qword ptr [rcx + rbx*8 + 0x18], rdi
140115d21: 74ad je 0x140115cd0
140115d23: 48397cd920 cmp qword ptr [rcx + rbx*8 + 0x20], rdi
140115d28: 74a6 je 0x140115cd0
140115d2a: 48397cd928 cmp qword ptr [rcx + rbx*8 + 0x28], rdi
140115d2f: 749f je 0x140115cd0
140115d31: 48397cd930 cmp qword ptr [rcx + rbx*8 + 0x30], rdi
140115d36: 7498 je 0x140115cd0
140115d38: 48397cd938 cmp qword ptr [rcx + rbx*8 + 0x38], rdi
140115d3d: 488d5b08 lea rbx, [rbx + 8]
140115d41: 75bd jne 0x140115d00
140115d43: eb8b jmp 0x140115cd0
140115d45: 4885c0 test rax, rax
140115d48: 0f8475ffffff je 0x140115cc3
140115d4e: 4a393cd1 cmp qword ptr [rcx + r10*8], rdi
140115d52: 400f94c6 sete sil
140115d56: 0f8474ffffff je 0x140115cd0
140115d5c: 83f808 cmp eax, 8
140115d5f: 0f846bffffff je 0x140115cd0
140115d65: 4a397cd108 cmp qword ptr [rcx + r10*8 + 8], rdi
140115d6a: 400f94c6 sete sil
140115d6e: 0f845cffffff je 0x140115cd0
140115d74: 83f810 cmp eax, 0x10
140115d77: 0f8453ffffff je 0x140115cd0
140115d7d: 4a397cd110 cmp qword ptr [rcx + r10*8 + 0x10], rdi
140115d82: 400f94c6 sete sil
140115d86: 0f8444ffffff je 0x140115cd0
140115d8c: 83f818 cmp eax, 0x18
140115d8f: 0f843bffffff je 0x140115cd0
140115d95: 4a397cd118 cmp qword ptr [rcx + r10*8 + 0x18], rdi
140115d9a: 400f94c6 sete sil
140115d9e: 0f842cffffff je 0x140115cd0
140115da4: 83f820 cmp eax, 0x20
140115da7: 0f8423ffffff je 0x140115cd0
140115dad: 4a397cd120 cmp qword ptr [rcx + r10*8 + 0x20], rdi
140115db2: 400f94c6 sete sil
140115db6: 0f8414ffffff je 0x140115cd0
140115dbc: 83f828 cmp eax, 0x28
140115dbf: 0f840bffffff je 0x140115cd0
140115dc5: 4a397cd128 cmp qword ptr [rcx + r10*8 + 0x28], rdi
140115dca: 400f94c6 sete sil
140115dce: 0f84fcfeffff je 0x140115cd0
140115dd4: 83f830 cmp eax, 0x30
140115dd7: 0f84f3feffff je 0x140115cd0
140115ddd: 31f6 xor esi, esi
140115ddf: 83f838 cmp eax, 0x38
140115de2: 400f95c6 setne sil
140115de6: 4a397cd130 cmp qword ptr [rcx + r10*8 + 0x30], rdi
140115deb: bf01000000 mov edi, 1
140115df0: 0f44f7 cmove esi, edi
140115df3: e9d8feffff jmp 0x140115cd0
140115df8: 4885d2 test rdx, rdx
140115dfb: 0f8447faffff je 0x140115848
140115e01: 48c1e203 shl rdx, 3
140115e05: 41b808000000 mov r8d, 8
140115e0b: e8c0c3eeff call 0x1400021d0
140115e10: e933faffff jmp 0x140115848
140115e15: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115e1a: 450f57e4 xorps xmm12, xmm12
140115e1e: f2440f5ae0 cvtsd2ss xmm12, xmm0
140115e23: e95e020000 jmp 0x140116086
140115e28: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140115e2d: 410f14c8 unpcklps xmm1, xmm8
140115e31: 66410f5cc9 subpd xmm1, xmm9
140115e36: 660f28c1 movapd xmm0, xmm1
140115e3a: 660f15c1 unpckhpd xmm0, xmm1
140115e3e: f20f58c1 addsd xmm0, xmm1
140115e42: 450f57e4 xorps xmm12, xmm12
140115e46: f2440f5ae0 cvtsd2ss xmm12, xmm0
140115e4b: e936020000 jmp 0x140116086
140115e50: ba03000000 mov edx, 3
140115e55: 488d0df0becb05 lea rcx, [rip + 0x5cbbef0]
140115e5c: 4989f8 mov r8, rdi
140115e5f: e8bc029d02 call 0x142ae6120
140115e64: 90 nop
140115e65: 4885c0 test rax, rax
140115e68: 7507 jne 0x140115e71
140115e6a: 488b051ff4f007 mov rax, qword ptr [rip + 0x7f0f41f]
140115e71: 450f57e4 xorps xmm12, xmm12
140115e75: 803802 cmp byte ptr [rax], 2
140115e78: 0f851a010000 jne 0x140115f98
140115e7e: 488b4808 mov rcx, qword ptr [rax + 8]
140115e82: 4883f902 cmp rcx, 2
140115e86: 7477 je 0x140115eff
140115e88: 83f901 cmp ecx, 1
140115e8b: 0f85e4000000 jne 0x140115f75
140115e91: 0f57c0 xorps xmm0, xmm0
140115e94: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140115e9a: eb68 jmp 0x140115f04
140115e9c: ba01000000 mov edx, 1
140115ea1: 488d0da0becb05 lea rcx, [rip + 0x5cbbea0]
140115ea8: 4989f8 mov r8, rdi
140115eab: e870029d02 call 0x142ae6120
140115eb0: 90 nop
140115eb1: 4885c0 test rax, rax
140115eb4: 7507 jne 0x140115ebd
140115eb6: 488b05d3f3f007 mov rax, qword ptr [rip + 0x7f0f3d3]
140115ebd: 450f57e4 xorps xmm12, xmm12
140115ec1: 803802 cmp byte ptr [rax], 2
140115ec4: 0f853e010000 jne 0x140116008
140115eca: 488b4808 mov rcx, qword ptr [rax + 8]
140115ece: 4883f902 cmp rcx, 2
140115ed2: 0f84fd000000 je 0x140115fd5
140115ed8: 83f901 cmp ecx, 1
140115edb: 0f8504010000 jne 0x140115fe5
140115ee1: 0f57c0 xorps xmm0, xmm0
140115ee4: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140115eea: e9eb000000 jmp 0x140115fda
140115eef: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115ef4: 450f57e4 xorps xmm12, xmm12
140115ef8: f2440f5ae0 cvtsd2ss xmm12, xmm0
140115efd: eb36 jmp 0x140115f35
140115eff: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115f04: 450f57e4 xorps xmm12, xmm12
140115f08: f2440f5ae0 cvtsd2ss xmm12, xmm0
140115f0d: e986000000 jmp 0x140115f98
140115f12: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115f17: 410f14c0 unpcklps xmm0, xmm8
140115f1b: 66410f5cc1 subpd xmm0, xmm9
140115f20: 660f28c8 movapd xmm1, xmm0
140115f24: 660f15c8 unpckhpd xmm1, xmm0
140115f28: f20f58c8 addsd xmm1, xmm0
140115f2c: 450f57e4 xorps xmm12, xmm12
140115f30: f2440f5ae1 cvtsd2ss xmm12, xmm1
140115f35: ba01000000 mov edx, 1
140115f3a: 488d0d07becb05 lea rcx, [rip + 0x5cbbe07]
140115f41: 4989f8 mov r8, rdi
140115f44: e8d7019d02 call 0x142ae6120
140115f49: 90 nop
140115f4a: 4885c0 test rax, rax
140115f4d: 7507 jne 0x140115f56
140115f4f: 488b053af3f007 mov rax, qword ptr [rip + 0x7f0f33a]
140115f56: be01000000 mov esi, 1
140115f5b: 660f57c0 xorpd xmm0, xmm0
140115f5f: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
140115f67: 803802 cmp byte ptr [rax], 2
140115f6a: 0f84cf000000 je 0x14011603f
140115f70: e911010000 jmp 0x140116086
140115f75: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115f7a: 410f14c0 unpcklps xmm0, xmm8
140115f7e: 66410f5cc1 subpd xmm0, xmm9
140115f83: 660f28c8 movapd xmm1, xmm0
140115f87: 660f15c8 unpckhpd xmm1, xmm0
140115f8b: f20f58c8 addsd xmm1, xmm0
140115f8f: 450f57e4 xorps xmm12, xmm12
140115f93: f2440f5ae1 cvtsd2ss xmm12, xmm1
140115f98: ba01000000 mov edx, 1
140115f9d: 488d0dabbdcb05 lea rcx, [rip + 0x5cbbdab]
140115fa4: 4989f8 mov r8, rdi
140115fa7: e874019d02 call 0x142ae6120
140115fac: 90 nop
140115fad: 4885c0 test rax, rax
140115fb0: 7507 jne 0x140115fb9
140115fb2: 488b05d7f2f007 mov rax, qword ptr [rip + 0x7f0f2d7]
140115fb9: be02000000 mov esi, 2
140115fbe: 660f57c0 xorpd xmm0, xmm0
140115fc2: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
140115fca: 803802 cmp byte ptr [rax], 2
140115fcd: 0f85b3000000 jne 0x140116086
140115fd3: eb6a jmp 0x14011603f
140115fd5: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115fda: 450f57e4 xorps xmm12, xmm12
140115fde: f2440f5ae0 cvtsd2ss xmm12, xmm0
140115fe3: eb23 jmp 0x140116008
140115fe5: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140115fea: 410f14c0 unpcklps xmm0, xmm8
140115fee: 66410f5cc1 subpd xmm0, xmm9
140115ff3: 660f28c8 movapd xmm1, xmm0
140115ff7: 660f15c8 unpckhpd xmm1, xmm0
140115ffb: f20f58c8 addsd xmm1, xmm0
140115fff: 450f57e4 xorps xmm12, xmm12
140116003: f2440f5ae1 cvtsd2ss xmm12, xmm1
140116008: ba03000000 mov edx, 3
14011600d: 488d0d35bdcb05 lea rcx, [rip + 0x5cbbd35]
140116014: 4989f8 mov r8, rdi
140116017: e804019d02 call 0x142ae6120
14011601c: 90 nop
14011601d: 4885c0 test rax, rax
140116020: 7507 jne 0x140116029
140116022: 488b0567f2f007 mov rax, qword ptr [rip + 0x7f0f267]
140116029: be03000000 mov esi, 3
14011602e: 660f57c0 xorpd xmm0, xmm0
140116032: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
14011603a: 803802 cmp byte ptr [rax], 2
14011603d: 7547 jne 0x140116086
14011603f: 488b4808 mov rcx, qword ptr [rax + 8]
140116043: 4883f902 cmp rcx, 2
140116047: 7410 je 0x140116059
140116049: 83f901 cmp ecx, 1
14011604c: 7512 jne 0x140116060
14011604e: 0f57c0 xorps xmm0, xmm0
140116051: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140116057: eb21 jmp 0x14011607a
140116059: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14011605e: eb1a jmp 0x14011607a
140116060: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140116065: 410f14c8 unpcklps xmm1, xmm8
140116069: 66410f5cc9 subpd xmm1, xmm9
14011606e: 660f28c1 movapd xmm0, xmm1
140116072: 660f15c1 unpckhpd xmm0, xmm1
140116076: f20f58c1 addsd xmm0, xmm1
14011607a: f20f5ac0 cvtsd2ss xmm0, xmm0
14011607e: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
140116086: ba04000000 mov edx, 4
14011608b: 488d0dc3bccb05 lea rcx, [rip + 0x5cbbcc3]
140116092: 4989f8 mov r8, rdi
140116095: e886009d02 call 0x142ae6120
14011609a: 90 nop
14011609b: 4885c0 test rax, rax
14011609e: 7507 jne 0x1401160a7
1401160a0: 488b05e9f1f007 mov rax, qword ptr [rip + 0x7f0f1e9]
1401160a7: 803803 cmp byte ptr [rax], 3
1401160aa: 7530 jne 0x1401160dc
1401160ac: 488b4810 mov rcx, qword ptr [rax + 0x10]
1401160b0: 488b4018 mov rax, qword ptr [rax + 0x18]
1401160b4: 4883f804 cmp rax, 4
1401160b8: 0f8499000000 je 0x140116157
1401160be: 4883f805 cmp rax, 5
1401160c2: 7518 jne 0x1401160dc
1401160c4: 8b01 mov eax, dword ptr [rcx]
1401160c6: ba746f7765 mov edx, 0x65776f74
1401160cb: 31d0 xor eax, edx
1401160cd: 0fb64904 movzx ecx, byte ptr [rcx + 4]
1401160d1: 83f172 xor ecx, 0x72
1401160d4: 09c1 or ecx, eax
1401160d6: 0f841d060000 je 0x1401166f9
1401160dc: 31db xor ebx, ebx
1401160de: ba02000000 mov edx, 2
1401160e3: 488d0d57bccb05 lea rcx, [rip + 0x5cbbc57]
1401160ea: 4989f8 mov r8, rdi
1401160ed: e82e009d02 call 0x142ae6120
1401160f2: 90 nop
1401160f3: 4885c0 test rax, rax
1401160f6: 7507 jne 0x1401160ff
1401160f8: 488b0591f1f007 mov rax, qword ptr [rip + 0x7f0f191]
1401160ff: 803802 cmp byte ptr [rax], 2
140116102: 7507 jne 0x14011610b
140116104: 4883780800 cmp qword ptr [rax + 8], 0
140116109: 7446 je 0x140116151
14011610b: 4531f6 xor r14d, r14d
14011610e: ba01000000 mov edx, 1
140116113: 488d0d23bccb05 lea rcx, [rip + 0x5cbbc23]
14011611a: 4989f8 mov r8, rdi
14011611d: e8feff9c02 call 0x142ae6120
140116122: 90 nop
140116123: 4885c0 test rax, rax
140116126: 7507 jne 0x14011612f
140116128: 488b0561f1f007 mov rax, qword ptr [rip + 0x7f0f161]
14011612f: 0f57c0 xorps xmm0, xmm0
140116132: 803802 cmp byte ptr [rax], 2
140116135: 7564 jne 0x14011619b
140116137: 488b4808 mov rcx, qword ptr [rax + 8]
14011613b: 4883f902 cmp rcx, 2
14011613f: 7435 je 0x140116176
140116141: 83f901 cmp ecx, 1
140116144: 7537 jne 0x14011617d
140116146: 0f57c0 xorps xmm0, xmm0
140116149: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14011614f: eb46 jmp 0x140116197
140116151: 4c8b7010 mov r14, qword ptr [rax + 0x10]
140116155: ebb7 jmp 0x14011610e
140116157: 8139706f6f6c cmp dword ptr [rcx], 0x6c6f6f70
14011615d: 0f849d050000 je 0x140116700
140116163: 31c0 xor eax, eax
140116165: 81396c697665 cmp dword ptr [rcx], 0x6576696c
14011616b: 0f94c0 sete al
14011616e: 8d1c40 lea ebx, [rax + rax*2]
140116171: e968ffffff jmp 0x1401160de
140116176: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14011617b: eb1a jmp 0x140116197
14011617d: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140116182: 410f14c8 unpcklps xmm1, xmm8
140116186: 66410f5cc9 subpd xmm1, xmm9
14011618b: 660f28c1 movapd xmm0, xmm1
14011618f: 660f15c1 unpckhpd xmm0, xmm1
140116193: f20f58c1 addsd xmm0, xmm1
140116197: f20f5ac0 cvtsd2ss xmm0, xmm0
14011619b: f3410f114518 movss dword ptr [r13 + 0x18], xmm0
1401161a1: 458927 mov dword ptr [r15], r12d
1401161a4: f3410f11751c movss dword ptr [r13 + 0x1c], xmm6
1401161aa: ba01000000 mov edx, 1
1401161af: 488d0da3bbcb05 lea rcx, [rip + 0x5cbbba3]
1401161b6: 4989f8 mov r8, rdi
1401161b9: e862ff9c02 call 0x142ae6120
1401161be: 90 nop
1401161bf: 4885c0 test rax, rax
1401161c2: 7507 jne 0x1401161cb
1401161c4: 488b05c5f0f007 mov rax, qword ptr [rip + 0x7f0f0c5]
1401161cb: 450f57ed xorps xmm13, xmm13
1401161cf: 803802 cmp byte ptr [rax], 2
1401161d2: 7544 jne 0x140116218
1401161d4: 488b4808 mov rcx, qword ptr [rax + 8]
1401161d8: 4883f902 cmp rcx, 2
1401161dc: 7410 je 0x1401161ee
1401161de: 83f901 cmp ecx, 1
1401161e1: 7512 jne 0x1401161f5
1401161e3: 0f57c0 xorps xmm0, xmm0
1401161e6: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401161ec: eb21 jmp 0x14011620f
1401161ee: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401161f3: eb1a jmp 0x14011620f
1401161f5: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1401161fa: 410f14c8 unpcklps xmm1, xmm8
1401161fe: 66410f5cc9 subpd xmm1, xmm9
140116203: 660f28c1 movapd xmm0, xmm1
140116207: 660f15c1 unpckhpd xmm0, xmm1
14011620b: f20f58c1 addsd xmm0, xmm1
14011620f: 450f57ed xorps xmm13, xmm13
140116213: f2440f5ae8 cvtsd2ss xmm13, xmm0
140116218: ba01000000 mov edx, 1
14011621d: 488d0d36bbcb05 lea rcx, [rip + 0x5cbbb36]
140116224: 4989f8 mov r8, rdi
140116227: e8f4fe9c02 call 0x142ae6120
14011622c: 90 nop
14011622d: 4885c0 test rax, rax
140116230: 7507 jne 0x140116239
140116232: 488b0557f0f007 mov rax, qword ptr [rip + 0x7f0f057]
140116239: 450f57f6 xorps xmm14, xmm14
14011623d: 803802 cmp byte ptr [rax], 2
140116240: 7544 jne 0x140116286
140116242: 488b4808 mov rcx, qword ptr [rax + 8]
140116246: 4883f902 cmp rcx, 2
14011624a: 7410 je 0x14011625c
14011624c: 83f901 cmp ecx, 1
14011624f: 7512 jne 0x140116263
140116251: 0f57c0 xorps xmm0, xmm0
140116254: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14011625a: eb21 jmp 0x14011627d
14011625c: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140116261: eb1a jmp 0x14011627d
140116263: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140116268: 410f14c8 unpcklps xmm1, xmm8
14011626c: 66410f5cc9 subpd xmm1, xmm9
140116271: 660f28c1 movapd xmm0, xmm1
140116275: 660f15c1 unpckhpd xmm0, xmm1
140116279: f20f58c1 addsd xmm0, xmm1
14011627d: 450f57f6 xorps xmm14, xmm14
140116281: f2440f5af0 cvtsd2ss xmm14, xmm0
140116286: ba01000000 mov edx, 1
14011628b: 488d0dc9bacb05 lea rcx, [rip + 0x5cbbac9]
140116292: 4989f8 mov r8, rdi
140116295: e886fe9c02 call 0x142ae6120
14011629a: 90 nop
14011629b: 4885c0 test rax, rax
14011629e: 7507 jne 0x1401162a7
1401162a0: 488b05e9eff007 mov rax, qword ptr [rip + 0x7f0efe9]
1401162a7: 450f57ff xorps xmm15, xmm15
1401162ab: 803802 cmp byte ptr [rax], 2
1401162ae: 7544 jne 0x1401162f4
1401162b0: 488b4808 mov rcx, qword ptr [rax + 8]
1401162b4: 4883f902 cmp rcx, 2
1401162b8: 7410 je 0x1401162ca
1401162ba: 83f901 cmp ecx, 1
1401162bd: 7512 jne 0x1401162d1
1401162bf: 0f57c0 xorps xmm0, xmm0
1401162c2: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401162c8: eb21 jmp 0x1401162eb
1401162ca: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401162cf: eb1a jmp 0x1401162eb
1401162d1: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1401162d6: 410f14c8 unpcklps xmm1, xmm8
1401162da: 66410f5cc9 subpd xmm1, xmm9
1401162df: 660f28c1 movapd xmm0, xmm1
1401162e3: 660f15c1 unpckhpd xmm0, xmm1
1401162e7: f20f58c1 addsd xmm0, xmm1
1401162eb: 450f57ff xorps xmm15, xmm15
1401162ef: f2440f5af8 cvtsd2ss xmm15, xmm0
1401162f4: ba01000000 mov edx, 1
1401162f9: 488d0d5cbacb05 lea rcx, [rip + 0x5cbba5c]
140116300: 4989f8 mov r8, rdi
140116303: e818fe9c02 call 0x142ae6120
140116308: 90 nop
140116309: 4885c0 test rax, rax
14011630c: 7507 jne 0x140116315
14011630e: 488b057beff007 mov rax, qword ptr [rip + 0x7f0ef7b]
140116315: 450f57d2 xorps xmm10, xmm10
140116319: 803802 cmp byte ptr [rax], 2
14011631c: 7544 jne 0x140116362
14011631e: 488b4808 mov rcx, qword ptr [rax + 8]
140116322: 4883f902 cmp rcx, 2
140116326: 7410 je 0x140116338
140116328: 83f901 cmp ecx, 1
14011632b: 7512 jne 0x14011633f
14011632d: 0f57c0 xorps xmm0, xmm0
140116330: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140116336: eb21 jmp 0x140116359
140116338: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14011633d: eb1a jmp 0x140116359
14011633f: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140116344: 410f14c8 unpcklps xmm1, xmm8
140116348: 66410f5cc9 subpd xmm1, xmm9
14011634d: 660f28c1 movapd xmm0, xmm1
140116351: 660f15c1 unpckhpd xmm0, xmm1
140116355: f20f58c1 addsd xmm0, xmm1
140116359: 450f57d2 xorps xmm10, xmm10
14011635d: f2440f5ad0 cvtsd2ss xmm10, xmm0
140116362: ba02000000 mov edx, 2
140116367: 488d0defb9cb05 lea rcx, [rip + 0x5cbb9ef]
14011636e: 4989f8 mov r8, rdi
140116371: e8aafd9c02 call 0x142ae6120
140116376: 90 nop
140116377: 4885c0 test rax, rax
14011637a: 7507 jne 0x140116383
14011637c: 488b050deff007 mov rax, qword ptr [rip + 0x7f0ef0d]
140116383: 450f57db xorps xmm11, xmm11
140116387: 803802 cmp byte ptr [rax], 2
14011638a: 7544 jne 0x1401163d0
14011638c: 488b4808 mov rcx, qword ptr [rax + 8]
140116390: 4883f902 cmp rcx, 2
140116394: 7410 je 0x1401163a6
140116396: 83f901 cmp ecx, 1
140116399: 7512 jne 0x1401163ad
14011639b: 0f57c0 xorps xmm0, xmm0
14011639e: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401163a4: eb21 jmp 0x1401163c7
1401163a6: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401163ab: eb1a jmp 0x1401163c7
1401163ad: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1401163b2: 410f14c8 unpcklps xmm1, xmm8
1401163b6: 66410f5cc9 subpd xmm1, xmm9
1401163bb: 660f28c1 movapd xmm0, xmm1
1401163bf: 660f15c1 unpckhpd xmm0, xmm1
1401163c3: f20f58c1 addsd xmm0, xmm1
1401163c7: 450f57db xorps xmm11, xmm11
1401163cb: f2440f5ad8 cvtsd2ss xmm11, xmm0
1401163d0: ba02000000 mov edx, 2
1401163d5: 488d0d83b9cb05 lea rcx, [rip + 0x5cbb983]
1401163dc: 4989f8 mov r8, rdi
1401163df: e83cfd9c02 call 0x142ae6120
1401163e4: 90 nop
1401163e5: 4885c0 test rax, rax
1401163e8: 7507 jne 0x1401163f1
1401163ea: 488b059feef007 mov rax, qword ptr [rip + 0x7f0ee9f]
1401163f1: 0f57ff xorps xmm7, xmm7
1401163f4: 803802 cmp byte ptr [rax], 2
1401163f7: 7542 jne 0x14011643b
1401163f9: 488b4808 mov rcx, qword ptr [rax + 8]
1401163fd: 4883f902 cmp rcx, 2
140116401: 7410 je 0x140116413
140116403: 83f901 cmp ecx, 1
140116406: 7512 jne 0x14011641a
140116408: 0f57c0 xorps xmm0, xmm0
14011640b: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140116411: eb21 jmp 0x140116434
140116413: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140116418: eb1a jmp 0x140116434
14011641a: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
14011641f: 410f14c8 unpcklps xmm1, xmm8
140116423: 66410f5cc9 subpd xmm1, xmm9
140116428: 660f28c1 movapd xmm0, xmm1
14011642c: 660f15c1 unpckhpd xmm0, xmm1
140116430: f20f58c1 addsd xmm0, xmm1
140116434: 0f57ff xorps xmm7, xmm7
140116437: f20f5af8 cvtsd2ss xmm7, xmm0
14011643b: 899dbc000000 mov dword ptr [rbp + 0xbc], ebx
140116441: 89b5c0000000 mov dword ptr [rbp + 0xc0], esi
140116447: 458927 mov dword ptr [r15], r12d
14011644a: 498b5d08 mov rbx, qword ptr [r13 + 8]
14011644e: 4d8b6510 mov r12, qword ptr [r13 + 0x10]
140116452: 4c89e7 mov rdi, r12
140116455: 48c1e707 shl rdi, 7
140116459: 31c0 xor eax, eax
14011645b: 0f1f440000 nop dword ptr [rax + rax]
140116460: 4839c7 cmp rdi, rax
140116463: 745b je 0x1401164c0
140116465: 488db080000000 lea rsi, [rax + 0x80]
14011646c: 4c39740338 cmp qword ptr [rbx + rax + 0x38], r14
140116471: 4889f0 mov rax, rsi
140116474: 75ea jne 0x140116460
140116476: 488b7c3390 mov rdi, qword ptr [rbx + rsi - 0x70]
14011647b: 4885ff test rdi, rdi
14011647e: 0f8435010000 je 0x1401165b9
140116484: 4c8b643388 mov r12, qword ptr [rbx + rsi - 0x78]
140116489: 4983c408 add r12, 8
14011648d: eb0e jmp 0x14011649d
14011648f: 90 nop
140116490: 4983c430 add r12, 0x30
140116494: 48ffcf dec rdi
140116497: 0f841c010000 je 0x1401165b9
14011649d: 498b4424f8 mov rax, qword ptr [r12 - 8]
1401164a2: 4885c0 test rax, rax
1401164a5: 74e9 je 0x140116490
1401164a7: 498b0c24 mov rcx, qword ptr [r12]
1401164ab: 48c1e002 shl rax, 2
1401164af: 488d14c0 lea rdx, [rax + rax*8]
1401164b3: 41b804000000 mov r8d, 4
1401164b9: e812bdeeff call 0x1400021d0
1401164be: ebd0 jmp 0x140116490
1401164c0: 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1401164c8: 48c745f808000000 mov qword ptr [rbp - 8], 8
1401164d0: 488d4500 lea rax, [rbp]
1401164d4: 0f57c0 xorps xmm0, xmm0
1401164d7: 0f1100 movups xmmword ptr [rax], xmm0
1401164da: 48c7451008000000 mov qword ptr [rbp + 0x10], 8
1401164e2: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
1401164ea: c7452000000000 mov dword ptr [rbp + 0x20], 0
1401164f1: 4c897528 mov qword ptr [rbp + 0x28], r14
1401164f5: c7453000000000 mov dword ptr [rbp + 0x30], 0
1401164fc: 8b85c0000000 mov eax, dword ptr [rbp + 0xc0]
140116502: 894544 mov dword ptr [rbp + 0x44], eax
140116505: f3440f116548 movss dword ptr [rbp + 0x48], xmm12
14011650b: f30f1085d4000000 movss xmm0, dword ptr [rbp + 0xd4]
140116513: f30f11454c movss dword ptr [rbp + 0x4c], xmm0
140116518: f3440f116d50 movss dword ptr [rbp + 0x50], xmm13
14011651e: f3440f117554 movss dword ptr [rbp + 0x54], xmm14
140116524: f3440f117d58 movss dword ptr [rbp + 0x58], xmm15
14011652a: f3440f11555c movss dword ptr [rbp + 0x5c], xmm10
140116530: f3440f115d60 movss dword ptr [rbp + 0x60], xmm11
140116536: f30f117d64 movss dword ptr [rbp + 0x64], xmm7
14011653b: c7456800000000 mov dword ptr [rbp + 0x68], 0
140116542: c6456c00 mov byte ptr [rbp + 0x6c], 0
140116546: 8b85bc000000 mov eax, dword ptr [rbp + 0xbc]
14011654c: 88456d mov byte ptr [rbp + 0x6d], al
14011654f: 4d3b6500 cmp r12, qword ptr [r13]
140116553: 750d jne 0x140116562
140116555: 4c89e9 mov rcx, r13
140116558: e8a3e8ad05 call 0x145bf4e00
14011655d: 90 nop
14011655e: 498b5d08 mov rbx, qword ptr [r13 + 8]
140116562: 0f104560 movups xmm0, xmmword ptr [rbp + 0x60]
140116566: 0f11443b70 movups xmmword ptr [rbx + rdi + 0x70], xmm0
14011656b: 0f104550 movups xmm0, xmmword ptr [rbp + 0x50]
14011656f: 0f11443b60 movups xmmword ptr [rbx + rdi + 0x60], xmm0
140116574: 0f104540 movups xmm0, xmmword ptr [rbp + 0x40]
140116578: 0f11443b50 movups xmmword ptr [rbx + rdi + 0x50], xmm0
14011657d: 0f104530 movups xmm0, xmmword ptr [rbp + 0x30]
140116581: 0f11443b40 movups xmmword ptr [rbx + rdi + 0x40], xmm0
140116586: 660f1045f0 movupd xmm0, xmmword ptr [rbp - 0x10]
14011658b: 0f104d00 movups xmm1, xmmword ptr [rbp]
14011658f: 660f105510 movupd xmm2, xmmword ptr [rbp + 0x10]
140116594: 0f105d20 movups xmm3, xmmword ptr [rbp + 0x20]
140116598: 0f115c3b30 movups xmmword ptr [rbx + rdi + 0x30], xmm3
14011659d: 660f11543b20 movupd xmmword ptr [rbx + rdi + 0x20], xmm2
1401165a3: 0f114c3b10 movups xmmword ptr [rbx + rdi + 0x10], xmm1
1401165a8: 660f11043b movupd xmmword ptr [rbx + rdi], xmm0
1401165ad: 49ffc4 inc r12
1401165b0: 4d896510 mov qword ptr [r13 + 0x10], r12
1401165b4: e981f2ffff jmp 0x14011583a
1401165b9: 488b443380 mov rax, qword ptr [rbx + rsi - 0x80]
1401165be: 4885c0 test rax, rax
1401165c1: 741b je 0x1401165de
1401165c3: 488d0c33 lea rcx, [rbx + rsi]
1401165c7: 488b4988 mov rcx, qword ptr [rcx - 0x78]
1401165cb: 48c1e004 shl rax, 4
1401165cf: 488d1440 lea rdx, [rax + rax*2]
1401165d3: 41b808000000 mov r8d, 8
1401165d9: e8f2bbeeff call 0x1400021d0
1401165de: 488b7c33a8 mov rdi, qword ptr [rbx + rsi - 0x58]
1401165e3: 4885ff test rdi, rdi
1401165e6: 7444 je 0x14011662c
1401165e8: 4c8b6433a0 mov r12, qword ptr [rbx + rsi - 0x60]
1401165ed: 4983c408 add r12, 8
1401165f1: eb16 jmp 0x140116609
1401165f3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140116600: 4983c430 add r12, 0x30
140116604: 48ffcf dec rdi
140116607: 7423 je 0x14011662c
140116609: 498b4424f8 mov rax, qword ptr [r12 - 8]
14011660e: 4885c0 test rax, rax
140116611: 74ed je 0x140116600
140116613: 498b0c24 mov rcx, qword ptr [r12]
140116617: 48c1e002 shl rax, 2
14011661b: 488d14c0 lea rdx, [rax + rax*8]
14011661f: 41b804000000 mov r8d, 4
140116625: e8a6bbeeff call 0x1400021d0
14011662a: ebd4 jmp 0x140116600
14011662c: 488b443398 mov rax, qword ptr [rbx + rsi - 0x68]
140116631: 4885c0 test rax, rax
140116634: 7418 je 0x14011664e
140116636: 488b4c33a0 mov rcx, qword ptr [rbx + rsi - 0x60]
14011663b: 48c1e004 shl rax, 4
14011663f: 488d1440 lea rdx, [rax + rax*2]
140116643: 41b808000000 mov r8d, 8
140116649: e882bbeeff call 0x1400021d0
14011664e: 488d0433 lea rax, [rbx + rsi]
140116652: 4883c090 add rax, -0x70
140116656: 48c744338000000000 mov qword ptr [rbx + rsi - 0x80], 0
14011665f: 48c744338808000000 mov qword ptr [rbx + rsi - 0x78], 8
140116668: 0f57c0 xorps xmm0, xmm0
14011666b: 0f1100 movups xmmword ptr [rax], xmm0
14011666e: 48c74433a008000000 mov qword ptr [rbx + rsi - 0x60], 8
140116677: 48c74433a800000000 mov qword ptr [rbx + rsi - 0x58], 0
140116680: c74433b000000000 mov dword ptr [rbx + rsi - 0x50], 0
140116688: 4c897433b8 mov qword ptr [rbx + rsi - 0x48], r14
14011668d: c74433c000000000 mov dword ptr [rbx + rsi - 0x40], 0
140116695: 8b85c0000000 mov eax, dword ptr [rbp + 0xc0]
14011669b: 894433d4 mov dword ptr [rbx + rsi - 0x2c], eax
14011669f: f3440f116433d8 movss dword ptr [rbx + rsi - 0x28], xmm12
1401166a6: f30f1085d4000000 movss xmm0, dword ptr [rbp + 0xd4]
1401166ae: f30f114433dc movss dword ptr [rbx + rsi - 0x24], xmm0
1401166b4: f3440f116c33e0 movss dword ptr [rbx + rsi - 0x20], xmm13
1401166bb: f3440f117433e4 movss dword ptr [rbx + rsi - 0x1c], xmm14
1401166c2: f3440f117c33e8 movss dword ptr [rbx + rsi - 0x18], xmm15
1401166c9: f3440f115433ec movss dword ptr [rbx + rsi - 0x14], xmm10
1401166d0: f3440f115c33f0 movss dword ptr [rbx + rsi - 0x10], xmm11
1401166d7: f30f117c33f4 movss dword ptr [rbx + rsi - 0xc], xmm7
1401166dd: c74433f800000000 mov dword ptr [rbx + rsi - 8], 0
1401166e5: c64433fc00 mov byte ptr [rbx + rsi - 4], 0
1401166ea: 8b85bc000000 mov eax, dword ptr [rbp + 0xbc]
1401166f0: 884433fd mov byte ptr [rbx + rsi - 3], al
1401166f4: e941f1ffff jmp 0x14011583a
1401166f9: b301 mov bl, 1
1401166fb: e9def9ffff jmp 0x1401160de
140116700: b302 mov bl, 2
140116702: e9d7f9ffff jmp 0x1401160de
140116707: 488d4dc8 lea rcx, [rbp - 0x38]
14011670b: e8b01a0a00 call 0x1401b81c0
140116710: 458927 mov dword ptr [r15], r12d
140116713: 498b4510 mov rax, qword ptr [r13 + 0x10]
140116717: 4885c0 test rax, rax
14011671a: 0f84fe000000 je 0x14011681e
140116720: 498b5508 mov rdx, qword ptr [r13 + 8]
140116724: 31f6 xor esi, esi
140116726: 4889d1 mov rcx, rdx
140116729: eb15 jmp 0x140116740
14011672b: 0f1f440000 nop dword ptr [rax + rax]
140116730: 48ffc6 inc rsi
140116733: 4883e980 sub rcx, -0x80
140116737: 4839f0 cmp rax, rsi
14011673a: 0f84de000000 je 0x14011681e
140116740: 83793001 cmp dword ptr [rcx + 0x30], 1
140116744: 75ea jne 0x140116730
140116746: f30f104134 movss xmm0, dword ptr [rcx + 0x34]
14011674b: 0f2ec6 ucomiss xmm0, xmm6
14011674e: 77e0 ja 0x140116730
140116750: 488995b0000000 mov qword ptr [rbp + 0xb0], rdx
140116757: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14011675e: 4c89adc0000000 mov qword ptr [rbp + 0xc0], r13
140116765: 488d7e01 lea rdi, [rsi + 1]
140116769: 48897d78 mov qword ptr [rbp + 0x78], rdi
14011676d: 48897570 mov qword ptr [rbp + 0x70], rsi
140116771: e82ae5fcff call 0x1400e4ca0
140116776: 90 nop
140116777: eb57 jmp 0x1401167d0
140116779: 4889f0 mov rax, rsi
14011677c: 48c1e007 shl rax, 7
140116780: 0f104170 movups xmm0, xmmword ptr [rcx + 0x70]
140116784: 0f11440270 movups xmmword ptr [rdx + rax + 0x70], xmm0
140116789: 0f104160 movups xmm0, xmmword ptr [rcx + 0x60]
14011678d: 0f11440260 movups xmmword ptr [rdx + rax + 0x60], xmm0
140116792: 0f104150 movups xmm0, xmmword ptr [rcx + 0x50]
140116796: 0f11440250 movups xmmword ptr [rdx + rax + 0x50], xmm0
14011679b: 0f104140 movups xmm0, xmmword ptr [rcx + 0x40]
14011679f: 0f11440240 movups xmmword ptr [rdx + rax + 0x40], xmm0
1401167a4: 0f1001 movups xmm0, xmmword ptr [rcx]
1401167a7: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
1401167ab: 660f105120 movupd xmm2, xmmword ptr [rcx + 0x20]
1401167b0: 0f105930 movups xmm3, xmmword ptr [rcx + 0x30]
1401167b4: 0f115c0230 movups xmmword ptr [rdx + rax + 0x30], xmm3
1401167b9: 660f11540220 movupd xmmword ptr [rdx + rax + 0x20], xmm2
1401167bf: 0f114c0210 movups xmmword ptr [rdx + rax + 0x10], xmm1
1401167c4: 0f110402 movups xmmword ptr [rdx + rax], xmm0
1401167c8: 48ffc6 inc rsi
1401167cb: 48ffc7 inc rdi
1401167ce: 6690 nop
1401167d0: 483bbdc8000000 cmp rdi, qword ptr [rbp + 0xc8]
1401167d7: 733a jae 0x140116813
1401167d9: 4889f8 mov rax, rdi
1401167dc: 48c1e007 shl rax, 7
1401167e0: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
1401167e7: 488d0c02 lea rcx, [rdx + rax]
1401167eb: 837c023001 cmp dword ptr [rdx + rax + 0x30], 1
1401167f0: 7587 jne 0x140116779
1401167f2: f30f104134 movss xmm0, dword ptr [rcx + 0x34]
1401167f7: 0f2ec6 ucomiss xmm0, xmm6
1401167fa: 0f8779ffffff ja 0x140116779
140116800: 48ffc7 inc rdi
140116803: 48897d78 mov qword ptr [rbp + 0x78], rdi
140116807: 48897570 mov qword ptr [rbp + 0x70], rsi
14011680b: e890e4fcff call 0x1400e4ca0
140116810: 90 nop
140116811: ebbd jmp 0x1401167d0
140116813: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
14011681a: 48897010 mov qword ptr [rax + 0x10], rsi
14011681e: 0f28b5e0000000 movaps xmm6, xmmword ptr [rbp + 0xe0]
140116825: 0f28bdf0000000 movaps xmm7, xmmword ptr [rbp + 0xf0]
14011682c: 440f288500010000 movaps xmm8, xmmword ptr [rbp + 0x100]
140116834: 440f288d10010000 movaps xmm9, xmmword ptr [rbp + 0x110]
14011683c: 440f289520010000 movaps xmm10, xmmword ptr [rbp + 0x120]
140116844: 440f289d30010000 movaps xmm11, xmmword ptr [rbp + 0x130]
14011684c: 440f28a540010000 movaps xmm12, xmmword ptr [rbp + 0x140]
140116854: 440f28ad50010000 movaps xmm13, xmmword ptr [rbp + 0x150]
14011685c: 440f28b560010000 movaps xmm14, xmmword ptr [rbp + 0x160]
140116864: 440f28bd70010000 movaps xmm15, xmmword ptr [rbp + 0x170]
14011686c: 4881c408020000 add rsp, 0x208
140116873: 5b pop rbx
140116874: 5f pop rdi
140116875: 5e pop rsi
140116876: 415c pop r12
140116878: 415d pop r13
14011687a: 415e pop r14
14011687c: 415f pop r15
14011687e: 5d pop rbp
14011687f: c3 ret
