0x14016f010: push rbp
0x14016f011: push r15
0x14016f013: push r14
0x14016f015: push r13
0x14016f017: push r12
0x14016f019: push rsi
0x14016f01a: push rdi
0x14016f01b: push rbx
0x14016f01c: sub rsp, 0x2d8
0x14016f023: lea rbp, [rsp + 0x80]
0x14016f02b: mov qword ptr [rbp + 0x250], 0xfffffffffffffffe
0x14016f036: mov rbx, r8
0x14016f039: mov rdi, rdx
0x14016f03c: mov rsi, rcx
0x14016f03f: cmp qword ptr [rdx], -1
0x14016f043: je 0x14016f096
0x14016f045: mov rax, qword ptr [rbx + 0x5a0]
0x14016f04c: mov qword ptr [rbp + 0x138], rax
0x14016f053: cmp qword ptr [rdi + 0x160], rax
0x14016f05a: je 0x14016f23c
0x14016f060: add rdi, 0x160
0x14016f067: lea rax, [rip + 0x6057d4a]
0x14016f06e: mov qword ptr [rsp + 0x28], rax
0x14016f073: mov qword ptr [rsp + 0x20], 0x83
0x14016f07c: lea r9, [rip + 0x6057ced]
0x14016f083: lea r8, [rbp + 0x138]
0x14016f08a: xor ecx, ecx
0x14016f08c: mov rdx, rdi
0x14016f08f: call 0x1461574ad
0x14016f094: ud2 
0x14016f096: lea r8, [rip + 0x60555bb]
0x14016f09d: lea rcx, [rbp + 0xc8]
0x14016f0a4: mov rdx, rbx
0x14016f0a7: call 0x14505f610
0x14016f0ac: lea r15, [rbx + 0x40]
0x14016f0b0: lea r12, [rbx + 0x5a8]
0x14016f0b7: mov qword ptr [rbp + 0x150], r15
0x14016f0be: mov qword ptr [rbp + 0x158], r12
0x14016f0c5: mov qword ptr [rbp + 0x138], 0
0x14016f0d0: mov qword ptr [rbp + 0x140], 8
0x14016f0db: mov qword ptr [rbp + 0x148], 0
0x14016f0e6: lea rdx, [rip + 0x60a595b]
0x14016f0ed: lea rcx, [rbp + 0x138]
0x14016f0f4: call 0x14030dee0
0x14016f0f9: nop 
0x14016f0fa: mov r14, rax
0x14016f0fd: mov rdx, qword ptr [rbp + 0x138]
0x14016f104: test rdx, rdx
0x14016f107: je 0x14016f11f
0x14016f109: mov rcx, qword ptr [rbp + 0x140]
0x14016f110: shl rdx, 3
0x14016f114: mov r8d, 8
0x14016f11a: call 0x1400021d0
0x14016f11f: mov qword ptr [rbp + 0x150], r15
0x14016f126: mov qword ptr [rbp + 0x158], r12
0x14016f12d: mov qword ptr [rbp + 0x138], 0
0x14016f138: mov qword ptr [rbp + 0x140], 8
0x14016f143: mov qword ptr [rbp + 0x148], 0
0x14016f14e: lea rdx, [rip + 0x60a5ac3]
0x14016f155: lea rcx, [rbp + 0x138]
0x14016f15c: call 0x140312300
0x14016f161: nop 
0x14016f162: mov r15, rax
0x14016f165: mov rdx, qword ptr [rbp + 0x138]
0x14016f16c: test rdx, rdx
0x14016f16f: je 0x14016f188
0x14016f171: mov rcx, qword ptr [rbp + 0x140]
0x14016f178: shl rdx, 3
0x14016f17c: mov r8d, 8
0x14016f182: call 0x1400021d0
0x14016f187: nop 
0x14016f188: lea rcx, [rbp + 0x138]
0x14016f18f: mov rdx, rbx
0x14016f192: call 0x140444940
0x14016f197: nop 
0x14016f198: mov rax, qword ptr [rbp + 0xf8]
0x14016f19f: mov qword ptr [rbp + 0x130], rax
0x14016f1a6: movups xmm0, xmmword ptr [rbp + 0xc8]
0x14016f1ad: movups xmm1, xmmword ptr [rbp + 0xd8]
0x14016f1b4: movups xmm2, xmmword ptr [rbp + 0xe8]
0x14016f1bb: movaps xmmword ptr [rbp + 0x120], xmm2
0x14016f1c2: movaps xmmword ptr [rbp + 0x110], xmm1
0x14016f1c9: movaps xmmword ptr [rbp + 0x100], xmm0
0x14016f1d0: lea r12, [rbp - 0x50]
0x14016f1d4: lea rdx, [rbp + 0x138]
0x14016f1db: mov r8d, 0x118
0x14016f1e1: mov rcx, r12
0x14016f1e4: call 0x14600504b
0x14016f1e9: mov r13, qword ptr [rbx + 0x5a0]
0x14016f1f0: mov rax, qword ptr [rbp + 0x130]
0x14016f1f7: mov qword ptr [rdi + 0x30], rax
0x14016f1fb: movaps xmm0, xmmword ptr [rbp + 0x100]
0x14016f202: movaps xmm1, xmmword ptr [rbp + 0x110]
0x14016f209: movaps xmm2, xmmword ptr [rbp + 0x120]
0x14016f210: movups xmmword ptr [rdi + 0x20], xmm2
0x14016f214: movups xmmword ptr [rdi + 0x10], xmm1
0x14016f218: movups xmmword ptr [rdi], xmm0
0x14016f21b: mov qword ptr [rdi + 0x38], r14
0x14016f21f: mov qword ptr [rdi + 0x40], r15
0x14016f223: lea rcx, [rdi + 0x48]
0x14016f227: mov r8d, 0x118
0x14016f22d: mov rdx, r12
0x14016f230: call 0x14600504b
0x14016f235: mov qword ptr [rdi + 0x160], r13
0x14016f23c: mov eax, 0x3dcc5000
0x14016f241: add eax, dword ptr [rbx + 0x5b0]
0x14016f247: lea rdx, [rdi + 0x168]
0x14016f24e: mov dword ptr [rdi + 0x168], eax
0x14016f254: mov qword ptr [rbp + 0x150], 0x10
0x14016f25f: xorps xmm0, xmm0
0x14016f262: movups xmmword ptr [rbp + 0x158], xmm0
0x14016f269: mov qword ptr [rbp + 0x168], 0x10
0x14016f274: movups xmmword ptr [rbp + 0x170], xmm0
0x14016f27b: mov qword ptr [rbp + 0x180], 0x10
0x14016f286: movups xmmword ptr [rbp + 0x188], xmm0
0x14016f28d: mov qword ptr [rbp + 0x198], 0x10
0x14016f298: movups xmmword ptr [rbp + 0x1a0], xmm0
0x14016f29f: mov qword ptr [rbp + 0x1b0], 0x10
0x14016f2aa: mov qword ptr [rbp + 0x138], 0
0x14016f2b5: movups xmmword ptr [rbp + 0x1b8], xmm0
0x14016f2bc: mov dword ptr [rbp + 0x1c8], 0
0x14016f2c6: mov qword ptr [rbp + 0x140], 8
0x14016f2d1: mov qword ptr [rbp + 0x148], 0
0x14016f2dc: lea r8, [rbp + 0x138]
0x14016f2e3: mov rcx, rdi
0x14016f2e6: mov r9, rbx
0x14016f2e9: call 0x1402fe0e0
0x14016f2ee: nop 
0x14016f2ef: lea rdx, [rbp + 0x138]
0x14016f2f6: mov r8d, 0x98
0x14016f2fc: mov rcx, rsi
0x14016f2ff: call 0x14600504b
0x14016f304: mov rax, rsi
0x14016f307: add rsp, 0x2d8
0x14016f30e: pop rbx
0x14016f30f: pop rdi
0x14016f310: pop rsi
0x14016f311: pop r12
0x14016f313: pop r13
0x14016f315: pop r14
0x14016f317: pop r15
0x14016f319: pop rbp
0x14016f31a: ret 
