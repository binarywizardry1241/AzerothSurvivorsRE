140c04400: push      rbp
140c04401: push      r15
140c04403: push      r14
140c04405: push      r13
140c04407: push      r12
140c04409: push      rsi
140c0440a: push      rdi
140c0440b: push      rbx
140c0440c: sub       rsp, 0xf8
140c04413: lea       rbp, [rsp + 0x80]
140c0441b: movaps    xmmword ptr [rbp + 0x60], xmm6
140c0441f: mov       qword ptr [rbp + 0x58], 0xfffffffffffffffe
140c04427: mov       rax, qword ptr [rbp + 0xe8]
140c0442e: mov       rcx, qword ptr [rbp + 0xe0]
140c04435: mov       rbx, qword ptr [rdx + 0x10]
140c04439: mov       rdx, qword ptr [rdx + 0x18]
140c0443d: mov       qword ptr [rbp + 8], rdx
140c04441: mov       rdx, qword ptr [r8]
140c04444: mov       qword ptr [rbp + 0x30], rdx
140c04448: mov       r14, qword ptr [r8 + 0x10]
140c0444c: mov       esi, dword ptr [r8 + 0x1c]
140c04450: mov       rdx, qword ptr [rcx]
140c04453: mov       qword ptr [rbp + 0x28], rdx
140c04457: mov       rdx, qword ptr [rcx + 8]
140c0445b: mov       qword ptr [rbp - 8], rdx
140c0445f: mov       edi, dword ptr [rcx + 0x10]
140c04462: mov       ecx, dword ptr [rcx + 0x14]
140c04465: mov       dword ptr [rbp + 0x48], ecx
140c04468: mov       rcx, qword ptr [rax]
140c0446b: mov       qword ptr [rbp - 0x28], rcx
140c0446f: mov       rcx, qword ptr [rax + 8]
140c04473: mov       qword ptr [rbp], rcx
140c04477: mov       eax, dword ptr [rax + 0x14]
140c0447a: mov       dword ptr [rbp - 0x2c], eax
140c0447d: movups    xmm0, xmmword ptr [r9]
140c04481: movaps    xmmword ptr [rbp - 0x50], xmm0
140c04485: mov       rax, qword ptr [r9 + 0x10]
140c04489: mov       qword ptr [rbp - 0x40], rax
140c0448d: lea       rcx, [rbp - 0x18]
140c04491: lea       rdx, [rbp - 0x50]
140c04495: call      0x1400bfb90
140c0449a: cmp       byte ptr [rbp - 0x18], 0
140c0449e: je        0x140c044ad
140c044a0: movss     xmm6, dword ptr [rip + 0x5198df8]
140c044a8: movaps    xmm0, xmm6
140c044ab: jmp       0x140c044e2
140c044ad: mov       rax, qword ptr [rbp - 0x10]
140c044b1: mov       ecx, dword ptr [rax + 0xc0]
140c044b7: cmp       ecx, 1
140c044ba: adc       ecx, 0
140c044bd: lea       rdx, [rax + 0xc8]
140c044c4: lea       r8, [rax + 0xbc]
140c044cb: cmp       byte ptr [rax + 0xb8], 0
140c044d2: cmovne    rdx, r8
140c044d6: movss     xmm6, dword ptr [rdx]
140c044da: xorps     xmm0, xmm0
140c044dd: cvtsi2ss  xmm0, rcx
140c044e2: mov       r11, qword ptr [rbp + 0x30]
140c044e6: mov       eax, dword ptr [r11 + 0x30]
140c044ea: cvtsi2ss  xmm1, rax
140c044ef: mulss     xmm1, xmm6
140c044f3: movss     dword ptr [rbp + 0x54], xmm1
140c044f8: movzx     eax, byte ptr [r11]
140c044fc: cmp       al, 1
140c044fe: mov       qword ptr [rbp + 0x20], rbx
140c04502: mov       qword ptr [rbp + 0x10], r14
140c04506: mov       dword ptr [rbp + 0x38], esi
140c04509: jne       0x140c04537
140c0450b: movzx     ecx, word ptr [r11 + 1]
140c04510: movzx     ebx, byte ptr [r11 + 3]
140c04515: shl       ebx, 0x10
140c04518: or        ebx, ecx
140c0451a: lea       rdx, [r11 + 4]
140c0451e: lea       rcx, [r11 + 8]
140c04522: mov       r8d, dword ptr [r11 + 0xc]
140c04526: movzx     r13d, byte ptr [r11 + 0x10]
140c0452b: shl       r13, 0x20
140c0452f: or        r13, r8
140c04532: mov       r10b, 1
140c04535: jmp       0x140c04546
140c04537: mov       rcx, qword ptr [r11 + 8]
140c0453b: lea       rdx, [rcx + 0x68]
140c0453f: add       rcx, 0x6c
140c04543: xor       r10d, r10d
140c04546: movss     xmm1, dword ptr [rbp + 0x54]
140c0454b: divss     xmm1, xmm0
140c0454f: movss     dword ptr [rbp + 0x54], xmm1
140c04554: mov       r9d, dword ptr [rdx]
140c04557: mov       r14d, dword ptr [rcx]
140c0455a: movzx     r8d, byte ptr [r11 + 0x18]
140c0455f: cmp       r8b, 2
140c04563: jne       0x140c0497d
140c04569: mov       rax, qword ptr [rbp + 0x10]
140c0456d: mov       ecx, dword ptr [rbp + 0x38]
140c04570: mov       dword ptr [rax], ecx
140c04572: mov       byte ptr [r11 + 0x18], r10b
140c04576: mov       word ptr [r11 + 0x19], bx
140c0457b: shr       ebx, 0x10
140c0457e: mov       byte ptr [r11 + 0x1b], bl
140c04582: mov       dword ptr [r11 + 0x1c], r9d
140c04586: mov       dword ptr [r11 + 0x20], r14d
140c0458a: mov       qword ptr [r11 + 0x24], r13
140c0458e: movss     xmm0, dword ptr [rbp + 0x54]
140c04593: movss     dword ptr [r11 + 0x2c], xmm0
140c04599: divss     xmm0, xmm6
140c0459d: call      0x145bfa19b
140c045a2: mov       r9, qword ptr [rbp]
140c045a6: mov       r11, qword ptr [rbp + 0x30]
140c045aa: movaps    xmm6, xmm0
140c045ad: xorps     xmm0, xmm0
140c045b0: minss     xmm6, xmm0
140c045b4: mov       rcx, qword ptr [rbp - 0x28]
140c045b8: mov       r13, qword ptr [rcx + 0xf8]
140c045bf: mov       rax, qword ptr [rcx + 0x100]
140c045c6: lea       r12, [r13 + rax*4]
140c045cb: movzx     eax, byte ptr [rcx + 0x108]
140c045d2: mov       byte ptr [rbp - 8], al
140c045d5: mov       rax, qword ptr [rbp + 0x20]
140c045d9: test      rax, rax
140c045dc: mov       rcx, qword ptr [rbp + 8]
140c045e0: cmovne    rcx, rax
140c045e4: mov       qword ptr [rbp + 8], rcx
140c045e8: lea       rax, [r11 + 1]
140c045ec: mov       qword ptr [rbp - 0x20], rax
140c045f0: xor       r14d, r14d
140c045f3: mov       r10d, 8
140c045f9: mov       r8d, 8
140c045ff: mov       qword ptr [rbp + 0x40], 0
140c04607: xor       r15d, r15d
140c0460a: cmp       byte ptr [rbp - 8], 0
140c0460e: je        0x140c0475b
140c04614: nop       word ptr cs:[rax + rax]
140c04620: mov       rdi, rdx
140c04623: mov       eax, r14d
140c04626: jmp       0x140c04688
140c04628: nop       dword ptr [rax + rax]
140c04630: lea       rcx, [rcx + rdx*8]
140c04634: mov       rdx, qword ptr [rbp - 0x28]
140c04638: mov       rdx, qword ptr [rdx + 0x110]
140c0463f: mov       r8, qword ptr [rcx + 0x38]
140c04643: mov       rdx, qword ptr [r8 + rdx*8]
140c04647: mov       r8, qword ptr [rcx + 8]
140c0464b: mov       rcx, qword ptr [rcx + 0x18]
140c0464f: not       rdx
140c04652: lea       rdx, [rdx + rdx*2]
140c04656: shl       rdx, 4
140c0465a: mov       rsi, qword ptr [rcx + rdx + 0x10]
140c0465f: mov       qword ptr [rbp + 0x40], rsi
140c04663: mov       rcx, qword ptr [rcx + rdx + 0x28]
140c04668: mov       qword ptr [rbp + 0x18], rcx
140c0466c: add       r13, 4
140c04670: xor       r15d, r15d
140c04673: mov       r14d, eax
140c04676: mov       ecx, r15d
140c04679: inc       r15d
140c0467c: mov       rdx, qword ptr [r8 + rcx*8]
140c04680: test      edx, edx
140c04682: jne       0x140c048e1
140c04688: cmp       r15d, eax
140c0468b: jne       0x140c04676
140c0468d: cmp       r13, r12
140c04690: je        0x140c046bf
140c04692: mov       rcx, qword ptr [r9 + 0x1a8]
140c04699: nop       dword ptr [rax]
140c046a0: mov       eax, dword ptr [r13]
140c046a4: lea       rdx, [rax + rax*8]
140c046a8: mov       rax, qword ptr [rcx + rdx*8 + 0x10]
140c046ad: test      rax, rax
140c046b0: jne       0x140c04630
140c046b6: add       r13, 4
140c046ba: cmp       r13, r12
140c046bd: jne       0x140c046a0
140c046bf: movabs    rax, 0xffffffff00000000
140c046c9: and       rbx, rax
140c046cc: mov       rdx, rdi
140c046cf: jmp       0x140c047b6
140c046d4: nop       word ptr cs:[rax + rax]
140c046e0: add       rax, rdx
140c046e3: mov       edx, dword ptr [rax + 0x94]
140c046e9: mov       rdi, r8
140c046ec: mov       r8, qword ptr [r9 + 0x1a8]
140c046f3: lea       rdx, [rdx + rdx*8]
140c046f7: mov       r9, qword ptr [rbp - 0x28]
140c046fb: mov       r9, qword ptr [r9 + 0x110]
140c04702: mov       r10, qword ptr [r8 + rdx*8 + 0x18]
140c04707: mov       rdx, qword ptr [r8 + rdx*8 + 0x38]
140c0470c: mov       r8, rdi
140c0470f: mov       rdx, qword ptr [rdx + r9*8]
140c04713: not       rdx
140c04716: lea       rdx, [rdx + rdx*2]
140c0471a: shl       rdx, 4
140c0471e: mov       r9, qword ptr [r10 + rdx + 0x10]
140c04723: mov       qword ptr [rbp + 0x40], r9
140c04727: mov       rdx, qword ptr [r10 + rdx + 0x28]
140c0472c: mov       qword ptr [rbp + 0x18], rdx
140c04730: mov       r9, qword ptr [rbp]
140c04734: mov       r10, qword ptr [rax + 0x50]
140c04738: add       r13, 4
140c0473c: xor       r15d, r15d
140c0473f: mov       r14d, ecx
140c04742: mov       rdx, rsi
140c04745: mov       ecx, r15d
140c04748: shl       rcx, 4
140c0474c: inc       r15d
140c0474f: mov       rax, qword ptr [r10 + rcx]
140c04753: test      eax, eax
140c04755: jne       0x140c04900
140c0475b: cmp       r15d, r14d
140c0475e: jne       0x140c04745
140c04760: cmp       r13, r12
140c04763: je        0x140c04924
140c04769: mov       rsi, rdx
140c0476c: mov       rax, qword ptr [r9 + 0x108]
140c04773: nop       word ptr cs:[rax + rax]
140c04780: mov       ecx, dword ptr [r13]
140c04784: lea       rdx, [rcx + rcx*4]
140c04788: shl       rdx, 5
140c0478c: mov       rcx, qword ptr [rax + rdx + 0x58]
140c04791: test      rcx, rcx
140c04794: jne       0x140c046e0
140c0479a: add       r13, 4
140c0479e: cmp       r13, r12
140c047a1: jne       0x140c04780
140c047a3: movabs    rax, 0xffffffff00000000
140c047ad: and       rbx, rax
140c047b0: mov       r15d, r14d
140c047b3: mov       rdx, rsi
140c047b6: test      ebx, ebx
140c047b8: je        0x140c04bc8
140c047be: cmp       byte ptr [r11], 1
140c047c2: jne       0x140c047f0
140c047c4: mov       rcx, qword ptr [rbp - 0x20]
140c047c8: mov       eax, dword ptr [rcx]
140c047ca: mov       ecx, dword ptr [rcx + 3]
140c047cd: mov       dword ptr [rbp - 0x4d], ecx
140c047d0: mov       dword ptr [rbp - 0x50], eax
140c047d3: mov       rax, qword ptr [rbp + 0x10]
140c047d7: mov       al, byte ptr [r11 + 0x10]
140c047db: mov       qword ptr [rbp + 0x10], rax
140c047df: mov       al, 1
140c047e1: mov       dword ptr [rbp + 0x38], eax
140c047e4: jmp       0x140c04805
140c047e6: nop       word ptr cs:[rax + rax]
140c047f0: mov       rax, qword ptr [r11 + 8]
140c047f4: lock inc  qword ptr [rax]
140c047f8: jle       0x140c04be0
140c047fe: mov       dword ptr [rbp + 0x38], 0
140c04805: mov       rax, qword ptr [r11 + 8]
140c04809: mov       qword ptr [rbp + 0x48], rax
140c0480d: mov       eax, dword ptr [rbp - 0x50]
140c04810: mov       ecx, dword ptr [rbp - 0x4d]
140c04813: mov       dword ptr [rbp - 0x15], ecx
140c04816: mov       dword ptr [rbp - 0x18], eax
140c04819: mov       eax, dword ptr [rbp - 0x2c]
140c0481c: mov       rcx, qword ptr [rbp + 0x28]
140c04820: mov       dword ptr [rcx], eax
140c04822: movzx     eax, byte ptr [rdx]
140c04825: cmp       al, 1
140c04827: mov       qword ptr [rbp + 0x20], rdx
140c0482b: ja        0x140c04860
140c0482d: test      al, al
140c0482f: jne       0x140c04860
140c04831: mov       rax, qword ptr [rbp + 0x20]
140c04835: mov       rax, qword ptr [rax + 8]
140c04839: lock dec  qword ptr [rax]
140c0483d: jne       0x140c04860
140c0483f: mov       rax, qword ptr [rbp + 0x20]
140c04843: lea       rcx, [rax + 8]
140c04847: mov       rdi, r8
140c0484a: mov       rsi, r10
140c0484d: call      0x144985170
140c04852: mov       r10, rsi
140c04855: mov       r8, rdi
140c04858: mov       r9, qword ptr [rbp]
140c0485c: mov       r11, qword ptr [rbp + 0x30]
140c04860: mov       eax, dword ptr [rbp + 0x38]
140c04863: mov       rdx, qword ptr [rbp + 0x20]
140c04867: mov       byte ptr [rdx], al
140c04869: mov       eax, dword ptr [rbp - 0x18]
140c0486c: mov       ecx, dword ptr [rbp - 0x15]
140c0486f: mov       dword ptr [rdx + 1], eax
140c04872: mov       dword ptr [rdx + 4], ecx
140c04875: mov       rax, qword ptr [rbp + 0x48]
140c04879: mov       qword ptr [rdx + 8], rax
140c0487d: mov       rax, qword ptr [rbp + 0x10]
140c04881: mov       qword ptr [rdx + 0x10], rax
140c04885: movss     xmm0, dword ptr [rbp + 0x54]
140c0488a: movss     dword ptr [rdx + 0x18], xmm0
140c0488f: mov       rcx, qword ptr [rbp + 8]
140c04893: mov       rax, qword ptr [rcx]
140c04896: mov       rdi, qword ptr [rcx + 0x10]
140c0489a: sub       rax, rdi
140c0489d: cmp       rax, 0x17
140c048a1: jbe       0x140c04939
140c048a7: mov       rsi, qword ptr [rbp + 8]
140c048ab: mov       rax, qword ptr [rsi + 8]
140c048af: lea       rcx, [rip - 0x21b796]
140c048b6: mov       qword ptr [rax + rdi], rcx
140c048ba: mov       qword ptr [rax + rdi + 8], rbx
140c048bf: movss     dword ptr [rax + rdi + 0x10], xmm6
140c048c5: mov       byte ptr [rax + rdi + 0x14], 0
140c048ca: add       rdi, 0x18
140c048ce: mov       qword ptr [rsi + 0x10], rdi
140c048d2: cmp       byte ptr [rbp - 8], 0
140c048d6: je        0x140c0475b
140c048dc: jmp       0x140c04620
140c048e1: mov       rax, qword ptr [rbp + 0x18]
140c048e5: lea       rax, [rax + rcx*4]
140c048e9: mov       qword ptr [rbp + 0x28], rax
140c048ed: shl       rcx, 5
140c048f1: add       rcx, qword ptr [rbp + 0x40]
140c048f5: mov       rbx, rdx
140c048f8: mov       rdx, rcx
140c048fb: jmp       0x140c047b6
140c04900: add       rcx, r10
140c04903: mov       edx, dword ptr [rcx + 8]
140c04906: not       edx
140c04908: mov       rcx, qword ptr [rbp + 0x18]
140c0490c: lea       rcx, [rcx + rdx*4]
140c04910: mov       qword ptr [rbp + 0x28], rcx
140c04914: shl       rdx, 5
140c04918: add       rdx, qword ptr [rbp + 0x40]
140c0491c: mov       rbx, rax
140c0491f: jmp       0x140c047b6
140c04924: movabs    rax, 0xffffffff00000000
140c0492e: and       rbx, rax
140c04931: mov       r15d, r14d
140c04934: jmp       0x140c047b6
140c04939: mov       qword ptr [rsp + 0x20], 1
140c04942: mov       qword ptr [rbp + 0x38], r8
140c04946: mov       r8d, 0x18
140c0494c: mov       r9d, 1
140c04952: mov       rcx, qword ptr [rbp + 8]
140c04956: mov       rsi, rdx
140c04959: mov       rdx, rdi
140c0495c: mov       qword ptr [rbp + 0x48], r10
140c04960: call      0x145bfa970
140c04965: mov       rdx, rsi
140c04968: mov       r10, qword ptr [rbp + 0x48]
140c0496c: mov       r8, qword ptr [rbp + 0x38]
140c04970: mov       r9, qword ptr [rbp]
140c04974: mov       r11, qword ptr [rbp + 0x30]
140c04978: jmp       0x140c048a7
140c0497d: mov       edx, dword ptr [r11 + 0x1c]
140c04981: mov       ecx, dword ptr [r11 + 0x20]
140c04985: cmp       r8b, 1
140c04989: jne       0x140c04a08
140c0498b: test      r10b, r10b
140c0498e: je        0x140c04569
140c04994: mov       rax, qword ptr [r11 + 0x24]
140c04998: shl       rax, 0x18
140c0499c: mov       r8, rcx
140c0499f: shl       r8, 0x38
140c049a3: shr       ecx, 8
140c049a6: or        rcx, rax
140c049a9: mov       edx, edx
140c049ab: shl       rdx, 0x18
140c049af: or        rdx, r8
140c049b2: movzx     r8d, word ptr [r11 + 0x19]
140c049b7: movzx     eax, byte ptr [r11 + 0x1b]
140c049bc: shl       eax, 0x10
140c049bf: or        rax, r8
140c049c2: or        rax, rdx
140c049c5: mov       rdx, r13
140c049c8: shl       rdx, 0x18
140c049cc: mov       r8, r14
140c049cf: shl       r8, 0x38
140c049d3: mov       esi, r9d
140c049d6: mov       r9d, r14d
140c049d9: shr       r9d, 8
140c049dd: or        r9, rdx
140c049e0: xor       r9, rcx
140c049e3: mov       ecx, esi
140c049e5: shl       rcx, 0x18
140c049e9: or        rcx, r8
140c049ec: mov       edx, ebx
140c049ee: and       edx, 0xffffff
140c049f4: or        rdx, rcx
140c049f7: xor       rdx, rax
140c049fa: or        rdx, r9
140c049fd: mov       r9d, esi
140c04a00: jne       0x140c04569
140c04a06: jmp       0x140c04a20
140c04a08: xor       al, 1
140c04a0a: cmp       edx, r9d
140c04a0d: sete      dl
140c04a10: and       dl, al
140c04a12: cmp       ecx, r14d
140c04a15: sete      al
140c04a18: test      dl, al
140c04a1a: je        0x140c04569
140c04a20: movss     xmm0, dword ptr [r11 + 0x2c]
140c04a26: ucomiss   xmm0, dword ptr [rbp + 0x54]
140c04a2a: jne       0x140c04569
140c04a30: jp        0x140c04569
140c04a36: mov       rcx, qword ptr [rbp + 0x28]
140c04a3a: mov       r12, qword ptr [rcx + 0xf8]
140c04a41: mov       rax, qword ptr [rcx + 0x100]
140c04a48: lea       r15, [r12 + rax*4]
140c04a4c: cmp       byte ptr [rcx + 0x108], 0
140c04a53: mov       dword ptr [rbp + 0x40], r10d
140c04a57: je        0x140c04b04
140c04a5d: mov       eax, dword ptr [rbp + 0x48]
140c04a60: sub       eax, edi
140c04a62: cmp       eax, 0xc233b000
140c04a67: mov       edi, 0xc233b000
140c04a6c: cmovb     edi, eax
140c04a6f: xor       eax, eax
140c04a71: xor       ecx, ecx
140c04a73: xor       edx, edx
140c04a75: mov       dword ptr [rbp - 0x20], edi
140c04a78: jmp       0x140c04a96
140c04a7a: mov       esi, r9d
140c04a7d: mov       r8d, edx
140c04a80: inc       edx
140c04a82: mov       r9d, dword ptr [rbp + 0x48]
140c04a86: sub       r9d, dword ptr [rax + r8*4]
140c04a8a: cmp       r9d, edi
140c04a8d: mov       r9d, esi
140c04a90: jb        0x140c04569
140c04a96: cmp       edx, ecx
140c04a98: jne       0x140c04a7a
140c04a9a: cmp       r12, r15
140c04a9d: mov       rdx, qword ptr [rbp - 8]
140c04aa1: je        0x140c04bc8
140c04aa7: nop       word ptr [rax + rax]
140c04ab0: mov       ecx, dword ptr [r12]
140c04ab4: add       r12, 4
140c04ab8: mov       rax, qword ptr [rdx + 0x1a8]
140c04abf: lea       rcx, [rcx + rcx*8]
140c04ac3: cmp       qword ptr [rax + rcx*8 + 0x10], 0
140c04ac9: jne       0x140c04ad5
140c04acb: cmp       r12, r15
140c04ace: jne       0x140c04ab0
140c04ad0: jmp       0x140c04bc8
140c04ad5: mov       esi, r9d
140c04ad8: lea       rdi, [rax + rcx*8]
140c04adc: mov       rax, qword ptr [rbp + 0x28]
140c04ae0: mov       rdx, qword ptr [rax + 0x110]
140c04ae7: mov       rcx, rdi
140c04aea: call      0x144e4ed00
140c04aef: mov       ecx, dword ptr [rdi + 0x10]
140c04af2: xor       edx, edx
140c04af4: mov       r11, qword ptr [rbp + 0x30]
140c04af8: mov       r10d, dword ptr [rbp + 0x40]
140c04afc: mov       edi, dword ptr [rbp - 0x20]
140c04aff: jmp       0x140c04a7d
140c04b04: mov       eax, dword ptr [rbp + 0x48]
140c04b07: sub       eax, edi
140c04b09: cmp       eax, 0xc233b000
140c04b0e: mov       esi, 0xc233b000
140c04b13: cmovb     esi, eax
140c04b16: xor       eax, eax
140c04b18: mov       ecx, 8
140c04b1d: xor       edx, edx
140c04b1f: xor       r8d, r8d
140c04b22: mov       dword ptr [rbp + 0x18], r9d
140c04b26: jmp       0x140c04b89
140c04b28: add       rdi, rax
140c04b2b: mov       eax, dword ptr [rdi + 0x94]
140c04b31: lea       rcx, [rax + rax*8]
140c04b35: shl       rcx, 3
140c04b39: add       rcx, qword ptr [rdx + 0x1a8]
140c04b40: mov       rax, qword ptr [rbp + 0x28]
140c04b44: mov       rdx, qword ptr [rax + 0x110]
140c04b4b: call      0x144e4ed00
140c04b50: mov       rcx, qword ptr [rdi + 0x50]
140c04b54: mov       edx, dword ptr [rdi + 0x58]
140c04b57: xor       r8d, r8d
140c04b5a: mov       r11, qword ptr [rbp + 0x30]
140c04b5e: mov       r9d, r8d
140c04b61: shl       r9, 4
140c04b65: inc       r8d
140c04b68: mov       r9d, dword ptr [rcx + r9 + 8]
140c04b6d: not       r9d
140c04b70: mov       r10d, dword ptr [rbp + 0x48]
140c04b74: sub       r10d, dword ptr [rax + r9*4]
140c04b78: cmp       r10d, esi
140c04b7b: mov       r10d, dword ptr [rbp + 0x40]
140c04b7f: mov       r9d, dword ptr [rbp + 0x18]
140c04b83: jb        0x140c04569
140c04b89: cmp       r8d, edx
140c04b8c: jne       0x140c04b5e
140c04b8e: cmp       r12, r15
140c04b91: mov       rdx, qword ptr [rbp - 8]
140c04b95: je        0x140c04bc8
140c04b97: nop       word ptr [rax + rax]
140c04ba0: mov       eax, dword ptr [r12]
140c04ba4: add       r12, 4
140c04ba8: mov       rdi, qword ptr [rdx + 0x108]
140c04baf: lea       rax, [rax + rax*4]
140c04bb3: shl       rax, 5
140c04bb7: cmp       qword ptr [rdi + rax + 0x58], 0
140c04bbd: jne       0x140c04b28
140c04bc3: cmp       r12, r15
140c04bc6: jne       0x140c04ba0
140c04bc8: movaps    xmm6, xmmword ptr [rbp + 0x60]
140c04bcc: add       rsp, 0xf8
140c04bd3: pop       rbx
140c04bd4: pop       rdi
140c04bd5: pop       rsi
140c04bd6: pop       r12
140c04bd8: pop       r13
140c04bda: pop       r14
140c04bdc: pop       r15
140c04bde: pop       rbp
140c04bdf: ret
140c04be0: ud2
