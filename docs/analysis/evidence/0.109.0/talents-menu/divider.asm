140100b90: push      rbp
140100b91: push      rsi
140100b92: push      rdi
140100b93: push      rbx
140100b94: sub       rsp, 0x208
140100b9b: lea       rbp, [rsp + 0x80]
140100ba3: movaps    xmmword ptr [rbp + 0x170], xmm7
140100baa: movaps    xmmword ptr [rbp + 0x160], xmm6
140100bb1: mov       qword ptr [rbp + 0x158], 0xfffffffffffffffe
140100bbc: mov       rdi, r8
140100bbf: mov       rsi, rcx
140100bc2: movzx     eax, word ptr [rdx + 0x164]
140100bc9: mov       word ptr [rbp + 0x104], ax
140100bd0: movzx     eax, byte ptr [rdx + 0x154]
140100bd7: mov       byte ptr [rbp + 0xf4], al
140100bdd: mov       eax, dword ptr [rdx + 0x68]
140100be0: movss     xmm0, dword ptr [rdx + 0x6c]
140100be5: mov       dword ptr [rbp + 8], eax
140100be8: movss     dword ptr [rbp + 0xc], xmm0
140100bed: mov       eax, dword ptr [rdx + 0x70]
140100bf0: movss     xmm0, dword ptr [rdx + 0x74]
140100bf5: mov       dword ptr [rbp + 0x10], eax
140100bf8: movss     dword ptr [rbp + 0x14], xmm0
140100bfd: mov       eax, dword ptr [rdx + 0x78]
140100c00: movss     xmm0, dword ptr [rdx + 0x7c]
140100c05: mov       dword ptr [rbp + 0x18], eax
140100c08: movss     dword ptr [rbp + 0x1c], xmm0
140100c0d: mov       eax, dword ptr [rdx + 0x80]
140100c13: movss     xmm0, dword ptr [rdx + 0x84]
140100c1b: mov       dword ptr [rbp + 0x20], eax
140100c1e: movss     dword ptr [rbp + 0x24], xmm0
140100c23: mov       eax, dword ptr [rdx + 0x88]
140100c29: movss     xmm0, dword ptr [rdx + 0x8c]
140100c31: mov       dword ptr [rbp + 0x28], eax
140100c34: movss     dword ptr [rbp + 0x2c], xmm0
140100c39: movabs    rax, 0x3f80000000000001
140100c43: mov       qword ptr [rbp + 0x30], rax
140100c47: mov       eax, dword ptr [rdx + 0x98]
140100c4d: movss     xmm0, dword ptr [rdx + 0x9c]
140100c55: mov       dword ptr [rbp + 0x38], eax
140100c58: movss     dword ptr [rbp + 0x3c], xmm0
140100c5d: mov       eax, dword ptr [rdx + 0xa0]
140100c63: movss     xmm0, dword ptr [rdx + 0xa4]
140100c6b: mov       dword ptr [rbp + 0x40], eax
140100c6e: movss     dword ptr [rbp + 0x44], xmm0
140100c73: mov       eax, dword ptr [rdx + 0xa8]
140100c79: movss     xmm0, dword ptr [rdx + 0xac]
140100c81: mov       dword ptr [rbp + 0x48], eax
140100c84: movss     dword ptr [rbp + 0x4c], xmm0
140100c89: mov       eax, dword ptr [rdx + 0xb0]
140100c8f: movss     xmm0, dword ptr [rdx + 0xb4]
140100c97: mov       dword ptr [rbp + 0x50], eax
140100c9a: movss     dword ptr [rbp + 0x54], xmm0
140100c9f: mov       eax, dword ptr [rdx + 0x60]
140100ca2: movss     xmm0, dword ptr [rdx + 0x64]
140100ca7: mov       dword ptr [rbp], eax
140100caa: movss     dword ptr [rbp + 4], xmm0
140100caf: mov       eax, dword ptr [rdx + 0x17a]
140100cb5: mov       dword ptr [rbp + 0x11a], eax
140100cbb: movups    xmm0, xmmword ptr [rdx + 0xb8]
140100cc2: movups    xmm1, xmmword ptr [rdx + 0xc8]
140100cc9: movups    xmmword ptr [rbp + 0x68], xmm1
140100ccd: movups    xmmword ptr [rbp + 0x58], xmm0
140100cd1: movups    xmm0, xmmword ptr [rdx + 0xd8]
140100cd8: movups    xmm1, xmmword ptr [rdx + 0xe8]
140100cdf: movups    xmmword ptr [rbp + 0x88], xmm1
140100ce6: movups    xmmword ptr [rbp + 0x78], xmm0
140100cea: movups    xmm0, xmmword ptr [rdx + 0xf8]
140100cf1: movups    xmm1, xmmword ptr [rdx + 0x108]
140100cf8: movups    xmmword ptr [rbp + 0xa8], xmm1
140100cff: movups    xmmword ptr [rbp + 0x98], xmm0
140100d06: movups    xmm0, xmmword ptr [rdx + 0x118]
140100d0d: movups    xmm1, xmmword ptr [rdx + 0x128]
140100d14: movups    xmmword ptr [rbp + 0xc8], xmm1
140100d1b: movups    xmmword ptr [rbp + 0xb8], xmm0
140100d22: movsd     xmm0, qword ptr [rdx + 0x158]
140100d2a: movsd     qword ptr [rbp + 0xf8], xmm0
140100d32: movss     xmm0, dword ptr [rdx + 0x160]
140100d3a: movss     dword ptr [rbp + 0x100], xmm0
140100d42: mov       eax, dword ptr [rdx + 0x138]
140100d48: movss     xmm0, dword ptr [rdx + 0x13c]
140100d50: mov       dword ptr [rbp + 0xd8], eax
140100d56: movss     dword ptr [rbp + 0xdc], xmm0
140100d5e: mov       eax, dword ptr [rdx + 0x140]
140100d64: movss     xmm0, dword ptr [rdx + 0x144]
140100d6c: mov       dword ptr [rbp + 0xe0], eax
140100d72: movss     dword ptr [rbp + 0xe4], xmm0
140100d7a: mov       eax, dword ptr [rdx + 0x148]
140100d80: mov       dword ptr [rbp + 0xe8], eax
140100d86: movsd     xmm0, qword ptr [rdx + 0x14c]
140100d8e: movsd     qword ptr [rbp + 0xec], xmm0
140100d96: mov       rax, qword ptr [rdx + 0x172]
140100d9d: mov       qword ptr [rbp + 0x112], rax
140100da4: mov       rax, qword ptr [rdx + 0x10]
140100da8: mov       qword ptr [rbp - 0x50], rax
140100dac: movups    xmm0, xmmword ptr [rdx]
140100daf: movaps    xmmword ptr [rbp - 0x60], xmm0
140100db3: mov       rax, qword ptr [rdx + 0x28]
140100db7: mov       qword ptr [rbp - 0x38], rax
140100dbb: movups    xmm0, xmmword ptr [rdx + 0x18]
140100dbf: movups    xmmword ptr [rbp - 0x48], xmm0
140100dc3: mov       rax, qword ptr [rdx + 0x40]
140100dc7: mov       qword ptr [rbp - 0x20], rax
140100dcb: movups    xmm0, xmmword ptr [rdx + 0x30]
140100dcf: movaps    xmmword ptr [rbp - 0x30], xmm0
140100dd3: mov       rax, qword ptr [rdx + 0x58]
140100dd7: mov       qword ptr [rbp - 8], rax
140100ddb: movups    xmm0, xmmword ptr [rdx + 0x48]
140100ddf: movups    xmmword ptr [rbp - 0x18], xmm0
140100de3: mov       eax, dword ptr [rdx + 0x166]
140100de9: mov       dword ptr [rbp + 0x106], eax
140100def: movzx     eax, word ptr [rdx + 0x16a]
140100df6: mov       word ptr [rbp + 0x10a], ax
140100dfd: mov       eax, dword ptr [rdx + 0x16c]
140100e03: mov       dword ptr [rbp + 0x10c], eax
140100e09: movzx     eax, word ptr [rdx + 0x170]
140100e10: mov       word ptr [rbp + 0x110], ax
140100e17: call      0x140002200
140100e1c: mov       ecx, 0x60
140100e21: mov       edx, 4
140100e26: call      0x1400021c0
140100e2b: test      rax, rax
140100e2e: je        0x140100fa4
140100e34: mov       qword ptr [rbp + 0x150], rax
140100e3b: movups    xmm0, xmmword ptr [rdi]
140100e3e: movaps    xmmword ptr [rbp + 0x130], xmm0
140100e45: mov       dword ptr [rbp + 0x140], 0
140100e4f: lea       rcx, [rbp + 0x120]
140100e56: lea       rdx, [rbp + 0x130]
140100e5d: call      0x144c7dcf0
140100e62: nop
140100e63: movaps    xmm6, xmmword ptr [rbp + 0x120]
140100e6a: mov       eax, dword ptr [rdi + 0x10]
140100e6d: mov       dword ptr [rbp + 0x140], eax
140100e73: movups    xmm0, xmmword ptr [rdi]
140100e76: movaps    xmmword ptr [rbp + 0x130], xmm0
140100e7d: lea       rcx, [rbp + 0x120]
140100e84: lea       rdx, [rbp + 0x130]
140100e8b: call      0x144c7dcf0
140100e90: nop
140100e91: movaps    xmm7, xmmword ptr [rbp + 0x120]
140100e98: movups    xmm0, xmmword ptr [rdi]
140100e9b: movaps    xmmword ptr [rbp + 0x130], xmm0
140100ea2: mov       dword ptr [rbp + 0x140], 0
140100eac: lea       rcx, [rbp + 0x120]
140100eb3: lea       rdx, [rbp + 0x130]
140100eba: call      0x144c7dcf0
140100ebf: nop
140100ec0: movaps    xmm0, xmmword ptr [rbp + 0x120]
140100ec7: mov       rbx, qword ptr [rbp + 0x150]
140100ece: mov       dword ptr [rbx], 0
140100ed4: mov       dword ptr [rbx + 8], 1
140100edb: movups    xmmword ptr [rbx + 0xc], xmm6
140100edf: mov       qword ptr [rbx + 0x1c], 0x3f000000
140100ee7: mov       dword ptr [rbx + 0x28], 1
140100eee: movups    xmmword ptr [rbx + 0x2c], xmm7
140100ef2: mov       qword ptr [rbx + 0x3c], 0x3f000000
140100efa: mov       dword ptr [rbx + 0x48], 1
140100f01: movups    xmmword ptr [rbx + 0x4c], xmm0
140100f05: mov       dword ptr [rbx + 0x5c], 0x3f000000
140100f0c: call      0x140002200
140100f11: mov       ecx, 0x48
140100f16: mov       edx, 8
140100f1b: call      0x1400021c0
140100f20: test      rax, rax
140100f23: je        0x140100fb6
140100f29: mov       rdi, rax
140100f2c: mov       qword ptr [rax + 8], 3
140100f34: mov       qword ptr [rax + 0x10], rbx
140100f38: mov       qword ptr [rax + 0x18], 3
140100f40: mov       dword ptr [rax + 0x20], 0x3fc90fdb
140100f47: mov       byte ptr [rax + 0x24], 0
140100f4b: movabs    rax, 0x8000000000000000
140100f55: mov       qword ptr [rdi], rax
140100f58: lea       rdx, [rbp - 0x60]
140100f5c: mov       r8d, 0x180
140100f62: mov       rcx, rsi
140100f65: call      0x145bfa0e7
140100f6a: mov       qword ptr [rsi + 0x180], 1
140100f75: mov       qword ptr [rsi + 0x188], rdi
140100f7c: mov       qword ptr [rsi + 0x190], 1
140100f87: mov       rax, rsi
140100f8a: movaps    xmm6, xmmword ptr [rbp + 0x160]
140100f91: movaps    xmm7, xmmword ptr [rbp + 0x170]
140100f98: add       rsp, 0x208
140100f9f: pop       rbx
140100fa0: pop       rdi
140100fa1: pop       rsi
140100fa2: pop       rbp
140100fa3: ret
140100fa4: mov       ecx, 4
140100fa9: mov       edx, 0x60
140100fae: call      0x145d992a1
140100fb3: nop
140100fb4: jmp       0x140100fc6
140100fb6: mov       ecx, 8
140100fbb: mov       edx, 0x48
140100fc0: call      0x145d992a1
140100fc5: nop
140100fc6: ud2
