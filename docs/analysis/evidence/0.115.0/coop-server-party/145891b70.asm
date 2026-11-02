145891b70 cmp dword ptr [rcx + 0xc58], 3
145891b77 jne 0x145891bd8
145891b79 mov al, 1
145891b7b cmp rdx, qword ptr [rcx + 0x17c0]
145891b82 je 0x145891bd7
145891b84 cmp rdx, qword ptr [rcx + 0x1700]
145891b8b je 0x145891bd7
145891b8d mov r9, qword ptr [rcx + 0xc98]
145891b94 test r9, r9
145891b97 je 0x145891bd8
145891b99 mov rcx, qword ptr [rcx + 0xc90]
145891ba0 imul r9, r9, 0x478
145891ba7 xor r10d, r10d
145891baa jmp 0x145891bbc
145891bac nop dword ptr [rax]
145891bb0 add r10, 0x478
145891bb7 cmp r9, r10
145891bba je 0x145891bd8
145891bbc sub r8, 1
145891bc0 jb 0x145891bb0
145891bc2 cmp qword ptr [rcx + r10 + 0x278], -1
145891bcb je 0x145891bb0
145891bcd cmp qword ptr [rcx + r10 + 0x3f8], rdx
145891bd5 jne 0x145891bb0
145891bd7 ret
145891bd8 xor eax, eax
145891bda ret
