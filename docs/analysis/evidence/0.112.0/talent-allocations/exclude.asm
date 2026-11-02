14599f210: push      r15
14599f212: push      r14
14599f214: push      r13
14599f216: push      r12
14599f218: push      rsi
14599f219: push      rdi
14599f21a: push      rbp
14599f21b: push      rbx
14599f21c: sub       rsp, 0x38
14599f220: mov       rsi, r9
14599f223: mov       r14, r8
14599f226: mov       ebp, edx
14599f228: mov       rbx, rcx
14599f22b: mov       ecx, edx
14599f22d: mov       rdx, r8
14599f230: mov       r8, r9
14599f233: call      0x1459a2ab0
14599f238: test      rdx, rdx
14599f23b: je        0x14599f2bb
14599f23d: movzx     edi, byte ptr [rdx + 0x98]
14599f244: cmp       dil, 6
14599f248: je        0x14599f253
14599f24a: cmp       byte ptr [rdx + 0x9b], 1
14599f251: jne       0x14599f2bb
14599f253: dec       bpl
14599f256: cmp       bpl, 0xa
14599f25a: ja        0x14599f2bb
14599f25c: movzx     ecx, bpl
14599f260: mov       edx, 0x5df
14599f265: bt        edx, ecx
14599f268: jae       0x14599f2bb
14599f26a: lea       rdx, [rip + 0x189fee7]
14599f271: mov       rcx, qword ptr [rdx + rcx*8]
14599f275: shl       rax, 6
14599f279: mov       rdx, qword ptr [rcx + rax + 0x38]
14599f27e: test      rdx, rdx
14599f281: je        0x14599f2bb
14599f283: mov       r12, qword ptr [rbx + 0x10]
14599f287: test      r12, r12
14599f28a: je        0x14599f2bb
14599f28c: mov       qword ptr [rsp + 0x28], r14
14599f291: mov       r13, qword ptr [rcx + rax + 0x30]
14599f296: lea       rax, [rdx + rdx*4]
14599f29a: shl       rax, 5
14599f29e: add       rax, r13
14599f2a1: mov       qword ptr [rsp + 0x30], rax
14599f2a6: mov       rbp, qword ptr [rbx + 8]
14599f2aa: shl       r12, 4
14599f2ae: cmp       dil, 6
14599f2b2: jne       0x14599f2f3
14599f2b4: xor       ebx, ebx
14599f2b6: jmp       0x14599f372
14599f2bb: xor       ebx, ebx
14599f2bd: mov       rax, rbx
14599f2c0: add       rsp, 0x38
14599f2c4: pop       rbx
14599f2c5: pop       rbp
14599f2c6: pop       rdi
14599f2c7: pop       rsi
14599f2c8: pop       r12
14599f2ca: pop       r13
14599f2cc: pop       r14
14599f2ce: pop       r15
14599f2d0: ret
14599f2d1: nop       word ptr cs:[rax + rax]
14599f2e0: add       r13, 0xa0
14599f2e7: cmp       r13, qword ptr [rsp + 0x30]
14599f2ec: mov       ebx, 0
14599f2f1: je        0x14599f2bd
14599f2f3: cmp       byte ptr [r13 + 0x98], dil
14599f2fa: jne       0x14599f2e0
14599f2fc: mov       r14, qword ptr [r13 + 0x38]
14599f300: cmp       r14, rsi
14599f303: jne       0x14599f31a
14599f305: mov       rcx, qword ptr [r13 + 0x30]
14599f309: mov       rdx, qword ptr [rsp + 0x28]
14599f30e: mov       r8, rsi
14599f311: call      0x145c0a3e7
14599f316: test      eax, eax
14599f318: je        0x14599f2e0
14599f31a: cmp       byte ptr [r13 + 0x9b], 1
14599f322: jne       0x14599f2e0
14599f324: mov       r15, qword ptr [r13 + 0x30]
14599f328: xor       ebx, ebx
14599f32a: jmp       0x14599f339
14599f32c: nop       dword ptr [rax]
14599f330: add       rbx, 0x10
14599f334: cmp       r12, rbx
14599f337: je        0x14599f2e0
14599f339: mov       rax, qword ptr [rbp + rbx]
14599f33e: cmp       qword ptr [rax + 0x38], r14
14599f342: jne       0x14599f330
14599f344: mov       rcx, qword ptr [rax + 0x30]
14599f348: mov       rdx, r15
14599f34b: mov       r8, r14
14599f34e: call      0x145c0a3e7
14599f353: test      eax, eax
14599f355: jne       0x14599f330
14599f357: cmp       byte ptr [rbp + rbx + 8], 0
14599f35c: je        0x14599f2e0
14599f35e: jmp       0x14599f3de
14599f360: add       r13, 0xa0
14599f367: cmp       r13, qword ptr [rsp + 0x30]
14599f36c: je        0x14599f2bd
14599f372: cmp       byte ptr [r13 + 0x98], 6
14599f37a: jne       0x14599f360
14599f37c: mov       r14, qword ptr [r13 + 0x30]
14599f380: mov       r15, qword ptr [r13 + 0x38]
14599f384: cmp       r15, rsi
14599f387: jne       0x14599f39d
14599f389: mov       rcx, r14
14599f38c: mov       rdx, qword ptr [rsp + 0x28]
14599f391: mov       r8, rsi
14599f394: call      0x145c0a3e7
14599f399: test      eax, eax
14599f39b: je        0x14599f360
14599f39d: xor       edi, edi
14599f39f: jmp       0x14599f3b9
14599f3a1: nop       word ptr cs:[rax + rax]
14599f3b0: add       rdi, 0x10
14599f3b4: cmp       r12, rdi
14599f3b7: je        0x14599f360
14599f3b9: mov       rax, qword ptr [rbp + rdi]
14599f3be: cmp       qword ptr [rax + 0x38], r15
14599f3c2: jne       0x14599f3b0
14599f3c4: mov       rcx, qword ptr [rax + 0x30]
14599f3c8: mov       rdx, r14
14599f3cb: mov       r8, r15
14599f3ce: call      0x145c0a3e7
14599f3d3: test      eax, eax
14599f3d5: jne       0x14599f3b0
14599f3d7: cmp       byte ptr [rbp + rdi + 8], 0
14599f3dc: je        0x14599f360
14599f3de: mov       rbx, r13
14599f3e1: jmp       0x14599f2bd
