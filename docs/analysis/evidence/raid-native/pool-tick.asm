1459513ac: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
1459513b4: 410f2e4d14 ucomiss xmm1, dword ptr [r13 + 0x14]
1459513b9: 0f8374030000 jae 0x145951733
1459513bf: f3410f104568 movss xmm0, dword ptr [r13 + 0x68]
1459513c5: 0f2ec8 ucomiss xmm1, xmm0
1459513c8: 0f8237e0ffff jb 0x14594f405
1459513ce: f3410f104d18 movss xmm1, dword ptr [r13 + 0x18]
1459513d4: f30f118d70020000 movss dword ptr [rbp + 0x270], xmm1
1459513dc: f30f5805bcbe4400 addss xmm0, dword ptr [rip + 0x44bebc]
1459513e4: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
1459513ea: f3450f10454c movss xmm8, dword ptr [r13 + 0x4c]
1459513f0: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
1459513f6: 450f28f1 movaps xmm14, xmm9
1459513fa: 440f5cf0 subps xmm14, xmm0
1459513fe: f3410f16f6 movshdup xmm6, xmm14
145951403: 410f28c6 movaps xmm0, xmm14
145951407: 0f28ce movaps xmm1, xmm6
14595140a: e8208d2a00 call 0x145bfa12f
14595140f: 418b4530 mov eax, dword ptr [r13 + 0x30]
145951413: f3450f107d34 movss xmm15, dword ptr [r13 + 0x34]
145951419: 488d0d0cba8d01 lea rcx, [rip + 0x18dba0c]
145951420: 48630481 movsxd rax, dword ptr [rcx + rax*4]
145951424: 4801c8 add rax, rcx
145951427: ffe0 jmp rax
145951429: 440f2ef8 ucomiss xmm15, xmm0
14595142d: 0f82d2dfffff jb 0x14594f405
145951433: e987050000 jmp 0x1459519bf
