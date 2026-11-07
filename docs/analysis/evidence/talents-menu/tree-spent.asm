145910430: push      r15
145910432: push      r14
145910434: push      r13
145910436: push      r12
145910438: push      rsi
145910439: push      rdi
14591043a: push      rbp
14591043b: push      rbx
14591043c: sub       rsp, 0x38
145910440: dec       dl
145910442: xor       eax, eax
145910444: cmp       dl, 0xa
145910447: ja        0x1459104a7
145910449: movzx     r10d, dl
14591044d: mov       edx, 0x5df
145910452: bt        edx, r10d
145910456: jae       0x1459104a7
145910458: mov       rdx, qword ptr [rcx + 0x10]
14591045c: test      rdx, rdx
14591045f: je        0x1459104a7
145910461: mov       r13, qword ptr [rcx + 8]
145910465: cmp       r8, 3
145910469: jae       0x145910490
14591046b: lea       rcx, [rip + 0x1918f66]
145910472: shl       r8, 6
145910476: add       r8, qword ptr [rcx + r10*8]
14591047a: xor       ebp, ebp
14591047c: xor       eax, eax
14591047e: mov       qword ptr [rsp + 0x30], r8
145910483: mov       byte ptr [rsp + 0x23], r9b
145910488: mov       qword ptr [rsp + 0x28], rdx
14591048d: jmp       0x1459104dc
14591048f: nop
145910490: mov       rcx, qword ptr [r13]
145910494: cmp       byte ptr [rcx + 0x70], r9b
145910498: jb        0x14591055e
14591049e: add       r13, 0x10
1459104a2: dec       rdx
1459104a5: jne       0x145910490
1459104a7: add       rsp, 0x38
1459104ab: pop       rbx
1459104ac: pop       rbp
1459104ad: pop       rdi
1459104ae: pop       rsi
1459104af: pop       r12
1459104b1: pop       r13
1459104b3: pop       r14
1459104b5: pop       r15
1459104b7: ret
1459104b8: nop       dword ptr [rax + rax]
1459104c0: mov       r8, qword ptr [rsp + 0x30]
1459104c5: movzx     r9d, byte ptr [rsp + 0x23]
1459104cb: mov       eax, dword ptr [rsp + 0x24]
1459104cf: mov       rdx, qword ptr [rsp + 0x28]
1459104d4: inc       rbp
1459104d7: cmp       rbp, rdx
1459104da: je        0x1459104a7
1459104dc: mov       rdi, rbp
1459104df: shl       rdi, 4
1459104e3: mov       r10, qword ptr [r13 + rdi]
1459104e8: cmp       byte ptr [r10 + 0x70], r9b
1459104ec: jae       0x1459104d4
1459104ee: mov       rcx, qword ptr [r8 + 0x38]
1459104f2: test      rcx, rcx
1459104f5: je        0x1459104d4
1459104f7: mov       dword ptr [rsp + 0x24], eax
1459104fb: add       rdi, r13
1459104fe: mov       rsi, qword ptr [r8 + 0x30]
145910502: imul      rbx, rcx, 0x78
145910506: mov       r14, qword ptr [r10 + 0x20]
14591050a: mov       r15, qword ptr [r10 + 0x28]
14591050e: xor       r12d, r12d
145910511: jmp       0x145910529
145910513: nop       word ptr cs:[rax + rax]
145910520: add       r12, 0x78
145910524: cmp       rbx, r12
145910527: je        0x1459104c0
145910529: cmp       qword ptr [rsi + r12 + 0x28], r15
14591052e: jne       0x145910520
145910530: mov       rcx, qword ptr [rsi + r12 + 0x20]
145910535: mov       rdx, r14
145910538: mov       r8, r15
14591053b: call      0x145bfa0e1
145910540: test      eax, eax
145910542: jne       0x145910520
145910544: movzx     ecx, byte ptr [rdi + 8]
145910548: mov       eax, dword ptr [rsp + 0x24]
14591054c: add       eax, ecx
14591054e: mov       r8, qword ptr [rsp + 0x30]
145910553: movzx     r9d, byte ptr [rsp + 0x23]
145910559: jmp       0x1459104cf
14591055e: mov       rcx, r8
145910561: lea       r8, [rip + 0x18fb480]
145910568: mov       edx, 3
14591056d: call      0x145d99653
145910572: ud2
