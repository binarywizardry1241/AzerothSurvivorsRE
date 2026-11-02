1402d9f23 4c89c1 mov rcx, r8
1402d9f26 490fafce imul rcx, r14
1402d9f2a 4a034c2f10 add rcx, qword ptr [rdi + r13 + 0x10]
1402d9f2f e8b9019205 call 0x145bfa0ed
1402d9f34 4a8b442f20 mov rax, qword ptr [rdi + r13 + 0x20]
1402d9f39 8b4d68 mov ecx, dword ptr [rbp + 0x68]
1402d9f3c 42890cb0 mov dword ptr [rax + r14*4], ecx
1402d9f40 4a8b442f28 mov rax, qword ptr [rdi + r13 + 0x28]
1402d9f45 8b4d68 mov ecx, dword ptr [rbp + 0x68]
1402d9f48 42890cb0 mov dword ptr [rax + r14*4], ecx
1402d9f4c 488b5548 mov rdx, qword ptr [rbp + 0x48]
1402d9f50 488d8294010000 lea rax, [rdx + 0x194]
1402d9f57 488945c0 mov qword ptr [rbp - 0x40], rax
1402d9f5b 488b4508 mov rax, qword ptr [rbp + 8]
1402d9f5f 488b4008 mov rax, qword ptr [rax + 8]
1402d9f63 498b7c2418 mov rdi, qword ptr [r12 + 0x18]
1402d9f68 498b4c2438 mov rcx, qword ptr [r12 + 0x38]
1402d9f6d 488b04c1 mov rax, qword ptr [rcx + rax*8]
1402d9f71 48f7d0 not rax
1402d9f74 4c8d2c40 lea r13, [rax + rax*2]
1402d9f78 49c1e504 shl r13, 4
1402d9f7c 4881c288010000 add rdx, 0x188
1402d9f83 4e8b442f08 mov r8, qword ptr [rdi + r13 + 8]
1402d9f88 4c89c1 mov rcx, r8
1402d9f8b 490fafce imul rcx, r14
1402d9f8f 4a034c2f10 add rcx, qword ptr [rdi + r13 + 0x10]
1402d9f94 e854019205 call 0x145bfa0ed
1402d9f99 4a8b442f20 mov rax, qword ptr [rdi + r13 + 0x20]
1402d9f9e 8b4d68 mov ecx, dword ptr [rbp + 0x68]
1402d9fa1 42890cb0 mov dword ptr [rax + r14*4], ecx
1402d9fa5 4a8b442f28 mov rax, qword ptr [rdi + r13 + 0x28]
1402d9faa 8b4d68 mov ecx, dword ptr [rbp + 0x68]
1402d9fad 42890cb0 mov dword ptr [rax + r14*4], ecx
1402d9fb1 488b4508 mov rax, qword ptr [rbp + 8]
1402d9fb5 488b4010 mov rax, qword ptr [rax + 0x10]
1402d9fb9 498b7c2418 mov rdi, qword ptr [r12 + 0x18]
1402d9fbe 498b4c2438 mov rcx, qword ptr [r12 + 0x38]
1402d9fc3 488b04c1 mov rax, qword ptr [rcx + rax*8]
1402d9fc7 48f7d0 not rax
1402d9fca 4c8d2c40 lea r13, [rax + rax*2]
1402d9fce 49c1e504 shl r13, 4
1402d9fd2 4e8b442f08 mov r8, qword ptr [rdi + r13 + 8]
1402d9fd7 4c89c1 mov rcx, r8
1402d9fda 490fafce imul rcx, r14
1402d9fde 4a034c2f10 add rcx, qword ptr [rdi + r13 + 0x10]
1402d9fe3 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1402d9fe7 e801019205 call 0x145bfa0ed
1402d9fec 4a8b442f20 mov rax, qword ptr [rdi + r13 + 0x20]
1402d9ff1 8b4d68 mov ecx, dword ptr [rbp + 0x68]
1402d9ff4 42890cb0 mov dword ptr [rax + r14*4], ecx
1402d9ff8 4a8b442f28 mov rax, qword ptr [rdi + r13 + 0x28]
1402d9ffd 8b4d68 mov ecx, dword ptr [rbp + 0x68]
1402da000 42890cb0 mov dword ptr [rax + r14*4], ecx
1402da004 488b4508 mov rax, qword ptr [rbp + 8]
1402da008 488b4018 mov rax, qword ptr [rax + 0x18]
1402da00c 498b7c2418 mov rdi, qword ptr [r12 + 0x18]
