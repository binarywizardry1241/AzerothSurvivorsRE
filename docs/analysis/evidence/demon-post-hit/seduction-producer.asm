145957cfe 4531ff xor r15d, r15d
145957d01 4d89fd mov r13, r15
145957d04 49c1e504 shl r13, 4
145957d08 31c9 xor ecx, ecx
145957d0a 660f1f440000 nop word ptr [rax + rax]
145957d10 4939cd cmp r13, rcx
145957d13 7416 je 0x145957d2b
145957d15 4c392408 cmp qword ptr [rax + rcx], r12
145957d19 488d4910 lea rcx, [rcx + 0x10]
145957d1d 75f1 jne 0x145957d10
145957d1f 4c8badd0000000 mov r13, qword ptr [rbp + 0xd0]
145957d26 e905f1ffff jmp 0x145956e30
145957d2b f30f583d95974500 addss xmm7, dword ptr [rip + 0x459795]
145957d33 488d8b10010000 lea rcx, [rbx + 0x110]
145957d3a 4c3b39 cmp r15, qword ptr [rcx]
145957d3d 7513 jne 0x145957d52
145957d3f 488d8b10010000 lea rcx, [rbx + 0x110]
145957d46 e8655f2b00 call 0x145c0dcb0
145957d4b 488b8318010000 mov rax, qword ptr [rbx + 0x118]
145957d52 4e892428 mov qword ptr [rax + r13], r12
145957d56 f3420f117c2808 movss dword ptr [rax + r13 + 8], xmm7
145957d5d 49ffc7 inc r15
145957d60 4c89bb20010000 mov qword ptr [rbx + 0x120], r15
145957d67 488b93d8000000 mov rdx, qword ptr [rbx + 0xd8]
145957d6e 4c8badd0000000 mov r13, qword ptr [rbp + 0xd0]
145957d75 4939d5 cmp r13, rdx
145957d78 0f839f050000 jae 0x14595831d
145957d7e 488b83d0000000 mov rax, qword ptr [rbx + 0xd0]
145957d85 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
145957d8c 488b540820 mov rdx, qword ptr [rax + rcx + 0x20]
145957d91 4c896518 mov qword ptr [rbp + 0x18], r12
145957d95 4c896548 mov qword ptr [rbp + 0x48], r12
145957d99 c7454000000000 mov dword ptr [rbp + 0x40], 0
145957da0 c7450000000000 mov dword ptr [rbp], 0
145957da7 4889e8 mov rax, rbp
145957daa 4889442430 mov qword ptr [rsp + 0x30], rax
145957daf 488d4540 lea rax, [rbp + 0x40]
145957db3 4889442428 mov qword ptr [rsp + 0x28], rax
145957db8 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145957dc1 488d4d60 lea rcx, [rbp + 0x60]
145957dc5 41b8d6180000 mov r8d, 0x18d6
145957dcb 4c8d4d18 lea r9, [rbp + 0x18]
145957dcf e8fc69f7ff call 0x1458ce7d0
145957dd4 4c8bb330060000 mov r14, qword ptr [rbx + 0x630]
145957ddb 4c3bb320060000 cmp r14, qword ptr [rbx + 0x620]
145957de2 750d jne 0x145957df1
145957de4 488d8b20060000 lea rcx, [rbx + 0x620]
145957deb e8e05d2b00 call 0x145c0dbd0
145957df0 90 nop
145957df1 488b8328060000 mov rax, qword ptr [rbx + 0x628]
145957df8 4c89f1 mov rcx, r14
145957dfb 48c1e105 shl rcx, 5
145957dff 0f104560 movups xmm0, xmmword ptr [rbp + 0x60]
145957e03 0f104d70 movups xmm1, xmmword ptr [rbp + 0x70]
145957e07 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145957e0c 0f110408 movups xmmword ptr [rax + rcx], xmm0
145957e10 49ffc6 inc r14
145957e13 4c89b330060000 mov qword ptr [rbx + 0x630], r14
145957e1a 488b8368050000 mov rax, qword ptr [rbx + 0x568]
145957e21 48699370050000d8010000 imul rdx, qword ptr [rbx + 0x570], 0x1d8
145957e2c 31c9 xor ecx, ecx
145957e2e 4989c0 mov r8, rax
145957e31 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145957e40 4839ca cmp rdx, rcx
145957e43 0f84e7efffff je 0x145956e30
145957e49 4881c1d8010000 add rcx, 0x1d8
145957e50 4d39a0f0000000 cmp qword ptr [r8 + 0xf0], r12
145957e57 4d8d80d8010000 lea r8, [r8 + 0x1d8]
145957e5e 75e0 jne 0x145957e40
145957e60 4883bc0840feffffff cmp qword ptr [rax + rcx - 0x1c0], -1
145957e69 f30f1005f7534500 movss xmm0, dword ptr [rip + 0x4553f7]
145957e71 7517 jne 0x145957e8a
145957e73 807c08f800 cmp byte ptr [rax + rcx - 8], 0
145957e78 f30f1005e0534500 movss xmm0, dword ptr [rip + 0x4553e0]
145957e80 7408 je 0x145957e8a
145957e82 f30f1005da534500 movss xmm0, dword ptr [rip + 0x4553da]
145957e8a f30f114564 movss dword ptr [rbp + 0x64], xmm0
145957e8f c7456003000000 mov dword ptr [rbp + 0x60], 3
145957e96 c7442420d6180000 mov dword ptr [rsp + 0x20], 0x18d6
145957e9e 0f57db xorps xmm3, xmm3
145957ea1 4889d9 mov rcx, rbx
145957ea4 4c89e2 mov rdx, r12
145957ea7 4c8d4560 lea r8, [rbp + 0x60]
145957eab e87029fdff call 0x14592a820
145957eb0 e97befffff jmp 0x145956e30
