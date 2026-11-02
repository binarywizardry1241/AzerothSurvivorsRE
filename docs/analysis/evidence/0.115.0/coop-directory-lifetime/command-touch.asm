0x14587a2a5: mov byte ptr [rbp + 0xdce], 1
0x14587a2ac: mov rcx, qword ptr [rbp + 0xe00]
0x14587a2b3: mov rdx, rsi
0x14587a2b6: call 0x145893a20
0x14587a2bb: nop
0x14587a2bc: test al, al
0x14587a2be: jne 0x14587a260
0x14587a2c0: sub edi, 2
0x14587a2c3: mov eax, 0xb
0x14587a2c8: cmovb edi, eax
0x14587a2cb: lea eax, [rdi - 0x12]
0x14587a2ce: cmp eax, 5
0x14587a2d1: jae 0x14587a3b0
0x14587a2d7: mov r15, r14
0x14587a2da: mov qword ptr [rbp + 0xd90], rbx
0x14587a2e1: mov r8d, 0xe8
0x14587a2e7: lea rcx, [rbp + 0x280]
0x14587a2ee: mov rdx, rsi
0x14587a2f1: call 0x145d145fb
0x14587a2f6: mov rax, qword ptr [rbp + 0xdb0]
0x14587a2fd: cmp qword ptr [rax], -1
0x14587a301: je 0x14587a312
0x14587a303: mov rax, qword ptr [rbp + 0xe00]
0x14587a30a: movsd qword ptr [rax + 0x16c8], xmm6
