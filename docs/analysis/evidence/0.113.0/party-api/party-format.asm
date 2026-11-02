1459af260: push      rbp
1459af261: push      r15
1459af263: push      r14
1459af265: push      r13
1459af267: push      r12
1459af269: push      rsi
1459af26a: push      rdi
1459af26b: push      rbx
1459af26c: sub       rsp, 0x188
1459af273: lea       rbp, [rsp + 0x80]
1459af27b: movapd    xmmword ptr [rbp + 0xf0], xmm8
1459af284: movapd    xmmword ptr [rbp + 0xe0], xmm7
1459af28c: movapd    xmmword ptr [rbp + 0xd0], xmm6
1459af294: mov       qword ptr [rbp + 0xc8], 0xfffffffffffffffe
1459af29f: mov       rsi, qword ptr [rcx]
1459af2a2: mov       rdi, qword ptr [rcx + 8]
1459af2a6: mov       rax, qword ptr [rdx]
1459af2a9: mov       r8, qword ptr [rdx + 8]
1459af2ad: cmp       rsi, rdi
1459af2b0: je        0x1459af5a1
1459af2b6: mov       qword ptr [rbp + 0xb8], rax
1459af2bd: mov       r13, qword ptr [rcx + 0x10]
1459af2c1: mov       rax, qword ptr [rcx + 0x18]
1459af2c5: mov       qword ptr [rbp - 0x20], rax
1459af2c9: mov       rax, qword ptr [rdx + 0x10]
1459af2cd: sub       rdi, rsi
1459af2d0: shr       rdi, 3
1459af2d4: mov       qword ptr [rbp + 0xc0], r8
1459af2db: lea       rcx, [r8 + r8*2]
1459af2df: lea       rbx, [rax + rcx*8]
1459af2e3: xor       eax, eax
1459af2e5: mov       r12, rbp
1459af2e8: movsd     xmm7, qword ptr [rip + 0x4eee80]
1459af2f0: mov       qword ptr [rbp - 0x10], rsi
1459af2f4: mov       qword ptr [rbp - 0x18], r13
1459af2f8: jmp       0x1459af326
1459af2fa: nop       word ptr [rax + rax]
1459af300: mov       rax, qword ptr [rbp - 0x48]
1459af304: mov       qword ptr [rbx + 0x10], rax
1459af308: movups    xmm0, xmmword ptr [rbp - 0x58]
1459af30c: movups    xmmword ptr [rbx], xmm0
1459af30f: mov       rax, qword ptr [rbp + 0xb0]
1459af316: inc       rax
1459af319: add       rbx, 0x18
1459af31d: cmp       rdi, rax
1459af320: je        0x1459af590
1459af326: mov       qword ptr [rbp + 0xb0], rax
1459af32d: mov       r13, qword ptr [rsi + rax*8]
1459af331: cmp       qword ptr [r13 + 0x28], 0
1459af336: je        0x1459af350
1459af338: mov       rax, qword ptr [r13 + 0x20]
1459af33c: mov       r15, qword ptr [rax + 8]
1459af340: mov       r14, qword ptr [rax + 0x10]
1459af344: movsd     xmm8, qword ptr [rax + 0x28]
1459af34a: jmp       0x1459af35e
1459af34c: nop       dword ptr [rax]
1459af350: xorpd     xmm8, xmm8
1459af355: xor       r14d, r14d
1459af358: mov       r15d, 1
1459af35e: mov       rcx, qword ptr [r13 + 8]
1459af362: mov       rdx, qword ptr [r13 + 0x10]
1459af366: mov       qword ptr [rbp], 0
1459af36e: mov       qword ptr [rbp + 8], 1
1459af376: mov       qword ptr [rbp + 0x10], 0
1459af37e: test      rdx, rdx
1459af381: jne       0x1459af51c
1459af387: add       rdx, rcx
1459af38a: mov       r8, r12
1459af38d: call      0x1459b04e0
1459af392: nop
1459af393: mov       rax, qword ptr [rbp + 0x10]
1459af397: mov       qword ptr [rbp + 0xa0], rax
1459af39e: movups    xmm0, xmmword ptr [rbp]
1459af3a2: movaps    xmmword ptr [rbp + 0x90], xmm0
1459af3a9: movzx     eax, byte ptr [r13 + 0x38]
1459af3ae: add       al, 0xfe
1459af3b0: lea       rsi, [rip + 0x162dc09]
1459af3b7: cmp       al, 9
1459af3b9: ja        0x1459af3c9
1459af3bb: movzx     eax, al
1459af3be: lea       rcx, [rip + 0x196c683]
1459af3c5: mov       rsi, qword ptr [rcx + rax*8]
1459af3c9: movsd     xmm6, qword ptr [r13 + 0x30]
1459af3cf: movapd    xmm0, xmm6
1459af3d3: call      0x145cf86fd
1459af3d8: movsd     qword ptr [rbp - 0x28], xmm0
1459af3dd: movapd    xmm0, xmm6
1459af3e1: mov       r13, qword ptr [rbp - 0x18]
1459af3e5: divsd     xmm0, qword ptr [r13]
1459af3eb: movsd     qword ptr [rbp - 0x30], xmm0
1459af3f0: mov       rax, qword ptr [rbp - 0x20]
1459af3f4: movsd     xmm0, qword ptr [rax]
1459af3f8: maxsd     xmm0, xmm7
1459af3fc: divsd     xmm6, xmm0
1459af400: movsd     qword ptr [rbp - 0x38], xmm6
1459af405: mov       qword ptr [rbp], 0
1459af40d: mov       qword ptr [rbp + 8], 1
1459af415: mov       qword ptr [rbp + 0x10], 0
1459af41d: test      r14, r14
1459af420: jne       0x1459af55c
1459af426: add       r14, r15
1459af429: mov       rcx, r15
1459af42c: mov       rdx, r14
1459af42f: mov       r8, r12
1459af432: call      0x1459b04e0
1459af437: nop
1459af438: mov       rax, qword ptr [rbp + 0x10]
1459af43c: mov       qword ptr [rbp + 0x80], rax
1459af443: movupd    xmm0, xmmword ptr [rbp]
1459af448: movapd    xmmword ptr [rbp + 0x70], xmm0
1459af44d: divsd     xmm8, qword ptr [r13]
1459af453: add       rsi, 0x10
1459af457: movsd     qword ptr [rbp - 0x40], xmm8
1459af45d: lea       rax, [rbp + 0x90]
1459af464: mov       qword ptr [rbp], rax
1459af468: lea       rax, [rip - 0x59ad38f]
1459af46f: mov       qword ptr [rbp + 8], rax
1459af473: mov       qword ptr [rbp + 0x10], rsi
1459af477: lea       rcx, [rip - 0x59ad3be]
1459af47e: mov       qword ptr [rbp + 0x18], rcx
1459af482: lea       rcx, [rbp - 0x28]
1459af486: mov       qword ptr [rbp + 0x20], rcx
1459af48a: lea       rcx, [rip + 0x32d58f]
1459af491: mov       qword ptr [rbp + 0x28], rcx
1459af495: lea       rdx, [rbp - 0x30]
1459af499: mov       qword ptr [rbp + 0x30], rdx
1459af49d: mov       qword ptr [rbp + 0x38], rcx
1459af4a1: lea       rdx, [rbp - 0x38]
1459af4a5: mov       qword ptr [rbp + 0x40], rdx
1459af4a9: mov       qword ptr [rbp + 0x48], rcx
1459af4ad: lea       rdx, [rbp + 0x70]
1459af4b1: mov       qword ptr [rbp + 0x50], rdx
1459af4b5: mov       qword ptr [rbp + 0x58], rax
1459af4b9: lea       rax, [rbp - 0x40]
1459af4bd: mov       qword ptr [rbp + 0x60], rax
1459af4c1: mov       qword ptr [rbp + 0x68], rcx
1459af4c5: lea       rcx, [rbp - 0x58]
1459af4c9: lea       rdx, [rip + 0x196b7ce]
1459af4d0: mov       r8, r12
1459af4d3: call      0x145ccb3e0
1459af4d8: nop
1459af4d9: mov       rdx, qword ptr [rbp + 0x70]
1459af4dd: test      rdx, rdx
1459af4e0: mov       rsi, qword ptr [rbp - 0x10]
1459af4e4: je        0x1459af4f5
1459af4e6: mov       rcx, qword ptr [rbp + 0x78]
1459af4ea: mov       r8d, 1
1459af4f0: call      0x1400021d0
1459af4f5: mov       rdx, qword ptr [rbp + 0x90]
1459af4fc: test      rdx, rdx
1459af4ff: je        0x1459af300
1459af505: mov       rcx, qword ptr [rbp + 0x98]
1459af50c: mov       r8d, 1
1459af512: call      0x1400021d0
1459af517: jmp       0x1459af300
1459af51c: mov       r8, rdx
1459af51f: shr       r8, 2
1459af523: mov       eax, edx
1459af525: and       eax, 3
1459af528: cmp       rax, 1
1459af52c: sbb       r8, -1
1459af530: mov       qword ptr [rsp + 0x20], 1
1459af539: mov       r9d, 1
1459af53f: mov       qword ptr [rbp - 8], rcx
1459af543: mov       rcx, r12
1459af546: mov       rsi, rdx
1459af549: xor       edx, edx
1459af54b: call      0x145cfd5e0
1459af550: mov       rdx, rsi
1459af553: mov       rcx, qword ptr [rbp - 8]
1459af557: jmp       0x1459af387
1459af55c: mov       r8, r14
1459af55f: shr       r8, 2
1459af563: mov       eax, r14d
1459af566: and       eax, 3
1459af569: cmp       rax, 1
1459af56d: sbb       r8, -1
1459af571: mov       qword ptr [rsp + 0x20], 1
1459af57a: mov       r9d, 1
1459af580: mov       rcx, r12
1459af583: xor       edx, edx
1459af585: call      0x145cfd5e0
1459af58a: nop
1459af58b: jmp       0x1459af426
1459af590: mov       r8, qword ptr [rbp + 0xc0]
1459af597: add       r8, rax
1459af59a: mov       rax, qword ptr [rbp + 0xb8]
1459af5a1: mov       qword ptr [rax], r8
1459af5a4: movaps    xmm6, xmmword ptr [rbp + 0xd0]
1459af5ab: movaps    xmm7, xmmword ptr [rbp + 0xe0]
1459af5b2: movaps    xmm8, xmmword ptr [rbp + 0xf0]
1459af5ba: add       rsp, 0x188
1459af5c1: pop       rbx
1459af5c2: pop       rdi
1459af5c3: pop       rsi
1459af5c4: pop       r12
1459af5c6: pop       r13
1459af5c8: pop       r14
1459af5ca: pop       r15
1459af5cc: pop       rbp
1459af5cd: ret
