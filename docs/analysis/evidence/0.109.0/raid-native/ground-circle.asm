145957bc0: 8b4104 mov eax, dword ptr [rcx + 4]
145957bc3: f30f104108 movss xmm0, dword ptr [rcx + 8]
145957bc8: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145957bce: f30f10490c movss xmm1, dword ptr [rcx + 0xc]
145957bd3: f30f118564010000 movss dword ptr [rbp + 0x164], xmm0
145957bdb: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
145957be5: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145957bef: 488d8d10010000 lea rcx, [rbp + 0x110]
145957bf6: 48894c2448 mov qword ptr [rsp + 0x48], rcx
145957bfb: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145957c02: 89442438 mov dword ptr [rsp + 0x38], eax
145957c06: f30f114c2430 movss dword ptr [rsp + 0x30], xmm1
145957c0c: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
145957c13: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145957c19: c744242800000000 mov dword ptr [rsp + 0x28], 0
145957c21: 4c8d8560010000 lea r8, [rbp + 0x160]
145957c28: 4889f1 mov rcx, rsi
145957c2b: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145957c32: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
145957c39: e93f290000 jmp 0x14595a57d
