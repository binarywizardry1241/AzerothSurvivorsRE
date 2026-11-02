1459d6f70: push      r15
1459d6f72: push      r14
1459d6f74: push      r13
1459d6f76: push      r12
1459d6f78: push      rsi
1459d6f79: push      rdi
1459d6f7a: push      rbp
1459d6f7b: push      rbx
1459d6f7c: sub       rsp, 0x78
1459d6f80: cmp       byte ptr [rcx + 0x49], 0
1459d6f84: je        0x1459d6f8e
1459d6f86: xor       r15d, r15d
1459d6f89: jmp       0x1459d71b7
1459d6f8e: mov       rsi, rcx
1459d6f91: lea       rdi, [rcx + 0x18]
1459d6f95: lea       rbx, [rsp + 0x48]
1459d6f9a: movabs    rbp, 0x3a0000003a
1459d6fa4: lea       r14, [rsp + 0x30]
1459d6fa9: jmp       0x1459d6fda
1459d6fab: xor       eax, eax
1459d6fad: movzx     ecx, byte ptr [r15 + 0x9a]
1459d6fb5: movzx     edx, al
1459d6fb8: cmp       cl, dl
1459d6fba: cmovb     edx, ecx
1459d6fbd: test      dl, dl
1459d6fbf: jne       0x1459d71b7
1459d6fc5: nop       word ptr cs:[rax + rax]
1459d6fd0: cmp       byte ptr [rsi + 0x49], 1
1459d6fd4: je        0x1459d71b4
1459d6fda: mov       r12, qword ptr [rdi]
1459d6fdd: mov       rcx, rbx
1459d6fe0: mov       rdx, rdi
1459d6fe3: call      0x1459d71d0
1459d6fe8: cmp       dword ptr [rsp + 0x48], 1
1459d6fed: jne       0x1459d7010
1459d6fef: mov       r13, qword ptr [rsp + 0x50]
1459d6ff4: mov       rax, qword ptr [rsp + 0x58]
1459d6ff9: mov       rcx, qword ptr [rsi + 8]
1459d6ffd: sub       r13, rcx
1459d7000: add       r12, rcx
1459d7003: mov       qword ptr [rsi + 8], rax
1459d7007: jmp       0x1459d703a
1459d7009: nop       dword ptr [rax]
1459d7010: cmp       byte ptr [rsi + 0x49], 0
1459d7014: jne       0x1459d6f86
1459d701a: mov       byte ptr [rsi + 0x49], 1
1459d701e: mov       r12, qword ptr [rsi + 8]
1459d7022: mov       r13, qword ptr [rsi + 0x10]
1459d7026: sub       r13, r12
1459d7029: setne     al
1459d702c: or        al, byte ptr [rsi + 0x48]
1459d702f: cmp       al, 1
1459d7031: jne       0x1459d6f86
1459d7037: add       r12, qword ptr [rdi]
1459d703a: mov       r15, qword ptr [rsi]
1459d703d: mov       qword ptr [rsp + 0x48], r12
1459d7042: mov       qword ptr [rsp + 0x50], r13
1459d7047: mov       qword ptr [rsp + 0x58], 0
1459d7050: mov       qword ptr [rsp + 0x60], r13
1459d7055: mov       byte ptr [rsp + 0x70], 1
1459d705a: mov       qword ptr [rsp + 0x68], rbp
1459d705f: mov       rcx, r14
1459d7062: mov       rdx, rbx
1459d7065: call      0x1459d71d0
1459d706a: cmp       dword ptr [rsp + 0x30], 1
1459d706f: jne       0x1459d6fd0
1459d7075: mov       rdx, qword ptr [rsp + 0x38]
1459d707a: mov       rax, qword ptr [rsp + 0x40]
1459d707f: mov       qword ptr [rsp + 0x28], rax
1459d7084: mov       r14, rsi
1459d7087: mov       rsi, rdi
1459d708a: mov       rdi, rbx
1459d708d: mov       rbx, rbp
1459d7090: movzx     ebp, byte ptr [r15]
1459d7094: mov       rcx, r12
1459d7097: call      0x1400695f0
1459d709c: mov       r8, rdx
1459d709f: mov       ecx, ebp
1459d70a1: mov       rbp, rbx
1459d70a4: mov       rbx, rdi
1459d70a7: mov       rdi, rsi
1459d70aa: mov       rsi, r14
1459d70ad: lea       r14, [rsp + 0x30]
1459d70b2: mov       rdx, rax
1459d70b5: call      0x1459a2ab0
1459d70ba: test      rdx, rdx
1459d70bd: je        0x1459d6fd0
1459d70c3: mov       r15, rdx
1459d70c6: mov       rax, qword ptr [rsp + 0x28]
1459d70cb: add       r12, rax
1459d70ce: sub       r13, rax
1459d70d1: mov       rcx, r12
1459d70d4: mov       rdx, r13
1459d70d7: call      0x1400695f0
1459d70dc: test      rdx, rdx
1459d70df: je        0x1459d6fd0
1459d70e5: mov       rcx, rax
1459d70e8: cmp       rdx, 1
1459d70ec: jne       0x1459d7108
1459d70ee: movzx     r8d, byte ptr [rcx]
1459d70f2: cmp       r8d, 0x2b
1459d70f6: je        0x1459d6fd0
1459d70fc: cmp       r8d, 0x2d
1459d7100: je        0x1459d6fd0
1459d7106: jmp       0x1459d710c
1459d7108: movzx     r8d, byte ptr [rcx]
1459d710c: xor       eax, eax
1459d710e: cmp       r8b, 0x2b
1459d7112: sete      al
1459d7115: mov       r8, rdx
1459d7118: sub       r8, rax
1459d711b: add       rcx, rax
1459d711e: cmp       r8, 3
1459d7122: jae       0x1459d7167
1459d7124: test      r8, r8
1459d7127: je        0x1459d6fab
1459d712d: movzx     eax, byte ptr [rcx]
1459d7130: add       eax, -0x30
1459d7133: cmp       eax, 9
1459d7136: ja        0x1459d6fd0
1459d713c: cmp       r8, 1
1459d7140: je        0x1459d6fad
1459d7146: movzx     ecx, byte ptr [rcx + 1]
1459d714a: add       ecx, -0x30
1459d714d: cmp       ecx, 9
1459d7150: ja        0x1459d6fd0
1459d7156: movzx     eax, al
1459d7159: add       eax, eax
1459d715b: lea       eax, [rax + rax*4]
1459d715e: add       cl, al
1459d7160: mov       eax, ecx
1459d7162: jmp       0x1459d6fad
1459d7167: neg       rax
1459d716a: add       rdx, rax
1459d716d: neg       rdx
1459d7170: xor       r8d, r8d
1459d7173: xor       eax, eax
1459d7175: mov       r9, rdx
1459d7178: add       r9, r8
1459d717b: je        0x1459d6fad
1459d7181: mov       r9b, 0xa
1459d7184: mul       r9b
1459d7187: jo        0x1459d6fd0
1459d718d: movzx     r10d, byte ptr [rcx + r8]
1459d7192: add       r10d, -0x30
1459d7196: add       al, r10b
1459d7199: setb      r9b
1459d719d: cmp       r10d, 9
1459d71a1: ja        0x1459d6fd0
1459d71a7: inc       r8
1459d71aa: test      r9b, r9b
1459d71ad: je        0x1459d7175
1459d71af: jmp       0x1459d6fd0
1459d71b4: xor       r15d, r15d
1459d71b7: mov       rax, r15
1459d71ba: add       rsp, 0x78
1459d71be: pop       rbx
1459d71bf: pop       rbp
1459d71c0: pop       rdi
1459d71c1: pop       rsi
1459d71c2: pop       r12
1459d71c4: pop       r13
1459d71c6: pop       r14
1459d71c8: pop       r15
1459d71ca: ret
