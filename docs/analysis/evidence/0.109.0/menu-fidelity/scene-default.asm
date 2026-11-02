14007cd50: push     rbp
14007cd51: push     r15
14007cd53: push     r14
14007cd55: push     rsi
14007cd56: push     rdi
14007cd57: push     rbx
14007cd58: sub      rsp, 0x88
14007cd5f: lea      rbp, [rsp + 0x80]
14007cd67: mov      qword ptr [rbp], 0xfffffffffffffffe
14007cd6f: mov      rsi, rdx
14007cd72: cmp      byte ptr [r8], 0
14007cd76: mov      byte ptr [r8], 1
14007cd7a: jne      0x14007cda1
14007cd7c: mov      qword ptr [rsp + 0x20], 1
14007cd85: lea      rdx, [rip + 0x5d516b7]
14007cd8c: lea      r9, [rip + 0x5d52a3a]
14007cd93: mov      r8d, 9
14007cd99: mov      rcx, rsi
14007cd9c: call     0x140724570
14007cda1: lea      rdx, [rip + 0x5d52a8c]
14007cda8: lea      rcx, [rbp - 0x28]
14007cdac: mov      r8d, 0xe
14007cdb2: call     0x14093fdd0
14007cdb7: cmp      qword ptr [rbp - 0x28], -1
14007cdbc: je       0x14007ce18
14007cdbe: mov      rax, qword ptr [rbp - 0x18]
14007cdc2: mov      qword ptr [rbp - 0x40], rax
14007cdc6: movdqu   xmm0, xmmword ptr [rbp - 0x28]
14007cdcb: movdqa   xmmword ptr [rbp - 0x50], xmm0
14007cdd0: mov      rax, qword ptr [rbp - 0x50]
14007cdd4: cmp      rax, -1
14007cdd8: je       0x14007ce3b
14007cdda: mov      qword ptr [rbp - 0x10], rax
14007cdde: mov      rcx, qword ptr [rbp - 0x48]
14007cde2: mov      rdx, qword ptr [rbp - 0x40]
14007cde6: mov      qword ptr [rbp - 0x30], rcx
14007cdea: call     0x140089200
14007cdef: nop
14007cdf0: mov      bl, 1
14007cdf2: cmp      rdx, 1
14007cdf6: jne      0x14007cdfe
14007cdf8: cmp      byte ptr [rax], 0x30
14007cdfb: setne    bl
14007cdfe: mov      rdx, qword ptr [rbp - 0x10]
14007ce02: test     rdx, rdx
14007ce05: je       0x14007ce3d
14007ce07: mov      r8d, 1
14007ce0d: mov      rcx, qword ptr [rbp - 0x30]
14007ce11: call     0x1400021d0
14007ce16: jmp      0x14007ce3d
14007ce18: lea      r8, [rip + 0x5d51624]
14007ce1f: lea      rcx, [rbp - 0x50]
14007ce23: mov      r9d, 9
14007ce29: mov      rdx, rsi
14007ce2c: call     0x1407279a0
14007ce31: mov      rax, qword ptr [rbp - 0x50]
14007ce35: cmp      rax, -1
14007ce39: jne      0x14007cdda
14007ce3b: mov      bl, 1
14007ce3d: cmp      qword ptr [rsi + 0x90], 0
14007ce45: je       0x14007cfc5
14007ce4b: mov      rax, qword ptr [rsi + 0x78]
14007ce4f: mov      rcx, qword ptr [rsi + 0x80]
14007ce56: movabs   rdx, 0x5ad1703cb9f182f4
14007ce60: xor      r8d, r8d
14007ce63: movdqa   xmm0, xmmword ptr [rip + 0x5d207f5]
14007ce6b: pcmpeqd  xmm2, xmm2
14007ce6f: movdqa   xmm1, xmmword ptr [rip + 0x5d20c99]
14007ce77: and      rdx, rcx
14007ce7a: movdqu   xmm3, xmmword ptr [rax + rdx]
14007ce7f: movdqa   xmm4, xmm3
14007ce83: pcmpeqb  xmm4, xmm0
14007ce87: pmovmskb r9d, xmm4
14007ce8c: test     r9d, r9d
14007ce8f: je       0x14007ced0
14007ce91: tzcnt    r10d, r9d
14007ce96: add      r10, rdx
14007ce99: and      r10, rcx
14007ce9c: neg      r10
14007ce9f: lea      r10, [r10 + r10*2]
14007cea3: movdqu   xmm4, xmmword ptr [rax + r10*8 - 0x18]
14007ceaa: pcmpeqb  xmm4, xmm1
14007ceae: pmovmskb r11d, xmm4
14007ceb3: cmp      r11d, 0xffff
14007ceba: je       0x14007ceef
14007cebc: lea      r10d, [r9 - 1]
14007cec0: and      r10w, r9w
14007cec4: mov      r9d, r10d
14007cec7: jne      0x14007ce91
14007cec9: nop      dword ptr [rax]
14007ced0: pcmpeqb  xmm3, xmm2
14007ced4: pmovmskb r9d, xmm3
14007ced9: test     r9d, r9d
14007cedc: jne      0x14007cfc5
14007cee2: add      rdx, r8
14007cee5: add      rdx, 0x10
14007cee9: add      r8, 0x10
14007ceed: jmp      0x14007ce77
14007ceef: lea      rdx, [rax + r10*8]
14007cef3: mov      rdx, qword ptr [rdx - 8]
14007cef7: mov      r8, qword ptr [rsi + 0x218]
14007cefe: cmp      rdx, r8
14007cf01: jae      0x14007cfc5
14007cf07: mov      r9, qword ptr [rsi + 0x210]
14007cf0e: mov      r10, qword ptr [r9 + rdx*8]
14007cf12: test     r10, r10
14007cf15: je       0x14007cfc5
14007cf1b: mov      rdx, qword ptr [rsi + 0x1e0]
14007cf22: not      r10
14007cf25: imul     r10, r10, 0x38
14007cf29: cmp      byte ptr [rdx + r10 + 0x30], 0
14007cf2f: je       0x14007cfc5
14007cf35: add      r10, rdx
14007cf38: mov      r10, qword ptr [r10 + 0x10]
14007cf3c: cmp      bl, byte ptr [r10 + 0x1c]
14007cf40: je       0x14007d028
14007cf46: movabs   r10, 0x5ad1703cb9f182f4
14007cf50: xor      r11d, r11d
14007cf53: pcmpeqd  xmm2, xmm2
14007cf57: and      r10, rcx
14007cf5a: movdqu   xmm3, xmmword ptr [rax + r10]
14007cf60: movdqa   xmm4, xmm3
14007cf64: pcmpeqb  xmm4, xmm0
14007cf68: pmovmskb edi, xmm4
14007cf6c: test     edi, edi
14007cf6e: je       0x14007cfa8
14007cf70: tzcnt    r14d, edi
14007cf75: add      r14, r10
14007cf78: and      r14, rcx
14007cf7b: neg      r14
14007cf7e: lea      r14, [r14 + r14*2]
14007cf82: movdqu   xmm4, xmmword ptr [rax + r14*8 - 0x18]
14007cf89: pcmpeqb  xmm4, xmm1
14007cf8d: pmovmskb r15d, xmm4
14007cf92: cmp      r15d, 0xffff
14007cf99: je       0x14007cff1
14007cf9b: lea      r14d, [rdi - 1]
14007cf9f: and      r14w, di
14007cfa3: mov      edi, r14d
14007cfa6: jne      0x14007cf70
14007cfa8: pcmpeqb  xmm3, xmm2
14007cfac: pmovmskb edi, xmm3
14007cfb0: test     edi, edi
14007cfb2: jne      0x14007d038
14007cfb8: add      r10, r11
14007cfbb: add      r10, 0x10
14007cfbf: add      r11, 0x10
14007cfc3: jmp      0x14007cf57
14007cfc5: lea      rax, [rbp - 1]
14007cfc9: mov      qword ptr [rbp - 0x28], rax
14007cfcd: lea      rax, [rip + 0x4f8032c]
14007cfd4: mov      qword ptr [rbp - 0x20], rax
14007cfd8: lea      rcx, [rip + 0x5d50281]
14007cfdf: lea      r8, [rip + 0x5d52892]
14007cfe6: lea      rdx, [rbp - 0x28]
14007cfea: call     0x145d99830
14007cfef: ud2
14007cff1: lea      rax, [rax + r14*8]
14007cff5: mov      rax, qword ptr [rax - 8]
14007cff9: cmp      rax, r8
14007cffc: jae      0x14007d038
14007cffe: mov      rax, qword ptr [r9 + rax*8]
14007d002: test     rax, rax
14007d005: je       0x14007d038
14007d007: not      rax
14007d00a: imul     rax, rax, 0x38
14007d00e: cmp      byte ptr [rdx + rax + 0x30], 0
14007d013: je       0x14007d038
14007d015: add      rdx, rax
14007d018: mov      rax, qword ptr [rdx + 0x10]
14007d01c: mov      ecx, dword ptr [rsi + 0x5b0]
14007d022: mov      dword ptr [rdx + 0x2c], ecx
14007d025: mov      byte ptr [rax + 0x1c], bl
14007d028: add      rsp, 0x88
14007d02f: pop      rbx
14007d030: pop      rdi
14007d031: pop      rsi
14007d032: pop      r14
14007d034: pop      r15
14007d036: pop      rbp
14007d037: ret
14007d038: lea      rax, [rbp - 1]
14007d03c: mov      qword ptr [rbp - 0x28], rax
14007d040: lea      rax, [rip + 0x4f802b9]
14007d047: mov      qword ptr [rbp - 0x20], rax
14007d04b: lea      rcx, [rip + 0x5d5020e]
14007d052: lea      r8, [rip + 0x5d52837]
14007d059: lea      rdx, [rbp - 0x28]
14007d05d: call     0x145d99830
14007d062: ud2
