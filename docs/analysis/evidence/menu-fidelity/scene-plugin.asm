140830c10: push      rbp
140830c11: push      rsi
140830c12: sub       rsp, 0x118
140830c19: lea       rbp, [rsp + 0x80]
140830c21: mov       qword ptr [rbp + 0x90], 0xfffffffffffffffe
140830c2c: mov       rsi, rdx
140830c2f: call      0x140002200
140830c34: mov       ecx, 0xe0
140830c39: mov       edx, 8
140830c3e: call      0x1400021c0
140830c43: test      rax, rax
140830c46: je        0x140830e59
140830c4c: mov       qword ptr [rbp + 0x80], rax
140830c53: call      0x140002200
140830c58: mov       ecx, 0x38
140830c5d: mov       edx, 8
140830c62: call      0x1400021c0
140830c67: test      rax, rax
140830c6a: je        0x140830e6a
140830c70: mov       dword ptr [rax], 0
140830c76: mov       byte ptr [rax + 4], 0
140830c7a: mov       dword ptr [rax + 0x28], 2
140830c81: lea       r8, [rip + 0x5698a78]
140830c88: lea       rcx, [rbp - 0x60]
140830c8c: mov       rdx, rax
140830c8f: call      0x144e1fc30
140830c94: nop
140830c95: call      0x140002200
140830c9a: mov       ecx, 0x150
140830c9f: mov       edx, 8
140830ca4: call      0x1400021c0
140830ca9: test      rax, rax
140830cac: je        0x140830e7c
140830cb2: mov       dword ptr [rax], 0
140830cb8: mov       byte ptr [rax + 4], 0
140830cbc: mov       qword ptr [rax + 0x100], 0xffffffffffffffff
140830cc7: lea       r8, [rip + 0x569898a]
140830cce: lea       rcx, [rbp + 0x10]
140830cd2: mov       rdx, rax
140830cd5: call      0x144e1fc30
140830cda: nop
140830cdb: movups    xmm0, xmmword ptr [rbp]
140830cdf: mov       rax, qword ptr [rbp + 0x80]
140830ce6: movups    xmmword ptr [rax + 0x60], xmm0
140830cea: movups    xmm0, xmmword ptr [rbp - 0x10]
140830cee: movups    xmmword ptr [rax + 0x50], xmm0
140830cf2: movups    xmm0, xmmword ptr [rbp - 0x20]
140830cf6: movups    xmmword ptr [rax + 0x40], xmm0
140830cfa: movups    xmm0, xmmword ptr [rbp - 0x60]
140830cfe: movups    xmm1, xmmword ptr [rbp - 0x50]
140830d02: movups    xmm2, xmmword ptr [rbp - 0x40]
140830d06: movups    xmm3, xmmword ptr [rbp - 0x30]
140830d0a: movups    xmmword ptr [rax + 0x30], xmm3
140830d0e: movups    xmmword ptr [rax + 0x20], xmm2
140830d12: movups    xmmword ptr [rax + 0x10], xmm1
140830d16: movups    xmmword ptr [rax], xmm0
140830d19: movups    xmm0, xmmword ptr [rbp + 0x10]
140830d1d: movups    xmm1, xmmword ptr [rbp + 0x20]
140830d21: movups    xmm2, xmmword ptr [rbp + 0x30]
140830d25: movups    xmm3, xmmword ptr [rbp + 0x40]
140830d29: movups    xmmword ptr [rax + 0x70], xmm0
140830d2d: movups    xmmword ptr [rax + 0x80], xmm1
140830d34: movups    xmmword ptr [rax + 0x90], xmm2
140830d3b: movups    xmmword ptr [rax + 0xa0], xmm3
140830d42: movups    xmm0, xmmword ptr [rbp + 0x50]
140830d46: movups    xmmword ptr [rax + 0xb0], xmm0
140830d4d: movups    xmm0, xmmword ptr [rbp + 0x60]
140830d51: movups    xmmword ptr [rax + 0xc0], xmm0
140830d58: movups    xmm0, xmmword ptr [rbp + 0x70]
140830d5c: movups    xmmword ptr [rax + 0xd0], xmm0
140830d63: mov       qword ptr [rbp + 0x18], 2
140830d6b: mov       qword ptr [rbp + 0x20], rax
140830d6f: mov       qword ptr [rbp + 0x28], 2
140830d77: mov       qword ptr [rbp + 0x30], 0
140830d7f: mov       qword ptr [rbp + 0x38], 8
140830d87: xorps     xmm0, xmm0
140830d8a: movups    xmmword ptr [rbp + 0x40], xmm0
140830d8e: mov       qword ptr [rbp + 0x10], 0xffffffffffffffff
140830d96: lea       rcx, [rbp + 0x48]
140830d9a: call      0x144e9bf10
140830d9f: nop
140830da0: movups    xmm0, xmmword ptr [rbp + 0x70]
140830da4: movaps    xmmword ptr [rbp], xmm0
140830da8: movups    xmm0, xmmword ptr [rbp + 0x60]
140830dac: movaps    xmmword ptr [rbp - 0x10], xmm0
140830db0: movups    xmm0, xmmword ptr [rbp + 0x50]
140830db4: movaps    xmmword ptr [rbp - 0x20], xmm0
140830db8: movups    xmm0, xmmword ptr [rbp + 0x10]
140830dbc: movups    xmm1, xmmword ptr [rbp + 0x20]
140830dc0: movups    xmm2, xmmword ptr [rbp + 0x30]
140830dc4: movups    xmm3, xmmword ptr [rbp + 0x40]
140830dc8: movaps    xmmword ptr [rbp - 0x30], xmm3
140830dcc: movaps    xmmword ptr [rbp - 0x40], xmm2
140830dd0: movaps    xmmword ptr [rbp - 0x50], xmm1
140830dd4: movaps    xmmword ptr [rbp - 0x60], xmm0
140830dd8: mov       byte ptr [rbp + 0x8f], 0
140830ddf: mov       rcx, qword ptr [rip + 0x78528ba]
140830de6: lea       r8, [rip + 0x578143b]
140830ded: lea       rdx, [rbp + 0x8f]
140830df4: call      0x14058b3a0
140830df9: nop
140830dfa: mov       r8, rdx
140830dfd: lea       rcx, [rbp - 0x60]
140830e01: mov       rdx, rax
140830e04: call      0x14013d550
140830e09: nop
140830e0a: movaps    xmm0, xmmword ptr [rbp]
140830e0e: movaps    xmmword ptr [rbp + 0x70], xmm0
140830e12: movaps    xmm0, xmmword ptr [rbp - 0x10]
140830e16: movaps    xmmword ptr [rbp + 0x60], xmm0
140830e1a: movaps    xmm0, xmmword ptr [rbp - 0x20]
140830e1e: movaps    xmmword ptr [rbp + 0x50], xmm0
140830e22: movaps    xmm0, xmmword ptr [rbp - 0x60]
140830e26: movaps    xmm1, xmmword ptr [rbp - 0x50]
140830e2a: movaps    xmm2, xmmword ptr [rbp - 0x40]
140830e2e: movaps    xmm3, xmmword ptr [rbp - 0x30]
140830e32: movaps    xmmword ptr [rbp + 0x40], xmm3
140830e36: movaps    xmmword ptr [rbp + 0x30], xmm2
140830e3a: movaps    xmmword ptr [rbp + 0x20], xmm1
140830e3e: movaps    xmmword ptr [rbp + 0x10], xmm0
140830e42: lea       rdx, [rbp + 0x10]
140830e46: mov       rcx, rsi
140830e49: call      0x14051a3a0
140830e4e: nop
140830e4f: add       rsp, 0x118
140830e56: pop       rsi
140830e57: pop       rbp
140830e58: ret
140830e59: mov       ecx, 8
140830e5e: mov       edx, 0xe0
140830e63: call      0x145d992a1
140830e68: ud2
140830e6a: mov       ecx, 8
140830e6f: mov       edx, 0x38
140830e74: call      0x145d992a1
140830e79: nop
140830e7a: jmp       0x140830e8c
140830e7c: mov       ecx, 8
140830e81: mov       edx, 0x150
140830e86: call      0x145d992a1
140830e8b: nop
140830e8c: ud2
