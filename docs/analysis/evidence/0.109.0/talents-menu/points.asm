14589d0d0: mov       rax, qword ptr [rcx + 0x68]
14589d0d4: mov       r8, qword ptr [rcx + 0x70]
14589d0d8: shl       r8, 5
14589d0dc: xor       ecx, ecx
14589d0de: xor       r9d, r9d
14589d0e1: nop       word ptr cs:[rax + rax]
14589d0f0: cmp       r8, r9
14589d0f3: je        0x14589d108
14589d0f5: lea       r10, [r9 + 0x20]
14589d0f9: cmp       byte ptr [rax + r9 + 4], dl
14589d0fe: mov       r9, r10
14589d101: jne       0x14589d0f0
14589d103: mov       ecx, dword ptr [rax + r10 - 0x20]
14589d108: mov       edx, 0x6e
14589d10d: mov       eax, 2
14589d112: nop       word ptr cs:[rax + rax]
14589d120: lea       r8d, [rdx - 0x1e]
14589d124: sub       ecx, r8d
14589d127: jb        0x14589d14a
14589d129: lea       r8d, [rdx - 0xf]
14589d12d: sub       ecx, r8d
14589d130: jb        0x14589d14e
14589d132: sub       ecx, edx
14589d134: jb        0x14589d14d
14589d136: add       edx, 0x2d
14589d139: add       eax, 3
14589d13c: cmp       edx, 0x36b
14589d142: jne       0x14589d120
14589d144: mov       eax, 0x33
14589d149: ret
14589d14a: add       eax, -2
14589d14d: ret
14589d14e: dec       eax
14589d150: ret
14589d151: int3
14589d152: int3
14589d153: int3
14589d154: int3
14589d155: int3
14589d156: int3
14589d157: int3
14589d158: int3
14589d159: int3
14589d15a: int3
14589d15b: int3
14589d15c: int3
14589d15d: int3
14589d15e: int3
14589d15f: int3
14589d160: mov       r8, qword ptr [rcx + 0x40]
14589d164: xor       eax, eax
14589d166: test      r8, r8
14589d169: je        0x14589d1a2
14589d16b: mov       rcx, qword ptr [rcx + 0x38]
14589d16f: cmp       r8, 1
14589d173: je        0x14589d19c
14589d175: xor       eax, eax
14589d177: nop       word ptr [rax + rax]
14589d180: mov       r9, rax
14589d183: mov       r10, r8
14589d186: shr       r10, 1
14589d189: add       rax, r10
14589d18c: cmp       dword ptr [rcx + rax*4], edx
14589d18f: cmova     rax, r9
14589d193: sub       r8, r10
14589d196: cmp       r8, 1
14589d19a: ja        0x14589d180
14589d19c: cmp       dword ptr [rcx + rax*4], edx
14589d19f: sete      al
14589d1a2: ret
14589d1a3: int3
14589d1a4: int3
14589d1a5: int3
14589d1a6: int3
14589d1a7: int3
14589d1a8: int3
14589d1a9: int3
14589d1aa: int3
14589d1ab: int3
14589d1ac: int3
14589d1ad: int3
14589d1ae: int3
14589d1af: int3
14589d1b0: push      rbp
14589d1b1: push      r15
14589d1b3: push      r14
14589d1b5: push      r13
14589d1b7: push      r12
14589d1b9: push      rsi
14589d1ba: push      rdi
14589d1bb: push      rbx
14589d1bc: sub       rsp, 0x58
14589d1c0: lea       rbp, [rsp + 0x50]
14589d1c5: mov       qword ptr [rbp], 0xfffffffffffffffe
14589d1cd: mov       rsi, r8
14589d1d0: mov       r15, rcx
14589d1d3: movzx     eax, r9b
14589d1d7: cmp       al, 4
14589d1d9: mov       r12d, 4
14589d1df: cmovb     r12d, eax
14589d1e3: mov       r8, qword ptr [rcx + 0x98]
14589d1ea: mov       rax, qword ptr [rcx + 0xa0]
14589d1f1: mov       rdi, rax
14589d1f4: test      rax, rax
14589d1f7: mov       r13, rdx
14589d1fa: mov       qword ptr [rbp - 8], r8
14589d1fe: je        0x14589d2cd
14589d204: mov       dword ptr [rbp - 0x10], r12d
14589d208: mov       rbx, rsi
14589d20b: cmp       rax, 1
14589d20f: mov       qword ptr [rbp - 0x28], r15
14589d213: mov       qword ptr [rbp - 0x18], rax
14589d217: jne       0x14589d21e
14589d219: xor       r14d, r14d
14589d21c: jmp       0x14589d282
14589d21e: xor       r14d, r14d
14589d221: mov       rdi, rax
14589d224: nop       word ptr cs:[rax + rax]
14589d230: mov       r15, r14
14589d233: mov       rsi, rdi
14589d236: shr       rsi, 1
14589d239: add       r14, rsi
14589d23c: mov       rax, r14
14589d23f: shl       rax, 5
14589d243: mov       rcx, qword ptr [r8 + rax + 8]
14589d248: mov       rdx, qword ptr [rbp - 8]
14589d24c: mov       r8, qword ptr [rdx + rax + 0x10]
14589d251: mov       r12, r8
14589d254: sub       r12, rbx
14589d257: cmovae    r8, rbx
14589d25b: mov       rdx, r13
14589d25e: call      0x145bfa0e1
14589d263: mov       r8, qword ptr [rbp - 8]
14589d267: mov       rdx, r13
14589d26a: cdqe
14589d26c: test      eax, eax
14589d26e: cmovne    r12, rax
14589d272: test      r12, r12
14589d275: cmovg     r14, r15
14589d279: sub       rdi, rsi
14589d27c: cmp       rdi, 1
14589d280: ja        0x14589d230
14589d282: mov       r15, r14
14589d285: shl       r15, 5
14589d289: mov       rcx, qword ptr [r8 + r15 + 8]
14589d28e: mov       r8, qword ptr [r8 + r15 + 0x10]
14589d293: mov       rdi, r8
14589d296: sub       rdi, rbx
14589d299: cmovae    r8, rbx
14589d29d: call      0x145bfa0e1
14589d2a2: cdqe
14589d2a4: test      eax, eax
14589d2a6: cmovne    rdi, rax
14589d2aa: test      rdi, rdi
14589d2ad: je        0x14589d33c
14589d2b3: mov       rsi, rbx
14589d2b6: shr       rdi, 0x3f
14589d2ba: add       rdi, r14
14589d2bd: mov       r12d, dword ptr [rbp - 0x10]
14589d2c1: mov       r15, qword ptr [rbp - 0x28]
14589d2c5: mov       rax, qword ptr [rbp - 0x18]
14589d2c9: mov       r8, qword ptr [rbp - 8]
14589d2cd: lea       rdx, [r15 + 0x90]
14589d2d4: test      rsi, rsi
14589d2d7: jns       0x14589d2e9
14589d2d9: xor       r15d, r15d
14589d2dc: mov       rcx, r15
14589d2df: mov       rdx, rsi
14589d2e2: call      0x145d992bb
14589d2e7: ud2
14589d2e9: je        0x14589d35d
14589d2eb: mov       qword ptr [rbp - 0x20], rdx
14589d2ef: mov       r14, rax
14589d2f2: mov       rbx, r15
14589d2f5: call      0x140002200
14589d2fa: mov       r15d, 1
14589d300: mov       edx, 1
14589d305: mov       rcx, rsi
14589d308: call      0x1400021c0
14589d30d: test      rax, rax
14589d310: je        0x14589d2dc
14589d312: mov       qword ptr [rbp - 0x10], rax
14589d316: mov       rcx, rax
14589d319: mov       rdx, r13
14589d31c: mov       r8, rsi
14589d31f: call      0x145bfa0e7
14589d324: mov       r15, rbx
14589d327: mov       rax, r14
14589d32a: mov       r8, qword ptr [rbp - 8]
14589d32e: mov       rdx, qword ptr [rbp - 0x20]
14589d332: mov       r14, rax
14589d335: cmp       rax, qword ptr [rdx]
14589d338: je        0x14589d36e
14589d33a: jmp       0x14589d386
14589d33c: mov       rdx, qword ptr [rbp - 0x18]
14589d340: cmp       r14, rdx
14589d343: mov       eax, dword ptr [rbp - 0x10]
14589d346: jae       0x14589d3dc
14589d34c: mov       rcx, qword ptr [rbp - 8]
14589d350: add       rcx, r15
14589d353: cmp       byte ptr [rcx + 0x18], al
14589d356: jae       0x14589d3c9
14589d358: mov       byte ptr [rcx + 0x18], al
14589d35b: jmp       0x14589d3c5
14589d35d: mov       ecx, 1
14589d362: mov       qword ptr [rbp - 0x10], rcx
14589d366: mov       r14, rax
14589d369: cmp       rax, qword ptr [rdx]
14589d36c: jne       0x14589d386
14589d36e: mov       qword ptr [rbp - 8], rsi
14589d372: mov       rcx, rdx
14589d375: call      0x145bfae10
14589d37a: nop
14589d37b: mov       r8, qword ptr [r15 + 0x98]
14589d382: mov       rsi, qword ptr [rbp - 8]
14589d386: mov       rbx, rdi
14589d389: shl       rbx, 5
14589d38d: add       rbx, r8
14589d390: mov       r8, r14
14589d393: sub       r8, rdi
14589d396: jbe       0x14589d3a8
14589d398: lea       rcx, [rbx + 0x20]
14589d39c: shl       r8, 5
14589d3a0: mov       rdx, rbx
14589d3a3: call      0x145bfa0ed
14589d3a8: mov       qword ptr [rbx], rsi
14589d3ab: mov       rax, qword ptr [rbp - 0x10]
14589d3af: mov       qword ptr [rbx + 8], rax
14589d3b3: mov       qword ptr [rbx + 0x10], rsi
14589d3b7: mov       byte ptr [rbx + 0x18], r12b
14589d3bb: inc       r14
14589d3be: mov       qword ptr [r15 + 0xa0], r14
14589d3c5: mov       al, 1
14589d3c7: jmp       0x14589d3cb
14589d3c9: xor       eax, eax
14589d3cb: add       rsp, 0x58
14589d3cf: pop       rbx
14589d3d0: pop       rdi
14589d3d1: pop       rsi
14589d3d2: pop       r12
14589d3d4: pop       r13
14589d3d6: pop       r14
14589d3d8: pop       r15
14589d3da: pop       rbp
14589d3db: ret
14589d3dc: lea       r8, [rip + 0x134e2fd]
14589d3e3: mov       rcx, r14
14589d3e6: call      0x145d99653
14589d3eb: ud2
