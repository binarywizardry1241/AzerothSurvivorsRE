14590eaf0: push      rbp
14590eaf1: push      r15
14590eaf3: push      r14
14590eaf5: push      r13
14590eaf7: push      r12
14590eaf9: push      rsi
14590eafa: push      rdi
14590eafb: push      rbx
14590eafc: sub       rsp, 0x118
14590eb03: lea       rbp, [rsp + 0x80]
14590eb0b: movaps    xmmword ptr [rbp + 0x80], xmm11
14590eb13: movaps    xmmword ptr [rbp + 0x70], xmm10
14590eb18: movaps    xmmword ptr [rbp + 0x60], xmm9
14590eb1d: movaps    xmmword ptr [rbp + 0x50], xmm8
14590eb22: movaps    xmmword ptr [rbp + 0x40], xmm7
14590eb26: movaps    xmmword ptr [rbp + 0x30], xmm6
14590eb2a: mov       qword ptr [rbp + 0x28], 0xfffffffffffffffe
14590eb32: mov       rsi, rcx
14590eb35: movzx     ecx, byte ptr [rdx + 0x72]
14590eb39: test      cl, cl
14590eb3b: je        0x14590f020
14590eb41: mov       rdi, rdx
14590eb44: test      r8b, r8b
14590eb47: je        0x14590ed3c
14590eb4d: movzx     edx, r8b
14590eb51: movzx     eax, cl
14590eb54: cmp       r8b, cl
14590eb57: cmovb     eax, edx
14590eb5a: mov       r15, qword ptr [rdi + 0x58]
14590eb5e: test      r15, r15
14590eb61: je        0x14590ed4b
14590eb67: mov       qword ptr [rbp + 0x18], rsi
14590eb6b: movzx     eax, al
14590eb6e: xorps     xmm7, xmm7
14590eb71: cvtsi2ss  xmm7, eax
14590eb75: mov       rbx, qword ptr [rdi + 0x50]
14590eb79: shl       r15, 6
14590eb7d: cmp       al, 2
14590eb7f: mov       ecx, 1
14590eb84: cmovae    ecx, eax
14590eb87: movzx     eax, cl
14590eb8a: xorps     xmm6, xmm6
14590eb8d: cvtsi2ss  xmm6, eax
14590eb91: mov       r13d, 2
14590eb97: movss     xmm8, dword ptr [rip + 0x48e730]
14590eba0: lea       r14, [rbp - 0x30]
14590eba4: lea       rsi, [rip + 0x191a911]
14590ebab: movss     xmm9, dword ptr [rip + 0x4c4288]
14590ebb4: movss     xmm10, dword ptr [rip + 0x48e6e3]
14590ebbd: nop       dword ptr [rax]
14590ebc0: movzx     eax, byte ptr [rbx]
14590ebc3: sub       al, 0x23
14590ebc5: movzx     eax, al
14590ebc8: cmovb     eax, r13d
14590ebcc: test      al, al
14590ebce: je        0x14590ec00
14590ebd0: movzx     eax, al
14590ebd3: cmp       eax, 1
14590ebd6: jne       0x14590ec30
14590ebd8: cmp       byte ptr [rbx + 0x24], 2
14590ebdc: movss     xmm11, dword ptr [rbx + 0x20]
14590ebe2: mulss     xmm11, xmm7
14590ebe7: mov       r12d, 1
14590ebed: je        0x14590ec78
14590ebf3: mulss     xmm11, xmm8
14590ebf8: jmp       0x14590ec78
14590ebfa: nop       word ptr [rax + rax]
14590ec00: movzx     eax, byte ptr [rbx + 8]
14590ec04: movss     xmm11, dword ptr [rbx + 4]
14590ec0a: mulss     xmm11, xmm7
14590ec0f: mov       r12d, 1
14590ec15: cmp       eax, 0x1a
14590ec18: ja        0x14590ebf3
14590ec1a: mov       ecx, 0x6008040
14590ec1f: bt        ecx, eax
14590ec22: jb        0x14590ec78
14590ec24: jmp       0x14590ebf3
14590ec26: nop       word ptr cs:[rax + rax]
14590ec30: mov       rcx, r14
14590ec33: mov       rdx, rbx
14590ec36: movaps    xmm2, xmm6
14590ec39: call      0x14590e600
14590ec3e: movzx     eax, byte ptr [rbp - 0x30]
14590ec42: xor       r12d, r12d
14590ec45: cmp       rax, 0x22
14590ec49: ja        0x14590ed37
14590ec4f: movsxd    rcx, dword ptr [rsi + rax*4]
14590ec53: add       rcx, rsi
14590ec56: lea       rax, [rbp - 0x2c]
14590ec5a: jmp       rcx
14590ec5c: movss     xmm11, dword ptr [rbp - 0x2c]
14590ec62: jmp       0x14590ec6d
14590ec64: lea       rax, [rbp - 0x28]
14590ec68: movss     xmm11, dword ptr [rax]
14590ec6d: mulss     xmm11, xmm8
14590ec72: mov       r12d, 1
14590ec78: cmp       r12d, 1
14590ec7c: je        0x14590ed8b
14590ec82: add       rbx, 0x40
14590ec86: add       r15, -0x40
14590ec8a: jne       0x14590ebc0
14590ec90: jmp       0x14590ed88
14590ec95: cmp       dword ptr [rbp - 0x28], -1
14590ec99: jne       0x14590ec5c
14590ec9b: movss     xmm11, dword ptr [rbp - 0x24]
14590eca1: jmp       0x14590ec6d
14590eca3: movzx     eax, byte ptr [rbp - 0x2f]
14590eca7: mov       ecx, eax
14590eca9: cmp       al, 3
14590ecab: mov       edx, 3
14590ecb0: cmovae    eax, edx
14590ecb3: dec       al
14590ecb5: test      cl, cl
14590ecb7: movzx     eax, al
14590ecba: mov       ecx, 0
14590ecbf: cmove     eax, ecx
14590ecc2: movzx     eax, al
14590ecc5: lea       rcx, [rip + 0x18fcfc0]
14590eccc: movss     xmm11, dword ptr [rcx + rax*4]
14590ecd2: jmp       0x14590ec6d
14590ecd4: movzx     eax, byte ptr [rbp - 0x2f]
14590ecd8: cmp       al, 1
14590ecda: adc       al, 0xff
14590ecdc: movzx     eax, al
14590ecdf: xorps     xmm11, xmm11
14590ece3: cvtsi2ss  xmm11, eax
14590ece8: mulss     xmm11, xmm9
14590eced: addss     xmm11, xmm10
14590ecf2: jmp       0x14590ec6d
14590ecf7: movss     xmm11, dword ptr [rbp - 0x2c]
14590ecfd: movzx     eax, byte ptr [rbp - 0x2f]
14590ed01: mov       r12d, 1
14590ed07: cmp       eax, 0x1a
14590ed0a: jbe       0x14590ec1a
14590ed10: jmp       0x14590ebf3
14590ed15: mov       eax, dword ptr [rbp - 0x2c]
14590ed18: xorps     xmm11, xmm11
14590ed1c: cvtsi2ss  xmm11, rax
14590ed21: jmp       0x14590ec72
14590ed26: mov       r12d, 1
14590ed2c: movss     xmm11, dword ptr [rbp - 0x2c]
14590ed32: jmp       0x14590ec78
14590ed37: jmp       0x14590ec78
14590ed3c: mov       al, 1
14590ed3e: mov       r15, qword ptr [rdi + 0x58]
14590ed42: test      r15, r15
14590ed45: jne       0x14590eb67
14590ed4b: mov       r14, qword ptr [rdi + 0x60]
14590ed4f: mov       r15, qword ptr [rdi + 0x68]
14590ed53: mov       rcx, r14
14590ed56: mov       rdx, r15
14590ed59: call      0x1458ec500
14590ed5e: mov       rbx, rax
14590ed61: mov       rdi, rdx
14590ed64: test      rax, rax
14590ed67: cmove     rbx, r14
14590ed6b: cmove     rdi, r15
14590ed6f: test      rdi, rdi
14590ed72: jns       0x14590ef36
14590ed78: xor       r15d, r15d
14590ed7b: mov       rcx, r15
14590ed7e: mov       rdx, rdi
14590ed81: call      0x145d992bb
14590ed86: ud2
14590ed88: xor       r12d, r12d
14590ed8b: mov       r14, qword ptr [rdi + 0x60]
14590ed8f: mov       r15, qword ptr [rdi + 0x68]
14590ed93: mov       rcx, r14
14590ed96: mov       rdx, r15
14590ed99: call      0x1458ec500
14590ed9e: mov       rbx, rax
14590eda1: test      rax, rax
14590eda4: cmove     rbx, r14
14590eda8: mov       rdi, rdx
14590edab: cmove     rdi, r15
14590edaf: cmp       r12d, 1
14590edb3: jne       0x14590ef29
14590edb9: movss     dword ptr [rbp + 0x24], xmm11
14590edbf: lea       rax, [rbp + 0x24]
14590edc3: mov       qword ptr [rbp - 0x40], rax
14590edc7: lea       rax, [rip + 0x2cee12]
14590edce: mov       qword ptr [rbp - 0x38], rax
14590edd2: lea       rdx, [rip + 0x1917007]
14590edd9: lea       rcx, [rbp - 0x30]
14590eddd: lea       r8, [rbp - 0x40]
14590ede1: call      0x145bcce30
14590ede6: mov       r14, qword ptr [rbp - 0x28]
14590edea: mov       rcx, qword ptr [rbp - 0x20]
14590edee: mov       rsi, qword ptr [rbp + 0x18]
14590edf2: jmp       0x14590ee0f
14590edf4: nop       word ptr cs:[rax + rax]
14590ee00: dec       rcx
14590ee03: sub       rcx, r14
14590ee06: cmp       edx, 0x30
14590ee09: jne       0x14590ee9b
14590ee0f: mov       rax, rcx
14590ee12: test      rcx, rcx
14590ee15: je        0x14590ee9b
14590ee1b: lea       rcx, [r14 + rax]
14590ee1f: movsx     edx, byte ptr [rcx - 1]
14590ee23: test      edx, edx
14590ee25: jns       0x14590ee00
14590ee27: movzx     r8d, byte ptr [rcx - 2]
14590ee2c: cmp       r8b, 0xc0
14590ee30: jge       0x14590ee57
14590ee32: movzx     r9d, byte ptr [rcx - 3]
14590ee37: cmp       r9b, 0xc0
14590ee3b: jge       0x14590ee61
14590ee3d: movzx     r10d, byte ptr [rcx - 4]
14590ee42: add       rcx, -4
14590ee46: and       r10d, 7
14590ee4a: shl       r10d, 6
14590ee4e: and       r9d, 0x3f
14590ee52: or        r9d, r10d
14590ee55: jmp       0x14590ee69
14590ee57: add       rcx, -2
14590ee5b: and       r8d, 0x1f
14590ee5f: jmp       0x14590ee74
14590ee61: add       rcx, -3
14590ee65: and       r9d, 0xf
14590ee69: shl       r9d, 6
14590ee6d: and       r8d, 0x3f
14590ee71: or        r8d, r9d
14590ee74: shl       r8d, 6
14590ee78: and       dl, 0x3f
14590ee7b: movzx     edx, dl
14590ee7e: or        edx, r8d
14590ee81: sub       rcx, r14
14590ee84: cmp       edx, 0x30
14590ee87: je        0x14590ee0f
14590ee89: jmp       0x14590ee9b
14590ee8b: nop       dword ptr [rax + rax]
14590ee90: dec       rax
14590ee93: sub       rax, r14
14590ee96: cmp       ecx, 0x2e
14590ee99: jne       0x14590ef0f
14590ee9b: mov       r15, rax
14590ee9e: test      rax, rax
14590eea1: je        0x14590ef70
14590eea7: lea       rax, [r14 + r15]
14590eeab: movsx     ecx, byte ptr [rax - 1]
14590eeaf: test      ecx, ecx
14590eeb1: jns       0x14590ee90
14590eeb3: movzx     edx, byte ptr [rax - 2]
14590eeb7: cmp       dl, 0xc0
14590eeba: jge       0x14590eee1
14590eebc: movzx     r8d, byte ptr [rax - 3]
14590eec1: cmp       r8b, 0xc0
14590eec5: jge       0x14590eeea
14590eec7: movzx     r9d, byte ptr [rax - 4]
14590eecc: add       rax, -4
14590eed0: and       r9d, 7
14590eed4: shl       r9d, 6
14590eed8: and       r8d, 0x3f
14590eedc: or        r8d, r9d
14590eedf: jmp       0x14590eef2
14590eee1: add       rax, -2
14590eee5: and       edx, 0x1f
14590eee8: jmp       0x14590eefc
14590eeea: add       rax, -3
14590eeee: and       r8d, 0xf
14590eef2: shl       r8d, 6
14590eef6: and       edx, 0x3f
14590eef9: or        edx, r8d
14590eefc: shl       edx, 6
14590eeff: and       cl, 0x3f
14590ef02: movzx     ecx, cl
14590ef05: or        ecx, edx
14590ef07: sub       rax, r14
14590ef0a: cmp       ecx, 0x2e
14590ef0d: je        0x14590ee9b
14590ef0f: test      r15, r15
14590ef12: mov       qword ptr [rbp + 0x10], r14
14590ef16: jns       0x14590f060
14590ef1c: xor       ecx, ecx
14590ef1e: mov       rdx, r15
14590ef21: call      0x145d992bb
14590ef26: nop
14590ef27: ud2
14590ef29: mov       rsi, qword ptr [rbp + 0x18]
14590ef2d: test      rdi, rdi
14590ef30: js        0x14590ed78
14590ef36: je        0x14590efd9
14590ef3c: call      0x140002200
14590ef41: mov       r15d, 1
14590ef47: mov       edx, 1
14590ef4c: mov       rcx, rdi
14590ef4f: call      0x1400021c0
14590ef54: test      rax, rax
14590ef57: je        0x14590ed7b
14590ef5d: mov       r14, rax
14590ef60: mov       rcx, rax
14590ef63: mov       rdx, rbx
14590ef66: mov       r8, rdi
14590ef69: call      0x145bfa0e7
14590ef6e: jmp       0x14590efdf
14590ef70: mov       r12d, 1
14590ef76: mov       rdx, qword ptr [rbp - 0x30]
14590ef7a: test      rdx, rdx
14590ef7d: je        0x14590ef8e
14590ef7f: mov       r8d, 1
14590ef85: mov       rcx, r14
14590ef88: call      0x1400021d0
14590ef8d: nop
14590ef8e: mov       qword ptr [rsp + 0x30], r15
14590ef93: mov       qword ptr [rbp + 0x10], r12
14590ef97: mov       qword ptr [rsp + 0x28], r12
14590ef9c: mov       qword ptr [rsp + 0x20], 3
14590efa5: lea       r9, [rip + 0x18fcd04]
14590efac: mov       rcx, rsi
14590efaf: mov       rdx, rbx
14590efb2: mov       r8, rdi
14590efb5: mov       qword ptr [rbp + 0x18], r15
14590efb9: call      0x14590cb30
14590efbe: nop
14590efbf: mov       rdx, qword ptr [rbp + 0x18]
14590efc3: test      rdx, rdx
14590efc6: je        0x14590efea
14590efc8: mov       r8d, 1
14590efce: mov       rcx, qword ptr [rbp + 0x10]
14590efd2: call      0x1400021d0
14590efd7: jmp       0x14590efea
14590efd9: mov       r14d, 1
14590efdf: mov       qword ptr [rsi], rdi
14590efe2: mov       qword ptr [rsi + 8], r14
14590efe6: mov       qword ptr [rsi + 0x10], rdi
14590efea: mov       rax, rsi
14590efed: movaps    xmm6, xmmword ptr [rbp + 0x30]
14590eff1: movaps    xmm7, xmmword ptr [rbp + 0x40]
14590eff5: movaps    xmm8, xmmword ptr [rbp + 0x50]
14590effa: movaps    xmm9, xmmword ptr [rbp + 0x60]
14590efff: movaps    xmm10, xmmword ptr [rbp + 0x70]
14590f004: movaps    xmm11, xmmword ptr [rbp + 0x80]
14590f00c: add       rsp, 0x118
14590f013: pop       rbx
14590f014: pop       rdi
14590f015: pop       rsi
14590f016: pop       r12
14590f018: pop       r13
14590f01a: pop       r14
14590f01c: pop       r15
14590f01e: pop       rbp
14590f01f: ret
14590f020: mov       byte ptr [rbp + 0x24], 1
14590f024: mov       byte ptr [rbp - 0x40], 0
14590f028: lea       rax, [rbp + 0x24]
14590f02c: mov       qword ptr [rbp - 0x30], rax
14590f030: lea       rax, [rip - 0x5523577]
14590f037: mov       qword ptr [rbp - 0x28], rax
14590f03b: lea       rcx, [rbp - 0x40]
14590f03f: mov       qword ptr [rbp - 0x20], rcx
14590f043: mov       qword ptr [rbp - 0x18], rax
14590f047: lea       rcx, [rip + 0x191a248]
14590f04e: lea       r8, [rip + 0x18fcc43]
14590f055: lea       rdx, [rbp - 0x30]
14590f059: call      0x145d99830
14590f05e: ud2
14590f060: call      0x140002200
14590f065: mov       edx, 1
14590f06a: mov       rcx, r15
14590f06d: call      0x1400021c0
14590f072: mov       ecx, 1
14590f077: test      rax, rax
14590f07a: je        0x14590ef1e
14590f080: mov       r12, rax
14590f083: mov       rcx, rax
14590f086: mov       r14, qword ptr [rbp + 0x10]
14590f08a: mov       rdx, r14
14590f08d: mov       r8, r15
14590f090: call      0x145bfa0e7
14590f095: mov       rsi, qword ptr [rbp + 0x18]
14590f099: mov       rdx, qword ptr [rbp - 0x30]
14590f09d: test      rdx, rdx
14590f0a0: jne       0x14590ef7f
14590f0a6: jmp       0x14590ef8e
