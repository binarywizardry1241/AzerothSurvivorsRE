1402c8f70: push      rbp
1402c8f71: push      r14
1402c8f73: push      rsi
1402c8f74: push      rdi
1402c8f75: push      rbx
1402c8f76: sub       rsp, 0xe0
1402c8f7d: lea       rbp, [rsp + 0x80]
1402c8f85: movaps    xmmword ptr [rbp + 0x50], xmm6
1402c8f89: mov       qword ptr [rbp + 0x48], 0xfffffffffffffffe
1402c8f91: mov       rax, rcx
1402c8f94: add       rcx, 0x40
1402c8f98: lea       rdx, [rax + 0x5a8]
1402c8f9f: mov       qword ptr [rbp + 0x30], rcx
1402c8fa3: mov       qword ptr [rbp + 0x38], rdx
1402c8fa7: mov       qword ptr [rbp + 0x18], 0
1402c8faf: mov       qword ptr [rbp + 0x20], 8
1402c8fb7: mov       qword ptr [rbp + 0x28], 0
1402c8fbf: cmp       qword ptr [rax + 0x70], 0
1402c8fc4: je        0x1402c9069
1402c8fca: movabs    r9, 0x24d978ce2db75e0f
1402c8fd4: mov       r8, qword ptr [rax + 0x58]
1402c8fd8: mov       r10, qword ptr [rax + 0x60]
1402c8fdc: xor       r11d, r11d
1402c8fdf: movdqa    xmm0, xmmword ptr [rip + 0x5b04009]
1402c8fe7: pcmpeqd   xmm1, xmm1
1402c8feb: movdqa    xmm2, xmmword ptr [rip + 0x5b0400d]
1402c8ff3: and       r9, r10
1402c8ff6: movdqu    xmm3, xmmword ptr [r8 + r9]
1402c8ffc: movdqa    xmm4, xmm3
1402c9000: pcmpeqb   xmm4, xmm0
1402c9004: pmovmskb  esi, xmm4
1402c9008: test      esi, esi
1402c900a: je        0x1402c9050
1402c900c: tzcnt     edi, esi
1402c9010: add       rdi, r9
1402c9013: and       rdi, r10
1402c9016: neg       rdi
1402c9019: lea       rdi, [rdi + rdi*2]
1402c901d: movdqu    xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
1402c9024: pcmpeqb   xmm4, xmm2
1402c9028: pmovmskb  ebx, xmm4
1402c902c: cmp       ebx, 0xffff
1402c9032: je        0x1402c911d
1402c9038: lea       edi, [rsi - 1]
1402c903b: and       di, si
1402c903e: mov       esi, edi
1402c9040: jne       0x1402c900c
1402c9042: nop       word ptr cs:[rax + rax]
1402c9050: pcmpeqb   xmm3, xmm1
1402c9054: pmovmskb  esi, xmm3
1402c9058: test      esi, esi
1402c905a: jne       0x1402c9069
1402c905c: add       r9, r11
1402c905f: add       r9, 0x10
1402c9063: add       r11, 0x10
1402c9067: jmp       0x1402c8ff3
1402c9069: movzx     r8d, byte ptr [rax + 0xa0]
1402c9071: mov       r8, qword ptr [rax + 0xc0]
1402c9078: mov       r9, qword ptr [rax + 0xc8]
1402c907f: movabs    r10, 0x24d978ce2db75e0f
1402c9089: xor       r11d, r11d
1402c908c: movdqa    xmm0, xmmword ptr [rip + 0x5b03f5c]
1402c9094: pcmpeqd   xmm1, xmm1
1402c9098: movdqa    xmm2, xmmword ptr [rip + 0x5b03f60]
1402c90a0: and       r10, r9
1402c90a3: movdqu    xmm3, xmmword ptr [r8 + r10]
1402c90a9: movdqa    xmm4, xmm3
1402c90ad: pcmpeqb   xmm4, xmm0
1402c90b1: pmovmskb  ebx, xmm4
1402c90b5: test      ebx, ebx
1402c90b7: je        0x1402c9100
1402c90b9: tzcnt     edi, ebx
1402c90bd: add       rdi, r10
1402c90c0: and       rdi, r9
1402c90c3: mov       r14, rdi
1402c90c6: shl       r14, 7
1402c90ca: mov       rsi, r8
1402c90cd: sub       rsi, r14
1402c90d0: movdqu    xmm4, xmmword ptr [rsi - 0x80]
1402c90d5: pcmpeqb   xmm4, xmm2
1402c90d9: pmovmskb  r14d, xmm4
1402c90de: cmp       r14d, 0xffff
1402c90e5: je        0x1402c913b
1402c90e7: lea       esi, [rbx - 1]
1402c90ea: and       si, bx
1402c90ed: mov       ebx, esi
1402c90ef: jne       0x1402c90b9
1402c90f1: nop       word ptr cs:[rax + rax]
1402c9100: pcmpeqb   xmm3, xmm1
1402c9104: pmovmskb  esi, xmm3
1402c9108: test      esi, esi
1402c910a: jne       0x1402c91b1
1402c9110: add       r10, r11
1402c9113: add       r10, 0x10
1402c9117: add       r11, 0x10
1402c911b: jmp       0x1402c90a0
1402c911d: lea       rax, [r8 + rdi*8]
1402c9121: mov       rsi, qword ptr [rax - 8]
1402c9125: mov       edx, 8
1402c912a: xor       r8d, r8d
1402c912d: mov       r9, rsi
1402c9130: call      0x144e9eff0
1402c9135: nop
1402c9136: jmp       0x1402c9326
1402c913b: lea       r10, [rdi - 0x10]
1402c913f: and       r10, r9
1402c9142: movdqu    xmm0, xmmword ptr [r8 + r10]
1402c9148: pcmpeqd   xmm1, xmm1
1402c914c: pcmpeqb   xmm0, xmm1
1402c9150: pmovmskb  r9d, xmm0
1402c9155: movdqu    xmm0, xmmword ptr [r8 + rdi]
1402c915b: pcmpeqb   xmm0, xmm1
1402c915f: pmovmskb  r11d, xmm0
1402c9164: mov       bx, 0x1f
1402c9168: bsr       bx, r9w
1402c916d: xor       ebx, 0xf
1402c9170: or        r11d, 0x10000
1402c9177: tzcnt     r11d, r11d
1402c917c: add       r11d, ebx
1402c917f: mov       r9b, 0x80
1402c9182: cmp       r11w, 0xf
1402c9187: ja        0x1402c9193
1402c9189: inc       qword ptr [rax + 0xd0]
1402c9190: mov       r9b, 0xff
1402c9193: mov       byte ptr [r8 + rdi], r9b
1402c9197: mov       byte ptr [r8 + r10 + 0x10], r9b
1402c919c: dec       qword ptr [rax + 0xd8]
1402c91a3: mov       r8, qword ptr [rsi - 0x70]
1402c91a7: cmp       r8, 2
1402c91ab: jne       0x1402c9357
1402c91b1: mov       rdi, rax
1402c91b4: mov       rsi, qword ptr [rdx]
1402c91b7: lea       rax, [rsi + 1]
1402c91bb: mov       qword ptr [rdx], rax
1402c91be: mov       word ptr [rbp - 8], 0x100
1402c91c4: mov       qword ptr [rbp - 0x58], 1
1402c91cc: movdqu    xmm0, xmmword ptr [rip + 0x5b0427c]
1402c91d4: movdqu    xmmword ptr [rbp - 0x50], xmm0
1402c91d9: mov       qword ptr [rbp - 0x30], 4
1402c91e1: mov       qword ptr [rbp - 0x28], 0x2c
1402c91e9: mov       qword ptr [rbp - 0x10], 0
1402c91f1: mov       byte ptr [rbp - 6], 1
1402c91f5: mov       qword ptr [rbp - 0x40], 0
1402c91fd: mov       byte ptr [rbp - 0x20], 2
1402c9201: lea       r8, [rbp - 0x58]
1402c9205: mov       rdx, rsi
1402c9208: call      0x14000f330
1402c920d: nop
1402c920e: mov       rcx, rdi
1402c9211: add       rcx, 0x58
1402c9215: lea       rdx, [rip + 0x5b29d94]
1402c921c: mov       r8, rsi
1402c921f: call      0x14000f180
1402c9224: nop
1402c9225: mov       rdi, qword ptr [rbp + 0x28]
1402c9229: cmp       rdi, qword ptr [rbp + 0x18]
1402c922d: jne       0x1402c9239
1402c922f: lea       rcx, [rbp + 0x18]
1402c9233: call      0x145bfab70
1402c9238: nop
1402c9239: mov       rax, qword ptr [rbp + 0x20]
1402c923d: mov       qword ptr [rax + rdi*8], rsi
1402c9241: inc       rdi
1402c9244: mov       qword ptr [rbp + 0x28], rdi
1402c9248: mov       qword ptr [rbp - 0x58], 0
1402c9250: mov       qword ptr [rbp - 0x50], 8
1402c9258: mov       qword ptr [rbp - 0x48], 0
1402c9260: movdqu    xmm0, xmmword ptr [rip + 0x5b2a1e8]
1402c9268: movdqu    xmmword ptr [rbp - 0x40], xmm0
1402c926d: movdqu    xmm1, xmmword ptr [rip + 0x5b2a1eb]
1402c9275: movdqu    xmmword ptr [rbp - 0x30], xmm1
1402c927a: mov       qword ptr [rbp - 0x20], 0
1402c9282: mov       qword ptr [rbp - 0x18], 8
1402c928a: mov       qword ptr [rbp - 0x10], 0
1402c9292: movdqu    xmmword ptr [rbp - 8], xmm0
1402c9297: movdqu    xmmword ptr [rbp + 8], xmm1
1402c929c: mov       rcx, qword ptr [rbp + 0x30]
1402c92a0: mov       byte ptr [rbp + 0x47], 1
1402c92a4: lea       r8, [rbp - 0x58]
1402c92a8: mov       rdx, rsi
1402c92ab: call      0x144e44770
1402c92b0: nop
1402c92b1: mov       rax, qword ptr [rbp + 0x28]
1402c92b5: test      rax, rax
1402c92b8: je        0x1402c92c1
1402c92ba: dec       rax
1402c92bd: mov       qword ptr [rbp + 0x28], rax
1402c92c1: mov       rax, qword ptr [rbp + 0x30]
1402c92c5: mov       rax, qword ptr [rax + 8]
1402c92c9: imul      rcx, rsi, 0x130
1402c92d0: add       rcx, rax
1402c92d3: add       rcx, 0x58
1402c92d7: mov       qword ptr [rbp - 0x60], rcx
1402c92db: call      0x14000b310
1402c92e0: nop
1402c92e1: movdqu    xmm0, xmmword ptr [rbp - 0x58]
1402c92e6: movdqu    xmm1, xmmword ptr [rbp - 0x48]
1402c92eb: movdqu    xmm2, xmmword ptr [rbp - 0x38]
1402c92f0: movdqu    xmm3, xmmword ptr [rbp - 0x28]
1402c92f5: movdqu    xmm4, xmmword ptr [rbp - 0x18]
1402c92fa: movups    xmm5, xmmword ptr [rbp - 8]
1402c92fe: movups    xmm6, xmmword ptr [rbp + 8]
1402c9302: mov       rax, qword ptr [rbp - 0x60]
1402c9306: movups    xmmword ptr [rax + 0x60], xmm6
1402c930a: movups    xmmword ptr [rax + 0x50], xmm5
1402c930e: movdqu    xmmword ptr [rax + 0x40], xmm4
1402c9313: movdqu    xmmword ptr [rax + 0x30], xmm3
1402c9318: movdqu    xmmword ptr [rax + 0x20], xmm2
1402c931d: movdqu    xmmword ptr [rax + 0x10], xmm1
1402c9322: movdqu    xmmword ptr [rax], xmm0
1402c9326: mov       rdx, qword ptr [rbp + 0x18]
1402c932a: test      rdx, rdx
1402c932d: je        0x1402c9342
1402c932f: mov       rcx, qword ptr [rbp + 0x20]
1402c9333: shl       rdx, 3
1402c9337: mov       r8d, 8
1402c933d: call      0x1400021d0
1402c9342: mov       rax, rsi
1402c9345: movaps    xmm6, xmmword ptr [rbp + 0x50]
1402c9349: add       rsp, 0xe0
1402c9350: pop       rbx
1402c9351: pop       rdi
1402c9352: pop       rsi
1402c9353: pop       r14
1402c9355: pop       rbp
1402c9356: ret
1402c9357: mov       rax, qword ptr [rsi - 8]
1402c935b: mov       qword ptr [rbp + 0x10], rax
1402c935f: movups    xmm0, xmmword ptr [rsi - 0x18]
1402c9363: movups    xmmword ptr [rbp], xmm0
1402c9367: movups    xmm0, xmmword ptr [rsi - 0x28]
1402c936b: movups    xmmword ptr [rbp - 0x10], xmm0
1402c936f: movdqu    xmm0, xmmword ptr [rsi - 0x68]
1402c9374: movdqu    xmm1, xmmword ptr [rsi - 0x58]
1402c9379: movdqu    xmm2, xmmword ptr [rsi - 0x48]
1402c937e: movdqu    xmm3, xmmword ptr [rsi - 0x38]
1402c9383: movdqu    xmmword ptr [rbp - 0x20], xmm3
1402c9388: movdqu    xmmword ptr [rbp - 0x30], xmm2
1402c938d: movdqu    xmmword ptr [rbp - 0x40], xmm1
1402c9392: movdqu    xmmword ptr [rbp - 0x50], xmm0
1402c9397: mov       qword ptr [rbp - 0x58], r8
1402c939b: lea       rcx, [rbp - 0x58]
1402c939f: lea       rdx, [rbp + 0x18]
1402c93a3: call      0x144e08f20
1402c93a8: nop
1402c93a9: mov       rsi, rax
1402c93ac: mov       rdx, qword ptr [rbp + 0x18]
1402c93b0: test      rdx, rdx
1402c93b3: jne       0x1402c932f
1402c93b9: jmp       0x1402c9342
