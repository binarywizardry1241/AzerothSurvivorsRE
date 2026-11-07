14026dd60: push      rbp
14026dd61: push      r15
14026dd63: push      r14
14026dd65: push      r13
14026dd67: push      r12
14026dd69: push      rsi
14026dd6a: push      rdi
14026dd6b: push      rbx
14026dd6c: sub       rsp, 0xa8
14026dd73: lea       rbp, [rsp + 0x80]
14026dd7b: mov       qword ptr [rbp + 0x20], 0xfffffffffffffffe
14026dd83: mov       r13, rdx
14026dd86: mov       rbx, rcx
14026dd89: mov       rax, qword ptr [rcx]
14026dd8c: mov       rcx, qword ptr [rcx + 0x28]
14026dd90: mov       qword ptr [rbp - 0x50], rax
14026dd94: movups    xmm0, xmmword ptr [rbx + 8]
14026dd98: movups    xmmword ptr [rbp - 0x48], xmm0
14026dd9c: movups    xmm0, xmmword ptr [rbx + 0x18]
14026dda0: movups    xmmword ptr [rbp - 0x38], xmm0
14026dda4: mov       qword ptr [rbp - 0x28], rcx
14026dda8: mov       r14, qword ptr [rdx]
14026ddab: lea       rcx, [rip + 0x5b8209d]
14026ddb2: mov       edx, 5
14026ddb7: call      0x1458ec450
14026ddbc: mov       qword ptr [rbp + 0x18], rax
14026ddc0: mov       r12, rdx
14026ddc3: mov       r15, qword ptr [r13 + 8]
14026ddc7: mov       rax, qword ptr [r13 + 0x10]
14026ddcb: movzx     esi, byte ptr [rax]
14026ddce: mov       rdi, qword ptr [r13 + 0x18]
14026ddd2: mov       r8, qword ptr [rdi + 0x20]
14026ddd6: mov       r9, qword ptr [rdi + 0x28]
14026ddda: mov       rax, qword ptr [r13 + 0x20]
14026ddde: mov       eax, dword ptr [rax]
14026dde0: mov       dword ptr [rsp + 0x20], eax
14026dde4: mov       rcx, r15
14026dde7: mov       edx, esi
14026dde9: call      0x145910250
14026ddee: movups    xmm0, xmmword ptr [rdi + 0x20]
14026ddf2: movups    xmmword ptr [rbp - 0x18], xmm0
14026ddf6: mov       qword ptr [rbp - 0x20], 0
14026ddfe: lea       rcx, [rbp - 0x20]
14026de02: mov       qword ptr [rsp + 0x28], rcx
14026de07: mov       byte ptr [rsp + 0x20], al
14026de0b: lea       rcx, [rbp - 0x50]
14026de0f: mov       qword ptr [rbp - 8], r14
14026de13: mov       rdx, r14
14026de16: mov       r8, qword ptr [rbp + 0x18]
14026de1a: mov       r9, r12
14026de1d: call      0x14010ae50
14026de22: mov       r13, qword ptr [r15 + 0x10]
14026de26: mov       r14, r13
14026de29: shl       r14, 4
14026de2d: mov       rax, r13
14026de30: shr       rax, 0x3c
14026de34: setne     al
14026de37: movabs    rcx, 0x7ffffffffffffff8
14026de41: cmp       r14, rcx
14026de44: seta      cl
14026de47: or        cl, al
14026de49: je        0x14026de5b
14026de4b: xor       r12d, r12d
14026de4e: mov       rcx, r12
14026de51: mov       rdx, r14
14026de54: call      0x145d992bb
14026de59: ud2
14026de5b: mov       qword ptr [rbp + 0x18], rbx
14026de5f: mov       rbx, qword ptr [rbp - 8]
14026de63: mov       r15, qword ptr [r15 + 8]
14026de67: test      r14, r14
14026de6a: je        0x14026de8e
14026de6c: call      0x140002200
14026de71: mov       r12d, 8
14026de77: mov       edx, 8
14026de7c: mov       rcx, r14
14026de7f: call      0x1400021c0
14026de84: test      rax, rax
14026de87: je        0x14026de4e
14026de89: mov       rcx, r13
14026de8c: jmp       0x14026de95
14026de8e: mov       eax, 8
14026de93: xor       ecx, ecx
14026de95: mov       qword ptr [rbp], rcx
14026de99: mov       qword ptr [rbp + 8], rax
14026de9d: mov       qword ptr [rbp + 0x10], 0
14026dea5: test      r13, r13
14026dea8: lea       r12, [rbp - 0x20]
14026deac: je        0x14026dec0
14026deae: mov       rcx, rax
14026deb1: mov       rdx, r15
14026deb4: mov       r8, r14
14026deb7: call      0x145bfa0e7
14026debc: mov       qword ptr [rbp + 0x10], r13
14026dec0: lea       rcx, [rip + 0x5b81f8d]
14026dec7: mov       edx, 7
14026decc: call      0x1458ec450
14026ded1: nop
14026ded2: mov       r14, rax
14026ded5: mov       r15, rdx
14026ded8: mov       r8, qword ptr [rdi + 0x20]
14026dedc: mov       r9, qword ptr [rdi + 0x28]
14026dee0: mov       rcx, rbp
14026dee3: mov       edx, esi
14026dee5: call      0x14590fdd0
14026deea: nop
14026deeb: movups    xmm0, xmmword ptr [rdi + 0x20]
14026deef: movups    xmmword ptr [rbp - 0x18], xmm0
14026def3: mov       qword ptr [rbp - 0x20], 1
14026defb: mov       qword ptr [rsp + 0x28], r12
14026df00: mov       byte ptr [rsp + 0x20], al
14026df04: lea       rcx, [rbp - 0x50]
14026df08: mov       rdx, rbx
14026df0b: mov       r8, r14
14026df0e: mov       r9, r15
14026df11: call      0x14010ae50
14026df16: nop
14026df17: mov       rdx, qword ptr [rbp]
14026df1b: test      rdx, rdx
14026df1e: mov       rsi, qword ptr [rbp + 0x18]
14026df22: je        0x14026df37
14026df24: mov       rcx, qword ptr [rbp + 8]
14026df28: shl       rdx, 4
14026df2c: mov       r8d, 8
14026df32: call      0x1400021d0
14026df37: mov       rax, rsi
14026df3a: add       rsp, 0xa8
14026df41: pop       rbx
14026df42: pop       rdi
14026df43: pop       rsi
14026df44: pop       r12
14026df46: pop       r13
14026df48: pop       r14
14026df4a: pop       r15
14026df4c: pop       rbp
14026df4d: ret
