0x14600ef90: mov rax, qword ptr [rdx]
0x14600ef93: mov r8d, r8d
0x14600ef96: shl r9, 0x20
0x14600ef9a: or r8, r9
0x14600ef9d: xor r9d, r9d
0x14600efa0: mov rdx, rax
0x14600efa3: sub rdx, r8
0x14600efa6: setl r9b
0x14600efaa: sub r8, rax
0x14600efad: cmovl r8, rdx
0x14600efb1: movabs rdx, 0xd6bf94d5e57a42bd
0x14600efbb: mov rax, r8
0x14600efbe: mul rdx
0x14600efc1: shr rdx, 0x17
0x14600efc5: imul eax, edx, 0x989680
0x14600efcb: sub r8d, eax
0x14600efce: imul eax, r8d, 0x64
0x14600efd2: mov qword ptr [rcx + 8], rdx
0x14600efd6: mov dword ptr [rcx + 0x10], eax
0x14600efd9: mov qword ptr [rcx], r9
0x14600efdc: mov rax, rcx
0x14600efdf: ret 
