0x1459c4ae0: push rbp
0x1459c4ae1: push r15
0x1459c4ae3: push r14
0x1459c4ae5: push r13
0x1459c4ae7: push r12
0x1459c4ae9: push rsi
0x1459c4aea: push rdi
0x1459c4aeb: push rbx
0x1459c4aec: sub rsp, 0x628
0x1459c4af3: lea rbp, [rsp + 0x80]
0x1459c4afb: mov qword ptr [rbp + 0x5a0], 0xfffffffffffffffe
0x1459c4b06: mov qword ptr [rbp + 0x568], rcx
0x1459c4b0d: mov r12, qword ptr [rdx + 8]
0x1459c4b11: mov r15, qword ptr [rdx + 0x10]
0x1459c4b15: cmp r12, r15
0x1459c4b18: jae 0x1459c4bbd
0x1459c4b1e: mov rdi, qword ptr [rdx]
0x1459c4b21: inc r12
0x1459c4b24: mov r13, r15
0x1459c4b27: neg r13
0x1459c4b2a: lea rbx, [rbp + 0x188]
0x1459c4b31: lea r14, [rbp + 0x368]
0x1459c4b38: jmp 0x1459c4b50
0x1459c4b3a: nop word ptr [rax + rax]
0x1459c4b40: lea rax, [r12 + r13]
0x1459c4b44: inc rax
0x1459c4b47: inc r12
0x1459c4b4a: cmp rax, 1
0x1459c4b4e: je 0x1459c4bbd
0x1459c4b50: mov rcx, rbx
0x1459c4b53: mov rdx, rdi
0x1459c4b56: call 0x145b7c940
0x1459c4b5b: mov rdx, qword ptr [rbp + 0x190]
0x1459c4b62: mov r8, qword ptr [rbp + 0x198]
0x1459c4b69: mov rcx, r14
0x1459c4b6c: mov qword ptr [rbp + 0x598], rdx
0x1459c4b73: call 0x145819960
0x1459c4b78: nop
0x1459c4b79: mov rdx, qword ptr [rbp + 0x188]
0x1459c4b80: test rdx, rdx
0x1459c4b83: je 0x1459c4b97
0x1459c4b85: mov r8d, 1
0x1459c4b8b: mov rcx, qword ptr [rbp + 0x598]
0x1459c4b92: call 0x1400021d0
0x1459c4b97: mov rsi, qword ptr [rbp + 0x368]
0x1459c4b9e: cmp rsi, -1
0x1459c4ba2: je 0x1459c4b40
0x1459c4ba4: movabs rax, 0x8000000000000012
0x1459c4bae: cmp rsi, rax
0x1459c4bb1: jne 0x1459c4bef
0x1459c4bb3: mov rcx, r14
0x1459c4bb6: call 0x1459be140
0x1459c4bbb: jmp 0x1459c4b40
0x1459c4bbd: mov rax, qword ptr [rbp + 0x568]
0x1459c4bc4: mov qword ptr [rax], 0
0x1459c4bcb: mov qword ptr [rax + 8], 8
0x1459c4bd3: mov qword ptr [rax + 0x10], 0
0x1459c4bdb: add rsp, 0x628
0x1459c4be2: pop rbx
0x1459c4be3: pop rdi
0x1459c4be4: pop rsi
0x1459c4be5: pop r12
0x1459c4be7: pop r13
0x1459c4be9: pop r14
0x1459c4beb: pop r15
0x1459c4bed: pop rbp
0x1459c4bee: ret
0x1459c4bef: lea rdx, [rbp + 0x370]
0x1459c4bf6: lea rbx, [rbp - 0x58]
0x1459c4bfa: mov r8d, 0x1e0
0x1459c4c00: mov rcx, rbx
0x1459c4c03: call 0x145d145fb
0x1459c4c08: mov qword ptr [rbp + 0x368], rsi
0x1459c4c0f: lea rcx, [rbp + 0x370]
0x1459c4c16: mov r8d, 0x1e0
0x1459c4c1c: mov rdx, rbx
0x1459c4c1f: call 0x145d145fb
0x1459c4c24: call 0x140002200
0x1459c4c29: mov ecx, 0x7a0
0x1459c4c2e: mov edx, 8
0x1459c4c33: call 0x1400021c0
0x1459c4c38: test rax, rax
0x1459c4c3b: je 0x1459c4ca1
0x1459c4c3d: mov rbx, rax
0x1459c4c40: mov qword ptr [rax], rsi
0x1459c4c43: mov rcx, rax
0x1459c4c46: add rcx, 8
0x1459c4c4a: lea rdx, [rbp - 0x58]
0x1459c4c4e: mov r8d, 0x1e0
0x1459c4c54: call 0x145d145fb
0x1459c4c59: mov qword ptr [rbp + 0x578], 4
0x1459c4c64: mov qword ptr [rbp + 0x580], rbx
0x1459c4c6b: mov qword ptr [rbp + 0x588], 1
0x1459c4c76: mov eax, 1
0x1459c4c7b: mov qword ptr [rbp + 0x590], rax
0x1459c4c82: lea r13, [rbp + 0x550]
0x1459c4c89: lea r14, [rbp + 0x368]
0x1459c4c90: mov qword ptr [rbp + 0x570], rbx
0x1459c4c97: cmp r12, r15
0x1459c4c9a: jb 0x1459c4cc9
0x1459c4c9c: jmp 0x1459c4e01
0x1459c4ca1: mov ecx, 8
0x1459c4ca6: mov edx, 0x7a0
0x1459c4cab: call 0x145eb6fcb
0x1459c4cb0: nop
0x1459c4cb1: ud2
0x1459c4cb3: nop word ptr cs:[rax + rax]
0x1459c4cc0: cmp r12, r15
0x1459c4cc3: je 0x1459c4e01
0x1459c4cc9: mov rcx, r13
0x1459c4ccc: mov rdx, rdi
0x1459c4ccf: call 0x145b7c940
0x1459c4cd4: nop
0x1459c4cd5: mov rdx, qword ptr [rbp + 0x558]
0x1459c4cdc: mov r8, qword ptr [rbp + 0x560]
0x1459c4ce3: mov rcx, r14
0x1459c4ce6: mov qword ptr [rbp + 0x598], rdx
0x1459c4ced: call 0x145819960
0x1459c4cf2: nop
0x1459c4cf3: mov rdx, qword ptr [rbp + 0x550]
0x1459c4cfa: test rdx, rdx
0x1459c4cfd: je 0x1459c4d11
0x1459c4cff: mov r8d, 1
0x1459c4d05: mov rcx, qword ptr [rbp + 0x598]
0x1459c4d0c: call 0x1400021d0
0x1459c4d11: inc r12
0x1459c4d14: mov rbx, qword ptr [rbp + 0x368]
0x1459c4d1b: cmp rbx, -1
0x1459c4d1f: je 0x1459c4cc0
0x1459c4d21: movabs rax, 0x8000000000000012
0x1459c4d2b: cmp rbx, rax
0x1459c4d2e: jne 0x1459c4d3a
0x1459c4d30: mov rcx, r14
0x1459c4d33: call 0x1459be140
0x1459c4d38: jmp 0x1459c4cc0
0x1459c4d3a: mov r8d, 0x1e0
0x1459c4d40: lea rsi, [rbp + 0x188]
0x1459c4d47: mov rcx, rsi
0x1459c4d4a: lea rdx, [rbp + 0x370]
0x1459c4d51: call 0x145d145fb
0x1459c4d56: mov qword ptr [rbp + 0x368], rbx
0x1459c4d5d: mov r8d, 0x1e0
0x1459c4d63: lea rcx, [rbp + 0x370]
0x1459c4d6a: mov rdx, rsi
0x1459c4d6d: call 0x145d145fb
0x1459c4d72: mov rsi, qword ptr [rbp + 0x590]
0x1459c4d79: cmp rsi, qword ptr [rbp + 0x578]
0x1459c4d80: jne 0x1459c4dbc
0x1459c4d82: mov qword ptr [rsp + 0x20], 0x1e8
0x1459c4d8b: mov r8d, 1
0x1459c4d91: mov r9d, 8
0x1459c4d97: lea rcx, [rbp + 0x578]
0x1459c4d9e: mov rdx, rsi
0x1459c4da1: call 0x145d14a10
0x1459c4da6: nop
0x1459c4da7: mov rax, qword ptr [rbp + 0x580]
0x1459c4dae: mov qword ptr [rbp + 0x570], rax
0x1459c4db5: mov rsi, qword ptr [rbp + 0x590]
0x1459c4dbc: imul rax, rsi, 0x1e8
0x1459c4dc3: mov rcx, qword ptr [rbp + 0x570]
0x1459c4dca: mov qword ptr [rcx + rax], rbx
0x1459c4dce: add rcx, rax
0x1459c4dd1: add rcx, 8
0x1459c4dd5: mov r8d, 0x1e0
0x1459c4ddb: lea rdx, [rbp + 0x188]
0x1459c4de2: call 0x145d145fb
0x1459c4de7: inc rsi
0x1459c4dea: mov qword ptr [rbp + 0x590], rsi
0x1459c4df1: mov qword ptr [rbp + 0x588], rsi
0x1459c4df8: cmp r12, r15
0x1459c4dfb: jb 0x1459c4cc9
0x1459c4e01: mov rax, qword ptr [rbp + 0x588]
0x1459c4e08: mov rcx, qword ptr [rbp + 0x568]
0x1459c4e0f: mov qword ptr [rcx + 0x10], rax
0x1459c4e13: mov rax, rcx
0x1459c4e16: movups xmm0, xmmword ptr [rbp + 0x578]
0x1459c4e1d: movups xmmword ptr [rcx], xmm0
0x1459c4e20: jmp 0x1459c4bdb
