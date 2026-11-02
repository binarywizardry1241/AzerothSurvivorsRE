145929f40: 55 push rbp
145929f41: 4157 push r15
145929f43: 4156 push r14
145929f45: 4155 push r13
145929f47: 4154 push r12
145929f49: 56 push rsi
145929f4a: 57 push rdi
145929f4b: 53 push rbx
145929f4c: 4881ec58020000 sub rsp, 0x258
145929f53: 488dac2480000000 lea rbp, [rsp + 0x80]
145929f5b: 440f29bdc0010000 movaps xmmword ptr [rbp + 0x1c0], xmm15
145929f63: 440f29b5b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm14
145929f6b: 440f29ada0010000 movaps xmmword ptr [rbp + 0x1a0], xmm13
145929f73: 440f29a590010000 movaps xmmword ptr [rbp + 0x190], xmm12
145929f7b: 440f299d80010000 movaps xmmword ptr [rbp + 0x180], xmm11
145929f83: 440f299570010000 movaps xmmword ptr [rbp + 0x170], xmm10
145929f8b: 440f298d60010000 movaps xmmword ptr [rbp + 0x160], xmm9
145929f93: 440f298550010000 movaps xmmword ptr [rbp + 0x150], xmm8
145929f9b: 0f29bd40010000 movaps xmmword ptr [rbp + 0x140], xmm7
145929fa2: 0f29b530010000 movaps xmmword ptr [rbp + 0x130], xmm6
145929fa9: 48c78528010000feffffff mov qword ptr [rbp + 0x128], 0xfffffffffffffffe
145929fb4: 0f28f1 movaps xmm6, xmm1
145929fb7: 4889ce mov rsi, rcx
145929fba: f30f1081540a0000 movss xmm0, dword ptr [rcx + 0xa54]
145929fc2: 488b4158 mov rax, qword ptr [rcx + 0x58]
145929fc6: 488b4960 mov rcx, qword ptr [rcx + 0x60]
145929fca: 4889ca mov rdx, rcx
145929fcd: 48c1e204 shl rdx, 4
145929fd1: 4989c0 mov r8, rax
145929fd4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145929fe0: 4885d2 test rdx, rdx
145929fe3: 7451 je 0x14592a036
145929fe5: 4883c2f0 add rdx, -0x10
145929fe9: 410f2e400c ucomiss xmm0, dword ptr [r8 + 0xc]
145929fee: 4d8d4010 lea r8, [r8 + 0x10]
145929ff2: 72ec jb 0x145929fe0
145929ff4: 4885c9 test rcx, rcx
145929ff7: 7435 je 0x14592a02e
145929ff9: 4c8d481c lea r9, [rax + 0x1c]
145929ffd: 4889ca mov rdx, rcx
14592a000: 48f7da neg rdx
14592a003: 4531c0 xor r8d, r8d
14592a006: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592a010: f3410f1049f0 movss xmm1, dword ptr [r9 - 0x10]
14592a016: 0f2ec8 ucomiss xmm1, xmm0
14592a019: 0f86253e0000 jbe 0x14592de44
14592a01f: 49ffc0 inc r8
14592a022: 4983c110 add r9, 0x10
14592a026: 4989d2 mov r10, rdx
14592a029: 4d01c2 add r10, r8
14592a02c: 75e2 jne 0x14592a010
14592a02e: 4889f1 mov rcx, rsi
14592a031: e81a3efcff call 0x1458ede50
14592a036: 4c8bbec0000000 mov r15, qword ptr [rsi + 0xc0]
14592a03d: 4d85ff test r15, r15
14592a040: 0f84d4020000 je 0x14592a31a
14592a046: 4c8d656c lea r12, [rbp + 0x6c]
14592a04a: 31ff xor edi, edi
14592a04c: 0f57ff xorps xmm7, xmm7
14592a04f: 488d5d48 lea rbx, [rbp + 0x48]
14592a053: f3440f100554234800 movss xmm8, dword ptr [rip + 0x482354]
14592a05c: 4531ed xor r13d, r13d
14592a05f: eb3b jmp 0x14592a09c
14592a061: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592a070: 4839d7 cmp rdi, rdx
14592a073: 0f831e3f0000 jae 0x14592df97
14592a079: 488b86b8000000 mov rax, qword ptr [rsi + 0xb8]
14592a080: 42c744280c9a99993e mov dword ptr [rax + r13 + 0xc], 0x3e99999a
14592a089: 0f57ff xorps xmm7, xmm7
14592a08c: 48ffc7 inc rdi
14592a08f: 4983c568 add r13, 0x68
14592a093: 4939ff cmp r15, rdi
14592a096: 0f847e020000 je 0x14592a31a
14592a09c: 488b96c0000000 mov rdx, qword ptr [rsi + 0xc0]
14592a0a3: 4839d7 cmp rdi, rdx
14592a0a6: 0f839c3e0000 jae 0x14592df48
14592a0ac: 488b86b8000000 mov rax, qword ptr [rsi + 0xb8]
14592a0b3: f3420f1044280c movss xmm0, dword ptr [rax + r13 + 0xc]
14592a0ba: f30f5cc6 subss xmm0, xmm6
14592a0be: f3420f1144280c movss dword ptr [rax + r13 + 0xc], xmm0
14592a0c5: 488b96c0000000 mov rdx, qword ptr [rsi + 0xc0]
14592a0cc: 4839d7 cmp rdi, rdx
14592a0cf: 0f83623e0000 jae 0x14592df37
14592a0d5: 488b86b8000000 mov rax, qword ptr [rsi + 0xb8]
14592a0dc: f3460f104c280c movss xmm9, dword ptr [rax + r13 + 0xc]
14592a0e3: 440f2ecf ucomiss xmm9, xmm7
14592a0e7: 77a3 ja 0x14592a08c
14592a0e9: 4e8b3428 mov r14, qword ptr [rax + r13]
14592a0ed: f3460f105c2860 movss xmm11, dword ptr [rax + r13 + 0x60]
14592a0f4: 4889d9 mov rcx, rbx
14592a0f7: 4889f2 mov rdx, rsi
14592a0fa: 4d89f0 mov r8, r14
14592a0fd: e89eab0000 call 0x145934ca0
14592a102: 488b4548 mov rax, qword ptr [rbp + 0x48]
14592a106: 8b4d50 mov ecx, dword ptr [rbp + 0x50]
14592a109: f3440f10655c movss xmm12, dword ptr [rbp + 0x5c]
14592a10f: f20f104558 movsd xmm0, qword ptr [rbp + 0x58]
14592a114: 8b5560 mov edx, dword ptr [rbp + 0x60]
14592a117: f20f104d64 movsd xmm1, qword ptr [rbp + 0x64]
14592a11c: 410f101424 movups xmm2, xmmword ptr [r12]
14592a121: 0f2995f0000000 movaps xmmword ptr [rbp + 0xf0], xmm2
14592a128: 458b442410 mov r8d, dword ptr [r12 + 0x10]
14592a12d: 44898500010000 mov dword ptr [rbp + 0x100], r8d
14592a134: f30f109580000000 movss xmm2, dword ptr [rbp + 0x80]
14592a13c: 448b8584000000 mov r8d, dword ptr [rbp + 0x84]
14592a143: f3440f10ad88000000 movss xmm13, dword ptr [rbp + 0x88]
14592a14c: 410f105c2420 movups xmm3, xmmword ptr [r12 + 0x20]
14592a152: 0f299dc0000000 movaps xmmword ptr [rbp + 0xc0], xmm3
14592a159: 4d8b4c2430 mov r9, qword ptr [r12 + 0x30]
14592a15e: 4c898dd0000000 mov qword ptr [rbp + 0xd0], r9
14592a165: 4883780808 cmp qword ptr [rax + 8], 8
14592a16a: 450f28f0 movaps xmm14, xmm8
14592a16e: 7520 jne 0x14592a190
14592a170: 4c8b08 mov r9, qword ptr [rax]
14592a173: 450f28f0 movaps xmm14, xmm8
14592a177: 49ba68656c6c66697265 movabs r10, 0x657269666c6c6568
14592a181: 4d3911 cmp qword ptr [r9], r10
14592a184: 750a jne 0x14592a190
14592a186: f3440f1035e5e04700 movss xmm14, dword ptr [rip + 0x47e0e5]
14592a18f: 90 nop
14592a190: f3440f10bda4000000 movss xmm15, dword ptr [rbp + 0xa4]
14592a199: f3440f109690040000 movss xmm10, dword ptr [rsi + 0x490]
14592a1a2: f30f107848 movss xmm7, dword ptr [rax + 0x48]
14592a1a7: f30f593d05224800 mulss xmm7, dword ptr [rip + 0x482205]
14592a1af: 48894548 mov qword ptr [rbp + 0x48], rax
14592a1b3: 894d50 mov dword ptr [rbp + 0x50], ecx
14592a1b6: f3440f114d54 movss dword ptr [rbp + 0x54], xmm9
14592a1bc: 0f134558 movlps qword ptr [rbp + 0x58], xmm0
14592a1c0: 895560 mov dword ptr [rbp + 0x60], edx
14592a1c3: 0f134d64 movlps qword ptr [rbp + 0x64], xmm1
14592a1c7: 8b8500010000 mov eax, dword ptr [rbp + 0x100]
14592a1cd: 4189442410 mov dword ptr [r12 + 0x10], eax
14592a1d2: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
14592a1d9: 410f110424 movups xmmword ptr [r12], xmm0
14592a1de: f30f119580000000 movss dword ptr [rbp + 0x80], xmm2
14592a1e6: 44898584000000 mov dword ptr [rbp + 0x84], r8d
14592a1ed: f3440f11ad88000000 movss dword ptr [rbp + 0x88], xmm13
14592a1f6: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14592a1fd: 4989442430 mov qword ptr [r12 + 0x30], rax
14592a202: 0f2885c0000000 movaps xmm0, xmmword ptr [rbp + 0xc0]
14592a209: 410f11442420 movups xmmword ptr [r12 + 0x20], xmm0
14592a20f: f3440f11bda4000000 movss dword ptr [rbp + 0xa4], xmm15
14592a218: 4889f1 mov rcx, rsi
14592a21b: 4889da mov rdx, rbx
14592a21e: e89d55ffff call 0x14591f7c0
14592a223: f30f108690040000 movss xmm0, dword ptr [rsi + 0x490]
14592a22b: f3410f59c3 mulss xmm0, xmm11
14592a230: f3410f5fc0 maxss xmm0, xmm8
14592a235: 488b96c0000000 mov rdx, qword ptr [rsi + 0xc0]
14592a23c: 84c0 test al, al
14592a23e: 0f842cfeffff je 0x14592a070
14592a244: 4839d7 cmp rdi, rdx
14592a247: 0f834a3d0000 jae 0x14592df97
14592a24d: f3440f59e7 mulss xmm12, xmm7
14592a252: f3450f59ec mulss xmm13, xmm12
14592a257: f3450f59d5 mulss xmm10, xmm13
14592a25c: f3450f59fa mulss xmm15, xmm10
14592a261: 410f28cf movaps xmm1, xmm15
14592a265: f3410f5fce maxss xmm1, xmm14
14592a26a: 0f28d1 movaps xmm2, xmm1
14592a26d: f30fc2d103 cmpunordss xmm2, xmm1
14592a272: 440f54fa andps xmm15, xmm2
14592a276: 0f55d1 andnps xmm2, xmm1
14592a279: 410f56d7 orps xmm2, xmm15
14592a27d: 0f57c9 xorps xmm1, xmm1
14592a280: f3410fc2cb01 cmpltss xmm1, xmm11
14592a286: 0f28d9 movaps xmm3, xmm1
14592a289: 0f55da andnps xmm3, xmm2
14592a28c: 0f54c8 andps xmm1, xmm0
14592a28f: 0f56cb orps xmm1, xmm3
14592a292: 488b86b8000000 mov rax, qword ptr [rsi + 0xb8]
14592a299: f3420f114c280c movss dword ptr [rax + r13 + 0xc], xmm1
14592a2a0: 83be9c01000000 cmp dword ptr [rsi + 0x19c], 0
14592a2a7: 0f57ff xorps xmm7, xmm7
14592a2aa: 0f85dcfdffff jne 0x14592a08c
14592a2b0: 4883be3808000000 cmp qword ptr [rsi + 0x838], 0
14592a2b8: 0f84cefdffff je 0x14592a08c
14592a2be: 418b4640 mov eax, dword ptr [r14 + 0x40]
14592a2c2: 410fb64e74 movzx ecx, byte ptr [r14 + 0x74]
14592a2c7: 4c8d86d8040000 lea r8, [rsi + 0x4d8]
14592a2ce: 418b5008 mov edx, dword ptr [r8 + 8]
14592a2d2: 41895424f0 mov dword ptr [r12 - 0x10], edx
14592a2d7: 498b10 mov rdx, qword ptr [r8]
14592a2da: 49895424e8 mov qword ptr [r12 - 0x18], rdx
14592a2df: c6456503 mov byte ptr [rbp + 0x65], 3
14592a2e3: 894550 mov dword ptr [rbp + 0x50], eax
14592a2e6: 884d64 mov byte ptr [rbp + 0x64], cl
14592a2e9: 48c7454800000000 mov qword ptr [rbp + 0x48], 0
14592a2f1: c7456000000000 mov dword ptr [rbp + 0x60], 0
14592a2f8: 41c64424fe00 mov byte ptr [r12 - 2], 0
14592a2fe: 41c74424fa00000000 mov dword ptr [r12 - 6], 0
14592a307: 4889f1 mov rcx, rsi
14592a30a: 4889da mov rdx, rbx
14592a30d: 4531c0 xor r8d, r8d
14592a310: e84b550000 call 0x14592f860
14592a315: e972fdffff jmp 0x14592a08c
14592a31a: 488b9638080000 mov rdx, qword ptr [rsi + 0x838]
14592a321: 4885d2 test rdx, rdx
14592a324: 0f842c020000 je 0x14592a556
14592a32a: f30f1086540a0000 movss xmm0, dword ptr [rsi + 0xa54]
14592a332: 488b8630080000 mov rax, qword ptr [rsi + 0x830]
14592a339: 48c1e206 shl rdx, 6
14592a33d: 31c9 xor ecx, ecx
14592a33f: 31db xor ebx, ebx
14592a341: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592a350: 803c0815 cmp byte ptr [rax + rcx], 0x15
14592a354: 7411 je 0x14592a367
14592a356: 48ffc3 inc rbx
14592a359: 4883c140 add rcx, 0x40
14592a35d: 4839ca cmp rdx, rcx
14592a360: 75ee jne 0x14592a350
14592a362: e9ef010000 jmp 0x14592a556
14592a367: f30f108ea4010000 movss xmm1, dword ptr [rsi + 0x1a4]
14592a36f: 0f2ec8 ucomiss xmm1, xmm0
14592a372: 0f87de010000 ja 0x14592a556
14592a378: f30f10bea0010000 movss xmm7, dword ptr [rsi + 0x1a0]
14592a380: f30f100de8de4700 movss xmm1, dword ptr [rip + 0x47dee8]
14592a388: 0f2ecf ucomiss xmm1, xmm7
14592a38b: 0f87c5010000 ja 0x14592a556
14592a391: f30f10740804 movss xmm6, dword ptr [rax + rcx + 4]
14592a397: 8b7c080c mov edi, dword ptr [rax + rcx + 0xc]
14592a39b: f30f105c0808 movss xmm3, dword ptr [rax + rcx + 8]
14592a3a1: f30f5805c7de4700 addss xmm0, dword ptr [rip + 0x47dec7]
14592a3a9: f30f1186a4010000 movss dword ptr [rsi + 0x1a4], xmm0
14592a3b1: c786a001000000000000 mov dword ptr [rsi + 0x1a0], 0
14592a3bb: 8b86e0040000 mov eax, dword ptr [rsi + 0x4e0]
14592a3c1: 894550 mov dword ptr [rbp + 0x50], eax
14592a3c4: 488b86d8040000 mov rax, qword ptr [rsi + 0x4d8]
14592a3cb: 48894548 mov qword ptr [rbp + 0x48], rax
14592a3cf: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
14592a3d8: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
14592a3e1: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592a3e8: 4c8d4548 lea r8, [rbp + 0x48]
14592a3ec: 4889f2 mov rdx, rsi
14592a3ef: e8dcbbffff call 0x145925fd0
14592a3f4: 85ff test edi, edi
14592a3f6: 0f84ad000000 je 0x14592a4a9
14592a3fc: 488b9670040000 mov rdx, qword ptr [rsi + 0x470]
14592a403: 4c8b8dc8000000 mov r9, qword ptr [rbp + 0xc8]
14592a40a: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
14592a411: c785f000000002000000 mov dword ptr [rbp + 0xf0], 2
14592a41b: c785a800000000000000 mov dword ptr [rbp + 0xa8], 0
14592a425: 4c894de0 mov qword ptr [rbp - 0x20], r9
14592a429: c6850f01000001 mov byte ptr [rbp + 0x10f], 1
14592a430: 488d85a8000000 lea rax, [rbp + 0xa8]
14592a437: 4889442430 mov qword ptr [rsp + 0x30], rax
14592a43c: 488d85f0000000 lea rax, [rbp + 0xf0]
14592a443: 4889442428 mov qword ptr [rsp + 0x28], rax
14592a448: 4c89742420 mov qword ptr [rsp + 0x20], r14
14592a44d: 488d4d48 lea rcx, [rbp + 0x48]
14592a451: 4189f8 mov r8d, edi
14592a454: 4c898db8000000 mov qword ptr [rbp + 0xb8], r9
14592a45b: e800f6f9ff call 0x1458c9a60
14592a460: 90 nop
14592a461: 488bbe38060000 mov rdi, qword ptr [rsi + 0x638]
14592a468: 483bbe28060000 cmp rdi, qword ptr [rsi + 0x628]
14592a46f: 750d jne 0x14592a47e
14592a471: 488d8e28060000 lea rcx, [rsi + 0x628]
14592a478: e853e22d00 call 0x145c086d0
14592a47d: 90 nop
14592a47e: 488b8630060000 mov rax, qword ptr [rsi + 0x630]
14592a485: 4889f9 mov rcx, rdi
14592a488: 48c1e105 shl rcx, 5
14592a48c: 0f104548 movups xmm0, xmmword ptr [rbp + 0x48]
14592a490: 0f104d58 movups xmm1, xmmword ptr [rbp + 0x58]
14592a494: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14592a499: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592a49d: 48ffc7 inc rdi
14592a4a0: 4889be38060000 mov qword ptr [rsi + 0x638], rdi
14592a4a7: eb15 jmp 0x14592a4be
14592a4a9: 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
14592a4b0: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14592a4b7: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
14592a4be: 440f104620 movups xmm8, xmmword ptr [rsi + 0x20]
14592a4c3: 48c7462001000000 mov qword ptr [rsi + 0x20], 1
14592a4cb: 48895e28 mov qword ptr [rsi + 0x28], rbx
14592a4cf: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
14592a4d6: 48894538 mov qword ptr [rbp + 0x38], rax
14592a4da: 4d85f6 test r14, r14
14592a4dd: 7453 je 0x14592a532
14592a4df: 49c1e603 shl r14, 3
14592a4e3: f30f59f7 mulss xmm6, xmm7
14592a4e7: 0fb69ead010000 movzx ebx, byte ptr [rsi + 0x1ad]
14592a4ee: 31ff xor edi, edi
14592a4f0: 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
14592a4f7: 488b1438 mov rdx, qword ptr [rax + rdi]
14592a4fb: c686ad01000003 mov byte ptr [rsi + 0x1ad], 3
14592a502: c644243000 mov byte ptr [rsp + 0x30], 0
14592a507: c644242800 mov byte ptr [rsp + 0x28], 0
14592a50c: c644242003 mov byte ptr [rsp + 0x20], 3
14592a511: 4889f1 mov rcx, rsi
14592a514: 0f28d6 movaps xmm2, xmm6
14592a517: 41b9e4020000 mov r9d, 0x2e4
14592a51d: e88ef40000 call 0x1459399b0
14592a522: 90 nop
14592a523: 889ead010000 mov byte ptr [rsi + 0x1ad], bl
14592a529: 4883c708 add rdi, 8
14592a52d: 4939fe cmp r14, rdi
14592a530: 75be jne 0x14592a4f0
14592a532: 488b5538 mov rdx, qword ptr [rbp + 0x38]
14592a536: 4885d2 test rdx, rdx
14592a539: 7416 je 0x14592a551
14592a53b: 48c1e203 shl rdx, 3
14592a53f: 41b808000000 mov r8d, 8
14592a545: 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
14592a54c: e87f7c6dfa call 0x1400021d0
14592a551: 440f114620 movups xmmword ptr [rsi + 0x20], xmm8
14592a556: 4889f1 mov rcx, rsi
14592a559: e842daffff call 0x145927fa0
14592a55e: 80bee70a000001 cmp byte ptr [rsi + 0xae7], 1
14592a565: 0f8558380000 jne 0x14592ddc3
14592a56b: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592a572: 4885d2 test rdx, rdx
14592a575: 7419 je 0x14592a590
14592a577: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592a57e: 4883fa01 cmp rdx, 1
14592a582: 7510 jne 0x14592a594
14592a584: f30f100564df4700 movss xmm0, dword ptr [rip + 0x47df64]
14592a58c: 31c9 xor ecx, ecx
14592a58e: eb5a jmp 0x14592a5ea
14592a590: 31d2 xor edx, edx
14592a592: eb6b jmp 0x14592a5ff
14592a594: 4989d0 mov r8, rdx
14592a597: 4983e0fe and r8, 0xfffffffffffffffe
14592a59b: f30f10054ddf4700 movss xmm0, dword ptr [rip + 0x47df4d]
14592a5a3: 31c9 xor ecx, ecx
14592a5a5: eb12 jmp 0x14592a5b9
14592a5a7: 660f1f840000000000 nop word ptr [rax + rax]
14592a5b0: 4883c102 add rcx, 2
14592a5b4: 4939c8 cmp r8, rcx
14592a5b7: 742c je 0x14592a5e5
14592a5b9: 803cc820 cmp byte ptr [rax + rcx*8], 0x20
14592a5bd: 7411 je 0x14592a5d0
14592a5bf: 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
14592a5c4: 75ea jne 0x14592a5b0
14592a5c6: eb15 jmp 0x14592a5dd
14592a5c8: 0f1f840000000000 nop dword ptr [rax + rax]
14592a5d0: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592a5d6: 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
14592a5db: 75d3 jne 0x14592a5b0
14592a5dd: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592a5e3: ebcb jmp 0x14592a5b0
14592a5e5: f6c201 test dl, 1
14592a5e8: 740c je 0x14592a5f6
14592a5ea: 803cc820 cmp byte ptr [rax + rcx*8], 0x20
14592a5ee: 7506 jne 0x14592a5f6
14592a5f0: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592a5f6: 0f57c9 xorps xmm1, xmm1
14592a5f9: 0f2ec1 ucomiss xmm0, xmm1
14592a5fc: 0f97c2 seta dl
14592a5ff: 4c8bbe38080000 mov r15, qword ptr [rsi + 0x838]
14592a606: 4c89fb mov rbx, r15
14592a609: 48c1e306 shl rbx, 6
14592a60d: 4c89f8 mov rax, r15
14592a610: 48c1e83a shr rax, 0x3a
14592a614: 0f95c0 setne al
14592a617: 48b9f8ffffffffffff7f movabs rcx, 0x7ffffffffffffff8
14592a621: 4839cb cmp rbx, rcx
14592a624: 0f97c1 seta cl
14592a627: 08c1 or cl, al
14592a629: 7410 je 0x14592a63b
14592a62b: 4531f6 xor r14d, r14d
14592a62e: 4c89f1 mov rcx, r14
14592a631: 4889da mov rdx, rbx
14592a634: e8729c4700 call 0x145da42ab
14592a639: 0f0b ud2
14592a63b: 899518010000 mov dword ptr [rbp + 0x118], edx
14592a641: f30f10b6540a0000 movss xmm6, dword ptr [rsi + 0xa54]
14592a649: 488bbe30080000 mov rdi, qword ptr [rsi + 0x830]
14592a650: 4885db test rbx, rbx
14592a653: 0f84cc370000 je 0x14592de25
14592a659: e8a27b6dfa call 0x140002200
14592a65e: 41be08000000 mov r14d, 8
14592a664: ba08000000 mov edx, 8
14592a669: 4889d9 mov rcx, rbx
14592a66c: e84f7b6dfa call 0x1400021c0
14592a671: 4885c0 test rax, rax
14592a674: 74b8 je 0x14592a62e
14592a676: 4989c4 mov r12, rax
14592a679: 4c89bdb8000000 mov qword ptr [rbp + 0xb8], r15
14592a680: 4d85ff test r15, r15
14592a683: 740e je 0x14592a693
14592a685: 4c89e1 mov rcx, r12
14592a688: 4889fa mov rdx, rdi
14592a68b: 4989d8 mov r8, rbx
14592a68e: e808ab2d00 call 0x145c0519b
14592a693: 4c01e3 add rbx, r12
14592a696: f3440f1005151e4800 movss xmm8, dword ptr [rip + 0x481e15]
14592a69f: f3440f58c6 addss xmm8, xmm6
14592a6a4: 41b702 mov r15b, 2
14592a6a7: 4531f6 xor r14d, r14d
14592a6aa: 450f57c9 xorps xmm9, xmm9
14592a6ae: 488d7d48 lea rdi, [rbp + 0x48]
14592a6b2: f3440f1015e5962d01 movss xmm10, dword ptr [rip + 0x12d96e5]
14592a6bb: 4c896538 mov qword ptr [rbp + 0x38], r12
14592a6bf: eb18 jmp 0x14592a6d9
14592a6c1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592a6d0: 83f920 cmp ecx, 0x20
14592a6d3: 0f84cd010000 je 0x14592a8a6
14592a6d9: 4939dc cmp r12, rbx
14592a6dc: 0f8499050000 je 0x14592ac7b
14592a6e2: 4c89e0 mov rax, r12
14592a6e5: 410fb60c24 movzx ecx, byte ptr [r12]
14592a6ea: 81f9ff000000 cmp ecx, 0xff
14592a6f0: 0f8485050000 je 0x14592ac7b
14592a6f6: 4d89f5 mov r13, r14
14592a6f9: 4c8d6040 lea r12, [rax + 0x40]
14592a6fd: f30f105804 movss xmm3, dword ptr [rax + 4]
14592a702: 488b5010 mov rdx, qword ptr [rax + 0x10]
14592a706: 49ffc6 inc r14
14592a709: 83f922 cmp ecx, 0x22
14592a70c: 75c2 jne 0x14592a6d0
14592a70e: 4c3bae38080000 cmp r13, qword ptr [rsi + 0x838]
14592a715: 73c2 jae 0x14592a6d9
14592a717: 488b8e30080000 mov rcx, qword ptr [rsi + 0x830]
14592a71e: 4d89e8 mov r8, r13
14592a721: 49c1e006 shl r8, 6
14592a725: 42803c0122 cmp byte ptr [rcx + r8], 0x22
14592a72a: 75ad jne 0x14592a6d9
14592a72c: 488b8690000000 mov rax, qword ptr [rsi + 0x90]
14592a733: 4939c5 cmp r13, rax
14592a736: 7359 jae 0x14592a791
14592a738: 4c8b8e88000000 mov r9, qword ptr [rsi + 0x88]
14592a73f: 43833ca900 cmp dword ptr [r9 + r13*4], 0
14592a744: 744b je 0x14592a791
14592a746: 0f57c0 xorps xmm0, xmm0
14592a749: 4c3b6e78 cmp r13, qword ptr [rsi + 0x78]
14592a74d: 730a jae 0x14592a759
14592a74f: 4c8b4e70 mov r9, qword ptr [rsi + 0x70]
14592a753: f3430f1004a9 movss xmm0, dword ptr [r9 + r13*4]
14592a759: 4c01c1 add rcx, r8
14592a75c: f30f105108 movss xmm2, dword ptr [rcx + 8]
14592a761: f30f599690040000 mulss xmm2, dword ptr [rsi + 0x490]
14592a769: 0f28e2 movaps xmm4, xmm2
14592a76c: f30f5f610c maxss xmm4, dword ptr [rcx + 0xc]
14592a771: 0f28cc movaps xmm1, xmm4
14592a774: f30fc2cc03 cmpunordss xmm1, xmm4
14592a779: 0f54d1 andps xmm2, xmm1
14592a77c: 0f55cc andnps xmm1, xmm4
14592a77f: 0f56ca orps xmm1, xmm2
14592a782: f30f58c8 addss xmm1, xmm0
14592a786: 0f2ef1 ucomiss xmm6, xmm1
14592a789: 0f824affffff jb 0x14592a6d9
14592a78f: eb11 jmp 0x14592a7a2
14592a791: f30f108e540a0000 movss xmm1, dword ptr [rsi + 0xa54]
14592a799: 0f2ef1 ucomiss xmm6, xmm1
14592a79c: 0f8237ffffff jb 0x14592a6d9
14592a7a2: 4c8b8ed8000000 mov r9, qword ptr [rsi + 0xd8]
14592a7a9: 4d85c9 test r9, r9
14592a7ac: 0f84ac000000 je 0x14592a85e
14592a7b2: 488b8ed0000000 mov rcx, qword ptr [rsi + 0xd0]
14592a7b9: 4983f901 cmp r9, 1
14592a7bd: 7508 jne 0x14592a7c7
14592a7bf: 4531c0 xor r8d, r8d
14592a7c2: 4531d2 xor r10d, r10d
14592a7c5: eb72 jmp 0x14592a839
14592a7c7: 4489bd10010000 mov dword ptr [rbp + 0x110], r15d
14592a7ce: 4d89cb mov r11, r9
14592a7d1: 4983e3fe and r11, 0xfffffffffffffffe
14592a7d5: 4c8db990000000 lea r15, [rcx + 0x90]
14592a7dc: 4531c0 xor r8d, r8d
14592a7df: 4531d2 xor r10d, r10d
14592a7e2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592a7f0: 4d396f80 cmp qword ptr [r15 - 0x80], r13
14592a7f4: 400f94c7 sete dil
14592a7f8: 4122bf70ffffff and dil, byte ptr [r15 - 0x90]
14592a7ff: 400fb6ff movzx edi, dil
14592a803: 4c01d7 add rdi, r10
14592a806: 4d392f cmp qword ptr [r15], r13
14592a809: 410f94c2 sete r10b
14592a80d: 452257f0 and r10b, byte ptr [r15 - 0x10]
14592a811: 450fb6d2 movzx r10d, r10b
14592a815: 4901fa add r10, rdi
14592a818: 4983c002 add r8, 2
14592a81c: 4981c700010000 add r15, 0x100
14592a823: 4d39c3 cmp r11, r8
14592a826: 75c8 jne 0x14592a7f0
14592a828: 41f6c101 test r9b, 1
14592a82c: 488d7d48 lea rdi, [rbp + 0x48]
14592a830: 448bbd10010000 mov r15d, dword ptr [rbp + 0x110]
14592a837: 741b je 0x14592a854
14592a839: 4d89d1 mov r9, r10
14592a83c: 49c1e007 shl r8, 7
14592a840: 4e396c0110 cmp qword ptr [rcx + r8 + 0x10], r13
14592a845: 410f94c2 sete r10b
14592a849: 46221401 and r10b, byte ptr [rcx + r8]
14592a84d: 450fb6d2 movzx r10d, r10b
14592a851: 4d01ca add r10, r9
14592a854: 4983fa01 cmp r10, 1
14592a858: 0f877bfeffff ja 0x14592a6d9
14592a85e: 4c3b6e78 cmp r13, qword ptr [rsi + 0x78]
14592a862: 7311 jae 0x14592a875
14592a864: 488b4670 mov rax, qword ptr [rsi + 0x70]
14592a868: f3420f1134a8 movss dword ptr [rax + r13*4], xmm6
14592a86e: 488b8690000000 mov rax, qword ptr [rsi + 0x90]
14592a875: 4939c5 cmp r13, rax
14592a878: 730b jae 0x14592a885
14592a87a: 488b8688000000 mov rax, qword ptr [rsi + 0x88]
14592a881: 42ff04a8 inc dword ptr [rax + r13*4]
14592a885: 4c896c2420 mov qword ptr [rsp + 0x20], r13
14592a88a: c74424280000803f mov dword ptr [rsp + 0x28], 0x3f800000
14592a892: 4889f1 mov rcx, rsi
14592a895: 41b801000000 mov r8d, 1
14592a89b: e880a10200 call 0x145954a20
14592a8a0: 90 nop
14592a8a1: e933feffff jmp 0x14592a6d9
14592a8a6: 4589f8 mov r8d, r15d
14592a8a9: 8b4808 mov ecx, dword ptr [rax + 8]
14592a8ac: 898d10010000 mov dword ptr [rbp + 0x110], ecx
14592a8b2: 448b780c mov r15d, dword ptr [rax + 0xc]
14592a8b6: 4489bda8000000 mov dword ptr [rbp + 0xa8], r15d
14592a8bd: 8995ac000000 mov dword ptr [rbp + 0xac], edx
14592a8c3: 488b4678 mov rax, qword ptr [rsi + 0x78]
14592a8c7: 0f57c0 xorps xmm0, xmm0
14592a8ca: 4939c5 cmp r13, rax
14592a8cd: 730a jae 0x14592a8d9
14592a8cf: 488b4e70 mov rcx, qword ptr [rsi + 0x70]
14592a8d3: f3420f1004a9 movss xmm0, dword ptr [rcx + r13*4]
14592a8d9: 0f2ec6 ucomiss xmm0, xmm6
14592a8dc: 7608 jbe 0x14592a8e6
14592a8de: 4589c7 mov r15d, r8d
14592a8e1: e9f3fdffff jmp 0x14592a6d9
14592a8e6: 80bd1801000000 cmp byte ptr [rbp + 0x118], 0
14592a8ed: 0f84a5000000 je 0x14592a998
14592a8f3: 4939c5 cmp r13, rax
14592a8f6: 730a jae 0x14592a902
14592a8f8: 488b4670 mov rax, qword ptr [rsi + 0x70]
14592a8fc: f3460f1104a8 movss dword ptr [rax + r13*4], xmm8
14592a902: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592a909: 4885d2 test rdx, rdx
14592a90c: 4589c7 mov r15d, r8d
14592a90f: 0f84c4fdffff je 0x14592a6d9
14592a915: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592a91c: 48c1e207 shl rdx, 7
14592a920: 4c8d4280 lea r8, [rdx - 0x80]
14592a924: 4889c1 mov rcx, rax
14592a927: 4584c0 test r8b, r8b
14592a92a: 781e js 0x14592a94a
14592a92c: 488d8880000000 lea rcx, [rax + 0x80]
14592a933: 4c8b4818 mov r9, qword ptr [rax + 0x18]
14592a937: 450fb64939 movzx r9d, byte ptr [r9 + 0x39]
14592a93c: 4180e10e and r9b, 0xe
14592a940: 4180f906 cmp r9b, 6
14592a944: 7504 jne 0x14592a94a
14592a946: c6407c01 mov byte ptr [rax + 0x7c], 1
14592a94a: 4d85c0 test r8, r8
14592a94d: 0f8486fdffff je 0x14592a6d9
14592a953: 4801d0 add rax, rdx
14592a956: eb10 jmp 0x14592a968
14592a958: 4881c100010000 add rcx, 0x100
14592a95f: 4839c1 cmp rcx, rax
14592a962: 0f8471fdffff je 0x14592a6d9
14592a968: 488b5118 mov rdx, qword ptr [rcx + 0x18]
14592a96c: 0fb65239 movzx edx, byte ptr [rdx + 0x39]
14592a970: 80e20e and dl, 0xe
14592a973: 80fa06 cmp dl, 6
14592a976: 7504 jne 0x14592a97c
14592a978: c6417c01 mov byte ptr [rcx + 0x7c], 1
14592a97c: 488b9198000000 mov rdx, qword ptr [rcx + 0x98]
14592a983: 0fb65239 movzx edx, byte ptr [rdx + 0x39]
14592a987: 80e20e and dl, 0xe
14592a98a: 80fa06 cmp dl, 6
14592a98d: 75c9 jne 0x14592a958
14592a98f: c681fc00000001 mov byte ptr [rcx + 0xfc], 1
14592a996: ebc0 jmp 0x14592a958
14592a998: f30f599e90040000 mulss xmm3, dword ptr [rsi + 0x490]
14592a9a0: f30f5f1dac714800 maxss xmm3, dword ptr [rip + 0x4871ac]
14592a9a8: 4c3bae90000000 cmp r13, qword ptr [rsi + 0x90]
14592a9af: 7335 jae 0x14592a9e6
14592a9b1: 410f2ec1 ucomiss xmm0, xmm9
14592a9b5: 752f jne 0x14592a9e6
14592a9b7: 7a2d jp 0x14592a9e6
14592a9b9: 488b8e88000000 mov rcx, qword ptr [rsi + 0x88]
14592a9c0: 42833ca900 cmp dword ptr [rcx + r13*4], 0
14592a9c5: 751f jne 0x14592a9e6
14592a9c7: 4939c5 cmp r13, rax
14592a9ca: 0f83a3020000 jae 0x14592ac73
14592a9d0: 488b4670 mov rax, qword ptr [rsi + 0x70]
14592a9d4: f30f58de addss xmm3, xmm6
14592a9d8: f3420f111ca8 movss dword ptr [rax + r13*4], xmm3
14592a9de: 4589c7 mov r15d, r8d
14592a9e1: e9f3fcffff jmp 0x14592a6d9
14592a9e6: 4180f802 cmp r8b, 2
14592a9ea: 7577 jne 0x14592aa63
14592a9ec: 488d8ed8040000 lea rcx, [rsi + 0x4d8]
14592a9f3: 8b4108 mov eax, dword ptr [rcx + 8]
14592a9f6: 8985c8000000 mov dword ptr [rbp + 0xc8], eax
14592a9fc: 488b01 mov rax, qword ptr [rcx]
14592a9ff: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14592aa06: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
14592aa0f: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
14592aa18: 4889f9 mov rcx, rdi
14592aa1b: 4889f2 mov rdx, rsi
14592aa1e: 4c8d85c0000000 lea r8, [rbp + 0xc0]
14592aa25: 0f28fb movaps xmm7, xmm3
14592aa28: 410f28da movaps xmm3, xmm10
14592aa2c: e89fb5ffff call 0x145925fd0
14592aa31: 90 nop
14592aa32: 0f28df movaps xmm3, xmm7
14592aa35: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592aa39: 488b7d58 mov rdi, qword ptr [rbp + 0x58]
14592aa3d: 4885d2 test rdx, rdx
14592aa40: 7416 je 0x14592aa58
14592aa42: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592aa46: 48c1e203 shl rdx, 3
14592aa4a: 41b808000000 mov r8d, 8
14592aa50: e87b776dfa call 0x1400021d0
14592aa55: 0f28df movaps xmm3, xmm7
14592aa58: 4885ff test rdi, rdi
14592aa5b: 410f95c0 setne r8b
14592aa5f: 488d7d48 lea rdi, [rbp + 0x48]
14592aa63: 4180f801 cmp r8b, 1
14592aa67: 753e jne 0x14592aaa7
14592aa69: 4c3b6e78 cmp r13, qword ptr [rsi + 0x78]
14592aa6d: 730e jae 0x14592aa7d
14592aa6f: 488b4670 mov rax, qword ptr [rsi + 0x70]
14592aa73: f30f58de addss xmm3, xmm6
14592aa77: f3420f111ca8 movss dword ptr [rax + r13*4], xmm3
14592aa7d: 4c3bae90000000 cmp r13, qword ptr [rsi + 0x90]
14592aa84: 7329 jae 0x14592aaaf
14592aa86: 488b8688000000 mov rax, qword ptr [rsi + 0x88]
14592aa8d: 428b0ca8 mov ecx, dword ptr [rax + r13*4]
14592aa91: 89ca mov edx, ecx
14592aa93: 83e201 and edx, 1
14592aa96: ffc1 inc ecx
14592aa98: 42890ca8 mov dword ptr [rax + r13*4], ecx
14592aa9c: 660f6ebc95a8000000 movd xmm7, dword ptr [rbp + rdx*4 + 0xa8]
14592aaa5: eb0d jmp 0x14592aab4
14592aaa7: 4531ff xor r15d, r15d
14592aaaa: e92afcffff jmp 0x14592a6d9
14592aaaf: 66410f6eff movd xmm7, r15d
14592aab4: 488d8df0000000 lea rcx, [rbp + 0xf0]
14592aabb: 488d96c8010000 lea rdx, [rsi + 0x1c8]
14592aac2: e829380700 call 0x14599e2f0
14592aac7: 90 nop
14592aac8: c7455800000000 mov dword ptr [rbp + 0x58], 0
14592aacf: 8b8510010000 mov eax, dword ptr [rbp + 0x110]
14592aad5: 89455c mov dword ptr [rbp + 0x5c], eax
14592aad8: 488d86c0090000 lea rax, [rsi + 0x9c0]
14592aadf: 48894548 mov qword ptr [rbp + 0x48], rax
14592aae3: 488d85f0000000 lea rax, [rbp + 0xf0]
14592aaea: 48894550 mov qword ptr [rbp + 0x50], rax
14592aaee: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592aaf5: 4889fa mov rdx, rdi
14592aaf8: e853810b00 call 0x1459e2c50
14592aafd: 90 nop
14592aafe: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
14592ab05: 48894510 mov qword ptr [rbp + 0x10], rax
14592ab09: 4c8bbdc8000000 mov r15, qword ptr [rbp + 0xc8]
14592ab10: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14592ab17: 498d04c7 lea rax, [r15 + rax*8]
14592ab1b: 48898510010000 mov qword ptr [rbp + 0x110], rax
14592ab22: 4c897d20 mov qword ptr [rbp + 0x20], r15
14592ab26: eb35 jmp 0x14592ab5d
14592ab28: 4b8b0403 mov rax, qword ptr [r11 + r8]
14592ab2c: 4801c1 add rcx, rax
14592ab2f: 4883f90b cmp rcx, 0xb
14592ab33: 0f87f4000000 ja 0x14592ac2d
14592ab39: 4983c708 add r15, 8
14592ab3d: 4c896c2420 mov qword ptr [rsp + 0x20], r13
14592ab42: c74424280000803f mov dword ptr [rsp + 0x28], 0x3f800000
14592ab4a: 4889f1 mov rcx, rsi
14592ab4d: 41b801000000 mov r8d, 1
14592ab53: 660f6fdf movdqa xmm3, xmm7
14592ab57: e8c49e0200 call 0x145954a20
14592ab5c: 90 nop
14592ab5d: 4c3bbd10010000 cmp r15, qword ptr [rbp + 0x110]
14592ab64: 0f84c3000000 je 0x14592ac2d
14592ab6a: 498b17 mov rdx, qword ptr [r15]
14592ab6d: 4c8b8ed8000000 mov r9, qword ptr [rsi + 0xd8]
14592ab74: 4d85c9 test r9, r9
14592ab77: 74c0 je 0x14592ab39
14592ab79: 4c8b9ed0000000 mov r11, qword ptr [rsi + 0xd0]
14592ab80: 4983f901 cmp r9, 1
14592ab84: 750a jne 0x14592ab90
14592ab86: 4531c0 xor r8d, r8d
14592ab89: 31c9 xor ecx, ecx
14592ab8b: e97f000000 jmp 0x14592ac0f
14592ab90: 488955e8 mov qword ptr [rbp - 0x18], rdx
14592ab94: 4d89ca mov r10, r9
14592ab97: 4983e2fe and r10, 0xfffffffffffffffe
14592ab9b: 4c895dc0 mov qword ptr [rbp - 0x40], r11
14592ab9f: 4981c398000000 add r11, 0x98
14592aba6: 4531c0 xor r8d, r8d
14592aba9: 31c9 xor ecx, ecx
14592abab: eb19 jmp 0x14592abc6
14592abad: 0f1f00 nop dword ptr [rax]
14592abb0: 4801f9 add rcx, rdi
14592abb3: 4801c1 add rcx, rax
14592abb6: 4983c002 add r8, 2
14592abba: 4981c300010000 add r11, 0x100
14592abc1: 4d39c2 cmp r10, r8
14592abc4: 7433 je 0x14592abf9
14592abc6: 498b4380 mov rax, qword ptr [r11 - 0x80]
14592abca: 0fb64039 movzx eax, byte ptr [rax + 0x39]
14592abce: fec8 dec al
14592abd0: bf00000000 mov edi, 0
14592abd5: 3c04 cmp al, 4
14592abd7: 7307 jae 0x14592abe0
14592abd9: 498bbb68ffffff mov rdi, qword ptr [r11 - 0x98]
14592abe0: 498b03 mov rax, qword ptr [r11]
14592abe3: 0fb65039 movzx edx, byte ptr [rax + 0x39]
14592abe7: feca dec dl
14592abe9: b800000000 mov eax, 0
14592abee: 80fa04 cmp dl, 4
14592abf1: 73bd jae 0x14592abb0
14592abf3: 498b43e8 mov rax, qword ptr [r11 - 0x18]
14592abf7: ebb7 jmp 0x14592abb0
14592abf9: 41f6c101 test r9b, 1
14592abfd: 488d7d48 lea rdi, [rbp + 0x48]
14592ac01: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14592ac05: 4c8b5dc0 mov r11, qword ptr [rbp - 0x40]
14592ac09: 0f8420ffffff je 0x14592ab2f
14592ac0f: 49c1e007 shl r8, 7
14592ac13: 4b8b440318 mov rax, qword ptr [r11 + r8 + 0x18]
14592ac18: 0fb64039 movzx eax, byte ptr [rax + 0x39]
14592ac1c: fec8 dec al
14592ac1e: 3c04 cmp al, 4
14592ac20: 0f8202ffffff jb 0x14592ab28
14592ac26: 31c0 xor eax, eax
14592ac28: e9fffeffff jmp 0x14592ab2c
14592ac2d: 488b5510 mov rdx, qword ptr [rbp + 0x10]
14592ac31: 4885d2 test rdx, rdx
14592ac34: 7413 je 0x14592ac49
14592ac36: 48c1e203 shl rdx, 3
14592ac3a: 41b808000000 mov r8d, 8
14592ac40: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592ac44: e887756dfa call 0x1400021d0
14592ac49: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14592ac50: 4885d2 test rdx, rdx
14592ac53: 7416 je 0x14592ac6b
14592ac55: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
14592ac5c: 48c1e203 shl rdx, 3
14592ac60: 41b808000000 mov r8d, 8
14592ac66: e865756dfa call 0x1400021d0
14592ac6b: 41b701 mov r15b, 1
14592ac6e: e966faffff jmp 0x14592a6d9
14592ac73: 4589c7 mov r15d, r8d
14592ac76: e95efaffff jmp 0x14592a6d9
14592ac7b: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
14592ac82: 4885d2 test rdx, rdx
14592ac85: 7413 je 0x14592ac9a
14592ac87: 48c1e206 shl rdx, 6
14592ac8b: 41b808000000 mov r8d, 8
14592ac91: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
14592ac95: e836756dfa call 0x1400021d0
14592ac9a: 488bbed8000000 mov rdi, qword ptr [rsi + 0xd8]
14592aca1: 4885ff test rdi, rdi
14592aca4: 0f847c030000 je 0x14592b026
14592acaa: 4c8d2d07622c01 lea r13, [rip + 0x12c6207]
14592acb1: 48bb68656c6c66697265 movabs rbx, 0x657269666c6c6568
14592acbb: f3440f1005acd54700 movss xmm8, dword ptr [rip + 0x47d5ac]
14592acc4: 4c8d5d48 lea r11, [rbp + 0x48]
14592acc8: f3440f100ddf164800 movss xmm9, dword ptr [rip + 0x4816df]
14592acd1: f3440f10159ad54700 movss xmm10, dword ptr [rip + 0x47d59a]
14592acda: f3440f101dd1164800 movss xmm11, dword ptr [rip + 0x4816d1]
14592ace3: f3440f10256cb84800 movss xmm12, dword ptr [rip + 0x48b86c]
14592acec: f3440f102dfbd74700 movss xmm13, dword ptr [rip + 0x47d7fb]
14592acf5: 4531f6 xor r14d, r14d
14592acf8: 4889bdb8000000 mov qword ptr [rbp + 0xb8], rdi
14592acff: eb1b jmp 0x14592ad1c
14592ad01: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592ad10: 49ffc6 inc r14
14592ad13: 4939fe cmp r14, rdi
14592ad16: 0f840a030000 je 0x14592b026
14592ad1c: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592ad23: 4939d6 cmp r14, rdx
14592ad26: 0f837c320000 jae 0x14592dfa8
14592ad2c: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592ad33: 4d89f4 mov r12, r14
14592ad36: 49c1e407 shl r12, 7
14592ad3a: 4a8b4c2018 mov rcx, qword ptr [rax + r12 + 0x18]
14592ad3f: 80793906 cmp byte ptr [rcx + 0x39], 6
14592ad43: 75cb jne 0x14592ad10
14592ad45: 4c01e0 add rax, r12
14592ad48: 0f2e7078 ucomiss xmm6, dword ptr [rax + 0x78]
14592ad4c: 72c2 jb 0x14592ad10
14592ad4e: 488b8630030000 mov rax, qword ptr [rsi + 0x330]
14592ad55: 488b9638030000 mov rdx, qword ptr [rsi + 0x338]
14592ad5c: 488d0d289b2d01 lea rcx, [rip + 0x12d9b28]
14592ad63: 48898dc0000000 mov qword ptr [rbp + 0xc0], rcx
14592ad6a: 48c785c800000008000000 mov qword ptr [rbp + 0xc8], 8
14592ad75: 31c9 xor ecx, ecx
14592ad77: eb18 jmp 0x14592ad91
14592ad79: 0f1f8000000000 nop dword ptr [rax]
14592ad80: 4883c178 add rcx, 0x78
14592ad84: 4881f9f8340000 cmp rcx, 0x34f8
14592ad8b: 0f8477310000 je 0x14592df08
14592ad91: 4a837c290808 cmp qword ptr [rcx + r13 + 8], 8
14592ad97: 75e7 jne 0x14592ad80
14592ad99: 4e8b0429 mov r8, qword ptr [rcx + r13]
14592ad9d: 493918 cmp qword ptr [r8], rbx
14592ada0: 75de jne 0x14592ad80
14592ada2: 4c01e9 add rcx, r13
14592ada5: 4885d2 test rdx, rdx
14592ada8: 743b je 0x14592ade5
14592adaa: 48c1e205 shl rdx, 5
14592adae: 488d1452 lea rdx, [rdx + rdx*2]
14592adb2: 4531c0 xor r8d, r8d
14592adb5: eb12 jmp 0x14592adc9
14592adb7: 660f1f840000000000 nop word ptr [rax + rax]
14592adc0: 4983c060 add r8, 0x60
14592adc4: 4c39c2 cmp rdx, r8
14592adc7: 741c je 0x14592ade5
14592adc9: 4e8b3c00 mov r15, qword ptr [rax + r8]
14592adcd: 49837f0808 cmp qword ptr [r15 + 8], 8
14592add2: 75ec jne 0x14592adc0
14592add4: 4d8b0f mov r9, qword ptr [r15]
14592add7: 493919 cmp qword ptr [r9], rbx
14592adda: 75e4 jne 0x14592adc0
14592addc: f3420f107c0014 movss xmm7, dword ptr [rax + r8 + 0x14]
14592ade3: eb07 jmp 0x14592adec
14592ade5: 410f28f8 movaps xmm7, xmm8
14592ade9: 4989cf mov r15, rcx
14592adec: 4c89d9 mov rcx, r11
14592adef: 488d96c8010000 lea rdx, [rsi + 0x1c8]
14592adf6: 4c89df mov rdi, r11
14592adf9: e8a27bf6ff call 0x1458929a0
14592adfe: 90 nop
14592adff: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592ae06: 4889fa mov rdx, rdi
14592ae09: 4d89f8 mov r8, r15
14592ae0c: e8bf7df6ff call 0x145892bd0
14592ae11: 90 nop
14592ae12: f3440f10b5c4000000 movss xmm14, dword ptr [rbp + 0xc4]
14592ae1b: f3440f10bde0000000 movss xmm15, dword ptr [rbp + 0xe0]
14592ae24: 4889f9 mov rcx, rdi
14592ae27: e8e465f6ff call 0x145891410
14592ae2c: 49837f0808 cmp qword ptr [r15 + 8], 8
14592ae31: 410f28c1 movaps xmm0, xmm9
14592ae35: 7519 jne 0x14592ae50
14592ae37: 498b07 mov rax, qword ptr [r15]
14592ae3a: 410f28c1 movaps xmm0, xmm9
14592ae3e: 483918 cmp qword ptr [rax], rbx
14592ae41: 750d jne 0x14592ae50
14592ae43: 410f28c2 movaps xmm0, xmm10
14592ae47: 660f1f840000000000 nop word ptr [rax + rax]
14592ae50: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592ae57: 4939d6 cmp r14, rdx
14592ae5a: 0f837e310000 jae 0x14592dfde
14592ae60: f3410f104f48 movss xmm1, dword ptr [r15 + 0x48]
14592ae66: f3410f59cb mulss xmm1, xmm11
14592ae6b: f30f59f9 mulss xmm7, xmm1
14592ae6f: f3440f59f7 mulss xmm14, xmm7
14592ae74: f3440f59b690040000 mulss xmm14, dword ptr [rsi + 0x490]
14592ae7d: f3450f59fe mulss xmm15, xmm14
14592ae82: 410f28cf movaps xmm1, xmm15
14592ae86: f30f5fc8 maxss xmm1, xmm0
14592ae8a: 0f28c1 movaps xmm0, xmm1
14592ae8d: f30fc2c103 cmpunordss xmm0, xmm1
14592ae92: 440f54f8 andps xmm15, xmm0
14592ae96: 0f55c1 andnps xmm0, xmm1
14592ae99: 410f56c7 orps xmm0, xmm15
14592ae9d: f3410f5fc2 maxss xmm0, xmm10
14592aea2: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592aea9: f30f58c6 addss xmm0, xmm6
14592aead: f3420f11442078 movss dword ptr [rax + r12 + 0x78], xmm0
14592aeb4: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592aebb: 4939d6 cmp r14, rdx
14592aebe: 0f832b310000 jae 0x14592dfef
14592aec4: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592aecb: 42807c207c00 cmp byte ptr [rax + r12 + 0x7c], 0
14592aed1: 42c644207c00 mov byte ptr [rax + r12 + 0x7c], 0
14592aed7: 410f28fc movaps xmm7, xmm12
14592aedb: 488bbdb8000000 mov rdi, qword ptr [rbp + 0xb8]
14592aee2: 7504 jne 0x14592aee8
14592aee4: 410f28f8 movaps xmm7, xmm8
14592aee8: 4889f1 mov rcx, rsi
14592aeeb: 4c89f2 mov rdx, r14
14592aeee: 4531c0 xor r8d, r8d
14592aef1: 0f28df movaps xmm3, xmm7
14592aef4: e8e7ab0200 call 0x145955ae0
14592aef9: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592af00: 4885d2 test rdx, rdx
14592af03: 4c8d5d48 lea r11, [rbp + 0x48]
14592af07: 0f8403feffff je 0x14592ad10
14592af0d: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592af14: 4883fa01 cmp rdx, 1
14592af18: 7508 jne 0x14592af22
14592af1a: 31c9 xor ecx, ecx
14592af1c: 410f28c5 movaps xmm0, xmm13
14592af20: eb58 jmp 0x14592af7a
14592af22: 4989d0 mov r8, rdx
14592af25: 4983e0fe and r8, 0xfffffffffffffffe
14592af29: 31c9 xor ecx, ecx
14592af2b: 410f28c5 movaps xmm0, xmm13
14592af2f: eb18 jmp 0x14592af49
14592af31: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592af40: 4883c102 add rcx, 2
14592af44: 4939c8 cmp r8, rcx
14592af47: 742c je 0x14592af75
14592af49: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592af4d: 7411 je 0x14592af60
14592af4f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592af54: 75ea jne 0x14592af40
14592af56: eb15 jmp 0x14592af6d
14592af58: 0f1f840000000000 nop dword ptr [rax + rax]
14592af60: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592af66: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592af6b: 75d3 jne 0x14592af40
14592af6d: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592af73: ebcb jmp 0x14592af40
14592af75: f6c201 test dl, 1
14592af78: 740c je 0x14592af86
14592af7a: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592af7e: 7506 jne 0x14592af86
14592af80: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592af86: 0f57c9 xorps xmm1, xmm1
14592af89: 0f2ec1 ucomiss xmm0, xmm1
14592af8c: 0f867efdffff jbe 0x14592ad10
14592af92: 488b86d8090000 mov rax, qword ptr [rsi + 0x9d8]
14592af99: 488b8ec0090000 mov rcx, qword ptr [rsi + 0x9c0]
14592afa0: 488b96c8090000 mov rdx, qword ptr [rsi + 0x9c8]
14592afa7: 4c8d0408 lea r8, [rax + rcx]
14592afab: 49c1c017 rol r8, 0x17
14592afaf: 4901c8 add r8, rcx
14592afb2: 4989d1 mov r9, rdx
14592afb5: 49c1e111 shl r9, 0x11
14592afb9: 4c8b96d0090000 mov r10, qword ptr [rsi + 0x9d0]
14592afc0: 4931ca xor r10, rcx
14592afc3: 4831d0 xor rax, rdx
14592afc6: 4c31d2 xor rdx, r10
14592afc9: 488996c8090000 mov qword ptr [rsi + 0x9c8], rdx
14592afd0: 4831c1 xor rcx, rax
14592afd3: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14592afda: 4d31ca xor r10, r9
14592afdd: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
14592afe4: 48c1c02d rol rax, 0x2d
14592afe8: 49c1e828 shr r8, 0x28
14592afec: 0f57c9 xorps xmm1, xmm1
14592afef: f3410f2ac8 cvtsi2ss xmm1, r8d
14592aff4: 488986d8090000 mov qword ptr [rsi + 0x9d8], rax
14592affb: f30f590d4d2a5900 mulss xmm1, dword ptr [rip + 0x592a4d]
14592b003: 0f2ec1 ucomiss xmm0, xmm1
14592b006: 0f8604fdffff jbe 0x14592ad10
14592b00c: 4889f1 mov rcx, rsi
14592b00f: 4c89f2 mov rdx, r14
14592b012: 41b001 mov r8b, 1
14592b015: 0f28df movaps xmm3, xmm7
14592b018: e8c3aa0200 call 0x145955ae0
14592b01d: 4c8d5d48 lea r11, [rbp + 0x48]
14592b021: e9eafcffff jmp 0x14592ad10
14592b026: f30f108688040000 movss xmm0, dword ptr [rsi + 0x488]
14592b02e: f30f59057a134800 mulss xmm0, dword ptr [rip + 0x48137a]
14592b036: f30f108ea8010000 movss xmm1, dword ptr [rsi + 0x1a8]
14592b03e: 0f2ec8 ucomiss xmm1, xmm0
14592b041: 7627 jbe 0x14592b06a
14592b043: f30f5cc8 subss xmm1, xmm0
14592b047: f30f1186a8010000 movss dword ptr [rsi + 0x1a8], xmm0
14592b04f: f30f1086f4040000 movss xmm0, dword ptr [rsi + 0x4f4]
14592b057: f30f5cc1 subss xmm0, xmm1
14592b05b: 0f57c9 xorps xmm1, xmm1
14592b05e: f30f5fc1 maxss xmm0, xmm1
14592b062: f30f1186f4040000 movss dword ptr [rsi + 0x4f4], xmm0
14592b06a: 80bee70a000001 cmp byte ptr [rsi + 0xae7], 1
14592b071: 0f854c2d0000 jne 0x14592ddc3
14592b077: f3440f108e540a0000 movss xmm9, dword ptr [rsi + 0xa54]
14592b080: 4889f1 mov rcx, rsi
14592b083: e818cfffff call 0x145927fa0
14592b088: f2440f1086d8040000 movsd xmm8, qword ptr [rsi + 0x4d8]
14592b091: f30f1005d7514800 movss xmm0, dword ptr [rip + 0x4851d7]
14592b099: f30f10b69c040000 movss xmm6, dword ptr [rsi + 0x49c]
14592b0a1: f30f59f0 mulss xmm6, xmm0
14592b0a5: 488b86d8000000 mov rax, qword ptr [rsi + 0xd8]
14592b0ac: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14592b0b3: f3440f101df4124800 movss xmm11, dword ptr [rip + 0x4812f4]
14592b0bc: f3450f58d9 addss xmm11, xmm9
14592b0c1: 0f28ce movaps xmm1, xmm6
14592b0c4: f30f5fc8 maxss xmm1, xmm0
14592b0c8: f3440f10350f8d2d01 movss xmm14, dword ptr [rip + 0x12d8d0f]
14592b0d1: f3440f59f1 mulss xmm14, xmm1
14592b0d6: f30f590de2b44800 mulss xmm1, dword ptr [rip + 0x48b4e2]
14592b0de: f30f114de8 movss dword ptr [rbp - 0x18], xmm1
14592b0e3: f30f1005798b2d01 movss xmm0, dword ptr [rip + 0x12d8b79]
14592b0eb: f30f59c6 mulss xmm0, xmm6
14592b0ef: f30f5f0509e24800 maxss xmm0, dword ptr [rip + 0x48e209]
14592b0f7: f30f114510 movss dword ptr [rbp + 0x10], xmm0
14592b0fc: f30f59358cd34700 mulss xmm6, dword ptr [rip + 0x47d38c]
14592b104: 410f28c3 movaps xmm0, xmm11
14592b108: 410f14c1 unpcklps xmm0, xmm9
14592b10c: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
14592b110: 0f57ff xorps xmm7, xmm7
14592b113: 4531ff xor r15d, r15d
14592b116: eb21 jmp 0x14592b139
14592b118: 0f1f840000000000 nop dword ptr [rax + rax]
14592b120: f30f16da movshdup xmm3, xmm2
14592b124: f30f11742420 movss dword ptr [rsp + 0x20], xmm6
14592b12a: 4889f1 mov rcx, rsi
14592b12d: 4889da mov rdx, rbx
14592b130: e8ab970000 call 0x1459348e0
14592b135: 4c8b7d38 mov r15, qword ptr [rbp + 0x38]
14592b139: 4c3bbdb8000000 cmp r15, qword ptr [rbp + 0xb8]
14592b140: 0f837d2c0000 jae 0x14592ddc3
14592b146: 4c89fb mov rbx, r15
14592b149: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b150: 4939d7 cmp r15, rdx
14592b153: 0f83602e0000 jae 0x14592dfb9
14592b159: 4c8d7b01 lea r15, [rbx + 1]
14592b15d: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b164: 4889df mov rdi, rbx
14592b167: 48c1e707 shl rdi, 7
14592b16b: f30f10443864 movss xmm0, dword ptr [rax + rdi + 0x64]
14592b171: 410f2ec1 ucomiss xmm0, xmm9
14592b175: 77c2 ja 0x14592b139
14592b177: 4801f8 add rax, rdi
14592b17a: f3440f115864 movss dword ptr [rax + 0x64], xmm11
14592b180: 4c8bb6d8000000 mov r14, qword ptr [rsi + 0xd8]
14592b187: 4c39f3 cmp rbx, r14
14592b18a: 0f833a2e0000 jae 0x14592dfca
14592b190: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b197: 4c8d2438 lea r12, [rax + rdi]
14592b19b: f30f1044385c movss xmm0, dword ptr [rax + rdi + 0x5c]
14592b1a1: 0f2ef8 ucomiss xmm7, xmm0
14592b1a4: 4c897d38 mov qword ptr [rbp + 0x38], r15
14592b1a8: 7366 jae 0x14592b210
14592b1aa: 410f28c9 movaps xmm1, xmm9
14592b1ae: f3410f5c4c2458 subss xmm1, dword ptr [r12 + 0x58]
14592b1b5: f30f5ec8 divss xmm1, xmm0
14592b1b9: 0f57c0 xorps xmm0, xmm0
14592b1bc: f30f5fc1 maxss xmm0, xmm1
14592b1c0: f30f100da8d04700 movss xmm1, dword ptr [rip + 0x47d0a8]
14592b1c8: f30f5dc8 minss xmm1, xmm0
14592b1cc: f2410f10442440 movsd xmm0, qword ptr [r12 + 0x40]
14592b1d3: f2410f1054244c movsd xmm2, qword ptr [r12 + 0x4c]
14592b1da: 0f5cd0 subps xmm2, xmm0
14592b1dd: f3440f12d1 movsldup xmm10, xmm1
14592b1e2: 440f59d2 mulps xmm10, xmm2
14592b1e6: 440f58d0 addps xmm10, xmm0
14592b1ea: f3410f10442448 movss xmm0, dword ptr [r12 + 0x48]
14592b1f1: f3410f10542454 movss xmm2, dword ptr [r12 + 0x54]
14592b1f8: f30f5cd0 subss xmm2, xmm0
14592b1fc: f30f59d1 mulss xmm2, xmm1
14592b200: f30f58d0 addss xmm2, xmm0
14592b204: 440f135500 movlps qword ptr [rbp], xmm10
14592b209: f30f115508 movss dword ptr [rbp + 8], xmm2
14592b20e: eb17 jmp 0x14592b227
14592b210: 498b4c244c mov rcx, qword ptr [r12 + 0x4c]
14592b215: 48894d00 mov qword ptr [rbp], rcx
14592b219: 418b4c2454 mov ecx, dword ptr [r12 + 0x54]
14592b21e: 894d08 mov dword ptr [rbp + 8], ecx
14592b221: f2440f105500 movsd xmm10, qword ptr [rbp]
14592b227: 4c8b7c3818 mov r15, qword ptr [rax + rdi + 0x18]
14592b22c: f3450f10642468 movss xmm12, dword ptr [r12 + 0x68]
14592b233: f3440f58a6e4040000 addss xmm12, dword ptr [rsi + 0x4e4]
14592b23c: 4531ed xor r13d, r13d
14592b23f: 41807f3905 cmp byte ptr [r15 + 0x39], 5
14592b244: 410f93c5 setae r13b
14592b248: 410f28c4 movaps xmm0, xmm12
14592b24c: e8869f2d00 call 0x145c051d7
14592b251: 440f28e8 movaps xmm13, xmm0
14592b255: 410f28c4 movaps xmm0, xmm12
14592b259: e8739f2d00 call 0x145c051d1
14592b25e: 440f14e8 unpcklps xmm13, xmm0
14592b262: 488d05478c2d01 lea rax, [rip + 0x12d8c47]
14592b269: f3420f1004a8 movss xmm0, dword ptr [rax + r13*4]
14592b26f: f30f12d0 movsldup xmm2, xmm0
14592b273: 410f59d5 mulps xmm2, xmm13
14592b277: 410f58d0 addps xmm2, xmm8
14592b27b: 410f28c2 movaps xmm0, xmm10
14592b27f: 410f5cc0 subps xmm0, xmm8
14592b283: 0f59c0 mulps xmm0, xmm0
14592b286: f30f16c8 movshdup xmm1, xmm0
14592b28a: f30f58c8 addss xmm1, xmm0
14592b28e: 0f57c0 xorps xmm0, xmm0
14592b291: f30f51c1 sqrtss xmm0, xmm1
14592b295: 0f2e0558d24700 ucomiss xmm0, dword ptr [rip + 0x47d258]
14592b29c: 0f877efeffff ja 0x14592b120
14592b2a2: 41837f3400 cmp dword ptr [r15 + 0x34], 0
14592b2a7: 7461 je 0x14592b30a
14592b2a9: 440f5cd2 subps xmm10, xmm2
14592b2ad: 450f59d2 mulps xmm10, xmm10
14592b2b1: f3410f16c2 movshdup xmm0, xmm10
14592b2b6: f3410f58c2 addss xmm0, xmm10
14592b2bb: f30f51c0 sqrtss xmm0, xmm0
14592b2bf: 0f2e052eb67a00 ucomiss xmm0, dword ptr [rip + 0x7ab62e]
14592b2c6: 761d jbe 0x14592b2e5
14592b2c8: f30f16da movshdup xmm3, xmm2
14592b2cc: f3440f11742420 movss dword ptr [rsp + 0x20], xmm14
14592b2d3: 4889f1 mov rcx, rsi
14592b2d6: 4889da mov rdx, rbx
14592b2d9: e802960000 call 0x1459348e0
14592b2de: 4c8bb6d8000000 mov r14, qword ptr [rsi + 0xd8]
14592b2e5: 4c39f3 cmp rbx, r14
14592b2e8: 0f83122d0000 jae 0x14592e000
14592b2ee: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b2f5: 440f2e4c3860 ucomiss xmm9, dword ptr [rax + rdi + 0x60]
14592b2fb: 0f83bd000000 jae 0x14592b3be
14592b301: 4c8d7b01 lea r15, [rbx + 1]
14592b305: e964210000 jmp 0x14592d46e
14592b30a: 4d8b642428 mov r12, qword ptr [r12 + 0x28]
14592b30f: 488b8e78050000 mov rcx, qword ptr [rsi + 0x578]
14592b316: 4885c9 test rcx, rcx
14592b319: 0f84f5020000 je 0x14592b614
14592b31f: 488b8670050000 mov rax, qword ptr [rsi + 0x570]
14592b326: 4869d1d8010000 imul rdx, rcx, 0x1d8
14592b32d: 31c9 xor ecx, ecx
14592b32f: eb1f jmp 0x14592b350
14592b331: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592b340: 4881c1d8010000 add rcx, 0x1d8
14592b347: 4839ca cmp rdx, rcx
14592b34a: 0f84c4020000 je 0x14592b614
14592b350: 4c39a408f0000000 cmp qword ptr [rax + rcx + 0xf0], r12
14592b358: 75e6 jne 0x14592b340
14592b35a: 83bc08b000000001 cmp dword ptr [rax + rcx + 0xb0], 1
14592b362: 74dc je 0x14592b340
14592b364: f30f10840890010000 movss xmm0, dword ptr [rax + rcx + 0x190]
14592b36d: 0f2ef8 ucomiss xmm7, xmm0
14592b370: 0f834c020000 jae 0x14592b5c2
14592b376: 410f28c9 movaps xmm1, xmm9
14592b37a: f30f5c8c088c010000 subss xmm1, dword ptr [rax + rcx + 0x18c]
14592b383: f30f5ec8 divss xmm1, xmm0
14592b387: 0f57c0 xorps xmm0, xmm0
14592b38a: f30f5fc1 maxss xmm0, xmm1
14592b38e: f30f100ddace4700 movss xmm1, dword ptr [rip + 0x47ceda]
14592b396: f30f5dc8 minss xmm1, xmm0
14592b39a: f20f109c0874010000 movsd xmm3, qword ptr [rax + rcx + 0x174]
14592b3a3: f20f10a40880010000 movsd xmm4, qword ptr [rax + rcx + 0x180]
14592b3ac: 0f5ce3 subps xmm4, xmm3
14592b3af: f30f12c1 movsldup xmm0, xmm1
14592b3b3: 0f59c4 mulps xmm0, xmm4
14592b3b6: 0f58c3 addps xmm0, xmm3
14592b3b9: e90d020000 jmp 0x14592b5cb
14592b3be: 41807f3900 cmp byte ptr [r15 + 0x39], 0
14592b3c3: 7417 je 0x14592b3dc
14592b3c5: 4889f1 mov rcx, rsi
14592b3c8: 4889da mov rdx, rbx
14592b3cb: e8e0810200 call 0x1459535b0
14592b3d0: 4989c6 mov r14, rax
14592b3d3: 4989d4 mov r12, rdx
14592b3d6: 4c8d7b01 lea r15, [rbx + 1]
14592b3da: eb4b jmp 0x14592b427
14592b3dc: 488d4d48 lea rcx, [rbp + 0x48]
14592b3e0: 4889f2 mov rdx, rsi
14592b3e3: 4989e8 mov r8, rbp
14592b3e6: f30f101df2df4800 movss xmm3, dword ptr [rip + 0x48dff2]
14592b3ee: e8adadffff call 0x1459261a0
14592b3f3: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592b3f7: 48837d5800 cmp qword ptr [rbp + 0x58], 0
14592b3fc: 0f84a7010000 je 0x14592b5a9
14592b402: 4c8b21 mov r12, qword ptr [rcx]
14592b405: 41be01000000 mov r14d, 1
14592b40b: 4c8d7b01 lea r15, [rbx + 1]
14592b40f: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592b413: 4885d2 test rdx, rdx
14592b416: 740f je 0x14592b427
14592b418: 48c1e203 shl rdx, 3
14592b41c: 41b808000000 mov r8d, 8
14592b422: e8a96d6dfa call 0x1400021d0
14592b427: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b42e: 4839d3 cmp rbx, rdx
14592b431: 0f83dd2b0000 jae 0x14592e014
14592b437: 41f6c601 test r14b, 1
14592b43b: b800000000 mov eax, 0
14592b440: 490f45c4 cmovne rax, r12
14592b444: 488b8ed0000000 mov rcx, qword ptr [rsi + 0xd0]
14592b44b: 4889443928 mov qword ptr [rcx + rdi + 0x28], rax
14592b450: 0f8418200000 je 0x14592d46e
14592b456: 4889f1 mov rcx, rsi
14592b459: 4889da mov rdx, rbx
14592b45c: e81f930200 call 0x145954780
14592b461: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b468: 4839d3 cmp rbx, rdx
14592b46b: 0f83c52b0000 jae 0x14592e036
14592b471: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b478: f3410f58c1 addss xmm0, xmm9
14592b47d: f30f11443860 movss dword ptr [rax + rdi + 0x60], xmm0
14592b483: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b48a: 4839d3 cmp rbx, rdx
14592b48d: 0f83b42b0000 jae 0x14592e047
14592b493: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b49a: 4c8b7c3818 mov r15, qword ptr [rax + rdi + 0x18]
14592b49f: 4801f8 add rax, rdi
14592b4a2: 410fb64f39 movzx ecx, byte ptr [r15 + 0x39]
14592b4a7: 83f901 cmp ecx, 1
14592b4aa: 0f8490060000 je 0x14592bb40
14592b4b0: 83f907 cmp ecx, 7
14592b4b3: 0f8477050000 je 0x14592ba30
14592b4b9: 83f908 cmp ecx, 8
14592b4bc: 0f85f6060000 jne 0x14592bbb8
14592b4c2: 488b8e30030000 mov rcx, qword ptr [rsi + 0x330]
14592b4c9: 4c8b8638030000 mov r8, qword ptr [rsi + 0x338]
14592b4d0: 488d1571b42d01 lea rdx, [rip + 0x12db471]
14592b4d7: 488995c0000000 mov qword ptr [rbp + 0xc0], rdx
14592b4de: 48c785c80000000c000000 mov qword ptr [rbp + 0xc8], 0xc
14592b4e9: 31d2 xor edx, edx
14592b4eb: 4c8d1dc6592c01 lea r11, [rip + 0x12c59c6]
14592b4f2: 4c8d7b01 lea r15, [rbx + 1]
14592b4f6: eb19 jmp 0x14592b511
14592b4f8: 0f1f840000000000 nop dword ptr [rax + rax]
14592b500: 4883c278 add rdx, 0x78
14592b504: 4881faf8340000 cmp rdx, 0x34f8
14592b50b: 0f84f7290000 je 0x14592df08
14592b511: 4a837c1a080c cmp qword ptr [rdx + r11 + 8], 0xc
14592b517: 75e7 jne 0x14592b500
14592b519: 4e8b0c1a mov r9, qword ptr [rdx + r11]
14592b51d: 4d8b11 mov r10, qword ptr [r9]
14592b520: 49be73656172696e675f movabs r14, 0x5f676e6972616573
14592b52a: 4d31f2 xor r10, r14
14592b52d: 458b4908 mov r9d, dword ptr [r9 + 8]
14592b531: 4981f17061696e xor r9, 0x6e696170
14592b538: 4d09d1 or r9, r10
14592b53b: 75c3 jne 0x14592b500
14592b53d: 4c01da add rdx, r11
14592b540: 4531f6 xor r14d, r14d
14592b543: 4d85c0 test r8, r8
14592b546: 0f84c0060000 je 0x14592bc0c
14592b54c: 49c1e005 shl r8, 5
14592b550: 4f8d0440 lea r8, [r8 + r8*2]
14592b554: 4531d2 xor r10d, r10d
14592b557: eb14 jmp 0x14592b56d
14592b559: 0f1f8000000000 nop dword ptr [rax]
14592b560: 4983c260 add r10, 0x60
14592b564: 4d39d0 cmp r8, r10
14592b567: 0f849f060000 je 0x14592bc0c
14592b56d: 4e8b0c11 mov r9, qword ptr [rcx + r10]
14592b571: 498379080c cmp qword ptr [r9 + 8], 0xc
14592b576: 75e8 jne 0x14592b560
14592b578: 4d8b19 mov r11, qword ptr [r9]
14592b57b: 4d8b3b mov r15, qword ptr [r11]
14592b57e: 49bc73656172696e675f movabs r12, 0x5f676e6972616573
14592b588: 4d31e7 xor r15, r12
14592b58b: 458b5b08 mov r11d, dword ptr [r11 + 8]
14592b58f: 4981f37061696e xor r11, 0x6e696170
14592b596: 4d09fb or r11, r15
14592b599: 4c8d7b01 lea r15, [rbx + 1]
14592b59d: 75c1 jne 0x14592b560
14592b59f: 468b741118 mov r14d, dword ptr [rcx + r10 + 0x18]
14592b5a4: e966060000 jmp 0x14592bc0f
14592b5a9: 4531f6 xor r14d, r14d
14592b5ac: 4c8d7b01 lea r15, [rbx + 1]
14592b5b0: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592b5b4: 4885d2 test rdx, rdx
14592b5b7: 0f855bfeffff jne 0x14592b418
14592b5bd: e965feffff jmp 0x14592b427
14592b5c2: f20f10840880010000 movsd xmm0, qword ptr [rax + rcx + 0x180]
14592b5cb: 410f5cc0 subps xmm0, xmm8
14592b5cf: 0f59c0 mulps xmm0, xmm0
14592b5d2: f30f16c8 movshdup xmm1, xmm0
14592b5d6: f30f58c8 addss xmm1, xmm0
14592b5da: 0f57c0 xorps xmm0, xmm0
14592b5dd: f30f51c1 sqrtss xmm0, xmm1
14592b5e1: f30f100df7ab5700 movss xmm1, dword ptr [rip + 0x57abf7]
14592b5e9: 0f2ec8 ucomiss xmm1, xmm0
14592b5ec: 7626 jbe 0x14592b614
14592b5ee: 440f28e2 movaps xmm12, xmm2
14592b5f2: 48837c0818ff cmp qword ptr [rax + rcx + 0x18], -1
14592b5f8: 0f95c2 setne dl
14592b5fb: 00d2 add dl, dl
14592b5fd: 0a9408d0010000 or dl, byte ptr [rax + rcx + 0x1d0]
14592b604: 889510010000 mov byte ptr [rbp + 0x110], dl
14592b60a: b001 mov al, 1
14592b60c: 898518010000 mov dword ptr [rbp + 0x118], eax
14592b612: eb0e jmp 0x14592b622
14592b614: 440f28e2 movaps xmm12, xmm2
14592b618: c7851801000000000000 mov dword ptr [rbp + 0x118], 0
14592b622: 8b4508 mov eax, dword ptr [rbp + 8]
14592b625: 8985c8000000 mov dword ptr [rbp + 0xc8], eax
14592b62b: 488b4500 mov rax, qword ptr [rbp]
14592b62f: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14592b636: 488d4d48 lea rcx, [rbp + 0x48]
14592b63a: 4889f2 mov rdx, rsi
14592b63d: 4c8d85c0000000 lea r8, [rbp + 0xc0]
14592b644: f30f101d445f4d00 movss xmm3, dword ptr [rip + 0x4d5f44]
14592b64c: e84fabffff call 0x1459261a0
14592b651: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592b655: 488b4558 mov rax, qword ptr [rbp + 0x58]
14592b659: 4885c0 test rax, rax
14592b65c: 0f84d7000000 je 0x14592b739
14592b662: 488d04c1 lea rax, [rcx + rax*8]
14592b666: f30f1086540a0000 movss xmm0, dword ptr [rsi + 0xa54]
14592b66e: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
14592b675: 4c698678050000d8010000 imul r8, qword ptr [rsi + 0x578], 0x1d8
14592b680: 4989c9 mov r9, rcx
14592b683: eb3e jmp 0x14592b6c3
14592b685: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592b690: f2420f104c12a8 movsd xmm1, qword ptr [rdx + r10 - 0x58]
14592b697: 410f5cc8 subps xmm1, xmm8
14592b69b: 0f59c9 mulps xmm1, xmm1
14592b69e: f30f16d1 movshdup xmm2, xmm1
14592b6a2: f30f58d1 addss xmm2, xmm1
14592b6a6: 0f57c9 xorps xmm1, xmm1
14592b6a9: f30f51ca sqrtss xmm1, xmm2
14592b6ad: f30f10152bdd4800 movss xmm2, dword ptr [rip + 0x48dd2b]
14592b6b5: 0f2ed1 ucomiss xmm2, xmm1
14592b6b8: 0f8781020000 ja 0x14592b93f
14592b6be: 4939c1 cmp r9, rax
14592b6c1: 7476 je 0x14592b739
14592b6c3: 4d8b31 mov r14, qword ptr [r9]
14592b6c6: 4983c108 add r9, 8
14592b6ca: 4531d2 xor r10d, r10d
14592b6cd: 4989d3 mov r11, rdx
14592b6d0: 4d39d0 cmp r8, r10
14592b6d3: 74e9 je 0x14592b6be
14592b6d5: 4981c2d8010000 add r10, 0x1d8
14592b6dc: 4d39b3f0000000 cmp qword ptr [r11 + 0xf0], r14
14592b6e3: 4d8d9bd8010000 lea r11, [r11 + 0x1d8]
14592b6ea: 75e4 jne 0x14592b6d0
14592b6ec: f3420f104c12b8 movss xmm1, dword ptr [rdx + r10 - 0x48]
14592b6f3: 0f2ef9 ucomiss xmm7, xmm1
14592b6f6: 7398 jae 0x14592b690
14592b6f8: 0f28d0 movaps xmm2, xmm0
14592b6fb: f3420f5c5412b4 subss xmm2, dword ptr [rdx + r10 - 0x4c]
14592b702: f30f5ed1 divss xmm2, xmm1
14592b706: 0f57c9 xorps xmm1, xmm1
14592b709: f30f5fca maxss xmm1, xmm2
14592b70d: f30f10155bcb4700 movss xmm2, dword ptr [rip + 0x47cb5b]
14592b715: f30f5dd1 minss xmm2, xmm1
14592b719: f2420f105c129c movsd xmm3, qword ptr [rdx + r10 - 0x64]
14592b720: f2420f106412a8 movsd xmm4, qword ptr [rdx + r10 - 0x58]
14592b727: 0f5ce3 subps xmm4, xmm3
14592b72a: f30f12ca movsldup xmm1, xmm2
14592b72e: 0f59cc mulps xmm1, xmm4
14592b731: 0f58cb addps xmm1, xmm3
14592b734: e95effffff jmp 0x14592b697
14592b739: 4531ed xor r13d, r13d
14592b73c: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592b740: 4885d2 test rdx, rdx
14592b743: 740f je 0x14592b754
14592b745: 48c1e203 shl rdx, 3
14592b749: 41b808000000 mov r8d, 8
14592b74f: e87c6a6dfa call 0x1400021d0
14592b754: b001 mov al, 1
14592b756: 4584ed test r13b, r13b
14592b759: 7459 je 0x14592b7b4
14592b75b: 488b8e70050000 mov rcx, qword ptr [rsi + 0x570]
14592b762: 4c698678050000d8010000 imul r8, qword ptr [rsi + 0x578], 0x1d8
14592b76d: 31d2 xor edx, edx
14592b76f: 4989c9 mov r9, rcx
14592b772: 440fb69510010000 movzx r10d, byte ptr [rbp + 0x110]
14592b77a: 660f1f440000 nop word ptr [rax + rax]
14592b780: 4939d0 cmp r8, rdx
14592b783: 742f je 0x14592b7b4
14592b785: 4881c2d8010000 add rdx, 0x1d8
14592b78c: 4d39b1f0000000 cmp qword ptr [r9 + 0xf0], r14
14592b793: 4d8d89d8010000 lea r9, [r9 + 0x1d8]
14592b79a: 75e4 jne 0x14592b780
14592b79c: 4883bc1140feffffff cmp qword ptr [rcx + rdx - 0x1c0], -1
14592b7a5: 0f95c0 setne al
14592b7a8: 00c0 add al, al
14592b7aa: 0a4411f8 or al, byte ptr [rcx + rdx - 8]
14592b7ae: 4138c2 cmp r10b, al
14592b7b1: 0f93c0 setae al
14592b7b4: 41807f3900 cmp byte ptr [r15 + 0x39], 0
14592b7b9: 7413 je 0x14592b7ce
14592b7bb: 4889f1 mov rcx, rsi
14592b7be: 4889da mov rdx, rbx
14592b7c1: e8ea7d0200 call 0x1459535b0
14592b7c6: 4989c5 mov r13, rax
14592b7c9: 4989d6 mov r14, rdx
14592b7cc: eb08 jmp 0x14592b7d6
14592b7ce: 848518010000 test byte ptr [rbp + 0x118], al
14592b7d4: 750d jne 0x14592b7e3
14592b7d6: 4d89f4 mov r12, r14
14592b7d9: 41f6c501 test r13b, 1
14592b7dd: 0f84e8000000 je 0x14592b8cb
14592b7e3: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b7ea: 4839d3 cmp rbx, rdx
14592b7ed: 0f8332280000 jae 0x14592e025
14592b7f3: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b7fa: 4c89643828 mov qword ptr [rax + rdi + 0x28], r12
14592b7ff: 488b8670050000 mov rax, qword ptr [rsi + 0x570]
14592b806: 48699678050000d8010000 imul rdx, qword ptr [rsi + 0x578], 0x1d8
14592b811: 31c9 xor ecx, ecx
14592b813: 4989c0 mov r8, rax
14592b816: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592b820: 4839ca cmp rdx, rcx
14592b823: 0f840d010000 je 0x14592b936
14592b829: 4881c1d8010000 add rcx, 0x1d8
14592b830: 4d39a0f0000000 cmp qword ptr [r8 + 0xf0], r12
14592b837: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
14592b83e: 75e0 jne 0x14592b820
14592b840: f30f104408b8 movss xmm0, dword ptr [rax + rcx - 0x48]
14592b846: 0f2ef8 ucomiss xmm7, xmm0
14592b849: 0f8308010000 jae 0x14592b957
14592b84f: f30f104c08b4 movss xmm1, dword ptr [rax + rcx - 0x4c]
14592b855: f30f12c9 movsldup xmm1, xmm1
14592b859: 0f2855c0 movaps xmm2, xmmword ptr [rbp - 0x40]
14592b85d: 0f5cd1 subps xmm2, xmm1
14592b860: f30f12c0 movsldup xmm0, xmm0
14592b864: 0f5ed0 divps xmm2, xmm0
14592b867: 0f57c0 xorps xmm0, xmm0
14592b86a: 0f5fc2 maxps xmm0, xmm2
14592b86d: 0f280daccc4700 movaps xmm1, xmmword ptr [rip + 0x47ccac]
14592b874: 0fc2c801 cmpltps xmm1, xmm0
14592b878: 0f14c9 unpcklps xmm1, xmm1
14592b87b: 660f50d1 movmskpd edx, xmm1
14592b87f: f30f100de9c94700 movss xmm1, dword ptr [rip + 0x47c9e9]
14592b887: f6c202 test dl, 2
14592b88a: 7504 jne 0x14592b890
14592b88c: f30f16c8 movshdup xmm1, xmm0
14592b890: f30f1015d8c94700 movss xmm2, dword ptr [rip + 0x47c9d8]
14592b898: f6c201 test dl, 1
14592b89b: 7503 jne 0x14592b8a0
14592b89d: 0f28d0 movaps xmm2, xmm0
14592b8a0: f20f105c089c movsd xmm3, qword ptr [rax + rcx - 0x64]
14592b8a6: f20f106408a8 movsd xmm4, qword ptr [rax + rcx - 0x58]
14592b8ac: 0f5ce3 subps xmm4, xmm3
14592b8af: f30f12c1 movsldup xmm0, xmm1
14592b8b3: 0f59c4 mulps xmm0, xmm4
14592b8b6: 0f58c3 addps xmm0, xmm3
14592b8b9: f3440f12e2 movsldup xmm12, xmm2
14592b8be: 440f59e4 mulps xmm12, xmm4
14592b8c2: 440f58e3 addps xmm12, xmm3
14592b8c6: e997000000 jmp 0x14592b962
14592b8cb: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b8d2: 4839d3 cmp rbx, rdx
14592b8d5: 0f837d270000 jae 0x14592e058
14592b8db: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b8e2: 48c744382800000000 mov qword ptr [rax + rdi + 0x28], 0
14592b8eb: 450f5cd4 subps xmm10, xmm12
14592b8ef: 450f59d2 mulps xmm10, xmm10
14592b8f3: f3410f16c2 movshdup xmm0, xmm10
14592b8f8: f3410f58c2 addss xmm0, xmm10
14592b8fd: f30f51c0 sqrtss xmm0, xmm0
14592b901: 0f2e054c624800 ucomiss xmm0, dword ptr [rip + 0x48624c]
14592b908: 4c8d7b01 lea r15, [rbx + 1]
14592b90c: 0f8627f8ffff jbe 0x14592b139
14592b912: 410f28d4 movaps xmm2, xmm12
14592b916: f3410f16dc movshdup xmm3, xmm12
14592b91b: f30f1045e8 movss xmm0, dword ptr [rbp - 0x18]
14592b920: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14592b926: 4889f1 mov rcx, rsi
14592b929: 4889da mov rdx, rbx
14592b92c: e8af8f0000 call 0x1459348e0
14592b931: e903f8ffff jmp 0x14592b139
14592b936: 4c8b7d38 mov r15, qword ptr [rbp + 0x38]
14592b93a: e9faf7ffff jmp 0x14592b139
14592b93f: 41bd01000000 mov r13d, 1
14592b945: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592b949: 4885d2 test rdx, rdx
14592b94c: 0f85f3fdffff jne 0x14592b745
14592b952: e9fdfdffff jmp 0x14592b754
14592b957: f2440f106408a8 movsd xmm12, qword ptr [rax + rcx - 0x58]
14592b95e: 410f28c4 movaps xmm0, xmm12
14592b962: 410f28ca movaps xmm1, xmm10
14592b966: 0f5cc8 subps xmm1, xmm0
14592b969: 0f59c9 mulps xmm1, xmm1
14592b96c: f30f16c1 movshdup xmm0, xmm1
14592b970: f30f58c1 addss xmm0, xmm1
14592b974: f30f51c0 sqrtss xmm0, xmm0
14592b978: f30f100d74af7a00 movss xmm1, dword ptr [rip + 0x7aaf74]
14592b980: 0f2ec8 ucomiss xmm1, xmm0
14592b983: 0f828d200000 jb 0x14592da16
14592b989: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b990: 4839d3 cmp rbx, rdx
14592b993: 0f83e1260000 jae 0x14592e07a
14592b999: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b9a0: 440f2e4c3860 ucomiss xmm9, dword ptr [rax + rdi + 0x60]
14592b9a6: 0f826a200000 jb 0x14592da16
14592b9ac: 4889f1 mov rcx, rsi
14592b9af: 4889da mov rdx, rbx
14592b9b2: e8c98d0200 call 0x145954780
14592b9b7: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b9be: 4839d3 cmp rbx, rdx
14592b9c1: 0f83e6260000 jae 0x14592e0ad
14592b9c7: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592b9ce: f3410f58c1 addss xmm0, xmm9
14592b9d3: f30f11443860 movss dword ptr [rax + rdi + 0x60], xmm0
14592b9d9: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592b9e0: 4839d3 cmp rbx, rdx
14592b9e3: 0f83d5260000 jae 0x14592e0be
14592b9e9: 4c8baed0000000 mov r13, qword ptr [rsi + 0xd0]
14592b9f0: 498b443d18 mov rax, qword ptr [r13 + rdi + 0x18]
14592b9f5: 4901fd add r13, rdi
14592b9f8: 48898518010000 mov qword ptr [rbp + 0x118], rax
14592b9ff: 0fb64039 movzx eax, byte ptr [rax + 0x39]
14592ba03: 8d48fe lea ecx, [rax - 2]
14592ba06: 83f902 cmp ecx, 2
14592ba09: 0f8250080000 jb 0x14592c25f
14592ba0f: 85c0 test eax, eax
14592ba11: 0f84f1140000 je 0x14592cf08
14592ba17: 83f805 cmp eax, 5
14592ba1a: 0f85c9150000 jne 0x14592cfe9
14592ba20: 48c78510010000feffffff mov qword ptr [rbp + 0x110], 0xfffffffffffffffe
14592ba2b: e93b080000 jmp 0x14592c26b
14592ba30: 80787c00 cmp byte ptr [rax + 0x7c], 0
14592ba34: c6407c00 mov byte ptr [rax + 0x7c], 0
14592ba38: f3440f101517ab4800 movss xmm10, dword ptr [rip + 0x48ab17]
14592ba41: 4c8d0d70542c01 lea r9, [rip + 0x12c5470]
14592ba48: 7509 jne 0x14592ba53
14592ba4a: f3440f10151dc84700 movss xmm10, dword ptr [rip + 0x47c81d]
14592ba53: 488b8e30030000 mov rcx, qword ptr [rsi + 0x330]
14592ba5a: 488b8638030000 mov rax, qword ptr [rsi + 0x338]
14592ba61: 488d15d2862d01 lea rdx, [rip + 0x12d86d2]
14592ba68: 488995c0000000 mov qword ptr [rbp + 0xc0], rdx
14592ba6f: 48c785c80000000b000000 mov qword ptr [rbp + 0xc8], 0xb
14592ba7a: 4531f6 xor r14d, r14d
14592ba7d: eb12 jmp 0x14592ba91
14592ba7f: 90 nop
14592ba80: 4983c678 add r14, 0x78
14592ba84: 4981fef8340000 cmp r14, 0x34f8
14592ba8b: 0f8477240000 je 0x14592df08
14592ba91: 4b837c0e080b cmp qword ptr [r14 + r9 + 8], 0xb
14592ba97: 75e7 jne 0x14592ba80
14592ba99: 4b8b140e mov rdx, qword ptr [r14 + r9]
14592ba9d: 4c8b02 mov r8, qword ptr [rdx]
14592baa0: 49ba736861646f775f62 movabs r10, 0x625f776f64616873
14592baaa: 4d31d0 xor r8, r10
14592baad: 488b5203 mov rdx, qword ptr [rdx + 3]
14592bab1: 49ba646f775f626f6c74 movabs r10, 0x746c6f625f776f64
14592babb: 4c31d2 xor rdx, r10
14592babe: 4c09c2 or rdx, r8
14592bac1: 75bd jne 0x14592ba80
14592bac3: 4d01ce add r14, r9
14592bac6: 4885c0 test rax, rax
14592bac9: f30f117534 movss dword ptr [rbp + 0x34], xmm6
14592bace: 0f8419060000 je 0x14592c0ed
14592bad4: 4889c2 mov rdx, rax
14592bad7: 48c1e205 shl rdx, 5
14592badb: 488d1452 lea rdx, [rdx + rdx*2]
14592badf: 4531c0 xor r8d, r8d
14592bae2: eb19 jmp 0x14592bafd
14592bae4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592baf0: 4983c060 add r8, 0x60
14592baf4: 4c39c2 cmp rdx, r8
14592baf7: 0f84ce030000 je 0x14592becb
14592bafd: 4e8b0c01 mov r9, qword ptr [rcx + r8]
14592bb01: 498379080b cmp qword ptr [r9 + 8], 0xb
14592bb06: 75e8 jne 0x14592baf0
14592bb08: 4d8b11 mov r10, qword ptr [r9]
14592bb0b: 4d8b1a mov r11, qword ptr [r10]
14592bb0e: 49bf736861646f775f62 movabs r15, 0x625f776f64616873
14592bb18: 4d31fb xor r11, r15
14592bb1b: 4d8b5203 mov r10, qword ptr [r10 + 3]
14592bb1f: 49bf646f775f626f6c74 movabs r15, 0x746c6f625f776f64
14592bb29: 4d31fa xor r10, r15
14592bb2c: 4d09da or r10, r11
14592bb2f: 75bf jne 0x14592baf0
14592bb31: f3460f10640110 movss xmm12, dword ptr [rcx + r8 + 0x10]
14592bb38: 4d89ce mov r14, r9
14592bb3b: e972090000 jmp 0x14592c4b2
14592bb40: f3440f1096540a0000 movss xmm10, dword ptr [rsi + 0xa54]
14592bb49: f30f10405c movss xmm0, dword ptr [rax + 0x5c]
14592bb4e: 0f2ef8 ucomiss xmm7, xmm0
14592bb51: 0f8352010000 jae 0x14592bca9
14592bb57: 410f28ca movaps xmm1, xmm10
14592bb5b: f30f5c4858 subss xmm1, dword ptr [rax + 0x58]
14592bb60: f30f5ec8 divss xmm1, xmm0
14592bb64: 0f57c0 xorps xmm0, xmm0
14592bb67: f30f5fc1 maxss xmm0, xmm1
14592bb6b: f30f100dfdc64700 movss xmm1, dword ptr [rip + 0x47c6fd]
14592bb73: f30f5dc8 minss xmm1, xmm0
14592bb77: f30f104048 movss xmm0, dword ptr [rax + 0x48]
14592bb7c: f30f105054 movss xmm2, dword ptr [rax + 0x54]
14592bb81: f30f5cd0 subss xmm2, xmm0
14592bb85: f30f59d1 mulss xmm2, xmm1
14592bb89: f30f58d0 addss xmm2, xmm0
14592bb8d: f20f104040 movsd xmm0, qword ptr [rax + 0x40]
14592bb92: f20f10584c movsd xmm3, qword ptr [rax + 0x4c]
14592bb97: 0f5cd8 subps xmm3, xmm0
14592bb9a: f30f12c9 movsldup xmm1, xmm1
14592bb9e: 0f59cb mulps xmm1, xmm3
14592bba1: 0f58c8 addps xmm1, xmm0
14592bba4: 0f138df0000000 movlps qword ptr [rbp + 0xf0], xmm1
14592bbab: f30f1195f8000000 movss dword ptr [rbp + 0xf8], xmm2
14592bbb3: e905010000 jmp 0x14592bcbd
14592bbb8: f30f1086540a0000 movss xmm0, dword ptr [rsi + 0xa54]
14592bbc0: f30f10485c movss xmm1, dword ptr [rax + 0x5c]
14592bbc5: 0f2ef9 ucomiss xmm7, xmm1
14592bbc8: 0f833a010000 jae 0x14592bd08
14592bbce: 0f28d0 movaps xmm2, xmm0
14592bbd1: f30f5c5058 subss xmm2, dword ptr [rax + 0x58]
14592bbd6: f30f5ed1 divss xmm2, xmm1
14592bbda: 0f57c9 xorps xmm1, xmm1
14592bbdd: f30f5fca maxss xmm1, xmm2
14592bbe1: f30f101587c64700 movss xmm2, dword ptr [rip + 0x47c687]
14592bbe9: f30f5dd1 minss xmm2, xmm1
14592bbed: f20f104840 movsd xmm1, qword ptr [rax + 0x40]
14592bbf2: f20f10584c movsd xmm3, qword ptr [rax + 0x4c]
14592bbf7: 0f5cd9 subps xmm3, xmm1
14592bbfa: f3440f12d2 movsldup xmm10, xmm2
14592bbff: 440f59d3 mulps xmm10, xmm3
14592bc03: 440f58d1 addps xmm10, xmm1
14592bc07: e902010000 jmp 0x14592bd0e
14592bc0c: 4989d1 mov r9, rdx
14592bc0f: 418b4954 mov ecx, dword ptr [r9 + 0x54]
14592bc13: 4101ce add r14d, ecx
14592bc16: 8b96bc040000 mov edx, dword ptr [rsi + 0x4bc]
14592bc1c: 458d0416 lea r8d, [r14 + rdx]
14592bc20: 4183f801 cmp r8d, 1
14592bc24: 4111d6 adc r14d, edx
14592bc27: 4183c602 add r14d, 2
14592bc2b: 85c9 test ecx, ecx
14592bc2d: b903000000 mov ecx, 3
14592bc32: 440f44f1 cmove r14d, ecx
14592bc36: f30f10405c movss xmm0, dword ptr [rax + 0x5c]
14592bc3b: 0f2ef8 ucomiss xmm7, xmm0
14592bc3e: 0f8359010000 jae 0x14592bd9d
14592bc44: f30f108e540a0000 movss xmm1, dword ptr [rsi + 0xa54]
14592bc4c: f30f5c4858 subss xmm1, dword ptr [rax + 0x58]
14592bc51: f30f5ec8 divss xmm1, xmm0
14592bc55: 0f57c0 xorps xmm0, xmm0
14592bc58: f30f5fc1 maxss xmm0, xmm1
14592bc5c: f30f100d0cc64700 movss xmm1, dword ptr [rip + 0x47c60c]
14592bc64: f30f5dc8 minss xmm1, xmm0
14592bc68: f30f104048 movss xmm0, dword ptr [rax + 0x48]
14592bc6d: f30f105054 movss xmm2, dword ptr [rax + 0x54]
14592bc72: f30f5cd0 subss xmm2, xmm0
14592bc76: f30f59d1 mulss xmm2, xmm1
14592bc7a: f30f58d0 addss xmm2, xmm0
14592bc7e: f20f104040 movsd xmm0, qword ptr [rax + 0x40]
14592bc83: f20f10584c movsd xmm3, qword ptr [rax + 0x4c]
14592bc88: 0f5cd8 subps xmm3, xmm0
14592bc8b: f30f12c9 movsldup xmm1, xmm1
14592bc8f: 0f59cb mulps xmm1, xmm3
14592bc92: 0f58c8 addps xmm1, xmm0
14592bc95: 0f138da8000000 movlps qword ptr [rbp + 0xa8], xmm1
14592bc9c: f30f1195b0000000 movss dword ptr [rbp + 0xb0], xmm2
14592bca4: e908010000 jmp 0x14592bdb1
14592bca9: 8b4854 mov ecx, dword ptr [rax + 0x54]
14592bcac: 898df8000000 mov dword ptr [rbp + 0xf8], ecx
14592bcb2: 488b404c mov rax, qword ptr [rax + 0x4c]
14592bcb6: 488985f0000000 mov qword ptr [rbp + 0xf0], rax
14592bcbd: 488b8650010000 mov rax, qword ptr [rsi + 0x150]
14592bcc4: 4885c0 test rax, rax
14592bcc7: 0f841e020000 je 0x14592beeb
14592bccd: 488b8e48010000 mov rcx, qword ptr [rsi + 0x148]
14592bcd4: 4531c0 xor r8d, r8d
14592bcd7: 660f1f840000000000 nop word ptr [rax + rax]
14592bce0: 410f28c2 movaps xmm0, xmm10
14592bce4: f3420f5c0481 subss xmm0, dword ptr [rcx + r8*4]
14592bcea: f30f100d7ec54700 movss xmm1, dword ptr [rip + 0x47c57e]
14592bcf2: 0f2ec8 ucomiss xmm1, xmm0
14592bcf5: 0f86ad1f0000 jbe 0x14592dca8
14592bcfb: 49ffc0 inc r8
14592bcfe: 4c39c0 cmp rax, r8
14592bd01: 75dd jne 0x14592bce0
14592bd03: e9e5010000 jmp 0x14592beed
14592bd08: f2440f10504c movsd xmm10, qword ptr [rax + 0x4c]
14592bd0e: 4c8b6820 mov r13, qword ptr [rax + 0x20]
14592bd12: 488b8670050000 mov rax, qword ptr [rsi + 0x570]
14592bd19: 48699678050000d8010000 imul rdx, qword ptr [rsi + 0x578], 0x1d8
14592bd24: 31c9 xor ecx, ecx
14592bd26: 4989c0 mov r8, rax
14592bd29: 0f1f8000000000 nop dword ptr [rax]
14592bd30: 4839ca cmp rdx, rcx
14592bd33: 0f84c8f5ffff je 0x14592b301
14592bd39: 4881c1d8010000 add rcx, 0x1d8
14592bd40: 4d39a0f0000000 cmp qword ptr [r8 + 0xf0], r12
14592bd47: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
14592bd4e: 75e0 jne 0x14592bd30
14592bd50: f30f104c08b8 movss xmm1, dword ptr [rax + rcx - 0x48]
14592bd56: 0f2ef9 ucomiss xmm7, xmm1
14592bd59: 0f8314050000 jae 0x14592c273
14592bd5f: f30f5c4408b4 subss xmm0, dword ptr [rax + rcx - 0x4c]
14592bd65: f30f5ec1 divss xmm0, xmm1
14592bd69: 0f57c9 xorps xmm1, xmm1
14592bd6c: f30f5fc8 maxss xmm1, xmm0
14592bd70: f30f1005f8c44700 movss xmm0, dword ptr [rip + 0x47c4f8]
14592bd78: f30f5dc1 minss xmm0, xmm1
14592bd7c: f20f104c089c movsd xmm1, qword ptr [rax + rcx - 0x64]
14592bd82: f20f105408a8 movsd xmm2, qword ptr [rax + rcx - 0x58]
14592bd88: 0f5cd1 subps xmm2, xmm1
14592bd8b: f3440f12e0 movsldup xmm12, xmm0
14592bd90: 440f59e2 mulps xmm12, xmm2
14592bd94: 440f58e1 addps xmm12, xmm1
14592bd98: e9dd040000 jmp 0x14592c27a
14592bd9d: 8b4854 mov ecx, dword ptr [rax + 0x54]
14592bda0: 898db0000000 mov dword ptr [rbp + 0xb0], ecx
14592bda6: 488b404c mov rax, qword ptr [rax + 0x4c]
14592bdaa: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14592bdb1: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592bdb8: 4889f2 mov rdx, rsi
14592bdbb: 4c8d85a8000000 lea r8, [rbp + 0xa8]
14592bdc2: f30f101dbac64700 movss xmm3, dword ptr [rip + 0x47c6ba]
14592bdca: e8d1a3ffff call 0x1459261a0
14592bdcf: 488b95d0000000 mov rdx, qword ptr [rbp + 0xd0]
14592bdd6: 4885d2 test rdx, rdx
14592bdd9: 0f841c030000 je 0x14592c0fb
14592bddf: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14592bde6: 48ffca dec rdx
14592bde9: 4883c108 add rcx, 8
14592bded: 4c8d86c0090000 lea r8, [rsi + 0x9c0]
14592bdf4: e8170d0a00 call 0x1459ccb10
14592bdf9: 90 nop
14592bdfa: 48c7455000000000 mov qword ptr [rbp + 0x50], 0
14592be02: 4c897558 mov qword ptr [rbp + 0x58], r14
14592be06: 488d85c0000000 lea rax, [rbp + 0xc0]
14592be0d: 48894548 mov qword ptr [rbp + 0x48], rax
14592be11: 488d8df0000000 lea rcx, [rbp + 0xf0]
14592be18: 488d5548 lea rdx, [rbp + 0x48]
14592be1c: e85f740b00 call 0x1459e3280
14592be21: 90 nop
14592be22: 4c8bb500010000 mov r14, qword ptr [rbp + 0x100]
14592be29: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14592be30: 4885d2 test rdx, rdx
14592be33: 7416 je 0x14592be4b
14592be35: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14592be3c: 48c1e203 shl rdx, 3
14592be40: 41b808000000 mov r8d, 8
14592be46: e885636dfa call 0x1400021d0
14592be4b: 4d85f6 test r14, r14
14592be4e: 0f849c050000 je 0x14592c3f0
14592be54: 4c8b85f8000000 mov r8, qword ptr [rbp + 0xf8]
14592be5b: 488d051eac2d01 lea rax, [rip + 0x12dac1e]
14592be62: 48894548 mov qword ptr [rbp + 0x48], rax
14592be66: 48c7455009000000 mov qword ptr [rbp + 0x50], 9
14592be6e: 48c7455800000000 mov qword ptr [rbp + 0x58], 0
14592be76: 66c745700000 mov word ptr [rbp + 0x70], 0
14592be7c: 488d4548 lea rax, [rbp + 0x48]
14592be80: 4889442420 mov qword ptr [rsp + 0x20], rax
14592be85: 4889f1 mov rcx, rsi
14592be88: 4889da mov rdx, rbx
14592be8b: 4c898518010000 mov qword ptr [rbp + 0x118], r8
14592be92: 4d89f1 mov r9, r14
14592be95: e8c6a90200 call 0x145956860
14592be9a: 90 nop
14592be9b: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592bea2: 4885d2 test rdx, rdx
14592bea5: 0f84a1150000 je 0x14592d44c
14592beab: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592beb2: 4883fa01 cmp rdx, 1
14592beb6: 0f8583140000 jne 0x14592d33f
14592bebc: 31c9 xor ecx, ecx
14592bebe: f30f10052ac64700 movss xmm0, dword ptr [rip + 0x47c62a]
14592bec6: e9b9140000 jmp 0x14592d384
14592becb: 89c2 mov edx, eax
14592becd: 83e203 and edx, 3
14592bed0: 4883f804 cmp rax, 4
14592bed4: 0f833c050000 jae 0x14592c416
14592beda: 4531c0 xor r8d, r8d
14592bedd: f3440f10250ac64700 movss xmm12, dword ptr [rip + 0x47c60a]
14592bee6: e987050000 jmp 0x14592c472
14592beeb: 31c0 xor eax, eax
14592beed: b918000000 mov ecx, 0x18
14592bef2: 4829c1 sub rcx, rax
14592bef5: 41be00000000 mov r14d, 0
14592befb: 4c0f43f1 cmovae r14, rcx
14592beff: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
14592bf06: 488d85a8000000 lea rax, [rbp + 0xa8]
14592bf0d: 4889442420 mov qword ptr [rsp + 0x20], rax
14592bf12: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
14592bf1b: 4c8d7d48 lea r15, [rbp + 0x48]
14592bf1f: 4c89f9 mov rcx, r15
14592bf22: 4889f2 mov rdx, rsi
14592bf25: 4c8d85f0000000 lea r8, [rbp + 0xf0]
14592bf2c: f30f101d50c54700 movss xmm3, dword ptr [rip + 0x47c550]
14592bf34: e897a0ffff call 0x145925fd0
14592bf39: 488b4548 mov rax, qword ptr [rbp + 0x48]
14592bf3d: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592bf41: 488b5558 mov rdx, qword ptr [rbp + 0x58]
14592bf45: 488d14d1 lea rdx, [rcx + rdx*8]
14592bf49: 48894d48 mov qword ptr [rbp + 0x48], rcx
14592bf4d: 48894d50 mov qword ptr [rbp + 0x50], rcx
14592bf51: 48894558 mov qword ptr [rbp + 0x58], rax
14592bf55: 48895560 mov qword ptr [rbp + 0x60], rdx
14592bf59: 488d8668050000 lea rax, [rsi + 0x568]
14592bf60: 48894568 mov qword ptr [rbp + 0x68], rax
14592bf64: 4c897570 mov qword ptr [rbp + 0x70], r14
14592bf68: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592bf6f: 4c89fa mov rdx, r15
14592bf72: e869a20b00 call 0x1459e61e0
14592bf77: 4c8bbdc8000000 mov r15, qword ptr [rbp + 0xc8]
14592bf7e: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14592bf85: 488d0cc500000000 lea rcx, [rax*8]
14592bf8d: 48894d28 mov qword ptr [rbp + 0x28], rcx
14592bf91: 48898518010000 mov qword ptr [rbp + 0x118], rax
14592bf98: 4d8d34c7 lea r14, [r15 + rax*8]
14592bf9c: 4c89bd10010000 mov qword ptr [rbp + 0x110], r15
14592bfa3: eb26 jmp 0x14592bfcb
14592bfa5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592bfb0: 4983c708 add r15, 8
14592bfb4: 488b8648010000 mov rax, qword ptr [rsi + 0x148]
14592bfbb: f3460f1114a8 movss dword ptr [rax + r13*4], xmm10
14592bfc1: 49ffc5 inc r13
14592bfc4: 4c89ae50010000 mov qword ptr [rsi + 0x150], r13
14592bfcb: 4d39f7 cmp r15, r14
14592bfce: 7426 je 0x14592bff6
14592bfd0: 4c8bae50010000 mov r13, qword ptr [rsi + 0x150]
14592bfd7: 4c3bae40010000 cmp r13, qword ptr [rsi + 0x140]
14592bfde: 75d0 jne 0x14592bfb0
14592bfe0: c6850e01000001 mov byte ptr [rbp + 0x10e], 1
14592bfe7: 488d8e40010000 lea rcx, [rsi + 0x140]
14592bfee: e85de42d00 call 0x145c0a450
14592bff3: 90 nop
14592bff4: ebba jmp 0x14592bfb0
14592bff6: e805626dfa call 0x140002200
14592bffb: b908000000 mov ecx, 8
14592c000: ba08000000 mov edx, 8
14592c005: e8b6616dfa call 0x1400021c0
14592c00a: 4885c0 test rax, rax
14592c00d: 0f84461f0000 je 0x14592df59
14592c013: 4989c5 mov r13, rax
14592c016: 4c8920 mov qword ptr [rax], r12
14592c019: 48c7454801000000 mov qword ptr [rbp + 0x48], 1
14592c021: 48894550 mov qword ptr [rbp + 0x50], rax
14592c025: 48c7455801000000 mov qword ptr [rbp + 0x58], 1
14592c02d: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14592c034: 41be01000000 mov r14d, 1
14592c03a: 4c8ba518010000 mov r12, qword ptr [rbp + 0x118]
14592c041: 4d85e4 test r12, r12
14592c044: 4c8d7b01 lea r15, [rbx + 1]
14592c048: 0f850d1d0000 jne 0x14592dd5b
14592c04e: 4885d2 test rdx, rdx
14592c051: 7416 je 0x14592c069
14592c053: 48c1e203 shl rdx, 3
14592c057: 41b808000000 mov r8d, 8
14592c05d: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14592c064: e867616dfa call 0x1400021d0
14592c069: 4d01e6 add r14, r12
14592c06c: 488b4548 mov rax, qword ptr [rbp + 0x48]
14592c070: 48898510010000 mov qword ptr [rbp + 0x110], rax
14592c077: 488d05faa92d01 lea rax, [rip + 0x12da9fa]
14592c07e: 48894548 mov qword ptr [rbp + 0x48], rax
14592c082: 48c7455008000000 mov qword ptr [rbp + 0x50], 8
14592c08a: 48c7455800000000 mov qword ptr [rbp + 0x58], 0
14592c092: 66c745700000 mov word ptr [rbp + 0x70], 0
14592c098: 488d4548 lea rax, [rbp + 0x48]
14592c09c: 4889442420 mov qword ptr [rsp + 0x20], rax
14592c0a1: 4889f1 mov rcx, rsi
14592c0a4: 4889da mov rdx, rbx
14592c0a7: 4c89ad18010000 mov qword ptr [rbp + 0x118], r13
14592c0ae: 4d89e8 mov r8, r13
14592c0b1: 4d89f1 mov r9, r14
14592c0b4: e857ae0200 call 0x145956f10
14592c0b9: 90 nop
14592c0ba: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592c0c1: 4885d2 test rdx, rdx
14592c0c4: 4c8b9d18010000 mov r11, qword ptr [rbp + 0x118]
14592c0cb: 0f846c010000 je 0x14592c23d
14592c0d1: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592c0d8: 4883fa01 cmp rdx, 1
14592c0dc: 7548 jne 0x14592c126
14592c0de: 31c9 xor ecx, ecx
14592c0e0: f30f100508c44700 movss xmm0, dword ptr [rip + 0x47c408]
14592c0e8: e985000000 jmp 0x14592c172
14592c0ed: f3440f10257ac14700 movss xmm12, dword ptr [rip + 0x47c17a]
14592c0f6: e9b7030000 jmp 0x14592c4b2
14592c0fb: 48c785f000000000000000 mov qword ptr [rbp + 0xf0], 0
14592c106: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14592c10d: 4885d2 test rdx, rdx
14592c110: 0f8458130000 je 0x14592d46e
14592c116: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14592c11d: 48c1e203 shl rdx, 3
14592c121: e9e5020000 jmp 0x14592c40b
14592c126: 4989d0 mov r8, rdx
14592c129: 4983e0fe and r8, 0xfffffffffffffffe
14592c12d: 31c9 xor ecx, ecx
14592c12f: f30f1005b9c34700 movss xmm0, dword ptr [rip + 0x47c3b9]
14592c137: eb10 jmp 0x14592c149
14592c139: 0f1f8000000000 nop dword ptr [rax]
14592c140: 4883c102 add rcx, 2
14592c144: 4939c8 cmp r8, rcx
14592c147: 7424 je 0x14592c16d
14592c149: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592c14d: 7409 je 0x14592c158
14592c14f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592c154: 75ea jne 0x14592c140
14592c156: eb0d jmp 0x14592c165
14592c158: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592c15e: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592c163: 75db jne 0x14592c140
14592c165: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592c16b: ebd3 jmp 0x14592c140
14592c16d: f6c201 test dl, 1
14592c170: 740c je 0x14592c17e
14592c172: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592c176: 7506 jne 0x14592c17e
14592c178: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592c17e: 0f2ec7 ucomiss xmm0, xmm7
14592c181: 0f86b6000000 jbe 0x14592c23d
14592c187: 488b86d8090000 mov rax, qword ptr [rsi + 0x9d8]
14592c18e: 488b8ec0090000 mov rcx, qword ptr [rsi + 0x9c0]
14592c195: 488b96c8090000 mov rdx, qword ptr [rsi + 0x9c8]
14592c19c: 4c8d0408 lea r8, [rax + rcx]
14592c1a0: 49c1c017 rol r8, 0x17
14592c1a4: 4901c8 add r8, rcx
14592c1a7: 4989d1 mov r9, rdx
14592c1aa: 49c1e111 shl r9, 0x11
14592c1ae: 4c8b96d0090000 mov r10, qword ptr [rsi + 0x9d0]
14592c1b5: 4931ca xor r10, rcx
14592c1b8: 4831d0 xor rax, rdx
14592c1bb: 4c31d2 xor rdx, r10
14592c1be: 488996c8090000 mov qword ptr [rsi + 0x9c8], rdx
14592c1c5: 4831c1 xor rcx, rax
14592c1c8: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14592c1cf: 4d31ca xor r10, r9
14592c1d2: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
14592c1d9: 48c1c02d rol rax, 0x2d
14592c1dd: 49c1e828 shr r8, 0x28
14592c1e1: f3410f2ac8 cvtsi2ss xmm1, r8d
14592c1e6: 488986d8090000 mov qword ptr [rsi + 0x9d8], rax
14592c1ed: f30f590d5b185900 mulss xmm1, dword ptr [rip + 0x59185b]
14592c1f5: 0f2ec1 ucomiss xmm0, xmm1
14592c1f8: 7643 jbe 0x14592c23d
14592c1fa: 488d05d4a52d01 lea rax, [rip + 0x12da5d4]
14592c201: 48894548 mov qword ptr [rbp + 0x48], rax
14592c205: 48c745500e000000 mov qword ptr [rbp + 0x50], 0xe
14592c20d: 48c7455800000000 mov qword ptr [rbp + 0x58], 0
14592c215: 66c745700000 mov word ptr [rbp + 0x70], 0
14592c21b: 488d4548 lea rax, [rbp + 0x48]
14592c21f: 4889442420 mov qword ptr [rsp + 0x20], rax
14592c224: 4889f1 mov rcx, rsi
14592c227: 4889da mov rdx, rbx
14592c22a: 4d89d8 mov r8, r11
14592c22d: 4d89f1 mov r9, r14
14592c230: e8dbac0200 call 0x145956f10
14592c235: 90 nop
14592c236: 4c8b9d18010000 mov r11, qword ptr [rbp + 0x118]
14592c23d: 488b9510010000 mov rdx, qword ptr [rbp + 0x110]
14592c244: 4885d2 test rdx, rdx
14592c247: 0f8421120000 je 0x14592d46e
14592c24d: 48c1e203 shl rdx, 3
14592c251: 41b808000000 mov r8d, 8
14592c257: 4c89d9 mov rcx, r11
14592c25a: e90a120000 jmp 0x14592d469
14592c25f: b801000000 mov eax, 1
14592c264: 48898510010000 mov qword ptr [rbp + 0x110], rax
14592c26b: 41b601 mov r14b, 1
14592c26e: e9840d0000 jmp 0x14592cff7
14592c273: f2440f106408a8 movsd xmm12, qword ptr [rax + rcx - 0x58]
14592c27a: f3440f117520 movss dword ptr [rbp + 0x20], xmm14
14592c280: 458b4734 mov r8d, dword ptr [r15 + 0x34]
14592c284: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
14592c28b: 4c89a5c8000000 mov qword ptr [rbp + 0xc8], r12
14592c292: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
14592c29c: c785f000000000000000 mov dword ptr [rbp + 0xf0], 0
14592c2a6: 488d85f0000000 lea rax, [rbp + 0xf0]
14592c2ad: 4889442430 mov qword ptr [rsp + 0x30], rax
14592c2b2: 488d85c0000000 lea rax, [rbp + 0xc0]
14592c2b9: 4889442428 mov qword ptr [rsp + 0x28], rax
14592c2be: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14592c2c7: 488d4d48 lea rcx, [rbp + 0x48]
14592c2cb: 4c89ea mov rdx, r13
14592c2ce: 4c8d8da8000000 lea r9, [rbp + 0xa8]
14592c2d5: e886d7f9ff call 0x1458c9a60
14592c2da: 4c8bb638060000 mov r14, qword ptr [rsi + 0x638]
14592c2e1: 4c3bb628060000 cmp r14, qword ptr [rsi + 0x628]
14592c2e8: 750d jne 0x14592c2f7
14592c2ea: 488d8e28060000 lea rcx, [rsi + 0x628]
14592c2f1: e8dac32d00 call 0x145c086d0
14592c2f6: 90 nop
14592c2f7: 488b8630060000 mov rax, qword ptr [rsi + 0x630]
14592c2fe: 4c89f1 mov rcx, r14
14592c301: 48c1e105 shl rcx, 5
14592c305: 0f104548 movups xmm0, xmmword ptr [rbp + 0x48]
14592c309: 0f104d58 movups xmm1, xmmword ptr [rbp + 0x58]
14592c30d: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14592c312: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592c316: 49ffc6 inc r14
14592c319: 4c89b638060000 mov qword ptr [rsi + 0x638], r14
14592c320: 488b96c0090000 mov rdx, qword ptr [rsi + 0x9c0]
14592c327: 488b8ed8090000 mov rcx, qword ptr [rsi + 0x9d8]
14592c32e: 488d0411 lea rax, [rcx + rdx]
14592c332: 48c1c017 rol rax, 0x17
14592c336: 4801d0 add rax, rdx
14592c339: 4c8b86c8090000 mov r8, qword ptr [rsi + 0x9c8]
14592c340: 4d89c1 mov r9, r8
14592c343: 49c1e111 shl r9, 0x11
14592c347: 4c8b96d0090000 mov r10, qword ptr [rsi + 0x9d0]
14592c34e: 4931d2 xor r10, rdx
14592c351: 4c31c1 xor rcx, r8
14592c354: 4d31d0 xor r8, r10
14592c357: 448b9ee8040000 mov r11d, dword ptr [rsi + 0x4e8]
14592c35e: f34d0f2aeb cvtsi2ss xmm13, r11
14592c363: f3440f582d0c004800 addss xmm13, dword ptr [rip + 0x48000c]
14592c36c: f3440f592df3574800 mulss xmm13, dword ptr [rip + 0x4857f3]
14592c375: f30f1005f3be4700 movss xmm0, dword ptr [rip + 0x47bef3]
14592c37d: f3440f58e8 addss xmm13, xmm0
14592c382: f3450f596f2c mulss xmm13, dword ptr [r15 + 0x2c]
14592c388: 4c8986c8090000 mov qword ptr [rsi + 0x9c8], r8
14592c38f: 4831ca xor rdx, rcx
14592c392: 488996c0090000 mov qword ptr [rsi + 0x9c0], rdx
14592c399: 4d31ca xor r10, r9
14592c39c: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
14592c3a3: 48c1c12d rol rcx, 0x2d
14592c3a7: 48898ed8090000 mov qword ptr [rsi + 0x9d8], rcx
14592c3ae: 48c1e828 shr rax, 0x28
14592c3b2: f3440f2af0 cvtsi2ss xmm14, eax
14592c3b7: f3440f593590165900 mulss xmm14, dword ptr [rip + 0x591690]
14592c3c0: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592c3c7: 4885d2 test rdx, rdx
14592c3ca: 0f84660a0000 je 0x14592ce36
14592c3d0: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592c3d7: 4883fa01 cmp rdx, 1
14592c3db: 0f85fc090000 jne 0x14592cddd
14592c3e1: 31c9 xor ecx, ecx
14592c3e3: f30f100505c14700 movss xmm0, dword ptr [rip + 0x47c105]
14592c3eb: e9320a0000 jmp 0x14592ce22
14592c3f0: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14592c3f7: 4885d2 test rdx, rdx
14592c3fa: 0f846e100000 je 0x14592d46e
14592c400: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
14592c407: 48c1e204 shl rdx, 4
14592c40b: 41b808000000 mov r8d, 8
14592c411: e953100000 jmp 0x14592d469
14592c416: 4989c1 mov r9, rax
14592c419: 49b8fcffffffffffff01 movabs r8, 0x1fffffffffffffc
14592c423: 4d21c1 and r9, r8
14592c426: 4c8d9130010000 lea r10, [rcx + 0x130]
14592c42d: 4531c0 xor r8d, r8d
14592c430: f3440f1025b7c04700 movss xmm12, dword ptr [rip + 0x47c0b7]
14592c439: 0f1f8000000000 nop dword ptr [rax]
14592c440: f3450f58a2e0feffff addss xmm12, dword ptr [r10 - 0x120]
14592c449: f3450f58a240ffffff addss xmm12, dword ptr [r10 - 0xc0]
14592c452: f3450f5862a0 addss xmm12, dword ptr [r10 - 0x60]
14592c458: f3450f5822 addss xmm12, dword ptr [r10]
14592c45d: 4983c004 add r8, 4
14592c461: 4981c280010000 add r10, 0x180
14592c468: 4d39c1 cmp r9, r8
14592c46b: 75d3 jne 0x14592c440
14592c46d: 4885d2 test rdx, rdx
14592c470: 742d je 0x14592c49f
14592c472: 4f8d0440 lea r8, [r8 + r8*2]
14592c476: 49c1e005 shl r8, 5
14592c47a: 4c01c1 add rcx, r8
14592c47d: 4883c110 add rcx, 0x10
14592c481: c1e205 shl edx, 5
14592c484: 488d1452 lea rdx, [rdx + rdx*2]
14592c488: 4531c0 xor r8d, r8d
14592c48b: 0f1f440000 nop dword ptr [rax + rax]
14592c490: f3460f582401 addss xmm12, dword ptr [rcx + r8]
14592c496: 4983c060 add r8, 0x60
14592c49a: 4c39c2 cmp rdx, r8
14592c49d: 75f1 jne 0x14592c490
14592c49f: f3480f2ac0 cvtsi2ss xmm0, rax
14592c4a4: f3440f5ee0 divss xmm12, xmm0
14592c4a9: f3440f5f25bebd4700 maxss xmm12, dword ptr [rip + 0x47bdbe]
14592c4b2: 4c8d7d48 lea r15, [rbp + 0x48]
14592c4b6: 4c89f9 mov rcx, r15
14592c4b9: 488d96c8010000 lea rdx, [rsi + 0x1c8]
14592c4c0: e8db64f6ff call 0x1458929a0
14592c4c5: 90 nop
14592c4c6: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592c4cd: 4c89fa mov rdx, r15
14592c4d0: 4d89f0 mov r8, r14
14592c4d3: e8f866f6ff call 0x145892bd0
14592c4d8: 90 nop
14592c4d9: f3440f10adc0000000 movss xmm13, dword ptr [rbp + 0xc0]
14592c4e2: f3440f10bdd4000000 movss xmm15, dword ptr [rbp + 0xd4]
14592c4eb: 4c89f9 mov rcx, r15
14592c4ee: e81d4ff6ff call 0x145891410
14592c4f3: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592c4fa: 4839d3 cmp rbx, rdx
14592c4fd: 0f83881b0000 jae 0x14592e08b
14592c503: 410fb64675 movzx eax, byte ptr [r14 + 0x75]
14592c508: 04fe add al, 0xfe
14592c50a: f30f10055ebd4700 movss xmm0, dword ptr [rip + 0x47bd5e]
14592c512: 3c06 cmp al, 6
14592c514: 770f ja 0x14592c525
14592c516: 0fb6c0 movzx eax, al
14592c519: 488d0ddcab2d01 lea rcx, [rip + 0x12dabdc]
14592c520: f30f100481 movss xmm0, dword ptr [rcx + rax*4]
14592c525: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592c52c: 488b4c3818 mov rcx, qword ptr [rax + rdi + 0x18]
14592c531: 4801f8 add rax, rdi
14592c534: f3410f105644 movss xmm2, dword ptr [r14 + 0x44]
14592c53a: 0f28ca movaps xmm1, xmm2
14592c53d: f30f590d6ffe4700 mulss xmm1, dword ptr [rip + 0x47fe6f]
14592c545: 4c8b8678050000 mov r8, qword ptr [rsi + 0x578]
14592c54c: 4d85c0 test r8, r8
14592c54f: f3440f117520 movss dword ptr [rbp + 0x20], xmm14
14592c555: 0f8494000000 je 0x14592c5ef
14592c55b: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
14592c562: 4d69c0d8010000 imul r8, r8, 0x1d8
14592c569: 4531c9 xor r9d, r9d
14592c56c: eb0e jmp 0x14592c57c
14592c56e: 6690 nop
14592c570: 4981c1d8010000 add r9, 0x1d8
14592c577: 4d39c8 cmp r8, r9
14592c57a: 7473 je 0x14592c5ef
14592c57c: 4e39a40af0000000 cmp qword ptr [rdx + r9 + 0xf0], r12
14592c584: 75ea jne 0x14592c570
14592c586: 4280bc0ab000000000 cmp byte ptr [rdx + r9 + 0xb0], 0
14592c58f: 75df jne 0x14592c570
14592c591: 4a837c0a18ff cmp qword ptr [rdx + r9 + 0x18], -1
14592c597: 750b jne 0x14592c5a4
14592c599: 4280bc0ad001000000 cmp byte ptr [rdx + r9 + 0x1d0], 0
14592c5a2: 74cc je 0x14592c570
14592c5a4: 4c8b4830 mov r9, qword ptr [rax + 0x30]
14592c5a8: 8b5038 mov edx, dword ptr [rax + 0x38]
14592c5ab: 450f57f6 xorps xmm14, xmm14
14592c5af: 4d39e1 cmp r9, r12
14592c5b2: 751f jne 0x14592c5d3
14592c5b4: 83fa05 cmp edx, 5
14592c5b7: 41b805000000 mov r8d, 5
14592c5bd: 440f42c2 cmovb r8d, edx
14592c5c1: 450f57f6 xorps xmm14, xmm14
14592c5c5: f3450f2af0 cvtsi2ss xmm14, r8d
14592c5ca: f3440f59358d554800 mulss xmm14, dword ptr [rip + 0x48558d]
14592c5d3: 4c8d4030 lea r8, [rax + 0x30]
14592c5d7: 4883c038 add rax, 0x38
14592c5db: ffc2 inc edx
14592c5dd: 4d39e1 cmp r9, r12
14592c5e0: 41b901000000 mov r9d, 1
14592c5e6: 410f45d1 cmovne edx, r9d
14592c5ea: 4d89e1 mov r9, r12
14592c5ed: eb11 jmp 0x14592c600
14592c5ef: 4c8d4030 lea r8, [rax + 0x30]
14592c5f3: 4883c038 add rax, 0x38
14592c5f7: 450f57f6 xorps xmm14, xmm14
14592c5fb: 31d2 xor edx, edx
14592c5fd: 4531c9 xor r9d, r9d
14592c600: f3440f59be88040000 mulss xmm15, dword ptr [rsi + 0x488]
14592c609: 0f57db xorps xmm3, xmm3
14592c60c: f30fc2da01 cmpltss xmm3, xmm2
14592c611: 410f54df andps xmm3, xmm15
14592c615: f3440f59e1 mulss xmm12, xmm1
14592c61a: f3450f59ec mulss xmm13, xmm12
14592c61f: f3440f59e8 mulss xmm13, xmm0
14592c624: f3440f58eb addss xmm13, xmm3
14592c629: f3440f59ae8c040000 mulss xmm13, dword ptr [rsi + 0x48c]
14592c632: f3440f59692c mulss xmm13, dword ptr [rcx + 0x2c]
14592c638: 440f2ef7 ucomiss xmm14, xmm7
14592c63c: 41be00000000 mov r14d, 0
14592c642: 488d0d4fa32d01 lea rcx, [rip + 0x12da34f]
14592c649: 4c0f47f1 cmova r14, rcx
14592c64d: 4d8908 mov qword ptr [r8], r9
14592c650: 8910 mov dword ptr [rax], edx
14592c652: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592c659: 4839d3 cmp rbx, rdx
14592c65c: 0f833a1a0000 jae 0x14592e09c
14592c662: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592c669: f30f1044385c movss xmm0, dword ptr [rax + rdi + 0x5c]
14592c66f: 4801f8 add rax, rdi
14592c672: 0f2ef8 ucomiss xmm7, xmm0
14592c675: 735c jae 0x14592c6d3
14592c677: f30f108e540a0000 movss xmm1, dword ptr [rsi + 0xa54]
14592c67f: f30f5c4858 subss xmm1, dword ptr [rax + 0x58]
14592c684: f30f5ec8 divss xmm1, xmm0
14592c688: 0f57c0 xorps xmm0, xmm0
14592c68b: f30f5fc1 maxss xmm0, xmm1
14592c68f: f30f100dd9bb4700 movss xmm1, dword ptr [rip + 0x47bbd9]
14592c697: f30f5dc8 minss xmm1, xmm0
14592c69b: f30f104048 movss xmm0, dword ptr [rax + 0x48]
14592c6a0: f30f105054 movss xmm2, dword ptr [rax + 0x54]
14592c6a5: f30f5cd0 subss xmm2, xmm0
14592c6a9: f30f59d1 mulss xmm2, xmm1
14592c6ad: f30f58d0 addss xmm2, xmm0
14592c6b1: f20f104040 movsd xmm0, qword ptr [rax + 0x40]
14592c6b6: f20f10584c movsd xmm3, qword ptr [rax + 0x4c]
14592c6bb: 0f5cd8 subps xmm3, xmm0
14592c6be: f30f12c9 movsldup xmm1, xmm1
14592c6c2: 0f59cb mulps xmm1, xmm3
14592c6c5: 0f58c8 addps xmm1, xmm0
14592c6c8: 0f134df0 movlps qword ptr [rbp - 0x10], xmm1
14592c6cc: f30f1155f8 movss dword ptr [rbp - 8], xmm2
14592c6d1: eb0e jmp 0x14592c6e1
14592c6d3: 8b4854 mov ecx, dword ptr [rax + 0x54]
14592c6d6: 894df8 mov dword ptr [rbp - 8], ecx
14592c6d9: 488b404c mov rax, qword ptr [rax + 0x4c]
14592c6dd: 488945f0 mov qword ptr [rbp - 0x10], rax
14592c6e1: f30f107534 movss xmm6, dword ptr [rbp + 0x34]
14592c6e6: e8155b6dfa call 0x140002200
14592c6eb: b940000000 mov ecx, 0x40
14592c6f0: ba08000000 mov edx, 8
14592c6f5: e8c65a6dfa call 0x1400021c0
14592c6fa: 4885c0 test rax, rax
14592c6fd: 0f8472180000 je 0x14592df75
14592c703: f3450f59d5 mulss xmm10, xmm13
14592c708: 450f28e6 movaps xmm12, xmm14
14592c70c: f3440f58255bbb4700 addss xmm12, dword ptr [rip + 0x47bb5b]
14592c715: f3450f59e2 mulss xmm12, xmm10
14592c71a: 4c8920 mov qword ptr [rax], r12
14592c71d: f3440f116008 movss dword ptr [rax + 8], xmm12
14592c723: 488d0d7aa22d01 lea rcx, [rip + 0x12da27a]
14592c72a: 48894810 mov qword ptr [rax + 0x10], rcx
14592c72e: 48c740180b000000 mov qword ptr [rax + 0x18], 0xb
14592c736: 4c897020 mov qword ptr [rax + 0x20], r14
14592c73a: 48c740280c000000 mov qword ptr [rax + 0x28], 0xc
14592c742: f3440f117030 movss dword ptr [rax + 0x30], xmm14
14592c748: 66c740380101 mov word ptr [rax + 0x38], 0x101
14592c74e: 48c785f000000001000000 mov qword ptr [rbp + 0xf0], 1
14592c759: 488985f8000000 mov qword ptr [rbp + 0xf8], rax
14592c760: 48c7850001000001000000 mov qword ptr [rbp + 0x100], 1
14592c76b: 488d4d48 lea rcx, [rbp + 0x48]
14592c76f: 4889f2 mov rdx, rsi
14592c772: 4c8d45f0 lea r8, [rbp - 0x10]
14592c776: f30f101d06bd4700 movss xmm3, dword ptr [rip + 0x47bd06]
14592c77e: e81d9affff call 0x1459261a0
14592c783: 90 nop
14592c784: f3440f107520 movss xmm14, dword ptr [rbp + 0x20]
14592c78a: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592c78e: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592c792: 488b4558 mov rax, qword ptr [rbp + 0x58]
14592c796: 48c1e003 shl rax, 3
14592c79a: 4531c0 xor r8d, r8d
14592c79d: 0f1f00 nop dword ptr [rax]
14592c7a0: 4c39c0 cmp rax, r8
14592c7a3: 0f848e000000 je 0x14592c837
14592c7a9: 4e8b3401 mov r14, qword ptr [rcx + r8]
14592c7ad: 4983c008 add r8, 8
14592c7b1: 4d39e6 cmp r14, r12
14592c7b4: 74ea je 0x14592c7a0
14592c7b6: 48898d10010000 mov qword ptr [rbp + 0x110], rcx
14592c7bd: 48899518010000 mov qword ptr [rbp + 0x118], rdx
14592c7c4: 4c8bbd00010000 mov r15, qword ptr [rbp + 0x100]
14592c7cb: 4c3bbdf0000000 cmp r15, qword ptr [rbp + 0xf0]
14592c7d2: 750d jne 0x14592c7e1
14592c7d4: 488d8df0000000 lea rcx, [rbp + 0xf0]
14592c7db: e8a04b2e00 call 0x145c11380
14592c7e0: 90 nop
14592c7e1: 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
14592c7e8: 4c89f9 mov rcx, r15
14592c7eb: 48c1e106 shl rcx, 6
14592c7ef: 4c893408 mov qword ptr [rax + rcx], r14
14592c7f3: f3440f11540808 movss dword ptr [rax + rcx + 8], xmm10
14592c7fa: 488d15a3a12d01 lea rdx, [rip + 0x12da1a3]
14592c801: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
14592c806: 48c74408180b000000 mov qword ptr [rax + rcx + 0x18], 0xb
14592c80f: 48c744082000000000 mov qword ptr [rax + rcx + 0x20], 0
14592c818: 66c74408380101 mov word ptr [rax + rcx + 0x38], 0x101
14592c81f: 49ffc7 inc r15
14592c822: 4c89bd00010000 mov qword ptr [rbp + 0x100], r15
14592c829: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
14592c830: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14592c837: 4885d2 test rdx, rdx
14592c83a: 7410 je 0x14592c84c
14592c83c: 48c1e203 shl rdx, 3
14592c840: 41b808000000 mov r8d, 8
14592c846: e885596dfa call 0x1400021d0
14592c84b: 90 nop
14592c84c: 488d4d48 lea rcx, [rbp + 0x48]
14592c850: 488d96c8010000 lea rdx, [rsi + 0x1c8]
14592c857: e84461f6ff call 0x1458929a0
14592c85c: 90 nop
14592c85d: 488b8d80000000 mov rcx, qword ptr [rbp + 0x80]
14592c864: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
14592c86b: 4885c0 test rax, rax
14592c86e: 448b751c mov r14d, dword ptr [rbp + 0x1c]
14592c872: 747b je 0x14592c8ef
14592c874: 48c1e006 shl rax, 6
14592c878: 4801c8 add rax, rcx
14592c87b: 4889ca mov rdx, rcx
14592c87e: f3440f10550c movss xmm10, dword ptr [rbp + 0xc]
14592c884: eb13 jmp 0x14592c899
14592c886: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592c890: 4883c240 add rdx, 0x40
14592c894: 4839c2 cmp rdx, rax
14592c897: 744a je 0x14592c8e3
14592c899: 803a06 cmp byte ptr [rdx], 6
14592c89c: 75f2 jne 0x14592c890
14592c89e: 837a1000 cmp dword ptr [rdx + 0x10], 0
14592c8a2: 75ec jne 0x14592c890
14592c8a4: 807a1801 cmp byte ptr [rdx + 0x18], 1
14592c8a8: 75e6 jne 0x14592c890
14592c8aa: 48837a280b cmp qword ptr [rdx + 0x28], 0xb
14592c8af: 75df jne 0x14592c890
14592c8b1: 4c8b4220 mov r8, qword ptr [rdx + 0x20]
14592c8b5: 4d8b08 mov r9, qword ptr [r8]
14592c8b8: 4c330d5dba9101 xor r9, qword ptr [rip + 0x191ba5d]
14592c8bf: 4d8b4003 mov r8, qword ptr [r8 + 3]
14592c8c3: 4c330555ba9101 xor r8, qword ptr [rip + 0x191ba55]
14592c8ca: 4d09c8 or r8, r9
14592c8cd: 75c1 jne 0x14592c890
14592c8cf: f3440f105208 movss xmm10, dword ptr [rdx + 8]
14592c8d5: 448b7204 mov r14d, dword ptr [rdx + 4]
14592c8d9: b001 mov al, 1
14592c8db: 898518010000 mov dword ptr [rbp + 0x118], eax
14592c8e1: eb1c jmp 0x14592c8ff
14592c8e3: c7851801000000000000 mov dword ptr [rbp + 0x118], 0
14592c8ed: eb10 jmp 0x14592c8ff
14592c8ef: c7851801000000000000 mov dword ptr [rbp + 0x118], 0
14592c8f9: f3440f10550c movss xmm10, dword ptr [rbp + 0xc]
14592c8ff: 488b5578 mov rdx, qword ptr [rbp + 0x78]
14592c903: 4885d2 test rdx, rdx
14592c906: 740f je 0x14592c917
14592c908: 48c1e206 shl rdx, 6
14592c90c: 41b808000000 mov r8d, 8
14592c912: e8b9586dfa call 0x1400021d0
14592c917: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14592c91b: 4885d2 test rdx, rdx
14592c91e: 7413 je 0x14592c933
14592c920: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592c924: 48c1e203 shl rdx, 3
14592c928: 41b804000000 mov r8d, 4
14592c92e: e89d586dfa call 0x1400021d0
14592c933: 4489751c mov dword ptr [rbp + 0x1c], r14d
14592c937: 488b5560 mov rdx, qword ptr [rbp + 0x60]
14592c93b: 4885d2 test rdx, rdx
14592c93e: 7413 je 0x14592c953
14592c940: 488b4d68 mov rcx, qword ptr [rbp + 0x68]
14592c944: 48c1e205 shl rdx, 5
14592c948: 41b808000000 mov r8d, 8
14592c94e: e87d586dfa call 0x1400021d0
14592c953: 4c8bb598000000 mov r14, qword ptr [rbp + 0x98]
14592c95a: 4c8bada0000000 mov r13, qword ptr [rbp + 0xa0]
14592c961: 4d85ed test r13, r13
14592c964: 7432 je 0x14592c998
14592c966: 4d8d7e08 lea r15, [r14 + 8]
14592c96a: eb0d jmp 0x14592c979
14592c96c: 0f1f4000 nop dword ptr [rax]
14592c970: 4983c728 add r15, 0x28
14592c974: 49ffcd dec r13
14592c977: 741f je 0x14592c998
14592c979: 498b57f8 mov rdx, qword ptr [r15 - 8]
14592c97d: 4883faff cmp rdx, -1
14592c981: 74ed je 0x14592c970
14592c983: 4885d2 test rdx, rdx
14592c986: 74e8 je 0x14592c970
14592c988: 498b0f mov rcx, qword ptr [r15]
14592c98b: 41b801000000 mov r8d, 1
14592c991: e83a586dfa call 0x1400021d0
14592c996: ebd8 jmp 0x14592c970
14592c998: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
14592c99f: 4885c0 test rax, rax
14592c9a2: 7416 je 0x14592c9ba
14592c9a4: 48c1e003 shl rax, 3
14592c9a8: 488d1480 lea rdx, [rax + rax*4]
14592c9ac: 41b808000000 mov r8d, 8
14592c9b2: 4c89f1 mov rcx, r14
14592c9b5: e816586dfa call 0x1400021d0
14592c9ba: f30f1086540a0000 movss xmm0, dword ptr [rsi + 0xa54]
14592c9c2: 488b8670050000 mov rax, qword ptr [rsi + 0x570]
14592c9c9: 48699678050000d8010000 imul rdx, qword ptr [rsi + 0x578], 0x1d8
14592c9d4: 31c9 xor ecx, ecx
14592c9d6: 4989c0 mov r8, rax
14592c9d9: 4c8d7b01 lea r15, [rbx + 1]
14592c9dd: 0f1f00 nop dword ptr [rax]
14592c9e0: 4839ca cmp rdx, rcx
14592c9e3: 0f8400020000 je 0x14592cbe9
14592c9e9: 4881c1d8010000 add rcx, 0x1d8
14592c9f0: 4d39a0f0000000 cmp qword ptr [r8 + 0xf0], r12
14592c9f7: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
14592c9fe: 75e0 jne 0x14592c9e0
14592ca00: f30f104c08b8 movss xmm1, dword ptr [rax + rcx - 0x48]
14592ca06: 0f2ef9 ucomiss xmm7, xmm1
14592ca09: 7350 jae 0x14592ca5b
14592ca0b: f30f5c4408b4 subss xmm0, dword ptr [rax + rcx - 0x4c]
14592ca11: f30f5ec1 divss xmm0, xmm1
14592ca15: 0f57c9 xorps xmm1, xmm1
14592ca18: f30f5fc8 maxss xmm1, xmm0
14592ca1c: f30f10154cb84700 movss xmm2, dword ptr [rip + 0x47b84c]
14592ca24: f30f5dd1 minss xmm2, xmm1
14592ca28: f20f104c089c movsd xmm1, qword ptr [rax + rcx - 0x64]
14592ca2e: f20f105c08a8 movsd xmm3, qword ptr [rax + rcx - 0x58]
14592ca34: 0f5cd9 subps xmm3, xmm1
14592ca37: f30f12c2 movsldup xmm0, xmm2
14592ca3b: 0f59c3 mulps xmm0, xmm3
14592ca3e: 0f58c1 addps xmm0, xmm1
14592ca41: f30f105c08a4 movss xmm3, dword ptr [rax + rcx - 0x5c]
14592ca47: f30f104c08b0 movss xmm1, dword ptr [rax + rcx - 0x50]
14592ca4d: f30f5ccb subss xmm1, xmm3
14592ca51: f30f59ca mulss xmm1, xmm2
14592ca55: f30f58cb addss xmm1, xmm3
14592ca59: eb0c jmp 0x14592ca67
14592ca5b: f20f104408a8 movsd xmm0, qword ptr [rax + rcx - 0x58]
14592ca61: f30f104c08b0 movss xmm1, dword ptr [rax + rcx - 0x50]
14592ca67: 8b8518010000 mov eax, dword ptr [rbp + 0x118]
14592ca6d: 84c0 test al, al
14592ca6f: 0f8474010000 je 0x14592cbe9
14592ca75: 0f1385a8000000 movlps qword ptr [rbp + 0xa8], xmm0
14592ca7c: f30f118db0000000 movss dword ptr [rbp + 0xb0], xmm1
14592ca84: 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
14592ca8b: 4c8b8500010000 mov r8, qword ptr [rbp + 0x100]
14592ca92: 49c1e006 shl r8, 6
14592ca96: 4901d0 add r8, rdx
14592ca99: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592caa0: e87b780b00 call 0x1459e4320
14592caa5: 90 nop
14592caa6: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14592caad: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14592cab4: 4889442428 mov qword ptr [rsp + 0x28], rax
14592cab9: 48894dd8 mov qword ptr [rbp - 0x28], rcx
14592cabd: 48894c2420 mov qword ptr [rsp + 0x20], rcx
14592cac2: 488d4d48 lea rcx, [rbp + 0x48]
14592cac6: 4889f2 mov rdx, rsi
14592cac9: 4c8d85a8000000 lea r8, [rbp + 0xa8]
14592cad0: f30f101dd8f94700 movss xmm3, dword ptr [rip + 0x47f9d8]
14592cad8: e8f394ffff call 0x145925fd0
14592cadd: 90 nop
14592cade: 488b4548 mov rax, qword ptr [rbp + 0x48]
14592cae2: 48894540 mov qword ptr [rbp + 0x40], rax
14592cae6: 488b4550 mov rax, qword ptr [rbp + 0x50]
14592caea: 48898518010000 mov qword ptr [rbp + 0x118], rax
14592caf1: 837d1c00 cmp dword ptr [rbp + 0x1c], 0
14592caf5: 0f84ac000000 je 0x14592cba7
14592cafb: 488b4558 mov rax, qword ptr [rbp + 0x58]
14592caff: 8b4d1c mov ecx, dword ptr [rbp + 0x1c]
14592cb02: f3450f59e2 mulss xmm12, xmm10
14592cb07: 48c1e003 shl rax, 3
14592cb0b: 48898510010000 mov qword ptr [rbp + 0x110], rax
14592cb12: 48c1e103 shl rcx, 3
14592cb16: 48894d28 mov qword ptr [rbp + 0x28], rcx
14592cb1a: 4531ed xor r13d, r13d
14592cb1d: eb52 jmp 0x14592cb71
14592cb1f: 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
14592cb26: 4c89f9 mov rcx, r15
14592cb29: 48c1e106 shl rcx, 6
14592cb2d: 4c893408 mov qword ptr [rax + rcx], r14
14592cb31: f3440f11640808 movss dword ptr [rax + rcx + 8], xmm12
14592cb38: 488d15899e2d01 lea rdx, [rip + 0x12d9e89]
14592cb3f: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
14592cb44: 48c74408180d000000 mov qword ptr [rax + rcx + 0x18], 0xd
14592cb4d: 48c744082000000000 mov qword ptr [rax + rcx + 0x20], 0
14592cb56: 66c74408380001 mov word ptr [rax + rcx + 0x38], 0x100
14592cb5d: 49ffc7 inc r15
14592cb60: 4c89bd00010000 mov qword ptr [rbp + 0x100], r15
14592cb67: 4983c508 add r13, 8
14592cb6b: 4c396d28 cmp qword ptr [rbp + 0x28], r13
14592cb6f: 7436 je 0x14592cba7
14592cb71: 4c39ad10010000 cmp qword ptr [rbp + 0x110], r13
14592cb78: 742d je 0x14592cba7
14592cb7a: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14592cb81: 4e8b3428 mov r14, qword ptr [rax + r13]
14592cb85: 4c8bbd00010000 mov r15, qword ptr [rbp + 0x100]
14592cb8c: 4c3bbdf0000000 cmp r15, qword ptr [rbp + 0xf0]
14592cb93: 758a jne 0x14592cb1f
14592cb95: 488d8df0000000 lea rcx, [rbp + 0xf0]
14592cb9c: e8df472e00 call 0x145c11380
14592cba1: 90 nop
14592cba2: e978ffffff jmp 0x14592cb1f
14592cba7: 488b5540 mov rdx, qword ptr [rbp + 0x40]
14592cbab: 4885d2 test rdx, rdx
14592cbae: 7416 je 0x14592cbc6
14592cbb0: 48c1e203 shl rdx, 3
14592cbb4: 41b808000000 mov r8d, 8
14592cbba: 488b8d18010000 mov rcx, qword ptr [rbp + 0x118]
14592cbc1: e80a566dfa call 0x1400021d0
14592cbc6: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14592cbcd: 4885d2 test rdx, rdx
14592cbd0: 4c8d7b01 lea r15, [rbx + 1]
14592cbd4: 7413 je 0x14592cbe9
14592cbd6: 48c1e203 shl rdx, 3
14592cbda: 41b808000000 mov r8d, 8
14592cbe0: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
14592cbe4: e8e7556dfa call 0x1400021d0
14592cbe9: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
14592cbf0: 48898518010000 mov qword ptr [rbp + 0x118], rax
14592cbf7: 4c8b8df8000000 mov r9, qword ptr [rbp + 0xf8]
14592cbfe: 4c8bb500010000 mov r14, qword ptr [rbp + 0x100]
14592cc05: c6850d01000001 mov byte ptr [rbp + 0x10d], 1
14592cc0c: 4c89742420 mov qword ptr [rsp + 0x20], r14
14592cc11: 4889f1 mov rcx, rsi
14592cc14: 4889da mov rdx, rbx
14592cc17: 4d89e0 mov r8, r12
14592cc1a: 4c898d10010000 mov qword ptr [rbp + 0x110], r9
14592cc21: e87a8b0200 call 0x1459557a0
14592cc26: 90 nop
14592cc27: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592cc2e: 4885d2 test rdx, rdx
14592cc31: f3440f11550c movss dword ptr [rbp + 0xc], xmm10
14592cc37: 0f847a010000 je 0x14592cdb7
14592cc3d: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592cc44: 4883fa01 cmp rdx, 1
14592cc48: 750c jne 0x14592cc56
14592cc4a: 31c9 xor ecx, ecx
14592cc4c: f30f10059cb84700 movss xmm0, dword ptr [rip + 0x47b89c]
14592cc54: eb4c jmp 0x14592cca2
14592cc56: 4989d0 mov r8, rdx
14592cc59: 4983e0fe and r8, 0xfffffffffffffffe
14592cc5d: 31c9 xor ecx, ecx
14592cc5f: f30f100589b84700 movss xmm0, dword ptr [rip + 0x47b889]
14592cc67: eb10 jmp 0x14592cc79
14592cc69: 0f1f8000000000 nop dword ptr [rax]
14592cc70: 4883c102 add rcx, 2
14592cc74: 4939c8 cmp r8, rcx
14592cc77: 7424 je 0x14592cc9d
14592cc79: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592cc7d: 7409 je 0x14592cc88
14592cc7f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592cc84: 75ea jne 0x14592cc70
14592cc86: eb0d jmp 0x14592cc95
14592cc88: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592cc8e: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592cc93: 75db jne 0x14592cc70
14592cc95: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592cc9b: ebd3 jmp 0x14592cc70
14592cc9d: f6c201 test dl, 1
14592cca0: 740c je 0x14592ccae
14592cca2: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592cca6: 7506 jne 0x14592ccae
14592cca8: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592ccae: 0f2ec7 ucomiss xmm0, xmm7
14592ccb1: 0f8600010000 jbe 0x14592cdb7
14592ccb7: 488b86d8090000 mov rax, qword ptr [rsi + 0x9d8]
14592ccbe: 488b8ec0090000 mov rcx, qword ptr [rsi + 0x9c0]
14592ccc5: 488b96c8090000 mov rdx, qword ptr [rsi + 0x9c8]
14592cccc: 4c8d0408 lea r8, [rax + rcx]
14592ccd0: 49c1c017 rol r8, 0x17
14592ccd4: 4901c8 add r8, rcx
14592ccd7: 4989d1 mov r9, rdx
14592ccda: 49c1e111 shl r9, 0x11
14592ccde: 4c8b96d0090000 mov r10, qword ptr [rsi + 0x9d0]
14592cce5: 4931ca xor r10, rcx
14592cce8: 4831d0 xor rax, rdx
14592cceb: 4c31d2 xor rdx, r10
14592ccee: 488996c8090000 mov qword ptr [rsi + 0x9c8], rdx
14592ccf5: 4831c1 xor rcx, rax
14592ccf8: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14592ccff: 4d31ca xor r10, r9
14592cd02: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
14592cd09: 48c1c02d rol rax, 0x2d
14592cd0d: 49c1e828 shr r8, 0x28
14592cd11: 0f57c9 xorps xmm1, xmm1
14592cd14: f3410f2ac8 cvtsi2ss xmm1, r8d
14592cd19: 488986d8090000 mov qword ptr [rsi + 0x9d8], rax
14592cd20: f30f590d280d5900 mulss xmm1, dword ptr [rip + 0x590d28]
14592cd28: 0f2ec1 ucomiss xmm0, xmm1
14592cd2b: 0f8686000000 jbe 0x14592cdb7
14592cd31: 49c1e606 shl r14, 6
14592cd35: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
14592cd3c: 4901c6 add r14, rax
14592cd3f: 48894548 mov qword ptr [rbp + 0x48], rax
14592cd43: 48894550 mov qword ptr [rbp + 0x50], rax
14592cd47: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14592cd4e: 48894558 mov qword ptr [rbp + 0x58], rax
14592cd52: 4c897560 mov qword ptr [rbp + 0x60], r14
14592cd56: c6850d01000000 mov byte ptr [rbp + 0x10d], 0
14592cd5d: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592cd64: 488d5548 lea rdx, [rbp + 0x48]
14592cd68: e813910b00 call 0x1459e5e80
14592cd6d: 90 nop
14592cd6e: 4c8b8dc8000000 mov r9, qword ptr [rbp + 0xc8]
14592cd75: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14592cd7c: 4889442420 mov qword ptr [rsp + 0x20], rax
14592cd81: 4889f1 mov rcx, rsi
14592cd84: 4889da mov rdx, rbx
14592cd87: 4d89e0 mov r8, r12
14592cd8a: 4c894d28 mov qword ptr [rbp + 0x28], r9
14592cd8e: e80d8a0200 call 0x1459557a0
14592cd93: 90 nop
14592cd94: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14592cd9b: 4885d2 test rdx, rdx
14592cd9e: 0f84ca060000 je 0x14592d46e
14592cda4: 48c1e206 shl rdx, 6
14592cda8: 41b808000000 mov r8d, 8
14592cdae: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
14592cdb2: e9b2060000 jmp 0x14592d469
14592cdb7: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
14592cdbe: 4885d2 test rdx, rdx
14592cdc1: 0f84a7060000 je 0x14592d46e
14592cdc7: 48c1e206 shl rdx, 6
14592cdcb: 41b808000000 mov r8d, 8
14592cdd1: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14592cdd8: e98c060000 jmp 0x14592d469
14592cddd: 4989d0 mov r8, rdx
14592cde0: 4983e0fe and r8, 0xfffffffffffffffe
14592cde4: 31c9 xor ecx, ecx
14592cde6: f30f100502b74700 movss xmm0, dword ptr [rip + 0x47b702]
14592cdee: eb09 jmp 0x14592cdf9
14592cdf0: 4883c102 add rcx, 2
14592cdf4: 4939c8 cmp r8, rcx
14592cdf7: 7424 je 0x14592ce1d
14592cdf9: 803cc811 cmp byte ptr [rax + rcx*8], 0x11
14592cdfd: 7409 je 0x14592ce08
14592cdff: 807cc80811 cmp byte ptr [rax + rcx*8 + 8], 0x11
14592ce04: 75ea jne 0x14592cdf0
14592ce06: eb0d jmp 0x14592ce15
14592ce08: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592ce0e: 807cc80811 cmp byte ptr [rax + rcx*8 + 8], 0x11
14592ce13: 75db jne 0x14592cdf0
14592ce15: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592ce1b: ebd3 jmp 0x14592cdf0
14592ce1d: f6c201 test dl, 1
14592ce20: 740c je 0x14592ce2e
14592ce22: 803cc811 cmp byte ptr [rax + rcx*8], 0x11
14592ce26: 7506 jne 0x14592ce2e
14592ce28: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592ce2e: f30f58053ab44700 addss xmm0, dword ptr [rip + 0x47b43a]
14592ce36: 410f28cc movaps xmm1, xmm12
14592ce3a: f3440f10be94040000 movss xmm15, dword ptr [rsi + 0x494]
14592ce43: f3440f59ae8c040000 mulss xmm13, dword ptr [rsi + 0x48c]
14592ce4c: f3440f59e8 mulss xmm13, xmm0
14592ce51: f3440f10a698040000 movss xmm12, dword ptr [rsi + 0x498]
14592ce5a: f3450f59e5 mulss xmm12, xmm13
14592ce5f: 458b4734 mov r8d, dword ptr [r15 + 0x34]
14592ce63: 4181f8fb130000 cmp r8d, 0x13fb
14592ce6a: 7e4e jle 0x14592ceba
14592ce6c: 4181f8641c0000 cmp r8d, 0x1c64
14592ce73: 0f8f85040000 jg 0x14592d2fe
14592ce79: 4181f8841a0000 cmp r8d, 0x1a84
14592ce80: 0f8f87090000 jg 0x14592d80d
14592ce86: 4181f8fc130000 cmp r8d, 0x13fc
14592ce8d: 0f84e60c0000 je 0x14592db79
14592ce93: 4181f838140000 cmp r8d, 0x1438
14592ce9a: 0f841a0a0000 je 0x14592d8ba
14592cea0: f30f1005c8b34700 movss xmm0, dword ptr [rip + 0x47b3c8]
14592cea8: 4181f8d1180000 cmp r8d, 0x18d1
14592ceaf: 0f8490090000 je 0x14592d845
14592ceb5: e9c70c0000 jmp 0x14592db81
14592ceba: 4181f8e5050000 cmp r8d, 0x5e5
14592cec1: 0f8e09060000 jle 0x14592d4d0
14592cec7: 4181f8fb0a0000 cmp r8d, 0xafb
14592cece: 0f8fae090000 jg 0x14592d882
14592ced4: 4181f8e6050000 cmp r8d, 0x5e6
14592cedb: 0f8457090000 je 0x14592d838
14592cee1: 4181f8ba070000 cmp r8d, 0x7ba
14592cee8: 0f848b0c0000 je 0x14592db79
14592ceee: f30f10057ab34700 movss xmm0, dword ptr [rip + 0x47b37a]
14592cef6: 4181f8530a0000 cmp r8d, 0xa53
14592cefd: 0f8435090000 je 0x14592d838
14592cf03: e9790c0000 jmp 0x14592db81
14592cf08: f3440f117520 movss dword ptr [rbp + 0x20], xmm14
14592cf0e: 498b5520 mov rdx, qword ptr [r13 + 0x20]
14592cf12: 4c8b86c0090000 mov r8, qword ptr [rsi + 0x9c0]
14592cf19: 488b8ed8090000 mov rcx, qword ptr [rsi + 0x9d8]
14592cf20: 4a8d0401 lea rax, [rcx + r8]
14592cf24: 48c1c017 rol rax, 0x17
14592cf28: 4c01c0 add rax, r8
14592cf2b: 4c8b8ec8090000 mov r9, qword ptr [rsi + 0x9c8]
14592cf32: 4d89ca mov r10, r9
14592cf35: 49c1e211 shl r10, 0x11
14592cf39: 4c8b9ed0090000 mov r11, qword ptr [rsi + 0x9d0]
14592cf40: 4d31c3 xor r11, r8
14592cf43: 4c31c9 xor rcx, r9
14592cf46: 4d31d9 xor r9, r11
14592cf49: 448bb6e8040000 mov r14d, dword ptr [rsi + 0x4e8]
14592cf50: f34d0f2aee cvtsi2ss xmm13, r14
14592cf55: f3440f582d1af44700 addss xmm13, dword ptr [rip + 0x47f41a]
14592cf5e: f3440f592d014c4800 mulss xmm13, dword ptr [rip + 0x484c01]
14592cf67: f30f100501b34700 movss xmm0, dword ptr [rip + 0x47b301]
14592cf6f: f3440f58e8 addss xmm13, xmm0
14592cf74: 4c8bb518010000 mov r14, qword ptr [rbp + 0x118]
14592cf7b: f3450f596e2c mulss xmm13, dword ptr [r14 + 0x2c]
14592cf81: 4c898ec8090000 mov qword ptr [rsi + 0x9c8], r9
14592cf88: 4931c8 xor r8, rcx
14592cf8b: 4c8986c0090000 mov qword ptr [rsi + 0x9c0], r8
14592cf92: 4d31d3 xor r11, r10
14592cf95: 4c899ed0090000 mov qword ptr [rsi + 0x9d0], r11
14592cf9c: 48c1c12d rol rcx, 0x2d
14592cfa0: 48898ed8090000 mov qword ptr [rsi + 0x9d8], rcx
14592cfa7: 48c1e828 shr rax, 0x28
14592cfab: f3440f2af0 cvtsi2ss xmm14, eax
14592cfb0: f3440f5935970a5900 mulss xmm14, dword ptr [rip + 0x590a97]
14592cfb9: 4c8b8608080000 mov r8, qword ptr [rsi + 0x808]
14592cfc0: 4d85c0 test r8, r8
14592cfc3: 0f8458090000 je 0x14592d921
14592cfc9: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592cfd0: 4983f801 cmp r8, 1
14592cfd4: 0f85ed080000 jne 0x14592d8c7
14592cfda: 31c9 xor ecx, ecx
14592cfdc: f30f10050cb54700 movss xmm0, dword ptr [rip + 0x47b50c]
14592cfe4: e924090000 jmp 0x14592d90d
14592cfe9: 4531f6 xor r14d, r14d
14592cfec: 48c7851001000000000000 mov qword ptr [rbp + 0x110], 0
14592cff7: e804526dfa call 0x140002200
14592cffc: b908000000 mov ecx, 8
14592d001: ba08000000 mov edx, 8
14592d006: e8b5516dfa call 0x1400021c0
14592d00b: 4885c0 test rax, rax
14592d00e: 0f84720f0000 je 0x14592df86
14592d014: 4c8920 mov qword ptr [rax], r12
14592d017: 48c785f000000001000000 mov qword ptr [rbp + 0xf0], 1
14592d022: 488985f8000000 mov qword ptr [rbp + 0xf8], rax
14592d029: 48c7850001000001000000 mov qword ptr [rbp + 0x100], 1
14592d034: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14592d03b: 80783905 cmp byte ptr [rax + 0x39], 5
14592d03f: 7579 jne 0x14592d0ba
14592d041: f3410f10455c movss xmm0, dword ptr [r13 + 0x5c]
14592d047: 0f2ef8 ucomiss xmm7, xmm0
14592d04a: 0f835e010000 jae 0x14592d1ae
14592d050: f30f108e540a0000 movss xmm1, dword ptr [rsi + 0xa54]
14592d058: f3410f5c4d58 subss xmm1, dword ptr [r13 + 0x58]
14592d05e: f30f5ec8 divss xmm1, xmm0
14592d062: 0f57c0 xorps xmm0, xmm0
14592d065: f30f5fc1 maxss xmm0, xmm1
14592d069: f30f100dffb14700 movss xmm1, dword ptr [rip + 0x47b1ff]
14592d071: f30f5dc8 minss xmm1, xmm0
14592d075: f3410f104548 movss xmm0, dword ptr [r13 + 0x48]
14592d07b: f3410f105554 movss xmm2, dword ptr [r13 + 0x54]
14592d081: f30f5cd0 subss xmm2, xmm0
14592d085: f30f59d1 mulss xmm2, xmm1
14592d089: f30f58d0 addss xmm2, xmm0
14592d08d: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
14592d093: f2410f105d4c movsd xmm3, qword ptr [r13 + 0x4c]
14592d099: 0f5cd8 subps xmm3, xmm0
14592d09c: f30f12c9 movsldup xmm1, xmm1
14592d0a0: 0f59cb mulps xmm1, xmm3
14592d0a3: 0f58c8 addps xmm1, xmm0
14592d0a6: 0f138dc0000000 movlps qword ptr [rbp + 0xc0], xmm1
14592d0ad: f30f1195c8000000 movss dword ptr [rbp + 0xc8], xmm2
14592d0b5: e909010000 jmp 0x14592d1c3
14592d0ba: 4584f6 test r14b, r14b
14592d0bd: 0f84c3010000 je 0x14592d286
14592d0c3: f30f1096540a0000 movss xmm2, dword ptr [rsi + 0xa54]
14592d0cb: 488b8670050000 mov rax, qword ptr [rsi + 0x570]
14592d0d2: 48c7c128feffff mov rcx, 0xfffffffffffffe28
14592d0d9: 4801c8 add rax, rcx
14592d0dc: 48698e78050000d8010000 imul rcx, qword ptr [rsi + 0x578], 0x1d8
14592d0e7: 4885c9 test rcx, rcx
14592d0ea: 0f8496010000 je 0x14592d286
14592d0f0: 488d90d8010000 lea rdx, [rax + 0x1d8]
14592d0f7: 4881c128feffff add rcx, -0x1d8
14592d0fe: 4c39a0c8020000 cmp qword ptr [rax + 0x2c8], r12
14592d105: 4889d0 mov rax, rdx
14592d108: 75dd jne 0x14592d0e7
14592d10a: 4c8db5c4000000 lea r14, [rbp + 0xc4]
14592d111: 4c89f1 mov rcx, r14
14592d114: e827ac0600 call 0x145997d40
14592d119: 418b4608 mov eax, dword ptr [r14 + 8]
14592d11d: 8985b0000000 mov dword ptr [rbp + 0xb0], eax
14592d123: 498b06 mov rax, qword ptr [r14]
14592d126: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14592d12d: 4c8965f0 mov qword ptr [rbp - 0x10], r12
14592d131: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592d138: 488d45f0 lea rax, [rbp - 0x10]
14592d13c: 4889442420 mov qword ptr [rsp + 0x20], rax
14592d141: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
14592d14a: 488d4d48 lea rcx, [rbp + 0x48]
14592d14e: 4889f2 mov rdx, rsi
14592d151: 4c8d85a8000000 lea r8, [rbp + 0xa8]
14592d158: f30f101d58f34700 movss xmm3, dword ptr [rip + 0x47f358]
14592d160: e86b8effff call 0x145925fd0
14592d165: 90 nop
14592d166: 488b4548 mov rax, qword ptr [rbp + 0x48]
14592d16a: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592d16e: 488b5558 mov rdx, qword ptr [rbp + 0x58]
14592d172: 488d14d1 lea rdx, [rcx + rdx*8]
14592d176: 48894d48 mov qword ptr [rbp + 0x48], rcx
14592d17a: 48894d50 mov qword ptr [rbp + 0x50], rcx
14592d17e: 48894558 mov qword ptr [rbp + 0x58], rax
14592d182: 48895560 mov qword ptr [rbp + 0x60], rdx
14592d186: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
14592d18d: 48894568 mov qword ptr [rbp + 0x68], rax
14592d191: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592d198: 488d8df0000000 lea rcx, [rbp + 0xf0]
14592d19f: 488d5548 lea rdx, [rbp + 0x48]
14592d1a3: e868150a00 call 0x1459ce710
14592d1a8: 90 nop
14592d1a9: e9d8000000 jmp 0x14592d286
14592d1ae: 418b4554 mov eax, dword ptr [r13 + 0x54]
14592d1b2: 8985c8000000 mov dword ptr [rbp + 0xc8], eax
14592d1b8: 498b454c mov rax, qword ptr [r13 + 0x4c]
14592d1bc: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14592d1c3: f30f100dbd1d7800 movss xmm1, dword ptr [rip + 0x781dbd]
14592d1cb: f30f1086b0040000 movss xmm0, dword ptr [rsi + 0x4b0]
14592d1d3: f30f590525c24800 mulss xmm0, dword ptr [rip + 0x48c225]
14592d1db: 0f2ec8 ucomiss xmm1, xmm0
14592d1de: 732c jae 0x14592d20c
14592d1e0: f30f5805586b2d01 addss xmm0, dword ptr [rip + 0x12d6b58]
14592d1e8: f3440f103dbff24700 movss xmm15, dword ptr [rip + 0x47f2bf]
14592d1f1: f3410f5ec7 divss xmm0, xmm15
14592d1f6: 440f28e9 movaps xmm13, xmm1
14592d1fa: e8fe802d00 call 0x145c052fd
14592d1ff: f3410f59c7 mulss xmm0, xmm15
14592d204: 0f57ff xorps xmm7, xmm7
14592d207: f3410f58c5 addss xmm0, xmm13
14592d20c: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
14592d213: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592d21a: 488d85a8000000 lea rax, [rbp + 0xa8]
14592d221: 4889442420 mov qword ptr [rsp + 0x20], rax
14592d226: 48c744242801000000 mov qword ptr [rsp + 0x28], 1
14592d22f: 488d4d48 lea rcx, [rbp + 0x48]
14592d233: 4889f2 mov rdx, rsi
14592d236: 4c8d85c0000000 lea r8, [rbp + 0xc0]
14592d23d: 0f28d8 movaps xmm3, xmm0
14592d240: e88b8dffff call 0x145925fd0
14592d245: 90 nop
14592d246: 488b4548 mov rax, qword ptr [rbp + 0x48]
14592d24a: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14592d24e: 488b5558 mov rdx, qword ptr [rbp + 0x58]
14592d252: 488d14d1 lea rdx, [rcx + rdx*8]
14592d256: 48894d48 mov qword ptr [rbp + 0x48], rcx
14592d25a: 48894d50 mov qword ptr [rbp + 0x50], rcx
14592d25e: 48894558 mov qword ptr [rbp + 0x58], rax
14592d262: 48895560 mov qword ptr [rbp + 0x60], rdx
14592d266: 48c7456809000000 mov qword ptr [rbp + 0x68], 9
14592d26e: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592d275: 488d8df0000000 lea rcx, [rbp + 0xf0]
14592d27c: 488d5548 lea rdx, [rbp + 0x48]
14592d280: e88b140a00 call 0x1459ce710
14592d285: 90 nop
14592d286: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592d28d: 4839d3 cmp rbx, rdx
14592d290: 0f83390e0000 jae 0x14592e0cf
14592d296: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14592d29d: 80783905 cmp byte ptr [rax + 0x39], 5
14592d2a1: 753e jne 0x14592d2e1
14592d2a3: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592d2aa: 488b543820 mov rdx, qword ptr [rax + rdi + 0x20]
14592d2af: 4801f8 add rax, rdi
14592d2b2: 8b4874 mov ecx, dword ptr [rax + 0x74]
14592d2b5: ffc1 inc ecx
14592d2b7: 894874 mov dword ptr [rax + 0x74], ecx
14592d2ba: 69c1abaaaaaa imul eax, ecx, 0xaaaaaaab
14592d2c0: 41be06000000 mov r14d, 6
14592d2c6: 3d55555555 cmp eax, 0x55555555
14592d2cb: 0f8640020000 jbe 0x14592d511
14592d2d1: f3440f102d96af4700 movss xmm13, dword ptr [rip + 0x47af96]
14592d2da: 31c0 xor eax, eax
14592d2dc: e9e3020000 jmp 0x14592d5c4
14592d2e1: 41be05000000 mov r14d, 5
14592d2e7: f3440f102d80af4700 movss xmm13, dword ptr [rip + 0x47af80]
14592d2f0: 31c0 xor eax, eax
14592d2f2: 488d0db8782d01 lea rcx, [rip + 0x12d78b8]
14592d2f9: e9cd020000 jmp 0x14592d5cb
14592d2fe: 4181f8e94b0000 cmp r8d, 0x4be9
14592d305: 0f8f47050000 jg 0x14592d852
14592d30b: 4181f8651c0000 cmp r8d, 0x1c65
14592d312: 0f84a2050000 je 0x14592d8ba
14592d318: 4181f8c5270000 cmp r8d, 0x27c5
14592d31f: 0f844a080000 je 0x14592db6f
14592d325: f30f100543af4700 movss xmm0, dword ptr [rip + 0x47af43]
14592d32d: 4181f8662c0000 cmp r8d, 0x2c66
14592d334: 0f840b050000 je 0x14592d845
14592d33a: e942080000 jmp 0x14592db81
14592d33f: 4989d0 mov r8, rdx
14592d342: 4983e0fe and r8, 0xfffffffffffffffe
14592d346: 31c9 xor ecx, ecx
14592d348: f30f1005a0b14700 movss xmm0, dword ptr [rip + 0x47b1a0]
14592d350: eb09 jmp 0x14592d35b
14592d352: 4883c102 add rcx, 2
14592d356: 4939c8 cmp r8, rcx
14592d359: 7424 je 0x14592d37f
14592d35b: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592d35f: 7409 je 0x14592d36a
14592d361: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592d366: 75ea jne 0x14592d352
14592d368: eb0d jmp 0x14592d377
14592d36a: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592d370: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592d375: 75db jne 0x14592d352
14592d377: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592d37d: ebd3 jmp 0x14592d352
14592d37f: f6c201 test dl, 1
14592d382: 740c je 0x14592d390
14592d384: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592d388: 7506 jne 0x14592d390
14592d38a: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592d390: 0f2ec7 ucomiss xmm0, xmm7
14592d393: 0f86b3000000 jbe 0x14592d44c
14592d399: 488b86d8090000 mov rax, qword ptr [rsi + 0x9d8]
14592d3a0: 488b8ec0090000 mov rcx, qword ptr [rsi + 0x9c0]
14592d3a7: 488b96c8090000 mov rdx, qword ptr [rsi + 0x9c8]
14592d3ae: 4c8d0408 lea r8, [rax + rcx]
14592d3b2: 49c1c017 rol r8, 0x17
14592d3b6: 4901c8 add r8, rcx
14592d3b9: 4989d1 mov r9, rdx
14592d3bc: 49c1e111 shl r9, 0x11
14592d3c0: 4c8b96d0090000 mov r10, qword ptr [rsi + 0x9d0]
14592d3c7: 4931ca xor r10, rcx
14592d3ca: 4831d0 xor rax, rdx
14592d3cd: 4c31d2 xor rdx, r10
14592d3d0: 488996c8090000 mov qword ptr [rsi + 0x9c8], rdx
14592d3d7: 4831c1 xor rcx, rax
14592d3da: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14592d3e1: 4d31ca xor r10, r9
14592d3e4: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
14592d3eb: 48c1c02d rol rax, 0x2d
14592d3ef: 49c1e828 shr r8, 0x28
14592d3f3: f3410f2ac8 cvtsi2ss xmm1, r8d
14592d3f8: 488986d8090000 mov qword ptr [rsi + 0x9d8], rax
14592d3ff: f30f590d49065900 mulss xmm1, dword ptr [rip + 0x590649]
14592d407: 0f2ec1 ucomiss xmm0, xmm1
14592d40a: 7640 jbe 0x14592d44c
14592d40c: 488d05c2932d01 lea rax, [rip + 0x12d93c2]
14592d413: 48894548 mov qword ptr [rbp + 0x48], rax
14592d417: 48c745500e000000 mov qword ptr [rbp + 0x50], 0xe
14592d41f: 48c7455800000000 mov qword ptr [rbp + 0x58], 0
14592d427: 66c745700000 mov word ptr [rbp + 0x70], 0
14592d42d: 488d4548 lea rax, [rbp + 0x48]
14592d431: 4889442420 mov qword ptr [rsp + 0x20], rax
14592d436: 4889f1 mov rcx, rsi
14592d439: 4889da mov rdx, rbx
14592d43c: 4c8b8518010000 mov r8, qword ptr [rbp + 0x118]
14592d443: 4d89f1 mov r9, r14
14592d446: e815940200 call 0x145956860
14592d44b: 90 nop
14592d44c: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14592d453: 4885d2 test rdx, rdx
14592d456: 7416 je 0x14592d46e
14592d458: 48c1e204 shl rdx, 4
14592d45c: 41b808000000 mov r8d, 8
14592d462: 488b8d18010000 mov rcx, qword ptr [rbp + 0x118]
14592d469: e8624d6dfa call 0x1400021d0
14592d46e: 483b9ed8000000 cmp rbx, qword ptr [rsi + 0xd8]
14592d475: 0f83bedcffff jae 0x14592b139
14592d47b: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592d482: 488b4c3818 mov rcx, qword ptr [rax + rdi + 0x18]
14592d487: 80793900 cmp byte ptr [rcx + 0x39], 0
14592d48b: 0f84a8dcffff je 0x14592b139
14592d491: 4801f8 add rax, rdi
14592d494: f30f104060 movss xmm0, dword ptr [rax + 0x60]
14592d499: 0f2e86540a0000 ucomiss xmm0, dword ptr [rsi + 0xa54]
14592d4a0: 0f8693dcffff jbe 0x14592b139
14592d4a6: f30f104864 movss xmm1, dword ptr [rax + 0x64]
14592d4ab: 0f28d1 movaps xmm2, xmm1
14592d4ae: f30f5dd0 minss xmm2, xmm0
14592d4b2: 0f28c2 movaps xmm0, xmm2
14592d4b5: f30fc2c203 cmpunordss xmm0, xmm2
14592d4ba: 0f28d8 movaps xmm3, xmm0
14592d4bd: 0f55da andnps xmm3, xmm2
14592d4c0: 0f54c1 andps xmm0, xmm1
14592d4c3: 0f56c3 orps xmm0, xmm3
14592d4c6: f30f114064 movss dword ptr [rax + 0x64], xmm0
14592d4cb: e969dcffff jmp 0x14592b139
14592d4d0: 4181f884000000 cmp r8d, 0x84
14592d4d7: 0f8e7e060000 jle 0x14592db5b
14592d4dd: 4181f885000000 cmp r8d, 0x85
14592d4e4: 0f845b030000 je 0x14592d845
14592d4ea: 4181f893010000 cmp r8d, 0x193
14592d4f1: 0f84c3030000 je 0x14592d8ba
14592d4f7: f30f100571ad4700 movss xmm0, dword ptr [rip + 0x47ad71]
14592d4ff: 4181f8ae020000 cmp r8d, 0x2ae
14592d506: 0f84ae030000 je 0x14592d8ba
14592d50c: e970060000 jmp 0x14592db81
14592d511: 4c8b8df8000000 mov r9, qword ptr [rbp + 0xf8]
14592d518: 488b8500010000 mov rax, qword ptr [rbp + 0x100]
14592d51f: 4c89a5c8000000 mov qword ptr [rbp + 0xc8], r12
14592d526: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
14592d530: c785a800000000000000 mov dword ptr [rbp + 0xa8], 0
14592d53a: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592d541: 488d8da8000000 lea rcx, [rbp + 0xa8]
14592d548: 48894c2430 mov qword ptr [rsp + 0x30], rcx
14592d54d: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592d554: 48894c2428 mov qword ptr [rsp + 0x28], rcx
14592d559: 4889442420 mov qword ptr [rsp + 0x20], rax
14592d55e: 488d4d48 lea rcx, [rbp + 0x48]
14592d562: 41b84d030000 mov r8d, 0x34d
14592d568: e8f3c4f9ff call 0x1458c9a60
14592d56d: 90 nop
14592d56e: 4c8ba638060000 mov r12, qword ptr [rsi + 0x638]
14592d575: 4c3ba628060000 cmp r12, qword ptr [rsi + 0x628]
14592d57c: 750d jne 0x14592d58b
14592d57e: 488d8e28060000 lea rcx, [rsi + 0x628]
14592d585: e846b12d00 call 0x145c086d0
14592d58a: 90 nop
14592d58b: 488b8630060000 mov rax, qword ptr [rsi + 0x630]
14592d592: 4c89e1 mov rcx, r12
14592d595: 48c1e105 shl rcx, 5
14592d599: 0f104548 movups xmm0, xmmword ptr [rbp + 0x48]
14592d59d: 0f104d58 movups xmm1, xmmword ptr [rbp + 0x58]
14592d5a1: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14592d5a6: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592d5aa: 49ffc4 inc r12
14592d5ad: 4c89a638060000 mov qword ptr [rsi + 0x638], r12
14592d5b4: f3440f102dbbac4700 movss xmm13, dword ptr [rip + 0x47acbb]
14592d5bd: 488d0502922d01 lea rax, [rip + 0x12d9202]
14592d5c4: 488d0df5912d01 lea rcx, [rip + 0x12d91f5]
14592d5cb: 4c8b85f8000000 mov r8, qword ptr [rbp + 0xf8]
14592d5d2: 4c8b8d00010000 mov r9, qword ptr [rbp + 0x100]
14592d5d9: 48894d48 mov qword ptr [rbp + 0x48], rcx
14592d5dd: 4c897550 mov qword ptr [rbp + 0x50], r14
14592d5e1: 48894558 mov qword ptr [rbp + 0x58], rax
14592d5e5: 48c745600f000000 mov qword ptr [rbp + 0x60], 0xf
14592d5ed: c745680000803f mov dword ptr [rbp + 0x68], 0x3f800000
14592d5f4: 66c745700000 mov word ptr [rbp + 0x70], 0
14592d5fa: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592d601: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
14592d608: 488d4548 lea rax, [rbp + 0x48]
14592d60c: 4889442420 mov qword ptr [rsp + 0x20], rax
14592d611: c644243000 mov byte ptr [rsp + 0x30], 0
14592d616: 4889f1 mov rcx, rsi
14592d619: 4889da mov rdx, rbx
14592d61c: e89f450200 call 0x145951bc0
14592d621: 90 nop
14592d622: 488b9608080000 mov rdx, qword ptr [rsi + 0x808]
14592d629: 4885d2 test rdx, rdx
14592d62c: 0f84b0010000 je 0x14592d7e2
14592d632: 488b8600080000 mov rax, qword ptr [rsi + 0x800]
14592d639: 4883fa01 cmp rdx, 1
14592d63d: 750c jne 0x14592d64b
14592d63f: 31c9 xor ecx, ecx
14592d641: f30f1005a7ae4700 movss xmm0, dword ptr [rip + 0x47aea7]
14592d649: eb47 jmp 0x14592d692
14592d64b: 4989d0 mov r8, rdx
14592d64e: 4983e0fe and r8, 0xfffffffffffffffe
14592d652: 31c9 xor ecx, ecx
14592d654: f30f100594ae4700 movss xmm0, dword ptr [rip + 0x47ae94]
14592d65c: eb0b jmp 0x14592d669
14592d65e: 6690 nop
14592d660: 4883c102 add rcx, 2
14592d664: 4939c8 cmp r8, rcx
14592d667: 7424 je 0x14592d68d
14592d669: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592d66d: 7409 je 0x14592d678
14592d66f: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592d674: 75ea jne 0x14592d660
14592d676: eb0d jmp 0x14592d685
14592d678: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592d67e: 807cc8081f cmp byte ptr [rax + rcx*8 + 8], 0x1f
14592d683: 75db jne 0x14592d660
14592d685: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592d68b: ebd3 jmp 0x14592d660
14592d68d: f6c201 test dl, 1
14592d690: 740c je 0x14592d69e
14592d692: 803cc81f cmp byte ptr [rax + rcx*8], 0x1f
14592d696: 7506 jne 0x14592d69e
14592d698: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592d69e: 0f2ec7 ucomiss xmm0, xmm7
14592d6a1: 0f863b010000 jbe 0x14592d7e2
14592d6a7: 488b86d8090000 mov rax, qword ptr [rsi + 0x9d8]
14592d6ae: 488b8ec0090000 mov rcx, qword ptr [rsi + 0x9c0]
14592d6b5: 488b96c8090000 mov rdx, qword ptr [rsi + 0x9c8]
14592d6bc: 4c8d0408 lea r8, [rax + rcx]
14592d6c0: 49c1c017 rol r8, 0x17
14592d6c4: 4901c8 add r8, rcx
14592d6c7: 4989d1 mov r9, rdx
14592d6ca: 49c1e111 shl r9, 0x11
14592d6ce: 4c8b96d0090000 mov r10, qword ptr [rsi + 0x9d0]
14592d6d5: 4931ca xor r10, rcx
14592d6d8: 4831d0 xor rax, rdx
14592d6db: 4c31d2 xor rdx, r10
14592d6de: 488996c8090000 mov qword ptr [rsi + 0x9c8], rdx
14592d6e5: 4831c1 xor rcx, rax
14592d6e8: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14592d6ef: 4d31ca xor r10, r9
14592d6f2: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
14592d6f9: 48c1c02d rol rax, 0x2d
14592d6fd: 49c1e828 shr r8, 0x28
14592d701: 0f57c9 xorps xmm1, xmm1
14592d704: f3410f2ac8 cvtsi2ss xmm1, r8d
14592d709: 488986d8090000 mov qword ptr [rsi + 0x9d8], rax
14592d710: f30f590d38035900 mulss xmm1, dword ptr [rip + 0x590338]
14592d718: 0f2ec1 ucomiss xmm0, xmm1
14592d71b: 0f86c1000000 jbe 0x14592d7e2
14592d721: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
14592d728: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
14592d72f: 488b9500010000 mov rdx, qword ptr [rbp + 0x100]
14592d736: 488d14d1 lea rdx, [rcx + rdx*8]
14592d73a: 48894d48 mov qword ptr [rbp + 0x48], rcx
14592d73e: 48894d50 mov qword ptr [rbp + 0x50], rcx
14592d742: 48894558 mov qword ptr [rbp + 0x58], rax
14592d746: 48895560 mov qword ptr [rbp + 0x60], rdx
14592d74a: 488d8668050000 lea rax, [rsi + 0x568]
14592d751: 48894568 mov qword ptr [rbp + 0x68], rax
14592d755: c6852701000000 mov byte ptr [rbp + 0x127], 0
14592d75c: 488d8dc0000000 lea rcx, [rbp + 0xc0]
14592d763: 488d5548 lea rdx, [rbp + 0x48]
14592d767: e8c48e0b00 call 0x1459e6630
14592d76c: 90 nop
14592d76d: 4c8b8dd0000000 mov r9, qword ptr [rbp + 0xd0]
14592d774: 4d85c9 test r9, r9
14592d777: 7450 je 0x14592d7c9
14592d779: 488d0555902d01 lea rax, [rip + 0x12d9055]
14592d780: 48894548 mov qword ptr [rbp + 0x48], rax
14592d784: 48c745500e000000 mov qword ptr [rbp + 0x50], 0xe
14592d78c: 48c7455800000000 mov qword ptr [rbp + 0x58], 0
14592d794: 66c745700000 mov word ptr [rbp + 0x70], 0
14592d79a: 4c8b85c8000000 mov r8, qword ptr [rbp + 0xc8]
14592d7a1: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
14592d7a8: 488d4548 lea rax, [rbp + 0x48]
14592d7ac: 4889442420 mov qword ptr [rsp + 0x20], rax
14592d7b1: c644243001 mov byte ptr [rsp + 0x30], 1
14592d7b6: 4889f1 mov rcx, rsi
14592d7b9: 4889da mov rdx, rbx
14592d7bc: 4c898518010000 mov qword ptr [rbp + 0x118], r8
14592d7c3: e8f8430200 call 0x145951bc0
14592d7c8: 90 nop
14592d7c9: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14592d7d0: 4885d2 test rdx, rdx
14592d7d3: 0f843d020000 je 0x14592da16
14592d7d9: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14592d7e0: eb17 jmp 0x14592d7f9
14592d7e2: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14592d7e9: 4885d2 test rdx, rdx
14592d7ec: 0f8424020000 je 0x14592da16
14592d7f2: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
14592d7f9: 48c1e203 shl rdx, 3
14592d7fd: 41b808000000 mov r8d, 8
14592d803: e8c8496dfa call 0x1400021d0
14592d808: e909020000 jmp 0x14592da16
14592d80d: 4181f8851a0000 cmp r8d, 0x1a85
14592d814: 742f je 0x14592d845
14592d816: 4181f8051b0000 cmp r8d, 0x1b05
14592d81d: 0f8456030000 je 0x14592db79
14592d823: f30f100545aa4700 movss xmm0, dword ptr [rip + 0x47aa45]
14592d82b: 4181f8541b0000 cmp r8d, 0x1b54
14592d832: 0f8549030000 jne 0x14592db81
14592d838: f30f100544ac4700 movss xmm0, dword ptr [rip + 0x47ac44]
14592d840: e93c030000 jmp 0x14592db81
14592d845: f30f1005973a4d00 movss xmm0, dword ptr [rip + 0x4d3a97]
14592d84d: e92f030000 jmp 0x14592db81
14592d852: 4181f8ea4b0000 cmp r8d, 0x4bea
14592d859: 0f841a030000 je 0x14592db79
14592d85f: 4181f8d35e0000 cmp r8d, 0x5ed3
14592d866: 0f842f040000 je 0x14592dc9b
14592d86c: f30f1005fca94700 movss xmm0, dword ptr [rip + 0x47a9fc]
14592d874: 4181f8f76a0000 cmp r8d, 0x6af7
14592d87b: 743d je 0x14592d8ba
14592d87d: e9ff020000 jmp 0x14592db81
14592d882: 4181f8fc0a0000 cmp r8d, 0xafc
14592d889: 742f je 0x14592d8ba
14592d88b: 4181f8e40b0000 cmp r8d, 0xbe4
14592d892: 0f84e1020000 je 0x14592db79
14592d898: f30f1005d0a94700 movss xmm0, dword ptr [rip + 0x47a9d0]
14592d8a0: 4181f8160e0000 cmp r8d, 0xe16
14592d8a7: 0f85d4020000 jne 0x14592db81
14592d8ad: f30f1005bb652d01 movss xmm0, dword ptr [rip + 0x12d65bb]
14592d8b5: e9c7020000 jmp 0x14592db81
14592d8ba: f30f100532ee4700 movss xmm0, dword ptr [rip + 0x47ee32]
14592d8c2: e9ba020000 jmp 0x14592db81
14592d8c7: 4d89c1 mov r9, r8
14592d8ca: 4983e1fe and r9, 0xfffffffffffffffe
14592d8ce: 31c9 xor ecx, ecx
14592d8d0: f30f100518ac4700 movss xmm0, dword ptr [rip + 0x47ac18]
14592d8d8: eb09 jmp 0x14592d8e3
14592d8da: 4883c102 add rcx, 2
14592d8de: 4939c9 cmp r9, rcx
14592d8e1: 7424 je 0x14592d907
14592d8e3: 803cc811 cmp byte ptr [rax + rcx*8], 0x11
14592d8e7: 7409 je 0x14592d8f2
14592d8e9: 807cc80811 cmp byte ptr [rax + rcx*8 + 8], 0x11
14592d8ee: 75ea jne 0x14592d8da
14592d8f0: eb0d jmp 0x14592d8ff
14592d8f2: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592d8f8: 807cc80811 cmp byte ptr [rax + rcx*8 + 8], 0x11
14592d8fd: 75db jne 0x14592d8da
14592d8ff: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14592d905: ebd3 jmp 0x14592d8da
14592d907: 41f6c001 test r8b, 1
14592d90b: 740c je 0x14592d919
14592d90d: 803cc811 cmp byte ptr [rax + rcx*8], 0x11
14592d911: 7506 jne 0x14592d919
14592d913: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14592d919: f30f58054fa94700 addss xmm0, dword ptr [rip + 0x47a94f]
14592d921: f30f117534 movss dword ptr [rbp + 0x34], xmm6
14592d926: f3440f10be94040000 movss xmm15, dword ptr [rsi + 0x494]
14592d92f: f3440f59ae8c040000 mulss xmm13, dword ptr [rsi + 0x48c]
14592d938: f3440f59e8 mulss xmm13, xmm0
14592d93d: 450f2efe ucomiss xmm15, xmm14
14592d941: 7609 jbe 0x14592d94c
14592d943: f3440f59ae98040000 mulss xmm13, dword ptr [rsi + 0x498]
14592d94c: 0f97442420 seta byte ptr [rsp + 0x20]
14592d951: f34d0f2ccd cvttss2si r9, xmm13
14592d956: 440f2eef ucomiss xmm13, xmm7
14592d95a: b800000000 mov eax, 0
14592d95f: 440f42c8 cmovb r9d, eax
14592d963: 440f2e2df9414800 ucomiss xmm13, dword ptr [rip + 0x4841f9]
14592d96b: b8ffffffff mov eax, 0xffffffff
14592d970: 440f47c8 cmova r9d, eax
14592d974: 488d4d48 lea rcx, [rbp + 0x48]
14592d978: 4d89e0 mov r8, r12
14592d97b: e80025f9ff call 0x1458bfe80
14592d980: 4c8bb638060000 mov r14, qword ptr [rsi + 0x638]
14592d987: 4c3bb628060000 cmp r14, qword ptr [rsi + 0x628]
14592d98e: 750d jne 0x14592d99d
14592d990: 488d8e28060000 lea rcx, [rsi + 0x628]
14592d997: e834ad2d00 call 0x145c086d0
14592d99c: 90 nop
14592d99d: 488b8630060000 mov rax, qword ptr [rsi + 0x630]
14592d9a4: 4c89f1 mov rcx, r14
14592d9a7: 48c1e105 shl rcx, 5
14592d9ab: 0f104548 movups xmm0, xmmword ptr [rbp + 0x48]
14592d9af: 0f104d58 movups xmm1, xmmword ptr [rbp + 0x58]
14592d9b3: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14592d9b8: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592d9bc: 49ffc6 inc r14
14592d9bf: 4c89b638060000 mov qword ptr [rsi + 0x638], r14
14592d9c6: 440fb6b6ad010000 movzx r14d, byte ptr [rsi + 0x1ad]
14592d9ce: c686ad01000002 mov byte ptr [rsi + 0x1ad], 2
14592d9d5: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14592d9dc: 0fb64038 movzx eax, byte ptr [rax + 0x38]
14592d9e0: 450f2efe ucomiss xmm15, xmm14
14592d9e4: 0f97442428 seta byte ptr [rsp + 0x28]
14592d9e9: 88442420 mov byte ptr [rsp + 0x20], al
14592d9ed: c644243001 mov byte ptr [rsp + 0x30], 1
14592d9f2: 4889f1 mov rcx, rsi
14592d9f5: 4c89e2 mov rdx, r12
14592d9f8: 410f28d5 movaps xmm2, xmm13
14592d9fc: 4531c9 xor r9d, r9d
14592d9ff: e8acbf0000 call 0x1459399b0
14592da04: 4488b6ad010000 mov byte ptr [rsi + 0x1ad], r14b
14592da0b: f30f107534 movss xmm6, dword ptr [rbp + 0x34]
14592da10: f3440f107520 movss xmm14, dword ptr [rbp + 0x20]
14592da16: 410f28fb movaps xmm7, xmm11
14592da1a: 483b9ed8000000 cmp rbx, qword ptr [rsi + 0xd8]
14592da21: 7348 jae 0x14592da6b
14592da23: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592da2a: 488b4c3818 mov rcx, qword ptr [rax + rdi + 0x18]
14592da2f: 80793900 cmp byte ptr [rcx + 0x39], 0
14592da33: 7436 je 0x14592da6b
14592da35: 4801f8 add rax, rdi
14592da38: f30f104060 movss xmm0, dword ptr [rax + 0x60]
14592da3d: 0f2e86540a0000 ucomiss xmm0, dword ptr [rsi + 0xa54]
14592da44: 7625 jbe 0x14592da6b
14592da46: f30f104864 movss xmm1, dword ptr [rax + 0x64]
14592da4b: 0f28d1 movaps xmm2, xmm1
14592da4e: f30f5dd0 minss xmm2, xmm0
14592da52: 0f28c2 movaps xmm0, xmm2
14592da55: f30fc2c203 cmpunordss xmm0, xmm2
14592da5a: 0f28d8 movaps xmm3, xmm0
14592da5d: 0f55da andnps xmm3, xmm2
14592da60: 0f54c1 andps xmm0, xmm1
14592da63: 0f56c3 orps xmm0, xmm3
14592da66: f30f114064 movss dword ptr [rax + 0x64], xmm0
14592da6b: 41807f3900 cmp byte ptr [r15 + 0x39], 0
14592da70: 7469 je 0x14592dadb
14592da72: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
14592da79: 4839d3 cmp rbx, rdx
14592da7c: 4c8d7b01 lea r15, [rbx + 1]
14592da80: 0f83e3050000 jae 0x14592e069
14592da86: 450f28fe movaps xmm15, xmm14
14592da8a: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
14592da91: 0fb74c3820 movzx ecx, word ptr [rax + rdi + 0x20]
14592da96: 450f57ed xorps xmm13, xmm13
14592da9a: f3440f2ae9 cvtsi2ss xmm13, ecx
14592da9f: f3440f592dfc854800 mulss xmm13, dword ptr [rip + 0x4885fc]
14592daa8: f3440f586c3868 addss xmm13, dword ptr [rax + rdi + 0x68]
14592daaf: 410f28c5 movaps xmm0, xmm13
14592dab3: e81f772d00 call 0x145c051d7
14592dab8: 440f28f0 movaps xmm14, xmm0
14592dabc: 410f28c5 movaps xmm0, xmm13
14592dac0: e80c772d00 call 0x145c051d1
14592dac5: 440f14f0 unpcklps xmm14, xmm0
14592dac9: 440f5935ff632d01 mulps xmm14, xmmword ptr [rip + 0x12d63ff]
14592dad1: 450f58e6 addps xmm12, xmm14
14592dad5: 450f28f7 movaps xmm14, xmm15
14592dad9: eb04 jmp 0x14592dadf
14592dadb: 4c8d7b01 lea r15, [rbx + 1]
14592dadf: 410f28c2 movaps xmm0, xmm10
14592dae3: 410f5cc4 subps xmm0, xmm12
14592dae7: 0f59c0 mulps xmm0, xmm0
14592daea: f30f16c8 movshdup xmm1, xmm0
14592daee: f30f58c8 addss xmm1, xmm0
14592daf2: 0f57c0 xorps xmm0, xmm0
14592daf5: f30f51c1 sqrtss xmm0, xmm1
14592daf9: 0f2e05b85d4800 ucomiss xmm0, dword ptr [rip + 0x485db8]
14592db00: 440f28df movaps xmm11, xmm7
14592db04: 0f57ff xorps xmm7, xmm7
14592db07: 0f862cd6ffff jbe 0x14592b139
14592db0d: 0f28c8 movaps xmm1, xmm0
14592db10: f30f580d18632d01 addss xmm1, dword ptr [rip + 0x12d6318]
14592db18: f30f5ec8 divss xmm1, xmm0
14592db1c: 450f5ce2 subps xmm12, xmm10
14592db20: f3410f16dc movshdup xmm3, xmm12
14592db25: f3440f59e1 mulss xmm12, xmm1
14592db2a: f3450f58e2 addss xmm12, xmm10
14592db2f: f3410f16c2 movshdup xmm0, xmm10
14592db34: f30f59d9 mulss xmm3, xmm1
14592db38: f30f58d8 addss xmm3, xmm0
14592db3c: f30f104510 movss xmm0, dword ptr [rbp + 0x10]
14592db41: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14592db47: 4889f1 mov rcx, rsi
14592db4a: 4889da mov rdx, rbx
14592db4d: 410f28d4 movaps xmm2, xmm12
14592db51: e88a6d0000 call 0x1459348e0
14592db56: e9ded5ffff jmp 0x14592b139
14592db5b: 4183f84b cmp r8d, 0x4b
14592db5f: 7418 je 0x14592db79
14592db61: f30f100507a74700 movss xmm0, dword ptr [rip + 0x47a707]
14592db69: 4183f874 cmp r8d, 0x74
14592db6d: 7512 jne 0x14592db81
14592db6f: f30f100569b84800 movss xmm0, dword ptr [rip + 0x48b869]
14592db77: eb08 jmp 0x14592db81
14592db79: f30f100573a94700 movss xmm0, dword ptr [rip + 0x47a973]
14592db81: 4c89ad18010000 mov qword ptr [rbp + 0x118], r13
14592db88: 450f2efe ucomiss xmm15, xmm14
14592db8c: 410f97c1 seta r9b
14592db90: 440f5cd1 subps xmm10, xmm1
14592db94: 450f59d2 mulps xmm10, xmm10
14592db98: f3410f16ca movshdup xmm1, xmm10
14592db9d: f3410f58ca addss xmm1, xmm10
14592dba2: 450f57d2 xorps xmm10, xmm10
14592dba6: f3440f51d1 sqrtss xmm10, xmm1
14592dbab: f3440f5ed0 divss xmm10, xmm0
14592dbb0: f3440f5896540a0000 addss xmm10, dword ptr [rsi + 0xa54]
14592dbb9: 450fb67f38 movzx r15d, byte ptr [r15 + 0x38]
14592dbbe: 4531ed xor r13d, r13d
14592dbc1: 4180ff04 cmp r15b, 4
14592dbc5: 0f94c0 sete al
14592dbc8: 4c8bb6f0050000 mov r14, qword ptr [rsi + 0x5f0]
14592dbcf: 4c3bb6e0050000 cmp r14, qword ptr [rsi + 0x5e0]
14592dbd6: 752a jne 0x14592dc02
14592dbd8: 488d8ee0050000 lea rcx, [rsi + 0x5e0]
14592dbdf: 44898510010000 mov dword ptr [rbp + 0x110], r8d
14592dbe6: 44884d28 mov byte ptr [rbp + 0x28], r9b
14592dbea: 884540 mov byte ptr [rbp + 0x40], al
14592dbed: e8fea92d00 call 0x145c085f0
14592dbf2: 0fb64540 movzx eax, byte ptr [rbp + 0x40]
14592dbf6: 440fb64d28 movzx r9d, byte ptr [rbp + 0x28]
14592dbfb: 448b8510010000 mov r8d, dword ptr [rbp + 0x110]
14592dc02: f3450fc2f701 cmpltss xmm14, xmm15
14592dc08: 410f28c6 movaps xmm0, xmm14
14592dc0c: 410f55c5 andnps xmm0, xmm13
14592dc10: 450f54f4 andps xmm14, xmm12
14592dc14: 440f56f0 orps xmm14, xmm0
14592dc18: 4188c5 mov r13b, al
14592dc1b: 488b86e8050000 mov rax, qword ptr [rsi + 0x5e8]
14592dc22: 4c89f1 mov rcx, r14
14592dc25: 48c1e107 shl rcx, 7
14592dc29: 48c7040800000000 mov qword ptr [rax + rcx], 0
14592dc31: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
14592dc39: c644084902 mov byte ptr [rax + rcx + 0x49], 2
14592dc3e: 4c89640850 mov qword ptr [rax + rcx + 0x50], r12
14592dc43: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
14592dc4a: 4889540858 mov qword ptr [rax + rcx + 0x58], rdx
14592dc4f: 44896c0860 mov dword ptr [rax + rcx + 0x60], r13d
14592dc54: f20f100564622d01 movsd xmm0, qword ptr [rip + 0x12d6264]
14592dc5c: f20f11440864 movsd qword ptr [rax + rcx + 0x64], xmm0
14592dc62: f3440f1154086c movss dword ptr [rax + rcx + 0x6c], xmm10
14592dc69: 4489440870 mov dword ptr [rax + rcx + 0x70], r8d
14592dc6e: f3440f11740874 movss dword ptr [rax + rcx + 0x74], xmm14
14592dc75: 44884c0878 mov byte ptr [rax + rcx + 0x78], r9b
14592dc7a: 66c74408790000 mov word ptr [rax + rcx + 0x79], 0
14592dc81: 44887c087b mov byte ptr [rax + rcx + 0x7b], r15b
14592dc86: 49ffc6 inc r14
14592dc89: 4c89b6f0050000 mov qword ptr [rsi + 0x5f0], r14
14592dc90: f3440f107520 movss xmm14, dword ptr [rbp + 0x20]
14592dc96: e966d6ffff jmp 0x14592b301
14592dc9b: f30f1005fd602d01 movss xmm0, dword ptr [rip + 0x12d60fd]
14592dca3: e9d9feffff jmp 0x14592db81
14592dca8: 498d5001 lea rdx, [r8 + 1]
14592dcac: 4839c2 cmp rdx, rax
14592dcaf: 7346 jae 0x14592dcf7
14592dcb1: 468d1400 lea r10d, [rax + r8]
14592dcb5: 4d89c1 mov r9, r8
14592dcb8: 41f6c201 test r10b, 1
14592dcbc: 752d jne 0x14592dceb
14592dcbe: f3420f10448104 movss xmm0, dword ptr [rcx + r8*4 + 4]
14592dcc5: 410f28ca movaps xmm1, xmm10
14592dcc9: f30f5cc8 subss xmm1, xmm0
14592dccd: f30f10159ba54700 movss xmm2, dword ptr [rip + 0x47a59b]
14592dcd5: 0f2ed1 ucomiss xmm2, xmm1
14592dcd8: 4d89c1 mov r9, r8
14592dcdb: 760a jbe 0x14592dce7
14592dcdd: f3420f110481 movss dword ptr [rcx + r8*4], xmm0
14592dce3: 4d8d4801 lea r9, [r8 + 1]
14592dce7: 498d5002 lea rdx, [r8 + 2]
14592dceb: 4c8d50fe lea r10, [rax - 2]
14592dcef: 4d39c2 cmp r10, r8
14592dcf2: 4d89c8 mov r8, r9
14592dcf5: 751b jne 0x14592dd12
14592dcf7: 4c898650010000 mov qword ptr [rsi + 0x150], r8
14592dcfe: 4c89c0 mov rax, r8
14592dd01: e9e7e1ffff jmp 0x14592beed
14592dd06: 4883c202 add rdx, 2
14592dd0a: 4d89c8 mov r8, r9
14592dd0d: 4839d0 cmp rax, rdx
14592dd10: 74e5 je 0x14592dcf7
14592dd12: f30f100491 movss xmm0, dword ptr [rcx + rdx*4]
14592dd17: 410f28ca movaps xmm1, xmm10
14592dd1b: f30f5cc8 subss xmm1, xmm0
14592dd1f: f30f101549a54700 movss xmm2, dword ptr [rip + 0x47a549]
14592dd27: 0f2ed1 ucomiss xmm2, xmm1
14592dd2a: 7609 jbe 0x14592dd35
14592dd2c: f3420f110489 movss dword ptr [rcx + r9*4], xmm0
14592dd32: 49ffc1 inc r9
14592dd35: f30f10449104 movss xmm0, dword ptr [rcx + rdx*4 + 4]
14592dd3b: 410f28ca movaps xmm1, xmm10
14592dd3f: f30f5cc8 subss xmm1, xmm0
14592dd43: f30f101525a54700 movss xmm2, dword ptr [rip + 0x47a525]
14592dd4b: 0f2ed1 ucomiss xmm2, xmm1
14592dd4e: 76b6 jbe 0x14592dd06
14592dd50: f3420f110489 movss dword ptr [rcx + r9*4], xmm0
14592dd56: 49ffc1 inc r9
14592dd59: ebab jmp 0x14592dd06
14592dd5b: 48895540 mov qword ptr [rbp + 0x40], rdx
14592dd5f: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
14592dd68: ba01000000 mov edx, 1
14592dd6d: 41b908000000 mov r9d, 8
14592dd73: 488d4d48 lea rcx, [rbp + 0x48]
14592dd77: 4d89e0 mov r8, r12
14592dd7a: e8b1a42d00 call 0x145c08230
14592dd7f: 90 nop
14592dd80: 4c8b6d50 mov r13, qword ptr [rbp + 0x50]
14592dd84: 4c8b7558 mov r14, qword ptr [rbp + 0x58]
14592dd88: 4a8d0cf500000000 lea rcx, [r14*8]
14592dd90: 4c01e9 add rcx, r13
14592dd93: 488b9510010000 mov rdx, qword ptr [rbp + 0x110]
14592dd9a: 4c8b4528 mov r8, qword ptr [rbp + 0x28]
14592dd9e: e8f8732d00 call 0x145c0519b
14592dda3: 4c8d7b01 lea r15, [rbx + 1]
14592dda7: 0f57ff xorps xmm7, xmm7
14592ddaa: 4c8ba518010000 mov r12, qword ptr [rbp + 0x118]
14592ddb1: 488b5540 mov rdx, qword ptr [rbp + 0x40]
14592ddb5: 4885d2 test rdx, rdx
14592ddb8: 0f8595e2ffff jne 0x14592c053
14592ddbe: e9a6e2ffff jmp 0x14592c069
14592ddc3: 0f28b530010000 movaps xmm6, xmmword ptr [rbp + 0x130]
14592ddca: 0f28bd40010000 movaps xmm7, xmmword ptr [rbp + 0x140]
14592ddd1: 440f288550010000 movaps xmm8, xmmword ptr [rbp + 0x150]
14592ddd9: 440f288d60010000 movaps xmm9, xmmword ptr [rbp + 0x160]
14592dde1: 440f289570010000 movaps xmm10, xmmword ptr [rbp + 0x170]
14592dde9: 440f289d80010000 movaps xmm11, xmmword ptr [rbp + 0x180]
14592ddf1: 440f28a590010000 movaps xmm12, xmmword ptr [rbp + 0x190]
14592ddf9: 440f28ada0010000 movaps xmm13, xmmword ptr [rbp + 0x1a0]
14592de01: 440f28b5b0010000 movaps xmm14, xmmword ptr [rbp + 0x1b0]
14592de09: 440f28bdc0010000 movaps xmm15, xmmword ptr [rbp + 0x1c0]
14592de11: 4881c458020000 add rsp, 0x258
14592de18: 5b pop rbx
14592de19: 5f pop rdi
14592de1a: 5e pop rsi
14592de1b: 415c pop r12
14592de1d: 415d pop r13
14592de1f: 415e pop r14
14592de21: 415f pop r15
14592de23: 5d pop rbp
14592de24: c3 ret
14592de25: 41bc08000000 mov r12d, 8
14592de2b: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
14592de36: 4d85ff test r15, r15
14592de39: 0f8546c8ffff jne 0x14592a685
14592de3f: e94fc8ffff jmp 0x14592a693
14592de44: 4d8d5801 lea r11, [r8 + 1]
14592de48: 4939cb cmp r11, rcx
14592de4b: 7338 jae 0x14592de85
14592de4d: 4c89c2 mov rdx, r8
14592de50: 4829ca sub rdx, rcx
14592de53: 4c8d5202 lea r10, [rdx + 2]
14592de57: f6c201 test dl, 1
14592de5a: 7532 jne 0x14592de8e
14592de5c: f3410f1009 movss xmm1, dword ptr [r9]
14592de61: 0f2ec8 ucomiss xmm1, xmm0
14592de64: 4c89c2 mov rdx, r8
14592de67: 7610 jbe 0x14592de79
14592de69: 498d51f4 lea rdx, [r9 - 0xc]
14592de6d: 0f100a movups xmm1, xmmword ptr [rdx]
14592de70: 410f1149e4 movups xmmword ptr [r9 - 0x1c], xmm1
14592de75: 498d5001 lea rdx, [r8 + 1]
14592de79: 4983c002 add r8, 2
14592de7d: 4d89c3 mov r11, r8
14592de80: 4989d0 mov r8, rdx
14592de83: eb09 jmp 0x14592de8e
14592de85: 4c894660 mov qword ptr [rsi + 0x60], r8
14592de89: e9a0c1ffff jmp 0x14592a02e
14592de8e: 4d85d2 test r10, r10
14592de91: 746c je 0x14592deff
14592de93: 4c29d9 sub rcx, r11
14592de96: 49c1e304 shl r11, 4
14592de9a: 4d8d0c03 lea r9, [r11 + rax]
14592de9e: 4983c11c add r9, 0x1c
14592dea2: 4c89c2 mov rdx, r8
14592dea5: eb0a jmp 0x14592deb1
14592dea7: 4983c120 add r9, 0x20
14592deab: 4883c1fe add rcx, -2
14592deaf: 744e je 0x14592deff
14592deb1: f3410f1049f0 movss xmm1, dword ptr [r9 - 0x10]
14592deb7: 0f2ec8 ucomiss xmm1, xmm0
14592deba: 7623 jbe 0x14592dedf
14592debc: 4d8d41e4 lea r8, [r9 - 0x1c]
14592dec0: 4989d2 mov r10, rdx
14592dec3: 49c1e204 shl r10, 4
14592dec7: 410f1008 movups xmm1, xmmword ptr [r8]
14592decb: 420f110c10 movups xmmword ptr [rax + r10], xmm1
14592ded0: 48ffc2 inc rdx
14592ded3: f3410f1009 movss xmm1, dword ptr [r9]
14592ded8: 0f2ec8 ucomiss xmm1, xmm0
14592dedb: 76ca jbe 0x14592dea7
14592dedd: eb0a jmp 0x14592dee9
14592dedf: f3410f1009 movss xmm1, dword ptr [r9]
14592dee4: 0f2ec8 ucomiss xmm1, xmm0
14592dee7: 76be jbe 0x14592dea7
14592dee9: 4989d0 mov r8, rdx
14592deec: 49c1e004 shl r8, 4
14592def0: 410f1049f4 movups xmm1, xmmword ptr [r9 - 0xc]
14592def5: 420f110c00 movups xmmword ptr [rax + r8], xmm1
14592defa: 48ffc2 inc rdx
14592defd: eba8 jmp 0x14592dea7
14592deff: 48895660 mov qword ptr [rsi + 0x60], rdx
14592df03: e926c1ffff jmp 0x14592a02e
14592df08: 488d85c0000000 lea rax, [rbp + 0xc0]
14592df0f: 48894548 mov qword ptr [rbp + 0x48], rax
14592df13: 488d05a6416dfa lea rax, [rip - 0x592be5a]
14592df1a: 48894550 mov qword ptr [rbp + 0x50], rax
14592df1e: 488d0d73212c01 lea rcx, [rip + 0x12c2173]
14592df25: 4c8d057c212c01 lea r8, [rip + 0x12c217c]
14592df2c: 488d5548 lea rdx, [rbp + 0x48]
14592df30: e8eb684700 call 0x145da4820
14592df35: 0f0b ud2
14592df37: 4c8d05ba772d01 lea r8, [rip + 0x12d77ba]
14592df3e: 4889f9 mov rcx, rdi
14592df41: e8fd664700 call 0x145da4643
14592df46: 0f0b ud2
14592df48: 4c8d0591772d01 lea r8, [rip + 0x12d7791]
14592df4f: 4889f9 mov rcx, rdi
14592df52: e8ec664700 call 0x145da4643
14592df57: 0f0b ud2
14592df59: c6850e01000001 mov byte ptr [rbp + 0x10e], 1
14592df60: b908000000 mov ecx, 8
14592df65: ba08000000 mov edx, 8
14592df6a: e822634700 call 0x145da4291
14592df6f: 90 nop
14592df70: e971010000 jmp 0x14592e0e6
14592df75: b908000000 mov ecx, 8
14592df7a: ba40000000 mov edx, 0x40
14592df7f: e80d634700 call 0x145da4291
14592df84: 0f0b ud2
14592df86: b908000000 mov ecx, 8
14592df8b: ba08000000 mov edx, 8
14592df90: e8fc624700 call 0x145da4291
14592df95: 0f0b ud2
14592df97: 4c8d0572772d01 lea r8, [rip + 0x12d7772]
14592df9e: 4889f9 mov rcx, rdi
14592dfa1: e89d664700 call 0x145da4643
14592dfa6: 0f0b ud2
14592dfa8: 4c8d0579882d01 lea r8, [rip + 0x12d8879]
14592dfaf: 4c89f1 mov rcx, r14
14592dfb2: e88c664700 call 0x145da4643
14592dfb7: 0f0b ud2
14592dfb9: 4c8d05d8772d01 lea r8, [rip + 0x12d77d8]
14592dfc0: 4889d9 mov rcx, rbx
14592dfc3: e87b664700 call 0x145da4643
14592dfc8: 0f0b ud2
14592dfca: 4c8d05df772d01 lea r8, [rip + 0x12d77df]
14592dfd1: 4889d9 mov rcx, rbx
14592dfd4: 4c89f2 mov rdx, r14
14592dfd7: e867664700 call 0x145da4643
14592dfdc: 0f0b ud2
14592dfde: 4c8d055b882d01 lea r8, [rip + 0x12d885b]
14592dfe5: 4c89f1 mov rcx, r14
14592dfe8: e856664700 call 0x145da4643
14592dfed: 0f0b ud2
14592dfef: 4c8d051a882d01 lea r8, [rip + 0x12d881a]
14592dff6: 4c89f1 mov rcx, r14
14592dff9: e845664700 call 0x145da4643
14592dffe: 0f0b ud2
14592e000: 4c8d0521782d01 lea r8, [rip + 0x12d7821]
14592e007: 4889d9 mov rcx, rbx
14592e00a: 4c89f2 mov rdx, r14
14592e00d: e831664700 call 0x145da4643
14592e012: 0f0b ud2
14592e014: 4c8d0525782d01 lea r8, [rip + 0x12d7825]
14592e01b: 4889d9 mov rcx, rbx
14592e01e: e820664700 call 0x145da4643
14592e023: 0f0b ud2
14592e025: 4c8d059c772d01 lea r8, [rip + 0x12d779c]
14592e02c: 4889d9 mov rcx, rbx
14592e02f: e80f664700 call 0x145da4643
14592e034: 0f0b ud2
14592e036: 4c8d051b782d01 lea r8, [rip + 0x12d781b]
14592e03d: 4889d9 mov rcx, rbx
14592e040: e8fe654700 call 0x145da4643
14592e045: 0f0b ud2
14592e047: 4c8d05128a2d01 lea r8, [rip + 0x12d8a12]
14592e04e: 4889d9 mov rcx, rbx
14592e051: e8ed654700 call 0x145da4643
14592e056: 0f0b ud2
14592e058: 4c8d05b1772d01 lea r8, [rip + 0x12d77b1]
14592e05f: 4889d9 mov rcx, rbx
14592e062: e8dc654700 call 0x145da4643
14592e067: 0f0b ud2
14592e069: 4c8d0508872d01 lea r8, [rip + 0x12d8708]
14592e070: 4889d9 mov rcx, rbx
14592e073: e8cb654700 call 0x145da4643
14592e078: 0f0b ud2
14592e07a: 4c8d055f772d01 lea r8, [rip + 0x12d775f]
14592e081: 4889d9 mov rcx, rbx
14592e084: e8ba654700 call 0x145da4643
14592e089: 0f0b ud2
14592e08b: 4c8d05ee882d01 lea r8, [rip + 0x12d88ee]
14592e092: 4889d9 mov rcx, rbx
14592e095: e8a9654700 call 0x145da4643
14592e09a: 0f0b ud2
14592e09c: 4c8d050d892d01 lea r8, [rip + 0x12d890d]
14592e0a3: 4889d9 mov rcx, rbx
14592e0a6: e898654700 call 0x145da4643
14592e0ab: 0f0b ud2
14592e0ad: 4c8d0544772d01 lea r8, [rip + 0x12d7744]
14592e0b4: 4889d9 mov rcx, rbx
14592e0b7: e887654700 call 0x145da4643
14592e0bc: 0f0b ud2
14592e0be: 4c8d05cb862d01 lea r8, [rip + 0x12d86cb]
14592e0c5: 4889d9 mov rcx, rbx
14592e0c8: e876654700 call 0x145da4643
14592e0cd: 0f0b ud2
14592e0cf: c6852701000001 mov byte ptr [rbp + 0x127], 1
14592e0d6: 4c8d05cb862d01 lea r8, [rip + 0x12d86cb]
14592e0dd: 4889d9 mov rcx, rbx
14592e0e0: e85e654700 call 0x145da4643
14592e0e5: 90 nop
14592e0e6: 0f0b ud2
