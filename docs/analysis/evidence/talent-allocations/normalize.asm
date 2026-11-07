14599fe20: push      rbp
14599fe21: push      r15
14599fe23: push      r14
14599fe25: push      r13
14599fe27: push      r12
14599fe29: push      rsi
14599fe2a: push      rdi
14599fe2b: push      rbx
14599fe2c: sub       rsp, 0x138
14599fe33: lea       rbp, [rsp + 0x80]
14599fe3b: mov       qword ptr [rbp + 0xb0], 0xfffffffffffffffe
14599fe46: mov       dword ptr [rbp + 0x7c], r9d
14599fe4a: mov       rsi, rcx
14599fe4d: mov       byte ptr [rbp + 0xae], r8b
14599fe54: cmp       r8b, 0xb
14599fe58: ja        0x1459a059a
14599fe5e: movzx     eax, r8b
14599fe62: mov       ecx, 0xbbe
14599fe67: bt        ecx, eax
14599fe6a: jae       0x1459a059a
14599fe70: mov       rcx, qword ptr [rdx + 8]
14599fe74: mov       qword ptr [rbp + 0x38], rdx
14599fe78: mov       rax, qword ptr [rdx + 0x10]
14599fe7c: shl       rax, 4
14599fe80: add       rax, rcx
14599fe83: mov       qword ptr [rbp + 0x40], rcx
14599fe87: mov       qword ptr [rbp - 0x10], rcx
14599fe8b: mov       qword ptr [rbp - 8], rax
14599fe8f: lea       rax, [rbp + 0xae]
14599fe96: mov       qword ptr [rbp], rax
14599fe9a: lea       rcx, [rbp - 0x58]
14599fe9e: lea       rdx, [rbp - 0x10]
14599fea2: call      0x1459cf2a0
14599fea7: nop
14599fea8: mov       rax, qword ptr [rbp - 0x50]
14599feac: mov       qword ptr [rbp + 0x88], rax
14599feb3: mov       rbx, qword ptr [rbp - 0x48]
14599feb7: lea       rax, [rbp + 0x97]
14599febe: mov       qword ptr [rbp - 0x10], rax
14599fec2: cmp       rbx, 2
14599fec6: jae       0x1459a05cc
14599fecc: mov       qword ptr [rbp - 0x18], rsi
14599fed0: mov       qword ptr [rbp + 0x60], 0
14599fed8: mov       qword ptr [rbp + 0x68], 8
14599fee0: mov       qword ptr [rbp + 0x70], 0
14599fee8: mov       rax, qword ptr [rbp - 0x58]
14599feec: mov       qword ptr [rbp + 0x50], rax
14599fef0: test      rbx, rbx
14599fef3: je        0x1459a052e
14599fef9: lea       rax, [rbx + rbx*2]
14599fefd: mov       rcx, qword ptr [rbp + 0x88]
14599ff04: lea       rax, [rcx + rax*8]
14599ff08: mov       qword ptr [rbp - 0x20], rax
14599ff0c: mov       r12d, 0x5df
14599ff12: jmp       0x14599ff32
14599ff14: nop       word ptr cs:[rax + rax]
14599ff20: mov       rcx, qword ptr [rbp - 0x28]
14599ff24: add       rcx, 0x18
14599ff28: cmp       rcx, qword ptr [rbp - 0x20]
14599ff2c: je        0x1459a052e
14599ff32: mov       rax, qword ptr [rcx]
14599ff35: mov       qword ptr [rbp - 0x38], rax
14599ff39: test      rax, rax
14599ff3c: je        0x1459a052e
14599ff42: mov       qword ptr [rbp - 0x28], rcx
14599ff46: movzx     eax, byte ptr [rcx + 0x10]
14599ff4a: mov       byte ptr [rbp + 0xac], al
14599ff50: test      al, al
14599ff52: je        0x14599ff20
14599ff54: xor       eax, eax
14599ff56: jmp       0x14599ff7d
14599ff58: mov       qword ptr [r15 + r14], rsi
14599ff5c: mov       byte ptr [r15 + r14 + 8], 1
14599ff62: inc       rbx
14599ff65: mov       qword ptr [rbp + 0x70], rbx
14599ff69: nop       dword ptr [rax]
14599ff70: mov       eax, dword ptr [rbp + 0x4c]
14599ff73: inc       al
14599ff75: cmp       al, byte ptr [rbp + 0xac]
14599ff7b: je        0x14599ff20
14599ff7d: mov       dword ptr [rbp + 0x4c], eax
14599ff80: movzx     eax, byte ptr [rbp + 0xae]
14599ff87: mov       qword ptr [rbp + 0x20], rax
14599ff8b: dec       eax
14599ff8d: mov       dword ptr [rbp + 0x98], eax
14599ff93: cmp       al, 0xa
14599ff95: ja        0x14599ff70
14599ff97: movzx     ecx, byte ptr [rbp + 0x98]
14599ff9e: bt        r12d, ecx
14599ffa2: jae       0x14599ff70
14599ffa4: mov       rax, qword ptr [rbp - 0x38]
14599ffa8: mov       rbx, qword ptr [rax + 0x30]
14599ffac: mov       r13, qword ptr [rax + 0x38]
14599ffb0: lea       rax, [rip + 0x189f1a1]
14599ffb7: mov       qword ptr [rbp + 0xa0], rcx
14599ffbe: mov       rsi, qword ptr [rax + rcx*8]
14599ffc2: mov       rax, qword ptr [rsi + 0x38]
14599ffc6: test      rax, rax
14599ffc9: je        0x1459a0017
14599ffcb: mov       r15, qword ptr [rsi + 0x30]
14599ffcf: shl       rax, 5
14599ffd3: lea       rdi, [rax + rax*4]
14599ffd7: jmp       0x14599fff0
14599ffd9: nop       dword ptr [rax]
14599ffe0: add       r15, 0xa0
14599ffe7: add       rdi, -0xa0
14599ffee: je        0x1459a0017
14599fff0: cmp       qword ptr [r15 + 0x38], r13
14599fff4: jne       0x14599ffe0
14599fff6: mov       rcx, qword ptr [r15 + 0x30]
14599fffa: mov       rdx, rbx
14599fffd: mov       r8, r13
1459a0000: call      0x145c0a3e7
1459a0005: test      eax, eax
1459a0007: jne       0x14599ffe0
1459a0009: xor       esi, esi
1459a000b: mov       rdi, qword ptr [rbp + 0xa0]
1459a0012: jmp       0x1459a00c2
1459a0017: mov       rax, qword ptr [rsi + 0x78]
1459a001b: test      rax, rax
1459a001e: je        0x1459a0067
1459a0020: mov       r15, qword ptr [rsi + 0x70]
1459a0024: shl       rax, 5
1459a0028: lea       rdi, [rax + rax*4]
1459a002c: jmp       0x1459a0040
1459a002e: nop
1459a0030: add       r15, 0xa0
1459a0037: add       rdi, -0xa0
1459a003e: je        0x1459a0067
1459a0040: cmp       qword ptr [r15 + 0x38], r13
1459a0044: jne       0x1459a0030
1459a0046: mov       rcx, qword ptr [r15 + 0x30]
1459a004a: mov       rdx, rbx
1459a004d: mov       r8, r13
1459a0050: call      0x145c0a3e7
1459a0055: test      eax, eax
1459a0057: jne       0x1459a0030
1459a0059: mov       esi, 1
1459a005e: mov       rdi, qword ptr [rbp + 0xa0]
1459a0065: jmp       0x1459a00c2
1459a0067: mov       rax, qword ptr [rsi + 0xb8]
1459a006e: test      rax, rax
1459a0071: mov       rdi, qword ptr [rbp + 0xa0]
1459a0078: je        0x14599ff70
1459a007e: mov       r15, qword ptr [rsi + 0xb0]
1459a0085: shl       rax, 5
1459a0089: lea       rsi, [rax + rax*4]
1459a008d: jmp       0x1459a00a4
1459a008f: nop
1459a0090: add       r15, 0xa0
1459a0097: add       rsi, -0xa0
1459a009e: je        0x14599ff70
1459a00a4: cmp       qword ptr [r15 + 0x38], r13
1459a00a8: jne       0x1459a0090
1459a00aa: mov       rcx, qword ptr [r15 + 0x30]
1459a00ae: mov       rdx, rbx
1459a00b1: mov       r8, r13
1459a00b4: call      0x145c0a3e7
1459a00b9: test      eax, eax
1459a00bb: jne       0x1459a0090
1459a00bd: mov       esi, 2
1459a00c2: mov       rax, qword ptr [rbp + 0x68]
1459a00c6: mov       qword ptr [rbp + 0x80], rax
1459a00cd: mov       r8, qword ptr [rbp + 0x70]
1459a00d1: test      r8, r8
1459a00d4: mov       qword ptr [rbp + 0x58], r8
1459a00d8: je        0x1459a00ec
1459a00da: mov       eax, r8d
1459a00dd: and       eax, 3
1459a00e0: cmp       r8, 4
1459a00e4: jae       0x1459a010a
1459a00e6: xor       edx, edx
1459a00e8: xor       ecx, ecx
1459a00ea: jmp       0x1459a0151
1459a00ec: cmp       dword ptr [rbp + 0x7c], 0
1459a00f0: je        0x14599ff70
1459a00f6: xor       eax, eax
1459a00f8: cmp       al, byte ptr [r15 + 0x9a]
1459a00ff: jae       0x14599ff70
1459a0105: jmp       0x1459a01f4
1459a010a: and       r8, 0xfffffffffffffffc
1459a010e: mov       rcx, qword ptr [rbp + 0x80]
1459a0115: lea       r9, [rcx + 0x38]
1459a0119: xor       edx, edx
1459a011b: xor       ecx, ecx
1459a011d: nop       dword ptr [rax]
1459a0120: movzx     r10d, byte ptr [r9 - 0x30]
1459a0125: add       r10d, ecx
1459a0128: movzx     ecx, byte ptr [r9 - 0x20]
1459a012d: movzx     r11d, byte ptr [r9 - 0x10]
1459a0132: add       r11d, ecx
1459a0135: add       r11d, r10d
1459a0138: movzx     ecx, byte ptr [r9]
1459a013c: add       ecx, r11d
1459a013f: add       rdx, 4
1459a0143: add       r9, 0x40
1459a0147: cmp       r8, rdx
1459a014a: jne       0x1459a0120
1459a014c: test      rax, rax
1459a014f: je        0x1459a0181
1459a0151: shl       rdx, 4
1459a0155: mov       r8, qword ptr [rbp + 0x80]
1459a015c: add       rdx, r8
1459a015f: add       rdx, 8
1459a0163: shl       eax, 4
1459a0166: xor       r8d, r8d
1459a0169: nop       dword ptr [rax]
1459a0170: movzx     r9d, byte ptr [rdx + r8]
1459a0175: add       ecx, r9d
1459a0178: add       r8, 0x10
1459a017c: cmp       rax, r8
1459a017f: jne       0x1459a0170
1459a0181: cmp       ecx, dword ptr [rbp + 0x7c]
1459a0184: jae       0x14599ff70
1459a018a: mov       r14, rsi
1459a018d: mov       rsi, qword ptr [rbp + 0x58]
1459a0191: shl       rsi, 4
1459a0195: xor       edi, edi
1459a0197: jmp       0x1459a01a9
1459a0199: nop       dword ptr [rax]
1459a01a0: add       rdi, 0x10
1459a01a4: cmp       rsi, rdi
1459a01a7: je        0x1459a01db
1459a01a9: mov       rax, qword ptr [rbp + 0x80]
1459a01b0: mov       rax, qword ptr [rax + rdi]
1459a01b4: cmp       qword ptr [rax + 0x38], r13
1459a01b8: jne       0x1459a01a0
1459a01ba: mov       rcx, qword ptr [rax + 0x30]
1459a01be: mov       rdx, rbx
1459a01c1: mov       r8, r13
1459a01c4: call      0x145c0a3e7
1459a01c9: test      eax, eax
1459a01cb: jne       0x1459a01a0
1459a01cd: mov       rax, qword ptr [rbp + 0x80]
1459a01d4: movzx     eax, byte ptr [rax + rdi + 8]
1459a01d9: jmp       0x1459a01dd
1459a01db: xor       eax, eax
1459a01dd: mov       rdi, qword ptr [rbp + 0xa0]
1459a01e4: mov       rsi, r14
1459a01e7: cmp       al, byte ptr [r15 + 0x9a]
1459a01ee: jae       0x14599ff70
1459a01f4: mov       qword ptr [rbp + 0x30], rbx
1459a01f8: movzx     r9d, byte ptr [r15 + 0x98]
1459a0200: mov       dword ptr [rbp + 0x9c], 0
1459a020a: mov       ecx, dword ptr [rbp + 0x98]
1459a0210: cmp       cl, 0xa
1459a0213: ja        0x1459a0233
1459a0215: mov       r8, qword ptr [rbp + 0x58]
1459a0219: test      r8, r8
1459a021c: sete      al
1459a021f: mov       edx, 0x5df
1459a0224: shr       edx, cl
1459a0226: not       dl
1459a0228: or        dl, al
1459a022a: test      dl, 1
1459a022d: je        0x1459a0332
1459a0233: movzx     eax, r9b
1459a0237: lea       eax, [rax + rax*4]
1459a023a: cmp       dword ptr [rbp + 0x9c], eax
1459a0240: mov       r14, qword ptr [rbp + 0x30]
1459a0244: jb        0x14599ff70
1459a024a: lea       rcx, [rbp + 0x60]
1459a024e: mov       rdx, qword ptr [rbp + 0x20]
1459a0252: mov       r8, r14
1459a0255: mov       r9, r13
1459a0258: call      0x14599f210
1459a025d: test      rax, rax
1459a0260: jne       0x14599ff70
1459a0266: mov       rax, qword ptr [rbp + 0x20]
1459a026a: mov       byte ptr [rbp + 0xab], al
1459a0270: mov       rax, qword ptr [r15]
1459a0273: test      rax, rax
1459a0276: je        0x1459a02ba
1459a0278: mov       rcx, qword ptr [r15 + 8]
1459a027c: movups    xmm0, xmmword ptr [r15 + 0x10]
1459a0281: mov       qword ptr [rbp - 0x10], 1
1459a0289: mov       qword ptr [rbp - 8], rax
1459a028d: mov       qword ptr [rbp], rcx
1459a0291: mov       qword ptr [rbp + 8], 1
1459a0299: movups    xmmword ptr [rbp + 0x10], xmm0
1459a029d: lea       rcx, [rbp - 0x10]
1459a02a1: lea       rdx, [rbp + 0xab]
1459a02a8: lea       r8, [rbp + 0x60]
1459a02ac: call      0x1459924d0
1459a02b1: nop
1459a02b2: test      al, al
1459a02b4: je        0x14599ff70
1459a02ba: cmp       byte ptr [rbp + 0x98], 0xa
1459a02c1: ja        0x14599ff70
1459a02c7: bt        r12d, edi
1459a02cb: jae       0x14599ff70
1459a02d1: lea       rax, [rip + 0x189ee80]
1459a02d8: mov       rbx, qword ptr [rax + rdi*8]
1459a02dc: mov       rax, qword ptr [rbx + 0x38]
1459a02e0: test      rax, rax
1459a02e3: je        0x1459a041f
1459a02e9: mov       rsi, qword ptr [rbx + 0x30]
1459a02ed: shl       rax, 5
1459a02f1: lea       rdi, [rax + rax*4]
1459a02f5: jmp       0x1459a0314
1459a02f7: nop       word ptr [rax + rax]
1459a0300: add       rsi, 0xa0
1459a0307: add       rdi, -0xa0
1459a030e: je        0x1459a041f
1459a0314: cmp       qword ptr [rsi + 0x38], r13
1459a0318: jne       0x1459a0300
1459a031a: mov       rcx, qword ptr [rsi + 0x30]
1459a031e: mov       rdx, r14
1459a0321: mov       r8, r13
1459a0324: call      0x145c0a3e7
1459a0329: test      eax, eax
1459a032b: jne       0x1459a0300
1459a032d: jmp       0x1459a04bd
1459a0332: shl       esi, 6
1459a0335: lea       rax, [rip + 0x189ee1c]
1459a033c: add       rsi, qword ptr [rax + rdi*8]
1459a0340: xor       r14d, r14d
1459a0343: mov       dword ptr [rbp + 0x9c], 0
1459a034d: mov       qword ptr [rbp + 0x28], rsi
1459a0351: mov       byte ptr [rbp + 0xaf], r9b
1459a0358: jmp       0x1459a0389
1459a035a: nop       word ptr [rax + rax]
1459a0360: mov       r12d, 0x5df
1459a0366: mov       rdi, qword ptr [rbp + 0xa0]
1459a036d: mov       rsi, qword ptr [rbp + 0x28]
1459a0371: mov       r8, qword ptr [rbp + 0x58]
1459a0375: movzx     r9d, byte ptr [rbp + 0xaf]
1459a037d: inc       r14
1459a0380: cmp       r14, r8
1459a0383: je        0x1459a0233
1459a0389: mov       rdx, r14
1459a038c: shl       rdx, 4
1459a0390: mov       rax, qword ptr [rbp + 0x80]
1459a0397: mov       rax, qword ptr [rax + rdx]
1459a039b: cmp       byte ptr [rax + 0x98], r9b
1459a03a2: jae       0x1459a037d
1459a03a4: mov       rcx, qword ptr [rsi + 0x38]
1459a03a8: test      rcx, rcx
1459a03ab: je        0x1459a037d
1459a03ad: add       rdx, qword ptr [rbp + 0x80]
1459a03b4: mov       qword ptr [rbp - 0x30], rdx
1459a03b8: mov       rdi, qword ptr [rsi + 0x30]
1459a03bc: shl       rcx, 5
1459a03c0: lea       r12, [rcx + rcx*4]
1459a03c4: mov       rcx, qword ptr [rax + 0x30]
1459a03c8: mov       qword ptr [rbp - 0x40], rcx
1459a03cc: mov       rsi, qword ptr [rax + 0x38]
1459a03d0: xor       ebx, ebx
1459a03d2: jmp       0x1459a03f0
1459a03d4: nop       word ptr cs:[rax + rax]
1459a03e0: add       rbx, 0xa0
1459a03e7: cmp       r12, rbx
1459a03ea: je        0x1459a0360
1459a03f0: cmp       qword ptr [rdi + rbx + 0x38], rsi
1459a03f5: jne       0x1459a03e0
1459a03f7: mov       rcx, qword ptr [rdi + rbx + 0x30]
1459a03fc: mov       rdx, qword ptr [rbp - 0x40]
1459a0400: mov       r8, rsi
1459a0403: call      0x145c0a3e7
1459a0408: test      eax, eax
1459a040a: jne       0x1459a03e0
1459a040c: mov       rax, qword ptr [rbp - 0x30]
1459a0410: movzx     eax, byte ptr [rax + 8]
1459a0414: add       dword ptr [rbp + 0x9c], eax
1459a041a: jmp       0x1459a0360
1459a041f: mov       rax, qword ptr [rbx + 0x78]
1459a0423: test      rax, rax
1459a0426: je        0x1459a046b
1459a0428: mov       rsi, qword ptr [rbx + 0x70]
1459a042c: shl       rax, 5
1459a0430: lea       rdi, [rax + rax*4]
1459a0434: jmp       0x1459a0450
1459a0436: nop       word ptr cs:[rax + rax]
1459a0440: add       rsi, 0xa0
1459a0447: add       rdi, -0xa0
1459a044e: je        0x1459a046b
1459a0450: cmp       qword ptr [rsi + 0x38], r13
1459a0454: jne       0x1459a0440
1459a0456: mov       rcx, qword ptr [rsi + 0x30]
1459a045a: mov       rdx, r14
1459a045d: mov       r8, r13
1459a0460: call      0x145c0a3e7
1459a0465: test      eax, eax
1459a0467: jne       0x1459a0440
1459a0469: jmp       0x1459a04bd
1459a046b: mov       rax, qword ptr [rbx + 0xb8]
1459a0472: test      rax, rax
1459a0475: je        0x14599ff70
1459a047b: mov       rsi, qword ptr [rbx + 0xb0]
1459a0482: shl       rax, 5
1459a0486: lea       rdi, [rax + rax*4]
1459a048a: jmp       0x1459a04a4
1459a048c: nop       dword ptr [rax]
1459a0490: add       rsi, 0xa0
1459a0497: add       rdi, -0xa0
1459a049e: je        0x14599ff70
1459a04a4: cmp       qword ptr [rsi + 0x38], r13
1459a04a8: jne       0x1459a0490
1459a04aa: mov       rcx, qword ptr [rsi + 0x30]
1459a04ae: mov       rdx, r14
1459a04b1: mov       r8, r13
1459a04b4: call      0x145c0a3e7
1459a04b9: test      eax, eax
1459a04bb: jne       0x1459a0490
1459a04bd: mov       r15, qword ptr [rbp + 0x68]
1459a04c1: mov       rbx, qword ptr [rbp + 0x70]
1459a04c5: mov       r14, rbx
1459a04c8: shl       r14, 4
1459a04cc: test      rbx, rbx
1459a04cf: je        0x1459a0511
1459a04d1: xor       edi, edi
1459a04d3: jmp       0x1459a04e9
1459a04d5: nop       word ptr cs:[rax + rax]
1459a04e0: add       rdi, 0x10
1459a04e4: cmp       r14, rdi
1459a04e7: je        0x1459a0511
1459a04e9: mov       rax, qword ptr [r15 + rdi]
1459a04ed: cmp       qword ptr [rax + 0x38], r13
1459a04f1: jne       0x1459a04e0
1459a04f3: mov       rcx, qword ptr [rax + 0x30]
1459a04f7: mov       rdx, qword ptr [rbp + 0x30]
1459a04fb: mov       r8, r13
1459a04fe: call      0x145c0a3e7
1459a0503: test      eax, eax
1459a0505: jne       0x1459a04e0
1459a0507: inc       byte ptr [r15 + rdi + 8]
1459a050c: jmp       0x14599ff70
1459a0511: cmp       rbx, qword ptr [rbp + 0x60]
1459a0515: jne       0x14599ff58
1459a051b: lea       rcx, [rbp + 0x60]
1459a051f: call      0x145c0dcb0
1459a0524: nop
1459a0525: mov       r15, qword ptr [rbp + 0x68]
1459a0529: jmp       0x14599ff58
1459a052e: mov       rax, qword ptr [rbp + 0x50]
1459a0532: test      rax, rax
1459a0535: je        0x1459a0551
1459a0537: shl       rax, 3
1459a053b: lea       rdx, [rax + rax*2]
1459a053f: mov       r8d, 8
1459a0545: mov       rcx, qword ptr [rbp + 0x88]
1459a054c: call      0x1400021d0
1459a0551: mov       rax, qword ptr [rbp + 0x70]
1459a0555: mov       rsi, qword ptr [rbp - 0x18]
1459a0559: mov       qword ptr [rsi + 0x10], rax
1459a055d: movups    xmm0, xmmword ptr [rbp + 0x60]
1459a0561: movups    xmmword ptr [rsi], xmm0
1459a0564: mov       rax, qword ptr [rbp + 0x38]
1459a0568: mov       rdx, qword ptr [rax]
1459a056b: test      rdx, rdx
1459a056e: je        0x1459a0583
1459a0570: shl       rdx, 4
1459a0574: mov       r8d, 8
1459a057a: mov       rcx, qword ptr [rbp + 0x40]
1459a057e: call      0x1400021d0
1459a0583: mov       rax, rsi
1459a0586: add       rsp, 0x138
1459a058d: pop       rbx
1459a058e: pop       rdi
1459a058f: pop       rsi
1459a0590: pop       r12
1459a0592: pop       r13
1459a0594: pop       r14
1459a0596: pop       r15
1459a0598: pop       rbp
1459a0599: ret
1459a059a: mov       qword ptr [rsi], 0
1459a05a1: mov       qword ptr [rsi + 8], 8
1459a05a9: mov       qword ptr [rsi + 0x10], 0
1459a05b1: mov       rax, rdx
1459a05b4: mov       rdx, qword ptr [rdx]
1459a05b7: test      rdx, rdx
1459a05ba: je        0x1459a0583
1459a05bc: mov       rcx, qword ptr [rax + 8]
1459a05c0: shl       rdx, 4
1459a05c4: mov       r8d, 8
1459a05ca: jmp       0x1459a057e
1459a05cc: cmp       rbx, 0x15
1459a05d0: jae       0x1459a05f0
1459a05d2: lea       r9, [rbp - 0x10]
1459a05d6: mov       r8d, 1
1459a05dc: mov       rcx, qword ptr [rbp + 0x88]
1459a05e3: mov       rdx, rbx
1459a05e6: call      0x1459be380
1459a05eb: jmp       0x14599fecc
1459a05f0: mov       byte ptr [rbp + 0xad], 1
1459a05f7: lea       r8, [rbp - 0x10]
1459a05fb: mov       rcx, qword ptr [rbp + 0x88]
1459a0602: mov       rdx, rbx
1459a0605: call      0x1459a7b60
1459a060a: nop
1459a060b: jmp       0x14599fecc
