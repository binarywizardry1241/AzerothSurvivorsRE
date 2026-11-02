1401184f0: push      r15
1401184f2: push      r14
1401184f4: push      r13
1401184f6: push      r12
1401184f8: push      rsi
1401184f9: push      rdi
1401184fa: push      rbp
1401184fb: push      rbx
1401184fc: sub       rsp, 0x68
140118500: mov       rbx, qword ptr [rdx]
140118503: mov       r14, qword ptr [rdx + 8]
140118507: mov       ecx, dword ptr [rdx + 0x14]
14011850a: mov       rax, qword ptr [r8]
14011850d: mov       qword ptr [rsp + 0x40], rax
140118512: mov       rax, qword ptr [r8 + 0x10]
140118516: mov       qword ptr [rsp + 0x58], rax
14011851b: mov       eax, dword ptr [r8 + 0x1c]
14011851f: mov       dword ptr [rsp + 0x4c], eax
140118523: mov       r12, qword ptr [rbx + 0xf8]
14011852a: mov       rax, qword ptr [rbx + 0x100]
140118531: lea       r15, [r12 + rax*4]
140118535: mov       dword ptr [rsp + 0x3c], ecx
140118539: mov       eax, ecx
14011853b: sub       eax, dword ptr [rdx + 0x10]
14011853e: cmp       eax, 0xc233b000
140118543: mov       r9d, 0xc233b000
140118549: cmovb     r9d, eax
14011854d: cmp       byte ptr [rbx + 0x108], 0
140118554: mov       dword ptr [rsp + 0x38], r9d
140118559: je        0x140118784
14011855f: xor       eax, eax
140118561: xor       ebp, ebp
140118563: xor       r13d, r13d
140118566: mov       qword ptr [rsp + 0x28], 0
14011856f: mov       qword ptr [rsp + 0x30], 0
140118578: jmp       0x140118598
14011857a: nop       word ptr [rax + rax]
140118580: mov       rcx, qword ptr [rsp + 0x58]
140118585: mov       edx, dword ptr [rsp + 0x4c]
140118589: mov       dword ptr [rcx], edx
14011858b: mov       rcx, qword ptr [rsp + 0x40]
140118590: mov       qword ptr [rcx + 0x58], rsi
140118594: mov       qword ptr [rcx + 0x60], rdi
140118598: mov       edi, dword ptr [rsp + 0x3c]
14011859c: jmp       0x1401185d4
14011859e: nop
1401185a0: mov       qword ptr [rsp + 0x28], 0
1401185a9: mov       rdx, qword ptr [rbx + 0x120]
1401185b0: call      0x144e4f270
1401185b5: mov       rbp, qword ptr [rsi]
1401185b8: xor       r13d, r13d
1401185bb: mov       r9d, dword ptr [rsp + 0x38]
1401185c0: mov       ecx, r13d
1401185c3: inc       r13d
1401185c6: mov       edx, edi
1401185c8: sub       edx, dword ptr [rax + rcx*4]
1401185cb: cmp       edx, r9d
1401185ce: jb        0x140118710
1401185d4: cmp       r13d, ebp
1401185d7: jne       0x1401185c0
1401185d9: cmp       r12, r15
1401185dc: je        0x1401186f0
1401185e2: mov       ecx, dword ptr [r12]
1401185e6: add       r12, 4
1401185ea: mov       rdx, qword ptr [r14 + 0x1a8]
1401185f1: lea       r8, [rcx + rcx*8]
1401185f5: cmp       qword ptr [rdx + r8*8 + 0x10], 0
1401185fb: je        0x140118620
1401185fd: lea       rcx, [rdx + r8*8]
140118601: lea       rsi, [rdx + r8*8]
140118605: add       rsi, 0x10
140118609: mov       rdx, qword ptr [rbx + 0x110]
140118610: mov       rax, qword ptr [rcx + 0x40]
140118614: cmp       rdx, rax
140118617: jae       0x1401186a0
14011861d: jmp       0x14011865c
14011861f: nop
140118620: cmp       r12, r15
140118623: je        0x1401186f0
140118629: mov       edx, dword ptr [r12]
14011862d: add       r12, 4
140118631: mov       rcx, qword ptr [r14 + 0x1a8]
140118638: lea       rdx, [rdx + rdx*8]
14011863c: cmp       qword ptr [rcx + rdx*8 + 0x10], 0
140118642: je        0x140118620
140118644: lea       rcx, [rcx + rdx*8]
140118648: lea       rsi, [rcx + 0x10]
14011864c: mov       rdx, qword ptr [rbx + 0x110]
140118653: mov       rax, qword ptr [rcx + 0x40]
140118657: cmp       rdx, rax
14011865a: jae       0x1401186a0
14011865c: mov       r8, qword ptr [rcx + 0x38]
140118660: mov       rdx, qword ptr [r8 + rdx*8]
140118664: test      rdx, rdx
140118667: je        0x1401186a0
140118669: mov       r8, qword ptr [rcx + 0x18]
14011866d: not       rdx
140118670: lea       rdx, [rdx + rdx*2]
140118674: shl       rdx, 4
140118678: mov       rdx, qword ptr [r8 + rdx + 0x10]
14011867d: mov       qword ptr [rsp + 0x30], rdx
140118682: mov       rdx, qword ptr [rbx + 0x118]
140118689: cmp       rdx, rax
14011868c: jae       0x1401185a0
140118692: jmp       0x1401186b9
140118694: nop       word ptr cs:[rax + rax]
1401186a0: mov       qword ptr [rsp + 0x30], 0
1401186a9: mov       rdx, qword ptr [rbx + 0x118]
1401186b0: cmp       rdx, rax
1401186b3: jae       0x1401185a0
1401186b9: mov       rax, qword ptr [rcx + 0x38]
1401186bd: mov       rax, qword ptr [rax + rdx*8]
1401186c1: test      rax, rax
1401186c4: je        0x1401185a0
1401186ca: mov       rdx, qword ptr [rcx + 0x18]
1401186ce: not       rax
1401186d1: lea       rax, [rax + rax*2]
1401186d5: shl       rax, 4
1401186d9: mov       rax, qword ptr [rdx + rax + 0x10]
1401186de: mov       qword ptr [rsp + 0x28], rax
1401186e3: jmp       0x1401185a9
1401186e8: nop       dword ptr [rax + rax]
1401186f0: mov       r12, r15
1401186f3: mov       r13d, ebp
1401186f6: xor       edx, edx
1401186f8: test      rdx, rdx
1401186fb: jne       0x14011872a
1401186fd: jmp       0x1401189ca
140118702: nop       word ptr cs:[rax + rax]
140118710: mov       rdx, qword ptr [rsp + 0x30]
140118715: add       rdx, rcx
140118718: shl       rcx, 4
14011871c: add       rcx, qword ptr [rsp + 0x28]
140118721: test      rdx, rdx
140118724: je        0x1401189ca
14011872a: cmp       byte ptr [rdx], 2
14011872d: je        0x140118598
140118733: mov       rsi, qword ptr [rcx]
140118736: mov       rdi, qword ptr [rcx + 8]
14011873a: mov       rcx, qword ptr [rsp + 0x40]
14011873f: mov       rcx, qword ptr [rcx + 0x58]
140118743: test      rcx, rcx
140118746: je        0x140118580
14011874c: mov       rdx, qword ptr [rsp + 0x40]
140118751: cmp       qword ptr [rdx + 0x60], rdi
140118755: jne       0x140118580
14011875b: mov       rdx, rsi
14011875e: mov       r8, rdi
140118761: mov       qword ptr [rsp + 0x50], rax
140118766: call      0x145bfa0e1
14011876b: mov       r9d, dword ptr [rsp + 0x38]
140118770: mov       ecx, eax
140118772: mov       rax, qword ptr [rsp + 0x50]
140118777: test      ecx, ecx
140118779: jne       0x140118580
14011877f: jmp       0x140118598
140118784: xor       eax, eax
140118786: mov       esi, 8
14011878b: xor       ebp, ebp
14011878d: xor       r13d, r13d
140118790: mov       qword ptr [rsp + 0x28], 0
140118799: mov       qword ptr [rsp + 0x30], 0
1401187a2: jmp       0x1401187c8
1401187a4: nop       word ptr cs:[rax + rax]
1401187b0: mov       rcx, qword ptr [rsp + 0x58]
1401187b5: mov       edx, dword ptr [rsp + 0x4c]
1401187b9: mov       dword ptr [rcx], edx
1401187bb: mov       rcx, qword ptr [rsp + 0x40]
1401187c0: mov       qword ptr [rcx + 0x58], r8
1401187c4: mov       qword ptr [rcx + 0x60], rdi
1401187c8: mov       r8d, dword ptr [rsp + 0x3c]
1401187cd: jmp       0x140118819
1401187cf: nop
1401187d0: mov       qword ptr [rsp + 0x28], 0
1401187d9: mov       rdx, qword ptr [rbx + 0x120]
1401187e0: call      0x144e4f270
1401187e5: mov       rsi, qword ptr [rdi + 0x50]
1401187e9: mov       rbp, qword ptr [r13]
1401187ed: xor       r13d, r13d
1401187f0: mov       r8d, dword ptr [rsp + 0x3c]
1401187f5: mov       r9d, dword ptr [rsp + 0x38]
1401187fa: mov       ecx, r13d
1401187fd: shl       rcx, 4
140118801: inc       r13d
140118804: mov       ecx, dword ptr [rsi + rcx + 8]
140118808: not       ecx
14011880a: mov       edx, r8d
14011880d: sub       edx, dword ptr [rax + rcx*4]
140118810: cmp       edx, r9d
140118813: jb        0x140118950
140118819: cmp       r13d, ebp
14011881c: jne       0x1401187fa
14011881e: cmp       r12, r15
140118821: je        0x140118940
140118827: mov       edx, dword ptr [r12]
14011882b: add       r12, 4
14011882f: mov       rcx, qword ptr [r14 + 0x108]
140118836: lea       rdx, [rdx + rdx*4]
14011883a: shl       rdx, 5
14011883e: cmp       qword ptr [rcx + rdx + 0x58], 0
140118844: je        0x140118860
140118846: lea       rdi, [rcx + rdx]
14011884a: lea       r13, [rcx + rdx]
14011884e: add       r13, 0x58
140118852: jmp       0x14011888f
140118854: nop       word ptr cs:[rax + rax]
140118860: cmp       r12, r15
140118863: je        0x140118940
140118869: mov       ecx, dword ptr [r12]
14011886d: add       r12, 4
140118871: mov       rdi, qword ptr [r14 + 0x108]
140118878: lea       rcx, [rcx + rcx*4]
14011887c: shl       rcx, 5
140118880: cmp       qword ptr [rdi + rcx + 0x58], 0
140118886: je        0x140118860
140118888: add       rdi, rcx
14011888b: lea       r13, [rdi + 0x58]
14011888f: mov       eax, dword ptr [rdi + 0x94]
140118895: mov       r8, qword ptr [r14 + 0x1a8]
14011889c: lea       rax, [rax + rax*8]
1401188a0: lea       rcx, [r8 + rax*8]
1401188a4: mov       rdx, qword ptr [rbx + 0x110]
1401188ab: mov       rax, qword ptr [r8 + rax*8 + 0x40]
1401188b0: cmp       rdx, rax
1401188b3: jae       0x1401188f0
1401188b5: mov       r8, qword ptr [rcx + 0x38]
1401188b9: mov       rdx, qword ptr [r8 + rdx*8]
1401188bd: test      rdx, rdx
1401188c0: je        0x1401188f0
1401188c2: mov       r8, qword ptr [rcx + 0x18]
1401188c6: not       rdx
1401188c9: lea       rdx, [rdx + rdx*2]
1401188cd: shl       rdx, 4
1401188d1: mov       rdx, qword ptr [r8 + rdx + 0x10]
1401188d6: mov       qword ptr [rsp + 0x30], rdx
1401188db: mov       rdx, qword ptr [rbx + 0x118]
1401188e2: cmp       rdx, rax
1401188e5: jae       0x1401187d0
1401188eb: jmp       0x140118909
1401188ed: nop       dword ptr [rax]
1401188f0: mov       qword ptr [rsp + 0x30], 0
1401188f9: mov       rdx, qword ptr [rbx + 0x118]
140118900: cmp       rdx, rax
140118903: jae       0x1401187d0
140118909: mov       rax, qword ptr [rcx + 0x38]
14011890d: mov       rax, qword ptr [rax + rdx*8]
140118911: test      rax, rax
140118914: je        0x1401187d0
14011891a: mov       rdx, qword ptr [rcx + 0x18]
14011891e: not       rax
140118921: lea       rax, [rax + rax*2]
140118925: shl       rax, 4
140118929: mov       rax, qword ptr [rdx + rax + 0x10]
14011892e: mov       qword ptr [rsp + 0x28], rax
140118933: jmp       0x1401187d9
140118938: nop       dword ptr [rax + rax]
140118940: mov       r12, r15
140118943: mov       r13d, ebp
140118946: xor       edx, edx
140118948: test      rdx, rdx
14011894b: jne       0x140118966
14011894d: jmp       0x1401189ca
14011894f: nop
140118950: mov       rdx, qword ptr [rsp + 0x30]
140118955: add       rdx, rcx
140118958: shl       rcx, 4
14011895c: add       rcx, qword ptr [rsp + 0x28]
140118961: test      rdx, rdx
140118964: je        0x1401189ca
140118966: cmp       byte ptr [rdx], 2
140118969: je        0x1401187c8
14011896f: mov       r8, qword ptr [rcx]
140118972: mov       rdi, qword ptr [rcx + 8]
140118976: mov       rcx, qword ptr [rsp + 0x40]
14011897b: mov       rcx, qword ptr [rcx + 0x58]
14011897f: test      rcx, rcx
140118982: je        0x1401187b0
140118988: mov       rdx, qword ptr [rsp + 0x40]
14011898d: cmp       qword ptr [rdx + 0x60], rdi
140118991: jne       0x1401187b0
140118997: mov       rdx, r8
14011899a: mov       qword ptr [rsp + 0x60], r8
14011899f: mov       r8, rdi
1401189a2: mov       qword ptr [rsp + 0x50], rax
1401189a7: call      0x145bfa0e1
1401189ac: mov       r8, qword ptr [rsp + 0x60]
1401189b1: mov       r9d, dword ptr [rsp + 0x38]
1401189b6: mov       ecx, eax
1401189b8: mov       rax, qword ptr [rsp + 0x50]
1401189bd: test      ecx, ecx
1401189bf: jne       0x1401187b0
1401189c5: jmp       0x1401187c8
1401189ca: add       rsp, 0x68
1401189ce: pop       rbx
1401189cf: pop       rbp
1401189d0: pop       rdi
1401189d1: pop       rsi
1401189d2: pop       r12
1401189d4: pop       r13
1401189d6: pop       r14
1401189d8: pop       r15
1401189da: ret
