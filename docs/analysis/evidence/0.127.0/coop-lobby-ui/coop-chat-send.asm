0x1402b9760: push rbp
0x1402b9761: push rsi
0x1402b9762: push rdi
0x1402b9763: sub rsp, 0x130
0x1402b976a: lea rbp, [rsp + 0x80]
0x1402b9772: mov qword ptr [rbp + 0xa8], 0xfffffffffffffffe
0x1402b977d: mov rsi, rdx
0x1402b9780: mov rax, qword ptr [rcx + 0x160]
0x1402b9787: mov qword ptr [rbp + 0x98], rax
0x1402b978e: mov rax, qword ptr [rcx + 0x168]
0x1402b9795: mov rdi, qword ptr [rcx + 0x170]
0x1402b979c: mov qword ptr [rcx + 0x160], 0
0x1402b97a7: mov qword ptr [rcx + 0x168], 1
0x1402b97b2: mov qword ptr [rcx + 0x170], 0
0x1402b97bd: mov byte ptr [rbp + 0xa7], 0
0x1402b97c4: mov qword ptr [rbp + 0x90], rax
0x1402b97cb: mov rcx, rax
0x1402b97ce: mov rdx, rdi
0x1402b97d1: call 0x140207170
0x1402b97d6: nop 
0x1402b97d7: test rdx, rdx
0x1402b97da: je 0x1402b981c
0x1402b97dc: mov rax, qword ptr [rbp + 0x98]
0x1402b97e3: mov qword ptr [rbp - 0x50], rax
0x1402b97e7: mov rax, qword ptr [rbp + 0x90]
0x1402b97ee: mov qword ptr [rbp - 0x48], rax
0x1402b97f2: mov qword ptr [rbp - 0x40], rdi
0x1402b97f6: mov dword ptr [rbp - 0x58], 0x1b
0x1402b97fd: mov byte ptr [rbp + 0xa7], 1
0x1402b9804: lea rdx, [rbp - 0x58]
0x1402b9808: mov rcx, rsi
0x1402b980b: call 0x140246550
0x1402b9810: nop 
0x1402b9811: add rsp, 0x130
0x1402b9818: pop rdi
0x1402b9819: pop rsi
0x1402b981a: pop rbp
0x1402b981b: ret 
0x1402b981c: mov rdx, qword ptr [rbp + 0x98]
0x1402b9823: test rdx, rdx
0x1402b9826: je 0x1402b9811
0x1402b9828: mov r8d, 1
0x1402b982e: mov rcx, qword ptr [rbp + 0x90]
0x1402b9835: add rsp, 0x130
0x1402b983c: pop rdi
0x1402b983d: pop rsi
0x1402b983e: pop rbp
0x1402b983f: jmp 0x1400021d0
