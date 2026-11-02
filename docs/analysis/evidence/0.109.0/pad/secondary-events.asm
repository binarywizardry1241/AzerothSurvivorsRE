1401c4f02: 66c785d00200000001 mov word ptr [rbp + 0x2d0], 0x100
1401c4f0b: 8bbdec000000 mov edi, dword ptr [rbp + 0xec]
1401c4f11: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
1401c4f18: 4c8bbde0000000 mov r15, qword ptr [rbp + 0xe0]
1401c4f1f: 4531e4 xor r12d, r12d
1401c4f22: eb44 jmp 0x1401c4f68
1401c4f24: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401c4f30: 49ffc4 inc r12
1401c4f33: 498b4628 mov rax, qword ptr [r14 + 0x28]
1401c4f37: 4a8d0c6d00000000 lea rcx, [r13*2]
1401c4f3f: 4c01e9 add rcx, r13
1401c4f42: 488934c8 mov qword ptr [rax + rcx*8], rsi
1401c4f46: 488b9538020000 mov rdx, qword ptr [rbp + 0x238]
1401c4f4d: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
1401c4f52: 66c744c8100100 mov word ptr [rax + rcx*8 + 0x10], 1
1401c4f59: 885cc814 mov byte ptr [rax + rcx*8 + 0x14], bl
1401c4f5d: 49ffc5 inc r13
1401c4f60: 4d896e30 mov qword ptr [r14 + 0x30], r13
1401c4f64: 49ff4640 inc qword ptr [r14 + 0x40]
1401c4f68: 4983fc02 cmp r12, 2
1401c4f6c: 7426 je 0x1401c4f94
1401c4f6e: 420fb69c25d0020000 movzx ebx, byte ptr [rbp + r12 + 0x2d0]
1401c4f77: 41893f mov dword ptr [r15], edi
1401c4f7a: 4d8b6e30 mov r13, qword ptr [r14 + 0x30]
1401c4f7e: 498b7640 mov rsi, qword ptr [r14 + 0x40]
1401c4f82: 4d3b6e20 cmp r13, qword ptr [r14 + 0x20]
1401c4f86: 75a8 jne 0x1401c4f30
1401c4f88: 498d4e20 lea rcx, [r14 + 0x20]
1401c4f8c: e84f5ca305 call 0x145bfabe0
1401c4f91: 90 nop
1401c4f92: eb9c jmp 0x1401c4f30
1401c4f94: 488b8548030000 mov rax, qword ptr [rbp + 0x348]
1401c4f9b: 8b8d60030000 mov ecx, dword ptr [rbp + 0x360]
1401c4fa1: 8908 mov dword ptr [rax], ecx
1401c4fa3: 488b8550030000 mov rax, qword ptr [rbp + 0x350]
1401c4faa: c6404e01 mov byte ptr [rax + 0x4e], 1
