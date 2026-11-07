1401964a0: push      r15
1401964a2: push      r14
1401964a4: push      r13
1401964a6: push      r12
1401964a8: push      rsi
1401964a9: push      rdi
1401964aa: push      rbp
1401964ab: push      rbx
1401964ac: sub       rsp, 0x138
1401964b3: movaps    xmmword ptr [rsp + 0x120], xmm15
1401964bc: movaps    xmmword ptr [rsp + 0x110], xmm14
1401964c5: movaps    xmmword ptr [rsp + 0x100], xmm13
1401964ce: movaps    xmmword ptr [rsp + 0xf0], xmm12
1401964d7: movaps    xmmword ptr [rsp + 0xe0], xmm11
1401964e0: movaps    xmmword ptr [rsp + 0xd0], xmm10
1401964e9: movaps    xmmword ptr [rsp + 0xc0], xmm9
1401964f2: movaps    xmmword ptr [rsp + 0xb0], xmm8
1401964fb: movaps    xmmword ptr [rsp + 0xa0], xmm7
140196503: movaps    xmmword ptr [rsp + 0x90], xmm6
14019650b: mov       rax, qword ptr [rsp + 0x1a0]
140196513: mov       r11, qword ptr [rdx]
140196516: mov       rcx, qword ptr [rdx + 8]
14019651a: mov       edx, dword ptr [rdx + 0x14]
14019651d: mov       dword ptr [rsp + 0x6c], edx
140196521: mov       rdx, qword ptr [r8]
140196524: mov       qword ptr [rsp + 0x38], rdx
140196529: mov       rdi, qword ptr [r8 + 8]
14019652d: mov       edx, dword ptr [r8 + 0x14]
140196531: mov       dword ptr [rsp + 0x20], edx
140196535: mov       rdx, qword ptr [r9]
140196538: mov       qword ptr [rsp + 0x30], rdx
14019653d: mov       rdx, qword ptr [r9 + 8]
140196541: mov       qword ptr [rsp + 0x78], rdx
140196546: mov       rax, qword ptr [rax]
140196549: mov       qword ptr [rsp + 0x88], rax
140196551: mov       rbx, qword ptr [r11 + 0xf8]
140196558: mov       rax, qword ptr [r11 + 0x100]
14019655f: lea       r14, [rbx + rax*4]
140196563: movzx     eax, byte ptr [r11 + 0x108]
14019656b: mov       byte ptr [rsp + 0xf], al
14019656f: xor       r12d, r12d
140196572: mov       eax, 8
140196577: mov       qword ptr [rsp + 0x70], rax
14019657c: xorps     xmm0, xmm0
14019657f: movss     xmm1, dword ptr [rip + 0x5c06d19]
140196587: movss     xmm5, dword ptr [rip + 0x5c3e539]
14019658f: movss     xmm15, dword ptr [rip + 0x5c06d38]
140196598: movss     xmm9, dword ptr [rip + 0x5c4e79b]
1401965a1: movsd     xmm10, qword ptr [rip + 0x5c4e796]
1401965aa: movss     xmm11, dword ptr [rip + 0x5c3e48d]
1401965b3: movss     xmm3, dword ptr [rip + 0x5c3e409]
1401965bb: movss     xmm4, dword ptr [rip + 0x5c4e78d]
1401965c3: mov       qword ptr [rsp + 0x10], 0
1401965cc: mov       qword ptr [rsp + 0x40], 0
1401965d5: mov       qword ptr [rsp + 0x18], 0
1401965de: xor       r13d, r13d
1401965e1: cmp       byte ptr [rsp + 0xf], 0
1401965e6: je        0x140196680
1401965ec: cmp       r13d, r12d
1401965ef: jne       0x1401967c9
1401965f5: nop       word ptr cs:[rax + rax]
140196600: cmp       rbx, r14
140196603: je        0x140196d7f
140196609: mov       edx, dword ptr [rbx]
14019660b: add       rbx, 4
14019660f: mov       rax, qword ptr [rcx + 0x1a8]
140196616: lea       rdx, [rdx + rdx*8]
14019661a: mov       r12, qword ptr [rax + rdx*8 + 0x10]
14019661f: test      r12, r12
140196622: je        0x140196600
140196624: lea       r8, [rax + rdx*8]
140196628: mov       r9, qword ptr [r11 + 0x110]
14019662f: mov       rdx, qword ptr [r8 + 0x38]
140196633: mov       rax, qword ptr [r8 + 0x40]
140196637: cmp       r9, rax
14019663a: jae       0x140196721
140196640: mov       r10, qword ptr [rdx + r9*8]
140196644: mov       r8, qword ptr [r8 + 0x18]
140196648: test      r10, r10
14019664b: je        0x14019675e
140196651: not       r10
140196654: lea       r9, [r10 + r10*2]
140196658: shl       r9, 4
14019665c: mov       r9, qword ptr [r8 + r9 + 0x10]
140196661: mov       qword ptr [rsp + 0x18], r9
140196666: mov       r9, qword ptr [r11 + 0x120]
14019666d: cmp       r9, rax
140196670: jb        0x140196773
140196676: jmp       0x140196793
14019667b: nop       dword ptr [rax + rax]
140196680: cmp       r13d, r12d
140196683: jne       0x140196845
140196689: nop       dword ptr [rax]
140196690: cmp       rbx, r14
140196693: je        0x140196d7f
140196699: mov       eax, dword ptr [rbx]
14019669b: add       rbx, 4
14019669f: mov       rdx, qword ptr [rcx + 0x108]
1401966a6: lea       rax, [rax + rax*4]
1401966aa: shl       rax, 5
1401966ae: mov       r12, qword ptr [rdx + rax + 0x58]
1401966b3: test      r12, r12
1401966b6: je        0x140196690
1401966b8: add       rdx, rax
1401966bb: mov       eax, dword ptr [rdx + 0x94]
1401966c1: mov       rsi, qword ptr [rcx + 0x1a8]
1401966c8: lea       rax, [rax + rax*8]
1401966cc: lea       r10, [rsi + rax*8]
1401966d0: mov       r9, qword ptr [r11 + 0x110]
1401966d7: mov       r8, qword ptr [rsi + rax*8 + 0x38]
1401966dc: mov       rax, qword ptr [rsi + rax*8 + 0x40]
1401966e1: cmp       r9, rax
1401966e4: jae       0x14019673c
1401966e6: mov       rsi, qword ptr [r8 + r9*8]
1401966ea: mov       r10, qword ptr [r10 + 0x18]
1401966ee: test      rsi, rsi
1401966f1: je        0x1401967d1
1401966f7: not       rsi
1401966fa: lea       r9, [rsi + rsi*2]
1401966fe: shl       r9, 4
140196702: mov       r9, qword ptr [r10 + r9 + 0x10]
140196707: mov       qword ptr [rsp + 0x18], r9
14019670c: mov       r9, qword ptr [r11 + 0x120]
140196713: cmp       r9, rax
140196716: jb        0x1401967e6
14019671c: jmp       0x140196806
140196721: mov       r8, qword ptr [r8 + 0x18]
140196725: mov       qword ptr [rsp + 0x18], 0
14019672e: mov       r9, qword ptr [r11 + 0x120]
140196735: cmp       r9, rax
140196738: jae       0x140196793
14019673a: jmp       0x140196773
14019673c: mov       r10, qword ptr [r10 + 0x18]
140196740: mov       qword ptr [rsp + 0x18], 0
140196749: mov       r9, qword ptr [r11 + 0x120]
140196750: cmp       r9, rax
140196753: jae       0x140196806
140196759: jmp       0x1401967e6
14019675e: mov       qword ptr [rsp + 0x18], 0
140196767: mov       r9, qword ptr [r11 + 0x120]
14019676e: cmp       r9, rax
140196771: jae       0x140196793
140196773: mov       rax, qword ptr [rdx + r9*8]
140196777: test      rax, rax
14019677a: je        0x140196793
14019677c: not       rax
14019677f: lea       rax, [rax + rax*2]
140196783: shl       rax, 4
140196787: mov       rax, qword ptr [r8 + rax + 0x10]
14019678c: mov       qword ptr [rsp + 0x10], rax
140196791: jmp       0x14019679c
140196793: mov       qword ptr [rsp + 0x10], 0
14019679c: mov       rax, qword ptr [r11 + 0x118]
1401967a3: mov       rax, qword ptr [rdx + rax*8]
1401967a7: not       rax
1401967aa: lea       rax, [rax + rax*2]
1401967ae: shl       rax, 4
1401967b2: mov       rdx, qword ptr [r8 + rax + 0x10]
1401967b7: mov       qword ptr [rsp + 0x40], rdx
1401967bc: mov       rax, qword ptr [r8 + rax + 0x28]
1401967c1: mov       qword ptr [rsp + 0x60], rax
1401967c6: xor       r13d, r13d
1401967c9: mov       eax, r13d
1401967cc: jmp       0x140196857
1401967d1: mov       qword ptr [rsp + 0x18], 0
1401967da: mov       r9, qword ptr [r11 + 0x120]
1401967e1: cmp       r9, rax
1401967e4: jae       0x140196806
1401967e6: mov       rax, qword ptr [r8 + r9*8]
1401967ea: test      rax, rax
1401967ed: je        0x140196806
1401967ef: not       rax
1401967f2: lea       rax, [rax + rax*2]
1401967f6: shl       rax, 4
1401967fa: mov       rax, qword ptr [r10 + rax + 0x10]
1401967ff: mov       qword ptr [rsp + 0x10], rax
140196804: jmp       0x14019680f
140196806: mov       qword ptr [rsp + 0x10], 0
14019680f: mov       rax, qword ptr [r11 + 0x118]
140196816: mov       rax, qword ptr [r8 + rax*8]
14019681a: not       rax
14019681d: lea       rax, [rax + rax*2]
140196821: shl       rax, 4
140196825: mov       r8, qword ptr [r10 + rax + 0x10]
14019682a: mov       qword ptr [rsp + 0x40], r8
14019682f: mov       rax, qword ptr [r10 + rax + 0x28]
140196834: mov       qword ptr [rsp + 0x60], rax
140196839: mov       rax, qword ptr [rdx + 0x50]
14019683d: mov       qword ptr [rsp + 0x70], rax
140196842: xor       r13d, r13d
140196845: mov       eax, r13d
140196848: shl       rax, 4
14019684c: mov       rdx, qword ptr [rsp + 0x70]
140196851: mov       eax, dword ptr [rdx + rax + 8]
140196855: not       eax
140196857: mov       rdx, qword ptr [rsp + 0x18]
14019685c: lea       rbp, [rdx + rax*8]
140196860: mov       rdx, qword ptr [rsp + 0x40]
140196865: lea       r8, [rdx + rax]
140196869: mov       rdx, qword ptr [rsp + 0x60]
14019686e: lea       r10, [rdx + rax*4]
140196872: lea       rax, [rax + rax*2]
140196876: mov       rdx, qword ptr [rsp + 0x10]
14019687b: lea       r15, [rdx + rax*8]
14019687f: inc       r13d
140196882: mov       rax, qword ptr [rbp]
140196886: mov       edx, eax
140196888: not       edx
14019688a: shr       rax, 0x20
14019688e: lea       rsi, [rdx + rdx*2]
140196892: shl       rsi, 3
140196896: mov       r9, qword ptr [rsp + 0x78]
14019689b: add       rsi, qword ptr [r9 + 8]
14019689f: cmp       rdx, qword ptr [r9 + 0x10]
1401968a3: lea       rdx, [rip + 0x5c4eb9e]
1401968aa: cmovae    rsi, rdx
1401968ae: cmp       dword ptr [rsi + 0x10], eax
1401968b1: jne       0x1401965e1
1401968b7: cmp       dword ptr [rsi], 0
1401968ba: je        0x1401965e1
1401968c0: mov       rdx, qword ptr [rsi + 4]
1401968c4: mov       rax, rdx
1401968c7: shr       rax, 0x20
1401968cb: mov       r9, qword ptr [rsp + 0x30]
1401968d0: cmp       qword ptr [r9 + 0x38], rax
1401968d4: jbe       0x1401965e1
1401968da: mov       r9, rdx
1401968dd: shr       r9, 0x26
1401968e1: mov       qword ptr [rsp + 0x58], rdi
1401968e6: mov       rdi, qword ptr [rsp + 0x30]
1401968eb: mov       rdi, qword ptr [rdi + 0x28]
1401968ef: mov       r9, qword ptr [rdi + r9*8]
1401968f3: mov       rdi, qword ptr [rsp + 0x58]
1401968f8: bt        r9, rax
1401968fc: jae       0x1401965e1
140196902: mov       qword ptr [rsp + 0x28], r11
140196907: mov       eax, dword ptr [rsi + 0xc]
14019690a: mov       r9, qword ptr [rsp + 0x78]
14019690f: mov       rdi, qword ptr [r9 + 0x1a8]
140196916: lea       rax, [rax + rax*8]
14019691a: lea       rsi, [rdi + rax*8]
14019691e: mov       r9, qword ptr [rsp + 0x30]
140196923: mov       r9, qword ptr [r9 + 0x110]
14019692a: mov       r11, qword ptr [rdi + rax*8 + 0x38]
14019692f: cmp       r9, qword ptr [rdi + rax*8 + 0x40]
140196934: mov       qword ptr [rsp + 0x50], r11
140196939: jae       0x14019695a
14019693b: mov       r9, qword ptr [r11 + r9*8]
14019693f: mov       rdi, qword ptr [rsi + 0x18]
140196943: test      r9, r9
140196946: je        0x14019695e
140196948: not       r9
14019694b: lea       rax, [r9 + r9*2]
14019694f: shl       rax, 4
140196953: mov       rsi, qword ptr [rdi + rax + 0x10]
140196958: jmp       0x140196960
14019695a: mov       rdi, qword ptr [rsi + 0x18]
14019695e: xor       esi, esi
140196960: mov       r11, qword ptr [rsp + 0x28]
140196965: mov       rax, qword ptr [rsp + 0x30]
14019696a: mov       rax, qword ptr [rax + 0x118]
140196971: mov       r9, qword ptr [rsp + 0x50]
140196976: mov       rax, qword ptr [r9 + rax*8]
14019697a: not       rax
14019697d: lea       rax, [rax + rax*2]
140196981: shl       rax, 4
140196985: mov       rax, qword ptr [rdi + rax + 0x10]
14019698a: not       edx
14019698c: imul      r9, rdx, 0x68
140196990: movss     xmm7, dword ptr [rax + r9 + 0x64]
140196997: movss     xmm6, dword ptr [rax + r9 + 0x34]
14019699e: mulss     xmm6, xmm7
1401969a2: mulss     xmm7, dword ptr [rax + r9 + 0x3c]
1401969a9: movaps    xmm14, xmm7
1401969ad: subss     xmm14, xmm6
1401969b2: maxss     xmm14, xmm0
1401969b7: ucomiss   xmm14, xmm1
1401969bb: setbe     al
1401969be: cmp       byte ptr [r8], al
1401969c1: je        0x1401969ce
1401969c3: mov       r9d, dword ptr [rsp + 0x6c]
1401969c8: mov       dword ptr [r10], r9d
1401969cb: mov       byte ptr [r8], al
1401969ce: maxss     xmm7, xmm1
1401969d2: divss     xmm6, xmm7
1401969d6: movaps    xmm7, xmm5
1401969d9: maxss     xmm7, xmm6
1401969dd: movaps    xmm12, xmm1
1401969e1: minss     xmm12, xmm7
1401969e6: xorps     xmm13, xmm13
1401969ea: ucomiss   xmm14, xmm13
1401969ee: mov       rdi, qword ptr [rsp + 0x58]
1401969f3: jbe       0x140196a21
1401969f5: movss     xmm6, dword ptr [rsi + rdx*8 + 4]
1401969fb: divss     xmm6, xmm14
140196a00: xorps     xmm7, xmm7
140196a03: maxss     xmm7, xmm6
140196a07: movaps    xmm6, xmm1
140196a0a: minss     xmm6, xmm7
140196a0e: movaps    xmm13, xmm1
140196a12: subss     xmm13, xmm12
140196a17: mulss     xmm13, xmm6
140196a1c: mulss     xmm13, xmm15
140196a21: mov       rdx, qword ptr [rsp + 0x88]
140196a29: mov       eax, dword ptr [rdx]
140196a2b: test      rax, rax
140196a2e: je        0x140196a53
140196a30: mov       edx, dword ptr [rdx + 4]
140196a33: shl       rdx, 0x20
140196a37: or        rdx, rax
140196a3a: cmp       rdx, qword ptr [rbp]
140196a3e: sete      al
140196a41: mov       dword ptr [rsp + 0x24], eax
140196a45: mov       rbp, qword ptr [r15 + 0x10]
140196a49: test      rbp, rbp
140196a4c: jne       0x140196a68
140196a4e: jmp       0x1401965e1
140196a53: mov       dword ptr [rsp + 0x24], 0
140196a5b: mov       rbp, qword ptr [r15 + 0x10]
140196a5f: test      rbp, rbp
140196a62: je        0x1401965e1
140196a68: mov       r15, qword ptr [r15 + 8]
140196a6c: shl       rbp, 3
140196a70: movaps    xmm8, xmm15
140196a74: mulss     xmm12, xmm15
140196a79: xor       r8d, r8d
140196a7c: movsd     xmm2, qword ptr [rip + 0x5c3e2cc]
140196a84: mov       qword ptr [rsp + 0x80], r15
140196a8c: jmp       0x140196acd
140196a8e: cmp       dword ptr [rdx], 0
140196a91: je        0x140196c23
140196a97: mov       eax, dword ptr [rsp + 0x20]
140196a9b: mov       r9, qword ptr [rsp + 0x50]
140196aa0: mov       dword ptr [r9 + r10*4], eax
140196aa4: mov       dword ptr [rdx], 0
140196aaa: movlps    qword ptr [rdx + 4], xmm15
140196aaf: movss     dword ptr [rdx + 0xc], xmm14
140196ab5: mov       dword ptr [rdx + 0x10], 0x3f800000
140196abc: nop       dword ptr [rax]
140196ac0: add       r8, 8
140196ac4: cmp       rbp, r8
140196ac7: je        0x140196d76
140196acd: mov       rdx, qword ptr [r15 + r8]
140196ad1: mov       r9d, edx
140196ad4: not       r9d
140196ad7: shr       rdx, 0x20
140196adb: lea       rax, [r9 + r9*2]
140196adf: shl       rax, 3
140196ae3: add       rax, qword ptr [rdi + 8]
140196ae7: cmp       r9, qword ptr [rdi + 0x10]
140196aeb: lea       r9, [rip + 0x5c4e956]
140196af2: cmovae    rax, r9
140196af6: cmp       dword ptr [rax + 0x10], edx
140196af9: jne       0x140196ac0
140196afb: cmp       dword ptr [rax], 0
140196afe: je        0x140196ac0
140196b00: mov       r10, qword ptr [rax + 4]
140196b04: mov       rdx, r10
140196b07: shr       rdx, 0x20
140196b0b: mov       r9, qword ptr [rsp + 0x38]
140196b10: cmp       qword ptr [r9 + 0x38], rdx
140196b14: jbe       0x140196ac0
140196b16: mov       r9, r10
140196b19: shr       r9, 0x26
140196b1d: mov       rsi, qword ptr [rsp + 0x38]
140196b22: mov       rsi, qword ptr [rsi + 0x28]
140196b26: mov       r9, qword ptr [rsi + r9*8]
140196b2a: bt        r9, rdx
140196b2e: jae       0x140196ac0
140196b30: mov       eax, dword ptr [rax + 0xc]
140196b33: mov       rsi, qword ptr [rdi + 0x1a8]
140196b3a: lea       rdi, [rax + rax*8]
140196b3e: mov       rax, qword ptr [rsi + rdi*8 + 0x18]
140196b43: mov       rdx, qword ptr [rsi + rdi*8 + 0x38]
140196b48: mov       r9, qword ptr [rsp + 0x38]
140196b4d: mov       r9, qword ptr [r9 + 0x118]
140196b54: cmp       r9, qword ptr [rsi + rdi*8 + 0x40]
140196b59: jae       0x140196b7b
140196b5b: mov       r9, qword ptr [rdx + r9*8]
140196b5f: test      r9, r9
140196b62: je        0x140196b7b
140196b64: not       r9
140196b67: lea       r9, [r9 + r9*2]
140196b6b: shl       r9, 4
140196b6f: mov       r9, qword ptr [rax + r9 + 0x10]
140196b74: mov       qword ptr [rsp + 0x48], r9
140196b79: jmp       0x140196b84
140196b7b: mov       qword ptr [rsp + 0x48], 0
140196b84: mov       r11, qword ptr [rsp + 0x38]
140196b89: mov       r9, qword ptr [r11 + 0x110]
140196b90: mov       r9, qword ptr [rdx + r9*8]
140196b94: not       r9
140196b97: lea       r9, [r9 + r9*2]
140196b9b: shl       r9, 4
140196b9f: mov       rdi, qword ptr [rax + r9 + 0x10]
140196ba4: mov       r15, qword ptr [rax + r9 + 0x28]
140196ba9: mov       rsi, qword ptr [r11 + 0x120]
140196bb0: mov       rdx, qword ptr [rdx + rsi*8]
140196bb4: not       rdx
140196bb7: lea       r9, [rdx + rdx*2]
140196bbb: shl       r9, 4
140196bbf: mov       rdx, qword ptr [rax + r9 + 0x28]
140196bc4: mov       qword ptr [rsp + 0x50], rdx
140196bc9: not       r10d
140196bcc: lea       r11, [r10 + r10*2]
140196bd0: shl       r11, 7
140196bd4: lea       rsi, [rdi + r11]
140196bd8: lea       rdx, [r10 + r10*4]
140196bdc: shl       rdx, 2
140196be0: add       rdx, qword ptr [rax + r9 + 0x10]
140196be5: mov       r9, r15
140196be8: mov       eax, dword ptr [rdi + r11 + 0x90]
140196bf0: test      eax, eax
140196bf2: mov       rdi, qword ptr [rsp + 0x58]
140196bf7: je        0x140196caa
140196bfd: cmp       eax, 2
140196c00: jne       0x140196c93
140196c06: movss     xmm6, dword ptr [rsi + 0x94]
140196c0e: ucomiss   xmm6, xmm12
140196c12: jne       0x140196caa
140196c18: jnp       0x140196cc5
140196c1e: jmp       0x140196caa
140196c23: movaps    xmm2, xmm11
140196c27: movaps    xmm11, xmm10
140196c2b: movss     xmm10, dword ptr [rdx + 4]
140196c31: ucomiss   xmm10, xmm7
140196c35: movaps    xmm10, xmm11
140196c39: movaps    xmm11, xmm2
140196c3d: movsd     xmm2, qword ptr [rip + 0x5c3e10b]
140196c45: jne       0x140196a97
140196c4b: jp        0x140196a97
140196c51: movss     xmm7, dword ptr [rdx + 8]
140196c56: ucomiss   xmm7, xmm6
140196c59: jne       0x140196a97
140196c5f: jp        0x140196a97
140196c65: movss     xmm6, dword ptr [rdx + 0xc]
140196c6a: ucomiss   xmm6, xmm14
140196c6e: jne       0x140196a97
140196c74: jp        0x140196a97
140196c7a: movss     xmm6, dword ptr [rdx + 0x10]
140196c7f: ucomiss   xmm6, xmm1
140196c82: jne       0x140196a97
140196c88: jnp       0x140196ac0
140196c8e: jmp       0x140196a97
140196c93: movss     xmm6, dword ptr [rsi + 0x94]
140196c9b: ucomiss   xmm6, xmm0
140196c9e: jne       0x140196caa
140196ca0: jp        0x140196caa
140196ca2: ucomiss   xmm12, xmm0
140196ca6: jne       0x140196caa
140196ca8: jnp       0x140196cc5
140196caa: mov       eax, dword ptr [rsp + 0x20]
140196cae: mov       dword ptr [r9 + r10*4], eax
140196cb2: mov       dword ptr [rsi + 0x90], 2
140196cbc: movss     dword ptr [rsi + 0x94], xmm12
140196cc5: mov       eax, dword ptr [rsi + 0x78]
140196cc8: test      eax, eax
140196cca: mov       r11, qword ptr [rsp + 0x28]
140196ccf: mov       r15, qword ptr [rsp + 0x80]
140196cd7: je        0x140196d01
140196cd9: cmp       eax, 2
140196cdc: jne       0x140196ced
140196cde: movss     xmm6, dword ptr [rsi + 0x7c]
140196ce3: ucomiss   xmm6, xmm13
140196ce7: jne       0x140196d01
140196ce9: jnp       0x140196d16
140196ceb: jmp       0x140196d01
140196ced: movss     xmm6, dword ptr [rsi + 0x7c]
140196cf2: ucomiss   xmm6, xmm0
140196cf5: jne       0x140196d01
140196cf7: jp        0x140196d01
140196cf9: ucomiss   xmm13, xmm0
140196cfd: jne       0x140196d01
140196cff: jnp       0x140196d16
140196d01: mov       eax, dword ptr [rsp + 0x20]
140196d05: mov       dword ptr [r9 + r10*4], eax
140196d09: mov       dword ptr [rsi + 0x78], 2
140196d10: movss     dword ptr [rsi + 0x7c], xmm13
140196d16: movaps    xmm7, xmm9
140196d1a: movss     xmm6, dword ptr [rip + 0x5c4e016]
140196d22: movss     xmm14, dword ptr [rip + 0x5c4e009]
140196d2b: movaps    xmm15, xmm2
140196d2f: cmp       byte ptr [rsp + 0x24], 0
140196d34: jne       0x140196a8e
140196d3a: mov       rax, qword ptr [rsp + 0x48]
140196d3f: cmp       byte ptr [rax + r10], 2
140196d44: movaps    xmm7, xmm9
140196d48: movss     xmm6, dword ptr [rip + 0x5c4dfe8]
140196d50: movss     xmm14, dword ptr [rip + 0x5c4dfdb]
140196d59: movaps    xmm15, xmm2
140196d5d: jne       0x140196a8e
140196d63: movaps    xmm7, xmm4
140196d66: movaps    xmm6, xmm3
140196d69: movaps    xmm14, xmm11
140196d6d: movaps    xmm15, xmm10
140196d71: jmp       0x140196a8e
140196d76: movaps    xmm15, xmm8
140196d7a: jmp       0x1401965e1
140196d7f: movaps    xmm6, xmmword ptr [rsp + 0x90]
140196d87: movaps    xmm7, xmmword ptr [rsp + 0xa0]
140196d8f: movaps    xmm8, xmmword ptr [rsp + 0xb0]
140196d98: movaps    xmm9, xmmword ptr [rsp + 0xc0]
140196da1: movaps    xmm10, xmmword ptr [rsp + 0xd0]
140196daa: movaps    xmm11, xmmword ptr [rsp + 0xe0]
140196db3: movaps    xmm12, xmmword ptr [rsp + 0xf0]
140196dbc: movaps    xmm13, xmmword ptr [rsp + 0x100]
140196dc5: movaps    xmm14, xmmword ptr [rsp + 0x110]
140196dce: movaps    xmm15, xmmword ptr [rsp + 0x120]
140196dd7: add       rsp, 0x138
140196dde: pop       rbx
140196ddf: pop       rbp
140196de0: pop       rdi
140196de1: pop       rsi
140196de2: pop       r12
140196de4: pop       r13
140196de6: pop       r14
140196de8: pop       r15
140196dea: ret
