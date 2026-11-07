140197330: push      r15
140197332: push      r14
140197334: push      r13
140197336: push      r12
140197338: push      rsi
140197339: push      rdi
14019733a: push      rbp
14019733b: push      rbx
14019733c: sub       rsp, 0x238
140197343: movdqa    xmmword ptr [rsp + 0x220], xmm15
14019734d: movaps    xmmword ptr [rsp + 0x210], xmm14
140197356: movaps    xmmword ptr [rsp + 0x200], xmm13
14019735f: movaps    xmmword ptr [rsp + 0x1f0], xmm12
140197368: movaps    xmmword ptr [rsp + 0x1e0], xmm11
140197371: movaps    xmmword ptr [rsp + 0x1d0], xmm10
14019737a: movdqa    xmmword ptr [rsp + 0x1c0], xmm9
140197384: movaps    xmmword ptr [rsp + 0x1b0], xmm8
14019738d: movaps    xmmword ptr [rsp + 0x1a0], xmm7
140197395: movaps    xmmword ptr [rsp + 0x190], xmm6
14019739d: mov       rax, qword ptr [rdx]
1401973a0: mov       rdx, qword ptr [rdx + 8]
1401973a4: mov       rcx, qword ptr [rax]
1401973a7: xor       r14d, r14d
1401973aa: mov       rbx, rcx
1401973ad: sub       rbx, qword ptr [rdx + 0x18]
1401973b1: cmovb     rbx, r14
1401973b5: sub       rcx, qword ptr [rdx + 0x38]
1401973b9: cmovb     rcx, r14
1401973bd: mov       rsi, rbx
1401973c0: shl       rsi, 5
1401973c4: add       rsi, qword ptr [rdx + 8]
1401973c8: mov       r15, qword ptr [rdx + 0x10]
1401973cc: mov       rdi, rcx
1401973cf: shl       rdi, 5
1401973d3: add       rdi, qword ptr [rdx + 0x28]
1401973d7: mov       r10, r15
1401973da: sub       r10, rbx
1401973dd: cmovb     r10, r14
1401973e1: mov       r11, qword ptr [r8]
1401973e4: mov       qword ptr [rsp + 0x30], r11
1401973e9: mov       r13d, 8
1401973ef: cmovb     rsi, r13
1401973f3: mov       r12, qword ptr [rdx + 0x30]
1401973f7: cmovb     rbx, r15
1401973fb: mov       r11, r12
1401973fe: sub       r11, rcx
140197401: cmovb     rdi, r13
140197405: mov       r13, qword ptr [r8 + 8]
140197409: mov       qword ptr [rsp + 0x58], r13
14019740e: cmovb     r11, r14
140197412: cmovb     rcx, r12
140197416: mov       rbp, qword ptr [rdx + 0x40]
14019741a: add       rcx, rbp
14019741d: sub       rbp, r11
140197420: sub       rbp, r10
140197423: mov       edx, dword ptr [r8 + 0x10]
140197427: mov       dword ptr [rsp + 0x50], edx
14019742b: mov       edx, dword ptr [r8 + 0x14]
14019742f: mov       dword ptr [rsp + 0x6c], edx
140197433: mov       rdx, qword ptr [r9]
140197436: mov       r8, qword ptr [r9 + 8]
14019743a: mov       r9, qword ptr [rsp + 0x2a0]
140197442: mov       r14, qword ptr [r9]
140197445: mov       qword ptr [rsp + 0x70], r14
14019744a: mov       r14, qword ptr [r9 + 0x10]
14019744e: mov       qword ptr [rsp + 0x178], r14
140197456: mov       r9d, dword ptr [r9 + 0x1c]
14019745a: mov       dword ptr [rsp + 0xa4], r9d
140197462: mov       qword ptr [rax], rbp
140197465: add       rcx, rbx
140197468: sub       rcx, r12
14019746b: mov       r12, qword ptr [rsp + 0x30]
140197470: sub       rcx, r15
140197473: shl       r10, 5
140197477: add       r10, rsi
14019747a: shl       r11, 5
14019747e: add       r11, rdi
140197481: inc       rcx
140197484: movss     xmm7, dword ptr [rip + 0x5c06284]
14019748c: movss     xmm0, dword ptr [rip + 0x5c06280]
140197494: jmp       0x1401974ad
140197496: nop       word ptr cs:[rax + rax]
1401974a0: addss     xmm7, xmm1
1401974a4: inc       rcx
1401974a7: mov       rdi, r9
1401974aa: mov       rsi, rbx
1401974ad: test      rsi, rsi
1401974b0: je        0x1401974c0
1401974b2: cmp       rsi, r10
1401974b5: je        0x1401974c0
1401974b7: lea       rbx, [rsi + 0x20]
1401974bb: mov       r9, rdi
1401974be: jmp       0x1401974d3
1401974c0: test      rdi, rdi
1401974c3: je        0x1401974ed
1401974c5: cmp       rdi, r11
1401974c8: je        0x1401974ed
1401974ca: lea       r9, [rdi + 0x20]
1401974ce: xor       ebx, ebx
1401974d0: mov       rsi, rdi
1401974d3: mov       qword ptr [rax], rcx
1401974d6: movss     xmm1, dword ptr [rsi + 0x14]
1401974db: movaps    xmm2, xmm1
1401974de: mulss     xmm2, xmm0
1401974e2: cmp       byte ptr [rsi + 0x18], 0
1401974e6: jne       0x1401974a0
1401974e8: movaps    xmm1, xmm2
1401974eb: jmp       0x1401974a0
1401974ed: lea       rcx, [rsp + 0xc0]
1401974f5: call      0x140180b10
1401974fa: cmp       byte ptr [rsp + 0xc0], 1
140197502: jne       0x140197508
140197504: xor       eax, eax
140197506: jmp       0x14019756c
140197508: mov       rcx, qword ptr [rsp + 0xc8]
140197510: xor       eax, eax
140197512: cmp       dword ptr [rcx], 1
140197515: jne       0x14019756c
140197517: movupd    xmm0, xmmword ptr [rcx + 8]
14019751c: xorps     xmm2, xmm2
14019751f: ucomisd   xmm0, xmm2
140197523: jb        0x14019756c
140197525: movsd     xmm1, qword ptr [rcx + 0x10]
14019752a: ucomisd   xmm1, xmm2
14019752e: jb        0x14019756c
140197530: mov       edx, dword ptr [rcx + 0xc0]
140197536: xorps     xmm2, xmm2
140197539: cvtsi2sd  xmm2, rdx
14019753e: ucomisd   xmm2, xmm0
140197542: jbe       0x14019756c
140197544: mov       ecx, dword ptr [rcx + 0xc4]
14019754a: xorps     xmm2, xmm2
14019754d: cvtsi2sd  xmm2, rcx
140197552: ucomisd   xmm2, xmm1
140197556: jbe       0x14019756c
140197558: cvtpd2ps  xmm1, xmm0
14019755c: movlpd    qword ptr [rsp + 0x188], xmm1
140197565: mov       eax, 1
14019756a: jmp       0x14019756c
14019756c: movddup   xmm0, xmm1
140197570: mov       dword ptr [rsp + 0x184], eax
140197577: lea       rcx, [rsp + 0x184]
14019757f: mov       qword ptr [rsp + 0xb8], rcx
140197587: mov       rsi, qword ptr [rsp + 0x58]
14019758c: lea       r8, [rsi + 0x1a0]
140197593: lea       r9, [rsi + 0x100]
14019759a: mov       rbx, qword ptr [r12 + 0xf8]
1401975a2: mov       rcx, qword ptr [r12 + 0x100]
1401975aa: lea       rdx, [rbx + rcx*4]
1401975ae: movzx     r10d, byte ptr [r12 + 0x108]
1401975b7: lea       r11, [rsp + 0xb8]
1401975bf: mov       qword ptr [rsp + 0xc0], r11
1401975c7: mov       qword ptr [rsp + 0xc8], rsi
1401975cf: mov       qword ptr [rsp + 0xd0], r8
1401975d7: mov       qword ptr [rsp + 0xd8], r9
1401975df: mov       qword ptr [rsp + 0xe0], r12
1401975e7: mov       qword ptr [rsp + 0xe8], rbx
1401975ef: mov       qword ptr [rsp + 0xf0], rdx
1401975f7: mov       qword ptr [rsp + 0xf8], 8
140197603: mov       qword ptr [rsp + 0x100], 0
14019760f: mov       qword ptr [rsp + 0x108], 8
14019761b: xorpd     xmm1, xmm1
14019761f: movupd    xmmword ptr [rsp + 0x110], xmm1
140197628: movupd    xmmword ptr [rsp + 0x120], xmm1
140197631: movupd    xmmword ptr [rsp + 0x130], xmm1
14019763a: mov       byte ptr [rsp + 0x140], r10b
140197642: xor       r8d, r8d
140197645: test      r10b, r10b
140197648: je        0x1401978a3
14019764e: movaps    xmm1, xmmword ptr [rip + 0x5c1167b]
140197655: movaps    xmm2, xmmword ptr [rip + 0x5c359f4]
14019765c: xor       r11d, r11d
14019765f: xor       r10d, r10d
140197662: xor       esi, esi
140197664: mov       r9, rbx
140197667: jmp       0x1401976ca
140197669: nop       dword ptr [rax]
140197670: mov       r15d, edi
140197673: imul      rdi, r15, 0x68
140197677: shl       r15, 5
14019767b: movaps    xmm3, xmmword ptr [r11 + r15]
140197680: movsd     xmm4, qword ptr [r8 + rdi + 0x30]
140197687: unpcklps  xmm4, xmm4
14019768a: movaps    xmm5, xmm4
14019768d: mulps     xmm5, xmm1
140197690: mulps     xmm5, xmm3
140197693: mulps     xmm4, xmm2
140197696: mulps     xmm4, xmm3
140197699: movddup   xmm3, qword ptr [r11 + r15 + 0x10]
1401976a0: movaps    xmm6, xmm5
1401976a3: movlhps   xmm6, xmm4
1401976a6: movhlps   xmm4, xmm5
1401976a9: addps     xmm4, xmm6
1401976ac: addps     xmm4, xmm3
1401976af: movaps    xmm3, xmm0
1401976b2: cmpleps   xmm3, xmm4
1401976b6: cmpleps   xmm4, xmm0
1401976ba: movsd     xmm4, xmm3
1401976be: movmskps  ebp, xmm4
1401976c1: cmp       ebp, 0xf
1401976c4: je        0x140198261
1401976ca: cmp       esi, r10d
1401976cd: jne       0x140197770
1401976d3: mov       r8, r9
1401976d6: nop       word ptr cs:[rax + rax]
1401976e0: cmp       r8, rdx
1401976e3: je        0x140197b44
1401976e9: lea       r9, [r8 + 4]
1401976ed: mov       qword ptr [rsp + 0xe8], r9
1401976f5: mov       r8d, dword ptr [r8]
1401976f8: mov       r10, qword ptr [rsp + 0x58]
1401976fd: mov       r11, qword ptr [r10 + 0x1a8]
140197704: lea       rsi, [r8 + r8*8]
140197708: mov       r10, qword ptr [r11 + rsi*8 + 0x10]
14019770d: mov       r8, r9
140197710: test      r10, r10
140197713: je        0x1401976e0
140197715: lea       rsi, [r11 + rsi*8]
140197719: mov       r8, qword ptr [r12 + 0x110]
140197721: mov       rdi, qword ptr [rsi + 0x40]
140197725: cmp       r8, rdi
140197728: jae       0x140197789
14019772a: mov       r11, qword ptr [rsi + 0x38]
14019772e: mov       r8, qword ptr [r11 + r8*8]
140197732: test      r8, r8
140197735: je        0x140197789
140197737: mov       r11, qword ptr [rsi + 0x18]
14019773b: not       r8
14019773e: lea       r8, [r8 + r8*2]
140197742: shl       r8, 4
140197746: mov       r8, qword ptr [r11 + r8 + 0x10]
14019774b: mov       qword ptr [rsp + 0x118], r8
140197753: mov       r8, qword ptr [r12 + 0x118]
14019775b: cmp       r8, rdi
14019775e: jb        0x1401977a1
140197760: jmp       0x1401977d9
140197762: nop       word ptr cs:[rax + rax]
140197770: mov       edi, esi
140197772: lea       esi, [rdi + 1]
140197775: mov       dword ptr [rsp + 0x13c], esi
14019777c: test      al, al
14019777e: je        0x1401976ca
140197784: jmp       0x140197670
140197789: xor       r8d, r8d
14019778c: mov       qword ptr [rsp + 0x118], r8
140197794: mov       r8, qword ptr [r12 + 0x118]
14019779c: cmp       r8, rdi
14019779f: jae       0x1401977d9
1401977a1: mov       r11, qword ptr [rsi + 0x38]
1401977a5: mov       r8, qword ptr [r11 + r8*8]
1401977a9: test      r8, r8
1401977ac: je        0x1401977d9
1401977ae: mov       r11, qword ptr [rsi + 0x18]
1401977b2: not       r8
1401977b5: lea       r8, [r8 + r8*2]
1401977b9: shl       r8, 4
1401977bd: mov       r8, qword ptr [r11 + r8 + 0x10]
1401977c2: mov       qword ptr [rsp + 0x120], r8
1401977ca: mov       r11, qword ptr [r12 + 0x120]
1401977d2: cmp       r11, rdi
1401977d5: jae       0x140197829
1401977d7: jmp       0x1401977f1
1401977d9: xor       r8d, r8d
1401977dc: mov       qword ptr [rsp + 0x120], r8
1401977e4: mov       r11, qword ptr [r12 + 0x120]
1401977ec: cmp       r11, rdi
1401977ef: jae       0x140197829
1401977f1: mov       r15, qword ptr [rsi + 0x38]
1401977f5: mov       r11, qword ptr [r15 + r11*8]
1401977f9: test      r11, r11
1401977fc: je        0x140197829
1401977fe: mov       r15, qword ptr [rsi + 0x18]
140197802: not       r11
140197805: lea       r11, [r11 + r11*2]
140197809: shl       r11, 4
14019780d: mov       r11, qword ptr [r15 + r11 + 0x10]
140197812: mov       qword ptr [rsp + 0x128], r11
14019781a: mov       r15, qword ptr [r12 + 0x128]
140197822: cmp       r15, rdi
140197825: jae       0x140197864
140197827: jmp       0x140197841
140197829: xor       r11d, r11d
14019782c: mov       qword ptr [rsp + 0x128], r11
140197834: mov       r15, qword ptr [r12 + 0x128]
14019783c: cmp       r15, rdi
14019783f: jae       0x140197864
140197841: mov       rdi, qword ptr [rsi + 0x38]
140197845: mov       rdi, qword ptr [rdi + r15*8]
140197849: test      rdi, rdi
14019784c: je        0x140197864
14019784e: mov       r15, qword ptr [rsi + 0x18]
140197852: not       rdi
140197855: lea       rdi, [rdi + rdi*2]
140197859: shl       rdi, 4
14019785d: mov       rdi, qword ptr [r15 + rdi + 0x10]
140197862: jmp       0x140197866
140197864: xor       edi, edi
140197866: mov       qword ptr [rsp + 0x130], rdi
14019786e: mov       rsi, qword ptr [rsi + 8]
140197872: mov       qword ptr [rsp + 0xf8], rsi
14019787a: mov       qword ptr [rsp + 0x100], r10
140197882: mov       dword ptr [rsp + 0x138], r10d
14019788a: xor       edi, edi
14019788c: lea       esi, [rdi + 1]
14019788f: mov       dword ptr [rsp + 0x13c], esi
140197896: test      al, al
140197898: je        0x1401976ca
14019789e: jmp       0x140197670
1401978a3: mov       esi, 8
1401978a8: movaps    xmm1, xmmword ptr [rip + 0x5c11421]
1401978af: movaps    xmm2, xmmword ptr [rip + 0x5c3579a]
1401978b6: xor       r11d, r11d
1401978b9: xor       r10d, r10d
1401978bc: xor       edi, edi
1401978be: mov       r9, rbx
1401978c1: jmp       0x14019793c
1401978c3: nop       word ptr cs:[rax + rax]
1401978d0: mov       r15d, r15d
1401978d3: shl       r15, 4
1401978d7: mov       r12d, dword ptr [rsi + r15 + 8]
1401978dc: not       r12d
1401978df: imul      r15, r12, 0x68
1401978e3: shl       r12, 5
1401978e7: movaps    xmm3, xmmword ptr [r11 + r12]
1401978ec: movsd     xmm4, qword ptr [r8 + r15 + 0x30]
1401978f3: unpcklps  xmm4, xmm4
1401978f6: movaps    xmm5, xmm4
1401978f9: mulps     xmm5, xmm1
1401978fc: mulps     xmm5, xmm3
1401978ff: mulps     xmm4, xmm2
140197902: mulps     xmm4, xmm3
140197905: movddup   xmm3, qword ptr [r11 + r12 + 0x10]
14019790c: mov       r12, qword ptr [rsp + 0x30]
140197911: movaps    xmm6, xmm5
140197914: movlhps   xmm6, xmm4
140197917: movhlps   xmm4, xmm5
14019791a: addps     xmm4, xmm6
14019791d: addps     xmm4, xmm3
140197920: movapd    xmm3, xmm0
140197924: cmpleps   xmm3, xmm4
140197928: cmpleps   xmm4, xmm0
14019792c: movsd     xmm4, xmm3
140197930: movmskps  ebp, xmm4
140197933: cmp       ebp, 0xf
140197936: je        0x140198266
14019793c: cmp       edi, r10d
14019793f: jne       0x140197a00
140197945: mov       r8, r9
140197948: nop       dword ptr [rax + rax]
140197950: cmp       r8, rdx
140197953: je        0x140197b54
140197959: lea       r9, [r8 + 4]
14019795d: mov       qword ptr [rsp + 0xe8], r9
140197965: mov       r8d, dword ptr [r8]
140197968: mov       r10, qword ptr [rsp + 0x58]
14019796d: mov       rsi, qword ptr [r10 + 0x108]
140197974: lea       r11, [r8 + r8*4]
140197978: shl       r11, 5
14019797c: mov       r10, qword ptr [rsi + r11 + 0x58]
140197981: mov       r8, r9
140197984: test      r10, r10
140197987: je        0x140197950
140197989: add       rsi, r11
14019798c: mov       r8d, dword ptr [rsi + 0x94]
140197993: mov       r11, qword ptr [rsp + 0x58]
140197998: mov       r11, qword ptr [r11 + 0x1a8]
14019799f: lea       r15, [r8 + r8*8]
1401979a3: lea       rdi, [r11 + r15*8]
1401979a7: mov       r8, qword ptr [r12 + 0x110]
1401979af: mov       r15, qword ptr [r11 + r15*8 + 0x40]
1401979b4: cmp       r8, r15
1401979b7: jae       0x140197a1b
1401979b9: mov       r11, qword ptr [rdi + 0x38]
1401979bd: mov       r8, qword ptr [r11 + r8*8]
1401979c1: test      r8, r8
1401979c4: je        0x140197a1b
1401979c6: mov       r11, qword ptr [rdi + 0x18]
1401979ca: not       r8
1401979cd: lea       r8, [r8 + r8*2]
1401979d1: shl       r8, 4
1401979d5: mov       r8, qword ptr [r11 + r8 + 0x10]
1401979da: mov       qword ptr [rsp + 0x118], r8
1401979e2: mov       r8, qword ptr [r12 + 0x118]
1401979ea: cmp       r8, r15
1401979ed: jb        0x140197a33
1401979ef: jmp       0x140197a83
1401979f4: nop       word ptr cs:[rax + rax]
140197a00: mov       r15d, edi
140197a03: lea       edi, [r15 + 1]
140197a07: mov       dword ptr [rsp + 0x13c], edi
140197a0e: test      al, al
140197a10: je        0x14019793c
140197a16: jmp       0x1401978d0
140197a1b: xor       r8d, r8d
140197a1e: mov       qword ptr [rsp + 0x118], r8
140197a26: mov       r8, qword ptr [r12 + 0x118]
140197a2e: cmp       r8, r15
140197a31: jae       0x140197a83
140197a33: mov       r11, qword ptr [rdi + 0x38]
140197a37: mov       r8, qword ptr [r11 + r8*8]
140197a3b: test      r8, r8
140197a3e: je        0x140197a83
140197a40: mov       r11, qword ptr [rdi + 0x18]
140197a44: not       r8
140197a47: lea       r8, [r8 + r8*2]
140197a4b: shl       r8, 4
140197a4f: mov       r8, qword ptr [r11 + r8 + 0x10]
140197a54: mov       qword ptr [rsp + 0x120], r8
140197a5c: mov       r11, qword ptr [r12 + 0x120]
140197a64: cmp       r11, r15
140197a67: jb        0x140197a9b
140197a69: xor       r11d, r11d
140197a6c: mov       qword ptr [rsp + 0x128], r11
140197a74: mov       r12, qword ptr [r12 + 0x128]
140197a7c: cmp       r12, r15
140197a7f: jb        0x140197adb
140197a81: jmp       0x140197afe
140197a83: xor       r8d, r8d
140197a86: mov       qword ptr [rsp + 0x120], r8
140197a8e: mov       r11, qword ptr [r12 + 0x120]
140197a96: cmp       r11, r15
140197a99: jae       0x140197a69
140197a9b: mov       r12, qword ptr [rdi + 0x38]
140197a9f: mov       r11, qword ptr [r12 + r11*8]
140197aa3: test      r11, r11
140197aa6: je        0x140197abe
140197aa8: mov       r12, qword ptr [rdi + 0x18]
140197aac: not       r11
140197aaf: lea       r11, [r11 + r11*2]
140197ab3: shl       r11, 4
140197ab7: mov       r11, qword ptr [r12 + r11 + 0x10]
140197abc: jmp       0x140197ac1
140197abe: xor       r11d, r11d
140197ac1: mov       r12, qword ptr [rsp + 0x30]
140197ac6: mov       qword ptr [rsp + 0x128], r11
140197ace: mov       r12, qword ptr [r12 + 0x128]
140197ad6: cmp       r12, r15
140197ad9: jae       0x140197afe
140197adb: mov       r15, qword ptr [rdi + 0x38]
140197adf: mov       r15, qword ptr [r15 + r12*8]
140197ae3: test      r15, r15
140197ae6: je        0x140197afe
140197ae8: mov       rdi, qword ptr [rdi + 0x18]
140197aec: not       r15
140197aef: lea       r15, [r15 + r15*2]
140197af3: shl       r15, 4
140197af7: mov       rdi, qword ptr [rdi + r15 + 0x10]
140197afc: jmp       0x140197b00
140197afe: xor       edi, edi
140197b00: mov       r12, qword ptr [rsp + 0x30]
140197b05: mov       qword ptr [rsp + 0x130], rdi
140197b0d: mov       rsi, qword ptr [rsi + 0x50]
140197b11: mov       qword ptr [rsp + 0x108], rsi
140197b19: mov       qword ptr [rsp + 0x110], r10
140197b21: mov       dword ptr [rsp + 0x138], r10d
140197b29: xor       r15d, r15d
140197b2c: lea       edi, [r15 + 1]
140197b30: mov       dword ptr [rsp + 0x13c], edi
140197b37: test      al, al
140197b39: je        0x14019793c
140197b3f: jmp       0x1401978d0
140197b44: mov       al, 1
140197b46: mov       dword ptr [rsp + 0x68], eax
140197b4a: mov       dword ptr [rsp + 0x64], 0
140197b52: jmp       0x140197b64
140197b54: mov       dword ptr [rsp + 0x68], 0
140197b5c: mov       dword ptr [rsp + 0x64], 0
140197b64: mov       edx, dword ptr [rsp + 0x50]
140197b68: lea       rsi, [rbx + rcx*4]
140197b6c: mov       eax, dword ptr [rsp + 0x6c]
140197b70: sub       eax, edx
140197b72: cmp       eax, 0xc233b000
140197b77: mov       ecx, 0xc233b000
140197b7c: cmovb     ecx, eax
140197b7f: mov       dword ptr [rsp + 0xa0], ecx
140197b86: mov       rax, qword ptr [rsp + 0x70]
140197b8b: lea       rax, [rax + 0x20]
140197b8f: mov       qword ptr [rsp + 0x170], rax
140197b97: mov       qword ptr [rsp + 0x80], 0
140197ba3: mov       eax, 8
140197ba8: mov       qword ptr [rsp + 0xa8], rax
140197bb0: xorps     xmm8, xmm8
140197bb4: movaps    xmm10, xmmword ptr [rip + 0x5c11114]
140197bbc: movaps    xmm11, xmmword ptr [rip + 0x5c3548c]
140197bc4: mov       qword ptr [rsp + 0x48], 0
140197bcd: mov       qword ptr [rsp + 0x40], 0
140197bd6: mov       qword ptr [rsp + 0x38], 0
140197bdf: xor       edi, edi
140197be1: xor       r15d, r15d
140197be4: mov       qword ptr [rsp + 0x78], rsi
140197be9: cmp       byte ptr [rsp + 0x68], 0
140197bee: je        0x140197c90
140197bf4: cmp       r15d, edi
140197bf7: jne       0x140197e76
140197bfd: nop       dword ptr [rax]
140197c00: cmp       rbx, rsi
140197c03: je        0x1401981f5
140197c09: mov       ecx, dword ptr [rbx]
140197c0b: add       rbx, 4
140197c0f: mov       rax, qword ptr [rsp + 0x58]
140197c14: mov       rax, qword ptr [rax + 0x1a8]
140197c1b: lea       rcx, [rcx + rcx*8]
140197c1f: mov       rdi, qword ptr [rax + rcx*8 + 0x10]
140197c24: test      rdi, rdi
140197c27: je        0x140197c00
140197c29: lea       rcx, [rax + rcx*8]
140197c2d: mov       rdx, qword ptr [rcx + 0x40]
140197c31: mov       rax, qword ptr [rcx + 0x18]
140197c35: mov       rcx, qword ptr [rcx + 0x38]
140197c39: mov       r8, qword ptr [r12 + 0x118]
140197c41: cmp       r8, rdx
140197c44: jae       0x140197d32
140197c4a: mov       r8, qword ptr [rcx + r8*8]
140197c4e: test      r8, r8
140197c51: je        0x140197d32
140197c57: not       r8
140197c5a: lea       r8, [r8 + r8*2]
140197c5e: shl       r8, 4
140197c62: mov       r8, qword ptr [rax + r8 + 0x10]
140197c67: mov       qword ptr [rsp + 0x48], r8
140197c6c: mov       r8, qword ptr [r12 + 0x120]
140197c74: cmp       r8, rdx
140197c77: jb        0x140197d48
140197c7d: jmp       0x140197dc0
140197c82: nop       word ptr cs:[rax + rax]
140197c90: cmp       r15d, edi
140197c93: jne       0x140197ed6
140197c99: nop       dword ptr [rax]
140197ca0: cmp       rbx, rsi
140197ca3: je        0x1401981f5
140197ca9: mov       ecx, dword ptr [rbx]
140197cab: add       rbx, 4
140197caf: mov       rax, qword ptr [rsp + 0x58]
140197cb4: mov       rax, qword ptr [rax + 0x108]
140197cbb: lea       rcx, [rcx + rcx*4]
140197cbf: shl       rcx, 5
140197cc3: mov       rdi, qword ptr [rax + rcx + 0x58]
140197cc8: test      rdi, rdi
140197ccb: je        0x140197ca0
140197ccd: add       rax, rcx
140197cd0: mov       ecx, dword ptr [rax + 0x94]
140197cd6: mov       rdx, qword ptr [rsp + 0x58]
140197cdb: mov       rdx, qword ptr [rdx + 0x1a8]
140197ce2: lea       r9, [rcx + rcx*8]
140197ce6: mov       r8, qword ptr [rdx + r9*8 + 0x40]
140197ceb: mov       rcx, qword ptr [rdx + r9*8 + 0x18]
140197cf0: mov       rdx, qword ptr [rdx + r9*8 + 0x38]
140197cf5: mov       r9, qword ptr [r12 + 0x118]
140197cfd: cmp       r9, r8
140197d00: jae       0x140197d79
140197d02: mov       r9, qword ptr [rdx + r9*8]
140197d06: test      r9, r9
140197d09: je        0x140197d79
140197d0b: not       r9
140197d0e: lea       r9, [r9 + r9*2]
140197d12: shl       r9, 4
140197d16: mov       r9, qword ptr [rcx + r9 + 0x10]
140197d1b: mov       qword ptr [rsp + 0x48], r9
140197d20: mov       r9, qword ptr [r12 + 0x120]
140197d28: cmp       r9, r8
140197d2b: jb        0x140197d8f
140197d2d: jmp       0x140197df6
140197d32: mov       qword ptr [rsp + 0x48], 0
140197d3b: mov       r8, qword ptr [r12 + 0x120]
140197d43: cmp       r8, rdx
140197d46: jae       0x140197dc0
140197d48: mov       r8, qword ptr [rcx + r8*8]
140197d4c: test      r8, r8
140197d4f: je        0x140197dc0
140197d51: not       r8
140197d54: lea       r8, [r8 + r8*2]
140197d58: shl       r8, 4
140197d5c: mov       r8, qword ptr [rax + r8 + 0x10]
140197d61: mov       qword ptr [rsp + 0x40], r8
140197d66: mov       r8, qword ptr [r12 + 0x128]
140197d6e: cmp       r8, rdx
140197d71: jae       0x140197e2c
140197d77: jmp       0x140197dd6
140197d79: mov       qword ptr [rsp + 0x48], 0
140197d82: mov       r9, qword ptr [r12 + 0x120]
140197d8a: cmp       r9, r8
140197d8d: jae       0x140197df6
140197d8f: mov       r9, qword ptr [rdx + r9*8]
140197d93: test      r9, r9
140197d96: je        0x140197df6
140197d98: not       r9
140197d9b: lea       r9, [r9 + r9*2]
140197d9f: shl       r9, 4
140197da3: mov       r9, qword ptr [rcx + r9 + 0x10]
140197da8: mov       qword ptr [rsp + 0x40], r9
140197dad: mov       r9, qword ptr [r12 + 0x128]
140197db5: cmp       r9, r8
140197db8: jae       0x140197e80
140197dbe: jmp       0x140197e0c
140197dc0: mov       qword ptr [rsp + 0x40], 0
140197dc9: mov       r8, qword ptr [r12 + 0x128]
140197dd1: cmp       r8, rdx
140197dd4: jae       0x140197e2c
140197dd6: mov       rdx, qword ptr [rcx + r8*8]
140197dda: test      rdx, rdx
140197ddd: je        0x140197e2c
140197ddf: not       rdx
140197de2: lea       rdx, [rdx + rdx*2]
140197de6: shl       rdx, 4
140197dea: mov       rdx, qword ptr [rax + rdx + 0x10]
140197def: mov       qword ptr [rsp + 0x38], rdx
140197df4: jmp       0x140197e35
140197df6: mov       qword ptr [rsp + 0x40], 0
140197dff: mov       r9, qword ptr [r12 + 0x128]
140197e07: cmp       r9, r8
140197e0a: jae       0x140197e80
140197e0c: mov       r8, qword ptr [rdx + r9*8]
140197e10: test      r8, r8
140197e13: je        0x140197e80
140197e15: not       r8
140197e18: lea       r8, [r8 + r8*2]
140197e1c: shl       r8, 4
140197e20: mov       r8, qword ptr [rcx + r8 + 0x10]
140197e25: mov       qword ptr [rsp + 0x38], r8
140197e2a: jmp       0x140197e89
140197e2c: mov       qword ptr [rsp + 0x38], 0
140197e35: mov       rdx, qword ptr [r12 + 0x110]
140197e3d: mov       rcx, qword ptr [rcx + rdx*8]
140197e41: not       rcx
140197e44: lea       rcx, [rcx + rcx*2]
140197e48: shl       rcx, 4
140197e4c: mov       rdx, qword ptr [rax + rcx + 0x10]
140197e51: mov       qword ptr [rsp + 0x80], rdx
140197e59: mov       rdx, qword ptr [rax + rcx + 0x20]
140197e5e: mov       qword ptr [rsp + 0x90], rdx
140197e66: mov       rax, qword ptr [rax + rcx + 0x28]
140197e6b: mov       qword ptr [rsp + 0x88], rax
140197e73: xor       r15d, r15d
140197e76: mov       dword ptr [rsp + 0x2c], r15d
140197e7b: mov       r14d, r15d
140197e7e: jmp       0x140197ef2
140197e80: mov       qword ptr [rsp + 0x38], 0
140197e89: mov       r8, qword ptr [r12 + 0x110]
140197e91: mov       rdx, qword ptr [rdx + r8*8]
140197e95: not       rdx
140197e98: lea       rdx, [rdx + rdx*2]
140197e9c: shl       rdx, 4
140197ea0: mov       r8, qword ptr [rcx + rdx + 0x10]
140197ea5: mov       qword ptr [rsp + 0x80], r8
140197ead: mov       r8, qword ptr [rcx + rdx + 0x20]
140197eb2: mov       qword ptr [rsp + 0x90], r8
140197eba: mov       rcx, qword ptr [rcx + rdx + 0x28]
140197ebf: mov       qword ptr [rsp + 0x88], rcx
140197ec7: mov       rax, qword ptr [rax + 0x50]
140197ecb: mov       qword ptr [rsp + 0xa8], rax
140197ed3: xor       r15d, r15d
140197ed6: mov       dword ptr [rsp + 0x2c], r15d
140197edb: mov       eax, r15d
140197ede: shl       rax, 4
140197ee2: mov       rcx, qword ptr [rsp + 0xa8]
140197eea: mov       r14d, dword ptr [rcx + rax + 8]
140197eef: not       r14d
140197ef2: mov       rax, qword ptr [rsp + 0x80]
140197efa: lea       rax, [rax + r14*8]
140197efe: mov       qword ptr [rsp + 0x50], rax
140197f03: mov       rax, qword ptr [rsp + 0x90]
140197f0b: lea       rax, [rax + r14*4]
140197f0f: mov       rcx, qword ptr [rsp + 0x88]
140197f17: lea       rcx, [rcx + r14*4]
140197f1b: mov       qword ptr [rsp + 0xb0], rcx
140197f23: imul      rsi, r14, 0x68
140197f27: add       rsi, qword ptr [rsp + 0x48]
140197f2c: mov       r15, r14
140197f2f: shl       r15, 5
140197f33: add       r15, qword ptr [rsp + 0x40]
140197f38: shl       r14, 4
140197f3c: add       r14, qword ptr [rsp + 0x38]
140197f41: movss     xmm13, dword ptr [rsi + 0x34]
140197f47: movss     xmm14, dword ptr [rsi + 0x64]
140197f4d: movss     xmm12, dword ptr [rsi + 0x3c]
140197f53: mulss     xmm12, xmm14
140197f58: mov       ecx, dword ptr [rsp + 0x6c]
140197f5c: sub       ecx, dword ptr [rax]
140197f5e: cmp       ecx, dword ptr [rsp + 0xa0]
140197f65: jae       0x1401980b0
140197f6b: xorps     xmm6, xmm6
140197f6e: mov       rcx, qword ptr [rsp + 0x70]
140197f73: cmp       qword ptr [rcx + 0x18], 0
140197f78: je        0x1401980cd
140197f7e: mov       rdx, qword ptr [r14]
140197f81: mov       r13, qword ptr [r14 + 8]
140197f85: mov       rbp, r12
140197f88: mov       r12, rcx
140197f8b: mov       rcx, qword ptr [rsp + 0x170]
140197f93: mov       qword ptr [rsp + 0x168], rdx
140197f9b: mov       r8, r13
140197f9e: call      0x14000d750
140197fa3: mov       r8, r13
140197fa6: mov       rcx, rax
140197fa9: shr       rcx, 0x39
140197fad: mov       r13, qword ptr [r12]
140197fb1: mov       r9, qword ptr [r12 + 8]
140197fb6: mov       r12, rbp
140197fb9: movd      xmm0, ecx
140197fbd: punpcklbw xmm0, xmm0
140197fc1: pshuflw   xmm0, xmm0, 0
140197fc6: pshufd    xmm15, xmm0, 0x44
140197fcc: xor       r10d, r10d
140197fcf: and       rax, r9
140197fd2: movdqu    xmm9, xmmword ptr [r13 + rax]
140197fd9: movdqa    xmm0, xmm9
140197fde: pcmpeqb   xmm0, xmm15
140197fe3: pmovmskb  ecx, xmm0
140197fe7: test      ecx, ecx
140197fe9: je        0x140198080
140197fef: mov       qword ptr [rsp + 0x158], rax
140197ff7: mov       qword ptr [rsp + 0x150], r9
140197fff: mov       qword ptr [rsp + 0x148], r10
140198007: mov       qword ptr [rsp + 0x160], rcx
14019800f: tzcnt     ecx, ecx
140198013: add       rcx, rax
140198016: and       rcx, r9
140198019: neg       rcx
14019801c: lea       rax, [rcx + rcx*2]
140198020: cmp       r8, qword ptr [r13 + rax*8 - 0x10]
140198025: jne       0x14019804e
140198027: lea       r12, [rax*8]
14019802f: add       r12, r13
140198032: mov       rdx, qword ptr [r12 - 0x18]
140198037: mov       rcx, qword ptr [rsp + 0x168]
14019803f: mov       rbp, r8
140198042: call      0x145bfa0e1
140198047: mov       r8, rbp
14019804a: test      eax, eax
14019804c: je        0x1401980bc
14019804e: mov       rcx, qword ptr [rsp + 0x160]
140198056: lea       eax, [rcx - 1]
140198059: and       ax, cx
14019805c: mov       ecx, eax
14019805e: mov       rax, qword ptr [rsp + 0x158]
140198066: mov       r12, qword ptr [rsp + 0x30]
14019806b: mov       r9, qword ptr [rsp + 0x150]
140198073: mov       r10, qword ptr [rsp + 0x148]
14019807b: jne       0x140198007
14019807d: nop       dword ptr [rax]
140198080: pcmpeqd   xmm0, xmm0
140198084: pcmpeqb   xmm9, xmm0
140198089: pmovmskb  ecx, xmm9
14019808e: test      ecx, ecx
140198090: jne       0x1401980c8
140198092: add       rax, r10
140198095: add       rax, 0x10
140198099: add       r10, 0x10
14019809d: jmp       0x140197fcf
1401980a2: nop       word ptr cs:[rax + rax]
1401980b0: mov       rax, qword ptr [rsp + 0x50]
1401980b5: movss     xmm6, dword ptr [rax + 4]
1401980ba: jmp       0x1401980c8
1401980bc: movss     xmm6, dword ptr [r12 - 8]
1401980c3: mov       r12, qword ptr [rsp + 0x30]
1401980c8: mov       rcx, qword ptr [rsp + 0x70]
1401980cd: mov       eax, dword ptr [rsp + 0x9c]
1401980d4: cmp       eax, dword ptr [rsi + 0x58]
1401980d7: sete      al
1401980da: test      byte ptr [rsp + 0x64], al
1401980de: je        0x140198150
1401980e0: mov       rax, qword ptr [rsp + 0xb8]
1401980e8: test      byte ptr [rax], 1
1401980eb: je        0x140198150
1401980ed: movss     xmm0, dword ptr [rsi + 0x30]
1401980f2: movaps    xmm1, xmmword ptr [r15]
1401980f6: shufps    xmm0, xmm13, 0
1401980fb: movaps    xmm2, xmm0
1401980fe: mulps     xmm2, xmm10
140198102: mulps     xmm2, xmm1
140198105: mulps     xmm0, xmm11
140198109: mulps     xmm0, xmm1
14019810c: movddup   xmm1, qword ptr [r15 + 0x10]
140198112: movsd     xmm3, qword ptr [rax + 4]
140198117: movddup   xmm3, xmm3
14019811b: movaps    xmm4, xmm2
14019811e: movlhps   xmm4, xmm0
140198121: movhlps   xmm0, xmm2
140198124: addps     xmm0, xmm4
140198127: addps     xmm0, xmm1
14019812a: movapd    xmm1, xmm3
14019812e: cmpleps   xmm1, xmm0
140198132: cmpleps   xmm0, xmm3
140198136: movsd     xmm0, xmm1
14019813a: movmskps  eax, xmm0
14019813d: cmp       eax, 0xf
140198140: je        0x140198182
140198142: nop       word ptr cs:[rax + rax]
140198150: mov       rsi, qword ptr [rsp + 0x78]
140198155: mov       r15d, dword ptr [rsp + 0x2c]
14019815a: ucomiss   xmm13, xmm8
14019815e: jbe       0x1401981a0
140198160: mulss     xmm13, xmm14
140198165: subss     xmm12, xmm13
14019816a: maxss     xmm12, xmm8
14019816f: pxor      xmm0, xmm0
140198173: maxss     xmm0, xmm6
140198177: minss     xmm12, xmm0
14019817c: movaps    xmm6, xmm12
140198180: jmp       0x1401981a5
140198182: subss     xmm6, xmm7
140198186: mov       rsi, qword ptr [rsp + 0x78]
14019818b: mov       r15d, dword ptr [rsp + 0x2c]
140198190: ucomiss   xmm13, xmm8
140198194: ja        0x140198160
140198196: nop       word ptr cs:[rax + rax]
1401981a0: maxss     xmm6, xmm8
1401981a5: inc       r15d
1401981a8: mov       rax, qword ptr [rsp + 0x178]
1401981b0: mov       edx, dword ptr [rsp + 0xa4]
1401981b7: mov       dword ptr [rax], edx
1401981b9: mov       rdx, qword ptr [r14]
1401981bc: mov       r8, qword ptr [r14 + 8]
1401981c0: movaps    xmm3, xmm6
1401981c3: call      0x1400bf5a0
1401981c8: mov       rcx, qword ptr [rsp + 0x50]
1401981cd: movss     xmm0, dword ptr [rcx + 4]
1401981d2: ucomiss   xmm0, xmm6
1401981d5: jne       0x1401981dd
1401981d7: jnp       0x140197be9
1401981dd: mov       eax, dword ptr [rsp + 0x6c]
1401981e1: mov       rdx, qword ptr [rsp + 0xb0]
1401981e9: mov       dword ptr [rdx], eax
1401981eb: movss     dword ptr [rcx + 4], xmm6
1401981f0: jmp       0x140197be9
1401981f5: movaps    xmm6, xmmword ptr [rsp + 0x190]
1401981fd: movaps    xmm7, xmmword ptr [rsp + 0x1a0]
140198205: movaps    xmm8, xmmword ptr [rsp + 0x1b0]
14019820e: movaps    xmm9, xmmword ptr [rsp + 0x1c0]
140198217: movaps    xmm10, xmmword ptr [rsp + 0x1d0]
140198220: movaps    xmm11, xmmword ptr [rsp + 0x1e0]
140198229: movaps    xmm12, xmmword ptr [rsp + 0x1f0]
140198232: movaps    xmm13, xmmword ptr [rsp + 0x200]
14019823b: movaps    xmm14, xmmword ptr [rsp + 0x210]
140198244: movaps    xmm15, xmmword ptr [rsp + 0x220]
14019824d: add       rsp, 0x238
140198254: pop       rbx
140198255: pop       rbp
140198256: pop       rdi
140198257: pop       rsi
140198258: pop       r12
14019825a: pop       r13
14019825c: pop       r14
14019825e: pop       r15
140198260: ret
140198261: add       r8, rdi
140198264: jmp       0x140198269
140198266: add       r8, r15
140198269: mov       edx, dword ptr [r8 + 0x58]
14019826d: lea       rcx, [rsp + 0xc0]
140198275: call      0x140129000
14019827a: mov       dword ptr [rsp + 0x9c], eax
140198281: mov       rbx, qword ptr [r12 + 0xf8]
140198289: mov       rcx, qword ptr [r12 + 0x100]
140198291: movzx     eax, byte ptr [r12 + 0x108]
14019829a: mov       dword ptr [rsp + 0x68], eax
14019829e: mov       al, 1
1401982a0: mov       dword ptr [rsp + 0x64], eax
1401982a4: jmp       0x140197b64
