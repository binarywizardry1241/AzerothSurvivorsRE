14593874c: 4889f1 mov rcx, rsi
14593874f: 0f28ce movaps xmm1, xmm6
145938752: e8b95e0100 call 0x14594e610
145938757: f3440f1096340a0000 movss xmm10, dword ptr [rsi + 0xa34]
145938760: 4c8bbec8050000 mov r15, qword ptr [rsi + 0x5c8]
145938767: 4d85ff test r15, r15
14593876a: 0f8458010000 je 0x1459388c8
145938770: 4c8dad94020000 lea r13, [rbp + 0x294]
145938777: 31ff xor edi, edi
145938779: 488b9de8030000 mov rbx, qword ptr [rbp + 0x3e8]
145938780: eb1a jmp 0x14593879c
145938782: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145938790: 48ffc7 inc rdi
145938793: 4c39ff cmp rdi, r15
145938796: 0f8317010000 jae 0x1459388b3
14593879c: 488b85e8030000 mov rax, qword ptr [rbp + 0x3e8]
1459387a3: 488b88c0050000 mov rcx, qword ptr [rax + 0x5c0]
1459387aa: 4889f8 mov rax, rdi
1459387ad: 48c1e005 shl rax, 5
1459387b1: 440f2e540108 ucomiss xmm10, dword ptr [rcx + rax + 8]
1459387b7: 72d7 jb 0x145938790
1459387b9: 4c39ff cmp rdi, r15
1459387bc: 0f8313670000 jae 0x14593eed5
1459387c2: 4801c1 add rcx, rax
1459387c5: 4c8b31 mov r14, qword ptr [rcx]
1459387c8: 448b610c mov r12d, dword ptr [rcx + 0xc]
1459387cc: 8b4118 mov eax, dword ptr [rcx + 0x18]
1459387cf: 894578 mov dword ptr [rbp + 0x78], eax
1459387d2: 488b4110 mov rax, qword ptr [rcx + 0x10]
1459387d6: 48894570 mov qword ptr [rbp + 0x70], rax
1459387da: 488d5120 lea rdx, [rcx + 0x20]
1459387de: 4989f8 mov r8, rdi
1459387e1: 49f7d0 not r8
1459387e4: 4d01f8 add r8, r15
1459387e7: 49c1e005 shl r8, 5
1459387eb: e8fd182c00 call 0x145bfa0ed
1459387f0: 49ffcf dec r15
1459387f3: 4c89bbc8050000 mov qword ptr [rbx + 0x5c8], r15
1459387fa: 8b4578 mov eax, dword ptr [rbp + 0x78]
1459387fd: 41894508 mov dword ptr [r13 + 8], eax
145938801: 488b4570 mov rax, qword ptr [rbp + 0x70]
145938805: 49894500 mov qword ptr [r13], rax
145938809: c7859002000001000000 mov dword ptr [rbp + 0x290], 1
145938813: c7854003000000000000 mov dword ptr [rbp + 0x340], 0
14593881d: 488d8540030000 lea rax, [rbp + 0x340]
145938824: 4889442430 mov qword ptr [rsp + 0x30], rax
145938829: 488d8590020000 lea rax, [rbp + 0x290]
145938830: 4889442428 mov qword ptr [rsp + 0x28], rax
145938835: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14593883e: 41b908000000 mov r9d, 8
145938844: 488d4d70 lea rcx, [rbp + 0x70]
145938848: 4c89f2 mov rdx, r14
14593884b: 4589e0 mov r8d, r12d
14593884e: e81d4ff9ff call 0x1458cd770
145938853: 488bb328060000 mov rsi, qword ptr [rbx + 0x628]
14593885a: 483bb318060000 cmp rsi, qword ptr [rbx + 0x618]
145938861: 750d jne 0x145938870
145938863: 488b8db0030000 mov rcx, qword ptr [rbp + 0x3b0]
14593886a: e8a1252c00 call 0x145bfae10
14593886f: 90 nop
145938870: 488b95e8030000 mov rdx, qword ptr [rbp + 0x3e8]
145938877: 488b8220060000 mov rax, qword ptr [rdx + 0x620]
14593887e: 4889f1 mov rcx, rsi
145938881: 48c1e105 shl rcx, 5
145938885: 0f104570 movups xmm0, xmmword ptr [rbp + 0x70]
145938889: 0f108d80000000 movups xmm1, xmmword ptr [rbp + 0x80]
145938890: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145938895: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145938899: 48ffc6 inc rsi
14593889c: 4889b228060000 mov qword ptr [rdx + 0x628], rsi
1459388a3: 4c8bbac8050000 mov r15, qword ptr [rdx + 0x5c8]
1459388aa: 4c39ff cmp rdi, r15
1459388ad: 0f82e9feffff jb 0x14593879c
1459388b3: 488b8560020000 mov rax, qword ptr [rbp + 0x260]
1459388ba: f3440f1010 movss xmm10, dword ptr [rax]
1459388bf: 4c8bade8030000 mov r13, qword ptr [rbp + 0x3e8]
1459388c6: eb03 jmp 0x1459388cb
1459388c8: 4989f5 mov r13, rsi
