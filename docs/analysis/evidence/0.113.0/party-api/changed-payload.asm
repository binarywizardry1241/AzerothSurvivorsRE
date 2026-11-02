14585e2c6: cmp       r12, 0x1340
14585e2cd: je        0x14585e43e
14585e2d3: mov       rax, qword ptr [rbp + 0xfa8]
14585e2da: add       rax, r12
14585e2dd: add       rax, 0x18
14585e2e1: mov       qword ptr [rbp + 0x800], rax
14585e2e8: cmp       rbx, 0x12
14585e2ec: je        0x14585e448
14585e2f2: lea       rdx, [rbx + 1]
14585e2f6: mov       qword ptr [rbp + 0x810], rdx
14585e2fd: lea       rax, [rbx + rbx*4]
14585e301: lea       rcx, [rbp + 0x820]
14585e308: mov       r8, qword ptr [rcx + rax*8 + 0x10]
14585e30d: cmp       r8, -1
14585e311: je        0x14585e43b
14585e317: mov       qword ptr [rbp + 0xfa0], r8
14585e31e: mov       qword ptr [rbp + 0xf98], rdx
14585e325: lea       r13, [r12 + 0x18]
14585e32a: lea       rax, [rcx + rax*8]
14585e32e: mov       r14, qword ptr [rax]
14585e331: mov       r15, qword ptr [rax + 8]
14585e335: mov       rdi, qword ptr [rax + 0x18]
14585e339: mov       rbx, qword ptr [rax + 0x20]
14585e33d: mov       rsi, qword ptr [rbp + 0xfa8]
14585e344: cmp       rbx, qword ptr [rsi + r12 + 0x10]
14585e349: jne       0x14585e363
14585e34b: mov       rdx, qword ptr [rsi + r12 + 8]
14585e350: mov       rcx, rdi
14585e353: mov       r8, rbx
14585e356: call      0x145cf8697
14585e35b: test      eax, eax
14585e35d: je        0x14585e405
14585e363: mov       rdx, qword ptr [rsi + 0x478]
14585e36a: mov       qword ptr [rsp + 0x28], rbx
14585e36f: mov       qword ptr [rbp + 0xf78], rdi
14585e376: mov       qword ptr [rsp + 0x20], rdi
14585e37b: lea       rcx, [rbp + 0xc40]
14585e382: mov       r8, r14
14585e385: mov       r9, r15
14585e388: call      0x145977930
