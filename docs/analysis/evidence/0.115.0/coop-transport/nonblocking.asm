0x145cbe6f0: push rbp
0x145cbe6f1: push rsi
0x145cbe6f2: sub rsp, 0x28
0x145cbe6f6: lea rbp, [rsp + 0x20]
0x145cbe6fb: mov rcx, qword ptr [rcx]
0x145cbe6fe: movzx eax, dl
0x145cbe701: mov dword ptr [rbp + 4], eax
0x145cbe704: lea r8, [rbp + 4]
0x145cbe708: mov edx, 0x8004667e
0x145cbe70d: call qword ptr [rip + 0x1fa6dd]
0x145cbe713: cmp eax, -1
0x145cbe716: je 0x145cbe721
0x145cbe718: xor eax, eax
0x145cbe71a: add rsp, 0x28
0x145cbe71e: pop rsi
0x145cbe71f: pop rbp
0x145cbe720: ret
0x145cbe721: call qword ptr [rip + 0x1fa6d9]
0x145cbe727: mov rcx, qword ptr [rip + 0x25563aa]
0x145cbe72e: mov rcx, qword ptr [rcx]
0x145cbe731: lea rdx, [rip + 0x1708a58]
0x145cbe738: cmp rcx, rdx
0x145cbe73b: jne 0x145cbe74c
0x145cbe73d: shl rax, 0x20
0x145cbe741: or rax, 2
0x145cbe745: add rsp, 0x28
0x145cbe749: pop rsi
0x145cbe74a: pop rbp
0x145cbe74b: ret
0x145cbe74c: lea rcx, [rip + 0x1708a3d]
0x145cbe753: mov rsi, rax
0x145cbe756: call 0x145eb7780
0x145cbe75b: mov rax, rsi
0x145cbe75e: jmp 0x145cbe73d
