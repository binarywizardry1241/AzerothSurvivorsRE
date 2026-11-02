145910250: push      r15
145910252: push      r14
145910254: push      r13
145910256: push      r12
145910258: push      rsi
145910259: push      rdi
14591025a: push      rbp
14591025b: push      rbx
14591025c: sub       rsp, 0x68
145910260: mov       r14, r9
145910263: mov       r15, r8
145910266: mov       ebx, edx
145910268: mov       rsi, rcx
14591026b: mov       ecx, edx
14591026d: mov       rdx, r8
145910270: mov       r8, r9
145910273: call      0x145912d90
145910278: test      rdx, rdx
14591027b: je        0x1459103c4
145910281: mov       r8, rax
145910284: mov       rdi, rdx
145910287: mov       ecx, dword ptr [rsp + 0xd0]
14591028e: mov       r13, qword ptr [rsi + 0x10]
145910292: test      r13, r13
145910295: je        0x1459102b3
145910297: mov       qword ptr [rsp + 0x30], r8
14591029c: mov       rbp, qword ptr [rsi + 8]
1459102a0: mov       eax, r13d
1459102a3: and       eax, 3
1459102a6: cmp       r13, 4
1459102aa: jae       0x1459102cb
1459102ac: xor       r8d, r8d
1459102af: xor       edx, edx
1459102b1: jmp       0x145910311
1459102b3: xor       eax, eax
1459102b5: test      ecx, ecx
1459102b7: je        0x1459103c6
1459102bd: cmp       al, byte ptr [rdi + 0x72]
1459102c0: jae       0x1459103c4
1459102c6: jmp       0x145910395
1459102cb: mov       r9, r13
1459102ce: and       r9, 0xfffffffffffffffc
1459102d2: lea       r10, [rbp + 0x38]
1459102d6: xor       r8d, r8d
1459102d9: xor       edx, edx
1459102db: nop       dword ptr [rax + rax]
1459102e0: movzx     r11d, byte ptr [r10 - 0x30]
1459102e5: add       r11d, edx
1459102e8: movzx     edx, byte ptr [r10 - 0x20]
1459102ed: movzx     r12d, byte ptr [r10 - 0x10]
1459102f2: add       r12d, edx
1459102f5: add       r12d, r11d
1459102f8: movzx     edx, byte ptr [r10]
1459102fc: add       edx, r12d
1459102ff: add       r8, 4
145910303: add       r10, 0x40
145910307: cmp       r9, r8
14591030a: jne       0x1459102e0
14591030c: test      rax, rax
14591030f: je        0x145910341
145910311: shl       r8, 4
145910315: add       r8, rbp
145910318: add       r8, 8
14591031c: shl       eax, 4
14591031f: xor       r9d, r9d
145910322: nop       word ptr cs:[rax + rax]
145910330: movzx     r10d, byte ptr [r8 + r9]
145910335: add       edx, r10d
145910338: add       r9, 0x10
14591033c: cmp       rax, r9
14591033f: jne       0x145910330
145910341: cmp       edx, ecx
145910343: jae       0x1459103c4
145910345: shl       r13, 4
145910349: xor       r12d, r12d
14591034c: jmp       0x145910359
14591034e: nop
145910350: add       r12, 0x10
145910354: cmp       r13, r12
145910357: je        0x145910389
145910359: mov       rax, qword ptr [rbp + r12]
14591035e: cmp       qword ptr [rax + 0x28], r14
145910362: jne       0x145910350
145910364: mov       rcx, qword ptr [rax + 0x20]
145910368: mov       rdx, r15
14591036b: mov       r8, r14
14591036e: call      0x145bfa0e1
145910373: test      eax, eax
145910375: jne       0x145910350
145910377: movzx     eax, byte ptr [rbp + r12 + 8]
14591037d: mov       r8, qword ptr [rsp + 0x30]
145910382: cmp       al, byte ptr [rdi + 0x72]
145910385: jb        0x145910395
145910387: jmp       0x1459103c4
145910389: xor       eax, eax
14591038b: mov       r8, qword ptr [rsp + 0x30]
145910390: cmp       al, byte ptr [rdi + 0x72]
145910393: jae       0x1459103c4
145910395: movzx     r9d, byte ptr [rdi + 0x70]
14591039a: mov       rcx, rsi
14591039d: mov       edx, ebx
14591039f: call      0x145910430
1459103a4: movzx     ecx, byte ptr [rdi + 0x70]
1459103a8: lea       ecx, [rcx + rcx*4]
1459103ab: cmp       eax, ecx
1459103ad: jb        0x1459103c4
1459103af: mov       rcx, rsi
1459103b2: mov       edx, ebx
1459103b4: mov       r8, r15
1459103b7: mov       r9, r14
1459103ba: call      0x14590fb00
1459103bf: test      rax, rax
1459103c2: je        0x1459103d7
1459103c4: xor       eax, eax
1459103c6: add       rsp, 0x68
1459103ca: pop       rbx
1459103cb: pop       rbp
1459103cc: pop       rdi
1459103cd: pop       rsi
1459103ce: pop       r12
1459103d0: pop       r13
1459103d2: pop       r14
1459103d4: pop       r15
1459103d6: ret
1459103d7: mov       byte ptr [rsp + 0x2f], bl
1459103db: mov       rax, qword ptr [rdi]
1459103de: test      rax, rax
1459103e1: je        0x145910420
1459103e3: mov       rcx, qword ptr [rdi + 8]
1459103e7: movups    xmm0, xmmword ptr [rdi + 0x10]
1459103eb: mov       qword ptr [rsp + 0x38], 1
1459103f4: mov       qword ptr [rsp + 0x40], rax
1459103f9: mov       qword ptr [rsp + 0x48], rcx
1459103fe: mov       qword ptr [rsp + 0x50], 1
145910407: movups    xmmword ptr [rsp + 0x58], xmm0
14591040c: lea       rcx, [rsp + 0x38]
145910411: lea       rdx, [rsp + 0x2f]
145910416: mov       r8, rsi
145910419: call      0x1459a00c0
14591041e: jmp       0x1459103c6
145910420: mov       al, 1
145910422: jmp       0x1459103c6
