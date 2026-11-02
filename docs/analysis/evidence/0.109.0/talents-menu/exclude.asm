14590fb00: push      r15
14590fb02: push      r14
14590fb04: push      r13
14590fb06: push      r12
14590fb08: push      rsi
14590fb09: push      rdi
14590fb0a: push      rbp
14590fb0b: push      rbx
14590fb0c: sub       rsp, 0x38
14590fb10: mov       rsi, r9
14590fb13: mov       r14, r8
14590fb16: mov       ebp, edx
14590fb18: mov       rbx, rcx
14590fb1b: mov       ecx, edx
14590fb1d: mov       rdx, r8
14590fb20: mov       r8, r9
14590fb23: call      0x145912d90
14590fb28: test      rdx, rdx
14590fb2b: je        0x14590fba1
14590fb2d: movzx     edi, byte ptr [rdx + 0x70]
14590fb31: cmp       dil, 6
14590fb35: je        0x14590fb3d
14590fb37: cmp       byte ptr [rdx + 0x73], 1
14590fb3b: jne       0x14590fba1
14590fb3d: dec       bpl
14590fb40: cmp       bpl, 0xa
14590fb44: ja        0x14590fba1
14590fb46: movzx     ecx, bpl
14590fb4a: mov       edx, 0x5df
14590fb4f: bt        edx, ecx
14590fb52: jae       0x14590fba1
14590fb54: lea       rdx, [rip + 0x191987d]
14590fb5b: mov       rcx, qword ptr [rdx + rcx*8]
14590fb5f: shl       rax, 6
14590fb63: mov       rdx, qword ptr [rcx + rax + 0x38]
14590fb68: test      rdx, rdx
14590fb6b: je        0x14590fba1
14590fb6d: mov       r12, qword ptr [rbx + 0x10]
14590fb71: test      r12, r12
14590fb74: je        0x14590fba1
14590fb76: mov       qword ptr [rsp + 0x28], r14
14590fb7b: mov       r13, qword ptr [rcx + rax + 0x30]
14590fb80: imul      rax, rdx, 0x78
14590fb84: add       rax, r13
14590fb87: mov       qword ptr [rsp + 0x30], rax
14590fb8c: mov       rbp, qword ptr [rbx + 8]
14590fb90: shl       r12, 4
14590fb94: cmp       dil, 6
14590fb98: jne       0x14590fbd0
14590fb9a: xor       ebx, ebx
14590fb9c: jmp       0x14590fc4f
14590fba1: xor       ebx, ebx
14590fba3: mov       rax, rbx
14590fba6: add       rsp, 0x38
14590fbaa: pop       rbx
14590fbab: pop       rbp
14590fbac: pop       rdi
14590fbad: pop       rsi
14590fbae: pop       r12
14590fbb0: pop       r13
14590fbb2: pop       r14
14590fbb4: pop       r15
14590fbb6: ret
14590fbb7: nop       word ptr [rax + rax]
14590fbc0: add       r13, 0x78
14590fbc4: cmp       r13, qword ptr [rsp + 0x30]
14590fbc9: mov       ebx, 0
14590fbce: je        0x14590fba3
14590fbd0: cmp       byte ptr [r13 + 0x70], dil
14590fbd4: jne       0x14590fbc0
14590fbd6: mov       r14, qword ptr [r13 + 0x28]
14590fbda: cmp       r14, rsi
14590fbdd: jne       0x14590fbf4
14590fbdf: mov       rcx, qword ptr [r13 + 0x20]
14590fbe3: mov       rdx, qword ptr [rsp + 0x28]
14590fbe8: mov       r8, rsi
14590fbeb: call      0x145bfa0e1
14590fbf0: test      eax, eax
14590fbf2: je        0x14590fbc0
14590fbf4: cmp       byte ptr [r13 + 0x73], 1
14590fbf9: jne       0x14590fbc0
14590fbfb: mov       r15, qword ptr [r13 + 0x20]
14590fbff: xor       ebx, ebx
14590fc01: jmp       0x14590fc19
14590fc03: nop       word ptr cs:[rax + rax]
14590fc10: add       rbx, 0x10
14590fc14: cmp       r12, rbx
14590fc17: je        0x14590fbc0
14590fc19: mov       rax, qword ptr [rbp + rbx]
14590fc1e: cmp       qword ptr [rax + 0x28], r14
14590fc22: jne       0x14590fc10
14590fc24: mov       rcx, qword ptr [rax + 0x20]
14590fc28: mov       rdx, r15
14590fc2b: mov       r8, r14
14590fc2e: call      0x145bfa0e1
14590fc33: test      eax, eax
14590fc35: jne       0x14590fc10
14590fc37: cmp       byte ptr [rbp + rbx + 8], 0
14590fc3c: je        0x14590fbc0
14590fc3e: jmp       0x14590fcae
14590fc40: add       r13, 0x78
14590fc44: cmp       r13, qword ptr [rsp + 0x30]
14590fc49: je        0x14590fba3
14590fc4f: cmp       byte ptr [r13 + 0x70], 6
14590fc54: jne       0x14590fc40
14590fc56: mov       r14, qword ptr [r13 + 0x20]
14590fc5a: mov       r15, qword ptr [r13 + 0x28]
14590fc5e: cmp       r15, rsi
14590fc61: jne       0x14590fc77
14590fc63: mov       rcx, r14
14590fc66: mov       rdx, qword ptr [rsp + 0x28]
14590fc6b: mov       r8, rsi
14590fc6e: call      0x145bfa0e1
14590fc73: test      eax, eax
14590fc75: je        0x14590fc40
14590fc77: xor       edi, edi
14590fc79: jmp       0x14590fc89
14590fc7b: nop       dword ptr [rax + rax]
14590fc80: add       rdi, 0x10
14590fc84: cmp       r12, rdi
14590fc87: je        0x14590fc40
14590fc89: mov       rax, qword ptr [rbp + rdi]
14590fc8e: cmp       qword ptr [rax + 0x28], r15
14590fc92: jne       0x14590fc80
14590fc94: mov       rcx, qword ptr [rax + 0x20]
14590fc98: mov       rdx, r14
14590fc9b: mov       r8, r15
14590fc9e: call      0x145bfa0e1
14590fca3: test      eax, eax
14590fca5: jne       0x14590fc80
14590fca7: cmp       byte ptr [rbp + rdi + 8], 0
14590fcac: je        0x14590fc40
14590fcae: mov       rbx, r13
14590fcb1: jmp       0x14590fba3
