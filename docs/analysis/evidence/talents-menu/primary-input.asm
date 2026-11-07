140117cf0: push      rbp
140117cf1: push      r15
140117cf3: push      r14
140117cf5: push      r13
140117cf7: push      r12
140117cf9: push      rsi
140117cfa: push      rdi
140117cfb: push      rbx
140117cfc: sub       rsp, 0x1c8
140117d03: lea       rbp, [rsp + 0x80]
140117d0b: mov       qword ptr [rbp + 0x140], 0xfffffffffffffffe
140117d16: mov       rax, qword ptr [rbp + 0x1b8]
140117d1d: mov       rcx, qword ptr [rbp + 0x1b0]
140117d24: mov       r12, qword ptr [rdx]
140117d27: mov       rdi, qword ptr [rdx + 8]
140117d2b: mov       r10d, dword ptr [rdx + 0x14]
140117d2f: mov       r11, qword ptr [r8]
140117d32: mov       qword ptr [rbp + 0xb0], r11
140117d39: mov       r11, qword ptr [r8 + 0x10]
140117d3d: mov       qword ptr [rbp + 0xb8], r11
140117d44: mov       r8d, dword ptr [r8 + 0x1c]
140117d48: mov       dword ptr [rbp + 0x118], r8d
140117d4f: mov       r8, qword ptr [r9]
140117d52: mov       r9, qword ptr [rcx]
140117d55: mov       qword ptr [rbp + 0x130], r9
140117d5c: mov       r9, qword ptr [rcx + 0x10]
140117d60: mov       qword ptr [rbp + 0x108], r9
140117d67: mov       ecx, dword ptr [rcx + 0x1c]
140117d6a: mov       dword ptr [rbp + 0x138], ecx
140117d70: mov       rax, qword ptr [rax]
140117d73: mov       qword ptr [rbp + 0x110], rax
140117d7a: movzx     eax, byte ptr [r8 + 0x38]
140117d7f: mov       byte ptr [rbp + 0x13e], al
140117d85: mov       eax, r10d
140117d88: sub       eax, dword ptr [rdx + 0x10]
140117d8b: cmp       eax, 0xc233b000
140117d90: mov       r14d, 0xc233b000
140117d96: cmovb     r14d, eax
140117d9a: mov       rbx, qword ptr [r12 + 0xf8]
140117da2: mov       rax, qword ptr [r12 + 0x100]
140117daa: lea       r13, [rbx + rax*4]
140117dae: movzx     eax, byte ptr [r12 + 0x108]
140117db7: mov       byte ptr [rbp + 0x13d], al
140117dbd: xor       r9d, r9d
140117dc0: mov       r8d, 8
140117dc6: xor       esi, esi
140117dc8: xor       r15d, r15d
140117dcb: mov       qword ptr [rbp + 0x128], 0
140117dd6: mov       qword ptr [rbp + 0x120], 0
140117de1: mov       dword ptr [rbp + 0x11c], r10d
140117de8: mov       qword ptr [rbp + 0xa0], r12
140117def: mov       dword ptr [rbp + 0xfc], r14d
140117df6: jmp       0x140117e23
140117df8: nop       dword ptr [rax + rax]
140117e00: mov       r10d, dword ptr [rbp + 0x11c]
140117e07: mov       r12, qword ptr [rbp + 0xa0]
140117e0e: mov       r14d, dword ptr [rbp + 0xfc]
140117e15: mov       r8, qword ptr [rbp + 0x100]
140117e1c: mov       r9, qword ptr [rbp + 0x98]
140117e23: cmp       byte ptr [rbp + 0x13d], 0
140117e2a: je        0x140117e8d
140117e2c: mov       qword ptr [rbp + 0x100], r8
140117e33: jmp       0x140117ff5
140117e38: nop       dword ptr [rax + rax]
140117e40: mov       qword ptr [rbp + 0x128], 0
140117e4b: mov       rdx, qword ptr [r12 + 0x120]
140117e53: call      0x144e4f270
140117e58: mov       r9, rax
140117e5b: mov       r8, qword ptr [r15 + 0x50]
140117e5f: mov       rsi, qword ptr [rsi]
140117e62: xor       r15d, r15d
140117e65: mov       r10d, dword ptr [rbp + 0x11c]
140117e6c: mov       eax, r15d
140117e6f: shl       rax, 4
140117e73: inc       r15d
140117e76: mov       ecx, dword ptr [r8 + rax + 8]
140117e7b: not       ecx
140117e7d: mov       eax, r10d
140117e80: sub       eax, dword ptr [r9 + rcx*4]
140117e84: cmp       eax, r14d
140117e87: jb        0x140118120
140117e8d: cmp       r15d, esi
140117e90: jne       0x140117e6c
140117e92: cmp       rbx, r13
140117e95: je        0x140118110
140117e9b: mov       ecx, dword ptr [rbx]
140117e9d: add       rbx, 4
140117ea1: mov       rax, qword ptr [rdi + 0x108]
140117ea8: lea       rcx, [rcx + rcx*4]
140117eac: shl       rcx, 5
140117eb0: cmp       qword ptr [rax + rcx + 0x58], 0
140117eb6: je        0x140117ed0
140117eb8: lea       r15, [rax + rcx]
140117ebc: lea       rsi, [rax + rcx]
140117ec0: add       rsi, 0x58
140117ec4: jmp       0x140117efd
140117ec6: nop       word ptr cs:[rax + rax]
140117ed0: cmp       rbx, r13
140117ed3: je        0x140118110
140117ed9: mov       eax, dword ptr [rbx]
140117edb: add       rbx, 4
140117edf: mov       r15, qword ptr [rdi + 0x108]
140117ee6: lea       rax, [rax + rax*4]
140117eea: shl       rax, 5
140117eee: cmp       qword ptr [r15 + rax + 0x58], 0
140117ef4: je        0x140117ed0
140117ef6: add       r15, rax
140117ef9: lea       rsi, [r15 + 0x58]
140117efd: mov       eax, dword ptr [r15 + 0x94]
140117f04: mov       r8, qword ptr [rdi + 0x1a8]
140117f0b: lea       rax, [rax + rax*8]
140117f0f: lea       rcx, [r8 + rax*8]
140117f13: mov       rdx, qword ptr [r12 + 0x110]
140117f1b: mov       rax, qword ptr [r8 + rax*8 + 0x40]
140117f20: cmp       rdx, rax
140117f23: jae       0x140117f60
140117f25: mov       r8, qword ptr [rcx + 0x38]
140117f29: mov       rdx, qword ptr [r8 + rdx*8]
140117f2d: test      rdx, rdx
140117f30: je        0x140117f60
140117f32: mov       r8, qword ptr [rcx + 0x18]
140117f36: not       rdx
140117f39: lea       rdx, [rdx + rdx*2]
140117f3d: shl       rdx, 4
140117f41: mov       rdx, qword ptr [r8 + rdx + 0x10]
140117f46: mov       qword ptr [rbp + 0x120], rdx
140117f4d: mov       rdx, qword ptr [r12 + 0x118]
140117f55: cmp       rdx, rax
140117f58: jae       0x140117e40
140117f5e: jmp       0x140117f7c
140117f60: mov       qword ptr [rbp + 0x120], 0
140117f6b: mov       rdx, qword ptr [r12 + 0x118]
140117f73: cmp       rdx, rax
140117f76: jae       0x140117e40
140117f7c: mov       rax, qword ptr [rcx + 0x38]
140117f80: mov       rax, qword ptr [rax + rdx*8]
140117f84: test      rax, rax
140117f87: je        0x140117e40
140117f8d: mov       rdx, qword ptr [rcx + 0x18]
140117f91: not       rax
140117f94: lea       rax, [rax + rax*2]
140117f98: shl       rax, 4
140117f9c: mov       rax, qword ptr [rdx + rax + 0x10]
140117fa1: mov       qword ptr [rbp + 0x128], rax
140117fa8: jmp       0x140117e4b
140117fad: nop       dword ptr [rax]
140117fb0: mov       qword ptr [rbp + 0x128], 0
140117fbb: mov       rdx, qword ptr [r12 + 0x120]
140117fc3: call      0x144e4f270
140117fc8: mov       r9, rax
140117fcb: mov       rsi, qword ptr [rsi]
140117fce: xor       r15d, r15d
140117fd1: mov       r10d, dword ptr [rbp + 0x11c]
140117fd8: mov       r8, qword ptr [rbp + 0x100]
140117fdf: mov       ecx, r15d
140117fe2: inc       r15d
140117fe5: mov       eax, r10d
140117fe8: sub       eax, dword ptr [r9 + rcx*4]
140117fec: cmp       eax, r14d
140117fef: jb        0x140118120
140117ff5: cmp       r15d, esi
140117ff8: jne       0x140117fdf
140117ffa: cmp       rbx, r13
140117ffd: je        0x140118110
140118003: mov       ecx, dword ptr [rbx]
140118005: add       rbx, 4
140118009: mov       rax, qword ptr [rdi + 0x1a8]
140118010: lea       rdx, [rcx + rcx*8]
140118014: cmp       qword ptr [rax + rdx*8 + 0x10], 0
14011801a: je        0x140118040
14011801c: lea       rcx, [rax + rdx*8]
140118020: lea       rsi, [rax + rdx*8]
140118024: add       rsi, 0x10
140118028: mov       rdx, qword ptr [r12 + 0x110]
140118030: mov       rax, qword ptr [rcx + 0x40]
140118034: cmp       rdx, rax
140118037: jae       0x1401180c0
14011803d: jmp       0x14011807b
14011803f: nop
140118040: cmp       rbx, r13
140118043: je        0x140118110
140118049: mov       ecx, dword ptr [rbx]
14011804b: add       rbx, 4
14011804f: mov       rax, qword ptr [rdi + 0x1a8]
140118056: lea       rcx, [rcx + rcx*8]
14011805a: cmp       qword ptr [rax + rcx*8 + 0x10], 0
140118060: je        0x140118040
140118062: lea       rcx, [rax + rcx*8]
140118066: lea       rsi, [rcx + 0x10]
14011806a: mov       rdx, qword ptr [r12 + 0x110]
140118072: mov       rax, qword ptr [rcx + 0x40]
140118076: cmp       rdx, rax
140118079: jae       0x1401180c0
14011807b: mov       r8, qword ptr [rcx + 0x38]
14011807f: mov       rdx, qword ptr [r8 + rdx*8]
140118083: test      rdx, rdx
140118086: je        0x1401180c0
140118088: mov       r8, qword ptr [rcx + 0x18]
14011808c: not       rdx
14011808f: lea       rdx, [rdx + rdx*2]
140118093: shl       rdx, 4
140118097: mov       rdx, qword ptr [r8 + rdx + 0x10]
14011809c: mov       qword ptr [rbp + 0x120], rdx
1401180a3: mov       rdx, qword ptr [r12 + 0x118]
1401180ab: cmp       rdx, rax
1401180ae: jae       0x140117fb0
1401180b4: jmp       0x1401180dc
1401180b6: nop       word ptr cs:[rax + rax]
1401180c0: mov       qword ptr [rbp + 0x120], 0
1401180cb: mov       rdx, qword ptr [r12 + 0x118]
1401180d3: cmp       rdx, rax
1401180d6: jae       0x140117fb0
1401180dc: mov       rax, qword ptr [rcx + 0x38]
1401180e0: mov       rax, qword ptr [rax + rdx*8]
1401180e4: test      rax, rax
1401180e7: je        0x140117fb0
1401180ed: mov       rdx, qword ptr [rcx + 0x18]
1401180f1: not       rax
1401180f4: lea       rax, [rax + rax*2]
1401180f8: shl       rax, 4
1401180fc: mov       rax, qword ptr [rdx + rax + 0x10]
140118101: mov       qword ptr [rbp + 0x128], rax
140118108: jmp       0x140117fbb
14011810d: nop       dword ptr [rax]
140118110: mov       r15d, esi
140118113: xor       eax, eax
140118115: test      rax, rax
140118118: jne       0x140118149
14011811a: jmp       0x14011847b
14011811f: nop
140118120: mov       rax, qword ptr [rbp + 0x120]
140118127: add       rax, rcx
14011812a: lea       rcx, [rcx + rcx*2]
14011812e: mov       rdx, qword ptr [rbp + 0x128]
140118135: lea       rcx, [rdx + rcx*8]
140118139: mov       qword ptr [rbp + 0xa8], rcx
140118140: test      rax, rax
140118143: je        0x14011847b
140118149: cmp       byte ptr [rax], 0
14011814c: jne       0x140117e23
140118152: mov       qword ptr [rbp + 0x98], r9
140118159: mov       qword ptr [rbp + 0x100], r8
140118160: lea       rcx, [rbp + 0xe0]
140118167: mov       r14, qword ptr [rbp + 0x130]
14011816e: mov       rdx, r14
140118171: mov       r12b, byte ptr [rbp + 0x13e]
140118178: mov       r8d, r12d
14011817b: call      0x14589e020
140118180: mov       byte ptr [rbp + 0x13f], 1
140118187: mov       rcx, r14
14011818a: mov       edx, r12d
14011818d: call      0x14589d0d0
140118192: nop
140118193: mov       r9, qword ptr [rbp + 0xa8]
14011819a: mov       rcx, qword ptr [r9]
14011819d: lea       rdx, [rip + 0x5cc017c]
1401181a4: movsxd    rcx, dword ptr [rdx + rcx*4]
1401181a8: add       rcx, rdx
1401181ab: jmp       rcx
1401181ad: mov       r8, qword ptr [r9 + 8]
1401181b1: mov       r9, qword ptr [r9 + 0x10]
1401181b5: mov       rcx, qword ptr [rbp + 0xb8]
1401181bc: mov       edx, dword ptr [rbp + 0x118]
1401181c2: mov       dword ptr [rcx], edx
1401181c4: mov       rcx, qword ptr [rbp + 0xb0]
1401181cb: mov       qword ptr [rcx + 0x58], r8
1401181cf: mov       qword ptr [rcx + 0x60], r9
1401181d3: mov       byte ptr [rbp + 0x13f], 1
1401181da: mov       dword ptr [rsp + 0x20], eax
1401181de: lea       rcx, [rbp + 0xe0]
1401181e5: mov       edx, r12d
1401181e8: call      0x14590f950
1401181ed: nop
1401181ee: test      al, al
1401181f0: je        0x140118450
1401181f6: mov       rax, qword ptr [rbp + 0x108]
1401181fd: mov       ecx, dword ptr [rbp + 0x138]
140118203: mov       dword ptr [rax], ecx
140118205: mov       rax, qword ptr [rbp + 0xf0]
14011820c: mov       qword ptr [rbp + 0xd0], rax
140118213: movups    xmm0, xmmword ptr [rbp + 0xe0]
14011821a: movaps    xmmword ptr [rbp + 0xc0], xmm0
140118221: mov       byte ptr [rbp + 0x13f], 0
140118228: mov       rcx, qword ptr [rbp + 0x130]
14011822f: mov       edx, r12d
140118232: lea       r8, [rbp + 0xc0]
140118239: call      0x1458a7b80
14011823e: nop
14011823f: mov       byte ptr [rbp + 0x13f], 0
140118246: lea       rcx, [rbp - 0x48]
14011824a: mov       rdx, qword ptr [rbp + 0x130]
140118251: mov       r8d, r12d
140118254: call      0x14589e020
140118259: nop
14011825a: mov       byte ptr [rbp - 0x30], r12b
14011825e: mov       dword ptr [rbp - 0x50], 0xe
140118265: mov       byte ptr [rbp + 0x13f], 0
14011826c: mov       rcx, qword ptr [rbp + 0x110]
140118273: lea       rdx, [rbp - 0x50]
140118277: call      0x1401838a0
14011827c: nop
14011827d: jmp       0x140117e00
140118282: mov       rax, qword ptr [rbp + 0x108]
140118289: mov       ecx, dword ptr [rbp + 0x138]
14011828f: mov       dword ptr [rax], ecx
140118291: mov       qword ptr [rbp + 0xc0], 0
14011829c: mov       qword ptr [rbp + 0xc8], 8
1401182a7: mov       qword ptr [rbp + 0xd0], 0
1401182b2: mov       byte ptr [rbp + 0x13f], 1
1401182b9: mov       rcx, qword ptr [rbp + 0x130]
1401182c0: mov       edx, r12d
1401182c3: lea       r8, [rbp + 0xc0]
1401182ca: call      0x1458a7b80
1401182cf: nop
1401182d0: mov       byte ptr [rbp + 0x13f], 1
1401182d7: lea       rcx, [rbp - 0x48]
1401182db: mov       rdx, qword ptr [rbp + 0x130]
1401182e2: mov       r8d, r12d
1401182e5: call      0x14589e020
1401182ea: nop
1401182eb: mov       byte ptr [rbp - 0x30], r12b
1401182ef: mov       dword ptr [rbp - 0x50], 0xe
1401182f6: mov       byte ptr [rbp + 0x13f], 1
1401182fd: mov       rcx, qword ptr [rbp + 0x110]
140118304: lea       rdx, [rbp - 0x50]
140118308: call      0x1401838a0
14011830d: nop
14011830e: jmp       0x140118450
140118313: mov       r14, qword ptr [r9 + 8]
140118317: mov       rax, qword ptr [rbp + 0x108]
14011831e: mov       ecx, dword ptr [rbp + 0x138]
140118324: mov       dword ptr [rax], ecx
140118326: mov       byte ptr [rbp + 0x13f], 1
14011832d: mov       rcx, qword ptr [rbp + 0x130]
140118334: mov       edx, r12d
140118337: mov       r8, r14
14011833a: call      0x14589c630
14011833f: nop
140118340: test      al, al
140118342: je        0x140118450
140118348: mov       byte ptr [rbp - 0x4c], r12b
14011834c: mov       byte ptr [rbp - 0x4b], r14b
140118350: mov       dword ptr [rbp - 0x50], 0xf
140118357: mov       byte ptr [rbp + 0x13f], 1
14011835e: mov       rcx, qword ptr [rbp + 0x110]
140118365: lea       rdx, [rbp - 0x50]
140118369: call      0x1401838a0
14011836e: nop
14011836f: jmp       0x140118450
140118374: mov       r8, qword ptr [r9 + 8]
140118378: mov       r9, qword ptr [r9 + 0x10]
14011837c: mov       rax, qword ptr [rbp + 0xb8]
140118383: mov       ecx, dword ptr [rbp + 0x118]
140118389: mov       dword ptr [rax], ecx
14011838b: mov       rax, qword ptr [rbp + 0xb0]
140118392: mov       qword ptr [rax + 0x58], r8
140118396: mov       qword ptr [rax + 0x60], r9
14011839a: mov       byte ptr [rbp + 0x13f], 1
1401183a1: lea       rcx, [rbp + 0xe0]
1401183a8: mov       edx, r12d
1401183ab: call      0x14590fdd0
1401183b0: nop
1401183b1: test      al, al
1401183b3: je        0x140118450
1401183b9: mov       rax, qword ptr [rbp + 0x108]
1401183c0: mov       ecx, dword ptr [rbp + 0x138]
1401183c6: mov       dword ptr [rax], ecx
1401183c8: mov       rax, qword ptr [rbp + 0xf0]
1401183cf: mov       qword ptr [rbp + 0xd0], rax
1401183d6: movups    xmm0, xmmword ptr [rbp + 0xe0]
1401183dd: movaps    xmmword ptr [rbp + 0xc0], xmm0
1401183e4: mov       byte ptr [rbp + 0x13f], 0
1401183eb: mov       rcx, qword ptr [rbp + 0x130]
1401183f2: mov       edx, r12d
1401183f5: lea       r8, [rbp + 0xc0]
1401183fc: call      0x1458a7b80
140118401: nop
140118402: mov       byte ptr [rbp + 0x13f], 0
140118409: lea       rcx, [rbp - 0x48]
14011840d: mov       rdx, qword ptr [rbp + 0x130]
140118414: mov       r8d, r12d
140118417: call      0x14589e020
14011841c: nop
14011841d: mov       byte ptr [rbp - 0x30], r12b
140118421: mov       dword ptr [rbp - 0x50], 0xe
140118428: mov       byte ptr [rbp + 0x13f], 0
14011842f: mov       rcx, qword ptr [rbp + 0x110]
140118436: lea       rdx, [rbp - 0x50]
14011843a: call      0x1401838a0
14011843f: nop
140118440: jmp       0x140117e00
140118445: nop       word ptr cs:[rax + rax]
140118450: mov       rdx, qword ptr [rbp + 0xe0]
140118457: test      rdx, rdx
14011845a: je        0x140117e00
140118460: mov       rcx, qword ptr [rbp + 0xe8]
140118467: shl       rdx, 4
14011846b: mov       r8d, 8
140118471: call      0x1400021d0
140118476: jmp       0x140117e00
14011847b: add       rsp, 0x1c8
140118482: pop       rbx
140118483: pop       rdi
140118484: pop       rsi
140118485: pop       r12
140118487: pop       r13
140118489: pop       r14
14011848b: pop       r15
14011848d: pop       rbp
14011848e: ret
