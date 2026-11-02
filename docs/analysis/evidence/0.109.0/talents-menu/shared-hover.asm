140076b00: push      r15
140076b02: push      r14
140076b04: push      r13
140076b06: push      r12
140076b08: push      rsi
140076b09: push      rdi
140076b0a: push      rbp
140076b0b: push      rbx
140076b0c: sub       rsp, 0x1c8
140076b13: movaps    xmmword ptr [rsp + 0x1b0], xmm6
140076b1b: mov       r8, qword ptr [rdx]
140076b1e: mov       rdi, qword ptr [rdx + 8]
140076b22: mov       r9d, dword ptr [rdx + 0x10]
140076b26: mov       eax, dword ptr [rdx + 0x14]
140076b29: mov       dword ptr [rsp + 0x20], eax
140076b2d: lea       rcx, [rsp + 0x108]
140076b35: mov       rdx, rdi
140076b38: mov       qword ptr [rsp + 0x98], r8
140076b40: call      0x140183810
140076b45: mov       rax, qword ptr [rsp + 0x108]
140076b4d: mov       ebx, dword ptr [rsp + 0x114]
140076b54: mov       r14, qword ptr [rsp + 0x118]
140076b5c: mov       r15, qword ptr [rsp + 0x120]
140076b64: mov       rsi, qword ptr [rsp + 0x138]
140076b6c: mov       rcx, qword ptr [rsp + 0x148]
140076b74: mov       qword ptr [rsp + 0x70], rcx
140076b79: mov       rcx, qword ptr [rsp + 0x158]
140076b81: mov       qword ptr [rsp + 0x68], rcx
140076b86: mov       ecx, dword ptr [rsp + 0x164]
140076b8d: mov       dword ptr [rsp + 0x48], ecx
140076b91: mov       rbp, qword ptr [rsp + 0x168]
140076b99: mov       rcx, qword ptr [rsp + 0x170]
140076ba1: mov       qword ptr [rsp + 0x40], rcx
140076ba6: mov       rcx, qword ptr [rsp + 0x178]
140076bae: mov       qword ptr [rsp + 0x60], rcx
140076bb3: mov       rcx, qword ptr [rsp + 0x188]
140076bbb: mov       qword ptr [rsp + 0x58], rcx
140076bc0: mov       ecx, dword ptr [rsp + 0x194]
140076bc7: mov       dword ptr [rsp + 0x8c], ecx
140076bce: mov       ecx, ebx
140076bd0: sub       ecx, dword ptr [rsp + 0x110]
140076bd7: cmp       ecx, 0xc233b000
140076bdd: mov       r13d, 0xc233b000
140076be3: cmovb     r13d, ecx
140076be7: movzx     ecx, byte ptr [rsp + 0x198]
140076bef: mov       qword ptr [rsp + 0x38], rcx
140076bf4: movaps    xmm6, xmmword ptr [rip + 0x5d564a5]
140076bfb: movzx     r10d, byte ptr [rsp + 0x1a8]
140076c04: mov       ecx, dword ptr [rsp + 0x1a0]
140076c0b: mov       r12d, dword ptr [rsp + 0x1a4]
140076c13: mov       dword ptr [rsp + 0x4c], ebx
140076c17: mov       byte ptr [rsp + 0x37], r10b
140076c1c: test      r10b, 1
140076c20: je        0x140076e99
140076c26: jmp       0x140076c92
140076c28: nop       dword ptr [rax + rax]
140076c30: mov       qword ptr [rsp + 0x38], 0
140076c39: mov       r8, qword ptr [r10 + 0x120]
140076c40: mov       rax, qword ptr [rax + r8*8]
140076c44: not       rax
140076c47: lea       rax, [rax + rax*2]
140076c4b: shl       rax, 4
140076c4f: mov       r8, qword ptr [rdx + rax + 0x10]
140076c54: mov       qword ptr [rsp + 0x70], r8
140076c59: mov       rax, qword ptr [rdx + rax + 0x28]
140076c5e: mov       qword ptr [rsp + 0x68], rax
140076c63: mov       rdx, qword ptr [r10 + 0x130]
140076c6a: call      0x144e4f270
140076c6f: mov       rcx, qword ptr [rbx]
140076c72: mov       ebx, dword ptr [rsp + 0x4c]
140076c76: movzx     r10d, byte ptr [rsp + 0x37]
140076c7c: mov       edx, r12d
140076c7f: inc       r12d
140076c82: mov       r8d, ebx
140076c85: sub       r8d, dword ptr [rax + rdx*4]
140076c89: cmp       r8d, r13d
140076c8c: jb        0x140077022
140076c92: cmp       r12d, ecx
140076c95: jne       0x140076c7c
140076c97: cmp       r14, r15
140076c9a: mov       r10, qword ptr [rsp + 0x98]
140076ca2: je        0x140077302
140076ca8: mov       ecx, dword ptr [r14]
140076cab: add       r14, 4
140076caf: mov       rax, qword ptr [rdi + 0x1a8]
140076cb6: lea       rdx, [rcx + rcx*8]
140076cba: cmp       qword ptr [rax + rdx*8 + 0x10], 0
140076cc0: je        0x140076cf0
140076cc2: lea       rcx, [rax + rdx*8]
140076cc6: lea       rbx, [rax + rdx*8]
140076cca: add       rbx, 0x10
140076cce: mov       rax, qword ptr [r10 + 0x110]
140076cd5: mov       r8, qword ptr [rcx + 0x40]
140076cd9: cmp       rax, r8
140076cdc: jae       0x140076d70
140076ce2: jmp       0x140076d2b
140076ce4: nop       word ptr cs:[rax + rax]
140076cf0: cmp       r14, r15
140076cf3: je        0x140077302
140076cf9: mov       ecx, dword ptr [r14]
140076cfc: add       r14, 4
140076d00: mov       rax, qword ptr [rdi + 0x1a8]
140076d07: lea       rcx, [rcx + rcx*8]
140076d0b: cmp       qword ptr [rax + rcx*8 + 0x10], 0
140076d11: je        0x140076cf0
140076d13: lea       rcx, [rax + rcx*8]
140076d17: lea       rbx, [rcx + 0x10]
140076d1b: mov       rax, qword ptr [r10 + 0x110]
140076d22: mov       r8, qword ptr [rcx + 0x40]
140076d26: cmp       rax, r8
140076d29: jae       0x140076d70
140076d2b: mov       rdx, qword ptr [rcx + 0x38]
140076d2f: mov       rax, qword ptr [rdx + rax*8]
140076d33: test      rax, rax
140076d36: je        0x140076d70
140076d38: mov       rdx, qword ptr [rcx + 0x18]
140076d3c: not       rax
140076d3f: lea       rax, [rax + rax*2]
140076d43: shl       rax, 4
140076d47: mov       rbp, qword ptr [rdx + rax + 0x10]
140076d4c: mov       rdx, qword ptr [r10 + 0x118]
140076d53: mov       rax, qword ptr [rcx + 0x38]
140076d57: cmp       rdx, r8
140076d5a: jb        0x140076d82
140076d5c: mov       rdx, qword ptr [rcx + 0x18]
140076d60: jmp       0x140076dc0
140076d62: nop       word ptr cs:[rax + rax]
140076d70: xor       ebp, ebp
140076d72: mov       rdx, qword ptr [r10 + 0x118]
140076d79: mov       rax, qword ptr [rcx + 0x38]
140076d7d: cmp       rdx, r8
140076d80: jae       0x140076d5c
140076d82: mov       r9, qword ptr [rax + rdx*8]
140076d86: mov       rdx, qword ptr [rcx + 0x18]
140076d8a: test      r9, r9
140076d8d: je        0x140076dc0
140076d8f: not       r9
140076d92: lea       r9, [r9 + r9*2]
140076d96: shl       r9, 4
140076d9a: mov       r9, qword ptr [rdx + r9 + 0x10]
140076d9f: mov       qword ptr [rsp + 0x40], r9
140076da4: mov       r9, qword ptr [r10 + 0x128]
140076dab: xor       r12d, r12d
140076dae: cmp       r9, r8
140076db1: jae       0x140076c30
140076db7: jmp       0x140076ddc
140076db9: nop       dword ptr [rax]
140076dc0: mov       qword ptr [rsp + 0x40], 0
140076dc9: mov       r9, qword ptr [r10 + 0x128]
140076dd0: xor       r12d, r12d
140076dd3: cmp       r9, r8
140076dd6: jae       0x140076c30
140076ddc: mov       r8, qword ptr [rax + r9*8]
140076de0: test      r8, r8
140076de3: je        0x140076c30
140076de9: not       r8
140076dec: lea       r8, [r8 + r8*2]
140076df0: shl       r8, 4
140076df4: mov       r9, qword ptr [rdx + r8 + 0x10]
140076df9: mov       qword ptr [rsp + 0x60], r9
140076dfe: mov       r8, qword ptr [rdx + r8 + 0x28]
140076e03: mov       qword ptr [rsp + 0x58], r8
140076e08: mov       r8b, 1
140076e0b: mov       qword ptr [rsp + 0x38], r8
140076e10: jmp       0x140076c39
140076e15: nop       word ptr cs:[rax + rax]
140076e20: mov       qword ptr [rsp + 0x38], 0
140076e29: mov       r8, qword ptr [r10 + 0x120]
140076e30: mov       rax, qword ptr [rax + r8*8]
140076e34: not       rax
140076e37: lea       rax, [rax + rax*2]
140076e3b: shl       rax, 4
140076e3f: mov       r8, qword ptr [rdx + rax + 0x10]
140076e44: mov       qword ptr [rsp + 0x70], r8
140076e49: mov       rax, qword ptr [rdx + rax + 0x28]
140076e4e: mov       qword ptr [rsp + 0x68], rax
140076e53: mov       rdx, qword ptr [r10 + 0x130]
140076e5a: call      0x144e4f270
140076e5f: mov       rdx, qword ptr [rbp + 0x50]
140076e63: mov       rcx, qword ptr [rbx]
140076e66: mov       ebx, dword ptr [rsp + 0x4c]
140076e6a: movzx     r10d, byte ptr [rsp + 0x37]
140076e70: mov       rbp, r13
140076e73: mov       r13d, esi
140076e76: mov       rsi, rdx
140076e79: mov       edx, r12d
140076e7c: shl       rdx, 4
140076e80: inc       r12d
140076e83: mov       edx, dword ptr [rsi + rdx + 8]
140076e87: not       edx
140076e89: mov       r8d, ebx
140076e8c: sub       r8d, dword ptr [rax + rdx*4]
140076e90: cmp       r8d, r13d
140076e93: jb        0x1400770a9
140076e99: cmp       r12d, ecx
140076e9c: jne       0x140076e79
140076e9e: cmp       r14, r15
140076ea1: mov       r10, qword ptr [rsp + 0x98]
140076ea9: je        0x140077302
140076eaf: mov       ecx, dword ptr [r14]
140076eb2: add       r14, 4
140076eb6: mov       rax, qword ptr [rdi + 0x108]
140076ebd: lea       rcx, [rcx + rcx*4]
140076ec1: shl       rcx, 5
140076ec5: cmp       qword ptr [rax + rcx + 0x58], 0
140076ecb: je        0x140076ee0
140076ecd: lea       rbp, [rax + rcx]
140076ed1: lea       rbx, [rax + rcx]
140076ed5: add       rbx, 0x58
140076ed9: jmp       0x140076f0e
140076edb: nop       dword ptr [rax + rax]
140076ee0: cmp       r14, r15
140076ee3: je        0x140077302
140076ee9: mov       eax, dword ptr [r14]
140076eec: add       r14, 4
140076ef0: mov       rbp, qword ptr [rdi + 0x108]
140076ef7: lea       rax, [rax + rax*4]
140076efb: shl       rax, 5
140076eff: cmp       qword ptr [rbp + rax + 0x58], 0
140076f05: je        0x140076ee0
140076f07: add       rbp, rax
140076f0a: lea       rbx, [rbp + 0x58]
140076f0e: mov       eax, dword ptr [rbp + 0x94]
140076f14: mov       rdx, qword ptr [rdi + 0x1a8]
140076f1b: lea       r8, [rax + rax*8]
140076f1f: lea       rcx, [rdx + r8*8]
140076f23: mov       rax, qword ptr [r10 + 0x110]
140076f2a: mov       rdx, qword ptr [rdx + r8*8 + 0x40]
140076f2f: mov       esi, r13d
140076f32: cmp       rax, rdx
140076f35: jae       0x140076f70
140076f37: mov       r8, qword ptr [rcx + 0x38]
140076f3b: mov       rax, qword ptr [r8 + rax*8]
140076f3f: test      rax, rax
140076f42: je        0x140076f70
140076f44: mov       r8, qword ptr [rcx + 0x18]
140076f48: not       rax
140076f4b: lea       rax, [rax + rax*2]
140076f4f: shl       rax, 4
140076f53: mov       r13, qword ptr [r8 + rax + 0x10]
140076f58: mov       r8, qword ptr [r10 + 0x118]
140076f5f: mov       rax, qword ptr [rcx + 0x38]
140076f63: cmp       r8, rdx
140076f66: jb        0x140076f83
140076f68: mov       rdx, qword ptr [rcx + 0x18]
140076f6c: jmp       0x140076fc0
140076f6e: nop
140076f70: xor       r13d, r13d
140076f73: mov       r8, qword ptr [r10 + 0x118]
140076f7a: mov       rax, qword ptr [rcx + 0x38]
140076f7e: cmp       r8, rdx
140076f81: jae       0x140076f68
140076f83: mov       r8, qword ptr [rax + r8*8]
140076f87: mov       rdx, qword ptr [rcx + 0x18]
140076f8b: test      r8, r8
140076f8e: je        0x140076fc0
140076f90: not       r8
140076f93: lea       r8, [r8 + r8*2]
140076f97: shl       r8, 4
140076f9b: mov       r8, qword ptr [rdx + r8 + 0x10]
140076fa0: mov       qword ptr [rsp + 0x40], r8
140076fa5: mov       r8, qword ptr [r10 + 0x128]
140076fac: xor       r12d, r12d
140076faf: cmp       r8, qword ptr [rbp + 0x88]
140076fb6: jae       0x140076e20
140076fbc: jmp       0x140076fe0
140076fbe: nop
140076fc0: mov       qword ptr [rsp + 0x40], 0
140076fc9: mov       r8, qword ptr [r10 + 0x128]
140076fd0: xor       r12d, r12d
140076fd3: cmp       r8, qword ptr [rbp + 0x88]
140076fda: jae       0x140076e20
140076fe0: mov       r9, qword ptr [rbp + 0x80]
140076fe7: cmp       qword ptr [r9 + r8*8], 0
140076fec: je        0x140076e20
140076ff2: mov       r8, qword ptr [rax + r8*8]
140076ff6: not       r8
140076ff9: lea       r8, [r8 + r8*2]
140076ffd: shl       r8, 4
140077001: mov       r9, qword ptr [rdx + r8 + 0x10]
140077006: mov       qword ptr [rsp + 0x60], r9
14007700b: mov       r8, qword ptr [rdx + r8 + 0x28]
140077010: mov       qword ptr [rsp + 0x58], r8
140077015: mov       r8b, 1
140077018: mov       qword ptr [rsp + 0x38], r8
14007701d: jmp       0x140076e29
140077022: lea       r8, [rdx + rbp]
140077026: mov       qword ptr [rsp + 0x90], r8
14007702e: imul      r8, rdx, 0x2c
140077032: add       r8, qword ptr [rsp + 0x40]
140077037: lea       r9, [rdx + rdx*4]
14007703b: shl       r9, 4
14007703f: add       r9, qword ptr [rsp + 0x70]
140077044: mov       r11, qword ptr [rsp + 0x68]
140077049: lea       r11, [r11 + rdx*4]
14007704d: mov       qword ptr [rsp + 0x78], r11
140077052: cmp       byte ptr [rsp + 0x38], 1
140077057: mov       qword ptr [rsp + 0x80], rbp
14007705f: jne       0x1400771ec
140077065: mov       r10, qword ptr [rsp + 0x58]
14007706a: lea       rbp, [r10 + rdx*4]
14007706e: movzx     r10d, byte ptr [rsp + 0x37]
140077074: shl       rdx, 5
140077078: add       rdx, qword ptr [rsp + 0x60]
14007707d: mov       r11b, 1
140077080: mov       qword ptr [rsp + 0x38], r11
140077085: mov       qword ptr [rsp + 0xa8], rbp
14007708d: mov       qword ptr [rsp + 0x50], rbp
140077092: mov       r11, qword ptr [rsp + 0x90]
14007709a: cmp       byte ptr [r11], 2
14007709e: je        0x140077229
1400770a4: jmp       0x14007712b
1400770a9: lea       r8, [rdx + rbp]
1400770ad: mov       qword ptr [rsp + 0x90], r8
1400770b5: imul      r8, rdx, 0x2c
1400770b9: add       r8, qword ptr [rsp + 0x40]
1400770be: lea       r9, [rdx + rdx*4]
1400770c2: shl       r9, 4
1400770c6: add       r9, qword ptr [rsp + 0x70]
1400770cb: mov       r11, qword ptr [rsp + 0x68]
1400770d0: lea       r11, [r11 + rdx*4]
1400770d4: mov       qword ptr [rsp + 0x78], r11
1400770d9: cmp       byte ptr [rsp + 0x38], 1
1400770de: mov       qword ptr [rsp + 0x80], rbp
1400770e6: jne       0x1400771ff
1400770ec: mov       r10, qword ptr [rsp + 0x58]
1400770f1: lea       rbp, [r10 + rdx*4]
1400770f5: movzx     r10d, byte ptr [rsp + 0x37]
1400770fb: shl       rdx, 5
1400770ff: add       rdx, qword ptr [rsp + 0x60]
140077104: mov       r11b, 1
140077107: mov       qword ptr [rsp + 0x38], r11
14007710c: mov       qword ptr [rsp + 0xa0], rbp
140077114: mov       qword ptr [rsp + 0x50], rbp
140077119: mov       r11, qword ptr [rsp + 0x90]
140077121: cmp       byte ptr [r11], 2
140077125: je        0x140077229
14007712b: mov       r11d, dword ptr [r8 + 0x24]
14007712f: mov       dword ptr [rsp + 0xc0], r11d
140077137: movups    xmm0, xmmword ptr [r8 + 0x14]
14007713c: movaps    xmmword ptr [rsp + 0xb0], xmm0
140077144: mov       r11d, dword ptr [r8 + 0x24]
140077148: lea       rbp, [rsp + 0xc4]
140077150: mov       dword ptr [rbp + 0x10], r11d
140077154: movups    xmm0, xmmword ptr [r8 + 0x14]
140077159: movups    xmmword ptr [rbp], xmm0
14007715d: mov       r11d, dword ptr [r8 + 0x24]
140077161: mov       dword ptr [rbp + 0x24], r11d
140077165: movups    xmm0, xmmword ptr [r8 + 0x14]
14007716a: movups    xmmword ptr [rbp + 0x14], xmm0
14007716e: mov       r11d, dword ptr [r8 + 0x24]
140077172: mov       dword ptr [rbp + 0x38], r11d
140077176: movups    xmm0, xmmword ptr [r8 + 0x14]
14007717b: movups    xmmword ptr [rbp + 0x28], xmm0
14007717f: mov       r11d, dword ptr [rsp + 0x48]
140077184: mov       rbp, qword ptr [rsp + 0x78]
140077189: mov       dword ptr [rbp], r11d
14007718d: movaps    xmm0, xmmword ptr [rsp + 0xf0]
140077195: movups    xmmword ptr [r9 + 0x40], xmm0
14007719a: movaps    xmm0, xmmword ptr [rsp + 0xb0]
1400771a2: movaps    xmm1, xmmword ptr [rsp + 0xc0]
1400771aa: movaps    xmm2, xmmword ptr [rsp + 0xd0]
1400771b2: movaps    xmm3, xmmword ptr [rsp + 0xe0]
1400771ba: movups    xmmword ptr [r9 + 0x30], xmm3
1400771bf: movups    xmmword ptr [r9 + 0x20], xmm2
1400771c4: movups    xmmword ptr [r9 + 0x10], xmm1
1400771c9: movups    xmmword ptr [r9], xmm0
1400771cd: test      rdx, rdx
1400771d0: mov       rbp, qword ptr [rsp + 0x80]
1400771d8: je        0x140076c1c
1400771de: movss     xmm0, dword ptr [r8 + 0x28]
1400771e4: xorps     xmm0, xmm6
1400771e7: jmp       0x1400772da
1400771ec: mov       qword ptr [rsp + 0x38], 0
1400771f5: mov       rdx, qword ptr [rsp + 0xa8]
1400771fd: jmp       0x140077210
1400771ff: mov       qword ptr [rsp + 0x38], 0
140077208: mov       rdx, qword ptr [rsp + 0xa0]
140077210: mov       qword ptr [rsp + 0x50], rdx
140077215: xor       edx, edx
140077217: mov       r11, qword ptr [rsp + 0x90]
14007721f: cmp       byte ptr [r11], 2
140077223: jne       0x14007712b
140077229: mov       r11d, dword ptr [r8 + 0x10]
14007722d: mov       dword ptr [rsp + 0xc0], r11d
140077235: movups    xmm0, xmmword ptr [r8]
140077239: movaps    xmmword ptr [rsp + 0xb0], xmm0
140077241: mov       r11d, dword ptr [r8 + 0x10]
140077245: lea       rbp, [rsp + 0xc4]
14007724d: mov       dword ptr [rbp + 0x10], r11d
140077251: movups    xmm0, xmmword ptr [r8]
140077255: movups    xmmword ptr [rbp], xmm0
140077259: mov       r11d, dword ptr [r8 + 0x10]
14007725d: mov       dword ptr [rbp + 0x24], r11d
140077261: movups    xmm0, xmmword ptr [r8]
140077265: movups    xmmword ptr [rbp + 0x14], xmm0
140077269: mov       r11d, dword ptr [r8 + 0x10]
14007726d: mov       dword ptr [rbp + 0x38], r11d
140077271: movups    xmm0, xmmword ptr [r8]
140077275: movups    xmmword ptr [rbp + 0x28], xmm0
140077279: mov       r8d, dword ptr [rsp + 0x48]
14007727e: mov       r11, qword ptr [rsp + 0x78]
140077283: mov       dword ptr [r11], r8d
140077286: movaps    xmm0, xmmword ptr [rsp + 0xf0]
14007728e: movups    xmmword ptr [r9 + 0x40], xmm0
140077293: movaps    xmm0, xmmword ptr [rsp + 0xb0]
14007729b: movaps    xmm1, xmmword ptr [rsp + 0xc0]
1400772a3: movaps    xmm2, xmmword ptr [rsp + 0xd0]
1400772ab: movaps    xmm3, xmmword ptr [rsp + 0xe0]
1400772b3: movups    xmmword ptr [r9 + 0x30], xmm3
1400772b8: movups    xmmword ptr [r9 + 0x20], xmm2
1400772bd: movups    xmmword ptr [r9 + 0x10], xmm1
1400772c2: movups    xmmword ptr [r9], xmm0
1400772c6: xorps     xmm0, xmm0
1400772c9: test      rdx, rdx
1400772cc: mov       rbp, qword ptr [rsp + 0x80]
1400772d4: je        0x140076c1c
1400772da: mov       r8d, dword ptr [rsp + 0x8c]
1400772e2: mov       r9, qword ptr [rsp + 0x50]
1400772e7: mov       dword ptr [r9], r8d
1400772ea: mov       qword ptr [rdx], 1
1400772f1: mov       dword ptr [rdx + 8], 1
1400772f8: movss     dword ptr [rdx + 0xc], xmm0
1400772fd: jmp       0x140076c1c
140077302: movaps    xmm6, xmmword ptr [rsp + 0x1b0]
14007730a: add       rsp, 0x1c8
140077311: pop       rbx
140077312: pop       rbp
140077313: pop       rdi
140077314: pop       rsi
140077315: pop       r12
140077317: pop       r13
140077319: pop       r14
14007731b: pop       r15
14007731d: ret
