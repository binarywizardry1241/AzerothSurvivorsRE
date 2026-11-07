145958025: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
14595802e: 8b19 mov ebx, dword ptr [rcx]
145958030: 8b7904 mov edi, dword ptr [rcx + 4]
145958033: 448b6908 mov r13d, dword ptr [rcx + 8]
145958037: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14595803c: f30f118550010000 movss dword ptr [rbp + 0x150], xmm0
145958044: f30f105910 movss xmm3, dword ptr [rcx + 0x10]
145958049: f30f104114 movss xmm0, dword ptr [rcx + 0x14]
14595804e: f30f1185b8000000 movss dword ptr [rbp + 0xb8], xmm0
145958056: f30f107118 movss xmm6, dword ptr [rcx + 0x18]
14595805b: 4889f1 mov rcx, rsi
14595805e: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145958065: 4189d8 mov r8d, ebx
145958068: f30f119df0000000 movss dword ptr [rbp + 0xf0], xmm3
145958070: e87bf7ffff call 0x1459577f0
145958075: 488d8ea0090000 lea rcx, [rsi + 0x9a0]
14595807c: f30f1015bc504700 movss xmm2, dword ptr [rip + 0x4750bc]
145958084: 0f57c9 xorps xmm1, xmm1
145958087: e8f48ff9ff call 0x1458f1080
14595808c: 440f28c8 movaps xmm9, xmm0
145958090: e888202a00 call 0x145bfa11d
145958095: 440f28c0 movaps xmm8, xmm0
145958099: 410f28c1 movaps xmm0, xmm9
14595809d: e875202a00 call 0x145bfa117
1459580a2: 89bdcc000000 mov dword ptr [rbp + 0xcc], edi
1459580a8: 85ff test edi, edi
1459580aa: 0f84c8f8ffff je 0x145957978
1459580b0: 4585ed test r13d, r13d
1459580b3: 0f84bff8ffff je 0x145957978
1459580b9: 0f28f8 movaps xmm7, xmm0
1459580bc: f30f100d4ca44800 movss xmm1, dword ptr [rip + 0x48a44c]
1459580c4: f30f108550010000 movss xmm0, dword ptr [rbp + 0x150]
1459580cc: f30f59c8 mulss xmm1, xmm0
1459580d0: f30f1015cccd4700 movss xmm2, dword ptr [rip + 0x47cdcc]
1459580d8: 8b85cc000000 mov eax, dword ptr [rbp + 0xcc]
1459580de: 0f57db xorps xmm3, xmm3
1459580e1: f3480f2ad8 cvtsi2ss xmm3, rax
1459580e6: f30f59d0 mulss xmm2, xmm0
1459580ea: f30f115550 movss dword ptr [rbp + 0x50], xmm2
1459580ef: f30f581dcd4f4700 addss xmm3, dword ptr [rip + 0x474fcd]
1459580f7: f30f1005a5514400 movss xmm0, dword ptr [rip + 0x4451a5]
1459580ff: 4489e8 mov eax, r13d
145958102: 0f57d2 xorps xmm2, xmm2
145958105: f3480f2ad0 cvtsi2ss xmm2, rax
14595810a: f30f59d8 mulss xmm3, xmm0
14595810e: f30f115d60 movss dword ptr [rbp + 0x60], xmm3
145958113: f30f59d0 mulss xmm2, xmm0
145958117: f30f59d1 mulss xmm2, xmm1
14595811b: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145958123: f30f59c6 mulss xmm0, xmm6
145958127: f30f118578010000 movss dword ptr [rbp + 0x178], xmm0
14595812f: f30f118d0c010000 movss dword ptr [rbp + 0x10c], xmm1
145958137: 0f57c0 xorps xmm0, xmm0
14595813a: f30f59c8 mulss xmm1, xmm0
14595813e: 440f28d2 movaps xmm10, xmm2
145958142: f30f5cca subss xmm1, xmm2
145958146: 0f2815534f4700 movaps xmm2, xmmword ptr [rip + 0x474f53]
14595814d: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
145958154: 0f57d1 xorps xmm2, xmm1
145958157: 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
14595815b: f30f5985b8000000 mulss xmm0, dword ptr [rbp + 0xb8]
145958163: f30f5885f0000000 addss xmm0, dword ptr [rbp + 0xf0]
14595816b: f30f114540 movss dword ptr [rbp + 0x40], xmm0
145958170: 4531ff xor r15d, r15d
145958173: eb10 jmp 0x145958185
145958175: 41ffc7 inc r15d
145958178: 443bbdcc000000 cmp r15d, dword ptr [rbp + 0xcc]
14595817f: 0f84f3f7ffff je 0x145957978
145958185: 440f289d90000000 movaps xmm11, xmmword ptr [rbp + 0x90]
14595818d: 41f6c701 test r15b, 1
145958191: 7405 je 0x145958198
145958193: 440f285dd0 movaps xmm11, xmmword ptr [rbp - 0x30]
145958198: 4489f8 mov eax, r15d
14595819b: 0f57f6 xorps xmm6, xmm6
14595819e: f3480f2af0 cvtsi2ss xmm6, rax
1459581a3: f30f5c7560 subss xmm6, dword ptr [rbp + 0x60]
1459581a8: f30f597550 mulss xmm6, dword ptr [rbp + 0x50]
1459581ad: 440f28cf movaps xmm9, xmm7
1459581b1: f3440f59ce mulss xmm9, xmm6
1459581b6: f3410f59f0 mulss xmm6, xmm8
1459581bb: 450f28e0 movaps xmm12, xmm8
1459581bf: f3450f59e3 mulss xmm12, xmm11
1459581c4: f3440f58a5d0000000 addss xmm12, dword ptr [rbp + 0xd0]
1459581cd: f3450f5ce1 subss xmm12, xmm9
1459581d2: f3440f59df mulss xmm11, xmm7
1459581d7: f3440f589de0000000 addss xmm11, dword ptr [rbp + 0xe0]
1459581e0: f3440f58de addss xmm11, xmm6
1459581e5: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
1459581eb: ffc7 inc edi
1459581ed: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
1459581f3: f3440f10b6340a0000 movss xmm14, dword ptr [rsi + 0xa34]
1459581fc: 4c8bb698090000 mov r14, qword ptr [rsi + 0x998]
145958203: 498d4e10 lea rcx, [r14 + 0x10]
145958207: 410f28cc movaps xmm1, xmm12
14595820b: 410f28d3 movaps xmm2, xmm11
14595820f: e87cedf7ff call 0x1458d6f90
145958214: a801 test al, 1
145958216: 7406 je 0x14595821e
145958218: 440f28e8 movaps xmm13, xmm0
14595821c: eb3c jmp 0x14595825a
14595821e: 49837e68ff cmp qword ptr [r14 + 0x68], -1
145958223: 742c je 0x145958251
145958225: 498d5668 lea rdx, [r14 + 0x68]
145958229: 488d8d10010000 lea rcx, [rbp + 0x110]
145958230: 410f28d4 movaps xmm2, xmm12
145958234: 410f28db movaps xmm3, xmm11
145958238: e8433ff8ff call 0x1458dc180
14595823d: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145958244: 750b jne 0x145958251
145958246: f3440f10ad1c010000 movss xmm13, dword ptr [rbp + 0x11c]
14595824f: eb09 jmp 0x14595825a
145958251: f3450f10aeb8000000 movss xmm13, dword ptr [r14 + 0xb8]
14595825a: 4c8bb698050000 mov r14, qword ptr [rsi + 0x598]
145958261: 4c3bb688050000 cmp r14, qword ptr [rsi + 0x588]
145958268: 750c jne 0x145958276
14595826a: 488d8e88050000 lea rcx, [rsi + 0x588]
145958271: e8ba2a2a00 call 0x145bfad30
145958276: 4c89f0 mov rax, r14
145958279: 48c1e007 shl rax, 7
14595827d: 49ffc6 inc r14
145958280: f30f104540 movss xmm0, dword ptr [rbp + 0x40]
145958285: f3410f58c6 addss xmm0, xmm14
14595828a: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
145958291: 48c7040100000000 mov qword ptr [rcx + rax], 0
145958299: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
1459582a1: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459582a8: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
1459582ad: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
1459582b6: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
1459582be: f30f108d50010000 movss xmm1, dword ptr [rbp + 0x150]
1459582c6: f30f114c0134 movss dword ptr [rcx + rax + 0x34], xmm1
1459582cc: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
1459582d0: f3440f11640140 movss dword ptr [rcx + rax + 0x40], xmm12
1459582d7: f3440f115c0144 movss dword ptr [rcx + rax + 0x44], xmm11
1459582de: f3440f116c0148 movss dword ptr [rcx + rax + 0x48], xmm13
1459582e5: 0f57c9 xorps xmm1, xmm1
1459582e8: f3410f10ce movss xmm1, xmm14
1459582ed: 0f57d2 xorps xmm2, xmm2
1459582f0: f30f10d0 movss xmm2, xmm0
1459582f4: 0fc6ca41 shufps xmm1, xmm2, 0x41
1459582f8: 0f114c014c movups xmmword ptr [rcx + rax + 0x4c], xmm1
1459582fd: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
145958301: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145958309: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
14595830f: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
145958317: 0f57c0 xorps xmm0, xmm0
14595831a: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
14595831f: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
145958328: 4c89b698050000 mov qword ptr [rsi + 0x598], r14
14595832f: 4183fd01 cmp r13d, 1
145958333: 0f843cfeffff je 0x145958175
145958339: bf01000000 mov edi, 1
14595833e: 6690 nop
145958340: 89f8 mov eax, edi
145958342: 450f57ff xorps xmm15, xmm15
145958346: f34c0f2af8 cvtsi2ss xmm15, rax
14595834b: f3440f109d0c010000 movss xmm11, dword ptr [rbp + 0x10c]
145958354: f3450f59df mulss xmm11, xmm15
145958359: f3450f5cda subss xmm11, xmm10
14595835e: 41f6c701 test r15b, 1
145958362: 7408 je 0x14595836c
145958364: 440f571d344d4700 xorps xmm11, xmmword ptr [rip + 0x474d34]
14595836c: 450f28e0 movaps xmm12, xmm8
145958370: f3450f59e3 mulss xmm12, xmm11
145958375: f3440f58a5d0000000 addss xmm12, dword ptr [rbp + 0xd0]
14595837e: f3450f5ce1 subss xmm12, xmm9
145958383: f3440f59df mulss xmm11, xmm7
145958388: f3440f589de0000000 addss xmm11, dword ptr [rbp + 0xe0]
145958391: f3440f58de addss xmm11, xmm6
145958396: 448bb6380a0000 mov r14d, dword ptr [rsi + 0xa38]
14595839d: 41ffc6 inc r14d
1459583a0: 4489b6380a0000 mov dword ptr [rsi + 0xa38], r14d
1459583a7: f3440f10b6340a0000 movss xmm14, dword ptr [rsi + 0xa34]
1459583b0: 4c8ba698090000 mov r12, qword ptr [rsi + 0x998]
1459583b7: 498d4c2410 lea rcx, [r12 + 0x10]
1459583bc: 410f28cc movaps xmm1, xmm12
1459583c0: 410f28d3 movaps xmm2, xmm11
1459583c4: e8c7ebf7ff call 0x1458d6f90
1459583c9: a801 test al, 1
1459583cb: 0f840f010000 je 0x1459584e0
1459583d1: 440f28e8 movaps xmm13, xmm0
1459583d5: 4c8ba698050000 mov r12, qword ptr [rsi + 0x598]
1459583dc: 4c3ba688050000 cmp r12, qword ptr [rsi + 0x588]
1459583e3: 750c jne 0x1459583f1
1459583e5: 488d8e88050000 lea rcx, [rsi + 0x588]
1459583ec: e83f292a00 call 0x145bfad30
1459583f1: f3440f59bdb8000000 mulss xmm15, dword ptr [rbp + 0xb8]
1459583fa: f3440f58bdf0000000 addss xmm15, dword ptr [rbp + 0xf0]
145958403: f3450f58fe addss xmm15, xmm14
145958408: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595840f: 4c89e0 mov rax, r12
145958412: 48c1e007 shl rax, 7
145958416: 48c7040100000000 mov qword ptr [rcx + rax], 0
14595841e: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
145958426: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595842d: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145958432: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14595843b: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145958443: f30f108550010000 movss xmm0, dword ptr [rbp + 0x150]
14595844b: f30f11440134 movss dword ptr [rcx + rax + 0x34], xmm0
145958451: 448974013c mov dword ptr [rcx + rax + 0x3c], r14d
145958456: f3440f11640140 movss dword ptr [rcx + rax + 0x40], xmm12
14595845d: f3440f115c0144 movss dword ptr [rcx + rax + 0x44], xmm11
145958464: f3440f116c0148 movss dword ptr [rcx + rax + 0x48], xmm13
14595846b: 0f57c0 xorps xmm0, xmm0
14595846e: f3410f10c6 movss xmm0, xmm14
145958473: 0f57c9 xorps xmm1, xmm1
145958476: f3410f10cf movss xmm1, xmm15
14595847b: 0fc6c141 shufps xmm0, xmm1, 0x41
14595847f: 0f1144014c movups xmmword ptr [rcx + rax + 0x4c], xmm0
145958484: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
145958488: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145958490: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
145958496: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14595849e: 49ffc4 inc r12
1459584a1: 0f57c0 xorps xmm0, xmm0
1459584a4: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
1459584a9: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
1459584b2: 4c89a698050000 mov qword ptr [rsi + 0x598], r12
1459584b9: 0f843e460000 je 0x14595cafd
1459584bf: ffc7 inc edi
1459584c1: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
1459584c8: c74401643333b33f mov dword ptr [rcx + rax + 0x64], 0x3fb33333
1459584d0: 4139fd cmp r13d, edi
1459584d3: 0f8567feffff jne 0x145958340
1459584d9: e997fcffff jmp 0x145958175
1459584de: 6690 nop
1459584e0: 49837c2468ff cmp qword ptr [r12 + 0x68], -1
1459584e6: 7448 je 0x145958530
1459584e8: 498d542468 lea rdx, [r12 + 0x68]
1459584ed: 488d8d10010000 lea rcx, [rbp + 0x110]
1459584f4: 410f28d4 movaps xmm2, xmm12
1459584f8: 410f28db movaps xmm3, xmm11
1459584fc: e87f3cf8ff call 0x1458dc180
145958501: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145958508: 7526 jne 0x145958530
14595850a: f3440f10ad1c010000 movss xmm13, dword ptr [rbp + 0x11c]
145958513: 4c8ba698050000 mov r12, qword ptr [rsi + 0x598]
14595851a: 4c3ba688050000 cmp r12, qword ptr [rsi + 0x588]
145958521: 0f84befeffff je 0x1459583e5
145958527: e9c5feffff jmp 0x1459583f1
14595852c: 0f1f4000 nop dword ptr [rax]
145958530: f3450f10ac24b8000000 movss xmm13, dword ptr [r12 + 0xb8]
14595853a: 4c8ba698050000 mov r12, qword ptr [rsi + 0x598]
145958541: 4c3ba688050000 cmp r12, qword ptr [rsi + 0x588]
145958548: 0f85a3feffff jne 0x1459583f1
14595854e: e992feffff jmp 0x1459583e5
