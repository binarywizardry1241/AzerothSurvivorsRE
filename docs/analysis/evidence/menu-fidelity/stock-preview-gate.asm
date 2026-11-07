140bd69b0: push      rbp
140bd69b1: push      r15
140bd69b3: push      r14
140bd69b5: push      r13
140bd69b7: push      r12
140bd69b9: push      rsi
140bd69ba: push      rdi
140bd69bb: push      rbx
140bd69bc: sub       rsp, 0x728
140bd69c3: lea       rbp, [rsp + 0x80]
140bd69cb: movaps    xmmword ptr [rbp + 0x690], xmm11
140bd69d3: movaps    xmmword ptr [rbp + 0x680], xmm10
140bd69db: movaps    xmmword ptr [rbp + 0x670], xmm9
140bd69e3: movaps    xmmword ptr [rbp + 0x660], xmm8
140bd69eb: movaps    xmmword ptr [rbp + 0x650], xmm7
140bd69f2: movaps    xmmword ptr [rbp + 0x640], xmm6
140bd69f9: mov       qword ptr [rbp + 0x638], 0xfffffffffffffffe
140bd6a04: mov       r14, qword ptr [rbp + 0x750]
140bd6a0b: cmp       byte ptr [r14 + 0x48], 1
140bd6a10: jne       0x140bd9872
140bd6a16: mov       rbx, qword ptr [rcx]
140bd6a19: test      rbx, rbx
140bd6a1c: je        0x140bd9872
140bd6a22: mov       qword ptr [rbp + 0x560], r9
140bd6a29: mov       rsi, rdx
140bd6a2c: mov       qword ptr [rbp + 0x5b0], r8
140bd6a33: mov       rax, qword ptr [rbp + 0x740]
140bd6a3a: mov       r13, qword ptr [rcx + 0x10]
140bd6a3e: mov       ecx, dword ptr [rcx + 0x1c]
140bd6a41: mov       dword ptr [rbp + 0x5c8], ecx
140bd6a47: mov       rcx, rax
140bd6a4a: mov       rdx, rbx
140bd6a4d: call      0x141197d80
140bd6a52: mov       rdi, rax
140bd6a55: mov       r15, rax
140bd6a58: call      0x140811b40
140bd6a5d: test      al, al
140bd6a5f: je        0x140bd6bc0
140bd6a65: mov       rcx, rbx
140bd6a68: call      0x145019270
140bd6a6d: test      al, al
140bd6a6f: je        0x140bd6bc0
140bd6a75: mov       rax, qword ptr [rbp + 0x5b0]
140bd6a7c: mov       rsi, qword ptr [rax]
140bd6a7f: cmp       qword ptr [rsi + 0x10], 0
140bd6a84: je        0x140bd6aaa
140bd6a86: mov       edi, dword ptr [rax + 0x1c]
140bd6a89: mov       rbx, qword ptr [rax + 0x10]
140bd6a8d: mov       dword ptr [rbx], edi
140bd6a8f: mov       rcx, qword ptr [rsi + 8]
140bd6a93: mov       rdx, qword ptr [rsi + 0x10]
140bd6a97: mov       qword ptr [rsi + 0x10], 0
140bd6a9f: call      0x140ad9d70
140bd6aa4: mov       dword ptr [rbx], edi
140bd6aa6: mov       byte ptr [rsi + 0x48], 1
140bd6aaa: mov       qword ptr [rbp + 0x220], 0
140bd6ab5: mov       qword ptr [rbp + 0x228], 0x10
140bd6ac0: mov       qword ptr [rbp + 0x230], 0
140bd6acb: call      0x145ba3770
140bd6ad0: nop
140bd6ad1: mov       rsi, rax
140bd6ad4: cmp       byte ptr [rax + 0x10], 1
140bd6ad8: jne       0x140bd9dc2
140bd6ade: mov       rcx, qword ptr [rsi]
140bd6ae1: mov       rax, qword ptr [rsi + 8]
140bd6ae5: mov       qword ptr [rbp + 0x620], rax
140bd6aec: mov       qword ptr [rbp + 0x5f0], rcx
140bd6af3: lea       rax, [rcx + 1]
140bd6af7: mov       qword ptr [rsi], rax
140bd6afa: mov       rax, qword ptr [rbp + 0x230]
140bd6b01: mov       qword ptr [rbp + 0x3f8], rax
140bd6b08: movups    xmm0, xmmword ptr [rbp + 0x220]
140bd6b0f: movups    xmmword ptr [rbp + 0x3e8], xmm0
140bd6b16: mov       rcx, r15
140bd6b19: mov       qword ptr [rbp + 0x610], r15
140bd6b20: call      0x140b72640
140bd6b25: nop
140bd6b26: mov       rcx, qword ptr [rbp + 0x610]
140bd6b2d: mov       qword ptr [rcx], 0
140bd6b34: movups    xmm0, xmmword ptr [rbp + 0x3e0]
140bd6b3b: movups    xmm1, xmmword ptr [rbp + 0x3f0]
140bd6b42: movups    xmmword ptr [rcx + 8], xmm0
140bd6b46: movups    xmmword ptr [rcx + 0x18], xmm1
140bd6b4a: mov       qword ptr [rcx + 0x28], 0
140bd6b52: mov       qword ptr [rcx + 0x30], 4
140bd6b5a: xorps     xmm0, xmm0
140bd6b5d: movups    xmmword ptr [rcx + 0x38], xmm0
140bd6b61: mov       qword ptr [rcx + 0x48], 0x10
140bd6b69: mov       qword ptr [rcx + 0x50], 0
140bd6b71: mov       qword ptr [rcx + 0x58], 0xffffffffffffffff
140bd6b79: movups    xmm0, xmmword ptr [rip + 0x5368a90]
140bd6b80: movups    xmmword ptr [rcx + 0xa0], xmm0
140bd6b87: movups    xmm0, xmmword ptr [rip + 0x5368a92]
140bd6b8e: movups    xmmword ptr [rcx + 0xb0], xmm0
140bd6b95: mov       rax, qword ptr [rbp + 0x5f0]
140bd6b9c: mov       qword ptr [rcx + 0xc0], rax
140bd6ba3: mov       rax, qword ptr [rbp + 0x620]
140bd6baa: mov       qword ptr [rcx + 0xc8], rax
140bd6bb1: mov       dword ptr [rcx + 0xd0], 0
140bd6bbb: jmp       0x140bd9872
140bd6bc0: movups    xmm0, xmmword ptr [rsi]
140bd6bc3: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd6bca: mov       rax, qword ptr [rsi + 0x10]
140bd6bce: mov       qword ptr [rbp + 0x3f0], rax
140bd6bd5: lea       rcx, [rbp + 0x220]
140bd6bdc: lea       rdx, [rbp + 0x3e0]
140bd6be3: call      0x1400bfb90
140bd6be8: cmp       byte ptr [rbp + 0x220], 0
140bd6bef: jne       0x140bd9872
140bd6bf5: mov       qword ptr [rbp + 0x5d0], rdi
140bd6bfc: mov       qword ptr [rbp + 0x610], r15
140bd6c03: mov       rcx, qword ptr [rbp + 0x228]
140bd6c0a: lea       rax, [rcx + 0xc8]
140bd6c11: cmp       byte ptr [rcx + 0xb8], 0
140bd6c18: lea       rdx, [rcx + 0xbc]
140bd6c1f: mov       qword ptr [rbp + 0x198], rax
140bd6c26: mov       qword ptr [rbp + 0x38], rdx
140bd6c2a: cmovne    rax, rdx
140bd6c2e: mov       qword ptr [rbp + 0x598], rcx
140bd6c35: movsd     xmm7, qword ptr [rcx + 0xc0]
140bd6c3d: movss     xmm8, dword ptr [rax]
140bd6c42: movsd     xmm6, qword ptr [r14 + 0x40]
140bd6c48: mov       rcx, qword ptr [r14]
140bd6c4b: mov       rax, qword ptr [r14 + 8]
140bd6c4f: mov       rsi, qword ptr [r14 + 0x18]
140bd6c53: mov       r15, qword ptr [r14 + 0x10]
140bd6c57: mov       qword ptr [rbp + 0x180], rax
140bd6c5e: mov       qword ptr [rbp + 0xd8], rax
140bd6c65: mov       qword ptr [rbp + 0x188], rcx
140bd6c6c: mov       qword ptr [rbp + 0xd0], rcx
140bd6c73: mov       qword ptr [rbp + 0xc0], r15
140bd6c7a: mov       qword ptr [rbp + 0xc8], rsi
140bd6c81: mov       rax, qword ptr [r14 + 0x30]
140bd6c85: mov       qword ptr [rbp + 0x370], rax
140bd6c8c: mov       rax, qword ptr [r14 + 0x38]
140bd6c90: mov       qword ptr [rbp + 0x190], rax
140bd6c97: mov       eax, dword ptr [rip + 0x746fb73]
140bd6c9d: test      eax, eax
140bd6c9f: jne       0x140bd9d83
140bd6ca5: mov       r12, qword ptr [rbp + 0x730]
140bd6cac: movzx     edi, byte ptr [rip + 0x746fb61]
140bd6cb3: test      dil, dil
140bd6cb6: mov       qword ptr [rbp + 0x178], r15
140bd6cbd: jne       0x140bd6cc6
140bd6cbf: cmp       byte ptr [r12], 1
140bd6cc4: jne       0x140bd6ccf
140bd6cc6: call      0x145ba4280
140bd6ccb: mov       cl, 1
140bd6ccd: jmp       0x140bd6cd6
140bd6ccf: mov       edx, 0xffffffff
140bd6cd4: xor       ecx, ecx
140bd6cd6: mov       r8, qword ptr [rbp + 0x748]
140bd6cdd: mov       dword ptr [rbp + 0x5ac], ecx
140bd6ce3: mov       byte ptr [rbp + 0x578], cl
140bd6ce9: mov       qword ptr [rbp + 0x568], rax
140bd6cf0: mov       dword ptr [rbp + 0x570], edx
140bd6cf6: mov       rcx, qword ptr [rbp + 0x718]
140bd6cfd: mov       r15, qword ptr [rcx]
140bd6d00: test      r15, r15
140bd6d03: sete      al
140bd6d06: mov       dword ptr [rbp + 0x5f8], eax
140bd6d0c: mov       qword ptr [rbp + 0x600], rbx
140bd6d13: je        0x140bd6d66
140bd6d15: mov       eax, dword ptr [rcx + 0x1c]
140bd6d18: mov       rcx, qword ptr [rcx + 0x10]
140bd6d1c: mov       dword ptr [rcx], eax
140bd6d1e: mov       eax, dword ptr [rbp + 0x5c8]
140bd6d24: mov       dword ptr [r13], eax
140bd6d28: mov       eax, dword ptr [r8 + 0x1c]
140bd6d2c: mov       rcx, qword ptr [r8 + 0x10]
140bd6d30: mov       dword ptr [rcx], eax
140bd6d32: mov       r9, qword ptr [r8]
140bd6d35: movzx     eax, byte ptr [r12]
140bd6d3a: mov       byte ptr [rsp + 0x20], al
140bd6d3e: mov       rcx, rbx
140bd6d41: mov       rdx, r15
140bd6d44: movaps    xmm2, xmm6
140bd6d47: call      0x140be7730
140bd6d4c: mov       ebx, eax
140bd6d4e: xor       bl, 1
140bd6d51: mov       rax, qword ptr [rip + 0x74a6250]
140bd6d58: mov       rax, qword ptr [rax]
140bd6d5b: cmp       rax, 2
140bd6d5f: jbe       0x140bd6d7c
140bd6d61: jmp       0x140bd6e0c
140bd6d66: mov       bl, 1
140bd6d68: mov       rax, qword ptr [rip + 0x74a6239]
140bd6d6f: mov       rax, qword ptr [rax]
140bd6d72: cmp       rax, 2
140bd6d76: ja        0x140bd6e0c
140bd6d7c: movzx     edx, byte ptr [rip + 0x746f9cd]
140bd6d83: movzx     eax, dl
140bd6d86: lea       ecx, [rax - 1]
140bd6d89: cmp       ecx, 2
140bd6d8c: jae       0x140bd6e04
140bd6d8e: mov       rcx, qword ptr [rip + 0x746f9ab]
140bd6d95: call      0x144c5d8d0
140bd6d9a: test      al, al
140bd6d9c: je        0x140bd6e0c
140bd6d9e: mov       rdx, qword ptr [rip + 0x746f99b]
140bd6da5: lea       rax, [rdx + 0x30]
140bd6da9: mov       qword ptr [rbp + 0x3e0], 1
140bd6db4: mov       qword ptr [rbp + 0x3e8], 8
140bd6dbf: mov       qword ptr [rbp + 0x3f0], 0
140bd6dca: mov       qword ptr [rbp + 0x3f8], rax
140bd6dd1: lea       rcx, [rbp + 0x98]
140bd6dd8: lea       r8, [rbp + 0x3e0]
140bd6ddf: call      0x144c5d660
140bd6de4: cmp       qword ptr [rbp + 0x98], 2
140bd6dec: je        0x140bd6e22
140bd6dee: lea       rdx, [rbp + 0xb0]
140bd6df5: lea       rcx, [rbp + 0x98]
140bd6dfc: call      0x144c5f310
140bd6e01: nop
140bd6e02: jmp       0x140bd6e22
140bd6e04: test      eax, eax
140bd6e06: jne       0x140bd9f64
140bd6e0c: mov       qword ptr [rbp + 0x98], 2
140bd6e17: mov       qword ptr [rbp + 0xb8], 0
140bd6e22: mov       qword ptr [rbp + 0x170], rsi
140bd6e29: mov       rax, qword ptr [rbp + 0xb8]
140bd6e30: mov       qword ptr [rbp + 0x400], rax
140bd6e37: mov       rax, qword ptr [rbp + 0x98]
140bd6e3e: mov       rcx, qword ptr [rbp + 0xa0]
140bd6e45: movups    xmm0, xmmword ptr [rbp + 0xa8]
140bd6e4c: movaps    xmmword ptr [rbp + 0x3f0], xmm0
140bd6e53: mov       qword ptr [rbp + 0x3e0], rax
140bd6e5a: mov       qword ptr [rbp + 0x3e8], rcx
140bd6e61: mov       eax, dword ptr [rbp + 0x5c8]
140bd6e67: mov       dword ptr [r13], eax
140bd6e6b: mov       rcx, qword ptr [rbp + 0x600]
140bd6e72: call      0x145019140
140bd6e77: nop
140bd6e78: mov       rsi, qword ptr [rbp + 0x3e0]
140bd6e7f: cmp       rsi, 2
140bd6e83: je        0x140bd6ecb
140bd6e85: lea       rdx, [rbp + 0x3f8]
140bd6e8c: lea       rcx, [rbp + 0x3e0]
140bd6e93: call      0x144c5f2e0
140bd6e98: nop
140bd6e99: mov       rdx, qword ptr [rbp + 0x3f8]
140bd6ea0: lea       rcx, [rbp + 0x3e0]
140bd6ea7: call      0x144c5f340
140bd6eac: nop
140bd6ead: test      rsi, rsi
140bd6eb0: je        0x140bd6ecb
140bd6eb2: mov       rax, qword ptr [rbp + 0x3e8]
140bd6eb9: lock dec  qword ptr [rax]
140bd6ebd: jne       0x140bd6ecb
140bd6ebf: lea       rcx, [rbp + 0x3e8]
140bd6ec6: call      0x1403e4380
140bd6ecb: mov       byte ptr [rbp + 0x5ef], dil
140bd6ed2: test      bl, bl
140bd6ed4: mov       rbx, qword ptr [rbp + 0x600]
140bd6edb: jne       0x140bd6f37
140bd6edd: mov       rcx, qword ptr [rbp + 0x718]
140bd6ee4: mov       eax, dword ptr [rcx + 0x1c]
140bd6ee7: mov       rcx, qword ptr [rcx + 0x10]
140bd6eeb: mov       dword ptr [rcx], eax
140bd6eed: mov       eax, dword ptr [rbp + 0x5c8]
140bd6ef3: mov       dword ptr [r13], eax
140bd6ef7: mov       rdx, qword ptr [rbp + 0x748]
140bd6efe: mov       eax, dword ptr [rdx + 0x1c]
140bd6f01: mov       rcx, qword ptr [rdx + 0x10]
140bd6f05: mov       dword ptr [rcx], eax
140bd6f07: mov       r9, qword ptr [rdx]
140bd6f0a: movzx     eax, byte ptr [r12]
140bd6f0f: mov       byte ptr [rsp + 0x20], al
140bd6f13: mov       rcx, rbx
140bd6f16: mov       rdx, r15
140bd6f19: movaps    xmm2, xmm6
140bd6f1c: call      0x140be7730
140bd6f21: test      al, al
140bd6f23: je        0x140bd6f37
140bd6f25: mov       eax, dword ptr [rbp + 0x5c8]
140bd6f2b: mov       dword ptr [r13], eax
140bd6f2f: mov       rcx, rbx
140bd6f32: call      0x145019140
140bd6f37: mov       rdi, qword ptr [r14 + 0x20]
140bd6f3b: mov       rsi, qword ptr [r14 + 0x28]
140bd6f3f: xor       ecx, ecx
140bd6f41: cmp       byte ptr [rbp + 0x578], 1
140bd6f48: mov       edx, 0
140bd6f4d: jne       0x140bd6fb3
140bd6f4f: call      0x145ba4280
140bd6f54: mov       rcx, qword ptr [rbp + 0x568]
140bd6f5b: mov       r8d, dword ptr [rbp + 0x570]
140bd6f62: mov       qword ptr [rbp + 0x568], rax
140bd6f69: mov       dword ptr [rbp + 0x570], edx
140bd6f6f: cmp       r8d, -1
140bd6f73: je        0x140bd6faf
140bd6f75: mov       qword ptr [rbp + 0x3e0], rcx
140bd6f7c: mov       dword ptr [rbp + 0x3e8], r8d
140bd6f83: lea       rcx, [rbp + 0x3e0]
140bd6f8a: call      0x145ba43d0
140bd6f8f: mov       ecx, edx
140bd6f91: mov       edx, 0xf4240
140bd6f96: mul       rdx
140bd6f99: mov       ecx, ecx
140bd6f9b: imul      rcx, rcx, 0x10624dd3
140bd6fa2: shr       rcx, 0x26
140bd6fa6: add       rcx, rax
140bd6fa9: adc       rdx, 0
140bd6fad: jmp       0x140bd6fb3
140bd6faf: xor       ecx, ecx
140bd6fb1: xor       edx, edx
140bd6fb3: add       rcx, rdi
140bd6fb6: adc       rdx, rsi
140bd6fb9: mov       qword ptr [rbp + 0x1c0], rcx
140bd6fc0: mov       qword ptr [rbp + 0x1c8], rdx
140bd6fc7: test      r15, r15
140bd6fca: je        0x140bd6ff8
140bd6fcc: mov       rax, qword ptr [r15 + 0x38]
140bd6fd0: mov       qword ptr [rbp + 0x5f0], rax
140bd6fd7: mov       eax, 1
140bd6fdc: mov       qword ptr [rbp + 0x620], rax
140bd6fe3: mov       rax, qword ptr [rip + 0x74a5fbe]
140bd6fea: mov       rax, qword ptr [rax]
140bd6fed: cmp       rax, 2
140bd6ff1: jbe       0x140bd7017
140bd6ff3: jmp       0x140bd709e
140bd6ff8: mov       qword ptr [rbp + 0x620], 0
140bd7003: mov       rax, qword ptr [rip + 0x74a5f9e]
140bd700a: mov       rax, qword ptr [rax]
140bd700d: cmp       rax, 2
140bd7011: ja        0x140bd709e
140bd7017: movzx     edx, byte ptr [rip + 0x746f762]
140bd701e: movzx     eax, dl
140bd7021: lea       ecx, [rax - 1]
140bd7024: cmp       ecx, 2
140bd7027: jae       0x140bd7096
140bd7029: mov       rcx, qword ptr [rip + 0x746f740]
140bd7030: call      0x144c5d8d0
140bd7035: test      al, al
140bd7037: je        0x140bd709e
140bd7039: mov       rdx, qword ptr [rip + 0x746f730]
140bd7040: lea       rax, [rdx + 0x30]
140bd7044: mov       qword ptr [rbp + 0x3e0], 1
140bd704f: mov       qword ptr [rbp + 0x3e8], 8
140bd705a: mov       qword ptr [rbp + 0x3f0], 0
140bd7065: mov       qword ptr [rbp + 0x3f8], rax
140bd706c: lea       rcx, [rbp + 0x70]
140bd7070: lea       r8, [rbp + 0x3e0]
140bd7077: call      0x144c5d660
140bd707c: cmp       qword ptr [rbp + 0x70], 2
140bd7081: je        0x140bd70b1
140bd7083: lea       rdx, [rbp + 0x88]
140bd708a: lea       rcx, [rbp + 0x70]
140bd708e: call      0x144c5f310
140bd7093: nop
140bd7094: jmp       0x140bd70b1
140bd7096: test      eax, eax
140bd7098: jne       0x140bd9f7f
140bd709e: mov       qword ptr [rbp + 0x70], 2
140bd70a6: mov       qword ptr [rbp + 0x90], 0
140bd70b1: mov       rax, qword ptr [rbp + 0x90]
140bd70b8: mov       qword ptr [rbp + 0x120], rax
140bd70bf: mov       rax, qword ptr [rbp + 0x70]
140bd70c3: mov       rcx, qword ptr [rbp + 0x78]
140bd70c7: movupd    xmm0, xmmword ptr [rbp + 0x80]
140bd70cf: movapd    xmmword ptr [rbp + 0x110], xmm0
140bd70d7: mov       qword ptr [rbp + 0x100], rax
140bd70de: mov       qword ptr [rbp + 0x108], rcx
140bd70e5: mov       qword ptr [rbp + 0x3a0], 0
140bd70f0: mov       qword ptr [rbp + 0x3a8], 0x10
140bd70fb: mov       qword ptr [rbp + 0x3b0], 0
140bd7106: xorpd     xmm0, xmm0
140bd710a: movapd    xmmword ptr [rbp - 0x10], xmm0
140bd710f: mov       qword ptr [rbp + 0xe8], 0
140bd711a: mov       qword ptr [rbp + 0xf0], 8
140bd7125: mov       qword ptr [rbp + 0xf8], 0
140bd7130: test      r15, r15
140bd7133: je        0x140bd7384
140bd7139: mov       rcx, qword ptr [rbp + 0x718]
140bd7140: mov       eax, dword ptr [rcx + 0x1c]
140bd7143: mov       rcx, qword ptr [rcx + 0x10]
140bd7147: mov       dword ptr [rcx], eax
140bd7149: mov       eax, dword ptr [rbp + 0x5c8]
140bd714f: mov       dword ptr [r13], eax
140bd7153: mov       byte ptr [rbp + 0x60f], 1
140bd715a: mov       byte ptr [rbp + 0x60e], 1
140bd7161: mov       byte ptr [rbp + 0x60d], 1
140bd7168: lea       rcx, [rbp + 0x220]
140bd716f: mov       rdx, rbx
140bd7172: call      0x1450466f0
140bd7177: nop
140bd7178: cmp       qword ptr [rbp + 0x220], -1
140bd7180: je        0x140bd7384
140bd7186: movups    xmm0, xmmword ptr [rbp + 0x270]
140bd718d: movaps    xmmword ptr [rbp + 0x430], xmm0
140bd7194: movups    xmm0, xmmword ptr [rbp + 0x260]
140bd719b: movaps    xmmword ptr [rbp + 0x420], xmm0
140bd71a2: movupd    xmm0, xmmword ptr [rbp + 0x220]
140bd71aa: movups    xmm1, xmmword ptr [rbp + 0x230]
140bd71b1: movups    xmm2, xmmword ptr [rbp + 0x240]
140bd71b8: movups    xmm3, xmmword ptr [rbp + 0x250]
140bd71bf: movaps    xmmword ptr [rbp + 0x410], xmm3
140bd71c6: movaps    xmmword ptr [rbp + 0x400], xmm2
140bd71cd: movaps    xmmword ptr [rbp + 0x3f0], xmm1
140bd71d4: movapd    xmmword ptr [rbp + 0x3e0], xmm0
140bd71dc: mov       rsi, qword ptr [r15]
140bd71df: lea       rax, [rsi + 0x10]
140bd71e3: mov       qword ptr [rbp + 0x5e0], rax
140bd71ea: mov       cl, 1
140bd71ec: xor       eax, eax
140bd71ee: lock cmpxchg byte ptr [rsi + 0x10], cl
140bd71f3: jne       0x140bd9e7d
140bd71f9: mov       r12, qword ptr [rip + 0x74b37e8]
140bd7200: mov       rax, qword ptr [r12]
140bd7204: shl       rax, 1
140bd7207: test      rax, rax
140bd720a: jne       0x140bd9e8c
140bd7210: mov       dword ptr [rbp + 0x3d0], 0
140bd721a: movzx     eax, byte ptr [rsi + 0x11]
140bd721e: lea       rdx, [rsi + 0x18]
140bd7222: lea       rbx, [rbp + 0x328]
140bd7229: lea       r9, [rbp + 0x3e0]
140bd7230: mov       rcx, rbx
140bd7233: movaps    xmm2, xmm6
140bd7236: call      0x14082e110
140bd723b: nop
140bd723c: mov       rax, qword ptr [rbp + 0x328]
140bd7243: mov       qword ptr [rbp + 0x5b8], rax
140bd724a: mov       rax, qword ptr [rbp + 0x330]
140bd7251: mov       qword ptr [rbp + 0x378], rax
140bd7258: mov       rdi, qword ptr [rbp + 0x338]
140bd725f: mov       rax, qword ptr [rbp + 0x340]
140bd7266: mov       qword ptr [rbp + 0x5a0], rax
140bd726d: mov       rax, qword ptr [rbp + 0x348]
140bd7274: mov       qword ptr [rbp + 0x380], rax
140bd727b: mov       r14, qword ptr [rbp + 0x350]
140bd7282: movss     xmm9, dword ptr [rbp + 0x358]
140bd728b: cmp       byte ptr [rbp + 0x3d0], 0
140bd7292: jne       0x140bd72a4
140bd7294: mov       rax, qword ptr [r12]
140bd7298: shl       rax, 1
140bd729b: test      rax, rax
140bd729e: jne       0x140bd9eea
140bd72a4: xor       eax, eax
140bd72a6: mov       rcx, qword ptr [rbp + 0x5e0]
140bd72ad: xchg      byte ptr [rcx], al
140bd72af: cmp       al, 2
140bd72b1: je        0x140bd9eaa
140bd72b7: mov       eax, dword ptr [rbp + 0x5c8]
140bd72bd: mov       dword ptr [r13], eax
140bd72c1: mov       edx, dword ptr [rbp + 0x428]
140bd72c7: mov       r8, qword ptr [rbp + 0x420]
140bd72ce: mov       rax, qword ptr [rbp + 0x5b8]
140bd72d5: mov       qword ptr [rbp + 0x2e0], rax
140bd72dc: mov       rax, qword ptr [rbp + 0x378]
140bd72e3: mov       qword ptr [rbp + 0x2e8], rax
140bd72ea: mov       qword ptr [rbp + 0x2f0], rdi
140bd72f1: mov       rax, qword ptr [rbp + 0x5a0]
140bd72f8: mov       qword ptr [rbp + 0x328], rax
140bd72ff: mov       rax, qword ptr [rbp + 0x380]
140bd7306: mov       qword ptr [rbp + 0x330], rax
140bd730d: mov       qword ptr [rbp + 0x338], r14
140bd7314: mov       byte ptr [rbp + 0x5ee], 0
140bd731b: movss     dword ptr [rsp + 0x28], xmm9
140bd7322: mov       qword ptr [rsp + 0x20], rbx
140bd7327: lea       r9, [rbp + 0x2e0]
140bd732e: mov       rcx, qword ptr [rbp + 0x600]
140bd7335: call      0x145045920
140bd733a: nop
140bd733b: mov       rdx, qword ptr [rbp + 0x3f8]
140bd7342: cmp       rdx, -1
140bd7346: je        0x140bd735f
140bd7348: test      rdx, rdx
140bd734b: je        0x140bd735f
140bd734d: mov       rcx, qword ptr [rbp + 0x400]
140bd7354: mov       r8d, 1
140bd735a: call      0x1400021d0
140bd735f: mov       rdx, qword ptr [rbp + 0x3e0]
140bd7366: test      rdx, rdx
140bd7369: mov       rbx, qword ptr [rbp + 0x600]
140bd7370: je        0x140bd7384
140bd7372: mov       rcx, qword ptr [rbp + 0x3e8]
140bd7379: mov       r8d, 1
140bd737f: call      0x1400021d0
140bd7384: mov       eax, dword ptr [rbp + 0x5c8]
140bd738a: mov       dword ptr [r13], eax
140bd738e: mov       byte ptr [rbp + 0x60f], 1
140bd7395: mov       byte ptr [rbp + 0x60e], 1
140bd739c: mov       byte ptr [rbp + 0x60d], 1
140bd73a3: lea       rcx, [rbp + 0x328]
140bd73aa: mov       rdx, rbx
140bd73ad: call      0x145045c60
140bd73b2: nop
140bd73b3: movzx     ebx, byte ptr [rbp + 0x578]
140bd73ba: cmp       bl, 1
140bd73bd: jne       0x140bd742b
140bd73bf: mov       byte ptr [rbp + 0x61f], 1
140bd73c6: mov       byte ptr [rbp + 0x61e], 1
140bd73cd: mov       byte ptr [rbp + 0x61d], 1
140bd73d4: call      0x145ba4280
140bd73d9: nop
140bd73da: mov       rcx, qword ptr [rbp + 0x568]
140bd73e1: mov       r8d, dword ptr [rbp + 0x570]
140bd73e8: mov       qword ptr [rbp + 0x568], rax
140bd73ef: mov       dword ptr [rbp + 0x570], edx
140bd73f5: cmp       r8d, -1
140bd73f9: je        0x140bd742b
140bd73fb: mov       qword ptr [rbp + 0x3e0], rcx
140bd7402: mov       dword ptr [rbp + 0x3e8], r8d
140bd7409: mov       byte ptr [rbp + 0x61f], 1
140bd7410: mov       byte ptr [rbp + 0x61e], 1
140bd7417: mov       byte ptr [rbp + 0x61d], 1
140bd741e: lea       rcx, [rbp + 0x3e0]
140bd7425: call      0x145ba43d0
140bd742a: nop
140bd742b: mov       byte ptr [rbp + 0x61f], 1
140bd7432: mov       byte ptr [rbp + 0x61e], 1
140bd7439: mov       byte ptr [rbp + 0x61d], 1
140bd7440: lea       rcx, [rbp + 0x3b8]
140bd7447: mov       rdx, qword ptr [rbp + 0x600]
140bd744e: call      0x145033570
140bd7453: nop
140bd7454: xor       ecx, ecx
140bd7456: mov       edx, 0
140bd745b: test      bl, bl
140bd745d: mov       qword ptr [rbp + 0x3d0], r13
140bd7464: je        0x140bd7508
140bd746a: mov       byte ptr [rbp + 0x637], 1
140bd7471: mov       byte ptr [rbp + 0x636], 1
140bd7478: mov       byte ptr [rbp + 0x635], 1
140bd747f: mov       byte ptr [rbp + 0x634], 1
140bd7486: call      0x145ba4280
140bd748b: nop
140bd748c: mov       rcx, qword ptr [rbp + 0x568]
140bd7493: mov       r8d, dword ptr [rbp + 0x570]
140bd749a: mov       qword ptr [rbp + 0x568], rax
140bd74a1: mov       dword ptr [rbp + 0x570], edx
140bd74a7: cmp       r8d, -1
140bd74ab: je        0x140bd7504
140bd74ad: mov       qword ptr [rbp + 0x3e0], rcx
140bd74b4: mov       dword ptr [rbp + 0x3e8], r8d
140bd74bb: mov       byte ptr [rbp + 0x637], 1
140bd74c2: mov       byte ptr [rbp + 0x636], 1
140bd74c9: mov       byte ptr [rbp + 0x635], 1
140bd74d0: mov       byte ptr [rbp + 0x634], 1
140bd74d7: lea       rcx, [rbp + 0x3e0]
140bd74de: call      0x145ba43d0
140bd74e3: nop
140bd74e4: mov       ecx, edx
140bd74e6: mov       edx, 0xf4240
140bd74eb: mul       rdx
140bd74ee: mov       ecx, ecx
140bd74f0: imul      rcx, rcx, 0x10624dd3
140bd74f7: shr       rcx, 0x26
140bd74fb: add       rcx, rax
140bd74fe: adc       rdx, 0
140bd7502: jmp       0x140bd7508
140bd7504: xor       ecx, ecx
140bd7506: xor       edx, edx
140bd7508: xorpd     xmm0, xmm0
140bd750c: unpcklps  xmm7, xmm0
140bd750f: movapd    xmm0, xmmword ptr [rip + 0x51fb889]
140bd7517: orpd      xmm7, xmm0
140bd751b: subpd     xmm7, xmm0
140bd751f: movshdup  xmm9, xmm6
140bd7524: cvtpd2ps  xmm7, xmm7
140bd7528: movsldup  xmm0, xmm8
140bd752d: divps     xmm7, xmm0
140bd7530: mov       qword ptr [rbp + 0x1b0], rcx
140bd7537: mov       qword ptr [rbp + 0x1b8], rdx
140bd753e: mov       rax, qword ptr [rbp + 0x3c8]
140bd7545: mov       qword ptr [rbp + 0x168], rax
140bd754c: cmp       qword ptr [rbp + 0x728], 0
140bd7554: jne       0x140bd75f7
140bd755a: mov       rax, qword ptr [rbp + 0x610]
140bd7561: cmp       dword ptr [rax + 0xd0], 1
140bd7568: jne       0x140bd75f7
140bd756e: movd      eax, xmm7
140bd7572: mov       rcx, qword ptr [rbp + 0x610]
140bd7579: cmp       dword ptr [rcx + 0xd4], eax
140bd757f: jne       0x140bd75f7
140bd7581: movshdup  xmm0, xmm7
140bd7585: movd      eax, xmm0
140bd7589: mov       rcx, qword ptr [rbp + 0x610]
140bd7590: cmp       dword ptr [rcx + 0xd8], eax
140bd7596: jne       0x140bd75f7
140bd7598: movd      eax, xmm6
140bd759c: mov       rcx, qword ptr [rbp + 0x610]
140bd75a3: cmp       dword ptr [rcx + 0xdc], eax
140bd75a9: jne       0x140bd75f7
140bd75ab: movd      eax, xmm9
140bd75b0: mov       rcx, qword ptr [rbp + 0x610]
140bd75b7: cmp       dword ptr [rcx + 0xe0], eax
140bd75bd: jne       0x140bd75f7
140bd75bf: mov       rax, qword ptr [rbp + 0x610]
140bd75c6: cmp       dword ptr [rax], 1
140bd75c9: jne       0x140bd75ee
140bd75cb: cmp       qword ptr [rbp + 0x620], 0
140bd75d3: je        0x140bd75f7
140bd75d5: mov       rax, qword ptr [rbp + 0x610]
140bd75dc: mov       rcx, qword ptr [rbp + 0x5f0]
140bd75e3: cmp       qword ptr [rax + 8], rcx
140bd75e7: jne       0x140bd75f7
140bd75e9: jmp       0x140bd89b4
140bd75ee: test      r15, r15
140bd75f1: je        0x140bd89b4
140bd75f7: mov       eax, dword ptr [rip + 0x746f223]
140bd75fd: test      eax, eax
140bd75ff: jne       0x140bd9d94
140bd7605: cmp       byte ptr [rip + 0x746f218], 0
140bd760c: je        0x140bd7a58
140bd7612: mov       rcx, qword ptr [rbp + 0x610]
140bd7619: cmp       dword ptr [rcx + 0xd0], 1
140bd7620: jne       0x140bd765b
140bd7622: movd      eax, xmm7
140bd7626: cmp       dword ptr [rcx + 0xd4], eax
140bd762c: jne       0x140bd765b
140bd762e: movshdup  xmm0, xmm7
140bd7632: movd      eax, xmm0
140bd7636: cmp       dword ptr [rcx + 0xd8], eax
140bd763c: jne       0x140bd765b
140bd763e: movd      eax, xmm6
140bd7642: cmp       dword ptr [rcx + 0xdc], eax
140bd7648: jne       0x140bd765b
140bd764a: movd      eax, xmm9
140bd764f: cmp       dword ptr [rcx + 0xe0], eax
140bd7655: sete      r14b
140bd7659: jmp       0x140bd765e
140bd765b: xor       r14d, r14d
140bd765e: cmp       dword ptr [rcx], 1
140bd7661: jne       0x140bd768d
140bd7663: cmp       qword ptr [rbp + 0x620], 0
140bd766b: je        0x140bd7683
140bd766d: mov       rax, qword ptr [rbp + 0x5f0]
140bd7674: cmp       qword ptr [rcx + 8], rax
140bd7678: sete      al
140bd767b: mov       dword ptr [rbp + 0x5f8], eax
140bd7681: jmp       0x140bd768d
140bd7683: mov       dword ptr [rbp + 0x5f8], 0
140bd768d: mov       rbx, qword ptr [rbp + 0x3c0]
140bd7694: mov       rsi, qword ptr [rbp + 0x3c8]
140bd769b: mov       rax, rcx
140bd769e: mov       r12, qword ptr [rcx + 0x18]
140bd76a2: mov       r13, qword ptr [rcx + 0x20]
140bd76a6: mov       rcx, qword ptr [rbp + 0x328]
140bd76ad: mov       rax, qword ptr [rax + 0x58]
140bd76b1: mov       rdx, rax
140bd76b4: and       rdx, rcx
140bd76b7: cmp       rdx, -1
140bd76bb: sete      dil
140bd76bf: cmp       rcx, -1
140bd76c3: je        0x140bd7841
140bd76c9: cmp       rax, -1
140bd76cd: je        0x140bd7841
140bd76d3: movzx     eax, byte ptr [rbp + 0x36c]
140bd76da: mov       rcx, qword ptr [rbp + 0x610]
140bd76e1: cmp       al, byte ptr [rcx + 0x9c]
140bd76e7: jne       0x140bd783f
140bd76ed: movss     xmm0, dword ptr [rbp + 0x364]
140bd76f5: ucomiss   xmm0, dword ptr [rcx + 0x94]
140bd76fc: jne       0x140bd783f
140bd7702: jp        0x140bd783f
140bd7708: movss     xmm0, dword ptr [rbp + 0x368]
140bd7710: ucomiss   xmm0, dword ptr [rcx + 0x98]
140bd7717: jne       0x140bd783f
140bd771d: jp        0x140bd783f
140bd7723: movzx     eax, byte ptr [rbp + 0x36d]
140bd772a: cmp       al, byte ptr [rcx + 0x9d]
140bd7730: jne       0x140bd783f
140bd7736: mov       edx, dword ptr [rbp + 0x358]
140bd773c: cmp       edx, dword ptr [rcx + 0x88]
140bd7742: jne       0x140bd783f
140bd7748: mov       eax, dword ptr [rbp + 0x35c]
140bd774e: mov       ecx, dword ptr [rcx + 0x8c]
140bd7754: test      edx, edx
140bd7756: je        0x140bd777a
140bd7758: cmp       eax, ecx
140bd775a: jne       0x140bd783f
140bd7760: mov       eax, dword ptr [rbp + 0x360]
140bd7766: mov       rcx, qword ptr [rbp + 0x610]
140bd776d: cmp       eax, dword ptr [rcx + 0x90]
140bd7773: je        0x140bd779b
140bd7775: jmp       0x140bd783f
140bd777a: cmp       eax, ecx
140bd777c: jne       0x140bd783f
140bd7782: mov       eax, dword ptr [rbp + 0x360]
140bd7788: mov       rcx, qword ptr [rbp + 0x610]
140bd778f: cmp       eax, dword ptr [rcx + 0x90]
140bd7795: jne       0x140bd783f
140bd779b: mov       rax, qword ptr [rbp + 0x340]
140bd77a2: cmp       rax, qword ptr [rcx + 0x70]
140bd77a6: jne       0x140bd783f
140bd77ac: mov       r8, qword ptr [rbp + 0x338]
140bd77b3: cmp       r8, qword ptr [rcx + 0x68]
140bd77b7: jne       0x140bd783f
140bd77bd: mov       rax, qword ptr [rbp + 0x610]
140bd77c4: mov       rdx, qword ptr [rax + 0x60]
140bd77c8: mov       rcx, qword ptr [rbp + 0x330]
140bd77cf: call      0x1408959b0
140bd77d4: test      al, al
140bd77d6: je        0x140bd783f
140bd77d8: movss     xmm0, dword ptr [rbp + 0x348]
140bd77e0: mov       rax, qword ptr [rbp + 0x610]
140bd77e7: ucomiss   xmm0, dword ptr [rax + 0x78]
140bd77eb: jne       0x140bd783f
140bd77ed: jp        0x140bd783f
140bd77ef: movss     xmm0, dword ptr [rbp + 0x34c]
140bd77f7: mov       rax, qword ptr [rbp + 0x610]
140bd77fe: ucomiss   xmm0, dword ptr [rax + 0x7c]
140bd7802: jne       0x140bd783f
140bd7804: jp        0x140bd783f
140bd7806: movss     xmm0, dword ptr [rbp + 0x350]
140bd780e: mov       rax, qword ptr [rbp + 0x610]
140bd7815: ucomiss   xmm0, dword ptr [rax + 0x80]
140bd781c: jne       0x140bd783f
140bd781e: jp        0x140bd783f
140bd7820: movss     xmm0, dword ptr [rbp + 0x354]
140bd7828: mov       rax, qword ptr [rbp + 0x610]
140bd782f: ucomiss   xmm0, dword ptr [rax + 0x84]
140bd7836: jne       0x140bd783f
140bd7838: jp        0x140bd783f
140bd783a: mov       dil, 1
140bd783d: jmp       0x140bd7841
140bd783f: xor       edi, edi
140bd7841: mov       rax, qword ptr [rbp + 0x720]
140bd7848: mov       rcx, qword ptr [rax]
140bd784b: mov       rax, qword ptr [rbp + 0x5d0]
140bd7852: lea       rdx, [rax + 0xa0]
140bd7859: mov       byte ptr [rbp + 0x637], 1
140bd7860: mov       byte ptr [rbp + 0x636], 1
140bd7867: mov       byte ptr [rbp + 0x635], 1
140bd786e: mov       byte ptr [rbp + 0x634], 1
140bd7875: call      0x141224ac0
140bd787a: nop
140bd787b: test      r14b, r14b
140bd787e: je        0x140bd7920
140bd7884: cmp       byte ptr [rbp + 0x5f8], 0
140bd788b: je        0x140bd7953
140bd7891: test      dil, dil
140bd7894: je        0x140bd7986
140bd789a: test      al, al
140bd789c: je        0x140bd79b9
140bd78a2: mov       rdi, rsi
140bd78a5: cmp       rsi, r13
140bd78a8: jne       0x140bd79e9
140bd78ae: test      rdi, rdi
140bd78b1: je        0x140bd78ed
140bd78b3: add       rbx, 0xc8
140bd78ba: xor       r14d, r14d
140bd78bd: lea       r13, [rbx - 0xc8]
140bd78c4: mov       rcx, r13
140bd78c7: mov       rdx, r12
140bd78ca: call      0x140bfb550
140bd78cf: test      al, al
140bd78d1: je        0x140bd88b1
140bd78d7: inc       r14
140bd78da: add       r12, 0x110
140bd78e1: add       rbx, 0x110
140bd78e8: cmp       rdi, r14
140bd78eb: jne       0x140bd78bd
140bd78ed: mov       byte ptr [rbp + 0x637], 1
140bd78f4: mov       byte ptr [rbp + 0x636], 1
140bd78fb: mov       byte ptr [rbp + 0x635], 1
140bd7902: mov       byte ptr [rbp + 0x634], 1
140bd7909: lea       rcx, [rip + 0x53bd79d]
140bd7910: mov       edx, 0x89
140bd7915: call      0x145bb6590
140bd791a: nop
140bd791b: jmp       0x140bd7a58
140bd7920: mov       byte ptr [rbp + 0x637], 1
140bd7927: mov       byte ptr [rbp + 0x636], 1
140bd792e: mov       byte ptr [rbp + 0x635], 1
140bd7935: mov       byte ptr [rbp + 0x634], 1
140bd793c: lea       rcx, [rip + 0x53bd6b4]
140bd7943: mov       edx, 0x6f
140bd7948: call      0x145bb6590
140bd794d: nop
140bd794e: jmp       0x140bd7a58
140bd7953: mov       byte ptr [rbp + 0x637], 1
140bd795a: mov       byte ptr [rbp + 0x636], 1
140bd7961: mov       byte ptr [rbp + 0x635], 1
140bd7968: mov       byte ptr [rbp + 0x634], 1
140bd796f: lea       rcx, [rip + 0x53bd6b8]
140bd7976: mov       edx, 0x4d
140bd797b: call      0x145bb6590
140bd7980: nop
140bd7981: jmp       0x140bd7a58
140bd7986: mov       byte ptr [rbp + 0x637], 1
140bd798d: mov       byte ptr [rbp + 0x636], 1
140bd7994: mov       byte ptr [rbp + 0x635], 1
140bd799b: mov       byte ptr [rbp + 0x634], 1
140bd79a2: lea       rcx, [rip + 0x53bd6ab]
140bd79a9: mov       edx, 0x61
140bd79ae: call      0x145bb6590
140bd79b3: nop
140bd79b4: jmp       0x140bd7a58
140bd79b9: mov       byte ptr [rbp + 0x637], 1
140bd79c0: mov       byte ptr [rbp + 0x636], 1
140bd79c7: mov       byte ptr [rbp + 0x635], 1
140bd79ce: mov       byte ptr [rbp + 0x634], 1
140bd79d5: lea       rcx, [rip + 0x53bd6a8]
140bd79dc: mov       edx, 0x53
140bd79e1: call      0x145bb6590
140bd79e6: nop
140bd79e7: jmp       0x140bd7a58
140bd79e9: mov       qword ptr [rbp + 0x2e0], r13
140bd79f0: mov       qword ptr [rbp + 0x220], rdi
140bd79f7: lea       rax, [rbp + 0x2e0]
140bd79fe: mov       qword ptr [rbp + 0x3e0], rax
140bd7a05: lea       rax, [rip + 0x5007dc4]
140bd7a0c: mov       qword ptr [rbp + 0x3e8], rax
140bd7a13: lea       rcx, [rbp + 0x220]
140bd7a1a: mov       qword ptr [rbp + 0x3f0], rcx
140bd7a21: mov       qword ptr [rbp + 0x3f8], rax
140bd7a28: mov       byte ptr [rbp + 0x637], 1
140bd7a2f: mov       byte ptr [rbp + 0x636], 1
140bd7a36: mov       byte ptr [rbp + 0x635], 1
140bd7a3d: mov       byte ptr [rbp + 0x634], 1
140bd7a44: lea       rcx, [rip + 0x53bd749]
140bd7a4b: lea       rdx, [rbp + 0x3e0]
140bd7a52: call      0x145bb6590
140bd7a57: nop
140bd7a58: cmp       qword ptr [rbp + 0x728], 0
140bd7a60: je        0x140bd7ab0
140bd7a62: mov       eax, dword ptr [rip + 0x746edb8]
140bd7a68: test      eax, eax
140bd7a6a: jne       0x140bd9de8
140bd7a70: cmp       byte ptr [rip + 0x746edad], 1
140bd7a77: jne       0x140bd7c8d
140bd7a7d: mov       byte ptr [rbp + 0x637], 1
140bd7a84: mov       byte ptr [rbp + 0x636], 1
140bd7a8b: mov       byte ptr [rbp + 0x635], 1
140bd7a92: mov       byte ptr [rbp + 0x634], 1
140bd7a99: lea       rcx, [rip + 0x53bd108]
140bd7aa0: mov       edx, 0x3f
140bd7aa5: call      0x145bb6590
140bd7aaa: nop
140bd7aab: jmp       0x140bd7c8d
140bd7ab0: mov       eax, dword ptr [rip + 0x746ed62]
140bd7ab6: test      eax, eax
140bd7ab8: jne       0x140bd9ebc
140bd7abe: cmp       byte ptr [rip + 0x746ed57], 0
140bd7ac5: je        0x140bd7b15
140bd7ac7: mov       eax, dword ptr [rip + 0x746ed53]
140bd7acd: test      eax, eax
140bd7acf: jne       0x140bd9f08
140bd7ad5: cmp       byte ptr [rip + 0x746ed48], 1
140bd7adc: jne       0x140bd7c8d
140bd7ae2: mov       byte ptr [rbp + 0x637], 1
140bd7ae9: mov       byte ptr [rbp + 0x636], 1
140bd7af0: mov       byte ptr [rbp + 0x635], 1
140bd7af7: mov       byte ptr [rbp + 0x634], 1
140bd7afe: lea       rcx, [rip + 0x53bd072]
140bd7b05: mov       edx, 0x63
140bd7b0a: call      0x145bb6590
140bd7b0f: nop
140bd7b10: jmp       0x140bd7c8d
140bd7b15: mov       rcx, qword ptr [rbp + 0x610]
140bd7b1c: cmp       byte ptr [rcx + 0xd0], 0
140bd7b23: je        0x140bd7c48
140bd7b29: movd      eax, xmm7
140bd7b2d: cmp       dword ptr [rcx + 0xd4], eax
140bd7b33: jne       0x140bd7c48
140bd7b39: movshdup  xmm8, xmm7
140bd7b3e: movd      eax, xmm8
140bd7b43: cmp       dword ptr [rcx + 0xd8], eax
140bd7b49: jne       0x140bd7c48
140bd7b4f: movd      eax, xmm6
140bd7b53: cmp       dword ptr [rcx + 0xdc], eax
140bd7b59: jne       0x140bd7c48
140bd7b5f: movd      eax, xmm9
140bd7b64: cmp       dword ptr [rcx + 0xe0], eax
140bd7b6a: jne       0x140bd7c48
140bd7b70: cmp       dword ptr [rcx], 1
140bd7b73: jne       0x140bd8a14
140bd7b79: cmp       qword ptr [rbp + 0x620], 0
140bd7b81: je        0x140bd8a1d
140bd7b87: mov       rax, qword ptr [rbp + 0x5f0]
140bd7b8e: cmp       qword ptr [rcx + 8], rax
140bd7b92: jne       0x140bd8a1d
140bd7b98: cmp       qword ptr [rbp + 0x328], -1
140bd7ba0: mov       rax, qword ptr [rcx + 0x58]
140bd7ba4: je        0x140bd9d2b
140bd7baa: cmp       rax, -1
140bd7bae: je        0x140bd9d35
140bd7bb4: mov       rax, qword ptr [rbp + 0x5d0]
140bd7bbb: lea       rdx, [rax + 0x58]
140bd7bbf: lea       rcx, [rbp + 0x328]
140bd7bc6: call      0x140bfc1d0
140bd7bcb: test      al, al
140bd7bcd: je        0x140bd9d35
140bd7bd3: mov       rax, qword ptr [rbp + 0x720]
140bd7bda: mov       rcx, qword ptr [rax]
140bd7bdd: mov       rax, qword ptr [rbp + 0x5d0]
140bd7be4: lea       rdx, [rax + 0xa0]
140bd7beb: mov       byte ptr [rbp + 0x637], 1
140bd7bf2: mov       byte ptr [rbp + 0x636], 1
140bd7bf9: mov       byte ptr [rbp + 0x635], 1
140bd7c00: mov       byte ptr [rbp + 0x634], 1
140bd7c07: call      0x141224ac0
140bd7c0c: nop
140bd7c0d: test      al, al
140bd7c0f: je        0x140bd9e16
140bd7c15: mov       rax, qword ptr [rbp + 0x610]
140bd7c1c: mov       r8, qword ptr [rax + 0x38]
140bd7c20: cmp       r8, qword ptr [rax + 0x20]
140bd7c24: jne       0x140bda126
140bd7c2a: test      r8, r8
140bd7c2d: je        0x140bd9f9a
140bd7c33: mov       rax, qword ptr [rbp + 0x610]
140bd7c3a: mov       rax, qword ptr [rax + 0x30]
140bd7c3e: mov       eax, dword ptr [rax + r8*4 - 4]
140bd7c43: jmp       0x140bd9f9c
140bd7c48: mov       eax, dword ptr [rip + 0x746ebd2]
140bd7c4e: test      eax, eax
140bd7c50: jne       0x140bd9f36
140bd7c56: cmp       byte ptr [rip + 0x746ebc7], 1
140bd7c5d: jne       0x140bd7c8d
140bd7c5f: mov       byte ptr [rbp + 0x637], 1
140bd7c66: mov       byte ptr [rbp + 0x636], 1
140bd7c6d: mov       byte ptr [rbp + 0x635], 1
140bd7c74: mov       byte ptr [rbp + 0x634], 1
140bd7c7b: lea       rcx, [rip + 0x53bced1]
140bd7c82: mov       edx, 0x49
140bd7c87: call      0x145bb6590
140bd7c8c: nop
140bd7c8d: mov       rsi, qword ptr [rbp + 0x610]
140bd7c94: mov       dword ptr [rsi + 0xd0], 1
140bd7c9e: movaps    xmm0, xmm7
140bd7ca1: movlhps   xmm0, xmm6
140bd7ca4: movups    xmmword ptr [rsi + 0xd4], xmm0
140bd7cab: mov       rax, qword ptr [rbp + 0x620]
140bd7cb2: mov       qword ptr [rsi], rax
140bd7cb5: mov       rax, qword ptr [rbp + 0x5f0]
140bd7cbc: mov       qword ptr [rsi + 8], rax
140bd7cc0: cmp       qword ptr [rbp + 0x328], -1
140bd7cc8: je        0x140bd7d40
140bd7cca: mov       eax, dword ptr [rbp + 0x360]
140bd7cd0: mov       dword ptr [rbp + 0x228], eax
140bd7cd6: mov       rax, qword ptr [rbp + 0x358]
140bd7cdd: mov       qword ptr [rbp + 0x220], rax
140bd7ce4: mov       rsi, qword ptr [rbp + 0x338]
140bd7ceb: mov       r15, rsi
140bd7cee: shl       r15, 4
140bd7cf2: mov       rax, rsi
140bd7cf5: shr       rax, 0x3c
140bd7cf9: setne     al
140bd7cfc: movabs    rcx, 0x7ffffffffffffff8
140bd7d06: cmp       r15, rcx
140bd7d09: seta      cl
140bd7d0c: or        cl, al
140bd7d0e: je        0x140bd7d5a
140bd7d10: xor       r13d, r13d
140bd7d13: mov       byte ptr [rbp + 0x637], 1
140bd7d1a: mov       byte ptr [rbp + 0x636], 1
140bd7d21: mov       byte ptr [rbp + 0x635], 1
140bd7d28: mov       byte ptr [rbp + 0x634], 1
140bd7d2f: mov       rcx, r13
140bd7d32: mov       rdx, r15
140bd7d35: call      0x145d992bb
140bd7d3a: nop
140bd7d3b: jmp       0x140bdb7f4
140bd7d40: mov       r13, 0xffffffffffffffff
140bd7d47: mov       rdx, qword ptr [rsi + 0x58]
140bd7d4b: cmp       rdx, -1
140bd7d4f: jne       0x140bd7e03
140bd7d55: jmp       0x140bd7e1b
140bd7d5a: movzx     ebx, byte ptr [rbp + 0x36c]
140bd7d61: movsd     xmm8, qword ptr [rbp + 0x364]
140bd7d6a: movzx     edi, byte ptr [rbp + 0x36d]
140bd7d71: mov       r12, qword ptr [rbp + 0x330]
140bd7d78: movups    xmm10, xmmword ptr [rbp + 0x338]
140bd7d80: test      r15, r15
140bd7d83: je        0x140bd7dae
140bd7d85: call      0x140002200
140bd7d8a: mov       r13d, 8
140bd7d90: mov       edx, 8
140bd7d95: mov       rcx, r15
140bd7d98: call      0x1400021c0
140bd7d9d: test      rax, rax
140bd7da0: je        0x140bd7d13
140bd7da6: mov       r14, rax
140bd7da9: mov       r13, rsi
140bd7dac: jmp       0x140bd7db7
140bd7dae: mov       r14d, 8
140bd7db4: xor       r13d, r13d
140bd7db7: test      rsi, rsi
140bd7dba: je        0x140bd7dca
140bd7dbc: mov       rcx, r14
140bd7dbf: mov       rdx, r12
140bd7dc2: mov       r8, r15
140bd7dc5: call      0x145bfa0e7
140bd7dca: movups    xmm0, xmmword ptr [rbp + 0x348]
140bd7dd1: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd7dd8: mov       rax, qword ptr [rbp + 0x220]
140bd7ddf: mov       qword ptr [rbp + 0x2e0], rax
140bd7de6: mov       eax, dword ptr [rbp + 0x228]
140bd7dec: mov       dword ptr [rbp + 0x2e8], eax
140bd7df2: mov       rsi, qword ptr [rbp + 0x610]
140bd7df9: mov       rdx, qword ptr [rsi + 0x58]
140bd7dfd: cmp       rdx, -1
140bd7e01: je        0x140bd7e1b
140bd7e03: test      rdx, rdx
140bd7e06: je        0x140bd7e1b
140bd7e08: mov       rcx, qword ptr [rsi + 0x60]
140bd7e0c: shl       rdx, 4
140bd7e10: mov       r8d, 8
140bd7e16: call      0x1400021d0
140bd7e1b: mov       qword ptr [rsi + 0x58], r13
140bd7e1f: mov       qword ptr [rsi + 0x60], r14
140bd7e23: movups    xmmword ptr [rsi + 0x68], xmm10
140bd7e28: movapd    xmm0, xmmword ptr [rbp + 0x3e0]
140bd7e30: movupd    xmmword ptr [rsi + 0x78], xmm0
140bd7e35: mov       rax, qword ptr [rbp + 0x2e0]
140bd7e3c: mov       qword ptr [rsi + 0x88], rax
140bd7e43: mov       eax, dword ptr [rbp + 0x2e8]
140bd7e49: mov       dword ptr [rsi + 0x90], eax
140bd7e4f: movlps    qword ptr [rsi + 0x94], xmm8
140bd7e57: mov       byte ptr [rsi + 0x9c], bl
140bd7e5d: mov       byte ptr [rsi + 0x9d], dil
140bd7e64: mov       rax, qword ptr [rbp + 0x720]
140bd7e6b: mov       rdx, qword ptr [rax]
140bd7e6e: movups    xmm8, xmmword ptr [rdx + 0x20]
140bd7e73: mov       byte ptr [rbp + 0x637], 1
140bd7e7a: mov       byte ptr [rbp + 0x636], 1
140bd7e81: mov       byte ptr [rbp + 0x635], 1
140bd7e88: mov       byte ptr [rbp + 0x634], 1
140bd7e8f: lea       rcx, [rbp + 0x3e0]
140bd7e96: call      0x1405e7a20
140bd7e9b: nop
140bd7e9c: movups    xmmword ptr [rbp + 0x400], xmm8
140bd7ea4: movups    xmm0, xmmword ptr [rbp + 0x3e0]
140bd7eab: movups    xmm1, xmmword ptr [rbp + 0x3f0]
140bd7eb2: movaps    xmmword ptr [rbp + 0x220], xmm0
140bd7eb9: movaps    xmmword ptr [rbp + 0x230], xmm1
140bd7ec0: movups    xmm0, xmmword ptr [rbp + 0x400]
140bd7ec7: movaps    xmmword ptr [rbp + 0x240], xmm0
140bd7ece: mov       rax, qword ptr [rbp + 0x5d0]
140bd7ed5: lea       rcx, [rax + 0xa0]
140bd7edc: mov       qword ptr [rbp + 0x620], rcx
140bd7ee3: call      0x14056e710
140bd7ee8: nop
140bd7ee9: movapd    xmm0, xmmword ptr [rbp + 0x220]
140bd7ef1: movaps    xmm1, xmmword ptr [rbp + 0x230]
140bd7ef8: movaps    xmm2, xmmword ptr [rbp + 0x240]
140bd7eff: mov       rax, qword ptr [rbp + 0x620]
140bd7f06: movups    xmmword ptr [rax + 0x20], xmm2
140bd7f0a: movups    xmmword ptr [rax + 0x10], xmm1
140bd7f0e: movupd    xmmword ptr [rax], xmm0
140bd7f12: mov       byte ptr [rbp + 0x637], 1
140bd7f19: mov       byte ptr [rbp + 0x636], 1
140bd7f20: mov       byte ptr [rbp + 0x635], 1
140bd7f27: mov       byte ptr [rbp + 0x634], 1
140bd7f2e: lea       rcx, [rbp + 0x3e0]
140bd7f35: lea       rdx, [rbp + 0x3b8]
140bd7f3c: call      0x140b50ad0
140bd7f41: nop
140bd7f42: mov       r12, qword ptr [rbp + 0x5d0]
140bd7f49: lea       rax, [r12 + 0x10]
140bd7f4e: mov       qword ptr [rbp + 0x5f8], rax
140bd7f55: mov       rax, qword ptr [rbp + 0x610]
140bd7f5c: mov       rcx, qword ptr [rax + 0x18]
140bd7f60: mov       rax, qword ptr [rax + 0x20]
140bd7f64: mov       qword ptr [rbp + 0x5f0], rax
140bd7f6b: mov       qword ptr [rbp + 0x620], 0
140bd7f76: mov       qword ptr [rbp + 0x5e0], rcx
140bd7f7d: nop       dword ptr [rax]
140bd7f80: mov       rax, qword ptr [rbp + 0x620]
140bd7f87: cmp       qword ptr [rbp + 0x5f0], rax
140bd7f8e: je        0x140bd7fac
140bd7f90: inc       rax
140bd7f93: mov       qword ptr [rbp + 0x620], rax
140bd7f9a: lea       rsi, [rcx + 0x110]
140bd7fa1: call      0x140ad8400
140bd7fa6: nop
140bd7fa7: mov       rcx, rsi
140bd7faa: jmp       0x140bd7f80
140bd7fac: lea       rsi, [r12 + 0x10]
140bd7fb1: mov       rax, qword ptr [rsi]
140bd7fb4: test      rax, rax
140bd7fb7: mov       r15, qword ptr [rbp + 0x610]
140bd7fbe: je        0x140bd7fd6
140bd7fc0: mov       rcx, qword ptr [r15 + 0x18]
140bd7fc4: imul      rdx, rax, 0x110
140bd7fcb: mov       r8d, 0x10
140bd7fd1: call      0x1400021d0
140bd7fd6: mov       rax, qword ptr [rbp + 0x3f0]
140bd7fdd: mov       qword ptr [rsi + 0x10], rax
140bd7fe1: movdqu    xmm0, xmmword ptr [rbp + 0x3e0]
140bd7fe9: movdqu    xmmword ptr [rsi], xmm0
140bd7fed: mov       rdx, qword ptr [rbp + 0x720]
140bd7ff4: mov       eax, dword ptr [rdx + 0x3c]
140bd7ff7: mov       rcx, qword ptr [rdx + 0x30]
140bd7ffb: mov       dword ptr [rcx], eax
140bd7ffd: mov       rbx, qword ptr [rdx + 0x20]
140bd8001: mov       rsi, qword ptr [rbx + 0x18]
140bd8005: test      rsi, rsi
140bd8008: je        0x140bd80e4
140bd800e: mov       r14, qword ptr [rbx]
140bd8011: movdqa    xmm0, xmmword ptr [r14]
140bd8016: lea       rdi, [r14 + 0x10]
140bd801a: pmovmskb  r12d, xmm0
140bd801f: not       r12d
140bd8022: mov       r15, r14
140bd8025: jmp       0x140bd8040
140bd8027: nop       word ptr [rax + rax]
140bd8030: lea       eax, [r12 - 1]
140bd8035: and       eax, r12d
140bd8038: mov       r12d, eax
140bd803b: dec       rsi
140bd803e: je        0x140bd8095
140bd8040: test      r12w, r12w
140bd8044: jne       0x140bd806d
140bd8046: nop       word ptr cs:[rax + rax]
140bd8050: movdqa    xmm0, xmmword ptr [rdi]
140bd8054: add       r15, -0x200
140bd805b: add       rdi, 0x10
140bd805f: pmovmskb  r12d, xmm0
140bd8064: xor       r12d, 0xffff
140bd806b: je        0x140bd8050
140bd806d: tzcnt     ecx, r12d
140bd8072: shl       ecx, 5
140bd8075: mov       rax, r15
140bd8078: sub       rax, rcx
140bd807b: mov       rdx, qword ptr [rax - 0x20]
140bd807f: test      rdx, rdx
140bd8082: je        0x140bd8030
140bd8084: mov       rcx, qword ptr [rax - 0x18]
140bd8088: mov       r8d, 1
140bd808e: call      0x1400021d0
140bd8093: jmp       0x140bd8030
140bd8095: mov       rsi, qword ptr [rbx + 8]
140bd8099: test      rsi, rsi
140bd809c: je        0x140bd80c8
140bd809e: lea       r8, [rsi + 0x11]
140bd80a2: mov       rcx, r14
140bd80a5: mov       dl, 0xff
140bd80a7: call      0x145bfa0db
140bd80ac: lea       rax, [rsi + 1]
140bd80b0: mov       rcx, rax
140bd80b3: shr       rcx, 3
140bd80b7: and       rax, 0xfffffffffffffff8
140bd80bb: sub       rax, rcx
140bd80be: cmp       rsi, 8
140bd80c2: cmovb     rax, rsi
140bd80c6: jmp       0x140bd80ca
140bd80c8: xor       eax, eax
140bd80ca: mov       r15, qword ptr [rbp + 0x610]
140bd80d1: mov       r12, qword ptr [rbp + 0x5d0]
140bd80d8: mov       qword ptr [rbx + 0x18], 0
140bd80e0: mov       qword ptr [rbx + 0x10], rax
140bd80e4: mov       rdx, qword ptr [rbp + 0x720]
140bd80eb: mov       eax, dword ptr [rdx + 0x5c]
140bd80ee: mov       rcx, qword ptr [rdx + 0x50]
140bd80f2: mov       dword ptr [rcx], eax
140bd80f4: mov       rsi, qword ptr [rdx + 0x40]
140bd80f8: mov       rbx, qword ptr [rbp + 0x600]
140bd80ff: mov       rdi, qword ptr [rbx + 0x10]
140bd8103: cmp       qword ptr [rsi + 0x18], 0
140bd8108: je        0x140bd8152
140bd810a: mov       rbx, qword ptr [rsi + 8]
140bd810e: test      rbx, rbx
140bd8111: je        0x140bd813d
140bd8113: mov       rcx, qword ptr [rsi]
140bd8116: lea       r8, [rbx + 0x11]
140bd811a: mov       dl, 0xff
140bd811c: call      0x145bfa0db
140bd8121: lea       rax, [rbx + 1]
140bd8125: mov       rcx, rax
140bd8128: shr       rcx, 3
140bd812c: and       rax, 0xfffffffffffffff8
140bd8130: sub       rax, rcx
140bd8133: cmp       rbx, 8
140bd8137: cmovb     rax, rbx
140bd813b: jmp       0x140bd813f
140bd813d: xor       eax, eax
140bd813f: mov       qword ptr [rsi + 0x18], 0
140bd8147: mov       qword ptr [rsi + 0x10], rax
140bd814b: mov       rbx, qword ptr [rbp + 0x600]
140bd8152: mov       qword ptr [rsi + 0x30], rdi
140bd8156: mov       rsi, qword ptr [r15 + 0x20]
140bd815a: test      rsi, rsi
140bd815d: je        0x140bd81ad
140bd815f: lea       r14, [rsi*4]
140bd8167: call      0x140002200
140bd816c: mov       edx, 4
140bd8171: mov       rcx, r14
140bd8174: call      0x1400021c0
140bd8179: test      rax, rax
140bd817c: jne       0x140bd81b2
140bd817e: mov       byte ptr [rbp + 0x637], 1
140bd8185: mov       byte ptr [rbp + 0x636], 1
140bd818c: mov       byte ptr [rbp + 0x635], 1
140bd8193: mov       byte ptr [rbp + 0x634], 1
140bd819a: mov       ecx, 4
140bd819f: mov       rdx, r14
140bd81a2: call      0x145d992bb
140bd81a7: nop
140bd81a8: jmp       0x140bdb7f4
140bd81ad: mov       eax, 4
140bd81b2: mov       qword ptr [rbp + 0x1d8], rsi
140bd81b9: mov       qword ptr [rbp + 0x1e0], rax
140bd81c0: mov       qword ptr [rbp + 0x1e8], 0
140bd81cb: mov       rdx, qword ptr [rbp + 0x3b8]
140bd81d2: mov       rcx, qword ptr [rbp + 0x3c0]
140bd81d9: mov       rax, qword ptr [rbp + 0x3c8]
140bd81e0: imul      r13, rax, 0x110
140bd81e7: lea       r8, [rcx + r13]
140bd81eb: mov       qword ptr [rbp + 0x220], rcx
140bd81f2: mov       qword ptr [rbp + 0x228], rcx
140bd81f9: mov       qword ptr [rbp + 0x5b8], rdx
140bd8200: mov       qword ptr [rbp + 0x230], rdx
140bd8207: mov       qword ptr [rbp + 0x238], r8
140bd820e: mov       qword ptr [rbp + 0x5e0], rcx
140bd8215: mov       rdx, rcx
140bd8218: test      rax, rax
140bd821b: je        0x140bd83cf
140bd8221: mov       qword ptr [rbp + 0x620], r8
140bd8228: mov       rax, qword ptr [rbp + 0x710]
140bd822f: mov       edi, dword ptr [rax + 0x1c]
140bd8232: mov       rsi, qword ptr [rax]
140bd8235: mov       r12, qword ptr [rax + 0x10]
140bd8239: movshdup  xmm8, xmm7
140bd823e: mov       rax, qword ptr [rbp + 0x5e0]
140bd8245: lea       rdx, [rax + 0x110]
140bd824c: lea       r15, [rbp + 0x3e0]
140bd8253: jmp       0x140bd8290
140bd8255: nop       word ptr cs:[rax + rax]
140bd8260: mov       rax, qword ptr [rbp + 0x1e0]
140bd8267: mov       dword ptr [rax + r14*4], ebx
140bd826b: inc       r14
140bd826e: mov       qword ptr [rbp + 0x1e8], r14
140bd8275: mov       rdx, qword ptr [rbp + 0x5f8]
140bd827c: add       rdx, 0x110
140bd8283: add       r13, -0x110
140bd828a: je        0x140bd83a9
140bd8290: mov       rax, qword ptr [rdx - 0x100]
140bd8297: cmp       rax, -2
140bd829b: je        0x140bd8399
140bd82a1: lea       rcx, [rdx - 0x110]
140bd82a8: mov       qword ptr [rbp + 0x5f8], rdx
140bd82af: add       rdx, -0xf8
140bd82b6: movdqa    xmm0, xmmword ptr [rcx]
140bd82ba: movdqa    xmmword ptr [rbp + 0x3e0], xmm0
140bd82c2: mov       qword ptr [rbp + 0x3f0], rax
140bd82c9: mov       r8d, 0xf8
140bd82cf: lea       rcx, [rbp + 0x3f8]
140bd82d6: call      0x145bfa0e7
140bd82db: mov       dword ptr [r12], edi
140bd82df: cmp       qword ptr [rbp + 0x328], -1
140bd82e7: lea       rax, [rbp + 0x328]
140bd82ee: mov       ecx, 0
140bd82f3: cmove     rax, rcx
140bd82f7: cmp       qword ptr [rbp + 0x728], 0
140bd82ff: lea       rcx, [rbp - 0x10]
140bd8303: mov       qword ptr [rsp + 0x68], rcx
140bd8308: setne     byte ptr [rsp + 0x50]
140bd830d: lea       rcx, [rbp + 0xe8]
140bd8314: mov       qword ptr [rsp + 0x60], rcx
140bd8319: lea       rcx, [rbp + 0x3a0]
140bd8320: mov       qword ptr [rsp + 0x58], rcx
140bd8325: mov       qword ptr [rsp + 0x48], rax
140bd832a: mov       rax, qword ptr [rbp + 0x720]
140bd8331: mov       qword ptr [rsp + 0x40], rax
140bd8336: mov       rax, qword ptr [rbp + 0x718]
140bd833d: mov       qword ptr [rsp + 0x38], rax
140bd8342: mov       qword ptr [rsp + 0x30], rsi
140bd8347: mov       rax, qword ptr [rbp + 0x560]
140bd834e: mov       qword ptr [rsp + 0x28], rax
140bd8353: movss     dword ptr [rsp + 0x20], xmm9
140bd835a: mov       rcx, r15
140bd835d: movaps    xmm1, xmm6
140bd8360: movaps    xmm2, xmm7
140bd8363: movaps    xmm3, xmm8
140bd8367: call      0x140bde4e0
140bd836c: nop
140bd836d: mov       ebx, dword ptr [rbp + 0x3b0]
140bd8373: mov       r14, qword ptr [rbp + 0x1e8]
140bd837a: cmp       r14, qword ptr [rbp + 0x1d8]
140bd8381: jne       0x140bd8260
140bd8387: lea       rcx, [rbp + 0x1d8]
140bd838e: call      0x145c2e940
140bd8393: nop
140bd8394: jmp       0x140bd8260
140bd8399: mov       rbx, qword ptr [rbp + 0x600]
140bd83a0: mov       r8, qword ptr [rbp + 0x620]
140bd83a7: jmp       0x140bd83ba
140bd83a9: mov       r8, qword ptr [rbp + 0x620]
140bd83b0: mov       rdx, r8
140bd83b3: mov       rbx, qword ptr [rbp + 0x600]
140bd83ba: mov       qword ptr [rbp + 0x228], rdx
140bd83c1: mov       r15, qword ptr [rbp + 0x610]
140bd83c8: mov       r12, qword ptr [rbp + 0x5d0]
140bd83cf: sub       r8, rdx
140bd83d2: shr       r8, 4
140bd83d6: movabs    rax, 0xf0f0f0f0f0f0f0f1
140bd83e0: imul      rax, r8
140bd83e4: mov       qword ptr [rbp + 0x5f0], rax
140bd83eb: mov       qword ptr [rbp + 0x620], 0
140bd83f6: mov       qword ptr [rbp + 0x5f8], rdx
140bd83fd: mov       rcx, rdx
140bd8400: mov       r13, qword ptr [rbp + 0x3d0]
140bd8407: nop       word ptr [rax + rax]
140bd8410: mov       rax, qword ptr [rbp + 0x620]
140bd8417: cmp       qword ptr [rbp + 0x5f0], rax
140bd841e: je        0x140bd843c
140bd8420: inc       rax
140bd8423: mov       qword ptr [rbp + 0x620], rax
140bd842a: lea       rsi, [rcx + 0x110]
140bd8431: call      0x140604eb0
140bd8436: nop
140bd8437: mov       rcx, rsi
140bd843a: jmp       0x140bd8410
140bd843c: mov       rax, qword ptr [rbp + 0x5b8]
140bd8443: test      rax, rax
140bd8446: je        0x140bd8461
140bd8448: imul      rdx, rax, 0x110
140bd844f: mov       r8d, 0x10
140bd8455: mov       rcx, qword ptr [rbp + 0x5e0]
140bd845c: call      0x1400021d0
140bd8461: mov       rax, qword ptr [rbp + 0x1e8]
140bd8468: mov       qword ptr [rbp + 0x3f0], rax
140bd846f: movups    xmm0, xmmword ptr [rbp + 0x1d8]
140bd8476: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd847d: add       r12, 0x28
140bd8481: mov       rdx, qword ptr [r15 + 0x28]
140bd8485: test      rdx, rdx
140bd8488: je        0x140bd849d
140bd848a: mov       rcx, qword ptr [r15 + 0x30]
140bd848e: shl       rdx, 2
140bd8492: mov       r8d, 4
140bd8498: call      0x1400021d0
140bd849d: mov       rax, qword ptr [rbp + 0x3f0]
140bd84a4: mov       qword ptr [r12 + 0x10], rax
140bd84a9: movapd    xmm0, xmmword ptr [rbp + 0x3e0]
140bd84b1: movupd    xmmword ptr [r12], xmm0
140bd84b7: cmp       qword ptr [rbp + 0x728], 0
140bd84bf: je        0x140bd8c89
140bd84c5: mov       byte ptr [rbp + 0x631], 1
140bd84cc: mov       byte ptr [rbp + 0x630], 0
140bd84d3: mov       byte ptr [rbp + 0x62f], 1
140bd84da: mov       byte ptr [rbp + 0x62e], 1
140bd84e1: lea       rcx, [rbp + 0x220]
140bd84e8: mov       rdx, rbx
140bd84eb: call      0x14505bc40
140bd84f0: nop
140bd84f1: mov       rdi, qword ptr [rbp + 0x220]
140bd84f8: cmp       rdi, -2
140bd84fc: jne       0x140bd8517
140bd84fe: mov       r15, 0xffffffffffffffff
140bd8505: mov       rcx, qword ptr [rbp + 0x598]
140bd850c: cmp       dword ptr [rcx], 1
140bd850f: jne       0x140bd8c6e
140bd8515: jmp       0x140bd8585
140bd8517: mov       r15, qword ptr [rbp + 0x228]
140bd851e: mov       rbx, qword ptr [rbp + 0x230]
140bd8525: mov       r9, qword ptr [rbp + 0x238]
140bd852c: mov       rsi, qword ptr [rbp + 0x240]
140bd8533: mov       r12, qword ptr [rbp + 0x248]
140bd853a: movabs    rax, 0x8000000000000000
140bd8544: xor       rax, rdi
140bd8547: cmp       rax, 8
140bd854b: mov       ecx, 4
140bd8550: cmovb     rcx, rax
140bd8554: mov       r14, qword ptr [rbp + 0x250]
140bd855b: lea       rax, [rip + 0x53c7dee]
140bd8562: movsxd    rcx, dword ptr [rax + rcx*4]
140bd8566: add       rcx, rax
140bd8569: jmp       rcx
140bd856b: mov       r12, rbx
140bd856e: mov       rbx, qword ptr [rbp + 0x600]
140bd8575: mov       rcx, qword ptr [rbp + 0x598]
140bd857c: cmp       dword ptr [rcx], 1
140bd857f: jne       0x140bd8c6e
140bd8585: movupd    xmm6, xmmword ptr [rcx + 8]
140bd858a: xorps     xmm1, xmm1
140bd858d: ucomisd   xmm6, xmm1
140bd8591: jb        0x140bd8c6e
140bd8597: movsd     xmm0, qword ptr [rcx + 0x10]
140bd859c: ucomisd   xmm0, xmm1
140bd85a0: jb        0x140bd8c6e
140bd85a6: mov       eax, dword ptr [rcx + 0xc0]
140bd85ac: xorps     xmm1, xmm1
140bd85af: cvtsi2sd  xmm1, rax
140bd85b4: ucomisd   xmm1, xmm6
140bd85b8: jbe       0x140bd8c6e
140bd85be: mov       eax, dword ptr [rcx + 0xc4]
140bd85c4: xorps     xmm1, xmm1
140bd85c7: cvtsi2sd  xmm1, rax
140bd85cc: ucomisd   xmm1, xmm0
140bd85d0: jbe       0x140bd8c6e
140bd85d6: cmp       byte ptr [rcx + 0xb8], 0
140bd85dd: mov       rax, qword ptr [rbp + 0x198]
140bd85e4: cmovne    rax, qword ptr [rbp + 0x38]
140bd85e9: mov       qword ptr [rbp + 0x198], rax
140bd85f0: cmp       r15, -1
140bd85f4: je        0x140bd8c89
140bd85fa: mov       rax, qword ptr [rbp + 0x560]
140bd8601: mov       rdx, qword ptr [rax]
140bd8604: test      rdx, rdx
140bd8607: je        0x140bd877b
140bd860d: mov       qword ptr [rbp + 0x620], r15
140bd8614: mov       rcx, qword ptr [rbp + 0x198]
140bd861b: movss     xmm7, dword ptr [rcx]
140bd861f: mov       rcx, rax
140bd8622: mov       eax, dword ptr [rax + 0x1c]
140bd8625: mov       rcx, qword ptr [rcx + 0x10]
140bd8629: mov       dword ptr [rcx], eax
140bd862b: mov       r8, qword ptr [rbp + 0x710]
140bd8632: mov       eax, dword ptr [r8 + 0x1c]
140bd8636: mov       rcx, qword ptr [r8 + 0x10]
140bd863a: mov       dword ptr [rcx], eax
140bd863c: mov       rax, qword ptr [r8]
140bd863f: mov       qword ptr [rsp + 0x20], rax
140bd8644: lea       rcx, [rbp + 0x220]
140bd864b: mov       qword ptr [rbp + 0x5f0], r12
140bd8652: mov       r8, r12
140bd8655: call      0x14227aa60
140bd865a: nop
140bd865b: cmp       byte ptr [rbp + 0x220], 2
140bd8662: mov       r15, qword ptr [rbp + 0x620]
140bd8669: mov       r12, qword ptr [rbp + 0x5f0]
140bd8670: je        0x140bd877b
140bd8676: cvtpd2ps  xmm0, xmm6
140bd867a: movddup   xmm0, xmm0
140bd867e: shufps    xmm7, xmm7, 0
140bd8682: divps     xmm0, xmm7
140bd8685: mov       rax, qword ptr [rbp + 0x230]
140bd868c: mov       qword ptr [rbp + 0x468], rax
140bd8693: movups    xmm1, xmmword ptr [rbp + 0x220]
140bd869a: movups    xmmword ptr [rbp + 0x458], xmm1
140bd86a1: movaps    xmm1, xmmword ptr [rip + 0x5365588]
140bd86a8: addps     xmm1, xmm0
140bd86ab: movaps    xmm2, xmm1
140bd86ae: shufps    xmm2, xmm1, 0x4e
140bd86b2: movaps    xmm3, xmm1
140bd86b5: cmpltps   xmm3, xmm2
140bd86b9: movhlps   xmm1, xmm1
140bd86bc: andps     xmm0, xmm3
140bd86bf: andnps    xmm3, xmm1
140bd86c2: orps      xmm3, xmm0
140bd86c5: movaps    xmmword ptr [rbp + 0x400], xmm3
140bd86cc: mov       qword ptr [rbp + 0x418], 0xffffffffffffffff
140bd86d7: mov       qword ptr [rbp + 0x410], 0xffffffffffffffff
140bd86e2: movups    xmm0, xmmword ptr [rip + 0x53bc73b]
140bd86e9: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd86f0: movups    xmm0, xmmword ptr [rip + 0x53bc73d]
140bd86f7: movaps    xmmword ptr [rbp + 0x3f0], xmm0
140bd86fe: movapd    xmm0, xmmword ptr [rip + 0x51c4b8a]
140bd8706: movapd    xmmword ptr [rbp + 0x420], xmm0
140bd870e: mov       dword ptr [rbp + 0x504], 0
140bd8718: mov       dword ptr [rbp + 0x4dc], 0
140bd8722: mov       dword ptr [rbp + 0x4f0], 0
140bd872c: mov       qword ptr [rbp + 0x470], 0
140bd8737: mov       dword ptr [rbp + 0x50c], 0
140bd8741: mov       byte ptr [rbp + 0x510], 0
140bd8748: mov       byte ptr [rbp + 0x430], 2
140bd874f: mov       dword ptr [rbp + 0x4b8], 0
140bd8759: lea       rcx, [rbp + 0x3a0]
140bd8760: lea       rdx, [rbp + 0x3e0]
140bd8767: call      0x140b8d890
140bd876c: nop
140bd876d: mov       r15, qword ptr [rbp + 0x620]
140bd8774: mov       r12, qword ptr [rbp + 0x5f0]
140bd877b: test      r15, r15
140bd877e: jne       0x140bd8c78
140bd8784: jmp       0x140bd8c89
140bd8789: cmp       r15d, 0xa
140bd878d: jae       0x140bd887f
140bd8793: lea       rsi, [rip + 0x536760a]
140bd879a: mov       rbx, qword ptr [rbp + 0x600]
140bd87a1: jmp       0x140bd8c22
140bd87a6: mov       rdx, qword ptr [rbp + 0x258]
140bd87ad: lea       rax, [rdx - 1]
140bd87b1: cmp       rax, -3
140bd87b5: ja        0x140bd87c9
140bd87b7: mov       rcx, qword ptr [rbp + 0x260]
140bd87be: mov       r8d, 1
140bd87c4: call      0x1400021d0
140bd87c9: test      r15, r15
140bd87cc: je        0x140bd87df
140bd87ce: mov       r8d, 1
140bd87d4: mov       rcx, rbx
140bd87d7: mov       rdx, r15
140bd87da: call      0x1400021d0
140bd87df: mov       r15, rsi
140bd87e2: mov       r9, r14
140bd87e5: jmp       0x140bd856e
140bd87ea: lea       rax, [rbp + 0x258]
140bd87f1: mov       qword ptr [rbp + 0x3e0], rdi
140bd87f8: mov       qword ptr [rbp + 0x3e8], r15
140bd87ff: mov       qword ptr [rbp + 0x3f0], rbx
140bd8806: lea       rcx, [rbp + 0x3f8]
140bd880d: mov       qword ptr [rbp + 0x3f8], r9
140bd8814: mov       qword ptr [rbp + 0x400], rsi
140bd881b: mov       qword ptr [rbp + 0x408], r12
140bd8822: mov       qword ptr [rbp + 0x410], r14
140bd8829: movups    xmm0, xmmword ptr [rax]
140bd882c: movups    xmm1, xmmword ptr [rax + 0x10]
140bd8830: movups    xmm2, xmmword ptr [rax + 0x20]
140bd8834: movups    xmm3, xmmword ptr [rax + 0x30]
140bd8838: movups    xmmword ptr [rbp + 0x418], xmm0
140bd883f: movups    xmmword ptr [rbp + 0x428], xmm1
140bd8846: movups    xmmword ptr [rbp + 0x438], xmm2
140bd884d: movups    xmmword ptr [rbp + 0x448], xmm3
140bd8854: movups    xmm0, xmmword ptr [rax + 0x40]
140bd8858: movups    xmmword ptr [rbp + 0x458], xmm0
140bd885f: movupd    xmm0, xmmword ptr [rax + 0x50]
140bd8864: movupd    xmmword ptr [rbp + 0x468], xmm0
140bd886c: call      0x14056d990
140bd8871: mov       r12, r15
140bd8874: mov       r15, rdi
140bd8877: mov       r9, rbx
140bd887a: jmp       0x140bd856e
140bd887f: cmp       r15d, 0x64
140bd8883: mov       rbx, qword ptr [rbp + 0x600]
140bd888a: jae       0x140bd8898
140bd888c: lea       rsi, [rip + 0x53674f1]
140bd8893: jmp       0x140bd8c22
140bd8898: cmp       r15d, 0x3e8
140bd889f: jae       0x140bd89fb
140bd88a5: lea       rsi, [rip + 0x53674b8]
140bd88ac: jmp       0x140bd8c22
140bd88b1: mov       qword ptr [rbp + 0x388], r14
140bd88b8: cmp       r14, rdi
140bd88bb: jae       0x140bdb65c
140bd88c1: mov       qword ptr [rbp + 0x528], r13
140bd88c8: mov       qword ptr [rbp + 0x208], r12
140bd88cf: lea       rax, [rbp + 0x208]
140bd88d6: mov       qword ptr [rbp + 0x220], rax
140bd88dd: lea       rdi, [rip + 0x4a4ec]
140bd88e4: mov       qword ptr [rbp + 0x228], rdi
140bd88eb: mov       byte ptr [rbp + 0x637], 1
140bd88f2: mov       byte ptr [rbp + 0x636], 1
140bd88f9: mov       byte ptr [rbp + 0x635], 1
140bd8900: mov       byte ptr [rbp + 0x634], 1
140bd8907: lea       rdx, [rip + 0x5367052]
140bd890e: lea       rcx, [rbp + 0x3e0]
140bd8915: lea       r8, [rbp + 0x220]
140bd891c: call      0x145bcce30
140bd8921: nop
140bd8922: lea       rax, [rbp + 0x528]
140bd8929: mov       qword ptr [rbp + 0x220], rax
140bd8930: mov       qword ptr [rbp + 0x228], rdi
140bd8937: lea       rdx, [rip + 0x5367022]
140bd893e: lea       rcx, [rbp + 0x2e0]
140bd8945: lea       rdi, [rbp + 0x220]
140bd894c: mov       r8, rdi
140bd894f: call      0x145bcce30
140bd8954: nop
140bd8955: mov       rax, qword ptr [rbp + 0x3e0]
140bd895c: mov       qword ptr [rbp + 0x5b8], rax
140bd8963: mov       rax, qword ptr [rbp + 0x3e8]
140bd896a: mov       qword ptr [rbp + 0x5f8], rax
140bd8971: mov       r12, qword ptr [rbp + 0x3f0]
140bd8978: mov       rax, qword ptr [rbp + 0x2e0]
140bd897f: mov       qword ptr [rbp + 0x5a0], rax
140bd8986: mov       rax, qword ptr [rbp + 0x2e8]
140bd898d: mov       qword ptr [rbp + 0x5e0], rax
140bd8994: mov       r14, qword ptr [rbp + 0x2f0]
140bd899b: cmp       dword ptr [rbx], 1
140bd899e: jne       0x140bd8a6b
140bd89a4: mov       qword ptr [rbp + 0x220], 0xffffffffffffffff
140bd89af: jmp       0x140bd8a87
140bd89b4: cmp       qword ptr [rbp + 0x328], -1
140bd89bc: mov       rax, qword ptr [rbp + 0x610]
140bd89c3: mov       rax, qword ptr [rax + 0x58]
140bd89c7: je        0x140bd98b4
140bd89cd: cmp       rax, -1
140bd89d1: je        0x140bd75f7
140bd89d7: mov       rax, qword ptr [rbp + 0x5d0]
140bd89de: lea       rdx, [rax + 0x58]
140bd89e2: lea       rcx, [rbp + 0x328]
140bd89e9: call      0x140bfc1d0
140bd89ee: test      al, al
140bd89f0: je        0x140bd75f7
140bd89f6: jmp       0x140bd98be
140bd89fb: cmp       r15d, 0x2710
140bd8a02: jae       0x140bd8c09
140bd8a08: lea       rsi, [rip + 0x5367335]
140bd8a0f: jmp       0x140bd8c22
140bd8a14: test      r15, r15
140bd8a17: je        0x140bd7b98
140bd8a1d: mov       eax, dword ptr [rip + 0x746ddfd]
140bd8a23: test      eax, eax
140bd8a25: jne       0x140bda847
140bd8a2b: cmp       byte ptr [rip + 0x746ddf2], 1
140bd8a32: jne       0x140bd7c8d
140bd8a38: mov       byte ptr [rbp + 0x637], 1
140bd8a3f: mov       byte ptr [rbp + 0x636], 1
140bd8a46: mov       byte ptr [rbp + 0x635], 1
140bd8a4d: mov       byte ptr [rbp + 0x634], 1
140bd8a54: lea       rcx, [rip + 0x53bc0ca]
140bd8a5b: mov       edx, 0x5d
140bd8a60: call      0x145bb6590
140bd8a65: nop
140bd8a66: jmp       0x140bd7c8d
140bd8a6b: mov       r8d, dword ptr [rbx + 4]
140bd8a6f: mov       r9d, dword ptr [rbx + 8]
140bd8a73: lea       rcx, [rbp + 0x220]
140bd8a7a: mov       rdx, qword ptr [rbp + 0x600]
140bd8a81: call      0x1450331c0
140bd8a86: nop
140bd8a87: mov       qword ptr [rbp + 0x540], rsi
140bd8a8e: mov       r9d, 0x118
140bd8a94: cmp       r12, 0x118
140bd8a9b: mov       eax, 0x118
140bd8aa0: cmovb     rax, r12
140bd8aa4: jbe       0x140bd8ab7
140bd8aa6: mov       rcx, qword ptr [rbp + 0x5f8]
140bd8aad: cmp       byte ptr [rcx + rax], 0xbf
140bd8ab1: jle       0x140bdb6d0
140bd8ab7: mov       rcx, qword ptr [rbp + 0x5f8]
140bd8abe: mov       qword ptr [rbp + 0x580], rcx
140bd8ac5: mov       qword ptr [rbp + 0x588], rax
140bd8acc: cmp       r14, 0x118
140bd8ad3: cmovb     r9, r14
140bd8ad7: jbe       0x140bd8aeb
140bd8ad9: mov       rax, qword ptr [rbp + 0x5e0]
140bd8ae0: cmp       byte ptr [rax + r9], 0xc0
140bd8ae5: jl        0x140bdb6f7
140bd8aeb: mov       rax, qword ptr [rbp + 0x5e0]
140bd8af2: mov       qword ptr [rbp + 0x1d8], rax
140bd8af9: mov       qword ptr [rbp + 0x1e0], r9
140bd8b00: lea       rax, [rbp + 0x388]
140bd8b07: mov       qword ptr [rbp + 0x3e0], rax
140bd8b0e: lea       rax, [rip + 0x5006cbb]
140bd8b15: mov       qword ptr [rbp + 0x3e8], rax
140bd8b1c: lea       rcx, [rbp + 0x540]
140bd8b23: mov       qword ptr [rbp + 0x3f0], rcx
140bd8b2a: mov       qword ptr [rbp + 0x3f8], rax
140bd8b31: mov       qword ptr [rbp + 0x400], rbx
140bd8b38: lea       rax, [rip + 0x58821]
140bd8b3f: mov       qword ptr [rbp + 0x408], rax
140bd8b46: mov       qword ptr [rbp + 0x410], rdi
140bd8b4d: lea       rax, [rip + 0x582cc]
140bd8b54: mov       qword ptr [rbp + 0x418], rax
140bd8b5b: lea       rax, [rbp + 0x580]
140bd8b62: mov       qword ptr [rbp + 0x420], rax
140bd8b69: lea       rax, [rip - 0xbd6ab0]
140bd8b70: mov       qword ptr [rbp + 0x428], rax
140bd8b77: lea       rcx, [rbp + 0x1d8]
140bd8b7e: mov       qword ptr [rbp + 0x430], rcx
140bd8b85: mov       qword ptr [rbp + 0x438], rax
140bd8b8c: lea       rcx, [rip + 0x53bc5ad]
140bd8b93: lea       rdx, [rbp + 0x3e0]
140bd8b9a: call      0x145bb6590
140bd8b9f: nop
140bd8ba0: mov       rdx, qword ptr [rbp + 0x220]
140bd8ba7: cmp       rdx, -1
140bd8bab: je        0x140bd8bc4
140bd8bad: test      rdx, rdx
140bd8bb0: je        0x140bd8bc4
140bd8bb2: mov       rcx, qword ptr [rbp + 0x228]
140bd8bb9: mov       r8d, 1
140bd8bbf: call      0x1400021d0
140bd8bc4: mov       rdx, qword ptr [rbp + 0x5a0]
140bd8bcb: test      rdx, rdx
140bd8bce: je        0x140bd8be2
140bd8bd0: mov       r8d, 1
140bd8bd6: mov       rcx, qword ptr [rbp + 0x5e0]
140bd8bdd: call      0x1400021d0
140bd8be2: mov       rdx, qword ptr [rbp + 0x5b8]
140bd8be9: test      rdx, rdx
140bd8bec: je        0x140bd7a58
140bd8bf2: mov       r8d, 1
140bd8bf8: mov       rcx, qword ptr [rbp + 0x5f8]
140bd8bff: call      0x1400021d0
140bd8c04: jmp       0x140bd7a58
140bd8c09: cmp       r15d, 0x186a0
140bd8c10: lea       rax, [rip + 0x536710d]
140bd8c17: lea       rsi, [rip + 0x53670e6]
140bd8c1e: cmovb     rsi, rax
140bd8c22: call      0x140002200
140bd8c27: mov       r15d, 0x20
140bd8c2d: mov       ecx, 0x20
140bd8c32: mov       edx, 1
140bd8c37: call      0x1400021c0
140bd8c3c: test      rax, rax
140bd8c3f: je        0x140bdb57d
140bd8c45: mov       r12, rax
140bd8c48: movupd    xmm0, xmmword ptr [rsi]
140bd8c4c: movups    xmm1, xmmword ptr [rsi + 0x10]
140bd8c50: movups    xmmword ptr [rax + 0x10], xmm1
140bd8c54: movupd    xmmword ptr [rax], xmm0
140bd8c58: mov       r9d, 0x20
140bd8c5e: mov       rcx, qword ptr [rbp + 0x598]
140bd8c65: cmp       dword ptr [rcx], 1
140bd8c68: je        0x140bd8585
140bd8c6e: lea       rax, [r15 - 1]
140bd8c72: cmp       rax, -2
140bd8c76: jae       0x140bd8c89
140bd8c78: mov       r8d, 1
140bd8c7e: mov       rcx, r12
140bd8c81: mov       rdx, r15
140bd8c84: call      0x1400021d0
140bd8c89: mov       eax, dword ptr [rbp + 0x5c8]
140bd8c8f: mov       dword ptr [r13], eax
140bd8c93: mov       rax, qword ptr [rbp + 0xf8]
140bd8c9a: mov       qword ptr [rbp + 0x3f0], rax
140bd8ca1: movdqu    xmm0, xmmword ptr [rbp + 0xe8]
140bd8ca9: movdqa    xmmword ptr [rbp + 0x3e0], xmm0
140bd8cb1: mov       byte ptr [rbp + 0x631], 1
140bd8cb8: mov       byte ptr [rbp + 0x630], 0
140bd8cbf: mov       byte ptr [rbp + 0x62f], 0
140bd8cc6: mov       byte ptr [rbp + 0x62e], 1
140bd8ccd: lea       rdx, [rbp + 0x3e0]
140bd8cd4: mov       rcx, rbx
140bd8cd7: call      0x1450149f0
140bd8cdc: nop
140bd8cdd: mov       rdx, qword ptr [rbp + 0x738]
140bd8ce4: mov       eax, dword ptr [rdx + 0x1c]
140bd8ce7: mov       rcx, qword ptr [rdx + 0x10]
140bd8ceb: mov       dword ptr [rcx], eax
140bd8ced: mov       rax, qword ptr [rdx]
140bd8cf0: movaps    xmm0, xmmword ptr [rbp - 0x10]
140bd8cf4: movaps    xmm1, xmmword ptr [rbp]
140bd8cf8: movaps    xmm2, xmmword ptr [rbp + 0x10]
140bd8cfc: movaps    xmm3, xmmword ptr [rbp + 0x20]
140bd8d00: movaps    xmmword ptr [rax + 0x30], xmm3
140bd8d04: movaps    xmmword ptr [rax + 0x20], xmm2
140bd8d08: movaps    xmmword ptr [rax + 0x10], xmm1
140bd8d0c: movaps    xmmword ptr [rax], xmm0
140bd8d0f: movdqa    xmm0, xmmword ptr [rbp + 0x100]
140bd8d17: movaps    xmm1, xmmword ptr [rbp + 0x110]
140bd8d1e: movdqa    xmmword ptr [rbp + 0x3e0], xmm0
140bd8d26: mov       rax, qword ptr [rbp + 0x120]
140bd8d2d: mov       qword ptr [rbp + 0x400], rax
140bd8d34: movaps    xmmword ptr [rbp + 0x3f0], xmm1
140bd8d3b: mov       rsi, qword ptr [rbp + 0x3e0]
140bd8d42: cmp       rsi, 2
140bd8d46: je        0x140bd8dab
140bd8d48: lea       rdx, [rbp + 0x3f8]
140bd8d4f: lea       rcx, [rbp + 0x3e0]
140bd8d56: call      0x144c5f2e0
140bd8d5b: nop
140bd8d5c: mov       rdx, qword ptr [rbp + 0x3f8]
140bd8d63: lea       rcx, [rbp + 0x3e0]
140bd8d6a: call      0x144c5f340
140bd8d6f: nop
140bd8d70: test      rsi, rsi
140bd8d73: je        0x140bd8dab
140bd8d75: mov       rax, qword ptr [rbp + 0x3e8]
140bd8d7c: lock dec  qword ptr [rax]
140bd8d80: jne       0x140bd8dab
140bd8d82: lea       rcx, [rbp + 0x3e8]
140bd8d89: mov       byte ptr [rbp + 0x631], 1
140bd8d90: mov       byte ptr [rbp + 0x630], 0
140bd8d97: mov       byte ptr [rbp + 0x62f], 0
140bd8d9e: mov       byte ptr [rbp + 0x62e], 0
140bd8da5: call      0x1403e4380
140bd8daa: nop
140bd8dab: xor       ecx, ecx
140bd8dad: cmp       byte ptr [rbp + 0x578], 1
140bd8db4: mov       edx, 0
140bd8db9: jne       0x140bd8e5d
140bd8dbf: mov       byte ptr [rbp + 0x631], 1
140bd8dc6: mov       byte ptr [rbp + 0x630], 0
140bd8dcd: mov       byte ptr [rbp + 0x62f], 0
140bd8dd4: mov       byte ptr [rbp + 0x62e], 0
140bd8ddb: call      0x145ba4280
140bd8de0: nop
140bd8de1: mov       rcx, qword ptr [rbp + 0x568]
140bd8de8: mov       r8d, dword ptr [rbp + 0x570]
140bd8def: mov       qword ptr [rbp + 0x568], rax
140bd8df6: mov       dword ptr [rbp + 0x570], edx
140bd8dfc: cmp       r8d, -1
140bd8e00: je        0x140bd8e59
140bd8e02: mov       qword ptr [rbp + 0x3e0], rcx
140bd8e09: mov       dword ptr [rbp + 0x3e8], r8d
140bd8e10: mov       byte ptr [rbp + 0x631], 1
140bd8e17: mov       byte ptr [rbp + 0x630], 0
140bd8e1e: mov       byte ptr [rbp + 0x62f], 0
140bd8e25: mov       byte ptr [rbp + 0x62e], 0
140bd8e2c: lea       rcx, [rbp + 0x3e0]
140bd8e33: call      0x145ba43d0
140bd8e38: nop
140bd8e39: mov       ecx, edx
140bd8e3b: mov       edx, 0xf4240
140bd8e40: mul       rdx
140bd8e43: mov       ecx, ecx
140bd8e45: imul      rcx, rcx, 0x10624dd3
140bd8e4c: shr       rcx, 0x26
140bd8e50: add       rcx, rax
140bd8e53: adc       rdx, 0
140bd8e57: jmp       0x140bd8e5d
140bd8e59: xor       ecx, ecx
140bd8e5b: xor       edx, edx
140bd8e5d: mov       qword ptr [rbp + 0x540], rcx
140bd8e64: mov       qword ptr [rbp + 0x548], rdx
140bd8e6b: mov       rax, qword ptr [rip + 0x74a4136]
140bd8e72: mov       rax, qword ptr [rax]
140bd8e75: cmp       rax, 3
140bd8e79: jae       0x140bd8f41
140bd8e7f: movzx     edx, byte ptr [rip + 0x746d8e2]
140bd8e86: movzx     eax, dl
140bd8e89: lea       ecx, [rax - 1]
140bd8e8c: cmp       ecx, 2
140bd8e8f: jae       0x140bd8f39
140bd8e95: mov       rcx, qword ptr [rip + 0x746d8bc]
140bd8e9c: mov       byte ptr [rbp + 0x631], 1
140bd8ea3: mov       byte ptr [rbp + 0x630], 0
140bd8eaa: mov       byte ptr [rbp + 0x62f], 0
140bd8eb1: mov       byte ptr [rbp + 0x62e], 0
140bd8eb8: call      0x144c5d8d0
140bd8ebd: nop
140bd8ebe: test      al, al
140bd8ec0: je        0x140bd8f41
140bd8ec2: mov       rdx, qword ptr [rip + 0x746d88f]
140bd8ec9: lea       rax, [rdx + 0x30]
140bd8ecd: mov       qword ptr [rbp + 0x3e0], 1
140bd8ed8: mov       qword ptr [rbp + 0x3e8], 8
140bd8ee3: mov       qword ptr [rbp + 0x3f0], 0
140bd8eee: mov       qword ptr [rbp + 0x3f8], rax
140bd8ef5: mov       byte ptr [rbp + 0x631], 1
140bd8efc: mov       byte ptr [rbp + 0x630], 0
140bd8f03: mov       byte ptr [rbp + 0x62f], 0
140bd8f0a: mov       byte ptr [rbp + 0x62e], 0
140bd8f11: lea       rcx, [rbp + 0x48]
140bd8f15: lea       r8, [rbp + 0x3e0]
140bd8f1c: call      0x144c5d660
140bd8f21: nop
140bd8f22: cmp       qword ptr [rbp + 0x48], 2
140bd8f27: je        0x140bd8f51
140bd8f29: lea       rdx, [rbp + 0x60]
140bd8f2d: lea       rcx, [rbp + 0x48]
140bd8f31: call      0x144c5f310
140bd8f36: nop
140bd8f37: jmp       0x140bd8f51
140bd8f39: test      eax, eax
140bd8f3b: jne       0x140bda174
140bd8f41: mov       qword ptr [rbp + 0x48], 2
140bd8f49: mov       qword ptr [rbp + 0x68], 0
140bd8f51: mov       rax, qword ptr [rbp + 0x68]
140bd8f55: mov       qword ptr [rbp + 0x240], rax
140bd8f5c: mov       rax, qword ptr [rbp + 0x48]
140bd8f60: mov       rcx, qword ptr [rbp + 0x50]
140bd8f64: movups    xmm0, xmmword ptr [rbp + 0x58]
140bd8f68: movaps    xmmword ptr [rbp + 0x230], xmm0
140bd8f6f: mov       qword ptr [rbp + 0x220], rax
140bd8f76: mov       qword ptr [rbp + 0x228], rcx
140bd8f7d: mov       rsi, qword ptr [rbp + 0x3b0]
140bd8f84: mov       qword ptr [rbp + 0x528], rsi
140bd8f8b: mov       rax, qword ptr [rbp + 0x5b0]
140bd8f92: mov       r15, qword ptr [rax]
140bd8f95: cmp       qword ptr [r15 + 0x10], rsi
140bd8f99: jne       0x140bd8ff4
140bd8f9b: mov       r14b, 1
140bd8f9e: test      rsi, rsi
140bd8fa1: je        0x140bd8fd2
140bd8fa3: mov       rdi, qword ptr [rbp + 0x3a8]
140bd8faa: mov       rbx, qword ptr [r15 + 8]
140bd8fae: nop
140bd8fb0: mov       rcx, rbx
140bd8fb3: mov       rdx, rdi
140bd8fb6: call      0x140c58820
140bd8fbb: test      al, al
140bd8fbd: je        0x140bd8ff4
140bd8fbf: add       rdi, 0x140
140bd8fc6: add       rbx, 0x140
140bd8fcd: dec       rsi
140bd8fd0: jne       0x140bd8fb0
140bd8fd2: xor       esi, esi
140bd8fd4: mov       rbx, qword ptr [rbp + 0x600]
140bd8fdb: cmp       byte ptr [rbp + 0x5ac], 0
140bd8fe2: mov       dword ptr [rbp + 0x620], r14d
140bd8fe9: jne       0x140bd937e
140bd8fef: jmp       0x140bd9794
140bd8ff4: mov       eax, dword ptr [rip + 0x746d81e]
140bd8ffa: test      eax, eax
140bd8ffc: jne       0x140bd9e64
140bd9002: cmp       byte ptr [rip + 0x746d813], 0
140bd9009: mov       qword ptr [rbp + 0x620], r15
140bd9010: je        0x140bd92e0
140bd9016: mov       rbx, qword ptr [r15 + 0x10]
140bd901a: mov       rdi, qword ptr [rbp + 0x3b0]
140bd9021: cmp       rdi, rbx
140bd9024: mov       rsi, rbx
140bd9027: cmovb     rsi, rdi
140bd902b: test      rsi, rsi
140bd902e: je        0x140bd9070
140bd9030: mov       rax, qword ptr [rbp + 0x620]
140bd9037: mov       r15, qword ptr [rax + 8]
140bd903b: mov       r12, qword ptr [rbp + 0x3a8]
140bd9042: xor       r14d, r14d
140bd9045: xor       r13d, r13d
140bd9048: nop       dword ptr [rax + rax]
140bd9050: lea       rcx, [r15 + r13]
140bd9054: lea       rdx, [r12 + r13]
140bd9058: call      0x140c58820
140bd905d: test      al, al
140bd905f: je        0x140bd90d6
140bd9061: inc       r14
140bd9064: add       r13, 0x140
140bd906b: cmp       rsi, r14
140bd906e: jne       0x140bd9050
140bd9070: mov       qword ptr [rbp + 0x580], rbx
140bd9077: mov       qword ptr [rbp + 0x2e0], rdi
140bd907e: lea       rax, [rbp + 0x580]
140bd9085: mov       qword ptr [rbp + 0x3e0], rax
140bd908c: lea       rax, [rip + 0x500673d]
140bd9093: mov       qword ptr [rbp + 0x3e8], rax
140bd909a: lea       rcx, [rbp + 0x2e0]
140bd90a1: mov       qword ptr [rbp + 0x3f0], rcx
140bd90a8: mov       qword ptr [rbp + 0x3f8], rax
140bd90af: mov       byte ptr [rbp + 0x62b], 1
140bd90b6: lea       rcx, [rip + 0x53bbb0a]
140bd90bd: lea       rdx, [rbp + 0x3e0]
140bd90c4: call      0x145bb6590
140bd90c9: nop
140bd90ca: mov       r15, qword ptr [rbp + 0x620]
140bd90d1: jmp       0x140bd92e0
140bd90d6: mov       qword ptr [rbp + 0x580], r14
140bd90dd: cmp       r14, rbx
140bd90e0: jae       0x140bdb52d
140bd90e6: cmp       r14, rdi
140bd90e9: jae       0x140bdb54c
140bd90ef: cmp       byte ptr [r12 + r13 + 0x78], 0
140bd90f5: je        0x140bd90fb
140bd90f7: xor       eax, eax
140bd90f9: jmp       0x140bd9111
140bd90fb: mov       rcx, qword ptr [r12 + r13 + 0x80]
140bd9103: lea       rdx, [rcx + 0x20]
140bd9107: xor       eax, eax
140bd9109: cmp       dword ptr [rcx + 0x20], -1
140bd910d: cmovne    rax, rdx
140bd9111: mov       qword ptr [rbp + 0x2e0], rax
140bd9118: movss     xmm0, dword ptr [r12 + r13]
140bd911e: mov       al, 1
140bd9120: ucomiss   xmm0, dword ptr [r15 + r13]
140bd9125: mov       cl, 1
140bd9127: jne       0x140bd91bb
140bd912d: jp        0x140bd91bb
140bd9133: movss     xmm0, dword ptr [r12 + r13 + 4]
140bd913a: ucomiss   xmm0, dword ptr [r15 + r13 + 4]
140bd9140: mov       cl, 1
140bd9142: jne       0x140bd91bb
140bd9144: jp        0x140bd91bb
140bd9146: movss     xmm0, dword ptr [r12 + r13 + 8]
140bd914d: ucomiss   xmm0, dword ptr [r15 + r13 + 8]
140bd9153: mov       cl, 1
140bd9155: jne       0x140bd91bb
140bd9157: jp        0x140bd91bb
140bd9159: movss     xmm0, dword ptr [r12 + r13 + 0xc]
140bd9160: ucomiss   xmm0, dword ptr [r15 + r13 + 0xc]
140bd9166: mov       cl, 1
140bd9168: jne       0x140bd91bb
140bd916a: jp        0x140bd91bb
140bd916c: movss     xmm0, dword ptr [r12 + r13 + 0x10]
140bd9173: ucomiss   xmm0, dword ptr [r15 + r13 + 0x10]
140bd9179: mov       cl, 1
140bd917b: jne       0x140bd91bb
140bd917d: jp        0x140bd91bb
140bd917f: movss     xmm0, dword ptr [r12 + r13 + 0x14]
140bd9186: ucomiss   xmm0, dword ptr [r15 + r13 + 0x14]
140bd918c: mov       cl, 1
140bd918e: jne       0x140bd91bb
140bd9190: jp        0x140bd91bb
140bd9192: movss     xmm0, dword ptr [r12 + r13 + 0x18]
140bd9199: ucomiss   xmm0, dword ptr [r15 + r13 + 0x18]
140bd919f: mov       cl, 1
140bd91a1: jne       0x140bd91bb
140bd91a3: jp        0x140bd91bb
140bd91a5: movss     xmm0, dword ptr [r15 + r13 + 0x1c]
140bd91ac: cmpneqss  xmm0, dword ptr [r12 + r13 + 0x1c]
140bd91b4: movd      ecx, xmm0
140bd91b8: and       ecx, 1
140bd91bb: mov       byte ptr [rbp + 0x388], cl
140bd91c1: movss     xmm0, dword ptr [r12 + r13 + 0x40]
140bd91c8: ucomiss   xmm0, dword ptr [r15 + r13 + 0x40]
140bd91ce: jne       0x140bd920a
140bd91d0: jp        0x140bd920a
140bd91d2: movss     xmm0, dword ptr [r12 + r13 + 0x44]
140bd91d9: ucomiss   xmm0, dword ptr [r15 + r13 + 0x44]
140bd91df: jne       0x140bd920a
140bd91e1: jp        0x140bd920a
140bd91e3: movss     xmm0, dword ptr [r12 + r13 + 0x48]
140bd91ea: ucomiss   xmm0, dword ptr [r15 + r13 + 0x48]
140bd91f0: jne       0x140bd920a
140bd91f2: jp        0x140bd920a
140bd91f4: movss     xmm0, dword ptr [r15 + r13 + 0x4c]
140bd91fb: cmpneqss  xmm0, dword ptr [r12 + r13 + 0x4c]
140bd9203: movd      eax, xmm0
140bd9207: and       eax, 1
140bd920a: lea       rcx, [r15 + r13]
140bd920e: add       rcx, 0x20
140bd9212: lea       rdx, [r12 + r13 + 0x20]
140bd9217: mov       byte ptr [rbp + 0x208], al
140bd921d: lea       rax, [rbp + 0x580]
140bd9224: mov       qword ptr [rbp + 0x3e0], rax
140bd922b: lea       rax, [rip + 0x500659e]
140bd9232: mov       qword ptr [rbp + 0x3e8], rax
140bd9239: lea       r8, [rbp + 0x528]
140bd9240: mov       qword ptr [rbp + 0x3f0], r8
140bd9247: mov       qword ptr [rbp + 0x3f8], rax
140bd924e: lea       rax, [rbp + 0x2e0]
140bd9255: mov       qword ptr [rbp + 0x400], rax
140bd925c: lea       rax, [rip + 0x57dfd]
140bd9263: mov       qword ptr [rbp + 0x408], rax
140bd926a: mov       qword ptr [rbp + 0x410], rcx
140bd9271: lea       rax, [rip + 0x4d4c8]
140bd9278: mov       qword ptr [rbp + 0x418], rax
140bd927f: mov       qword ptr [rbp + 0x420], rdx
140bd9286: mov       qword ptr [rbp + 0x428], rax
140bd928d: lea       rax, [rbp + 0x388]
140bd9294: mov       qword ptr [rbp + 0x430], rax
140bd929b: lea       rax, [rip + 0x500666e]
140bd92a2: mov       qword ptr [rbp + 0x438], rax
140bd92a9: lea       rcx, [rbp + 0x208]
140bd92b0: mov       qword ptr [rbp + 0x440], rcx
140bd92b7: mov       qword ptr [rbp + 0x448], rax
140bd92be: mov       byte ptr [rbp + 0x62b], 1
140bd92c5: lea       rcx, [rip + 0x53bb95c]
140bd92cc: lea       rdx, [rbp + 0x3e0]
140bd92d3: call      0x145bb6590
140bd92d8: nop
140bd92d9: mov       r15, qword ptr [rbp + 0x620]
140bd92e0: mov       rax, qword ptr [rbp + 0x3b0]
140bd92e7: mov       qword ptr [rbp + 0x3f0], rax
140bd92ee: movups    xmm0, xmmword ptr [rbp + 0x3a0]
140bd92f5: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd92fc: mov       rax, qword ptr [rbp + 0x5b0]
140bd9303: mov       esi, dword ptr [rax + 0x1c]
140bd9306: mov       rdi, qword ptr [rax + 0x10]
140bd930a: mov       dword ptr [rdi], esi
140bd930c: mov       rcx, qword ptr [r15 + 8]
140bd9310: mov       rdx, qword ptr [r15 + 0x10]
140bd9314: call      0x140ad9d70
140bd9319: nop
140bd931a: mov       r14, qword ptr [rbp + 0x620]
140bd9321: mov       rax, qword ptr [r14]
140bd9324: test      rax, rax
140bd9327: mov       rbx, qword ptr [rbp + 0x600]
140bd932e: je        0x140bd9347
140bd9330: mov       rcx, qword ptr [r14 + 8]
140bd9334: shl       rax, 6
140bd9338: lea       rdx, [rax + rax*4]
140bd933c: mov       r8d, 0x10
140bd9342: call      0x1400021d0
140bd9347: mov       rax, qword ptr [rbp + 0x3f0]
140bd934e: mov       qword ptr [r14 + 0x10], rax
140bd9352: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bd9359: movups    xmmword ptr [r14], xmm0
140bd935d: mov       dword ptr [rdi], esi
140bd935f: mov       byte ptr [r14 + 0x48], 1
140bd9364: mov       sil, 1
140bd9367: xor       r14d, r14d
140bd936a: cmp       byte ptr [rbp + 0x5ac], 0
140bd9371: mov       dword ptr [rbp + 0x620], r14d
140bd9378: je        0x140bd9794
140bd937e: xor       ecx, ecx
140bd9380: cmp       byte ptr [rbp + 0x578], 1
140bd9387: mov       edx, 0
140bd938c: jne       0x140bd9409
140bd938e: mov       byte ptr [rbp + 0x62b], r14b
140bd9395: call      0x145ba4280
140bd939a: nop
140bd939b: mov       rcx, qword ptr [rbp + 0x568]
140bd93a2: mov       r8d, dword ptr [rbp + 0x570]
140bd93a9: mov       qword ptr [rbp + 0x568], rax
140bd93b0: mov       dword ptr [rbp + 0x570], edx
140bd93b6: cmp       r8d, -1
140bd93ba: je        0x140bd93fe
140bd93bc: mov       qword ptr [rbp + 0x3e0], rcx
140bd93c3: mov       dword ptr [rbp + 0x3e8], r8d
140bd93ca: mov       byte ptr [rbp + 0x62b], r14b
140bd93d1: lea       rcx, [rbp + 0x3e0]
140bd93d8: call      0x145ba43d0
140bd93dd: nop
140bd93de: mov       ecx, edx
140bd93e0: mov       edx, 0xf4240
140bd93e5: mul       rdx
140bd93e8: mov       ecx, ecx
140bd93ea: imul      rcx, rcx, 0x10624dd3
140bd93f1: shr       rcx, 0x26
140bd93f5: add       rcx, rax
140bd93f8: adc       rdx, 0
140bd93fc: jmp       0x140bd9402
140bd93fe: xor       ecx, ecx
140bd9400: xor       edx, edx
140bd9402: mov       rbx, qword ptr [rbp + 0x600]
140bd9409: mov       qword ptr [rbp + 0x580], rcx
140bd9410: mov       qword ptr [rbp + 0x588], rdx
140bd9417: mov       byte ptr [rbp + 0x62b], r14b
140bd941e: mov       rcx, rbx
140bd9421: call      0x145014720
140bd9426: nop
140bd9427: mov       dword ptr [rbp + 0x5ac], esi
140bd942d: sub       rax, qword ptr [rbp + 0x370]
140bd9434: mov       qword ptr [rbp + 0x208], rax
140bd943b: mov       rax, qword ptr [rbp + 0x748]
140bd9442: mov       rbx, qword ptr [rax]
140bd9445: mov       rcx, qword ptr [rbx + 0x60]
140bd9449: mov       qword ptr [rbp + 0x5f0], rcx
140bd9450: mov       edi, dword ptr [rax + 0x1c]
140bd9453: mov       r14, qword ptr [rax + 0x10]
140bd9457: mov       dword ptr [r14], edi
140bd945a: mov       rax, qword ptr [rbx + 0xa0]
140bd9461: mov       qword ptr [rbp + 0x3f0], rax
140bd9468: movups    xmm0, xmmword ptr [rbx + 0x90]
140bd946f: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd9476: mov       qword ptr [rbx + 0x90], 0
140bd9481: mov       qword ptr [rbx + 0x98], 8
140bd948c: mov       qword ptr [rbx + 0xa0], 0
140bd9497: mov       rcx, qword ptr [rbp + 0x600]
140bd949e: call      0x145015b40
140bd94a3: nop
140bd94a4: mov       rsi, rax
140bd94a7: mov       rax, qword ptr [rbp + 0x3f0]
140bd94ae: mov       qword ptr [rbp + 0x2f0], rax
140bd94b5: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bd94bc: movaps    xmmword ptr [rbp + 0x2e0], xmm0
140bd94c3: mov       rax, qword ptr [rbp + 0x1c0]
140bd94ca: mov       qword ptr [rbp + 0x600], rax
140bd94d1: mov       rax, qword ptr [rbp + 0x1c8]
140bd94d8: mov       qword ptr [rbp + 0x5c8], rax
140bd94df: mov       r15, qword ptr [rbp + 0x1b0]
140bd94e6: mov       r12, qword ptr [rbp + 0x1b8]
140bd94ed: mov       r13, qword ptr [rbp + 0x540]
140bd94f4: mov       rax, qword ptr [rbp + 0x548]
140bd94fb: mov       qword ptr [rbp + 0x610], rax
140bd9502: mov       rax, qword ptr [rbp + 0x580]
140bd9509: mov       qword ptr [rbp + 0x5b0], rax
140bd9510: mov       rax, qword ptr [rbp + 0x588]
140bd9517: mov       qword ptr [rbp + 0x5d0], rax
140bd951e: mov       rax, qword ptr [rbp + 0x528]
140bd9525: mov       qword ptr [rbp + 0x5f8], rax
140bd952c: mov       rax, qword ptr [rbp + 0x208]
140bd9533: mov       qword ptr [rbp + 0x560], rax
140bd953a: mov       dword ptr [r14], edi
140bd953d: mov       rdi, qword ptr [rbx + 0xa0]
140bd9544: test      rdi, rdi
140bd9547: je        0x140bd9582
140bd9549: mov       r14, qword ptr [rbx + 0x98]
140bd9550: add       r14, 8
140bd9554: jmp       0x140bd9569
140bd9556: nop       word ptr cs:[rax + rax]
140bd9560: add       r14, 0x18
140bd9564: dec       rdi
140bd9567: je        0x140bd9582
140bd9569: mov       rdx, qword ptr [r14 - 8]
140bd956d: test      rdx, rdx
140bd9570: je        0x140bd9560
140bd9572: mov       rcx, qword ptr [r14]
140bd9575: mov       r8d, 1
140bd957b: call      0x1400021d0
140bd9580: jmp       0x140bd9560
140bd9582: sub       rsi, qword ptr [rbp + 0x190]
140bd9589: lea       rdi, [rbx + 0x90]
140bd9590: mov       rax, qword ptr [rdi]
140bd9593: test      rax, rax
140bd9596: je        0x140bd95b2
140bd9598: mov       rcx, qword ptr [rbx + 0x98]
140bd959f: shl       rax, 3
140bd95a3: lea       rdx, [rax + rax*2]
140bd95a7: mov       r8d, 8
140bd95ad: call      0x1400021d0
140bd95b2: mov       rax, qword ptr [rbp + 0x188]
140bd95b9: mov       qword ptr [rbx], rax
140bd95bc: mov       rax, qword ptr [rbp + 0x180]
140bd95c3: mov       qword ptr [rbx + 8], rax
140bd95c7: mov       rax, qword ptr [rbp + 0x178]
140bd95ce: mov       qword ptr [rbx + 0x10], rax
140bd95d2: mov       rax, qword ptr [rbp + 0x170]
140bd95d9: mov       qword ptr [rbx + 0x18], rax
140bd95dd: mov       rax, qword ptr [rbp + 0x600]
140bd95e4: mov       qword ptr [rbx + 0x20], rax
140bd95e8: mov       rax, qword ptr [rbp + 0x5c8]
140bd95ef: mov       qword ptr [rbx + 0x28], rax
140bd95f3: mov       qword ptr [rbx + 0x30], r15
140bd95f7: mov       qword ptr [rbx + 0x38], r12
140bd95fb: mov       qword ptr [rbx + 0x40], r13
140bd95ff: mov       rax, qword ptr [rbp + 0x610]
140bd9606: mov       qword ptr [rbx + 0x48], rax
140bd960a: mov       rax, qword ptr [rbp + 0x5b0]
140bd9611: mov       qword ptr [rbx + 0x50], rax
140bd9615: mov       rax, qword ptr [rbp + 0x5d0]
140bd961c: mov       qword ptr [rbx + 0x58], rax
140bd9620: mov       rax, qword ptr [rbp + 0x5f0]
140bd9627: mov       qword ptr [rbx + 0x60], rax
140bd962b: mov       rax, qword ptr [rbp + 0x5f8]
140bd9632: mov       qword ptr [rbx + 0x68], rax
140bd9636: mov       rax, qword ptr [rbp + 0x560]
140bd963d: mov       qword ptr [rbx + 0x70], rax
140bd9641: mov       qword ptr [rbx + 0x78], rsi
140bd9645: xorps     xmm0, xmm0
140bd9648: movaps    xmmword ptr [rbx + 0x80], xmm0
140bd964f: mov       rax, qword ptr [rbp + 0x2f0]
140bd9656: mov       qword ptr [rdi + 0x10], rax
140bd965a: movaps    xmm0, xmmword ptr [rbp + 0x2e0]
140bd9661: movaps    xmmword ptr [rdi], xmm0
140bd9664: mov       byte ptr [rbx + 0xa8], 0
140bd966b: cmp       byte ptr [rbp + 0x5ef], 0
140bd9672: mov       r14d, dword ptr [rbp + 0x620]
140bd9679: je        0x140bd9794
140bd967f: mov       eax, dword ptr [rbp + 0x5ac]
140bd9685: mov       byte ptr [rbp + 0x2e0], al
140bd968b: lea       rax, [rbp + 0xd0]
140bd9692: mov       qword ptr [rbp + 0x3e0], rax
140bd9699: lea       rax, [rip + 0x5001b10]
140bd96a0: mov       qword ptr [rbp + 0x3e8], rax
140bd96a7: lea       rcx, [rbp + 0xc0]
140bd96ae: mov       qword ptr [rbp + 0x3f0], rcx
140bd96b5: mov       qword ptr [rbp + 0x3f8], rax
140bd96bc: lea       rcx, [rbp + 0x1c0]
140bd96c3: mov       qword ptr [rbp + 0x400], rcx
140bd96ca: mov       qword ptr [rbp + 0x408], rax
140bd96d1: lea       rcx, [rbp + 0x1b0]
140bd96d8: mov       qword ptr [rbp + 0x410], rcx
140bd96df: mov       qword ptr [rbp + 0x418], rax
140bd96e6: lea       rcx, [rbp + 0x540]
140bd96ed: mov       qword ptr [rbp + 0x420], rcx
140bd96f4: mov       qword ptr [rbp + 0x428], rax
140bd96fb: lea       rcx, [rbp + 0x580]
140bd9702: mov       qword ptr [rbp + 0x430], rcx
140bd9709: mov       qword ptr [rbp + 0x438], rax
140bd9710: lea       rax, [rbp + 0x168]
140bd9717: mov       qword ptr [rbp + 0x440], rax
140bd971e: lea       rax, [rip + 0x50060ab]
140bd9725: mov       qword ptr [rbp + 0x448], rax
140bd972c: lea       rcx, [rbp + 0x528]
140bd9733: mov       qword ptr [rbp + 0x450], rcx
140bd973a: mov       qword ptr [rbp + 0x458], rax
140bd9741: lea       rax, [rbp + 0x208]
140bd9748: mov       qword ptr [rbp + 0x460], rax
140bd974f: lea       rax, [rip + 0x500607a]
140bd9756: mov       qword ptr [rbp + 0x468], rax
140bd975d: lea       rax, [rbp + 0x2e0]
140bd9764: mov       qword ptr [rbp + 0x470], rax
140bd976b: lea       rax, [rip + 0x5001a9e]
140bd9772: mov       qword ptr [rbp + 0x478], rax
140bd9779: mov       byte ptr [rbp + 0x62b], r14b
140bd9780: lea       rcx, [rip + 0x53bb4f2]
140bd9787: lea       rdx, [rbp + 0x3e0]
140bd978e: call      0x145bb6590
140bd9793: nop
140bd9794: mov       rsi, qword ptr [rbp + 0x220]
140bd979b: cmp       rsi, 2
140bd979f: je        0x140bd980b
140bd97a1: lea       rdx, [rbp + 0x238]
140bd97a8: lea       rcx, [rbp + 0x220]
140bd97af: call      0x144c5f2e0
140bd97b4: nop
140bd97b5: mov       rdx, qword ptr [rbp + 0x238]
140bd97bc: lea       rcx, [rbp + 0x220]
140bd97c3: call      0x144c5f340
140bd97c8: nop
140bd97c9: test      rsi, rsi
140bd97cc: mov       r14d, dword ptr [rbp + 0x620]
140bd97d3: je        0x140bd980b
140bd97d5: mov       rax, qword ptr [rbp + 0x228]
140bd97dc: lock dec  qword ptr [rax]
140bd97e0: jne       0x140bd980b
140bd97e2: lea       rcx, [rbp + 0x228]
140bd97e9: mov       byte ptr [rbp + 0x631], r14b
140bd97f0: mov       byte ptr [rbp + 0x630], 0
140bd97f7: mov       byte ptr [rbp + 0x62f], 0
140bd97fe: mov       byte ptr [rbp + 0x62e], 0
140bd9805: call      0x1403e4380
140bd980a: nop
140bd980b: mov       rdx, qword ptr [rbp + 0x328]
140bd9812: cmp       rdx, -1
140bd9816: je        0x140bd9833
140bd9818: test      rdx, rdx
140bd981b: je        0x140bd9833
140bd981d: mov       rcx, qword ptr [rbp + 0x330]
140bd9824: shl       rdx, 4
140bd9828: mov       r8d, 8
140bd982e: call      0x1400021d0
140bd9833: test      r14b, r14b
140bd9836: je        0x140bd9872
140bd9838: mov       rcx, qword ptr [rbp + 0x3a8]
140bd983f: mov       rdx, qword ptr [rbp + 0x3b0]
140bd9846: call      0x140ad9d70
140bd984b: nop
140bd984c: mov       rax, qword ptr [rbp + 0x3a0]
140bd9853: test      rax, rax
140bd9856: je        0x140bd9872
140bd9858: mov       rcx, qword ptr [rbp + 0x3a8]
140bd985f: shl       rax, 6
140bd9863: lea       rdx, [rax + rax*4]
140bd9867: mov       r8d, 0x10
140bd986d: call      0x1400021d0
140bd9872: movaps    xmm6, xmmword ptr [rbp + 0x640]
140bd9879: movaps    xmm7, xmmword ptr [rbp + 0x650]
140bd9880: movaps    xmm8, xmmword ptr [rbp + 0x660]
140bd9888: movaps    xmm9, xmmword ptr [rbp + 0x670]
140bd9890: movaps    xmm10, xmmword ptr [rbp + 0x680]
140bd9898: movaps    xmm11, xmmword ptr [rbp + 0x690]
140bd98a0: add       rsp, 0x728
140bd98a7: pop       rbx
140bd98a8: pop       rdi
140bd98a9: pop       rsi
140bd98aa: pop       r12
140bd98ac: pop       r13
140bd98ae: pop       r14
140bd98b0: pop       r15
140bd98b2: pop       rbp
140bd98b3: ret
140bd98b4: cmp       rax, -1
140bd98b8: jne       0x140bd75f7
140bd98be: mov       rax, qword ptr [rbp + 0x720]
140bd98c5: mov       rcx, qword ptr [rax]
140bd98c8: mov       rax, qword ptr [rbp + 0x5d0]
140bd98cf: lea       rdx, [rax + 0xa0]
140bd98d6: mov       byte ptr [rbp + 0x637], 1
140bd98dd: mov       byte ptr [rbp + 0x636], 1
140bd98e4: mov       byte ptr [rbp + 0x635], 1
140bd98eb: mov       byte ptr [rbp + 0x634], 1
140bd98f2: call      0x141224ac0
140bd98f7: nop
140bd98f8: test      al, al
140bd98fa: je        0x140bd75f7
140bd9900: mov       rdi, qword ptr [rbp + 0x3c8]
140bd9907: mov       rax, qword ptr [rbp + 0x610]
140bd990e: cmp       rdi, qword ptr [rax + 0x20]
140bd9912: jne       0x140bd75f7
140bd9918: test      rdi, rdi
140bd991b: je        0x140bd9955
140bd991d: mov       rax, qword ptr [rbp + 0x610]
140bd9924: mov       r14, qword ptr [rax + 0x18]
140bd9928: mov       r12, qword ptr [rbp + 0x3c0]
140bd992f: mov       rcx, r12
140bd9932: mov       rdx, r14
140bd9935: call      0x140bfb550
140bd993a: test      al, al
140bd993c: je        0x140bd75f7
140bd9942: add       r14, 0x110
140bd9949: add       r12, 0x110
140bd9950: dec       rdi
140bd9953: jne       0x140bd992f
140bd9955: mov       rax, qword ptr [rbp + 0x120]
140bd995c: mov       qword ptr [rbp + 0x400], rax
140bd9963: movaps    xmm0, xmmword ptr [rbp + 0x100]
140bd996a: movaps    xmm1, xmmword ptr [rbp + 0x110]
140bd9971: movaps    xmmword ptr [rbp + 0x3f0], xmm1
140bd9978: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bd997f: mov       byte ptr [rbp + 0x637], 1
140bd9986: mov       byte ptr [rbp + 0x636], 1
140bd998d: mov       byte ptr [rbp + 0x635], 1
140bd9994: mov       byte ptr [rbp + 0x634], 0
140bd999b: lea       rcx, [rbp + 0x3e0]
140bd99a2: call      0x140044230
140bd99a7: nop
140bd99a8: mov       byte ptr [rbp + 0x637], 1
140bd99af: mov       byte ptr [rbp + 0x636], 1
140bd99b6: mov       byte ptr [rbp + 0x635], 1
140bd99bd: mov       byte ptr [rbp + 0x634], 0
140bd99c4: lea       rcx, [rbp + 0x568]
140bd99cb: call      0x140b84b80
140bd99d0: nop
140bd99d1: mov       rdi, rax
140bd99d4: mov       rbx, rdx
140bd99d7: mov       qword ptr [rbp + 0x2e0], rax
140bd99de: mov       qword ptr [rbp + 0x2e8], rdx
140bd99e5: cmp       byte ptr [rbp + 0x5ac], 0
140bd99ec: je        0x140bd9b76
140bd99f2: mov       byte ptr [rbp + 0x637], 1
140bd99f9: mov       byte ptr [rbp + 0x636], 1
140bd9a00: mov       byte ptr [rbp + 0x635], 1
140bd9a07: mov       byte ptr [rbp + 0x634], 0
140bd9a0e: mov       rcx, qword ptr [rbp + 0x600]
140bd9a15: call      0x145014720
140bd9a1a: nop
140bd9a1b: mov       r12, rax
140bd9a1e: mov       rax, qword ptr [rbp + 0x748]
140bd9a25: mov       r15, qword ptr [rax]
140bd9a28: mov       rcx, qword ptr [r15 + 0x60]
140bd9a2c: mov       qword ptr [rbp + 0x620], rcx
140bd9a33: mov       esi, dword ptr [rax + 0x1c]
140bd9a36: mov       r13, qword ptr [rax + 0x10]
140bd9a3a: mov       dword ptr [r13], esi
140bd9a3e: mov       rax, qword ptr [r15 + 0xa0]
140bd9a45: mov       qword ptr [rbp + 0x3f0], rax
140bd9a4c: movupd    xmm0, xmmword ptr [r15 + 0x90]
140bd9a55: movapd    xmmword ptr [rbp + 0x3e0], xmm0
140bd9a5d: mov       qword ptr [r15 + 0x90], 0
140bd9a68: mov       qword ptr [r15 + 0x98], 8
140bd9a73: mov       qword ptr [r15 + 0xa0], 0
140bd9a7e: mov       rax, qword ptr [rbp + 0x5b0]
140bd9a85: mov       rax, qword ptr [rax]
140bd9a88: mov       rax, qword ptr [rax + 0x10]
140bd9a8c: mov       qword ptr [rbp + 0x5f0], rax
140bd9a93: mov       rcx, qword ptr [rbp + 0x600]
140bd9a9a: call      0x145015b40
140bd9a9f: nop
140bd9aa0: mov       r14, rax
140bd9aa3: sub       r12, qword ptr [rbp + 0x370]
140bd9aaa: sub       r14, qword ptr [rbp + 0x190]
140bd9ab1: mov       rax, qword ptr [rbp + 0x3f0]
140bd9ab8: mov       qword ptr [rbp + 0x230], rax
140bd9abf: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bd9ac6: movaps    xmmword ptr [rbp + 0x220], xmm0
140bd9acd: movaps    xmm6, xmmword ptr [rbp + 0x1c0]
140bd9ad4: movaps    xmm7, xmmword ptr [rbp + 0x1b0]
140bd9adb: mov       dword ptr [r13], esi
140bd9adf: mov       rcx, r15
140bd9ae2: call      0x140b70d40
140bd9ae7: mov       rax, qword ptr [rbp + 0x188]
140bd9aee: mov       qword ptr [r15], rax
140bd9af1: mov       rax, qword ptr [rbp + 0x180]
140bd9af8: mov       qword ptr [r15 + 8], rax
140bd9afc: mov       rax, qword ptr [rbp + 0x178]
140bd9b03: mov       qword ptr [r15 + 0x10], rax
140bd9b07: mov       rax, qword ptr [rbp + 0x170]
140bd9b0e: mov       qword ptr [r15 + 0x18], rax
140bd9b12: movaps    xmmword ptr [r15 + 0x20], xmm6
140bd9b17: movaps    xmmword ptr [r15 + 0x30], xmm7
140bd9b1c: mov       qword ptr [r15 + 0x40], rdi
140bd9b20: mov       qword ptr [r15 + 0x48], rbx
140bd9b24: xorps     xmm0, xmm0
140bd9b27: movaps    xmmword ptr [r15 + 0x50], xmm0
140bd9b2c: mov       rax, qword ptr [rbp + 0x620]
140bd9b33: mov       qword ptr [r15 + 0x60], rax
140bd9b37: mov       rax, qword ptr [rbp + 0x5f0]
140bd9b3e: mov       qword ptr [r15 + 0x68], rax
140bd9b42: mov       qword ptr [r15 + 0x70], r12
140bd9b46: mov       qword ptr [r15 + 0x78], r14
140bd9b4a: movaps    xmmword ptr [r15 + 0x80], xmm0
140bd9b52: mov       rax, qword ptr [rbp + 0x230]
140bd9b59: lea       rcx, [r15 + 0x90]
140bd9b60: mov       qword ptr [rcx + 0x10], rax
140bd9b64: movaps    xmm0, xmmword ptr [rbp + 0x220]
140bd9b6b: movaps    xmmword ptr [rcx], xmm0
140bd9b6e: mov       byte ptr [r15 + 0xa8], 1
140bd9b76: cmp       byte ptr [rbp + 0x5ef], 0
140bd9b7d: je        0x140bd9cbc
140bd9b83: mov       byte ptr [rbp + 0x637], 1
140bd9b8a: mov       byte ptr [rbp + 0x636], 1
140bd9b91: mov       byte ptr [rbp + 0x635], 1
140bd9b98: mov       byte ptr [rbp + 0x634], 0
140bd9b9f: mov       rcx, qword ptr [rbp + 0x600]
140bd9ba6: call      0x145014720
140bd9bab: nop
140bd9bac: sub       rax, qword ptr [rbp + 0x370]
140bd9bb3: mov       qword ptr [rbp + 0x1d8], rax
140bd9bba: mov       rax, qword ptr [rbp + 0x5b0]
140bd9bc1: mov       rax, qword ptr [rax]
140bd9bc4: mov       rax, qword ptr [rax + 0x10]
140bd9bc8: mov       qword ptr [rbp + 0x220], rax
140bd9bcf: lea       rax, [rbp + 0xd0]
140bd9bd6: mov       qword ptr [rbp + 0x3e0], rax
140bd9bdd: lea       rax, [rip + 0x50015cc]
140bd9be4: mov       qword ptr [rbp + 0x3e8], rax
140bd9beb: lea       rcx, [rbp + 0xc0]
140bd9bf2: mov       qword ptr [rbp + 0x3f0], rcx
140bd9bf9: mov       qword ptr [rbp + 0x3f8], rax
140bd9c00: lea       rcx, [rbp + 0x1c0]
140bd9c07: mov       qword ptr [rbp + 0x400], rcx
140bd9c0e: mov       qword ptr [rbp + 0x408], rax
140bd9c15: lea       rcx, [rbp + 0x1b0]
140bd9c1c: mov       qword ptr [rbp + 0x410], rcx
140bd9c23: mov       qword ptr [rbp + 0x418], rax
140bd9c2a: lea       rcx, [rbp + 0x2e0]
140bd9c31: mov       qword ptr [rbp + 0x420], rcx
140bd9c38: mov       qword ptr [rbp + 0x428], rax
140bd9c3f: lea       rax, [rbp + 0x168]
140bd9c46: mov       qword ptr [rbp + 0x430], rax
140bd9c4d: lea       rax, [rip + 0x5005b7c]
140bd9c54: mov       qword ptr [rbp + 0x438], rax
140bd9c5b: lea       rcx, [rbp + 0x220]
140bd9c62: mov       qword ptr [rbp + 0x440], rcx
140bd9c69: mov       qword ptr [rbp + 0x448], rax
140bd9c70: lea       rax, [rbp + 0x1d8]
140bd9c77: mov       qword ptr [rbp + 0x450], rax
140bd9c7e: lea       rax, [rip + 0x5005b4b]
140bd9c85: mov       qword ptr [rbp + 0x458], rax
140bd9c8c: mov       byte ptr [rbp + 0x637], 1
140bd9c93: mov       byte ptr [rbp + 0x636], 1
140bd9c9a: mov       byte ptr [rbp + 0x635], 1
140bd9ca1: mov       byte ptr [rbp + 0x634], 0
140bd9ca8: lea       rcx, [rip + 0x53bb035]
140bd9caf: lea       rdx, [rbp + 0x3e0]
140bd9cb6: call      0x145bb6590
140bd9cbb: nop
140bd9cbc: mov       byte ptr [rbp + 0x61f], 1
140bd9cc3: mov       byte ptr [rbp + 0x61e], 1
140bd9cca: mov       byte ptr [rbp + 0x61d], 0
140bd9cd1: lea       rcx, [rbp + 0x3b8]
140bd9cd8: call      0x140b6cc80
140bd9cdd: nop
140bd9cde: mov       rdx, qword ptr [rbp + 0x328]
140bd9ce5: cmp       rdx, -1
140bd9ce9: je        0x140bd9d06
140bd9ceb: test      rdx, rdx
140bd9cee: je        0x140bd9d06
140bd9cf0: mov       rcx, qword ptr [rbp + 0x330]
140bd9cf7: shl       rdx, 4
140bd9cfb: mov       r8d, 8
140bd9d01: call      0x1400021d0
140bd9d06: lea       rcx, [rbp + 0xe8]
140bd9d0d: call      0x140b6d080
140bd9d12: mov       byte ptr [rbp + 0x60b], 0
140bd9d19: lea       rcx, [rbp + 0x3a0]
140bd9d20: call      0x1407ed5b0
140bd9d25: nop
140bd9d26: jmp       0x140bd9872
140bd9d2b: cmp       rax, -1
140bd9d2f: je        0x140bd7bd3
140bd9d35: mov       eax, dword ptr [rip + 0x746cae5]
140bd9d3b: test      eax, eax
140bd9d3d: jne       0x140bdb27c
140bd9d43: cmp       byte ptr [rip + 0x746cada], 1
140bd9d4a: jne       0x140bd7c8d
140bd9d50: mov       byte ptr [rbp + 0x637], 1
140bd9d57: mov       byte ptr [rbp + 0x636], 1
140bd9d5e: mov       byte ptr [rbp + 0x635], 1
140bd9d65: mov       byte ptr [rbp + 0x634], 1
140bd9d6c: lea       rcx, [rip + 0x53bad82]
140bd9d73: mov       edx, 0x61
140bd9d78: call      0x145bb6590
140bd9d7d: nop
140bd9d7e: jmp       0x140bd7c8d
140bd9d83: lea       rcx, [rip + 0x746ca86]
140bd9d8a: call      0x145c27ac8
140bd9d8f: jmp       0x140bd6ca5
140bd9d94: mov       byte ptr [rbp + 0x637], 1
140bd9d9b: mov       byte ptr [rbp + 0x636], 1
140bd9da2: mov       byte ptr [rbp + 0x635], 1
140bd9da9: mov       byte ptr [rbp + 0x634], 1
140bd9db0: lea       rcx, [rip + 0x746ca69]
140bd9db7: call      0x145c27b58
140bd9dbc: nop
140bd9dbd: jmp       0x140bd7605
140bd9dc2: call      0x145bb7390
140bd9dc7: mov       qword ptr [rbp + 0x620], rdx
140bd9dce: mov       rcx, rax
140bd9dd1: mov       qword ptr [rsi], rax
140bd9dd4: mov       rax, qword ptr [rbp + 0x620]
140bd9ddb: mov       qword ptr [rsi + 8], rax
140bd9ddf: mov       byte ptr [rsi + 0x10], 1
140bd9de3: jmp       0x140bd6aec
140bd9de8: mov       byte ptr [rbp + 0x637], 1
140bd9def: mov       byte ptr [rbp + 0x636], 1
140bd9df6: mov       byte ptr [rbp + 0x635], 1
140bd9dfd: mov       byte ptr [rbp + 0x634], 1
140bd9e04: lea       rcx, [rip + 0x746ca15]
140bd9e0b: call      0x145c27b58
140bd9e10: nop
140bd9e11: jmp       0x140bd7a70
140bd9e16: mov       eax, dword ptr [rip + 0x746ca04]
140bd9e1c: test      eax, eax
140bd9e1e: jne       0x140bdb4d1
140bd9e24: cmp       byte ptr [rip + 0x746c9f9], 1
140bd9e2b: jne       0x140bd7c8d
140bd9e31: mov       byte ptr [rbp + 0x637], 1
140bd9e38: mov       byte ptr [rbp + 0x636], 1
140bd9e3f: mov       byte ptr [rbp + 0x635], 1
140bd9e46: mov       byte ptr [rbp + 0x634], 1
140bd9e4d: lea       rcx, [rip + 0x53bac78]
140bd9e54: mov       edx, 0x53
140bd9e59: call      0x145bb6590
140bd9e5e: nop
140bd9e5f: jmp       0x140bd7c8d
140bd9e64: mov       byte ptr [rbp + 0x62b], 1
140bd9e6b: lea       rcx, [rip + 0x746c9a6]
140bd9e72: call      0x145c27b10
140bd9e77: nop
140bd9e78: jmp       0x140bd9002
140bd9e7d: lea       rcx, [rsi + 0x10]
140bd9e81: call      0x145d97960
140bd9e86: nop
140bd9e87: jmp       0x140bd71f9
140bd9e8c: call      0x145d986f0
140bd9e91: mov       dword ptr [rbp + 0x3d0], eax
140bd9e97: mov       eax, dword ptr [rbp + 0x3d0]
140bd9e9d: xor       al, 1
140bd9e9f: mov       dword ptr [rbp + 0x3d0], eax
140bd9ea5: jmp       0x140bd721a
140bd9eaa: mov       byte ptr [rbp + 0x5ee], 1
140bd9eb1: call      0x145d97a20
140bd9eb6: nop
140bd9eb7: jmp       0x140bd72b7
140bd9ebc: mov       byte ptr [rbp + 0x637], 1
140bd9ec3: mov       byte ptr [rbp + 0x636], 1
140bd9eca: mov       byte ptr [rbp + 0x635], 1
140bd9ed1: mov       byte ptr [rbp + 0x634], 1
140bd9ed8: lea       rcx, [rip + 0x746c939]
140bd9edf: call      0x145c27b10
140bd9ee4: nop
140bd9ee5: jmp       0x140bd7abe
140bd9eea: mov       byte ptr [rbp + 0x5ee], 1
140bd9ef1: call      0x145d986f0
140bd9ef6: nop
140bd9ef7: test      al, al
140bd9ef9: jne       0x140bd72a4
140bd9eff: mov       byte ptr [rsi + 0x11], 1
140bd9f03: jmp       0x140bd72a4
140bd9f08: mov       byte ptr [rbp + 0x637], 1
140bd9f0f: mov       byte ptr [rbp + 0x636], 1
140bd9f16: mov       byte ptr [rbp + 0x635], 1
140bd9f1d: mov       byte ptr [rbp + 0x634], 1
140bd9f24: lea       rcx, [rip + 0x746c8f5]
140bd9f2b: call      0x145c27b58
140bd9f30: nop
140bd9f31: jmp       0x140bd7ad5
140bd9f36: mov       byte ptr [rbp + 0x637], 1
140bd9f3d: mov       byte ptr [rbp + 0x636], 1
140bd9f44: mov       byte ptr [rbp + 0x635], 1
140bd9f4b: mov       byte ptr [rbp + 0x634], 1
140bd9f52: lea       rcx, [rip + 0x746c8c7]
140bd9f59: call      0x145c27b58
140bd9f5e: nop
140bd9f5f: jmp       0x140bd7c56
140bd9f64: lea       rcx, [rip + 0x746c7d5]
140bd9f6b: call      0x145d45220
140bd9f70: mov       edx, eax
140bd9f72: test      al, al
140bd9f74: jne       0x140bd6d8e
140bd9f7a: jmp       0x140bd6e0c
140bd9f7f: lea       rcx, [rip + 0x746c7ea]
140bd9f86: call      0x145d45220
140bd9f8b: mov       edx, eax
140bd9f8d: test      al, al
140bd9f8f: jne       0x140bd7029
140bd9f95: jmp       0x140bd709e
140bd9f9a: xor       eax, eax
140bd9f9c: mov       rcx, qword ptr [rbp + 0x5b0]
140bd9fa3: mov       rcx, qword ptr [rcx]
140bd9fa6: mov       qword ptr [rbp + 0x5e0], rcx
140bd9fad: cmp       rax, qword ptr [rcx + 0x10]
140bd9fb1: jne       0x140bda126
140bd9fb7: mov       rax, qword ptr [rbp + 0x610]
140bd9fbe: mov       rdx, qword ptr [rax + 0x18]
140bd9fc2: mov       r9, qword ptr [rbp + 0x3c0]
140bd9fc9: mov       rax, qword ptr [rbp + 0x3c8]
140bd9fd0: mov       byte ptr [rbp + 0x637], 1
140bd9fd7: mov       byte ptr [rbp + 0x636], 1
140bd9fde: mov       byte ptr [rbp + 0x635], 1
140bd9fe5: mov       byte ptr [rbp + 0x634], 1
140bd9fec: mov       qword ptr [rsp + 0x20], rax
140bd9ff1: lea       rcx, [rbp + 0x1d8]
140bd9ff8: call      0x140bde210
140bd9ffd: nop
140bd9ffe: mov       rax, qword ptr [rbp + 0x1e0]
140bda005: mov       rcx, qword ptr [rbp + 0x1e8]
140bda00c: shl       rcx, 4
140bda010: mov       qword ptr [rbp + 0x130], rcx
140bda017: add       rcx, rax
140bda01a: mov       qword ptr [rbp + 0x5f8], rax
140bda021: mov       qword ptr [rbp + 0x3e0], rax
140bda028: mov       qword ptr [rbp + 0x40], rcx
140bda02c: mov       qword ptr [rbp + 0x3e8], rcx
140bda033: mov       qword ptr [rbp + 0x3f0], 0
140bda03e: mov       byte ptr [rbp + 0x5df], 1
140bda045: mov       byte ptr [rbp + 0x5de], 1
140bda04c: lea       rcx, [rbp + 0x150]
140bda053: lea       rdx, [rbp + 0x3e0]
140bda05a: call      0x140b1db30
140bda05f: nop
140bda060: mov       rcx, qword ptr [rbp + 0x160]
140bda067: mov       rax, qword ptr [rbp + 0x200]
140bda06e: mov       qword ptr [rbp + 0x3d8], rcx
140bda075: add       rcx, rax
140bda078: cmp       rcx, 0x40
140bda07c: jbe       0x140bda1ac
140bda082: mov       eax, dword ptr [rip + 0x746c798]
140bda088: test      eax, eax
140bda08a: jne       0x140bdb5ae
140bda090: cmp       byte ptr [rip + 0x746c78d], 1
140bda097: jne       0x140bda814
140bda09d: mov       rax, qword ptr [rbp + 0x160]
140bda0a4: mov       qword ptr [rbp + 0x2e0], rax
140bda0ab: mov       rax, qword ptr [rbp + 0x200]
140bda0b2: mov       qword ptr [rbp + 0x220], rax
140bda0b9: lea       rax, [rbp + 0x2e0]
140bda0c0: mov       qword ptr [rbp + 0x3e0], rax
140bda0c7: lea       rax, [rip + 0x5005702]
140bda0ce: mov       qword ptr [rbp + 0x3e8], rax
140bda0d5: lea       rcx, [rbp + 0x220]
140bda0dc: mov       qword ptr [rbp + 0x3f0], rcx
140bda0e3: mov       qword ptr [rbp + 0x3f8], rax
140bda0ea: lea       rcx, [rip + 0x53ba967]
140bda0f1: mov       qword ptr [rbp + 0x400], rcx
140bda0f8: mov       qword ptr [rbp + 0x408], rax
140bda0ff: mov       byte ptr [rbp + 0x62d], 1
140bda106: mov       byte ptr [rbp + 0x62c], 1
140bda10d: lea       rcx, [rip + 0x53ba94c]
140bda114: lea       rdx, [rbp + 0x3e0]
140bda11b: call      0x145bb6590
140bda120: nop
140bda121: jmp       0x140bda814
140bda126: mov       eax, dword ptr [rip + 0x746c6f4]
140bda12c: test      eax, eax
140bda12e: jne       0x140bdb4ff
140bda134: cmp       byte ptr [rip + 0x746c6e9], 1
140bda13b: jne       0x140bd7c8d
140bda141: mov       byte ptr [rbp + 0x637], 1
140bda148: mov       byte ptr [rbp + 0x636], 1
140bda14f: mov       byte ptr [rbp + 0x635], 1
140bda156: mov       byte ptr [rbp + 0x634], 1
140bda15d: lea       rcx, [rip + 0x53ba945]
140bda164: mov       edx, 0x47
140bda169: call      0x145bb6590
140bda16e: nop
140bda16f: jmp       0x140bd7c8d
140bda174: mov       byte ptr [rbp + 0x631], 1
140bda17b: mov       byte ptr [rbp + 0x630], 0
140bda182: mov       byte ptr [rbp + 0x62f], 0
140bda189: mov       byte ptr [rbp + 0x62e], 0
140bda190: lea       rcx, [rip + 0x746c5c1]
140bda197: call      0x145d45220
140bda19c: nop
140bda19d: mov       edx, eax
140bda19f: test      al, al
140bda1a1: jne       0x140bd8e95
140bda1a7: jmp       0x140bd8f41
140bda1ac: mov       rcx, rax
140bda1af: or        rcx, qword ptr [rbp + 0x3d8]
140bda1b6: je        0x140bda321
140bda1bc: mov       rcx, qword ptr [rbp + 0x5d0]
140bda1c3: lea       rdx, [rcx + 0x10]
140bda1c7: mov       r8, qword ptr [rbp + 0x158]
140bda1ce: mov       rcx, qword ptr [rbp + 0x3d8]
140bda1d5: lea       r9, [r8 + rcx*8]
140bda1d9: mov       rcx, qword ptr [rbp + 0x1f8]
140bda1e0: lea       rax, [rcx + rax*8]
140bda1e4: mov       qword ptr [rbp + 0x1a0], r8
140bda1eb: mov       qword ptr [rbp + 0x3e0], r8
140bda1f2: mov       qword ptr [rbp + 0x5b8], r9
140bda1f9: mov       qword ptr [rbp + 0x3e8], r9
140bda200: lea       r8, [rbp + 0x3b8]
140bda207: mov       qword ptr [rbp + 0x3f0], r8
140bda20e: mov       qword ptr [rbp + 0x3f8], rcx
140bda215: mov       qword ptr [rbp + 0x400], rax
140bda21c: mov       qword ptr [rbp + 0x1a8], rdx
140bda223: mov       qword ptr [rbp + 0x408], rdx
140bda22a: mov       byte ptr [rbp + 0x62d], 1
140bda231: mov       byte ptr [rbp + 0x62c], 1
140bda238: lea       rcx, [rbp + 0x3e0]
140bda23f: call      0x140b814f0
140bda244: nop
140bda245: mov       r14, rax
140bda248: test      rax, rax
140bda24b: je        0x140bda361
140bda251: mov       eax, dword ptr [rip + 0x746c5c9]
140bda257: test      eax, eax
140bda259: jne       0x140bdb61c
140bda25f: cmp       byte ptr [rip + 0x746c5be], 0
140bda266: je        0x140bda814
140bda26c: movabs    rax, 0x8000000000000000
140bda276: xor       rax, qword ptr [r14 + 0x10]
140bda27a: cmp       rax, 7
140bda27e: mov       ecx, 3
140bda283: cmovb     rcx, rax
140bda287: lea       rax, [rip + 0x53c4f22]
140bda28e: mov       rax, qword ptr [rax + rcx*8]
140bda292: lea       rdx, [rip + 0x53c4f4f]
140bda299: mov       rcx, qword ptr [rdx + rcx*8]
140bda29d: mov       qword ptr [rbp + 0x580], rcx
140bda2a4: mov       qword ptr [rbp + 0x588], rax
140bda2ab: mov       eax, dword ptr [r14 + 0xd0]
140bda2b2: mov       dword ptr [rbp + 0x2e8], eax
140bda2b8: mov       rax, qword ptr [r14 + 0xc8]
140bda2bf: mov       qword ptr [rbp + 0x2e0], rax
140bda2c6: mov       byte ptr [rbp + 0x62d], 1
140bda2cd: mov       byte ptr [rbp + 0x62c], 1
140bda2d4: lea       rcx, [rbp + 0x220]
140bda2db: lea       r14, [rbp + 0x2e0]
140bda2e2: mov       rdx, qword ptr [rbp + 0x600]
140bda2e9: mov       r8, r14
140bda2ec: call      0x145033360
140bda2f1: nop
140bda2f2: cmp       qword ptr [rbp + 0x220], -1
140bda2fa: je        0x140bda790
140bda300: mov       rax, qword ptr [rbp + 0x230]
140bda307: mov       qword ptr [rbp + 0x2f0], rax
140bda30e: movups    xmm0, xmmword ptr [rbp + 0x220]
140bda315: movaps    xmmword ptr [rbp + 0x2e0], xmm0
140bda31c: jmp       0x140bda7b1
140bda321: mov       eax, dword ptr [rip + 0x746c4f9]
140bda327: test      eax, eax
140bda329: jne       0x140bdb63c
140bda32f: cmp       byte ptr [rip + 0x746c4ee], 1
140bda336: jne       0x140bda814
140bda33c: mov       byte ptr [rbp + 0x62d], 1
140bda343: mov       byte ptr [rbp + 0x62c], 1
140bda34a: lea       rcx, [rip + 0x53ba50d]
140bda351: mov       edx, 0x81
140bda356: call      0x145bb6590
140bda35b: nop
140bda35c: jmp       0x140bda814
140bda361: mov       qword ptr [rbp + 0x388], 0
140bda36c: mov       qword ptr [rbp + 0x390], 0x10
140bda377: mov       qword ptr [rbp + 0x398], 0
140bda382: mov       qword ptr [rsp + 0x20], 0x10
140bda38b: lea       rcx, [rbp + 0x3e0]
140bda392: mov       r9d, 8
140bda398: mov       rdx, qword ptr [rbp + 0x3d8]
140bda39f: xor       r8d, r8d
140bda3a2: call      0x1400539a0
140bda3a7: mov       rcx, qword ptr [rbp + 0x3e8]
140bda3ae: cmp       byte ptr [rbp + 0x3e0], 0
140bda3b5: jne       0x140bdb6b0
140bda3bb: mov       rax, qword ptr [rbp + 0x5d0]
140bda3c2: add       rax, 0x28
140bda3c6: mov       qword ptr [rbp + 0x138], rax
140bda3cd: mov       rax, qword ptr [rbp + 0x3f0]
140bda3d4: mov       qword ptr [rbp + 0x528], rcx
140bda3db: mov       qword ptr [rbp + 0x530], rax
140bda3e2: mov       qword ptr [rbp + 0x538], 0
140bda3ed: mov       qword ptr [rbp + 0x208], 0
140bda3f8: mov       qword ptr [rbp + 0x210], 8
140bda403: mov       qword ptr [rbp + 0x218], 0
140bda40e: xorps     xmm0, xmm0
140bda411: movaps    xmmword ptr [rbp + 0x2e0], xmm0
140bda418: mov       rax, qword ptr [rbp + 0x710]
140bda41f: mov       ecx, dword ptr [rax + 0x1c]
140bda422: mov       dword ptr [rbp + 0x378], ecx
140bda428: mov       rcx, qword ptr [rax]
140bda42b: mov       qword ptr [rbp + 0x5a0], rcx
140bda432: mov       rax, qword ptr [rax + 0x10]
140bda436: mov       qword ptr [rbp + 0x380], rax
140bda43d: xor       edi, edi
140bda43f: mov       r15, qword ptr [rbp + 0x1a0]
140bda446: jmp       0x140bda46d
140bda448: add       r15, 8
140bda44c: mov       rax, qword ptr [rbp + 0x530]
140bda453: mov       rcx, rdi
140bda456: shl       rcx, 4
140bda45a: mov       qword ptr [rax + rcx], r14
140bda45e: mov       qword ptr [rax + rcx + 8], rsi
140bda463: inc       rdi
140bda466: mov       qword ptr [rbp + 0x538], rdi
140bda46d: cmp       r15, qword ptr [rbp + 0x5b8]
140bda474: je        0x140bda69d
140bda47a: mov       rcx, qword ptr [r15]
140bda47d: mov       rdx, qword ptr [rbp + 0x3c8]
140bda484: cmp       rcx, rdx
140bda487: jae       0x140bdb7c7
140bda48d: mov       r14, qword ptr [rbp + 0x398]
140bda494: mov       rax, qword ptr [rbp + 0x3c0]
140bda49b: imul      rcx, rcx, 0x110
140bda4a2: lea       rdi, [rax + rcx]
140bda4a6: mov       edx, dword ptr [rax + rcx + 0xd0]
140bda4ad: mov       dword ptr [rbp + 0x148], edx
140bda4b3: mov       rdx, qword ptr [rax + rcx + 0xc8]
140bda4bb: mov       qword ptr [rbp + 0x140], rdx
140bda4c2: mov       rsi, qword ptr [rax + rcx]
140bda4c6: mov       r12, qword ptr [rax + rcx + 8]
140bda4cb: xor       ebx, ebx
140bda4cd: cmp       byte ptr [rax + rcx + 0xd4], 0
140bda4d5: je        0x140bda4ea
140bda4d7: movups    xmm0, xmmword ptr [rdi + 0xd8]
140bda4de: movaps    xmmword ptr [rbp + 0x540], xmm0
140bda4e5: mov       ebx, 1
140bda4ea: movss     xmm10, dword ptr [rdi + 0xfc]
140bda4f3: lea       rdx, [rdi + 0x10]
140bda4f7: mov       byte ptr [rbp + 0x633], 1
140bda4fe: mov       byte ptr [rbp + 0x632], 1
140bda505: lea       rcx, [rbp + 0x220]
140bda50c: call      0x140c594e0
140bda511: nop
140bda512: xor       r13d, r13d
140bda515: cmp       dword ptr [rdi + 0xe8], 1
140bda51c: jne       0x140bda532
140bda51e: movups    xmm0, xmmword ptr [rdi + 0xec]
140bda525: movaps    xmmword ptr [rbp + 0x580], xmm0
140bda52c: mov       r13d, 1
140bda532: movss     xmm11, dword ptr [rdi + 0x100]
140bda53b: mov       eax, dword ptr [rbp + 0x148]
140bda541: lea       rdi, [rbp + 0x4a8]
140bda548: mov       dword ptr [rdi + 8], eax
140bda54b: mov       rax, qword ptr [rbp + 0x140]
140bda552: mov       qword ptr [rdi], rax
140bda555: mov       qword ptr [rbp + 0x3e8], r12
140bda55c: mov       qword ptr [rbp + 0x3e0], rsi
140bda563: mov       dword ptr [rbp + 0x4b4], ebx
140bda569: movaps    xmm0, xmmword ptr [rbp + 0x540]
140bda570: movups    xmmword ptr [rdi + 0x10], xmm0
140bda574: movss     dword ptr [rbp + 0x4dc], xmm10
140bda57d: mov       r8d, 0xb8
140bda583: lea       rcx, [rbp + 0x3f0]
140bda58a: lea       rdx, [rbp + 0x220]
140bda591: call      0x145bfa0e7
140bda596: mov       dword ptr [rbp + 0x4c8], r13d
140bda59d: movaps    xmm0, xmmword ptr [rbp + 0x580]
140bda5a4: movups    xmmword ptr [rdi + 0x24], xmm0
140bda5a8: movss     dword ptr [rbp + 0x4e0], xmm11
140bda5b1: mov       eax, dword ptr [rbp + 0x378]
140bda5b7: mov       rcx, qword ptr [rbp + 0x380]
140bda5be: mov       dword ptr [rcx], eax
140bda5c0: cmp       qword ptr [rbp + 0x328], -1
140bda5c8: lea       rax, [rbp + 0x328]
140bda5cf: mov       ecx, 0
140bda5d4: cmove     rax, rcx
140bda5d8: mov       byte ptr [rbp + 0x633], 1
140bda5df: mov       byte ptr [rbp + 0x632], 1
140bda5e6: lea       rcx, [rbp + 0x2e0]
140bda5ed: mov       qword ptr [rsp + 0x68], rcx
140bda5f2: lea       rcx, [rbp + 0x208]
140bda5f9: mov       qword ptr [rsp + 0x60], rcx
140bda5fe: lea       rcx, [rbp + 0x388]
140bda605: mov       qword ptr [rsp + 0x58], rcx
140bda60a: mov       qword ptr [rsp + 0x48], rax
140bda60f: mov       rax, qword ptr [rbp + 0x720]
140bda616: mov       qword ptr [rsp + 0x40], rax
140bda61b: mov       rax, qword ptr [rbp + 0x718]
140bda622: mov       qword ptr [rsp + 0x38], rax
140bda627: mov       rax, qword ptr [rbp + 0x5a0]
140bda62e: mov       qword ptr [rsp + 0x30], rax
140bda633: mov       rax, qword ptr [rbp + 0x560]
140bda63a: mov       qword ptr [rsp + 0x28], rax
140bda63f: movss     dword ptr [rsp + 0x20], xmm9
140bda646: mov       byte ptr [rsp + 0x50], 0
140bda64b: lea       rcx, [rbp + 0x3e0]
140bda652: movaps    xmm1, xmm6
140bda655: movaps    xmm2, xmm7
140bda658: movaps    xmm3, xmm8
140bda65c: call      0x140bde4e0
140bda661: nop
140bda662: mov       rsi, qword ptr [rbp + 0x398]
140bda669: mov       rdi, qword ptr [rbp + 0x538]
140bda670: cmp       rdi, qword ptr [rbp + 0x528]
140bda677: jne       0x140bda448
140bda67d: mov       byte ptr [rbp + 0x633], 1
140bda684: mov       byte ptr [rbp + 0x632], 1
140bda68b: lea       rcx, [rbp + 0x528]
140bda692: call      0x145bfaef0
140bda697: nop
140bda698: jmp       0x140bda448
140bda69d: cmp       qword ptr [rbp + 0x218], 0
140bda6a5: jne       0x140bda70b
140bda6a7: mov       rax, qword ptr [rbp + 0x2e8]
140bda6ae: or        rax, qword ptr [rbp + 0x2e0]
140bda6b5: jne       0x140bda70b
140bda6b7: mov       rax, qword ptr [rbp + 0x610]
140bda6be: mov       rax, qword ptr [rax + 0x20]
140bda6c2: cmp       rax, qword ptr [rbp + 0x3c8]
140bda6c9: jne       0x140bda902
140bda6cf: xor       eax, eax
140bda6d1: mov       rcx, qword ptr [rbp + 0x5f8]
140bda6d8: cmp       qword ptr [rbp + 0x130], 0
140bda6e0: je        0x140bda875
140bda6e6: mov       rdx, rcx
140bda6e9: mov       r8, rax
140bda6ec: add       rcx, 0x10
140bda6f0: inc       rax
140bda6f3: add       qword ptr [rbp + 0x130], -0x10
140bda6fb: cmp       dword ptr [rdx], 1
140bda6fe: jne       0x140bda6d8
140bda700: cmp       r8, qword ptr [rdx + 8]
140bda704: je        0x140bda6d8
140bda706: jmp       0x140bda902
140bda70b: mov       eax, dword ptr [rip + 0x746c10f]
140bda711: test      eax, eax
140bda713: jne       0x140bdb749
140bda719: cmp       byte ptr [rip + 0x746c104], 0
140bda720: je        0x140bda742
140bda722: mov       byte ptr [rbp + 0x633], 1
140bda729: mov       byte ptr [rbp + 0x632], 1
140bda730: lea       rcx, [rip + 0x53ba2e1]
140bda737: mov       edx, 0x79
140bda73c: call      0x145bb6590
140bda741: nop
140bda742: lea       rcx, [rbp + 0x208]
140bda749: call      0x140b6d080
140bda74e: mov       rdx, qword ptr [rbp + 0x528]
140bda755: test      rdx, rdx
140bda758: je        0x140bda770
140bda75a: mov       rcx, qword ptr [rbp + 0x530]
140bda761: shl       rdx, 4
140bda765: mov       r8d, 8
140bda76b: call      0x1400021d0
140bda770: mov       byte ptr [rbp + 0x62d], 1
140bda777: mov       byte ptr [rbp + 0x62c], 1
140bda77e: lea       rcx, [rbp + 0x388]
140bda785: call      0x1407ed5b0
140bda78a: nop
140bda78b: jmp       0x140bda814
140bda790: mov       qword ptr [rbp + 0x2e0], 0
140bda79b: mov       qword ptr [rbp + 0x2e8], 1
140bda7a6: mov       qword ptr [rbp + 0x2f0], 0
140bda7b1: lea       rax, [rbp + 0x580]
140bda7b8: mov       qword ptr [rbp + 0x220], rax
140bda7bf: lea       rax, [rip - 0xbd8706]
140bda7c6: mov       qword ptr [rbp + 0x228], rax
140bda7cd: mov       qword ptr [rbp + 0x230], r14
140bda7d4: lea       rax, [rip - 0xbd86fb]
140bda7db: mov       qword ptr [rbp + 0x238], rax
140bda7e2: lea       rcx, [rip + 0x53ba0b5]
140bda7e9: lea       rdx, [rbp + 0x220]
140bda7f0: call      0x145bb6590
140bda7f5: nop
140bda7f6: mov       rdx, qword ptr [rbp + 0x2e0]
140bda7fd: test      rdx, rdx
140bda800: je        0x140bda814
140bda802: mov       rcx, qword ptr [rbp + 0x2e8]
140bda809: mov       r8d, 1
140bda80f: call      0x1400021d0
140bda814: mov       rdx, qword ptr [rbp + 0x150]
140bda81b: test      rdx, rdx
140bda81e: je        0x140bda836
140bda820: mov       rcx, qword ptr [rbp + 0x158]
140bda827: shl       rdx, 3
140bda82b: mov       r8d, 8
140bda831: call      0x1400021d0
140bda836: lea       rcx, [rbp + 0x1d8]
140bda83d: call      0x140058f50
140bda842: jmp       0x140bd7c8d
140bda847: mov       byte ptr [rbp + 0x637], 1
140bda84e: mov       byte ptr [rbp + 0x636], 1
140bda855: mov       byte ptr [rbp + 0x635], 1
140bda85c: mov       byte ptr [rbp + 0x634], 1
140bda863: lea       rcx, [rip + 0x746bfb6]
140bda86a: call      0x145c27b58
140bda86f: nop
140bda870: jmp       0x140bd8a2b
140bda875: mov       rax, qword ptr [rbp + 0x530]
140bda87c: mov       rcx, rdi
140bda87f: shl       rcx, 4
140bda883: add       rcx, rax
140bda886: mov       rdx, qword ptr [rbp + 0x3d8]
140bda88d: cmp       rdi, rdx
140bda890: cmovae    rdi, rdx
140bda894: mov       rdx, qword ptr [rbp + 0x1a0]
140bda89b: mov       qword ptr [rbp + 0x3e0], rdx
140bda8a2: mov       rdx, qword ptr [rbp + 0x5b8]
140bda8a9: mov       qword ptr [rbp + 0x3e8], rdx
140bda8b0: mov       qword ptr [rbp + 0x3f0], rax
140bda8b7: mov       qword ptr [rbp + 0x3f8], rcx
140bda8be: mov       qword ptr [rbp + 0x400], 0
140bda8c9: mov       qword ptr [rbp + 0x408], rdi
140bda8d0: mov       rax, qword ptr [rbp + 0x610]
140bda8d7: mov       rdx, qword ptr [rax + 0x30]
140bda8db: mov       r8, qword ptr [rax + 0x38]
140bda8df: mov       byte ptr [rbp + 0x633], 1
140bda8e6: mov       byte ptr [rbp + 0x632], 1
140bda8ed: lea       rcx, [rbp + 0x3e0]
140bda8f4: call      0x140b82310
140bda8f9: nop
140bda8fa: test      al, al
140bda8fc: je        0x140bdb2aa
140bda902: mov       rcx, qword ptr [rbp + 0x610]
140bda909: mov       rax, qword ptr [rcx + 0x50]
140bda90d: mov       qword ptr [rbp + 0x550], rax
140bda914: movups    xmm0, xmmword ptr [rcx + 0x40]
140bda918: movaps    xmmword ptr [rbp + 0x540], xmm0
140bda91f: mov       qword ptr [rcx + 0x40], 0
140bda927: mov       qword ptr [rcx + 0x48], 0x10
140bda92f: mov       qword ptr [rcx + 0x50], 0
140bda937: mov       rax, qword ptr [rbp + 0x5b0]
140bda93e: mov       edx, dword ptr [rax + 0x1c]
140bda941: mov       r9, qword ptr [rax + 0x10]
140bda945: mov       dword ptr [r9], edx
140bda948: mov       rax, qword ptr [rbp + 0x540]
140bda94f: mov       r8, qword ptr [rbp + 0x5e0]
140bda956: movups    xmm0, xmmword ptr [r8]
140bda95a: mov       qword ptr [r8], rax
140bda95d: mov       rax, qword ptr [rbp + 0x548]
140bda964: movaps    xmmword ptr [rbp + 0x540], xmm0
140bda96b: mov       qword ptr [r8 + 8], rax
140bda96f: mov       rax, qword ptr [rbp + 0x550]
140bda976: mov       rcx, qword ptr [r8 + 0x10]
140bda97a: mov       qword ptr [rbp + 0x550], rcx
140bda981: mov       qword ptr [r8 + 0x10], rax
140bda985: mov       dword ptr [rbp + 0x620], edx
140bda98b: mov       qword ptr [rbp + 0x5f0], r9
140bda992: mov       dword ptr [r9], edx
140bda995: mov       rcx, qword ptr [r8 + 8]
140bda999: mov       rdx, qword ptr [r8 + 0x10]
140bda99d: mov       qword ptr [r8 + 0x10], 0
140bda9a5: mov       byte ptr [rbp + 0x60c], 1
140bda9ac: call      0x140ad9d70
140bda9b1: nop
140bda9b2: mov       eax, dword ptr [rbp + 0x620]
140bda9b8: mov       rcx, qword ptr [rbp + 0x5f0]
140bda9bf: mov       dword ptr [rcx], eax
140bda9c1: mov       r8, qword ptr [rbp + 0x398]
140bda9c8: add       r8, qword ptr [rbp + 0x550]
140bda9cf: mov       rcx, qword ptr [rbp + 0x5e0]
140bda9d6: mov       rax, qword ptr [rcx]
140bda9d9: mov       rdx, qword ptr [rcx + 0x10]
140bda9dd: sub       rax, rdx
140bda9e0: cmp       r8, rax
140bda9e3: ja        0x140bdb789
140bda9e9: mov       rdx, qword ptr [rbp + 0x3c8]
140bda9f0: mov       qword ptr [rsp + 0x20], 4
140bda9f9: lea       rcx, [rbp + 0x3e0]
140bdaa00: mov       r9d, 4
140bdaa06: xor       r8d, r8d
140bdaa09: call      0x1400539a0
140bdaa0e: mov       rcx, qword ptr [rbp + 0x3e8]
140bdaa15: cmp       dword ptr [rbp + 0x3e0], 1
140bdaa1c: je        0x140bdb7b1
140bdaa22: add       qword ptr [rbp + 0x5d0], 0x40
140bdaa2a: mov       rax, qword ptr [rbp + 0x3f0]
140bdaa31: mov       qword ptr [rbp + 0x580], rcx
140bdaa38: mov       qword ptr [rbp + 0x588], rax
140bdaa3f: mov       qword ptr [rbp + 0x590], 0
140bdaa4a: mov       rax, qword ptr [rbp + 0x548]
140bdaa51: mov       rcx, qword ptr [rbp + 0x550]
140bdaa58: mov       qword ptr [rbp + 0x550], 0
140bdaa63: lea       rdx, [rcx + rcx*4]
140bdaa67: shl       rdx, 6
140bdaa6b: add       rdx, rax
140bdaa6e: mov       qword ptr [rbp + 0x238], rcx
140bdaa75: mov       qword ptr [rbp + 0x240], 0
140bdaa80: mov       qword ptr [rbp + 0x220], rax
140bdaa87: mov       qword ptr [rbp + 0x228], rdx
140bdaa8e: lea       rax, [rbp + 0x540]
140bdaa95: mov       qword ptr [rbp + 0x230], rax
140bdaa9c: xor       ebx, ebx
140bdaa9e: lea       r12, [rbp + 0x3e0]
140bdaaa5: xor       r14d, r14d
140bdaaa8: jmp       0x140bdaac6
140bdaaaa: add       qword ptr [rbp + 0x5f8], 0x10
140bdaab2: mov       rax, qword ptr [rbp + 0x588]
140bdaab9: mov       dword ptr [rax + rsi*4], edi
140bdaabc: inc       rsi
140bdaabf: mov       qword ptr [rbp + 0x590], rsi
140bdaac6: mov       rax, qword ptr [rbp + 0x40]
140bdaaca: cmp       qword ptr [rbp + 0x5f8], rax
140bdaad1: je        0x140bdac5c
140bdaad7: mov       rax, qword ptr [rbp + 0x5f8]
140bdaade: cmp       byte ptr [rax], 0
140bdaae1: je        0x140bdab6c
140bdaae7: mov       rax, qword ptr [rbp + 0x610]
140bdaaee: mov       rcx, qword ptr [rax + 0x30]
140bdaaf2: mov       rdx, qword ptr [rax + 0x38]
140bdaaf6: mov       rax, qword ptr [rbp + 0x5f8]
140bdaafd: mov       r8, qword ptr [rax + 8]
140bdab01: call      0x140bd6950
140bdab06: nop
140bdab07: mov       r13, rax
140bdab0a: mov       r15, rdx
140bdab0d: cmp       rax, r14
140bdab10: jbe       0x140bdac00
140bdab16: not       r14
140bdab19: add       r14, r13
140bdab1c: je        0x140bdab37
140bdab1e: lea       rcx, [rbp + 0x220]
140bdab25: mov       rdx, r14
140bdab28: call      0x140b820e0
140bdab2d: nop
140bdab2e: test      rax, rax
140bdab31: jne       0x140bdabed
140bdab37: mov       rdx, qword ptr [rbp + 0x220]
140bdab3e: cmp       rdx, qword ptr [rbp + 0x228]
140bdab45: je        0x140bdabed
140bdab4b: lea       rax, [rdx + 0x140]
140bdab52: mov       qword ptr [rbp + 0x220], rax
140bdab59: mov       r8d, 0x140
140bdab5f: mov       rcx, r12
140bdab62: call      0x145bfa0ed
140bdab67: jmp       0x140bdabf7
140bdab6c: mov       eax, dword ptr [rbp + 0x620]
140bdab72: mov       rcx, qword ptr [rbp + 0x5f0]
140bdab79: mov       dword ptr [rcx], eax
140bdab7b: mov       rdx, qword ptr [rbp + 0x538]
140bdab82: cmp       rbx, rdx
140bdab85: jae       0x140bdb7e4
140bdab8b: mov       rax, qword ptr [rbp + 0x530]
140bdab92: mov       rdx, rbx
140bdab95: shl       rdx, 4
140bdab99: mov       rcx, qword ptr [rax + rdx]
140bdab9d: mov       rdx, qword ptr [rax + rdx + 8]
140bdaba2: mov       r8, qword ptr [rbp + 0x398]
140bdaba9: cmp       rdx, rcx
140bdabac: jb        0x140bdb56b
140bdabb2: cmp       rdx, r8
140bdabb5: ja        0x140bdb56b
140bdabbb: mov       r9, qword ptr [rbp + 0x390]
140bdabc2: lea       rax, [rcx + rcx*4]
140bdabc6: shl       rax, 6
140bdabca: add       rax, r9
140bdabcd: lea       r8, [rdx + rdx*4]
140bdabd1: shl       r8, 6
140bdabd5: add       r8, r9
140bdabd8: mov       rcx, qword ptr [rbp + 0x5e0]
140bdabdf: mov       rdx, rax
140bdabe2: call      0x140ac2c60
140bdabe7: nop
140bdabe8: inc       rbx
140bdabeb: jmp       0x140bdac2c
140bdabed: mov       dword ptr [rbp + 0x504], 2
140bdabf7: mov       rcx, r12
140bdabfa: call      0x140b6b530
140bdabff: nop
140bdac00: mov       eax, dword ptr [rbp + 0x620]
140bdac06: mov       rcx, qword ptr [rbp + 0x5f0]
140bdac0d: mov       dword ptr [rcx], eax
140bdac0f: mov       r8, r15
140bdac12: sub       r8, r13
140bdac15: mov       rcx, qword ptr [rbp + 0x5e0]
140bdac1c: lea       rdx, [rbp + 0x220]
140bdac23: call      0x140ac2b10
140bdac28: nop
140bdac29: mov       r14, r15
140bdac2c: mov       rax, qword ptr [rbp + 0x5e0]
140bdac33: mov       edi, dword ptr [rax + 0x10]
140bdac36: mov       rsi, qword ptr [rbp + 0x590]
140bdac3d: cmp       rsi, qword ptr [rbp + 0x580]
140bdac44: jne       0x140bdaaaa
140bdac4a: lea       rcx, [rbp + 0x580]
140bdac51: call      0x145c2e940
140bdac56: nop
140bdac57: jmp       0x140bdaaaa
140bdac5c: mov       byte ptr [rbp + 0x5ed], 1
140bdac63: lea       rcx, [rbp + 0x220]
140bdac6a: call      0x140b34d40
140bdac6f: nop
140bdac70: mov       rax, qword ptr [rbp + 0x550]
140bdac77: mov       qword ptr [rbp + 0x3f0], rax
140bdac7e: movaps    xmm0, xmmword ptr [rbp + 0x540]
140bdac85: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bdac8c: mov       rcx, qword ptr [rbp + 0x5d0]
140bdac93: call      0x1407ed5b0
140bdac98: nop
140bdac99: mov       rax, qword ptr [rbp + 0x3f0]
140bdaca0: mov       rcx, qword ptr [rbp + 0x5d0]
140bdaca7: mov       qword ptr [rcx + 0x10], rax
140bdacab: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bdacb2: movups    xmmword ptr [rcx], xmm0
140bdacb5: mov       rax, qword ptr [rbp + 0x590]
140bdacbc: mov       qword ptr [rbp + 0x3f0], rax
140bdacc3: movups    xmm0, xmmword ptr [rbp + 0x580]
140bdacca: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bdacd1: mov       rax, qword ptr [rbp + 0x138]
140bdacd8: mov       rdx, qword ptr [rax]
140bdacdb: test      rdx, rdx
140bdacde: je        0x140bdacfa
140bdace0: mov       rax, qword ptr [rbp + 0x610]
140bdace7: mov       rcx, qword ptr [rax + 0x30]
140bdaceb: shl       rdx, 2
140bdacef: mov       r8d, 4
140bdacf5: call      0x1400021d0
140bdacfa: mov       rax, qword ptr [rbp + 0x3f0]
140bdad01: mov       rcx, qword ptr [rbp + 0x138]
140bdad08: mov       qword ptr [rcx + 0x10], rax
140bdad0c: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bdad13: movups    xmmword ptr [rcx], xmm0
140bdad16: mov       eax, dword ptr [rbp + 0x620]
140bdad1c: mov       rcx, qword ptr [rbp + 0x5f0]
140bdad23: mov       dword ptr [rcx], eax
140bdad25: mov       rax, qword ptr [rbp + 0x5e0]
140bdad2c: mov       byte ptr [rax + 0x48], 1
140bdad30: mov       al, 1
140bdad32: mov       dword ptr [rbp + 0x620], eax
140bdad38: mov       rax, qword ptr [rbp + 0x3c8]
140bdad3f: mov       qword ptr [rbp + 0x3f0], rax
140bdad46: movups    xmm0, xmmword ptr [rbp + 0x3b8]
140bdad4d: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bdad54: mov       rcx, qword ptr [rbp + 0x1a8]
140bdad5b: call      0x140b6cc80
140bdad60: nop
140bdad61: mov       rax, qword ptr [rbp + 0x3f0]
140bdad68: mov       rcx, qword ptr [rbp + 0x1a8]
140bdad6f: mov       qword ptr [rcx + 0x10], rax
140bdad73: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bdad7a: movups    xmmword ptr [rcx], xmm0
140bdad7d: mov       eax, dword ptr [rip + 0x746baa5]
140bdad83: test      eax, eax
140bdad85: jne       0x140bdb769
140bdad8b: cmp       byte ptr [rip + 0x746ba9a], 0
140bdad92: je        0x140bdae3e
140bdad98: mov       eax, dword ptr [rbp + 0x378]
140bdad9e: mov       rcx, qword ptr [rbp + 0x380]
140bdada5: mov       dword ptr [rcx], eax
140bdada7: xor       eax, eax
140bdada9: cmp       qword ptr [rbp + 0x328], -1
140bdadb1: lea       rcx, [rbp + 0x328]
140bdadb8: cmove     rcx, rax
140bdadbc: mov       rax, qword ptr [rbp + 0x5e0]
140bdadc3: mov       rdx, qword ptr [rax + 8]
140bdadc7: mov       r8, qword ptr [rax + 0x10]
140bdadcb: mov       byte ptr [rbp + 0x633], 0
140bdadd2: mov       byte ptr [rbp + 0x632], 1
140bdadd9: mov       rax, qword ptr [rbp + 0x600]
140bdade0: mov       qword ptr [rsp + 0x60], rax
140bdade5: mov       qword ptr [rsp + 0x58], rcx
140bdadea: mov       rax, qword ptr [rbp + 0x720]
140bdadf1: mov       qword ptr [rsp + 0x50], rax
140bdadf6: mov       rax, qword ptr [rbp + 0x718]
140bdadfd: mov       qword ptr [rsp + 0x48], rax
140bdae02: mov       rax, qword ptr [rbp + 0x5a0]
140bdae09: mov       qword ptr [rsp + 0x40], rax
140bdae0e: mov       rax, qword ptr [rbp + 0x560]
140bdae15: mov       qword ptr [rsp + 0x38], rax
140bdae1a: movss     dword ptr [rsp + 0x30], xmm9
140bdae21: movss     dword ptr [rsp + 0x28], xmm8
140bdae28: movss     dword ptr [rsp + 0x20], xmm7
140bdae2e: mov       rcx, qword ptr [rbp + 0x610]
140bdae35: movaps    xmm3, xmm6
140bdae38: call      0x140be67c0
140bdae3d: nop
140bdae3e: mov       rax, qword ptr [rbp + 0x120]
140bdae45: mov       qword ptr [rbp + 0x400], rax
140bdae4c: movaps    xmm0, xmmword ptr [rbp + 0x100]
140bdae53: movaps    xmm1, xmmword ptr [rbp + 0x110]
140bdae5a: movaps    xmmword ptr [rbp + 0x3f0], xmm1
140bdae61: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bdae68: mov       byte ptr [rbp + 0x633], 0
140bdae6f: mov       byte ptr [rbp + 0x632], 0
140bdae76: lea       rcx, [rbp + 0x3e0]
140bdae7d: call      0x140044230
140bdae82: nop
140bdae83: mov       byte ptr [rbp + 0x633], 0
140bdae8a: mov       byte ptr [rbp + 0x632], 0
140bdae91: lea       rcx, [rbp + 0x568]
140bdae98: call      0x140b84b80
140bdae9d: nop
140bdae9e: mov       rdi, rax
140bdaea1: mov       rbx, rdx
140bdaea4: mov       qword ptr [rbp + 0x580], rax
140bdaeab: mov       qword ptr [rbp + 0x588], rdx
140bdaeb2: cmp       byte ptr [rbp + 0x5ac], 0
140bdaeb9: je        0x140bdb060
140bdaebf: mov       byte ptr [rbp + 0x633], 0
140bdaec6: mov       byte ptr [rbp + 0x632], 0
140bdaecd: mov       rcx, qword ptr [rbp + 0x600]
140bdaed4: call      0x145014720
140bdaed9: nop
140bdaeda: mov       r15, rax
140bdaedd: mov       rax, qword ptr [rbp + 0x748]
140bdaee4: mov       r14, qword ptr [rax]
140bdaee7: mov       rcx, qword ptr [r14 + 0x60]
140bdaeeb: mov       qword ptr [rbp + 0x5f0], rcx
140bdaef2: mov       esi, dword ptr [rax + 0x1c]
140bdaef5: mov       r13, qword ptr [rax + 0x10]
140bdaef9: mov       dword ptr [r13], esi
140bdaefd: mov       rax, qword ptr [r14 + 0xa0]
140bdaf04: mov       qword ptr [rbp + 0x3f0], rax
140bdaf0b: movups    xmm0, xmmword ptr [r14 + 0x90]
140bdaf13: movaps    xmmword ptr [rbp + 0x3e0], xmm0
140bdaf1a: mov       qword ptr [r14 + 0x90], 0
140bdaf25: mov       qword ptr [r14 + 0x98], 8
140bdaf30: mov       qword ptr [r14 + 0xa0], 0
140bdaf3b: mov       rax, qword ptr [rbp + 0x5e0]
140bdaf42: mov       rax, qword ptr [rax + 0x10]
140bdaf46: mov       qword ptr [rbp + 0x5f8], rax
140bdaf4d: mov       rcx, qword ptr [rbp + 0x600]
140bdaf54: call      0x145015b40
140bdaf59: nop
140bdaf5a: mov       r12, rax
140bdaf5d: sub       r15, qword ptr [rbp + 0x370]
140bdaf64: sub       r12, qword ptr [rbp + 0x190]
140bdaf6b: mov       rax, qword ptr [rbp + 0x160]
140bdaf72: mov       qword ptr [rbp + 0x560], rax
140bdaf79: mov       rax, qword ptr [rbp + 0x200]
140bdaf80: mov       qword ptr [rbp + 0x5c8], rax
140bdaf87: movaps    xmm0, xmmword ptr [rbp + 0x3e0]
140bdaf8e: movaps    xmmword ptr [rbp + 0x220], xmm0
140bdaf95: mov       rax, qword ptr [rbp + 0x3f0]
140bdaf9c: mov       qword ptr [rbp + 0x230], rax
140bdafa3: movaps    xmm6, xmmword ptr [rbp + 0x1c0]
140bdafaa: movaps    xmm7, xmmword ptr [rbp + 0x1b0]
140bdafb1: mov       dword ptr [r13], esi
140bdafb5: mov       rcx, r14
140bdafb8: call      0x140b70d40
140bdafbd: mov       rax, qword ptr [rbp + 0x188]
140bdafc4: mov       qword ptr [r14], rax
140bdafc7: mov       rax, qword ptr [rbp + 0x180]
140bdafce: mov       qword ptr [r14 + 8], rax
140bdafd2: mov       rax, qword ptr [rbp + 0x178]
140bdafd9: mov       qword ptr [r14 + 0x10], rax
140bdafdd: mov       rax, qword ptr [rbp + 0x170]
140bdafe4: mov       qword ptr [r14 + 0x18], rax
140bdafe8: movaps    xmmword ptr [r14 + 0x20], xmm6
140bdafed: movaps    xmmword ptr [r14 + 0x30], xmm7
140bdaff2: mov       qword ptr [r14 + 0x40], rdi
140bdaff6: mov       qword ptr [r14 + 0x48], rbx
140bdaffa: xorps     xmm0, xmm0
140bdaffd: movaps    xmmword ptr [r14 + 0x50], xmm0
140bdb002: mov       rax, qword ptr [rbp + 0x5f0]
140bdb009: mov       qword ptr [r14 + 0x60], rax
140bdb00d: mov       rax, qword ptr [rbp + 0x5f8]
140bdb014: mov       qword ptr [r14 + 0x68], rax
140bdb018: mov       qword ptr [r14 + 0x70], r15
140bdb01c: mov       qword ptr [r14 + 0x78], r12
140bdb020: mov       rax, qword ptr [rbp + 0x560]
140bdb027: mov       qword ptr [r14 + 0x80], rax
140bdb02e: mov       rax, qword ptr [rbp + 0x5c8]
140bdb035: mov       qword ptr [r14 + 0x88], rax
140bdb03c: mov       rax, qword ptr [rbp + 0x230]
140bdb043: lea       rcx, [r14 + 0x90]
140bdb04a: mov       qword ptr [rcx + 0x10], rax
140bdb04e: movaps    xmm0, xmmword ptr [rbp + 0x220]
140bdb055: movaps    xmmword ptr [rcx], xmm0
140bdb058: mov       byte ptr [r14 + 0xa8], 0
140bdb060: cmp       byte ptr [rbp + 0x5ef], 0
140bdb067: je        0x140bdb1ef
140bdb06d: mov       byte ptr [rbp + 0x633], 0
140bdb074: mov       byte ptr [rbp + 0x632], 0
140bdb07b: mov       rcx, qword ptr [rbp + 0x600]
140bdb082: call      0x145014720
140bdb087: nop
140bdb088: sub       rax, qword ptr [rbp + 0x370]
140bdb08f: mov       qword ptr [rbp + 0x30], rax
140bdb093: mov       rax, qword ptr [rbp + 0x5e0]
140bdb09a: mov       rax, qword ptr [rax + 0x10]
140bdb09e: mov       qword ptr [rbp + 0x140], rax
140bdb0a5: mov       eax, dword ptr [rbp + 0x620]
140bdb0ab: mov       byte ptr [rbp + 0x5c7], al
140bdb0b1: mov       rax, qword ptr [rbp + 0x160]
140bdb0b8: mov       qword ptr [rbp + 0x540], rax
140bdb0bf: mov       rax, qword ptr [rbp + 0x200]
140bdb0c6: mov       qword ptr [rbp + 0x220], rax
140bdb0cd: lea       rax, [rbp + 0xd0]
140bdb0d4: mov       qword ptr [rbp + 0x3e0], rax
140bdb0db: lea       rax, [rip + 0x50000ce]
140bdb0e2: mov       qword ptr [rbp + 0x3e8], rax
140bdb0e9: lea       rcx, [rbp + 0xc0]
140bdb0f0: mov       qword ptr [rbp + 0x3f0], rcx
140bdb0f7: mov       qword ptr [rbp + 0x3f8], rax
140bdb0fe: lea       rcx, [rbp + 0x1c0]
140bdb105: mov       qword ptr [rbp + 0x400], rcx
140bdb10c: mov       qword ptr [rbp + 0x408], rax
140bdb113: lea       rcx, [rbp + 0x1b0]
140bdb11a: mov       qword ptr [rbp + 0x410], rcx
140bdb121: mov       qword ptr [rbp + 0x418], rax
140bdb128: lea       rcx, [rbp + 0x580]
140bdb12f: mov       qword ptr [rbp + 0x420], rcx
140bdb136: mov       qword ptr [rbp + 0x428], rax
140bdb13d: lea       rax, [rbp + 0x168]
140bdb144: mov       qword ptr [rbp + 0x430], rax
140bdb14b: lea       rax, [rip + 0x500467e]
140bdb152: mov       qword ptr [rbp + 0x438], rax
140bdb159: lea       rcx, [rbp + 0x140]
140bdb160: mov       qword ptr [rbp + 0x440], rcx
140bdb167: mov       qword ptr [rbp + 0x448], rax
140bdb16e: lea       rcx, [rbp + 0x30]
140bdb172: mov       qword ptr [rbp + 0x450], rcx
140bdb179: lea       rcx, [rip + 0x5004650]
140bdb180: mov       qword ptr [rbp + 0x458], rcx
140bdb187: lea       rcx, [rbp + 0x5c7]
140bdb18e: mov       qword ptr [rbp + 0x460], rcx
140bdb195: lea       rcx, [rip + 0x5000074]
140bdb19c: mov       qword ptr [rbp + 0x468], rcx
140bdb1a3: lea       rcx, [rbp + 0x540]
140bdb1aa: mov       qword ptr [rbp + 0x470], rcx
140bdb1b1: mov       qword ptr [rbp + 0x478], rax
140bdb1b8: lea       rcx, [rbp + 0x220]
140bdb1bf: mov       qword ptr [rbp + 0x480], rcx
140bdb1c6: mov       qword ptr [rbp + 0x488], rax
140bdb1cd: mov       byte ptr [rbp + 0x633], 0
140bdb1d4: mov       byte ptr [rbp + 0x632], 0
140bdb1db: lea       rcx, [rip + 0x53b973e]
140bdb1e2: lea       rdx, [rbp + 0x3e0]
140bdb1e9: call      0x145bb6590
140bdb1ee: nop
140bdb1ef: lea       rcx, [rbp + 0x208]
140bdb1f6: call      0x140b6d080
140bdb1fb: mov       rdx, qword ptr [rbp + 0x528]
140bdb202: test      rdx, rdx
140bdb205: je        0x140bdb21d
140bdb207: mov       rcx, qword ptr [rbp + 0x530]
140bdb20e: shl       rdx, 4
140bdb212: mov       r8d, 8
140bdb218: call      0x1400021d0
140bdb21d: mov       byte ptr [rbp + 0x62d], 0
140bdb224: mov       byte ptr [rbp + 0x62c], 0
140bdb22b: lea       rcx, [rbp + 0x388]
140bdb232: call      0x1407ed5b0
140bdb237: nop
140bdb238: mov       rdx, qword ptr [rbp + 0x150]
140bdb23f: test      rdx, rdx
140bdb242: je        0x140bdb25a
140bdb244: mov       rcx, qword ptr [rbp + 0x158]
140bdb24b: shl       rdx, 3
140bdb24f: mov       r8d, 8
140bdb255: call      0x1400021d0
140bdb25a: lea       rcx, [rbp + 0x1d8]
140bdb261: call      0x140058f50
140bdb266: mov       rdx, qword ptr [rbp + 0x328]
140bdb26d: cmp       rdx, -1
140bdb271: jne       0x140bd9ceb
140bdb277: jmp       0x140bd9d06
140bdb27c: mov       byte ptr [rbp + 0x637], 1
140bdb283: mov       byte ptr [rbp + 0x636], 1
140bdb28a: mov       byte ptr [rbp + 0x635], 1
140bdb291: mov       byte ptr [rbp + 0x634], 1
140bdb298: lea       rcx, [rip + 0x746b581]
140bdb29f: call      0x145c27b58
140bdb2a4: nop
140bdb2a5: jmp       0x140bd9d43
140bdb2aa: mov       rax, qword ptr [rbp + 0x530]
140bdb2b1: mov       qword ptr [rbp + 0x5d0], rax
140bdb2b8: mov       rax, qword ptr [rbp + 0x538]
140bdb2bf: mov       rcx, qword ptr [rbp + 0x3d8]
140bdb2c6: cmp       rax, rcx
140bdb2c9: cmovb     rcx, rax
140bdb2cd: mov       qword ptr [rbp + 0x3d8], rcx
140bdb2d4: mov       rax, qword ptr [rbp + 0x5b0]
140bdb2db: mov       ecx, dword ptr [rax + 0x1c]
140bdb2de: mov       dword ptr [rbp + 0x620], ecx
140bdb2e4: mov       rax, qword ptr [rax + 0x10]
140bdb2e8: mov       qword ptr [rbp + 0x5f0], rax
140bdb2ef: xor       ebx, ebx
140bdb2f1: mov       qword ptr [rbp + 0x5b0], 0
140bdb2fc: cmp       rbx, qword ptr [rbp + 0x3d8]
140bdb303: jae       0x140bdb4b5
140bdb309: mov       rax, qword ptr [rbp + 0x1a0]
140bdb310: mov       r8, qword ptr [rax + rbx*8]
140bdb314: mov       rax, qword ptr [rbp + 0x610]
140bdb31b: mov       rcx, qword ptr [rax + 0x30]
140bdb31f: mov       rdx, qword ptr [rax + 0x38]
140bdb323: mov       byte ptr [rbp + 0x633], 1
140bdb32a: mov       byte ptr [rbp + 0x632], 1
140bdb331: call      0x140bd6950
140bdb336: mov       qword ptr [rbp + 0x5c8], rax
140bdb33d: mov       qword ptr [rbp + 0x5f8], rdx
140bdb344: mov       rax, qword ptr [rbp + 0x5e0]
140bdb34b: mov       r8, qword ptr [rax + 0x10]
140bdb34f: mov       rax, qword ptr [rbp + 0x5c8]
140bdb356: cmp       qword ptr [rbp + 0x5f8], rax
140bdb35d: jb        0x140bdb5ce
140bdb363: cmp       qword ptr [rbp + 0x5f8], r8
140bdb36a: ja        0x140bdb5ce
140bdb370: mov       rsi, rbx
140bdb373: shl       rsi, 4
140bdb377: add       rsi, qword ptr [rbp + 0x5d0]
140bdb37e: mov       rcx, qword ptr [rsi]
140bdb381: mov       rdx, qword ptr [rsi + 8]
140bdb385: mov       r8, qword ptr [rbp + 0x398]
140bdb38c: mov       rax, rdx
140bdb38f: sub       rax, rcx
140bdb392: jb        0x140bdb5fc
140bdb398: cmp       rdx, r8
140bdb39b: ja        0x140bdb5fc
140bdb3a1: inc       rbx
140bdb3a4: mov       r14, qword ptr [rbp + 0x5f8]
140bdb3ab: mov       rdx, qword ptr [rbp + 0x5c8]
140bdb3b2: sub       r14, rdx
140bdb3b5: lea       r15, [rdx + rdx*4]
140bdb3b9: shl       r15, 6
140bdb3bd: cmp       r14, rax
140bdb3c0: jne       0x140bdb41d
140bdb3c2: mov       rax, qword ptr [rbp + 0x5e0]
140bdb3c9: mov       r12, qword ptr [rax + 8]
140bdb3cd: add       r12, r15
140bdb3d0: lea       r13, [rcx + rcx*4]
140bdb3d4: shl       r13, 6
140bdb3d8: add       r13, qword ptr [rbp + 0x390]
140bdb3df: mov       rdi, r14
140bdb3e2: mov       rax, qword ptr [rbp + 0x5c8]
140bdb3e9: cmp       qword ptr [rbp + 0x5f8], rax
140bdb3f0: je        0x140bdb2fc
140bdb3f6: mov       rcx, r12
140bdb3f9: mov       rdx, r13
140bdb3fc: call      0x140c58820
140bdb401: test      al, al
140bdb403: je        0x140bdb41d
140bdb405: add       r13, 0x140
140bdb40c: add       r12, 0x140
140bdb413: dec       rdi
140bdb416: jne       0x140bdb3f6
140bdb418: jmp       0x140bdb2fc
140bdb41d: mov       eax, dword ptr [rbp + 0x620]
140bdb423: mov       rcx, qword ptr [rbp + 0x5f0]
140bdb42a: mov       dword ptr [rcx], eax
140bdb42c: mov       rax, qword ptr [rbp + 0x5e0]
140bdb433: mov       r8, qword ptr [rax + 0x10]
140bdb437: cmp       qword ptr [rbp + 0x5f8], r8
140bdb43e: ja        0x140bdb71b
140bdb444: mov       rcx, qword ptr [rsi]
140bdb447: mov       rdx, qword ptr [rsi + 8]
140bdb44b: mov       r8, qword ptr [rbp + 0x398]
140bdb452: mov       r9, rdx
140bdb455: sub       r9, rcx
140bdb458: jb        0x140bdb690
140bdb45e: cmp       rdx, r8
140bdb461: ja        0x140bdb690
140bdb467: mov       rax, qword ptr [rbp + 0x5e0]
140bdb46e: add       r15, qword ptr [rax + 8]
140bdb472: lea       r8, [rcx + rcx*4]
140bdb476: shl       r8, 6
140bdb47a: add       r8, qword ptr [rbp + 0x390]
140bdb481: mov       byte ptr [rbp + 0x633], 1
140bdb488: mov       byte ptr [rbp + 0x632], 1
140bdb48f: mov       al, 1
140bdb491: mov       qword ptr [rbp + 0x5b0], rax
140bdb498: lea       rax, [rip + 0x53b9519]
140bdb49f: mov       qword ptr [rsp + 0x20], rax
140bdb4a4: mov       rcx, r15
140bdb4a7: mov       rdx, r14
140bdb4aa: call      0x140c25e20
140bdb4af: nop
140bdb4b0: jmp       0x140bdb2fc
140bdb4b5: test      byte ptr [rbp + 0x5b0], 1
140bdb4bc: jne       0x140bdad16
140bdb4c2: mov       dword ptr [rbp + 0x620], 0
140bdb4cc: jmp       0x140bdad38
140bdb4d1: mov       byte ptr [rbp + 0x637], 1
140bdb4d8: mov       byte ptr [rbp + 0x636], 1
140bdb4df: mov       byte ptr [rbp + 0x635], 1
140bdb4e6: mov       byte ptr [rbp + 0x634], 1
140bdb4ed: lea       rcx, [rip + 0x746b32c]
140bdb4f4: call      0x145c27b58
140bdb4f9: nop
140bdb4fa: jmp       0x140bd9e24
140bdb4ff: mov       byte ptr [rbp + 0x637], 1
140bdb506: mov       byte ptr [rbp + 0x636], 1
140bdb50d: mov       byte ptr [rbp + 0x635], 1
140bdb514: mov       byte ptr [rbp + 0x634], 1
140bdb51b: lea       rcx, [rip + 0x746b2fe]
140bdb522: call      0x145c27b58
140bdb527: nop
140bdb528: jmp       0x140bda134
140bdb52d: mov       byte ptr [rbp + 0x62b], 1
140bdb534: lea       r8, [rip + 0x53b96bd]
140bdb53b: mov       rcx, r14
140bdb53e: mov       rdx, rbx
140bdb541: call      0x145d99653
140bdb546: nop
140bdb547: jmp       0x140bdb7f4
140bdb54c: mov       byte ptr [rbp + 0x62b], 1
140bdb553: lea       r8, [rip + 0x53b96b6]
140bdb55a: mov       rcx, r14
140bdb55d: mov       rdx, rdi
140bdb560: call      0x145d99653
140bdb565: nop
140bdb566: jmp       0x140bdb7f4
140bdb56b: lea       r9, [rip + 0x53b9396]
140bdb572: call      0x145d99860
140bdb577: nop
140bdb578: jmp       0x140bdb7f4
140bdb57d: mov       byte ptr [rbp + 0x631], 1
140bdb584: mov       byte ptr [rbp + 0x630], 0
140bdb58b: mov       byte ptr [rbp + 0x62f], 1
140bdb592: mov       byte ptr [rbp + 0x62e], 1
140bdb599: mov       ecx, 1
140bdb59e: mov       edx, 0x20
140bdb5a3: call      0x145d992bb
140bdb5a8: nop
140bdb5a9: jmp       0x140bdb7f4
140bdb5ae: mov       byte ptr [rbp + 0x62d], 1
140bdb5b5: mov       byte ptr [rbp + 0x62c], 1
140bdb5bc: lea       rcx, [rip + 0x746b25d]
140bdb5c3: call      0x145c27b58
140bdb5c8: nop
140bdb5c9: jmp       0x140bda090
140bdb5ce: mov       byte ptr [rbp + 0x633], 1
140bdb5d5: mov       byte ptr [rbp + 0x632], 1
140bdb5dc: lea       r9, [rip + 0x53b941d]
140bdb5e3: mov       rcx, qword ptr [rbp + 0x5c8]
140bdb5ea: mov       rdx, qword ptr [rbp + 0x5f8]
140bdb5f1: call      0x145d99860
140bdb5f6: nop
140bdb5f7: jmp       0x140bdb7f4
140bdb5fc: mov       byte ptr [rbp + 0x633], 1
140bdb603: mov       byte ptr [rbp + 0x632], 1
140bdb60a: lea       r9, [rip + 0x53b93d7]
140bdb611: call      0x145d99860
140bdb616: nop
140bdb617: jmp       0x140bdb7f4
140bdb61c: mov       byte ptr [rbp + 0x62d], 1
140bdb623: mov       byte ptr [rbp + 0x62c], 1
140bdb62a: lea       rcx, [rip + 0x746b1ef]
140bdb631: call      0x145c27b58
140bdb636: nop
140bdb637: jmp       0x140bda25f
140bdb63c: mov       byte ptr [rbp + 0x62d], 1
140bdb643: mov       byte ptr [rbp + 0x62c], 1
140bdb64a: lea       rcx, [rip + 0x746b1cf]
140bdb651: call      0x145c27b58
140bdb656: nop
140bdb657: jmp       0x140bda32f
140bdb65c: mov       byte ptr [rbp + 0x637], 1
140bdb663: mov       byte ptr [rbp + 0x636], 1
140bdb66a: mov       byte ptr [rbp + 0x635], 1
140bdb671: mov       byte ptr [rbp + 0x634], 1
140bdb678: lea       r8, [rip + 0x53b9a79]
140bdb67f: mov       rcx, r14
140bdb682: mov       rdx, rsi
140bdb685: call      0x145d99653
140bdb68a: nop
140bdb68b: jmp       0x140bdb7f4
140bdb690: mov       byte ptr [rbp + 0x633], 1
140bdb697: mov       byte ptr [rbp + 0x632], 1
140bdb69e: lea       r9, [rip + 0x53b932b]
140bdb6a5: call      0x145d99860
140bdb6aa: nop
140bdb6ab: jmp       0x140bdb7f4
140bdb6b0: mov       rdx, qword ptr [rbp + 0x3f0]
140bdb6b7: mov       byte ptr [rbp + 0x5dd], 1
140bdb6be: mov       byte ptr [rbp + 0x5dc], 1
140bdb6c5: call      0x145d992bb
140bdb6ca: nop
140bdb6cb: jmp       0x140bdb7f4
140bdb6d0: lea       rcx, [rip + 0x53b9a39]
140bdb6d7: mov       qword ptr [rsp + 0x20], rcx
140bdb6dc: mov       rcx, qword ptr [rbp + 0x5f8]
140bdb6e3: mov       rdx, r12
140bdb6e6: xor       r8d, r8d
140bdb6e9: mov       r9, rax
140bdb6ec: call      0x145d994d0
140bdb6f1: nop
140bdb6f2: jmp       0x140bdb7f4
140bdb6f7: lea       rax, [rip + 0x53b9a2a]
140bdb6fe: mov       qword ptr [rsp + 0x20], rax
140bdb703: mov       rcx, qword ptr [rbp + 0x5e0]
140bdb70a: mov       rdx, r14
140bdb70d: xor       r8d, r8d
140bdb710: call      0x145d994d0
140bdb715: nop
140bdb716: jmp       0x140bdb7f4
140bdb71b: mov       byte ptr [rbp + 0x633], 1
140bdb722: mov       byte ptr [rbp + 0x632], 1
140bdb729: lea       r9, [rip + 0x53b9270]
140bdb730: mov       rcx, qword ptr [rbp + 0x5c8]
140bdb737: mov       rdx, qword ptr [rbp + 0x5f8]
140bdb73e: call      0x145d99860
140bdb743: nop
140bdb744: jmp       0x140bdb7f4
140bdb749: mov       byte ptr [rbp + 0x633], 1
140bdb750: mov       byte ptr [rbp + 0x632], 1
140bdb757: lea       rcx, [rip + 0x746b0c2]
140bdb75e: call      0x145c27b58
140bdb763: nop
140bdb764: jmp       0x140bda719
140bdb769: mov       byte ptr [rbp + 0x633], 0
140bdb770: mov       byte ptr [rbp + 0x632], 1
140bdb777: lea       rcx, [rip + 0x746b0aa]
140bdb77e: call      0x145c27ba0
140bdb783: nop
140bdb784: jmp       0x140bdad8b
140bdb789: mov       byte ptr [rbp + 0x60c], 1
140bdb790: mov       qword ptr [rsp + 0x20], 0x140
140bdb799: mov       r9d, 0x10
140bdb79f: mov       rcx, qword ptr [rbp + 0x5e0]
140bdb7a6: call      0x145bfa970
140bdb7ab: nop
140bdb7ac: jmp       0x140bda9e9
140bdb7b1: mov       rdx, qword ptr [rbp + 0x3f0]
140bdb7b8: mov       byte ptr [rbp + 0x60c], 1
140bdb7bf: call      0x145d992bb
140bdb7c4: nop
140bdb7c5: jmp       0x140bdb7f4
140bdb7c7: mov       byte ptr [rbp + 0x633], 1
140bdb7ce: mov       byte ptr [rbp + 0x632], 1
140bdb7d5: lea       r8, [rip + 0x53b90fc]
140bdb7dc: call      0x145d99653
140bdb7e1: nop
140bdb7e2: jmp       0x140bdb7f4
140bdb7e4: lea       r8, [rip + 0x53b9105]
140bdb7eb: mov       rcx, rbx
140bdb7ee: call      0x145d99653
140bdb7f3: nop
140bdb7f4: ud2
