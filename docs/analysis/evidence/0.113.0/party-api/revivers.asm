14598d280: push      rbp
14598d281: push      r15
14598d283: push      r14
14598d285: push      r13
14598d287: push      r12
14598d289: push      rsi
14598d28a: push      rdi
14598d28b: push      rbx
14598d28c: sub       rsp, 0x88
14598d293: lea       rbp, [rsp + 0x80]
14598d29b: mov       qword ptr [rbp], 0xfffffffffffffffe
14598d2a3: mov       rsi, rcx
14598d2a6: mov       r13, qword ptr [rdx]
14598d2a9: mov       r12, qword ptr [rdx + 8]
14598d2ad: cmp       r13, r12
14598d2b0: je        0x14598d40e
14598d2b6: mov       r15, qword ptr [rdx + 0x10]
14598d2ba: mov       rax, qword ptr [r15 + 0xb18]
14598d2c1: add       r13, 0x48
14598d2c5: nop       word ptr cs:[rax + rax]
14598d2d0: cmp       qword ptr [r13 - 0x10], rax
14598d2d4: je        0x14598d2e4
14598d2d6: cmp       r13, r12
14598d2d9: lea       r13, [r13 + 0x48]
14598d2dd: jne       0x14598d2d0
14598d2df: jmp       0x14598d40e
14598d2e4: mov       qword ptr [rdx], r13
14598d2e7: lea       rdx, [r13 - 0x48]
14598d2eb: lea       rcx, [rbp - 0x40]
14598d2ef: call      0x145ccb8a0
14598d2f4: mov       rdi, qword ptr [rbp - 0x40]
14598d2f8: cmp       rdi, -1
14598d2fc: je        0x14598d40e
14598d302: mov       r14, qword ptr [rbp - 0x38]
14598d306: call      0x140002200
14598d30b: mov       ecx, 0x60
14598d310: mov       edx, 8
14598d315: call      0x1400021c0
14598d31a: test      rax, rax
14598d31d: je        0x14598d43c
14598d323: mov       rbx, rax
14598d326: mov       rax, qword ptr [rbp - 0x30]
14598d32a: mov       qword ptr [rbx + 0x10], rax
14598d32e: movups    xmm0, xmmword ptr [rbp - 0x40]
14598d332: movups    xmmword ptr [rbx], xmm0
14598d335: mov       qword ptr [rbp - 0x28], 4
14598d33d: mov       qword ptr [rbp - 0x20], rbx
14598d341: mov       qword ptr [rbp - 0x18], 1
14598d349: cmp       r13, r12
14598d34c: je        0x14598d3f5
14598d352: mov       edi, 1
14598d357: lea       r14, [rbp - 0x58]
14598d35b: mov       rax, qword ptr [r15 + 0xb18]
14598d362: add       r13, 0x48
14598d366: nop       word ptr cs:[rax + rax]
14598d370: cmp       qword ptr [r13 - 0x10], rax
14598d374: je        0x14598d381
14598d376: cmp       r13, r12
14598d379: lea       r13, [r13 + 0x48]
14598d37d: jne       0x14598d370
14598d37f: jmp       0x14598d3f5
14598d381: lea       rdx, [r13 - 0x48]
14598d385: mov       rcx, r14
14598d388: call      0x145ccb8a0
14598d38d: nop
14598d38e: mov       rax, qword ptr [rbp - 0x58]
14598d392: mov       qword ptr [rbp - 8], rax
14598d396: cmp       rax, -1
14598d39a: je        0x14598d3f5
14598d39c: cmp       rdi, qword ptr [rbp - 0x28]
14598d3a0: jne       0x14598d3d0
14598d3a2: mov       rax, qword ptr [rbp - 0x50]
14598d3a6: mov       qword ptr [rbp - 0x10], rax
14598d3aa: mov       qword ptr [rsp + 0x20], 0x18
14598d3b3: mov       r8d, 1
14598d3b9: mov       r9d, 8
14598d3bf: lea       rcx, [rbp - 0x28]
14598d3c3: mov       rdx, rdi
14598d3c6: call      0x145cfd5e0
14598d3cb: nop
14598d3cc: mov       rbx, qword ptr [rbp - 0x20]
14598d3d0: lea       rax, [rdi + rdi*2]
14598d3d4: mov       rcx, qword ptr [rbp - 0x48]
14598d3d8: mov       qword ptr [rbx + rax*8 + 0x10], rcx
14598d3dd: movups    xmm0, xmmword ptr [rbp - 0x58]
14598d3e1: movups    xmmword ptr [rbx + rax*8], xmm0
14598d3e5: inc       rdi
14598d3e8: mov       qword ptr [rbp - 0x18], rdi
14598d3ec: cmp       r13, r12
14598d3ef: jne       0x14598d35b
14598d3f5: mov       rax, qword ptr [rbp - 0x18]
14598d3f9: mov       qword ptr [rsi + 0x10], rax
14598d3fd: mov       rax, qword ptr [rbp - 0x28]
14598d401: mov       qword ptr [rsi], rax
14598d404: mov       rax, qword ptr [rbp - 0x20]
14598d408: mov       qword ptr [rsi + 8], rax
14598d40c: jmp       0x14598d425
14598d40e: mov       qword ptr [rsi], 0
14598d415: mov       qword ptr [rsi + 8], 8
14598d41d: mov       qword ptr [rsi + 0x10], 0
14598d425: mov       rax, rsi
14598d428: add       rsp, 0x88
14598d42f: pop       rbx
14598d430: pop       rdi
14598d431: pop       rsi
14598d432: pop       r12
14598d434: pop       r13
14598d436: pop       r14
14598d438: pop       r15
14598d43a: pop       rbp
14598d43b: ret
14598d43c: mov       qword ptr [rbp - 0x10], r14
14598d440: mov       qword ptr [rbp - 8], rdi
14598d444: mov       ecx, 8
14598d449: mov       edx, 0x60
14598d44e: call      0x145e99f5b
14598d453: nop
14598d454: ud2
