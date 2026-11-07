1400a2ea0: push      rbp
1400a2ea1: push      r15
1400a2ea3: push      r14
1400a2ea5: push      r13
1400a2ea7: push      r12
1400a2ea9: push      rsi
1400a2eaa: push      rdi
1400a2eab: push      rbx
1400a2eac: sub       rsp, 0x48
1400a2eb0: lea       rbp, [rsp + 0x40]
1400a2eb5: mov       qword ptr [rbp], 0xfffffffffffffffe
1400a2ebd: mov       rsi, rcx
1400a2ec0: cmp       rdx, r8
1400a2ec3: je        0x1400a2ee5
1400a2ec5: mov       rdi, r8
1400a2ec8: mov       rbx, rdx
1400a2ecb: nop       dword ptr [rax + rax]
1400a2ed0: mov       rcx, rbx
1400a2ed3: call      0x14590f1f0
1400a2ed8: test      al, al
1400a2eda: jne       0x1400a2f01
1400a2edc: add       rbx, 0x78
1400a2ee0: cmp       rbx, rdi
1400a2ee3: jne       0x1400a2ed0
1400a2ee5: mov       qword ptr [rsi], 0
1400a2eec: mov       qword ptr [rsi + 8], 8
1400a2ef4: mov       qword ptr [rsi + 0x10], 0
1400a2efc: jmp       0x1400a2fbd
1400a2f01: call      0x140002200
1400a2f06: mov       ecx, 0x20
1400a2f0b: mov       edx, 8
1400a2f10: call      0x1400021c0
1400a2f15: test      rax, rax
1400a2f18: je        0x1400a2fd1
1400a2f1e: mov       r15, rax
1400a2f21: mov       qword ptr [rax], rbx
1400a2f24: add       rbx, 0x78
1400a2f28: mov       qword ptr [rbp - 0x18], 4
1400a2f30: mov       qword ptr [rbp - 0x10], rax
1400a2f34: mov       qword ptr [rbp - 8], 1
1400a2f3c: cmp       rbx, rdi
1400a2f3f: je        0x1400a2fa6
1400a2f41: mov       r14d, 1
1400a2f47: lea       r12, [rbp - 0x18]
1400a2f4b: mov       r13, rbx
1400a2f4e: nop
1400a2f50: mov       rcx, r13
1400a2f53: call      0x14590f1f0
1400a2f58: nop
1400a2f59: lea       rbx, [r13 + 0x78]
1400a2f5d: test      al, al
1400a2f5f: jne       0x1400a2f6b
1400a2f61: mov       r13, rbx
1400a2f64: cmp       rbx, rdi
1400a2f67: jne       0x1400a2f50
1400a2f69: jmp       0x1400a2fa6
1400a2f6b: cmp       r14, qword ptr [rbp - 0x18]
1400a2f6f: jne       0x1400a2f96
1400a2f71: mov       qword ptr [rsp + 0x20], 8
1400a2f7a: mov       r8d, 1
1400a2f80: mov       r9d, 8
1400a2f86: mov       rcx, r12
1400a2f89: mov       rdx, r14
1400a2f8c: call      0x145bfa970
1400a2f91: nop
1400a2f92: mov       r15, qword ptr [rbp - 0x10]
1400a2f96: mov       qword ptr [r15 + r14*8], r13
1400a2f9a: inc       r14
1400a2f9d: mov       qword ptr [rbp - 8], r14
1400a2fa1: cmp       rbx, rdi
1400a2fa4: jne       0x1400a2f4b
1400a2fa6: mov       rax, qword ptr [rbp - 8]
1400a2faa: mov       qword ptr [rsi + 0x10], rax
1400a2fae: mov       rax, qword ptr [rbp - 0x18]
1400a2fb2: mov       qword ptr [rsi], rax
1400a2fb5: mov       rax, qword ptr [rbp - 0x10]
1400a2fb9: mov       qword ptr [rsi + 8], rax
1400a2fbd: mov       rax, rsi
1400a2fc0: add       rsp, 0x48
1400a2fc4: pop       rbx
1400a2fc5: pop       rdi
1400a2fc6: pop       rsi
1400a2fc7: pop       r12
1400a2fc9: pop       r13
1400a2fcb: pop       r14
1400a2fcd: pop       r15
1400a2fcf: pop       rbp
1400a2fd0: ret
1400a2fd1: mov       ecx, 8
1400a2fd6: mov       edx, 0x20
1400a2fdb: call      0x145d992bb
1400a2fe0: ud2
