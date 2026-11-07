140191820: push      rbp
140191821: push      r15
140191823: push      r14
140191825: push      r13
140191827: push      r12
140191829: push      rsi
14019182a: push      rdi
14019182b: push      rbx
14019182c: sub       rsp, 0x308
140191833: lea       rbp, [rsp + 0x80]
14019183b: movdqa    xmmword ptr [rbp + 0x270], xmm8
140191844: movaps    xmmword ptr [rbp + 0x260], xmm7
14019184b: movaps    xmmword ptr [rbp + 0x250], xmm6
140191852: mov       qword ptr [rbp + 0x248], 0xfffffffffffffffe
14019185d: mov       rax, qword ptr [rbp + 0x2f8]
140191864: mov       r10, qword ptr [rbp + 0x2f0]
14019186b: mov       rcx, qword ptr [rdx]
14019186e: mov       rdx, qword ptr [r8]
140191871: mov       qword ptr [rbp + 0x230], rdx
140191878: mov       rdx, qword ptr [r8 + 0x10]
14019187c: mov       qword ptr [rbp + 0x220], rdx
140191883: mov       edx, dword ptr [r8 + 0x1c]
140191887: mov       dword ptr [rbp + 0x240], edx
14019188d: mov       rdx, qword ptr [r9]
140191890: mov       qword ptr [rbp + 0xf0], rdx
140191897: mov       rdx, qword ptr [r9 + 0x10]
14019189b: mov       qword ptr [rbp + 0xf8], rdx
1401918a2: mov       edx, dword ptr [r9 + 0x1c]
1401918a6: mov       dword ptr [rbp + 0x15c], edx
1401918ac: mov       rsi, qword ptr [r10]
1401918af: mov       rdx, qword ptr [r10 + 0x10]
1401918b3: mov       qword ptr [rbp + 0x98], rdx
1401918ba: mov       edx, dword ptr [r10 + 0x1c]
1401918be: mov       dword ptr [rbp + 0x12c], edx
1401918c4: mov       r14, qword ptr [rax]
1401918c7: call      0x140b8edb0
1401918cc: mov       rcx, rax
1401918cf: mov       byte ptr [rbp + 0x210], dl
1401918d5: mov       rax, qword ptr [rax + 0x20]
1401918d9: mov       qword ptr [rcx + 0x20], 0
1401918e1: mov       qword ptr [rbp + 0x200], rcx
1401918e8: add       rcx, 8
1401918ec: mov       qword ptr [rbp + 0x160], rcx
1401918f3: mov       qword ptr [rbp + 0x168], rax
1401918fa: xorps     xmm0, xmm0
1401918fd: movups    xmmword ptr [rbp + 0x170], xmm0
140191904: mov       qword ptr [rbp + 0x180], rax
14019190b: lea       rcx, [rbp - 0x58]
14019190f: lea       rdx, [rbp + 0x160]
140191916: call      0x1400a1100
14019191b: nop
14019191c: mov       rbx, qword ptr [rbp + 0x200]
140191923: mov       rdi, qword ptr [rbx + 0x40]
140191927: mov       rax, qword ptr [rbx + 0x48]
14019192b: mov       qword ptr [rbp + 0xe8], rax
140191932: mov       r15, qword ptr [rbx + 0x50]
140191936: mov       qword ptr [rbx + 0x40], 0xffffffffffffffff
14019193e: mov       rax, qword ptr [rbx + 0x68]
140191942: mov       qword ptr [rbp + 0x20], rax
140191946: movups    xmm0, xmmword ptr [rbx + 0x58]
14019194a: movaps    xmmword ptr [rbp + 0x10], xmm0
14019194e: mov       qword ptr [rbx + 0x58], 0xffffffffffffffff
140191956: mov       rax, qword ptr [rbx + 0x70]
14019195a: mov       qword ptr [rbp + 0xe0], rax
140191961: mov       rax, qword ptr [rbx + 0x78]
140191965: mov       qword ptr [rbp + 0xa0], rax
14019196c: mov       r12, qword ptr [rbx + 0x80]
140191973: mov       qword ptr [rbx + 0x70], 0xffffffffffffffff
14019197b: test      byte ptr [rbp + 0x210], 1
140191982: jne       0x14019199a
140191984: mov       rax, qword ptr [rip + 0x7ef905d]
14019198b: mov       rax, qword ptr [rax]
14019198e: shl       rax, 1
140191991: test      rax, rax
140191994: jne       0x1401932f1
14019199a: mov       qword ptr [rbp + 0x130], rdi
1401919a1: xor       eax, eax
1401919a3: xchg      byte ptr [rbx], al
1401919a5: cmp       al, 2
1401919a7: je        0x1401932ac
1401919ad: mov       rax, qword ptr [rbp - 0x48]
1401919b1: mov       qword ptr [rbp + 0x40], rax
1401919b5: movups    xmm0, xmmword ptr [rbp - 0x58]
1401919b9: movaps    xmmword ptr [rbp + 0x30], xmm0
1401919bd: movdqa    xmm0, xmmword ptr [rbp + 0x10]
1401919c2: movdqa    xmmword ptr [rbp - 0x40], xmm0
1401919c7: mov       rax, qword ptr [rbp + 0x20]
1401919cb: mov       qword ptr [rbp - 0x30], rax
1401919cf: mov       rax, qword ptr [rbp - 0x40]
1401919d3: mov       qword ptr [rbp], rax
1401919d7: cmp       rax, -1
1401919db: je        0x140191e70
1401919e1: mov       rax, qword ptr [rbp + 0x20]
1401919e5: mov       qword ptr [rbp + 0x70], rax
1401919e9: movdqa    xmm0, xmmword ptr [rbp + 0x10]
1401919ee: movdqa    xmmword ptr [rbp + 0x60], xmm0
1401919f3: mov       byte ptr [rbp + 0x23f], 1
1401919fa: lea       rcx, [rbp + 0x160]
140191a01: lea       rdx, [rbp + 0x60]
140191a05: call      0x1400aeba0
140191a0a: nop
140191a0b: mov       rax, qword ptr [rbp + 0x220]
140191a12: mov       ecx, dword ptr [rbp + 0x240]
140191a18: mov       dword ptr [rax], ecx
140191a1a: mov       rax, qword ptr [rbp + 0x230]
140191a21: lea       rcx, [rax + 0x48]
140191a25: mov       qword ptr [rbp + 0x208], rcx
140191a2c: mov       rcx, qword ptr [rax + 0x50]
140191a30: mov       rax, qword ptr [rax + 0x58]
140191a34: mov       qword ptr [rbp + 0x210], rax
140191a3b: mov       qword ptr [rbp + 0x200], 0
140191a46: mov       qword ptr [rbp + 0x1b0], rcx
140191a4d: nop       dword ptr [rax]
140191a50: mov       rax, qword ptr [rbp + 0x200]
140191a57: cmp       qword ptr [rbp + 0x210], rax
140191a5e: je        0x140191a7c
140191a60: inc       rax
140191a63: mov       qword ptr [rbp + 0x200], rax
140191a6a: lea       rdi, [rcx + 0xb0]
140191a71: call      0x14005eb60
140191a76: nop
140191a77: mov       rcx, rdi
140191a7a: jmp       0x140191a50
140191a7c: mov       rdi, qword ptr [rbp + 0x208]
140191a83: mov       rax, qword ptr [rdi]
140191a86: test      rax, rax
140191a89: je        0x140191aa8
140191a8b: mov       rcx, qword ptr [rbp + 0x230]
140191a92: mov       rcx, qword ptr [rcx + 0x50]
140191a96: imul      rdx, rax, 0xb0
140191a9d: mov       r8d, 8
140191aa3: call      0x1400021d0
140191aa8: mov       rax, qword ptr [rbp + 0x170]
140191aaf: mov       qword ptr [rdi + 0x10], rax
140191ab3: movdqu    xmm0, xmmword ptr [rbp + 0x160]
140191abb: movdqu    xmmword ptr [rdi], xmm0
140191abf: mov       rax, qword ptr [rbp + 0x60]
140191ac3: mov       rcx, qword ptr [rbp + 0x68]
140191ac7: imul      rdx, qword ptr [rbp + 0x70], 0xb0
140191acf: add       rdx, rcx
140191ad2: mov       qword ptr [rbp + 0x160], rcx
140191ad9: mov       qword ptr [rbp + 0x168], rcx
140191ae0: mov       qword ptr [rbp + 0x170], rax
140191ae7: mov       qword ptr [rbp + 0x178], rdx
140191aee: mov       byte ptr [rbp + 0x23f], 0
140191af5: lea       rdi, [rbp + 0x48]
140191af9: lea       rdx, [rbp + 0x160]
140191b00: mov       rcx, rdi
140191b03: call      0x1400615c0
140191b08: nop
140191b09: mov       byte ptr [rbp + 0x23e], 1
140191b10: call      0x140a28620
140191b15: nop
140191b16: mov       qword ptr [rbp + 0xd0], rax
140191b1d: and       dl, 1
140191b20: mov       byte ptr [rbp + 0xd8], dl
140191b26: mov       rcx, qword ptr [rax + 8]
140191b2a: test      rcx, rcx
140191b2d: je        0x140191b3b
140191b2f: movdqu    xmm0, xmmword ptr [rax + 0x10]
140191b34: mov       eax, 1
140191b39: jmp       0x140191b41
140191b3b: pxor      xmm0, xmm0
140191b3f: xor       eax, eax
140191b41: mov       qword ptr [rbp + 0x160], rax
140191b48: mov       qword ptr [rbp + 0x168], 0
140191b53: mov       qword ptr [rbp + 0x170], rcx
140191b5a: movq      qword ptr [rbp + 0x178], xmm0
140191b62: mov       qword ptr [rbp + 0x180], rax
140191b69: mov       qword ptr [rbp + 0x188], 0
140191b74: mov       qword ptr [rbp + 0x190], rcx
140191b7b: movdqu    xmmword ptr [rbp + 0x198], xmm0
140191b83: mov       qword ptr [rbp + 0x1a8], rdi
140191b8a: mov       byte ptr [rbp + 0x22f], 1
140191b91: lea       rcx, [rbp - 0x28]
140191b95: lea       rdx, [rbp + 0x160]
140191b9c: call      0x1400a0a00
140191ba1: nop
140191ba2: mov       rax, qword ptr [rbp + 0x48]
140191ba6: mov       rcx, qword ptr [rbp + 0x50]
140191baa: xor       edx, edx
140191bac: mov       r8, rax
140191baf: test      rax, rax
140191bb2: setne     dl
140191bb5: je        0x140191bbb
140191bb7: mov       r8, qword ptr [rbp + 0x58]
140191bbb: mov       qword ptr [rbp + 0x160], rdx
140191bc2: mov       qword ptr [rbp + 0x168], 0
140191bcd: mov       qword ptr [rbp + 0x170], rax
140191bd4: mov       qword ptr [rbp + 0x178], rcx
140191bdb: mov       qword ptr [rbp + 0x180], rdx
140191be2: mov       qword ptr [rbp + 0x188], 0
140191bed: mov       qword ptr [rbp + 0x190], rax
140191bf4: mov       qword ptr [rbp + 0x198], rcx
140191bfb: mov       qword ptr [rbp + 0x1a0], r8
140191c02: lea       rax, [rbp + 0xd0]
140191c09: mov       qword ptr [rbp + 0x1a8], rax
140191c10: mov       byte ptr [rbp + 0x22e], 1
140191c17: mov       byte ptr [rbp + 0x22d], 1
140191c1e: lea       rcx, [rbp + 0x78]
140191c22: lea       rdx, [rbp + 0x160]
140191c29: call      0x1400a05d0
140191c2e: nop
140191c2f: mov       rdi, qword ptr [rbp + 0xd0]
140191c36: add       rdi, 0x20
140191c3a: mov       rax, qword ptr [rbp - 0x28]
140191c3e: mov       qword ptr [rbp + 0x1b0], rax
140191c45: mov       rax, qword ptr [rbp - 0x20]
140191c49: mov       qword ptr [rbp + 0x210], rax
140191c50: mov       rax, qword ptr [rbp - 0x18]
140191c54: shl       rax, 2
140191c58: mov       qword ptr [rbp + 0x200], rax
140191c5f: xor       ebx, ebx
140191c61: nop       word ptr cs:[rax + rax]
140191c70: cmp       qword ptr [rbp + 0x200], rbx
140191c77: mov       qword ptr [rbp + 0x208], rbx
140191c7e: je        0x140191c99
140191c80: mov       rax, qword ptr [rbp + 0x210]
140191c87: mov       edx, dword ptr [rax + rbx]
140191c8a: add       rbx, 4
140191c8e: mov       rcx, rdi
140191c91: call      0x140062eb0
140191c96: nop
140191c97: jmp       0x140191c70
140191c99: mov       rdx, qword ptr [rbp + 0x1b0]
140191ca0: test      rdx, rdx
140191ca3: je        0x140191cbb
140191ca5: shl       rdx, 2
140191ca9: mov       r8d, 4
140191caf: mov       rcx, qword ptr [rbp + 0x210]
140191cb6: call      0x1400021d0
140191cbb: mov       rdi, qword ptr [rbp + 0xd0]
140191cc2: add       rdi, 0x20
140191cc6: mov       rax, qword ptr [rbp + 0x78]
140191cca: mov       qword ptr [rbp + 0x1b0], rax
140191cd1: mov       rax, qword ptr [rbp + 0x80]
140191cd8: mov       qword ptr [rbp + 0x210], rax
140191cdf: mov       rbx, qword ptr [rbp + 0x88]
140191ce6: shl       rbx, 2
140191cea: xor       r13d, r13d
140191ced: nop       dword ptr [rax]
140191cf0: cmp       rbx, r13
140191cf3: je        0x140191d0f
140191cf5: mov       rax, qword ptr [rbp + 0x210]
140191cfc: mov       edx, dword ptr [rax + r13]
140191d00: add       r13, 4
140191d04: mov       rcx, rdi
140191d07: call      0x140062eb0
140191d0c: nop
140191d0d: jmp       0x140191cf0
140191d0f: mov       rdx, qword ptr [rbp + 0x1b0]
140191d16: test      rdx, rdx
140191d19: je        0x140191d31
140191d1b: shl       rdx, 2
140191d1f: mov       r8d, 4
140191d25: mov       rcx, qword ptr [rbp + 0x210]
140191d2c: call      0x1400021d0
140191d31: mov       rax, qword ptr [rbp + 0x58]
140191d35: mov       qword ptr [rbp + 0x1d0], rax
140191d3c: movdqu    xmm0, xmmword ptr [rbp + 0x48]
140191d41: movdqa    xmmword ptr [rbp + 0x1c0], xmm0
140191d49: mov       r8, qword ptr [rbp + 0xd0]
140191d50: mov       rcx, qword ptr [r8 + 8]
140191d54: test      rcx, rcx
140191d57: je        0x140191d9a
140191d59: mov       rdx, qword ptr [r8 + 0x10]
140191d5d: mov       rax, qword ptr [r8 + 0x18]
140191d61: mov       qword ptr [rbp + 0x168], 0
140191d6c: mov       qword ptr [rbp + 0x170], rcx
140191d73: mov       qword ptr [rbp + 0x178], rdx
140191d7a: mov       qword ptr [rbp + 0x188], 0
140191d85: mov       qword ptr [rbp + 0x190], rcx
140191d8c: mov       qword ptr [rbp + 0x198], rdx
140191d93: mov       ecx, 1
140191d98: jmp       0x140191d9e
140191d9a: xor       ecx, ecx
140191d9c: xor       eax, eax
140191d9e: add       r8, 8
140191da2: mov       qword ptr [rbp + 0x210], r8
140191da9: mov       qword ptr [rbp + 0x160], rcx
140191db0: mov       qword ptr [rbp + 0x180], rcx
140191db7: mov       qword ptr [rbp + 0x1a0], rax
140191dbe: lea       rcx, [rbp + 0x108]
140191dc5: lea       rdx, [rbp + 0x160]
140191dcc: call      0x1400637c0
140191dd1: nop
140191dd2: mov       rax, qword ptr [rbp + 0x108]
140191dd9: test      rax, rax
140191ddc: je        0x140191e20
140191dde: lea       rdi, [rbp + 0x108]
140191de5: lea       rbx, [rbp + 0x160]
140191dec: nop       dword ptr [rax]
140191df0: imul      rcx, qword ptr [rbp + 0x118], 0xa8
140191dfb: add       rcx, rax
140191dfe: add       rcx, 8
140191e02: call      0x14005eb60
140191e07: nop
140191e08: mov       rcx, rdi
140191e0b: mov       rdx, rbx
140191e0e: call      0x1400637c0
140191e13: nop
140191e14: mov       rax, qword ptr [rbp + 0x108]
140191e1b: test      rax, rax
140191e1e: jne       0x140191df0
140191e20: mov       rax, qword ptr [rbp + 0x1d0]
140191e27: mov       rcx, qword ptr [rbp + 0x210]
140191e2e: mov       qword ptr [rcx + 0x10], rax
140191e32: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
140191e3a: movdqu    xmmword ptr [rcx], xmm0
140191e3e: mov       rdi, qword ptr [rbp + 0xd0]
140191e45: cmp       byte ptr [rbp + 0xd8], 0
140191e4c: jne       0x140191e64
140191e4e: mov       rax, qword ptr [rip + 0x7ef8b93]
140191e55: mov       rax, qword ptr [rax]
140191e58: shl       rax, 1
140191e5b: test      rax, rax
140191e5e: jne       0x140193335
140191e64: xor       eax, eax
140191e66: xchg      byte ptr [rdi], al
140191e68: cmp       al, 2
140191e6a: je        0x1401932dc
140191e70: cmp       qword ptr [rbp + 0xe0], -1
140191e78: sete      bl
140191e7b: mov       rdi, qword ptr [rbp + 0x230]
140191e82: je        0x140191f5b
140191e88: lea       rax, [r12 + r12*2]
140191e8c: mov       rcx, qword ptr [rbp + 0xa0]
140191e93: lea       rax, [rcx + rax*4]
140191e97: mov       qword ptr [rbp + 0x160], rcx
140191e9e: mov       qword ptr [rbp + 0x168], rcx
140191ea5: mov       rcx, qword ptr [rbp + 0xe0]
140191eac: mov       qword ptr [rbp + 0x170], rcx
140191eb3: mov       qword ptr [rbp + 0x178], rax
140191eba: mov       byte ptr [rbp + 0x246], 0
140191ec1: mov       byte ptr [rbp + 0x245], 1
140191ec8: mov       byte ptr [rbp + 0x244], 1
140191ecf: lea       rcx, [rbp + 0x108]
140191ed6: lea       rdx, [rbp + 0x160]
140191edd: call      0x140060c50
140191ee2: nop
140191ee3: call      0x140a28620
140191ee8: mov       byte ptr [rbp + 0x200], dl
140191eee: mov       qword ptr [rbp + 0x210], rax
140191ef5: mov       rcx, rax
140191ef8: add       rcx, 0x38
140191efc: mov       qword ptr [rbp + 0x208], rcx
140191f03: call      0x140072c50
140191f08: nop
140191f09: mov       rax, qword ptr [rbp + 0x118]
140191f10: mov       rcx, qword ptr [rbp + 0x208]
140191f17: mov       qword ptr [rcx + 0x10], rax
140191f1b: movdqu    xmm0, xmmword ptr [rbp + 0x108]
140191f23: movdqu    xmmword ptr [rcx], xmm0
140191f27: test      byte ptr [rbp + 0x200], 1
140191f2e: mov       r12, qword ptr [rbp + 0x210]
140191f35: jne       0x140191f4d
140191f37: mov       rax, qword ptr [rip + 0x7ef8aaa]
140191f3e: mov       rax, qword ptr [rax]
140191f41: shl       rax, 1
140191f44: test      rax, rax
140191f47: jne       0x140193307
140191f4d: xor       eax, eax
140191f4f: xchg      byte ptr [r12], al
140191f53: cmp       al, 2
140191f55: je        0x1401932b9
140191f5b: mov       byte ptr [rbp + 0x21f], bl
140191f61: cmp       qword ptr [rbp + 0x130], -1
140191f69: sete      bl
140191f6c: je        0x140192060
140191f72: mov       rax, qword ptr [rbp + 0xe8]
140191f79: mov       qword ptr [rbp + 0x160], rax
140191f80: mov       qword ptr [rbp + 0x168], r15
140191f87: pxor      xmm0, xmm0
140191f8b: movdqu    xmmword ptr [rbp + 0x170], xmm0
140191f93: mov       qword ptr [rbp + 0x180], rax
140191f9a: mov       qword ptr [rbp + 0x188], r15
140191fa1: lea       rcx, [rbp + 0x108]
140191fa8: lea       rdx, [rbp + 0x160]
140191faf: call      0x1401798c0
140191fb4: nop
140191fb5: movzx     eax, byte ptr [rbp + 0x108]
140191fbc: cmp       al, 0xff
140191fbe: mov       byte ptr [rbp + 0x200], al
140191fc4: je        0x140191fe6
140191fc6: movdqu    xmm0, xmmword ptr [rbp + 0x109]
140191fce: movups    xmm1, xmmword ptr [rbp + 0x118]
140191fd5: movups    xmmword ptr [rbp + 0x16f], xmm1
140191fdc: movdqa    xmmword ptr [rbp + 0x160], xmm0
140191fe4: jmp       0x140191ff3
140191fe6: lea       rcx, [rbp + 0x110]
140191fed: call      0x14005e350
140191ff2: nop
140191ff3: mov       rax, qword ptr [rbp + 0x220]
140191ffa: mov       ecx, dword ptr [rbp + 0x240]
140192000: mov       dword ptr [rax], ecx
140192002: cmp       byte ptr [rdi + 0x60], 0xff
140192006: je        0x140192019
140192008: mov       rax, qword ptr [rbp + 0x230]
14019200f: lea       rcx, [rax + 0x60]
140192013: call      0x140137ee0
140192018: nop
140192019: movzx     eax, byte ptr [rbp + 0x200]
140192020: mov       rdi, qword ptr [rbp + 0x230]
140192027: mov       byte ptr [rdi + 0x60], al
14019202a: movaps    xmm0, xmmword ptr [rbp + 0x160]
140192031: movups    xmmword ptr [rdi + 0x61], xmm0
140192035: movdqu    xmm0, xmmword ptr [rbp + 0x16f]
14019203d: movdqu    xmmword ptr [rdi + 0x70], xmm0
140192042: mov       rdx, qword ptr [rbp + 0x130]
140192049: test      rdx, rdx
14019204c: je        0x140192060
14019204e: mov       r8d, 1
140192054: mov       rcx, qword ptr [rbp + 0xe8]
14019205b: call      0x1400021d0
140192060: mov       byte ptr [rbp + 0x1ff], bl
140192066: movss     xmm6, dword ptr [r14 + 0x5c]
14019206c: mov       rcx, qword ptr [rbp + 0x30]
140192070: mov       rdx, qword ptr [rbp + 0x38]
140192074: mov       rax, qword ptr [rbp + 0x40]
140192078: lea       rax, [rax + rax*2]
14019207c: lea       rbx, [rdx + rax*8]
140192080: mov       qword ptr [rbp + 0x78], rdx
140192084: mov       qword ptr [rbp - 0x10], rcx
140192088: mov       qword ptr [rbp + 0x88], rcx
14019208f: mov       qword ptr [rbp + 0x90], rbx
140192096: lea       r15, [rdi + 0x18]
14019209a: lea       rcx, [rdi + 0x28]
14019209e: mov       qword ptr [rbp + 0xc0], rcx
1401920a5: lea       rcx, [rdi + 0x30]
1401920a9: mov       qword ptr [rbp + 0x138], rcx
1401920b0: lea       rcx, [rdi + 0x40]
1401920b4: mov       qword ptr [rbp + 0xa8], rcx
1401920bb: lea       rcx, [rdi + 0x80]
1401920c2: mov       qword ptr [rbp + 0x1f0], rcx
1401920c9: lea       rcx, [rdi + 0xa0]
1401920d0: mov       qword ptr [rbp + 0x1b8], rcx
1401920d7: lea       rax, [rdx + rax*8 - 0x18]
1401920dc: mov       qword ptr [rbp + 0x1b0], rax
1401920e3: xorps     xmm7, xmm7
1401920e6: pcmpeqd   xmm8, xmm8
1401920eb: lea       rax, [rdi + 0xc0]
1401920f2: mov       qword ptr [rbp + 0x150], rax
1401920f9: lea       rax, [rdi + 0x60]
1401920fd: mov       qword ptr [rbp + 8], rax
140192101: lea       rax, [rdi + 0x48]
140192105: mov       qword ptr [rbp + 0x100], rax
14019210c: lea       rax, [rdi + 0x10]
140192110: mov       qword ptr [rbp + 0xb0], rax
140192117: lea       r14, [rip + 0x5c55736]
14019211e: mov       qword ptr [rbp - 8], rdx
140192122: mov       rdi, rdx
140192125: mov       qword ptr [rbp + 0x208], r15
14019212c: mov       r12, qword ptr [rbp + 0x1b0]
140192133: sub       r12, rdi
140192136: lea       r13, [rdi + 0x20]
14019213a: mov       rax, rdi
14019213d: jmp       0x14019218d
14019213f: nop
140192140: mov       rax, qword ptr [rsi + 8]
140192144: mov       rcx, r15
140192147: shl       rcx, 5
14019214b: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
140192153: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
14019215a: movups    xmmword ptr [rax + rcx + 0x10], xmm1
14019215f: movdqu    xmmword ptr [rax + rcx], xmm0
140192164: inc       r15
140192167: mov       qword ptr [rsi + 0x10], r15
14019216b: mov       r15, qword ptr [rbp + 0x208]
140192172: add       r12, -0x18
140192176: add       r13, 0x18
14019217a: mov       rax, rdi
14019217d: mov       rdx, qword ptr [rbp + 0x200]
140192184: test      rdx, rdx
140192187: jne       0x1401931bd
14019218d: cmp       rax, rbx
140192190: je        0x140193233
140192196: lea       rdi, [rax + 0x18]
14019219a: mov       qword ptr [rbp + 0x80], rdi
1401921a1: mov       rcx, qword ptr [rax]
1401921a4: cmp       rcx, -1
1401921a8: je        0x1401931e8
1401921ae: mov       qword ptr [rbp + 0x200], rcx
1401921b5: mov       rcx, qword ptr [rax + 8]
1401921b9: mov       rax, qword ptr [rax + 0x10]
1401921bd: mov       qword ptr [rbp + 0x160], rcx
1401921c4: mov       qword ptr [rbp + 0x168], rax
1401921cb: lea       rdx, [rbp + 0x170]
1401921d2: movups    xmmword ptr [rdx], xmm7
1401921d5: mov       qword ptr [rbp + 0x210], rcx
1401921dc: mov       qword ptr [rbp + 0x180], rcx
1401921e3: mov       qword ptr [rbp + 0x188], rax
1401921ea: lea       rcx, [rbp + 0x108]
1401921f1: lea       rdx, [rbp + 0x160]
1401921f8: call      0x1401798c0
1401921fd: nop
1401921fe: cmp       byte ptr [rbp + 0x108], 0xff
140192205: je        0x140192290
14019220b: movdqu    xmm0, xmmword ptr [rbp + 0x108]
140192213: movups    xmm1, xmmword ptr [rbp + 0x118]
14019221a: movaps    xmmword ptr [rbp + 0x1d0], xmm1
140192221: movdqa    xmmword ptr [rbp + 0x1c0], xmm0
140192229: mov       byte ptr [rbp + 0x247], 1
140192230: mov       edx, 4
140192235: lea       rcx, [rip + 0x5c535c6]
14019223c: lea       r8, [rbp + 0x1c0]
140192243: call      0x142aeace0
140192248: nop
140192249: test      rax, rax
14019224c: jne       0x140192255
14019224e: mov       rax, qword ptr [rip + 0x7ece03b]
140192255: cmp       byte ptr [rax], 3
140192258: jne       0x1401924a0
14019225e: mov       rcx, qword ptr [rax + 0x18]
140192262: add       rcx, -2
140192266: cmp       rcx, 5
14019226a: ja        0x1401924a0
140192270: mov       rax, qword ptr [rax + 0x10]
140192274: movsxd    rcx, dword ptr [r14 + rcx*4]
140192278: add       rcx, r14
14019227b: jmp       rcx
14019227d: cmp       word ptr [rax], 0x7a68
140192282: je        0x1401922d0
140192284: jmp       0x1401924a0
140192289: nop       dword ptr [rax]
140192290: lea       rcx, [rbp + 0x110]
140192297: call      0x14005e350
14019229c: nop
14019229d: jmp       0x140192172
1401922a2: movzx     ecx, word ptr [rax]
1401922a5: xor       ecx, 0x7a68
1401922ab: movzx     eax, byte ptr [rax + 2]
1401922af: xor       eax, 0x74
1401922b2: or        ax, cx
1401922b5: je        0x1401922d0
1401922b7: jmp       0x1401924a0
1401922bc: mov       ecx, dword ptr [rax]
1401922be: mov       edx, 0x6e657a68
1401922c3: xor       ecx, edx
1401922c5: movzx     edx, byte ptr [rax + 4]
1401922c9: xor       edx, 0x64
1401922cc: or        edx, ecx
1401922ce: jne       0x14019234a
1401922d0: mov       rax, qword ptr [rbp + 0x98]
1401922d7: mov       ecx, dword ptr [rbp + 0x12c]
1401922dd: mov       dword ptr [rax], ecx
1401922df: mov       r15, qword ptr [rsi + 0x10]
1401922e3: cmp       r15, qword ptr [rsi]
1401922e6: jne       0x140192140
1401922ec: mov       rcx, rsi
1401922ef: call      0x145bfae10
1401922f4: nop
1401922f5: jmp       0x140192140
1401922fa: mov       ecx, dword ptr [rax]
1401922fc: mov       edx, 0x65666564
140192301: xor       ecx, edx
140192303: movzx     edx, word ptr [rax + 4]
140192307: xor       edx, 0x7461
14019230d: or        edx, ecx
14019230f: je        0x140192362
140192311: mov       ecx, dword ptr [rax]
140192313: mov       edx, 0x6f676f6c
140192318: xor       ecx, edx
14019231a: movzx     eax, word ptr [rax + 4]
14019231e: xor       eax, 0x7475
140192323: or        eax, ecx
140192325: jne       0x1401924a0
14019232b: jmp       0x140192362
14019232d: mov       ecx, dword ptr [rax]
14019232f: mov       edx, 0x74636976
140192334: xor       ecx, edx
140192336: mov       eax, dword ptr [rax + 3]
140192339: mov       edx, 0x79726f74
14019233e: xor       eax, edx
140192340: or        eax, ecx
140192342: jne       0x1401924a0
140192348: jmp       0x140192362
14019234a: mov       ecx, dword ptr [rax]
14019234c: mov       edx, 0x64616572
140192351: xor       ecx, edx
140192353: movzx     eax, byte ptr [rax + 4]
140192357: xor       eax, 0x79
14019235a: or        eax, ecx
14019235c: jne       0x1401924a0
140192362: mov       rax, qword ptr [rbp + 0x98]
140192369: mov       ecx, dword ptr [rbp + 0x12c]
14019236f: mov       dword ptr [rax], ecx
140192371: movzx     r12d, byte ptr [rbp + 0x1c0]
140192379: movzx     eax, r12b
14019237d: lea       rcx, [rip + 0x5c554e8]
140192384: movsxd    rax, dword ptr [rcx + rax*4]
140192388: add       rax, rcx
14019238b: jmp       rax
14019238d: movzx     eax, byte ptr [rbp + 0x1c1]
140192394: mov       byte ptr [rbp + 0x161], al
14019239a: mov       byte ptr [rbp + 0x160], r12b
1401923a1: mov       r12, qword ptr [rsi + 0x10]
1401923a5: cmp       r12, qword ptr [rsi]
1401923a8: je        0x14019245e
1401923ae: jmp       0x140192467
1401923b3: mov       byte ptr [rbp + 0x247], 1
1401923ba: lea       rcx, [rbp + 0x168]
1401923c1: lea       rdx, [rbp + 0x1c8]
1401923c8: call      0x1400adb40
1401923cd: nop
1401923ce: jmp       0x14019244e
1401923d0: lea       rax, [rbp + 0x1c8]
1401923d7: movdqu    xmm0, xmmword ptr [rax]
1401923db: lea       rax, [rbp + 0x168]
1401923e2: movdqu    xmmword ptr [rax], xmm0
1401923e6: mov       byte ptr [rbp + 0x160], r12b
1401923ed: mov       r12, qword ptr [rsi + 0x10]
1401923f1: cmp       r12, qword ptr [rsi]
1401923f4: je        0x14019245e
1401923f6: jmp       0x140192467
1401923f8: mov       byte ptr [rbp + 0x247], 1
1401923ff: lea       rcx, [rbp + 0x168]
140192406: lea       rdx, [rbp + 0x1c8]
14019240d: call      0x145bcd2f0
140192412: nop
140192413: jmp       0x14019244e
140192415: cmp       qword ptr [rbp + 0x1d8], 0
14019241d: je        0x140192d97
140192423: mov       rdx, qword ptr [rbp + 0x1c8]
14019242a: test      rdx, rdx
14019242d: je        0x140193353
140192433: mov       r8, qword ptr [rbp + 0x1d0]
14019243a: mov       byte ptr [rbp + 0x247], 1
140192441: lea       rcx, [rbp + 0x168]
140192448: call      0x14005f980
14019244d: nop
14019244e: mov       byte ptr [rbp + 0x160], r12b
140192455: mov       r12, qword ptr [rsi + 0x10]
140192459: cmp       r12, qword ptr [rsi]
14019245c: jne       0x140192467
14019245e: mov       rcx, rsi
140192461: call      0x145bfae10
140192466: nop
140192467: mov       rax, qword ptr [rsi + 8]
14019246b: mov       rcx, r12
14019246e: shl       rcx, 5
140192472: movdqu    xmm0, xmmword ptr [rbp + 0x160]
14019247a: movups    xmm1, xmmword ptr [rbp + 0x170]
140192481: movups    xmmword ptr [rax + rcx + 0x10], xmm1
140192486: movdqu    xmmword ptr [rax + rcx], xmm0
14019248b: inc       r12
14019248e: mov       qword ptr [rsi + 0x10], r12
140192492: nop       word ptr cs:[rax + rax]
1401924a0: mov       byte ptr [rbp + 0x247], 1
1401924a7: mov       edx, 4
1401924ac: lea       rcx, [rip + 0x5c5334f]
1401924b3: lea       r8, [rbp + 0x1c0]
1401924ba: call      0x142aeace0
1401924bf: nop
1401924c0: test      rax, rax
1401924c3: jne       0x1401924cc
1401924c5: mov       rax, qword ptr [rip + 0x7ecddc4]
1401924cc: cmp       byte ptr [rax], 3
1401924cf: jne       0x1401931a0
1401924d5: mov       rcx, qword ptr [rax + 0x18]
1401924d9: add       rcx, -4
1401924dd: cmp       rcx, 4
1401924e1: ja        0x1401931a0
1401924e7: mov       rax, qword ptr [rax + 0x10]
1401924eb: lea       rdx, [rip + 0x5c55392]
1401924f2: movsxd    rcx, dword ptr [rdx + rcx*4]
1401924f6: add       rcx, rdx
1401924f9: jmp       rcx
1401924fb: cmp       dword ptr [rax], 0x706f7264
140192501: jne       0x1401931a0
140192507: mov       rax, qword ptr [rbp + 0x220]
14019250e: mov       ecx, dword ptr [rbp + 0x240]
140192514: mov       dword ptr [rax], ecx
140192516: movzx     r12d, byte ptr [rbp + 0x1c0]
14019251e: movzx     eax, r12b
140192522: lea       rcx, [rip + 0x5c5536f]
140192529: movsxd    rax, dword ptr [rcx + rax*4]
14019252d: add       rax, rcx
140192530: jmp       rax
140192532: movzx     eax, byte ptr [rbp + 0x1c1]
140192539: mov       byte ptr [rbp + 0x161], al
14019253f: jmp       0x140193058
140192544: movabs    rcx, 0x6465737561706e75
14019254e: cmp       qword ptr [rax], rcx
140192551: je        0x1401929ef
140192557: movabs    rcx, 0x7078746e656c6174
140192561: cmp       qword ptr [rax], rcx
140192564: je        0x140192cb0
14019256a: movabs    rcx, 0x64656b636f6c6e75
140192574: cmp       qword ptr [rax], rcx
140192577: jne       0x1401931a0
14019257d: mov       rax, qword ptr [rbp + 0x220]
140192584: mov       ecx, dword ptr [rbp + 0x240]
14019258a: mov       dword ptr [rax], ecx
14019258c: mov       rax, qword ptr [rbp + 0x1b8]
140192593: cmp       byte ptr [rax], 0xff
140192596: je        0x1401931a0
14019259c: mov       byte ptr [rbp + 0x247], 1
1401925a3: mov       edx, 2
1401925a8: lea       rcx, [rip + 0x5c5325f]
1401925af: lea       r8, [rbp + 0x1c0]
1401925b6: call      0x142aeace0
1401925bb: nop
1401925bc: test      rax, rax
1401925bf: jne       0x1401925c8
1401925c1: mov       rax, qword ptr [rip + 0x7ecdcc8]
1401925c8: cmp       byte ptr [rax], 3
1401925cb: jne       0x140192f59
1401925d1: mov       r12, qword ptr [rax + 0x18]
1401925d5: test      r12, r12
1401925d8: js        0x14019327d
1401925de: je        0x1401931d4
1401925e4: mov       r13, qword ptr [rax + 0x10]
1401925e8: call      0x140002200
1401925ed: mov       edx, 1
1401925f2: mov       rcx, r12
1401925f5: call      0x1400021c0
1401925fa: test      rax, rax
1401925fd: je        0x14019337f
140192603: mov       r15, rax
140192606: mov       rcx, rax
140192609: mov       rdx, r13
14019260c: mov       r8, r12
14019260f: call      0x145bfa0e7
140192614: mov       rax, r15
140192617: jmp       0x1401931dc
14019261c: mov       ecx, dword ptr [rax]
14019261e: mov       edx, 0x74736f72
140192623: xor       ecx, edx
140192625: movzx     edx, word ptr [rax + 4]
140192629: xor       edx, 0x7265
14019262f: or        edx, ecx
140192631: je        0x140192a11
140192637: mov       ecx, dword ptr [rax]
140192639: mov       edx, 0x6b636970
14019263e: xor       ecx, edx
140192640: movzx     edx, word ptr [rax + 4]
140192644: xor       edx, 0x6465
14019264a: or        edx, ecx
14019264c: je        0x140192d56
140192652: mov       ecx, dword ptr [rax]
140192654: mov       edx, 0x73756170
140192659: xor       ecx, edx
14019265b: movzx     edx, word ptr [rax + 4]
14019265f: xor       edx, 0x6465
140192665: or        edx, ecx
140192667: je        0x140192d75
14019266d: mov       ecx, dword ptr [rax]
14019266f: mov       edx, 0x75736572
140192674: xor       ecx, edx
140192676: movzx     edx, word ptr [rax + 4]
14019267a: xor       edx, 0x656d
140192680: or        edx, ecx
140192682: je        0x140192dc6
140192688: mov       ecx, dword ptr [rax]
14019268a: mov       edx, 0x6e6e6162
14019268f: xor       ecx, edx
140192691: movzx     edx, word ptr [rax + 4]
140192695: xor       edx, 0x7265
14019269b: or        edx, ecx
14019269d: je        0x140192eaf
1401926a3: mov       ecx, dword ptr [rax]
1401926a5: mov       edx, 0x65666564
1401926aa: xor       ecx, edx
1401926ac: movzx     edx, word ptr [rax + 4]
1401926b0: xor       edx, 0x7461
1401926b6: or        edx, ecx
1401926b8: je        0x140192914
1401926be: mov       ecx, dword ptr [rax]
1401926c0: mov       edx, 0x6f676f6c
1401926c5: xor       ecx, edx
1401926c7: movzx     eax, word ptr [rax + 4]
1401926cb: xor       eax, 0x7475
1401926d0: or        eax, ecx
1401926d2: jne       0x1401931a0
1401926d8: mov       rax, qword ptr [rbp + 0x230]
1401926df: movq      xmm0, qword ptr [rax + 0xe0]
1401926e7: psubd     xmm0, xmm8
1401926ec: movdqa    xmmword ptr [rbp + 0x1e0], xmm0
1401926f4: mov       rcx, qword ptr [rbp + 0x220]
1401926fb: mov       edx, dword ptr [rbp + 0x240]
140192701: mov       dword ptr [rcx], edx
140192703: cmp       byte ptr [rax + 0x60], 0xff
140192707: je        0x140192713
140192709: mov       rcx, qword ptr [rbp + 8]
14019270d: call      0x140137ee0
140192712: nop
140192713: mov       rcx, qword ptr [rbp + 0x1f0]
14019271a: cmp       byte ptr [rcx], 0xff
14019271d: je        0x140192725
14019271f: call      0x140137ee0
140192724: nop
140192725: mov       rcx, qword ptr [rbp + 0x1b8]
14019272c: cmp       byte ptr [rcx], 0xff
14019272f: je        0x140192737
140192731: call      0x140137ee0
140192736: nop
140192737: mov       rcx, qword ptr [rbp + 0x150]
14019273e: cmp       byte ptr [rcx], 0xff
140192741: je        0x140192749
140192743: call      0x140137ee0
140192748: nop
140192749: mov       rcx, qword ptr [rbp + 0x230]
140192750: call      0x1400b2090
140192755: nop
140192756: mov       rax, qword ptr [rbp + 0x230]
14019275d: mov       rdx, qword ptr [rax]
140192760: test      rdx, rdx
140192763: je        0x140192779
140192765: mov       rcx, qword ptr [rax + 8]
140192769: shl       rdx, 5
14019276d: mov       r8d, 8
140192773: call      0x1400021d0
140192778: nop
140192779: mov       rcx, qword ptr [rbp + 0x208]
140192780: call      0x1400b17e0
140192785: nop
140192786: mov       rax, qword ptr [rbp + 0x208]
14019278d: mov       rdx, qword ptr [rax]
140192790: test      rdx, rdx
140192793: je        0x1401927b0
140192795: mov       rax, qword ptr [rbp + 0x230]
14019279c: mov       rcx, qword ptr [rax + 0x20]
1401927a0: shl       rdx, 5
1401927a4: mov       r8d, 8
1401927aa: call      0x1400021d0
1401927af: nop
1401927b0: mov       rcx, qword ptr [rbp + 0x138]
1401927b7: call      0x1400b20e0
1401927bc: nop
1401927bd: mov       rax, qword ptr [rbp + 0x138]
1401927c4: mov       rax, qword ptr [rax]
1401927c7: test      rax, rax
1401927ca: je        0x1401927eb
1401927cc: mov       rcx, qword ptr [rbp + 0x230]
1401927d3: mov       rcx, qword ptr [rcx + 0x38]
1401927d7: shl       rax, 3
1401927db: lea       rdx, [rax + rax*4]
1401927df: mov       r8d, 8
1401927e5: call      0x1400021d0
1401927ea: nop
1401927eb: mov       rcx, qword ptr [rbp + 0x100]
1401927f2: call      0x1400b1b00
1401927f7: nop
1401927f8: mov       rax, qword ptr [rbp + 0x100]
1401927ff: mov       rax, qword ptr [rax]
140192802: test      rax, rax
140192805: mov       r15, qword ptr [rbp + 0x230]
14019280c: je        0x140192824
14019280e: mov       rcx, qword ptr [r15 + 0x50]
140192812: imul      rdx, rax, 0xb0
140192819: mov       r8d, 8
14019281f: call      0x1400021d0
140192824: mov       qword ptr [r15], 0
14019282b: mov       qword ptr [r15 + 8], 8
140192833: mov       rax, qword ptr [rbp + 0xb0]
14019283a: movups    xmmword ptr [rax], xmm7
14019283d: mov       qword ptr [r15 + 0x20], 8
140192845: mov       rax, qword ptr [rbp + 0xc0]
14019284c: movups    xmmword ptr [rax], xmm7
14019284f: mov       qword ptr [r15 + 0x38], 8
140192857: mov       rax, qword ptr [rbp + 0xa8]
14019285e: movups    xmmword ptr [rax], xmm7
140192861: mov       qword ptr [r15 + 0x50], 8
140192869: mov       qword ptr [r15 + 0x58], 0
140192871: mov       byte ptr [r15 + 0x60], 0xff
140192876: mov       byte ptr [r15 + 0x80], 0xff
14019287e: mov       byte ptr [r15 + 0xa0], 0xff
140192886: mov       byte ptr [r15 + 0xc0], 0xff
14019288e: movdqa    xmm0, xmmword ptr [rbp + 0x1e0]
140192896: movq      qword ptr [r15 + 0xe0], xmm0
14019289f: mov       word ptr [r15 + 0xe8], 0
1401928a9: mov       byte ptr [r15 + 0xea], 0
1401928b1: mov       rdx, qword ptr [rbp + 0xf8]
1401928b8: mov       r8d, dword ptr [rbp + 0x15c]
1401928bf: mov       dword ptr [rdx], r8d
1401928c2: mov       rcx, qword ptr [rbp + 0xf0]
1401928c9: mov       byte ptr [rcx + 0xe], 0
1401928cd: movzx     eax, byte ptr [rcx + 0xc]
1401928d1: mov       dword ptr [rdx], r8d
1401928d4: mov       byte ptr [rcx + 0xd], al
1401928d7: jmp       0x140193193
1401928dc: mov       ecx, dword ptr [rax]
1401928de: mov       edx, 0x696f6863
1401928e3: xor       ecx, edx
1401928e5: mov       edx, dword ptr [rax + 3]
1401928e8: mov       r8d, 0x73656369
1401928ee: xor       edx, r8d
1401928f1: or        edx, ecx
1401928f3: je        0x140192a30
1401928f9: mov       ecx, dword ptr [rax]
1401928fb: mov       edx, 0x74636976
140192900: xor       ecx, edx
140192902: mov       eax, dword ptr [rax + 3]
140192905: mov       edx, 0x79726f74
14019290a: xor       eax, edx
14019290c: or        eax, ecx
14019290e: jne       0x1401931a0
140192914: mov       rax, qword ptr [rbp + 0x230]
14019291b: mov       byte ptr [rax + 0xea], 0
140192922: mov       rcx, qword ptr [rbp + 0x220]
140192929: mov       edx, dword ptr [rbp + 0x240]
14019292f: mov       dword ptr [rcx], edx
140192931: cmp       byte ptr [rax + 0x80], 0xff
140192938: je        0x140192947
14019293a: mov       rcx, qword ptr [rbp + 0x1f0]
140192941: call      0x140137ee0
140192946: nop
140192947: mov       rax, qword ptr [rbp + 0x230]
14019294e: mov       byte ptr [rax + 0x80], 0xff
140192955: mov       rcx, qword ptr [rbp + 0x220]
14019295c: mov       edx, dword ptr [rbp + 0x240]
140192962: mov       dword ptr [rcx], edx
140192964: inc       dword ptr [rax + 0xe0]
14019296a: mov       dword ptr [rcx], edx
14019296c: cmp       byte ptr [rax + 0xa0], 0xff
140192973: je        0x140192982
140192975: mov       rcx, qword ptr [rbp + 0x1b8]
14019297c: call      0x140137ee0
140192981: nop
140192982: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
14019298a: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
140192991: mov       rax, qword ptr [rbp + 0x1b8]
140192998: jmp       0x140192d2d
14019299d: mov       ecx, dword ptr [rax]
14019299f: mov       edx, 0x64616572
1401929a4: xor       ecx, edx
1401929a6: movzx     edx, byte ptr [rax + 4]
1401929aa: xor       edx, 0x79
1401929ad: or        edx, ecx
1401929af: je        0x140192a97
1401929b5: mov       ecx, dword ptr [rax]
1401929b7: mov       edx, 0x72617473
1401929bc: xor       ecx, edx
1401929be: movzx     eax, byte ptr [rax + 4]
1401929c2: xor       eax, 0x74
1401929c5: or        eax, ecx
1401929c7: jne       0x1401931a0
1401929cd: mov       rax, qword ptr [rbp + 0x220]
1401929d4: mov       ecx, dword ptr [rbp + 0x240]
1401929da: mov       dword ptr [rax], ecx
1401929dc: mov       rax, qword ptr [rbp + 0x230]
1401929e3: mov       byte ptr [rax + 0xe9], 1
1401929ea: jmp       0x1401931a0
1401929ef: mov       rax, qword ptr [rbp + 0x220]
1401929f6: mov       ecx, dword ptr [rbp + 0x240]
1401929fc: mov       dword ptr [rax], ecx
1401929fe: mov       rax, qword ptr [rbp + 0x230]
140192a05: mov       byte ptr [rax + 0xea], 0
140192a0c: jmp       0x1401931a0
140192a11: mov       rax, qword ptr [rbp + 0xf8]
140192a18: mov       ecx, dword ptr [rbp + 0x15c]
140192a1e: mov       dword ptr [rax], ecx
140192a20: mov       rax, qword ptr [rbp + 0xf0]
140192a27: mov       byte ptr [rax + 0xe], 1
140192a2b: jmp       0x1401931a0
140192a30: mov       rax, qword ptr [rbp + 0x220]
140192a37: mov       ecx, dword ptr [rbp + 0x240]
140192a3d: mov       dword ptr [rax], ecx
140192a3f: mov       rax, qword ptr [rbp + 0x1f0]
140192a46: cmp       byte ptr [rax], 0xff
140192a49: je        0x140192a58
140192a4b: mov       rcx, qword ptr [rbp + 0x1f0]
140192a52: call      0x140137ee0
140192a57: nop
140192a58: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
140192a60: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
140192a67: mov       rax, qword ptr [rbp + 0x1f0]
140192a6e: movups    xmmword ptr [rax + 0x10], xmm1
140192a72: movdqu    xmmword ptr [rax], xmm0
140192a76: mov       rax, qword ptr [rbp + 0x220]
140192a7d: mov       ecx, dword ptr [rbp + 0x240]
140192a83: mov       dword ptr [rax], ecx
140192a85: mov       rax, qword ptr [rbp + 0x230]
140192a8c: inc       dword ptr [rax + 0xe0]
140192a92: jmp       0x1401931ad
140192a97: mov       rax, qword ptr [rbp + 0x230]
140192a9e: mov       word ptr [rax + 0xe8], 1
140192aa7: mov       byte ptr [rax + 0xea], 0
140192aae: mov       rcx, qword ptr [rbp + 0x220]
140192ab5: mov       edx, dword ptr [rbp + 0x240]
140192abb: mov       dword ptr [rcx], edx
140192abd: cmp       byte ptr [rax + 0xa0], 0xff
140192ac4: je        0x140192ad3
140192ac6: mov       rcx, qword ptr [rbp + 0x1b8]
140192acd: call      0x140137ee0
140192ad2: nop
140192ad3: mov       rax, qword ptr [rbp + 0x230]
140192ada: mov       byte ptr [rax + 0xa0], 0xff
140192ae1: mov       rcx, qword ptr [rbp + 0x220]
140192ae8: mov       edx, dword ptr [rbp + 0x240]
140192aee: mov       dword ptr [rcx], edx
140192af0: inc       dword ptr [rax + 0xe4]
140192af6: mov       dword ptr [rcx], edx
140192af8: cmp       byte ptr [rax + 0x80], 0xff
140192aff: je        0x140192b0e
140192b01: mov       rcx, qword ptr [rbp + 0x1f0]
140192b08: call      0x140137ee0
140192b0d: nop
140192b0e: mov       rax, qword ptr [rbp + 0x230]
140192b15: mov       byte ptr [rax + 0x80], 0xff
140192b1c: mov       rcx, qword ptr [rbp + 0x220]
140192b23: mov       edx, dword ptr [rbp + 0x240]
140192b29: mov       dword ptr [rcx], edx
140192b2b: inc       dword ptr [rax + 0xe0]
140192b31: mov       dword ptr [rcx], edx
140192b33: mov       rcx, qword ptr [rax + 0x20]
140192b37: mov       rdx, qword ptr [rax + 0x28]
140192b3b: mov       qword ptr [rbp + 0x140], rdx
140192b42: mov       qword ptr [rax + 0x28], 0
140192b4a: mov       qword ptr [rbp + 0xc8], rcx
140192b51: mov       qword ptr [rbp + 0x1e0], 0
140192b5c: nop       dword ptr [rax]
140192b60: mov       rax, qword ptr [rbp + 0x1e0]
140192b67: cmp       qword ptr [rbp + 0x140], rax
140192b6e: je        0x140192b89
140192b70: inc       rax
140192b73: mov       qword ptr [rbp + 0x1e0], rax
140192b7a: lea       r15, [rcx + 0x20]
140192b7e: call      0x140137ee0
140192b83: nop
140192b84: mov       rcx, r15
140192b87: jmp       0x140192b60
140192b89: mov       rax, qword ptr [rbp + 0x220]
140192b90: mov       ecx, dword ptr [rbp + 0x240]
140192b96: mov       dword ptr [rax], ecx
140192b98: mov       rax, qword ptr [rbp + 0x230]
140192b9f: mov       rcx, qword ptr [rax + 0x38]
140192ba3: mov       rdx, qword ptr [rax + 0x40]
140192ba7: mov       qword ptr [rbp + 0x140], rdx
140192bae: mov       qword ptr [rax + 0x40], 0
140192bb6: mov       qword ptr [rbp + 0xc8], rcx
140192bbd: mov       qword ptr [rbp + 0x1e0], 0
140192bc8: nop       dword ptr [rax + rax]
140192bd0: mov       rax, qword ptr [rbp + 0x1e0]
140192bd7: cmp       qword ptr [rbp + 0x140], rax
140192bde: je        0x140192bf9
140192be0: inc       rax
140192be3: mov       qword ptr [rbp + 0x1e0], rax
140192bea: lea       r15, [rcx + 0x28]
140192bee: call      0x140137ee0
140192bf3: nop
140192bf4: mov       rcx, r15
140192bf7: jmp       0x140192bd0
140192bf9: mov       rax, qword ptr [rbp + 0xf0]
140192c00: mov       byte ptr [rax + 0xd], 0
140192c04: mov       dword ptr [rax], 0
140192c0a: mov       rcx, qword ptr [rbp + 0xf8]
140192c11: mov       edx, dword ptr [rbp + 0x15c]
140192c17: mov       dword ptr [rcx], edx
140192c19: mov       byte ptr [rax + 0xe], 0
140192c1d: mov       byte ptr [rbp + 0x247], 1
140192c24: mov       edx, 7
140192c29: lea       rcx, [rip + 0x5c52bee]
140192c30: lea       r8, [rbp + 0x1c0]
140192c37: call      0x142aeace0
140192c3c: nop
140192c3d: mov       r15, qword ptr [rbp + 0x208]
140192c44: test      rax, rax
140192c47: jne       0x140192c50
140192c49: mov       rax, qword ptr [rip + 0x7ecd640]
140192c50: cmp       byte ptr [rax], 0
140192c53: je        0x140192c65
140192c55: mov       rax, qword ptr [rbp + 0x150]
140192c5c: cmp       byte ptr [rax], 0xff
140192c5f: jne       0x1401931a0
140192c65: mov       rax, qword ptr [rbp + 0x220]
140192c6c: mov       ecx, dword ptr [rbp + 0x240]
140192c72: mov       dword ptr [rax], ecx
140192c74: mov       rax, qword ptr [rbp + 0x150]
140192c7b: cmp       byte ptr [rax], 0xff
140192c7e: je        0x140192c8d
140192c80: mov       rcx, qword ptr [rbp + 0x150]
140192c87: call      0x140137ee0
140192c8c: nop
140192c8d: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
140192c95: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
140192c9c: mov       rax, qword ptr [rbp + 0x150]
140192ca3: movups    xmmword ptr [rax + 0x10], xmm1
140192ca7: movdqu    xmmword ptr [rax], xmm0
140192cab: jmp       0x1401931ad
140192cb0: mov       rax, qword ptr [rbp + 0x220]
140192cb7: mov       ecx, dword ptr [rbp + 0x240]
140192cbd: mov       dword ptr [rax], ecx
140192cbf: mov       r8, qword ptr [rbp + 0x1b8]
140192cc6: cmp       byte ptr [r8], 0xff
140192cca: je        0x1401931a0
140192cd0: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
140192cd8: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
140192cdf: movaps    xmmword ptr [rbp + 0x170], xmm1
140192ce6: movdqa    xmmword ptr [rbp + 0x160], xmm0
140192cee: mov       byte ptr [rbp + 0x21d], 1
140192cf5: mov       edx, 6
140192cfa: lea       rcx, [rip + 0x5c52b0f]
140192d01: call      0x142aeade0
140192d06: nop
140192d07: mov       qword ptr [rbp + 0x1e0], rax
140192d0e: mov       rcx, rax
140192d11: call      0x140137ee0
140192d16: nop
140192d17: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
140192d1f: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
140192d26: mov       rax, qword ptr [rbp + 0x1e0]
140192d2d: movups    xmmword ptr [rax + 0x10], xmm1
140192d31: movdqu    xmmword ptr [rax], xmm0
140192d35: mov       rax, qword ptr [rbp + 0x220]
140192d3c: mov       ecx, dword ptr [rbp + 0x240]
140192d42: mov       dword ptr [rax], ecx
140192d44: mov       rax, qword ptr [rbp + 0x230]
140192d4b: inc       dword ptr [rax + 0xe4]
140192d51: jmp       0x1401931ad
140192d56: mov       rax, qword ptr [rbp + 0xf8]
140192d5d: mov       ecx, dword ptr [rbp + 0x15c]
140192d63: mov       dword ptr [rax], ecx
140192d65: mov       rax, qword ptr [rbp + 0xf0]
140192d6c: mov       byte ptr [rax + 0xf], 1
140192d70: jmp       0x1401931a0
140192d75: mov       rax, qword ptr [rbp + 0x220]
140192d7c: mov       ecx, dword ptr [rbp + 0x240]
140192d82: mov       dword ptr [rax], ecx
140192d84: mov       rax, qword ptr [rbp + 0x230]
140192d8b: mov       byte ptr [rax + 0xea], 1
140192d92: jmp       0x1401931a0
140192d97: mov       qword ptr [rbp + 0x168], 0
140192da2: mov       qword ptr [rbp + 0x178], 0
140192dad: mov       byte ptr [rbp + 0x160], r12b
140192db4: mov       r12, qword ptr [rsi + 0x10]
140192db8: cmp       r12, qword ptr [rsi]
140192dbb: je        0x14019245e
140192dc1: jmp       0x140192467
140192dc6: mov       rax, qword ptr [rbp + 0x220]
140192dcd: mov       ecx, dword ptr [rbp + 0x240]
140192dd3: mov       dword ptr [rax], ecx
140192dd5: mov       rax, qword ptr [rbp + 0x1f0]
140192ddc: cmp       byte ptr [rax], 0xff
140192ddf: je        0x140192dee
140192de1: mov       rcx, qword ptr [rbp + 0x1f0]
140192de8: call      0x140137ee0
140192ded: nop
140192dee: mov       rax, qword ptr [rbp + 0x230]
140192df5: mov       byte ptr [rax + 0x80], 0xff
140192dfc: mov       rcx, qword ptr [rbp + 0x220]
140192e03: mov       edx, dword ptr [rbp + 0x240]
140192e09: mov       dword ptr [rcx], edx
140192e0b: inc       dword ptr [rax + 0xe0]
140192e11: jmp       0x1401931a0
140192e16: mov       byte ptr [rbp + 0x247], 1
140192e1d: lea       rcx, [rbp + 0x168]
140192e24: lea       rdx, [rbp + 0x1c8]
140192e2b: call      0x1400adb40
140192e30: nop
140192e31: jmp       0x140193058
140192e36: lea       rax, [rbp + 0x1c8]
140192e3d: movdqu    xmm0, xmmword ptr [rax]
140192e41: lea       rax, [rbp + 0x168]
140192e48: movdqu    xmmword ptr [rax], xmm0
140192e4c: jmp       0x140193058
140192e51: mov       byte ptr [rbp + 0x247], 1
140192e58: lea       rcx, [rbp + 0x168]
140192e5f: lea       rdx, [rbp + 0x1c8]
140192e66: call      0x145bcd2f0
140192e6b: nop
140192e6c: jmp       0x140193058
140192e71: cmp       qword ptr [rbp + 0x1d8], 0
140192e79: je        0x140193042
140192e7f: mov       rdx, qword ptr [rbp + 0x1c8]
140192e86: test      rdx, rdx
140192e89: je        0x140193369
140192e8f: mov       r8, qword ptr [rbp + 0x1d0]
140192e96: mov       byte ptr [rbp + 0x247], 1
140192e9d: lea       rcx, [rbp + 0x168]
140192ea4: call      0x14005f980
140192ea9: nop
140192eaa: jmp       0x140193058
140192eaf: mov       rax, qword ptr [rbp + 0x220]
140192eb6: mov       ecx, dword ptr [rbp + 0x240]
140192ebc: mov       dword ptr [rax], ecx
140192ebe: mov       byte ptr [rbp + 0x247], 1
140192ec5: mov       edx, 4
140192eca: lea       rcx, [rip + 0x5c52945]
140192ed1: lea       r8, [rbp + 0x1c0]
140192ed8: call      0x142aeace0
140192edd: nop
140192ede: test      rax, rax
140192ee1: jne       0x140192eea
140192ee3: mov       rax, qword ptr [rip + 0x7ecd3a6]
140192eea: cmp       byte ptr [rax], 3
140192eed: mov       rdx, qword ptr [rbp + 0x148]
140192ef4: jne       0x140192ff3
140192efa: mov       rcx, qword ptr [rax + 0x18]
140192efe: test      rcx, rcx
140192f01: js        0x140193298
140192f07: mov       qword ptr [rbp + 0x1e0], rcx
140192f0e: je        0x140192ff3
140192f14: mov       r12, qword ptr [rax + 0x10]
140192f18: call      0x140002200
140192f1d: mov       edx, 1
140192f22: mov       rcx, qword ptr [rbp + 0x1e0]
140192f29: call      0x1400021c0
140192f2e: mov       qword ptr [rbp + 0x148], rax
140192f35: test      rax, rax
140192f38: je        0x140193390
140192f3e: mov       rcx, qword ptr [rbp + 0x148]
140192f45: mov       rdx, r12
140192f48: mov       r8, qword ptr [rbp + 0x1e0]
140192f4f: call      0x145bfa0e7
140192f54: jmp       0x14019300a
140192f59: mov       eax, 1
140192f5e: xor       r12d, r12d
140192f61: mov       qword ptr [rbp + 0x168], r12
140192f68: mov       qword ptr [rbp + 0xb8], rax
140192f6f: mov       qword ptr [rbp + 0x170], rax
140192f76: mov       qword ptr [rbp + 0x178], r12
140192f7d: mov       byte ptr [rbp + 0x160], 3
140192f84: mov       byte ptr [rbp + 0x21e], 1
140192f8b: mov       edx, 8
140192f90: lea       rcx, [rip + 0x5c5286f]
140192f97: mov       r8, qword ptr [rbp + 0x1b8]
140192f9e: call      0x142aeade0
140192fa3: nop
140192fa4: mov       qword ptr [rbp + 0x1e0], rax
140192fab: mov       rcx, rax
140192fae: call      0x140137ee0
140192fb3: nop
140192fb4: movdqu    xmm0, xmmword ptr [rbp + 0x160]
140192fbc: movups    xmm1, xmmword ptr [rbp + 0x170]
140192fc3: mov       rax, qword ptr [rbp + 0x1e0]
140192fca: movups    xmmword ptr [rax + 0x10], xmm1
140192fce: movdqu    xmmword ptr [rax], xmm0
140192fd2: mov       rax, qword ptr [rbp + 0x220]
140192fd9: mov       ecx, dword ptr [rbp + 0x240]
140192fdf: mov       dword ptr [rax], ecx
140192fe1: mov       rax, qword ptr [rbp + 0x230]
140192fe8: inc       dword ptr [rax + 0xe4]
140192fee: jmp       0x1401931a0
140192ff3: mov       eax, 1
140192ff8: mov       qword ptr [rbp + 0x148], rax
140192fff: mov       qword ptr [rbp + 0x1e0], 0
14019300a: mov       edx, 4
14019300f: lea       rcx, [rip + 0x5c52804]
140193016: lea       r8, [rbp + 0x1c0]
14019301d: call      0x142aeace0
140193022: nop
140193023: test      rax, rax
140193026: jne       0x14019302f
140193028: mov       rax, qword ptr [rip + 0x7ecd261]
14019302f: cmp       byte ptr [rax], 1
140193032: jne       0x14019313e
140193038: movzx     r12d, byte ptr [rax + 1]
14019303d: jmp       0x140193141
140193042: mov       qword ptr [rbp + 0x168], 0
14019304d: mov       qword ptr [rbp + 0x178], 0
140193058: mov       byte ptr [rbp + 0x160], r12b
14019305f: mov       rax, qword ptr [rbp + 0xc0]
140193066: mov       rcx, r15
140193069: mov       r15, qword ptr [rax]
14019306c: cmp       r15, qword ptr [rcx]
14019306f: jne       0x14019307e
140193071: mov       rcx, qword ptr [rbp + 0x208]
140193078: call      0x145bfae10
14019307d: nop
14019307e: mov       rdx, qword ptr [rbp + 0x230]
140193085: mov       rax, qword ptr [rdx + 0x20]
140193089: mov       rcx, r15
14019308c: shl       rcx, 5
140193090: movups    xmm0, xmmword ptr [rbp + 0x160]
140193097: movups    xmm1, xmmword ptr [rbp + 0x170]
14019309e: movups    xmmword ptr [rax + rcx + 0x10], xmm1
1401930a3: movups    xmmword ptr [rax + rcx], xmm0
1401930a7: inc       r15
1401930aa: mov       qword ptr [rdx + 0x28], r15
1401930ae: mov       rax, qword ptr [rbp + 0x220]
1401930b5: mov       ecx, dword ptr [rbp + 0x240]
1401930bb: mov       dword ptr [rax], ecx
1401930bd: movdqa    xmm0, xmmword ptr [rbp + 0x1c0]
1401930c5: movaps    xmm1, xmmword ptr [rbp + 0x1d0]
1401930cc: movaps    xmmword ptr [rbp + 0x170], xmm1
1401930d3: movdqa    xmmword ptr [rbp + 0x160], xmm0
1401930db: movss     dword ptr [rbp + 0x180], xmm6
1401930e3: mov       r12, qword ptr [rdx + 0x40]
1401930e7: cmp       r12, qword ptr [rdx + 0x30]
1401930eb: mov       rcx, qword ptr [rbp + 0x138]
1401930f2: jne       0x1401930fa
1401930f4: call      0x145bfae80
1401930f9: nop
1401930fa: mov       r8, qword ptr [rbp + 0x230]
140193101: mov       rax, qword ptr [r8 + 0x38]
140193105: lea       rcx, [r12 + r12*4]
140193109: mov       rdx, qword ptr [rbp + 0x180]
140193110: mov       qword ptr [rax + rcx*8 + 0x20], rdx
140193115: movdqa    xmm0, xmmword ptr [rbp + 0x160]
14019311d: movaps    xmm1, xmmword ptr [rbp + 0x170]
140193124: movups    xmmword ptr [rax + rcx*8 + 0x10], xmm1
140193129: movdqu    xmmword ptr [rax + rcx*8], xmm0
14019312e: inc       r12
140193131: mov       qword ptr [r8 + 0x40], r12
140193135: mov       r15, qword ptr [rbp + 0x208]
14019313c: jmp       0x1401931ad
14019313e: xor       r12d, r12d
140193141: mov       r15, qword ptr [rbp + 0x230]
140193148: mov       r13, qword ptr [r15 + 0x10]
14019314c: cmp       r13, qword ptr [r15]
14019314f: jne       0x14019315a
140193151: mov       rcx, r15
140193154: call      0x145bfae10
140193159: nop
14019315a: mov       rax, qword ptr [r15 + 8]
14019315e: mov       rcx, r13
140193161: shl       rcx, 5
140193165: mov       r8, qword ptr [rbp + 0x1e0]
14019316c: mov       qword ptr [rax + rcx], r8
140193170: mov       rdx, qword ptr [rbp + 0x148]
140193177: mov       qword ptr [rax + rcx + 8], rdx
14019317c: mov       qword ptr [rax + rcx + 0x10], r8
140193181: mov       byte ptr [rax + rcx + 0x18], r12b
140193186: movss     dword ptr [rax + rcx + 0x1c], xmm6
14019318c: inc       r13
14019318f: mov       qword ptr [r15 + 0x10], r13
140193193: mov       r15, qword ptr [rbp + 0x208]
14019319a: nop       word ptr [rax + rax]
1401931a0: lea       rcx, [rbp + 0x1c0]
1401931a7: call      0x140137ee0
1401931ac: nop
1401931ad: mov       rdx, qword ptr [rbp + 0x200]
1401931b4: test      rdx, rdx
1401931b7: je        0x14019212c
1401931bd: mov       r8d, 1
1401931c3: mov       rcx, qword ptr [rbp + 0x210]
1401931ca: call      0x1400021d0
1401931cf: jmp       0x14019212c
1401931d4: mov       eax, 1
1401931d9: xor       r12d, r12d
1401931dc: mov       r15, qword ptr [rbp + 0x208]
1401931e3: jmp       0x140192f61
1401931e8: cmp       rbx, rdi
1401931eb: je        0x140193233
1401931ed: movabs    rcx, 0xaaaaaaaaaaaaaaab
1401931f7: mov       rax, r12
1401931fa: mul       rcx
1401931fd: mov       rsi, rdx
140193200: shr       rsi, 4
140193204: jmp       0x140193219
140193206: nop       word ptr cs:[rax + rax]
140193210: add       r13, 0x18
140193214: dec       rsi
140193217: je        0x140193233
140193219: mov       rdx, qword ptr [r13 - 8]
14019321d: test      rdx, rdx
140193220: je        0x140193210
140193222: mov       rcx, qword ptr [r13]
140193226: mov       r8d, 1
14019322c: call      0x1400021d0
140193231: jmp       0x140193210
140193233: mov       rax, qword ptr [rbp - 0x10]
140193237: test      rax, rax
14019323a: je        0x140193253
14019323c: shl       rax, 3
140193240: lea       rdx, [rax + rax*2]
140193244: mov       r8d, 8
14019324a: mov       rcx, qword ptr [rbp - 8]
14019324e: call      0x1400021d0
140193253: movaps    xmm6, xmmword ptr [rbp + 0x250]
14019325a: movaps    xmm7, xmmword ptr [rbp + 0x260]
140193261: movaps    xmm8, xmmword ptr [rbp + 0x270]
140193269: add       rsp, 0x308
140193270: pop       rbx
140193271: pop       rdi
140193272: pop       rsi
140193273: pop       r12
140193275: pop       r13
140193277: pop       r14
140193279: pop       r15
14019327b: pop       rbp
14019327c: ret
14019327d: xor       ecx, ecx
14019327f: mov       byte ptr [rbp + 0x247], 1
140193286: mov       rdx, qword ptr [rbp + 0xb8]
14019328d: call      0x145d992bb
140193292: nop
140193293: jmp       0x14019337d
140193298: xor       ecx, ecx
14019329a: mov       byte ptr [rbp + 0x247], 1
1401932a1: call      0x145d992bb
1401932a6: nop
1401932a7: jmp       0x14019337d
1401932ac: mov       rcx, rbx
1401932af: call      0x145d97a20
1401932b4: jmp       0x1401919ad
1401932b9: mov       byte ptr [rbp + 0x246], 0
1401932c0: mov       byte ptr [rbp + 0x245], 1
1401932c7: mov       byte ptr [rbp + 0x244], 1
1401932ce: mov       rcx, r12
1401932d1: call      0x145d97a20
1401932d6: nop
1401932d7: jmp       0x140191f5b
1401932dc: mov       byte ptr [rbp + 0x23e], 0
1401932e3: mov       rcx, rdi
1401932e6: call      0x145d97a20
1401932eb: nop
1401932ec: jmp       0x140191e70
1401932f1: call      0x145d986f0
1401932f6: test      al, al
1401932f8: jne       0x14019199a
1401932fe: mov       byte ptr [rbx + 1], 1
140193302: jmp       0x14019199a
140193307: mov       byte ptr [rbp + 0x246], 0
14019330e: mov       byte ptr [rbp + 0x245], 1
140193315: mov       byte ptr [rbp + 0x244], 1
14019331c: call      0x145d986f0
140193321: nop
140193322: test      al, al
140193324: jne       0x140191f4d
14019332a: mov       byte ptr [r12 + 1], 1
140193330: jmp       0x140191f4d
140193335: mov       byte ptr [rbp + 0x23e], 0
14019333c: call      0x145d986f0
140193341: nop
140193342: test      al, al
140193344: jne       0x140191e64
14019334a: mov       byte ptr [rdi + 1], 1
14019334e: jmp       0x140191e64
140193353: mov       byte ptr [rbp + 0x247], 1
14019335a: lea       rcx, [rip + 0x5c3c95f]
140193361: call      0x145d995b0
140193366: nop
140193367: jmp       0x14019337d
140193369: mov       byte ptr [rbp + 0x247], 1
140193370: lea       rcx, [rip + 0x5c3c949]
140193377: call      0x145d995b0
14019337c: nop
14019337d: ud2
14019337f: mov       qword ptr [rbp + 0xb8], r12
140193386: mov       ecx, 1
14019338b: jmp       0x14019327f
140193390: mov       rdx, qword ptr [rbp + 0x1e0]
140193397: mov       ecx, 1
14019339c: jmp       0x14019329a
