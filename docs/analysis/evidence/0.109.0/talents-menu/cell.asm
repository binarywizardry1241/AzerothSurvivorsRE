140107ad0: push      rbp
140107ad1: push      r15
140107ad3: push      r14
140107ad5: push      r13
140107ad7: push      r12
140107ad9: push      rsi
140107ada: push      rdi
140107adb: push      rbx
140107adc: sub       rsp, 0x8a8
140107ae3: lea       rbp, [rsp + 0x80]
140107aeb: movaps    xmmword ptr [rbp + 0x810], xmm9
140107af3: movaps    xmmword ptr [rbp + 0x800], xmm8
140107afb: movaps    xmmword ptr [rbp + 0x7f0], xmm7
140107b02: movaps    xmmword ptr [rbp + 0x7e0], xmm6
140107b09: mov       qword ptr [rbp + 0x7d8], 0xfffffffffffffffe
140107b14: mov       qword ptr [rbp + 0x7c8], r9
140107b1b: mov       qword ptr [rbp + 0x798], r8
140107b22: mov       qword ptr [rbp + 0x7a8], rdx
140107b29: mov       qword ptr [rbp + 0x7a0], rcx
140107b30: mov       rbx, qword ptr [rbp + 0x8a0]
140107b37: mov       rax, qword ptr [rbp + 0x898]
140107b3e: movzx     r14d, byte ptr [rbp + 0x890]
140107b46: mov       r15, qword ptr [rax + 0x20]
140107b4a: mov       rsi, qword ptr [rax + 0x28]
140107b4e: mov       rcx, rbx
140107b51: mov       rdx, r15
140107b54: mov       r8, rsi
140107b57: call      0x14590fa20
140107b5c: mov       r12d, eax
140107b5f: mov       byte ptr [rbp + 0x7d6], al
140107b65: cmp       byte ptr [rbp + 0x8b0], 0
140107b6c: je        0x140107b7e
140107b6e: mov       rdi, rbx
140107b71: mov       ebx, r14d
140107b74: mov       r14, rsi
140107b77: mov       r13, r15
140107b7a: xor       eax, eax
140107b7c: jmp       0x140107ba5
140107b7e: mov       eax, dword ptr [rbp + 0x8a8]
140107b84: mov       dword ptr [rsp + 0x20], eax
140107b88: mov       rdi, rbx
140107b8b: mov       rcx, rbx
140107b8e: mov       ebx, r14d
140107b91: mov       edx, r14d
140107b94: mov       r13, r15
140107b97: mov       r8, r15
140107b9a: mov       r14, rsi
140107b9d: mov       r9, rsi
140107ba0: call      0x145910250
140107ba5: mov       byte ptr [rbp + 0x7d7], al
140107bab: test      r12b, r12b
140107bae: setne     r15b
140107bb2: or        r15b, al
140107bb5: test      r15b, 1
140107bb9: mov       rsi, qword ptr [rbp + 0x898]
140107bc0: jne       0x140107be8
140107bc2: mov       dword ptr [rsp + 0x20], 0xffffffff
140107bca: mov       rcx, rdi
140107bcd: mov       edx, ebx
140107bcf: mov       r8, r13
140107bd2: mov       r9, r14
140107bd5: call      0x145910250
140107bda: test      al, al
140107bdc: jne       0x140107be8
140107bde: movss     xmm7, dword ptr [rip + 0x5ccb24e]
140107be6: jmp       0x140107bf0
140107be8: movss     xmm7, dword ptr [rip + 0x5cc54a4]
140107bf0: mov       rax, qword ptr [rbp + 0x7c8]
140107bf7: movzx     ebx, byte ptr [rsi + 0x72]
140107bfb: cmp       r12b, bl
140107bfe: setae     byte ptr [rbp + 0x7d5]
140107c05: mov       rcx, qword ptr [rax + 0x58]
140107c09: test      rcx, rcx
140107c0c: je        0x140107c23
140107c0e: cmp       qword ptr [rax + 0x60], r14
140107c12: jne       0x140107c23
140107c14: mov       rdx, r13
140107c17: mov       r8, r14
140107c1a: call      0x145bfa0e1
140107c1f: test      eax, eax
140107c21: je        0x140107c64
140107c23: cmp       r12b, bl
140107c26: jb        0x140107c31
140107c28: movups    xmm0, xmmword ptr [rip + 0x5cce669]
140107c2f: jmp       0x140107c86
140107c31: test      r15b, 1
140107c35: je        0x140107c40
140107c37: movups    xmm0, xmmword ptr [rip + 0x5ccebb2]
140107c3e: jmp       0x140107c86
140107c40: mov       rcx, rsi
140107c43: call      0x14590f1f0
140107c48: test      al, al
140107c4a: je        0x140107c7f
140107c4c: movups    xmm0, xmmword ptr [rip + 0x5cced51]
140107c53: movaps    xmmword ptr [rbp + 0x7b0], xmm0
140107c5a: movss     xmm6, dword ptr [rip + 0x5cc549a]
140107c62: jmp       0x140107c95
140107c64: movups    xmm0, xmmword ptr [rip + 0x5cceba1]
140107c6b: movaps    xmmword ptr [rbp + 0x7b0], xmm0
140107c72: movss     xmm6, dword ptr [rip + 0x5c95626]
140107c7a: mov       dil, 1
140107c7d: jmp       0x140107c97
140107c7f: movups    xmm0, xmmword ptr [rip + 0x5cce63e]
140107c86: movaps    xmmword ptr [rbp + 0x7b0], xmm0
140107c8d: movss     xmm6, dword ptr [rip + 0x5c9560b]
140107c95: xor       edi, edi
140107c97: movzx     eax, byte ptr [rsi + 0x71]
140107c9b: cvtsi2ss  xmm8, eax
140107ca0: movss     xmm0, dword ptr [rip + 0x5c955fc]
140107ca8: addss     xmm8, xmm0
140107cad: mulss     xmm8, dword ptr [rip + 0x5ccd02a]
140107cb6: movss     xmm1, dword ptr [rip + 0x5ccd026]
140107cbe: addss     xmm8, xmm1
140107cc3: movzx     eax, byte ptr [rsi + 0x70]
140107cc7: cvtsi2ss  xmm9, eax
140107ccc: addss     xmm9, xmm0
140107cd1: mulss     xmm9, dword ptr [rip + 0x5ccd00e]
140107cda: addss     xmm9, xmm1
140107cdf: mov       rcx, rsi
140107ce2: call      0x14590f1f0
140107ce7: test      al, al
140107ce9: jne       0x140107cf5
140107ceb: movss     xmm0, dword ptr [rip + 0x5cc522d]
140107cf3: jmp       0x140107cfd
140107cf5: movss     xmm0, dword ptr [rip + 0x5c95613]
140107cfd: mov       word ptr [rbp + 0x6c4], 0
140107d06: mov       byte ptr [rbp + 0x6b4], 1
140107d0d: mov       dword ptr [rbp + 0x5c8], 1
140107d17: movss     dword ptr [rbp + 0x5cc], xmm8
140107d20: mov       qword ptr [rbp + 0x5d0], 0
140107d2b: mov       dword ptr [rbp + 0x5d8], 1
140107d35: movss     dword ptr [rbp + 0x5dc], xmm9
140107d3e: movaps    xmm1, xmmword ptr [rip + 0x5cccfab]
140107d45: movaps    xmmword ptr [rbp + 0x5e0], xmm1
140107d4c: movabs    rax, 0x4238000000000001
140107d56: mov       qword ptr [rbp + 0x5f0], rax
140107d5d: mov       qword ptr [rbp + 0x5c0], 0
140107d68: xorps     xmm1, xmm1
140107d6b: movups    xmmword ptr [rbp + 0x5f8], xmm1
140107d72: movups    xmmword ptr [rbp + 0x608], xmm1
140107d79: mov       word ptr [rbp + 0x6dc], 0
140107d82: mov       dword ptr [rbp + 0x6d8], 0
140107d8c: movups    xmm1, xmmword ptr [rip + 0x5cce055]
140107d93: movups    xmmword ptr [rbp + 0x618], xmm1
140107d9a: movups    xmm1, xmmword ptr [rip + 0x5cce057]
140107da1: movups    xmmword ptr [rbp + 0x628], xmm1
140107da8: movups    xmm1, xmmword ptr [rip + 0x5cce069]
140107daf: movups    xmmword ptr [rbp + 0x648], xmm1
140107db6: movups    xmm1, xmmword ptr [rip + 0x5cce04b]
140107dbd: movups    xmmword ptr [rbp + 0x638], xmm1
140107dc4: movaps    xmm1, xmmword ptr [rip + 0x5c95485]
140107dcb: movups    xmmword ptr [rbp + 0x658], xmm1
140107dd2: movups    xmmword ptr [rbp + 0x668], xmm1
140107dd9: mov       dword ptr [rbp + 0x678], 1
140107de3: movss     dword ptr [rbp + 0x67c], xmm0
140107deb: mov       dword ptr [rbp + 0x680], 1
140107df5: movss     dword ptr [rbp + 0x684], xmm0
140107dfd: mov       dword ptr [rbp + 0x688], 1
140107e07: movss     dword ptr [rbp + 0x68c], xmm0
140107e0f: mov       dword ptr [rbp + 0x690], 1
140107e19: movss     dword ptr [rbp + 0x694], xmm0
140107e21: mov       byte ptr [rbp + 0x6d6], 0
140107e28: mov       dword ptr [rbp + 0x6d2], 0x100
140107e32: mov       qword ptr [rbp + 0x6b8], 0
140107e3d: mov       dword ptr [rbp + 0x6c0], 0x3f800000
140107e47: movaps    xmm0, xmmword ptr [rip + 0x5c95422]
140107e4e: movups    xmmword ptr [rbp + 0x698], xmm0
140107e55: mov       dword ptr [rbp + 0x6a8], 1
140107e5f: mov       qword ptr [rbp + 0x6ac], 0
140107e6a: mov       byte ptr [rbp + 0x6d7], 0
140107e71: movups    xmm0, xmmword ptr [rip + 0x5ccdeb8]
140107e78: movaps    xmmword ptr [rbp + 0x560], xmm0
140107e7f: mov       qword ptr [rbp + 0x570], 0
140107e8a: movups    xmm0, xmmword ptr [rip + 0x5ccdeb7]
140107e91: movups    xmmword ptr [rbp + 0x578], xmm0
140107e98: mov       qword ptr [rbp + 0x588], 0
140107ea3: movups    xmm0, xmmword ptr [rip + 0x5ccdeb6]
140107eaa: movaps    xmmword ptr [rbp + 0x590], xmm0
140107eb1: mov       qword ptr [rbp + 0x5a0], 0
140107ebc: movups    xmm0, xmmword ptr [rip + 0x5ccdeb5]
140107ec3: movups    xmmword ptr [rbp + 0x5a8], xmm0
140107eca: mov       qword ptr [rbp + 0x5b8], 0
140107ed5: mov       word ptr [rbp + 0x6ca], 0
140107ede: mov       dword ptr [rbp + 0x6c6], 0x10000
140107ee8: mov       word ptr [rbp + 0x6d0], 0
140107ef1: mov       dword ptr [rbp + 0x6cc], 0x10000
140107efb: mov       r8, qword ptr [rsi + 0x40]
140107eff: mov       r9, qword ptr [rsi + 0x48]
140107f03: lea       rcx, [rbp + 0x1e8]
140107f0a: mov       rdx, qword ptr [rbp + 0x798]
140107f11: call      0x1401008c0
140107f16: nop
140107f17: test      r12b, r12b
140107f1a: setne     al
140107f1d: or        al, byte ptr [rbp + 0x7d7]
140107f23: movzx     ecx, al
140107f26: mov       eax, ecx
140107f28: and       eax, 1
140107f2b: test      cl, 1
140107f2e: je        0x140107f38
140107f30: movss     xmm7, dword ptr [rip + 0x5c95368]
140107f38: movups    xmm0, xmmword ptr [rip + 0x5cce9ed]
140107f3f: movups    xmmword ptr [rbp + 0x720], xmm0
140107f46: movabs    rcx, 0x23f800000
140107f50: mov       qword ptr [rbp + 0x730], rcx
140107f57: movups    xmm0, xmmword ptr [rip + 0x5cce9e2]
140107f5e: movups    xmmword ptr [rbp + 0x708], xmm0
140107f65: mov       qword ptr [rbp + 0x718], 0x46
140107f70: mov       byte ptr [rbp + 0x6e8], 2
140107f77: mov       word ptr [rbp + 0x76c], 0
140107f80: mov       dword ptr [rbp + 0x758], 0
140107f8a: mov       dword ptr [rbp + 0x508], eax
140107f90: movaps    xmm0, xmmword ptr [rip + 0x5c954a9]
140107f97: movss     xmm0, xmm7
140107f9b: shufps    xmm0, xmm0, 0x40
140107f9f: movups    xmmword ptr [rbp + 0x50c], xmm0
140107fa6: movups    xmm0, xmmword ptr [rbp + 0x1e8]
140107fad: movaps    xmmword ptr [rbp + 0x4f0], xmm0
140107fb4: mov       rax, qword ptr [rbp + 0x1f8]
140107fbb: mov       qword ptr [rbp + 0x500], rax
140107fc2: movups    xmm0, xmmword ptr [rbp + 0x6f8]
140107fc9: movaps    xmmword ptr [rbp + 0x4e0], xmm0
140107fd0: movzx     eax, byte ptr [rbp + 0x6e8]
140107fd7: mov       byte ptr [rbp + 0x4d0], al
140107fdd: mov       rax, qword ptr [rbp + 0x6e9]
140107fe4: mov       qword ptr [rbp + 0x4d1], rax
140107feb: mov       eax, dword ptr [rbp + 0x6f1]
140107ff1: mov       dword ptr [rbp + 0x4d9], eax
140107ff7: movzx     eax, word ptr [rbp + 0x6f5]
140107ffe: mov       word ptr [rbp + 0x4dd], ax
140108005: movzx     eax, byte ptr [rbp + 0x6f7]
14010800c: mov       byte ptr [rbp + 0x4df], al
140108012: mov       word ptr [rbp + 0x554], 0
14010801b: movups    xmm0, xmmword ptr [rbp + 0x758]
140108022: movaps    xmmword ptr [rbp + 0x540], xmm0
140108029: mov       eax, dword ptr [rbp + 0x768]
14010802f: mov       dword ptr [rbp + 0x550], eax
140108035: movups    xmm0, xmmword ptr [rbp + 0x734]
14010803c: movups    xmmword ptr [rbp + 0x51c], xmm0
140108043: movups    xmm0, xmmword ptr [rbp + 0x744]
14010804a: movups    xmmword ptr [rbp + 0x52c], xmm0
140108051: mov       eax, dword ptr [rbp + 0x754]
140108057: mov       dword ptr [rbp + 0x53c], eax
14010805d: mov       rcx, rsi
140108060: call      0x14590f1f0
140108065: nop
140108066: test      al, al
140108068: je        0x140108090
14010806a: xor       eax, eax
14010806c: test      r12b, r12b
14010806f: setne     al
140108072: lea       rcx, [rip + 0x5cccc87]
140108079: movss     xmm0, dword ptr [rcx + rax*4]
14010807e: movups    xmm1, xmmword ptr [rip + 0x5cce91f]
140108085: movaps    xmmword ptr [rbp - 0x30], xmm1
140108089: movss     dword ptr [rbp - 0x20], xmm0
14010808e: jmp       0x1401080bb
140108090: test      dil, dil
140108093: je        0x1401080a9
140108095: movups    xmm0, xmmword ptr [rip + 0x5cce1fc]
14010809c: movaps    xmmword ptr [rbp - 0x30], xmm0
1401080a0: mov       dword ptr [rbp - 0x20], 0x3f4ccccd
1401080a7: jmp       0x1401080bb
1401080a9: movups    xmm0, xmmword ptr [rip + 0x5ccd9e0]
1401080b0: movaps    xmmword ptr [rbp - 0x30], xmm0
1401080b4: mov       dword ptr [rbp - 0x20], 0x3f59999a
1401080bb: mov       rcx, rsi
1401080be: call      0x14590f1f0
1401080c3: nop
1401080c4: test      al, al
1401080c6: jne       0x1401080cd
1401080c8: xorps     xmm7, xmm7
1401080cb: jmp       0x1401080d5
1401080cd: movss     xmm7, dword ptr [rip + 0x5cccc33]
1401080d5: mov       rcx, rsi
1401080d8: call      0x14590f1f0
1401080dd: nop
1401080de: mov       bl, al
1401080e0: lea       rcx, [rbp + 0x770]
1401080e7: lea       rdx, [rbp - 0x30]
1401080eb: call      0x144c7dcf0
1401080f0: nop
1401080f1: test      bl, bl
1401080f3: jne       0x1401080ff
1401080f5: movss     xmm0, dword ptr [rip + 0x5cc4e23]
1401080fd: jmp       0x140108107
1401080ff: movss     xmm0, dword ptr [rip + 0x5c95279]
140108107: movaps    xmm1, xmmword ptr [rbp + 0x770]
14010810e: movups    xmmword ptr [rbp + 0x1ec], xmm1
140108115: mov       dword ptr [rbp + 0x1e8], 1
14010811f: movss     dword ptr [rsp + 0x48], xmm0
140108125: movss     dword ptr [rsp + 0x38], xmm7
14010812b: mov       dword ptr [rsp + 0x40], 1
140108133: mov       dword ptr [rsp + 0x30], 1
14010813b: mov       dword ptr [rsp + 0x28], 0
140108143: mov       dword ptr [rsp + 0x20], 1
14010814b: lea       rcx, [rbp + 0x4b8]
140108152: lea       rdx, [rbp + 0x1e8]
140108159: xorps     xmm3, xmm3
14010815c: mov       r8d, 1
140108162: call      0x142649b80
140108167: nop
140108168: movaps    xmm0, xmmword ptr [rbp + 0x7b0]
14010816f: movups    xmmword ptr [rbp + 0x458], xmm0
140108176: lea       rdi, [rbp - 0x30]
14010817a: lea       rdx, [rbp + 0x560]
140108181: mov       r8d, 0x180
140108187: mov       rcx, rdi
14010818a: call      0x145bfa0e7
14010818f: movaps    xmm0, xmmword ptr [rbp + 0x7b0]
140108196: movups    xmmword ptr [rbp + 0x1d8], xmm0
14010819d: movups    xmmword ptr [rbp + 0x40c], xmm0
1401081a4: movups    xmmword ptr [rbp + 0x420], xmm0
1401081ab: movups    xmmword ptr [rbp + 0x434], xmm0
1401081b2: lea       rcx, [rbp + 0x150]
1401081b9: lea       rdx, [rbp + 0x4d0]
1401081c0: mov       r8d, 0x88
1401081c6: call      0x145bfa0e7
1401081cb: movups    xmm0, xmmword ptr [rbp + 0x4b8]
1401081d2: movups    xmmword ptr [rbp + 0x777], xmm0
1401081d9: mov       rax, qword ptr [rbp + 0x4c8]
1401081e0: mov       qword ptr [rbp + 0x787], rax
1401081e7: mov       r15, qword ptr [rbp + 0x7a0]
1401081ee: mov       rbx, qword ptr [r15]
1401081f1: add       r15, 8
1401081f5: lea       rcx, [rbp + 0x1f0]
1401081fc: mov       r8d, 0x218
140108202: mov       rdx, rdi
140108205: call      0x145bfa0e7
14010820a: movss     dword ptr [rbp + 0x408], xmm6
140108212: movss     dword ptr [rbp + 0x41c], xmm6
14010821a: movss     dword ptr [rbp + 0x430], xmm6
140108222: movss     dword ptr [rbp + 0x444], xmm6
14010822a: mov       qword ptr [rbp + 0x448], r13
140108231: mov       qword ptr [rbp + 0x450], r14
140108238: movss     dword ptr [rbp + 0x468], xmm6
140108240: movups    xmm0, xmmword ptr [rip + 0x5cce5c5]
140108247: movups    xmmword ptr [rbp + 0x46c], xmm0
14010824e: mov       qword ptr [rbp + 0x47c], 0x3f800000
140108259: movups    xmm0, xmmword ptr [rip + 0x5cce6b8]
140108260: movups    xmmword ptr [rbp + 0x484], xmm0
140108267: mov       dword ptr [rbp + 0x494], 0x3f800000
140108271: mov       byte ptr [rbp + 0x498], 2
140108278: movups    xmm0, xmmword ptr [rbp + 0x770]
14010827f: movups    xmm1, xmmword ptr [rbp + 0x77f]
140108286: movups    xmmword ptr [rbp + 0x499], xmm0
14010828d: movups    xmmword ptr [rbp + 0x4a8], xmm1
140108294: mov       qword ptr [rbp + 0x1e8], rbx
14010829b: lea       r9, [rip + 0x5ccd18e]
1401082a2: lea       rcx, [rbp + 0x560]
1401082a9: lea       r8, [rbp + 0x1e8]
1401082b0: mov       rdx, r15
1401082b3: call      0x1401f2110
1401082b8: nop
1401082b9: cmp       byte ptr [rbp + 0x708], 0
1401082c0: jne       0x1401082db
1401082c2: mov       rax, qword ptr [rbp + 0x710]
1401082c9: lock dec  qword ptr [rax]
1401082cd: jne       0x1401082db
1401082cf: lea       rcx, [rbp + 0x710]
1401082d6: call      0x144985170
1401082db: cmp       byte ptr [rbp + 0x8b0], 0
1401082e2: jne       0x140108346
1401082e4: mov       rdi, qword ptr [rbp + 0x578]
1401082eb: test      rdi, rdi
1401082ee: jne       0x1401082f7
1401082f0: mov       rdi, qword ptr [rbp + 0x580]
1401082f7: mov       r15, qword ptr [rbp + 0x560]
1401082fe: mov       rax, qword ptr [rdi]
140108301: mov       rbx, qword ptr [rdi + 0x10]
140108305: sub       rax, rbx
140108308: cmp       rax, 0x2f
14010830c: jbe       0x1401083ca
140108312: mov       rax, qword ptr [rdi + 8]
140108316: lea       rcx, [rip + 0x177db3]
14010831d: mov       qword ptr [rax + rbx], rcx
140108321: mov       qword ptr [rax + rbx + 8], 0
14010832a: mov       qword ptr [rax + rbx + 0x10], r13
14010832f: mov       qword ptr [rax + rbx + 0x18], r14
140108334: mov       byte ptr [rax + rbx + 0x20], 0
140108339: mov       qword ptr [rax + rbx + 0x28], r15
14010833e: add       rbx, 0x30
140108342: mov       qword ptr [rdi + 0x10], rbx
140108346: mov       rax, qword ptr [rbp + 0x7a8]
14010834d: mov       qword ptr [rbp + 0x1e8], rax
140108354: lea       rax, [rbp + 0x7d5]
14010835b: mov       qword ptr [rbp + 0x1f0], rax
140108362: lea       rax, [rbp + 0x7d6]
140108369: mov       qword ptr [rbp + 0x1f8], rax
140108370: lea       rax, [rbp + 0x7d7]
140108377: mov       qword ptr [rbp + 0x200], rax
14010837e: mov       qword ptr [rbp + 0x208], rsi
140108385: lea       rcx, [rbp + 0x560]
14010838c: lea       rdx, [rbp + 0x1e8]
140108393: call      0x14026b440
140108398: movaps    xmm6, xmmword ptr [rbp + 0x7e0]
14010839f: movaps    xmm7, xmmword ptr [rbp + 0x7f0]
1401083a6: movaps    xmm8, xmmword ptr [rbp + 0x800]
1401083ae: movaps    xmm9, xmmword ptr [rbp + 0x810]
1401083b6: add       rsp, 0x8a8
1401083bd: pop       rbx
1401083be: pop       rdi
1401083bf: pop       rsi
1401083c0: pop       r12
1401083c2: pop       r13
1401083c4: pop       r14
1401083c6: pop       r15
1401083c8: pop       rbp
1401083c9: ret
1401083ca: mov       qword ptr [rsp + 0x20], 1
1401083d3: mov       r8d, 0x30
1401083d9: mov       r9d, 1
1401083df: mov       rcx, rdi
1401083e2: mov       rdx, rbx
1401083e5: call      0x145bfa970
1401083ea: jmp       0x140108312
