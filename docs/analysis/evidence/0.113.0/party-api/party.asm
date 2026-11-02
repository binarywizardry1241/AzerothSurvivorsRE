1458d5c80: push      rbp
1458d5c81: push      r15
1458d5c83: push      r14
1458d5c85: push      rsi
1458d5c86: push      rdi
1458d5c87: push      rbx
1458d5c88: sub       rsp, 0xa8
1458d5c8f: lea       rbp, [rsp + 0x80]
1458d5c97: mov       qword ptr [rbp + 0x20], 0xfffffffffffffffe
1458d5c9f: mov       rsi, rcx
1458d5ca2: movss     xmm0, dword ptr [rdx + 0xb6c]
1458d5caa: maxss     xmm0, dword ptr [rip + 0x5ca5de]
1458d5cb2: cvtss2sd  xmm0, xmm0
1458d5cb6: movsd     qword ptr [rbp - 0x30], xmm0
1458d5cbb: mov       r14, qword ptr [rdx + 0x9d8]
1458d5cc2: lea       rdi, [r14*8]
1458d5cca: test      r14, r14
1458d5ccd: mov       qword ptr [rbp + 0x10], rdi
1458d5cd1: mov       qword ptr [rbp + 8], r14
1458d5cd5: je        0x1458d5d1a
1458d5cd7: mov       rbx, qword ptr [rdx + 0x9d0]
1458d5cde: call      0x140002200
1458d5ce3: mov       edx, 8
1458d5ce8: mov       rcx, rdi
1458d5ceb: call      0x1400021c0
1458d5cf0: test      rax, rax
1458d5cf3: je        0x1458d5f77
1458d5cf9: mov       r15, rax
1458d5cfc: mov       rax, r14
1458d5cff: shl       rax, 6
1458d5d03: lea       rdx, [rax - 0x40]
1458d5d07: cmp       rdx, 0xc0
1458d5d0e: jae       0x1458d5d32
1458d5d10: xor       edi, edi
1458d5d12: mov       rcx, rbx
1458d5d15: jmp       0x1458d5d9e
1458d5d1a: movsd     xmm0, qword ptr [rip + 0x5d47fe]
1458d5d22: mov       eax, 8
1458d5d27: mov       r15d, 8
1458d5d2d: jmp       0x1458d5e66
1458d5d32: shr       rdx, 6
1458d5d36: inc       rdx
1458d5d39: mov       rdi, rdx
1458d5d3c: and       rdi, 0xfffffffffffffffc
1458d5d40: mov       rcx, rdi
1458d5d43: shl       rcx, 6
1458d5d47: add       rcx, rbx
1458d5d4a: xor       r8d, r8d
1458d5d4d: movdqa    xmm0, xmmword ptr [rip + 0x1a3f5fb]
1458d5d55: movdqa    xmm1, xmmword ptr [rip + 0x1a3f603]
1458d5d5d: mov       r9, rbx
1458d5d60: movq      xmm2, r9
1458d5d65: pshufd    xmm2, xmm2, 0x44
1458d5d6a: movdqa    xmm3, xmm2
1458d5d6e: paddq     xmm3, xmm0
1458d5d72: paddq     xmm2, xmm1
1458d5d76: movdqu    xmmword ptr [r15 + r8*8], xmm3
1458d5d7c: movdqu    xmmword ptr [r15 + r8*8 + 0x10], xmm2
1458d5d83: add       r8, 4
1458d5d87: add       r9, 0x100
1458d5d8e: cmp       rdi, r8
1458d5d91: jne       0x1458d5d60
1458d5d93: cmp       rdx, rdi
1458d5d96: jne       0x1458d5d9e
1458d5d98: lea       rdx, [rdi - 1]
1458d5d9c: jmp       0x1458d5dc3
1458d5d9e: add       rbx, rax
1458d5da1: nop       word ptr cs:[rax + rax]
1458d5db0: mov       rdx, rdi
1458d5db3: mov       qword ptr [r15 + rdi*8], rcx
1458d5db7: inc       rdi
1458d5dba: add       rcx, 0x40
1458d5dbe: cmp       rcx, rbx
1458d5dc1: jne       0x1458d5db0
1458d5dc3: lea       rax, [rbp + 0x1f]
1458d5dc7: mov       qword ptr [rbp - 0x28], rax
1458d5dcb: mov       eax, 1
1458d5dd0: test      rdx, rdx
1458d5dd3: jne       0x1458d5f54
1458d5dd9: lea       rdx, [rax - 1]
1458d5ddd: mov       ecx, eax
1458d5ddf: and       ecx, 3
1458d5de2: cmp       rdx, 3
1458d5de6: jae       0x1458d5df4
1458d5de8: movsd     xmm0, qword ptr [rip + 0x5d4730]
1458d5df0: xor       edx, edx
1458d5df2: jmp       0x1458d5e49
1458d5df4: mov       r8, rax
1458d5df7: and       r8, 0xfffffffffffffffc
1458d5dfb: movsd     xmm0, qword ptr [rip + 0x5d471d]
1458d5e03: xor       edx, edx
1458d5e05: nop       word ptr cs:[rax + rax]
1458d5e10: mov       r9, qword ptr [r15 + rdx*8]
1458d5e14: mov       r10, qword ptr [r15 + rdx*8 + 8]
1458d5e19: addsd     xmm0, qword ptr [r9 + 0x30]
1458d5e1f: addsd     xmm0, qword ptr [r10 + 0x30]
1458d5e25: mov       r9, qword ptr [r15 + rdx*8 + 0x10]
1458d5e2a: addsd     xmm0, qword ptr [r9 + 0x30]
1458d5e30: mov       r9, qword ptr [r15 + rdx*8 + 0x18]
1458d5e35: addsd     xmm0, qword ptr [r9 + 0x30]
1458d5e3b: add       rdx, 4
1458d5e3f: cmp       r8, rdx
1458d5e42: jne       0x1458d5e10
1458d5e44: test      rcx, rcx
1458d5e47: je        0x1458d5e62
1458d5e49: lea       rdx, [r15 + rdx*8]
1458d5e4d: xor       r8d, r8d
1458d5e50: mov       r9, qword ptr [rdx + r8*8]
1458d5e54: addsd     xmm0, qword ptr [r9 + 0x30]
1458d5e5a: inc       r8
1458d5e5d: cmp       rcx, r8
1458d5e60: jne       0x1458d5e50
1458d5e62: lea       rax, [r15 + rax*8]
1458d5e66: movsd     qword ptr [rbp - 0x38], xmm0
1458d5e6b: mov       qword ptr [rbp - 0x28], r15
1458d5e6f: mov       qword ptr [rbp - 0x20], rax
1458d5e73: lea       rax, [rbp - 0x30]
1458d5e77: mov       qword ptr [rbp - 0x18], rax
1458d5e7b: lea       rax, [rbp - 0x38]
1458d5e7f: mov       qword ptr [rbp - 0x10], rax
1458d5e83: mov       qword ptr [rbp - 8], r15
1458d5e87: lea       rcx, [rbp - 0x50]
1458d5e8b: lea       rdx, [rbp - 0x28]
1458d5e8f: call      0x14599d7f0
1458d5e94: nop
1458d5e95: mov       qword ptr [rbp], r15
1458d5e99: mov       rdi, qword ptr [rbp - 0x48]
1458d5e9d: mov       rbx, qword ptr [rbp - 0x40]
1458d5ea1: mov       qword ptr [rsp + 0x20], 1
1458d5eaa: lea       r9, [rip + 0x1a3fed0]
1458d5eb1: lea       rcx, [rbp - 0x28]
1458d5eb5: mov       rdx, rdi
1458d5eb8: mov       r8, rbx
1458d5ebb: call      0x1459bdb80
1458d5ec0: nop
1458d5ec1: mov       rax, qword ptr [rbp - 0x18]
1458d5ec5: mov       qword ptr [rsi + 0x10], rax
1458d5ec9: movups    xmm0, xmmword ptr [rbp - 0x28]
1458d5ecd: movups    xmmword ptr [rsi], xmm0
1458d5ed0: cmp       qword ptr [rbp + 8], 0
1458d5ed5: je        0x1458d5eea
1458d5ed7: mov       r8d, 8
1458d5edd: mov       rcx, qword ptr [rbp]
1458d5ee1: mov       rdx, qword ptr [rbp + 0x10]
1458d5ee5: call      0x1400021d0
1458d5eea: test      rbx, rbx
1458d5eed: je        0x1458d5f22
1458d5eef: lea       r14, [rdi + 8]
1458d5ef3: jmp       0x1458d5f09
1458d5ef5: nop       word ptr cs:[rax + rax]
1458d5f00: add       r14, 0x18
1458d5f04: dec       rbx
1458d5f07: je        0x1458d5f22
1458d5f09: mov       rdx, qword ptr [r14 - 8]
1458d5f0d: test      rdx, rdx
1458d5f10: je        0x1458d5f00
1458d5f12: mov       rcx, qword ptr [r14]
1458d5f15: mov       r8d, 1
1458d5f1b: call      0x1400021d0
1458d5f20: jmp       0x1458d5f00
1458d5f22: mov       rax, qword ptr [rbp - 0x50]
1458d5f26: test      rax, rax
1458d5f29: je        0x1458d5f41
1458d5f2b: shl       rax, 3
1458d5f2f: lea       rdx, [rax + rax*2]
1458d5f33: mov       r8d, 8
1458d5f39: mov       rcx, rdi
1458d5f3c: call      0x1400021d0
1458d5f41: mov       rax, rsi
1458d5f44: add       rsp, 0xa8
1458d5f4b: pop       rbx
1458d5f4c: pop       rdi
1458d5f4d: pop       rsi
1458d5f4e: pop       r14
1458d5f50: pop       r15
1458d5f52: pop       rbp
1458d5f53: ret
1458d5f54: cmp       rdx, 0x14
1458d5f58: jae       0x1458d5f86
1458d5f5a: lea       r9, [rbp - 0x28]
1458d5f5e: mov       r8d, 1
1458d5f64: mov       rcx, r15
1458d5f67: mov       rdx, rdi
1458d5f6a: call      0x1459c84b0
1458d5f6f: mov       rax, rdi
1458d5f72: jmp       0x1458d5dd9
1458d5f77: mov       ecx, 8
1458d5f7c: mov       rdx, rdi
1458d5f7f: call      0x145e99f5b
1458d5f84: ud2
1458d5f86: mov       qword ptr [rbp - 8], r15
1458d5f8a: lea       r8, [rbp - 0x28]
1458d5f8e: mov       rcx, r15
1458d5f91: mov       rdx, rdi
1458d5f94: call      0x14580b810
1458d5f99: nop
1458d5f9a: mov       rax, rdi
1458d5f9d: jmp       0x1458d5dd9
