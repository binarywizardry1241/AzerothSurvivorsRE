0x145923166: cmp byte ptr [rdi + 0xc41], 0
0x14592316d: je 0x1459231df
0x14592316f: mov rdx, qword ptr [rcx]
0x145923172: mov rax, qword ptr [rdi + 0x578]
0x145923179: imul r8, qword ptr [rdi + 0x580], 0x1e0
0x145923184: xor r9d, r9d
0x145923187: mov r10, rax
0x14592318a: nop word ptr [rax + rax]
0x145923190: cmp r8, r9
0x145923193: je 0x1459231d0
0x145923195: add r9, 0x1e0
0x14592319c: cmp qword ptr [r10 + 0xf0], rdx
0x1459231a3: lea r10, [r10 + 0x1e0]
0x1459231aa: jne 0x145923190
0x1459231ac: mov rax, qword ptr [rax + r9 - 0xe8]
0x1459231b4: cmp rax, qword ptr [rdi + 0xb40]
0x1459231bb: je 0x1459231df
0x1459231bd: jmp 0x145923afb
0x1459231c2: nop word ptr cs:[rax + rax]
0x1459231d0: xor eax, eax
0x1459231d2: cmp rax, qword ptr [rdi + 0xb40]
0x1459231d9: jne 0x145923afb
