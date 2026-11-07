140165430: 55 push rbp
140165431: 4157 push r15
140165433: 4156 push r14
140165435: 4155 push r13
140165437: 4154 push r12
140165439: 56 push rsi
14016543a: 57 push rdi
14016543b: 53 push rbx
14016543c: 4881ec08020000 sub rsp, 0x208
140165443: 488dac2480000000 lea rbp, [rsp + 0x80]
14016544b: 440f29bd70010000 movaps xmmword ptr [rbp + 0x170], xmm15
140165453: 440f29b560010000 movaps xmmword ptr [rbp + 0x160], xmm14
14016545b: 440f29ad50010000 movaps xmmword ptr [rbp + 0x150], xmm13
140165463: 440f29a540010000 movaps xmmword ptr [rbp + 0x140], xmm12
14016546b: 440f299d30010000 movaps xmmword ptr [rbp + 0x130], xmm11
140165473: 440f299520010000 movaps xmmword ptr [rbp + 0x120], xmm10
14016547b: 440f298d10010000 movaps xmmword ptr [rbp + 0x110], xmm9
140165483: 440f298500010000 movaps xmmword ptr [rbp + 0x100], xmm8
14016548b: 0f29bdf0000000 movaps xmmword ptr [rbp + 0xf0], xmm7
140165492: 0f29b5e0000000 movaps xmmword ptr [rbp + 0xe0], xmm6
140165499: 48c785d8000000feffffff mov qword ptr [rbp + 0xd8], 0xfffffffffffffffe
1401654a4: 4c8b12 mov r10, qword ptr [rdx]
1401654a7: 488b4210 mov rax, qword ptr [rdx + 0x10]
1401654ab: 8b4a1c mov ecx, dword ptr [rdx + 0x1c]
1401654ae: 4d8b28 mov r13, qword ptr [r8]
1401654b1: 4d8b7810 mov r15, qword ptr [r8 + 0x10]
1401654b5: 458b601c mov r12d, dword ptr [r8 + 0x1c]
1401654b9: 498b11 mov rdx, qword ptr [r9]
1401654bc: f30f10725c movss xmm6, dword ptr [rdx + 0x5c]
1401654c1: 8908 mov dword ptr [rax], ecx
1401654c3: 498b4208 mov rax, qword ptr [r10 + 8]
1401654c7: 498b4a10 mov rcx, qword ptr [r10 + 0x10]
1401654cb: 49c7421000000000 mov qword ptr [r10 + 0x10], 0
1401654d3: 48894de0 mov qword ptr [rbp - 0x20], rcx
1401654d7: 48c1e105 shl rcx, 5
1401654db: 4801c1 add rcx, rax
1401654de: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
1401654e6: 488945c8 mov qword ptr [rbp - 0x38], rax
1401654ea: 48894dd0 mov qword ptr [rbp - 0x30], rcx
1401654ee: 4c8955d8 mov qword ptr [rbp - 0x28], r10
1401654f2: f30f10058a79c605 movss xmm0, dword ptr [rip + 0x5c6798a]
1401654fa: f30f58c6 addss xmm0, xmm6
1401654fe: f30f1185ac000000 movss dword ptr [rbp + 0xac], xmm0
140165506: 488dbd80000000 lea rdi, [rbp + 0x80]
14016550d: f2440f10054a7ac605 movsd xmm8, qword ptr [rip + 0x5c67a4a]
140165516: 66440f280d517ac605 movapd xmm9, xmmword ptr [rip + 0x5c67a51]
14016551f: 4489a5c8000000 mov dword ptr [rbp + 0xc8], r12d
140165526: 4c89bdb0000000 mov qword ptr [rbp + 0xb0], r15
14016552d: 4839c8 cmp rax, rcx
140165530: 0f84c1110000 je 0x1401666f7
140165536: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
140165540: 488d4820 lea rcx, [rax + 0x20]
140165544: 48894dc8 mov qword ptr [rbp - 0x38], rcx
140165548: 660f1000 movupd xmm0, xmmword ptr [rax]
14016554c: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140165550: 660f2945a0 movapd xmmword ptr [rbp - 0x60], xmm0
140165555: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
140165559: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
140165560: 660f298580000000 movapd xmmword ptr [rbp + 0x80], xmm0
140165568: ba04000000 mov edx, 4
14016556d: 488d0da5e0c705 lea rcx, [rip + 0x5c7e0a5]
140165574: 4989f8 mov r8, rdi
140165577: e864579802 call 0x142aeace0
14016557c: 90 nop
14016557d: 4885c0 test rax, rax
140165580: 7507 jne 0x140165589
140165582: 488b0507adef07 mov rax, qword ptr [rip + 0x7efad07]
140165589: 803803 cmp byte ptr [rax], 3
14016558c: 0f855e010000 jne 0x1401656f0
140165592: 488b4810 mov rcx, qword ptr [rax + 0x10]
140165596: 488b4018 mov rax, qword ptr [rax + 0x18]
14016559a: 4883f805 cmp rax, 5
14016559e: 0f8433010000 je 0x1401656d7
1401655a4: 4883f803 cmp rax, 3
1401655a8: 0f84c3000000 je 0x140165671
1401655ae: 4883f802 cmp rax, 2
1401655b2: 0f8538010000 jne 0x1401656f0
1401655b8: 668139687a cmp word ptr [rcx], 0x7a68
1401655bd: 0f852d010000 jne 0x1401656f0
1401655c3: ba05000000 mov edx, 5
1401655c8: 488d0d54e0c705 lea rcx, [rip + 0x5c7e054]
1401655cf: 4989f8 mov r8, rdi
1401655d2: e809579802 call 0x142aeace0
1401655d7: 90 nop
1401655d8: 4885c0 test rax, rax
1401655db: 7507 jne 0x1401655e4
1401655dd: 488b05acacef07 mov rax, qword ptr [rip + 0x7efacac]
1401655e4: 803803 cmp byte ptr [rax], 3
1401655e7: 0f8527030000 jne 0x140165914
1401655ed: 488b4810 mov rcx, qword ptr [rax + 0x10]
1401655f1: 488b4018 mov rax, qword ptr [rax + 0x18]
1401655f5: 4883f804 cmp rax, 4
1401655f9: 0f84fd020000 je 0x1401658fc
1401655ff: 4883f805 cmp rax, 5
140165603: 0f850b030000 jne 0x140165914
140165609: 8b01 mov eax, dword ptr [rcx]
14016560b: ba646f6e75 mov edx, 0x756e6f64
140165610: 31d0 xor eax, edx
140165612: 0fb64904 movzx ecx, byte ptr [rcx + 4]
140165616: 83f174 xor ecx, 0x74
140165619: 09c1 or ecx, eax
14016561b: 0f85f3020000 jne 0x140165914
140165621: ba05000000 mov edx, 5
140165626: 488d0d03e0c705 lea rcx, [rip + 0x5c7e003]
14016562d: 4989f8 mov r8, rdi
140165630: e8ab569802 call 0x142aeace0
140165635: 90 nop
140165636: 4885c0 test rax, rax
140165639: 7507 jne 0x140165642
14016563b: 488b054eacef07 mov rax, qword ptr [rip + 0x7efac4e]
140165642: 450f57e4 xorps xmm12, xmm12
140165646: 803802 cmp byte ptr [rax], 2
140165649: 0f85d6080000 jne 0x140165f25
14016564f: 488b4808 mov rcx, qword ptr [rax + 8]
140165653: 4883f902 cmp rcx, 2
140165657: 0f8482080000 je 0x140165edf
14016565d: 83f901 cmp ecx, 1
140165660: 0f859c080000 jne 0x140165f02
140165666: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14016566c: e973080000 jmp 0x140165ee4
140165671: 0fb701 movzx eax, word ptr [rcx]
140165674: 35687a0000 xor eax, 0x7a68
140165679: 0fb64902 movzx ecx, byte ptr [rcx + 2]
14016567d: 83f174 xor ecx, 0x74
140165680: 6609c1 or cx, ax
140165683: 756b jne 0x1401656f0
140165685: ba01000000 mov edx, 1
14016568a: 488d0d8cdfc705 lea rcx, [rip + 0x5c7df8c]
140165691: 4989f8 mov r8, rdi
140165694: e847569802 call 0x142aeace0
140165699: 90 nop
14016569a: 4885c0 test rax, rax
14016569d: 7507 jne 0x1401656a6
14016569f: 488b05eaabef07 mov rax, qword ptr [rip + 0x7efabea]
1401656a6: 660f57c0 xorpd xmm0, xmm0
1401656aa: 803802 cmp byte ptr [rax], 2
1401656ad: 0f85c8020000 jne 0x14016597b
1401656b3: 488b4808 mov rcx, qword ptr [rax + 8]
1401656b7: 4885c9 test rcx, rcx
1401656ba: 0f8419020000 je 0x1401658d9
1401656c0: 83f901 cmp ecx, 1
1401656c3: 0f85a9020000 jne 0x140165972
1401656c9: 0f57c0 xorps xmm0, xmm0
1401656cc: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401656d2: e9a0020000 jmp 0x140165977
1401656d7: 8b01 mov eax, dword ptr [rcx]
1401656d9: ba687a656e mov edx, 0x6e657a68
1401656de: 31d0 xor eax, edx
1401656e0: 0fb64904 movzx ecx, byte ptr [rcx + 4]
1401656e4: 83f164 xor ecx, 0x64
1401656e7: 09c1 or ecx, eax
1401656e9: 0f8468010000 je 0x140165857
1401656ef: 90 nop
1401656f0: 458927 mov dword ptr [r15], r12d
1401656f3: 498b7508 mov rsi, qword ptr [r13 + 8]
1401656f7: 498b5d10 mov rbx, qword ptr [r13 + 0x10]
1401656fb: 49c7451000000000 mov qword ptr [r13 + 0x10], 0
140165703: 4885db test rbx, rbx
140165706: 0f842c010000 je 0x140165838
14016570c: 4d89ef mov r15, r13
14016570f: 31ff xor edi, edi
140165711: eb19 jmp 0x14016572c
140165713: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140165720: 48ffc7 inc rdi
140165723: 4839df cmp rdi, rbx
140165726: 0f84f4000000 je 0x140165820
14016572c: 4989fe mov r14, rdi
14016572f: 49c1e607 shl r14, 7
140165733: 4e8b643610 mov r12, qword ptr [rsi + r14 + 0x10]
140165738: 4d85e4 test r12, r12
14016573b: 7443 je 0x140165780
14016573d: 4e8b6c3608 mov r13, qword ptr [rsi + r14 + 8]
140165742: 4983c508 add r13, 8
140165746: eb11 jmp 0x140165759
140165748: 0f1f840000000000 nop dword ptr [rax + rax]
140165750: 4983c530 add r13, 0x30
140165754: 49ffcc dec r12
140165757: 7427 je 0x140165780
140165759: 498b45f8 mov rax, qword ptr [r13 - 8]
14016575d: 4885c0 test rax, rax
140165760: 74ee je 0x140165750
140165762: 498b4d00 mov rcx, qword ptr [r13]
140165766: 48c1e002 shl rax, 2
14016576a: 488d14c0 lea rdx, [rax + rax*8]
14016576e: 41b804000000 mov r8d, 4
140165774: e857cae9ff call 0x1400021d0
140165779: ebd5 jmp 0x140165750
14016577b: 0f1f440000 nop dword ptr [rax + rax]
140165780: 4901f6 add r14, rsi
140165783: 498b06 mov rax, qword ptr [r14]
140165786: 4885c0 test rax, rax
140165789: 7417 je 0x1401657a2
14016578b: 498b4e08 mov rcx, qword ptr [r14 + 8]
14016578f: 48c1e004 shl rax, 4
140165793: 488d1440 lea rdx, [rax + rax*2]
140165797: 41b808000000 mov r8d, 8
14016579d: e82ecae9ff call 0x1400021d0
1401657a2: 4d8b6628 mov r12, qword ptr [r14 + 0x28]
1401657a6: 4d85e4 test r12, r12
1401657a9: 7445 je 0x1401657f0
1401657ab: 4d8b6e20 mov r13, qword ptr [r14 + 0x20]
1401657af: 4983c508 add r13, 8
1401657b3: eb14 jmp 0x1401657c9
1401657b5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401657c0: 4983c530 add r13, 0x30
1401657c4: 49ffcc dec r12
1401657c7: 7427 je 0x1401657f0
1401657c9: 498b45f8 mov rax, qword ptr [r13 - 8]
1401657cd: 4885c0 test rax, rax
1401657d0: 74ee je 0x1401657c0
1401657d2: 498b4d00 mov rcx, qword ptr [r13]
1401657d6: 48c1e002 shl rax, 2
1401657da: 488d14c0 lea rdx, [rax + rax*8]
1401657de: 41b804000000 mov r8d, 4
1401657e4: e8e7c9e9ff call 0x1400021d0
1401657e9: ebd5 jmp 0x1401657c0
1401657eb: 0f1f440000 nop dword ptr [rax + rax]
1401657f0: 498b4618 mov rax, qword ptr [r14 + 0x18]
1401657f4: 4885c0 test rax, rax
1401657f7: 0f8423ffffff je 0x140165720
1401657fd: 498b4e20 mov rcx, qword ptr [r14 + 0x20]
140165801: 48c1e004 shl rax, 4
140165805: 488d1440 lea rdx, [rax + rax*2]
140165809: 41b808000000 mov r8d, 8
14016580f: e8bcc9e9ff call 0x1400021d0
140165814: e907ffffff jmp 0x140165720
140165819: 0f1f8000000000 nop dword ptr [rax]
140165820: 4d89fd mov r13, r15
140165823: 4c8bbdb0000000 mov r15, qword ptr [rbp + 0xb0]
14016582a: 448ba5c8000000 mov r12d, dword ptr [rbp + 0xc8]
140165831: 488dbd80000000 lea rdi, [rbp + 0x80]
140165838: 4889f9 mov rcx, rdi
14016583b: e8a026fdff call 0x140137ee0
140165840: 90 nop
140165841: 488b45c8 mov rax, qword ptr [rbp - 0x38]
140165845: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
140165849: 4839c8 cmp rax, rcx
14016584c: 0f85eefcffff jne 0x140165540
140165852: e9a00e0000 jmp 0x1401666f7
140165857: ba02000000 mov edx, 2
14016585c: 488d0dbeddc705 lea rcx, [rip + 0x5c7ddbe]
140165863: 4989f8 mov r8, rdi
140165866: e875549802 call 0x142aeace0
14016586b: 90 nop
14016586c: 4885c0 test rax, rax
14016586f: 7507 jne 0x140165878
140165871: 488b0518aaef07 mov rax, qword ptr [rip + 0x7efaa18]
140165878: 803802 cmp byte ptr [rax], 2
14016587b: 7507 jne 0x140165884
14016587d: 4883780800 cmp qword ptr [rax + 8], 0
140165882: 744f je 0x1401658d3
140165884: 31c0 xor eax, eax
140165886: 458927 mov dword ptr [r15], r12d
140165889: 498b4d08 mov rcx, qword ptr [r13 + 8]
14016588d: 498b5510 mov rdx, qword ptr [r13 + 0x10]
140165891: 48c1e207 shl rdx, 7
140165895: 4531c0 xor r8d, r8d
140165898: 4989c9 mov r9, rcx
14016589b: 0f1f440000 nop dword ptr [rax + rax]
1401658a0: 4c39c2 cmp rdx, r8
1401658a3: 7493 je 0x140165838
1401658a5: 4983e880 sub r8, -0x80
1401658a9: 49394138 cmp qword ptr [r9 + 0x38], rax
1401658ad: 4d8d8980000000 lea r9, [r9 + 0x80]
1401658b4: 75ea jne 0x1401658a0
1401658b6: 42c74401b001000000 mov dword ptr [rcx + r8 - 0x50], 1
1401658bf: f30f1085ac000000 movss xmm0, dword ptr [rbp + 0xac]
1401658c7: f3420f114401b4 movss dword ptr [rcx + r8 - 0x4c], xmm0
1401658ce: e965ffffff jmp 0x140165838
1401658d3: 488b4010 mov rax, qword ptr [rax + 0x10]
1401658d7: ebad jmp 0x140165886
1401658d9: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401658de: 410f14c0 unpcklps xmm0, xmm8
1401658e2: 66410f5cc1 subpd xmm0, xmm9
1401658e7: 660f28c8 movapd xmm1, xmm0
1401658eb: 660f15c8 unpckhpd xmm1, xmm0
1401658ef: f20f58c8 addsd xmm1, xmm0
1401658f3: 0f57c0 xorps xmm0, xmm0
1401658f6: f20f5ac1 cvtsd2ss xmm0, xmm1
1401658fa: eb7f jmp 0x14016597b
1401658fc: 81396c696e65 cmp dword ptr [rcx], 0x656e696c
140165902: 0f8438050000 je 0x140165e40
140165908: 8139636f6e65 cmp dword ptr [rcx], 0x656e6f63
14016590e: 0f8478050000 je 0x140165e8c
140165914: ba01000000 mov edx, 1
140165919: 488d0d08ddc705 lea rcx, [rip + 0x5c7dd08]
140165920: 4989f8 mov r8, rdi
140165923: e8b8539802 call 0x142aeace0
140165928: 90 nop
140165929: 4885c0 test rax, rax
14016592c: 7507 jne 0x140165935
14016592e: 488b055ba9ef07 mov rax, qword ptr [rip + 0x7efa95b]
140165935: 31f6 xor esi, esi
140165937: 450f57e4 xorps xmm12, xmm12
14016593b: 803802 cmp byte ptr [rax], 2
14016593e: 0f8532070000 jne 0x140166076
140165944: 488b4808 mov rcx, qword ptr [rax + 8]
140165948: 4883f902 cmp rcx, 2
14016594c: 0f84b3040000 je 0x140165e05
140165952: 83f901 cmp ecx, 1
140165955: 0f85bd040000 jne 0x140165e18
14016595b: 0f57c0 xorps xmm0, xmm0
14016595e: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140165964: 450f57e4 xorps xmm12, xmm12
140165968: f2440f5ae0 cvtsd2ss xmm12, xmm0
14016596d: e904070000 jmp 0x140166076
140165972: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165977: f20f5ac0 cvtsd2ss xmm0, xmm0
14016597b: f3410f114518 movss dword ptr [r13 + 0x18], xmm0
140165981: 458927 mov dword ptr [r15], r12d
140165984: f3410f11751c movss dword ptr [r13 + 0x1c], xmm6
14016598a: ba01000000 mov edx, 1
14016598f: 488d0d88dcc705 lea rcx, [rip + 0x5c7dc88]
140165996: 4989f8 mov r8, rdi
140165999: e842539802 call 0x142aeace0
14016599e: 90 nop
14016599f: 4885c0 test rax, rax
1401659a2: 7507 jne 0x1401659ab
1401659a4: 488b05e5a8ef07 mov rax, qword ptr [rip + 0x7efa8e5]
1401659ab: 803804 cmp byte ptr [rax], 4
1401659ae: 0f857f020000 jne 0x140165c33
1401659b4: 488b4818 mov rcx, qword ptr [rax + 0x18]
1401659b8: 4885c9 test rcx, rcx
1401659bb: 0f8472020000 je 0x140165c33
1401659c1: 4c8b4010 mov r8, qword ptr [rax + 0x10]
1401659c5: 48c1e105 shl rcx, 5
1401659c9: 4c01c1 add rcx, r8
1401659cc: eb20 jmp 0x1401659ee
1401659ce: f2410f104210 movsd xmm0, qword ptr [r10 + 0x10]
1401659d4: 0f57d2 xorps xmm2, xmm2
1401659d7: f20f5ad0 cvtsd2ss xmm2, xmm0
1401659db: f3420f11540aec movss dword ptr [rdx + r9 - 0x14], xmm2
1401659e2: 4989c0 mov r8, rax
1401659e5: 4839c8 cmp rax, rcx
1401659e8: 0f8445020000 je 0x140165c33
1401659ee: 4983781800 cmp qword ptr [r8 + 0x18], 0
1401659f3: 488b0596a8ef07 mov rax, qword ptr [rip + 0x7efa896]
1401659fa: 7404 je 0x140165a00
1401659fc: 498b4010 mov rax, qword ptr [r8 + 0x10]
140165a00: 41803804 cmp byte ptr [r8], 4
140165a04: 480f450584a8ef07 cmovne rax, qword ptr [rip + 0x7efa884]
140165a0c: 803802 cmp byte ptr [rax], 2
140165a0f: 750b jne 0x140165a1c
140165a11: 4883780800 cmp qword ptr [rax + 8], 0
140165a16: 0f8485000000 je 0x140165aa1
140165a1c: 4531d2 xor r10d, r10d
140165a1f: 498d4020 lea rax, [r8 + 0x20]
140165a23: 458927 mov dword ptr [r15], r12d
140165a26: 498b5508 mov rdx, qword ptr [r13 + 8]
140165a2a: 4d8b5d10 mov r11, qword ptr [r13 + 0x10]
140165a2e: 49c1e307 shl r11, 7
140165a32: 4531c9 xor r9d, r9d
140165a35: 4889d6 mov rsi, rdx
140165a38: 0f1f840000000000 nop dword ptr [rax + rax]
140165a40: 4d39cb cmp r11, r9
140165a43: 749d je 0x1401659e2
140165a45: 4983e980 sub r9, -0x80
140165a49: 4c395638 cmp qword ptr [rsi + 0x38], r10
140165a4d: 488db680000000 lea rsi, [rsi + 0x80]
140165a54: 75ea jne 0x140165a40
140165a56: 4d8b5818 mov r11, qword ptr [r8 + 0x18]
140165a5a: 4d8b5010 mov r10, qword ptr [r8 + 0x10]
140165a5e: 498d7220 lea rsi, [r10 + 0x20]
140165a62: 4983fb02 cmp r11, 2
140165a66: 4c8b3523a8ef07 mov r14, qword ptr [rip + 0x7efa823]
140165a6d: 490f42f6 cmovb rsi, r14
140165a71: 410fb618 movzx ebx, byte ptr [r8]
140165a75: 80fb04 cmp bl, 4
140165a78: 490f45f6 cmovne rsi, r14
140165a7c: 0f57c0 xorps xmm0, xmm0
140165a7f: 803e02 cmp byte ptr [rsi], 2
140165a82: 0f57c9 xorps xmm1, xmm1
140165a85: 7556 jne 0x140165add
140165a87: 488b7e08 mov rdi, qword ptr [rsi + 8]
140165a8b: 4883ff02 cmp rdi, 2
140165a8f: 7419 je 0x140165aaa
140165a91: 83ff01 cmp edi, 1
140165a94: 7522 jne 0x140165ab8
140165a96: 0f57c9 xorps xmm1, xmm1
140165a99: f2480f2a4e10 cvtsi2sd xmm1, qword ptr [rsi + 0x10]
140165a9f: eb0e jmp 0x140165aaf
140165aa1: 4c8b5010 mov r10, qword ptr [rax + 0x10]
140165aa5: e975ffffff jmp 0x140165a1f
140165aaa: f20f104e10 movsd xmm1, qword ptr [rsi + 0x10]
140165aaf: 488dbd80000000 lea rdi, [rbp + 0x80]
140165ab6: eb21 jmp 0x140165ad9
140165ab8: 488dbd80000000 lea rdi, [rbp + 0x80]
140165abf: f20f105610 movsd xmm2, qword ptr [rsi + 0x10]
140165ac4: 410f14d0 unpcklps xmm2, xmm8
140165ac8: 66410f5cd1 subpd xmm2, xmm9
140165acd: 660f28ca movapd xmm1, xmm2
140165ad1: 660f15ca unpckhpd xmm1, xmm2
140165ad5: f20f58ca addsd xmm1, xmm2
140165ad9: f20f5ac9 cvtsd2ss xmm1, xmm1
140165add: 498d7240 lea rsi, [r10 + 0x40]
140165ae1: 4983fb03 cmp r11, 3
140165ae5: 4c8b35a4a7ef07 mov r14, qword ptr [rip + 0x7efa7a4]
140165aec: 490f42f6 cmovb rsi, r14
140165af0: 80fb04 cmp bl, 4
140165af3: 490f45f6 cmovne rsi, r14
140165af7: 803e02 cmp byte ptr [rsi], 2
140165afa: 754d jne 0x140165b49
140165afc: 488b7e08 mov rdi, qword ptr [rsi + 8]
140165b00: 4883ff02 cmp rdi, 2
140165b04: 7410 je 0x140165b16
140165b06: 83ff01 cmp edi, 1
140165b09: 7519 jne 0x140165b24
140165b0b: 0f57c0 xorps xmm0, xmm0
140165b0e: f2480f2a4610 cvtsi2sd xmm0, qword ptr [rsi + 0x10]
140165b14: eb05 jmp 0x140165b1b
140165b16: f20f104610 movsd xmm0, qword ptr [rsi + 0x10]
140165b1b: 488dbd80000000 lea rdi, [rbp + 0x80]
140165b22: eb21 jmp 0x140165b45
140165b24: 488dbd80000000 lea rdi, [rbp + 0x80]
140165b2b: f20f105610 movsd xmm2, qword ptr [rsi + 0x10]
140165b30: 410f14d0 unpcklps xmm2, xmm8
140165b34: 66410f5cd1 subpd xmm2, xmm9
140165b39: 660f28c2 movapd xmm0, xmm2
140165b3d: 660f15c2 unpckhpd xmm0, xmm2
140165b41: f20f58c2 addsd xmm0, xmm2
140165b45: f20f5ac0 cvtsd2ss xmm0, xmm0
140165b49: 4983c260 add r10, 0x60
140165b4d: 4983fb04 cmp r11, 4
140165b51: 4c8b1d38a7ef07 mov r11, qword ptr [rip + 0x7efa738]
140165b58: 4d0f42d3 cmovb r10, r11
140165b5c: 80fb04 cmp bl, 4
140165b5f: 4d0f45d3 cmovne r10, r11
140165b63: 660f57d2 xorpd xmm2, xmm2
140165b67: 41803a02 cmp byte ptr [r10], 2
140165b6b: 0f57db xorps xmm3, xmm3
140165b6e: 7542 jne 0x140165bb2
140165b70: 4d8b5a08 mov r11, qword ptr [r10 + 8]
140165b74: 4983fb02 cmp r11, 2
140165b78: 7411 je 0x140165b8b
140165b7a: 4183fb01 cmp r11d, 1
140165b7e: 7513 jne 0x140165b93
140165b80: 0f57db xorps xmm3, xmm3
140165b83: f2490f2a5a10 cvtsi2sd xmm3, qword ptr [r10 + 0x10]
140165b89: eb23 jmp 0x140165bae
140165b8b: f2410f105a10 movsd xmm3, qword ptr [r10 + 0x10]
140165b91: eb1b jmp 0x140165bae
140165b93: f2410f106210 movsd xmm4, qword ptr [r10 + 0x10]
140165b99: 410f14e0 unpcklps xmm4, xmm8
140165b9d: 66410f5ce1 subpd xmm4, xmm9
140165ba2: 660f28dc movapd xmm3, xmm4
140165ba6: 660f15dc unpckhpd xmm3, xmm4
140165baa: f20f58dc addsd xmm3, xmm4
140165bae: f20f5adb cvtsd2ss xmm3, xmm3
140165bb2: f3420f114c0ae0 movss dword ptr [rdx + r9 - 0x20], xmm1
140165bb9: f3420f11440ae4 movss dword ptr [rdx + r9 - 0x1c], xmm0
140165bc0: f3420f115c0ae8 movss dword ptr [rdx + r9 - 0x18], xmm3
140165bc7: 4d8b5010 mov r10, qword ptr [r8 + 0x10]
140165bcb: 4983ea80 sub r10, -0x80
140165bcf: 4983781805 cmp qword ptr [r8 + 0x18], 5
140165bd4: 4c8b1db5a6ef07 mov r11, qword ptr [rip + 0x7efa6b5]
140165bdb: 4d0f42d3 cmovb r10, r11
140165bdf: 41803804 cmp byte ptr [r8], 4
140165be3: 4d0f45d3 cmovne r10, r11
140165be7: 41803a02 cmp byte ptr [r10], 2
140165beb: 0f85eafdffff jne 0x1401659db
140165bf1: 4d8b4208 mov r8, qword ptr [r10 + 8]
140165bf5: 4983f802 cmp r8, 2
140165bf9: 0f84cffdffff je 0x1401659ce
140165bff: 4183f801 cmp r8d, 1
140165c03: 750e jne 0x140165c13
140165c05: 0f57c0 xorps xmm0, xmm0
140165c08: f2490f2a4210 cvtsi2sd xmm0, qword ptr [r10 + 0x10]
140165c0e: e9c1fdffff jmp 0x1401659d4
140165c13: f2410f104a10 movsd xmm1, qword ptr [r10 + 0x10]
140165c19: 410f14c8 unpcklps xmm1, xmm8
140165c1d: 66410f5cc9 subpd xmm1, xmm9
140165c22: 660f28c1 movapd xmm0, xmm1
140165c26: 660f15c1 unpckhpd xmm0, xmm1
140165c2a: f20f58c1 addsd xmm0, xmm1
140165c2e: e9a1fdffff jmp 0x1401659d4
140165c33: ba02000000 mov edx, 2
140165c38: 488d0de0d9c705 lea rcx, [rip + 0x5c7d9e0]
140165c3f: 4989f8 mov r8, rdi
140165c42: e899509802 call 0x142aeace0
140165c47: 90 nop
140165c48: 4885c0 test rax, rax
140165c4b: 7507 jne 0x140165c54
140165c4d: 488b053ca6ef07 mov rax, qword ptr [rip + 0x7efa63c]
140165c54: 803804 cmp byte ptr [rax], 4
140165c57: 7527 jne 0x140165c80
140165c59: 488b5010 mov rdx, qword ptr [rax + 0x10]
140165c5d: 4c8b4018 mov r8, qword ptr [rax + 0x18]
140165c61: 49c1e005 shl r8, 5
140165c65: 4901d0 add r8, rdx
140165c68: 488d4df0 lea rcx, [rbp - 0x10]
140165c6c: e88ffdf3ff call 0x1400a5a00
140165c71: 90 nop
140165c72: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
140165c76: 488b4df8 mov rcx, qword ptr [rbp - 8]
140165c7a: 488b4500 mov rax, qword ptr [rbp]
140165c7e: eb09 jmp 0x140165c89
140165c80: b908000000 mov ecx, 8
140165c85: 31d2 xor edx, edx
140165c87: 31c0 xor eax, eax
140165c89: 458927 mov dword ptr [r15], r12d
140165c8c: 4d8b4d08 mov r9, qword ptr [r13 + 8]
140165c90: 4d8b4510 mov r8, qword ptr [r13 + 0x10]
140165c94: 49c1e007 shl r8, 7
140165c98: 4d01c8 add r8, r9
140165c9b: 4989c2 mov r10, rax
140165c9e: 49bbf8ffffffffffff0f movabs r11, 0xffffffffffffff8
140165ca8: 4d21da and r10, r11
140165cab: c1e003 shl eax, 3
140165cae: 83e038 and eax, 0x38
140165cb1: eb18 jmp 0x140165ccb
140165cb3: 31f6 xor esi, esi
140165cb5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
140165cc0: 4188737c mov byte ptr [r11 + 0x7c], sil
140165cc4: 488dbd80000000 lea rdi, [rbp + 0x80]
140165ccb: 4d39c1 cmp r9, r8
140165cce: 0f8414010000 je 0x140165de8
140165cd4: 4d89cb mov r11, r9
140165cd7: 4981c180000000 add r9, 0x80
140165cde: 41807b3000 cmp byte ptr [r11 + 0x30], 0
140165ce3: 75e6 jne 0x140165ccb
140165ce5: 498b7b38 mov rdi, qword ptr [r11 + 0x38]
140165ce9: 31db xor ebx, ebx
140165ceb: 0f1f440000 nop dword ptr [rax + rax]
140165cf0: 4939da cmp r10, rbx
140165cf3: 7440 je 0x140165d35
140165cf5: 40b601 mov sil, 1
140165cf8: 48393cd9 cmp qword ptr [rcx + rbx*8], rdi
140165cfc: 74c2 je 0x140165cc0
140165cfe: 48397cd908 cmp qword ptr [rcx + rbx*8 + 8], rdi
140165d03: 74bb je 0x140165cc0
140165d05: 48397cd910 cmp qword ptr [rcx + rbx*8 + 0x10], rdi
140165d0a: 74b4 je 0x140165cc0
140165d0c: 48397cd918 cmp qword ptr [rcx + rbx*8 + 0x18], rdi
140165d11: 74ad je 0x140165cc0
140165d13: 48397cd920 cmp qword ptr [rcx + rbx*8 + 0x20], rdi
140165d18: 74a6 je 0x140165cc0
140165d1a: 48397cd928 cmp qword ptr [rcx + rbx*8 + 0x28], rdi
140165d1f: 749f je 0x140165cc0
140165d21: 48397cd930 cmp qword ptr [rcx + rbx*8 + 0x30], rdi
140165d26: 7498 je 0x140165cc0
140165d28: 48397cd938 cmp qword ptr [rcx + rbx*8 + 0x38], rdi
140165d2d: 488d5b08 lea rbx, [rbx + 8]
140165d31: 75bd jne 0x140165cf0
140165d33: eb8b jmp 0x140165cc0
140165d35: 4885c0 test rax, rax
140165d38: 0f8475ffffff je 0x140165cb3
140165d3e: 4a393cd1 cmp qword ptr [rcx + r10*8], rdi
140165d42: 400f94c6 sete sil
140165d46: 0f8474ffffff je 0x140165cc0
140165d4c: 83f808 cmp eax, 8
140165d4f: 0f846bffffff je 0x140165cc0
140165d55: 4a397cd108 cmp qword ptr [rcx + r10*8 + 8], rdi
140165d5a: 400f94c6 sete sil
140165d5e: 0f845cffffff je 0x140165cc0
140165d64: 83f810 cmp eax, 0x10
140165d67: 0f8453ffffff je 0x140165cc0
140165d6d: 4a397cd110 cmp qword ptr [rcx + r10*8 + 0x10], rdi
140165d72: 400f94c6 sete sil
140165d76: 0f8444ffffff je 0x140165cc0
140165d7c: 83f818 cmp eax, 0x18
140165d7f: 0f843bffffff je 0x140165cc0
140165d85: 4a397cd118 cmp qword ptr [rcx + r10*8 + 0x18], rdi
140165d8a: 400f94c6 sete sil
140165d8e: 0f842cffffff je 0x140165cc0
140165d94: 83f820 cmp eax, 0x20
140165d97: 0f8423ffffff je 0x140165cc0
140165d9d: 4a397cd120 cmp qword ptr [rcx + r10*8 + 0x20], rdi
140165da2: 400f94c6 sete sil
140165da6: 0f8414ffffff je 0x140165cc0
140165dac: 83f828 cmp eax, 0x28
140165daf: 0f840bffffff je 0x140165cc0
140165db5: 4a397cd128 cmp qword ptr [rcx + r10*8 + 0x28], rdi
140165dba: 400f94c6 sete sil
140165dbe: 0f84fcfeffff je 0x140165cc0
140165dc4: 83f830 cmp eax, 0x30
140165dc7: 0f84f3feffff je 0x140165cc0
140165dcd: 31f6 xor esi, esi
140165dcf: 83f838 cmp eax, 0x38
140165dd2: 400f95c6 setne sil
140165dd6: 4a397cd130 cmp qword ptr [rcx + r10*8 + 0x30], rdi
140165ddb: bf01000000 mov edi, 1
140165de0: 0f44f7 cmove esi, edi
140165de3: e9d8feffff jmp 0x140165cc0
140165de8: 4885d2 test rdx, rdx
140165deb: 0f8447faffff je 0x140165838
140165df1: 48c1e203 shl rdx, 3
140165df5: 41b808000000 mov r8d, 8
140165dfb: e8d0c3e9ff call 0x1400021d0
140165e00: e933faffff jmp 0x140165838
140165e05: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165e0a: 450f57e4 xorps xmm12, xmm12
140165e0e: f2440f5ae0 cvtsd2ss xmm12, xmm0
140165e13: e95e020000 jmp 0x140166076
140165e18: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140165e1d: 410f14c8 unpcklps xmm1, xmm8
140165e21: 66410f5cc9 subpd xmm1, xmm9
140165e26: 660f28c1 movapd xmm0, xmm1
140165e2a: 660f15c1 unpckhpd xmm0, xmm1
140165e2e: f20f58c1 addsd xmm0, xmm1
140165e32: 450f57e4 xorps xmm12, xmm12
140165e36: f2440f5ae0 cvtsd2ss xmm12, xmm0
140165e3b: e936020000 jmp 0x140166076
140165e40: ba03000000 mov edx, 3
140165e45: 488d0de0d7c705 lea rcx, [rip + 0x5c7d7e0]
140165e4c: 4989f8 mov r8, rdi
140165e4f: e88c4e9802 call 0x142aeace0
140165e54: 90 nop
140165e55: 4885c0 test rax, rax
140165e58: 7507 jne 0x140165e61
140165e5a: 488b052fa4ef07 mov rax, qword ptr [rip + 0x7efa42f]
140165e61: 450f57e4 xorps xmm12, xmm12
140165e65: 803802 cmp byte ptr [rax], 2
140165e68: 0f851a010000 jne 0x140165f88
140165e6e: 488b4808 mov rcx, qword ptr [rax + 8]
140165e72: 4883f902 cmp rcx, 2
140165e76: 7477 je 0x140165eef
140165e78: 83f901 cmp ecx, 1
140165e7b: 0f85e4000000 jne 0x140165f65
140165e81: 0f57c0 xorps xmm0, xmm0
140165e84: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140165e8a: eb68 jmp 0x140165ef4
140165e8c: ba01000000 mov edx, 1
140165e91: 488d0d90d7c705 lea rcx, [rip + 0x5c7d790]
140165e98: 4989f8 mov r8, rdi
140165e9b: e8404e9802 call 0x142aeace0
140165ea0: 90 nop
140165ea1: 4885c0 test rax, rax
140165ea4: 7507 jne 0x140165ead
140165ea6: 488b05e3a3ef07 mov rax, qword ptr [rip + 0x7efa3e3]
140165ead: 450f57e4 xorps xmm12, xmm12
140165eb1: 803802 cmp byte ptr [rax], 2
140165eb4: 0f853e010000 jne 0x140165ff8
140165eba: 488b4808 mov rcx, qword ptr [rax + 8]
140165ebe: 4883f902 cmp rcx, 2
140165ec2: 0f84fd000000 je 0x140165fc5
140165ec8: 83f901 cmp ecx, 1
140165ecb: 0f8504010000 jne 0x140165fd5
140165ed1: 0f57c0 xorps xmm0, xmm0
140165ed4: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140165eda: e9eb000000 jmp 0x140165fca
140165edf: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165ee4: 450f57e4 xorps xmm12, xmm12
140165ee8: f2440f5ae0 cvtsd2ss xmm12, xmm0
140165eed: eb36 jmp 0x140165f25
140165eef: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165ef4: 450f57e4 xorps xmm12, xmm12
140165ef8: f2440f5ae0 cvtsd2ss xmm12, xmm0
140165efd: e986000000 jmp 0x140165f88
140165f02: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165f07: 410f14c0 unpcklps xmm0, xmm8
140165f0b: 66410f5cc1 subpd xmm0, xmm9
140165f10: 660f28c8 movapd xmm1, xmm0
140165f14: 660f15c8 unpckhpd xmm1, xmm0
140165f18: f20f58c8 addsd xmm1, xmm0
140165f1c: 450f57e4 xorps xmm12, xmm12
140165f20: f2440f5ae1 cvtsd2ss xmm12, xmm1
140165f25: ba01000000 mov edx, 1
140165f2a: 488d0df7d6c705 lea rcx, [rip + 0x5c7d6f7]
140165f31: 4989f8 mov r8, rdi
140165f34: e8a74d9802 call 0x142aeace0
140165f39: 90 nop
140165f3a: 4885c0 test rax, rax
140165f3d: 7507 jne 0x140165f46
140165f3f: 488b054aa3ef07 mov rax, qword ptr [rip + 0x7efa34a]
140165f46: be01000000 mov esi, 1
140165f4b: 660f57c0 xorpd xmm0, xmm0
140165f4f: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
140165f57: 803802 cmp byte ptr [rax], 2
140165f5a: 0f84cf000000 je 0x14016602f
140165f60: e911010000 jmp 0x140166076
140165f65: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165f6a: 410f14c0 unpcklps xmm0, xmm8
140165f6e: 66410f5cc1 subpd xmm0, xmm9
140165f73: 660f28c8 movapd xmm1, xmm0
140165f77: 660f15c8 unpckhpd xmm1, xmm0
140165f7b: f20f58c8 addsd xmm1, xmm0
140165f7f: 450f57e4 xorps xmm12, xmm12
140165f83: f2440f5ae1 cvtsd2ss xmm12, xmm1
140165f88: ba01000000 mov edx, 1
140165f8d: 488d0d9bd6c705 lea rcx, [rip + 0x5c7d69b]
140165f94: 4989f8 mov r8, rdi
140165f97: e8444d9802 call 0x142aeace0
140165f9c: 90 nop
140165f9d: 4885c0 test rax, rax
140165fa0: 7507 jne 0x140165fa9
140165fa2: 488b05e7a2ef07 mov rax, qword ptr [rip + 0x7efa2e7]
140165fa9: be02000000 mov esi, 2
140165fae: 660f57c0 xorpd xmm0, xmm0
140165fb2: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
140165fba: 803802 cmp byte ptr [rax], 2
140165fbd: 0f85b3000000 jne 0x140166076
140165fc3: eb6a jmp 0x14016602f
140165fc5: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165fca: 450f57e4 xorps xmm12, xmm12
140165fce: f2440f5ae0 cvtsd2ss xmm12, xmm0
140165fd3: eb23 jmp 0x140165ff8
140165fd5: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140165fda: 410f14c0 unpcklps xmm0, xmm8
140165fde: 66410f5cc1 subpd xmm0, xmm9
140165fe3: 660f28c8 movapd xmm1, xmm0
140165fe7: 660f15c8 unpckhpd xmm1, xmm0
140165feb: f20f58c8 addsd xmm1, xmm0
140165fef: 450f57e4 xorps xmm12, xmm12
140165ff3: f2440f5ae1 cvtsd2ss xmm12, xmm1
140165ff8: ba03000000 mov edx, 3
140165ffd: 488d0d25d6c705 lea rcx, [rip + 0x5c7d625]
140166004: 4989f8 mov r8, rdi
140166007: e8d44c9802 call 0x142aeace0
14016600c: 90 nop
14016600d: 4885c0 test rax, rax
140166010: 7507 jne 0x140166019
140166012: 488b0577a2ef07 mov rax, qword ptr [rip + 0x7efa277]
140166019: be03000000 mov esi, 3
14016601e: 660f57c0 xorpd xmm0, xmm0
140166022: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
14016602a: 803802 cmp byte ptr [rax], 2
14016602d: 7547 jne 0x140166076
14016602f: 488b4808 mov rcx, qword ptr [rax + 8]
140166033: 4883f902 cmp rcx, 2
140166037: 7410 je 0x140166049
140166039: 83f901 cmp ecx, 1
14016603c: 7512 jne 0x140166050
14016603e: 0f57c0 xorps xmm0, xmm0
140166041: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140166047: eb21 jmp 0x14016606a
140166049: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14016604e: eb1a jmp 0x14016606a
140166050: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140166055: 410f14c8 unpcklps xmm1, xmm8
140166059: 66410f5cc9 subpd xmm1, xmm9
14016605e: 660f28c1 movapd xmm0, xmm1
140166062: 660f15c1 unpckhpd xmm0, xmm1
140166066: f20f58c1 addsd xmm0, xmm1
14016606a: f20f5ac0 cvtsd2ss xmm0, xmm0
14016606e: f30f1185d4000000 movss dword ptr [rbp + 0xd4], xmm0
140166076: ba04000000 mov edx, 4
14016607b: 488d0db3d5c705 lea rcx, [rip + 0x5c7d5b3]
140166082: 4989f8 mov r8, rdi
140166085: e8564c9802 call 0x142aeace0
14016608a: 90 nop
14016608b: 4885c0 test rax, rax
14016608e: 7507 jne 0x140166097
140166090: 488b05f9a1ef07 mov rax, qword ptr [rip + 0x7efa1f9]
140166097: 803803 cmp byte ptr [rax], 3
14016609a: 7530 jne 0x1401660cc
14016609c: 488b4810 mov rcx, qword ptr [rax + 0x10]
1401660a0: 488b4018 mov rax, qword ptr [rax + 0x18]
1401660a4: 4883f804 cmp rax, 4
1401660a8: 0f8499000000 je 0x140166147
1401660ae: 4883f805 cmp rax, 5
1401660b2: 7518 jne 0x1401660cc
1401660b4: 8b01 mov eax, dword ptr [rcx]
1401660b6: ba746f7765 mov edx, 0x65776f74
1401660bb: 31d0 xor eax, edx
1401660bd: 0fb64904 movzx ecx, byte ptr [rcx + 4]
1401660c1: 83f172 xor ecx, 0x72
1401660c4: 09c1 or ecx, eax
1401660c6: 0f841d060000 je 0x1401666e9
1401660cc: 31db xor ebx, ebx
1401660ce: ba02000000 mov edx, 2
1401660d3: 488d0d47d5c705 lea rcx, [rip + 0x5c7d547]
1401660da: 4989f8 mov r8, rdi
1401660dd: e8fe4b9802 call 0x142aeace0
1401660e2: 90 nop
1401660e3: 4885c0 test rax, rax
1401660e6: 7507 jne 0x1401660ef
1401660e8: 488b05a1a1ef07 mov rax, qword ptr [rip + 0x7efa1a1]
1401660ef: 803802 cmp byte ptr [rax], 2
1401660f2: 7507 jne 0x1401660fb
1401660f4: 4883780800 cmp qword ptr [rax + 8], 0
1401660f9: 7446 je 0x140166141
1401660fb: 4531f6 xor r14d, r14d
1401660fe: ba01000000 mov edx, 1
140166103: 488d0d13d5c705 lea rcx, [rip + 0x5c7d513]
14016610a: 4989f8 mov r8, rdi
14016610d: e8ce4b9802 call 0x142aeace0
140166112: 90 nop
140166113: 4885c0 test rax, rax
140166116: 7507 jne 0x14016611f
140166118: 488b0571a1ef07 mov rax, qword ptr [rip + 0x7efa171]
14016611f: 0f57c0 xorps xmm0, xmm0
140166122: 803802 cmp byte ptr [rax], 2
140166125: 7564 jne 0x14016618b
140166127: 488b4808 mov rcx, qword ptr [rax + 8]
14016612b: 4883f902 cmp rcx, 2
14016612f: 7435 je 0x140166166
140166131: 83f901 cmp ecx, 1
140166134: 7537 jne 0x14016616d
140166136: 0f57c0 xorps xmm0, xmm0
140166139: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14016613f: eb46 jmp 0x140166187
140166141: 4c8b7010 mov r14, qword ptr [rax + 0x10]
140166145: ebb7 jmp 0x1401660fe
140166147: 8139706f6f6c cmp dword ptr [rcx], 0x6c6f6f70
14016614d: 0f849d050000 je 0x1401666f0
140166153: 31c0 xor eax, eax
140166155: 81396c697665 cmp dword ptr [rcx], 0x6576696c
14016615b: 0f94c0 sete al
14016615e: 8d1c40 lea ebx, [rax + rax*2]
140166161: e968ffffff jmp 0x1401660ce
140166166: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14016616b: eb1a jmp 0x140166187
14016616d: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140166172: 410f14c8 unpcklps xmm1, xmm8
140166176: 66410f5cc9 subpd xmm1, xmm9
14016617b: 660f28c1 movapd xmm0, xmm1
14016617f: 660f15c1 unpckhpd xmm0, xmm1
140166183: f20f58c1 addsd xmm0, xmm1
140166187: f20f5ac0 cvtsd2ss xmm0, xmm0
14016618b: f3410f114518 movss dword ptr [r13 + 0x18], xmm0
140166191: 458927 mov dword ptr [r15], r12d
140166194: f3410f11751c movss dword ptr [r13 + 0x1c], xmm6
14016619a: ba01000000 mov edx, 1
14016619f: 488d0d93d4c705 lea rcx, [rip + 0x5c7d493]
1401661a6: 4989f8 mov r8, rdi
1401661a9: e8324b9802 call 0x142aeace0
1401661ae: 90 nop
1401661af: 4885c0 test rax, rax
1401661b2: 7507 jne 0x1401661bb
1401661b4: 488b05d5a0ef07 mov rax, qword ptr [rip + 0x7efa0d5]
1401661bb: 450f57ed xorps xmm13, xmm13
1401661bf: 803802 cmp byte ptr [rax], 2
1401661c2: 7544 jne 0x140166208
1401661c4: 488b4808 mov rcx, qword ptr [rax + 8]
1401661c8: 4883f902 cmp rcx, 2
1401661cc: 7410 je 0x1401661de
1401661ce: 83f901 cmp ecx, 1
1401661d1: 7512 jne 0x1401661e5
1401661d3: 0f57c0 xorps xmm0, xmm0
1401661d6: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401661dc: eb21 jmp 0x1401661ff
1401661de: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401661e3: eb1a jmp 0x1401661ff
1401661e5: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1401661ea: 410f14c8 unpcklps xmm1, xmm8
1401661ee: 66410f5cc9 subpd xmm1, xmm9
1401661f3: 660f28c1 movapd xmm0, xmm1
1401661f7: 660f15c1 unpckhpd xmm0, xmm1
1401661fb: f20f58c1 addsd xmm0, xmm1
1401661ff: 450f57ed xorps xmm13, xmm13
140166203: f2440f5ae8 cvtsd2ss xmm13, xmm0
140166208: ba01000000 mov edx, 1
14016620d: 488d0d26d4c705 lea rcx, [rip + 0x5c7d426]
140166214: 4989f8 mov r8, rdi
140166217: e8c44a9802 call 0x142aeace0
14016621c: 90 nop
14016621d: 4885c0 test rax, rax
140166220: 7507 jne 0x140166229
140166222: 488b0567a0ef07 mov rax, qword ptr [rip + 0x7efa067]
140166229: 450f57f6 xorps xmm14, xmm14
14016622d: 803802 cmp byte ptr [rax], 2
140166230: 7544 jne 0x140166276
140166232: 488b4808 mov rcx, qword ptr [rax + 8]
140166236: 4883f902 cmp rcx, 2
14016623a: 7410 je 0x14016624c
14016623c: 83f901 cmp ecx, 1
14016623f: 7512 jne 0x140166253
140166241: 0f57c0 xorps xmm0, xmm0
140166244: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14016624a: eb21 jmp 0x14016626d
14016624c: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140166251: eb1a jmp 0x14016626d
140166253: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140166258: 410f14c8 unpcklps xmm1, xmm8
14016625c: 66410f5cc9 subpd xmm1, xmm9
140166261: 660f28c1 movapd xmm0, xmm1
140166265: 660f15c1 unpckhpd xmm0, xmm1
140166269: f20f58c1 addsd xmm0, xmm1
14016626d: 450f57f6 xorps xmm14, xmm14
140166271: f2440f5af0 cvtsd2ss xmm14, xmm0
140166276: ba01000000 mov edx, 1
14016627b: 488d0db9d3c705 lea rcx, [rip + 0x5c7d3b9]
140166282: 4989f8 mov r8, rdi
140166285: e8564a9802 call 0x142aeace0
14016628a: 90 nop
14016628b: 4885c0 test rax, rax
14016628e: 7507 jne 0x140166297
140166290: 488b05f99fef07 mov rax, qword ptr [rip + 0x7ef9ff9]
140166297: 450f57ff xorps xmm15, xmm15
14016629b: 803802 cmp byte ptr [rax], 2
14016629e: 7544 jne 0x1401662e4
1401662a0: 488b4808 mov rcx, qword ptr [rax + 8]
1401662a4: 4883f902 cmp rcx, 2
1401662a8: 7410 je 0x1401662ba
1401662aa: 83f901 cmp ecx, 1
1401662ad: 7512 jne 0x1401662c1
1401662af: 0f57c0 xorps xmm0, xmm0
1401662b2: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1401662b8: eb21 jmp 0x1401662db
1401662ba: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1401662bf: eb1a jmp 0x1401662db
1401662c1: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1401662c6: 410f14c8 unpcklps xmm1, xmm8
1401662ca: 66410f5cc9 subpd xmm1, xmm9
1401662cf: 660f28c1 movapd xmm0, xmm1
1401662d3: 660f15c1 unpckhpd xmm0, xmm1
1401662d7: f20f58c1 addsd xmm0, xmm1
1401662db: 450f57ff xorps xmm15, xmm15
1401662df: f2440f5af8 cvtsd2ss xmm15, xmm0
1401662e4: ba01000000 mov edx, 1
1401662e9: 488d0d4cd3c705 lea rcx, [rip + 0x5c7d34c]
1401662f0: 4989f8 mov r8, rdi
1401662f3: e8e8499802 call 0x142aeace0
1401662f8: 90 nop
1401662f9: 4885c0 test rax, rax
1401662fc: 7507 jne 0x140166305
1401662fe: 488b058b9fef07 mov rax, qword ptr [rip + 0x7ef9f8b]
140166305: 450f57d2 xorps xmm10, xmm10
140166309: 803802 cmp byte ptr [rax], 2
14016630c: 7544 jne 0x140166352
14016630e: 488b4808 mov rcx, qword ptr [rax + 8]
140166312: 4883f902 cmp rcx, 2
140166316: 7410 je 0x140166328
140166318: 83f901 cmp ecx, 1
14016631b: 7512 jne 0x14016632f
14016631d: 0f57c0 xorps xmm0, xmm0
140166320: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140166326: eb21 jmp 0x140166349
140166328: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14016632d: eb1a jmp 0x140166349
14016632f: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
140166334: 410f14c8 unpcklps xmm1, xmm8
140166338: 66410f5cc9 subpd xmm1, xmm9
14016633d: 660f28c1 movapd xmm0, xmm1
140166341: 660f15c1 unpckhpd xmm0, xmm1
140166345: f20f58c1 addsd xmm0, xmm1
140166349: 450f57d2 xorps xmm10, xmm10
14016634d: f2440f5ad0 cvtsd2ss xmm10, xmm0
140166352: ba02000000 mov edx, 2
140166357: 488d0ddfd2c705 lea rcx, [rip + 0x5c7d2df]
14016635e: 4989f8 mov r8, rdi
140166361: e87a499802 call 0x142aeace0
140166366: 90 nop
140166367: 4885c0 test rax, rax
14016636a: 7507 jne 0x140166373
14016636c: 488b051d9fef07 mov rax, qword ptr [rip + 0x7ef9f1d]
140166373: 450f57db xorps xmm11, xmm11
140166377: 803802 cmp byte ptr [rax], 2
14016637a: 7544 jne 0x1401663c0
14016637c: 488b4808 mov rcx, qword ptr [rax + 8]
140166380: 4883f902 cmp rcx, 2
140166384: 7410 je 0x140166396
140166386: 83f901 cmp ecx, 1
140166389: 7512 jne 0x14016639d
14016638b: 0f57c0 xorps xmm0, xmm0
14016638e: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140166394: eb21 jmp 0x1401663b7
140166396: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14016639b: eb1a jmp 0x1401663b7
14016639d: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1401663a2: 410f14c8 unpcklps xmm1, xmm8
1401663a6: 66410f5cc9 subpd xmm1, xmm9
1401663ab: 660f28c1 movapd xmm0, xmm1
1401663af: 660f15c1 unpckhpd xmm0, xmm1
1401663b3: f20f58c1 addsd xmm0, xmm1
1401663b7: 450f57db xorps xmm11, xmm11
1401663bb: f2440f5ad8 cvtsd2ss xmm11, xmm0
1401663c0: ba02000000 mov edx, 2
1401663c5: 488d0d73d2c705 lea rcx, [rip + 0x5c7d273]
1401663cc: 4989f8 mov r8, rdi
1401663cf: e80c499802 call 0x142aeace0
1401663d4: 90 nop
1401663d5: 4885c0 test rax, rax
1401663d8: 7507 jne 0x1401663e1
1401663da: 488b05af9eef07 mov rax, qword ptr [rip + 0x7ef9eaf]
1401663e1: 0f57ff xorps xmm7, xmm7
1401663e4: 803802 cmp byte ptr [rax], 2
1401663e7: 7542 jne 0x14016642b
1401663e9: 488b4808 mov rcx, qword ptr [rax + 8]
1401663ed: 4883f902 cmp rcx, 2
1401663f1: 7410 je 0x140166403
1401663f3: 83f901 cmp ecx, 1
1401663f6: 7512 jne 0x14016640a
1401663f8: 0f57c0 xorps xmm0, xmm0
1401663fb: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
140166401: eb21 jmp 0x140166424
140166403: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
140166408: eb1a jmp 0x140166424
14016640a: f20f104810 movsd xmm1, qword ptr [rax + 0x10]
14016640f: 410f14c8 unpcklps xmm1, xmm8
140166413: 66410f5cc9 subpd xmm1, xmm9
140166418: 660f28c1 movapd xmm0, xmm1
14016641c: 660f15c1 unpckhpd xmm0, xmm1
140166420: f20f58c1 addsd xmm0, xmm1
140166424: 0f57ff xorps xmm7, xmm7
140166427: f20f5af8 cvtsd2ss xmm7, xmm0
14016642b: 899dbc000000 mov dword ptr [rbp + 0xbc], ebx
140166431: 89b5c0000000 mov dword ptr [rbp + 0xc0], esi
140166437: 458927 mov dword ptr [r15], r12d
14016643a: 498b5d08 mov rbx, qword ptr [r13 + 8]
14016643e: 4d8b6510 mov r12, qword ptr [r13 + 0x10]
140166442: 4c89e7 mov rdi, r12
140166445: 48c1e707 shl rdi, 7
140166449: 31c0 xor eax, eax
14016644b: 0f1f440000 nop dword ptr [rax + rax]
140166450: 4839c7 cmp rdi, rax
140166453: 745b je 0x1401664b0
140166455: 488db080000000 lea rsi, [rax + 0x80]
14016645c: 4c39740338 cmp qword ptr [rbx + rax + 0x38], r14
140166461: 4889f0 mov rax, rsi
140166464: 75ea jne 0x140166450
140166466: 488b7c3390 mov rdi, qword ptr [rbx + rsi - 0x70]
14016646b: 4885ff test rdi, rdi
14016646e: 0f8435010000 je 0x1401665a9
140166474: 4c8b643388 mov r12, qword ptr [rbx + rsi - 0x78]
140166479: 4983c408 add r12, 8
14016647d: eb0e jmp 0x14016648d
14016647f: 90 nop
140166480: 4983c430 add r12, 0x30
140166484: 48ffcf dec rdi
140166487: 0f841c010000 je 0x1401665a9
14016648d: 498b4424f8 mov rax, qword ptr [r12 - 8]
140166492: 4885c0 test rax, rax
140166495: 74e9 je 0x140166480
140166497: 498b0c24 mov rcx, qword ptr [r12]
14016649b: 48c1e002 shl rax, 2
14016649f: 488d14c0 lea rdx, [rax + rax*8]
1401664a3: 41b804000000 mov r8d, 4
1401664a9: e822bde9ff call 0x1400021d0
1401664ae: ebd0 jmp 0x140166480
1401664b0: 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1401664b8: 48c745f808000000 mov qword ptr [rbp - 8], 8
1401664c0: 488d4500 lea rax, [rbp]
1401664c4: 0f57c0 xorps xmm0, xmm0
1401664c7: 0f1100 movups xmmword ptr [rax], xmm0
1401664ca: 48c7451008000000 mov qword ptr [rbp + 0x10], 8
1401664d2: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
1401664da: c7452000000000 mov dword ptr [rbp + 0x20], 0
1401664e1: 4c897528 mov qword ptr [rbp + 0x28], r14
1401664e5: c7453000000000 mov dword ptr [rbp + 0x30], 0
1401664ec: 8b85c0000000 mov eax, dword ptr [rbp + 0xc0]
1401664f2: 894544 mov dword ptr [rbp + 0x44], eax
1401664f5: f3440f116548 movss dword ptr [rbp + 0x48], xmm12
1401664fb: f30f1085d4000000 movss xmm0, dword ptr [rbp + 0xd4]
140166503: f30f11454c movss dword ptr [rbp + 0x4c], xmm0
140166508: f3440f116d50 movss dword ptr [rbp + 0x50], xmm13
14016650e: f3440f117554 movss dword ptr [rbp + 0x54], xmm14
140166514: f3440f117d58 movss dword ptr [rbp + 0x58], xmm15
14016651a: f3440f11555c movss dword ptr [rbp + 0x5c], xmm10
140166520: f3440f115d60 movss dword ptr [rbp + 0x60], xmm11
140166526: f30f117d64 movss dword ptr [rbp + 0x64], xmm7
14016652b: c7456800000000 mov dword ptr [rbp + 0x68], 0
140166532: c6456c00 mov byte ptr [rbp + 0x6c], 0
140166536: 8b85bc000000 mov eax, dword ptr [rbp + 0xbc]
14016653c: 88456d mov byte ptr [rbp + 0x6d], al
14016653f: 4d3b6500 cmp r12, qword ptr [r13]
140166543: 750d jne 0x140166552
140166545: 4c89e9 mov rcx, r13
140166548: e8e347a905 call 0x145bfad30
14016654d: 90 nop
14016654e: 498b5d08 mov rbx, qword ptr [r13 + 8]
140166552: 0f104560 movups xmm0, xmmword ptr [rbp + 0x60]
140166556: 0f11443b70 movups xmmword ptr [rbx + rdi + 0x70], xmm0
14016655b: 0f104550 movups xmm0, xmmword ptr [rbp + 0x50]
14016655f: 0f11443b60 movups xmmword ptr [rbx + rdi + 0x60], xmm0
140166564: 0f104540 movups xmm0, xmmword ptr [rbp + 0x40]
140166568: 0f11443b50 movups xmmword ptr [rbx + rdi + 0x50], xmm0
14016656d: 0f104530 movups xmm0, xmmword ptr [rbp + 0x30]
140166571: 0f11443b40 movups xmmword ptr [rbx + rdi + 0x40], xmm0
140166576: 660f1045f0 movupd xmm0, xmmword ptr [rbp - 0x10]
14016657b: 0f104d00 movups xmm1, xmmword ptr [rbp]
14016657f: 660f105510 movupd xmm2, xmmword ptr [rbp + 0x10]
140166584: 0f105d20 movups xmm3, xmmword ptr [rbp + 0x20]
140166588: 0f115c3b30 movups xmmword ptr [rbx + rdi + 0x30], xmm3
14016658d: 660f11543b20 movupd xmmword ptr [rbx + rdi + 0x20], xmm2
140166593: 0f114c3b10 movups xmmword ptr [rbx + rdi + 0x10], xmm1
140166598: 660f11043b movupd xmmword ptr [rbx + rdi], xmm0
14016659d: 49ffc4 inc r12
1401665a0: 4d896510 mov qword ptr [r13 + 0x10], r12
1401665a4: e981f2ffff jmp 0x14016582a
1401665a9: 488b443380 mov rax, qword ptr [rbx + rsi - 0x80]
1401665ae: 4885c0 test rax, rax
1401665b1: 741b je 0x1401665ce
1401665b3: 488d0c33 lea rcx, [rbx + rsi]
1401665b7: 488b4988 mov rcx, qword ptr [rcx - 0x78]
1401665bb: 48c1e004 shl rax, 4
1401665bf: 488d1440 lea rdx, [rax + rax*2]
1401665c3: 41b808000000 mov r8d, 8
1401665c9: e802bce9ff call 0x1400021d0
1401665ce: 488b7c33a8 mov rdi, qword ptr [rbx + rsi - 0x58]
1401665d3: 4885ff test rdi, rdi
1401665d6: 7444 je 0x14016661c
1401665d8: 4c8b6433a0 mov r12, qword ptr [rbx + rsi - 0x60]
1401665dd: 4983c408 add r12, 8
1401665e1: eb16 jmp 0x1401665f9
1401665e3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401665f0: 4983c430 add r12, 0x30
1401665f4: 48ffcf dec rdi
1401665f7: 7423 je 0x14016661c
1401665f9: 498b4424f8 mov rax, qword ptr [r12 - 8]
1401665fe: 4885c0 test rax, rax
140166601: 74ed je 0x1401665f0
140166603: 498b0c24 mov rcx, qword ptr [r12]
140166607: 48c1e002 shl rax, 2
14016660b: 488d14c0 lea rdx, [rax + rax*8]
14016660f: 41b804000000 mov r8d, 4
140166615: e8b6bbe9ff call 0x1400021d0
14016661a: ebd4 jmp 0x1401665f0
14016661c: 488b443398 mov rax, qword ptr [rbx + rsi - 0x68]
140166621: 4885c0 test rax, rax
140166624: 7418 je 0x14016663e
140166626: 488b4c33a0 mov rcx, qword ptr [rbx + rsi - 0x60]
14016662b: 48c1e004 shl rax, 4
14016662f: 488d1440 lea rdx, [rax + rax*2]
140166633: 41b808000000 mov r8d, 8
140166639: e892bbe9ff call 0x1400021d0
14016663e: 488d0433 lea rax, [rbx + rsi]
140166642: 4883c090 add rax, -0x70
140166646: 48c744338000000000 mov qword ptr [rbx + rsi - 0x80], 0
14016664f: 48c744338808000000 mov qword ptr [rbx + rsi - 0x78], 8
140166658: 0f57c0 xorps xmm0, xmm0
14016665b: 0f1100 movups xmmword ptr [rax], xmm0
14016665e: 48c74433a008000000 mov qword ptr [rbx + rsi - 0x60], 8
140166667: 48c74433a800000000 mov qword ptr [rbx + rsi - 0x58], 0
140166670: c74433b000000000 mov dword ptr [rbx + rsi - 0x50], 0
140166678: 4c897433b8 mov qword ptr [rbx + rsi - 0x48], r14
14016667d: c74433c000000000 mov dword ptr [rbx + rsi - 0x40], 0
140166685: 8b85c0000000 mov eax, dword ptr [rbp + 0xc0]
14016668b: 894433d4 mov dword ptr [rbx + rsi - 0x2c], eax
14016668f: f3440f116433d8 movss dword ptr [rbx + rsi - 0x28], xmm12
140166696: f30f1085d4000000 movss xmm0, dword ptr [rbp + 0xd4]
14016669e: f30f114433dc movss dword ptr [rbx + rsi - 0x24], xmm0
1401666a4: f3440f116c33e0 movss dword ptr [rbx + rsi - 0x20], xmm13
1401666ab: f3440f117433e4 movss dword ptr [rbx + rsi - 0x1c], xmm14
1401666b2: f3440f117c33e8 movss dword ptr [rbx + rsi - 0x18], xmm15
1401666b9: f3440f115433ec movss dword ptr [rbx + rsi - 0x14], xmm10
1401666c0: f3440f115c33f0 movss dword ptr [rbx + rsi - 0x10], xmm11
1401666c7: f30f117c33f4 movss dword ptr [rbx + rsi - 0xc], xmm7
1401666cd: c74433f800000000 mov dword ptr [rbx + rsi - 8], 0
1401666d5: c64433fc00 mov byte ptr [rbx + rsi - 4], 0
1401666da: 8b85bc000000 mov eax, dword ptr [rbp + 0xbc]
1401666e0: 884433fd mov byte ptr [rbx + rsi - 3], al
1401666e4: e941f1ffff jmp 0x14016582a
1401666e9: b301 mov bl, 1
1401666eb: e9def9ffff jmp 0x1401660ce
1401666f0: b302 mov bl, 2
1401666f2: e9d7f9ffff jmp 0x1401660ce
1401666f7: 488d4dc8 lea rcx, [rbp - 0x38]
1401666fb: e85009f4ff call 0x1400a7050
140166700: 458927 mov dword ptr [r15], r12d
140166703: 498b4510 mov rax, qword ptr [r13 + 0x10]
140166707: 4885c0 test rax, rax
14016670a: 0f84fe000000 je 0x14016680e
140166710: 498b5508 mov rdx, qword ptr [r13 + 8]
140166714: 31f6 xor esi, esi
140166716: 4889d1 mov rcx, rdx
140166719: eb15 jmp 0x140166730
14016671b: 0f1f440000 nop dword ptr [rax + rax]
140166720: 48ffc6 inc rsi
140166723: 4883e980 sub rcx, -0x80
140166727: 4839f0 cmp rax, rsi
14016672a: 0f84de000000 je 0x14016680e
140166730: 83793001 cmp dword ptr [rcx + 0x30], 1
140166734: 75ea jne 0x140166720
140166736: f30f104134 movss xmm0, dword ptr [rcx + 0x34]
14016673b: 0f2ec6 ucomiss xmm0, xmm6
14016673e: 77e0 ja 0x140166720
140166740: 488995b0000000 mov qword ptr [rbp + 0xb0], rdx
140166747: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14016674e: 4c89adc0000000 mov qword ptr [rbp + 0xc0], r13
140166755: 488d7e01 lea rdi, [rsi + 1]
140166759: 48897d78 mov qword ptr [rbp + 0x78], rdi
14016675d: 48897570 mov qword ptr [rbp + 0x70], rsi
140166761: e83a5ff2ff call 0x14008c6a0
140166766: 90 nop
140166767: eb57 jmp 0x1401667c0
140166769: 4889f0 mov rax, rsi
14016676c: 48c1e007 shl rax, 7
140166770: 0f104170 movups xmm0, xmmword ptr [rcx + 0x70]
140166774: 0f11440270 movups xmmword ptr [rdx + rax + 0x70], xmm0
140166779: 0f104160 movups xmm0, xmmword ptr [rcx + 0x60]
14016677d: 0f11440260 movups xmmword ptr [rdx + rax + 0x60], xmm0
140166782: 0f104150 movups xmm0, xmmword ptr [rcx + 0x50]
140166786: 0f11440250 movups xmmword ptr [rdx + rax + 0x50], xmm0
14016678b: 0f104140 movups xmm0, xmmword ptr [rcx + 0x40]
14016678f: 0f11440240 movups xmmword ptr [rdx + rax + 0x40], xmm0
140166794: 0f1001 movups xmm0, xmmword ptr [rcx]
140166797: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
14016679b: 660f105120 movupd xmm2, xmmword ptr [rcx + 0x20]
1401667a0: 0f105930 movups xmm3, xmmword ptr [rcx + 0x30]
1401667a4: 0f115c0230 movups xmmword ptr [rdx + rax + 0x30], xmm3
1401667a9: 660f11540220 movupd xmmword ptr [rdx + rax + 0x20], xmm2
1401667af: 0f114c0210 movups xmmword ptr [rdx + rax + 0x10], xmm1
1401667b4: 0f110402 movups xmmword ptr [rdx + rax], xmm0
1401667b8: 48ffc6 inc rsi
1401667bb: 48ffc7 inc rdi
1401667be: 6690 nop
1401667c0: 483bbdc8000000 cmp rdi, qword ptr [rbp + 0xc8]
1401667c7: 733a jae 0x140166803
1401667c9: 4889f8 mov rax, rdi
1401667cc: 48c1e007 shl rax, 7
1401667d0: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
1401667d7: 488d0c02 lea rcx, [rdx + rax]
1401667db: 837c023001 cmp dword ptr [rdx + rax + 0x30], 1
1401667e0: 7587 jne 0x140166769
1401667e2: f30f104134 movss xmm0, dword ptr [rcx + 0x34]
1401667e7: 0f2ec6 ucomiss xmm0, xmm6
1401667ea: 0f8779ffffff ja 0x140166769
1401667f0: 48ffc7 inc rdi
1401667f3: 48897d78 mov qword ptr [rbp + 0x78], rdi
1401667f7: 48897570 mov qword ptr [rbp + 0x70], rsi
1401667fb: e8a05ef2ff call 0x14008c6a0
140166800: 90 nop
140166801: ebbd jmp 0x1401667c0
140166803: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
14016680a: 48897010 mov qword ptr [rax + 0x10], rsi
14016680e: 0f28b5e0000000 movaps xmm6, xmmword ptr [rbp + 0xe0]
140166815: 0f28bdf0000000 movaps xmm7, xmmword ptr [rbp + 0xf0]
14016681c: 440f288500010000 movaps xmm8, xmmword ptr [rbp + 0x100]
140166824: 440f288d10010000 movaps xmm9, xmmword ptr [rbp + 0x110]
14016682c: 440f289520010000 movaps xmm10, xmmword ptr [rbp + 0x120]
140166834: 440f289d30010000 movaps xmm11, xmmword ptr [rbp + 0x130]
14016683c: 440f28a540010000 movaps xmm12, xmmword ptr [rbp + 0x140]
140166844: 440f28ad50010000 movaps xmm13, xmmword ptr [rbp + 0x150]
14016684c: 440f28b560010000 movaps xmm14, xmmword ptr [rbp + 0x160]
140166854: 440f28bd70010000 movaps xmm15, xmmword ptr [rbp + 0x170]
14016685c: 4881c408020000 add rsp, 0x208
140166863: 5b pop rbx
140166864: 5f pop rdi
140166865: 5e pop rsi
140166866: 415c pop r12
140166868: 415d pop r13
14016686a: 415e pop r14
14016686c: 415f pop r15
14016686e: 5d pop rbp
14016686f: c3 ret
