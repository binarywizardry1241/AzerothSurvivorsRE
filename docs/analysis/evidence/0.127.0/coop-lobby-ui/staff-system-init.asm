0x1402ebf90: push rbp
0x1402ebf91: push r14
0x1402ebf93: push rsi
0x1402ebf94: push rdi
0x1402ebf95: push rbx
0x1402ebf96: sub rsp, 0x160
0x1402ebf9d: lea rbp, [rsp + 0x80]
0x1402ebfa5: mov qword ptr [rbp + 0xd8], 0xfffffffffffffffe
0x1402ebfb0: mov rbx, r8
0x1402ebfb3: mov rdi, rdx
0x1402ebfb6: mov rsi, rcx
0x1402ebfb9: cmp qword ptr [rdx + 0x108], -1
0x1402ebfc1: je 0x1402ec004
0x1402ebfc3: mov rax, qword ptr [rbx + 0x5a0]
0x1402ebfca: mov qword ptr [rbp - 0x50], rax
0x1402ebfce: cmp qword ptr [rdi + 8], rax
0x1402ebfd2: je 0x1402ec03d
0x1402ebfd4: add rdi, 8
0x1402ebfd8: lea rax, [rip + 0x5f8e3c9]
0x1402ebfdf: mov qword ptr [rsp + 0x28], rax
0x1402ebfe4: mov qword ptr [rsp + 0x20], 0x83
0x1402ebfed: lea r9, [rip + 0x5f8e36c]
0x1402ebff4: lea r8, [rbp - 0x50]
0x1402ebff8: xor ecx, ecx
0x1402ebffa: mov rdx, rdi
0x1402ebffd: call 0x1461b2ddd
0x1402ec002: ud2 
0x1402ec004: mov rcx, rbx
0x1402ec007: call 0x14022c680
0x1402ec00c: mov r14, rax
0x1402ec00f: lea rcx, [rbp - 0x48]
0x1402ec013: mov rdx, rbx
0x1402ec016: call 0x14048dbb0
0x1402ec01b: mov qword ptr [rbp - 0x50], r14
0x1402ec01f: mov rax, qword ptr [rbx + 0x5a0]
0x1402ec026: mov qword ptr [rdi + 8], rax
0x1402ec02a: lea rcx, [rdi + 0x10]
0x1402ec02e: lea rdx, [rbp - 0x50]
0x1402ec032: mov r8d, 0x128
0x1402ec038: call 0x14606171b
0x1402ec03d: mov eax, 0x3dcc5000
0x1402ec042: add eax, dword ptr [rbx + 0x5b0]
0x1402ec048: mov dword ptr [rdi], eax
0x1402ec04a: mov qword ptr [rbp - 0x38], 0x10
0x1402ec052: xorps xmm0, xmm0
0x1402ec055: movups xmmword ptr [rbp - 0x30], xmm0
0x1402ec059: mov qword ptr [rbp - 0x20], 0x10
0x1402ec061: movups xmmword ptr [rbp - 0x18], xmm0
0x1402ec065: mov qword ptr [rbp - 8], 0x10
0x1402ec06d: movups xmmword ptr [rbp], xmm0
0x1402ec071: mov qword ptr [rbp + 0x10], 0x10
0x1402ec079: movups xmmword ptr [rbp + 0x18], xmm0
0x1402ec07d: mov qword ptr [rbp + 0x28], 0x10
0x1402ec085: mov qword ptr [rbp - 0x50], 0
0x1402ec08d: movups xmmword ptr [rbp + 0x30], xmm0
0x1402ec091: mov dword ptr [rbp + 0x40], 0
0x1402ec098: mov qword ptr [rbp - 0x48], 8
0x1402ec0a0: mov qword ptr [rbp - 0x40], 0
0x1402ec0a8: lea rcx, [rdi + 0x10]
0x1402ec0ac: lea r8, [rbp - 0x50]
0x1402ec0b0: mov rdx, rdi
0x1402ec0b3: mov r9, rbx
0x1402ec0b6: call 0x14021d180
0x1402ec0bb: nop 
0x1402ec0bc: lea rdx, [rbp - 0x50]
0x1402ec0c0: mov r8d, 0x98
0x1402ec0c6: mov rcx, rsi
0x1402ec0c9: call 0x14606171b
0x1402ec0ce: mov rax, rsi
0x1402ec0d1: add rsp, 0x160
0x1402ec0d8: pop rbx
0x1402ec0d9: pop rdi
0x1402ec0da: pop rsi
0x1402ec0db: pop r14
0x1402ec0dd: pop rbp
0x1402ec0de: ret 
