14018d8e0: push      r15
14018d8e2: push      r14
14018d8e4: push      r13
14018d8e6: push      r12
14018d8e8: push      rsi
14018d8e9: push      rdi
14018d8ea: push      rbp
14018d8eb: push      rbx
14018d8ec: sub       rsp, 0x78
14018d8f0: movaps    xmmword ptr [rsp + 0x60], xmm7
14018d8f5: movaps    xmmword ptr [rsp + 0x50], xmm6
14018d8fa: mov       rcx, qword ptr [rdx]
14018d8fd: mov       rbx, qword ptr [rdx + 8]
14018d901: mov       eax, dword ptr [rdx + 0x14]
14018d904: mov       dword ptr [rsp + 0x2c], eax
14018d908: mov       r14, qword ptr [rcx + 0xf8]
14018d90f: mov       rax, qword ptr [rcx + 0x100]
14018d916: lea       r15, [r14 + rax*4]
14018d91a: mov       qword ptr [rsp + 0x40], rcx
14018d91f: cmp       byte ptr [rcx + 0x108], 0
14018d926: je        0x14018da69
14018d92c: xor       r12d, r12d
14018d92f: movdqa    xmm6, xmmword ptr [rip + 0x5c573b9]
14018d937: movd      xmm7, dword ptr [rip + 0x5c573d1]
14018d93f: xor       r13d, r13d
14018d942: xor       r8d, r8d
14018d945: cmp       r8d, r12d
14018d948: jne       0x14018d9ae
14018d94a: nop       word ptr [rax + rax]
14018d950: cmp       r14, r15
14018d953: je        0x14018dbd3
14018d959: mov       ecx, dword ptr [r14]
14018d95c: add       r14, 4
14018d960: mov       rax, qword ptr [rbx + 0x1a8]
14018d967: lea       rcx, [rcx + rcx*8]
14018d96b: mov       r12, qword ptr [rax + rcx*8 + 0x10]
14018d970: test      r12, r12
14018d973: je        0x14018d950
14018d975: lea       rax, [rax + rcx*8]
14018d979: mov       rcx, qword ptr [rsp + 0x40]
14018d97e: mov       rcx, qword ptr [rcx + 0x110]
14018d985: mov       rdx, qword ptr [rax + 0x18]
14018d989: mov       rax, qword ptr [rax + 0x38]
14018d98d: mov       rax, qword ptr [rax + rcx*8]
14018d991: not       rax
14018d994: lea       rax, [rax + rax*2]
14018d998: shl       rax, 4
14018d99c: mov       r13, qword ptr [rdx + rax + 0x10]
14018d9a1: mov       rax, qword ptr [rdx + rax + 0x28]
14018d9a6: mov       qword ptr [rsp + 0x30], rax
14018d9ab: xor       r8d, r8d
14018d9ae: mov       ebp, r8d
14018d9b1: inc       r8d
14018d9b4: imul      rax, rbp, 0xf8
14018d9bb: lea       rdi, [rax + r13]
14018d9bf: cmp       qword ptr [r13 + rax + 0x68], 0x11
14018d9c5: jne       0x14018d9f2
14018d9c7: mov       rax, qword ptr [rdi + 0x60]
14018d9cb: movdqu    xmm0, xmmword ptr [rax]
14018d9cf: pcmpeqb   xmm0, xmm6
14018d9d3: movzx     eax, byte ptr [rax + 0x10]
14018d9d7: movd      xmm1, eax
14018d9db: pcmpeqb   xmm1, xmm7
14018d9df: pand      xmm1, xmm0
14018d9e3: pmovmskb  eax, xmm1
14018d9e7: cmp       eax, 0xffff
14018d9ec: je        0x14018d945
14018d9f2: mov       dword ptr [rsp + 0x38], r8d
14018d9f7: call      0x140002200
14018d9fc: mov       ecx, 0x11
14018da01: mov       edx, 1
14018da06: call      0x1400021c0
14018da0b: test      rax, rax
14018da0e: je        0x14018dbee
14018da14: mov       rsi, rax
14018da17: movdqu    xmm0, xmmword ptr [rip + 0x5c57c49]
14018da1f: movdqu    xmmword ptr [rax], xmm0
14018da23: mov       byte ptr [rax + 0x10], 0x73
14018da27: mov       eax, dword ptr [rsp + 0x2c]
14018da2b: mov       rcx, qword ptr [rsp + 0x30]
14018da30: mov       dword ptr [rcx + rbp*4], eax
14018da33: mov       rdx, qword ptr [rdi + 0x58]
14018da37: test      rdx, rdx
14018da3a: je        0x14018da4b
14018da3c: mov       rcx, qword ptr [rdi + 0x60]
14018da40: mov       r8d, 1
14018da46: call      0x1400021d0
14018da4b: mov       qword ptr [rdi + 0x58], 0x11
14018da53: mov       qword ptr [rdi + 0x60], rsi
14018da57: mov       qword ptr [rdi + 0x68], 0x11
14018da5f: mov       r8d, dword ptr [rsp + 0x38]
14018da64: jmp       0x14018d945
14018da69: xor       r12d, r12d
14018da6c: mov       edi, 8
14018da71: movdqa    xmm6, xmmword ptr [rip + 0x5c57277]
14018da79: movd      xmm7, dword ptr [rip + 0x5c5728f]
14018da81: xor       edx, edx
14018da83: xor       r8d, r8d
14018da86: cmp       r8d, r12d
14018da89: jne       0x14018db08
14018da8b: nop       dword ptr [rax + rax]
14018da90: cmp       r14, r15
14018da93: je        0x14018dbd3
14018da99: mov       ecx, dword ptr [r14]
14018da9c: add       r14, 4
14018daa0: mov       rax, qword ptr [rbx + 0x108]
14018daa7: lea       rcx, [rcx + rcx*4]
14018daab: shl       rcx, 5
14018daaf: mov       r12, qword ptr [rax + rcx + 0x58]
14018dab4: test      r12, r12
14018dab7: je        0x14018da90
14018dab9: add       rax, rcx
14018dabc: mov       ecx, dword ptr [rax + 0x94]
14018dac2: mov       rdx, qword ptr [rbx + 0x1a8]
14018dac9: lea       rcx, [rcx + rcx*8]
14018dacd: mov       r8, qword ptr [rsp + 0x40]
14018dad2: mov       r8, qword ptr [r8 + 0x110]
14018dad9: mov       r9, qword ptr [rdx + rcx*8 + 0x18]
14018dade: mov       rcx, qword ptr [rdx + rcx*8 + 0x38]
14018dae3: mov       rcx, qword ptr [rcx + r8*8]
14018dae7: not       rcx
14018daea: lea       rcx, [rcx + rcx*2]
14018daee: shl       rcx, 4
14018daf2: mov       rdx, qword ptr [r9 + rcx + 0x10]
14018daf7: mov       rcx, qword ptr [r9 + rcx + 0x28]
14018dafc: mov       qword ptr [rsp + 0x48], rcx
14018db01: mov       rdi, qword ptr [rax + 0x50]
14018db05: xor       r8d, r8d
14018db08: mov       eax, r8d
14018db0b: shl       rax, 4
14018db0f: inc       r8d
14018db12: mov       ebp, dword ptr [rdi + rax + 8]
14018db16: not       ebp
14018db18: imul      rax, rbp, 0xf8
14018db1f: lea       r13, [rdx + rax]
14018db23: cmp       qword ptr [rdx + rax + 0x68], 0x11
14018db29: jne       0x14018db56
14018db2b: mov       rax, qword ptr [r13 + 0x60]
14018db2f: movdqu    xmm0, xmmword ptr [rax]
14018db33: pcmpeqb   xmm0, xmm6
14018db37: movzx     eax, byte ptr [rax + 0x10]
14018db3b: movd      xmm1, eax
14018db3f: pcmpeqb   xmm1, xmm7
14018db43: pand      xmm1, xmm0
14018db47: pmovmskb  eax, xmm1
14018db4b: cmp       eax, 0xffff
14018db50: je        0x14018da86
14018db56: mov       dword ptr [rsp + 0x30], r8d
14018db5b: mov       qword ptr [rsp + 0x38], rdx
14018db60: call      0x140002200
14018db65: mov       ecx, 0x11
14018db6a: mov       edx, 1
14018db6f: call      0x1400021c0
14018db74: test      rax, rax
14018db77: je        0x14018dbee
14018db79: mov       rsi, rax
14018db7c: movdqu    xmm0, xmmword ptr [rip + 0x5c57ae4]
14018db84: movdqu    xmmword ptr [rax], xmm0
14018db88: mov       byte ptr [rax + 0x10], 0x73
14018db8c: mov       eax, dword ptr [rsp + 0x2c]
14018db90: mov       rcx, qword ptr [rsp + 0x48]
14018db95: mov       dword ptr [rcx + rbp*4], eax
14018db98: mov       rdx, qword ptr [r13 + 0x58]
14018db9c: test      rdx, rdx
14018db9f: je        0x14018dbb0
14018dba1: mov       rcx, qword ptr [r13 + 0x60]
14018dba5: mov       r8d, 1
14018dbab: call      0x1400021d0
14018dbb0: mov       qword ptr [r13 + 0x58], 0x11
14018dbb8: mov       qword ptr [r13 + 0x60], rsi
14018dbbc: mov       qword ptr [r13 + 0x68], 0x11
14018dbc4: mov       rdx, qword ptr [rsp + 0x38]
14018dbc9: mov       r8d, dword ptr [rsp + 0x30]
14018dbce: jmp       0x14018da86
14018dbd3: movaps    xmm6, xmmword ptr [rsp + 0x50]
14018dbd8: movaps    xmm7, xmmword ptr [rsp + 0x60]
14018dbdd: add       rsp, 0x78
14018dbe1: pop       rbx
14018dbe2: pop       rbp
14018dbe3: pop       rdi
14018dbe4: pop       rsi
14018dbe5: pop       r12
14018dbe7: pop       r13
14018dbe9: pop       r14
14018dbeb: pop       r15
14018dbed: ret
14018dbee: mov       ecx, 1
14018dbf3: mov       edx, 0x11
14018dbf8: call      0x145d992bb
14018dbfd: ud2
