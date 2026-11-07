140106ed0: push      rbp
140106ed1: push      r15
140106ed3: push      r14
140106ed5: push      r13
140106ed7: push      r12
140106ed9: push      rsi
140106eda: push      rdi
140106edb: push      rbx
140106edc: sub       rsp, 0x6b8
140106ee3: lea       rbp, [rsp + 0x80]
140106eeb: movaps    xmmword ptr [rbp + 0x620], xmm15
140106ef3: movaps    xmmword ptr [rbp + 0x610], xmm14
140106efb: movaps    xmmword ptr [rbp + 0x600], xmm13
140106f03: movaps    xmmword ptr [rbp + 0x5f0], xmm12
140106f0b: movaps    xmmword ptr [rbp + 0x5e0], xmm11
140106f13: movaps    xmmword ptr [rbp + 0x5d0], xmm10
140106f1b: movaps    xmmword ptr [rbp + 0x5c0], xmm9
140106f23: movaps    xmmword ptr [rbp + 0x5b0], xmm8
140106f2b: movaps    xmmword ptr [rbp + 0x5a0], xmm7
140106f32: movaps    xmmword ptr [rbp + 0x590], xmm6
140106f39: mov       qword ptr [rbp + 0x588], 0xfffffffffffffffe
140106f44: mov       rdi, r9
140106f47: mov       qword ptr [rbp + 0x558], r8
140106f4e: mov       r14, rdx
140106f51: lea       rdx, [rbp + 0x468]
140106f58: lea       rax, [rip + 0x5ccf9f9]
140106f5f: mov       qword ptr [rbp + 0x468], rax
140106f66: mov       qword ptr [rbp + 0x470], 7
140106f71: movaps    xmm0, xmmword ptr [rip + 0x5ccdd08]
140106f78: movups    xmmword ptr [rbp + 0x478], xmm0
140106f7f: lea       rax, [rip + 0x5ccf9d9]
140106f86: mov       qword ptr [rbp + 0x488], rax
140106f8d: mov       qword ptr [rbp + 0x490], 8
140106f98: movaps    xmm0, xmmword ptr [rip + 0x5ccdcf1]
140106f9f: movups    xmmword ptr [rbp + 0x498], xmm0
140106fa6: lea       rax, [rip + 0x5ccf9ba]
140106fad: mov       qword ptr [rbp + 0x4a8], rax
140106fb4: mov       qword ptr [rbp + 0x4b0], 0xa
140106fbf: movaps    xmm0, xmmword ptr [rip + 0x5ccdcda]
140106fc6: movups    xmmword ptr [rbp + 0x4b8], xmm0
140106fcd: lea       rax, [rip + 0x5ccf99d]
140106fd4: mov       qword ptr [rbp + 0x4c8], rax
140106fdb: mov       qword ptr [rbp + 0x4d0], 0xb
140106fe6: movdqa    xmm0, xmmword ptr [rip + 0x5ccdcc2]
140106fee: movdqu    xmmword ptr [rbp + 0x4d8], xmm0
140106ff6: lea       r13, [rbp + 0x2d8]
140106ffd: mov       rax, qword ptr [rcx]
140107000: mov       qword ptr [rbp + 0x548], rax
140107007: add       rcx, 8
14010700b: mov       qword ptr [rbp + 0x550], rcx
140107012: movabs    rax, 0x7fffffffffffffe0
14010701c: and       rax, r9
14010701f: mov       qword ptr [rbp + 0x568], rax
140107026: movabs    rax, 0x7ffffffffffffff8
140107030: and       rax, r9
140107033: mov       qword ptr [rbp + 0x560], rax
14010703a: xor       r12d, r12d
14010703d: movss     xmm6, dword ptr [rip + 0x5ccdc7b]
140107045: movss     xmm10, dword ptr [rip + 0x5ccdc76]
14010704e: movss     xmm9, dword ptr [rip + 0x5ccdc71]
140107057: pxor      xmm4, xmm4
14010705b: movaps    xmm8, xmmword ptr [rip + 0x5c9620d]
140107063: movdqa    xmm12, xmmword ptr [rip + 0x5c96184]
14010706c: movdqa    xmm13, xmmword ptr [rip + 0x5c9618b]
140107075: movdqa    xmm14, xmmword ptr [rip + 0x5c96192]
14010707e: movdqa    xmm15, xmmword ptr [rip + 0x5c96139]
140107087: movdqa    xmm11, xmmword ptr [rip + 0x5c96140]
140107090: movdqa    xmm7, xmmword ptr [rip + 0x5c96148]
140107098: cmp       r12, 4
14010709c: je        0x1401075e4
1401070a2: mov       rcx, r12
1401070a5: shl       rcx, 5
1401070a9: mov       rax, qword ptr [rdx + rcx]
1401070ad: test      rax, rax
1401070b0: je        0x1401075e4
1401070b6: mov       qword ptr [rbp + 0x540], r12
1401070bd: add       rcx, rdx
1401070c0: mov       rdx, qword ptr [rcx + 8]
1401070c4: movss     xmm0, dword ptr [rcx + 0x10]
1401070c9: mulss     xmm0, xmm6
1401070cd: movss     xmm1, dword ptr [rcx + 0x14]
1401070d2: mulss     xmm1, xmm6
1401070d6: movss     xmm2, dword ptr [rcx + 0x18]
1401070db: mulss     xmm2, xmm6
1401070df: movss     xmm3, dword ptr [rcx + 0x1c]
1401070e4: mulss     xmm3, xmm6
1401070e8: mov       qword ptr [rbp + 0x500], rax
1401070ef: mov       qword ptr [rbp + 0x508], rdx
1401070f6: addss     xmm0, xmm10
1401070fb: addss     xmm2, xmm9
140107100: addss     xmm3, xmm9
140107105: mov       word ptr [rbp + 0x3a4], 0
14010710e: mov       byte ptr [rbp + 0x394], 1
140107115: mov       dword ptr [rbp + 0x2a8], 1
14010711f: movss     dword ptr [rbp + 0x2ac], xmm0
140107127: mov       qword ptr [rbp + 0x2b0], 0
140107132: mov       dword ptr [rbp + 0x2b8], 1
14010713c: movss     dword ptr [rbp + 0x2bc], xmm1
140107144: mov       qword ptr [rbp + 0x2c0], 0
14010714f: mov       dword ptr [rbp + 0x2c8], 1
140107159: movss     dword ptr [rbp + 0x2cc], xmm2
140107161: mov       dword ptr [rbp + 0x2d0], 1
14010716b: movss     dword ptr [rbp + 0x2d4], xmm3
140107173: mov       qword ptr [rbp + 0x2a0], 0
14010717e: movdqu    xmmword ptr [r13 + 0x10], xmm4
140107184: movdqu    xmmword ptr [r13], xmm4
14010718a: mov       word ptr [r13 + 0xe4], 0
140107194: mov       dword ptr [r13 + 0xe0], 0
14010719f: movups    xmm0, xmmword ptr [rip + 0x5ccec52]
1401071a6: movups    xmmword ptr [r13 + 0x30], xmm0
1401071ab: movups    xmm0, xmmword ptr [rip + 0x5ccec36]
1401071b2: movups    xmmword ptr [r13 + 0x20], xmm0
1401071b7: movups    xmm0, xmmword ptr [rip + 0x5ccec5a]
1401071be: movups    xmmword ptr [r13 + 0x50], xmm0
1401071c3: movups    xmm0, xmmword ptr [rip + 0x5ccec3e]
1401071ca: movups    xmmword ptr [r13 + 0x40], xmm0
1401071cf: movups    xmm0, xmmword ptr [rip + 0x5ccec62]
1401071d6: movups    xmmword ptr [r13 + 0x70], xmm0
1401071db: movups    xmm0, xmmword ptr [rip + 0x5ccec46]
1401071e2: movups    xmmword ptr [r13 + 0x60], xmm0
1401071e7: movups    xmm0, xmmword ptr [rip + 0x5ccec6a]
1401071ee: movups    xmmword ptr [r13 + 0x90], xmm0
1401071f6: movups    xmm0, xmmword ptr [rip + 0x5ccec4b]
1401071fd: movups    xmmword ptr [r13 + 0x80], xmm0
140107205: mov       word ptr [rbp + 0x3b6], 0
14010720e: mov       dword ptr [rbp + 0x3b2], 0x100
140107218: mov       qword ptr [rbp + 0x398], 0
140107223: mov       dword ptr [rbp + 0x3a0], 0x3f800000
14010722d: movups    xmmword ptr [rbp + 0x378], xmm8
140107235: mov       dword ptr [rbp + 0x388], 1
14010723f: mov       qword ptr [rbp + 0x38c], 0
14010724a: movups    xmm0, xmmword ptr [rip + 0x5cceadf]
140107251: movaps    xmmword ptr [rbp + 0x240], xmm0
140107258: mov       qword ptr [rbp + 0x250], 0
140107263: movups    xmm0, xmmword ptr [rip + 0x5cceade]
14010726a: movups    xmmword ptr [r13 - 0x80], xmm0
14010726f: mov       qword ptr [r13 - 0x70], 0
140107277: movups    xmm0, xmmword ptr [rip + 0x5cceae2]
14010727e: movups    xmmword ptr [r13 - 0x68], xmm0
140107283: mov       qword ptr [r13 - 0x58], 0
14010728b: movdqu    xmm0, xmmword ptr [rip + 0x5cceae5]
140107293: movdqu    xmmword ptr [r13 - 0x50], xmm0
140107299: mov       qword ptr [r13 - 0x40], 0
1401072a1: mov       dword ptr [r13 + 0xce], 0x10000
1401072ac: mov       word ptr [r13 + 0xd2], 0
1401072b6: mov       word ptr [r13 + 0xd8], 0
1401072c0: mov       dword ptr [r13 + 0xd4], 0x10000
1401072cb: test      rdi, rdi
1401072ce: js        0x1401075d3
1401072d4: je        0x140107329
1401072d6: mov       r15, r14
1401072d9: mov       r14, qword ptr [rbp + 0x558]
1401072e0: call      0x140002200
1401072e5: mov       r12d, 1
1401072eb: mov       edx, 1
1401072f0: mov       rcx, rdi
1401072f3: call      0x1400021c0
1401072f8: test      rax, rax
1401072fb: je        0x140107646
140107301: mov       rsi, rax
140107304: mov       rcx, rax
140107307: mov       rdx, r14
14010730a: mov       r8, rdi
14010730d: call      0x145bfa0e7
140107312: cmp       rdi, 8
140107316: jae       0x14010733a
140107318: xor       eax, eax
14010731a: mov       r14, r15
14010731d: lea       r12, [rbp + 0x570]
140107324: jmp       0x1401075b9
140107329: mov       esi, 1
14010732e: lea       r12, [rbp + 0x570]
140107335: jmp       0x140107420
14010733a: cmp       rdi, 0x20
14010733e: mov       r14, r15
140107341: lea       r12, [rbp + 0x570]
140107348: jae       0x140107351
14010734a: xor       ecx, ecx
14010734c: jmp       0x1401073d4
140107351: xor       eax, eax
140107353: mov       rcx, qword ptr [rbp + 0x568]
14010735a: nop       word ptr [rax + rax]
140107360: movdqu    xmm0, xmmword ptr [rsi + rax]
140107365: movdqu    xmm1, xmmword ptr [rsi + rax + 0x10]
14010736b: movdqa    xmm2, xmm0
14010736f: paddb     xmm2, xmm15
140107374: movdqa    xmm3, xmm1
140107378: paddb     xmm3, xmm15
14010737d: movdqa    xmm4, xmm2
140107381: pminub    xmm4, xmm11
140107386: pcmpeqb   xmm4, xmm2
14010738a: pand      xmm4, xmm7
14010738e: movdqa    xmm2, xmm3
140107392: pminub    xmm2, xmm11
140107397: pcmpeqb   xmm2, xmm3
14010739b: pand      xmm2, xmm7
14010739f: por       xmm4, xmm0
1401073a3: por       xmm2, xmm1
1401073a7: movdqu    xmmword ptr [rsi + rax], xmm4
1401073ac: movdqu    xmmword ptr [rsi + rax + 0x10], xmm2
1401073b2: add       rax, 0x20
1401073b6: cmp       rcx, rax
1401073b9: jne       0x140107360
1401073bb: cmp       rdi, rcx
1401073be: je        0x140107420
1401073c0: mov       rax, qword ptr [rbp + 0x568]
1401073c7: mov       rcx, rax
1401073ca: test      dil, 0x18
1401073ce: je        0x1401075b9
1401073d4: mov       rax, qword ptr [rbp + 0x560]
1401073db: nop       dword ptr [rax + rax]
1401073e0: movq      xmm0, qword ptr [rsi + rcx]
1401073e5: movdqa    xmm1, xmm0
1401073e9: paddb     xmm1, xmm12
1401073ee: movdqa    xmm2, xmm1
1401073f2: pmaxub    xmm2, xmm13
1401073f7: pcmpeqb   xmm2, xmm1
1401073fb: pandn     xmm2, xmm14
140107400: por       xmm2, xmm0
140107404: movq      qword ptr [rsi + rcx], xmm2
140107409: add       rcx, 8
14010740d: cmp       rax, rcx
140107410: jne       0x1401073e0
140107412: jmp       0x1401075b0
140107417: nop       word ptr [rax + rax]
140107420: mov       qword ptr [rbp + 0x570], rdi
140107427: mov       qword ptr [rbp + 0x578], rsi
14010742e: mov       qword ptr [rbp + 0x580], rdi
140107435: mov       qword ptr [rbp + 0x510], r12
14010743c: lea       rax, [rip - 0x105363]
140107443: mov       qword ptr [rbp + 0x518], rax
14010744a: lea       rax, [rbp + 0x500]
140107451: mov       qword ptr [rbp + 0x520], rax
140107458: lea       rax, [rip - 0x10539f]
14010745f: mov       qword ptr [rbp + 0x528], rax
140107466: lea       rcx, [rbp + 0x4e8]
14010746d: lea       rdx, [rip + 0x5ccf508]
140107474: lea       r8, [rbp + 0x510]
14010747b: call      0x145bcce30
140107480: nop
140107481: mov       rdx, qword ptr [rbp + 0x570]
140107488: test      rdx, rdx
14010748b: je        0x14010749f
14010748d: mov       rcx, qword ptr [rbp + 0x578]
140107494: mov       r8d, 1
14010749a: call      0x1400021d0
14010749f: mov       rax, qword ptr [rbp + 0x4f8]
1401074a6: mov       qword ptr [rbp + 0x520], rax
1401074ad: movups    xmm0, xmmword ptr [rbp + 0x4e8]
1401074b4: movaps    xmmword ptr [rbp + 0x510], xmm0
1401074bb: lea       rax, [rip + 0x5cd1796]
1401074c2: mov       qword ptr [rsp + 0x20], rax
1401074c7: mov       r9d, 1
1401074cd: mov       rcx, r12
1401074d0: mov       r15, r14
1401074d3: mov       rdx, r14
1401074d6: lea       r8, [rbp + 0x510]
1401074dd: call      0x140125ff0
1401074e2: nop
1401074e3: lea       r14, [rbp + 0x1b8]
1401074ea: mov       rcx, r14
1401074ed: mov       rdx, r12
1401074f0: call      0x1426eca60
1401074f5: nop
1401074f6: mov       r12, qword ptr [rbp + 0x540]
1401074fd: inc       r12
140107500: mov       dword ptr [rbp + 0x1f0], 0
14010750a: movdqa    xmm0, xmmword ptr [rip + 0x5ccd7be]
140107512: movdqu    xmmword ptr [rbp + 0x1f4], xmm0
14010751a: mov       r8d, 0x180
140107520: lea       rbx, [rbp - 0x50]
140107524: mov       rcx, rbx
140107527: lea       rdx, [rbp + 0x240]
14010752e: call      0x145bfa0e7
140107533: mov       r8d, 0x88
140107539: lea       rcx, [rbp + 0x130]
140107540: mov       rdx, r14
140107543: call      0x145bfa0e7
140107548: mov       r8d, 0x208
14010754e: lea       rcx, [rbp + 0x248]
140107555: mov       rdx, rbx
140107558: call      0x145bfa0e7
14010755d: mov       rax, qword ptr [rbp + 0x548]
140107564: mov       qword ptr [rbp + 0x240], rax
14010756b: lea       rcx, [rbp + 0x510]
140107572: mov       rdx, qword ptr [rbp + 0x550]
140107579: lea       r8, [rbp + 0x240]
140107580: lea       r9, [rip + 0x5ccdea9]
140107587: call      0x1401e23a0
14010758c: pxor      xmm4, xmm4
140107590: mov       r14, r15
140107593: lea       rdx, [rbp + 0x468]
14010759a: cmp       r12, 4
14010759e: jne       0x1401070a2
1401075a4: jmp       0x1401075e4
1401075a6: nop       word ptr cs:[rax + rax]
1401075b0: cmp       rdi, rax
1401075b3: je        0x140107420
1401075b9: movzx     ecx, byte ptr [rsi + rax]
1401075bd: lea       edx, [rcx - 0x41]
1401075c0: cmp       dl, 0x1a
1401075c3: setb      dl
1401075c6: shl       dl, 5
1401075c9: or        dl, cl
1401075cb: mov       byte ptr [rsi + rax], dl
1401075ce: inc       rax
1401075d1: jmp       0x1401075b0
1401075d3: xor       r12d, r12d
1401075d6: mov       rcx, r12
1401075d9: mov       rdx, rsi
1401075dc: call      0x145d992bb
1401075e1: nop
1401075e2: ud2
1401075e4: movaps    xmm6, xmmword ptr [rbp + 0x590]
1401075eb: movaps    xmm7, xmmword ptr [rbp + 0x5a0]
1401075f2: movaps    xmm8, xmmword ptr [rbp + 0x5b0]
1401075fa: movaps    xmm9, xmmword ptr [rbp + 0x5c0]
140107602: movaps    xmm10, xmmword ptr [rbp + 0x5d0]
14010760a: movaps    xmm11, xmmword ptr [rbp + 0x5e0]
140107612: movaps    xmm12, xmmword ptr [rbp + 0x5f0]
14010761a: movaps    xmm13, xmmword ptr [rbp + 0x600]
140107622: movaps    xmm14, xmmword ptr [rbp + 0x610]
14010762a: movaps    xmm15, xmmword ptr [rbp + 0x620]
140107632: add       rsp, 0x6b8
140107639: pop       rbx
14010763a: pop       rdi
14010763b: pop       rsi
14010763c: pop       r12
14010763e: pop       r13
140107640: pop       r14
140107642: pop       r15
140107644: pop       rbp
140107645: ret
140107646: mov       rsi, rdi
140107649: jmp       0x1401075d6
