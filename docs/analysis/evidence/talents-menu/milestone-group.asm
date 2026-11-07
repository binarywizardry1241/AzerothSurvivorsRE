1400a2d20: push      rbp
1400a2d21: push      r15
1400a2d23: push      r14
1400a2d25: push      r13
1400a2d27: push      r12
1400a2d29: push      rsi
1400a2d2a: push      rdi
1400a2d2b: push      rbx
1400a2d2c: sub       rsp, 0x48
1400a2d30: lea       rbp, [rsp + 0x40]
1400a2d35: mov       qword ptr [rbp], 0xfffffffffffffffe
1400a2d3d: mov       rsi, rcx
1400a2d40: mov       rax, qword ptr [rdx]
1400a2d43: mov       r14, qword ptr [rdx + 8]
1400a2d47: mov       r15, qword ptr [rdx + 0x10]
1400a2d4b: nop       dword ptr [rax + rax]
1400a2d50: cmp       rax, r14
1400a2d53: je        0x1400a2dfc
1400a2d59: lea       r12, [rax + 8]
1400a2d5d: mov       qword ptr [rdx], r12
1400a2d60: mov       rdi, qword ptr [rax]
1400a2d63: movzx     ecx, byte ptr [rdi + 0x70]
1400a2d67: mov       rax, r12
1400a2d6a: cmp       cl, byte ptr [r15 + 0x70]
1400a2d6e: jne       0x1400a2d50
1400a2d70: call      0x140002200
1400a2d75: mov       ecx, 0x20
1400a2d7a: mov       edx, 8
1400a2d7f: call      0x1400021c0
1400a2d84: test      rax, rax
1400a2d87: je        0x1400a2e38
1400a2d8d: mov       qword ptr [rax], rdi
1400a2d90: mov       qword ptr [rbp - 0x18], 4
1400a2d98: mov       qword ptr [rbp - 0x10], rax
1400a2d9c: mov       edi, 1
1400a2da1: lea       rbx, [rbp - 0x18]
1400a2da5: mov       qword ptr [rbp - 8], rdi
1400a2da9: nop       dword ptr [rax]
1400a2db0: cmp       r12, r14
1400a2db3: je        0x1400a2e15
1400a2db5: mov       r13, qword ptr [r12]
1400a2db9: add       r12, 8
1400a2dbd: movzx     ecx, byte ptr [r13 + 0x70]
1400a2dc2: cmp       cl, byte ptr [r15 + 0x70]
1400a2dc6: jne       0x1400a2db0
1400a2dc8: cmp       rdi, qword ptr [rbp - 0x18]
1400a2dcc: jne       0x1400a2df3
1400a2dce: mov       qword ptr [rsp + 0x20], 8
1400a2dd7: mov       r8d, 1
1400a2ddd: mov       r9d, 8
1400a2de3: mov       rcx, rbx
1400a2de6: mov       rdx, rdi
1400a2de9: call      0x145bfa970
1400a2dee: nop
1400a2def: mov       rax, qword ptr [rbp - 0x10]
1400a2df3: mov       qword ptr [rax + rdi*8], r13
1400a2df7: inc       rdi
1400a2dfa: jmp       0x1400a2da5
1400a2dfc: mov       qword ptr [rsi], 0
1400a2e03: mov       qword ptr [rsi + 8], 8
1400a2e0b: mov       qword ptr [rsi + 0x10], 0
1400a2e13: jmp       0x1400a2e24
1400a2e15: mov       rax, qword ptr [rbp - 8]
1400a2e19: mov       qword ptr [rsi + 0x10], rax
1400a2e1d: movups    xmm0, xmmword ptr [rbp - 0x18]
1400a2e21: movups    xmmword ptr [rsi], xmm0
1400a2e24: mov       rax, rsi
1400a2e27: add       rsp, 0x48
1400a2e2b: pop       rbx
1400a2e2c: pop       rdi
1400a2e2d: pop       rsi
1400a2e2e: pop       r12
1400a2e30: pop       r13
1400a2e32: pop       r14
1400a2e34: pop       r15
1400a2e36: pop       rbp
1400a2e37: ret
1400a2e38: mov       ecx, 8
1400a2e3d: mov       edx, 0x20
1400a2e42: call      0x145d992bb
1400a2e47: ud2
