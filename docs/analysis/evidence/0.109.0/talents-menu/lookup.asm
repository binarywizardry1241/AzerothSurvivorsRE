145912d90: push      r15
145912d92: push      r14
145912d94: push      r12
145912d96: push      rsi
145912d97: push      rdi
145912d98: push      rbx
145912d99: sub       rsp, 0x28
145912d9d: dec       cl
145912d9f: cmp       cl, 0xa
145912da2: ja        0x145912e9b
145912da8: movzx     eax, cl
145912dab: mov       ecx, 0x5df
145912db0: bt        ecx, eax
145912db3: jae       0x145912e9b
145912db9: mov       rdi, r8
145912dbc: mov       rbx, rdx
145912dbf: lea       rcx, [rip + 0x1916612]
145912dc6: mov       r15, qword ptr [rcx + rax*8]
145912dca: mov       rax, qword ptr [r15 + 0x38]
145912dce: test      rax, rax
145912dd1: je        0x145912e08
145912dd3: mov       rsi, qword ptr [r15 + 0x30]
145912dd7: imul      r12, rax, 0x78
145912ddb: xor       r14d, r14d
145912dde: jmp       0x145912dea
145912de0: add       rsi, 0x78
145912de4: add       r12, -0x78
145912de8: je        0x145912e08
145912dea: cmp       qword ptr [rsi + 0x28], rdi
145912dee: jne       0x145912de0
145912df0: mov       rcx, qword ptr [rsi + 0x20]
145912df4: mov       rdx, rbx
145912df7: mov       r8, rdi
145912dfa: call      0x145bfa0e1
145912dff: test      eax, eax
145912e01: jne       0x145912de0
145912e03: jmp       0x145912e9d
145912e08: mov       rax, qword ptr [r15 + 0x78]
145912e0c: test      rax, rax
145912e0f: je        0x145912e4b
145912e11: mov       rsi, qword ptr [r15 + 0x70]
145912e15: imul      r14, rax, 0x78
145912e19: jmp       0x145912e2a
145912e1b: nop       dword ptr [rax + rax]
145912e20: add       rsi, 0x78
145912e24: add       r14, -0x78
145912e28: je        0x145912e4b
145912e2a: cmp       qword ptr [rsi + 0x28], rdi
145912e2e: jne       0x145912e20
145912e30: mov       rcx, qword ptr [rsi + 0x20]
145912e34: mov       rdx, rbx
145912e37: mov       r8, rdi
145912e3a: call      0x145bfa0e1
145912e3f: test      eax, eax
145912e41: jne       0x145912e20
145912e43: mov       r14d, 1
145912e49: jmp       0x145912e9d
145912e4b: mov       rax, qword ptr [r15 + 0xb8]
145912e52: test      rax, rax
145912e55: je        0x145912e9b
145912e57: mov       rsi, qword ptr [r15 + 0xb0]
145912e5e: imul      r14, rax, 0x78
145912e62: jmp       0x145912e7a
145912e64: nop       word ptr cs:[rax + rax]
145912e70: add       rsi, 0x78
145912e74: add       r14, -0x78
145912e78: je        0x145912eb1
145912e7a: cmp       qword ptr [rsi + 0x28], rdi
145912e7e: jne       0x145912e70
145912e80: mov       rcx, qword ptr [rsi + 0x20]
145912e84: mov       rdx, rbx
145912e87: mov       r8, rdi
145912e8a: call      0x145bfa0e1
145912e8f: test      eax, eax
145912e91: jne       0x145912e70
145912e93: mov       r14d, 2
145912e99: jmp       0x145912e9d
145912e9b: xor       esi, esi
145912e9d: mov       rax, r14
145912ea0: mov       rdx, rsi
145912ea3: add       rsp, 0x28
145912ea7: pop       rbx
145912ea8: pop       rdi
145912ea9: pop       rsi
145912eaa: pop       r12
145912eac: pop       r14
145912eae: pop       r15
145912eb0: ret
145912eb1: mov       r14d, 2
145912eb7: xor       esi, esi
145912eb9: jmp       0x145912e9d
