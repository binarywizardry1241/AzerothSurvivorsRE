0x140111e22: 448b85c8000000 mov r8d, dword ptr [rbp + 0xc8]
0x140111e29: 45894500 mov dword ptr [r13], r8d
0x140111e2d: 4d8b4c2408 mov r9, qword ptr [r12 + 8]
0x140111e32: 4d8b442410 mov r8, qword ptr [r12 + 0x10]
0x140111e37: 49c1e007 shl r8, 7
0x140111e3b: 4d01c8 add r8, r9
0x140111e3e: 4989c2 mov r10, rax
0x140111e41: 49bbf8ffffffffffff0f movabs r11, 0xffffffffffffff8
0x140111e4b: 4d21da and r10, r11
0x140111e4e: c1e003 shl eax, 3
0x140111e51: 83e038 and eax, 0x38
0x140111e54: eb0e jmp 0x140111e64
0x140111e56: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x140111e60: 4188737c mov byte ptr [r11 + 0x7c], sil
0x140111e64: 4d39c1 cmp r9, r8
0x140111e67: 0f842a010000 je 0x140111f97
0x140111e6d: 4d89cb mov r11, r9
0x140111e70: 4981c180000000 add r9, 0x80
0x140111e77: 41807b3000 cmp byte ptr [r11 + 0x30], 0
0x140111e7c: 75e6 jne 0x140111e64
0x140111e7e: 498b7b38 mov rdi, qword ptr [r11 + 0x38]
0x140111e82: 31db xor ebx, ebx
