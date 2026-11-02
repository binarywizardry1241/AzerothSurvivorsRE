14026ba20: push      r15
14026ba22: push      r14
14026ba24: push      r13
14026ba26: push      r12
14026ba28: push      rsi
14026ba29: push      rdi
14026ba2a: push      rbp
14026ba2b: push      rbx
14026ba2c: sub       rsp, 0x498
14026ba33: movaps    xmmword ptr [rsp + 0x480], xmm9
14026ba3c: movaps    xmmword ptr [rsp + 0x470], xmm8
14026ba45: movaps    xmmword ptr [rsp + 0x460], xmm7
14026ba4d: movaps    xmmword ptr [rsp + 0x450], xmm6
14026ba55: mov       r14, rdx
14026ba58: mov       r13, rcx
14026ba5b: mov       rsi, qword ptr [rcx]
14026ba5e: mov       rax, qword ptr [rcx + 0x28]
14026ba62: mov       qword ptr [rsp + 0x290], rsi
14026ba6a: lea       r12, [rsp + 0x298]
14026ba72: movups    xmm0, xmmword ptr [rcx + 8]
14026ba76: movups    xmmword ptr [rsp + 0x298], xmm0
14026ba7e: movups    xmm0, xmmword ptr [rcx + 0x18]
14026ba82: movups    xmmword ptr [rsp + 0x2a8], xmm0
14026ba8a: mov       qword ptr [rsp + 0x2b8], rax
14026ba92: mov       rax, qword ptr [rdx]
14026ba95: mov       rbx, qword ptr [rdx + 8]
14026ba99: movzx     eax, byte ptr [rax]
14026ba9c: movabs    rbp, 0x42c8000000000002
14026baa6: mov       byte ptr [rsp + 0x57], al
14026baaa: test      al, al
14026baac: jne       0x14026bd86
14026bab2: mov       r15, qword ptr [r14 + 0x10]
14026bab6: mov       rax, qword ptr [r14 + 0x18]
14026baba: movzx     edx, byte ptr [rax]
14026babd: mov       byte ptr [rsp + 0xb4], dl
14026bac4: mov       rcx, r15
14026bac7: call      0x14589c4d0
14026bacc: mov       qword ptr [rsp + 0x60], rax
14026bad1: mov       rax, qword ptr [rip + 0x5b6a268]
14026bad8: mov       qword ptr [rsp + 0x2d0], rax
14026bae0: movups    xmm0, xmmword ptr [rip + 0x5b6a249]
14026bae7: movaps    xmmword ptr [rsp + 0x2c0], xmm0
14026baef: mov       rax, qword ptr [rip + 0x5b6a262]
14026baf6: mov       qword ptr [rsp + 0x2e8], rax
14026bafe: movups    xmm0, xmmword ptr [rip + 0x5b6a243]
14026bb05: movups    xmmword ptr [rsp + 0x2d8], xmm0
14026bb0d: movups    xmm0, xmmword ptr [rip + 0x5b6a24c]
14026bb14: movaps    xmmword ptr [rsp + 0x2f0], xmm0
14026bb1c: mov       rax, qword ptr [rip + 0x5b6a24d]
14026bb23: mov       qword ptr [rsp + 0x300], rax
14026bb2b: movups    xmm0, xmmword ptr [rip + 0x5b6a246]
14026bb32: movups    xmmword ptr [rsp + 0x308], xmm0
14026bb3a: mov       rax, qword ptr [rip + 0x5b6a247]
14026bb41: mov       qword ptr [rsp + 0x318], rax
14026bb49: mov       rax, qword ptr [rsp + 0x310]
14026bb51: mov       qword ptr [rsp + 0x118], rax
14026bb59: mov       rax, qword ptr [rsp + 0x318]
14026bb61: mov       qword ptr [rsp + 0x120], rax
14026bb69: mov       rax, qword ptr [rsp + 0x300]
14026bb71: mov       qword ptr [rsp + 0x108], rax
14026bb79: mov       rax, qword ptr [rsp + 0x308]
14026bb81: mov       qword ptr [rsp + 0x110], rax
14026bb89: movaps    xmm0, xmmword ptr [rsp + 0x2f0]
14026bb91: movups    xmmword ptr [rsp + 0xf8], xmm0
14026bb99: movaps    xmm0, xmmword ptr [rsp + 0x2e0]
14026bba1: movups    xmmword ptr [rsp + 0xe8], xmm0
14026bba9: movaps    xmm0, xmmword ptr [rsp + 0x2d0]
14026bbb1: movups    xmmword ptr [rsp + 0xd8], xmm0
14026bbb9: movaps    xmm0, xmmword ptr [rsp + 0x2c0]
14026bbc1: movups    xmmword ptr [rsp + 0xc8], xmm0
14026bbc9: xorps     xmm0, xmm0
14026bbcc: movups    xmmword ptr [rsp + 0x128], xmm0
14026bbd4: movups    xmmword ptr [rsp + 0x138], xmm0
14026bbdc: mov       qword ptr [rsp + 0x148], 0
14026bbe8: mov       qword ptr [rsp + 0x150], rbp
14026bbf0: movups    xmmword ptr [rsp + 0x158], xmm0
14026bbf8: movups    xmmword ptr [rsp + 0x168], xmm0
14026bc00: mov       qword ptr [rsp + 0x178], 0
14026bc0c: movups    xmm0, xmmword ptr [rip + 0x5b6a1e5]
14026bc13: movups    xmmword ptr [rsp + 0x190], xmm0
14026bc1b: movups    xmm0, xmmword ptr [rip + 0x5b6a1c6]
14026bc22: movups    xmmword ptr [rsp + 0x180], xmm0
14026bc2a: movups    xmm0, xmmword ptr [rip + 0x5b6a1d7]
14026bc31: movups    xmmword ptr [rsp + 0x1a0], xmm0
14026bc39: movups    xmm0, xmmword ptr [rip + 0x5b6a1d8]
14026bc40: movups    xmmword ptr [rsp + 0x1b0], xmm0
14026bc48: movups    xmm0, xmmword ptr [rip + 0x5b6a1d9]
14026bc4f: movups    xmmword ptr [rsp + 0x1c0], xmm0
14026bc57: movups    xmm0, xmmword ptr [rip + 0x5b6a1da]
14026bc5e: movups    xmmword ptr [rsp + 0x1d0], xmm0
14026bc66: movups    xmm0, xmmword ptr [rip + 0x5b6a1db]
14026bc6d: movups    xmmword ptr [rsp + 0x1e0], xmm0
14026bc75: movups    xmm0, xmmword ptr [rip + 0x5b6a1dc]
14026bc7c: movups    xmmword ptr [rsp + 0x1f0], xmm0
14026bc84: movaps    xmm0, xmmword ptr [rip + 0x5b315e5]
14026bc8b: movups    xmmword ptr [rsp + 0x200], xmm0
14026bc93: mov       dword ptr [rsp + 0x210], 1
14026bc9e: movss     xmm0, dword ptr [rip + 0x5b68ce2]
14026bca6: movlps    qword ptr [rsp + 0x214], xmm0
14026bcae: mov       byte ptr [rsp + 0x21c], 1
14026bcb6: mov       qword ptr [rsp + 0x220], 0
14026bcc2: mov       dword ptr [rsp + 0x228], 0x3f800000
14026bccd: mov       word ptr [rsp + 0x22c], 0
14026bcd7: movzx     eax, word ptr [rip + 0x5b6a1bc]
14026bcde: mov       word ptr [rsp + 0x232], ax
14026bce6: mov       eax, dword ptr [rip + 0x5b6a1aa]
14026bcec: mov       dword ptr [rsp + 0x22e], eax
14026bcf3: movzx     eax, word ptr [rip + 0x5b6a1a6]
14026bcfa: mov       word ptr [rsp + 0x238], ax
14026bd02: mov       eax, dword ptr [rip + 0x5b6a194]
14026bd08: mov       dword ptr [rsp + 0x234], eax
14026bd0f: mov       dword ptr [rsp + 0x242], 0
14026bd1a: mov       qword ptr [rsp + 0x23a], 0
14026bd26: mov       qword ptr [rsp + 0xc0], rsi
14026bd2e: lea       rdi, [rsp + 0x80]
14026bd36: lea       r8, [rsp + 0xc0]
14026bd3e: mov       rcx, rdi
14026bd41: mov       rdx, r12
14026bd44: call      0x1401de510
14026bd49: lea       rax, [rsp + 0x60]
14026bd4e: mov       qword ptr [rsp + 0xc0], rax
14026bd56: mov       qword ptr [rsp + 0xc8], r15
14026bd5e: lea       rax, [rsp + 0xb4]
14026bd66: mov       qword ptr [rsp + 0xd0], rax
14026bd6e: mov       qword ptr [rsp + 0xd8], rbx
14026bd76: lea       rdx, [rsp + 0xc0]
14026bd7e: mov       rcx, rdi
14026bd81: call      0x14026dfa0
14026bd86: lea       rcx, [rip + 0x5b83e16]
14026bd8d: mov       edx, 0xd
14026bd92: call      0x1458ec450
14026bd97: mov       qword ptr [rsp + 0x60], rax
14026bd9c: mov       qword ptr [rsp + 0x68], rdx
14026bda1: mov       rax, qword ptr [rip + 0x5b69f98]
14026bda8: mov       qword ptr [rsp + 0x2d0], rax
14026bdb0: movups    xmm0, xmmword ptr [rip + 0x5b69f79]
14026bdb7: movaps    xmmword ptr [rsp + 0x2c0], xmm0
14026bdbf: movups    xmm0, xmmword ptr [rip + 0x5b69f82]
14026bdc6: movups    xmmword ptr [rsp + 0x2d8], xmm0
14026bdce: mov       rax, qword ptr [rip + 0x5b69f83]
14026bdd5: mov       qword ptr [rsp + 0x2e8], rax
14026bddd: movups    xmm0, xmmword ptr [rip + 0x5b69f7c]
14026bde4: movaps    xmmword ptr [rsp + 0x2f0], xmm0
14026bdec: mov       rax, qword ptr [rip + 0x5b69f7d]
14026bdf3: mov       qword ptr [rsp + 0x300], rax
14026bdfb: movups    xmm0, xmmword ptr [rip + 0x5b69f76]
14026be02: movups    xmmword ptr [rsp + 0x308], xmm0
14026be0a: mov       rax, qword ptr [rip + 0x5b69f77]
14026be11: mov       qword ptr [rsp + 0x318], rax
14026be19: mov       rax, qword ptr [rsp + 0x290]
14026be21: movaps    xmm0, xmmword ptr [rsp + 0x2c0]
14026be29: movups    xmmword ptr [rsp + 0xc8], xmm0
14026be31: mov       rcx, qword ptr [rsp + 0x2d0]
14026be39: mov       qword ptr [rsp + 0xd8], rcx
14026be41: mov       rcx, qword ptr [rsp + 0x2d8]
14026be49: mov       qword ptr [rsp + 0xe0], rcx
14026be51: mov       rcx, qword ptr [rsp + 0x2e0]
14026be59: mov       qword ptr [rsp + 0xe8], rcx
14026be61: mov       rcx, qword ptr [rsp + 0x2e8]
14026be69: mov       qword ptr [rsp + 0xf0], rcx
14026be71: movaps    xmm0, xmmword ptr [rsp + 0x2f0]
14026be79: movups    xmmword ptr [rsp + 0xf8], xmm0
14026be81: movaps    xmm0, xmmword ptr [rsp + 0x300]
14026be89: movups    xmmword ptr [rsp + 0x108], xmm0
14026be91: movaps    xmm0, xmmword ptr [rsp + 0x310]
14026be99: movups    xmmword ptr [rsp + 0x118], xmm0
14026bea1: xorps     xmm0, xmm0
14026bea4: movups    xmmword ptr [rsp + 0x128], xmm0
14026beac: movups    xmmword ptr [rsp + 0x138], xmm0
14026beb4: mov       qword ptr [rsp + 0x148], 0
14026bec0: mov       qword ptr [rsp + 0x150], rbp
14026bec8: movups    xmmword ptr [rsp + 0x158], xmm0
14026bed0: movups    xmmword ptr [rsp + 0x168], xmm0
14026bed8: mov       qword ptr [rsp + 0x178], 0
14026bee4: movups    xmm0, xmmword ptr [rip + 0x5b69f0d]
14026beeb: movups    xmmword ptr [rsp + 0x190], xmm0
14026bef3: movups    xmm0, xmmword ptr [rip + 0x5b69eee]
14026befa: movups    xmmword ptr [rsp + 0x180], xmm0
14026bf02: movups    xmm0, xmmword ptr [rip + 0x5b69eff]
14026bf09: movups    xmmword ptr [rsp + 0x1a0], xmm0
14026bf11: movups    xmm0, xmmword ptr [rip + 0x5b69f00]
14026bf18: movups    xmmword ptr [rsp + 0x1b0], xmm0
14026bf20: movups    xmm0, xmmword ptr [rip + 0x5b69f01]
14026bf27: movups    xmmword ptr [rsp + 0x1c0], xmm0
14026bf2f: movups    xmm0, xmmword ptr [rip + 0x5b69f02]
14026bf36: movups    xmmword ptr [rsp + 0x1d0], xmm0
14026bf3e: movups    xmm0, xmmword ptr [rip + 0x5b69f03]
14026bf45: movups    xmmword ptr [rsp + 0x1e0], xmm0
14026bf4d: movups    xmm0, xmmword ptr [rip + 0x5b69f04]
14026bf54: movups    xmmword ptr [rsp + 0x1f0], xmm0
14026bf5c: movaps    xmm8, xmmword ptr [rip + 0x5b3130c]
14026bf64: movups    xmmword ptr [rsp + 0x200], xmm8
14026bf6d: mov       dword ptr [rsp + 0x210], 1
14026bf78: movss     xmm0, dword ptr [rip + 0x5b31400]
14026bf80: movlps    qword ptr [rsp + 0x214], xmm0
14026bf88: mov       byte ptr [rsp + 0x21c], 1
14026bf90: mov       qword ptr [rsp + 0x220], 0
14026bf9c: mov       dword ptr [rsp + 0x228], 0x3f800000
14026bfa7: mov       word ptr [rsp + 0x22c], 0
14026bfb1: movzx     ecx, word ptr [rip + 0x5b69ee2]
14026bfb8: mov       word ptr [rsp + 0x232], cx
14026bfc0: mov       ecx, dword ptr [rip + 0x5b69ed0]
14026bfc6: mov       dword ptr [rsp + 0x22e], ecx
14026bfcd: movzx     ecx, word ptr [rip + 0x5b69ecc]
14026bfd4: mov       word ptr [rsp + 0x238], cx
14026bfdc: mov       ecx, dword ptr [rip + 0x5b69eba]
14026bfe2: mov       dword ptr [rsp + 0x234], ecx
14026bfe9: mov       qword ptr [rsp + 0x23a], 0
14026bff5: mov       dword ptr [rsp + 0x242], 5
14026c000: mov       qword ptr [rsp + 0xc0], rax
14026c008: lea       rdi, [rsp + 0x80]
14026c010: lea       r8, [rsp + 0xc0]
14026c018: mov       rcx, rdi
14026c01b: mov       rdx, r12
14026c01e: call      0x1401de510
14026c023: lea       r8, [rsp + 0x60]
14026c028: mov       rcx, rdi
14026c02b: mov       rdx, rbx
14026c02e: call      0x14022a710
14026c033: mov       r15, qword ptr [r14 + 0x20]
14026c037: mov       rdx, qword ptr [r14 + 0x28]
14026c03b: mov       edi, dword ptr [r15]
14026c03e: xor       eax, eax
14026c040: mov       ecx, edi
14026c042: mov       qword ptr [rsp + 0x280], rdx
14026c04a: sub       ecx, dword ptr [rdx]
14026c04c: cmovb     ecx, eax
14026c04f: mov       dword ptr [rsp + 0x28c], ecx
14026c056: mov       rsi, r12
14026c059: jbe       0x14026c078
14026c05b: cmp       byte ptr [rsp + 0x57], 0
14026c060: je        0x14026c0cc
14026c062: movups    xmm0, xmmword ptr [rip + 0x5b7f80f]
14026c069: movaps    xmmword ptr [rsp + 0x60], xmm0
14026c06e: mov       dword ptr [rsp + 0x70], 0x3f800000
14026c076: jmp       0x14026c093
14026c078: movups    xmm0, xmmword ptr [rip + 0x5b7f7f9]
14026c07f: movaps    xmmword ptr [rsp + 0x60], xmm0
14026c084: mov       dword ptr [rsp + 0x70], 0x3f800000
14026c08c: cmp       byte ptr [rsp + 0x57], 0
14026c091: je        0x14026c0e0
14026c093: lea       rcx, [rip + 0x5b83b25]
14026c09a: mov       edx, 0xd
14026c09f: call      0x1458ec450
14026c0a4: mov       r8, rdx
14026c0a7: lea       rcx, [rip + 0x5b81ada]
14026c0ae: mov       qword ptr [rsp + 0xc0], rcx
14026c0b6: mov       qword ptr [rsp + 0xc8], 5
14026c0c2: mov       rcx, qword ptr [rsp + 0x280]
14026c0ca: jmp       0x14026c117
14026c0cc: movups    xmm0, xmmword ptr [rip + 0x5b7f9ed]
14026c0d3: movaps    xmmword ptr [rsp + 0x60], xmm0
14026c0d8: mov       dword ptr [rsp + 0x70], 0x3f800000
14026c0e0: lea       rcx, [rip + 0x5b83ac9]
14026c0e7: mov       edx, 0xf
14026c0ec: call      0x1458ec450
14026c0f1: mov       r8, rdx
14026c0f4: lea       rcx, [rip + 0x5b7fc97]
14026c0fb: mov       qword ptr [rsp + 0xc0], rcx
14026c103: mov       qword ptr [rsp + 0xc8], 4
14026c10f: lea       rcx, [rsp + 0x28c]
14026c117: mov       qword ptr [rsp + 0xd0], rcx
14026c11f: lea       rcx, [rip + 0x5b7fa2a]
14026c126: mov       qword ptr [rsp + 0xd8], rcx
14026c12e: mov       qword ptr [rsp + 0x20], 1
14026c137: lea       rcx, [rsp + 0x2c0]
14026c13f: lea       r9, [rsp + 0xc0]
14026c147: mov       rdx, rax
14026c14a: call      0x1458ec8b0
14026c14f: cmp       byte ptr [rbx + 0x18], 1
14026c153: mov       dword ptr [rsp + 0x288], edi
14026c15a: jne       0x14026c17c
14026c15c: mov       eax, dword ptr [rbx + 0x19]
14026c15f: mov       ecx, dword ptr [rbx + 0x1c]
14026c162: mov       dword ptr [rsp + 0xb7], ecx
14026c169: mov       dword ptr [rsp + 0xb4], eax
14026c170: mov       rax, qword ptr [rbx + 0x20]
14026c174: movzx     edx, byte ptr [rbx + 0x28]
14026c178: mov       cl, 1
14026c17a: jmp       0x14026c18c
14026c17c: mov       rax, qword ptr [rbx + 0x20]
14026c180: lock inc  qword ptr [rax]
14026c184: jle       0x14026d359
14026c18a: xor       ecx, ecx
14026c18c: mov       r8, qword ptr [rsp + 0x2d0]
14026c194: mov       qword ptr [rsp + 0xd8], r8
14026c19c: movups    xmm0, xmmword ptr [rsp + 0x2c0]
14026c1a4: movups    xmmword ptr [rsp + 0xc8], xmm0
14026c1ac: mov       r8d, dword ptr [rsp + 0xb4]
14026c1b4: mov       r9d, dword ptr [rsp + 0xb7]
14026c1bc: mov       dword ptr [rsp + 0xf9], r8d
14026c1c4: mov       dword ptr [rsp + 0xfc], r9d
14026c1cc: movaps    xmm0, xmmword ptr [rsp + 0x60]
14026c1d1: movups    xmmword ptr [rsp + 0x81], xmm0
14026c1d9: mov       r8d, dword ptr [rsp + 0x70]
14026c1de: mov       dword ptr [rsp + 0x91], r8d
14026c1e6: mov       r8, qword ptr [rsp + 0x290]
14026c1ee: mov       qword ptr [rsp + 0xe0], 0
14026c1fa: mov       qword ptr [rsp + 0xe8], 4
14026c206: mov       qword ptr [rsp + 0xf0], 0
14026c212: mov       byte ptr [rsp + 0xf8], cl
14026c219: mov       qword ptr [rsp + 0x100], rax
14026c221: mov       qword ptr [rsp + 0x108], rdx
14026c229: mov       dword ptr [rsp + 0x110], 0x41f00000
14026c234: mov       word ptr [rsp + 0x114], 0x190
14026c23e: mov       byte ptr [rsp + 0x116], 1
14026c246: mov       rax, qword ptr [rsp + 0x8d]
14026c24e: mov       qword ptr [rsp + 0x124], rax
14026c256: movups    xmm0, xmmword ptr [rsp + 0x80]
14026c25e: movups    xmmword ptr [rsp + 0x117], xmm0
14026c266: mov       eax, dword ptr [rip + 0x5b69834]
14026c26c: mov       dword ptr [rsp + 0x13c], eax
14026c273: movups    xmm6, xmmword ptr [rip + 0x5b69816]
14026c27a: movups    xmmword ptr [rsp + 0x12c], xmm6
14026c282: movsd     xmm7, qword ptr [rip + 0x5b31216]
14026c28a: movsd     qword ptr [rsp + 0x140], xmm7
14026c293: mov       qword ptr [rsp + 0xc0], r8
14026c29b: lea       rcx, [rsp + 0x2c0]
14026c2a3: lea       r8, [rsp + 0xc0]
14026c2ab: mov       rdx, rsi
14026c2ae: call      0x1401f2bf0
14026c2b3: mov       rax, qword ptr [r14 + 0x18]
14026c2b7: mov       rdx, qword ptr [r14 + 0x30]
14026c2bb: movzx     ebp, byte ptr [rax]
14026c2be: lea       rdi, [rsp + 0xb4]
14026c2c6: mov       rcx, rdi
14026c2c9: mov       qword ptr [rsp + 0x448], rdx
14026c2d1: mov       r8d, ebp
14026c2d4: call      0x14590fd60
14026c2d9: lea       rcx, [rip + 0x5b838ec]
14026c2e0: mov       edx, 0x40
14026c2e5: call      0x1458ec450
14026c2ea: mov       r8, rdx
14026c2ed: lea       rcx, [rsp + 0xb8]
14026c2f5: lea       rdx, [rsp + 0xbc]
14026c2fd: lea       r9, [rip + 0x5b81884]
14026c304: mov       qword ptr [rsp + 0xc0], r9
14026c30c: mov       qword ptr [rsp + 0xc8], 5
14026c318: mov       r9, qword ptr [rsp + 0x280]
14026c320: mov       qword ptr [rsp + 0xd0], r9
14026c328: lea       r12, [rip + 0x5b7f821]
14026c32f: mov       qword ptr [rsp + 0xd8], r12
14026c337: lea       r9, [rip + 0x5b7febe]
14026c33e: mov       qword ptr [rsp + 0xe0], r9
14026c346: mov       qword ptr [rsp + 0xe8], 6
14026c352: mov       qword ptr [rsp + 0xf0], r15
14026c35a: mov       qword ptr [rsp + 0xf8], r12
14026c362: lea       r9, [rip + 0x5b838a3]
14026c369: mov       qword ptr [rsp + 0x100], r9
14026c371: mov       qword ptr [rsp + 0x108], 1
14026c37d: mov       qword ptr [rsp + 0x110], rdi
14026c385: mov       qword ptr [rsp + 0x118], r12
14026c38d: lea       r9, [rip + 0x5b83879]
14026c394: mov       qword ptr [rsp + 0x120], r9
14026c39c: mov       qword ptr [rsp + 0x128], 1
14026c3a8: mov       qword ptr [rsp + 0x130], rcx
14026c3b0: mov       qword ptr [rsp + 0x138], r12
14026c3b8: lea       rcx, [rip + 0x5b814eb]
14026c3bf: mov       qword ptr [rsp + 0x140], rcx
14026c3c7: mov       qword ptr [rsp + 0x148], 1
14026c3d3: mov       qword ptr [rsp + 0x150], rdx
14026c3db: mov       qword ptr [rsp + 0x158], r12
14026c3e3: lea       rcx, [rip + 0x5b81558]
14026c3ea: mov       qword ptr [rsp + 0x160], rcx
14026c3f2: mov       qword ptr [rsp + 0x168], 3
14026c3fe: lea       rcx, [rip + 0x5b822c7]
14026c405: mov       qword ptr [rsp + 0x170], rcx
14026c40d: mov       qword ptr [rsp + 0x178], r12
14026c415: mov       qword ptr [rsp + 0x20], 6
14026c41e: lea       rcx, [rsp + 0x80]
14026c426: lea       r9, [rsp + 0xc0]
14026c42e: mov       rdx, rax
14026c431: call      0x1458ec8b0
14026c436: cmp       byte ptr [rbx], 1
14026c439: jne       0x14026c455
14026c43b: mov       eax, dword ptr [rbx + 1]
14026c43e: mov       ecx, dword ptr [rbx + 4]
14026c441: mov       dword ptr [rsp + 0x5b], ecx
14026c445: mov       dword ptr [rsp + 0x58], eax
14026c449: mov       rax, qword ptr [rbx + 8]
14026c44d: movzx     edx, byte ptr [rbx + 0x10]
14026c451: mov       cl, 1
14026c453: jmp       0x14026c465
14026c455: mov       rax, qword ptr [rbx + 8]
14026c459: lock inc  qword ptr [rax]
14026c45d: jle       0x14026d359
14026c463: xor       ecx, ecx
14026c465: mov       r8, qword ptr [rsp + 0x90]
14026c46d: mov       qword ptr [rsp + 0x2d8], r8
14026c475: movups    xmm0, xmmword ptr [rsp + 0x80]
14026c47d: movups    xmmword ptr [rsp + 0x2c8], xmm0
14026c485: mov       r8d, dword ptr [rsp + 0x58]
14026c48a: mov       r9d, dword ptr [rsp + 0x5b]
14026c48f: mov       dword ptr [rsp + 0x2f9], r8d
14026c497: mov       dword ptr [rsp + 0x2fc], r9d
14026c49f: movups    xmm9, xmmword ptr [rip + 0x5b7f415]
14026c4a7: movups    xmmword ptr [rsp + 0x61], xmm9
14026c4ad: mov       dword ptr [rsp + 0x71], 0x3f800000
14026c4b5: mov       r8, qword ptr [rsp + 0x290]
14026c4bd: mov       qword ptr [rsp + 0x2e0], 0
14026c4c9: mov       qword ptr [rsp + 0x2e8], 4
14026c4d5: mov       qword ptr [rsp + 0x2f0], 0
14026c4e1: mov       byte ptr [rsp + 0x2f8], cl
14026c4e8: mov       qword ptr [rsp + 0x300], rax
14026c4f0: mov       qword ptr [rsp + 0x308], rdx
14026c4f8: mov       dword ptr [rsp + 0x310], 0x41500000
14026c503: mov       word ptr [rsp + 0x314], 0x190
14026c50d: mov       byte ptr [rsp + 0x316], 1
14026c515: mov       rax, qword ptr [rsp + 0x6d]
14026c51a: mov       qword ptr [rsp + 0x324], rax
14026c522: movups    xmm0, xmmword ptr [rsp + 0x60]
14026c527: movups    xmmword ptr [rsp + 0x317], xmm0
14026c52f: mov       eax, dword ptr [rip + 0x5b6956b]
14026c535: mov       dword ptr [rsp + 0x33c], eax
14026c53c: movups    xmmword ptr [rsp + 0x32c], xmm6
14026c544: movsd     qword ptr [rsp + 0x340], xmm7
14026c54d: mov       qword ptr [rsp + 0x2c0], r8
14026c555: lea       rdi, [rsp + 0x80]
14026c55d: lea       r8, [rsp + 0x2c0]
14026c565: mov       rcx, rdi
14026c568: mov       rdx, rsi
14026c56b: call      0x1401f2bf0
14026c570: mov       rcx, qword ptr [r14 + 0x10]
14026c574: mov       edx, ebp
14026c576: call      0x1458a7f80
14026c57b: mov       ecx, 0x6e
14026c580: lea       edx, [rcx - 0x1e]
14026c583: mov       r8d, eax
14026c586: sub       r8d, edx
14026c589: jb        0x14026c5f7
14026c58b: lea       edx, [rcx - 0xf]
14026c58e: mov       r9d, r8d
14026c591: sub       r9d, edx
14026c594: jb        0x14026c5ed
14026c596: mov       eax, r9d
14026c599: sub       eax, ecx
14026c59b: jb        0x14026c5f2
14026c59d: add       ecx, 0x2d
14026c5a0: cmp       ecx, 0x36b
14026c5a6: jne       0x14026c580
14026c5a8: mov       qword ptr [rsp + 0x440], r13
14026c5b0: mov       dword ptr [rsp + 0x7c], 0
14026c5b8: mov       dword ptr [rsp + 0x58], 0
14026c5c0: lea       rcx, [rip + 0x5b83647]
14026c5c7: mov       edx, 0x1a
14026c5cc: call      0x1458ec450
14026c5d1: mov       r13, rdx
14026c5d4: test      rdx, rdx
14026c5d7: jns       0x14026c87e
14026c5dd: xor       r12d, r12d
14026c5e0: mov       rcx, r12
14026c5e3: mov       rdx, r13
14026c5e6: call      0x145d992bb
14026c5eb: ud2
14026c5ed: mov       eax, r8d
14026c5f0: jmp       0x14026c5f7
14026c5f2: mov       eax, r9d
14026c5f5: mov       edx, ecx
14026c5f7: mov       dword ptr [rsp + 0x7c], eax
14026c5fb: mov       dword ptr [rsp + 0x58], edx
14026c5ff: lea       rcx, [rip + 0x5b83622]
14026c606: mov       edx, 0x33
14026c60b: call      0x1458ec450
14026c610: mov       r8, rdx
14026c613: lea       rcx, [rip + 0x5b83641]
14026c61a: mov       qword ptr [rsp + 0x2c0], rcx
14026c622: mov       qword ptr [rsp + 0x2c8], 4
14026c62e: lea       rcx, [rsp + 0x7c]
14026c633: mov       qword ptr [rsp + 0x2d0], rcx
14026c63b: mov       qword ptr [rsp + 0x2d8], r12
14026c643: lea       rcx, [rip + 0x5b8124a]
14026c64a: mov       qword ptr [rsp + 0x2e0], rcx
14026c652: mov       qword ptr [rsp + 0x2e8], 4
14026c65e: lea       rcx, [rsp + 0x58]
14026c663: mov       qword ptr [rsp + 0x2f0], rcx
14026c66b: mov       qword ptr [rsp + 0x2f8], r12
14026c673: mov       qword ptr [rsp + 0x20], 2
14026c67c: lea       rcx, [rsp + 0x80]
14026c684: lea       r9, [rsp + 0x2c0]
14026c68c: mov       rdx, rax
14026c68f: call      0x1458ec8b0
14026c694: cmp       byte ptr [rbx], 1
14026c697: jne       0x14026c6bf
14026c699: mov       eax, dword ptr [rbx + 1]
14026c69c: mov       ecx, dword ptr [rbx + 4]
14026c69f: mov       dword ptr [rsp + 0x26b], ecx
14026c6a6: mov       dword ptr [rsp + 0x268], eax
14026c6ad: mov       rax, qword ptr [rbx + 8]
14026c6b1: movzx     ecx, byte ptr [rbx + 0x10]
14026c6b5: mov       dl, 1
14026c6b7: movzx     r12d, byte ptr [rsp + 0x57]
14026c6bd: jmp       0x14026c6d5
14026c6bf: mov       rax, qword ptr [rbx + 8]
14026c6c3: lock inc  qword ptr [rax]
14026c6c7: movzx     r12d, byte ptr [rsp + 0x57]
14026c6cd: jle       0x14026d359
14026c6d3: xor       edx, edx
14026c6d5: mov       r8, qword ptr [rsp + 0x90]
14026c6dd: mov       qword ptr [rsp + 0xd8], r8
14026c6e5: movups    xmm0, xmmword ptr [rsp + 0x80]
14026c6ed: movups    xmmword ptr [rsp + 0xc8], xmm0
14026c6f5: movups    xmmword ptr [rsp + 0x61], xmm9
14026c6fb: mov       dword ptr [rsp + 0x71], 0x3f800000
14026c703: mov       r8, qword ptr [rsp + 0x290]
14026c70b: mov       qword ptr [rsp + 0xe0], 0
14026c717: mov       qword ptr [rsp + 0xe8], 4
14026c723: mov       qword ptr [rsp + 0xf0], 0
14026c72f: mov       byte ptr [rsp + 0xf8], dl
14026c736: mov       edx, dword ptr [rsp + 0x268]
14026c73d: mov       r9d, dword ptr [rsp + 0x26b]
14026c745: mov       dword ptr [rsp + 0xf9], edx
14026c74c: mov       dword ptr [rsp + 0xfc], r9d
14026c754: mov       qword ptr [rsp + 0x100], rax
14026c75c: mov       qword ptr [rsp + 0x108], rcx
14026c764: mov       dword ptr [rsp + 0x110], 0x41400000
14026c76f: mov       word ptr [rsp + 0x114], 0x190
14026c779: mov       byte ptr [rsp + 0x116], 1
14026c781: mov       rax, qword ptr [rsp + 0x6d]
14026c786: mov       qword ptr [rsp + 0x124], rax
14026c78e: movups    xmm0, xmmword ptr [rsp + 0x60]
14026c793: movups    xmmword ptr [rsp + 0x117], xmm0
14026c79b: mov       eax, dword ptr [rip + 0x5b692ff]
14026c7a1: mov       dword ptr [rsp + 0x13c], eax
14026c7a8: movups    xmmword ptr [rsp + 0x12c], xmm6
14026c7b0: movsd     qword ptr [rsp + 0x140], xmm7
14026c7b9: mov       qword ptr [rsp + 0xc0], r8
14026c7c1: lea       rcx, [rsp + 0x80]
14026c7c9: lea       r8, [rsp + 0xc0]
14026c7d1: mov       rdx, rsi
14026c7d4: call      0x1401f2bf0
14026c7d9: mov       eax, dword ptr [rsp + 0x7c]
14026c7dd: cvtsi2ss  xmm1, rax
14026c7e2: mov       eax, dword ptr [rsp + 0x58]
14026c7e6: xorps     xmm0, xmm0
14026c7e9: cvtsi2ss  xmm0, rax
14026c7ee: divss     xmm1, xmm0
14026c7f2: lea       rcx, [rsp + 0x290]
14026c7fa: call      0x1401099e0
14026c7ff: test      r12b, r12b
14026c802: je        0x14026ca67
14026c808: lea       rcx, [rip + 0x5b834cf]
14026c80f: mov       edx, 0x4e
14026c814: call      0x1458ec450
14026c819: mov       rdi, rdx
14026c81c: test      rdx, rdx
14026c81f: jns       0x14026c831
14026c821: xor       r13d, r13d
14026c824: mov       rcx, r13
14026c827: mov       rdx, rdi
14026c82a: call      0x145d992bb
14026c82f: ud2
14026c831: je        0x14026c8e4
14026c837: mov       rsi, r13
14026c83a: mov       r12, rax
14026c83d: call      0x140002200
14026c842: mov       r13d, 1
14026c848: mov       edx, 1
14026c84d: mov       rcx, rdi
14026c850: call      0x1400021c0
14026c855: test      rax, rax
14026c858: je        0x14026c824
14026c85a: mov       r15, rax
14026c85d: mov       rcx, rax
14026c860: mov       rdx, r12
14026c863: mov       r8, rdi
14026c866: call      0x145bfa0e7
14026c86b: mov       r13, rsi
14026c86e: lea       rsi, [rsp + 0x298]
14026c876: movzx     r12d, byte ptr [rsp + 0x57]
14026c87c: jmp       0x14026c8ea
14026c87e: je        0x14026c920
14026c884: mov       r15, rax
14026c887: call      0x140002200
14026c88c: mov       r12d, 1
14026c892: mov       edx, 1
14026c897: mov       rcx, r13
14026c89a: call      0x1400021c0
14026c89f: test      rax, rax
14026c8a2: je        0x14026c5e0
14026c8a8: mov       rdi, rax
14026c8ab: mov       rcx, rax
14026c8ae: mov       rdx, r15
14026c8b1: mov       r8, r13
14026c8b4: call      0x145bfa0e7
14026c8b9: cmp       byte ptr [rbx], 1
14026c8bc: movzx     r12d, byte ptr [rsp + 0x57]
14026c8c2: jne       0x14026c930
14026c8c4: mov       eax, dword ptr [rbx + 1]
14026c8c7: mov       ecx, dword ptr [rbx + 4]
14026c8ca: mov       dword ptr [rsp + 0x263], ecx
14026c8d1: mov       dword ptr [rsp + 0x260], eax
14026c8d8: mov       rax, qword ptr [rbx + 8]
14026c8dc: movzx     ecx, byte ptr [rbx + 0x10]
14026c8e0: mov       dl, 1
14026c8e2: jmp       0x14026c940
14026c8e4: mov       r15d, 1
14026c8ea: mov       qword ptr [rsp + 0x2c0], rdi
14026c8f2: mov       qword ptr [rsp + 0x2c8], r15
14026c8fa: mov       qword ptr [rsp + 0x2d0], rdi
14026c902: cmp       byte ptr [rbx], 1
14026c905: je        0x14026cb0a
14026c90b: mov       rax, qword ptr [rbx + 8]
14026c90f: lock inc  qword ptr [rax]
14026c913: jle       0x14026d359
14026c919: xor       edx, edx
14026c91b: jmp       0x14026cb28
14026c920: mov       edi, 1
14026c925: cmp       byte ptr [rbx], 1
14026c928: movzx     r12d, byte ptr [rsp + 0x57]
14026c92e: je        0x14026c8c4
14026c930: mov       rax, qword ptr [rbx + 8]
14026c934: lock inc  qword ptr [rax]
14026c938: jle       0x14026d359
14026c93e: xor       edx, edx
14026c940: movups    xmm0, xmmword ptr [rip + 0x5b7ef31]
14026c947: movups    xmmword ptr [rsp + 0x81], xmm0
14026c94f: mov       dword ptr [rsp + 0x91], 0x3f800000
14026c95a: mov       r8, qword ptr [rsp + 0x290]
14026c962: mov       qword ptr [rsp + 0xc8], r13
14026c96a: mov       qword ptr [rsp + 0xd0], rdi
14026c972: mov       qword ptr [rsp + 0xd8], r13
14026c97a: mov       qword ptr [rsp + 0xe0], 0
14026c986: mov       qword ptr [rsp + 0xe8], 4
14026c992: mov       qword ptr [rsp + 0xf0], 0
14026c99e: mov       byte ptr [rsp + 0xf8], dl
14026c9a5: mov       edx, dword ptr [rsp + 0x260]
14026c9ac: mov       r9d, dword ptr [rsp + 0x263]
14026c9b4: mov       dword ptr [rsp + 0xf9], edx
14026c9bb: mov       dword ptr [rsp + 0xfc], r9d
14026c9c3: mov       qword ptr [rsp + 0x100], rax
14026c9cb: mov       qword ptr [rsp + 0x108], rcx
14026c9d3: mov       dword ptr [rsp + 0x110], 0x41400000
14026c9de: mov       word ptr [rsp + 0x114], 0x190
14026c9e8: mov       byte ptr [rsp + 0x116], 1
14026c9f0: movups    xmm0, xmmword ptr [rsp + 0x80]
14026c9f8: movups    xmmword ptr [rsp + 0x117], xmm0
14026ca00: mov       rax, qword ptr [rsp + 0x8d]
14026ca08: mov       qword ptr [rsp + 0x124], rax
14026ca10: movups    xmmword ptr [rsp + 0x12c], xmm6
14026ca18: mov       eax, dword ptr [rip + 0x5b69082]
14026ca1e: mov       dword ptr [rsp + 0x13c], eax
14026ca25: movsd     qword ptr [rsp + 0x140], xmm7
14026ca2e: mov       qword ptr [rsp + 0xc0], r8
14026ca36: lea       rcx, [rsp + 0x2c0]
14026ca3e: lea       r8, [rsp + 0xc0]
14026ca46: mov       rdx, rsi
14026ca49: call      0x1401f2bf0
14026ca4e: mov       r13, qword ptr [rsp + 0x440]
14026ca56: lea       rdi, [rsp + 0x80]
14026ca5e: test      r12b, r12b
14026ca61: jne       0x14026c808
14026ca67: lea       rcx, [rip + 0x5b831f1]
14026ca6e: mov       edx, 0x7f
14026ca73: call      0x1458ec450
14026ca78: mov       rsi, r13
14026ca7b: mov       r13, rax
14026ca7e: mov       r15, rdx
14026ca81: mov       ecx, ebp
14026ca83: call      0x14588d790
14026ca88: mov       rcx, rax
14026ca8b: call      0x14588c140
14026ca90: mov       qword ptr [rsp + 0x80], rax
14026ca98: mov       qword ptr [rsp + 0x88], rdx
14026caa0: lea       rax, [rip + 0x5b7f314]
14026caa7: mov       qword ptr [rsp + 0xc0], rax
14026caaf: mov       qword ptr [rsp + 0xc8], 5
14026cabb: mov       qword ptr [rsp + 0xd0], rdi
14026cac3: lea       rax, [rip + 0x5b7f58e]
14026caca: mov       qword ptr [rsp + 0xd8], rax
14026cad2: mov       qword ptr [rsp + 0x20], 1
14026cadb: lea       rcx, [rsp + 0x2c0]
14026cae3: lea       r9, [rsp + 0xc0]
14026caeb: mov       rdx, r13
14026caee: mov       r13, rsi
14026caf1: lea       rsi, [rsp + 0x298]
14026caf9: mov       r8, r15
14026cafc: call      0x1458ec8b0
14026cb01: cmp       byte ptr [rbx], 1
14026cb04: jne       0x14026c90b
14026cb0a: mov       eax, dword ptr [rbx + 1]
14026cb0d: mov       ecx, dword ptr [rbx + 4]
14026cb10: mov       dword ptr [rsp + 0x273], ecx
14026cb17: mov       dword ptr [rsp + 0x270], eax
14026cb1e: mov       rax, qword ptr [rbx + 8]
14026cb22: movzx     ecx, byte ptr [rbx + 0x10]
14026cb26: mov       dl, 1
14026cb28: mov       r8, qword ptr [rsp + 0x2d0]
14026cb30: mov       qword ptr [rsp + 0xd8], r8
14026cb38: movups    xmm0, xmmword ptr [rsp + 0x2c0]
14026cb40: movups    xmmword ptr [rsp + 0xc8], xmm0
14026cb48: movups    xmmword ptr [rsp + 0x81], xmm9
14026cb51: mov       dword ptr [rsp + 0x91], 0x3f800000
14026cb5c: mov       r8, qword ptr [rsp + 0x290]
14026cb64: mov       qword ptr [rsp + 0xe0], 0
14026cb70: mov       qword ptr [rsp + 0xe8], 4
14026cb7c: mov       qword ptr [rsp + 0xf0], 0
14026cb88: mov       byte ptr [rsp + 0xf8], dl
14026cb8f: mov       edx, dword ptr [rsp + 0x270]
14026cb96: mov       r9d, dword ptr [rsp + 0x273]
14026cb9e: mov       dword ptr [rsp + 0xf9], edx
14026cba5: mov       dword ptr [rsp + 0xfc], r9d
14026cbad: mov       qword ptr [rsp + 0x100], rax
14026cbb5: mov       qword ptr [rsp + 0x108], rcx
14026cbbd: mov       dword ptr [rsp + 0x110], 0x41400000
14026cbc8: mov       word ptr [rsp + 0x114], 0x190
14026cbd2: mov       byte ptr [rsp + 0x116], 1
14026cbda: mov       rax, qword ptr [rsp + 0x8d]
14026cbe2: mov       qword ptr [rsp + 0x124], rax
14026cbea: movups    xmm0, xmmword ptr [rsp + 0x80]
14026cbf2: movups    xmmword ptr [rsp + 0x117], xmm0
14026cbfa: mov       eax, dword ptr [rip + 0x5b68ea0]
14026cc00: mov       dword ptr [rsp + 0x13c], eax
14026cc07: movups    xmmword ptr [rsp + 0x12c], xmm6
14026cc0f: movsd     qword ptr [rsp + 0x140], xmm7
14026cc18: mov       qword ptr [rsp + 0xc0], r8
14026cc20: lea       rcx, [rsp + 0x2c0]
14026cc28: lea       r8, [rsp + 0xc0]
14026cc30: mov       rdx, rsi
14026cc33: call      0x1401f2bf0
14026cc38: test      r12b, r12b
14026cc3b: jne       0x14026ced2
14026cc41: xorps     xmm0, xmm0
14026cc44: movaps    xmmword ptr [rsp + 0x360], xmm0
14026cc4c: movaps    xmmword ptr [rsp + 0x350], xmm0
14026cc54: movaps    xmmword ptr [rsp + 0x340], xmm0
14026cc5c: movaps    xmmword ptr [rsp + 0x330], xmm0
14026cc64: movaps    xmmword ptr [rsp + 0x320], xmm0
14026cc6c: mov       qword ptr [rsp + 0x370], 0
14026cc78: mov       word ptr [rsp + 0x244], 0
14026cc82: mov       dword ptr [rsp + 0x240], 0
14026cc8d: movups    xmm0, xmmword ptr [rip + 0x5b7ed24]
14026cc94: movups    xmmword ptr [rsp + 0x378], xmm0
14026cc9c: movups    xmm0, xmmword ptr [rip + 0x5b7ed25]
14026cca3: movups    xmmword ptr [rsp + 0x388], xmm0
14026ccab: movups    xmm0, xmmword ptr [rip + 0x5b7ed26]
14026ccb2: movups    xmmword ptr [rsp + 0x398], xmm0
14026ccba: movups    xmm0, xmmword ptr [rip + 0x5b7ed27]
14026ccc1: movups    xmmword ptr [rsp + 0x3a8], xmm0
14026ccc9: movups    xmm0, xmmword ptr [rip + 0x5b7ed38]
14026ccd0: movups    xmmword ptr [rsp + 0x3c8], xmm0
14026ccd8: movups    xmm0, xmmword ptr [rip + 0x5b7ed19]
14026ccdf: movups    xmmword ptr [rsp + 0x3b8], xmm0
14026cce7: movups    xmm0, xmmword ptr [rip + 0x5b7ed3a]
14026ccee: movups    xmmword ptr [rsp + 0x3e8], xmm0
14026ccf6: movups    xmm0, xmmword ptr [rip + 0x5b7ed1b]
14026ccfd: movups    xmmword ptr [rsp + 0x3d8], xmm0
14026cd05: movups    xmm0, xmmword ptr [rip + 0x5b7ebf4]
14026cd0c: movaps    xmmword ptr [rsp + 0x2c0], xmm0
14026cd14: mov       qword ptr [rsp + 0x2d0], 0
14026cd20: movups    xmm0, xmmword ptr [rip + 0x5b7ebf1]
14026cd27: movups    xmmword ptr [rsp + 0x2d8], xmm0
14026cd2f: mov       qword ptr [rsp + 0x2e8], 0
14026cd3b: movups    xmm0, xmmword ptr [rip + 0x5b7ebee]
14026cd42: movaps    xmmword ptr [rsp + 0x2f0], xmm0
14026cd4a: mov       qword ptr [rsp + 0x300], 0
14026cd56: movups    xmm0, xmmword ptr [rip + 0x5b7ebeb]
14026cd5d: movups    xmmword ptr [rsp + 0x308], xmm0
14026cd65: mov       qword ptr [rsp + 0x318], 0
14026cd71: mov       r15, qword ptr [rsp + 0x290]
14026cd79: lea       rcx, [rsp + 0xc8]
14026cd81: lea       rdi, [rsp + 0x2c0]
14026cd89: mov       r8d, 0x138
14026cd8f: mov       rdx, rdi
14026cd92: call      0x145bfa0e7
14026cd97: movups    xmmword ptr [rsp + 0x200], xmm8
14026cda0: mov       dword ptr [rsp + 0x210], 1
14026cdab: movss     xmm0, dword ptr [rip + 0x5b306cd]
14026cdb3: movlps    qword ptr [rsp + 0x214], xmm0
14026cdbb: mov       byte ptr [rsp + 0x21c], 1
14026cdc3: mov       qword ptr [rsp + 0x220], 0
14026cdcf: mov       dword ptr [rsp + 0x228], 0x3f800000
14026cdda: mov       word ptr [rsp + 0x22c], 0
14026cde4: mov       dword ptr [rsp + 0x22e], 0x10000
14026cdef: mov       word ptr [rsp + 0x232], 0
14026cdf9: mov       dword ptr [rsp + 0x234], 0x10000
14026ce04: mov       word ptr [rsp + 0x238], 0
14026ce0e: mov       dword ptr [rsp + 0x23a], 0
14026ce19: mov       word ptr [rsp + 0x23e], 0
14026ce23: mov       qword ptr [rsp + 0xc0], r15
14026ce2b: lea       rcx, [rsp + 0x80]
14026ce33: lea       r8, [rsp + 0xc0]
14026ce3b: mov       rdx, rsi
14026ce3e: call      0x1401de510
14026ce43: mov       rax, qword ptr [rsp + 0x80]
14026ce4b: mov       r15, rsi
14026ce4e: mov       rcx, qword ptr [rsp + 0x280]
14026ce56: mov       esi, dword ptr [rcx]
14026ce58: mov       rcx, qword ptr [rsp + 0xa8]
14026ce60: mov       qword ptr [rsp + 0xc0], rax
14026ce68: movups    xmm0, xmmword ptr [rsp + 0x88]
14026ce70: movups    xmmword ptr [rsp + 0xc8], xmm0
14026ce78: movups    xmm0, xmmword ptr [rsp + 0x98]
14026ce80: movups    xmmword ptr [rsp + 0xd8], xmm0
14026ce88: mov       qword ptr [rsp + 0xe8], rcx
14026ce90: lea       rcx, [rip + 0x5b7f318]
14026ce97: mov       edx, 5
14026ce9c: call      0x1458ec450
14026cea1: mov       r9, rdx
14026cea4: mov       qword ptr [rsp + 0x2c0], 2
14026ceb0: test      esi, esi
14026ceb2: mov       rsi, r15
14026ceb5: mov       qword ptr [rsp + 0x28], rdi
14026ceba: setne     byte ptr [rsp + 0x20]
14026cebf: lea       rcx, [rsp + 0xc0]
14026cec7: mov       rdx, rbx
14026ceca: mov       r8, rax
14026cecd: call      0x14010ae50
14026ced2: mov       word ptr [rsp + 0x424], 0
14026cedc: mov       byte ptr [rsp + 0x414], 1
14026cee4: xorps     xmm0, xmm0
14026cee7: movups    xmmword ptr [rsp + 0x328], xmm0
14026ceef: movups    xmmword ptr [rsp + 0x338], xmm0
14026cef7: movabs    rax, 0x42c8000000000002
14026cf01: mov       qword ptr [rsp + 0x348], rax
14026cf09: mov       qword ptr [rsp + 0x320], 0
14026cf15: movaps    xmmword ptr [rsp + 0x350], xmm0
14026cf1d: movaps    xmmword ptr [rsp + 0x360], xmm0
14026cf25: mov       qword ptr [rsp + 0x370], 0
14026cf31: mov       dword ptr [rsp + 0x438], 0
14026cf3c: mov       word ptr [rsp + 0x43c], 0
14026cf46: movaps    xmm0, xmmword ptr [rip + 0x5b30513]
14026cf4d: movups    xmmword ptr [rsp + 0x378], xmm0
14026cf55: movaps    xmm0, xmmword ptr [rip + 0x5b30674]
14026cf5c: movups    xmmword ptr [rsp + 0x388], xmm0
14026cf64: movups    xmm0, xmmword ptr [rip + 0x5b7ea6d]
14026cf6b: movups    xmmword ptr [rsp + 0x398], xmm0
14026cf73: movups    xmm0, xmmword ptr [rip + 0x5b7ea6e]
14026cf7a: movups    xmmword ptr [rsp + 0x3a8], xmm0
14026cf82: movups    xmm0, xmmword ptr [rip + 0x5b7ea7f]
14026cf89: movups    xmmword ptr [rsp + 0x3c8], xmm0
14026cf91: movups    xmm0, xmmword ptr [rip + 0x5b7ea60]
14026cf98: movups    xmmword ptr [rsp + 0x3b8], xmm0
14026cfa0: movups    xmm0, xmmword ptr [rip + 0x5b7ea71]
14026cfa7: movups    xmmword ptr [rsp + 0x3d8], xmm0
14026cfaf: movups    xmm0, xmmword ptr [rip + 0x5b7ea72]
14026cfb6: movups    xmmword ptr [rsp + 0x3e8], xmm0
14026cfbe: mov       word ptr [rsp + 0x436], 0
14026cfc8: mov       dword ptr [rsp + 0x432], 0
14026cfd3: mov       qword ptr [rsp + 0x418], 0
14026cfdf: mov       dword ptr [rsp + 0x420], 0x3f800000
14026cfea: movups    xmmword ptr [rsp + 0x3f8], xmm8
14026cff3: mov       dword ptr [rsp + 0x408], 1
14026cffe: mov       qword ptr [rsp + 0x40c], 0
14026d00a: movups    xmm0, xmmword ptr [rip + 0x5b7e8ef]
14026d011: movaps    xmmword ptr [rsp + 0x2c0], xmm0
14026d019: mov       qword ptr [rsp + 0x2d0], 0
14026d025: movups    xmm0, xmmword ptr [rip + 0x5b7e8ec]
14026d02c: movups    xmmword ptr [rsp + 0x2d8], xmm0
14026d034: mov       qword ptr [rsp + 0x2e8], 0
14026d040: movups    xmm0, xmmword ptr [rip + 0x5b7e8e9]
14026d047: movaps    xmmword ptr [rsp + 0x2f0], xmm0
14026d04f: mov       qword ptr [rsp + 0x300], 0
14026d05b: movups    xmm0, xmmword ptr [rip + 0x5b7e8e6]
14026d062: movups    xmmword ptr [rsp + 0x308], xmm0
14026d06a: mov       qword ptr [rsp + 0x318], 0
14026d076: mov       word ptr [rsp + 0x42a], 0
14026d080: mov       dword ptr [rsp + 0x426], 0x10000
14026d08b: mov       word ptr [rsp + 0x430], 0
14026d095: mov       dword ptr [rsp + 0x42c], 0x10000
14026d0a0: movups    xmm0, xmmword ptr [rip + 0x5b7e7d1]
14026d0a7: movaps    xmmword ptr [rsp + 0x80], xmm0
14026d0af: mov       dword ptr [rsp + 0x90], 0x3e800000
14026d0ba: lea       rcx, [rsp + 0xc8]
14026d0c2: lea       rdx, [rsp + 0x2c0]
14026d0ca: lea       r8, [rsp + 0x80]
14026d0d2: call      0x140100b90
14026d0d7: mov       rax, qword ptr [rsp + 0x290]
14026d0df: mov       qword ptr [rsp + 0xc0], rax
14026d0e7: lea       rcx, [rsp + 0x2c0]
14026d0ef: lea       r8, [rsp + 0xc0]
14026d0f7: mov       rdx, rsi
14026d0fa: call      0x1401e1e40
14026d0ff: mov       rax, qword ptr [r14 + 0x38]
14026d103: mov       rdx, qword ptr [rax + 0x58]
14026d107: test      rdx, rdx
14026d10a: je        0x14026d15f
14026d10c: mov       r8, qword ptr [rax + 0x60]
14026d110: mov       ecx, ebp
14026d112: call      0x145912d90
14026d117: test      rdx, rdx
14026d11a: je        0x14026d15f
14026d11c: mov       r8, qword ptr [r14 + 0x40]
14026d120: mov       byte ptr [rsp + 0x40], r12b
14026d125: mov       ecx, dword ptr [rsp + 0x288]
14026d12c: mov       dword ptr [rsp + 0x38], ecx
14026d130: mov       rcx, qword ptr [rsp + 0x448]
14026d138: mov       qword ptr [rsp + 0x30], rcx
14026d13d: mov       qword ptr [rsp + 0x28], rdx
14026d142: mov       qword ptr [rsp + 0x20], rax
14026d147: lea       rcx, [rsp + 0x290]
14026d14f: mov       rdx, rbx
14026d152: mov       r9d, ebp
14026d155: call      0x140108580
14026d15a: jmp       0x14026d320
14026d15f: test      r12b, r12b
14026d162: je        0x14026d1d5
14026d164: lea       rcx, [rip + 0x5b82c83]
14026d16b: mov       edx, 0x61
14026d170: call      0x1458ec450
14026d175: mov       r14, rdx
14026d178: test      rdx, rdx
14026d17b: js        0x14026d1ee
14026d17d: je        0x14026d1fe
14026d17f: mov       r15, rax
14026d182: call      0x140002200
14026d187: mov       r12d, 1
14026d18d: mov       edx, 1
14026d192: mov       rcx, r14
14026d195: call      0x1400021c0
14026d19a: test      rax, rax
14026d19d: je        0x14026d1f1
14026d19f: mov       rdi, rax
14026d1a2: mov       rcx, rax
14026d1a5: mov       rdx, r15
14026d1a8: mov       r8, r14
14026d1ab: call      0x145bfa0e7
14026d1b0: cmp       byte ptr [rbx], 1
14026d1b3: jne       0x14026d208
14026d1b5: mov       eax, dword ptr [rbx + 1]
14026d1b8: mov       ecx, dword ptr [rbx + 4]
14026d1bb: mov       dword ptr [rsp + 0x27b], ecx
14026d1c2: mov       dword ptr [rsp + 0x278], eax
14026d1c9: mov       rax, qword ptr [rbx + 8]
14026d1cd: movzx     ecx, byte ptr [rbx + 0x10]
14026d1d1: mov       dl, 1
14026d1d3: jmp       0x14026d218
14026d1d5: lea       rcx, [rip + 0x5b82b50]
14026d1dc: mov       edx, 0xc2
14026d1e1: call      0x1458ec450
14026d1e6: mov       r14, rdx
14026d1e9: test      rdx, rdx
14026d1ec: jns       0x14026d17d
14026d1ee: xor       r12d, r12d
14026d1f1: mov       rcx, r12
14026d1f4: mov       rdx, r14
14026d1f7: call      0x145d992bb
14026d1fc: ud2
14026d1fe: mov       edi, 1
14026d203: cmp       byte ptr [rbx], 1
14026d206: je        0x14026d1b5
14026d208: mov       rax, qword ptr [rbx + 8]
14026d20c: lock inc  qword ptr [rax]
14026d210: jle       0x14026d359
14026d216: xor       edx, edx
14026d218: movups    xmmword ptr [rsp + 0x81], xmm9
14026d221: mov       dword ptr [rsp + 0x91], 0x3f800000
14026d22c: mov       r8, qword ptr [rsp + 0x290]
14026d234: mov       qword ptr [rsp + 0xc8], r14
14026d23c: mov       qword ptr [rsp + 0xd0], rdi
14026d244: mov       qword ptr [rsp + 0xd8], r14
14026d24c: mov       qword ptr [rsp + 0xe0], 0
14026d258: mov       qword ptr [rsp + 0xe8], 4
14026d264: mov       qword ptr [rsp + 0xf0], 0
14026d270: mov       byte ptr [rsp + 0xf8], dl
14026d277: mov       edx, dword ptr [rsp + 0x278]
14026d27e: mov       r9d, dword ptr [rsp + 0x27b]
14026d286: mov       dword ptr [rsp + 0xf9], edx
14026d28d: mov       dword ptr [rsp + 0xfc], r9d
14026d295: mov       qword ptr [rsp + 0x100], rax
14026d29d: mov       qword ptr [rsp + 0x108], rcx
14026d2a5: mov       dword ptr [rsp + 0x110], 0x41600000
14026d2b0: mov       word ptr [rsp + 0x114], 0x190
14026d2ba: mov       byte ptr [rsp + 0x116], 1
14026d2c2: movups    xmm0, xmmword ptr [rsp + 0x80]
14026d2ca: movups    xmmword ptr [rsp + 0x117], xmm0
14026d2d2: mov       rax, qword ptr [rsp + 0x8d]
14026d2da: mov       qword ptr [rsp + 0x124], rax
14026d2e2: movups    xmmword ptr [rsp + 0x12c], xmm6
14026d2ea: mov       eax, dword ptr [rip + 0x5b687b0]
14026d2f0: mov       dword ptr [rsp + 0x13c], eax
14026d2f7: movsd     qword ptr [rsp + 0x140], xmm7
14026d300: mov       qword ptr [rsp + 0xc0], r8
14026d308: lea       rcx, [rsp + 0x2c0]
14026d310: lea       r8, [rsp + 0xc0]
14026d318: mov       rdx, rsi
14026d31b: call      0x1401f2bf0
14026d320: mov       rax, r13
14026d323: movaps    xmm6, xmmword ptr [rsp + 0x450]
14026d32b: movaps    xmm7, xmmword ptr [rsp + 0x460]
14026d333: movaps    xmm8, xmmword ptr [rsp + 0x470]
14026d33c: movaps    xmm9, xmmword ptr [rsp + 0x480]
14026d345: add       rsp, 0x498
14026d34c: pop       rbx
14026d34d: pop       rbp
14026d34e: pop       rdi
14026d34f: pop       rsi
14026d350: pop       r12
14026d352: pop       r13
14026d354: pop       r14
14026d356: pop       r15
14026d358: ret
14026d359: ud2
