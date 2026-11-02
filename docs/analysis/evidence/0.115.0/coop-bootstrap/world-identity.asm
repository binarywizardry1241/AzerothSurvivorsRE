145876f7d mov r14, qword ptr [rbp + 0x860]
145876f84 mov rax, r14
145876f87 shr rax, 0x2e
145876f8b mov rcx, r14
145876f8e shr rcx, 0x17
145876f92 movabs rdx, 0x1e3779b97f4a7c15
145876f9c imul rdx, r14
145876fa0 shr rdx, 0x28
145876fa4 xor eax, ecx
145876fa6 mov r15d, r14d
145876fa9 xor r15d, eax
145876fac xor r15d, edx
145876faf and r15d, 0x7fffff
145876fb6 lea rax, [r15 + 0x800000]
145876fbd add r15, 0x7fff00
145876fc4 cmp rax, 0xffff00
145876fca cmovb r15, rax
