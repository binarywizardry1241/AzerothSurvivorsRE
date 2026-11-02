14590fa20: push      r15
14590fa22: push      r14
14590fa24: push      rsi
14590fa25: push      rdi
14590fa26: push      rbx
14590fa27: sub       rsp, 0x20
14590fa2b: mov       rbx, qword ptr [rcx + 0x10]
14590fa2f: test      rbx, rbx
14590fa32: je        0x14590fa7e
14590fa34: mov       rsi, r8
14590fa37: mov       rdi, rdx
14590fa3a: mov       r14, qword ptr [rcx + 8]
14590fa3e: shl       rbx, 4
14590fa42: xor       r15d, r15d
14590fa45: jmp       0x14590fa59
14590fa47: nop       word ptr [rax + rax]
14590fa50: add       r15, 0x10
14590fa54: cmp       rbx, r15
14590fa57: je        0x14590fa7e
14590fa59: mov       rax, qword ptr [r14 + r15]
14590fa5d: cmp       qword ptr [rax + 0x28], rsi
14590fa61: jne       0x14590fa50
14590fa63: mov       rcx, qword ptr [rax + 0x20]
14590fa67: mov       rdx, rdi
14590fa6a: mov       r8, rsi
14590fa6d: call      0x145bfa0e1
14590fa72: test      eax, eax
14590fa74: jne       0x14590fa50
14590fa76: movzx     eax, byte ptr [r14 + r15 + 8]
14590fa7c: jmp       0x14590fa80
14590fa7e: xor       eax, eax
14590fa80: add       rsp, 0x20
14590fa84: pop       rbx
14590fa85: pop       rdi
14590fa86: pop       rsi
14590fa87: pop       r14
14590fa89: pop       r15
14590fa8b: ret
