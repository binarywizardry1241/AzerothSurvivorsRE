1401982b0: push      r15
1401982b2: push      r14
1401982b4: push      r13
1401982b6: push      r12
1401982b8: push      rsi
1401982b9: push      rdi
1401982ba: push      rbp
1401982bb: push      rbx
1401982bc: sub       rsp, 0x178
1401982c3: movaps    xmmword ptr [rsp + 0x160], xmm13
1401982cc: movaps    xmmword ptr [rsp + 0x150], xmm12
1401982d5: movaps    xmmword ptr [rsp + 0x140], xmm11
1401982de: movaps    xmmword ptr [rsp + 0x130], xmm10
1401982e7: movaps    xmmword ptr [rsp + 0x120], xmm9
1401982f0: movaps    xmmword ptr [rsp + 0x110], xmm8
1401982f9: movaps    xmmword ptr [rsp + 0x100], xmm7
140198301: movaps    xmmword ptr [rsp + 0xf0], xmm6
140198309: mov       rax, qword ptr [rsp + 0x1e8]
140198311: mov       rcx, qword ptr [rsp + 0x1e0]
140198319: mov       r14, qword ptr [rdx]
14019831c: mov       rbp, qword ptr [rdx + 8]
140198320: mov       r15d, dword ptr [rdx + 0x10]
140198324: mov       edx, dword ptr [rdx + 0x14]
140198327: mov       dword ptr [rsp + 0x38], edx
14019832b: mov       r12, qword ptr [r8]
14019832e: mov       r13, qword ptr [r8 + 8]
140198332: mov       edx, dword ptr [r8 + 0x10]
140198336: mov       dword ptr [rsp + 0x60], edx
14019833a: mov       edx, dword ptr [r8 + 0x14]
14019833e: mov       dword ptr [rsp + 0x5c], edx
140198342: mov       rdx, qword ptr [r9]
140198345: mov       qword ptr [rsp + 0x50], rdx
14019834a: mov       rdx, qword ptr [r9 + 8]
14019834e: mov       qword ptr [rsp + 0x48], rdx
140198353: mov       rdx, qword ptr [rcx]
140198356: mov       qword ptr [rsp + 0x68], rdx
14019835b: mov       rdx, qword ptr [rcx + 8]
14019835f: mov       qword ptr [rsp + 0x80], rdx
140198367: mov       ecx, dword ptr [rcx + 0x14]
14019836a: mov       dword ptr [rsp + 0x9c], ecx
140198371: mov       rdx, qword ptr [rax]
140198374: mov       r8, qword ptr [rax + 8]
140198378: mov       rax, qword ptr [rsp + 0x1f0]
140198380: mov       rbx, qword ptr [rax]
140198383: mov       rax, qword ptr [rsp + 0x1f8]
14019838b: mov       rcx, qword ptr [rax]
14019838e: mov       qword ptr [rsp + 0x90], rcx
140198396: mov       rsi, qword ptr [rax + 0x10]
14019839a: mov       edi, dword ptr [rax + 0x1c]
14019839d: lea       rcx, [rsp + 0xb0]
1401983a5: call      0x140180b10
1401983aa: cmp       byte ptr [rsp + 0xb0], 1
1401983b2: je        0x140198a35
1401983b8: mov       rdx, qword ptr [rsp + 0xb8]
1401983c0: cmp       dword ptr [rdx], 1
1401983c3: mov       qword ptr [rsp + 0xe8], rdx
1401983cb: jne       0x14019843e
1401983cd: movsd     xmm1, qword ptr [rdx + 8]
1401983d2: xorpd     xmm2, xmm2
1401983d6: ucomisd   xmm1, xmm2
1401983da: jb        0x14019843e
1401983dc: movsd     xmm0, qword ptr [rdx + 0x10]
1401983e1: ucomisd   xmm0, xmm2
1401983e5: jb        0x14019843e
1401983e7: mov       eax, dword ptr [rdx + 0xc0]
1401983ed: xorps     xmm2, xmm2
1401983f0: cvtsi2sd  xmm2, rax
1401983f5: ucomisd   xmm2, xmm1
1401983f9: jbe       0x14019843e
1401983fb: mov       eax, dword ptr [rdx + 0xc4]
140198401: xorps     xmm1, xmm1
140198404: cvtsi2sd  xmm1, rax
140198409: ucomisd   xmm1, xmm0
14019840d: jbe       0x14019843e
14019840f: mov       dword ptr [rsp + 0x58], edi
140198413: mov       qword ptr [rsp + 0x78], rsi
140198418: cvtsd2ss  xmm6, xmm0
14019841c: lea       rax, [rdx + 0xc8]
140198423: lea       rcx, [rdx + 0xbc]
14019842a: cmp       byte ptr [rdx + 0xb8], 0
140198431: cmovne    rax, rcx
140198435: divss     xmm6, dword ptr [rax]
140198439: jmp       0x1401984ec
14019843e: lea       rcx, [rsp + 0xb0]
140198446: mov       rdx, rbx
140198449: call      0x14361df00
14019844e: mov       rax, qword ptr [rsp + 0xd0]
140198456: test      rax, rax
140198459: je        0x140198a35
14019845f: movzx     edx, word ptr [rsp + 0xc8]
140198467: mov       rcx, qword ptr [rsp + 0xb0]
14019846f: test      dx, dx
140198472: jne       0x1401984ac
140198474: mov       r8, qword ptr [rsp + 0xb8]
14019847c: nop       dword ptr [rax]
140198480: movdqa    xmm0, xmmword ptr [r8]
140198485: add       rcx, -0x880
14019848c: add       r8, 0x10
140198490: pmovmskb  edx, xmm0
140198494: xor       edx, 0xffff
14019849a: je        0x140198480
14019849c: mov       qword ptr [rsp + 0xb8], r8
1401984a4: mov       qword ptr [rsp + 0xb0], rcx
1401984ac: mov       dword ptr [rsp + 0x58], edi
1401984b0: mov       qword ptr [rsp + 0x78], rsi
1401984b5: lea       r8d, [rdx - 1]
1401984b9: tzcnt     r9d, edx
1401984be: and       r8d, edx
1401984c1: mov       word ptr [rsp + 0xc8], r8w
1401984ca: mov       rdx, r9
1401984cd: neg       rdx
1401984d0: shl       r9d, 3
1401984d4: shl       rdx, 7
1401984d8: sub       rdx, r9
1401984db: dec       rax
1401984de: mov       qword ptr [rsp + 0xd0], rax
1401984e6: movss     xmm6, dword ptr [rcx + rdx - 4]
1401984ec: mov       rbx, qword ptr [r14 + 0xf8]
1401984f3: mov       rax, qword ptr [r14 + 0x100]
1401984fa: lea       rdi, [rbx + rax*4]
1401984fe: mov       eax, dword ptr [rsp + 0x38]
140198502: sub       eax, r15d
140198505: cmp       eax, 0xc233b000
14019850a: mov       r15d, 0xc233b000
140198510: cmovb     r15d, eax
140198514: cmp       byte ptr [r14 + 0x108], 0
14019851c: je        0x140198741
140198522: xor       ecx, ecx
140198524: xor       edx, edx
140198526: xor       eax, eax
140198528: mov       qword ptr [rsp + 0x28], 0
140198531: mov       qword ptr [rsp + 0x30], 0
14019853a: jmp       0x140198571
14019853c: nop       dword ptr [rax]
140198540: mov       qword ptr [rsp + 0x28], 0
140198549: mov       rdx, qword ptr [r14 + 0x128]
140198550: call      0x144e4f270
140198555: mov       rdx, qword ptr [rsi]
140198558: xor       ecx, ecx
14019855a: mov       r8d, ecx
14019855d: inc       ecx
14019855f: mov       r9d, dword ptr [rsp + 0x38]
140198564: sub       r9d, dword ptr [rax + r8*4]
140198568: cmp       r9d, r15d
14019856b: jb        0x14019869a
140198571: cmp       ecx, edx
140198573: jne       0x14019855a
140198575: cmp       rbx, rdi
140198578: je        0x140198688
14019857e: mov       r8d, dword ptr [rbx]
140198581: add       rbx, 4
140198585: mov       rdx, qword ptr [rbp + 0x1a8]
14019858c: lea       r8, [r8 + r8*8]
140198590: cmp       qword ptr [rdx + r8*8 + 0x10], 0
140198596: je        0x1401985c0
140198598: lea       rcx, [rdx + r8*8]
14019859c: lea       rsi, [rdx + r8*8]
1401985a0: add       rsi, 0x10
1401985a4: mov       rdx, qword ptr [r14 + 0x110]
1401985ab: mov       rax, qword ptr [rcx + 0x40]
1401985af: cmp       rdx, rax
1401985b2: jae       0x140198640
1401985b8: jmp       0x1401985fb
1401985ba: nop       word ptr [rax + rax]
1401985c0: cmp       rbx, rdi
1401985c3: je        0x140198688
1401985c9: mov       r8d, dword ptr [rbx]
1401985cc: add       rbx, 4
1401985d0: mov       rdx, qword ptr [rbp + 0x1a8]
1401985d7: lea       r8, [r8 + r8*8]
1401985db: cmp       qword ptr [rdx + r8*8 + 0x10], 0
1401985e1: je        0x1401985c0
1401985e3: lea       rcx, [rdx + r8*8]
1401985e7: lea       rsi, [rcx + 0x10]
1401985eb: mov       rdx, qword ptr [r14 + 0x110]
1401985f2: mov       rax, qword ptr [rcx + 0x40]
1401985f6: cmp       rdx, rax
1401985f9: jae       0x140198640
1401985fb: mov       r8, qword ptr [rcx + 0x38]
1401985ff: mov       rdx, qword ptr [r8 + rdx*8]
140198603: test      rdx, rdx
140198606: je        0x140198640
140198608: mov       r8, qword ptr [rcx + 0x18]
14019860c: not       rdx
14019860f: lea       rdx, [rdx + rdx*2]
140198613: shl       rdx, 4
140198617: mov       rdx, qword ptr [r8 + rdx + 0x10]
14019861c: mov       qword ptr [rsp + 0x30], rdx
140198621: mov       rdx, qword ptr [r14 + 0x118]
140198628: cmp       rdx, rax
14019862b: jae       0x140198540
140198631: jmp       0x140198659
140198633: nop       word ptr cs:[rax + rax]
140198640: mov       qword ptr [rsp + 0x30], 0
140198649: mov       rdx, qword ptr [r14 + 0x118]
140198650: cmp       rdx, rax
140198653: jae       0x140198540
140198659: mov       rax, qword ptr [rcx + 0x38]
14019865d: mov       rax, qword ptr [rax + rdx*8]
140198661: test      rax, rax
140198664: je        0x140198540
14019866a: mov       rdx, qword ptr [rcx + 0x18]
14019866e: not       rax
140198671: lea       rax, [rax + rax*2]
140198675: shl       rax, 4
140198679: mov       rax, qword ptr [rdx + rax + 0x10]
14019867e: mov       qword ptr [rsp + 0x28], rax
140198683: jmp       0x140198549
140198688: mov       edx, ecx
14019868a: mov       rbx, rdi
14019868d: xor       r9d, r9d
140198690: test      r9, r9
140198693: jne       0x1401986b4
140198695: jmp       0x140198a8f
14019869a: mov       r9, qword ptr [rsp + 0x30]
14019869f: add       r9, r8
1401986a2: mov       r10, qword ptr [rsp + 0x28]
1401986a7: lea       r8, [r10 + r8*8]
1401986ab: test      r9, r9
1401986ae: je        0x140198a8f
1401986b4: cmp       byte ptr [r9], 0
1401986b8: jne       0x140198571
1401986be: mov       r10, qword ptr [r8]
1401986c1: mov       r8d, r10d
1401986c4: not       r8d
1401986c7: mov       qword ptr [rsp + 0x70], r10
1401986cc: shr       r10, 0x20
1401986d0: lea       r9, [r8 + r8*2]
1401986d4: shl       r9, 3
1401986d8: mov       r11, qword ptr [rsp + 0x48]
1401986dd: add       r9, qword ptr [r11 + 8]
1401986e1: cmp       r8, qword ptr [r11 + 0x10]
1401986e5: lea       r8, [rip + 0x5c4cd5c]
1401986ec: cmovae    r9, r8
1401986f0: cmp       dword ptr [r9 + 0x10], r10d
1401986f4: jne       0x140198571
1401986fa: cmp       dword ptr [r9], 0
1401986fe: je        0x140198571
140198704: mov       r10, qword ptr [r9 + 4]
140198708: mov       r8, r10
14019870b: shr       r8, 0x20
14019870f: mov       r11, qword ptr [rsp + 0x50]
140198714: cmp       qword ptr [r11 + 0x38], r8
140198718: jbe       0x140198571
14019871e: mov       r11, r10
140198721: shr       r11, 0x26
140198725: mov       rsi, qword ptr [rsp + 0x50]
14019872a: mov       rsi, qword ptr [rsi + 0x28]
14019872e: mov       r11, qword ptr [rsi + r11*8]
140198732: bt        r11, r8
140198736: jae       0x140198571
14019873c: jmp       0x140198993
140198741: mov       ecx, 8
140198746: xor       edx, edx
140198748: xor       r8d, r8d
14019874b: xor       eax, eax
14019874d: mov       qword ptr [rsp + 0x28], 0
140198756: mov       qword ptr [rsp + 0x30], 0
14019875f: mov       qword ptr [rsp + 0x40], r12
140198764: jmp       0x1401987b7
140198766: nop       word ptr cs:[rax + rax]
140198770: mov       qword ptr [rsp + 0x28], 0
140198779: mov       rdx, qword ptr [r14 + 0x128]
140198780: call      0x144e4f270
140198785: mov       rcx, qword ptr [rsi + 0x50]
140198789: mov       r8, qword ptr [r12]
14019878d: xor       edx, edx
14019878f: mov       r12, qword ptr [rsp + 0x40]
140198794: mov       r9d, edx
140198797: shl       r9, 4
14019879b: inc       edx
14019879d: mov       r9d, dword ptr [rcx + r9 + 8]
1401987a2: not       r9d
1401987a5: mov       r10d, dword ptr [rsp + 0x38]
1401987aa: sub       r10d, dword ptr [rax + r9*4]
1401987ae: cmp       r10d, r15d
1401987b1: jb        0x1401988eb
1401987b7: cmp       edx, r8d
1401987ba: jne       0x140198794
1401987bc: cmp       rbx, rdi
1401987bf: je        0x1401988d8
1401987c5: mov       r9d, dword ptr [rbx]
1401987c8: add       rbx, 4
1401987cc: mov       r8, qword ptr [rbp + 0x108]
1401987d3: lea       r9, [r9 + r9*4]
1401987d7: shl       r9, 5
1401987db: cmp       qword ptr [r8 + r9 + 0x58], 0
1401987e1: je        0x140198800
1401987e3: lea       rsi, [r8 + r9]
1401987e7: lea       r12, [r8 + r9]
1401987eb: add       r12, 0x58
1401987ef: jmp       0x14019882e
1401987f1: nop       word ptr cs:[rax + rax]
140198800: cmp       rbx, rdi
140198803: je        0x1401988d8
140198809: mov       r8d, dword ptr [rbx]
14019880c: add       rbx, 4
140198810: mov       rsi, qword ptr [rbp + 0x108]
140198817: lea       r8, [r8 + r8*4]
14019881b: shl       r8, 5
14019881f: cmp       qword ptr [rsi + r8 + 0x58], 0
140198825: je        0x140198800
140198827: add       rsi, r8
14019882a: lea       r12, [rsi + 0x58]
14019882e: mov       eax, dword ptr [rsi + 0x94]
140198834: mov       r8, qword ptr [rbp + 0x1a8]
14019883b: lea       rax, [rax + rax*8]
14019883f: lea       rcx, [r8 + rax*8]
140198843: mov       rdx, qword ptr [r14 + 0x110]
14019884a: mov       rax, qword ptr [r8 + rax*8 + 0x40]
14019884f: cmp       rdx, rax
140198852: jae       0x140198890
140198854: mov       r8, qword ptr [rcx + 0x38]
140198858: mov       rdx, qword ptr [r8 + rdx*8]
14019885c: test      rdx, rdx
14019885f: je        0x140198890
140198861: mov       r8, qword ptr [rcx + 0x18]
140198865: not       rdx
140198868: lea       rdx, [rdx + rdx*2]
14019886c: shl       rdx, 4
140198870: mov       rdx, qword ptr [r8 + rdx + 0x10]
140198875: mov       qword ptr [rsp + 0x30], rdx
14019887a: mov       rdx, qword ptr [r14 + 0x118]
140198881: cmp       rdx, rax
140198884: jae       0x140198770
14019888a: jmp       0x1401988a9
14019888c: nop       dword ptr [rax]
140198890: mov       qword ptr [rsp + 0x30], 0
140198899: mov       rdx, qword ptr [r14 + 0x118]
1401988a0: cmp       rdx, rax
1401988a3: jae       0x140198770
1401988a9: mov       rax, qword ptr [rcx + 0x38]
1401988ad: mov       rax, qword ptr [rax + rdx*8]
1401988b1: test      rax, rax
1401988b4: je        0x140198770
1401988ba: mov       rdx, qword ptr [rcx + 0x18]
1401988be: not       rax
1401988c1: lea       rax, [rax + rax*2]
1401988c5: shl       rax, 4
1401988c9: mov       rax, qword ptr [rdx + rax + 0x10]
1401988ce: mov       qword ptr [rsp + 0x28], rax
1401988d3: jmp       0x140198779
1401988d8: mov       r8d, edx
1401988db: mov       rbx, rdi
1401988de: xor       r10d, r10d
1401988e1: test      r10, r10
1401988e4: jne       0x140198905
1401988e6: jmp       0x140198a8f
1401988eb: mov       r10, qword ptr [rsp + 0x30]
1401988f0: add       r10, r9
1401988f3: mov       r11, qword ptr [rsp + 0x28]
1401988f8: lea       r9, [r11 + r9*8]
1401988fc: test      r10, r10
1401988ff: je        0x140198a8f
140198905: cmp       byte ptr [r10], 0
140198909: jne       0x1401987b7
14019890f: mov       r11, qword ptr [r9]
140198912: mov       r10d, r11d
140198915: not       r10d
140198918: mov       qword ptr [rsp + 0x70], r11
14019891d: shr       r11, 0x20
140198921: lea       r9, [r10 + r10*2]
140198925: shl       r9, 3
140198929: mov       rsi, qword ptr [rsp + 0x48]
14019892e: add       r9, qword ptr [rsi + 8]
140198932: cmp       r10, qword ptr [rsi + 0x10]
140198936: lea       r10, [rip + 0x5c4cb0b]
14019893d: cmovae    r9, r10
140198941: cmp       dword ptr [r9 + 0x10], r11d
140198945: jne       0x1401987b7
14019894b: cmp       dword ptr [r9], 0
14019894f: je        0x1401987b7
140198955: mov       r10, qword ptr [r9 + 4]
140198959: mov       r11, r10
14019895c: shr       r11, 0x20
140198960: mov       rsi, qword ptr [rsp + 0x50]
140198965: cmp       qword ptr [rsi + 0x38], r11
140198969: jbe       0x1401987b7
14019896f: mov       rsi, r10
140198972: shr       rsi, 0x26
140198976: mov       r12, qword ptr [rsp + 0x50]
14019897b: mov       r12, qword ptr [r12 + 0x28]
140198980: mov       rsi, qword ptr [r12 + rsi*8]
140198984: mov       r12, qword ptr [rsp + 0x40]
140198989: bt        rsi, r11
14019898d: jae       0x1401987b7
140198993: mov       eax, dword ptr [r9 + 0xc]
140198997: mov       rcx, qword ptr [rsp + 0x48]
14019899c: mov       rcx, qword ptr [rcx + 0x1a8]
1401989a3: lea       rax, [rax + rax*8]
1401989a7: mov       rdx, qword ptr [rsp + 0x50]
1401989ac: mov       rdx, qword ptr [rdx + 0x110]
1401989b3: mov       r8, qword ptr [rcx + rax*8 + 0x18]
1401989b8: mov       rax, qword ptr [rcx + rax*8 + 0x38]
1401989bd: mov       rax, qword ptr [rax + rdx*8]
1401989c1: not       rax
1401989c4: lea       rax, [rax + rax*2]
1401989c8: shl       rax, 4
1401989cc: mov       rax, qword ptr [r8 + rax + 0x10]
1401989d1: not       r10d
1401989d4: mov       rbx, qword ptr [rax + r10*8]
1401989d8: lea       rcx, [rsp + 0xb0]
1401989e0: mov       rdx, qword ptr [rsp + 0x68]
1401989e5: mov       r8, qword ptr [rsp + 0x80]
1401989ed: mov       r9, rbx
1401989f0: call      0x140180d30
1401989f5: cmp       dword ptr [rsp + 0xb0], -1
1401989fd: jne       0x140198a35
1401989ff: mov       rax, qword ptr [rsp + 0xb8]
140198a07: movss     xmm0, dword ptr [rax + 4]
140198a0c: mov       rax, qword ptr [rsp + 0x78]
140198a11: mov       ecx, dword ptr [rsp + 0x58]
140198a15: mov       dword ptr [rax], ecx
140198a17: mov       rax, qword ptr [rsp + 0x90]
140198a1f: mov       qword ptr [rax], rbx
140198a22: mov       rcx, qword ptr [rsp + 0x70]
140198a27: mov       qword ptr [rax + 8], rcx
140198a2b: movss     dword ptr [rax + 0x10], xmm6
140198a30: movss     dword ptr [rax + 0x14], xmm0
140198a35: movaps    xmm6, xmmword ptr [rsp + 0xf0]
140198a3d: movaps    xmm7, xmmword ptr [rsp + 0x100]
140198a45: movaps    xmm8, xmmword ptr [rsp + 0x110]
140198a4e: movaps    xmm9, xmmword ptr [rsp + 0x120]
140198a57: movaps    xmm10, xmmword ptr [rsp + 0x130]
140198a60: movaps    xmm11, xmmword ptr [rsp + 0x140]
140198a69: movaps    xmm12, xmmword ptr [rsp + 0x150]
140198a72: movaps    xmm13, xmmword ptr [rsp + 0x160]
140198a7b: add       rsp, 0x178
140198a82: pop       rbx
140198a83: pop       rbp
140198a84: pop       rdi
140198a85: pop       rsi
140198a86: pop       r12
140198a88: pop       r13
140198a8a: pop       r14
140198a8c: pop       r15
140198a8e: ret
140198a8f: mov       rsi, qword ptr [r12 + 0xf8]
140198a97: mov       rax, qword ptr [r12 + 0x100]
140198a9f: lea       rbp, [rsi + rax*4]
140198aa3: movzx     eax, byte ptr [r12 + 0x108]
140198aac: mov       byte ptr [rsp + 0x50], al
140198ab0: mov       r15d, dword ptr [rsp + 0x5c]
140198ab5: mov       eax, r15d
140198ab8: sub       eax, dword ptr [rsp + 0x60]
140198abc: cmp       eax, 0xc233b000
140198ac1: mov       r14d, 0xc233b000
140198ac7: cmovb     r14d, eax
140198acb: xor       eax, eax
140198acd: mov       ecx, 8
140198ad2: mov       qword ptr [rsp + 0x60], rcx
140198ad7: xorps     xmm7, xmm7
140198ada: movaps    xmm8, xmmword ptr [rip + 0x5c3456e]
140198ae2: movaps    xmm9, xmmword ptr [rip + 0x5c34376]
140198aea: movss     xmm10, dword ptr [rip + 0x5c3bfd5]
140198af3: movss     xmm11, dword ptr [rip + 0x5c047a4]
140198afc: movss     xmm12, dword ptr [rip + 0x5c49a13]
140198b05: movss     xmm13, dword ptr [rip + 0x5c4c246]
140198b0e: mov       edi, 8
140198b13: mov       qword ptr [rsp + 0x38], 0
140198b1c: mov       qword ptr [rsp + 0x30], 0
140198b25: mov       qword ptr [rsp + 0x28], 0
140198b2e: mov       qword ptr [rsp + 0x40], 0
140198b37: xor       ecx, ecx
140198b39: xor       edx, edx
140198b3b: nop       dword ptr [rax + rax]
140198b40: cmp       byte ptr [rsp + 0x50], 0
140198b45: je        0x140198d60
140198b4b: mov       r10, qword ptr [rsp + 0x60]
140198b50: cmp       edx, ecx
140198b52: jne       0x140198d27
140198b58: cmp       rsi, rbp
140198b5b: je        0x140198fc0
140198b61: mov       r8d, dword ptr [rsi]
140198b64: add       rsi, 4
140198b68: mov       rdx, qword ptr [r13 + 0x1a8]
140198b6f: lea       r8, [r8 + r8*8]
140198b73: cmp       qword ptr [rdx + r8*8 + 0x10], 0
140198b79: je        0x140198ba0
140198b7b: lea       rbx, [rdx + r8*8]
140198b7f: lea       r15, [rdx + r8*8]
140198b83: add       r15, 0x10
140198b87: mov       rcx, qword ptr [r12 + 0x110]
140198b8f: mov       rax, qword ptr [rbx + 0x40]
140198b93: cmp       rcx, rax
140198b96: jae       0x140198c20
140198b9c: jmp       0x140198bdc
140198b9e: nop
140198ba0: cmp       rsi, rbp
140198ba3: je        0x140198fc0
140198ba9: mov       r8d, dword ptr [rsi]
140198bac: add       rsi, 4
140198bb0: mov       rdx, qword ptr [r13 + 0x1a8]
140198bb7: lea       r8, [r8 + r8*8]
140198bbb: cmp       qword ptr [rdx + r8*8 + 0x10], 0
140198bc1: je        0x140198ba0
140198bc3: lea       rbx, [rdx + r8*8]
140198bc7: lea       r15, [rbx + 0x10]
140198bcb: mov       rcx, qword ptr [r12 + 0x110]
140198bd3: mov       rax, qword ptr [rbx + 0x40]
140198bd7: cmp       rcx, rax
140198bda: jae       0x140198c20
140198bdc: mov       rdx, qword ptr [rbx + 0x38]
140198be0: mov       rcx, qword ptr [rdx + rcx*8]
140198be4: test      rcx, rcx
140198be7: je        0x140198c20
140198be9: mov       rdx, qword ptr [rbx + 0x18]
140198bed: not       rcx
140198bf0: lea       rcx, [rcx + rcx*2]
140198bf4: shl       rcx, 4
140198bf8: mov       rcx, qword ptr [rdx + rcx + 0x10]
140198bfd: mov       qword ptr [rsp + 0x38], rcx
140198c02: mov       rcx, qword ptr [r12 + 0x118]
140198c0a: cmp       rcx, rax
140198c0d: jb        0x140198c36
140198c0f: jmp       0x140198c70
140198c11: nop       word ptr cs:[rax + rax]
140198c20: mov       qword ptr [rsp + 0x38], 0
140198c29: mov       rcx, qword ptr [r12 + 0x118]
140198c31: cmp       rcx, rax
140198c34: jae       0x140198c70
140198c36: mov       rdx, qword ptr [rbx + 0x38]
140198c3a: mov       rcx, qword ptr [rdx + rcx*8]
140198c3e: test      rcx, rcx
140198c41: je        0x140198c70
140198c43: mov       rdx, qword ptr [rbx + 0x18]
140198c47: not       rcx
140198c4a: lea       rcx, [rcx + rcx*2]
140198c4e: shl       rcx, 4
140198c52: mov       rcx, qword ptr [rdx + rcx + 0x10]
140198c57: mov       qword ptr [rsp + 0x30], rcx
140198c5c: mov       rcx, qword ptr [r12 + 0x120]
140198c64: cmp       rcx, rax
140198c67: jae       0x140198cc0
140198c69: jmp       0x140198c86
140198c6b: nop       dword ptr [rax + rax]
140198c70: mov       qword ptr [rsp + 0x30], 0
140198c79: mov       rcx, qword ptr [r12 + 0x120]
140198c81: cmp       rcx, rax
140198c84: jae       0x140198cc0
140198c86: mov       rdx, qword ptr [rbx + 0x38]
140198c8a: mov       rcx, qword ptr [rdx + rcx*8]
140198c8e: test      rcx, rcx
140198c91: je        0x140198cc0
140198c93: mov       rdx, qword ptr [rbx + 0x18]
140198c97: not       rcx
140198c9a: lea       rcx, [rcx + rcx*2]
140198c9e: shl       rcx, 4
140198ca2: mov       rcx, qword ptr [rdx + rcx + 0x10]
140198ca7: mov       qword ptr [rsp + 0x28], rcx
140198cac: mov       rcx, qword ptr [r12 + 0x128]
140198cb4: cmp       rcx, rax
140198cb7: jae       0x140198d00
140198cb9: jmp       0x140198cd6
140198cbb: nop       dword ptr [rax + rax]
140198cc0: mov       qword ptr [rsp + 0x28], 0
140198cc9: mov       rcx, qword ptr [r12 + 0x128]
140198cd1: cmp       rcx, rax
140198cd4: jae       0x140198d00
140198cd6: mov       rax, qword ptr [rbx + 0x38]
140198cda: mov       rax, qword ptr [rax + rcx*8]
140198cde: test      rax, rax
140198ce1: je        0x140198d00
140198ce3: mov       rcx, qword ptr [rbx + 0x18]
140198ce7: not       rax
140198cea: lea       rax, [rax + rax*2]
140198cee: shl       rax, 4
140198cf2: mov       rax, qword ptr [rcx + rax + 0x10]
140198cf7: mov       qword ptr [rsp + 0x40], rax
140198cfc: jmp       0x140198d09
140198cfe: nop
140198d00: mov       qword ptr [rsp + 0x40], 0
140198d09: mov       rdx, qword ptr [r12 + 0x130]
140198d11: mov       rcx, rbx
140198d14: call      0x144e4f270
140198d19: mov       r10, qword ptr [rbx + 8]
140198d1d: mov       rcx, qword ptr [r15]
140198d20: xor       edx, edx
140198d22: mov       r15d, dword ptr [rsp + 0x5c]
140198d27: mov       r8d, edx
140198d2a: inc       edx
140198d2c: mov       r9d, r15d
140198d2f: sub       r9d, dword ptr [rax + r8*4]
140198d33: cmp       r9d, r14d
140198d36: jae       0x140198b50
140198d3c: mov       r9, qword ptr [r10 + r8*8]
140198d40: test      r9d, r9d
140198d43: je        0x140198b50
140198d49: mov       qword ptr [rsp + 0x60], r10
140198d4e: jmp       0x140198f74
140198d53: nop       word ptr cs:[rax + rax]
140198d60: cmp       edx, ecx
140198d62: jne       0x140198f44
140198d68: cmp       rsi, rbp
140198d6b: je        0x140198fe3
140198d71: mov       r8d, dword ptr [rsi]
140198d74: add       rsi, 4
140198d78: mov       rdx, qword ptr [r13 + 0x108]
140198d7f: lea       r8, [r8 + r8*4]
140198d83: shl       r8, 5
140198d87: cmp       qword ptr [rdx + r8 + 0x58], 0
140198d8d: je        0x140198d9d
140198d8f: lea       rbx, [rdx + r8]
140198d93: lea       r15, [rdx + r8]
140198d97: add       r15, 0x58
140198d9b: jmp       0x140198ddd
140198d9d: mov       r9, qword ptr [rsp + 0x48]
140198da2: nop       word ptr cs:[rax + rax]
140198db0: cmp       rsi, rbp
140198db3: je        0x140198ff0
140198db9: mov       edx, dword ptr [rsi]
140198dbb: add       rsi, 4
140198dbf: mov       rbx, qword ptr [r13 + 0x108]
140198dc6: lea       rdx, [rdx + rdx*4]
140198dca: shl       rdx, 5
140198dce: cmp       qword ptr [rbx + rdx + 0x58], 0
140198dd4: je        0x140198db0
140198dd6: add       rbx, rdx
140198dd9: lea       r15, [rbx + 0x58]
140198ddd: mov       eax, dword ptr [rbx + 0x94]
140198de3: mov       r8, qword ptr [r13 + 0x1a8]
140198dea: lea       rax, [rax + rax*8]
140198dee: lea       rcx, [r8 + rax*8]
140198df2: mov       rdx, qword ptr [r12 + 0x110]
140198dfa: mov       rax, qword ptr [r8 + rax*8 + 0x40]
140198dff: cmp       rdx, rax
140198e02: jae       0x140198e40
140198e04: mov       r8, qword ptr [rcx + 0x38]
140198e08: mov       rdx, qword ptr [r8 + rdx*8]
140198e0c: test      rdx, rdx
140198e0f: je        0x140198e40
140198e11: mov       r8, qword ptr [rcx + 0x18]
140198e15: not       rdx
140198e18: lea       rdx, [rdx + rdx*2]
140198e1c: shl       rdx, 4
140198e20: mov       rdx, qword ptr [r8 + rdx + 0x10]
140198e25: mov       qword ptr [rsp + 0x38], rdx
140198e2a: mov       rdx, qword ptr [r12 + 0x118]
140198e32: cmp       rdx, rax
140198e35: jb        0x140198e56
140198e37: jmp       0x140198e90
140198e39: nop       dword ptr [rax]
140198e40: mov       qword ptr [rsp + 0x38], 0
140198e49: mov       rdx, qword ptr [r12 + 0x118]
140198e51: cmp       rdx, rax
140198e54: jae       0x140198e90
140198e56: mov       r8, qword ptr [rcx + 0x38]
140198e5a: mov       rdx, qword ptr [r8 + rdx*8]
140198e5e: test      rdx, rdx
140198e61: je        0x140198e90
140198e63: mov       r8, qword ptr [rcx + 0x18]
140198e67: not       rdx
140198e6a: lea       rdx, [rdx + rdx*2]
140198e6e: shl       rdx, 4
140198e72: mov       rdx, qword ptr [r8 + rdx + 0x10]
140198e77: mov       qword ptr [rsp + 0x30], rdx
140198e7c: mov       rdx, qword ptr [r12 + 0x120]
140198e84: cmp       rdx, rax
140198e87: jae       0x140198ee0
140198e89: jmp       0x140198ea6
140198e8b: nop       dword ptr [rax + rax]
140198e90: mov       qword ptr [rsp + 0x30], 0
140198e99: mov       rdx, qword ptr [r12 + 0x120]
140198ea1: cmp       rdx, rax
140198ea4: jae       0x140198ee0
140198ea6: mov       r8, qword ptr [rcx + 0x38]
140198eaa: mov       rdx, qword ptr [r8 + rdx*8]
140198eae: test      rdx, rdx
140198eb1: je        0x140198ee0
140198eb3: mov       r8, qword ptr [rcx + 0x18]
140198eb7: not       rdx
140198eba: lea       rdx, [rdx + rdx*2]
140198ebe: shl       rdx, 4
140198ec2: mov       rdx, qword ptr [r8 + rdx + 0x10]
140198ec7: mov       qword ptr [rsp + 0x28], rdx
140198ecc: mov       rdx, qword ptr [r12 + 0x128]
140198ed4: cmp       rdx, rax
140198ed7: jae       0x140198f20
140198ed9: jmp       0x140198ef6
140198edb: nop       dword ptr [rax + rax]
140198ee0: mov       qword ptr [rsp + 0x28], 0
140198ee9: mov       rdx, qword ptr [r12 + 0x128]
140198ef1: cmp       rdx, rax
140198ef4: jae       0x140198f20
140198ef6: mov       rax, qword ptr [rcx + 0x38]
140198efa: mov       rax, qword ptr [rax + rdx*8]
140198efe: test      rax, rax
140198f01: je        0x140198f20
140198f03: mov       rdx, qword ptr [rcx + 0x18]
140198f07: not       rax
140198f0a: lea       rax, [rax + rax*2]
140198f0e: shl       rax, 4
140198f12: mov       rax, qword ptr [rdx + rax + 0x10]
140198f17: mov       qword ptr [rsp + 0x40], rax
140198f1c: jmp       0x140198f29
140198f1e: nop
140198f20: mov       qword ptr [rsp + 0x40], 0
140198f29: mov       rdx, qword ptr [r12 + 0x130]
140198f31: call      0x144e4f270
140198f36: mov       rdi, qword ptr [rbx + 0x50]
140198f3a: mov       rcx, qword ptr [r15]
140198f3d: xor       edx, edx
140198f3f: mov       r15d, dword ptr [rsp + 0x5c]
140198f44: mov       r9d, edx
140198f47: shl       r9, 4
140198f4b: inc       edx
140198f4d: mov       r8d, dword ptr [rdi + r9 + 8]
140198f52: not       r8d
140198f55: mov       r10d, r15d
140198f58: sub       r10d, dword ptr [rax + r8*4]
140198f5c: cmp       r10d, r14d
140198f5f: jae       0x140198d60
140198f65: add       r9, rdi
140198f68: mov       r9, qword ptr [r9]
140198f6b: test      r9d, r9d
140198f6e: je        0x140198d60
140198f74: mov       r10, qword ptr [rsp + 0x38]
140198f79: add       r10, r8
140198f7c: mov       qword ptr [rsp + 0x70], r10
140198f81: mov       r10, qword ptr [rsp + 0x30]
140198f86: lea       r10, [r10 + r8*8]
140198f8a: mov       qword ptr [rsp + 0x88], r10
140198f92: imul      r10, r8, 0x68
140198f96: add       r10, qword ptr [rsp + 0x28]
140198f9b: mov       qword ptr [rsp + 0xa8], r10
140198fa3: shl       r8, 5
140198fa7: add       r8, qword ptr [rsp + 0x40]
140198fac: mov       qword ptr [rsp + 0xa0], r8
140198fb4: test      r9d, r9d
140198fb7: jne       0x140199008
140198fb9: jmp       0x140198a35
140198fbe: nop
140198fc0: mov       qword ptr [rsp + 0x60], r10
140198fc5: movabs    rdx, 0xffffffff00000000
140198fcf: mov       r9, qword ptr [rsp + 0x48]
140198fd4: and       r9, rdx
140198fd7: mov       edx, ecx
140198fd9: test      r9d, r9d
140198fdc: jne       0x140199008
140198fde: jmp       0x140198a35
140198fe3: mov       r9, qword ptr [rsp + 0x48]
140198fe8: nop       dword ptr [rax + rax]
140198ff0: movabs    rdx, 0xffffffff00000000
140198ffa: and       r9, rdx
140198ffd: mov       edx, ecx
140198fff: test      r9d, r9d
140199002: je        0x140198a35
140199008: mov       qword ptr [rsp + 0x48], r9
14019900d: mov       r8, qword ptr [rsp + 0x70]
140199012: cmp       byte ptr [r8], 0
140199016: jne       0x140198b40
14019901c: mov       r8, qword ptr [rsp + 0x90]
140199024: cmp       dword ptr [r8], 0
140199028: jne       0x140198b40
14019902e: mov       r8, qword ptr [rsp + 0x88]
140199036: mov       r8, qword ptr [r8]
140199039: mov       r10d, r8d
14019903c: not       r10d
14019903f: shr       r8, 0x20
140199043: lea       r9, [r10 + r10*2]
140199047: shl       r9, 3
14019904b: mov       r11, qword ptr [rsp + 0x80]
140199053: add       r9, qword ptr [r11 + 8]
140199057: cmp       r10, qword ptr [r11 + 0x10]
14019905b: lea       r10, [rip + 0x5c4c3e6]
140199062: cmovae    r9, r10
140199066: cmp       dword ptr [r9 + 0x10], r8d
14019906a: jne       0x140198b40
140199070: cmp       dword ptr [r9], 0
140199074: je        0x140198b40
14019907a: mov       r8, qword ptr [r9 + 4]
14019907e: mov       r10, r8
140199081: shr       r10, 0x20
140199085: mov       r11, qword ptr [rsp + 0x68]
14019908a: cmp       qword ptr [r11 + 0x38], r10
14019908e: jbe       0x140198b40
140199094: mov       r11, r8
140199097: shr       r11, 0x26
14019909b: mov       rbx, qword ptr [rsp + 0x68]
1401990a0: mov       rbx, qword ptr [rbx + 0x28]
1401990a4: mov       r11, qword ptr [rbx + r11*8]
1401990a8: bt        r11, r10
1401990ac: jae       0x140198b40
1401990b2: mov       r9d, dword ptr [r9 + 0xc]
1401990b6: mov       r10, qword ptr [rsp + 0x80]
1401990be: mov       r10, qword ptr [r10 + 0x1a8]
1401990c5: lea       r11, [r9 + r9*8]
1401990c9: mov       r9, qword ptr [rsp + 0x68]
1401990ce: mov       rbx, qword ptr [r9 + 0x118]
1401990d5: mov       r9, qword ptr [r10 + r11*8 + 0x18]
1401990da: mov       r10, qword ptr [r10 + r11*8 + 0x38]
1401990df: mov       qword ptr [rsp + 0xd8], r10
1401990e7: mov       r11, qword ptr [r10 + rbx*8]
1401990eb: not       r11
1401990ee: lea       r11, [r11 + r11*2]
1401990f2: shl       r11, 4
1401990f6: mov       qword ptr [rsp + 0xe0], r9
1401990fe: mov       r11, qword ptr [r9 + r11 + 0x10]
140199103: not       r8d
140199106: imul      rbx, r8, 0x68
14019910a: movss     xmm0, dword ptr [r11 + rbx + 0x64]
140199111: movss     xmm1, dword ptr [r11 + rbx + 0x34]
140199118: mulss     xmm1, xmm0
14019911c: mulss     xmm0, dword ptr [r11 + rbx + 0x3c]
140199123: mov       r9, qword ptr [rsp + 0xa8]
14019912b: movsd     xmm2, qword ptr [r9 + 0x30]
140199131: unpcklps  xmm2, xmm2
140199134: mulps     xmm2, xmm8
140199138: mov       r10, qword ptr [rsp + 0xa0]
140199140: mulps     xmm2, xmmword ptr [r10]
140199144: movaps    xmm3, xmm2
140199147: unpckhpd  xmm3, xmm2
14019914b: addps     xmm3, xmm2
14019914e: movshdup  xmm2, xmm3
140199152: addss     xmm2, dword ptr [r10 + 0x14]
140199158: mov       r10, qword ptr [rsp + 0xe8]
140199160: lea       r11, [r10 + 0xc8]
140199167: lea       rbx, [r10 + 0xbc]
14019916e: cmp       byte ptr [r10 + 0xb8], 0
140199176: cmovne    r11, rbx
14019917a: movss     xmm3, dword ptr [r11]
14019917f: mulss     xmm3, xmm6
140199183: subss     xmm3, xmm2
140199187: movss     xmm2, dword ptr [r9 + 0x34]
14019918d: movaps    xmm4, xmm0
140199190: unpcklps  xmm4, xmm2
140199193: movaps    xmm2, xmm4
140199196: maxps     xmm2, xmm9
14019919a: movaps    xmm5, xmm2
14019919d: cmpunordps xmm5, xmm2
1401991a1: andps     xmm4, xmm5
1401991a4: andnps    xmm5, xmm2
1401991a7: orps      xmm5, xmm4
1401991aa: movaps    xmm2, xmm1
1401991ad: unpcklps  xmm2, xmm3
1401991b0: divps     xmm2, xmm5
1401991b3: movaps    xmm3, xmm10
1401991b7: maxps     xmm3, xmm2
1401991ba: movaps    xmm2, xmm9
1401991be: cmpltps   xmm2, xmm3
1401991c2: unpcklps  xmm2, xmm2
1401991c5: movmskpd  r11d, xmm2
1401991ca: movaps    xmm2, xmm11
1401991ce: test      r11b, 2
1401991d2: jne       0x1401991d8
1401991d4: movshdup  xmm2, xmm3
1401991d8: movaps    xmm4, xmm11
1401991dc: test      r11b, 1
1401991e0: jne       0x1401991e5
1401991e2: movaps    xmm4, xmm3
1401991e5: mov       r11, qword ptr [rsp + 0x68]
1401991ea: mov       r11, qword ptr [r11 + 0x110]
1401991f1: mov       r9, qword ptr [rsp + 0xd8]
1401991f9: mov       r10, qword ptr [r9 + r11*8]
1401991fd: not       r10
140199200: lea       r10, [r10 + r10*2]
140199204: shl       r10, 4
140199208: mov       r9, qword ptr [rsp + 0xe0]
140199210: mov       r11, qword ptr [r9 + r10 + 0x10]
140199215: mov       r9, qword ptr [r9 + r10 + 0x28]
14019921a: subss     xmm0, xmm1
14019921e: maxss     xmm0, xmm7
140199222: movaps    xmm1, xmm11
140199226: subss     xmm1, xmm4
14019922a: mulss     xmm4, xmm12
14019922f: addss     xmm2, xmm4
140199233: maxss     xmm1, xmm13
140199238: divss     xmm2, xmm1
14019923c: xorps     xmm1, xmm1
14019923f: maxss     xmm1, xmm2
140199243: movaps    xmm2, xmm11
140199247: minss     xmm2, xmm1
14019924b: mulss     xmm2, xmm0
14019924f: mov       r10d, dword ptr [rsp + 0x9c]
140199257: mov       dword ptr [r9 + r8*4], r10d
14019925b: movss     dword ptr [r11 + r8*8 + 4], xmm2
140199262: mov       r8, qword ptr [rsp + 0x88]
14019926a: mov       r8, qword ptr [r8]
14019926d: mov       r9, qword ptr [rsp + 0x78]
140199272: mov       r10d, dword ptr [rsp + 0x58]
140199277: mov       dword ptr [r9], r10d
14019927a: mov       r9, qword ptr [rsp + 0x90]
140199282: mov       qword ptr [r9], r8
140199285: mov       r8, qword ptr [rsp + 0x48]
14019928a: mov       qword ptr [r9 + 8], r8
14019928e: movss     dword ptr [r9 + 0x10], xmm6
140199294: movss     dword ptr [r9 + 0x14], xmm2
14019929a: jmp       0x140198b40
