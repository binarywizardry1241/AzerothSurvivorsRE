1403aa3a0: push      r15
1403aa3a2: push      r14
1403aa3a4: push      r13
1403aa3a6: push      r12
1403aa3a8: push      rsi
1403aa3a9: push      rdi
1403aa3aa: push      rbp
1403aa3ab: push      rbx
1403aa3ac: sub       rsp, 0xd8
1403aa3b3: mov       rdi, rdx
1403aa3b6: mov       rsi, rcx
1403aa3b9: mov       qword ptr [rsp + 0x38], rdx
1403aa3be: mov       rdx, qword ptr [rdx + 0x5a0]
1403aa3c5: mov       rcx, qword ptr [rcx]
1403aa3c8: cmp       rcx, rdx
1403aa3cb: jne       0x1403aa79a
1403aa3d1: mov       rax, qword ptr [rsi + 0xe8]
1403aa3d8: mov       rdx, qword ptr [rdi + 0x110]
1403aa3df: mov       ecx, dword ptr [rsi + 8]
1403aa3e2: test      rax, rax
1403aa3e5: je        0x1403aa5fe
1403aa3eb: cmp       ecx, edx
1403aa3ed: je        0x1403aa786
1403aa3f3: mov       rdx, qword ptr [rsi + 0xd8]
1403aa3fa: mov       r8, rax
1403aa3fd: shr       r8, 6
1403aa401: and       eax, 0x3f
1403aa404: cmp       rax, 1
1403aa408: sbb       r8, -1
1403aa40c: lea       r11, [rdx + 8]
1403aa410: lea       rcx, [r8 - 2]
1403aa414: xor       r9d, r9d
1403aa417: cmp       r8, 1
1403aa41b: cmove     rcx, r9
1403aa41f: lea       rax, [rdx + r8*8 - 8]
1403aa424: lea       r10, [rip + 0x5a54055]
1403aa42b: cmovne    r10, rax
1403aa42f: lea       r8, [rdx + rcx*8]
1403aa433: add       r8, 8
1403aa437: shl       rcx, 6
1403aa43b: add       rcx, 0x40
1403aa43f: mov       rbx, qword ptr [r10]
1403aa442: mov       r13, qword ptr [rdx]
1403aa445: mov       qword ptr [rsp + 0x40], r11
1403aa44a: mov       qword ptr [rsp + 0x48], r8
1403aa44f: mov       qword ptr [rsp + 0x50], r13
1403aa454: mov       qword ptr [rsp + 0x58], rbx
1403aa459: mov       qword ptr [rsp + 0x60], 0
1403aa462: mov       qword ptr [rsp + 0x68], rcx
1403aa467: lea       rax, [rsp + 0x38]
1403aa46c: mov       qword ptr [rsp + 0x70], rax
1403aa471: movabs    r15, 0x9dc0fe5cef68def1
1403aa47b: movabs    rdx, 0xc0ac29b7c97c50dd
1403aa485: pcmpeqd   xmm0, xmm0
1403aa489: mov       qword ptr [rsp + 0x20], rbx
1403aa48e: mov       r12, r11
1403aa491: test      r13, r13
1403aa494: je        0x1403aa4c0
1403aa496: tzcnt     rbp, r13
1403aa49b: lea       rax, [r13 - 1]
1403aa49f: and       r13, rax
1403aa4a2: add       rbp, r9
1403aa4a5: cmp       qword ptr [rdi + 0x150], 0
1403aa4ad: jne       0x1403aa52e
1403aa4af: jmp       0x1403aa491
1403aa4b1: nop       word ptr cs:[rax + rax]
1403aa4c0: cmp       r12, r8
1403aa4c3: je        0x1403aa4ed
1403aa4c5: add       r9, 0x40
1403aa4c9: nop       dword ptr [rax]
1403aa4d0: mov       r13, qword ptr [r12]
1403aa4d4: add       r12, 8
1403aa4d8: test      r13, r13
1403aa4db: jne       0x1403aa5ec
1403aa4e1: add       r9, 0x40
1403aa4e5: cmp       r12, r8
1403aa4e8: jne       0x1403aa4d0
1403aa4ea: mov       r11, r8
1403aa4ed: mov       qword ptr [rsp + 0x40], r11
1403aa4f2: test      rbx, rbx
1403aa4f5: je        0x1403aa77d
1403aa4fb: mov       qword ptr [rsp + 0x60], rcx
1403aa500: tzcnt     rbp, rbx
1403aa505: lea       rax, [rbx - 1]
1403aa509: and       rax, rbx
1403aa50c: or        rbp, rcx
1403aa50f: mov       qword ptr [rsp + 0x20], rax
1403aa514: mov       rbx, rax
1403aa517: mov       r9, rcx
1403aa51a: mov       r12, r8
1403aa51d: xor       r13d, r13d
1403aa520: cmp       qword ptr [rdi + 0x150], 0
1403aa528: je        0x1403aa491
1403aa52e: mov       qword ptr [rsp + 0x28], rbx
1403aa533: mov       qword ptr [rsp + 0x30], r11
1403aa538: mov       rax, rbp
1403aa53b: xor       rax, r15
1403aa53e: mul       rdx
1403aa541: xor       rdx, rax
1403aa544: mov       rbx, rdx
1403aa547: shr       rbx, 0x39
1403aa54b: mov       rax, qword ptr [rdi + 0x138]
1403aa552: mov       r11, qword ptr [rdi + 0x140]
1403aa559: movd      xmm1, ebx
1403aa55d: punpcklbw xmm1, xmm1
1403aa561: pshuflw   xmm1, xmm1, 0
1403aa566: pshufd    xmm1, xmm1, 0x44
1403aa56b: xor       r10d, r10d
1403aa56e: and       rdx, r11
1403aa571: movdqu    xmm2, xmmword ptr [rax + rdx]
1403aa576: movdqa    xmm3, xmm2
1403aa57a: pcmpeqb   xmm3, xmm1
1403aa57e: pmovmskb  r14d, xmm3
1403aa583: test      r14d, r14d
1403aa586: je        0x1403aa5b8
1403aa588: mov       rbx, r15
1403aa58b: tzcnt     r15d, r14d
1403aa590: add       r15, rdx
1403aa593: and       r15, r11
1403aa596: neg       r15
1403aa599: lea       r15, [r15 + r15*4]
1403aa59d: cmp       rbp, qword ptr [rax + r15*8 - 0x28]
1403aa5a2: je        0x1403aa650
1403aa5a8: lea       r15d, [r14 - 1]
1403aa5ac: and       r15w, r14w
1403aa5b0: mov       r14d, r15d
1403aa5b3: mov       r15, rbx
1403aa5b6: jne       0x1403aa588
1403aa5b8: pcmpeqb   xmm2, xmm0
1403aa5bc: pmovmskb  r14d, xmm2
1403aa5c1: test      r14d, r14d
1403aa5c4: jne       0x1403aa5d3
1403aa5c6: add       rdx, r10
1403aa5c9: add       rdx, 0x10
1403aa5cd: add       r10, 0x10
1403aa5d1: jmp       0x1403aa56e
1403aa5d3: movabs    rdx, 0xc0ac29b7c97c50dd
1403aa5dd: mov       r11, qword ptr [rsp + 0x30]
1403aa5e2: mov       rbx, qword ptr [rsp + 0x28]
1403aa5e7: jmp       0x1403aa491
1403aa5ec: mov       qword ptr [rsp + 0x40], r12
1403aa5f1: mov       qword ptr [rsp + 0x60], r9
1403aa5f6: mov       r11, r12
1403aa5f9: jmp       0x1403aa496
1403aa5fe: mov       dword ptr [rsi + 8], edx
1403aa601: cmp       rdx, rcx
1403aa604: jb        0x1403aa7a8
1403aa60a: je        0x1403aa786
1403aa610: shl       rcx, 5
1403aa614: lea       rax, [rcx + rcx*4]
1403aa618: mov       rcx, qword ptr [rdi + 0x108]
1403aa61f: add       rcx, rax
1403aa622: shl       rdx, 5
1403aa626: lea       rdi, [rdx + rdx*4]
1403aa62a: mov       rdx, rcx
1403aa62d: sub       rdi, rax
1403aa630: lea       rbx, [rdx + 0xa0]
1403aa637: mov       rcx, rsi
1403aa63a: call      0x1403a9f90
1403aa63f: mov       rdx, rbx
1403aa642: add       rdi, -0xa0
1403aa649: jne       0x1403aa630
1403aa64b: jmp       0x1403aa786
1403aa650: lea       rax, [rax + r15*8]
1403aa654: mov       qword ptr [rsp + 0x50], r13
1403aa659: mov       rcx, qword ptr [rsp + 0x20]
1403aa65e: mov       qword ptr [rsp + 0x58], rcx
1403aa663: mov       rcx, qword ptr [rax - 0x20]
1403aa667: mov       rdx, qword ptr [rax - 0x18]
1403aa66b: lea       rdx, [rcx + rdx + 1]
1403aa670: movdqa    xmm0, xmmword ptr [rcx]
1403aa674: pmovmskb  r8d, xmm0
1403aa679: not       r8d
1403aa67c: mov       rax, qword ptr [rax - 8]
1403aa680: mov       qword ptr [rsp + 0x78], rax
1403aa685: mov       qword ptr [rsp + 0x80], rcx
1403aa68d: add       rcx, 0x10
1403aa691: mov       qword ptr [rsp + 0x88], rcx
1403aa699: mov       qword ptr [rsp + 0x90], rdx
1403aa6a1: mov       word ptr [rsp + 0x98], r8w
1403aa6aa: mov       qword ptr [rsp + 0xa0], rax
1403aa6b2: lea       rcx, [rsp + 0xa8]
1403aa6ba: lea       rdx, [rsp + 0x40]
1403aa6bf: lea       r8, [rsp + 0x78]
1403aa6c4: call      0x140128d50
1403aa6c9: mov       rbx, qword ptr [rsp + 0xb0]
1403aa6d1: test      rbx, rbx
1403aa6d4: je        0x1403aa77d
1403aa6da: mov       r14, qword ptr [rsp + 0xd0]
1403aa6e2: test      r14, r14
1403aa6e5: je        0x1403aa77d
1403aa6eb: mov       r15, qword ptr [rsp + 0xb8]
1403aa6f3: movzx     r12d, word ptr [rsp + 0xc8]
1403aa6fc: jmp       0x1403aa727
1403aa6fe: nop
1403aa700: lea       rdx, [rcx + rcx*4]
1403aa704: shl       rdx, 5
1403aa708: add       rdx, qword ptr [rdi + 0x108]
1403aa70f: mov       rcx, rsi
1403aa712: call      0x1403a9f90
1403aa717: lea       eax, [r12 - 1]
1403aa71c: and       eax, r12d
1403aa71f: mov       r12d, eax
1403aa722: dec       r14
1403aa725: je        0x1403aa77d
1403aa727: test      r12w, r12w
1403aa72b: jne       0x1403aa74e
1403aa72d: nop       dword ptr [rax]
1403aa730: movdqa    xmm0, xmmword ptr [r15]
1403aa735: add       rbx, -0x180
1403aa73c: add       r15, 0x10
1403aa740: pmovmskb  r12d, xmm0
1403aa745: xor       r12d, 0xffff
1403aa74c: je        0x1403aa730
1403aa74e: tzcnt     eax, r12d
1403aa753: neg       rax
1403aa756: lea       rax, [rax + rax*2]
1403aa75a: mov       ecx, dword ptr [rbx + rax*8 - 0x18]
1403aa75e: cmp       ecx, dword ptr [rsi + 8]
1403aa761: jb        0x1403aa717
1403aa763: mov       rdx, qword ptr [rdi + 0x110]
1403aa76a: cmp       rdx, rcx
1403aa76d: ja        0x1403aa700
1403aa76f: lea       r8, [rip + 0x5a53e12]
1403aa776: call      0x145d99653
1403aa77b: ud2
1403aa77d: mov       eax, dword ptr [rdi + 0x110]
1403aa783: mov       dword ptr [rsi + 8], eax
1403aa786: add       rsp, 0xd8
1403aa78d: pop       rbx
1403aa78e: pop       rbp
1403aa78f: pop       rdi
1403aa790: pop       rsi
1403aa791: pop       r12
1403aa793: pop       r13
1403aa795: pop       r14
1403aa797: pop       r15
1403aa799: ret
1403aa79a: lea       r8, [rip + 0x5a53dff]
1403aa7a1: call      0x145d4b100
1403aa7a6: ud2
1403aa7a8: lea       r9, [rip + 0x5a53dc1]
1403aa7af: mov       r8, rdx
1403aa7b2: call      0x145d99860
1403aa7b7: ud2
