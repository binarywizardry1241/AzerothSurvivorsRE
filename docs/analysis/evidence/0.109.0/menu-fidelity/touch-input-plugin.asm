144563999: mov       qword ptr [rbp + 0x38], rdi
14456399d: mov       qword ptr [rbp + 0x40], r12
1445639a1: mov       qword ptr [rbp + 0x20], 0
1445639a9: mov       qword ptr [rbp + 0x28], 8
1445639b1: mov       qword ptr [rbp + 0x30], 0
1445639b9: lea       rdx, [rip + 0x23cb160]
1445639c0: lea       rcx, [rbp + 0x20]
1445639c4: call      0x1445617b0
1445639c9: nop
1445639ca: mov       r14, rax
1445639cd: mov       rdx, qword ptr [rbp + 0x20]
1445639d1: test      rdx, rdx
1445639d4: je        0x1445639e9
1445639d6: mov       rcx, qword ptr [rbp + 0x28]
1445639da: shl       rdx, 3
1445639de: mov       r8d, 8
1445639e4: call      0x1400021d0
1445639e9: cmp       r14, qword ptr [rsi + 0x218]
1445639f0: jae       0x144563a1b
1445639f2: mov       rax, qword ptr [rsi + 0x210]
1445639f9: mov       rax, qword ptr [rax + r14*8]
1445639fd: test      rax, rax
144563a00: je        0x144563a1b
144563a02: mov       rcx, qword ptr [rsi + 0x1e0]
144563a09: not       rax
144563a0c: imul      rax, rax, 0x38
144563a10: cmp       byte ptr [rcx + rax + 0x30], 0
144563a15: jne       0x144563ae2
144563a1b: movdqu    xmm0, xmmword ptr [rip + 0x23d287d]
144563a23: movdqa    xmmword ptr [rbp - 0x50], xmm0
144563a28: movdqu    xmm1, xmmword ptr [rip + 0x23d2860]
144563a30: movdqa    xmmword ptr [rbp - 0x60], xmm1
144563a35: movdqa    xmmword ptr [rbp - 0x40], xmm1
144563a3a: movdqa    xmmword ptr [rbp - 0x30], xmm0
144563a3f: movdqa    xmmword ptr [rbp - 0x20], xmm1
144563a44: movdqa    xmmword ptr [rbp - 0x10], xmm0
144563a49: movdqa    xmmword ptr [rbp], xmm1
144563a4e: movdqa    xmmword ptr [rbp + 0x10], xmm0
144563a53: movdqa    xmmword ptr [rbp + 0x90], xmm0
144563a5b: movdqa    xmmword ptr [rbp + 0x80], xmm1
144563a63: movdqa    xmmword ptr [rbp + 0x70], xmm0
144563a68: movdqa    xmmword ptr [rbp + 0x60], xmm1
144563a6d: movdqa    xmmword ptr [rbp + 0x50], xmm0
144563a72: movdqa    xmmword ptr [rbp + 0x40], xmm1
144563a77: movdqa    xmmword ptr [rbp + 0x30], xmm0
144563a7c: movdqa    xmmword ptr [rbp + 0x20], xmm1
144563a81: mov       r15d, dword ptr [rsi + 0x5b0]
144563a88: mov       rcx, rsi
144563a8b: call      0x144e65ff0
144563a90: mov       qword ptr [rbp + 0xa0], r14
144563a97: lea       r9, [rbp + 0xa0]
144563a9e: mov       rcx, rbx
144563aa1: mov       rdx, r14
144563aa4: mov       r8, rdi
144563aa7: call      0x1446403c0
144563aac: mov       rdi, rax
144563aaf: cmp       byte ptr [rax + 0x30], 1
144563ab3: jne       0x144563ac5
144563ab5: lea       r8, [rbp + 0x20]
144563ab9: mov       rcx, rdi
144563abc: xor       edx, edx
144563abe: call      0x144e7e940
144563ac3: jmp       0x144563ade
144563ac5: mov       r8, qword ptr [rdi + 8]
144563ac9: mov       rcx, qword ptr [rdi + 0x10]
144563acd: lea       rdx, [rbp + 0x20]
144563ad1: call      0x145bfa0ed
144563ad6: mov       dword ptr [rdi + 0x28], r15d
144563ada: mov       byte ptr [rdi + 0x30], 1
144563ade: mov       dword ptr [rdi + 0x2c], r15d
