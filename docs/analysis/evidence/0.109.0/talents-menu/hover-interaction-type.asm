1402a7cf0: push      rbp
1402a7cf1: push      r14
1402a7cf3: push      rsi
1402a7cf4: push      rdi
1402a7cf5: push      rbx
1402a7cf6: sub       rsp, 0xe0
1402a7cfd: lea       rbp, [rsp + 0x80]
1402a7d05: movaps    xmmword ptr [rbp + 0x50], xmm6
1402a7d09: mov       qword ptr [rbp + 0x48], 0xfffffffffffffffe
1402a7d11: mov       rax, rcx
1402a7d14: add       rcx, 0x40
1402a7d18: lea       rdx, [rax + 0x5a8]
1402a7d1f: mov       qword ptr [rbp + 0x30], rcx
1402a7d23: mov       qword ptr [rbp + 0x38], rdx
1402a7d27: mov       qword ptr [rbp + 0x18], 0
1402a7d2f: mov       qword ptr [rbp + 0x20], 8
1402a7d37: mov       qword ptr [rbp + 0x28], 0
1402a7d3f: cmp       qword ptr [rax + 0x70], 0
1402a7d44: je        0x1402a7de9
1402a7d4a: movabs    r9, 0xaa5f7a713a1e5058
1402a7d54: mov       r8, qword ptr [rax + 0x58]
1402a7d58: mov       r10, qword ptr [rax + 0x60]
1402a7d5c: xor       r11d, r11d
1402a7d5f: movdqa    xmm0, xmmword ptr [rip + 0x5b3d069]
1402a7d67: pcmpeqd   xmm1, xmm1
1402a7d6b: movdqa    xmm2, xmmword ptr [rip + 0x5b2ad6d]
1402a7d73: and       r9, r10
1402a7d76: movdqu    xmm3, xmmword ptr [r8 + r9]
1402a7d7c: movdqa    xmm4, xmm3
1402a7d80: pcmpeqb   xmm4, xmm0
1402a7d84: pmovmskb  esi, xmm4
1402a7d88: test      esi, esi
1402a7d8a: je        0x1402a7dd0
1402a7d8c: tzcnt     edi, esi
1402a7d90: add       rdi, r9
1402a7d93: and       rdi, r10
1402a7d96: neg       rdi
1402a7d99: lea       rdi, [rdi + rdi*2]
1402a7d9d: movdqu    xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
1402a7da4: pcmpeqb   xmm4, xmm2
1402a7da8: pmovmskb  ebx, xmm4
1402a7dac: cmp       ebx, 0xffff
1402a7db2: je        0x1402a7e9d
1402a7db8: lea       edi, [rsi - 1]
1402a7dbb: and       di, si
1402a7dbe: mov       esi, edi
1402a7dc0: jne       0x1402a7d8c
1402a7dc2: nop       word ptr cs:[rax + rax]
1402a7dd0: pcmpeqb   xmm3, xmm1
1402a7dd4: pmovmskb  esi, xmm3
1402a7dd8: test      esi, esi
1402a7dda: jne       0x1402a7de9
1402a7ddc: add       r9, r11
1402a7ddf: add       r9, 0x10
1402a7de3: add       r11, 0x10
1402a7de7: jmp       0x1402a7d73
1402a7de9: movzx     r8d, byte ptr [rax + 0xa0]
1402a7df1: mov       r8, qword ptr [rax + 0xc0]
1402a7df8: mov       r9, qword ptr [rax + 0xc8]
1402a7dff: movabs    r10, 0xaa5f7a713a1e5058
1402a7e09: xor       r11d, r11d
1402a7e0c: movdqa    xmm0, xmmword ptr [rip + 0x5b3cfbc]
1402a7e14: pcmpeqd   xmm1, xmm1
1402a7e18: movdqa    xmm2, xmmword ptr [rip + 0x5b2acc0]
1402a7e20: and       r10, r9
1402a7e23: movdqu    xmm3, xmmword ptr [r8 + r10]
1402a7e29: movdqa    xmm4, xmm3
1402a7e2d: pcmpeqb   xmm4, xmm0
1402a7e31: pmovmskb  ebx, xmm4
1402a7e35: test      ebx, ebx
1402a7e37: je        0x1402a7e80
1402a7e39: tzcnt     edi, ebx
1402a7e3d: add       rdi, r10
1402a7e40: and       rdi, r9
1402a7e43: mov       r14, rdi
1402a7e46: shl       r14, 7
1402a7e4a: mov       rsi, r8
1402a7e4d: sub       rsi, r14
1402a7e50: movdqu    xmm4, xmmword ptr [rsi - 0x80]
1402a7e55: pcmpeqb   xmm4, xmm2
1402a7e59: pmovmskb  r14d, xmm4
1402a7e5e: cmp       r14d, 0xffff
1402a7e65: je        0x1402a7ebb
1402a7e67: lea       esi, [rbx - 1]
1402a7e6a: and       si, bx
1402a7e6d: mov       ebx, esi
1402a7e6f: jne       0x1402a7e39
1402a7e71: nop       word ptr cs:[rax + rax]
1402a7e80: pcmpeqb   xmm3, xmm1
1402a7e84: pmovmskb  esi, xmm3
1402a7e88: test      esi, esi
1402a7e8a: jne       0x1402a7f31
1402a7e90: add       r10, r11
1402a7e93: add       r10, 0x10
1402a7e97: add       r11, 0x10
1402a7e9b: jmp       0x1402a7e20
1402a7e9d: lea       rax, [r8 + rdi*8]
1402a7ea1: mov       rsi, qword ptr [rax - 8]
1402a7ea5: mov       edx, 8
1402a7eaa: xor       r8d, r8d
1402a7ead: mov       r9, rsi
1402a7eb0: call      0x144e9eff0
1402a7eb5: nop
1402a7eb6: jmp       0x1402a80b1
1402a7ebb: lea       r10, [rdi - 0x10]
1402a7ebf: and       r10, r9
1402a7ec2: movdqu    xmm0, xmmword ptr [r8 + r10]
1402a7ec8: pcmpeqd   xmm1, xmm1
1402a7ecc: pcmpeqb   xmm0, xmm1
1402a7ed0: pmovmskb  r9d, xmm0
1402a7ed5: movdqu    xmm0, xmmword ptr [r8 + rdi]
1402a7edb: pcmpeqb   xmm0, xmm1
1402a7edf: pmovmskb  r11d, xmm0
1402a7ee4: mov       bx, 0x1f
1402a7ee8: bsr       bx, r9w
1402a7eed: xor       ebx, 0xf
1402a7ef0: or        r11d, 0x10000
1402a7ef7: tzcnt     r11d, r11d
1402a7efc: add       r11d, ebx
1402a7eff: mov       r9b, 0x80
1402a7f02: cmp       r11w, 0xf
1402a7f07: ja        0x1402a7f13
1402a7f09: inc       qword ptr [rax + 0xd0]
1402a7f10: mov       r9b, 0xff
1402a7f13: mov       byte ptr [r8 + rdi], r9b
1402a7f17: mov       byte ptr [r8 + r10 + 0x10], r9b
1402a7f1c: dec       qword ptr [rax + 0xd8]
1402a7f23: mov       r8, qword ptr [rsi - 0x70]
1402a7f27: cmp       r8, 2
1402a7f2b: jne       0x1402a80e2
1402a7f31: mov       rdi, rax
1402a7f34: mov       rsi, qword ptr [rdx]
1402a7f37: lea       rax, [rsi + 1]
1402a7f3b: mov       qword ptr [rdx], rax
1402a7f3e: mov       word ptr [rbp - 8], 0x100
1402a7f44: mov       qword ptr [rbp - 0x58], 1
1402a7f4c: movdqu    xmm0, xmmword ptr [rip + 0x5b2568c]
1402a7f54: movdqu    xmmword ptr [rbp - 0x50], xmm0
1402a7f59: mov       qword ptr [rbp - 0x30], 1
1402a7f61: mov       qword ptr [rbp - 0x28], 1
1402a7f69: mov       qword ptr [rbp - 0x10], 0
1402a7f71: mov       byte ptr [rbp - 6], 1
1402a7f75: mov       qword ptr [rbp - 0x40], 2
1402a7f7d: lea       rax, [rip - 0x1eeba4]
1402a7f84: mov       qword ptr [rbp - 0x38], rax
1402a7f88: mov       byte ptr [rbp - 0x20], 2
1402a7f8c: lea       r8, [rbp - 0x58]
1402a7f90: mov       rdx, rsi
1402a7f93: call      0x14000f330
1402a7f98: nop
1402a7f99: mov       rcx, rdi
1402a7f9c: add       rcx, 0x58
1402a7fa0: lea       rdx, [rip + 0x5b4a9e9]
1402a7fa7: mov       r8, rsi
1402a7faa: call      0x14000f180
1402a7faf: nop
1402a7fb0: mov       rdi, qword ptr [rbp + 0x28]
1402a7fb4: cmp       rdi, qword ptr [rbp + 0x18]
1402a7fb8: jne       0x1402a7fc4
1402a7fba: lea       rcx, [rbp + 0x18]
1402a7fbe: call      0x145bfab70
1402a7fc3: nop
1402a7fc4: mov       rax, qword ptr [rbp + 0x20]
1402a7fc8: mov       qword ptr [rax + rdi*8], rsi
1402a7fcc: inc       rdi
1402a7fcf: mov       qword ptr [rbp + 0x28], rdi
1402a7fd3: mov       qword ptr [rbp - 0x58], 0
1402a7fdb: mov       qword ptr [rbp - 0x50], 8
1402a7fe3: mov       qword ptr [rbp - 0x48], 0
1402a7feb: movdqu    xmm0, xmmword ptr [rip + 0x5b4b45d]
1402a7ff3: movdqu    xmmword ptr [rbp - 0x40], xmm0
1402a7ff8: movdqu    xmm1, xmmword ptr [rip + 0x5b4b460]
1402a8000: movdqu    xmmword ptr [rbp - 0x30], xmm1
1402a8005: mov       qword ptr [rbp - 0x20], 0
1402a800d: mov       qword ptr [rbp - 0x18], 8
1402a8015: mov       qword ptr [rbp - 0x10], 0
1402a801d: movdqu    xmmword ptr [rbp - 8], xmm0
1402a8022: movdqu    xmmword ptr [rbp + 8], xmm1
1402a8027: mov       rcx, qword ptr [rbp + 0x30]
1402a802b: mov       byte ptr [rbp + 0x47], 1
1402a802f: lea       r8, [rbp - 0x58]
1402a8033: mov       rdx, rsi
1402a8036: call      0x144e44770
1402a803b: nop
1402a803c: mov       rax, qword ptr [rbp + 0x28]
1402a8040: test      rax, rax
1402a8043: je        0x1402a804c
1402a8045: dec       rax
1402a8048: mov       qword ptr [rbp + 0x28], rax
1402a804c: mov       rax, qword ptr [rbp + 0x30]
1402a8050: mov       rax, qword ptr [rax + 8]
1402a8054: imul      rcx, rsi, 0x130
1402a805b: add       rcx, rax
1402a805e: add       rcx, 0x58
1402a8062: mov       qword ptr [rbp - 0x60], rcx
1402a8066: call      0x14000b310
1402a806b: nop
1402a806c: movdqu    xmm0, xmmword ptr [rbp - 0x58]
1402a8071: movdqu    xmm1, xmmword ptr [rbp - 0x48]
1402a8076: movdqu    xmm2, xmmword ptr [rbp - 0x38]
1402a807b: movdqu    xmm3, xmmword ptr [rbp - 0x28]
1402a8080: movdqu    xmm4, xmmword ptr [rbp - 0x18]
1402a8085: movups    xmm5, xmmword ptr [rbp - 8]
1402a8089: movups    xmm6, xmmword ptr [rbp + 8]
1402a808d: mov       rax, qword ptr [rbp - 0x60]
1402a8091: movups    xmmword ptr [rax + 0x60], xmm6
1402a8095: movups    xmmword ptr [rax + 0x50], xmm5
1402a8099: movdqu    xmmword ptr [rax + 0x40], xmm4
1402a809e: movdqu    xmmword ptr [rax + 0x30], xmm3
1402a80a3: movdqu    xmmword ptr [rax + 0x20], xmm2
1402a80a8: movdqu    xmmword ptr [rax + 0x10], xmm1
1402a80ad: movdqu    xmmword ptr [rax], xmm0
1402a80b1: mov       rdx, qword ptr [rbp + 0x18]
1402a80b5: test      rdx, rdx
1402a80b8: je        0x1402a80cd
1402a80ba: mov       rcx, qword ptr [rbp + 0x20]
1402a80be: shl       rdx, 3
1402a80c2: mov       r8d, 8
1402a80c8: call      0x1400021d0
1402a80cd: mov       rax, rsi
1402a80d0: movaps    xmm6, xmmword ptr [rbp + 0x50]
1402a80d4: add       rsp, 0xe0
1402a80db: pop       rbx
1402a80dc: pop       rdi
1402a80dd: pop       rsi
1402a80de: pop       r14
1402a80e0: pop       rbp
1402a80e1: ret
1402a80e2: mov       rax, qword ptr [rsi - 8]
1402a80e6: mov       qword ptr [rbp + 0x10], rax
1402a80ea: movups    xmm0, xmmword ptr [rsi - 0x18]
1402a80ee: movups    xmmword ptr [rbp], xmm0
1402a80f2: movups    xmm0, xmmword ptr [rsi - 0x28]
1402a80f6: movups    xmmword ptr [rbp - 0x10], xmm0
1402a80fa: movdqu    xmm0, xmmword ptr [rsi - 0x68]
1402a80ff: movdqu    xmm1, xmmword ptr [rsi - 0x58]
1402a8104: movdqu    xmm2, xmmword ptr [rsi - 0x48]
1402a8109: movdqu    xmm3, xmmword ptr [rsi - 0x38]
1402a810e: movdqu    xmmword ptr [rbp - 0x20], xmm3
1402a8113: movdqu    xmmword ptr [rbp - 0x30], xmm2
1402a8118: movdqu    xmmword ptr [rbp - 0x40], xmm1
1402a811d: movdqu    xmmword ptr [rbp - 0x50], xmm0
1402a8122: mov       qword ptr [rbp - 0x58], r8
1402a8126: lea       rcx, [rbp - 0x58]
1402a812a: lea       rdx, [rbp + 0x18]
1402a812e: call      0x144e08f20
1402a8133: nop
1402a8134: mov       rsi, rax
1402a8137: mov       rdx, qword ptr [rbp + 0x18]
1402a813b: test      rdx, rdx
1402a813e: jne       0x1402a80ba
1402a8144: jmp       0x1402a80cd
