1401c31ae: 66c785000300000001 mov word ptr [rbp + 0x300], 0x100
1401c31b7: 8bbdec000000 mov edi, dword ptr [rbp + 0xec]
1401c31bd: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
1401c31c4: 4c8bbde0000000 mov r15, qword ptr [rbp + 0xe0]
1401c31cb: 4531e4 xor r12d, r12d
1401c31ce: eb38 jmp 0x1401c3208
1401c31d0: 49ffc4 inc r12
1401c31d3: 498b4628 mov rax, qword ptr [r14 + 0x28]
1401c31d7: 4a8d0c6d00000000 lea rcx, [r13*2]
1401c31df: 4c01e9 add rcx, r13
1401c31e2: 488934c8 mov qword ptr [rax + rcx*8], rsi
1401c31e6: 488b9540020000 mov rdx, qword ptr [rbp + 0x240]
1401c31ed: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
1401c31f2: 66c744c8100100 mov word ptr [rax + rcx*8 + 0x10], 1
1401c31f9: 885cc814 mov byte ptr [rax + rcx*8 + 0x14], bl
1401c31fd: 49ffc5 inc r13
1401c3200: 4d896e30 mov qword ptr [r14 + 0x30], r13
1401c3204: 49ff4640 inc qword ptr [r14 + 0x40]
1401c3208: 4983fc02 cmp r12, 2
1401c320c: 7426 je 0x1401c3234
1401c320e: 420fb69c2500030000 movzx ebx, byte ptr [rbp + r12 + 0x300]
1401c3217: 41893f mov dword ptr [r15], edi
1401c321a: 4d8b6e30 mov r13, qword ptr [r14 + 0x30]
1401c321e: 498b7640 mov rsi, qword ptr [r14 + 0x40]
1401c3222: 4d3b6e20 cmp r13, qword ptr [r14 + 0x20]
1401c3226: 75a8 jne 0x1401c31d0
1401c3228: 498d4e20 lea rcx, [r14 + 0x20]
1401c322c: e86fa7a405 call 0x145c0d9a0
1401c3231: 90 nop
1401c3232: eb9c jmp 0x1401c31d0
1401c3234: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401c323b: 8b8d70030000 mov ecx, dword ptr [rbp + 0x370]
1401c3241: 8908 mov dword ptr [rax], ecx
1401c3243: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
1401c324a: c6404e01 mov byte ptr [rax + 0x4e], 1
