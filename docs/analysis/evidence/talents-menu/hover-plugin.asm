140064930: push      rbp
140064931: push      r15
140064933: push      r14
140064935: push      r12
140064937: push      rsi
140064938: push      rdi
140064939: push      rbx
14006493a: sub       rsp, 0xae0
140064941: lea       rbp, [rsp + 0x80]
140064949: mov       qword ptr [rbp + 0xa58], 0xfffffffffffffffe
140064954: mov       rsi, rcx
140064957: lea       rcx, [rbp + 0x2b0]
14006495e: call      0x140062330
140064963: lea       rdi, [rsi + 0x40]
140064967: lea       r15, [rsi + 0x5a8]
14006496e: mov       qword ptr [rbp + 0x9f0], rdi
140064975: mov       qword ptr [rbp + 0x9f8], r15
14006497c: mov       qword ptr [rbp + 0x9d8], 0
140064987: mov       qword ptr [rbp + 0x9e0], 8
140064992: mov       qword ptr [rbp + 0x9e8], 0
14006499d: cmp       qword ptr [rsi + 0x90], 0
1400649a5: je        0x140064a4b
1400649ab: movabs    rcx, 0x397c766565084ed2
1400649b5: mov       rax, qword ptr [rsi + 0x78]
1400649b9: mov       rdx, qword ptr [rsi + 0x80]
1400649c0: xor       r8d, r8d
1400649c3: movdqa    xmm0, xmmword ptr [rip + 0x5d38da5]
1400649cb: pcmpeqd   xmm1, xmm1
1400649cf: movdqa    xmm2, xmmword ptr [rip + 0x5d38da9]
1400649d7: and       rcx, rdx
1400649da: movdqu    xmm3, xmmword ptr [rax + rcx]
1400649df: movdqa    xmm4, xmm3
1400649e3: pcmpeqb   xmm4, xmm0
1400649e7: pmovmskb  r9d, xmm4
1400649ec: test      r9d, r9d
1400649ef: je        0x140064a30
1400649f1: tzcnt     r10d, r9d
1400649f6: add       r10, rcx
1400649f9: and       r10, rdx
1400649fc: neg       r10
1400649ff: lea       r10, [r10 + r10*2]
140064a03: movdqu    xmm4, xmmword ptr [rax + r10*8 - 0x18]
140064a0a: pcmpeqb   xmm4, xmm2
140064a0e: pmovmskb  r11d, xmm4
140064a13: cmp       r11d, 0xffff
140064a1a: je        0x140064aff
140064a20: lea       r10d, [r9 - 1]
140064a24: and       r10w, r9w
140064a28: mov       r9d, r10d
140064a2b: jne       0x1400649f1
140064a2d: nop       dword ptr [rax]
140064a30: pcmpeqb   xmm3, xmm1
140064a34: pmovmskb  r9d, xmm3
140064a39: test      r9d, r9d
140064a3c: jne       0x140064a4b
140064a3e: add       rcx, r8
140064a41: add       rcx, 0x10
140064a45: add       r8, 0x10
140064a49: jmp       0x1400649d7
140064a4b: movzx     eax, byte ptr [rsi + 0xa0]
140064a52: mov       rax, qword ptr [rsi + 0xe0]
140064a59: mov       rcx, qword ptr [rsi + 0xe8]
140064a60: movabs    rdx, 0x397c766565084ed2
140064a6a: xor       r8d, r8d
140064a6d: movdqa    xmm0, xmmword ptr [rip + 0x5d38cfb]
140064a75: pcmpeqd   xmm1, xmm1
140064a79: movdqa    xmm2, xmmword ptr [rip + 0x5d38cff]
140064a81: and       rdx, rcx
140064a84: movdqu    xmm3, xmmword ptr [rax + rdx]
140064a89: movdqa    xmm4, xmm3
140064a8d: pcmpeqb   xmm4, xmm0
140064a91: pmovmskb  r11d, xmm4
140064a96: test      r11d, r11d
140064a99: je        0x140064ae0
140064a9b: tzcnt     r10d, r11d
140064aa0: add       r10, rdx
140064aa3: and       r10, rcx
140064aa6: mov       rbx, r10
140064aa9: shl       rbx, 7
140064aad: mov       r9, rax
140064ab0: sub       r9, rbx
140064ab3: movdqu    xmm4, xmmword ptr [r9 - 0x80]
140064ab9: pcmpeqb   xmm4, xmm2
140064abd: pmovmskb  ebx, xmm4
140064ac1: cmp       ebx, 0xffff
140064ac7: je        0x140064b1c
140064ac9: lea       r9d, [r11 - 1]
140064acd: and       r9w, r11w
140064ad1: mov       r11d, r9d
140064ad4: jne       0x140064a9b
140064ad6: nop       word ptr cs:[rax + rax]
140064ae0: pcmpeqb   xmm3, xmm1
140064ae4: pmovmskb  r9d, xmm3
140064ae9: test      r9d, r9d
140064aec: jne       0x140064b8f
140064af2: add       rdx, r8
140064af5: add       rdx, 0x10
140064af9: add       r8, 0x10
140064afd: jmp       0x140064a81
140064aff: lea       rax, [rax + r10*8]
140064b03: mov       r14, qword ptr [rax - 8]
140064b07: mov       rdx, qword ptr [rbp + 0x9d8]
140064b0e: test      rdx, rdx
140064b11: jne       0x140064c2d
140064b17: jmp       0x140064c43
140064b1c: lea       rdx, [r10 - 0x10]
140064b20: and       rdx, rcx
140064b23: movdqu    xmm0, xmmword ptr [rax + rdx]
140064b28: pcmpeqd   xmm1, xmm1
140064b2c: pcmpeqb   xmm0, xmm1
140064b30: pmovmskb  ecx, xmm0
140064b34: movdqu    xmm0, xmmword ptr [rax + r10]
140064b3a: pcmpeqb   xmm0, xmm1
140064b3e: pmovmskb  r8d, xmm0
140064b43: mov       r11w, 0x1f
140064b48: bsr       r11w, cx
140064b4d: xor       r11d, 0xf
140064b51: or        r8d, 0x10000
140064b58: tzcnt     r8d, r8d
140064b5d: add       r8d, r11d
140064b60: mov       cl, 0x80
140064b62: cmp       r8w, 0xf
140064b67: ja        0x140064b72
140064b69: inc       qword ptr [rsi + 0xf0]
140064b70: mov       cl, 0xff
140064b72: mov       byte ptr [rax + r10], cl
140064b76: mov       byte ptr [rax + rdx + 0x10], cl
140064b7a: dec       qword ptr [rsi + 0xf8]
140064b81: mov       rax, qword ptr [r9 - 0x70]
140064b85: cmp       rax, 2
140064b89: jne       0x140065cf2
140064b8f: mov       r14, qword ptr [r15]
140064b92: lea       rax, [r14 + 1]
140064b96: mov       qword ptr [r15], rax
140064b99: mov       word ptr [rbp + 0x4d0], 0x100
140064ba2: mov       qword ptr [rbp + 0x480], 1
140064bad: movdqu    xmm0, xmmword ptr [rip + 0x5d6880b]
140064bb5: movdqu    xmmword ptr [rbp + 0x488], xmm0
140064bbd: mov       qword ptr [rbp + 0x4a8], 8
140064bc8: mov       qword ptr [rbp + 0x4b0], 0x40
140064bd3: lea       rax, [rip - 0x5b91a]
140064bda: mov       qword ptr [rbp + 0x4c8], rax
140064be1: mov       byte ptr [rbp + 0x4d2], 1
140064be8: mov       qword ptr [rbp + 0x498], 0
140064bf3: mov       byte ptr [rbp + 0x4b8], 2
140064bfa: lea       r8, [rbp + 0x480]
140064c01: mov       rcx, rdi
140064c04: mov       rdx, r14
140064c07: call      0x14000f330
140064c0c: nop
140064c0d: lea       rcx, [rsi + 0x78]
140064c11: lea       rdx, [rip + 0x5d687a8]
140064c18: mov       r8, r14
140064c1b: call      0x14000f180
140064c20: nop
140064c21: mov       rdx, qword ptr [rbp + 0x9d8]
140064c28: test      rdx, rdx
140064c2b: je        0x140064c43
140064c2d: mov       rcx, qword ptr [rbp + 0x9e0]
140064c34: shl       rdx, 3
140064c38: mov       r8d, 8
140064c3e: call      0x1400021d0
140064c43: movdqu    xmm0, xmmword ptr [rbp + 0x2b0]
140064c4b: movdqu    xmm1, xmmword ptr [rbp + 0x2c0]
140064c53: movdqu    xmm2, xmmword ptr [rbp + 0x2d0]
140064c5b: movdqu    xmm3, xmmword ptr [rbp + 0x2e0]
140064c63: movdqa    xmmword ptr [rbp + 0x4b0], xmm3
140064c6b: movdqa    xmmword ptr [rbp + 0x4a0], xmm2
140064c73: movdqa    xmmword ptr [rbp + 0x490], xmm1
140064c7b: movdqa    xmmword ptr [rbp + 0x480], xmm0
140064c83: mov       r12d, dword ptr [rsi + 0x5b0]
140064c8a: mov       byte ptr [rbp + 0xa57], 0
140064c91: mov       rcx, rsi
140064c94: call      0x144e65ff0
140064c99: nop
140064c9a: mov       qword ptr [rbp + 0x9d8], r14
140064ca1: lea       rbx, [rsi + 0x1d8]
140064ca8: mov       byte ptr [rbp + 0xa57], 0
140064caf: lea       r9, [rbp + 0x9d8]
140064cb6: mov       rcx, rbx
140064cb9: mov       rdx, r14
140064cbc: mov       r8, rdi
140064cbf: call      0x1400e99b0
140064cc4: nop
140064cc5: mov       r14, rax
140064cc8: cmp       byte ptr [rax + 0x30], 1
140064ccc: jne       0x140064ce9
140064cce: mov       byte ptr [rbp + 0xa57], 0
140064cd5: lea       r8, [rbp + 0x480]
140064cdc: mov       rcx, r14
140064cdf: xor       edx, edx
140064ce1: call      0x144e7e940
140064ce6: nop
140064ce7: jmp       0x140064d06
140064ce9: mov       r8, qword ptr [r14 + 8]
140064ced: mov       rcx, qword ptr [r14 + 0x10]
140064cf1: lea       rdx, [rbp + 0x480]
140064cf8: call      0x145bfa0ed
140064cfd: mov       dword ptr [r14 + 0x28], r12d
140064d01: mov       byte ptr [r14 + 0x30], 1
140064d06: mov       dword ptr [r14 + 0x2c], r12d
140064d0a: lea       rcx, [rbp + 0x2b0]
140064d11: call      0x14589d550
140064d16: mov       qword ptr [rbp + 0x9f0], rdi
140064d1d: mov       qword ptr [rbp + 0x9f8], r15
140064d24: mov       qword ptr [rbp + 0x9d8], 0
140064d2f: mov       qword ptr [rbp + 0x9e0], 8
140064d3a: mov       qword ptr [rbp + 0x9e8], 0
140064d45: cmp       qword ptr [rsi + 0x90], 0
140064d4d: je        0x140064dfb
140064d53: movabs    rcx, 0x47ec9b301a65411a
140064d5d: mov       rax, qword ptr [rsi + 0x78]
140064d61: mov       rdx, qword ptr [rsi + 0x80]
140064d68: xor       r8d, r8d
140064d6b: movdqa    xmm0, xmmword ptr [rip + 0x5d6816d]
140064d73: pcmpeqd   xmm1, xmm1
140064d77: movdqa    xmm2, xmmword ptr [rip + 0x5d68171]
140064d7f: and       rcx, rdx
140064d82: movdqu    xmm3, xmmword ptr [rax + rcx]
140064d87: movdqa    xmm4, xmm3
140064d8b: pcmpeqb   xmm4, xmm0
140064d8f: pmovmskb  r9d, xmm4
140064d94: test      r9d, r9d
140064d97: je        0x140064de0
140064d99: tzcnt     r10d, r9d
140064d9e: add       r10, rcx
140064da1: and       r10, rdx
140064da4: neg       r10
140064da7: lea       r10, [r10 + r10*2]
140064dab: movdqu    xmm4, xmmword ptr [rax + r10*8 - 0x18]
140064db2: pcmpeqb   xmm4, xmm2
140064db6: pmovmskb  r11d, xmm4
140064dbb: cmp       r11d, 0xffff
140064dc2: je        0x140064eaf
140064dc8: lea       r10d, [r9 - 1]
140064dcc: and       r10w, r9w
140064dd0: mov       r9d, r10d
140064dd3: jne       0x140064d99
140064dd5: nop       word ptr cs:[rax + rax]
140064de0: pcmpeqb   xmm3, xmm1
140064de4: pmovmskb  r9d, xmm3
140064de9: test      r9d, r9d
140064dec: jne       0x140064dfb
140064dee: add       rcx, r8
140064df1: add       rcx, 0x10
140064df5: add       r8, 0x10
140064df9: jmp       0x140064d7f
140064dfb: movzx     eax, byte ptr [rsi + 0xa0]
140064e02: mov       rax, qword ptr [rsi + 0xe0]
140064e09: mov       rcx, qword ptr [rsi + 0xe8]
140064e10: movabs    rdx, 0x47ec9b301a65411a
140064e1a: xor       r8d, r8d
140064e1d: movdqa    xmm0, xmmword ptr [rip + 0x5d680bb]
140064e25: pcmpeqd   xmm1, xmm1
140064e29: movdqa    xmm2, xmmword ptr [rip + 0x5d680bf]
140064e31: and       rdx, rcx
140064e34: movdqu    xmm3, xmmword ptr [rax + rdx]
140064e39: movdqa    xmm4, xmm3
140064e3d: pcmpeqb   xmm4, xmm0
140064e41: pmovmskb  r11d, xmm4
140064e46: test      r11d, r11d
140064e49: je        0x140064e90
140064e4b: tzcnt     r10d, r11d
140064e50: add       r10, rdx
140064e53: and       r10, rcx
140064e56: mov       r14, r10
140064e59: shl       r14, 7
140064e5d: mov       r9, rax
140064e60: sub       r9, r14
140064e63: movdqu    xmm4, xmmword ptr [r9 - 0x80]
140064e69: pcmpeqb   xmm4, xmm2
140064e6d: pmovmskb  r14d, xmm4
140064e72: cmp       r14d, 0xffff
140064e79: je        0x140064ecc
140064e7b: lea       r9d, [r11 - 1]
140064e7f: and       r9w, r11w
140064e83: mov       r11d, r9d
140064e86: jne       0x140064e4b
140064e88: nop       dword ptr [rax + rax]
140064e90: pcmpeqb   xmm3, xmm1
140064e94: pmovmskb  r9d, xmm3
140064e99: test      r9d, r9d
140064e9c: jne       0x140064f3f
140064ea2: add       rdx, r8
140064ea5: add       rdx, 0x10
140064ea9: add       r8, 0x10
140064ead: jmp       0x140064e31
140064eaf: lea       rax, [rax + r10*8]
140064eb3: mov       r14, qword ptr [rax - 8]
140064eb7: mov       rdx, qword ptr [rbp + 0x9d8]
140064ebe: test      rdx, rdx
140064ec1: jne       0x140064fdd
140064ec7: jmp       0x140064ff3
140064ecc: lea       rdx, [r10 - 0x10]
140064ed0: and       rdx, rcx
140064ed3: movdqu    xmm0, xmmword ptr [rax + rdx]
140064ed8: pcmpeqd   xmm1, xmm1
140064edc: pcmpeqb   xmm0, xmm1
140064ee0: pmovmskb  ecx, xmm0
140064ee4: movdqu    xmm0, xmmword ptr [rax + r10]
140064eea: pcmpeqb   xmm0, xmm1
140064eee: pmovmskb  r8d, xmm0
140064ef3: mov       r11w, 0x1f
140064ef8: bsr       r11w, cx
140064efd: xor       r11d, 0xf
140064f01: or        r8d, 0x10000
140064f08: tzcnt     r8d, r8d
140064f0d: add       r8d, r11d
140064f10: mov       cl, 0x80
140064f12: cmp       r8w, 0xf
140064f17: ja        0x140064f22
140064f19: inc       qword ptr [rsi + 0xf0]
140064f20: mov       cl, 0xff
140064f22: mov       byte ptr [rax + r10], cl
140064f26: mov       byte ptr [rax + rdx + 0x10], cl
140064f2a: dec       qword ptr [rsi + 0xf8]
140064f31: mov       rax, qword ptr [r9 - 0x70]
140064f35: cmp       rax, 2
140064f39: jne       0x140065d80
140064f3f: mov       r14, qword ptr [r15]
140064f42: lea       rax, [r14 + 1]
140064f46: mov       qword ptr [r15], rax
140064f49: mov       word ptr [rbp + 0x4d0], 0x100
140064f52: mov       qword ptr [rbp + 0x480], 1
140064f5d: movdqu    xmm0, xmmword ptr [rip + 0x5d6846b]
140064f65: movdqu    xmmword ptr [rbp + 0x488], xmm0
140064f6d: mov       qword ptr [rbp + 0x4a8], 8
140064f78: mov       qword ptr [rbp + 0x4b0], 0x1d0
140064f83: lea       rax, [rip - 0xb10a]
140064f8a: mov       qword ptr [rbp + 0x4c8], rax
140064f91: mov       byte ptr [rbp + 0x4d2], 1
140064f98: mov       qword ptr [rbp + 0x498], 0
140064fa3: mov       byte ptr [rbp + 0x4b8], 2
140064faa: lea       r8, [rbp + 0x480]
140064fb1: mov       rcx, rdi
140064fb4: mov       rdx, r14
140064fb7: call      0x14000f330
140064fbc: nop
140064fbd: lea       rcx, [rsi + 0x78]
140064fc1: lea       rdx, [rip + 0x5d68408]
140064fc8: mov       r8, r14
140064fcb: call      0x14000f180
140064fd0: nop
140064fd1: mov       rdx, qword ptr [rbp + 0x9d8]
140064fd8: test      rdx, rdx
140064fdb: je        0x140064ff3
140064fdd: mov       rcx, qword ptr [rbp + 0x9e0]
140064fe4: shl       rdx, 3
140064fe8: mov       r8d, 8
140064fee: call      0x1400021d0
140064ff3: lea       rcx, [rbp + 0x480]
140064ffa: lea       rdx, [rbp + 0x2b0]
140065001: mov       r8d, 0x1d0
140065007: call      0x145bfa0e7
14006500c: mov       r12d, dword ptr [rsi + 0x5b0]
140065013: mov       byte ptr [rbp + 0xa56], 0
14006501a: mov       rcx, rsi
14006501d: call      0x144e65ff0
140065022: nop
140065023: mov       qword ptr [rbp + 0x9d8], r14
14006502a: mov       byte ptr [rbp + 0xa56], 0
140065031: lea       r9, [rbp + 0x9d8]
140065038: mov       rcx, rbx
14006503b: mov       rdx, r14
14006503e: mov       r8, rdi
140065041: call      0x1400e99b0
140065046: nop
140065047: mov       r14, rax
14006504a: cmp       byte ptr [rax + 0x30], 1
14006504e: jne       0x14006506b
140065050: mov       byte ptr [rbp + 0xa56], 0
140065057: lea       r8, [rbp + 0x480]
14006505e: mov       rcx, r14
140065061: xor       edx, edx
140065063: call      0x144e7e940
140065068: nop
140065069: jmp       0x140065088
14006506b: mov       r8, qword ptr [r14 + 8]
14006506f: mov       rcx, qword ptr [r14 + 0x10]
140065073: lea       rdx, [rbp + 0x480]
14006507a: call      0x145bfa0ed
14006507f: mov       dword ptr [r14 + 0x28], r12d
140065083: mov       byte ptr [r14 + 0x30], 1
140065088: mov       dword ptr [r14 + 0x2c], r12d
14006508c: mov       qword ptr [rbp + 0x2c8], rdi
140065093: mov       qword ptr [rbp + 0x2d0], r15
14006509a: mov       qword ptr [rbp + 0x2b0], 0
1400650a5: mov       qword ptr [rbp + 0x2b8], 8
1400650b0: mov       qword ptr [rbp + 0x2c0], 0
1400650bb: cmp       qword ptr [rsi + 0x90], 0
1400650c3: je        0x14006516b
1400650c9: movabs    rcx, 0x14a93ad82250ed2a
1400650d3: mov       rax, qword ptr [rsi + 0x78]
1400650d7: mov       rdx, qword ptr [rsi + 0x80]
1400650de: xor       r8d, r8d
1400650e1: movdqa    xmm0, xmmword ptr [rip + 0x5d389c7]
1400650e9: pcmpeqd   xmm1, xmm1
1400650ed: movdqa    xmm2, xmmword ptr [rip + 0x5d389cb]
1400650f5: and       rcx, rdx
1400650f8: movdqu    xmm3, xmmword ptr [rax + rcx]
1400650fd: movdqa    xmm4, xmm3
140065101: pcmpeqb   xmm4, xmm0
140065105: pmovmskb  r9d, xmm4
14006510a: test      r9d, r9d
14006510d: je        0x140065150
14006510f: tzcnt     r10d, r9d
140065114: add       r10, rcx
140065117: and       r10, rdx
14006511a: neg       r10
14006511d: lea       r10, [r10 + r10*2]
140065121: movdqu    xmm4, xmmword ptr [rax + r10*8 - 0x18]
140065128: pcmpeqb   xmm4, xmm2
14006512c: pmovmskb  r11d, xmm4
140065131: cmp       r11d, 0xffff
140065138: je        0x14006521f
14006513e: lea       r10d, [r9 - 1]
140065142: and       r10w, r9w
140065146: mov       r9d, r10d
140065149: jne       0x14006510f
14006514b: nop       dword ptr [rax + rax]
140065150: pcmpeqb   xmm3, xmm1
140065154: pmovmskb  r9d, xmm3
140065159: test      r9d, r9d
14006515c: jne       0x14006516b
14006515e: add       rcx, r8
140065161: add       rcx, 0x10
140065165: add       r8, 0x10
140065169: jmp       0x1400650f5
14006516b: movzx     eax, byte ptr [rsi + 0xa0]
140065172: mov       rax, qword ptr [rsi + 0xe0]
140065179: mov       rcx, qword ptr [rsi + 0xe8]
140065180: movabs    rdx, 0x14a93ad82250ed2a
14006518a: xor       r8d, r8d
14006518d: movdqa    xmm0, xmmword ptr [rip + 0x5d3891b]
140065195: pcmpeqd   xmm1, xmm1
140065199: movdqa    xmm2, xmmword ptr [rip + 0x5d3891f]
1400651a1: and       rdx, rcx
1400651a4: movdqu    xmm3, xmmword ptr [rax + rdx]
1400651a9: movdqa    xmm4, xmm3
1400651ad: pcmpeqb   xmm4, xmm0
1400651b1: pmovmskb  r11d, xmm4
1400651b6: test      r11d, r11d
1400651b9: je        0x140065200
1400651bb: tzcnt     r10d, r11d
1400651c0: add       r10, rdx
1400651c3: and       r10, rcx
1400651c6: mov       r14, r10
1400651c9: shl       r14, 7
1400651cd: mov       r9, rax
1400651d0: sub       r9, r14
1400651d3: movdqu    xmm4, xmmword ptr [r9 - 0x80]
1400651d9: pcmpeqb   xmm4, xmm2
1400651dd: pmovmskb  r14d, xmm4
1400651e2: cmp       r14d, 0xffff
1400651e9: je        0x14006523c
1400651eb: lea       r9d, [r11 - 1]
1400651ef: and       r9w, r11w
1400651f3: mov       r11d, r9d
1400651f6: jne       0x1400651bb
1400651f8: nop       dword ptr [rax + rax]
140065200: pcmpeqb   xmm3, xmm1
140065204: pmovmskb  r9d, xmm3
140065209: test      r9d, r9d
14006520c: jne       0x1400652af
140065212: add       rdx, r8
140065215: add       rdx, 0x10
140065219: add       r8, 0x10
14006521d: jmp       0x1400651a1
14006521f: lea       rax, [rax + r10*8]
140065223: mov       r14, qword ptr [rax - 8]
140065227: mov       rdx, qword ptr [rbp + 0x2b0]
14006522e: test      rdx, rdx
140065231: jne       0x14006534a
140065237: jmp       0x140065360
14006523c: lea       rdx, [r10 - 0x10]
140065240: and       rdx, rcx
140065243: movdqu    xmm0, xmmword ptr [rax + rdx]
140065248: pcmpeqd   xmm1, xmm1
14006524c: pcmpeqb   xmm0, xmm1
140065250: pmovmskb  ecx, xmm0
140065254: movdqu    xmm0, xmmword ptr [rax + r10]
14006525a: pcmpeqb   xmm0, xmm1
14006525e: pmovmskb  r8d, xmm0
140065263: mov       r11w, 0x1f
140065268: bsr       r11w, cx
14006526d: xor       r11d, 0xf
140065271: or        r8d, 0x10000
140065278: tzcnt     r8d, r8d
14006527d: add       r8d, r11d
140065280: mov       cl, 0x80
140065282: cmp       r8w, 0xf
140065287: ja        0x140065292
140065289: inc       qword ptr [rsi + 0xf0]
140065290: mov       cl, 0xff
140065292: mov       byte ptr [rax + r10], cl
140065296: mov       byte ptr [rax + rdx + 0x10], cl
14006529a: dec       qword ptr [rsi + 0xf8]
1400652a1: mov       rax, qword ptr [r9 - 0x70]
1400652a5: cmp       rax, 2
1400652a9: jne       0x140065e0e
1400652af: mov       r14, qword ptr [r15]
1400652b2: lea       rax, [r14 + 1]
1400652b6: mov       qword ptr [r15], rax
1400652b9: mov       word ptr [rbp + 0x4d0], 0x100
1400652c2: mov       qword ptr [rbp + 0x480], 1
1400652cd: movdqu    xmm0, xmmword ptr [rip + 0x5d6809b]
1400652d5: movdqu    xmmword ptr [rbp + 0x488], xmm0
1400652dd: mov       qword ptr [rbp + 0x4a8], 1
1400652e8: mov       qword ptr [rbp + 0x4b0], 1
1400652f3: mov       qword ptr [rbp + 0x4c8], 0
1400652fe: mov       byte ptr [rbp + 0x4d2], 1
140065305: mov       qword ptr [rbp + 0x498], 0
140065310: mov       byte ptr [rbp + 0x4b8], 2
140065317: lea       r8, [rbp + 0x480]
14006531e: mov       rcx, rdi
140065321: mov       rdx, r14
140065324: call      0x14000f330
140065329: nop
14006532a: lea       rcx, [rsi + 0x78]
14006532e: lea       rdx, [rip + 0x5d6803b]
140065335: mov       r8, r14
140065338: call      0x14000f180
14006533d: nop
14006533e: mov       rdx, qword ptr [rbp + 0x2b0]
140065345: test      rdx, rdx
140065348: je        0x140065360
14006534a: mov       rcx, qword ptr [rbp + 0x2b8]
140065351: shl       rdx, 3
140065355: mov       r8d, 8
14006535b: call      0x1400021d0
140065360: cmp       r14, qword ptr [rsi + 0x218]
140065367: jae       0x14006538e
140065369: mov       rax, qword ptr [rsi + 0x210]
140065370: mov       rax, qword ptr [rax + r14*8]
140065374: test      rax, rax
140065377: je        0x14006538e
140065379: mov       rcx, qword ptr [rsi + 0x1e0]
140065380: not       rax
140065383: imul      rax, rax, 0x38
140065387: cmp       byte ptr [rcx + rax + 0x30], 0
14006538c: jne       0x1400653fc
14006538e: mov       byte ptr [rbp + 0x2b0], 0
140065395: mov       r15d, dword ptr [rsi + 0x5b0]
14006539c: mov       rcx, rsi
14006539f: call      0x144e65ff0
1400653a4: mov       qword ptr [rbp + 0x480], r14
1400653ab: lea       r9, [rbp + 0x480]
1400653b2: mov       rcx, rbx
1400653b5: mov       rdx, r14
1400653b8: mov       r8, rdi
1400653bb: call      0x1400e99b0
1400653c0: mov       rdi, rax
1400653c3: cmp       byte ptr [rax + 0x30], 1
1400653c7: jne       0x1400653dc
1400653c9: lea       r8, [rbp + 0x2b0]
1400653d0: mov       rcx, rdi
1400653d3: xor       edx, edx
1400653d5: call      0x144e7e940
1400653da: jmp       0x1400653f8
1400653dc: mov       r8, qword ptr [rdi + 8]
1400653e0: mov       rcx, qword ptr [rdi + 0x10]
1400653e4: lea       rdx, [rbp + 0x2b0]
1400653eb: call      0x145bfa0ed
1400653f0: mov       dword ptr [rdi + 0x28], r15d
1400653f4: mov       byte ptr [rdi + 0x30], 1
1400653f8: mov       dword ptr [rdi + 0x2c], r15d
1400653fc: call      0x140002200
140065401: mov       ecx, 0x460
140065406: mov       edx, 8
14006540b: call      0x1400021c0
140065410: test      rax, rax
140065413: je        0x140065e9c
140065419: mov       qword ptr [rbp + 0xa48], rax
140065420: mov       qword ptr [rbp + 0x480], 0xffffffffffffffff
14006542b: mov       dword ptr [rbp + 0x628], 0
140065435: mov       byte ptr [rbp + 0x62c], 0
14006543c: call      0x140002200
140065441: mov       ecx, 0x1b0
140065446: mov       edx, 8
14006544b: call      0x1400021c0
140065450: test      rax, rax
140065453: je        0x140065ead
140065459: mov       rdi, rax
14006545c: lea       rdx, [rbp + 0x480]
140065463: mov       r8d, 0x1b0
140065469: mov       rcx, rax
14006546c: call      0x145bfa0e7
140065471: nop
140065472: lea       r8, [rip + 0x5d6a907]
140065479: lea       rcx, [rbp + 0x240]
140065480: mov       rdx, rdi
140065483: call      0x144e1fc30
140065488: nop
140065489: mov       qword ptr [rbp + 0x480], 0xffffffffffffffff
140065494: mov       dword ptr [rbp + 0x9d0], 0
14006549e: mov       byte ptr [rbp + 0x9d4], 0
1400654a5: call      0x140002200
1400654aa: mov       ecx, 0x558
1400654af: mov       edx, 8
1400654b4: call      0x1400021c0
1400654b9: test      rax, rax
1400654bc: je        0x140065ec2
1400654c2: mov       rdi, rax
1400654c5: lea       rdx, [rbp + 0x480]
1400654cc: mov       r8d, 0x558
1400654d2: mov       rcx, rax
1400654d5: call      0x145bfa0e7
1400654da: nop
1400654db: lea       r8, [rip + 0x5d6ac8e]
1400654e2: lea       rcx, [rbp + 0x1d0]
1400654e9: mov       rdx, rdi
1400654ec: call      0x144e1fc30
1400654f1: nop
1400654f2: mov       qword ptr [rbp + 0x570], 0xffffffffffffffff
1400654fd: mov       dword ptr [rbp + 0x6f0], 0
140065507: mov       byte ptr [rbp + 0x6f4], 0
14006550e: call      0x140002200
140065513: mov       ecx, 0x278
140065518: mov       edx, 8
14006551d: call      0x1400021c0
140065522: test      rax, rax
140065525: je        0x140065ed7
14006552b: mov       rdi, rax
14006552e: lea       rdx, [rbp + 0x480]
140065535: mov       r8d, 0x278
14006553b: mov       rcx, rax
14006553e: call      0x145bfa0e7
140065543: nop
140065544: lea       r8, [rip + 0x5d6a78d]
14006554b: lea       rcx, [rbp + 0x160]
140065552: mov       rdx, rdi
140065555: call      0x144e1fc30
14006555a: nop
14006555b: call      0x140002200
140065560: mov       ecx, 0x188
140065565: mov       edx, 8
14006556a: call      0x1400021c0
14006556f: test      rax, rax
140065572: je        0x140065ee9
140065578: mov       dword ptr [rax], 0
14006557e: mov       byte ptr [rax + 4], 0
140065582: mov       qword ptr [rax + 0x100], 0xffffffffffffffff
14006558d: lea       r8, [rip + 0x5d6aa8c]
140065594: lea       rcx, [rbp + 0xf0]
14006559b: mov       rdx, rax
14006559e: call      0x144e1fc30
1400655a3: nop
1400655a4: call      0x140002200
1400655a9: mov       ecx, 0x50
1400655ae: mov       edx, 8
1400655b3: call      0x1400021c0
1400655b8: test      rax, rax
1400655bb: je        0x140065efb
1400655c1: mov       qword ptr [rax], 0
1400655c8: mov       dword ptr [rax + 0x48], 0
1400655cf: mov       byte ptr [rax + 0x4c], 0
1400655d3: lea       r8, [rip + 0x5d6ace6]
1400655da: lea       rcx, [rbp + 0x80]
1400655e1: mov       rdx, rax
1400655e4: call      0x144e1fc30
1400655e9: nop
1400655ea: mov       qword ptr [rbp + 0x570], 0xffffffffffffffff
1400655f5: mov       dword ptr [rbp + 0x6d0], 0
1400655ff: mov       byte ptr [rbp + 0x6d4], 0
140065606: call      0x140002200
14006560b: mov       ecx, 0x258
140065610: mov       edx, 8
140065615: call      0x1400021c0
14006561a: test      rax, rax
14006561d: je        0x140065f0d
140065623: mov       rdi, rax
140065626: lea       rdx, [rbp + 0x480]
14006562d: mov       r8d, 0x258
140065633: mov       rcx, rax
140065636: call      0x145bfa0e7
14006563b: nop
14006563c: lea       r8, [rip + 0x5d6a7e5]
140065643: lea       rcx, [rbp + 0x10]
140065647: mov       rdx, rdi
14006564a: call      0x144e1fc30
14006564f: nop
140065650: mov       qword ptr [rbp + 0x4c0], 0xffffffffffffffff
14006565b: mov       dword ptr [rbp + 0x5c0], 0
140065665: mov       byte ptr [rbp + 0x5c4], 0
14006566c: call      0x140002200
140065671: mov       ecx, 0x148
140065676: mov       edx, 8
14006567b: call      0x1400021c0
140065680: test      rax, rax
140065683: je        0x140065f1f
140065689: mov       rdi, rax
14006568c: lea       rdx, [rbp + 0x480]
140065693: mov       r8d, 0x148
140065699: mov       rcx, rax
14006569c: call      0x145bfa0e7
1400656a1: nop
1400656a2: lea       r8, [rip + 0x5d6a827]
1400656a9: lea       rcx, [rbp - 0x60]
1400656ad: mov       rdx, rdi
1400656b0: call      0x144e1fc30
1400656b5: nop
1400656b6: mov       qword ptr [rbp + 0x480], 0xffffffffffffffff
1400656c1: mov       dword ptr [rbp + 0x838], 0
1400656cb: mov       byte ptr [rbp + 0x83c], 0
1400656d2: call      0x140002200
1400656d7: mov       ecx, 0x3c0
1400656dc: mov       edx, 8
1400656e1: call      0x1400021c0
1400656e6: test      rax, rax
1400656e9: je        0x140065f31
1400656ef: mov       rdi, rax
1400656f2: lea       rdx, [rbp + 0x480]
1400656f9: mov       r8d, 0x3c0
1400656ff: mov       rcx, rax
140065702: call      0x145bfa0e7
140065707: nop
140065708: lea       r8, [rip + 0x5d6ab09]
14006570f: lea       rcx, [rbp + 0x9d8]
140065716: mov       rdx, rdi
140065719: call      0x144e1fc30
14006571e: nop
14006571f: mov       qword ptr [rbp + 0x588], 0xffffffffffffffff
14006572a: mov       dword ptr [rbp + 0x480], 0
140065734: mov       byte ptr [rbp + 0x484], 0
14006573b: call      0x140002200
140065740: mov       ecx, 0x140
140065745: mov       edx, 8
14006574a: call      0x1400021c0
14006574f: test      rax, rax
140065752: je        0x140065f43
140065758: mov       rdi, rax
14006575b: lea       rdx, [rbp + 0x480]
140065762: mov       r8d, 0x140
140065768: mov       rcx, rax
14006576b: call      0x145bfa0e7
140065770: nop
140065771: lea       r8, [rip + 0x5d6a950]
140065778: lea       rcx, [rbp + 0x2b0]
14006577f: mov       rdx, rdi
140065782: call      0x144e1fc30
140065787: nop
140065788: mov       qword ptr [rbp + 0x588], 0xffffffffffffffff
140065793: mov       dword ptr [rbp + 0x480], 0
14006579d: mov       byte ptr [rbp + 0x484], 0
1400657a4: call      0x140002200
1400657a9: mov       ecx, 0x138
1400657ae: mov       edx, 8
1400657b3: call      0x1400021c0
1400657b8: test      rax, rax
1400657bb: je        0x140065f55
1400657c1: mov       rdi, rax
1400657c4: lea       rdx, [rbp + 0x480]
1400657cb: mov       r8d, 0x138
1400657d1: mov       rcx, rax
1400657d4: call      0x145bfa0e7
1400657d9: nop
1400657da: lea       r8, [rip + 0x5d6a797]
1400657e1: lea       rcx, [rbp + 0x480]
1400657e8: mov       rdx, rdi
1400657eb: call      0x144e1fc30
1400657f0: nop
1400657f1: movups    xmm0, xmmword ptr [rbp + 0x2a0]
1400657f8: mov       rax, qword ptr [rbp + 0xa48]
1400657ff: movups    xmmword ptr [rax + 0x60], xmm0
140065803: movups    xmm0, xmmword ptr [rbp + 0x290]
14006580a: movups    xmmword ptr [rax + 0x50], xmm0
14006580e: movups    xmm0, xmmword ptr [rbp + 0x280]
140065815: movups    xmmword ptr [rax + 0x40], xmm0
140065819: movups    xmm0, xmmword ptr [rbp + 0x240]
140065820: movups    xmm1, xmmword ptr [rbp + 0x250]
140065827: movups    xmm2, xmmword ptr [rbp + 0x260]
14006582e: movups    xmm3, xmmword ptr [rbp + 0x270]
140065835: movups    xmmword ptr [rax + 0x30], xmm3
140065839: movups    xmmword ptr [rax + 0x20], xmm2
14006583d: movups    xmmword ptr [rax + 0x10], xmm1
140065841: movups    xmmword ptr [rax], xmm0
140065844: movups    xmm0, xmmword ptr [rbp + 0x1d0]
14006584b: movups    xmm1, xmmword ptr [rbp + 0x1e0]
140065852: movups    xmm2, xmmword ptr [rbp + 0x1f0]
140065859: movups    xmm3, xmmword ptr [rbp + 0x200]
140065860: movups    xmmword ptr [rax + 0x70], xmm0
140065864: movups    xmmword ptr [rax + 0x80], xmm1
14006586b: movups    xmmword ptr [rax + 0x90], xmm2
140065872: movups    xmmword ptr [rax + 0xa0], xmm3
140065879: movups    xmm0, xmmword ptr [rbp + 0x210]
140065880: movups    xmmword ptr [rax + 0xb0], xmm0
140065887: movups    xmm0, xmmword ptr [rbp + 0x220]
14006588e: movups    xmmword ptr [rax + 0xc0], xmm0
140065895: movups    xmm0, xmmword ptr [rbp + 0x230]
14006589c: movups    xmmword ptr [rax + 0xd0], xmm0
1400658a3: movups    xmm0, xmmword ptr [rbp + 0x1c0]
1400658aa: movups    xmmword ptr [rax + 0x140], xmm0
1400658b1: movups    xmm0, xmmword ptr [rbp + 0x1b0]
1400658b8: movups    xmmword ptr [rax + 0x130], xmm0
1400658bf: movups    xmm0, xmmword ptr [rbp + 0x1a0]
1400658c6: movups    xmmword ptr [rax + 0x120], xmm0
1400658cd: movups    xmm0, xmmword ptr [rbp + 0x160]
1400658d4: movups    xmm1, xmmword ptr [rbp + 0x170]
1400658db: movups    xmm2, xmmword ptr [rbp + 0x180]
1400658e2: movups    xmm3, xmmword ptr [rbp + 0x190]
1400658e9: movups    xmmword ptr [rax + 0x110], xmm3
1400658f0: movups    xmmword ptr [rax + 0x100], xmm2
1400658f7: movups    xmmword ptr [rax + 0xf0], xmm1
1400658fe: movups    xmmword ptr [rax + 0xe0], xmm0
140065905: movups    xmm0, xmmword ptr [rbp + 0xf0]
14006590c: movups    xmm1, xmmword ptr [rbp + 0x100]
140065913: movups    xmm2, xmmword ptr [rbp + 0x110]
14006591a: movups    xmm3, xmmword ptr [rbp + 0x120]
140065921: movups    xmmword ptr [rax + 0x150], xmm0
140065928: movups    xmmword ptr [rax + 0x160], xmm1
14006592f: movups    xmmword ptr [rax + 0x170], xmm2
140065936: movups    xmmword ptr [rax + 0x180], xmm3
14006593d: movups    xmm0, xmmword ptr [rbp + 0x130]
140065944: movups    xmmword ptr [rax + 0x190], xmm0
14006594b: movups    xmm0, xmmword ptr [rbp + 0x140]
140065952: movups    xmmword ptr [rax + 0x1a0], xmm0
140065959: movups    xmm0, xmmword ptr [rbp + 0x150]
140065960: movups    xmmword ptr [rax + 0x1b0], xmm0
140065967: movups    xmm0, xmmword ptr [rbp + 0x80]
14006596e: movups    xmm1, xmmword ptr [rbp + 0x90]
140065975: movups    xmm2, xmmword ptr [rbp + 0xa0]
14006597c: movups    xmm3, xmmword ptr [rbp + 0xb0]
140065983: movups    xmmword ptr [rax + 0x1c0], xmm0
14006598a: movups    xmmword ptr [rax + 0x1d0], xmm1
140065991: movups    xmmword ptr [rax + 0x1e0], xmm2
140065998: movups    xmmword ptr [rax + 0x1f0], xmm3
14006599f: movups    xmm0, xmmword ptr [rbp + 0xc0]
1400659a6: movups    xmmword ptr [rax + 0x200], xmm0
1400659ad: movups    xmm0, xmmword ptr [rbp + 0xe0]
1400659b4: movups    xmmword ptr [rax + 0x220], xmm0
1400659bb: movups    xmm0, xmmword ptr [rbp + 0xd0]
1400659c2: movups    xmmword ptr [rax + 0x210], xmm0
1400659c9: movups    xmm0, xmmword ptr [rbp + 0x70]
1400659cd: movups    xmmword ptr [rax + 0x290], xmm0
1400659d4: movups    xmm0, xmmword ptr [rbp + 0x60]
1400659d8: movups    xmmword ptr [rax + 0x280], xmm0
1400659df: movups    xmm0, xmmword ptr [rbp + 0x50]
1400659e3: movups    xmmword ptr [rax + 0x270], xmm0
1400659ea: movups    xmm0, xmmword ptr [rbp + 0x10]
1400659ee: movups    xmm1, xmmword ptr [rbp + 0x20]
1400659f2: movups    xmm2, xmmword ptr [rbp + 0x30]
1400659f6: movups    xmm3, xmmword ptr [rbp + 0x40]
1400659fa: movups    xmmword ptr [rax + 0x260], xmm3
140065a01: movups    xmmword ptr [rax + 0x250], xmm2
140065a08: movups    xmmword ptr [rax + 0x240], xmm1
140065a0f: movups    xmmword ptr [rax + 0x230], xmm0
140065a16: movups    xmm0, xmmword ptr [rbp - 0x60]
140065a1a: movups    xmm1, xmmword ptr [rbp - 0x50]
140065a1e: movups    xmm2, xmmword ptr [rbp - 0x40]
140065a22: movups    xmm3, xmmword ptr [rbp - 0x30]
140065a26: movups    xmmword ptr [rax + 0x2a0], xmm0
140065a2d: movups    xmmword ptr [rax + 0x2b0], xmm1
140065a34: movups    xmmword ptr [rax + 0x2c0], xmm2
140065a3b: movups    xmmword ptr [rax + 0x2d0], xmm3
140065a42: movups    xmm0, xmmword ptr [rbp - 0x20]
140065a46: movups    xmmword ptr [rax + 0x2e0], xmm0
140065a4d: movups    xmm0, xmmword ptr [rbp - 0x10]
140065a51: movups    xmmword ptr [rax + 0x2f0], xmm0
140065a58: movups    xmm0, xmmword ptr [rbp]
140065a5c: movups    xmmword ptr [rax + 0x300], xmm0
140065a63: movups    xmm0, xmmword ptr [rbp + 0x9d8]
140065a6a: movups    xmm1, xmmword ptr [rbp + 0x9e8]
140065a71: movups    xmm2, xmmword ptr [rbp + 0x9f8]
140065a78: movups    xmm3, xmmword ptr [rbp + 0xa08]
140065a7f: movups    xmmword ptr [rax + 0x310], xmm0
140065a86: movups    xmmword ptr [rax + 0x320], xmm1
140065a8d: movups    xmmword ptr [rax + 0x330], xmm2
140065a94: movups    xmmword ptr [rax + 0x340], xmm3
140065a9b: movups    xmm0, xmmword ptr [rbp + 0xa18]
140065aa2: movups    xmmword ptr [rax + 0x350], xmm0
140065aa9: movups    xmm0, xmmword ptr [rbp + 0xa28]
140065ab0: movups    xmmword ptr [rax + 0x360], xmm0
140065ab7: movups    xmm0, xmmword ptr [rbp + 0xa38]
140065abe: movups    xmmword ptr [rax + 0x370], xmm0
140065ac5: movups    xmm0, xmmword ptr [rbp + 0x2b0]
140065acc: movups    xmm1, xmmword ptr [rbp + 0x2c0]
140065ad3: movups    xmm2, xmmword ptr [rbp + 0x2d0]
140065ada: movups    xmm3, xmmword ptr [rbp + 0x2e0]
140065ae1: movups    xmmword ptr [rax + 0x380], xmm0
140065ae8: movups    xmmword ptr [rax + 0x390], xmm1
140065aef: movups    xmmword ptr [rax + 0x3a0], xmm2
140065af6: movups    xmmword ptr [rax + 0x3b0], xmm3
140065afd: movups    xmm0, xmmword ptr [rbp + 0x2f0]
140065b04: movups    xmmword ptr [rax + 0x3c0], xmm0
140065b0b: movups    xmm0, xmmword ptr [rbp + 0x300]
140065b12: movups    xmmword ptr [rax + 0x3d0], xmm0
140065b19: movups    xmm0, xmmword ptr [rbp + 0x310]
140065b20: movups    xmmword ptr [rax + 0x3e0], xmm0
140065b27: movups    xmm0, xmmword ptr [rbp + 0x480]
140065b2e: movups    xmm1, xmmword ptr [rbp + 0x490]
140065b35: movups    xmm2, xmmword ptr [rbp + 0x4a0]
140065b3c: movups    xmm3, xmmword ptr [rbp + 0x4b0]
140065b43: movups    xmmword ptr [rax + 0x3f0], xmm0
140065b4a: movups    xmmword ptr [rax + 0x400], xmm1
140065b51: movups    xmmword ptr [rax + 0x410], xmm2
140065b58: movups    xmmword ptr [rax + 0x420], xmm3
140065b5f: movups    xmm0, xmmword ptr [rbp + 0x4c0]
140065b66: movups    xmmword ptr [rax + 0x430], xmm0
140065b6d: movups    xmm0, xmmword ptr [rbp + 0x4e0]
140065b74: movups    xmmword ptr [rax + 0x450], xmm0
140065b7b: movups    xmm0, xmmword ptr [rbp + 0x4d0]
140065b82: movups    xmmword ptr [rax + 0x440], xmm0
140065b89: mov       qword ptr [rbp + 0x488], 0xa
140065b94: mov       qword ptr [rbp + 0x490], rax
140065b9b: mov       qword ptr [rbp + 0x498], 0xa
140065ba6: mov       qword ptr [rbp + 0x4a0], 0
140065bb1: mov       qword ptr [rbp + 0x4a8], 8
140065bbc: xorps     xmm0, xmm0
140065bbf: movups    xmmword ptr [rbp + 0x4b0], xmm0
140065bc6: mov       qword ptr [rbp + 0x480], 0xffffffffffffffff
140065bd1: lea       rcx, [rbp + 0x4b8]
140065bd8: call      0x144e9bf10
140065bdd: nop
140065bde: movups    xmm0, xmmword ptr [rbp + 0x4e0]
140065be5: movaps    xmmword ptr [rbp + 0x310], xmm0
140065bec: movups    xmm0, xmmword ptr [rbp + 0x4d0]
140065bf3: movaps    xmmword ptr [rbp + 0x300], xmm0
140065bfa: movups    xmm0, xmmword ptr [rbp + 0x4c0]
140065c01: movaps    xmmword ptr [rbp + 0x2f0], xmm0
140065c08: movups    xmm0, xmmword ptr [rbp + 0x480]
140065c0f: movups    xmm1, xmmword ptr [rbp + 0x490]
140065c16: movups    xmm2, xmmword ptr [rbp + 0x4a0]
140065c1d: movups    xmm3, xmmword ptr [rbp + 0x4b0]
140065c24: movaps    xmmword ptr [rbp + 0x2e0], xmm3
140065c2b: movaps    xmmword ptr [rbp + 0x2d0], xmm2
140065c32: movaps    xmmword ptr [rbp + 0x2c0], xmm1
140065c39: movaps    xmmword ptr [rbp + 0x2b0], xmm0
140065c40: mov       rcx, qword ptr [rip + 0x801da59]
140065c47: lea       r8, [rip + 0x5d7759a]
140065c4e: lea       rdx, [rbp + 0xa55]
140065c55: call      0x1400f7360
140065c5a: nop
140065c5b: mov       r8, rdx
140065c5e: lea       rcx, [rbp + 0x2b0]
140065c65: mov       rdx, rax
140065c68: call      0x14013d450
140065c6d: nop
140065c6e: movaps    xmm0, xmmword ptr [rbp + 0x310]
140065c75: movaps    xmmword ptr [rbp + 0x4e0], xmm0
140065c7c: movaps    xmm0, xmmword ptr [rbp + 0x300]
140065c83: movaps    xmmword ptr [rbp + 0x4d0], xmm0
140065c8a: movaps    xmm0, xmmword ptr [rbp + 0x2f0]
140065c91: movaps    xmmword ptr [rbp + 0x4c0], xmm0
140065c98: movaps    xmm0, xmmword ptr [rbp + 0x2b0]
140065c9f: movaps    xmm1, xmmword ptr [rbp + 0x2c0]
140065ca6: movaps    xmm2, xmmword ptr [rbp + 0x2d0]
140065cad: movaps    xmm3, xmmword ptr [rbp + 0x2e0]
140065cb4: movaps    xmmword ptr [rbp + 0x4b0], xmm3
140065cbb: movaps    xmmword ptr [rbp + 0x4a0], xmm2
140065cc2: movaps    xmmword ptr [rbp + 0x490], xmm1
140065cc9: movaps    xmmword ptr [rbp + 0x480], xmm0
140065cd0: lea       rdx, [rbp + 0x480]
140065cd7: mov       rcx, rsi
140065cda: call      0x1400b4130
140065cdf: nop
140065ce0: add       rsp, 0xae0
140065ce7: pop       rbx
140065ce8: pop       rdi
140065ce9: pop       rsi
140065cea: pop       r12
140065cec: pop       r14
140065cee: pop       r15
140065cf0: pop       rbp
140065cf1: ret
140065cf2: mov       rcx, qword ptr [r9 - 8]
140065cf6: mov       qword ptr [rbp + 0x4e8], rcx
140065cfd: movups    xmm0, xmmword ptr [r9 - 0x18]
140065d02: movups    xmmword ptr [rbp + 0x4d8], xmm0
140065d09: movups    xmm0, xmmword ptr [r9 - 0x28]
140065d0e: movups    xmmword ptr [rbp + 0x4c8], xmm0
140065d15: movdqu    xmm0, xmmword ptr [r9 - 0x68]
140065d1b: movdqu    xmm1, xmmword ptr [r9 - 0x58]
140065d21: movdqu    xmm2, xmmword ptr [r9 - 0x48]
140065d27: movdqu    xmm3, xmmword ptr [r9 - 0x38]
140065d2d: movdqu    xmmword ptr [rbp + 0x4b8], xmm3
140065d35: movdqu    xmmword ptr [rbp + 0x4a8], xmm2
140065d3d: movdqu    xmmword ptr [rbp + 0x498], xmm1
140065d45: movdqu    xmmword ptr [rbp + 0x488], xmm0
140065d4d: mov       qword ptr [rbp + 0x480], rax
140065d54: lea       rcx, [rbp + 0x480]
140065d5b: lea       rdx, [rbp + 0x9d8]
140065d62: call      0x144e08f20
140065d67: nop
140065d68: mov       r14, rax
140065d6b: mov       rdx, qword ptr [rbp + 0x9d8]
140065d72: test      rdx, rdx
140065d75: jne       0x140064c2d
140065d7b: jmp       0x140064c43
140065d80: mov       rcx, qword ptr [r9 - 8]
140065d84: mov       qword ptr [rbp + 0x4e8], rcx
140065d8b: movups    xmm0, xmmword ptr [r9 - 0x18]
140065d90: movups    xmmword ptr [rbp + 0x4d8], xmm0
140065d97: movups    xmm0, xmmword ptr [r9 - 0x28]
140065d9c: movups    xmmword ptr [rbp + 0x4c8], xmm0
140065da3: movdqu    xmm0, xmmword ptr [r9 - 0x68]
140065da9: movdqu    xmm1, xmmword ptr [r9 - 0x58]
140065daf: movdqu    xmm2, xmmword ptr [r9 - 0x48]
140065db5: movdqu    xmm3, xmmword ptr [r9 - 0x38]
140065dbb: movdqu    xmmword ptr [rbp + 0x4b8], xmm3
140065dc3: movdqu    xmmword ptr [rbp + 0x4a8], xmm2
140065dcb: movdqu    xmmword ptr [rbp + 0x498], xmm1
140065dd3: movdqu    xmmword ptr [rbp + 0x488], xmm0
140065ddb: mov       qword ptr [rbp + 0x480], rax
140065de2: lea       rcx, [rbp + 0x480]
140065de9: lea       rdx, [rbp + 0x9d8]
140065df0: call      0x144e08f20
140065df5: nop
140065df6: mov       r14, rax
140065df9: mov       rdx, qword ptr [rbp + 0x9d8]
140065e00: test      rdx, rdx
140065e03: jne       0x140064fdd
140065e09: jmp       0x140064ff3
140065e0e: mov       rcx, qword ptr [r9 - 8]
140065e12: mov       qword ptr [rbp + 0x4e8], rcx
140065e19: movups    xmm0, xmmword ptr [r9 - 0x18]
140065e1e: movups    xmmword ptr [rbp + 0x4d8], xmm0
140065e25: movups    xmm0, xmmword ptr [r9 - 0x28]
140065e2a: movups    xmmword ptr [rbp + 0x4c8], xmm0
140065e31: movdqu    xmm0, xmmword ptr [r9 - 0x68]
140065e37: movdqu    xmm1, xmmword ptr [r9 - 0x58]
140065e3d: movdqu    xmm2, xmmword ptr [r9 - 0x48]
140065e43: movdqu    xmm3, xmmword ptr [r9 - 0x38]
140065e49: movdqu    xmmword ptr [rbp + 0x4b8], xmm3
140065e51: movdqu    xmmword ptr [rbp + 0x4a8], xmm2
140065e59: movdqu    xmmword ptr [rbp + 0x498], xmm1
140065e61: movdqu    xmmword ptr [rbp + 0x488], xmm0
140065e69: mov       qword ptr [rbp + 0x480], rax
140065e70: lea       rcx, [rbp + 0x480]
140065e77: lea       rdx, [rbp + 0x2b0]
140065e7e: call      0x144e08f20
140065e83: nop
140065e84: mov       r14, rax
140065e87: mov       rdx, qword ptr [rbp + 0x2b0]
140065e8e: test      rdx, rdx
140065e91: jne       0x14006534a
140065e97: jmp       0x140065360
140065e9c: mov       ecx, 8
140065ea1: mov       edx, 0x460
140065ea6: call      0x145d992a1
140065eab: ud2
140065ead: mov       ecx, 8
140065eb2: mov       edx, 0x1b0
140065eb7: call      0x145d992a1
140065ebc: nop
140065ebd: jmp       0x140065f65
140065ec2: mov       ecx, 8
140065ec7: mov       edx, 0x558
140065ecc: call      0x145d992a1
140065ed1: nop
140065ed2: jmp       0x140065f65
140065ed7: mov       ecx, 8
140065edc: mov       edx, 0x278
140065ee1: call      0x145d992a1
140065ee6: nop
140065ee7: jmp       0x140065f65
140065ee9: mov       ecx, 8
140065eee: mov       edx, 0x188
140065ef3: call      0x145d992a1
140065ef8: nop
140065ef9: jmp       0x140065f65
140065efb: mov       ecx, 8
140065f00: mov       edx, 0x50
140065f05: call      0x145d992a1
140065f0a: nop
140065f0b: jmp       0x140065f65
140065f0d: mov       ecx, 8
140065f12: mov       edx, 0x258
140065f17: call      0x145d992a1
140065f1c: nop
140065f1d: jmp       0x140065f65
140065f1f: mov       ecx, 8
140065f24: mov       edx, 0x148
140065f29: call      0x145d992a1
140065f2e: nop
140065f2f: jmp       0x140065f65
140065f31: mov       ecx, 8
140065f36: mov       edx, 0x3c0
140065f3b: call      0x145d992a1
140065f40: nop
140065f41: jmp       0x140065f65
140065f43: mov       ecx, 8
140065f48: mov       edx, 0x140
140065f4d: call      0x145d992a1
140065f52: nop
140065f53: jmp       0x140065f65
140065f55: mov       ecx, 8
140065f5a: mov       edx, 0x138
140065f5f: call      0x145d992a1
140065f64: nop
140065f65: ud2
