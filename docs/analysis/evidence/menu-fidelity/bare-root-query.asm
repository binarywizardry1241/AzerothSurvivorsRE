140385dc0: push      rbp
140385dc1: push      r15
140385dc3: push      r14
140385dc5: push      rsi
140385dc6: push      rdi
140385dc7: push      rbx
140385dc8: sub       rsp, 0x2a8
140385dcf: lea       rbp, [rsp + 0x80]
140385dd7: mov       qword ptr [rbp + 0x220], 0xfffffffffffffffe
140385de2: mov       rdi, rdx
140385de5: mov       rsi, rcx
140385de8: mov       rcx, rdx
140385deb: call      0x1402c7490
140385df0: mov       rbx, rax
140385df3: lea       rcx, [rbp + 0x50]
140385df7: call      0x144e89c90
140385dfc: mov       byte ptr [rbp + 0x21f], 1
140385e03: lea       rcx, [rbp - 0x60]
140385e07: call      0x144e89c90
140385e0c: nop
140385e0d: lea       rcx, [rbp - 0x60]
140385e11: mov       rdx, rbx
140385e14: call      0x144e83d60
140385e19: nop
140385e1a: lea       rcx, [rbp + 0x50]
140385e1e: lea       rdx, [rbp - 0x60]
140385e22: call      0x144e836e0
140385e27: nop
140385e28: mov       r14b, 1
140385e2b: cmp       qword ptr [rdi + 0x90], 0
140385e33: je        0x140385f35
140385e39: mov       rax, qword ptr [rdi + 0x78]
140385e3d: mov       rcx, qword ptr [rdi + 0x80]
140385e44: movabs    rdx, 0xe592096a8ce4219
140385e4e: xor       r8d, r8d
140385e51: movdqa    xmm0, xmmword ptr [rip + 0x5a6dec7]
140385e59: pcmpeqd   xmm1, xmm1
140385e5d: movdqa    xmm2, xmmword ptr [rip + 0x5a7860b]
140385e65: and       rdx, rcx
140385e68: movdqu    xmm3, xmmword ptr [rax + rdx]
140385e6d: movdqa    xmm4, xmm3
140385e71: pcmpeqb   xmm4, xmm0
140385e75: pmovmskb  r9d, xmm4
140385e7a: test      r9d, r9d
140385e7d: je        0x140385ec0
140385e7f: tzcnt     r10d, r9d
140385e84: add       r10, rdx
140385e87: and       r10, rcx
140385e8a: neg       r10
140385e8d: lea       r10, [r10 + r10*2]
140385e91: movdqu    xmm4, xmmword ptr [rax + r10*8 - 0x18]
140385e98: pcmpeqb   xmm4, xmm2
140385e9c: pmovmskb  r11d, xmm4
140385ea1: cmp       r11d, 0xffff
140385ea8: je        0x140385edb
140385eaa: lea       r10d, [r9 - 1]
140385eae: and       r10w, r9w
140385eb2: mov       r9d, r10d
140385eb5: jne       0x140385e7f
140385eb7: nop       word ptr [rax + rax]
140385ec0: pcmpeqb   xmm3, xmm1
140385ec4: pmovmskb  r9d, xmm3
140385ec9: test      r9d, r9d
140385ecc: jne       0x140385f35
140385ece: add       rdx, r8
140385ed1: add       rdx, 0x10
140385ed5: add       r8, 0x10
140385ed9: jmp       0x140385e65
140385edb: lea       rax, [rax + r10*8]
140385edf: mov       rax, qword ptr [rax - 8]
140385ee3: cmp       rax, qword ptr [rdi + 0x218]
140385eea: jae       0x140385f35
140385eec: mov       rcx, qword ptr [rdi + 0x210]
140385ef3: mov       rcx, qword ptr [rcx + rax*8]
140385ef7: test      rcx, rcx
140385efa: je        0x140385f35
140385efc: mov       rax, qword ptr [rdi + 0x1e0]
140385f03: not       rcx
140385f06: imul      rcx, rcx, 0x38
140385f0a: cmp       byte ptr [rax + rcx + 0x30], 1
140385f0f: jne       0x140385f35
140385f11: add       rax, rcx
140385f14: mov       r14, qword ptr [rax + 0x10]
140385f18: lea       rdx, [rbp + 0x50]
140385f1c: mov       rcx, r14
140385f1f: call      0x144e09000
140385f24: nop
140385f25: lea       rdx, [rdi + 0x40]
140385f29: mov       rcx, r14
140385f2c: call      0x144e09160
140385f31: nop
140385f32: mov       r14d, eax
140385f35: mov       r15, qword ptr [rdi + 0x5a0]
140385f3c: lea       rcx, [rbp + 0x140]
140385f43: lea       rdx, [rbp + 0x50]
140385f47: mov       r8d, 0xb0
140385f4d: call      0x145bfa0e7
140385f52: mov       qword ptr [rbp + 0x100], r15
140385f59: mov       dword ptr [rbp + 0x108], 0
140385f63: mov       qword ptr [rbp + 0x110], 0x10
140385f6e: pxor      xmm0, xmm0
140385f72: movdqu    xmmword ptr [rbp + 0x118], xmm0
140385f7a: mov       qword ptr [rbp + 0x128], 0x10
140385f85: movdqu    xmmword ptr [rbp + 0x130], xmm0
140385f8d: mov       qword ptr [rbp + 0x1f0], 0
140385f98: mov       qword ptr [rbp + 0x1f8], 4
140385fa3: mov       qword ptr [rbp + 0x200], 0
140385fae: mov       byte ptr [rbp + 0x208], r14b
140385fb5: mov       qword ptr [rbp + 0x210], rbx
140385fbc: mov       byte ptr [rbp + 0x21f], 0
140385fc3: lea       rcx, [rbp - 0x60]
140385fc7: call      0x1403824e0
140385fcc: nop
140385fcd: lea       rcx, [rbp + 0x100]
140385fd4: mov       rdx, rdi
140385fd7: call      0x140382bb0
140385fdc: nop
140385fdd: lea       rdx, [rbp + 0x100]
140385fe4: mov       r8d, 0x118
140385fea: mov       rcx, rsi
140385fed: call      0x145bfa0e7
140385ff2: mov       rax, rsi
140385ff5: add       rsp, 0x2a8
140385ffc: pop       rbx
140385ffd: pop       rdi
140385ffe: pop       rsi
140385fff: pop       r14
140386001: pop       r15
140386003: pop       rbp
140386004: ret
