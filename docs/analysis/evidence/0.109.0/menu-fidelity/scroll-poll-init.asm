14019e1f0: push      rbp
14019e1f1: push      r15
14019e1f3: push      r14
14019e1f5: push      r13
14019e1f7: push      r12
14019e1f9: push      rsi
14019e1fa: push      rdi
14019e1fb: push      rbx
14019e1fc: sub       rsp, 0xd8
14019e203: lea       rbp, [rsp + 0x80]
14019e20b: mov       qword ptr [rbp + 0x50], 0xfffffffffffffffe
14019e213: mov       rdi, r8
14019e216: mov       rsi, rcx
14019e219: cmp       dword ptr [rdx], 1
14019e21c: jne       0x14019e23c
14019e21e: mov       rax, qword ptr [rdi + 0x5a0]
14019e225: mov       qword ptr [rbp - 0x48], rax
14019e229: cmp       qword ptr [rdx + 0x30], rax
14019e22d: jne       0x14019e3dc
14019e233: lea       rcx, [rdx + 8]
14019e237: jmp       0x14019e336
14019e23c: mov       r13, rdx
14019e23f: mov       rcx, rdi
14019e242: call      0x1400317a0
14019e247: mov       rbx, rax
14019e24a: lea       r15, [rdi + 0x40]
14019e24e: lea       r12, [rdi + 0x5a8]
14019e255: mov       qword ptr [rbp - 0x30], r15
14019e259: mov       qword ptr [rbp - 0x28], r12
14019e25d: mov       qword ptr [rbp - 0x48], 0
14019e265: mov       qword ptr [rbp - 0x40], 8
14019e26d: mov       qword ptr [rbp - 0x38], 0
14019e275: lea       rdx, [rip + 0x5bffcbc]
14019e27c: lea       rcx, [rbp - 0x48]
14019e280: call      0x140003100
14019e285: nop
14019e286: mov       r14, rax
14019e289: mov       rdx, qword ptr [rbp - 0x48]
14019e28d: test      rdx, rdx
14019e290: je        0x14019e2a5
14019e292: mov       rcx, qword ptr [rbp - 0x40]
14019e296: shl       rdx, 3
14019e29a: mov       r8d, 8
14019e2a0: call      0x1400021d0
14019e2a5: mov       qword ptr [rbp - 0x30], r15
14019e2a9: mov       qword ptr [rbp - 0x28], r12
14019e2ad: mov       qword ptr [rbp - 0x48], 0
14019e2b5: mov       qword ptr [rbp - 0x40], 8
14019e2bd: mov       qword ptr [rbp - 0x38], 0
14019e2c5: lea       rdx, [rip + 0x5c000d4]
14019e2cc: lea       rcx, [rbp - 0x48]
14019e2d0: call      0x140003400
14019e2d5: nop
14019e2d6: mov       r15, rax
14019e2d9: mov       rdx, qword ptr [rbp - 0x48]
14019e2dd: test      rdx, rdx
14019e2e0: je        0x14019e2f5
14019e2e2: mov       rcx, qword ptr [rbp - 0x40]
14019e2e6: shl       rdx, 3
14019e2ea: mov       r8d, 8
14019e2f0: call      0x1400021d0
14019e2f5: mov       rcx, rdi
14019e2f8: call      0x140036f50
14019e2fd: mov       r12, rax
14019e300: mov       rcx, rdi
14019e303: call      0x140032560
14019e308: mov       r8, qword ptr [rdi + 0x5a0]
14019e30f: mov       rdx, r13
14019e312: mov       qword ptr [r13], 1
14019e31a: lea       rcx, [r13 + 8]
14019e31e: mov       qword ptr [r13 + 8], rbx
14019e322: mov       qword ptr [r13 + 0x10], r14
14019e326: mov       qword ptr [r13 + 0x18], r15
14019e32a: mov       qword ptr [r13 + 0x20], r12
14019e32e: mov       qword ptr [r13 + 0x28], rax
14019e332: mov       qword ptr [r13 + 0x30], r8
14019e336: mov       eax, 0x3dcc5000
14019e33b: add       eax, dword ptr [rdi + 0x5b0]
14019e341: mov       dword ptr [rdx + 0x38], eax
14019e344: add       rdx, 0x38
14019e348: mov       qword ptr [rbp - 0x30], 0x10
14019e350: xorps     xmm0, xmm0
14019e353: movups    xmmword ptr [rbp - 0x28], xmm0
14019e357: mov       qword ptr [rbp - 0x18], 0x10
14019e35f: movups    xmmword ptr [rbp - 0x10], xmm0
14019e363: mov       qword ptr [rbp], 0x10
14019e36b: movups    xmmword ptr [rbp + 8], xmm0
14019e36f: mov       qword ptr [rbp + 0x18], 0x10
14019e377: movups    xmmword ptr [rbp + 0x20], xmm0
14019e37b: mov       qword ptr [rbp + 0x30], 0x10
14019e383: mov       qword ptr [rbp - 0x48], 0
14019e38b: movups    xmmword ptr [rbp + 0x38], xmm0
14019e38f: mov       dword ptr [rbp + 0x48], 0
14019e396: mov       qword ptr [rbp - 0x40], 8
14019e39e: mov       qword ptr [rbp - 0x38], 0
14019e3a6: lea       r8, [rbp - 0x48]
14019e3aa: mov       r9, rdi
14019e3ad: call      0x1400231e0
14019e3b2: nop
14019e3b3: lea       rdx, [rbp - 0x48]
14019e3b7: mov       r8d, 0x98
14019e3bd: mov       rcx, rsi
14019e3c0: call      0x145bfa0e7
14019e3c5: mov       rax, rsi
14019e3c8: add       rsp, 0xd8
14019e3cf: pop       rbx
14019e3d0: pop       rdi
14019e3d1: pop       rsi
14019e3d2: pop       r12
14019e3d4: pop       r13
14019e3d6: pop       r14
14019e3d8: pop       r15
14019e3da: pop       rbp
14019e3db: ret
14019e3dc: add       rdx, 0x30
14019e3e0: lea       rax, [rip + 0x5c48c69]
14019e3e7: mov       qword ptr [rsp + 0x28], rax
14019e3ec: mov       qword ptr [rsp + 0x20], 0x83
14019e3f5: lea       r9, [rip + 0x5c48c0c]
14019e3fc: lea       r8, [rbp - 0x48]
14019e400: xor       ecx, ecx
14019e402: call      0x145d4891d
14019e407: ud2
