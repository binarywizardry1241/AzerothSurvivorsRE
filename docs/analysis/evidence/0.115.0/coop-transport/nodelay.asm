0x145cbe5a0: push rbp
0x145cbe5a1: push rsi
0x145cbe5a2: sub rsp, 0x38
0x145cbe5a6: lea rbp, [rsp + 0x30]
0x145cbe5ab: mov rcx, qword ptr [rcx]
0x145cbe5ae: movzx eax, dl
0x145cbe5b1: mov dword ptr [rbp + 4], eax
0x145cbe5b4: mov dword ptr [rsp + 0x20], 4
0x145cbe5bc: lea r9, [rbp + 4]
0x145cbe5c0: mov edx, 6
0x145cbe5c5: mov r8d, 1
0x145cbe5cb: call qword ptr [rip + 0x1fa7f7]
0x145cbe5d1: cmp eax, -1
0x145cbe5d4: je 0x145cbe5df
0x145cbe5d6: xor eax, eax
0x145cbe5d8: add rsp, 0x38
0x145cbe5dc: pop rsi
0x145cbe5dd: pop rbp
0x145cbe5de: ret
0x145cbe5df: call qword ptr [rip + 0x1fa81b]
0x145cbe5e5: mov rcx, qword ptr [rip + 0x25564ec]
0x145cbe5ec: mov rcx, qword ptr [rcx]
0x145cbe5ef: lea rdx, [rip + 0x1708b9a]
0x145cbe5f6: cmp rcx, rdx
0x145cbe5f9: jne 0x145cbe60a
0x145cbe5fb: shl rax, 0x20
0x145cbe5ff: or rax, 2
0x145cbe603: add rsp, 0x38
0x145cbe607: pop rsi
0x145cbe608: pop rbp
0x145cbe609: ret
0x145cbe60a: lea rcx, [rip + 0x1708b7f]
0x145cbe611: mov rsi, rax
0x145cbe614: call 0x145eb7780
0x145cbe619: mov rax, rsi
0x145cbe61c: jmp 0x145cbe5fb
