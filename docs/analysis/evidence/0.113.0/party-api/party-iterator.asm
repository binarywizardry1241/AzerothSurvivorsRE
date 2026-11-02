14599d7f0: push      rbp
14599d7f1: push      r15
14599d7f3: push      r14
14599d7f5: push      rsi
14599d7f6: push      rdi
14599d7f7: push      rbx
14599d7f8: sub       rsp, 0x58
14599d7fc: lea       rbp, [rsp + 0x50]
14599d801: mov       qword ptr [rbp], 0xfffffffffffffffe
14599d809: mov       r14, qword ptr [rdx + 8]
14599d80d: sub       r14, qword ptr [rdx]
14599d810: movabs    rax, 0x2aaaaaaaaaaaaaa8
14599d81a: cmp       r14, rax
14599d81d: jbe       0x14599d82e
14599d81f: xor       ebx, ebx
14599d821: mov       rcx, rbx
14599d824: mov       rdx, rdi
14599d827: call      0x145e99f5b
14599d82c: ud2
14599d82e: mov       rsi, rcx
14599d831: lea       rdi, [r14 + r14*2]
14599d835: test      rdi, rdi
14599d838: je        0x14599d862
14599d83a: mov       r15, rdx
14599d83d: call      0x140002200
14599d842: mov       ebx, 8
14599d847: mov       edx, 8
14599d84c: mov       rcx, rdi
14599d84f: call      0x1400021c0
14599d854: test      rax, rax
14599d857: je        0x14599d821
14599d859: shr       r14, 3
14599d85d: mov       rdx, r15
14599d860: jmp       0x14599d86a
14599d862: mov       eax, 8
14599d867: xor       r14d, r14d
14599d86a: mov       qword ptr [rbp - 0x18], r14
14599d86e: mov       qword ptr [rbp - 0x10], rax
14599d872: lea       rcx, [rbp - 8]
14599d876: mov       qword ptr [rbp - 8], 0
14599d87e: mov       qword ptr [rbp - 0x20], rax
14599d882: mov       qword ptr [rbp - 0x30], rcx
14599d886: mov       qword ptr [rbp - 0x28], 0
14599d88e: lea       rax, [rbp - 0x30]
14599d892: mov       rcx, rdx
14599d895: mov       rdx, rax
14599d898: call      0x1459af260
14599d89d: nop
14599d89e: mov       rax, qword ptr [rbp - 8]
14599d8a2: mov       qword ptr [rsi + 0x10], rax
14599d8a6: movups    xmm0, xmmword ptr [rbp - 0x18]
14599d8aa: movups    xmmword ptr [rsi], xmm0
14599d8ad: mov       rax, rsi
14599d8b0: add       rsp, 0x58
14599d8b4: pop       rbx
14599d8b5: pop       rdi
14599d8b6: pop       rsi
14599d8b7: pop       r14
14599d8b9: pop       r15
14599d8bb: pop       rbp
14599d8bc: ret
