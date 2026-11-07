0x1459da6c0: 55 push rbp
0x1459da6c1: 4157 push r15
0x1459da6c3: 4156 push r14
0x1459da6c5: 4155 push r13
0x1459da6c7: 4154 push r12
0x1459da6c9: 56 push rsi
0x1459da6ca: 57 push rdi
0x1459da6cb: 53 push rbx
0x1459da6cc: 4883ec38 sub rsp, 0x38
0x1459da6d0: 488d6c2430 lea rbp, [rsp + 0x30]
0x1459da6d5: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
0x1459da6dd: 488b5a08 mov rbx, qword ptr [rdx + 8]
0x1459da6e1: 4c8b7210 mov r14, qword ptr [rdx + 0x10]
0x1459da6e5: 31ff xor edi, edi
0x1459da6e7: 4d89f5 mov r13, r14
0x1459da6ea: 4929dd sub r13, rbx
0x1459da6ed: 4c0f42ef cmovb r13, rdi
0x1459da6f1: 4c89ee mov rsi, r13
0x1459da6f4: 48c1e604 shl rsi, 4
0x1459da6f8: 4c89e8 mov rax, r13
0x1459da6fb: 48c1e83c shr rax, 0x3c
0x1459da6ff: 0f95c0 setne al
0x1459da702: 49b8f8ffffffffffff7f movabs r8, 0x7ffffffffffffff8
0x1459da70c: 4c39c6 cmp rsi, r8
0x1459da70f: 410f97c0 seta r8b
0x1459da713: 4108c0 or r8b, al
0x1459da716: 740d je 0x1459da725
0x1459da718: 4889f9 mov rcx, rdi
0x1459da71b: 4889f2 mov rdx, rsi
0x1459da71e: e8c8ed3c00 call 0x145da94eb
0x1459da723: 0f0b ud2
0x1459da725: 4885f6 test rsi, rsi
0x1459da728: 0f84a9000000 je 0x1459da7d7
0x1459da72e: 4989cf mov r15, rcx
0x1459da731: 4989d4 mov r12, rdx
0x1459da734: e8c77a62fa call 0x140002200
0x1459da739: bf08000000 mov edi, 8
0x1459da73e: ba08000000 mov edx, 8
0x1459da743: 4889f1 mov rcx, rsi
0x1459da746: e8757a62fa call 0x1400021c0
0x1459da74b: 4885c0 test rax, rax
0x1459da74e: 74c8 je 0x1459da718
0x1459da750: 4c89e2 mov rdx, r12
0x1459da753: 4c89f9 mov rcx, r15
0x1459da756: 4989c4 mov r12, rax
0x1459da759: 4989da mov r10, rbx
0x1459da75c: 4d29f2 sub r10, r14
0x1459da75f: 0f8387000000 jae 0x1459da7ec
0x1459da765: 4c8b1a mov r11, qword ptr [rdx]
0x1459da768: 498d742408 lea rsi, [r12 + 8]
0x1459da76d: 4531c9 xor r9d, r9d
0x1459da770: 488d3d199f8601 lea rdi, [rip + 0x1869f19]
0x1459da777: eb37 jmp 0x1459da7b0
0x1459da779: 0f1f8000000000 nop dword ptr [rax]
0x1459da780: 4c89c0 mov rax, r8
0x1459da783: 31d2 xor edx, edx
0x1459da785: 49f7f7 div r15
0x1459da788: 498b04d6 mov rax, qword ptr [r14 + rdx*8]
0x1459da78c: 31d2 xor edx, edx
0x1459da78e: 4d85c0 test r8, r8
0x1459da791: 0f94c2 sete dl
0x1459da794: f30f100497 movss xmm0, dword ptr [rdi + rdx*4]
0x1459da799: 488946f8 mov qword ptr [rsi - 8], rax
0x1459da79d: f30f1106 movss dword ptr [rsi], xmm0
0x1459da7a1: 49ffc1 inc r9
0x1459da7a4: 4883c610 add rsi, 0x10
0x1459da7a8: 4c89d0 mov rax, r10
0x1459da7ab: 4c01c8 add rax, r9
0x1459da7ae: 743f je 0x1459da7ef
0x1459da7b0: 4d8b7b10 mov r15, qword ptr [r11 + 0x10]
0x1459da7b4: 4d85ff test r15, r15
0x1459da7b7: 7455 je 0x1459da80e
0x1459da7b9: 4e8d040b lea r8, [rbx + r9]
0x1459da7bd: 4d8b7308 mov r14, qword ptr [r11 + 8]
0x1459da7c1: 4c89c0 mov rax, r8
0x1459da7c4: 4c09f8 or rax, r15
0x1459da7c7: 48c1e820 shr rax, 0x20
0x1459da7cb: 75b3 jne 0x1459da780
0x1459da7cd: 4489c0 mov eax, r8d
0x1459da7d0: 31d2 xor edx, edx
0x1459da7d2: 41f7f7 div r15d
0x1459da7d5: ebb1 jmp 0x1459da788
0x1459da7d7: 41bc08000000 mov r12d, 8
0x1459da7dd: 4531ed xor r13d, r13d
0x1459da7e0: 4989da mov r10, rbx
0x1459da7e3: 4d29f2 sub r10, r14
0x1459da7e6: 0f8279ffffff jb 0x1459da765
0x1459da7ec: 4531c9 xor r9d, r9d
0x1459da7ef: 4c8929 mov qword ptr [rcx], r13
0x1459da7f2: 4c896108 mov qword ptr [rcx + 8], r12
0x1459da7f6: 4c894910 mov qword ptr [rcx + 0x10], r9
0x1459da7fa: 4889c8 mov rax, rcx
0x1459da7fd: 4883c438 add rsp, 0x38
0x1459da801: 5b pop rbx
0x1459da802: 5f pop rdi
0x1459da803: 5e pop rsi
0x1459da804: 415c pop r12
0x1459da806: 415d pop r13
0x1459da808: 415e pop r14
0x1459da80a: 415f pop r15
0x1459da80c: 5d pop rbp
0x1459da80d: c3 ret
0x1459da80e: 4c8965f0 mov qword ptr [rbp - 0x10], r12
0x1459da812: 4c896df8 mov qword ptr [rbp - 8], r13
0x1459da816: 488d0d9bb38601 lea rcx, [rip + 0x186b39b]
0x1459da81d: e85ef33c00 call 0x145da9b80
0x1459da822: 90 nop
0x1459da823: 0f0b ud2
