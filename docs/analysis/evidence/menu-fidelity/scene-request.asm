140811850: push      rsi
140811851: push      rdi
140811852: sub       rsp, 0x28
140811856: mov       eax, dword ptr [rip + 0x78329ac]
14081185c: test      eax, eax
14081185e: jne       0x1408118d5
140811860: mov       dl, 1
140811862: xor       eax, eax
140811864: lock cmpxchg byte ptr [rip + 0x783296c], dl
14081186c: jne       0x1408118fc
140811872: mov       rsi, qword ptr [rip + 0x787916f]
140811879: mov       rax, qword ptr [rsi]
14081187c: shl       rax, 1
14081187f: test      rax, rax
140811882: jne       0x140811916
140811888: movzx     eax, byte ptr [rip + 0x783294a]
14081188f: mov       rax, qword ptr [rcx + 0x20]
140811893: mov       qword ptr [rip + 0x7832962], rax
14081189a: movups    xmm0, xmmword ptr [rcx]
14081189d: movups    xmm1, xmmword ptr [rcx + 0x10]
1408118a1: movups    xmmword ptr [rip + 0x7832944], xmm1
1408118a8: movups    xmmword ptr [rip + 0x783292d], xmm0
1408118af: mov       rax, qword ptr [rsi]
1408118b2: shl       rax, 1
1408118b5: test      rax, rax
1408118b8: jne       0x140811964
1408118be: xor       eax, eax
1408118c0: xchg      byte ptr [rip + 0x7832912], al
1408118c6: cmp       al, 2
1408118c8: je        0x140811952
1408118ce: add       rsp, 0x28
1408118d2: pop       rdi
1408118d3: pop       rsi
1408118d4: ret
1408118d5: lea       rax, [rip + 0x78328fc]
1408118dc: mov       rsi, rcx
1408118df: mov       rcx, rax
1408118e2: call      0x145c273e2
1408118e7: mov       rcx, rsi
1408118ea: mov       dl, 1
1408118ec: xor       eax, eax
1408118ee: lock cmpxchg byte ptr [rip + 0x78328e2], dl
1408118f6: je        0x140811872
1408118fc: lea       rax, [rip + 0x78328d5]
140811903: mov       rsi, rcx
140811906: mov       rcx, rax
140811909: call      0x145d97960
14081190e: mov       rcx, rsi
140811911: jmp       0x140811872
140811916: mov       rdi, rcx
140811919: call      0x145d986f0
14081191e: movzx     ecx, byte ptr [rip + 0x78328b4]
140811925: mov       rcx, qword ptr [rdi + 0x20]
140811929: mov       qword ptr [rip + 0x78328cc], rcx
140811930: movups    xmm0, xmmword ptr [rdi]
140811933: movups    xmm1, xmmword ptr [rdi + 0x10]
140811937: movups    xmmword ptr [rip + 0x78328ae], xmm1
14081193e: movups    xmmword ptr [rip + 0x7832897], xmm0
140811945: test      al, al
140811947: jne       0x1408118af
14081194d: jmp       0x1408118be
140811952: lea       rcx, [rip + 0x783287f]
140811959: add       rsp, 0x28
14081195d: pop       rdi
14081195e: pop       rsi
14081195f: jmp       0x145d97a20
140811964: call      0x145d986f0
140811969: test      al, al
14081196b: jne       0x1408118be
140811971: mov       byte ptr [rip + 0x7832861], 1
140811978: jmp       0x1408118be
