1402a87d0: push      rbp
1402a87d1: push      r14
1402a87d3: push      rsi
1402a87d4: push      rdi
1402a87d5: push      rbx
1402a87d6: sub       rsp, 0xe0
1402a87dd: lea       rbp, [rsp + 0x80]
1402a87e5: movaps    xmmword ptr [rbp + 0x50], xmm6
1402a87e9: mov       qword ptr [rbp + 0x48], 0xfffffffffffffffe
1402a87f1: mov       rax, rcx
1402a87f4: add       rcx, 0x40
1402a87f8: lea       rdx, [rax + 0x5a8]
1402a87ff: mov       qword ptr [rbp + 0x30], rcx
1402a8803: mov       qword ptr [rbp + 0x38], rdx
1402a8807: mov       qword ptr [rbp + 0x18], 0
1402a880f: mov       qword ptr [rbp + 0x20], 8
1402a8817: mov       qword ptr [rbp + 0x28], 0
1402a881f: cmp       qword ptr [rax + 0x70], 0
1402a8824: je        0x1402a88c9
1402a882a: movabs    r9, 0x79f454b296f4409b
1402a8834: mov       r8, qword ptr [rax + 0x58]
1402a8838: mov       r10, qword ptr [rax + 0x60]
1402a883c: xor       r11d, r11d
1402a883f: movdqa    xmm0, xmmword ptr [rip + 0x5b2c119]
1402a8847: pcmpeqd   xmm1, xmm1
1402a884b: movdqa    xmm2, xmmword ptr [rip + 0x5b2a2ad]
1402a8853: and       r9, r10
1402a8856: movdqu    xmm3, xmmword ptr [r8 + r9]
1402a885c: movdqa    xmm4, xmm3
1402a8860: pcmpeqb   xmm4, xmm0
1402a8864: pmovmskb  esi, xmm4
1402a8868: test      esi, esi
1402a886a: je        0x1402a88b0
1402a886c: tzcnt     edi, esi
1402a8870: add       rdi, r9
1402a8873: and       rdi, r10
1402a8876: neg       rdi
1402a8879: lea       rdi, [rdi + rdi*2]
1402a887d: movdqu    xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
1402a8884: pcmpeqb   xmm4, xmm2
1402a8888: pmovmskb  ebx, xmm4
1402a888c: cmp       ebx, 0xffff
1402a8892: je        0x1402a897d
1402a8898: lea       edi, [rsi - 1]
1402a889b: and       di, si
1402a889e: mov       esi, edi
1402a88a0: jne       0x1402a886c
1402a88a2: nop       word ptr cs:[rax + rax]
1402a88b0: pcmpeqb   xmm3, xmm1
1402a88b4: pmovmskb  esi, xmm3
1402a88b8: test      esi, esi
1402a88ba: jne       0x1402a88c9
1402a88bc: add       r9, r11
1402a88bf: add       r9, 0x10
1402a88c3: add       r11, 0x10
1402a88c7: jmp       0x1402a8853
1402a88c9: movzx     r8d, byte ptr [rax + 0xa0]
1402a88d1: mov       r8, qword ptr [rax + 0xc0]
1402a88d8: mov       r9, qword ptr [rax + 0xc8]
1402a88df: movabs    r10, 0x79f454b296f4409b
1402a88e9: xor       r11d, r11d
1402a88ec: movdqa    xmm0, xmmword ptr [rip + 0x5b2c06c]
1402a88f4: pcmpeqd   xmm1, xmm1
1402a88f8: movdqa    xmm2, xmmword ptr [rip + 0x5b2a200]
1402a8900: and       r10, r9
1402a8903: movdqu    xmm3, xmmword ptr [r8 + r10]
1402a8909: movdqa    xmm4, xmm3
1402a890d: pcmpeqb   xmm4, xmm0
1402a8911: pmovmskb  ebx, xmm4
1402a8915: test      ebx, ebx
1402a8917: je        0x1402a8960
1402a8919: tzcnt     edi, ebx
1402a891d: add       rdi, r10
1402a8920: and       rdi, r9
1402a8923: mov       r14, rdi
1402a8926: shl       r14, 7
1402a892a: mov       rsi, r8
1402a892d: sub       rsi, r14
1402a8930: movdqu    xmm4, xmmword ptr [rsi - 0x80]
1402a8935: pcmpeqb   xmm4, xmm2
1402a8939: pmovmskb  r14d, xmm4
1402a893e: cmp       r14d, 0xffff
1402a8945: je        0x1402a899b
1402a8947: lea       esi, [rbx - 1]
1402a894a: and       si, bx
1402a894d: mov       ebx, esi
1402a894f: jne       0x1402a8919
1402a8951: nop       word ptr cs:[rax + rax]
1402a8960: pcmpeqb   xmm3, xmm1
1402a8964: pmovmskb  esi, xmm3
1402a8968: test      esi, esi
1402a896a: jne       0x1402a8a11
1402a8970: add       r10, r11
1402a8973: add       r10, 0x10
1402a8977: add       r11, 0x10
1402a897b: jmp       0x1402a8900
1402a897d: lea       rax, [r8 + rdi*8]
1402a8981: mov       rsi, qword ptr [rax - 8]
1402a8985: mov       edx, 8
1402a898a: xor       r8d, r8d
1402a898d: mov       r9, rsi
1402a8990: call      0x144e9eff0
1402a8995: nop
1402a8996: jmp       0x1402a8b91
1402a899b: lea       r10, [rdi - 0x10]
1402a899f: and       r10, r9
1402a89a2: movdqu    xmm0, xmmword ptr [r8 + r10]
1402a89a8: pcmpeqd   xmm1, xmm1
1402a89ac: pcmpeqb   xmm0, xmm1
1402a89b0: pmovmskb  r9d, xmm0
1402a89b5: movdqu    xmm0, xmmword ptr [r8 + rdi]
1402a89bb: pcmpeqb   xmm0, xmm1
1402a89bf: pmovmskb  r11d, xmm0
1402a89c4: mov       bx, 0x1f
1402a89c8: bsr       bx, r9w
1402a89cd: xor       ebx, 0xf
1402a89d0: or        r11d, 0x10000
1402a89d7: tzcnt     r11d, r11d
1402a89dc: add       r11d, ebx
1402a89df: mov       r9b, 0x80
1402a89e2: cmp       r11w, 0xf
1402a89e7: ja        0x1402a89f3
1402a89e9: inc       qword ptr [rax + 0xd0]
1402a89f0: mov       r9b, 0xff
1402a89f3: mov       byte ptr [r8 + rdi], r9b
1402a89f7: mov       byte ptr [r8 + r10 + 0x10], r9b
1402a89fc: dec       qword ptr [rax + 0xd8]
1402a8a03: mov       r8, qword ptr [rsi - 0x70]
1402a8a07: cmp       r8, 2
1402a8a0b: jne       0x1402a8bc2
1402a8a11: mov       rdi, rax
1402a8a14: mov       rsi, qword ptr [rdx]
1402a8a17: lea       rax, [rsi + 1]
1402a8a1b: mov       qword ptr [rdx], rax
1402a8a1e: mov       word ptr [rbp - 8], 0x100
1402a8a24: mov       qword ptr [rbp - 0x58], 1
1402a8a2c: movdqu    xmm0, xmmword ptr [rip + 0x5b24bcc]
1402a8a34: movdqu    xmmword ptr [rbp - 0x50], xmm0
1402a8a39: mov       qword ptr [rbp - 0x30], 4
1402a8a41: mov       qword ptr [rbp - 0x28], 0x50
1402a8a49: mov       qword ptr [rbp - 0x10], 0
1402a8a51: mov       byte ptr [rbp - 6], 1
1402a8a55: mov       qword ptr [rbp - 0x40], 2
1402a8a5d: lea       rax, [rip - 0x1ef5f4]
1402a8a64: mov       qword ptr [rbp - 0x38], rax
1402a8a68: mov       byte ptr [rbp - 0x20], 2
1402a8a6c: lea       r8, [rbp - 0x58]
1402a8a70: mov       rdx, rsi
1402a8a73: call      0x14000f330
1402a8a78: nop
1402a8a79: mov       rcx, rdi
1402a8a7c: add       rcx, 0x58
1402a8a80: lea       rdx, [rip + 0x5b49f29]
1402a8a87: mov       r8, rsi
1402a8a8a: call      0x14000f180
1402a8a8f: nop
1402a8a90: mov       rdi, qword ptr [rbp + 0x28]
1402a8a94: cmp       rdi, qword ptr [rbp + 0x18]
1402a8a98: jne       0x1402a8aa4
1402a8a9a: lea       rcx, [rbp + 0x18]
1402a8a9e: call      0x145bfab70
1402a8aa3: nop
1402a8aa4: mov       rax, qword ptr [rbp + 0x20]
1402a8aa8: mov       qword ptr [rax + rdi*8], rsi
1402a8aac: inc       rdi
1402a8aaf: mov       qword ptr [rbp + 0x28], rdi
1402a8ab3: mov       qword ptr [rbp - 0x58], 0
1402a8abb: mov       qword ptr [rbp - 0x50], 8
1402a8ac3: mov       qword ptr [rbp - 0x48], 0
1402a8acb: movdqu    xmm0, xmmword ptr [rip + 0x5b4a97d]
1402a8ad3: movdqu    xmmword ptr [rbp - 0x40], xmm0
1402a8ad8: movdqu    xmm1, xmmword ptr [rip + 0x5b4a980]
1402a8ae0: movdqu    xmmword ptr [rbp - 0x30], xmm1
1402a8ae5: mov       qword ptr [rbp - 0x20], 0
1402a8aed: mov       qword ptr [rbp - 0x18], 8
1402a8af5: mov       qword ptr [rbp - 0x10], 0
1402a8afd: movdqu    xmmword ptr [rbp - 8], xmm0
1402a8b02: movdqu    xmmword ptr [rbp + 8], xmm1
1402a8b07: mov       rcx, qword ptr [rbp + 0x30]
1402a8b0b: mov       byte ptr [rbp + 0x47], 1
1402a8b0f: lea       r8, [rbp - 0x58]
1402a8b13: mov       rdx, rsi
1402a8b16: call      0x144e44770
1402a8b1b: nop
1402a8b1c: mov       rax, qword ptr [rbp + 0x28]
1402a8b20: test      rax, rax
1402a8b23: je        0x1402a8b2c
1402a8b25: dec       rax
1402a8b28: mov       qword ptr [rbp + 0x28], rax
1402a8b2c: mov       rax, qword ptr [rbp + 0x30]
1402a8b30: mov       rax, qword ptr [rax + 8]
1402a8b34: imul      rcx, rsi, 0x130
1402a8b3b: add       rcx, rax
1402a8b3e: add       rcx, 0x58
1402a8b42: mov       qword ptr [rbp - 0x60], rcx
1402a8b46: call      0x14000b310
1402a8b4b: nop
1402a8b4c: movdqu    xmm0, xmmword ptr [rbp - 0x58]
1402a8b51: movdqu    xmm1, xmmword ptr [rbp - 0x48]
1402a8b56: movdqu    xmm2, xmmword ptr [rbp - 0x38]
1402a8b5b: movdqu    xmm3, xmmword ptr [rbp - 0x28]
1402a8b60: movdqu    xmm4, xmmword ptr [rbp - 0x18]
1402a8b65: movups    xmm5, xmmword ptr [rbp - 8]
1402a8b69: movups    xmm6, xmmword ptr [rbp + 8]
1402a8b6d: mov       rax, qword ptr [rbp - 0x60]
1402a8b71: movups    xmmword ptr [rax + 0x60], xmm6
1402a8b75: movups    xmmword ptr [rax + 0x50], xmm5
1402a8b79: movdqu    xmmword ptr [rax + 0x40], xmm4
1402a8b7e: movdqu    xmmword ptr [rax + 0x30], xmm3
1402a8b83: movdqu    xmmword ptr [rax + 0x20], xmm2
1402a8b88: movdqu    xmmword ptr [rax + 0x10], xmm1
1402a8b8d: movdqu    xmmword ptr [rax], xmm0
1402a8b91: mov       rdx, qword ptr [rbp + 0x18]
1402a8b95: test      rdx, rdx
1402a8b98: je        0x1402a8bad
1402a8b9a: mov       rcx, qword ptr [rbp + 0x20]
1402a8b9e: shl       rdx, 3
1402a8ba2: mov       r8d, 8
1402a8ba8: call      0x1400021d0
1402a8bad: mov       rax, rsi
1402a8bb0: movaps    xmm6, xmmword ptr [rbp + 0x50]
1402a8bb4: add       rsp, 0xe0
1402a8bbb: pop       rbx
1402a8bbc: pop       rdi
1402a8bbd: pop       rsi
1402a8bbe: pop       r14
1402a8bc0: pop       rbp
1402a8bc1: ret
1402a8bc2: mov       rax, qword ptr [rsi - 8]
1402a8bc6: mov       qword ptr [rbp + 0x10], rax
1402a8bca: movups    xmm0, xmmword ptr [rsi - 0x18]
1402a8bce: movups    xmmword ptr [rbp], xmm0
1402a8bd2: movups    xmm0, xmmword ptr [rsi - 0x28]
1402a8bd6: movups    xmmword ptr [rbp - 0x10], xmm0
1402a8bda: movdqu    xmm0, xmmword ptr [rsi - 0x68]
1402a8bdf: movdqu    xmm1, xmmword ptr [rsi - 0x58]
1402a8be4: movdqu    xmm2, xmmword ptr [rsi - 0x48]
1402a8be9: movdqu    xmm3, xmmword ptr [rsi - 0x38]
1402a8bee: movdqu    xmmword ptr [rbp - 0x20], xmm3
1402a8bf3: movdqu    xmmword ptr [rbp - 0x30], xmm2
1402a8bf8: movdqu    xmmword ptr [rbp - 0x40], xmm1
1402a8bfd: movdqu    xmmword ptr [rbp - 0x50], xmm0
1402a8c02: mov       qword ptr [rbp - 0x58], r8
1402a8c06: lea       rcx, [rbp - 0x58]
1402a8c0a: lea       rdx, [rbp + 0x18]
1402a8c0e: call      0x144e08f20
1402a8c13: nop
1402a8c14: mov       rsi, rax
1402a8c17: mov       rdx, qword ptr [rbp + 0x18]
1402a8c1b: test      rdx, rdx
1402a8c1e: jne       0x1402a8b9a
1402a8c24: jmp       0x1402a8bad
