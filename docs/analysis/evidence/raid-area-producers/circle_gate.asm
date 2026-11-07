1459496c9: 41807d7d00 cmp byte ptr [r13 + 0x7d], 0
1459496ce: 0f85be0f0000 jne 0x14594a692
1459496d4: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
1459496dc: 410f2e4554 ucomiss xmm0, dword ptr [r13 + 0x54]
1459496e1: 0f82ab0f0000 jb 0x14594a692
1459496e7: 498d7540 lea rsi, [r13 + 0x40]
1459496eb: f3410f10754c movss xmm6, dword ptr [r13 + 0x4c]
1459496f1: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
1459496f7: 450f28f1 movaps xmm14, xmm9
1459496fb: 440f5cf0 subps xmm14, xmm0
1459496ff: f3450f16fe movshdup xmm15, xmm14
145949704: 410f28c6 movaps xmm0, xmm14
145949708: 410f28cf movaps xmm1, xmm15
14594970c: e884922a00 call 0x145bf2995
145949711: 418b4530 mov eax, dword ptr [r13 + 0x30]
145949715: f3450f104534 movss xmm8, dword ptr [r13 + 0x34]
14594971b: 488d0dbe938a01 lea rcx, [rip + 0x18a93be]
145949722: 48630481 movsxd rax, dword ptr [rcx + rax*4]
145949726: 4801c8 add rax, rcx
145949729: ffe0 jmp rax
14594972b: 440f2ec0 ucomiss xmm8, xmm0
14594972f: 0f93c0 setae al
145949732: 418b4d10 mov ecx, dword ptr [r13 + 0x10]
145949736: 488d15b3938a01 lea rdx, [rip + 0x18a93b3]
14594973d: 48630c8a movsxd rcx, dword ptr [rdx + rcx*4]
145949741: 4801d1 add rcx, rdx
145949744: ffe1 jmp rcx
