14085cea0: push       r15
14085cea2: push       r14
14085cea4: push       r13
14085cea6: push       r12
14085cea8: push       rsi
14085cea9: push       rdi
14085ceaa: push       rbp
14085ceab: push       rbx
14085ceac: sub        rsp, 0xe8
14085ceb3: movaps     xmmword ptr [rsp + 0xd0], xmm13
14085cebc: movaps     xmmword ptr [rsp + 0xc0], xmm12
14085cec5: movaps     xmmword ptr [rsp + 0xb0], xmm11
14085cece: movaps     xmmword ptr [rsp + 0xa0], xmm10
14085ced7: movaps     xmmword ptr [rsp + 0x90], xmm9
14085cee0: movaps     xmmword ptr [rsp + 0x80], xmm8
14085cee9: movaps     xmmword ptr [rsp + 0x70], xmm7
14085ceee: movaps     xmmword ptr [rsp + 0x60], xmm6
14085cef3: mov        r14, qword ptr [rsp + 0x158]
14085cefb: mov        rax, qword ptr [rsp + 0x150]
14085cf03: mov        rsi, qword ptr [rdx]
14085cf06: mov        rdi, qword ptr [rdx + 8]
14085cf0a: mov        ebx, dword ptr [rdx + 0x14]
14085cf0d: mov        rcx, qword ptr [r8]
14085cf10: mov        rdx, qword ptr [r9]
14085cf13: mov        r15, qword ptr [rax]
14085cf16: mov        eax, dword ptr [rip + 0x781b274]
14085cf1c: test       eax, eax
14085cf1e: jne        0x14085d3c5
14085cf24: mov        r8b, 1
14085cf27: xor        eax, eax
14085cf29: lock cmpxchg byte ptr [rip + 0x781b22e], r8b
14085cf32: jne        0x14085d3f4
14085cf38: mov        r12, qword ptr [rip + 0x7861aa9]
14085cf3f: mov        rax, qword ptr [r12]
14085cf43: shl        rax, 1
14085cf46: test       rax, rax
14085cf49: jne        0x14085d414
14085cf4f: xor        eax, eax
14085cf51: movzx      r8d, byte ptr [rip + 0x781b208]
14085cf59: cmp        dword ptr [rip + 0x781b204], 1
14085cf60: jne        0x14085d43c
14085cf66: cmp        byte ptr [rip + 0x781b220], 0
14085cf6d: je         0x14085d43c
14085cf73: movss      xmm9, dword ptr [rip + 0x781b1f4]
14085cf7c: movss      xmm8, dword ptr [rip + 0x781b1f3]
14085cf85: movss      xmm10, dword ptr [rip + 0x781b1e6]
14085cf8e: movss      xmm6, dword ptr [rip + 0x781b1e6]
14085cf96: movss      xmm7, dword ptr [rip + 0x781b1e2]
14085cf9e: movss      xmm11, dword ptr [rip + 0x781b1dd]
14085cfa7: movss      xmm13, dword ptr [rip + 0x781b1d8]
14085cfb0: test       al, al
14085cfb2: jne        0x14085cfc4
14085cfb4: mov        rax, qword ptr [r12]
14085cfb8: shl        rax, 1
14085cfbb: test       rax, rax
14085cfbe: jne        0x14085d55f
14085cfc4: xor        eax, eax
14085cfc6: xchg       byte ptr [rip + 0x781b194], al
14085cfcc: cmp        al, 2
14085cfce: je         0x14085d516
14085cfd4: xorps      xmm12, xmm12
14085cfd8: xorps      xmm1, xmm1
14085cfdb: test       rcx, rcx
14085cfde: je         0x14085d02c
14085cfe0: movaps     xmm0, xmmword ptr [rip + 0x5565209]
14085cfe7: movaps     xmm1, xmm9
14085cfeb: xorps      xmm1, xmm0
14085cfee: xorps      xmm0, xmm10
14085cff2: movss      dword ptr [rsp + 0x20], xmm0
14085cff8: movss      dword ptr [rsp + 0x24], xmm8
14085cfff: movss      dword ptr [rsp + 0x28], xmm1
14085d005: lea        r8, [rsp + 0x20]
14085d00a: call       0x14191c820
14085d00f: xorps      xmm1, xmm1
14085d012: test       al, 1
14085d014: je         0x14085d02c
14085d016: addss      xmm13, xmm0
14085d01b: subss      xmm13, xmm8
14085d020: xorps      xmm0, xmm0
14085d023: maxss      xmm13, xmm0
14085d028: movaps     xmm1, xmm13
14085d02c: movss      xmm0, dword ptr [r14]
14085d031: movss      xmm2, dword ptr [r15 + 0x58]
14085d037: addss      xmm2, xmm2
14085d03b: minss      xmm2, dword ptr [rip + 0x5565141]
14085d043: subss      xmm1, xmm0
14085d047: mulss      xmm2, xmm1
14085d04b: movaps     xmm1, xmmword ptr [rip + 0x556519e]
14085d052: xorps      xmm7, xmm1
14085d055: unpcklps   xmm7, xmm11
14085d059: xorps      xmm6, xmm1
14085d05c: movabs     rax, 0x3f8000003f800000
14085d066: mov        qword ptr [rsp + 0x3c], rax
14085d06b: mov        dword ptr [rsp + 0x44], 0x3f800000
14085d073: addss      xmm2, xmm0
14085d077: movss      dword ptr [r14], xmm2
14085d07c: mulss      xmm12, xmm2
14085d081: addss      xmm8, xmm2
14085d086: movaps     xmm0, xmm12
14085d08a: subss      xmm0, xmm10
14085d08f: subss      xmm12, xmm9
14085d094: movss      dword ptr [rsp + 0x30], xmm0
14085d09a: movss      dword ptr [rsp + 0x34], xmm8
14085d0a1: movss      dword ptr [rsp + 0x38], xmm12
14085d0a8: unpcklps   xmm0, xmm8
14085d0ac: subps      xmm7, xmm0
14085d0af: subss      xmm6, xmm12
14085d0b4: movlps     qword ptr [rsp + 0x50], xmm7
14085d0b9: movss      dword ptr [rsp + 0x58], xmm6
14085d0bf: lea        r8, [rip + 0x569533e]
14085d0c6: lea        rcx, [rsp + 0x20]
14085d0cb: lea        rdx, [rsp + 0x50]
14085d0d0: call       0x1407fc750
14085d0d5: movaps     xmm0, xmmword ptr [rsp + 0x20]
14085d0da: movaps     xmm1, xmmword ptr [rsp + 0x30]
14085d0df: movsd      xmm2, qword ptr [rsp + 0x40]
14085d0e5: mov        rax, qword ptr [rsp + 0x48]
14085d0ea: mov        rcx, qword ptr [rsi + 0xf8]
14085d0f1: mov        rdx, qword ptr [rsi + 0x100]
14085d0f8: lea        rdx, [rcx + rdx*4]
14085d0fc: cmp        byte ptr [rsi + 0x108], 0
14085d103: je         0x14085d24e
14085d109: movshdup   xmm3, xmm1
14085d10d: movaps     xmm4, xmm1
14085d110: unpckhpd   xmm4, xmm1
14085d114: movaps     xmm5, xmm1
14085d117: shufps     xmm5, xmm1, 0xff
14085d11b: movshdup   xmm6, xmm2
14085d11f: xor        r8d, r8d
14085d122: xor        r10d, r10d
14085d125: xor        r11d, r11d
14085d128: jmp        0x14085d146
14085d12a: nop        word ptr [rax + rax]
14085d130: mov        dword ptr [r9 + r14*4], ebx
14085d134: movaps     xmmword ptr [r15], xmm0
14085d138: movaps     xmmword ptr [r15 + 0x10], xmm1
14085d13d: movlps     qword ptr [r15 + 0x20], xmm2
14085d142: mov        qword ptr [r15 + 0x28], rax
14085d146: cmp        r11d, r8d
14085d149: jne        0x14085d1a4
14085d14b: nop        dword ptr [rax + rax]
14085d150: cmp        rcx, rdx
14085d153: je         0x14085d463
14085d159: mov        r8d, dword ptr [rcx]
14085d15c: add        rcx, 4
14085d160: mov        r9, qword ptr [rdi + 0x1a8]
14085d167: lea        r10, [r8 + r8*8]
14085d16b: mov        r8, qword ptr [r9 + r10*8 + 0x10]
14085d170: test       r8, r8
14085d173: je         0x14085d150
14085d175: lea        r9, [r9 + r10*8]
14085d179: mov        r10, qword ptr [rsi + 0x110]
14085d180: mov        r11, qword ptr [r9 + 0x18]
14085d184: mov        r9, qword ptr [r9 + 0x38]
14085d188: mov        r9, qword ptr [r9 + r10*8]
14085d18c: not        r9
14085d18f: lea        r9, [r9 + r9*2]
14085d193: shl        r9, 4
14085d197: mov        r10, qword ptr [r11 + r9 + 0x10]
14085d19c: mov        r9, qword ptr [r11 + r9 + 0x28]
14085d1a1: xor        r11d, r11d
14085d1a4: mov        r14d, r11d
14085d1a7: inc        r11d
14085d1aa: lea        r12, [r14 + r14*2]
14085d1ae: shl        r12, 4
14085d1b2: lea        r15, [r10 + r12]
14085d1b6: movss      xmm7, dword ptr [r10 + r12 + 0x10]
14085d1bd: ucomiss    xmm7, xmm1
14085d1c0: jne        0x14085d130
14085d1c6: jp         0x14085d130
14085d1cc: movss      xmm7, dword ptr [r15 + 0x14]
14085d1d2: ucomiss    xmm7, xmm3
14085d1d5: jne        0x14085d130
14085d1db: jp         0x14085d130
14085d1e1: movss      xmm7, dword ptr [r15 + 0x18]
14085d1e7: ucomiss    xmm7, xmm4
14085d1ea: jne        0x14085d130
14085d1f0: jp         0x14085d130
14085d1f6: movaps     xmm7, xmmword ptr [r15]
14085d1fa: cmpeqps    xmm7, xmm0
14085d1fe: movmskps   ebp, xmm7
14085d201: cmp        ebp, 0xf
14085d204: jne        0x14085d130
14085d20a: movss      xmm7, dword ptr [r15 + 0x1c]
14085d210: ucomiss    xmm7, xmm5
14085d213: jne        0x14085d130
14085d219: jp         0x14085d130
14085d21f: movss      xmm7, dword ptr [r15 + 0x20]
14085d225: ucomiss    xmm7, xmm2
14085d228: jne        0x14085d130
14085d22e: jp         0x14085d130
14085d234: movss      xmm7, dword ptr [r15 + 0x24]
14085d23a: ucomiss    xmm7, xmm6
14085d23d: jne        0x14085d130
14085d243: jnp        0x14085d146
14085d249: jmp        0x14085d130
14085d24e: movshdup   xmm3, xmm1
14085d252: movaps     xmm4, xmm1
14085d255: unpckhpd   xmm4, xmm1
14085d259: movaps     xmm5, xmm1
14085d25c: shufps     xmm5, xmm1, 0xff
14085d260: movshdup   xmm6, xmm2
14085d264: xor        r8d, r8d
14085d267: mov        r9d, 8
14085d26d: xor        r11d, r11d
14085d270: xor        ebp, ebp
14085d272: jmp        0x14085d296
14085d274: nop        word ptr cs:[rax + rax]
14085d280: mov        dword ptr [r10 + r14*4], ebx
14085d284: movaps     xmmword ptr [r15], xmm0
14085d288: movaps     xmmword ptr [r15 + 0x10], xmm1
14085d28d: movlps     qword ptr [r15 + 0x20], xmm2
14085d292: mov        qword ptr [r15 + 0x28], rax
14085d296: cmp        ebp, r8d
14085d299: jne        0x14085d30e
14085d29b: nop        dword ptr [rax + rax]
14085d2a0: cmp        rcx, rdx
14085d2a3: je         0x14085d463
14085d2a9: mov        r8d, dword ptr [rcx]
14085d2ac: add        rcx, 4
14085d2b0: mov        r9, qword ptr [rdi + 0x108]
14085d2b7: lea        r10, [r8 + r8*4]
14085d2bb: shl        r10, 5
14085d2bf: mov        r8, qword ptr [r9 + r10 + 0x58]
14085d2c4: test       r8, r8
14085d2c7: je         0x14085d2a0
14085d2c9: add        r9, r10
14085d2cc: mov        r10d, dword ptr [r9 + 0x94]
14085d2d3: mov        r11, qword ptr [rdi + 0x1a8]
14085d2da: lea        r10, [r10 + r10*8]
14085d2de: mov        r14, qword ptr [rsi + 0x110]
14085d2e5: mov        r15, qword ptr [r11 + r10*8 + 0x18]
14085d2ea: mov        r10, qword ptr [r11 + r10*8 + 0x38]
14085d2ef: mov        r10, qword ptr [r10 + r14*8]
14085d2f3: not        r10
14085d2f6: lea        r10, [r10 + r10*2]
14085d2fa: shl        r10, 4
14085d2fe: mov        r11, qword ptr [r15 + r10 + 0x10]
14085d303: mov        r10, qword ptr [r15 + r10 + 0x28]
14085d308: mov        r9, qword ptr [r9 + 0x50]
14085d30c: xor        ebp, ebp
14085d30e: mov        r14d, ebp
14085d311: shl        r14, 4
14085d315: inc        ebp
14085d317: mov        r14d, dword ptr [r9 + r14 + 8]
14085d31c: not        r14d
14085d31f: lea        r12, [r14 + r14*2]
14085d323: shl        r12, 4
14085d327: lea        r15, [r11 + r12]
14085d32b: movss      xmm7, dword ptr [r11 + r12 + 0x10]
14085d332: ucomiss    xmm7, xmm1
14085d335: jne        0x14085d280
14085d33b: jp         0x14085d280
14085d341: movss      xmm7, dword ptr [r15 + 0x14]
14085d347: ucomiss    xmm7, xmm3
14085d34a: jne        0x14085d280
14085d350: jp         0x14085d280
14085d356: movss      xmm7, dword ptr [r15 + 0x18]
14085d35c: ucomiss    xmm7, xmm4
14085d35f: jne        0x14085d280
14085d365: jp         0x14085d280
14085d36b: movaps     xmm7, xmmword ptr [r15]
14085d36f: cmpeqps    xmm7, xmm0
14085d373: movmskps   r12d, xmm7
14085d377: cmp        r12d, 0xf
14085d37b: jne        0x14085d280
14085d381: movss      xmm7, dword ptr [r15 + 0x1c]
14085d387: ucomiss    xmm7, xmm5
14085d38a: jne        0x14085d280
14085d390: jp         0x14085d280
14085d396: movss      xmm7, dword ptr [r15 + 0x20]
14085d39c: ucomiss    xmm7, xmm2
14085d39f: jne        0x14085d280
14085d3a5: jp         0x14085d280
14085d3ab: movss      xmm7, dword ptr [r15 + 0x24]
14085d3b1: ucomiss    xmm7, xmm6
14085d3b4: jne        0x14085d280
14085d3ba: jnp        0x14085d296
14085d3c0: jmp        0x14085d280
14085d3c5: lea        rax, [rip + 0x781ad94]
14085d3cc: mov        r12, rcx
14085d3cf: mov        rcx, rax
14085d3d2: mov        r13, rdx
14085d3d5: call       0x145c4aa3e
14085d3da: mov        rdx, r13
14085d3dd: mov        rcx, r12
14085d3e0: mov        r8b, 1
14085d3e3: xor        eax, eax
14085d3e5: lock cmpxchg byte ptr [rip + 0x781ad72], r8b
14085d3ee: je         0x14085cf38
14085d3f4: lea        rax, [rip + 0x781ad65]
14085d3fb: mov        r12, rcx
14085d3fe: mov        rcx, rax
14085d401: mov        r13, rdx
14085d404: call       0x145dbc1f0
14085d409: mov        rdx, r13
14085d40c: mov        rcx, r12
14085d40f: jmp        0x14085cf38
14085d414: mov        r13, rcx
14085d417: mov        rbp, rdx
14085d41a: call       0x145dbcf80
14085d41f: mov        rdx, rbp
14085d422: mov        rcx, r13
14085d425: xor        al, 1
14085d427: movzx      r8d, byte ptr [rip + 0x781ad32]
14085d42f: cmp        dword ptr [rip + 0x781ad2e], 1
14085d436: je         0x14085cf66
14085d43c: mov        dword ptr [r14], 0
14085d443: test       al, al
14085d445: jne        0x14085d457
14085d447: mov        rax, qword ptr [r12]
14085d44b: shl        rax, 1
14085d44e: test       rax, rax
14085d451: jne        0x14085d546
14085d457: xor        eax, eax
14085d459: xchg       byte ptr [rip + 0x781ad01], al
14085d45f: cmp        al, 2
14085d461: je         0x14085d4b7
14085d463: movaps     xmm6, xmmword ptr [rsp + 0x60]
14085d468: movaps     xmm7, xmmword ptr [rsp + 0x70]
14085d46d: movaps     xmm8, xmmword ptr [rsp + 0x80]
14085d476: movaps     xmm9, xmmword ptr [rsp + 0x90]
14085d47f: movaps     xmm10, xmmword ptr [rsp + 0xa0]
14085d488: movaps     xmm11, xmmword ptr [rsp + 0xb0]
14085d491: movaps     xmm12, xmmword ptr [rsp + 0xc0]
14085d49a: movaps     xmm13, xmmword ptr [rsp + 0xd0]
14085d4a3: add        rsp, 0xe8
14085d4aa: pop        rbx
14085d4ab: pop        rbp
14085d4ac: pop        rdi
14085d4ad: pop        rsi
14085d4ae: pop        r12
14085d4b0: pop        r13
14085d4b2: pop        r14
14085d4b4: pop        r15
14085d4b6: ret
14085d4b7: lea        rcx, [rip + 0x781aca2]
14085d4be: movaps     xmm6, xmmword ptr [rsp + 0x60]
14085d4c3: movaps     xmm7, xmmword ptr [rsp + 0x70]
14085d4c8: movaps     xmm8, xmmword ptr [rsp + 0x80]
14085d4d1: movaps     xmm9, xmmword ptr [rsp + 0x90]
14085d4da: movaps     xmm10, xmmword ptr [rsp + 0xa0]
14085d4e3: movaps     xmm11, xmmword ptr [rsp + 0xb0]
14085d4ec: movaps     xmm12, xmmword ptr [rsp + 0xc0]
14085d4f5: movaps     xmm13, xmmword ptr [rsp + 0xd0]
14085d4fe: add        rsp, 0xe8
14085d505: pop        rbx
14085d506: pop        rbp
14085d507: pop        rdi
14085d508: pop        rsi
14085d509: pop        r12
14085d50b: pop        r13
14085d50d: pop        r14
14085d50f: pop        r15
14085d511: jmp        0x145dbc2b0
14085d516: lea        rax, [rip + 0x781ac43]
14085d51d: mov        r12, rcx
14085d520: mov        rcx, rax
14085d523: mov        r13, rdx
14085d526: call       0x145dbc2b0
14085d52b: mov        rdx, r13
14085d52e: mov        rcx, r12
14085d531: xorps      xmm12, xmm12
14085d535: xorps      xmm1, xmm1
14085d538: test       rcx, rcx
14085d53b: jne        0x14085cfe0
14085d541: jmp        0x14085d02c
14085d546: call       0x145dbcf80
14085d54b: test       al, al
14085d54d: jne        0x14085d457
14085d553: mov        byte ptr [rip + 0x781ac07], 1
14085d55a: jmp        0x14085d457
14085d55f: mov        r12, rcx
14085d562: mov        r13, rdx
14085d565: call       0x145dbcf80
14085d56a: mov        rdx, r13
14085d56d: mov        rcx, r12
14085d570: test       al, al
14085d572: jne        0x14085cfc4
14085d578: mov        byte ptr [rip + 0x781abe2], 1
14085d57f: jmp        0x14085cfc4
