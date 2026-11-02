14084f860: push      r15
14084f862: push      r14
14084f864: push      r13
14084f866: push      r12
14084f868: push      rsi
14084f869: push      rdi
14084f86a: push      rbp
14084f86b: push      rbx
14084f86c: sub       rsp, 0xe8
14084f873: movaps    xmmword ptr [rsp + 0xd0], xmm13
14084f87c: movaps    xmmword ptr [rsp + 0xc0], xmm12
14084f885: movaps    xmmword ptr [rsp + 0xb0], xmm11
14084f88e: movaps    xmmword ptr [rsp + 0xa0], xmm10
14084f897: movaps    xmmword ptr [rsp + 0x90], xmm9
14084f8a0: movaps    xmmword ptr [rsp + 0x80], xmm8
14084f8a9: movaps    xmmword ptr [rsp + 0x70], xmm7
14084f8ae: movaps    xmmword ptr [rsp + 0x60], xmm6
14084f8b3: mov       r14, qword ptr [rsp + 0x158]
14084f8bb: mov       rax, qword ptr [rsp + 0x150]
14084f8c3: mov       rsi, qword ptr [rdx]
14084f8c6: mov       rdi, qword ptr [rdx + 8]
14084f8ca: mov       ebx, dword ptr [rdx + 0x14]
14084f8cd: mov       rcx, qword ptr [r8]
14084f8d0: mov       rdx, qword ptr [r9]
14084f8d3: mov       r15, qword ptr [rax]
14084f8d6: mov       eax, dword ptr [rip + 0x77f492c]
14084f8dc: test      eax, eax
14084f8de: jne       0x14084fd85
14084f8e4: mov       r8b, 1
14084f8e7: xor       eax, eax
14084f8e9: lock cmpxchg byte ptr [rip + 0x77f48e6], r8b
14084f8f2: jne       0x14084fdb4
14084f8f8: mov       r12, qword ptr [rip + 0x783b0e9]
14084f8ff: mov       rax, qword ptr [r12]
14084f903: shl       rax, 1
14084f906: test      rax, rax
14084f909: jne       0x14084fdd4
14084f90f: xor       eax, eax
14084f911: movzx     r8d, byte ptr [rip + 0x77f48c0]
14084f919: cmp       dword ptr [rip + 0x77f48bc], 1
14084f920: jne       0x14084fdfc
14084f926: cmp       byte ptr [rip + 0x77f48d8], 0
14084f92d: je        0x14084fdfc
14084f933: movss     xmm9, dword ptr [rip + 0x77f48ac]
14084f93c: movss     xmm8, dword ptr [rip + 0x77f48ab]
14084f945: movss     xmm10, dword ptr [rip + 0x77f489e]
14084f94e: movss     xmm6, dword ptr [rip + 0x77f489e]
14084f956: movss     xmm7, dword ptr [rip + 0x77f489a]
14084f95e: movss     xmm11, dword ptr [rip + 0x77f4895]
14084f967: movss     xmm13, dword ptr [rip + 0x77f4890]
14084f970: test      al, al
14084f972: jne       0x14084f984
14084f974: mov       rax, qword ptr [r12]
14084f978: shl       rax, 1
14084f97b: test      rax, rax
14084f97e: jne       0x14084ff1f
14084f984: xor       eax, eax
14084f986: xchg      byte ptr [rip + 0x77f484c], al
14084f98c: cmp       al, 2
14084f98e: je        0x14084fed6
14084f994: xorps     xmm12, xmm12
14084f998: xorps     xmm1, xmm1
14084f99b: test      rcx, rcx
14084f99e: je        0x14084f9ec
14084f9a0: movaps    xmm0, xmmword ptr [rip + 0x557d6f9]
14084f9a7: movaps    xmm1, xmm9
14084f9ab: xorps     xmm1, xmm0
14084f9ae: xorps     xmm0, xmm10
14084f9b2: movss     dword ptr [rsp + 0x20], xmm0
14084f9b8: movss     dword ptr [rsp + 0x24], xmm8
14084f9bf: movss     dword ptr [rsp + 0x28], xmm1
14084f9c5: lea       r8, [rsp + 0x20]
14084f9ca: call      0x1417080b0
14084f9cf: xorps     xmm1, xmm1
14084f9d2: test      al, 1
14084f9d4: je        0x14084f9ec
14084f9d6: addss     xmm13, xmm0
14084f9db: subss     xmm13, xmm8
14084f9e0: xorps     xmm0, xmm0
14084f9e3: maxss     xmm13, xmm0
14084f9e8: movaps    xmm1, xmm13
14084f9ec: movss     xmm0, dword ptr [r14]
14084f9f1: movss     xmm2, dword ptr [r15 + 0x58]
14084f9f7: addss     xmm2, xmm2
14084f9fb: minss     xmm2, dword ptr [rip + 0x554d89d]
14084fa03: subss     xmm1, xmm0
14084fa07: mulss     xmm2, xmm1
14084fa0b: movaps    xmm1, xmmword ptr [rip + 0x557d68e]
14084fa12: xorps     xmm7, xmm1
14084fa15: unpcklps  xmm7, xmm11
14084fa19: xorps     xmm6, xmm1
14084fa1c: movabs    rax, 0x3f8000003f800000
14084fa26: mov       qword ptr [rsp + 0x3c], rax
14084fa2b: mov       dword ptr [rsp + 0x44], 0x3f800000
14084fa33: addss     xmm2, xmm0
14084fa37: movss     dword ptr [r14], xmm2
14084fa3c: mulss     xmm12, xmm2
14084fa41: addss     xmm8, xmm2
14084fa46: movaps    xmm0, xmm12
14084fa4a: subss     xmm0, xmm10
14084fa4f: subss     xmm12, xmm9
14084fa54: movss     dword ptr [rsp + 0x30], xmm0
14084fa5a: movss     dword ptr [rsp + 0x34], xmm8
14084fa61: movss     dword ptr [rsp + 0x38], xmm12
14084fa68: unpcklps  xmm0, xmm8
14084fa6c: subps     xmm7, xmm0
14084fa6f: subss     xmm6, xmm12
14084fa74: movlps    qword ptr [rsp + 0x50], xmm7
14084fa79: movss     dword ptr [rsp + 0x58], xmm6
14084fa7f: lea       r8, [rip + 0x56700aa]
14084fa86: lea       rcx, [rsp + 0x20]
14084fa8b: lea       rdx, [rsp + 0x50]
14084fa90: call      0x1407e6e70
14084fa95: movaps    xmm0, xmmword ptr [rsp + 0x20]
14084fa9a: movaps    xmm1, xmmword ptr [rsp + 0x30]
14084fa9f: movsd     xmm2, qword ptr [rsp + 0x40]
14084faa5: mov       rax, qword ptr [rsp + 0x48]
14084faaa: mov       rcx, qword ptr [rsi + 0xf8]
14084fab1: mov       rdx, qword ptr [rsi + 0x100]
14084fab8: lea       rdx, [rcx + rdx*4]
14084fabc: cmp       byte ptr [rsi + 0x108], 0
14084fac3: je        0x14084fc0e
14084fac9: movshdup  xmm3, xmm1
14084facd: movaps    xmm4, xmm1
14084fad0: unpckhpd  xmm4, xmm1
14084fad4: movaps    xmm5, xmm1
14084fad7: shufps    xmm5, xmm1, 0xff
14084fadb: movshdup  xmm6, xmm2
14084fadf: xor       r8d, r8d
14084fae2: xor       r10d, r10d
14084fae5: xor       r11d, r11d
14084fae8: jmp       0x14084fb06
14084faea: nop       word ptr [rax + rax]
14084faf0: mov       dword ptr [r9 + r14*4], ebx
14084faf4: movaps    xmmword ptr [r15], xmm0
14084faf8: movaps    xmmword ptr [r15 + 0x10], xmm1
14084fafd: movlps    qword ptr [r15 + 0x20], xmm2
14084fb02: mov       qword ptr [r15 + 0x28], rax
14084fb06: cmp       r11d, r8d
14084fb09: jne       0x14084fb64
14084fb0b: nop       dword ptr [rax + rax]
14084fb10: cmp       rcx, rdx
14084fb13: je        0x14084fe23
14084fb19: mov       r8d, dword ptr [rcx]
14084fb1c: add       rcx, 4
14084fb20: mov       r9, qword ptr [rdi + 0x1a8]
14084fb27: lea       r10, [r8 + r8*8]
14084fb2b: mov       r8, qword ptr [r9 + r10*8 + 0x10]
14084fb30: test      r8, r8
14084fb33: je        0x14084fb10
14084fb35: lea       r9, [r9 + r10*8]
14084fb39: mov       r10, qword ptr [rsi + 0x110]
14084fb40: mov       r11, qword ptr [r9 + 0x18]
14084fb44: mov       r9, qword ptr [r9 + 0x38]
14084fb48: mov       r9, qword ptr [r9 + r10*8]
14084fb4c: not       r9
14084fb4f: lea       r9, [r9 + r9*2]
14084fb53: shl       r9, 4
14084fb57: mov       r10, qword ptr [r11 + r9 + 0x10]
14084fb5c: mov       r9, qword ptr [r11 + r9 + 0x28]
14084fb61: xor       r11d, r11d
14084fb64: mov       r14d, r11d
14084fb67: inc       r11d
14084fb6a: lea       r12, [r14 + r14*2]
14084fb6e: shl       r12, 4
14084fb72: lea       r15, [r10 + r12]
14084fb76: movss     xmm7, dword ptr [r10 + r12 + 0x10]
14084fb7d: ucomiss   xmm7, xmm1
14084fb80: jne       0x14084faf0
14084fb86: jp        0x14084faf0
14084fb8c: movss     xmm7, dword ptr [r15 + 0x14]
14084fb92: ucomiss   xmm7, xmm3
14084fb95: jne       0x14084faf0
14084fb9b: jp        0x14084faf0
14084fba1: movss     xmm7, dword ptr [r15 + 0x18]
14084fba7: ucomiss   xmm7, xmm4
14084fbaa: jne       0x14084faf0
14084fbb0: jp        0x14084faf0
14084fbb6: movaps    xmm7, xmmword ptr [r15]
14084fbba: cmpeqps   xmm7, xmm0
14084fbbe: movmskps  ebp, xmm7
14084fbc1: cmp       ebp, 0xf
14084fbc4: jne       0x14084faf0
14084fbca: movss     xmm7, dword ptr [r15 + 0x1c]
14084fbd0: ucomiss   xmm7, xmm5
14084fbd3: jne       0x14084faf0
14084fbd9: jp        0x14084faf0
14084fbdf: movss     xmm7, dword ptr [r15 + 0x20]
14084fbe5: ucomiss   xmm7, xmm2
14084fbe8: jne       0x14084faf0
14084fbee: jp        0x14084faf0
14084fbf4: movss     xmm7, dword ptr [r15 + 0x24]
14084fbfa: ucomiss   xmm7, xmm6
14084fbfd: jne       0x14084faf0
14084fc03: jnp       0x14084fb06
14084fc09: jmp       0x14084faf0
14084fc0e: movshdup  xmm3, xmm1
14084fc12: movaps    xmm4, xmm1
14084fc15: unpckhpd  xmm4, xmm1
14084fc19: movaps    xmm5, xmm1
14084fc1c: shufps    xmm5, xmm1, 0xff
14084fc20: movshdup  xmm6, xmm2
14084fc24: xor       r8d, r8d
14084fc27: mov       r9d, 8
14084fc2d: xor       r11d, r11d
14084fc30: xor       ebp, ebp
14084fc32: jmp       0x14084fc56
14084fc34: nop       word ptr cs:[rax + rax]
14084fc40: mov       dword ptr [r10 + r14*4], ebx
14084fc44: movaps    xmmword ptr [r15], xmm0
14084fc48: movaps    xmmword ptr [r15 + 0x10], xmm1
14084fc4d: movlps    qword ptr [r15 + 0x20], xmm2
14084fc52: mov       qword ptr [r15 + 0x28], rax
14084fc56: cmp       ebp, r8d
14084fc59: jne       0x14084fcce
14084fc5b: nop       dword ptr [rax + rax]
14084fc60: cmp       rcx, rdx
14084fc63: je        0x14084fe23
14084fc69: mov       r8d, dword ptr [rcx]
14084fc6c: add       rcx, 4
14084fc70: mov       r9, qword ptr [rdi + 0x108]
14084fc77: lea       r10, [r8 + r8*4]
14084fc7b: shl       r10, 5
14084fc7f: mov       r8, qword ptr [r9 + r10 + 0x58]
14084fc84: test      r8, r8
14084fc87: je        0x14084fc60
14084fc89: add       r9, r10
14084fc8c: mov       r10d, dword ptr [r9 + 0x94]
14084fc93: mov       r11, qword ptr [rdi + 0x1a8]
14084fc9a: lea       r10, [r10 + r10*8]
14084fc9e: mov       r14, qword ptr [rsi + 0x110]
14084fca5: mov       r15, qword ptr [r11 + r10*8 + 0x18]
14084fcaa: mov       r10, qword ptr [r11 + r10*8 + 0x38]
14084fcaf: mov       r10, qword ptr [r10 + r14*8]
14084fcb3: not       r10
14084fcb6: lea       r10, [r10 + r10*2]
14084fcba: shl       r10, 4
14084fcbe: mov       r11, qword ptr [r15 + r10 + 0x10]
14084fcc3: mov       r10, qword ptr [r15 + r10 + 0x28]
14084fcc8: mov       r9, qword ptr [r9 + 0x50]
14084fccc: xor       ebp, ebp
14084fcce: mov       r14d, ebp
14084fcd1: shl       r14, 4
14084fcd5: inc       ebp
14084fcd7: mov       r14d, dword ptr [r9 + r14 + 8]
14084fcdc: not       r14d
14084fcdf: lea       r12, [r14 + r14*2]
14084fce3: shl       r12, 4
14084fce7: lea       r15, [r11 + r12]
14084fceb: movss     xmm7, dword ptr [r11 + r12 + 0x10]
14084fcf2: ucomiss   xmm7, xmm1
14084fcf5: jne       0x14084fc40
14084fcfb: jp        0x14084fc40
14084fd01: movss     xmm7, dword ptr [r15 + 0x14]
14084fd07: ucomiss   xmm7, xmm3
14084fd0a: jne       0x14084fc40
14084fd10: jp        0x14084fc40
14084fd16: movss     xmm7, dword ptr [r15 + 0x18]
14084fd1c: ucomiss   xmm7, xmm4
14084fd1f: jne       0x14084fc40
14084fd25: jp        0x14084fc40
14084fd2b: movaps    xmm7, xmmword ptr [r15]
14084fd2f: cmpeqps   xmm7, xmm0
14084fd33: movmskps  r12d, xmm7
14084fd37: cmp       r12d, 0xf
14084fd3b: jne       0x14084fc40
14084fd41: movss     xmm7, dword ptr [r15 + 0x1c]
14084fd47: ucomiss   xmm7, xmm5
14084fd4a: jne       0x14084fc40
14084fd50: jp        0x14084fc40
14084fd56: movss     xmm7, dword ptr [r15 + 0x20]
14084fd5c: ucomiss   xmm7, xmm2
14084fd5f: jne       0x14084fc40
14084fd65: jp        0x14084fc40
14084fd6b: movss     xmm7, dword ptr [r15 + 0x24]
14084fd71: ucomiss   xmm7, xmm6
14084fd74: jne       0x14084fc40
14084fd7a: jnp       0x14084fc56
14084fd80: jmp       0x14084fc40
14084fd85: lea       rax, [rip + 0x77f444c]
14084fd8c: mov       r12, rcx
14084fd8f: mov       rcx, rax
14084fd92: mov       r13, rdx
14084fd95: call      0x145c273e2
14084fd9a: mov       rdx, r13
14084fd9d: mov       rcx, r12
14084fda0: mov       r8b, 1
14084fda3: xor       eax, eax
14084fda5: lock cmpxchg byte ptr [rip + 0x77f442a], r8b
14084fdae: je        0x14084f8f8
14084fdb4: lea       rax, [rip + 0x77f441d]
14084fdbb: mov       r12, rcx
14084fdbe: mov       rcx, rax
14084fdc1: mov       r13, rdx
14084fdc4: call      0x145d97960
14084fdc9: mov       rdx, r13
14084fdcc: mov       rcx, r12
14084fdcf: jmp       0x14084f8f8
14084fdd4: mov       r13, rcx
14084fdd7: mov       rbp, rdx
14084fdda: call      0x145d986f0
14084fddf: mov       rdx, rbp
14084fde2: mov       rcx, r13
14084fde5: xor       al, 1
14084fde7: movzx     r8d, byte ptr [rip + 0x77f43ea]
14084fdef: cmp       dword ptr [rip + 0x77f43e6], 1
14084fdf6: je        0x14084f926
14084fdfc: mov       dword ptr [r14], 0
14084fe03: test      al, al
14084fe05: jne       0x14084fe17
14084fe07: mov       rax, qword ptr [r12]
14084fe0b: shl       rax, 1
14084fe0e: test      rax, rax
14084fe11: jne       0x14084ff06
14084fe17: xor       eax, eax
14084fe19: xchg      byte ptr [rip + 0x77f43b9], al
14084fe1f: cmp       al, 2
14084fe21: je        0x14084fe77
14084fe23: movaps    xmm6, xmmword ptr [rsp + 0x60]
14084fe28: movaps    xmm7, xmmword ptr [rsp + 0x70]
14084fe2d: movaps    xmm8, xmmword ptr [rsp + 0x80]
14084fe36: movaps    xmm9, xmmword ptr [rsp + 0x90]
14084fe3f: movaps    xmm10, xmmword ptr [rsp + 0xa0]
14084fe48: movaps    xmm11, xmmword ptr [rsp + 0xb0]
14084fe51: movaps    xmm12, xmmword ptr [rsp + 0xc0]
14084fe5a: movaps    xmm13, xmmword ptr [rsp + 0xd0]
14084fe63: add       rsp, 0xe8
14084fe6a: pop       rbx
14084fe6b: pop       rbp
14084fe6c: pop       rdi
14084fe6d: pop       rsi
14084fe6e: pop       r12
14084fe70: pop       r13
14084fe72: pop       r14
14084fe74: pop       r15
14084fe76: ret
14084fe77: lea       rcx, [rip + 0x77f435a]
14084fe7e: movaps    xmm6, xmmword ptr [rsp + 0x60]
14084fe83: movaps    xmm7, xmmword ptr [rsp + 0x70]
14084fe88: movaps    xmm8, xmmword ptr [rsp + 0x80]
14084fe91: movaps    xmm9, xmmword ptr [rsp + 0x90]
14084fe9a: movaps    xmm10, xmmword ptr [rsp + 0xa0]
14084fea3: movaps    xmm11, xmmword ptr [rsp + 0xb0]
14084feac: movaps    xmm12, xmmword ptr [rsp + 0xc0]
14084feb5: movaps    xmm13, xmmword ptr [rsp + 0xd0]
14084febe: add       rsp, 0xe8
14084fec5: pop       rbx
14084fec6: pop       rbp
14084fec7: pop       rdi
14084fec8: pop       rsi
14084fec9: pop       r12
14084fecb: pop       r13
14084fecd: pop       r14
14084fecf: pop       r15
14084fed1: jmp       0x145d97a20
14084fed6: lea       rax, [rip + 0x77f42fb]
14084fedd: mov       r12, rcx
14084fee0: mov       rcx, rax
14084fee3: mov       r13, rdx
14084fee6: call      0x145d97a20
14084feeb: mov       rdx, r13
14084feee: mov       rcx, r12
14084fef1: xorps     xmm12, xmm12
14084fef5: xorps     xmm1, xmm1
14084fef8: test      rcx, rcx
14084fefb: jne       0x14084f9a0
14084ff01: jmp       0x14084f9ec
14084ff06: call      0x145d986f0
14084ff0b: test      al, al
14084ff0d: jne       0x14084fe17
14084ff13: mov       byte ptr [rip + 0x77f42bf], 1
14084ff1a: jmp       0x14084fe17
14084ff1f: mov       r12, rcx
14084ff22: mov       r13, rdx
14084ff25: call      0x145d986f0
14084ff2a: mov       rdx, r13
14084ff2d: mov       rcx, r12
14084ff30: test      al, al
14084ff32: jne       0x14084f984
14084ff38: mov       byte ptr [rip + 0x77f429a], 1
14084ff3f: jmp       0x14084f984
