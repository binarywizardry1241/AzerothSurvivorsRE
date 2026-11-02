140108580: push      rbp
140108581: push      r15
140108583: push      r14
140108585: push      r13
140108587: push      r12
140108589: push      rsi
14010858a: push      rdi
14010858b: push      rbx
14010858c: sub       rsp, 0x398
140108593: lea       rbp, [rsp + 0x80]
14010859b: movaps    xmmword ptr [rbp + 0x300], xmm15
1401085a3: movaps    xmmword ptr [rbp + 0x2f0], xmm14
1401085ab: movaps    xmmword ptr [rbp + 0x2e0], xmm13
1401085b3: movaps    xmmword ptr [rbp + 0x2d0], xmm12
1401085bb: movaps    xmmword ptr [rbp + 0x2c0], xmm11
1401085c3: movaps    xmmword ptr [rbp + 0x2b0], xmm10
1401085cb: movaps    xmmword ptr [rbp + 0x2a0], xmm9
1401085d3: movaps    xmmword ptr [rbp + 0x290], xmm8
1401085db: movaps    xmmword ptr [rbp + 0x280], xmm7
1401085e2: movaps    xmmword ptr [rbp + 0x270], xmm6
1401085e9: mov       qword ptr [rbp + 0x268], 0xfffffffffffffffe
1401085f4: mov       edi, r9d
1401085f7: mov       r13, r8
1401085fa: mov       rsi, rdx
1401085fd: mov       r14, rcx
140108600: mov       rcx, qword ptr [rbp + 0x390]
140108607: mov       r12, qword ptr [rbp + 0x388]
14010860e: mov       rbx, qword ptr [rbp + 0x380]
140108615: mov       byte ptr [rbp + 0x267], r9b
14010861c: mov       rdx, qword ptr [r12 + 0x20]
140108621: mov       r8, qword ptr [r12 + 0x28]
140108626: mov       qword ptr [rbp - 0x58], rdx
14010862a: mov       qword ptr [rbp - 0x50], r8
14010862e: call      0x14590fa20
140108633: mov       byte ptr [rbp + 0x266], al
140108639: movups    xmm6, xmmword ptr [rip + 0x5ccd6f0]
140108640: movaps    xmmword ptr [rbp + 0x1d0], xmm6
140108647: mov       qword ptr [rbp + 0x1e0], 0
140108652: movups    xmm0, xmmword ptr [rip + 0x5ccd6ef]
140108659: movups    xmmword ptr [rbp + 0x1e8], xmm0
140108660: mov       qword ptr [rbp + 0x1f8], 0
14010866b: movups    xmm7, xmmword ptr [rip + 0x5ccd6ee]
140108672: movaps    xmmword ptr [rbp + 0x200], xmm7
140108679: mov       qword ptr [rbp + 0x210], 0
140108684: movups    xmm0, xmmword ptr [rip + 0x5ccd6ed]
14010868b: movups    xmmword ptr [rbp + 0x218], xmm0
140108692: mov       qword ptr [rbp + 0x228], 0
14010869d: mov       rcx, qword ptr [r14]
1401086a0: add       r14, 8
1401086a4: mov       rax, qword ptr [rbp + 0x220]
1401086ab: mov       qword ptr [rbp + 0x68], rax
1401086af: mov       rax, qword ptr [rbp + 0x228]
1401086b6: mov       qword ptr [rbp + 0x70], rax
1401086ba: mov       rax, qword ptr [rbp + 0x210]
1401086c1: mov       qword ptr [rbp + 0x58], rax
1401086c5: mov       rax, qword ptr [rbp + 0x218]
1401086cc: mov       qword ptr [rbp + 0x60], rax
1401086d0: movups    xmmword ptr [rbp + 0x48], xmm7
1401086d4: movaps    xmm0, xmmword ptr [rbp + 0x1f0]
1401086db: movups    xmmword ptr [rbp + 0x38], xmm0
1401086df: movaps    xmm0, xmmword ptr [rbp + 0x1e0]
1401086e6: movups    xmmword ptr [rbp + 0x28], xmm0
1401086ea: movups    xmmword ptr [rbp + 0x18], xmm6
1401086ee: xorps     xmm0, xmm0
1401086f1: movups    xmmword ptr [rbp + 0x78], xmm0
1401086f5: movups    xmmword ptr [rbp + 0x88], xmm0
1401086fc: movups    xmmword ptr [rbp + 0x98], xmm0
140108703: movups    xmmword ptr [rbp + 0xa8], xmm0
14010870a: movups    xmmword ptr [rbp + 0xb8], xmm0
140108711: mov       qword ptr [rbp + 0xc8], 0
14010871c: movups    xmm0, xmmword ptr [rip + 0x5ccd6d5]
140108723: movups    xmmword ptr [rbp + 0xe0], xmm0
14010872a: movups    xmm0, xmmword ptr [rip + 0x5ccd6b7]
140108731: movups    xmmword ptr [rbp + 0xd0], xmm0
140108738: movups    xmm0, xmmword ptr [rip + 0x5ccd6d9]
14010873f: movups    xmmword ptr [rbp + 0x100], xmm0
140108746: movups    xmm0, xmmword ptr [rip + 0x5ccd6bb]
14010874d: movups    xmmword ptr [rbp + 0xf0], xmm0
140108754: movups    xmm12, xmmword ptr [rip + 0x5ccd6dc]
14010875c: movups    xmmword ptr [rbp + 0x120], xmm12
140108764: movups    xmm13, xmmword ptr [rip + 0x5ccd6bc]
14010876c: movups    xmmword ptr [rbp + 0x110], xmm13
140108774: movups    xmm14, xmmword ptr [rip + 0x5ccd6dc]
14010877c: movups    xmmword ptr [rbp + 0x140], xmm14
140108784: movups    xmm15, xmmword ptr [rip + 0x5ccd6bc]
14010878c: movups    xmmword ptr [rbp + 0x130], xmm15
140108794: movaps    xmm8, xmmword ptr [rip + 0x5c94ad4]
14010879c: movups    xmmword ptr [rbp + 0x150], xmm8
1401087a4: mov       dword ptr [rbp + 0x160], 1
1401087ae: movss     xmm0, dword ptr [rip + 0x5c94bca]
1401087b6: movlps    qword ptr [rbp + 0x164], xmm0
1401087bd: mov       byte ptr [rbp + 0x16c], 1
1401087c4: mov       qword ptr [rbp + 0x170], 0
1401087cf: mov       dword ptr [rbp + 0x178], 0x3f800000
1401087d9: mov       word ptr [rbp + 0x17c], 0
1401087e2: mov       word ptr [rbp + 0x182], 0
1401087eb: mov       dword ptr [rbp + 0x17e], 0x10000
1401087f5: mov       word ptr [rbp + 0x188], 0
1401087fe: mov       dword ptr [rbp + 0x184], 0x10000
140108808: mov       qword ptr [rbp + 0x18a], 0
140108813: mov       dword ptr [rbp + 0x192], 5
14010881d: mov       qword ptr [rbp + 0x258], rcx
140108824: mov       qword ptr [rbp + 0x10], rcx
140108828: lea       r9, [rip + 0x5cccc01]
14010882f: lea       r15, [rbp + 0x1a0]
140108836: lea       r8, [rbp + 0x10]
14010883a: mov       rcx, r15
14010883d: mov       rdx, r14
140108840: call      0x1401de510
140108845: mov       qword ptr [rbp + 0x10], r12
140108849: mov       qword ptr [rbp + 0x18], r13
14010884d: mov       qword ptr [rbp + 0x20], rsi
140108851: lea       rax, [rbp + 0x266]
140108858: mov       qword ptr [rbp + 0x28], rax
14010885c: lea       rdx, [rbp + 0x10]
140108860: mov       rcx, r15
140108863: call      0x14026d360
140108868: mov       ecx, edi
14010886a: call      0x145912d70
14010886f: test      rax, rax
140108872: je        0x1401088a1
140108874: cmp       rbx, 3
140108878: jae       0x140109726
14010887e: mov       rcx, rbx
140108881: shl       rcx, 6
140108885: add       rax, rcx
140108888: mov       rcx, rax
14010888b: call      0x14590d390
140108890: mov       qword ptr [rbp - 0x48], rax
140108894: mov       qword ptr [rbp - 0x40], rdx
140108898: movzx     edi, byte ptr [rbp + 0x267]
14010889f: jmp       0x1401088b1
1401088a1: mov       qword ptr [rbp - 0x48], 1
1401088a9: mov       qword ptr [rbp - 0x40], 0
1401088b1: mov       r13, qword ptr [rbp + 0x388]
1401088b8: movzx     r9d, byte ptr [r13 + 0x70]
1401088bd: lea       eax, [r9 + r9*4]
1401088c1: mov       dword ptr [rbp + 0x234], eax
1401088c7: mov       rcx, qword ptr [rbp + 0x390]
1401088ce: mov       edx, edi
1401088d0: mov       r8, rbx
1401088d3: call      0x145910430
1401088d8: cmp       eax, dword ptr [rbp + 0x234]
1401088de: jae       0x140108a7d
1401088e4: lea       rcx, [rip + 0x5cce115]
1401088eb: mov       edx, 0x1e
1401088f0: call      0x1458ec450
1401088f5: mov       r8, rdx
1401088f8: lea       rcx, [rip + 0x5cce11f]
1401088ff: mov       qword ptr [rbp + 0x1d0], rcx
140108906: mov       qword ptr [rbp + 0x1d8], 4
140108911: lea       rcx, [rbp + 0x234]
140108918: mov       qword ptr [rbp + 0x1e0], rcx
14010891f: lea       rcx, [rip + 0x5ccde8a]
140108926: mov       qword ptr [rbp + 0x1e8], rcx
14010892d: lea       rcx, [rip + 0x5cce0ee]
140108934: mov       qword ptr [rbp + 0x1f0], rcx
14010893b: mov       qword ptr [rbp + 0x1f8], 2
140108946: lea       rcx, [rbp - 0x48]
14010894a: mov       qword ptr [rbp + 0x200], rcx
140108951: lea       rcx, [rip + 0x5ccda38]
140108958: mov       qword ptr [rbp + 0x208], rcx
14010895f: mov       qword ptr [rsp + 0x20], 2
140108968: lea       rcx, [rbp + 0x1a0]
14010896f: lea       r9, [rbp + 0x1d0]
140108976: mov       rdx, rax
140108979: call      0x1458ec8b0
14010897e: cmp       byte ptr [rsi], 1
140108981: jne       0x1401089a1
140108983: mov       eax, dword ptr [rsi + 1]
140108986: mov       ecx, dword ptr [rsi + 4]
140108989: mov       dword ptr [rbp + 0x243], ecx
14010898f: mov       dword ptr [rbp + 0x240], eax
140108995: mov       rax, qword ptr [rsi + 8]
140108999: movzx     edx, byte ptr [rsi + 0x10]
14010899d: mov       cl, 1
14010899f: jmp       0x1401089b1
1401089a1: mov       rax, qword ptr [rsi + 8]
1401089a5: lock inc  qword ptr [rax]
1401089a9: jle       0x140109724
1401089af: xor       ecx, ecx
1401089b1: mov       r8, qword ptr [rbp + 0x1b0]
1401089b8: mov       qword ptr [rbp + 0x28], r8
1401089bc: movups    xmm0, xmmword ptr [rbp + 0x1a0]
1401089c3: movups    xmmword ptr [rbp + 0x18], xmm0
1401089c7: mov       r8d, dword ptr [rbp + 0x240]
1401089ce: mov       r9d, dword ptr [rbp + 0x243]
1401089d5: mov       dword ptr [rbp + 0x49], r8d
1401089d9: mov       dword ptr [rbp + 0x4c], r9d
1401089dd: movups    xmm0, xmmword ptr [rip + 0x5ccd8f4]
1401089e4: movups    xmmword ptr [rbp - 0x37], xmm0
1401089e8: mov       dword ptr [rbp - 0x27], 0x3f800000
1401089ef: mov       qword ptr [rbp + 0x30], 0
1401089f7: mov       qword ptr [rbp + 0x38], 4
1401089ff: mov       qword ptr [rbp + 0x40], 0
140108a07: mov       byte ptr [rbp + 0x48], cl
140108a0a: mov       qword ptr [rbp + 0x50], rax
140108a0e: mov       qword ptr [rbp + 0x58], rdx
140108a12: mov       dword ptr [rbp + 0x60], 0x41500000
140108a19: mov       word ptr [rbp + 0x64], 0x190
140108a1f: mov       byte ptr [rbp + 0x66], 1
140108a23: mov       rax, qword ptr [rbp - 0x2b]
140108a27: mov       qword ptr [rbp + 0x74], rax
140108a2b: movups    xmm0, xmmword ptr [rbp - 0x38]
140108a2f: movups    xmmword ptr [rbp + 0x67], xmm0
140108a33: movups    xmm0, xmmword ptr [rip + 0x5ccd056]
140108a3a: movups    xmmword ptr [rbp + 0x7c], xmm0
140108a3e: mov       dword ptr [rbp + 0x8c], 0x3f59999a
140108a48: movsd     xmm0, qword ptr [rip + 0x5c94a50]
140108a50: movsd     qword ptr [rbp + 0x90], xmm0
140108a58: mov       rax, qword ptr [rbp + 0x258]
140108a5f: mov       qword ptr [rbp + 0x10], rax
140108a63: lea       r9, [rip + 0x5ccc9c6]
140108a6a: lea       rcx, [rbp + 0x1a0]
140108a71: lea       r8, [rbp + 0x10]
140108a75: mov       rdx, r14
140108a78: call      0x1401f2bf0
140108a7d: lea       rcx, [rbp + 0x1d0]
140108a84: mov       rdx, r13
140108a87: call      0x14590ea90
140108a8c: movups    xmm0, xmmword ptr [rbp + 0x1d0]
140108a93: movups    xmm1, xmmword ptr [rbp + 0x1e0]
140108a9a: movups    xmm2, xmmword ptr [rbp + 0x1f0]
140108aa1: movaps    xmmword ptr [rbp + 0x30], xmm2
140108aa5: movaps    xmmword ptr [rbp + 0x20], xmm1
140108aa9: movaps    xmmword ptr [rbp + 0x10], xmm0
140108aad: lea       rax, [rbp + 0x267]
140108ab4: mov       qword ptr [rbp + 0x40], rax
140108ab8: lea       rcx, [rbp - 0x38]
140108abc: lea       rdx, [rbp + 0x10]
140108ac0: call      0x1400a2ab0
140108ac5: mov       rax, qword ptr [rbp - 0x30]
140108ac9: mov       qword ptr [rbp + 0x238], rax
140108ad0: mov       rdi, qword ptr [rbp - 0x28]
140108ad4: movzx     edx, byte ptr [rbp + 0x267]
140108adb: test      rdi, rdi
140108ade: je        0x140108bef
140108ae4: mov       rcx, qword ptr [rbp + 0x390]
140108aeb: mov       r8, r13
140108aee: call      0x145910580
140108af3: nop
140108af4: test      al, al
140108af6: jne       0x140108da6
140108afc: mov       rdx, qword ptr [rbp + 0x238]
140108b03: lea       r8, [rdx + rdi*8]
140108b07: lea       rcx, [rbp + 0x1d0]
140108b0e: call      0x1400a9710
140108b13: nop
140108b14: mov       rax, qword ptr [rbp + 0x1d8]
140108b1b: mov       qword ptr [rbp - 0x10], rax
140108b1f: mov       rdi, qword ptr [rbp + 0x1e0]
140108b26: lea       rcx, [rip + 0x5ccdef7]
140108b2d: mov       edx, 4
140108b32: call      0x1458ec450
140108b37: nop
140108b38: mov       qword ptr [rsp + 0x20], rdx
140108b3d: lea       rcx, [rbp + 0x10]
140108b41: mov       rdx, qword ptr [rbp - 0x10]
140108b45: mov       r8, rdi
140108b48: mov       r9, rax
140108b4b: call      0x14008e420
140108b50: nop
140108b51: mov       rcx, qword ptr [rbp - 0x10]
140108b55: mov       rax, qword ptr [rbp + 0x20]
140108b59: mov       qword ptr [rbp + 0x1b0], rax
140108b60: movups    xmm0, xmmword ptr [rbp + 0x10]
140108b64: movaps    xmmword ptr [rbp + 0x1a0], xmm0
140108b6b: mov       rdx, qword ptr [rbp + 0x1d0]
140108b72: test      rdx, rdx
140108b75: je        0x140108b86
140108b77: shl       rdx, 4
140108b7b: mov       r8d, 8
140108b81: call      0x1400021d0
140108b86: mov       rax, qword ptr [rbp + 0x238]
140108b8d: mov       rax, qword ptr [rax]
140108b90: cmp       byte ptr [rax + 0x72], 1
140108b94: jne       0x140108c04
140108b96: lea       rcx, [rip + 0x5ccde8b]
140108b9d: mov       edx, 0x19
140108ba2: call      0x1458ec450
140108ba7: nop
140108ba8: mov       r8, rdx
140108bab: lea       rcx, [rip + 0x5ccd777]
140108bb2: mov       qword ptr [rbp + 0x10], rcx
140108bb6: mov       qword ptr [rbp + 0x18], 4
140108bbe: mov       qword ptr [rbp + 0x20], r15
140108bc2: lea       rcx, [rip + 0x5ccde7f]
140108bc9: mov       qword ptr [rbp + 0x28], rcx
140108bcd: mov       qword ptr [rsp + 0x20], 1
140108bd6: lea       rcx, [rbp + 0x1d0]
140108bdd: lea       r9, [rbp + 0x10]
140108be1: mov       rdx, rax
140108be4: call      0x1458ec8b0
140108be9: nop
140108bea: jmp       0x140108c88
140108bef: mov       rcx, qword ptr [rbp + 0x390]
140108bf6: mov       r8, r13
140108bf9: call      0x145910580
140108bfe: nop
140108bff: jmp       0x140108da6
140108c04: lea       rcx, [rip + 0x5ccde5d]
140108c0b: mov       edx, 0x1c
140108c10: call      0x1458ec450
140108c15: nop
140108c16: mov       r8, rdx
140108c19: mov       rcx, qword ptr [rbp + 0x238]
140108c20: mov       rcx, qword ptr [rcx]
140108c23: add       rcx, 0x72
140108c27: lea       rdx, [rip + 0x5ccd652]
140108c2e: mov       qword ptr [rbp + 0x10], rdx
140108c32: mov       qword ptr [rbp + 0x18], 1
140108c3a: mov       qword ptr [rbp + 0x20], rcx
140108c3e: lea       rcx, [rip + 0x5ccde43]
140108c45: mov       qword ptr [rbp + 0x28], rcx
140108c49: lea       rcx, [rip + 0x5ccd6d9]
140108c50: mov       qword ptr [rbp + 0x30], rcx
140108c54: mov       qword ptr [rbp + 0x38], 4
140108c5c: mov       qword ptr [rbp + 0x40], r15
140108c60: lea       rcx, [rip + 0x5ccdde1]
140108c67: mov       qword ptr [rbp + 0x48], rcx
140108c6b: mov       qword ptr [rsp + 0x20], 2
140108c74: lea       rcx, [rbp + 0x1d0]
140108c7b: lea       r9, [rbp + 0x10]
140108c7f: mov       rdx, rax
140108c82: call      0x1458ec8b0
140108c87: nop
140108c88: cmp       byte ptr [rsi], 1
140108c8b: jne       0x140108ca5
140108c8d: mov       eax, dword ptr [rsi + 1]
140108c90: mov       ecx, dword ptr [rsi + 4]
140108c93: mov       dword ptr [rbp - 0x1d], ecx
140108c96: mov       dword ptr [rbp - 0x20], eax
140108c99: mov       rax, qword ptr [rsi + 8]
140108c9d: movzx     edx, byte ptr [rsi + 0x10]
140108ca1: mov       cl, 1
140108ca3: jmp       0x140108cb5
140108ca5: mov       rax, qword ptr [rsi + 8]
140108ca9: lock inc  qword ptr [rax]
140108cad: jle       0x140109724
140108cb3: xor       ecx, ecx
140108cb5: mov       r8, qword ptr [rbp + 0x1e0]
140108cbc: mov       qword ptr [rbp + 0x28], r8
140108cc0: movups    xmm0, xmmword ptr [rbp + 0x1d0]
140108cc7: movups    xmmword ptr [rbp + 0x18], xmm0
140108ccb: mov       r8d, dword ptr [rbp - 0x20]
140108ccf: mov       r9d, dword ptr [rbp - 0x1d]
140108cd3: mov       dword ptr [rbp + 0x49], r8d
140108cd7: mov       dword ptr [rbp + 0x4c], r9d
140108cdb: movups    xmm0, xmmword ptr [rip + 0x5ccd5f6]
140108ce2: movups    xmmword ptr [rbp + 0x241], xmm0
140108ce9: mov       dword ptr [rbp + 0x251], 0x3f800000
140108cf3: mov       qword ptr [rbp + 0x30], 0
140108cfb: mov       qword ptr [rbp + 0x38], 4
140108d03: mov       qword ptr [rbp + 0x40], 0
140108d0b: mov       byte ptr [rbp + 0x48], cl
140108d0e: mov       qword ptr [rbp + 0x50], rax
140108d12: mov       qword ptr [rbp + 0x58], rdx
140108d16: mov       dword ptr [rbp + 0x60], 0x41500000
140108d1d: mov       word ptr [rbp + 0x64], 0x190
140108d23: mov       byte ptr [rbp + 0x66], 1
140108d27: mov       rax, qword ptr [rbp + 0x24d]
140108d2e: mov       qword ptr [rbp + 0x74], rax
140108d32: movups    xmm0, xmmword ptr [rbp + 0x240]
140108d39: movups    xmmword ptr [rbp + 0x67], xmm0
140108d3d: movups    xmm0, xmmword ptr [rip + 0x5cccd4c]
140108d44: movups    xmmword ptr [rbp + 0x7c], xmm0
140108d48: mov       dword ptr [rbp + 0x8c], 0x3f59999a
140108d52: movsd     xmm0, qword ptr [rip + 0x5c94746]
140108d5a: movsd     qword ptr [rbp + 0x90], xmm0
140108d62: mov       rax, qword ptr [rbp + 0x258]
140108d69: mov       qword ptr [rbp + 0x10], rax
140108d6d: lea       r9, [rip + 0x5ccc6bc]
140108d74: lea       rcx, [rbp + 0x1d0]
140108d7b: lea       r8, [rbp + 0x10]
140108d7f: mov       rdx, r14
140108d82: call      0x1401f2bf0
140108d87: nop
140108d88: mov       rdx, qword ptr [rbp + 0x1a0]
140108d8f: test      rdx, rdx
140108d92: je        0x140108da6
140108d94: mov       rcx, qword ptr [rbp + 0x1a8]
140108d9b: mov       r8d, 1
140108da1: call      0x1400021d0
140108da6: movzx     edx, byte ptr [rbp + 0x267]
140108dad: mov       rcx, qword ptr [rbp + 0x390]
140108db4: mov       r8, qword ptr [rbp - 0x58]
140108db8: mov       r9, qword ptr [rbp - 0x50]
140108dbc: call      0x14590fb00
140108dc1: nop
140108dc2: mov       r15, rax
140108dc5: test      rax, rax
140108dc8: je        0x140108f4c
140108dce: lea       rcx, [rip + 0x5ccdcd3]
140108dd5: mov       edx, 0x18
140108dda: call      0x1458ec450
140108ddf: nop
140108de0: mov       rdi, rax
140108de3: mov       rbx, rdx
140108de6: mov       rcx, r15
140108de9: call      0x14590eac0
140108dee: nop
140108def: mov       qword ptr [rbp - 0x20], rax
140108df3: mov       qword ptr [rbp - 0x18], rdx
140108df7: lea       rax, [rip + 0x5ccd52b]
140108dfe: mov       qword ptr [rbp + 0x1a0], rax
140108e05: mov       qword ptr [rbp + 0x1a8], 4
140108e10: lea       rax, [rbp - 0x20]
140108e14: mov       qword ptr [rbp + 0x1b0], rax
140108e1b: lea       rax, [rip + 0x5ccd56e]
140108e22: mov       qword ptr [rbp + 0x1b8], rax
140108e29: mov       qword ptr [rsp + 0x20], 1
140108e32: lea       rcx, [rbp + 0x1d0]
140108e39: lea       r9, [rbp + 0x1a0]
140108e40: mov       rdx, rdi
140108e43: mov       r8, rbx
140108e46: call      0x1458ec8b0
140108e4b: nop
140108e4c: cmp       byte ptr [rsi], 1
140108e4f: jne       0x140108e69
140108e51: mov       eax, dword ptr [rsi + 1]
140108e54: mov       ecx, dword ptr [rsi + 4]
140108e57: mov       dword ptr [rbp + 0xb], ecx
140108e5a: mov       dword ptr [rbp + 8], eax
140108e5d: mov       rax, qword ptr [rsi + 8]
140108e61: movzx     edx, byte ptr [rsi + 0x10]
140108e65: mov       cl, 1
140108e67: jmp       0x140108e79
140108e69: mov       rax, qword ptr [rsi + 8]
140108e6d: lock inc  qword ptr [rax]
140108e71: jle       0x140109724
140108e77: xor       ecx, ecx
140108e79: mov       r8, qword ptr [rbp + 0x1e0]
140108e80: mov       qword ptr [rbp + 0x28], r8
140108e84: movups    xmm0, xmmword ptr [rbp + 0x1d0]
140108e8b: movups    xmmword ptr [rbp + 0x18], xmm0
140108e8f: mov       r8d, dword ptr [rbp + 8]
140108e93: mov       r9d, dword ptr [rbp + 0xb]
140108e97: mov       dword ptr [rbp + 0x49], r8d
140108e9b: mov       dword ptr [rbp + 0x4c], r9d
140108e9f: movups    xmm0, xmmword ptr [rip + 0x5ccd432]
140108ea6: movups    xmmword ptr [rbp + 0x241], xmm0
140108ead: mov       dword ptr [rbp + 0x251], 0x3f800000
140108eb7: mov       qword ptr [rbp + 0x30], 0
140108ebf: mov       qword ptr [rbp + 0x38], 4
140108ec7: mov       qword ptr [rbp + 0x40], 0
140108ecf: mov       byte ptr [rbp + 0x48], cl
140108ed2: mov       qword ptr [rbp + 0x50], rax
140108ed6: mov       qword ptr [rbp + 0x58], rdx
140108eda: mov       dword ptr [rbp + 0x60], 0x41500000
140108ee1: mov       word ptr [rbp + 0x64], 0x190
140108ee7: mov       byte ptr [rbp + 0x66], 1
140108eeb: mov       rax, qword ptr [rbp + 0x24d]
140108ef2: mov       qword ptr [rbp + 0x74], rax
140108ef6: movups    xmm0, xmmword ptr [rbp + 0x240]
140108efd: movups    xmmword ptr [rbp + 0x67], xmm0
140108f01: movups    xmm0, xmmword ptr [rip + 0x5cccb88]
140108f08: movups    xmmword ptr [rbp + 0x7c], xmm0
140108f0c: mov       dword ptr [rbp + 0x8c], 0x3f59999a
140108f16: movsd     xmm0, qword ptr [rip + 0x5c94582]
140108f1e: movsd     qword ptr [rbp + 0x90], xmm0
140108f26: mov       rax, qword ptr [rbp + 0x258]
140108f2d: mov       qword ptr [rbp + 0x10], rax
140108f31: lea       r9, [rip + 0x5ccc4f8]
140108f38: lea       rcx, [rbp + 0x1d0]
140108f3f: lea       r8, [rbp + 0x10]
140108f43: mov       rdx, r14
140108f46: call      0x1401f2bf0
140108f4b: nop
140108f4c: movzx     r8d, byte ptr [rbp + 0x266]
140108f54: cmp       r8b, 1
140108f58: adc       r8d, 0
140108f5c: lea       rcx, [rbp + 0x1d0]
140108f63: mov       rdx, qword ptr [rbp + 0x388]
140108f6a: call      0x14590eaf0
140108f6f: nop
140108f70: movzx     r13d, byte ptr [rsi]
140108f74: cmp       r13b, 1
140108f78: jne       0x140108f98
140108f7a: mov       eax, dword ptr [rsi + 1]
140108f7d: mov       ecx, dword ptr [rsi + 4]
140108f80: mov       dword ptr [rbp + 0x243], ecx
140108f86: mov       dword ptr [rbp + 0x240], eax
140108f8c: mov       rax, qword ptr [rsi + 8]
140108f90: movzx     edx, byte ptr [rsi + 0x10]
140108f94: mov       cl, 1
140108f96: jmp       0x140108fa8
140108f98: mov       rax, qword ptr [rsi + 8]
140108f9c: lock inc  qword ptr [rax]
140108fa0: jle       0x140109724
140108fa6: xor       ecx, ecx
140108fa8: mov       r8, qword ptr [rbp + 0x1e0]
140108faf: mov       qword ptr [rbp + 0x28], r8
140108fb3: movups    xmm0, xmmword ptr [rbp + 0x1d0]
140108fba: movups    xmmword ptr [rbp + 0x18], xmm0
140108fbe: mov       r8d, dword ptr [rbp + 0x240]
140108fc5: mov       r9d, dword ptr [rbp + 0x243]
140108fcc: mov       dword ptr [rbp + 0x49], r8d
140108fd0: mov       dword ptr [rbp + 0x4c], r9d
140108fd4: movups    xmm11, xmmword ptr [rip + 0x5ccd2bc]
140108fdc: movups    xmmword ptr [rbp + 0x1a1], xmm11
140108fe4: mov       dword ptr [rbp + 0x1b1], 0x3f800000
140108fee: mov       qword ptr [rbp + 0x30], 0
140108ff6: mov       qword ptr [rbp + 0x38], 4
140108ffe: mov       qword ptr [rbp + 0x40], 0
140109006: mov       byte ptr [rbp + 0x48], cl
140109009: mov       qword ptr [rbp + 0x50], rax
14010900d: mov       qword ptr [rbp + 0x58], rdx
140109011: mov       dword ptr [rbp + 0x60], 0x41600000
140109018: mov       word ptr [rbp + 0x64], 0x190
14010901e: mov       byte ptr [rbp + 0x66], 1
140109022: mov       rax, qword ptr [rbp + 0x1ad]
140109029: mov       qword ptr [rbp + 0x74], rax
14010902d: movups    xmm0, xmmword ptr [rbp + 0x1a0]
140109034: movups    xmmword ptr [rbp + 0x67], xmm0
140109038: movups    xmm9, xmmword ptr [rip + 0x5ccca50]
140109040: movups    xmmword ptr [rbp + 0x7c], xmm9
140109045: mov       dword ptr [rbp + 0x8c], 0x3f59999a
14010904f: movsd     xmm10, qword ptr [rip + 0x5c94448]
140109058: movsd     qword ptr [rbp + 0x90], xmm10
140109061: mov       rax, qword ptr [rbp + 0x258]
140109068: mov       qword ptr [rbp + 0x10], rax
14010906c: lea       r9, [rip + 0x5ccc3bd]
140109073: lea       rcx, [rbp + 0x1d0]
14010907a: lea       r8, [rbp + 0x10]
14010907e: mov       rdx, r14
140109081: call      0x1401f2bf0
140109086: nop
140109087: movzx     eax, byte ptr [rbp + 0x266]
14010908e: test      al, al
140109090: je        0x140109313
140109096: mov       rcx, qword ptr [rbp + 0x388]
14010909d: cmp       al, byte ptr [rcx + 0x72]
1401090a0: jae       0x140109313
1401090a6: lea       rcx, [rip + 0x5ccda13]
1401090ad: mov       edx, 0xa
1401090b2: call      0x1458ec450
1401090b7: nop
1401090b8: mov       rdi, rdx
1401090bb: test      rdx, rdx
1401090be: jns       0x1401090d4
1401090c0: xor       r12d, r12d
1401090c3: mov       rcx, r12
1401090c6: mov       rdx, rdi
1401090c9: call      0x145d992bb
1401090ce: nop
1401090cf: jmp       0x140109724
1401090d4: test      rdi, rdi
1401090d7: je        0x14010912d
1401090d9: mov       r15, rax
1401090dc: call      0x140002200
1401090e1: mov       r12d, 1
1401090e7: mov       edx, 1
1401090ec: mov       rcx, rdi
1401090ef: call      0x1400021c0
1401090f4: test      rax, rax
1401090f7: je        0x1401090c3
1401090f9: mov       rbx, rax
1401090fc: mov       rcx, rax
1401090ff: mov       rdx, r15
140109102: mov       r8, rdi
140109105: call      0x145bfa0e7
14010910a: test      r13b, r13b
14010910d: je        0x140109137
14010910f: mov       eax, dword ptr [rsi + 1]
140109112: mov       ecx, dword ptr [rsi + 4]
140109115: mov       dword ptr [rbp + 0x1d3], ecx
14010911b: mov       dword ptr [rbp + 0x1d0], eax
140109121: mov       rax, qword ptr [rsi + 8]
140109125: movzx     edx, byte ptr [rsi + 0x10]
140109129: mov       cl, 1
14010912b: jmp       0x140109147
14010912d: mov       ebx, 1
140109132: test      r13b, r13b
140109135: jne       0x14010910f
140109137: mov       rax, qword ptr [rsi + 8]
14010913b: lock inc  qword ptr [rax]
14010913f: jle       0x140109724
140109145: xor       ecx, ecx
140109147: mov       r8d, dword ptr [rbp + 0x1d0]
14010914e: mov       r9d, dword ptr [rbp + 0x1d3]
140109155: mov       dword ptr [rbp + 0x4c], r9d
140109159: mov       dword ptr [rbp + 0x49], r8d
14010915d: movups    xmm0, xmmword ptr [rip + 0x5ccd584]
140109164: movups    xmmword ptr [rbp + 0x1a1], xmm0
14010916b: mov       dword ptr [rbp + 0x1b1], 0x3f800000
140109175: mov       qword ptr [rbp + 0x18], rdi
140109179: mov       qword ptr [rbp + 0x20], rbx
14010917d: mov       qword ptr [rbp + 0x28], rdi
140109181: mov       qword ptr [rbp + 0x30], 0
140109189: mov       qword ptr [rbp + 0x38], 4
140109191: mov       qword ptr [rbp + 0x40], 0
140109199: mov       byte ptr [rbp + 0x48], cl
14010919c: mov       qword ptr [rbp + 0x50], rax
1401091a0: mov       qword ptr [rbp + 0x58], rdx
1401091a4: mov       dword ptr [rbp + 0x60], 0x41500000
1401091ab: mov       word ptr [rbp + 0x64], 0x190
1401091b1: mov       byte ptr [rbp + 0x66], 1
1401091b5: mov       rax, qword ptr [rbp + 0x1ad]
1401091bc: mov       qword ptr [rbp + 0x74], rax
1401091c0: movups    xmm0, xmmword ptr [rbp + 0x1a0]
1401091c7: movups    xmmword ptr [rbp + 0x67], xmm0
1401091cb: movups    xmmword ptr [rbp + 0x7c], xmm9
1401091d0: mov       dword ptr [rbp + 0x8c], 0x3f59999a
1401091da: movsd     qword ptr [rbp + 0x90], xmm10
1401091e3: mov       rax, qword ptr [rbp + 0x258]
1401091ea: mov       qword ptr [rbp + 0x10], rax
1401091ee: lea       r9, [rip + 0x5ccc23b]
1401091f5: lea       rcx, [rbp + 0x1d0]
1401091fc: lea       r8, [rbp + 0x10]
140109200: mov       rdx, r14
140109203: call      0x1401f2bf0
140109208: nop
140109209: movzx     r8d, byte ptr [rbp + 0x266]
140109211: inc       r8b
140109214: lea       rcx, [rbp + 0x1d0]
14010921b: mov       rdx, qword ptr [rbp + 0x388]
140109222: call      0x14590eaf0
140109227: nop
140109228: test      r13b, r13b
14010922b: je        0x140109245
14010922d: mov       eax, dword ptr [rsi + 1]
140109230: mov       ecx, dword ptr [rsi + 4]
140109233: mov       dword ptr [rbp + 3], ecx
140109236: mov       dword ptr [rbp], eax
140109239: mov       rax, qword ptr [rsi + 8]
14010923d: movzx     ecx, byte ptr [rsi + 0x10]
140109241: mov       dl, 1
140109243: jmp       0x140109255
140109245: mov       rax, qword ptr [rsi + 8]
140109249: lock inc  qword ptr [rax]
14010924d: jle       0x140109724
140109253: xor       edx, edx
140109255: mov       r8, qword ptr [rbp + 0x1e0]
14010925c: mov       qword ptr [rbp + 0x28], r8
140109260: movups    xmm0, xmmword ptr [rbp + 0x1d0]
140109267: movups    xmmword ptr [rbp + 0x18], xmm0
14010926b: movups    xmmword ptr [rbp + 0x1a1], xmm11
140109273: mov       dword ptr [rbp + 0x1b1], 0x3f800000
14010927d: mov       qword ptr [rbp + 0x30], 0
140109285: mov       qword ptr [rbp + 0x38], 4
14010928d: mov       qword ptr [rbp + 0x40], 0
140109295: mov       byte ptr [rbp + 0x48], dl
140109298: mov       edx, dword ptr [rbp]
14010929b: mov       r8d, dword ptr [rbp + 3]
14010929f: mov       dword ptr [rbp + 0x49], edx
1401092a2: mov       dword ptr [rbp + 0x4c], r8d
1401092a6: mov       qword ptr [rbp + 0x50], rax
1401092aa: mov       qword ptr [rbp + 0x58], rcx
1401092ae: mov       dword ptr [rbp + 0x60], 0x41600000
1401092b5: mov       word ptr [rbp + 0x64], 0x190
1401092bb: mov       byte ptr [rbp + 0x66], 1
1401092bf: mov       rax, qword ptr [rbp + 0x1ad]
1401092c6: mov       qword ptr [rbp + 0x74], rax
1401092ca: movups    xmm0, xmmword ptr [rbp + 0x1a0]
1401092d1: movups    xmmword ptr [rbp + 0x67], xmm0
1401092d5: movups    xmmword ptr [rbp + 0x7c], xmm9
1401092da: mov       dword ptr [rbp + 0x8c], 0x3f59999a
1401092e4: movsd     qword ptr [rbp + 0x90], xmm10
1401092ed: mov       rax, qword ptr [rbp + 0x258]
1401092f4: mov       qword ptr [rbp + 0x10], rax
1401092f8: lea       r9, [rip + 0x5ccc131]
1401092ff: lea       rcx, [rbp + 0x1d0]
140109306: lea       r8, [rbp + 0x10]
14010930a: mov       rdx, r14
14010930d: call      0x1401f2bf0
140109312: nop
140109313: mov       rcx, qword ptr [rbp + 0x388]
14010931a: call      0x14590f1f0
14010931f: nop
140109320: test      al, al
140109322: je        0x14010947d
140109328: lea       rcx, [rip + 0x5ccd79b]
14010932f: mov       edx, 0x2d
140109334: call      0x1458ec450
140109339: nop
14010933a: mov       rdi, rdx
14010933d: test      rdx, rdx
140109340: jns       0x140109356
140109342: xor       r12d, r12d
140109345: mov       rcx, r12
140109348: mov       rdx, rdi
14010934b: call      0x145d992bb
140109350: nop
140109351: jmp       0x140109724
140109356: test      rdi, rdi
140109359: je        0x1401093a9
14010935b: mov       r15, rax
14010935e: call      0x140002200
140109363: mov       r12d, 1
140109369: mov       edx, 1
14010936e: mov       rcx, rdi
140109371: call      0x1400021c0
140109376: test      rax, rax
140109379: je        0x140109345
14010937b: mov       rbx, rax
14010937e: mov       rcx, rax
140109381: mov       rdx, r15
140109384: mov       r8, rdi
140109387: call      0x145bfa0e7
14010938c: test      r13b, r13b
14010938f: je        0x1401093b3
140109391: mov       eax, dword ptr [rsi + 1]
140109394: mov       ecx, dword ptr [rsi + 4]
140109397: mov       dword ptr [rbp - 5], ecx
14010939a: mov       dword ptr [rbp - 8], eax
14010939d: mov       rax, qword ptr [rsi + 8]
1401093a1: movzx     ecx, byte ptr [rsi + 0x10]
1401093a5: mov       dl, 1
1401093a7: jmp       0x1401093c3
1401093a9: mov       ebx, 1
1401093ae: test      r13b, r13b
1401093b1: jne       0x140109391
1401093b3: mov       rax, qword ptr [rsi + 8]
1401093b7: lock inc  qword ptr [rax]
1401093bb: jle       0x140109724
1401093c1: xor       edx, edx
1401093c3: movups    xmm0, xmmword ptr [rip + 0x5ccd72e]
1401093ca: movups    xmmword ptr [rbp + 0x1a1], xmm0
1401093d1: mov       dword ptr [rbp + 0x1b1], 0x3f800000
1401093db: mov       qword ptr [rbp + 0x18], rdi
1401093df: mov       qword ptr [rbp + 0x20], rbx
1401093e3: mov       qword ptr [rbp + 0x28], rdi
1401093e7: mov       qword ptr [rbp + 0x30], 0
1401093ef: mov       qword ptr [rbp + 0x38], 4
1401093f7: mov       qword ptr [rbp + 0x40], 0
1401093ff: mov       byte ptr [rbp + 0x48], dl
140109402: mov       edx, dword ptr [rbp - 8]
140109405: mov       r8d, dword ptr [rbp - 5]
140109409: mov       dword ptr [rbp + 0x49], edx
14010940c: mov       dword ptr [rbp + 0x4c], r8d
140109410: mov       qword ptr [rbp + 0x50], rax
140109414: mov       qword ptr [rbp + 0x58], rcx
140109418: mov       dword ptr [rbp + 0x60], 0x41400000
14010941f: mov       word ptr [rbp + 0x64], 0x190
140109425: mov       byte ptr [rbp + 0x66], 1
140109429: movups    xmm0, xmmword ptr [rbp + 0x1a0]
140109430: movups    xmmword ptr [rbp + 0x67], xmm0
140109434: mov       rax, qword ptr [rbp + 0x1ad]
14010943b: mov       qword ptr [rbp + 0x74], rax
14010943f: movups    xmmword ptr [rbp + 0x7c], xmm9
140109444: mov       dword ptr [rbp + 0x8c], 0x3f59999a
14010944e: movsd     qword ptr [rbp + 0x90], xmm10
140109457: mov       rax, qword ptr [rbp + 0x258]
14010945e: mov       qword ptr [rbp + 0x10], rax
140109462: lea       r9, [rip + 0x5ccbfc7]
140109469: lea       rcx, [rbp + 0x1d0]
140109470: lea       r8, [rbp + 0x10]
140109474: mov       rdx, r14
140109477: call      0x1401f2bf0
14010947c: nop
14010947d: cmp       byte ptr [rbp + 0x3a0], 0
140109484: jne       0x1401096a3
14010948a: movaps    xmmword ptr [rbp + 0x1d0], xmm6
140109491: mov       qword ptr [rbp + 0x1e0], 0
14010949c: movups    xmm0, xmmword ptr [rip + 0x5ccc8a5]
1401094a3: movups    xmmword ptr [rbp + 0x1e8], xmm0
1401094aa: mov       qword ptr [rbp + 0x1f8], 0
1401094b5: movaps    xmmword ptr [rbp + 0x200], xmm7
1401094bc: mov       qword ptr [rbp + 0x210], 0
1401094c7: movups    xmm0, xmmword ptr [rip + 0x5ccc8aa]
1401094ce: movups    xmmword ptr [rbp + 0x218], xmm0
1401094d5: mov       qword ptr [rbp + 0x228], 0
1401094e0: mov       rax, qword ptr [rbp + 0x220]
1401094e7: mov       qword ptr [rbp + 0x68], rax
1401094eb: mov       rax, qword ptr [rbp + 0x228]
1401094f2: mov       qword ptr [rbp + 0x70], rax
1401094f6: mov       rax, qword ptr [rbp + 0x210]
1401094fd: mov       qword ptr [rbp + 0x58], rax
140109501: mov       rax, qword ptr [rbp + 0x218]
140109508: mov       qword ptr [rbp + 0x60], rax
14010950c: movups    xmmword ptr [rbp + 0x48], xmm7
140109510: mov       rax, qword ptr [rbp + 0x1f0]
140109517: mov       qword ptr [rbp + 0x38], rax
14010951b: mov       rax, qword ptr [rbp + 0x1f8]
140109522: mov       qword ptr [rbp + 0x40], rax
140109526: movaps    xmm0, xmmword ptr [rbp + 0x1e0]
14010952d: movups    xmmword ptr [rbp + 0x28], xmm0
140109531: movups    xmmword ptr [rbp + 0x18], xmm6
140109535: xorps     xmm0, xmm0
140109538: movups    xmmword ptr [rbp + 0x78], xmm0
14010953c: movups    xmmword ptr [rbp + 0x88], xmm0
140109543: movups    xmmword ptr [rbp + 0x98], xmm0
14010954a: movups    xmmword ptr [rbp + 0xa8], xmm0
140109551: movups    xmmword ptr [rbp + 0xb8], xmm0
140109558: mov       qword ptr [rbp + 0xc8], 0
140109563: movaps    xmm0, xmmword ptr [rip + 0x5c93ef6]
14010956a: movups    xmmword ptr [rbp + 0xd0], xmm0
140109571: movaps    xmm0, xmmword ptr [rip + 0x5c93ef8]
140109578: movups    xmmword ptr [rbp + 0xe0], xmm0
14010957f: movups    xmm0, xmmword ptr [rip + 0x5ccc892]
140109586: movups    xmmword ptr [rbp + 0x100], xmm0
14010958d: movups    xmm0, xmmword ptr [rip + 0x5ccc874]
140109594: movups    xmmword ptr [rbp + 0xf0], xmm0
14010959b: movups    xmmword ptr [rbp + 0x120], xmm12
1401095a3: movups    xmmword ptr [rbp + 0x110], xmm13
1401095ab: movups    xmmword ptr [rbp + 0x140], xmm14
1401095b3: movups    xmmword ptr [rbp + 0x130], xmm15
1401095bb: movups    xmmword ptr [rbp + 0x150], xmm8
1401095c3: mov       dword ptr [rbp + 0x160], 1
1401095cd: movss     xmm0, dword ptr [rip + 0x5c93eab]
1401095d5: movlps    qword ptr [rbp + 0x164], xmm0
1401095dc: mov       byte ptr [rbp + 0x16c], 1
1401095e3: mov       qword ptr [rbp + 0x170], 0
1401095ee: mov       dword ptr [rbp + 0x178], 0x3f800000
1401095f8: mov       word ptr [rbp + 0x17c], 0
140109601: mov       word ptr [rbp + 0x182], 0
14010960a: mov       dword ptr [rbp + 0x17e], 0x10000
140109614: mov       word ptr [rbp + 0x188], 0
14010961d: mov       dword ptr [rbp + 0x184], 0x10000
140109627: mov       dword ptr [rbp + 0x192], 0
140109631: mov       qword ptr [rbp + 0x18a], 0
14010963c: mov       rax, qword ptr [rbp + 0x258]
140109643: mov       qword ptr [rbp + 0x10], rax
140109647: lea       r9, [rip + 0x5ccbde2]
14010964e: lea       rcx, [rbp + 0x1a0]
140109655: lea       r8, [rbp + 0x10]
140109659: mov       rdx, r14
14010965c: call      0x1401de510
140109661: nop
140109662: mov       qword ptr [rbp + 0x10], rsi
140109666: mov       rax, qword ptr [rbp + 0x390]
14010966d: mov       qword ptr [rbp + 0x18], rax
140109671: lea       rax, [rbp + 0x267]
140109678: mov       qword ptr [rbp + 0x20], rax
14010967c: mov       rax, qword ptr [rbp + 0x388]
140109683: mov       qword ptr [rbp + 0x28], rax
140109687: lea       rax, [rbp + 0x398]
14010968e: mov       qword ptr [rbp + 0x30], rax
140109692: lea       rcx, [rbp + 0x1a0]
140109699: lea       rdx, [rbp + 0x10]
14010969d: call      0x14026dd60
1401096a2: nop
1401096a3: mov       rdx, qword ptr [rbp - 0x38]
1401096a7: test      rdx, rdx
1401096aa: je        0x1401096c2
1401096ac: shl       rdx, 3
1401096b0: mov       r8d, 8
1401096b6: mov       rcx, qword ptr [rbp + 0x238]
1401096bd: call      0x1400021d0
1401096c2: movaps    xmm6, xmmword ptr [rbp + 0x270]
1401096c9: movaps    xmm7, xmmword ptr [rbp + 0x280]
1401096d0: movaps    xmm8, xmmword ptr [rbp + 0x290]
1401096d8: movaps    xmm9, xmmword ptr [rbp + 0x2a0]
1401096e0: movaps    xmm10, xmmword ptr [rbp + 0x2b0]
1401096e8: movaps    xmm11, xmmword ptr [rbp + 0x2c0]
1401096f0: movaps    xmm12, xmmword ptr [rbp + 0x2d0]
1401096f8: movaps    xmm13, xmmword ptr [rbp + 0x2e0]
140109700: movaps    xmm14, xmmword ptr [rbp + 0x2f0]
140109708: movaps    xmm15, xmmword ptr [rbp + 0x300]
140109710: add       rsp, 0x398
140109717: pop       rbx
140109718: pop       rdi
140109719: pop       rsi
14010971a: pop       r12
14010971c: pop       r13
14010971e: pop       r14
140109720: pop       r15
140109722: pop       rbp
140109723: ret
140109724: ud2
140109726: lea       r8, [rip + 0x5ccd2bb]
14010972d: mov       edx, 3
140109732: mov       rcx, rbx
140109735: call      0x145d99653
14010973a: ud2
