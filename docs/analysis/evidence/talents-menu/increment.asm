14590f950: push      r15
14590f952: push      r14
14590f954: push      r13
14590f956: push      r12
14590f958: push      rsi
14590f959: push      rdi
14590f95a: push      rbp
14590f95b: push      rbx
14590f95c: sub       rsp, 0x28
14590f960: mov       rdi, r9
14590f963: mov       rbx, r8
14590f966: mov       ebp, edx
14590f968: mov       rsi, rcx
14590f96b: mov       eax, dword ptr [rsp + 0x90]
14590f972: mov       dword ptr [rsp + 0x20], eax
14590f976: call      0x145910250
14590f97b: test      al, al
14590f97d: je        0x14590f9de
14590f97f: mov       ecx, ebp
14590f981: mov       rdx, rbx
14590f984: mov       r8, rdi
14590f987: call      0x145912d90
14590f98c: test      rdx, rdx
14590f98f: je        0x14590f9de
14590f991: mov       r14, rdx
14590f994: mov       r13, qword ptr [rsi + 8]
14590f998: mov       r15, qword ptr [rsi + 0x10]
14590f99c: mov       r12, r15
14590f99f: shl       r12, 4
14590f9a3: test      r15, r15
14590f9a6: je        0x14590f9e2
14590f9a8: xor       ebp, ebp
14590f9aa: jmp       0x14590f9b9
14590f9ac: nop       dword ptr [rax]
14590f9b0: add       rbp, 0x10
14590f9b4: cmp       r12, rbp
14590f9b7: je        0x14590f9e2
14590f9b9: mov       rax, qword ptr [r13 + rbp]
14590f9be: cmp       qword ptr [rax + 0x28], rdi
14590f9c2: jne       0x14590f9b0
14590f9c4: mov       rcx, qword ptr [rax + 0x20]
14590f9c8: mov       rdx, rbx
14590f9cb: mov       r8, rdi
14590f9ce: call      0x145bfa0e1
14590f9d3: test      eax, eax
14590f9d5: jne       0x14590f9b0
14590f9d7: inc       byte ptr [r13 + rbp + 8]
14590f9dc: jmp       0x14590f9f9
14590f9de: xor       eax, eax
14590f9e0: jmp       0x14590f9fb
14590f9e2: cmp       r15, qword ptr [rsi]
14590f9e5: je        0x14590fa0c
14590f9e7: mov       qword ptr [r13 + r12], r14
14590f9ec: mov       byte ptr [r13 + r12 + 8], 1
14590f9f2: inc       r15
14590f9f5: mov       qword ptr [rsi + 0x10], r15
14590f9f9: mov       al, 1
14590f9fb: add       rsp, 0x28
14590f9ff: pop       rbx
14590fa00: pop       rbp
14590fa01: pop       rdi
14590fa02: pop       rsi
14590fa03: pop       r12
14590fa05: pop       r13
14590fa07: pop       r14
14590fa09: pop       r15
14590fa0b: ret
14590fa0c: mov       rcx, rsi
14590fa0f: call      0x145bfaef0
14590fa14: mov       r13, qword ptr [rsi + 8]
14590fa18: jmp       0x14590f9e7
