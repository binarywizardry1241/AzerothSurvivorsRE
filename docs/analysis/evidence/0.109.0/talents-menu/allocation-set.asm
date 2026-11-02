1458a7b80: push      rbp
1458a7b81: push      r15
1458a7b83: push      r14
1458a7b85: push      r13
1458a7b87: push      r12
1458a7b89: push      rsi
1458a7b8a: push      rdi
1458a7b8b: push      rbx
1458a7b8c: sub       rsp, 0x88
1458a7b93: lea       rbp, [rsp + 0x80]
1458a7b9b: mov       qword ptr [rbp], 0xfffffffffffffffe
1458a7ba3: mov       ebx, edx
1458a7ba5: mov       rsi, rcx
1458a7ba8: mov       rax, qword ptr [r8 + 0x10]
1458a7bac: mov       qword ptr [rbp - 0x50], rax
1458a7bb0: movups    xmm0, xmmword ptr [r8]
1458a7bb4: movaps    xmmword ptr [rbp - 0x60], xmm0
1458a7bb8: mov       r12, qword ptr [rcx + 0x68]
1458a7bbc: mov       r14, qword ptr [rcx + 0x70]
1458a7bc0: mov       r13, r14
1458a7bc3: shl       r13, 5
1458a7bc7: xor       eax, eax
1458a7bc9: xor       ecx, ecx
1458a7bcb: nop       dword ptr [rax + rax]
1458a7bd0: cmp       r13, rcx
1458a7bd3: je        0x1458a7be8
1458a7bd5: lea       rdx, [rcx + 0x20]
1458a7bd9: cmp       byte ptr [r12 + rcx + 4], bl
1458a7bde: mov       rcx, rdx
1458a7be1: jne       0x1458a7bd0
1458a7be3: mov       eax, dword ptr [r12 + rdx - 0x20]
1458a7be8: mov       ecx, 0x6e
1458a7bed: mov       r9d, 2
1458a7bf3: nop       word ptr cs:[rax + rax]
1458a7c00: lea       edx, [rcx - 0x1e]
1458a7c03: sub       eax, edx
1458a7c05: jb        0x1458a7c29
1458a7c07: lea       edx, [rcx - 0xf]
1458a7c0a: sub       eax, edx
1458a7c0c: jb        0x1458a7c2f
1458a7c0e: sub       eax, ecx
1458a7c10: jb        0x1458a7c32
1458a7c12: add       ecx, 0x2d
1458a7c15: add       r9d, 3
1458a7c19: cmp       ecx, 0x36b
1458a7c1f: jne       0x1458a7c00
1458a7c21: mov       r9d, 0x33
1458a7c27: jmp       0x1458a7c32
1458a7c29: add       r9d, -2
1458a7c2d: jmp       0x1458a7c32
1458a7c2f: dec       r9d
1458a7c32: lea       rcx, [rbp - 0x48]
1458a7c36: lea       rdx, [rbp - 0x60]
1458a7c3a: mov       r8d, ebx
1458a7c3d: call      0x1459106e0
1458a7c42: mov       rax, qword ptr [rsi + 0x80]
1458a7c49: mov       rcx, qword ptr [rsi + 0x88]
1458a7c50: add       rax, -0x4f
1458a7c54: shl       rcx, 4
1458a7c58: lea       rcx, [rcx + rcx*4]
1458a7c5c: nop       dword ptr [rax]
1458a7c60: test      rcx, rcx
1458a7c63: je        0x1458a7d6e
1458a7c69: lea       r15, [rax + 0x50]
1458a7c6d: add       rcx, -0x50
1458a7c71: cmp       byte ptr [rax + 0x4f], bl
1458a7c74: mov       rax, r15
1458a7c77: jne       0x1458a7c60
1458a7c79: mov       qword ptr [rbp - 0x18], r14
1458a7c7d: mov       rax, qword ptr [rbp - 0x40]
1458a7c81: mov       qword ptr [rbp - 0x10], rax
1458a7c85: mov       r14, qword ptr [rbp - 0x38]
1458a7c89: mov       rdi, r14
1458a7c8c: shl       rdi, 4
1458a7c90: mov       rax, r14
1458a7c93: shr       rax, 0x3c
1458a7c97: setne     al
1458a7c9a: movabs    rcx, 0x7ffffffffffffff8
1458a7ca4: cmp       rdi, rcx
1458a7ca7: seta      cl
1458a7caa: or        cl, al
1458a7cac: je        0x1458a7cca
1458a7cae: xor       ecx, ecx
1458a7cb0: mov       rax, qword ptr [rbp - 0x10]
1458a7cb4: mov       qword ptr [rbp - 0x30], rax
1458a7cb8: mov       byte ptr [rbp - 1], 1
1458a7cbc: mov       rdx, rdi
1458a7cbf: call      0x145d992bb
1458a7cc4: nop
1458a7cc5: jmp       0x1458a7e5f
1458a7cca: test      rdi, rdi
1458a7ccd: je        0x1458a7e2b
1458a7cd3: call      0x140002200
1458a7cd8: mov       edx, 8
1458a7cdd: mov       rcx, rdi
1458a7ce0: call      0x1400021c0
1458a7ce5: mov       ecx, 8
1458a7cea: mov       qword ptr [rbp - 0x28], rax
1458a7cee: test      rax, rax
1458a7cf1: je        0x1458a7cb0
1458a7cf3: mov       qword ptr [rbp - 0x20], r14
1458a7cf7: test      r14, r14
1458a7cfa: je        0x1458a7d0c
1458a7cfc: mov       rcx, qword ptr [rbp - 0x28]
1458a7d00: mov       rdx, qword ptr [rbp - 0x10]
1458a7d04: mov       r8, rdi
1458a7d07: call      0x145bfa0e7
1458a7d0c: movzx     edi, byte ptr [r15]
1458a7d10: cmp       rdi, 2
1458a7d14: ja        0x1458a7e4a
1458a7d1a: lea       eax, [rdi*8]
1458a7d21: lea       rcx, [rax + rax*2]
1458a7d25: mov       rdx, qword ptr [r15 + rcx + 7]
1458a7d2a: test      rdx, rdx
1458a7d2d: je        0x1458a7d4f
1458a7d2f: lea       rax, [rdi + rdi*2]
1458a7d33: mov       qword ptr [rbp - 0x10], rcx
1458a7d37: mov       rcx, qword ptr [r15 + rax*8 + 0xf]
1458a7d3c: shl       rdx, 4
1458a7d40: mov       r8d, 8
1458a7d46: call      0x1400021d0
1458a7d4b: mov       rcx, qword ptr [rbp - 0x10]
1458a7d4f: mov       rax, qword ptr [rbp - 0x20]
1458a7d53: mov       qword ptr [r15 + rcx + 7], rax
1458a7d58: lea       rax, [rdi + rdi*2]
1458a7d5c: mov       rcx, qword ptr [rbp - 0x28]
1458a7d60: mov       qword ptr [r15 + rax*8 + 0xf], rcx
1458a7d65: mov       qword ptr [r15 + rax*8 + 0x17], r14
1458a7d6a: mov       r14, qword ptr [rbp - 0x18]
1458a7d6e: lea       rcx, [rsi + 0x60]
1458a7d72: xor       eax, eax
1458a7d74: mov       rdx, r12
1458a7d77: nop       word ptr [rax + rax]
1458a7d80: cmp       r13, rax
1458a7d83: je        0x1458a7dc9
1458a7d85: add       rax, 0x20
1458a7d89: cmp       byte ptr [rdx + 4], bl
1458a7d8c: lea       rdx, [rdx + 0x20]
1458a7d90: jne       0x1458a7d80
1458a7d92: lea       rsi, [r12 + rax]
1458a7d96: add       rsi, -0x18
1458a7d9a: mov       rdx, qword ptr [r12 + rax - 0x18]
1458a7d9f: test      rdx, rdx
1458a7da2: je        0x1458a7db8
1458a7da4: mov       rcx, qword ptr [r12 + rax - 0x10]
1458a7da9: shl       rdx, 4
1458a7dad: mov       r8d, 8
1458a7db3: call      0x1400021d0
1458a7db8: mov       rax, qword ptr [rbp - 0x38]
1458a7dbc: mov       qword ptr [rsi + 0x10], rax
1458a7dc0: movups    xmm0, xmmword ptr [rbp - 0x48]
1458a7dc4: movups    xmmword ptr [rsi], xmm0
1458a7dc7: jmp       0x1458a7e17
1458a7dc9: mov       rdx, qword ptr [rbp - 0x48]
1458a7dcd: mov       rax, qword ptr [rbp - 0x40]
1458a7dd1: mov       rdi, qword ptr [rbp - 0x38]
1458a7dd5: cmp       r14, qword ptr [rcx]
1458a7dd8: jne       0x1458a7df4
1458a7dda: mov       qword ptr [rbp - 0x18], rdx
1458a7dde: mov       qword ptr [rbp - 0x10], rax
1458a7de2: call      0x145bfae10
1458a7de7: nop
1458a7de8: mov       r12, qword ptr [rsi + 0x68]
1458a7dec: mov       rax, qword ptr [rbp - 0x10]
1458a7df0: mov       rdx, qword ptr [rbp - 0x18]
1458a7df4: mov       dword ptr [r12 + r13], 0
1458a7dfc: mov       byte ptr [r12 + r13 + 4], bl
1458a7e01: mov       qword ptr [r12 + r13 + 8], rdx
1458a7e06: mov       qword ptr [r12 + r13 + 0x10], rax
1458a7e0b: mov       qword ptr [r12 + r13 + 0x18], rdi
1458a7e10: inc       r14
1458a7e13: mov       qword ptr [rsi + 0x70], r14
1458a7e17: add       rsp, 0x88
1458a7e1e: pop       rbx
1458a7e1f: pop       rdi
1458a7e20: pop       rsi
1458a7e21: pop       r12
1458a7e23: pop       r13
1458a7e25: pop       r14
1458a7e27: pop       r15
1458a7e29: pop       rbp
1458a7e2a: ret
1458a7e2b: mov       eax, 8
1458a7e30: mov       qword ptr [rbp - 0x28], rax
1458a7e34: mov       qword ptr [rbp - 0x20], 0
1458a7e3c: test      r14, r14
1458a7e3f: jne       0x1458a7cfc
1458a7e45: jmp       0x1458a7d0c
1458a7e4a: lea       r8, [rip + 0x1343adf]
1458a7e51: mov       edx, 3
1458a7e56: mov       rcx, rdi
1458a7e59: call      0x145d99653
1458a7e5e: nop
1458a7e5f: ud2
