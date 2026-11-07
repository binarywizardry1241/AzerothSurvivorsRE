140c039d0: push      rbp
140c039d1: push      r15
140c039d3: push      r14
140c039d5: push      r12
140c039d7: push      rsi
140c039d8: push      rdi
140c039d9: push      rbx
140c039da: sub       rsp, 0x2c0
140c039e1: lea       rbp, [rsp + 0x80]
140c039e9: movaps    xmmword ptr [rbp + 0x230], xmm7
140c039f0: movaps    xmmword ptr [rbp + 0x220], xmm6
140c039f7: mov       qword ptr [rbp + 0x218], 0xfffffffffffffffe
140c03a02: mov       rax, qword ptr [rbp + 0x2a0]
140c03a09: mov       rcx, qword ptr [rdx + 0x20]
140c03a0d: mov       qword ptr [rbp + 0x1a0], rcx
140c03a14: movups    xmm0, xmmword ptr [rdx]
140c03a17: movups    xmm1, xmmword ptr [rdx + 0x10]
140c03a1b: movaps    xmmword ptr [rbp + 0x190], xmm1
140c03a22: movaps    xmmword ptr [rbp + 0x180], xmm0
140c03a29: movups    xmm0, xmmword ptr [r8]
140c03a2d: movups    xmm1, xmmword ptr [r8 + 0x10]
140c03a32: movups    xmmword ptr [rbp + 0x1b8], xmm1
140c03a39: movups    xmmword ptr [rbp + 0x1a8], xmm0
140c03a40: mov       rcx, qword ptr [r9 + 0x10]
140c03a44: mov       qword ptr [rbp + 0x1d8], rcx
140c03a4b: movups    xmm0, xmmword ptr [r9]
140c03a4f: movups    xmmword ptr [rbp + 0x1c8], xmm0
140c03a56: movups    xmm0, xmmword ptr [rax]
140c03a59: movups    xmm1, xmmword ptr [rax + 0x10]
140c03a5d: movaps    xmmword ptr [rbp + 0x1e0], xmm0
140c03a64: movaps    xmmword ptr [rbp + 0x1f0], xmm1
140c03a6b: mov       rdi, qword ptr [rbp + 0x1e0]
140c03a72: movups    xmm0, xmmword ptr [rbp + 0x1c8]
140c03a79: movaps    xmmword ptr [rbp + 0xa0], xmm0
140c03a80: mov       rax, qword ptr [rbp + 0x1d8]
140c03a87: mov       qword ptr [rbp + 0xb0], rax
140c03a8e: lea       rcx, [rbp - 0x40]
140c03a92: lea       rsi, [rbp + 0xa0]
140c03a99: mov       rdx, rsi
140c03a9c: call      0x1400bfb90
140c03aa1: cmp       byte ptr [rbp - 0x40], 0
140c03aa5: je        0x140c03ab8
140c03aa7: mov       r15d, 0x500
140c03aad: mov       r12d, 0x2d0
140c03ab3: jmp       0x140c03bbd
140c03ab8: mov       rax, qword ptr [rbp - 0x38]
140c03abc: mov       ecx, dword ptr [rax + 0xc0]
140c03ac2: cmp       ecx, 1
140c03ac5: adc       ecx, 0
140c03ac8: mov       eax, dword ptr [rax + 0xc4]
140c03ace: cmp       eax, 1
140c03ad1: adc       eax, 0
140c03ad4: movss     xmm0, dword ptr [rip + 0x51c93a8]
140c03adc: maxss     xmm0, dword ptr [rdi]
140c03ae0: movss     xmm1, dword ptr [rip + 0x51999e0]
140c03ae8: minss     xmm1, xmm0
140c03aec: xorps     xmm0, xmm0
140c03aef: cvtsi2ss  xmm0, rcx
140c03af4: movss     xmm2, dword ptr [rip + 0x533a3a4]
140c03afc: movaps    xmm3, xmm2
140c03aff: divss     xmm3, xmm0
140c03b03: movaps    xmm4, xmm1
140c03b06: minss     xmm4, xmm3
140c03b0a: movaps    xmm3, xmm4
140c03b0d: cmpunordss xmm3, xmm4
140c03b12: movaps    xmm5, xmm3
140c03b15: andnps    xmm5, xmm4
140c03b18: xorps     xmm4, xmm4
140c03b1b: cvtsi2ss  xmm4, rax
140c03b20: andps     xmm3, xmm1
140c03b23: orps      xmm3, xmm5
140c03b26: divss     xmm2, xmm4
140c03b2a: movaps    xmm1, xmm3
140c03b2d: minss     xmm1, xmm2
140c03b31: movaps    xmm6, xmm1
140c03b34: cmpunordss xmm6, xmm1
140c03b39: andps     xmm3, xmm6
140c03b3c: andnps    xmm6, xmm1
140c03b3f: orps      xmm6, xmm3
140c03b42: mulss     xmm0, xmm6
140c03b46: mulss     xmm6, xmm4
140c03b4a: call      0x145bfa10b
140c03b4f: movaps    xmm7, xmm0
140c03b52: movaps    xmm0, xmm6
140c03b55: call      0x145bfa10b
140c03b5a: cvttss2si r15, xmm7
140c03b5f: xor       eax, eax
140c03b61: xorps     xmm1, xmm1
140c03b64: ucomiss   xmm7, xmm1
140c03b67: cmovb     r15d, eax
140c03b6b: movss     xmm2, dword ptr [rip + 0x51cf2cd]
140c03b73: ucomiss   xmm7, xmm2
140c03b76: mov       ecx, 0xffffffff
140c03b7b: cmova     r15d, ecx
140c03b7f: cvttss2si r12, xmm0
140c03b84: ucomiss   xmm0, xmm1
140c03b87: cmovb     r12d, eax
140c03b8b: ucomiss   xmm0, xmm2
140c03b8e: cmova     r12d, ecx
140c03b92: cmp       r15d, 1
140c03b96: adc       r15d, 0
140c03b9a: cmp       r12d, 1
140c03b9e: adc       r12d, 0
140c03ba2: cmp       r15d, 0x2000
140c03ba9: mov       eax, 0x2000
140c03bae: cmovae    r15d, eax
140c03bb2: cmp       r12d, 0x2000
140c03bb9: cmovae    r12d, eax
140c03bbd: mov       eax, dword ptr [rbp + 0x1c4]
140c03bc3: mov       rcx, qword ptr [rbp + 0x1b8]
140c03bca: mov       dword ptr [rcx], eax
140c03bcc: mov       rdi, qword ptr [rbp + 0x1a8]
140c03bd3: mov       dword ptr [rbp + 0x204], r15d
140c03bda: mov       dword ptr [rbp + 0x208], r12d
140c03be1: mov       dword ptr [rbp + 0x20c], 1
140c03beb: mov       dword ptr [rbp + 0xa0], 0
140c03bf5: mov       qword ptr [rsp + 0x28], rsi
140c03bfa: mov       byte ptr [rsp + 0x30], 2
140c03bff: mov       qword ptr [rsp + 0x20], 1
140c03c08: lea       r9, [rip + 0x533cd03]
140c03c0f: lea       rcx, [rbp - 0x40]
140c03c13: lea       rdx, [rbp + 0x204]
140c03c1a: mov       r8d, 1
140c03c20: call      0x1448c6780
140c03c25: mov       dword ptr [rbp + 0x84], 0x10
140c03c2f: mov       rcx, qword ptr [rdi + 0x50]
140c03c33: add       rcx, 0x10
140c03c37: mov       byte ptr [rbp + 0x217], 1
140c03c3e: call      0x144962cc0
140c03c43: nop
140c03c44: mov       ebx, eax
140c03c46: mov       r14d, edx
140c03c49: lea       rdx, [rbp - 0x40]
140c03c4d: mov       r8d, 0xe0
140c03c53: mov       rcx, rsi
140c03c56: call      0x145bfa0e7
140c03c5b: mov       byte ptr [rbp + 0x217], 0
140c03c62: mov       qword ptr [rsp + 0x20], rsi
140c03c67: lea       rcx, [rbp + 0x204]
140c03c6e: mov       rdx, rdi
140c03c71: mov       r8d, ebx
140c03c74: mov       r9d, r14d
140c03c77: call      0x140a24af0
140c03c7c: nop
140c03c7d: cmp       dword ptr [rbp + 0x204], 2
140c03c84: jne       0x140c03d11
140c03c8a: mov       qword ptr [rbp + 0xa0], 0xffffffffffffffff
140c03c95: mov       byte ptr [rbp + 0x217], 0
140c03c9c: mov       qword ptr [rsp + 0x20], rsi
140c03ca1: mov       qword ptr [rsp + 0x28], 0
140c03caa: mov       rcx, rdi
140c03cad: mov       edx, ebx
140c03caf: mov       r8d, r14d
140c03cb2: xor       r9d, r9d
140c03cb5: call      0x144975840
140c03cba: nop
140c03cbb: mov       byte ptr [rbp + 0xa0], 0
140c03cc2: mov       qword ptr [rbp + 0xa8], rax
140c03cc9: mov       byte ptr [rbp + 0xb8], 2
140c03cd0: mov       dword ptr [rbp + 0xd0], r15d
140c03cd7: mov       dword ptr [rbp + 0xd4], r12d
140c03cde: lea       rcx, [rbp + 0x180]
140c03ce5: lea       rdx, [rbp + 0xa0]
140c03cec: call      0x1408e4c80
140c03cf1: movaps    xmm6, xmmword ptr [rbp + 0x220]
140c03cf8: movaps    xmm7, xmmword ptr [rbp + 0x230]
140c03cff: add       rsp, 0x2c0
140c03d06: pop       rbx
140c03d07: pop       rdi
140c03d08: pop       rsi
140c03d09: pop       r12
140c03d0b: pop       r14
140c03d0d: pop       r15
140c03d0f: pop       rbp
140c03d10: ret
140c03d11: movups    xmm0, xmmword ptr [rbp + 0x204]
140c03d18: movaps    xmmword ptr [rbp + 0xa0], xmm0
140c03d1f: mov       byte ptr [rbp + 0x217], 0
140c03d26: lea       rax, [rip + 0x533aeab]
140c03d2d: mov       qword ptr [rsp + 0x20], rax
140c03d32: lea       rcx, [rip + 0x533c468]
140c03d39: lea       r9, [rip + 0x533c4f0]
140c03d40: lea       r8, [rbp + 0xa0]
140c03d47: mov       edx, 0x2b
140c03d4c: call      0x145d995d0
140c03d51: nop
140c03d52: ud2
