145952759: 8b19 mov ebx, dword ptr [rcx]
14595275b: f30f107904 movss xmm7, dword ptr [rcx + 4]
145952760: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
145952766: f30f10352ae04700 movss xmm6, dword ptr [rip + 0x47e02a]
14595276e: 4889f1 mov rcx, rsi
145952771: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145952778: 0f28d6 movaps xmm2, xmm6
14595277b: 4531c9 xor r9d, r9d
14595277e: e8addeffff call 0x145950630
145952783: 4889f1 mov rcx, rsi
145952786: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595278d: 4889fa mov rdx, rdi
145952790: 4189d8 mov r8d, ebx
145952793: 0f28de movaps xmm3, xmm6
145952796: e865e3ffff call 0x145950b00
14595279b: f30f11bd64010000 movss dword ptr [rbp + 0x164], xmm7
1459527a3: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
1459527ad: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
1459527b7: 488d8510010000 lea rax, [rbp + 0x110]
1459527be: 4889442448 mov qword ptr [rsp + 0x48], rax
1459527c3: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
1459527ca: 895c2438 mov dword ptr [rsp + 0x38], ebx
1459527ce: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
1459527d5: c74424306666a63f mov dword ptr [rsp + 0x30], 0x3fa66666
1459527dd: c744242800000000 mov dword ptr [rsp + 0x28], 0
1459527e5: 4c8d8560010000 lea r8, [rbp + 0x160]
1459527ec: 4889f1 mov rcx, rsi
1459527ef: 4889fa mov rdx, rdi
1459527f2: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
1459527f9: e8f2e0ffff call 0x1459508f0
1459527fe: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145952805: 4839d0 cmp rax, rdx
145952808: 0f82f0290000 jb 0x1459551fe
14595280e: 4c8d05ebdf8901 lea r8, [rip + 0x189dfeb]
145952815: 4889c1 mov rcx, rax
145952818: e876104400 call 0x145d93893
14595281d: 0f0b ud2
