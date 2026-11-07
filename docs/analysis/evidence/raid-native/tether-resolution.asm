1459514b4: f3450f107514 movss xmm14, dword ptr [r13 + 0x14]
1459514ba: f3450f104518 movss xmm8, dword ptr [r13 + 0x18]
1459514c0: 410f28c1 movaps xmm0, xmm9
1459514c4: f3410f5c4540 subss xmm0, dword ptr [r13 + 0x40]
1459514ca: f3410f10751c movss xmm6, dword ptr [r13 + 0x1c]
1459514d0: 410f28ca movaps xmm1, xmm10
1459514d4: f3410f5c4d44 subss xmm1, dword ptr [r13 + 0x44]
1459514da: e8508c2a00 call 0x145bfa12f
1459514df: 410f2ec6 ucomiss xmm0, xmm14
1459514e3: 0f87ad010000 ja 0x145951696
1459514e9: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
1459514f1: 410f2ec8 ucomiss xmm1, xmm8
1459514f5: 0f839b010000 jae 0x145951696
1459514fb: f3410f104568 movss xmm0, dword ptr [r13 + 0x68]
145951501: 0f2ec8 ucomiss xmm1, xmm0
145951504: 0f82fbdeffff jb 0x14594f405
14595150a: f30f58c7 addss xmm0, xmm7
14595150e: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
145951514: f3450f107560 movss xmm14, dword ptr [r13 + 0x60]
14595151a: 498b4520 mov rax, qword ptr [r13 + 0x20]
14595151e: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
145951525: 418b7d5c mov edi, dword ptr [r13 + 0x5c]
145951529: 488b7560 mov rsi, qword ptr [rbp + 0x60]
14595152d: 483b7550 cmp rsi, qword ptr [rbp + 0x50]
145951531: 0f8581000000 jne 0x1459515b8
145951537: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
14595153e: 48898568020000 mov qword ptr [rbp + 0x268], rax
145951545: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
14595154c: 48898560020000 mov qword ptr [rbp + 0x260], rax
145951553: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
14595155a: 48898558020000 mov qword ptr [rbp + 0x258], rax
145951561: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
145951568: 48898550020000 mov qword ptr [rbp + 0x250], rax
14595156f: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
145951576: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
14595157d: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145951584: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14595158b: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145951592: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145951599: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
1459515a0: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
1459515a7: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
1459515ae: 488d4d50 lea rcx, [rbp + 0x50]
1459515b2: e839992a00 call 0x145bfaef0
1459515b7: 90 nop
1459515b8: 488b4558 mov rax, qword ptr [rbp + 0x58]
1459515bc: 4889f1 mov rcx, rsi
1459515bf: 48c1e104 shl rcx, 4
1459515c3: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
1459515ca: 48891408 mov qword ptr [rax + rcx], rdx
1459515ce: f30f11740808 movss dword ptr [rax + rcx + 8], xmm6
1459515d4: 897c080c mov dword ptr [rax + rcx + 0xc], edi
1459515d8: 48ffc6 inc rsi
1459515db: 48897560 mov qword ptr [rbp + 0x60], rsi
1459515df: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
1459515e7: f3410f58c6 addss xmm0, xmm14
1459515ec: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
1459515f4: e90cdeffff jmp 0x14594f405
