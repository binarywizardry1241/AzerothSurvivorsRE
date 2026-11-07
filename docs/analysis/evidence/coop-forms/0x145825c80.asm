0x145825c80: push rbp
0x145825c81: push rsi
0x145825c82: push rdi
0x145825c83: push rbx
0x145825c84: sub rsp, 0x38
0x145825c88: lea rbp, [rsp + 0x30]
0x145825c8d: mov qword ptr [rbp], 0xfffffffffffffffe
0x145825c95: mov rsi, rcx
0x145825c98: mov rbx, qword ptr [rdx]
0x145825c9b: mov cl, 1
0x145825c9d: xor eax, eax
0x145825c9f: lock cmpxchg byte ptr [rbx + 0x10], cl
0x145825ca4: jne 0x145825d5f
0x145825caa: mov rdi, qword ptr [rip + 0x29eed87]
0x145825cb1: mov rax, qword ptr [rdi]
0x145825cb4: shl rax, 1
0x145825cb7: test rax, rax
0x145825cba: jne 0x145825d6d
0x145825cc0: mov dword ptr [rbp - 4], 0
0x145825cc7: movzx eax, byte ptr [rbx + 0x11]
0x145825ccb: lea rcx, [rbx + 0x18]
0x145825ccf: mov qword ptr [rbp - 0x10], rbx
0x145825cd3: call 0x145816db0
0x145825cd8: nop
0x145825cd9: mov rbx, qword ptr [rbp - 0x10]
0x145825cdd: mov rax, qword ptr [rbx + 0x70]
0x145825ce1: test rax, rax
0x145825ce4: je 0x145825d32
0x145825ce6: mov rcx, qword ptr [rbx + 0x68]
0x145825cea: lea rdx, [rcx + 1]
0x145825cee: mov r8, qword ptr [rbx + 0x58]
0x145825cf2: mov r9, qword ptr [rbx + 0x60]
0x145825cf6: xor r10d, r10d
0x145825cf9: cmp rdx, r8
0x145825cfc: cmovae r10, r8
0x145825d00: neg r10
0x145825d03: lea rdx, [rcx + r10]
0x145825d07: inc rdx
0x145825d0a: mov qword ptr [rbx + 0x68], rdx
0x145825d0e: dec rax
0x145825d11: mov qword ptr [rbx + 0x70], rax
0x145825d15: lea rax, [rcx + rcx*2]
0x145825d19: movups xmm0, xmmword ptr [r9 + rax*8]
0x145825d1e: movups xmmword ptr [rsi], xmm0
0x145825d21: mov rax, qword ptr [r9 + rax*8 + 0x10]
0x145825d26: mov qword ptr [rsi + 0x10], rax
0x145825d2a: cmp byte ptr [rbp - 4], 0
0x145825d2e: je 0x145825d3f
0x145825d30: jmp 0x145825d4a
0x145825d32: mov qword ptr [rsi], 0xffffffffffffffff
0x145825d39: cmp byte ptr [rbp - 4], 0
0x145825d3d: jne 0x145825d4a
0x145825d3f: mov rax, qword ptr [rdi]
0x145825d42: shl rax, 1
0x145825d45: test rax, rax
0x145825d48: jne 0x145825d8a
0x145825d4a: xor eax, eax
0x145825d4c: xchg byte ptr [rbx + 0x10], al
0x145825d4f: cmp al, 2
0x145825d51: je 0x145825d7c
0x145825d53: mov rax, rsi
0x145825d56: add rsp, 0x38
0x145825d5a: pop rbx
0x145825d5b: pop rdi
0x145825d5c: pop rsi
0x145825d5d: pop rbp
0x145825d5e: ret
0x145825d5f: lea rcx, [rbx + 0x10]
0x145825d63: call 0x145eb5670
0x145825d68: jmp 0x145825caa
0x145825d6d: call 0x145eb6400
0x145825d72: xor al, 1
0x145825d74: mov dword ptr [rbp - 4], eax
0x145825d77: jmp 0x145825cc7
0x145825d7c: add rbx, 0x10
0x145825d80: mov rcx, rbx
0x145825d83: call 0x145eb5730
0x145825d88: jmp 0x145825d53
0x145825d8a: call 0x145eb6400
0x145825d8f: test al, al
0x145825d91: jne 0x145825d4a
0x145825d93: mov byte ptr [rbx + 0x11], 1
0x145825d97: jmp 0x145825d4a
