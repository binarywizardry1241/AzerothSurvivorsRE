140881470: push       r15
140881472: push       r14
140881474: push       rsi
140881475: push       rdi
140881476: push       rbp
140881477: push       rbx
140881478: sub        rsp, 0x28
14088147c: mov        rcx, qword ptr [rsp + 0x80]
140881484: mov        rdx, qword ptr [rdx]
140881487: mov        rax, qword ptr [r9]
14088148a: mov        rsi, qword ptr [rcx]
14088148d: mov        rdi, qword ptr [rcx + 8]
140881491: mov        ebx, dword ptr [rcx + 0x14]
140881494: cmp        byte ptr [rdx], 2
140881497: je         0x1408814a2
140881499: mov        rcx, qword ptr [r8]
14088149c: cmp        byte ptr [rcx + 0x48], 1
1408814a0: jne        0x1408814af
1408814a2: mov        eax, dword ptr [rax]
1408814a4: add        eax, -3
1408814a7: mov        bpl, 1
1408814aa: cmp        eax, -2
1408814ad: jb         0x14088151d
1408814af: mov        eax, dword ptr [rip + 0x77f6cdb]
1408814b5: test       eax, eax
1408814b7: jne        0x140881695
1408814bd: mov        cl, 1
1408814bf: xor        eax, eax
1408814c1: lock cmpxchg byte ptr [rip + 0x77f6c97], cl
1408814c9: jne        0x1408816b3
1408814cf: mov        r14, qword ptr [rip + 0x783d512]
1408814d6: mov        rax, qword ptr [r14]
1408814d9: shl        rax, 1
1408814dc: test       rax, rax
1408814df: jne        0x1408816c4
1408814e5: movzx      eax, byte ptr [rip + 0x77f6c75]
1408814ec: movzx      ebp, byte ptr [rip + 0x77f6c99]
1408814f3: xor        bpl, 1
1408814f7: and        bpl, byte ptr [rip + 0x77f6c8f]
1408814fe: mov        rax, qword ptr [r14]
140881501: shl        rax, 1
140881504: test       rax, rax
140881507: jne        0x140881700
14088150d: xor        eax, eax
14088150f: xchg       byte ptr [rip + 0x77f6c4b], al
140881515: cmp        al, 2
140881517: je         0x1408816ef
14088151d: mov        rax, qword ptr [rsi + 0xf8]
140881524: mov        rcx, qword ptr [rsi + 0x100]
14088152b: lea        rcx, [rax + rcx*4]
14088152f: cmp        byte ptr [rsi + 0x108], 0
140881536: je         0x1408815cd
14088153c: xor        edx, edx
14088153e: xor        r9d, r9d
140881541: xor        r10d, r10d
140881544: cmp        r10d, edx
140881547: jne        0x1408815a3
140881549: nop        dword ptr [rax]
140881550: cmp        rax, rcx
140881553: je         0x140881688
140881559: mov        edx, dword ptr [rax]
14088155b: add        rax, 4
14088155f: mov        r8, qword ptr [rdi + 0x1a8]
140881566: lea        r9, [rdx + rdx*8]
14088156a: mov        rdx, qword ptr [r8 + r9*8 + 0x10]
14088156f: test       rdx, rdx
140881572: je         0x140881550
140881574: lea        r8, [r8 + r9*8]
140881578: mov        r9, qword ptr [rsi + 0x110]
14088157f: mov        r10, qword ptr [r8 + 0x18]
140881583: mov        r8, qword ptr [r8 + 0x38]
140881587: mov        r8, qword ptr [r8 + r9*8]
14088158b: not        r8
14088158e: lea        r8, [r8 + r8*2]
140881592: shl        r8, 4
140881596: mov        r9, qword ptr [r10 + r8 + 0x10]
14088159b: mov        r8, qword ptr [r10 + r8 + 0x28]
1408815a0: xor        r10d, r10d
1408815a3: mov        r11d, r10d
1408815a6: inc        r10d
1408815a9: imul       r14, r11, 0x110
1408815b0: cmp        bpl, byte ptr [r9 + r14 + 0x100]
1408815b8: je         0x140881544
1408815ba: add        r14, r9
1408815bd: mov        dword ptr [r8 + r11*4], ebx
1408815c1: mov        byte ptr [r14 + 0x100], bpl
1408815c8: jmp        0x140881544
1408815cd: xor        edx, edx
1408815cf: mov        r8d, 8
1408815d5: xor        r10d, r10d
1408815d8: xor        r11d, r11d
1408815db: cmp        r11d, edx
1408815de: jne        0x14088164e
1408815e0: cmp        rax, rcx
1408815e3: je         0x140881688
1408815e9: mov        edx, dword ptr [rax]
1408815eb: add        rax, 4
1408815ef: mov        r8, qword ptr [rdi + 0x108]
1408815f6: lea        r9, [rdx + rdx*4]
1408815fa: shl        r9, 5
1408815fe: mov        rdx, qword ptr [r8 + r9 + 0x58]
140881603: test       rdx, rdx
140881606: je         0x1408815e0
140881608: add        r8, r9
14088160b: mov        r9d, dword ptr [r8 + 0x94]
140881612: mov        r10, qword ptr [rdi + 0x1a8]
140881619: lea        r9, [r9 + r9*8]
14088161d: mov        r11, qword ptr [rsi + 0x110]
140881624: mov        r14, qword ptr [r10 + r9*8 + 0x18]
140881629: mov        r9, qword ptr [r10 + r9*8 + 0x38]
14088162e: mov        r9, qword ptr [r9 + r11*8]
140881632: not        r9
140881635: lea        r9, [r9 + r9*2]
140881639: shl        r9, 4
14088163d: mov        r10, qword ptr [r14 + r9 + 0x10]
140881642: mov        r9, qword ptr [r14 + r9 + 0x28]
140881647: mov        r8, qword ptr [r8 + 0x50]
14088164b: xor        r11d, r11d
14088164e: mov        r14d, r11d
140881651: shl        r14, 4
140881655: inc        r11d
140881658: mov        r14d, dword ptr [r8 + r14 + 8]
14088165d: not        r14d
140881660: imul       r15, r14, 0x110
140881667: cmp        bpl, byte ptr [r10 + r15 + 0x100]
14088166f: je         0x1408815db
140881675: add        r15, r10
140881678: mov        dword ptr [r9 + r14*4], ebx
14088167c: mov        byte ptr [r15 + 0x100], bpl
140881683: jmp        0x1408815db
140881688: add        rsp, 0x28
14088168c: pop        rbx
14088168d: pop        rbp
14088168e: pop        rdi
14088168f: pop        rsi
140881690: pop        r14
140881692: pop        r15
140881694: ret
140881695: lea        rcx, [rip + 0x77f6ac4]
14088169c: call       0x145c4aa3e
1408816a1: mov        cl, 1
1408816a3: xor        eax, eax
1408816a5: lock cmpxchg byte ptr [rip + 0x77f6ab3], cl
1408816ad: je         0x1408814cf
1408816b3: lea        rcx, [rip + 0x77f6aa6]
1408816ba: call       0x145dbc1f0
1408816bf: jmp        0x1408814cf
1408816c4: call       0x145dbcf80
1408816c9: movzx      ecx, byte ptr [rip + 0x77f6a91]
1408816d0: movzx      ebp, byte ptr [rip + 0x77f6ab5]
1408816d7: xor        bpl, 1
1408816db: and        bpl, byte ptr [rip + 0x77f6aab]
1408816e2: test       al, al
1408816e4: jne        0x1408814fe
1408816ea: jmp        0x14088150d
1408816ef: lea        rcx, [rip + 0x77f6a6a]
1408816f6: call       0x145dbc2b0
1408816fb: jmp        0x14088151d
140881700: call       0x145dbcf80
140881705: test       al, al
140881707: jne        0x14088150d
14088170d: mov        byte ptr [rip + 0x77f6a4d], 1
140881714: jmp        0x14088150d
