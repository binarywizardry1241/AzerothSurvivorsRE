0x14587d637: movapd xmm0, xmm6
0x14587d63b: mov rax, qword ptr [rbp + 0xe00]
0x14587d642: subsd xmm0, qword ptr [rax + 0xcd0]
0x14587d64a: ucomisd xmm0, qword ptr [rip + 0x17aef86]
0x14587d652: jb 0x14587d6d9
0x14587d658: mov rax, qword ptr [rbp + 0xe00]
0x14587d65f: movsd qword ptr [rax + 0xcd0], xmm6
0x14587d667: mov rax, qword ptr [rax + 0xc98]
0x14587d66e: test rax, rax
0x14587d671: je 0x14587d6d9
0x14587d673: mov rcx, qword ptr [rbp + 0xe00]
0x14587d67a: mov rsi, qword ptr [rcx + 0xc90]
0x14587d681: imul rdi, rax, 0x478
0x14587d688: add rsi, 0x260
0x14587d68f: nop
0x14587d690: mov rcx, qword ptr [rsi + 0x200]
0x14587d697: mov rdx, qword ptr [rsi + 0x208]
0x14587d69e: mov r8, rsi
0x14587d6a1: call 0x145824200
0x14587d6a6: add rsi, 0x478
0x14587d6ad: add rdi, -0x478
0x14587d6b4: jne 0x14587d690
0x14587d6b6: jmp 0x14587d6d9
0x14587d6b8: mov rax, qword ptr [rbp + 0xe00]
0x14587d6bf: mov rcx, qword ptr [rax + 0xf10]
0x14587d6c6: mov rdx, qword ptr [rax + 0xf18]
0x14587d6cd: lea r8, [rax + 0xc80]
0x14587d6d4: call 0x145824200
