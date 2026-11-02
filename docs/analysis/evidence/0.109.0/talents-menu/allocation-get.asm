14589e020: push      r15
14589e022: push      r14
14589e024: push      r12
14589e026: push      rsi
14589e027: push      rdi
14589e028: push      rbx
14589e029: sub       rsp, 0x28
14589e02d: mov       rax, qword ptr [rdx + 0x68]
14589e031: mov       r9, qword ptr [rdx + 0x70]
14589e035: shl       r9, 5
14589e039: xor       r14d, r14d
14589e03c: xor       edx, edx
14589e03e: mov       r10, rax
14589e041: nop       word ptr cs:[rax + rax]
14589e050: cmp       r9, rdx
14589e053: je        0x14589e0a0
14589e055: add       rdx, 0x20
14589e059: cmp       byte ptr [r10 + 4], r8b
14589e05d: lea       r10, [r10 + 0x20]
14589e061: jne       0x14589e050
14589e063: mov       r15, qword ptr [rax + rdx - 8]
14589e068: mov       rsi, r15
14589e06b: shl       rsi, 4
14589e06f: mov       r8, r15
14589e072: shr       r8, 0x3c
14589e076: setne     r8b
14589e07a: movabs    r9, 0x7ffffffffffffff8
14589e084: cmp       rsi, r9
14589e087: seta      r9b
14589e08b: or        r9b, r8b
14589e08e: je        0x14589e0aa
14589e090: xor       r14d, r14d
14589e093: mov       rcx, r14
14589e096: mov       rdx, rsi
14589e099: call      0x145d992bb
14589e09e: ud2
14589e0a0: mov       edi, 8
14589e0a5: xor       r15d, r15d
14589e0a8: jmp       0x14589e0f6
14589e0aa: mov       rbx, qword ptr [rax + rdx - 0x10]
14589e0af: test      rsi, rsi
14589e0b2: je        0x14589e112
14589e0b4: mov       r12, rcx
14589e0b7: call      0x140002200
14589e0bc: mov       r14d, 8
14589e0c2: mov       edx, 8
14589e0c7: mov       rcx, rsi
14589e0ca: call      0x1400021c0
14589e0cf: test      rax, rax
14589e0d2: je        0x14589e093
14589e0d4: mov       rdi, rax
14589e0d7: mov       r14, r15
14589e0da: mov       rcx, r12
14589e0dd: test      r15, r15
14589e0e0: je        0x14589e0f6
14589e0e2: mov       r12, rcx
14589e0e5: mov       rcx, rdi
14589e0e8: mov       rdx, rbx
14589e0eb: mov       r8, rsi
14589e0ee: call      0x145bfa0e7
14589e0f3: mov       rcx, r12
14589e0f6: mov       qword ptr [rcx], r14
14589e0f9: mov       qword ptr [rcx + 8], rdi
14589e0fd: mov       qword ptr [rcx + 0x10], r15
14589e101: mov       rax, rcx
14589e104: add       rsp, 0x28
14589e108: pop       rbx
14589e109: pop       rdi
14589e10a: pop       rsi
14589e10b: pop       r12
14589e10d: pop       r14
14589e10f: pop       r15
14589e111: ret
14589e112: mov       edi, 8
14589e117: xor       r14d, r14d
14589e11a: test      r15, r15
14589e11d: jne       0x14589e0e2
14589e11f: jmp       0x14589e0f6
