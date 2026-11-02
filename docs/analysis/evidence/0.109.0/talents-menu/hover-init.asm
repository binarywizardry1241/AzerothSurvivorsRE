14007f1d0: push      rbp
14007f1d1: push      r14
14007f1d3: push      rsi
14007f1d4: push      rdi
14007f1d5: push      rbx
14007f1d6: sub       rsp, 0x210
14007f1dd: lea       rbp, [rsp + 0x80]
14007f1e5: mov       qword ptr [rbp + 0x188], 0xfffffffffffffffe
14007f1f0: mov       rbx, r8
14007f1f3: mov       rdi, rdx
14007f1f6: mov       rsi, rcx
14007f1f9: cmp       qword ptr [rdx + 0x40], -1
14007f1fe: je        0x14007f247
14007f200: mov       rax, qword ptr [rbx + 0x5a0]
14007f207: mov       qword ptr [rbp - 0x50], rax
14007f20b: cmp       qword ptr [rdi + 0x138], rax
14007f212: je        0x14007f275
14007f214: add       rdi, 0x138
14007f21b: lea       rax, [rip + 0x5d51876]
14007f222: mov       qword ptr [rsp + 0x28], rax
14007f227: mov       qword ptr [rsp + 0x20], 0x83
14007f230: lea       r9, [rip + 0x5d51819]
14007f237: lea       r8, [rbp - 0x50]
14007f23b: xor       ecx, ecx
14007f23d: mov       rdx, rdi
14007f240: call      0x145d4891d
14007f245: ud2
14007f247: lea       r14, [rbp - 0x50]
14007f24b: mov       rcx, r14
14007f24e: mov       rdx, rbx
14007f251: call      0x1403aa7c0
14007f256: mov       rax, qword ptr [rbx + 0x5a0]
14007f25d: mov       qword ptr [rbp + 0xe8], rax
14007f264: mov       r8d, 0x140
14007f26a: mov       rcx, rdi
14007f26d: mov       rdx, r14
14007f270: call      0x145bfa0e7
14007f275: lea       r14, [rdi + 0x40]
14007f279: mov       eax, 0x3dcc5000
14007f27e: add       eax, dword ptr [rbx + 0x5b0]
14007f284: mov       dword ptr [rdi + 0x140], eax
14007f28a: mov       qword ptr [rbp + 0x108], 0x10
14007f295: xorps     xmm0, xmm0
14007f298: movups    xmmword ptr [rbp + 0x110], xmm0
14007f29f: mov       qword ptr [rbp + 0x120], 0x10
14007f2aa: movups    xmmword ptr [rbp + 0x128], xmm0
14007f2b1: mov       qword ptr [rbp + 0x138], 0x10
14007f2bc: movups    xmmword ptr [rbp + 0x140], xmm0
14007f2c3: mov       qword ptr [rbp + 0x150], 0x10
14007f2ce: movups    xmmword ptr [rbp + 0x158], xmm0
14007f2d5: mov       qword ptr [rbp + 0x168], 0x10
14007f2e0: mov       qword ptr [rbp + 0xf0], 0
14007f2eb: movups    xmmword ptr [rbp + 0x170], xmm0
14007f2f2: mov       dword ptr [rbp + 0x180], 0
14007f2fc: mov       qword ptr [rbp + 0xf8], 8
14007f307: mov       qword ptr [rbp + 0x100], 0
14007f312: add       rdi, 0x144
14007f319: lea       rdx, [rbp + 0xf0]
14007f320: mov       rcx, rdi
14007f323: mov       r8, r14
14007f326: mov       r9, rbx
14007f329: call      0x144e1eb50
14007f32e: nop
14007f32f: lea       rcx, [rbp - 0x50]
14007f333: mov       rdx, r14
14007f336: call      0x144e89ac0
14007f33b: nop
14007f33c: lea       rcx, [rbp + 0xf0]
14007f343: lea       rdx, [rbp - 0x50]
14007f347: call      0x144e84b30
14007f34c: nop
14007f34d: lea       rdx, [rbp + 0xf0]
14007f354: mov       r8d, 0x98
14007f35a: mov       rcx, rsi
14007f35d: call      0x145bfa0e7
14007f362: mov       rax, rsi
14007f365: add       rsp, 0x210
14007f36c: pop       rbx
14007f36d: pop       rdi
14007f36e: pop       rsi
14007f36f: pop       r14
14007f371: pop       rbp
14007f372: ret
