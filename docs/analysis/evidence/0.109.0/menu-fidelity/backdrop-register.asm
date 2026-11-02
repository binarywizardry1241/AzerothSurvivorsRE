1400701d0: push     rbp
1400701d1: push     r15
1400701d3: push     r14
1400701d5: push     rsi
1400701d6: push     rdi
1400701d7: push     rbx
1400701d8: sub      rsp, 0x328
1400701df: lea      rbp, [rsp + 0x80]
1400701e7: mov      qword ptr [rbp + 0x2a0], 0xfffffffffffffffe
1400701f2: mov      rsi, rcx
1400701f5: lea      rdi, [rcx + 0x40]
1400701f9: lea      rax, [rcx + 0x5a8]
140070200: mov      qword ptr [rbp + 0x238], rdi
140070207: mov      qword ptr [rbp + 0x240], rax
14007020e: mov      qword ptr [rbp + 0x220], 0
140070219: mov      qword ptr [rbp + 0x228], 8
140070224: mov      qword ptr [rbp + 0x230], 0
14007022f: cmp      qword ptr [rcx + 0x90], 0
140070237: je       0x1400702db
14007023d: movabs   rdx, 0x5ad1703cb9f182f4
140070247: mov      rcx, qword ptr [rsi + 0x78]
14007024b: mov      r8, qword ptr [rsi + 0x80]
140070252: xor      r9d, r9d
140070255: movdqa   xmm0, xmmword ptr [rip + 0x5d2d403]
14007025d: pcmpeqd  xmm1, xmm1
140070261: movdqa   xmm2, xmmword ptr [rip + 0x5d2d8a7]
140070269: and      rdx, r8
14007026c: movdqu   xmm3, xmmword ptr [rcx + rdx]
140070271: movdqa   xmm4, xmm3
140070275: pcmpeqb  xmm4, xmm0
140070279: pmovmskb r10d, xmm4
14007027e: test     r10d, r10d
140070281: je       0x1400702c0
140070283: tzcnt    r11d, r10d
140070288: add      r11, rdx
14007028b: and      r11, r8
14007028e: neg      r11
140070291: lea      r11, [r11 + r11*2]
140070295: movdqu   xmm4, xmmword ptr [rcx + r11*8 - 0x18]
14007029c: pcmpeqb  xmm4, xmm2
1400702a0: pmovmskb ebx, xmm4
1400702a4: cmp      ebx, 0xffff
1400702aa: je       0x14007038f
1400702b0: lea      r11d, [r10 - 1]
1400702b4: and      r11w, r10w
1400702b8: mov      r10d, r11d
1400702bb: jne      0x140070283
1400702bd: nop      dword ptr [rax]
1400702c0: pcmpeqb  xmm3, xmm1
1400702c4: pmovmskb r10d, xmm3
1400702c9: test     r10d, r10d
1400702cc: jne      0x1400702db
1400702ce: add      rdx, r9
1400702d1: add      rdx, 0x10
1400702d5: add      r9, 0x10
1400702d9: jmp      0x140070269
1400702db: movzx    ecx, byte ptr [rsi + 0xa0]
1400702e2: mov      rcx, qword ptr [rsi + 0xe0]
1400702e9: mov      rdx, qword ptr [rsi + 0xe8]
1400702f0: movabs   r8, 0x5ad1703cb9f182f4
1400702fa: xor      r9d, r9d
1400702fd: movdqa   xmm0, xmmword ptr [rip + 0x5d2d35b]
140070305: pcmpeqd  xmm1, xmm1
140070309: movdqa   xmm2, xmmword ptr [rip + 0x5d2d7ff]
140070311: and      r8, rdx
140070314: movdqu   xmm3, xmmword ptr [rcx + r8]
14007031a: movdqa   xmm4, xmm3
14007031e: pcmpeqb  xmm4, xmm0
140070322: pmovmskb ebx, xmm4
140070326: test     ebx, ebx
140070328: je       0x140070370
14007032a: tzcnt    r11d, ebx
14007032f: add      r11, r8
140070332: and      r11, rdx
140070335: mov      r14, r11
140070338: shl      r14, 7
14007033c: mov      r10, rcx
14007033f: sub      r10, r14
140070342: movdqu   xmm4, xmmword ptr [r10 - 0x80]
140070348: pcmpeqb  xmm4, xmm2
14007034c: pmovmskb r14d, xmm4
140070351: cmp      r14d, 0xffff
140070358: je       0x1400703ac
14007035a: lea      r10d, [rbx - 1]
14007035e: and      r10w, bx
140070362: mov      ebx, r10d
140070365: jne      0x14007032a
140070367: nop      word ptr [rax + rax]
140070370: pcmpeqb  xmm3, xmm1
140070374: pmovmskb r10d, xmm3
140070379: test     r10d, r10d
14007037c: jne      0x14007041e
140070382: add      r8, r9
140070385: add      r8, 0x10
140070389: add      r9, 0x10
14007038d: jmp      0x140070311
14007038f: lea      rax, [rcx + r11*8]
140070393: mov      rbx, qword ptr [rax - 8]
140070397: mov      rdx, qword ptr [rbp + 0x220]
14007039e: test     rdx, rdx
1400703a1: jne      0x14007049b
1400703a7: jmp      0x1400704b1
1400703ac: lea      r8, [r11 - 0x10]
1400703b0: and      r8, rdx
1400703b3: movdqu   xmm0, xmmword ptr [rcx + r8]
1400703b9: pcmpeqd  xmm1, xmm1
1400703bd: pcmpeqb  xmm0, xmm1
1400703c1: pmovmskb edx, xmm0
1400703c5: movdqu   xmm0, xmmword ptr [rcx + r11]
1400703cb: pcmpeqb  xmm0, xmm1
1400703cf: pmovmskb r9d, xmm0
1400703d4: mov      bx, 0x1f
1400703d8: bsr      bx, dx
1400703dc: xor      ebx, 0xf
1400703df: or       r9d, 0x10000
1400703e6: tzcnt    r9d, r9d
1400703eb: add      r9d, ebx
1400703ee: mov      dl, 0x80
1400703f0: cmp      r9w, 0xf
1400703f5: ja       0x140070400
1400703f7: inc      qword ptr [rsi + 0xf0]
1400703fe: mov      dl, 0xff
140070400: mov      byte ptr [rcx + r11], dl
140070404: mov      byte ptr [rcx + r8 + 0x10], dl
140070409: dec      qword ptr [rsi + 0xf8]
140070410: mov      rcx, qword ptr [r10 - 0x70]
140070414: cmp      rcx, 2
140070418: jne      0x1400707a6
14007041e: mov      rbx, qword ptr [rax]
140070421: lea      rcx, [rbx + 1]
140070425: mov      qword ptr [rax], rcx
140070428: mov      word ptr [rbp - 8], 0x100
14007042e: mov      qword ptr [rbp - 0x58], 1
140070436: movdqu   xmm0, xmmword ptr [rip + 0x5d5cf42]
14007043e: movdqu   xmmword ptr [rbp - 0x50], xmm0
140070443: mov      qword ptr [rbp - 0x30], 8
14007044b: mov      qword ptr [rbp - 0x28], 0x20
140070453: mov      qword ptr [rbp - 0x10], 0
14007045b: mov      byte ptr [rbp - 6], 1
14007045f: mov      qword ptr [rbp - 0x40], 0
140070467: mov      byte ptr [rbp - 0x20], 2
14007046b: lea      r8, [rbp - 0x58]
14007046f: mov      rcx, rdi
140070472: mov      rdx, rbx
140070475: call     0x14000f330
14007047a: nop
14007047b: lea      rcx, [rsi + 0x78]
14007047f: lea      rdx, [rip + 0x5d5cefa]
140070486: mov      r8, rbx
140070489: call     0x14000f180
14007048e: nop
14007048f: mov      rdx, qword ptr [rbp + 0x220]
140070496: test     rdx, rdx
140070499: je       0x1400704b1
14007049b: mov      rcx, qword ptr [rbp + 0x228]
1400704a2: shl      rdx, 3
1400704a6: mov      r8d, 8
1400704ac: call     0x1400021d0
1400704b1: cmp      rbx, qword ptr [rsi + 0x218]
1400704b8: jae      0x1400704df
1400704ba: mov      rax, qword ptr [rsi + 0x210]
1400704c1: mov      rax, qword ptr [rax + rbx*8]
1400704c5: test     rax, rax
1400704c8: je       0x1400704df
1400704ca: mov      rcx, qword ptr [rsi + 0x1e0]
1400704d1: not      rax
1400704d4: imul     rax, rax, 0x38
1400704d8: cmp      byte ptr [rcx + rax + 0x30], 0
1400704dd: jne      0x14007055a
1400704df: lea      r14, [rsi + 0x1d8]
1400704e6: mov      qword ptr [rbp - 0x58], 0
1400704ee: mov      dword ptr [rbp - 0x40], 0
1400704f5: mov      byte ptr [rbp - 0x3c], 0
1400704f9: mov      r15d, dword ptr [rsi + 0x5b0]
140070500: mov      rcx, rsi
140070503: call     0x144e65ff0
140070508: mov      qword ptr [rbp + 0x220], rbx
14007050f: lea      r9, [rbp + 0x220]
140070516: mov      rcx, r14
140070519: mov      rdx, rbx
14007051c: mov      r8, rdi
14007051f: call     0x1400e99b0
140070524: mov      rdi, rax
140070527: cmp      byte ptr [rax + 0x30], 1
14007052b: jne      0x14007053d
14007052d: lea      r8, [rbp - 0x58]
140070531: mov      rcx, rdi
140070534: xor      edx, edx
140070536: call     0x144e7e940
14007053b: jmp      0x140070556
14007053d: mov      r8, qword ptr [rdi + 8]
140070541: mov      rcx, qword ptr [rdi + 0x10]
140070545: lea      rdx, [rbp - 0x58]
140070549: call     0x145bfa0ed
14007054e: mov      dword ptr [rdi + 0x28], r15d
140070552: mov      byte ptr [rdi + 0x30], 1
140070556: mov      dword ptr [rdi + 0x2c], r15d
14007055a: call     0x140002200
14007055f: mov      ecx, 0xe0
140070564: mov      edx, 8
140070569: call     0x1400021c0
14007056e: test     rax, rax
140070571: je       0x140070819
140070577: mov      qword ptr [rbp + 0x298], rax
14007057e: call     0x140002200
140070583: mov      ecx, 0xc
140070588: mov      edx, 4
14007058d: call     0x1400021c0
140070592: test     rax, rax
140070595: je       0x14007082a
14007059b: mov      dword ptr [rax], 0
1400705a1: mov      byte ptr [rax + 4], 0
1400705a5: mov      byte ptr [rax + 8], 2
1400705a9: lea      r8, [rip + 0x5d5ffb0]
1400705b0: lea      rcx, [rbp + 0x220]
1400705b7: mov      rdx, rax
1400705ba: call     0x144e1fc30
1400705bf: nop
1400705c0: mov      qword ptr [rbp + 0x98], 0xffffffffffffffff
1400705cb: mov      dword ptr [rbp + 0x218], 0
1400705d5: mov      byte ptr [rbp + 0x21c], 0
1400705dc: call     0x140002200
1400705e1: mov      ecx, 0x278
1400705e6: mov      edx, 8
1400705eb: call     0x1400021c0
1400705f0: test     rax, rax
1400705f3: je       0x14007083c
1400705f9: mov      rdi, rax
1400705fc: lea      rdx, [rbp - 0x58]
140070600: mov      r8d, 0x278
140070606: mov      rcx, rax
140070609: call     0x145bfa0e7
14007060e: nop
14007060f: lea      r8, [rip + 0x5d5fea2]
140070616: lea      rcx, [rbp - 0x58]
14007061a: mov      rdx, rdi
14007061d: call     0x144e1fc30
140070622: nop
140070623: movups   xmm0, xmmword ptr [rbp + 0x280]
14007062a: mov      rax, qword ptr [rbp + 0x298]
140070631: movups   xmmword ptr [rax + 0x60], xmm0
140070635: movups   xmm0, xmmword ptr [rbp + 0x270]
14007063c: movups   xmmword ptr [rax + 0x50], xmm0
140070640: movups   xmm0, xmmword ptr [rbp + 0x260]
140070647: movups   xmmword ptr [rax + 0x40], xmm0
14007064b: movups   xmm0, xmmword ptr [rbp + 0x220]
140070652: movups   xmm1, xmmword ptr [rbp + 0x230]
140070659: movups   xmm2, xmmword ptr [rbp + 0x240]
140070660: movups   xmm3, xmmword ptr [rbp + 0x250]
140070667: movups   xmmword ptr [rax + 0x30], xmm3
14007066b: movups   xmmword ptr [rax + 0x20], xmm2
14007066f: movups   xmmword ptr [rax + 0x10], xmm1
140070673: movups   xmmword ptr [rax], xmm0
140070676: movups   xmm0, xmmword ptr [rbp - 0x58]
14007067a: movups   xmm1, xmmword ptr [rbp - 0x48]
14007067e: movups   xmm2, xmmword ptr [rbp - 0x38]
140070682: movups   xmm3, xmmword ptr [rbp - 0x28]
140070686: movups   xmmword ptr [rax + 0x70], xmm0
14007068a: movups   xmmword ptr [rax + 0x80], xmm1
140070691: movups   xmmword ptr [rax + 0x90], xmm2
140070698: movups   xmmword ptr [rax + 0xa0], xmm3
14007069f: movups   xmm0, xmmword ptr [rbp - 0x18]
1400706a3: movups   xmmword ptr [rax + 0xb0], xmm0
1400706aa: movups   xmm0, xmmword ptr [rbp - 8]
1400706ae: movups   xmmword ptr [rax + 0xc0], xmm0
1400706b5: movups   xmm0, xmmword ptr [rbp + 8]
1400706b9: movups   xmmword ptr [rax + 0xd0], xmm0
1400706c0: mov      qword ptr [rbp - 0x50], 2
1400706c8: mov      qword ptr [rbp - 0x48], rax
1400706cc: mov      qword ptr [rbp - 0x40], 2
1400706d4: mov      qword ptr [rbp - 0x38], 0
1400706dc: mov      qword ptr [rbp - 0x30], 8
1400706e4: xorps    xmm0, xmm0
1400706e7: movups   xmmword ptr [rbp - 0x28], xmm0
1400706eb: mov      qword ptr [rbp - 0x58], 0xffffffffffffffff
1400706f3: lea      rcx, [rbp - 0x20]
1400706f7: call     0x144e9bf10
1400706fc: nop
1400706fd: movups   xmm0, xmmword ptr [rbp + 8]
140070701: movaps   xmmword ptr [rbp + 0x280], xmm0
140070708: movups   xmm0, xmmword ptr [rbp - 8]
14007070c: movaps   xmmword ptr [rbp + 0x270], xmm0
140070713: movups   xmm0, xmmword ptr [rbp - 0x18]
140070717: movaps   xmmword ptr [rbp + 0x260], xmm0
14007071e: movups   xmm0, xmmword ptr [rbp - 0x58]
140070722: movups   xmm1, xmmword ptr [rbp - 0x48]
140070726: movups   xmm2, xmmword ptr [rbp - 0x38]
14007072a: movups   xmm3, xmmword ptr [rbp - 0x28]
14007072e: movaps   xmmword ptr [rbp + 0x250], xmm3
140070735: movaps   xmmword ptr [rbp + 0x240], xmm2
14007073c: movaps   xmmword ptr [rbp + 0x230], xmm1
140070743: movaps   xmmword ptr [rbp + 0x220], xmm0
14007074a: lea      rdx, [rbp + 0x220]
140070751: mov      rcx, rsi
140070754: call     0x1400b4130
140070759: lea      rdx, [rip + 0x5d5f0bd]
140070760: lea      rcx, [rbp - 0x58]
140070764: mov      r8d, 0x17
14007076a: call     0x145bb9990
14007076f: mov      rdx, qword ptr [rbp - 0x58]
140070773: cmp      rdx, -1
140070777: je       0x140070796
140070779: test     rdx, rdx
14007077c: je       0x14007078d
14007077e: mov      rcx, qword ptr [rbp - 0x50]
140070782: mov      r8d, 1
140070788: call     0x1400021d0
14007078d: mov      rcx, rsi
140070790: call     0x1400b33c0
140070795: nop
140070796: add      rsp, 0x328
14007079d: pop      rbx
14007079e: pop      rdi
14007079f: pop      rsi
1400707a0: pop      r14
1400707a2: pop      r15
1400707a4: pop      rbp
1400707a5: ret
1400707a6: mov      rax, qword ptr [r10 - 8]
1400707aa: mov      qword ptr [rbp + 0x10], rax
1400707ae: movups   xmm0, xmmword ptr [r10 - 0x18]
1400707b3: movups   xmmword ptr [rbp], xmm0
1400707b7: movups   xmm0, xmmword ptr [r10 - 0x28]
1400707bc: movups   xmmword ptr [rbp - 0x10], xmm0
1400707c0: movdqu   xmm0, xmmword ptr [r10 - 0x68]
1400707c6: movdqu   xmm1, xmmword ptr [r10 - 0x58]
1400707cc: movdqu   xmm2, xmmword ptr [r10 - 0x48]
1400707d2: movdqu   xmm3, xmmword ptr [r10 - 0x38]
1400707d8: movdqu   xmmword ptr [rbp - 0x20], xmm3
1400707dd: movdqu   xmmword ptr [rbp - 0x30], xmm2
1400707e2: movdqu   xmmword ptr [rbp - 0x40], xmm1
1400707e7: movdqu   xmmword ptr [rbp - 0x50], xmm0
1400707ec: mov      qword ptr [rbp - 0x58], rcx
1400707f0: lea      rcx, [rbp - 0x58]
1400707f4: lea      rdx, [rbp + 0x220]
1400707fb: call     0x144e08f20
140070800: nop
140070801: mov      rbx, rax
140070804: mov      rdx, qword ptr [rbp + 0x220]
14007080b: test     rdx, rdx
14007080e: jne      0x14007049b
140070814: jmp      0x1400704b1
140070819: mov      ecx, 8
14007081e: mov      edx, 0xe0
140070823: call     0x145d992a1
140070828: ud2
14007082a: mov      ecx, 4
14007082f: mov      edx, 0xc
140070834: call     0x145d992a1
140070839: nop
14007083a: jmp      0x14007084c
14007083c: mov      ecx, 8
140070841: mov      edx, 0x278
140070846: call     0x145d992a1
14007084b: nop
14007084c: ud2
