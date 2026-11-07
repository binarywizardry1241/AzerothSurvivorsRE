14597b97b: 4c8d7010 lea r14, [rax + 0x10]
14597b97f: 488b38 mov rdi, qword ptr [rax]
14597b982: 448b6808 mov r13d, dword ptr [rax + 8]
14597b986: f3440f10580c movss xmm11, dword ptr [rax + 0xc]
14597b98c: 410f2efb ucomiss xmm7, xmm11
14597b990: 0f868a000000 jbe 0x14597ba20
14597b996: f3450f59da mulss xmm11, xmm10
14597b99b: f34d0f2ccb cvttss2si r9, xmm11
14597b9a0: 440f2edf ucomiss xmm11, xmm7
14597b9a4: b800000000 mov eax, 0
14597b9a9: 440f42c8 cmovb r9d, eax
14597b9ad: 450f2ed9 ucomiss xmm11, xmm9
14597b9b1: b8ffffffff mov eax, 0xffffffff
14597b9b6: 440f47c8 cmova r9d, eax
14597b9ba: 498b8760040000 mov rax, qword ptr [r15 + 0x460]
14597b9c1: 48898508020000 mov qword ptr [rbp + 0x208], rax
14597b9c8: c7850002000000000000 mov dword ptr [rbp + 0x200], 0
14597b9d2: 488d8500020000 lea rax, [rbp + 0x200]
14597b9d9: 4889442420 mov qword ptr [rsp + 0x20], rax
14597b9de: 488d8d60020000 lea rcx, [rbp + 0x260]
14597b9e5: 4889fa mov rdx, rdi
14597b9e8: 4589e8 mov r8d, r13d
14597b9eb: e83068f4ff call 0x1458c2220
14597b9f0: 90 nop 
14597b9f1: 498bb728060000 mov rsi, qword ptr [r15 + 0x628]
14597b9f8: 493bb718060000 cmp rsi, qword ptr [r15 + 0x618]
14597b9ff: 0f853bffffff jne 0x14597b940
14597ba05: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14597ba0c: e8fff32700 call 0x145bfae10
14597ba11: 90 nop 
14597ba12: e929ffffff jmp 0x14597b940
14597ba17: 660f1f840000000000 nop word ptr [rax + rax]
