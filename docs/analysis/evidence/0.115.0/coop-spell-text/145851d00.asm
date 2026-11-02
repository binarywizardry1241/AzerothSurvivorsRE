0x145851d00: push r15
0x145851d02: push r14
0x145851d04: push rsi
0x145851d05: push rdi
0x145851d06: push rbx
0x145851d07: sub rsp, 0x20
0x145851d0b: mov eax, dword ptr [r8]
0x145851d0e: lea r9, [rip + 0x17da327]
0x145851d15: movsxd rax, dword ptr [r9 + rax*4]
0x145851d19: add rax, r9
0x145851d1c: jmp rax
0x145851d1e: mov rdi, qword ptr [r8 + 0x10]
0x145851d22: mov rsi, qword ptr [r8 + 0x18]
0x145851d26: movzx edx, byte ptr [r8 + 8]
0x145851d2b: mov rax, qword ptr [rcx]
0x145851d2e: cmp edx, 2
0x145851d31: je 0x145851d58
0x145851d33: cmp edx, 1
0x145851d36: jne 0x145851deb
0x145851d3c: cmp rsi, qword ptr [rax + 8]
0x145851d40: jne 0x145851deb
0x145851d46: mov rdx, qword ptr [rax]
0x145851d49: mov rcx, rdi
0x145851d4c: mov r8, rsi
0x145851d4f: call 0x145d14601
0x145851d54: test eax, eax
0x145851d56: jmp 0x145851dab
0x145851d58: test rsi, rsi
0x145851d5b: je 0x145851deb
0x145851d61: shl rsi, 4
0x145851d65: mov rbx, qword ptr [rax]
0x145851d68: mov r14, qword ptr [rax + 8]
0x145851d6c: xor r15d, r15d
0x145851d6f: jmp 0x145851d89
0x145851d71: nop word ptr cs:[rax + rax]
0x145851d80: add r15, 0x10
0x145851d84: cmp rsi, r15
0x145851d87: je 0x145851deb
0x145851d89: cmp qword ptr [rdi + r15 + 8], r14
0x145851d8e: jne 0x145851d80
0x145851d90: mov rcx, qword ptr [rdi + r15]
0x145851d94: mov rdx, rbx
0x145851d97: mov r8, r14
0x145851d9a: call 0x145d14601
0x145851d9f: test eax, eax
0x145851da1: jne 0x145851d80
0x145851da3: mov al, 1
0x145851da5: jmp 0x145851ded
0x145851da7: cmp dword ptr [rdx + 0x68], 7
0x145851dab: sete al
0x145851dae: jmp 0x145851ded
0x145851db0: movzx edx, byte ptr [r8 + 8]
0x145851db5: mov rdi, qword ptr [r8 + 0x10]
0x145851db9: mov rsi, qword ptr [r8 + 0x18]
0x145851dbd: mov rax, qword ptr [rcx]
0x145851dc0: cmp edx, 2
0x145851dc3: je 0x145851dd6
0x145851dc5: cmp edx, 1
0x145851dc8: jne 0x145851deb
0x145851dca: cmp rsi, qword ptr [rax + 8]
0x145851dce: je 0x145851d46
0x145851dd4: jmp 0x145851deb
0x145851dd6: test rsi, rsi
0x145851dd9: je 0x145851deb
0x145851ddb: shl rsi, 4
0x145851ddf: mov rbx, qword ptr [rax]
0x145851de2: mov r14, qword ptr [rax + 8]
0x145851de6: xor r15d, r15d
0x145851de9: jmp 0x145851e0b
0x145851deb: xor eax, eax
0x145851ded: add rsp, 0x20
0x145851df1: pop rbx
0x145851df2: pop rdi
0x145851df3: pop rsi
0x145851df4: pop r14
0x145851df6: pop r15
0x145851df8: ret
0x145851df9: nop dword ptr [rax]
0x145851e00: add r15, 0x10
0x145851e04: xor eax, eax
0x145851e06: cmp rsi, r15
0x145851e09: je 0x145851ded
0x145851e0b: cmp qword ptr [rdi + r15 + 8], r14
0x145851e10: jne 0x145851e00
0x145851e12: mov rcx, qword ptr [rdi + r15]
0x145851e16: mov rdx, rbx
0x145851e19: mov r8, r14
0x145851e1c: call 0x145d14601
0x145851e21: test eax, eax
0x145851e23: jne 0x145851e00
0x145851e25: jmp 0x145851da3
