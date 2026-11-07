14038d4f0: push      rbp
14038d4f1: push      r15
14038d4f3: push      r14
14038d4f5: push      r12
14038d4f7: push      rsi
14038d4f8: push      rdi
14038d4f9: push      rbx
14038d4fa: sub       rsp, 0x2b0
14038d501: lea       rbp, [rsp + 0x80]
14038d509: mov       qword ptr [rbp + 0x228], 0xfffffffffffffffe
14038d514: mov       rdi, rdx
14038d517: mov       rsi, rcx
14038d51a: mov       rcx, rdx
14038d51d: call      0x1402ac980
14038d522: mov       rbx, rax
14038d525: mov       rcx, rdi
14038d528: call      0x1402c7490
14038d52d: mov       r14, rax
14038d530: lea       rcx, [rbp + 0x50]
14038d534: call      0x144e89c90
14038d539: movzx     eax, byte ptr [rbp + 0xe0]
14038d540: cmp       rbx, qword ptr [rbp + 0x78]
14038d544: jae       0x14038d65f
14038d54a: mov       rcx, qword ptr [rbp + 0x68]
14038d54e: mov       rdx, rbx
14038d551: shr       rdx, 6
14038d555: mov       rcx, qword ptr [rcx + rdx*8]
14038d559: bt        rcx, rbx
14038d55d: sbb       al, 0
14038d55f: jne       0x14038d667
14038d565: mov       byte ptr [rbp + 0x227], 1
14038d56c: lea       rcx, [rbp + 0x50]
14038d570: mov       rdx, rbx
14038d573: call      0x144e83610
14038d578: nop
14038d579: mov       byte ptr [rbp + 0x227], 1
14038d580: lea       rcx, [rbp - 0x60]
14038d584: call      0x144e89c90
14038d589: nop
14038d58a: lea       rcx, [rbp - 0x60]
14038d58e: mov       rdx, r14
14038d591: call      0x144e83d60
14038d596: nop
14038d597: lea       rcx, [rbp + 0x50]
14038d59b: lea       rdx, [rbp - 0x60]
14038d59f: call      0x144e836e0
14038d5a4: nop
14038d5a5: mov       r15b, 1
14038d5a8: cmp       qword ptr [rdi + 0x90], 0
14038d5b0: je        0x14038d701
14038d5b6: mov       rax, qword ptr [rdi + 0x78]
14038d5ba: mov       rcx, qword ptr [rdi + 0x80]
14038d5c1: movabs    rdx, 0xe592096a8ce4219
14038d5cb: xor       r8d, r8d
14038d5ce: movdqa    xmm0, xmmword ptr [rip + 0x5a6674a]
14038d5d6: pcmpeqd   xmm1, xmm1
14038d5da: movdqa    xmm2, xmmword ptr [rip + 0x5a70e8e]
14038d5e2: and       rdx, rcx
14038d5e5: movdqu    xmm3, xmmword ptr [rax + rdx]
14038d5ea: movdqa    xmm4, xmm3
14038d5ee: pcmpeqb   xmm4, xmm0
14038d5f2: pmovmskb  r9d, xmm4
14038d5f7: test      r9d, r9d
14038d5fa: je        0x14038d640
14038d5fc: tzcnt     r10d, r9d
14038d601: add       r10, rdx
14038d604: and       r10, rcx
14038d607: neg       r10
14038d60a: lea       r10, [r10 + r10*2]
14038d60e: movdqu    xmm4, xmmword ptr [rax + r10*8 - 0x18]
14038d615: pcmpeqb   xmm4, xmm2
14038d619: pmovmskb  r11d, xmm4
14038d61e: cmp       r11d, 0xffff
14038d625: je        0x14038d6a7
14038d62b: lea       r10d, [r9 - 1]
14038d62f: and       r10w, r9w
14038d633: mov       r9d, r10d
14038d636: jne       0x14038d5fc
14038d638: nop       dword ptr [rax + rax]
14038d640: pcmpeqb   xmm3, xmm1
14038d644: pmovmskb  r9d, xmm3
14038d649: test      r9d, r9d
14038d64c: jne       0x14038d701
14038d652: add       rdx, r8
14038d655: add       rdx, 0x10
14038d659: add       r8, 0x10
14038d65d: jmp       0x14038d5e2
14038d65f: test      al, al
14038d661: je        0x14038d565
14038d667: lea       rax, [rbp + 0x226]
14038d66e: mov       qword ptr [rbp + 0x100], rax
14038d675: lea       rax, [rip + 0x4c6fc84]
14038d67c: mov       qword ptr [rbp + 0x108], rax
14038d683: mov       byte ptr [rbp + 0x227], 1
14038d68a: lea       rcx, [rip + 0x5a598f7]
14038d691: lea       r8, [rip + 0x5a59958]
14038d698: lea       rdx, [rbp + 0x100]
14038d69f: call      0x145d99830
14038d6a4: nop
14038d6a5: ud2
14038d6a7: lea       rax, [rax + r10*8]
14038d6ab: mov       rax, qword ptr [rax - 8]
14038d6af: cmp       rax, qword ptr [rdi + 0x218]
14038d6b6: jae       0x14038d701
14038d6b8: mov       rcx, qword ptr [rdi + 0x210]
14038d6bf: mov       rcx, qword ptr [rcx + rax*8]
14038d6c3: test      rcx, rcx
14038d6c6: je        0x14038d701
14038d6c8: mov       rax, qword ptr [rdi + 0x1e0]
14038d6cf: not       rcx
14038d6d2: imul      rcx, rcx, 0x38
14038d6d6: cmp       byte ptr [rax + rcx + 0x30], 1
14038d6db: jne       0x14038d701
14038d6dd: add       rax, rcx
14038d6e0: mov       r15, qword ptr [rax + 0x10]
14038d6e4: lea       rdx, [rbp + 0x50]
14038d6e8: mov       rcx, r15
14038d6eb: call      0x144e09000
14038d6f0: nop
14038d6f1: lea       rdx, [rdi + 0x40]
14038d6f5: mov       rcx, r15
14038d6f8: call      0x144e09160
14038d6fd: nop
14038d6fe: mov       r15d, eax
14038d701: mov       r12, qword ptr [rdi + 0x5a0]
14038d708: lea       rcx, [rbp + 0x140]
14038d70f: lea       rdx, [rbp + 0x50]
14038d713: mov       r8d, 0xb0
14038d719: call      0x145bfa0e7
14038d71e: mov       qword ptr [rbp + 0x100], r12
14038d725: mov       dword ptr [rbp + 0x108], 0
14038d72f: mov       qword ptr [rbp + 0x110], 0x10
14038d73a: pxor      xmm0, xmm0
14038d73e: movdqu    xmmword ptr [rbp + 0x118], xmm0
14038d746: mov       qword ptr [rbp + 0x128], 0x10
14038d751: movdqu    xmmword ptr [rbp + 0x130], xmm0
14038d759: mov       qword ptr [rbp + 0x1f0], 0
14038d764: mov       qword ptr [rbp + 0x1f8], 4
14038d76f: mov       qword ptr [rbp + 0x200], 0
14038d77a: mov       byte ptr [rbp + 0x208], r15b
14038d781: mov       qword ptr [rbp + 0x210], rbx
14038d788: mov       qword ptr [rbp + 0x218], r14
14038d78f: mov       byte ptr [rbp + 0x227], 0
14038d796: lea       rcx, [rbp - 0x60]
14038d79a: call      0x1403824e0
14038d79f: nop
14038d7a0: lea       rcx, [rbp + 0x100]
14038d7a7: mov       rdx, rdi
14038d7aa: call      0x140387410
14038d7af: nop
14038d7b0: lea       rdx, [rbp + 0x100]
14038d7b7: mov       r8d, 0x120
14038d7bd: mov       rcx, rsi
14038d7c0: call      0x145bfa0e7
14038d7c5: mov       rax, rsi
14038d7c8: add       rsp, 0x2b0
14038d7cf: pop       rbx
14038d7d0: pop       rdi
14038d7d1: pop       rsi
14038d7d2: pop       r12
14038d7d4: pop       r14
14038d7d6: pop       r15
14038d7d8: pop       rbp
14038d7d9: ret
