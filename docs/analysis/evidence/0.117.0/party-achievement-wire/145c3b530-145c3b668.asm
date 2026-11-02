145c3b530 55 push rbp
145c3b531 4157 push r15
145c3b533 4156 push r14
145c3b535 4155 push r13
145c3b537 4154 push r12
145c3b539 56 push rsi
145c3b53a 57 push rdi
145c3b53b 53 push rbx
145c3b53c 4883ec38 sub rsp, 0x38
145c3b540 488d6c2430 lea rbp, [rsp + 0x30]
145c3b545 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145c3b54d 4889ce mov rsi, rcx
145c3b550 4c8b7208 mov r14, qword ptr [rdx + 8]
145c3b554 4c8b7a10 mov r15, qword ptr [rdx + 0x10]
145c3b558 31db xor ebx, ebx
145c3b55a 4d89fd mov r13, r15
145c3b55d 4d29f5 sub r13, r14
145c3b560 4c0f42eb cmovb r13, rbx
145c3b564 4a8d3ced00000000 lea rdi, [r13*8]
145c3b56c 4c89e8 mov rax, r13
145c3b56f 48c1e83d shr rax, 0x3d
145c3b573 0f95c0 setne al
145c3b576 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
145c3b580 4839cf cmp rdi, rcx
145c3b583 0f97c1 seta cl
145c3b586 08c1 or cl, al
145c3b588 740d je 0x145c3b597
145c3b58a 4889d9 mov rcx, rbx
145c3b58d 4889fa mov rdx, rdi
145c3b590 e826f74f00 call 0x14613acbb
145c3b595 0f0b ud2
145c3b597 4885ff test rdi, rdi
145c3b59a 0f8489000000 je 0x145c3b629
145c3b5a0 4989d4 mov r12, rdx
145c3b5a3 e8586c3cfa call 0x140002200
145c3b5a8 bb04000000 mov ebx, 4
145c3b5ad ba04000000 mov edx, 4
145c3b5b2 4889f9 mov rcx, rdi
145c3b5b5 e8066c3cfa call 0x1400021c0
145c3b5ba 488945f8 mov qword ptr [rbp - 8], rax
145c3b5be 4885c0 test rax, rax
145c3b5c1 74c7 je 0x145c3b58a
145c3b5c3 4c89e2 mov rdx, r12
145c3b5c6 4c896df0 mov qword ptr [rbp - 0x10], r13
145c3b5ca 4d29f7 sub r15, r14
145c3b5cd 766f jbe 0x145c3b63e
145c3b5cf 488b3a mov rdi, qword ptr [rdx]
145c3b5d2 4531e4 xor r12d, r12d
145c3b5d5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c3b5e0 4889f9 mov rcx, rdi
145c3b5e3 e8f8b41b00 call 0x145df6ae0
145c3b5e8 90 nop
145c3b5e9 88c3 mov bl, al
145c3b5eb 4889f9 mov rcx, rdi
145c3b5ee e8ddb71b00 call 0x145df6dd0
145c3b5f3 90 nop
145c3b5f4 4189c6 mov r14d, eax
145c3b5f7 4889f9 mov rcx, rdi
145c3b5fa e8e1b41b00 call 0x145df6ae0
145c3b5ff 90 nop
145c3b600 0fb6c0 movzx eax, al
145c3b603 48c1e028 shl rax, 0x28
145c3b607 0fb6cb movzx ecx, bl
145c3b60a 48c1e120 shl rcx, 0x20
145c3b60e 4809c1 or rcx, rax
145c3b611 4489f0 mov eax, r14d
145c3b614 4809c8 or rax, rcx
145c3b617 488b4df8 mov rcx, qword ptr [rbp - 8]
145c3b61b 4a8904e1 mov qword ptr [rcx + r12*8], rax
145c3b61f 49ffc4 inc r12
145c3b622 4d39e7 cmp r15, r12
145c3b625 75b9 jne 0x145c3b5e0
145c3b627 eb18 jmp 0x145c3b641
145c3b629 b804000000 mov eax, 4
145c3b62e 488945f8 mov qword ptr [rbp - 8], rax
145c3b632 4531ed xor r13d, r13d
145c3b635 4c896df0 mov qword ptr [rbp - 0x10], r13
145c3b639 4d29f7 sub r15, r14
145c3b63c 7791 ja 0x145c3b5cf
145c3b63e 4531e4 xor r12d, r12d
145c3b641 488b45f0 mov rax, qword ptr [rbp - 0x10]
145c3b645 488906 mov qword ptr [rsi], rax
145c3b648 488b45f8 mov rax, qword ptr [rbp - 8]
145c3b64c 48894608 mov qword ptr [rsi + 8], rax
145c3b650 4c896610 mov qword ptr [rsi + 0x10], r12
145c3b654 4889f0 mov rax, rsi
145c3b657 4883c438 add rsp, 0x38
145c3b65b 5b pop rbx
145c3b65c 5f pop rdi
145c3b65d 5e pop rsi
145c3b65e 415c pop r12
145c3b660 415d pop r13
145c3b662 415e pop r14
145c3b664 415f pop r15
145c3b666 5d pop rbp
145c3b667 c3 ret
