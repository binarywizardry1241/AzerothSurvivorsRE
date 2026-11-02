14007c2e0: push     rbp
14007c2e1: push     r15
14007c2e3: push     r14
14007c2e5: push     r13
14007c2e7: push     r12
14007c2e9: push     rsi
14007c2ea: push     rdi
14007c2eb: push     rbx
14007c2ec: sub      rsp, 0x128
14007c2f3: lea      rbp, [rsp + 0x80]
14007c2fb: movaps   xmmword ptr [rbp + 0x90], xmm10
14007c303: movaps   xmmword ptr [rbp + 0x80], xmm9
14007c30b: movaps   xmmword ptr [rbp + 0x70], xmm8
14007c310: movaps   xmmword ptr [rbp + 0x60], xmm7
14007c314: movaps   xmmword ptr [rbp + 0x50], xmm6
14007c318: mov      qword ptr [rbp + 0x48], 0xfffffffffffffffe
14007c320: mov      rax, qword ptr [rbp + 0x128]
14007c327: mov      rcx, qword ptr [rbp + 0x120]
14007c32e: mov      r10, qword ptr [rbp + 0x118]
14007c335: mov      r11, qword ptr [rbp + 0x110]
14007c33c: mov      r12, qword ptr [rdx]
14007c33f: mov      rsi, qword ptr [rdx + 0x10]
14007c343: mov      qword ptr [rbp + 0x40], rsi
14007c347: mov      edx, dword ptr [rdx + 0x1c]
14007c34a: mov      dword ptr [rbp + 0x30], edx
14007c34d: mov      rbx, qword ptr [r11]
14007c350: mov      rsi, qword ptr [r10]
14007c353: mov      rdx, qword ptr [rcx]
14007c356: mov      qword ptr [rbp + 0x28], rdx
14007c35a: mov      r13, qword ptr [rcx + 8]
14007c35e: mov      ecx, dword ptr [rcx + 0x14]
14007c361: mov      dword ptr [rbp - 0xc], ecx
14007c364: mov      rcx, qword ptr [rax]
14007c367: mov      qword ptr [rbp - 0x58], rcx
14007c36b: mov      r15, qword ptr [rax + 8]
14007c36f: mov      eax, dword ptr [rax + 0x14]
14007c372: mov      dword ptr [rbp - 0x10], eax
14007c375: movss    xmm6, dword ptr [rsi + 0x5c]
14007c37a: cmp      byte ptr [r12 + 0x1c], 1
14007c380: mov      qword ptr [rbp - 0x20], rsi
14007c384: mov      qword ptr [rbp - 0x60], rbx
14007c388: jne      0x14007c39e
14007c38a: mov      rax, qword ptr [r8]
14007c38d: cmp      byte ptr [rax + 0xd], 1
14007c391: jne      0x14007c39e
14007c393: cmp      byte ptr [rax + 0xe], 1
14007c397: jne      0x14007c39e
14007c399: cmp      byte ptr [rax], 0
14007c39c: je       0x14007c418
14007c39e: xor      ebx, ebx
14007c3a0: mov      rsi, qword ptr [r12]
14007c3a4: test     rsi, rsi
14007c3a7: mov      qword ptr [rbp + 0x20], r15
14007c3ab: je       0x14007c51f
14007c3b1: mov      rdi, qword ptr [r12 + 8]
14007c3b6: test     rbx, rbx
14007c3b9: setne    al
14007c3bc: cmp      rdi, r14
14007c3bf: sete     cl
14007c3c2: test     al, cl
14007c3c4: je       0x14007c3dc
14007c3c6: mov      rcx, rsi
14007c3c9: mov      rdx, rbx
14007c3cc: mov      r8, r14
14007c3cf: call     0x145bfa0e1
14007c3d4: test     eax, eax
14007c3d6: je       0x14007c544
14007c3dc: xorps    xmm0, xmm0
14007c3df: ucomiss  xmm0, dword ptr [r12 + 0x18]
14007c3e5: jb       0x14007c547
14007c3eb: mov      rax, qword ptr [rbp + 0x40]
14007c3ef: mov      ecx, dword ptr [rbp + 0x30]
14007c3f2: mov      dword ptr [rax], ecx
14007c3f4: mov      qword ptr [r12], rbx
14007c3f8: mov      qword ptr [r12 + 8], r14
14007c3fd: movss    dword ptr [r12 + 0x10], xmm6
14007c404: mov      rsi, rbx
14007c407: mov      rdi, r14
14007c40a: test     rbx, rbx
14007c40d: jne      0x14007c547
14007c413: jmp      0x14007c7ca
14007c418: mov      rax, qword ptr [r9]
14007c41b: mov      rdi, qword ptr [rax + 0x20]
14007c41f: mov      r14, qword ptr [rax + 0x28]
14007c423: lea      rdx, [rip + 0x5d5347e]
14007c42a: lea      rcx, [rbp - 0x50]
14007c42e: mov      r8d, 0x12
14007c434: call     0x145bbd970
14007c439: mov      rdx, qword ptr [rbp - 0x50]
14007c43d: cmp      rdx, -2
14007c441: mov      qword ptr [rbp + 0x20], r14
14007c445: je       0x14007c46e
14007c447: cmp      rdx, -1
14007c44b: je       0x14007c4f7
14007c451: test     rdx, rdx
14007c454: je       0x14007c4f7
14007c45a: mov      rcx, qword ptr [rbp - 0x48]
14007c45e: mov      r8d, 1
14007c464: call     0x1400021d0
14007c469: jmp      0x14007c4f7
14007c46e: mov      rdx, qword ptr [rbp - 0x48]
14007c472: cmp      rdx, -1
14007c476: je       0x14007c4f7
14007c478: mov      rbx, qword ptr [rbp - 0x40]
14007c47c: mov      rax, qword ptr [rip + 0x800df2d]
14007c483: mov      rcx, qword ptr [rax + 8]
14007c487: test     rcx, rcx
14007c48a: je       0x14007c4dc
14007c48c: mov      qword ptr [rbp - 0x18], rdx
14007c490: mov      qword ptr [rbp + 0x38], r12
14007c494: mov      rsi, qword ptr [rbp - 0x38]
14007c498: mov      r14, qword ptr [rax]
14007c49b: imul     r12, rcx, 0xf0
14007c4a2: jmp      0x14007c4b4
14007c4a4: add      r14, 0xf0
14007c4ab: add      r12, -0xf0
14007c4b2: je       0x14007c4cf
14007c4b4: cmp      qword ptr [r14 + 0x10], rsi
14007c4b8: jne      0x14007c4a4
14007c4ba: mov      rcx, qword ptr [r14 + 8]
14007c4be: mov      rdx, rbx
14007c4c1: mov      r8, rsi
14007c4c4: call     0x145bfa0e1
14007c4c9: test     eax, eax
14007c4cb: jne      0x14007c4a4
14007c4cd: jmp      0x14007c4d2
14007c4cf: xor      r14d, r14d
14007c4d2: mov      r12, qword ptr [rbp + 0x38]
14007c4d6: mov      rdx, qword ptr [rbp - 0x18]
14007c4da: jmp      0x14007c4df
14007c4dc: xor      r14d, r14d
14007c4df: test     rdx, rdx
14007c4e2: je       0x14007c4f2
14007c4e4: mov      r8d, 1
14007c4ea: mov      rcx, rbx
14007c4ed: call     0x1400021d0
14007c4f2: test     r14, r14
14007c4f5: jne      0x14007c506
14007c4f7: mov      rcx, rdi
14007c4fa: mov      rdx, qword ptr [rbp + 0x20]
14007c4fe: call     0x14588d200
14007c503: mov      r14, rax
14007c506: mov      rbx, qword ptr [r14 + 8]
14007c50a: mov      r14, qword ptr [r14 + 0x10]
14007c50e: mov      rsi, qword ptr [r12]
14007c512: test     rsi, rsi
14007c515: mov      qword ptr [rbp + 0x20], r15
14007c519: jne      0x14007c3b1
14007c51f: test     rbx, rbx
14007c522: je       0x14007c7ca
14007c528: mov      rax, qword ptr [rbp + 0x40]
14007c52c: mov      ecx, dword ptr [rbp + 0x30]
14007c52f: mov      dword ptr [rax], ecx
14007c531: mov      qword ptr [r12], rbx
14007c535: mov      qword ptr [r12 + 8], r14
14007c53a: movss    dword ptr [r12 + 0x10], xmm6
14007c541: mov      rsi, rbx
14007c544: mov      rdi, r14
14007c547: xor      eax, eax
14007c549: test     rbx, rbx
14007c54c: je       0x14007c566
14007c54e: cmp      rdi, r14
14007c551: jne      0x14007c566
14007c553: mov      rcx, rsi
14007c556: mov      rdx, rbx
14007c559: mov      r8, r14
14007c55c: call     0x145bfa0e1
14007c561: test     eax, eax
14007c563: sete     al
14007c566: mov      dword ptr [rbp - 0x18], eax
14007c569: subss    xmm6, dword ptr [r12 + 0x10]
14007c570: mov      rcx, rsi
14007c573: mov      rdx, rdi
14007c576: call     0x14588d200
14007c57b: mov      rbx, rax
14007c57e: lea      rcx, [rbp - 0x50]
14007c582: mov      rdx, rax
14007c585: call     0x1459a77c0
14007c58a: lea      rdx, [rip + 0x5d53329]
14007c591: mov      rcx, rbp
14007c594: mov      r8d, 0x18
14007c59a: call     0x145bbd970
14007c59f: mov      rdx, qword ptr [rbp]
14007c5a3: cmp      rdx, -2
14007c5a7: je       0x14007c5c5
14007c5a9: cmp      rdx, -1
14007c5ad: je       0x14007c613
14007c5af: test     rdx, rdx
14007c5b2: je       0x14007c613
14007c5b4: mov      rcx, qword ptr [rbp + 8]
14007c5b8: mov      r8d, 1
14007c5be: call     0x1400021d0
14007c5c3: jmp      0x14007c613
14007c5c5: mov      rax, qword ptr [rbp + 8]
14007c5c9: mov      qword ptr [rbp + 0x38], rax
14007c5cd: cmp      rax, -1
14007c5d1: je       0x14007c613
14007c5d3: mov      rcx, qword ptr [rbp + 0x10]
14007c5d7: mov      rdx, qword ptr [rbp + 0x18]
14007c5db: mov      qword ptr [rbp - 8], rcx
14007c5df: call     0x145bdb8d0
14007c5e4: nop
14007c5e5: mov      r14, rax
14007c5e8: mov      rdx, qword ptr [rbp + 0x38]
14007c5ec: test     rdx, rdx
14007c5ef: je       0x14007c600
14007c5f1: mov      r8d, 1
14007c5f7: mov      rcx, qword ptr [rbp - 8]
14007c5fb: call     0x1400021d0
14007c600: test     r14b, 1
14007c604: jne      0x14007c613
14007c606: shr      r14, 0x20
14007c60a: movd     xmm0, r14d
14007c60f: mulss    xmm6, xmm0
14007c613: mov      ebx, dword ptr [rbx + 0xc0]
14007c619: mov      rax, qword ptr [rip + 0x800dd90]
14007c620: mov      rcx, qword ptr [rax + 8]
14007c624: test     rcx, rcx
14007c627: je       0x14007c68f
14007c629: mov      dword ptr [rbp - 8], ebx
14007c62c: mov      qword ptr [rbp + 0x38], r12
14007c630: mov      rbx, qword ptr [rax]
14007c633: imul     r12, rcx, 0xf0
14007c63a: xor      r14d, r14d
14007c63d: xor      r15d, r15d
14007c640: jmp      0x14007c65f
14007c642: nop      word ptr cs:[rax + rax]
14007c650: dec      r14
14007c653: add      r15, 0xf0
14007c65a: cmp      r12, r15
14007c65d: je       0x14007c67f
14007c65f: cmp      qword ptr [rbx + r15 + 0x10], rdi
14007c664: jne      0x14007c650
14007c666: mov      rcx, qword ptr [rbx + r15 + 8]
14007c66b: mov      rdx, rsi
14007c66e: mov      r8, rdi
14007c671: call     0x145bfa0e1
14007c676: test     eax, eax
14007c678: jne      0x14007c650
14007c67a: neg      r14d
14007c67d: jmp      0x14007c682
14007c67f: xor      r14d, r14d
14007c682: mov      r15, qword ptr [rbp + 0x20]
14007c686: mov      r12, qword ptr [rbp + 0x38]
14007c68a: mov      ebx, dword ptr [rbp - 8]
14007c68d: jmp      0x14007c692
14007c68f: xor      r14d, r14d
14007c692: movss    xmm8, dword ptr [rbp - 0x38]
14007c698: movss    xmm9, dword ptr [rip + 0x5d50a9f]
14007c6a1: mulss    xmm6, xmm9
14007c6a6: divss    xmm6, dword ptr [rbp - 0x34]
14007c6ab: movaps   xmm0, xmm6
14007c6ae: call     0x145bfa117
14007c6b3: movaps   xmm7, xmm0
14007c6b6: cmpnless xmm9, xmm8
14007c6bc: mulss    xmm8, xmm0
14007c6c1: movaps   xmm0, xmm9
14007c6c5: andnps   xmm0, xmm6
14007c6c8: andps    xmm8, xmm9
14007c6cc: orps     xmm8, xmm0
14007c6d0: movss    xmm10, dword ptr [rbp - 0x44]
14007c6d6: movss    xmm9, dword ptr [rbp - 0x48]
14007c6dc: addss    xmm8, dword ptr [rbp - 0x3c]
14007c6e2: movaps   xmm0, xmm8
14007c6e6: call     0x145bfa117
14007c6eb: movaps   xmm6, xmm0
14007c6ee: mulss    xmm7, dword ptr [rbp - 0x28]
14007c6f3: addss    xmm7, xmm10
14007c6f8: movaps   xmm0, xmm8
14007c6fc: call     0x145bfa11d
14007c701: movaps   xmm1, xmm7
14007c704: mulss    xmm1, xmm0
14007c708: mulss    xmm10, dword ptr [rbp - 0x30]
14007c70e: movss    xmm2, dword ptr [rbp - 0x2c]
14007c713: addss    xmm2, xmm9
14007c718: movss    xmm3, dword ptr [rbp - 0x24]
14007c71d: movsd    xmm4, qword ptr [rbp - 0x50]
14007c722: addss    xmm1, xmm4
14007c726: unpcklps xmm0, xmm6
14007c729: movss    xmm5, dword ptr [rbp - 0x40]
14007c72e: unpcklps xmm7, xmm5
14007c731: movlhps  xmm7, xmm0
14007c734: movss    xmm0, dword ptr [rip + 0x5d20b64]
14007c73c: unpcklps xmm6, xmm0
14007c73f: shufps   xmm6, xmm10, 4
14007c744: mulps    xmm6, xmm7
14007c747: movddup  xmm0, xmm4
14007c74b: shufps   xmm9, xmm4, 0xd4
14007c750: shufps   xmm9, xmm4, 0x42
14007c755: addps    xmm9, xmm6
14007c759: subps    xmm0, xmm6
14007c75c: movsd    xmm0, xmm9
14007c761: mov      dword ptr [rbp - 0x4c], ebx
14007c764: mov      dword ptr [rbp - 0x48], r14d
14007c768: movss    dword ptr [rbp - 0x44], xmm1
14007c76d: movupd   xmmword ptr [rbp - 0x40], xmm0
14007c772: movss    dword ptr [rbp - 0x30], xmm2
14007c777: movss    dword ptr [rbp - 0x2c], xmm3
14007c77c: mov      dword ptr [rbp - 0x50], 1
14007c783: lea      rcx, [rbp - 0x50]
14007c787: call     0x140811850
14007c78c: mov      rax, qword ptr [rbp - 0x60]
14007c790: movzx    ecx, byte ptr [rax + 0x72]
14007c794: call     0x1408116a0
14007c799: cmp      byte ptr [rbp - 0x18], 0
14007c79d: mov      rsi, qword ptr [rbp - 0x20]
14007c7a1: je       0x14007c7eb
14007c7a3: call     0x140811a60
14007c7a8: movss    xmm0, dword ptr [rsi + 0x58]
14007c7ad: test     al, al
14007c7af: je       0x14007c7f0
14007c7b1: divss    xmm0, dword ptr [rip + 0x5d506c7]
14007c7b9: addss    xmm0, dword ptr [r12 + 0x18]
14007c7c0: minss    xmm0, dword ptr [rip + 0x5d20ad8]
14007c7c8: jmp      0x14007c806
14007c7ca: mov      dword ptr [rbp - 0x50], 0
14007c7d1: lea      rcx, [rbp - 0x50]
14007c7d5: call     0x140811850
14007c7da: mov      rax, qword ptr [rbp - 0x60]
14007c7de: movzx    ecx, byte ptr [rax + 0x72]
14007c7e2: call     0x1408116a0
14007c7e7: mov      rsi, qword ptr [rbp - 0x20]
14007c7eb: movss    xmm0, dword ptr [rsi + 0x58]
14007c7f0: divss    xmm0, dword ptr [rip + 0x5d5094c]
14007c7f8: addss    xmm0, dword ptr [r12 + 0x18]
14007c7ff: xorps    xmm1, xmm1
14007c802: maxss    xmm0, xmm1
14007c806: mov      rax, qword ptr [rbp + 0x40]
14007c80a: mov      ecx, dword ptr [rbp + 0x30]
14007c80d: mov      dword ptr [rax], ecx
14007c80f: movss    dword ptr [r12 + 0x18], xmm0
14007c816: movaps   xmm1, xmm0
14007c819: mulss    xmm1, xmm0
14007c81d: addss    xmm0, xmm0
14007c821: movss    xmm2, dword ptr [rip + 0x5d506a7]
14007c829: subss    xmm2, xmm0
14007c82d: mulss    xmm2, xmm1
14007c831: movss    xmm6, dword ptr [rip + 0x5d20a67]
14007c839: subss    xmm6, xmm2
14007c83d: cmp      byte ptr [r12 + 0x1c], 0
14007c843: movaps   xmm7, xmm6
14007c846: jne      0x14007c84b
14007c848: xorps    xmm7, xmm7
14007c84b: mov      rcx, qword ptr [rbp + 0x28]
14007c84f: mov      rbx, qword ptr [rcx + 0xf8]
14007c856: mov      rax, qword ptr [rcx + 0x100]
14007c85d: lea      r14, [rbx + rax*4]
14007c861: cmp      byte ptr [rcx + 0x108], 0
14007c868: je       0x14007c961
14007c86e: xor      r12d, r12d
14007c871: movsd    xmm8, qword ptr [rip + 0x5d508d6]
14007c87a: mov      qword ptr [rbp + 0x40], 0
14007c882: xor      esi, esi
14007c884: jmp      0x14007c896
14007c886: nop      word ptr cs:[rax + rax]
14007c890: inc      esi
14007c892: mov      r15, qword ptr [rbp + 0x20]
14007c896: cmp      esi, r12d
14007c899: jne      0x14007c8fe
14007c89b: nop      dword ptr [rax + rax]
14007c8a0: cmp      rbx, r14
14007c8a3: je       0x14007ca8e
14007c8a9: mov      ecx, dword ptr [rbx]
14007c8ab: add      rbx, 4
14007c8af: mov      rax, qword ptr [r13 + 0x1a8]
14007c8b6: lea      rcx, [rcx + rcx*8]
14007c8ba: mov      r12, qword ptr [rax + rcx*8 + 0x10]
14007c8bf: test     r12, r12
14007c8c2: je       0x14007c8a0
14007c8c4: lea      rax, [rax + rcx*8]
14007c8c8: mov      rcx, qword ptr [rbp + 0x28]
14007c8cc: mov      rcx, qword ptr [rcx + 0x110]
14007c8d3: mov      rdx, qword ptr [rax + 0x18]
14007c8d7: mov      rax, qword ptr [rax + 0x38]
14007c8db: mov      rax, qword ptr [rax + rcx*8]
14007c8df: not      rax
14007c8e2: lea      rax, [rax + rax*2]
14007c8e6: shl      rax, 4
14007c8ea: mov      rcx, qword ptr [rdx + rax + 0x10]
14007c8ef: mov      qword ptr [rbp + 0x40], rcx
14007c8f3: mov      rax, qword ptr [rdx + rax + 0x28]
14007c8f8: mov      qword ptr [rbp + 0x30], rax
14007c8fc: xor      esi, esi
14007c8fe: mov      r15d, esi
14007c901: mov      rax, r15
14007c904: shl      rax, 7
14007c908: lea      rax, [rax + r15*8]
14007c90c: movsd    qword ptr [rbp + 4], xmm8
14007c912: mov      dword ptr [rbp + 0xc], 0x3eb851ec
14007c919: movss    dword ptr [rbp + 0x10], xmm7
14007c91e: mov      dword ptr [rbp], 0
14007c925: mov      rcx, qword ptr [rbp + 0x40]
14007c929: lea      rdi, [rcx + rax]
14007c92d: add      rdi, 0x38
14007c931: mov      rcx, rdi
14007c934: mov      rdx, rbp
14007c937: call     0x140087c10
14007c93c: test     al, al
14007c93e: jne      0x14007c890
14007c944: mov      eax, dword ptr [rbp - 0xc]
14007c947: mov      rcx, qword ptr [rbp + 0x30]
14007c94b: mov      dword ptr [rcx + r15*4], eax
14007c94f: mov      eax, dword ptr [rbp + 0x10]
14007c952: mov      dword ptr [rdi + 0x10], eax
14007c955: movups   xmm0, xmmword ptr [rbp]
14007c959: movups   xmmword ptr [rdi], xmm0
14007c95c: jmp      0x14007c890
14007c961: xor      r12d, r12d
14007c964: mov      eax, 8
14007c969: mov      qword ptr [rbp + 0x40], rax
14007c96d: movsd    xmm8, qword ptr [rip + 0x5d507da]
14007c976: mov      qword ptr [rbp + 0x30], 0
14007c97e: xor      esi, esi
14007c980: jmp      0x14007c996
14007c982: nop      word ptr cs:[rax + rax]
14007c990: inc      esi
14007c992: mov      r15, qword ptr [rbp + 0x20]
14007c996: cmp      esi, r12d
14007c999: jne      0x14007ca1c
14007c99f: nop
14007c9a0: cmp      rbx, r14
14007c9a3: je       0x14007ca8e
14007c9a9: mov      ecx, dword ptr [rbx]
14007c9ab: add      rbx, 4
14007c9af: mov      rax, qword ptr [r13 + 0x108]
14007c9b6: lea      rcx, [rcx + rcx*4]
14007c9ba: shl      rcx, 5
14007c9be: mov      r12, qword ptr [rax + rcx + 0x58]
14007c9c3: test     r12, r12
14007c9c6: je       0x14007c9a0
14007c9c8: add      rax, rcx
14007c9cb: mov      ecx, dword ptr [rax + 0x94]
14007c9d1: mov      rdx, qword ptr [r13 + 0x1a8]
14007c9d8: lea      rcx, [rcx + rcx*8]
14007c9dc: mov      r8, qword ptr [rbp + 0x28]
14007c9e0: mov      r8, qword ptr [r8 + 0x110]
14007c9e7: mov      r9, qword ptr [rdx + rcx*8 + 0x18]
14007c9ec: mov      rcx, qword ptr [rdx + rcx*8 + 0x38]
14007c9f1: mov      rcx, qword ptr [rcx + r8*8]
14007c9f5: not      rcx
14007c9f8: lea      rcx, [rcx + rcx*2]
14007c9fc: shl      rcx, 4
14007ca00: mov      rdx, qword ptr [r9 + rcx + 0x10]
14007ca05: mov      qword ptr [rbp + 0x30], rdx
14007ca09: mov      rcx, qword ptr [r9 + rcx + 0x28]
14007ca0e: mov      qword ptr [rbp - 0x20], rcx
14007ca12: mov      rax, qword ptr [rax + 0x50]
14007ca16: mov      qword ptr [rbp + 0x40], rax
14007ca1a: xor      esi, esi
14007ca1c: mov      eax, esi
14007ca1e: shl      rax, 4
14007ca22: mov      rcx, qword ptr [rbp + 0x40]
14007ca26: mov      r15d, dword ptr [rcx + rax + 8]
14007ca2b: not      r15d
14007ca2e: mov      rax, r15
14007ca31: shl      rax, 7
14007ca35: lea      rax, [rax + r15*8]
14007ca39: movsd    qword ptr [rbp + 4], xmm8
14007ca3f: mov      dword ptr [rbp + 0xc], 0x3eb851ec
14007ca46: movss    dword ptr [rbp + 0x10], xmm7
14007ca4b: mov      dword ptr [rbp], 0
14007ca52: mov      rcx, qword ptr [rbp + 0x30]
14007ca56: lea      rdi, [rcx + rax]
14007ca5a: add      rdi, 0x38
14007ca5e: mov      rcx, rdi
14007ca61: mov      rdx, rbp
14007ca64: call     0x140087c10
14007ca69: test     al, al
14007ca6b: jne      0x14007c990
14007ca71: mov      eax, dword ptr [rbp - 0xc]
14007ca74: mov      rcx, qword ptr [rbp - 0x20]
14007ca78: mov      dword ptr [rcx + r15*4], eax
14007ca7c: mov      eax, dword ptr [rbp + 0x10]
14007ca7f: mov      dword ptr [rdi + 0x10], eax
14007ca82: movups   xmm0, xmmword ptr [rbp]
14007ca86: movups   xmmword ptr [rdi], xmm0
14007ca89: jmp      0x14007c990
14007ca8e: mov      rcx, qword ptr [rbp - 0x58]
14007ca92: mov      rbx, qword ptr [rcx + 0xf8]
14007ca99: mov      rax, qword ptr [rcx + 0x100]
14007caa0: lea      r14, [rbx + rax*4]
14007caa4: cmp      byte ptr [rcx + 0x108], 0
14007caab: je       0x14007cb8e
14007cab1: xor      r12d, r12d
14007cab4: movsd    xmm7, qword ptr [rip + 0x5d506a4]
14007cabc: xor      esi, esi
14007cabe: xor      r13d, r13d
14007cac1: jmp      0x14007cad7
14007cac3: nop      word ptr cs:[rax + rax]
14007cad0: inc      r13d
14007cad3: mov      r15, qword ptr [rbp + 0x20]
14007cad7: cmp      r13d, r12d
14007cada: jne      0x14007cb3b
14007cadc: nop      dword ptr [rax]
14007cae0: cmp      rbx, r14
14007cae3: je       0x14007cc9c
14007cae9: mov      ecx, dword ptr [rbx]
14007caeb: add      rbx, 4
14007caef: mov      rax, qword ptr [r15 + 0x1a8]
14007caf6: lea      rcx, [rcx + rcx*8]
14007cafa: mov      r12, qword ptr [rax + rcx*8 + 0x10]
14007caff: test     r12, r12
14007cb02: je       0x14007cae0
14007cb04: lea      rax, [rax + rcx*8]
14007cb08: mov      rcx, qword ptr [rbp - 0x58]
14007cb0c: mov      rcx, qword ptr [rcx + 0x110]
14007cb13: mov      rdx, qword ptr [rax + 0x18]
14007cb17: mov      rax, qword ptr [rax + 0x38]
14007cb1b: mov      rax, qword ptr [rax + rcx*8]
14007cb1f: not      rax
14007cb22: lea      rax, [rax + rax*2]
14007cb26: shl      rax, 4
14007cb2a: mov      rsi, qword ptr [rdx + rax + 0x10]
14007cb2f: mov      rax, qword ptr [rdx + rax + 0x28]
14007cb34: mov      qword ptr [rbp + 0x28], rax
14007cb38: xor      r13d, r13d
14007cb3b: mov      r15d, r13d
14007cb3e: lea      rax, [r15 + r15*4]
14007cb42: lea      rdi, [rsi + rax*4]
14007cb46: movsd    qword ptr [rbp + 4], xmm7
14007cb4b: mov      dword ptr [rbp + 0xc], 0x3c449ba6
14007cb52: movss    dword ptr [rbp + 0x10], xmm6
14007cb57: mov      dword ptr [rbp], 0
14007cb5e: mov      rcx, rdi
14007cb61: mov      rdx, rbp
14007cb64: call     0x140087c10
14007cb69: test     al, al
14007cb6b: jne      0x14007cad0
14007cb71: mov      eax, dword ptr [rbp - 0x10]
14007cb74: mov      rcx, qword ptr [rbp + 0x28]
14007cb78: mov      dword ptr [rcx + r15*4], eax
14007cb7c: mov      eax, dword ptr [rbp + 0x10]
14007cb7f: mov      dword ptr [rdi + 0x10], eax
14007cb82: movups   xmm0, xmmword ptr [rbp]
14007cb86: movups   xmmword ptr [rdi], xmm0
14007cb89: jmp      0x14007cad0
14007cb8e: xor      r12d, r12d
14007cb91: mov      eax, 8
14007cb96: mov      qword ptr [rbp + 0x28], rax
14007cb9a: movsd    xmm7, qword ptr [rip + 0x5d505be]
14007cba2: xor      esi, esi
14007cba4: xor      r13d, r13d
14007cba7: jmp      0x14007cbb7
14007cba9: nop      dword ptr [rax]
14007cbb0: inc      r13d
14007cbb3: mov      r15, qword ptr [rbp + 0x20]
14007cbb7: cmp      r13d, r12d
14007cbba: jne      0x14007cc39
14007cbbc: nop      dword ptr [rax]
14007cbc0: cmp      rbx, r14
14007cbc3: je       0x14007cc9c
14007cbc9: mov      ecx, dword ptr [rbx]
14007cbcb: add      rbx, 4
14007cbcf: mov      rax, qword ptr [r15 + 0x108]
14007cbd6: lea      rcx, [rcx + rcx*4]
14007cbda: shl      rcx, 5
14007cbde: mov      r12, qword ptr [rax + rcx + 0x58]
14007cbe3: test     r12, r12
14007cbe6: je       0x14007cbc0
14007cbe8: add      rax, rcx
14007cbeb: mov      ecx, dword ptr [rax + 0x94]
14007cbf1: mov      rdx, qword ptr [r15 + 0x1a8]
14007cbf8: lea      rcx, [rcx + rcx*8]
14007cbfc: mov      r8, qword ptr [rbp - 0x58]
14007cc00: mov      r8, qword ptr [r8 + 0x110]
14007cc07: mov      r9, qword ptr [rdx + rcx*8 + 0x18]
14007cc0c: mov      rcx, qword ptr [rdx + rcx*8 + 0x38]
14007cc11: mov      rcx, qword ptr [rcx + r8*8]
14007cc15: not      rcx
14007cc18: lea      rcx, [rcx + rcx*2]
14007cc1c: shl      rcx, 4
14007cc20: mov      rsi, qword ptr [r9 + rcx + 0x10]
14007cc25: mov      rcx, qword ptr [r9 + rcx + 0x28]
14007cc2a: mov      qword ptr [rbp + 0x40], rcx
14007cc2e: mov      rax, qword ptr [rax + 0x50]
14007cc32: mov      qword ptr [rbp + 0x28], rax
14007cc36: xor      r13d, r13d
14007cc39: mov      eax, r13d
14007cc3c: shl      rax, 4
14007cc40: mov      rcx, qword ptr [rbp + 0x28]
14007cc44: mov      r15d, dword ptr [rcx + rax + 8]
14007cc49: not      r15d
14007cc4c: lea      rax, [r15 + r15*4]
14007cc50: lea      rdi, [rsi + rax*4]
14007cc54: movsd    qword ptr [rbp + 4], xmm7
14007cc59: mov      dword ptr [rbp + 0xc], 0x3c449ba6
14007cc60: movss    dword ptr [rbp + 0x10], xmm6
14007cc65: mov      dword ptr [rbp], 0
14007cc6c: mov      rcx, rdi
14007cc6f: mov      rdx, rbp
14007cc72: call     0x140087c10
14007cc77: test     al, al
14007cc79: jne      0x14007cbb0
14007cc7f: mov      eax, dword ptr [rbp - 0x10]
14007cc82: mov      rcx, qword ptr [rbp + 0x40]
14007cc86: mov      dword ptr [rcx + r15*4], eax
14007cc8a: mov      eax, dword ptr [rbp + 0x10]
14007cc8d: mov      dword ptr [rdi + 0x10], eax
14007cc90: movups   xmm0, xmmword ptr [rbp]
14007cc94: movups   xmmword ptr [rdi], xmm0
14007cc97: jmp      0x14007cbb0
14007cc9c: movaps   xmm6, xmmword ptr [rbp + 0x50]
14007cca0: movaps   xmm7, xmmword ptr [rbp + 0x60]
14007cca4: movaps   xmm8, xmmword ptr [rbp + 0x70]
14007cca9: movaps   xmm9, xmmword ptr [rbp + 0x80]
14007ccb1: movaps   xmm10, xmmword ptr [rbp + 0x90]
14007ccb9: add      rsp, 0x128
14007ccc0: pop      rbx
14007ccc1: pop      rdi
14007ccc2: pop      rsi
14007ccc3: pop      r12
14007ccc5: pop      r13
14007ccc7: pop      r14
14007ccc9: pop      r15
14007cccb: pop      rbp
14007cccc: ret
