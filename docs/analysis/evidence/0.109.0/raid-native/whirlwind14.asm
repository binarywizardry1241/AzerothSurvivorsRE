145958553: 448b31 mov r14d, dword ptr [rcx]
145958556: f30f107104 movss xmm6, dword ptr [rcx + 4]
14595855b: f3440f59710c mulss xmm14, dword ptr [rcx + 0xc]
145958561: f30f101d374d4400 movss xmm3, dword ptr [rip + 0x444d37]
145958569: f3440f58fb addss xmm15, xmm3
14595856e: f3440f587908 addss xmm15, dword ptr [rcx + 8]
145958574: 4889f1 mov rcx, rsi
145958577: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595857e: 4889fa mov rdx, rdi
145958581: 4589f0 mov r8d, r14d
145958584: e867f2ffff call 0x1459577f0
145958589: f30f11b564010000 movss dword ptr [rbp + 0x164], xmm6
145958591: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14595859b: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
1459585a4: f30f1005f84c4400 movss xmm0, dword ptr [rip + 0x444cf8]
1459585ac: 0f138518010000 movlps qword ptr [rbp + 0x118], xmm0
1459585b3: c7851001000003000000 mov dword ptr [rbp + 0x110], 3
1459585bd: 488d8510010000 lea rax, [rbp + 0x110]
1459585c4: 4889442448 mov qword ptr [rsp + 0x48], rax
1459585c9: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
1459585d0: 4489742438 mov dword ptr [rsp + 0x38], r14d
1459585d5: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
1459585dc: c74424300000803f mov dword ptr [rsp + 0x30], 0x3f800000
1459585e4: c744242800000000 mov dword ptr [rsp + 0x28], 0
1459585ec: 4c8d8560010000 lea r8, [rbp + 0x160]
1459585f3: 4889f1 mov rcx, rsi
1459585f6: 4889fa mov rdx, rdi
1459585f9: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
145958600: e8dbefffff call 0x1459575e0
145958605: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595860c: 4839d0 cmp rax, rdx
14595860f: 0f83b6450000 jae 0x14595cbcb
145958615: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595861c: 48c1e007 shl rax, 7
145958620: c644017c01 mov byte ptr [rcx + rax + 0x7c], 1
145958625: f30f1015734c4400 movss xmm2, dword ptr [rip + 0x444c73]
14595862d: 4889f1 mov rcx, rsi
145958630: 488bbdf0000000 mov rdi, qword ptr [rbp + 0xf0]
145958637: 4889fa mov rdx, rdi
14595863a: 4531c9 xor r9d, r9d
14595863d: e8deecffff call 0x145957320
145958642: 483bbe68050000 cmp rdi, qword ptr [rsi + 0x568]
145958649: 0f8329f3ffff jae 0x145957978
14595864f: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
145958656: f3440f11bc18c8010000 movss dword ptr [rax + rbx + 0x1c8], xmm15
145958660: e913f3ffff jmp 0x145957978
