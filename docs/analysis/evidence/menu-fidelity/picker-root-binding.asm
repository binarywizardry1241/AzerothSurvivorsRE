140074b60: push      rbp
140074b61: push      r15
140074b63: push      r14
140074b65: push      r13
140074b67: push      r12
140074b69: push      rsi
140074b6a: push      rdi
140074b6b: push      rbx
140074b6c: sub       rsp, 0x6a8
140074b73: lea       rbp, [rsp + 0x80]
140074b7b: movaps    xmmword ptr [rbp + 0x610], xmm15
140074b83: movaps    xmmword ptr [rbp + 0x600], xmm14
140074b8b: movaps    xmmword ptr [rbp + 0x5f0], xmm13
140074b93: movaps    xmmword ptr [rbp + 0x5e0], xmm12
140074b9b: movaps    xmmword ptr [rbp + 0x5d0], xmm11
140074ba3: movaps    xmmword ptr [rbp + 0x5c0], xmm10
140074bab: movaps    xmmword ptr [rbp + 0x5b0], xmm9
140074bb3: movaps    xmmword ptr [rbp + 0x5a0], xmm8
140074bbb: movaps    xmmword ptr [rbp + 0x590], xmm7
140074bc2: movaps    xmmword ptr [rbp + 0x580], xmm6
140074bc9: mov       qword ptr [rbp + 0x578], 0xfffffffffffffffe
140074bd4: mov       r12, qword ptr [rbp + 0x6a8]
140074bdb: mov       r15, qword ptr [rbp + 0x690]
140074be2: mov       rax, qword ptr [rbp + 0x6c0]
140074be9: mov       rcx, qword ptr [rbp + 0x6b8]
140074bf0: mov       r10, qword ptr [rbp + 0x6b0]
140074bf7: mov       r11, qword ptr [rbp + 0x6a0]
140074bfe: mov       rsi, qword ptr [rbp + 0x698]
140074c05: mov       rdi, qword ptr [rdx + 0x20]
140074c09: mov       qword ptr [rbp - 0x20], rdi
140074c0d: movups    xmm0, xmmword ptr [rdx]
140074c10: movups    xmm1, xmmword ptr [rdx + 0x10]
140074c14: movaps    xmmword ptr [rbp - 0x30], xmm1
140074c18: movaps    xmmword ptr [rbp - 0x40], xmm0
140074c1c: movups    xmm0, xmmword ptr [r8]
140074c20: movups    xmm1, xmmword ptr [r8 + 0x10]
140074c25: movups    xmmword ptr [rbp - 8], xmm1
140074c29: movups    xmmword ptr [rbp - 0x18], xmm0
140074c2d: mov       rdx, qword ptr [r9 + 0x10]
140074c31: mov       qword ptr [rbp + 0x18], rdx
140074c35: movups    xmm0, xmmword ptr [r9]
140074c39: movups    xmmword ptr [rbp + 8], xmm0
140074c3d: movups    xmm0, xmmword ptr [r15]
140074c41: movups    xmm1, xmmword ptr [r15 + 0x10]
140074c46: movups    xmmword ptr [rbp + 0xb8], xmm1
140074c4d: movups    xmmword ptr [rbp + 0xa8], xmm0
140074c54: movups    xmm0, xmmword ptr [rsi]
140074c57: movups    xmm1, xmmword ptr [rsi + 0x10]
140074c5b: movaps    xmmword ptr [rbp + 0x20], xmm0
140074c5f: movaps    xmmword ptr [rbp + 0x30], xmm1
140074c63: movups    xmm0, xmmword ptr [r11]
140074c67: movups    xmm1, xmmword ptr [r11 + 0x10]
140074c6c: movaps    xmmword ptr [rbp + 0x40], xmm0
140074c70: movaps    xmmword ptr [rbp + 0x50], xmm1
140074c74: mov       qword ptr [rbp + 0x60], r12
140074c78: movups    xmm0, xmmword ptr [r10]
140074c7c: movups    xmm1, xmmword ptr [r10 + 0x10]
140074c81: movups    xmmword ptr [rbp + 0x78], xmm1
140074c85: movups    xmmword ptr [rbp + 0x68], xmm0
140074c89: movups    xmm0, xmmword ptr [rcx]
140074c8c: movups    xmm1, xmmword ptr [rcx + 0x10]
140074c90: movups    xmmword ptr [rbp + 0x98], xmm1
140074c97: movups    xmmword ptr [rbp + 0x88], xmm0
140074c9e: movups    xmm0, xmmword ptr [rax]
140074ca1: movups    xmm1, xmmword ptr [rax + 0x10]
140074ca5: movups    xmmword ptr [rbp + 0xd8], xmm1
140074cac: movups    xmmword ptr [rbp + 0xc8], xmm0
140074cb3: mov       rcx, qword ptr [rbp - 0x18]
140074cb7: mov       rax, qword ptr [rbp + 8]
140074cbb: mov       rbx, qword ptr [rbp + 0x10]
140074cbf: mov       r14, qword ptr [rax + 0xf8]
140074cc6: mov       rdx, qword ptr [rax + 0x100]
140074ccd: movzx     eax, byte ptr [rax + 0x108]
140074cd4: lea       r8, [rdx*4]
140074cdc: xor       r9d, r9d
140074cdf: test      al, al
140074ce1: je        0x140074d20
140074ce3: nop       word ptr cs:[rax + rax]
140074cf0: cmp       r8, r9
140074cf3: je        0x140074dc2
140074cf9: mov       r10d, dword ptr [r14 + r9]
140074cfd: mov       r11, qword ptr [rbx + 0x1a8]
140074d04: lea       r10, [r10 + r10*8]
140074d08: add       r9, 4
140074d0c: cmp       qword ptr [r11 + r10*8 + 0x10], 0
140074d12: je        0x140074cf0
140074d14: jmp       0x140074d48
140074d16: nop       word ptr cs:[rax + rax]
140074d20: cmp       r8, r9
140074d23: je        0x140074dc2
140074d29: mov       r10d, dword ptr [r14 + r9]
140074d2d: mov       r11, qword ptr [rbx + 0x108]
140074d34: lea       r10, [r10 + r10*4]
140074d38: shl       r10, 5
140074d3c: add       r9, 4
140074d40: cmp       qword ptr [r11 + r10 + 0x58], 0
140074d46: je        0x140074d20
140074d48: mov       r8, qword ptr [rbp + 0xd8]
140074d4f: mov       r9d, dword ptr [rbp + 0xe4]
140074d56: mov       r10d, r9d
140074d59: sub       r10d, dword ptr [r8]
140074d5c: lea       r15, [r14 + rdx*4]
140074d60: sub       r9d, dword ptr [rbp + 0xe0]
140074d67: cmp       r9d, 0xc233b000
140074d6e: mov       edx, 0xc233b000
140074d73: cmovb     edx, r9d
140074d77: cmp       r10d, edx
140074d7a: jae       0x140075051
140074d80: mov       rcx, qword ptr [rbp - 0x30]
140074d84: mov       qword ptr [rbp + 0x568], rcx
140074d8b: mov       r11, qword ptr [rbp - 0x20]
140074d8f: mov       r12, qword ptr [rbp - 0x28]
140074d93: mov       r9, qword ptr [rbp - 0x40]
140074d97: mov       r10, qword ptr [rbp - 0x38]
140074d9b: mov       edi, 8
140074da0: xor       esi, esi
140074da2: test      al, al
140074da4: je        0x14007509d
140074daa: lea       rcx, [rbp + 0x2f0]
140074db1: xor       r13d, r13d
140074db4: cmp       r13d, esi
140074db7: je        0x1400750e0
140074dbd: jmp       0x1400750c0
140074dc2: cmp       byte ptr [rcx + 0xd], 0
140074dc6: je        0x14007616d
140074dcc: lea       rsi, [rbp + 0x2f0]
140074dd3: mov       rcx, rsi
140074dd6: call      0x14589d550
140074ddb: mov       eax, dword ptr [rbp + 0xa4]
140074de1: mov       rcx, qword ptr [rbp + 0x98]
140074de8: mov       dword ptr [rcx], eax
140074dea: mov       r14, qword ptr [rbp + 0x88]
140074df1: mov       rcx, r14
140074df4: call      0x140009eb0
140074df9: mov       r8d, 0x1d0
140074dff: mov       rcx, r14
140074e02: mov       rdx, rsi
140074e05: call      0x145bfa0e7
140074e0a: mov       rdi, qword ptr [rbp + 0x68]
140074e0e: mov       r13b, byte ptr [rdi + 0x38]
140074e12: mov       sil, byte ptr [rdi + 0x39]
140074e16: mov       bl, byte ptr [rdi + 0x3a]
140074e19: lea       rcx, [rbp + 0xf0]
140074e20: mov       rdx, rdi
140074e23: call      0x145bcd2f0
140074e28: lea       rdx, [rdi + 0x18]
140074e2c: lea       rcx, [rbp + 0x110]
140074e33: call      0x145bcd2f0
140074e38: nop
140074e39: movzx     eax, byte ptr [rdi + 0x3f]
140074e3d: mov       byte ptr [rbp + 0x32f], al
140074e43: mov       eax, dword ptr [rdi + 0x3b]
140074e46: mov       dword ptr [rbp + 0x32b], eax
140074e4c: mov       rax, qword ptr [rdi + 0x30]
140074e50: mov       byte ptr [rbp + 0x328], r13b
140074e57: mov       byte ptr [rbp + 0x329], sil
140074e5e: mov       byte ptr [rbp + 0x32a], bl
140074e64: mov       rcx, qword ptr [rbp + 0x100]
140074e6b: mov       qword ptr [rbp + 0x300], rcx
140074e72: movups    xmm0, xmmword ptr [rbp + 0xf0]
140074e79: movaps    xmmword ptr [rbp + 0x2f0], xmm0
140074e80: mov       rcx, qword ptr [rbp + 0x120]
140074e87: mov       qword ptr [rbp + 0x318], rcx
140074e8e: movups    xmm0, xmmword ptr [rbp + 0x110]
140074e95: movups    xmmword ptr [rbp + 0x308], xmm0
140074e9c: mov       qword ptr [rbp + 0x320], rax
140074ea3: lea       rcx, [rbp + 0x298]
140074eaa: lea       r8, [rbp + 0x2f0]
140074eb1: mov       rdx, r14
140074eb4: call      0x14589c030
140074eb9: movzx     eax, byte ptr [rbp + 0x2d0]
140074ec0: cmp       al, byte ptr [rdi + 0x38]
140074ec3: jne       0x140074f9b
140074ec9: movzx     eax, byte ptr [rbp + 0x2d1]
140074ed0: cmp       al, byte ptr [rdi + 0x39]
140074ed3: jne       0x140074f9b
140074ed9: movzx     eax, byte ptr [rbp + 0x2d2]
140074ee0: cmp       al, byte ptr [rdi + 0x3a]
140074ee3: jne       0x140074f9b
140074ee9: mov       r8, qword ptr [rbp + 0x2a8]
140074ef0: cmp       r8, qword ptr [rdi + 0x10]
140074ef4: jne       0x140074f9b
140074efa: mov       rdx, qword ptr [rdi + 8]
140074efe: mov       r14, qword ptr [rbp + 0x2a0]
140074f05: mov       rcx, r14
140074f08: call      0x145bfa0e1
140074f0d: test      eax, eax
140074f0f: jne       0x140074f9b
140074f15: mov       r8, qword ptr [rbp + 0x2c0]
140074f1c: cmp       r8, qword ptr [rdi + 0x28]
140074f20: jne       0x140074f9b
140074f22: mov       rdx, qword ptr [rdi + 0x20]
140074f26: mov       rcx, qword ptr [rbp + 0x2b8]
140074f2d: call      0x145bfa0e1
140074f32: test      eax, eax
140074f34: jne       0x140074f9b
140074f36: lea       rax, [rdi + 0x3b]
140074f3a: mov       ecx, dword ptr [rbp + 0x2d3]
140074f40: movzx     edx, byte ptr [rbp + 0x2d7]
140074f47: shl       rdx, 0x20
140074f4b: or        rdx, rcx
140074f4e: mov       ecx, dword ptr [rax]
140074f50: movzx     eax, byte ptr [rax + 4]
140074f54: shl       rax, 0x20
140074f58: or        rax, rcx
140074f5b: cmp       rdx, rax
140074f5e: jne       0x140074f9b
140074f60: mov       rax, qword ptr [rbp + 0x2c8]
140074f67: cmp       rax, qword ptr [rdi + 0x30]
140074f6b: jne       0x140074f9b
140074f6d: mov       cl, 1
140074f6f: cmp       qword ptr [rbp + 0xa8], 0
140074f77: jne       0x140075014
140074f7d: mov       rdx, qword ptr [rbp + 0x298]
140074f84: test      rdx, rdx
140074f87: je        0x14007614f
140074f8d: mov       r8d, 1
140074f93: mov       rcx, r14
140074f96: jmp       0x14007614a
140074f9b: mov       eax, dword ptr [rbp + 0x84]
140074fa1: mov       rcx, qword ptr [rbp + 0x78]
140074fa5: mov       dword ptr [rcx], eax
140074fa7: mov       rdx, qword ptr [rdi]
140074faa: test      rdx, rdx
140074fad: je        0x140074fbe
140074faf: mov       rcx, qword ptr [rdi + 8]
140074fb3: mov       r8d, 1
140074fb9: call      0x1400021d0
140074fbe: lea       rax, [rdi + 0x18]
140074fc2: mov       rdx, qword ptr [rax]
140074fc5: test      rdx, rdx
140074fc8: je        0x140074fd9
140074fca: mov       rcx, qword ptr [rdi + 0x20]
140074fce: mov       r8d, 1
140074fd4: call      0x1400021d0
140074fd9: movups    xmm0, xmmword ptr [rbp + 0x298]
140074fe0: movups    xmm1, xmmword ptr [rbp + 0x2a8]
140074fe7: movups    xmm2, xmmword ptr [rbp + 0x2b8]
140074fee: movups    xmm3, xmmword ptr [rbp + 0x2c8]
140074ff5: movups    xmmword ptr [rdi + 0x30], xmm3
140074ff9: movups    xmmword ptr [rdi + 0x20], xmm2
140074ffd: movups    xmmword ptr [rdi + 0x10], xmm1
140075001: movups    xmmword ptr [rdi], xmm0
140075004: cmp       qword ptr [rbp + 0xa8], 0
14007500c: je        0x14007616d
140075012: xor       ecx, ecx
140075014: movups    xmm0, xmmword ptr [r15]
140075018: movups    xmm1, xmmword ptr [r15 + 0x10]
14007501d: movaps    xmmword ptr [rbp + 0x100], xmm1
140075024: movaps    xmmword ptr [rbp + 0xf0], xmm0
14007502b: movzx     eax, byte ptr [r12]
140075030: cmp       eax, 2
140075033: mov       dword ptr [rbp + 0x568], ecx
140075039: je        0x14007548a
14007503f: test      eax, eax
140075041: jne       0x1400755e0
140075047: mov       rax, qword ptr [r12 + 8]
14007504c: jmp       0x1400755cb
140075051: cmp       byte ptr [rcx + 0xd], 0
140075055: jne       0x14007616d
14007505b: mov       rcx, qword ptr [rbp - 0x30]
14007505f: mov       qword ptr [rbp + 0x568], rcx
140075066: mov       r11, qword ptr [rbp - 0x20]
14007506a: mov       r12, qword ptr [rbp - 0x28]
14007506e: mov       r9, qword ptr [rbp - 0x40]
140075072: mov       r10, qword ptr [rbp - 0x38]
140075076: xor       esi, esi
140075078: mov       edi, 8
14007507d: test      al, al
14007507f: je        0x14007529a
140075085: lea       rcx, [rbp + 0x2f0]
14007508c: xor       r13d, r13d
14007508f: cmp       r13d, esi
140075092: je        0x1400752d0
140075098: jmp       0x1400752bd
14007509d: lea       rdx, [rip + 0x5d59d5c]
1400750a4: xor       r13d, r13d
1400750a7: cmp       r13d, esi
1400750aa: jne       0x1400751b0
1400750b0: jmp       0x1400751d0
1400750b5: lea       rax, [rax + rdx*8]
1400750b9: mov       rdi, qword ptr [rax + 8]
1400750bd: xor       r13d, r13d
1400750c0: mov       eax, r13d
1400750c3: inc       r13d
1400750c6: mov       rax, qword ptr [rdi + rax*8]
1400750ca: test      eax, eax
1400750cc: jne       0x140075107
1400750ce: cmp       r13d, esi
1400750d1: jne       0x1400750c0
1400750d3: nop       word ptr cs:[rax + rax]
1400750e0: cmp       r14, r15
1400750e3: je        0x14007616d
1400750e9: mov       edx, dword ptr [r14]
1400750ec: add       r14, 4
1400750f0: mov       rax, qword ptr [rbx + 0x1a8]
1400750f7: lea       rdx, [rdx + rdx*8]
1400750fb: mov       rsi, qword ptr [rax + rdx*8 + 0x10]
140075100: test      rsi, rsi
140075103: je        0x1400750e0
140075105: jmp       0x1400750b5
140075107: mov       rdx, qword ptr [rbp + 0x568]
14007510e: test      rdx, rdx
140075111: mov       r8, qword ptr [rbp + 0x560]
140075118: cmovne    r8, r11
14007511c: mov       qword ptr [rbp + 0x2f0], rax
140075123: mov       qword ptr [rbp + 0x2f8], r9
14007512a: mov       qword ptr [rbp + 0x300], r10
140075131: mov       qword ptr [rbp + 0x308], rdx
140075138: mov       qword ptr [rbp + 0x310], r12
14007513f: mov       qword ptr [rbp + 0x560], r8
140075146: mov       qword ptr [rbp + 0x318], r8
14007514d: mov       qword ptr [rbp + 0x540], r11
140075154: lea       rdx, [rip + 0x5d59ca5]
14007515b: mov       qword ptr [rbp + 0x548], r12
140075162: mov       qword ptr [rbp + 0x550], r9
140075169: mov       qword ptr [rbp + 0x558], r10
140075170: call      0x144e7f8d0
140075175: lea       rcx, [rbp + 0x2f0]
14007517c: mov       r10, qword ptr [rbp + 0x558]
140075183: mov       r9, qword ptr [rbp + 0x550]
14007518a: mov       r12, qword ptr [rbp + 0x548]
140075191: mov       r11, qword ptr [rbp + 0x540]
140075198: cmp       r13d, esi
14007519b: je        0x1400750e0
1400751a1: jmp       0x1400750c0
1400751a6: add       rax, rcx
1400751a9: mov       rdi, qword ptr [rax + 0x50]
1400751ad: xor       r13d, r13d
1400751b0: mov       eax, r13d
1400751b3: shl       rax, 4
1400751b7: inc       r13d
1400751ba: mov       rax, qword ptr [rdi + rax]
1400751be: test      eax, eax
1400751c0: jne       0x1400751fb
1400751c2: cmp       r13d, esi
1400751c5: jne       0x1400751b0
1400751c7: nop       word ptr [rax + rax]
1400751d0: cmp       r14, r15
1400751d3: je        0x14007616d
1400751d9: mov       ecx, dword ptr [r14]
1400751dc: add       r14, 4
1400751e0: mov       rax, qword ptr [rbx + 0x108]
1400751e7: lea       rcx, [rcx + rcx*4]
1400751eb: shl       rcx, 5
1400751ef: mov       rsi, qword ptr [rax + rcx + 0x58]
1400751f4: test      rsi, rsi
1400751f7: je        0x1400751d0
1400751f9: jmp       0x1400751a6
1400751fb: mov       r8, qword ptr [rbp + 0x568]
140075202: test      r8, r8
140075205: mov       rcx, qword ptr [rbp + 0x560]
14007520c: cmovne    rcx, r11
140075210: mov       qword ptr [rbp + 0x2f0], rax
140075217: mov       qword ptr [rbp + 0x2f8], r9
14007521e: mov       qword ptr [rbp + 0x300], r10
140075225: mov       qword ptr [rbp + 0x308], r8
14007522c: mov       qword ptr [rbp + 0x310], r12
140075233: mov       qword ptr [rbp + 0x560], rcx
14007523a: mov       qword ptr [rbp + 0x318], rcx
140075241: lea       rcx, [rbp + 0x2f0]
140075248: mov       qword ptr [rbp + 0x540], r11
14007524f: mov       qword ptr [rbp + 0x548], r12
140075256: mov       qword ptr [rbp + 0x550], r9
14007525d: mov       qword ptr [rbp + 0x558], r10
140075264: call      0x144e7f8d0
140075269: lea       rdx, [rip + 0x5d59b90]
140075270: mov       r10, qword ptr [rbp + 0x558]
140075277: mov       r9, qword ptr [rbp + 0x550]
14007527e: mov       r12, qword ptr [rbp + 0x548]
140075285: mov       r11, qword ptr [rbp + 0x540]
14007528c: cmp       r13d, esi
14007528f: je        0x1400751d0
140075295: jmp       0x1400751b0
14007529a: lea       rdx, [rip + 0x5d59aaf]
1400752a1: xor       r13d, r13d
1400752a4: cmp       r13d, esi
1400752a7: jne       0x1400753a0
1400752ad: jmp       0x1400753c0
1400752b2: lea       rax, [rax + rdx*8]
1400752b6: mov       rdi, qword ptr [rax + 8]
1400752ba: xor       r13d, r13d
1400752bd: mov       eax, r13d
1400752c0: inc       r13d
1400752c3: mov       rax, qword ptr [rdi + rax*8]
1400752c7: test      eax, eax
1400752c9: jne       0x1400752f7
1400752cb: cmp       r13d, esi
1400752ce: jne       0x1400752bd
1400752d0: cmp       r14, r15
1400752d3: je        0x14007616d
1400752d9: mov       edx, dword ptr [r14]
1400752dc: add       r14, 4
1400752e0: mov       rax, qword ptr [rbx + 0x1a8]
1400752e7: lea       rdx, [rdx + rdx*8]
1400752eb: mov       rsi, qword ptr [rax + rdx*8 + 0x10]
1400752f0: test      rsi, rsi
1400752f3: je        0x1400752d0
1400752f5: jmp       0x1400752b2
1400752f7: mov       rdx, qword ptr [rbp + 0x568]
1400752fe: test      rdx, rdx
140075301: mov       r8, qword ptr [rbp + 0x560]
140075308: cmovne    r8, r11
14007530c: mov       qword ptr [rbp + 0x2f0], rax
140075313: mov       qword ptr [rbp + 0x2f8], r9
14007531a: mov       qword ptr [rbp + 0x300], r10
140075321: mov       qword ptr [rbp + 0x308], rdx
140075328: mov       qword ptr [rbp + 0x310], r12
14007532f: mov       qword ptr [rbp + 0x560], r8
140075336: mov       qword ptr [rbp + 0x318], r8
14007533d: mov       qword ptr [rbp + 0x540], r11
140075344: lea       rdx, [rip + 0x5d59a05]
14007534b: mov       qword ptr [rbp + 0x548], r12
140075352: mov       qword ptr [rbp + 0x550], r9
140075359: mov       qword ptr [rbp + 0x558], r10
140075360: call      0x144e7f8d0
140075365: lea       rcx, [rbp + 0x2f0]
14007536c: mov       r10, qword ptr [rbp + 0x558]
140075373: mov       r9, qword ptr [rbp + 0x550]
14007537a: mov       r12, qword ptr [rbp + 0x548]
140075381: mov       r11, qword ptr [rbp + 0x540]
140075388: cmp       r13d, esi
14007538b: je        0x1400752d0
140075391: jmp       0x1400752bd
140075396: add       rax, rcx
140075399: mov       rdi, qword ptr [rax + 0x50]
14007539d: xor       r13d, r13d
1400753a0: mov       eax, r13d
1400753a3: shl       rax, 4
1400753a7: inc       r13d
1400753aa: mov       rax, qword ptr [rdi + rax]
1400753ae: test      eax, eax
1400753b0: jne       0x1400753eb
1400753b2: cmp       r13d, esi
1400753b5: jne       0x1400753a0
1400753b7: nop       word ptr [rax + rax]
1400753c0: cmp       r14, r15
1400753c3: je        0x14007616d
1400753c9: mov       ecx, dword ptr [r14]
1400753cc: add       r14, 4
1400753d0: mov       rax, qword ptr [rbx + 0x108]
1400753d7: lea       rcx, [rcx + rcx*4]
1400753db: shl       rcx, 5
1400753df: mov       rsi, qword ptr [rax + rcx + 0x58]
1400753e4: test      rsi, rsi
1400753e7: je        0x1400753c0
1400753e9: jmp       0x140075396
1400753eb: mov       r8, qword ptr [rbp + 0x568]
1400753f2: test      r8, r8
1400753f5: mov       rcx, qword ptr [rbp + 0x560]
1400753fc: cmovne    rcx, r11
140075400: mov       qword ptr [rbp + 0x2f0], rax
140075407: mov       qword ptr [rbp + 0x2f8], r9
14007540e: mov       qword ptr [rbp + 0x300], r10
140075415: mov       qword ptr [rbp + 0x308], r8
14007541c: mov       qword ptr [rbp + 0x310], r12
140075423: mov       qword ptr [rbp + 0x560], rcx
14007542a: mov       qword ptr [rbp + 0x318], rcx
140075431: lea       rcx, [rbp + 0x2f0]
140075438: mov       qword ptr [rbp + 0x540], r11
14007543f: mov       qword ptr [rbp + 0x548], r12
140075446: mov       qword ptr [rbp + 0x550], r9
14007544d: mov       qword ptr [rbp + 0x558], r10
140075454: call      0x144e7f8d0
140075459: lea       rdx, [rip + 0x5d598f0]
140075460: mov       r10, qword ptr [rbp + 0x558]
140075467: mov       r9, qword ptr [rbp + 0x550]
14007546e: mov       r12, qword ptr [rbp + 0x548]
140075475: mov       r11, qword ptr [rbp + 0x540]
14007547c: cmp       r13d, esi
14007547f: je        0x1400753c0
140075485: jmp       0x1400753a0
14007548a: mov       eax, dword ptr [rbp + 0x5c]
14007548d: mov       rcx, qword ptr [rbp + 0x50]
140075491: mov       dword ptr [rcx], eax
140075493: mov       rdi, qword ptr [rbp + 0x40]
140075497: mov       qword ptr [rbp + 0x2f0], 0
1400754a2: mov       qword ptr [rbp + 0x310], 0
1400754ad: lea       rax, [rip + 0x5d599bb]
1400754b4: mov       qword ptr [rbp + 0x330], rax
1400754bb: lea       rax, [rip + 0x5d59e5d]
1400754c2: mov       qword ptr [rbp + 0x338], rax
1400754c9: lea       rcx, [rbp + 0x518]
1400754d0: lea       rbx, [rbp + 0x2f0]
1400754d7: mov       rdx, rbx
1400754da: call      0x1400a9b90
1400754df: nop
1400754e0: movabs    rax, 0x1e00000028
1400754ea: mov       qword ptr [rbp + 0x500], rax
1400754f1: mov       dword ptr [rbp + 0x508], 1
1400754fb: mov       dword ptr [rbp + 0x2f0], 0x16
140075505: mov       qword ptr [rsp + 0x20], rbx
14007550a: mov       byte ptr [rsp + 0x28], 2
14007550f: lea       rcx, [rbp + 0x110]
140075516: lea       rdx, [rbp + 0x500]
14007551d: lea       r9, [rbp + 0x518]
140075524: mov       r8d, 1
14007552a: call      0x1448c6560
14007552f: nop
140075530: mov       rcx, qword ptr [rdi + 0x50]
140075534: add       rcx, 0x10
140075538: mov       byte ptr [rbp + 0x576], 1
14007553f: call      0x144962cc0
140075544: nop
140075545: mov       r14d, eax
140075548: mov       r15d, edx
14007554b: lea       rdx, [rbp + 0x110]
140075552: mov       r8d, 0xe0
140075558: mov       rcx, rbx
14007555b: call      0x145bfa0e7
140075560: mov       byte ptr [rbp + 0x576], 0
140075567: mov       qword ptr [rsp + 0x20], rbx
14007556c: lea       rcx, [rbp + 0x518]
140075573: mov       rdx, rdi
140075576: mov       r8d, r14d
140075579: mov       r9d, r15d
14007557c: call      0x1400f6730
140075581: nop
140075582: cmp       dword ptr [rbp + 0x518], 2
140075589: jne       0x1400761cf
14007558f: mov       qword ptr [rbp + 0x2f0], 0xffffffffffffffff
14007559a: mov       byte ptr [rbp + 0x576], 0
1400755a1: mov       qword ptr [rsp + 0x20], rbx
1400755a6: mov       qword ptr [rsp + 0x28], 0
1400755af: mov       rcx, rdi
1400755b2: mov       edx, r14d
1400755b5: mov       r8d, r15d
1400755b8: xor       r9d, r9d
1400755bb: call      0x144975840
1400755c0: nop
1400755c1: mov       byte ptr [r12], 0
1400755c6: mov       qword ptr [r12 + 8], rax
1400755cb: lock inc  qword ptr [rax]
1400755cf: jle       0x140076222
1400755d5: mov       qword ptr [rbp + 0x508], rax
1400755dc: xor       eax, eax
1400755de: jmp       0x1400755ef
1400755e0: movups    xmm0, xmmword ptr [r12 + 1]
1400755e6: movups    xmmword ptr [rbp + 0x501], xmm0
1400755ed: mov       al, 1
1400755ef: mov       byte ptr [rbp + 0x500], al
1400755f5: movups    xmm6, xmmword ptr [rip + 0x5d5923c]
1400755fc: movaps    xmmword ptr [rbp + 0x110], xmm6
140075603: mov       qword ptr [rbp + 0x120], 0
14007560e: movups    xmm0, xmmword ptr [rip + 0x5d5923b]
140075615: movups    xmmword ptr [rbp + 0x128], xmm0
14007561c: mov       qword ptr [rbp + 0x138], 0
140075627: movups    xmm8, xmmword ptr [rip + 0x5d59239]
14007562f: movaps    xmmword ptr [rbp + 0x140], xmm8
140075637: mov       qword ptr [rbp + 0x150], 0
140075642: movups    xmm0, xmmword ptr [rip + 0x5d59237]
140075649: movups    xmmword ptr [rbp + 0x158], xmm0
140075650: mov       qword ptr [rbp + 0x168], 0
14007565b: movaps    xmmword ptr [rbp + 0x2f0], xmm6
140075662: movaps    xmmword ptr [rbp + 0x320], xmm8
14007566a: mov       rax, qword ptr [rbp + 0x120]
140075671: mov       qword ptr [rbp + 0x300], rax
140075678: mov       rax, qword ptr [rbp + 0x128]
14007567f: mov       qword ptr [rbp + 0x308], rax
140075686: mov       rax, qword ptr [rbp + 0x130]
14007568d: mov       qword ptr [rbp + 0x310], rax
140075694: mov       rax, qword ptr [rbp + 0x138]
14007569b: mov       qword ptr [rbp + 0x318], rax
1400756a2: mov       rax, qword ptr [rbp + 0x150]
1400756a9: mov       qword ptr [rbp + 0x330], rax
1400756b0: mov       rax, qword ptr [rbp + 0x158]
1400756b7: mov       qword ptr [rbp + 0x338], rax
1400756be: movaps    xmm0, xmmword ptr [rbp + 0x160]
1400756c5: movaps    xmmword ptr [rbp + 0x340], xmm0
1400756cc: xorps     xmm0, xmm0
1400756cf: movaps    xmmword ptr [rbp + 0x360], xmm0
1400756d6: movaps    xmmword ptr [rbp + 0x350], xmm0
1400756dd: mov       qword ptr [rbp + 0x370], 0
1400756e8: movaps    xmm1, xmmword ptr [rip + 0x5d28031]
1400756ef: movups    xmmword ptr [rbp + 0x378], xmm1
1400756f6: movups    xmmword ptr [rbp + 0x398], xmm0
1400756fd: movups    xmmword ptr [rbp + 0x388], xmm0
140075704: movups    xmm0, xmmword ptr [rip + 0x5d591f5]
14007570b: movups    xmmword ptr [rbp + 0x3b8], xmm0
140075712: movups    xmm0, xmmword ptr [rip + 0x5d591d7]
140075719: movups    xmmword ptr [rbp + 0x3a8], xmm0
140075720: movups    xmm0, xmmword ptr [rip + 0x5d591f9]
140075727: movups    xmmword ptr [rbp + 0x3d8], xmm0
14007572e: movups    xmm0, xmmword ptr [rip + 0x5d591db]
140075735: movups    xmmword ptr [rbp + 0x3c8], xmm0
14007573c: movups    xmm14, xmmword ptr [rip + 0x5d591fc]
140075744: movups    xmmword ptr [rbp + 0x3f8], xmm14
14007574c: movups    xmm7, xmmword ptr [rip + 0x5d591dd]
140075753: movups    xmmword ptr [rbp + 0x3e8], xmm7
14007575a: movups    xmm9, xmmword ptr [rip + 0x5d591fe]
140075762: movups    xmmword ptr [rbp + 0x418], xmm9
14007576a: movups    xmm10, xmmword ptr [rip + 0x5d591de]
140075772: movups    xmmword ptr [rbp + 0x408], xmm10
14007577a: movaps    xmm15, xmmword ptr [rip + 0x5d27aee]
140075782: movups    xmmword ptr [rbp + 0x428], xmm15
14007578a: mov       dword ptr [rbp + 0x438], 1
140075794: mov       qword ptr [rbp + 0x43c], 0
14007579f: mov       byte ptr [rbp + 0x444], 1
1400757a6: mov       qword ptr [rbp + 0x448], 0
1400757b1: mov       dword ptr [rbp + 0x450], 0x3f800000
1400757bb: mov       word ptr [rbp + 0x454], 0x101
1400757c4: mov       word ptr [rbp + 0x45a], 0
1400757cd: mov       dword ptr [rbp + 0x456], 0x10000
1400757d7: mov       word ptr [rbp + 0x460], 0
1400757e0: mov       dword ptr [rbp + 0x45c], 0x10000
1400757ea: mov       word ptr [rbp + 0x462], 0x100
1400757f3: mov       dword ptr [rbp + 0x470], 0
1400757fd: mov       word ptr [rbp + 0x46c], 0
140075806: mov       qword ptr [rbp + 0x464], 0
140075811: movaps    xmm0, xmmword ptr [rip + 0x5d57848]
140075818: movups    xmmword ptr [rbp + 0x474], xmm0
14007581f: mov       dword ptr [rbp + 0x484], 0x1388
140075829: mov       word ptr [rbp + 0x488], 2
140075832: mov       byte ptr [rbp + 0x577], 1
140075839: lea       r9, [rip + 0x5d59528]
140075840: lea       rcx, [rbp + 0x110]
140075847: lea       rdx, [rbp - 0x40]
14007584b: lea       r8, [rbp + 0x2f0]
140075852: call      0x1401f6c80
140075857: nop
140075858: lea       rdx, [rbp + 0x20]
14007585c: lea       r8, [rbp + 0x68]
140075860: mov       byte ptr [rbp + 0x577], 1
140075867: lea       rcx, [rbp + 0x110]
14007586e: call      0x140244c60
140075873: nop
140075874: movaps    xmmword ptr [rbp + 0x110], xmm6
14007587b: mov       qword ptr [rbp + 0x120], 0
140075886: movups    xmm0, xmmword ptr [rip + 0x5d58fc3]
14007588d: movups    xmmword ptr [rbp + 0x128], xmm0
140075894: mov       qword ptr [rbp + 0x138], 0
14007589f: movaps    xmmword ptr [rbp + 0x140], xmm8
1400758a7: mov       qword ptr [rbp + 0x150], 0
1400758b2: movups    xmm0, xmmword ptr [rip + 0x5d58fc7]
1400758b9: movups    xmmword ptr [rbp + 0x158], xmm0
1400758c0: mov       qword ptr [rbp + 0x168], 0
1400758cb: movsd     xmm0, qword ptr [rip + 0x5d5779d]
1400758d3: movsd     qword ptr [rbp + 0x470], xmm0
1400758db: mov       dword ptr [rbp + 0x478], 0x3f0ccccd
1400758e5: movaps    xmmword ptr [rbp + 0x2f0], xmm6
1400758ec: movaps    xmmword ptr [rbp + 0x320], xmm8
1400758f4: mov       rax, qword ptr [rbp + 0x120]
1400758fb: mov       qword ptr [rbp + 0x300], rax
140075902: mov       rax, qword ptr [rbp + 0x128]
140075909: mov       qword ptr [rbp + 0x308], rax
140075910: mov       rax, qword ptr [rbp + 0x130]
140075917: mov       qword ptr [rbp + 0x310], rax
14007591e: mov       rax, qword ptr [rbp + 0x138]
140075925: mov       qword ptr [rbp + 0x318], rax
14007592c: movaps    xmm0, xmmword ptr [rbp + 0x150]
140075933: movaps    xmmword ptr [rbp + 0x330], xmm0
14007593a: movaps    xmm0, xmmword ptr [rbp + 0x160]
140075941: movaps    xmmword ptr [rbp + 0x340], xmm0
140075948: xorps     xmm0, xmm0
14007594b: movaps    xmmword ptr [rbp + 0x350], xmm0
140075952: movaps    xmm1, xmmword ptr [rip + 0x5d27aa7]
140075959: movaps    xmmword ptr [rbp + 0x360], xmm1
140075960: movaps    xmmword ptr [rbp + 0x370], xmm0
140075967: movaps    xmmword ptr [rbp + 0x380], xmm0
14007596e: movaps    xmmword ptr [rbp + 0x390], xmm0
140075975: mov       qword ptr [rbp + 0x3a0], 0
140075980: movups    xmm0, xmmword ptr [rip + 0x5d58f69]
140075987: movups    xmmword ptr [rbp + 0x3a8], xmm0
14007598e: movups    xmm0, xmmword ptr [rip + 0x5d58f6b]
140075995: movups    xmmword ptr [rbp + 0x3b8], xmm0
14007599c: movups    xmm0, xmmword ptr [rip + 0x5d58f6d]
1400759a3: movups    xmmword ptr [rbp + 0x3c8], xmm0
1400759aa: movups    xmm0, xmmword ptr [rip + 0x5d58f6f]
1400759b1: movups    xmmword ptr [rbp + 0x3d8], xmm0
1400759b8: movups    xmmword ptr [rbp + 0x3e8], xmm7
1400759bf: movups    xmmword ptr [rbp + 0x3f8], xmm14
1400759c7: movups    xmmword ptr [rbp + 0x418], xmm9
1400759cf: movups    xmmword ptr [rbp + 0x408], xmm10
1400759d7: movups    xmmword ptr [rbp + 0x428], xmm15
1400759df: mov       dword ptr [rbp + 0x438], 1
1400759e9: movss     xmm0, dword ptr [rip + 0x5d2791f]
1400759f1: movlps    qword ptr [rbp + 0x43c], xmm0
1400759f8: mov       byte ptr [rbp + 0x444], 1
1400759ff: mov       qword ptr [rbp + 0x448], 0
140075a0a: mov       dword ptr [rbp + 0x450], 0x3f800000
140075a14: mov       word ptr [rbp + 0x454], 0
140075a1d: mov       dword ptr [rbp + 0x456], 0x10000
140075a27: mov       word ptr [rbp + 0x45a], 0
140075a30: movabs    rax, 0x100000000010000
140075a3a: mov       qword ptr [rbp + 0x45c], rax
140075a41: mov       word ptr [rbp + 0x46c], 0
140075a4a: mov       qword ptr [rbp + 0x464], 0
140075a55: mov       dword ptr [rbp + 0x47c], 0x1389
140075a5f: mov       byte ptr [rbp + 0x577], 1
140075a66: lea       r9, [rip + 0x5d59313]
140075a6d: lea       rcx, [rbp + 0x110]
140075a74: lea       rdx, [rbp - 0x40]
140075a78: lea       r8, [rbp + 0x2f0]
140075a7f: call      0x1401f66f0
140075a84: nop
140075a85: lea       rax, [rbp + 0xf0]
140075a8c: mov       qword ptr [rbp + 0x308], rax
140075a93: movups    xmm0, xmmword ptr [rbp + 0x500]
140075a9a: movaps    xmmword ptr [rbp + 0x2f0], xmm0
140075aa1: mov       rax, qword ptr [rbp + 0x510]
140075aa8: mov       qword ptr [rbp + 0x300], rax
140075aaf: mov       byte ptr [rbp + 0x577], 0
140075ab6: lea       rcx, [rbp + 0x110]
140075abd: lea       rdx, [rbp + 0x2f0]
140075ac4: call      0x140243110
140075ac9: nop
140075aca: mov       word ptr [rbp + 0x274], 0
140075ad3: mov       byte ptr [rbp + 0x264], 1
140075ada: movabs    rax, 0x4160000000000001
140075ae4: mov       qword ptr [rbp + 0x178], rax
140075aeb: xorps     xmm0, xmm0
140075aee: movaps    xmmword ptr [rbp + 0x180], xmm0
140075af5: movabs    rax, 0x4120000000000001
140075aff: mov       qword ptr [rbp + 0x190], rax
140075b06: mov       qword ptr [rbp + 0x170], 0
140075b11: movups    xmmword ptr [rbp + 0x198], xmm0
140075b18: movups    xmmword ptr [rbp + 0x1a8], xmm0
140075b1f: movups    xmmword ptr [rbp + 0x1b8], xmm0
140075b26: mov       dword ptr [rbp + 0x288], 0
140075b30: mov       word ptr [rbp + 0x28c], 0
140075b39: movups    xmm0, xmmword ptr [rip + 0x5d58db0]
140075b40: movups    xmmword ptr [rbp + 0x1c8], xmm0
140075b47: movups    xmm0, xmmword ptr [rip + 0x5d58db2]
140075b4e: movups    xmmword ptr [rbp + 0x1d8], xmm0
140075b55: movups    xmm0, xmmword ptr [rip + 0x5d58db4]
140075b5c: movups    xmmword ptr [rbp + 0x1e8], xmm0
140075b63: movups    xmm0, xmmword ptr [rip + 0x5d58db6]
140075b6a: movups    xmmword ptr [rbp + 0x1f8], xmm0
140075b71: movups    xmmword ptr [rbp + 0x218], xmm14
140075b79: movups    xmmword ptr [rbp + 0x208], xmm7
140075b80: movups    xmmword ptr [rbp + 0x238], xmm9
140075b88: movups    xmmword ptr [rbp + 0x228], xmm10
140075b90: mov       byte ptr [rbp + 0x286], 0
140075b97: mov       dword ptr [rbp + 0x282], 0x100
140075ba1: mov       qword ptr [rbp + 0x268], 0
140075bac: mov       dword ptr [rbp + 0x270], 0x3f800000
140075bb6: movups    xmmword ptr [rbp + 0x248], xmm15
140075bbe: mov       dword ptr [rbp + 0x258], 1
140075bc8: mov       qword ptr [rbp + 0x25c], 0
140075bd3: mov       byte ptr [rbp + 0x287], 0
140075bda: movaps    xmmword ptr [rbp + 0x110], xmm6
140075be1: mov       qword ptr [rbp + 0x120], 0
140075bec: movups    xmm0, xmmword ptr [rip + 0x5d58c5d]
140075bf3: movups    xmmword ptr [rbp + 0x128], xmm0
140075bfa: mov       qword ptr [rbp + 0x138], 0
140075c05: movaps    xmmword ptr [rbp + 0x140], xmm8
140075c0d: mov       qword ptr [rbp + 0x150], 0
140075c18: movups    xmm0, xmmword ptr [rip + 0x5d58c61]
140075c1f: movups    xmmword ptr [rbp + 0x158], xmm0
140075c26: mov       qword ptr [rbp + 0x168], 0
140075c31: mov       word ptr [rbp + 0x27a], 0
140075c3a: mov       dword ptr [rbp + 0x276], 0x10000
140075c44: mov       word ptr [rbp + 0x280], 0
140075c4d: mov       dword ptr [rbp + 0x27c], 0x10000
140075c57: mov       rbx, qword ptr [rbp + 0xf0]
140075c5e: call      0x140002200
140075c63: mov       ecx, 0x20
140075c68: mov       edx, 1
140075c6d: call      0x1400021c0
140075c72: test      rax, rax
140075c75: je        0x140076212
140075c7b: mov       rsi, rax
140075c7e: movups    xmm0, xmmword ptr [rip + 0x5d59137]
140075c85: movups    xmmword ptr [rax + 0x10], xmm0
140075c89: movups    xmm0, xmmword ptr [rip + 0x5d5911c]
140075c90: movups    xmmword ptr [rax], xmm0
140075c93: cmp       byte ptr [rbx], 1
140075c96: jne       0x140075cb8
140075c98: mov       eax, dword ptr [rbx + 1]
140075c9b: mov       ecx, dword ptr [rbx + 4]
140075c9e: mov       dword ptr [rbp + 0x53b], ecx
140075ca4: mov       dword ptr [rbp + 0x538], eax
140075caa: mov       r14, qword ptr [rbx + 8]
140075cae: movzx     r15d, byte ptr [rbx + 0x10]
140075cb3: mov       r12b, 1
140075cb6: jmp       0x140075cc9
140075cb8: mov       r14, qword ptr [rbx + 8]
140075cbc: lock inc  qword ptr [r14]
140075cc0: jle       0x140076222
140075cc6: xor       r12d, r12d
140075cc9: movups    xmm11, xmmword ptr [rip + 0x5d590c7]
140075cd1: movups    xmmword ptr [rbp + 0x519], xmm11
140075cd9: mov       dword ptr [rbp + 0x529], 0x3f800000
140075ce3: lea       rdi, [rbp + 0x2f0]
140075cea: lea       rdx, [rbp + 0x110]
140075cf1: mov       r8d, 0x180
140075cf7: mov       rcx, rdi
140075cfa: call      0x145bfa0e7
140075cff: mov       dword ptr [rbp + 0x470], 0x1389
140075d09: mov       qword ptr [rbp + 0x478], 0x20
140075d14: mov       qword ptr [rbp + 0x480], rsi
140075d1b: mov       qword ptr [rbp + 0x488], 0x20
140075d26: mov       qword ptr [rbp + 0x490], 0
140075d31: mov       qword ptr [rbp + 0x498], 4
140075d3c: mov       qword ptr [rbp + 0x4a0], 0
140075d47: mov       byte ptr [rbp + 0x4a8], r12b
140075d4e: mov       eax, dword ptr [rbp + 0x538]
140075d54: mov       ecx, dword ptr [rbp + 0x53b]
140075d5a: mov       dword ptr [rbp + 0x4a9], eax
140075d60: mov       dword ptr [rbp + 0x4ac], ecx
140075d66: mov       qword ptr [rbp + 0x4b0], r14
140075d6d: mov       qword ptr [rbp + 0x4b8], r15
140075d74: mov       dword ptr [rbp + 0x4c0], 0x41400000
140075d7e: mov       word ptr [rbp + 0x4c4], 0x190
140075d87: mov       byte ptr [rbp + 0x4c6], 1
140075d8e: movups    xmm0, xmmword ptr [rbp + 0x518]
140075d95: movups    xmmword ptr [rbp + 0x4c7], xmm0
140075d9c: mov       rax, qword ptr [rbp + 0x525]
140075da3: mov       qword ptr [rbp + 0x4d4], rax
140075daa: mov       r14d, dword ptr [rip + 0x5d5fcef]
140075db1: mov       dword ptr [rbp + 0x4ec], r14d
140075db8: movups    xmm12, xmmword ptr [rip + 0x5d5fcd0]
140075dc0: movups    xmmword ptr [rbp + 0x4dc], xmm12
140075dc8: movsd     xmm13, qword ptr [rip + 0x5d276cf]
140075dd1: movsd     qword ptr [rbp + 0x4f0], xmm13
140075dda: mov       byte ptr [rbp + 0x577], 0
140075de1: lea       r9, [rip + 0x5d58fe8]
140075de8: lea       rcx, [rbp + 0x110]
140075def: lea       rdx, [rbp - 0x40]
140075df3: mov       r8, rdi
140075df6: call      0x1401f69a0
140075dfb: nop
140075dfc: mov       word ptr [rbp + 0x274], 0
140075e05: mov       byte ptr [rbp + 0x264], 1
140075e0c: movaps    xmm0, xmmword ptr [rip + 0x5d5726d]
140075e13: movups    xmmword ptr [rbp + 0x178], xmm0
140075e1a: movaps    xmm0, xmmword ptr [rip + 0x5d2768f]
140075e21: movups    xmmword ptr [rbp + 0x188], xmm0
140075e28: mov       qword ptr [rbp + 0x170], 0
140075e33: xorps     xmm0, xmm0
140075e36: movups    xmmword ptr [rbp + 0x198], xmm0
140075e3d: movups    xmmword ptr [rbp + 0x1a8], xmm0
140075e44: movups    xmmword ptr [rbp + 0x1b8], xmm0
140075e4b: mov       dword ptr [rbp + 0x288], 0
140075e55: mov       word ptr [rbp + 0x28c], 0
140075e5e: movups    xmm0, xmmword ptr [rip + 0x5d58a9b]
140075e65: movups    xmmword ptr [rbp + 0x1d8], xmm0
140075e6c: movups    xmm0, xmmword ptr [rip + 0x5d58a7d]
140075e73: movups    xmmword ptr [rbp + 0x1c8], xmm0
140075e7a: movups    xmm0, xmmword ptr [rip + 0x5d58a8f]
140075e81: movups    xmmword ptr [rbp + 0x1e8], xmm0
140075e88: movups    xmm0, xmmword ptr [rip + 0x5d58a91]
140075e8f: movups    xmmword ptr [rbp + 0x1f8], xmm0
140075e96: movups    xmmword ptr [rbp + 0x218], xmm14
140075e9e: movups    xmmword ptr [rbp + 0x208], xmm7
140075ea5: movups    xmmword ptr [rbp + 0x238], xmm9
140075ead: movups    xmmword ptr [rbp + 0x228], xmm10
140075eb5: mov       byte ptr [rbp + 0x286], 0
140075ebc: mov       dword ptr [rbp + 0x282], 0x100
140075ec6: mov       qword ptr [rbp + 0x268], 0
140075ed1: mov       dword ptr [rbp + 0x270], 0x3f800000
140075edb: movups    xmmword ptr [rbp + 0x248], xmm15
140075ee3: mov       dword ptr [rbp + 0x258], 1
140075eed: mov       qword ptr [rbp + 0x25c], 0
140075ef8: mov       byte ptr [rbp + 0x287], 0
140075eff: movaps    xmmword ptr [rbp + 0x110], xmm6
140075f06: mov       qword ptr [rbp + 0x120], 0
140075f11: movups    xmm0, xmmword ptr [rip + 0x5d58938]
140075f18: movups    xmmword ptr [rbp + 0x128], xmm0
140075f1f: mov       qword ptr [rbp + 0x138], 0
140075f2a: movaps    xmmword ptr [rbp + 0x140], xmm8
140075f32: mov       qword ptr [rbp + 0x150], 0
140075f3d: movups    xmm0, xmmword ptr [rip + 0x5d5893c]
140075f44: movups    xmmword ptr [rbp + 0x158], xmm0
140075f4b: mov       qword ptr [rbp + 0x168], 0
140075f56: mov       word ptr [rbp + 0x27a], 0
140075f5f: mov       dword ptr [rbp + 0x276], 0x10000
140075f69: mov       word ptr [rbp + 0x280], 0
140075f72: mov       dword ptr [rbp + 0x27c], 0x10000
140075f7c: lea       rax, [rip + 0x5d58e95]
140075f83: mov       qword ptr [rbp + 0x2d8], rax
140075f8a: mov       qword ptr [rbp + 0x2e0], 8
140075f95: lea       rax, [rip + 0x5d58e8c]
140075f9c: mov       qword ptr [rbp + 0x2f0], rax
140075fa3: lea       rax, [rip - 0x73eea]
140075faa: mov       qword ptr [rbp + 0x2f8], rax
140075fb1: lea       rcx, [rbp + 0x2d8]
140075fb8: mov       qword ptr [rbp + 0x300], rcx
140075fbf: mov       qword ptr [rbp + 0x308], rax
140075fc6: lea       rdx, [rip + 0x5d58e6b]
140075fcd: lea       rcx, [rbp + 0x518]
140075fd4: lea       r8, [rbp + 0x2f0]
140075fdb: call      0x145bcce30
140075fe0: nop
140075fe1: cmp       byte ptr [rbx], 1
140075fe4: jne       0x140076005
140075fe6: mov       eax, dword ptr [rbx + 1]
140075fe9: mov       ecx, dword ptr [rbx + 4]
140075fec: mov       dword ptr [rbp + 0x533], ecx
140075ff2: mov       dword ptr [rbp + 0x530], eax
140075ff8: mov       rdi, qword ptr [rbx + 8]
140075ffc: movzx     ebx, byte ptr [rbx + 0x10]
140076000: mov       r15b, 1
140076003: jmp       0x140076016
140076005: mov       rdi, qword ptr [rbx + 8]
140076009: lock inc  qword ptr [rdi]
14007600d: jle       0x140076222
140076013: xor       r15d, r15d
140076016: mov       rax, qword ptr [rbp + 0x528]
14007601d: mov       qword ptr [rbp + 0x488], rax
140076024: movups    xmm0, xmmword ptr [rbp + 0x518]
14007602b: movups    xmmword ptr [rbp + 0x478], xmm0
140076032: movups    xmmword ptr [rbp + 0x2d9], xmm11
14007603a: mov       dword ptr [rbp + 0x2e9], 0x3f800000
140076044: lea       rsi, [rbp + 0x2f0]
14007604b: lea       rdx, [rbp + 0x110]
140076052: mov       r8d, 0x180
140076058: mov       rcx, rsi
14007605b: call      0x145bfa0e7
140076060: mov       dword ptr [rbp + 0x470], 0x1389
14007606a: mov       qword ptr [rbp + 0x490], 0
140076075: mov       qword ptr [rbp + 0x498], 4
140076080: mov       qword ptr [rbp + 0x4a0], 0
14007608b: mov       byte ptr [rbp + 0x4a8], r15b
140076092: mov       eax, dword ptr [rbp + 0x530]
140076098: mov       ecx, dword ptr [rbp + 0x533]
14007609e: mov       dword ptr [rbp + 0x4a9], eax
1400760a4: mov       dword ptr [rbp + 0x4ac], ecx
1400760aa: mov       qword ptr [rbp + 0x4b0], rdi
1400760b1: mov       qword ptr [rbp + 0x4b8], rbx
1400760b8: mov       dword ptr [rbp + 0x4c0], 0x41400000
1400760c2: mov       word ptr [rbp + 0x4c4], 0x190
1400760cb: mov       byte ptr [rbp + 0x4c6], 1
1400760d2: movups    xmm0, xmmword ptr [rbp + 0x2d8]
1400760d9: movups    xmmword ptr [rbp + 0x4c7], xmm0
1400760e0: mov       rax, qword ptr [rbp + 0x2e5]
1400760e7: mov       qword ptr [rbp + 0x4d4], rax
1400760ee: mov       dword ptr [rbp + 0x4ec], r14d
1400760f5: movups    xmmword ptr [rbp + 0x4dc], xmm12
1400760fd: movsd     qword ptr [rbp + 0x4f0], xmm13
140076106: mov       byte ptr [rbp + 0x577], 0
14007610d: lea       r9, [rip + 0x5d58cd4]
140076114: lea       rcx, [rbp + 0x110]
14007611b: lea       rdx, [rbp - 0x40]
14007611f: mov       r8, rsi
140076122: call      0x1401f69a0
140076127: nop
140076128: cmp       byte ptr [rbp + 0x568], 0
14007612f: je        0x14007616d
140076131: mov       rdx, qword ptr [rbp + 0x298]
140076138: test      rdx, rdx
14007613b: je        0x14007614f
14007613d: mov       rcx, qword ptr [rbp + 0x2a0]
140076144: mov       r8d, 1
14007614a: call      0x1400021d0
14007614f: mov       rdx, qword ptr [rbp + 0x2b0]
140076156: test      rdx, rdx
140076159: je        0x14007616d
14007615b: mov       rcx, qword ptr [rbp + 0x2b8]
140076162: mov       r8d, 1
140076168: call      0x1400021d0
14007616d: movaps    xmm6, xmmword ptr [rbp + 0x580]
140076174: movaps    xmm7, xmmword ptr [rbp + 0x590]
14007617b: movaps    xmm8, xmmword ptr [rbp + 0x5a0]
140076183: movaps    xmm9, xmmword ptr [rbp + 0x5b0]
14007618b: movaps    xmm10, xmmword ptr [rbp + 0x5c0]
140076193: movaps    xmm11, xmmword ptr [rbp + 0x5d0]
14007619b: movaps    xmm12, xmmword ptr [rbp + 0x5e0]
1400761a3: movaps    xmm13, xmmword ptr [rbp + 0x5f0]
1400761ab: movaps    xmm14, xmmword ptr [rbp + 0x600]
1400761b3: movaps    xmm15, xmmword ptr [rbp + 0x610]
1400761bb: add       rsp, 0x6a8
1400761c2: pop       rbx
1400761c3: pop       rdi
1400761c4: pop       rsi
1400761c5: pop       r12
1400761c7: pop       r13
1400761c9: pop       r14
1400761cb: pop       r15
1400761cd: pop       rbp
1400761ce: ret
1400761cf: movups    xmm0, xmmword ptr [rbp + 0x518]
1400761d6: movaps    xmmword ptr [rbp + 0x2f0], xmm0
1400761dd: mov       byte ptr [rbp + 0x576], 0
1400761e4: lea       rax, [rip + 0x5d57cdd]
1400761eb: mov       qword ptr [rsp + 0x20], rax
1400761f0: lea       rcx, [rip + 0x5d58321]
1400761f7: lea       r9, [rip + 0x5d5834a]
1400761fe: lea       r8, [rbp + 0x2f0]
140076205: mov       edx, 0x2b
14007620a: call      0x145d995d0
14007620f: nop
140076210: jmp       0x140076222
140076212: mov       ecx, 1
140076217: mov       edx, 0x20
14007621c: call      0x145d992bb
140076221: nop
140076222: ud2
