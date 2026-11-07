1402a6c10: push      rbp
1402a6c11: push      r14
1402a6c13: push      rsi
1402a6c14: push      rdi
1402a6c15: push      rbx
1402a6c16: sub       rsp, 0x150
1402a6c1d: lea       rbp, [rsp + 0x80]
1402a6c25: mov       qword ptr [rbp + 0xc8], 0xfffffffffffffffe
1402a6c30: mov       rax, rcx
1402a6c33: add       rcx, 0x40
1402a6c37: lea       rdx, [rax + 0x5a8]
1402a6c3e: mov       qword ptr [rbp + 0xb0], rcx
1402a6c45: mov       qword ptr [rbp + 0xb8], rdx
1402a6c4c: mov       qword ptr [rbp + 0x98], 0
1402a6c57: mov       qword ptr [rbp + 0xa0], 8
1402a6c62: mov       qword ptr [rbp + 0xa8], 0
1402a6c6d: cmp       qword ptr [rax + 0x70], 0
1402a6c72: je        0x1402a6d09
1402a6c78: movabs    r9, 0xe28886f8b386a659
1402a6c82: mov       r8, qword ptr [rax + 0x58]
1402a6c86: mov       r10, qword ptr [rax + 0x60]
1402a6c8a: xor       r11d, r11d
1402a6c8d: movdqa    xmm0, xmmword ptr [rip + 0x5af6bab]
1402a6c95: pcmpeqd   xmm1, xmm1
1402a6c99: movdqa    xmm2, xmmword ptr [rip + 0x5b2be0f]
1402a6ca1: and       r9, r10
1402a6ca4: movdqu    xmm3, xmmword ptr [r8 + r9]
1402a6caa: movdqa    xmm4, xmm3
1402a6cae: pcmpeqb   xmm4, xmm0
1402a6cb2: pmovmskb  esi, xmm4
1402a6cb6: test      esi, esi
1402a6cb8: je        0x1402a6cf0
1402a6cba: tzcnt     edi, esi
1402a6cbe: add       rdi, r9
1402a6cc1: and       rdi, r10
1402a6cc4: neg       rdi
1402a6cc7: lea       rdi, [rdi + rdi*2]
1402a6ccb: movdqu    xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
1402a6cd2: pcmpeqb   xmm4, xmm2
1402a6cd6: pmovmskb  ebx, xmm4
1402a6cda: cmp       ebx, 0xffff
1402a6ce0: je        0x1402a6dbd
1402a6ce6: lea       edi, [rsi - 1]
1402a6ce9: and       di, si
1402a6cec: mov       esi, edi
1402a6cee: jne       0x1402a6cba
1402a6cf0: pcmpeqb   xmm3, xmm1
1402a6cf4: pmovmskb  esi, xmm3
1402a6cf8: test      esi, esi
1402a6cfa: jne       0x1402a6d09
1402a6cfc: add       r9, r11
1402a6cff: add       r9, 0x10
1402a6d03: add       r11, 0x10
1402a6d07: jmp       0x1402a6ca1
1402a6d09: movzx     r8d, byte ptr [rax + 0xa0]
1402a6d11: mov       r8, qword ptr [rax + 0xc0]
1402a6d18: mov       r9, qword ptr [rax + 0xc8]
1402a6d1f: movabs    r10, 0xe28886f8b386a659
1402a6d29: xor       r11d, r11d
1402a6d2c: movdqa    xmm0, xmmword ptr [rip + 0x5af6b0c]
1402a6d34: pcmpeqd   xmm1, xmm1
1402a6d38: movdqa    xmm2, xmmword ptr [rip + 0x5b2bd70]
1402a6d40: and       r10, r9
1402a6d43: movdqu    xmm3, xmmword ptr [r8 + r10]
1402a6d49: movdqa    xmm4, xmm3
1402a6d4d: pcmpeqb   xmm4, xmm0
1402a6d51: pmovmskb  ebx, xmm4
1402a6d55: test      ebx, ebx
1402a6d57: je        0x1402a6da0
1402a6d59: tzcnt     edi, ebx
1402a6d5d: add       rdi, r10
1402a6d60: and       rdi, r9
1402a6d63: mov       r14, rdi
1402a6d66: shl       r14, 7
1402a6d6a: mov       rsi, r8
1402a6d6d: sub       rsi, r14
1402a6d70: movdqu    xmm4, xmmword ptr [rsi - 0x80]
1402a6d75: pcmpeqb   xmm4, xmm2
1402a6d79: pmovmskb  r14d, xmm4
1402a6d7e: cmp       r14d, 0xffff
1402a6d85: je        0x1402a6ddb
1402a6d87: lea       esi, [rbx - 1]
1402a6d8a: and       si, bx
1402a6d8d: mov       ebx, esi
1402a6d8f: jne       0x1402a6d59
1402a6d91: nop       word ptr cs:[rax + rax]
1402a6da0: pcmpeqb   xmm3, xmm1
1402a6da4: pmovmskb  esi, xmm3
1402a6da8: test      esi, esi
1402a6daa: jne       0x1402a6e51
1402a6db0: add       r10, r11
1402a6db3: add       r10, 0x10
1402a6db7: add       r11, 0x10
1402a6dbb: jmp       0x1402a6d40
1402a6dbd: lea       rax, [r8 + rdi*8]
1402a6dc1: mov       rsi, qword ptr [rax - 8]
1402a6dc5: mov       edx, 8
1402a6dca: xor       r8d, r8d
1402a6dcd: mov       r9, rsi
1402a6dd0: call      0x144e9eff0
1402a6dd5: nop
1402a6dd6: jmp       0x1402a7058
1402a6ddb: lea       r10, [rdi - 0x10]
1402a6ddf: and       r10, r9
1402a6de2: movdqu    xmm0, xmmword ptr [r8 + r10]
1402a6de8: pcmpeqd   xmm1, xmm1
1402a6dec: pcmpeqb   xmm0, xmm1
1402a6df0: pmovmskb  r9d, xmm0
1402a6df5: movdqu    xmm0, xmmword ptr [r8 + rdi]
1402a6dfb: pcmpeqb   xmm0, xmm1
1402a6dff: pmovmskb  r11d, xmm0
1402a6e04: mov       bx, 0x1f
1402a6e08: bsr       bx, r9w
1402a6e0d: xor       ebx, 0xf
1402a6e10: or        r11d, 0x10000
1402a6e17: tzcnt     r11d, r11d
1402a6e1c: add       r11d, ebx
1402a6e1f: mov       r9b, 0x80
1402a6e22: cmp       r11w, 0xf
1402a6e27: ja        0x1402a6e33
1402a6e29: inc       qword ptr [rax + 0xd0]
1402a6e30: mov       r9b, 0xff
1402a6e33: mov       byte ptr [r8 + rdi], r9b
1402a6e37: mov       byte ptr [r8 + r10 + 0x10], r9b
1402a6e3c: dec       qword ptr [rax + 0xd8]
1402a6e43: mov       r8, qword ptr [rsi - 0x70]
1402a6e47: cmp       r8, 2
1402a6e4b: jne       0x1402a708b
1402a6e51: mov       rdi, rax
1402a6e54: mov       rsi, qword ptr [rdx]
1402a6e57: lea       rax, [rsi + 1]
1402a6e5b: mov       qword ptr [rdx], rax
1402a6e5e: mov       word ptr [rbp + 0x70], 0x100
1402a6e64: mov       qword ptr [rbp + 0x20], 1
1402a6e6c: movdqu    xmm0, xmmword ptr [rip + 0x5b2673c]
1402a6e74: movdqu    xmmword ptr [rbp + 0x28], xmm0
1402a6e79: mov       qword ptr [rbp + 0x48], 4
1402a6e81: mov       qword ptr [rbp + 0x50], 0x20
1402a6e89: mov       qword ptr [rbp + 0x68], 0
1402a6e91: mov       byte ptr [rbp + 0x72], 1
1402a6e95: mov       qword ptr [rbp + 0x38], 2
1402a6e9d: lea       rax, [rip - 0x1edbc4]
1402a6ea4: mov       qword ptr [rbp + 0x40], rax
1402a6ea8: mov       byte ptr [rbp + 0x58], 2
1402a6eac: lea       r8, [rbp + 0x20]
1402a6eb0: mov       rdx, rsi
1402a6eb3: call      0x14000f330
1402a6eb8: nop
1402a6eb9: mov       rcx, rdi
1402a6ebc: add       rcx, 0x58
1402a6ec0: lea       rdx, [rip + 0x5b4ba99]
1402a6ec7: mov       r8, rsi
1402a6eca: call      0x14000f180
1402a6ecf: nop
1402a6ed0: mov       rdi, qword ptr [rbp + 0xa8]
1402a6ed7: cmp       rdi, qword ptr [rbp + 0x98]
1402a6ede: jne       0x1402a6eed
1402a6ee0: lea       rcx, [rbp + 0x98]
1402a6ee7: call      0x145bfab70
1402a6eec: nop
1402a6eed: mov       rax, qword ptr [rbp + 0xa0]
1402a6ef4: mov       qword ptr [rax + rdi*8], rsi
1402a6ef8: inc       rdi
1402a6efb: mov       qword ptr [rbp + 0xa8], rdi
1402a6f02: mov       qword ptr [rbp - 0x60], 0
1402a6f0a: mov       qword ptr [rbp - 0x58], 8
1402a6f12: mov       qword ptr [rbp - 0x50], 0
1402a6f1a: movdqu    xmm0, xmmword ptr [rip + 0x5b4c52e]
1402a6f22: movdqu    xmmword ptr [rbp - 0x48], xmm0
1402a6f27: movdqu    xmm1, xmmword ptr [rip + 0x5b4c531]
1402a6f2f: movdqu    xmmword ptr [rbp - 0x38], xmm1
1402a6f34: mov       qword ptr [rbp - 0x28], 0
1402a6f3c: mov       qword ptr [rbp - 0x20], 8
1402a6f44: mov       qword ptr [rbp - 0x18], 0
1402a6f4c: movdqu    xmmword ptr [rbp - 0x10], xmm0
1402a6f51: movdqu    xmmword ptr [rbp], xmm1
1402a6f56: lea       rax, [rbp + 0x98]
1402a6f5d: mov       qword ptr [rbp + 0x10], rax
1402a6f61: lea       rax, [rbp - 0x60]
1402a6f65: mov       qword ptr [rbp + 0x18], rax
1402a6f69: mov       byte ptr [rbp + 0xc7], 1
1402a6f70: lea       rdx, [rbp + 0x10]
1402a6f74: mov       rcx, rsi
1402a6f77: call      0x14257c860
1402a6f7c: nop
1402a6f7d: mov       rcx, qword ptr [rbp + 0xb0]
1402a6f84: mov       byte ptr [rbp + 0xc7], 1
1402a6f8b: lea       r8, [rbp - 0x60]
1402a6f8f: mov       rdx, rsi
1402a6f92: call      0x144e44770
1402a6f97: nop
1402a6f98: mov       rax, qword ptr [rbp + 0xa8]
1402a6f9f: test      rax, rax
1402a6fa2: je        0x1402a6fae
1402a6fa4: dec       rax
1402a6fa7: mov       qword ptr [rbp + 0xa8], rax
1402a6fae: mov       rax, qword ptr [rbp + 0xb0]
1402a6fb5: mov       rax, qword ptr [rax + 8]
1402a6fb9: imul      rcx, rsi, 0x130
1402a6fc0: movups    xmm0, xmmword ptr [rbp]
1402a6fc4: movaps    xmmword ptr [rbp + 0x80], xmm0
1402a6fcb: movups    xmm0, xmmword ptr [rbp - 0x10]
1402a6fcf: movaps    xmmword ptr [rbp + 0x70], xmm0
1402a6fd3: movups    xmm0, xmmword ptr [rbp - 0x20]
1402a6fd7: movaps    xmmword ptr [rbp + 0x60], xmm0
1402a6fdb: movups    xmm0, xmmword ptr [rbp - 0x60]
1402a6fdf: movups    xmm1, xmmword ptr [rbp - 0x50]
1402a6fe3: movups    xmm2, xmmword ptr [rbp - 0x40]
1402a6fe7: movups    xmm3, xmmword ptr [rbp - 0x30]
1402a6feb: movaps    xmmword ptr [rbp + 0x50], xmm3
1402a6fef: movaps    xmmword ptr [rbp + 0x40], xmm2
1402a6ff3: movaps    xmmword ptr [rbp + 0x30], xmm1
1402a6ff7: movaps    xmmword ptr [rbp + 0x20], xmm0
1402a6ffb: add       rcx, rax
1402a6ffe: add       rcx, 0x58
1402a7002: mov       qword ptr [rbp + 0x90], rcx
1402a7009: call      0x14000b310
1402a700e: nop
1402a700f: movaps    xmm0, xmmword ptr [rbp + 0x80]
1402a7016: mov       rax, qword ptr [rbp + 0x90]
1402a701d: movups    xmmword ptr [rax + 0x60], xmm0
1402a7021: movaps    xmm0, xmmword ptr [rbp + 0x70]
1402a7025: movups    xmmword ptr [rax + 0x50], xmm0
1402a7029: movaps    xmm0, xmmword ptr [rbp + 0x60]
1402a702d: movups    xmmword ptr [rax + 0x40], xmm0
1402a7031: movdqa    xmm0, xmmword ptr [rbp + 0x20]
1402a7036: movdqa    xmm1, xmmword ptr [rbp + 0x30]
1402a703b: movdqa    xmm2, xmmword ptr [rbp + 0x40]
1402a7040: movdqa    xmm3, xmmword ptr [rbp + 0x50]
1402a7045: movdqu    xmmword ptr [rax + 0x30], xmm3
1402a704a: movdqu    xmmword ptr [rax + 0x20], xmm2
1402a704f: movdqu    xmmword ptr [rax + 0x10], xmm1
1402a7054: movdqu    xmmword ptr [rax], xmm0
1402a7058: mov       rdx, qword ptr [rbp + 0x98]
1402a705f: test      rdx, rdx
1402a7062: je        0x1402a707a
1402a7064: mov       rcx, qword ptr [rbp + 0xa0]
1402a706b: shl       rdx, 3
1402a706f: mov       r8d, 8
1402a7075: call      0x1400021d0
1402a707a: mov       rax, rsi
1402a707d: add       rsp, 0x150
1402a7084: pop       rbx
1402a7085: pop       rdi
1402a7086: pop       rsi
1402a7087: pop       r14
1402a7089: pop       rbp
1402a708a: ret
1402a708b: mov       rax, qword ptr [rsi - 8]
1402a708f: mov       qword ptr [rbp + 0x88], rax
1402a7096: movups    xmm0, xmmword ptr [rsi - 0x18]
1402a709a: movups    xmmword ptr [rbp + 0x78], xmm0
1402a709e: movups    xmm0, xmmword ptr [rsi - 0x28]
1402a70a2: movups    xmmword ptr [rbp + 0x68], xmm0
1402a70a6: movdqu    xmm0, xmmword ptr [rsi - 0x68]
1402a70ab: movdqu    xmm1, xmmword ptr [rsi - 0x58]
1402a70b0: movdqu    xmm2, xmmword ptr [rsi - 0x48]
1402a70b5: movdqu    xmm3, xmmword ptr [rsi - 0x38]
1402a70ba: movdqu    xmmword ptr [rbp + 0x58], xmm3
1402a70bf: movdqu    xmmword ptr [rbp + 0x48], xmm2
1402a70c4: movdqu    xmmword ptr [rbp + 0x38], xmm1
1402a70c9: movdqu    xmmword ptr [rbp + 0x28], xmm0
1402a70ce: mov       qword ptr [rbp + 0x20], r8
1402a70d2: lea       rcx, [rbp + 0x20]
1402a70d6: lea       rdx, [rbp + 0x98]
1402a70dd: call      0x144e08f20
1402a70e2: nop
1402a70e3: mov       rsi, rax
1402a70e6: mov       rdx, qword ptr [rbp + 0x98]
1402a70ed: test      rdx, rdx
1402a70f0: jne       0x1402a7064
1402a70f6: jmp       0x1402a707a
