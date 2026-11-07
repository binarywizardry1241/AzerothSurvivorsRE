140117730: push      rbp
140117731: push      r15
140117733: push      r14
140117735: push      r13
140117737: push      r12
140117739: push      rsi
14011773a: push      rdi
14011773b: push      rbx
14011773c: sub       rsp, 0x198
140117743: lea       rbp, [rsp + 0x80]
14011774b: mov       qword ptr [rbp + 0x110], 0xfffffffffffffffe
140117756: mov       rax, qword ptr [rdx]
140117759: mov       r14, qword ptr [rdx + 8]
14011775d: mov       rcx, qword ptr [rax]
140117760: xor       edx, edx
140117762: mov       rsi, rcx
140117765: sub       rsi, qword ptr [r14 + 0x18]
140117769: cmovb     rsi, rdx
14011776d: sub       rcx, qword ptr [r14 + 0x38]
140117771: cmovb     rcx, rdx
140117775: lea       r11, [rsi + rsi*2]
140117779: shl       r11, 3
14011777d: add       r11, qword ptr [r14 + 8]
140117781: mov       rdi, qword ptr [r14 + 0x10]
140117785: lea       r10, [rcx + rcx*2]
140117789: shl       r10, 3
14011778d: add       r10, qword ptr [r14 + 0x28]
140117791: mov       rbx, rdi
140117794: sub       rbx, rsi
140117797: cmovb     rbx, rdx
14011779b: mov       r15, qword ptr [r14 + 0x30]
14011779f: mov       r12d, 8
1401177a5: cmovb     r11, r12
1401177a9: cmovb     rsi, rdi
1401177ad: mov       r13, r15
1401177b0: sub       r13, rcx
1401177b3: cmovb     r10, r12
1401177b7: cmovb     r13, rdx
1401177bb: mov       r14, qword ptr [r14 + 0x40]
1401177bf: cmovb     rcx, r15
1401177c3: add       rcx, r14
1401177c6: sub       r14, r13
1401177c9: sub       r14, rbx
1401177cc: mov       r12, qword ptr [r8]
1401177cf: mov       qword ptr [rbp + 0x100], r12
1401177d6: mov       r12, qword ptr [r8 + 8]
1401177da: mov       r8, qword ptr [r9]
1401177dd: mov       qword ptr [rbp + 0xf0], r8
1401177e4: mov       r8, qword ptr [rbp + 0x180]
1401177eb: mov       r8, qword ptr [r8]
1401177ee: mov       qword ptr [rbp + 0xf8], r8
1401177f5: mov       r8, qword ptr [rbp + 0x188]
1401177fc: mov       r9, qword ptr [r8]
1401177ff: mov       qword ptr [rbp + 0xe8], r9
140117806: mov       r9, qword ptr [r8 + 0x10]
14011780a: mov       qword ptr [rbp + 0xb0], r9
140117811: mov       r8d, dword ptr [r8 + 0x1c]
140117815: mov       dword ptr [rbp + 0xe4], r8d
14011781c: mov       r8, qword ptr [rbp + 0x190]
140117823: mov       r8, qword ptr [r8]
140117826: mov       qword ptr [rbp + 0xb8], r8
14011782d: mov       qword ptr [rax], r14
140117830: add       rcx, rsi
140117833: sub       rcx, r15
140117836: sub       rcx, rdi
140117839: lea       r8, [rbx + rbx*2]
14011783d: lea       rsi, [r11 + r8*8]
140117841: lea       r8, [r13*2]
140117849: add       r8, r13
14011784c: lea       rdi, [r10 + r8*8]
140117850: inc       rcx
140117853: xor       ebx, ebx
140117855: jmp       0x140117883
140117857: nop       word ptr [rax + rax]
140117860: lea       r14, [r11 + 0x18]
140117864: mov       qword ptr [rax], rcx
140117867: movzx     r8d, byte ptr [r11 + 0x14]
14011786c: xor       r8, 1
140117870: cmp       word ptr [r11 + 0x10], 1
140117876: cmovne    r8, rdx
14011787a: add       rbx, r8
14011787d: inc       rcx
140117880: mov       r11, r14
140117883: test      r11, r11
140117886: je        0x14011788d
140117888: cmp       r11, rsi
14011788b: jne       0x140117860
14011788d: test      r10, r10
140117890: je        0x1401178a3
140117892: cmp       r10, rdi
140117895: je        0x1401178a3
140117897: mov       r11, r10
14011789a: add       r10, 0x18
14011789e: xor       r14d, r14d
1401178a1: jmp       0x140117864
1401178a3: test      rbx, rbx
1401178a6: je        0x140117c7b
1401178ac: mov       rax, qword ptr [rbp + 0xf0]
1401178b3: cmp       byte ptr [rax + 0x72], 1
1401178b7: jne       0x140117c7b
1401178bd: mov       rax, qword ptr [rbp + 0xf8]
1401178c4: movzx     eax, byte ptr [rax + 0x38]
1401178c8: mov       byte ptr [rbp + 0x10e], al
1401178ce: mov       rcx, qword ptr [rbp + 0x100]
1401178d5: mov       r13, qword ptr [rcx + 0xf8]
1401178dc: mov       rax, qword ptr [rcx + 0x100]
1401178e3: lea       r15, [rax*4]
1401178eb: add       r15, r13
1401178ee: movzx     ebx, byte ptr [rcx + 0x108]
1401178f5: xor       r9d, r9d
1401178f8: mov       eax, 8
1401178fd: mov       qword ptr [rbp + 0xd8], rax
140117904: xor       r10d, r10d
140117907: xor       r8d, r8d
14011790a: xor       edx, edx
14011790c: mov       qword ptr [rbp + 0xa8], r12
140117913: movzx     edi, byte ptr [rbp + 0x10e]
14011791a: jmp       0x14011793e
14011791c: nop       dword ptr [rax]
140117920: mov       r10, r12
140117923: mov       r12, qword ptr [rbp + 0xa8]
14011792a: mov       r8, qword ptr [rbp + 0xf0]
140117931: mov       r9, qword ptr [rbp + 0xf8]
140117938: mov       edx, dword ptr [rbp + 0xe0]
14011793e: test      bl, bl
140117940: je        0x1401179e0
140117946: cmp       edx, r9d
140117949: jne       0x140117b20
14011794f: nop
140117950: cmp       r13, r15
140117953: je        0x140117a90
140117959: mov       eax, dword ptr [r13]
14011795d: add       r13, 4
140117961: mov       rcx, qword ptr [r12 + 0x1a8]
140117969: lea       rdx, [rax + rax*8]
14011796d: mov       rax, qword ptr [rcx + rdx*8 + 0x10]
140117972: test      rax, rax
140117975: je        0x140117950
140117977: lea       rcx, [rcx + rdx*8]
14011797b: mov       rdx, qword ptr [rbp + 0x100]
140117982: mov       r8, qword ptr [rdx + 0x110]
140117989: mov       rdx, qword ptr [rcx + 0x40]
14011798d: cmp       r8, rdx
140117990: jae       0x140117aa6
140117996: mov       r9, qword ptr [rcx + 0x38]
14011799a: mov       r8, qword ptr [r9 + r8*8]
14011799e: test      r8, r8
1401179a1: je        0x140117aa6
1401179a7: mov       r9, qword ptr [rcx + 0x18]
1401179ab: not       r8
1401179ae: lea       r8, [r8 + r8*2]
1401179b2: shl       r8, 4
1401179b6: mov       r10, qword ptr [r9 + r8 + 0x10]
1401179bb: mov       r8, qword ptr [rbp + 0x100]
1401179c2: mov       r8, qword ptr [r8 + 0x118]
1401179c9: cmp       r8, rdx
1401179cc: jb        0x140117abc
1401179d2: jmp       0x140117b18
1401179d7: nop       word ptr [rax + rax]
1401179e0: cmp       edx, r9d
1401179e3: jne       0x140117b39
1401179e9: nop       dword ptr [rax]
1401179f0: cmp       r13, r15
1401179f3: je        0x140117a90
1401179f9: mov       eax, dword ptr [r13]
1401179fd: add       r13, 4
140117a01: mov       rcx, qword ptr [r12 + 0x108]
140117a09: lea       rdx, [rax + rax*4]
140117a0d: shl       rdx, 5
140117a11: mov       rax, qword ptr [rcx + rdx + 0x58]
140117a16: test      rax, rax
140117a19: je        0x1401179f0
140117a1b: add       rcx, rdx
140117a1e: mov       edx, dword ptr [rcx + 0x94]
140117a24: mov       r8, qword ptr [r12 + 0x1a8]
140117a2c: lea       r10, [rdx + rdx*8]
140117a30: lea       rdx, [r8 + r10*8]
140117a34: mov       r9, qword ptr [rbp + 0x100]
140117a3b: mov       r9, qword ptr [r9 + 0x110]
140117a42: mov       r8, qword ptr [r8 + r10*8 + 0x40]
140117a47: cmp       r9, r8
140117a4a: jae       0x140117adf
140117a50: mov       r10, qword ptr [rdx + 0x38]
140117a54: mov       r9, qword ptr [r10 + r9*8]
140117a58: test      r9, r9
140117a5b: je        0x140117adf
140117a61: mov       r10, qword ptr [rdx + 0x18]
140117a65: not       r9
140117a68: lea       r9, [r9 + r9*2]
140117a6c: shl       r9, 4
140117a70: mov       r10, qword ptr [r10 + r9 + 0x10]
140117a75: mov       r9, qword ptr [rbp + 0x100]
140117a7c: mov       r9, qword ptr [r9 + 0x118]
140117a83: cmp       r9, r8
140117a86: jb        0x140117af5
140117a88: jmp       0x140117b26
140117a8d: nop       dword ptr [rax]
140117a90: mov       r13, r15
140117a93: mov       edx, r9d
140117a96: xor       eax, eax
140117a98: test      rax, rax
140117a9b: jne       0x140117b62
140117aa1: jmp       0x140117c7b
140117aa6: xor       r10d, r10d
140117aa9: mov       r8, qword ptr [rbp + 0x100]
140117ab0: mov       r8, qword ptr [r8 + 0x118]
140117ab7: cmp       r8, rdx
140117aba: jae       0x140117b18
140117abc: mov       rdx, qword ptr [rcx + 0x38]
140117ac0: mov       rdx, qword ptr [rdx + r8*8]
140117ac4: test      rdx, rdx
140117ac7: je        0x140117b18
140117ac9: mov       rcx, qword ptr [rcx + 0x18]
140117acd: not       rdx
140117ad0: lea       rdx, [rdx + rdx*2]
140117ad4: shl       rdx, 4
140117ad8: mov       r8, qword ptr [rcx + rdx + 0x10]
140117add: jmp       0x140117b1b
140117adf: xor       r10d, r10d
140117ae2: mov       r9, qword ptr [rbp + 0x100]
140117ae9: mov       r9, qword ptr [r9 + 0x118]
140117af0: cmp       r9, r8
140117af3: jae       0x140117b26
140117af5: mov       r8, qword ptr [rdx + 0x38]
140117af9: mov       r8, qword ptr [r8 + r9*8]
140117afd: test      r8, r8
140117b00: je        0x140117b26
140117b02: mov       rdx, qword ptr [rdx + 0x18]
140117b06: not       r8
140117b09: lea       r8, [r8 + r8*2]
140117b0d: shl       r8, 4
140117b11: mov       r8, qword ptr [rdx + r8 + 0x10]
140117b16: jmp       0x140117b29
140117b18: xor       r8d, r8d
140117b1b: xor       edx, edx
140117b1d: mov       r9d, eax
140117b20: mov       esi, edx
140117b22: inc       edx
140117b24: jmp       0x140117b4e
140117b26: xor       r8d, r8d
140117b29: mov       rcx, qword ptr [rcx + 0x50]
140117b2d: mov       qword ptr [rbp + 0xd8], rcx
140117b34: xor       edx, edx
140117b36: mov       r9d, eax
140117b39: mov       eax, edx
140117b3b: shl       rax, 4
140117b3f: inc       edx
140117b41: mov       rcx, qword ptr [rbp + 0xd8]
140117b48: mov       esi, dword ptr [rcx + rax + 8]
140117b4c: not       esi
140117b4e: lea       rax, [r10 + rsi]
140117b52: shl       rsi, 4
140117b56: add       rsi, r8
140117b59: test      rax, rax
140117b5c: je        0x140117c7b
140117b62: cmp       byte ptr [rax], 1
140117b65: jne       0x14011793e
140117b6b: mov       dword ptr [rbp + 0xe0], edx
140117b71: mov       qword ptr [rbp + 0xf8], r9
140117b78: mov       qword ptr [rbp + 0xf0], r8
140117b7f: mov       r12, r10
140117b82: lea       r14, [rbp + 0xc0]
140117b89: mov       rcx, r14
140117b8c: mov       rdx, qword ptr [rbp + 0xe8]
140117b93: mov       r8d, edi
140117b96: call      0x14589e020
140117b9b: mov       r8, qword ptr [rsi]
140117b9e: mov       r9, qword ptr [rsi + 8]
140117ba2: mov       byte ptr [rbp + 0x10f], 1
140117ba9: mov       rcx, r14
140117bac: mov       edx, edi
140117bae: call      0x14590fdd0
140117bb3: nop
140117bb4: test      al, al
140117bb6: je        0x140117c50
140117bbc: mov       rax, qword ptr [rbp + 0xb0]
140117bc3: mov       ecx, dword ptr [rbp + 0xe4]
140117bc9: mov       dword ptr [rax], ecx
140117bcb: mov       rax, qword ptr [rbp + 0xd0]
140117bd2: mov       qword ptr [rbp + 0xa0], rax
140117bd9: movups    xmm0, xmmword ptr [rbp + 0xc0]
140117be0: movaps    xmmword ptr [rbp + 0x90], xmm0
140117be7: mov       byte ptr [rbp + 0x10f], 0
140117bee: mov       rcx, qword ptr [rbp + 0xe8]
140117bf5: mov       edx, edi
140117bf7: lea       r8, [rbp + 0x90]
140117bfe: call      0x1458a7b80
140117c03: nop
140117c04: mov       byte ptr [rbp + 0x10f], 0
140117c0b: lea       rcx, [rbp - 0x50]
140117c0f: mov       rdx, qword ptr [rbp + 0xe8]
140117c16: mov       r8d, edi
140117c19: call      0x14589e020
140117c1e: nop
140117c1f: mov       byte ptr [rbp - 0x38], dil
140117c23: mov       dword ptr [rbp - 0x58], 0xe
140117c2a: mov       byte ptr [rbp + 0x10f], 0
140117c31: mov       rcx, qword ptr [rbp + 0xb8]
140117c38: lea       rdx, [rbp - 0x58]
140117c3c: call      0x1401838a0
140117c41: nop
140117c42: jmp       0x140117920
140117c47: nop       word ptr [rax + rax]
140117c50: mov       rdx, qword ptr [rbp + 0xc0]
140117c57: test      rdx, rdx
140117c5a: je        0x140117920
140117c60: mov       rcx, qword ptr [rbp + 0xc8]
140117c67: shl       rdx, 4
140117c6b: mov       r8d, 8
140117c71: call      0x1400021d0
140117c76: jmp       0x140117920
140117c7b: add       rsp, 0x198
140117c82: pop       rbx
140117c83: pop       rdi
140117c84: pop       rsi
140117c85: pop       r12
140117c87: pop       r13
140117c89: pop       r14
140117c8b: pop       r15
140117c8d: pop       rbp
140117c8e: ret
