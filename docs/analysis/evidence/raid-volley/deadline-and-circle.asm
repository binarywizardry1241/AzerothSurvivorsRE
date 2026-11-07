1459503c4: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
1459503cc: 410f2e4554 ucomiss xmm0, dword ptr [r13 + 0x54]
1459503d1: 0f82ab0f0000 jb 0x145951382
1459503d7: 498d7540 lea rsi, [r13 + 0x40]
1459503db: f3410f10754c movss xmm6, dword ptr [r13 + 0x4c]
1459503e1: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
1459503e7: 450f28f1 movaps xmm14, xmm9
1459503eb: 440f5cf0 subps xmm14, xmm0
1459503ef: f3450f16fe movshdup xmm15, xmm14
1459503f4: 410f28c6 movaps xmm0, xmm14
1459503f8: 410f28cf movaps xmm1, xmm15
1459503fc: e82e9d2a00 call 0x145bfa12f
145950401: 418b4530 mov eax, dword ptr [r13 + 0x30]
145950405: f3450f104534 movss xmm8, dword ptr [r13 + 0x34]
14595040b: 488d0ddec98d01 lea rcx, [rip + 0x18dc9de]
145950412: 48630481 movsxd rax, dword ptr [rcx + rax*4]
145950416: 4801c8 add rax, rcx
145950419: ffe0 jmp rax
14595041b: 440f2ec0 ucomiss xmm8, xmm0
14595041f: 0f93c0 setae al
145950422: 418b4d10 mov ecx, dword ptr [r13 + 0x10]
145950426: 488d15d3c98d01 lea rdx, [rip + 0x18dc9d3]
14595042d: 48630c8a movsxd rcx, dword ptr [rdx + rcx*4]
145950431: 4801d1 add rcx, rdx
145950434: ffe1 jmp rcx
