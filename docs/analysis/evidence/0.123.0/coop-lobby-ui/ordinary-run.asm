0x14016f440: push r15
0x14016f442: push r14
0x14016f444: push r13
0x14016f446: push r12
0x14016f448: push rsi
0x14016f449: push rdi
0x14016f44a: push rbp
0x14016f44b: push rbx
0x14016f44c: sub rsp, 0xd8
0x14016f453: mov ebp, 1
0x14016f458: lock xadd dword ptr [r8 + 0x5b0], ebp
0x14016f461: cmp qword ptr [rdx], -1
0x14016f465: je 0x14016f62b
0x14016f46b: mov rbx, r8
0x14016f46e: mov rsi, rdx
0x14016f471: mov rax, qword ptr [r8 + 0x5a0]
0x14016f478: mov qword ptr [rsp + 0x40], rax
0x14016f47d: cmp qword ptr [rdx + 0x160], rax
0x14016f484: jne 0x14016f645
0x14016f48a: mov rax, qword ptr [rsi + 0x38]
0x14016f48e: mov r9, qword ptr [rbx + 0x218]
0x14016f495: cmp rax, r9
0x14016f498: jae 0x14016f679
0x14016f49e: mov rdx, qword ptr [rbx + 0x210]
0x14016f4a5: mov r8, qword ptr [rdx + rax*8]
0x14016f4a9: test r8, r8
0x14016f4ac: je 0x14016f679
0x14016f4b2: mov rax, qword ptr [rbx + 0x1e0]
0x14016f4b9: not r8
0x14016f4bc: imul r15, r8, 0x38
0x14016f4c0: cmp byte ptr [rax + r15 + 0x30], 0
0x14016f4c6: je 0x14016f679
0x14016f4cc: mov qword ptr [rsp + 0xd0], rcx
0x14016f4d4: mov r8, qword ptr [rsi + 0x40]
0x14016f4d8: cmp r8, r9
0x14016f4db: jae 0x14016f6ba
0x14016f4e1: mov rcx, qword ptr [rdx + r8*8]
0x14016f4e5: test rcx, rcx
0x14016f4e8: je 0x14016f6ba
0x14016f4ee: not rcx
0x14016f4f1: imul r12, rcx, 0x38
0x14016f4f5: cmp byte ptr [rax + r12 + 0x30], 0
0x14016f4fb: je 0x14016f6ba
0x14016f501: add r15, rax
0x14016f504: mov rcx, qword ptr [r15 + 0x10]
0x14016f508: mov qword ptr [rsp + 0xc8], rcx
0x14016f510: mov r13d, dword ptr [rsi + 0x168]
0x14016f517: add r12, rax
0x14016f51a: lea rax, [r15 + 0x2c]
0x14016f51e: mov qword ptr [rsp + 0xc0], rax
0x14016f526: add r15, 0x28
0x14016f52a: lea rcx, [rsi + 0x48]
0x14016f52e: mov rdi, qword ptr [r12 + 0x10]
0x14016f533: lea r14, [r12 + 0x28]
0x14016f538: add r12, 0x2c
0x14016f53c: mov eax, dword ptr [rbx + 0x5b0]
0x14016f542: mov rdx, rbx
0x14016f545: call 0x1404407e0
0x14016f54a: mov qword ptr [rsp + 0x40], rbx
0x14016f54f: lea rax, [rbx + 0x18]
0x14016f553: mov qword ptr [rsp + 0x48], rax
0x14016f558: mov qword ptr [rsp + 0x50], 0
0x14016f561: mov qword ptr [rsp + 0x58], rsi
0x14016f566: lea r8, [rsp + 0x68]
0x14016f56b: mov rax, qword ptr [rsp + 0xc8]
0x14016f573: mov qword ptr [rsp + 0x68], rax
0x14016f578: mov qword ptr [rsp + 0x70], r15
0x14016f57d: mov rax, qword ptr [rsp + 0xc0]
0x14016f585: mov qword ptr [rsp + 0x78], rax
0x14016f58a: mov dword ptr [rsp + 0x80], r13d
0x14016f592: mov dword ptr [rsp + 0x84], ebp
0x14016f599: lea r9, [rsp + 0x88]
0x14016f5a1: mov qword ptr [rsp + 0x88], rdi
0x14016f5a9: mov qword ptr [rsp + 0x90], r14
0x14016f5b1: mov qword ptr [rsp + 0x98], r12
0x14016f5b9: mov dword ptr [rsp + 0xa0], r13d
0x14016f5c1: mov dword ptr [rsp + 0xa4], ebp
0x14016f5c8: lea rax, [rsp + 0xa8]
0x14016f5d0: lea rcx, [rsi + 0x48]
0x14016f5d4: mov qword ptr [rsp + 0xa8], rcx
0x14016f5dc: mov qword ptr [rsp + 0xb0], rbx
0x14016f5e4: mov dword ptr [rsp + 0xb8], r13d
0x14016f5ec: mov dword ptr [rsp + 0xbc], ebp
0x14016f5f3: mov qword ptr [rsp + 0x20], rax
0x14016f5f8: lea rdx, [rsp + 0x40]
0x14016f5fd: call 0x140164ad0
0x14016f602: mov dword ptr [rsi + 0x168], ebp
0x14016f608: mov rax, qword ptr [rsp + 0xd0]
0x14016f610: mov qword ptr [rax], 0xfffffffffffffffd
0x14016f617: add rsp, 0xd8
0x14016f61e: pop rbx
0x14016f61f: pop rbp
0x14016f620: pop rdi
0x14016f621: pop rsi
0x14016f622: pop r12
0x14016f624: pop r13
0x14016f626: pop r14
0x14016f628: pop r15
0x14016f62a: ret 
0x14016f62b: lea rcx, [rip + 0x605779e]
0x14016f632: lea r8, [rip + 0x60577f7]
0x14016f639: mov edx, 0x59
0x14016f63e: call 0x1461ae010
0x14016f643: ud2 
0x14016f645: add rsi, 0x160
0x14016f64c: lea rax, [rip + 0x6057865]
0x14016f653: mov qword ptr [rsp + 0x28], rax
0x14016f658: mov qword ptr [rsp + 0x20], 0xdf
0x14016f661: lea r9, [rip + 0x60577e0]
0x14016f668: lea r8, [rsp + 0x40]
0x14016f66d: xor ecx, ecx
0x14016f66f: mov rdx, rsi
0x14016f672: call 0x1461574ad
0x14016f677: ud2 
0x14016f679: add rsi, 0x16c
0x14016f680: mov qword ptr [rsp + 0x40], rsi
0x14016f685: lea rax, [rip + 0x5069aa4]
0x14016f68c: mov qword ptr [rsp + 0x48], rax
0x14016f691: lea rcx, [rsp + 0x3f]
0x14016f696: mov qword ptr [rsp + 0x50], rcx
0x14016f69b: mov qword ptr [rsp + 0x58], rax
0x14016f6a0: lea rcx, [rip + 0x6057219]
0x14016f6a7: lea r8, [rip + 0x60572b2]
0x14016f6ae: lea rdx, [rsp + 0x40]
0x14016f6b3: call 0x1461ae2d0
0x14016f6b8: ud2 
0x14016f6ba: add rsi, 0x16c
0x14016f6c1: mov qword ptr [rsp + 0x40], rsi
0x14016f6c6: lea rax, [rip + 0x5069a63]
0x14016f6cd: mov qword ptr [rsp + 0x48], rax
0x14016f6d2: lea rcx, [rsp + 0x3f]
0x14016f6d7: mov qword ptr [rsp + 0x50], rcx
0x14016f6dc: mov qword ptr [rsp + 0x58], rax
0x14016f6e1: lea rcx, [rip + 0x60571d8]
0x14016f6e8: lea r8, [rip + 0x6057289]
0x14016f6ef: lea rdx, [rsp + 0x40]
0x14016f6f4: call 0x1461ae2d0
0x14016f6f9: ud2 
