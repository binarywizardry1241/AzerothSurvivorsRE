0x1401f67f0: push r15
0x1401f67f2: push r14
0x1401f67f4: push r13
0x1401f67f6: push r12
0x1401f67f8: push rsi
0x1401f67f9: push rdi
0x1401f67fa: push rbx
0x1401f67fb: sub rsp, 0x110
0x1401f6802: mov rsi, rcx
0x1401f6805: imul r14, rdx, 0xf0
0x1401f680c: add r14, rcx
0x1401f680f: lea rax, [rcx + 0xf0]
0x1401f6816: mov r15d, 0xf0
0x1401f681c: lea rdi, [rsp + 0x40]
0x1401f6821: mov rbx, rcx
0x1401f6824: jmp 0x1401f6872
0x1401f6826: nop word ptr cs:[rax + rax]
0x1401f6830: mov rcx, rsi
0x1401f6833: mov r8d, 0xd0
0x1401f6839: mov rdx, rdi
0x1401f683c: call 0x145d145fb
0x1401f6841: mov qword ptr [rsi + r13 - 0x20], r12
0x1401f6846: movaps xmm0, xmmword ptr [rsp + 0x20]
0x1401f684b: movups xmmword ptr [rsi + r13 - 0x18], xmm0
0x1401f6851: mov rax, qword ptr [rsp + 0x30]
0x1401f6856: mov qword ptr [rsi + r13 - 8], rax
0x1401f685b: lea rax, [rbx + 0xf0]
0x1401f6862: add r15, 0xf0
0x1401f6869: cmp rax, r14
0x1401f686c: je 0x1401f6903
0x1401f6872: mov r13, rbx
0x1401f6875: mov rbx, rax
0x1401f6878: mov r12, qword ptr [r13 + 0x1c0]
0x1401f687f: test r12, r12
0x1401f6882: je 0x1401f685b
0x1401f6884: cmp qword ptr [r13 + 0xd0], 0
0x1401f688c: jne 0x1401f685b
0x1401f688e: mov r8d, 0xd0
0x1401f6894: mov rcx, rdi
0x1401f6897: mov rdx, rbx
0x1401f689a: call 0x145d145fb
0x1401f689f: movups xmm0, xmmword ptr [r13 + 0x1c8]
0x1401f68a7: movaps xmmword ptr [rsp + 0x20], xmm0
0x1401f68ac: mov rax, qword ptr [r13 + 0x1d8]
0x1401f68b3: mov qword ptr [rsp + 0x30], rax
0x1401f68b8: mov rcx, r15
0x1401f68bb: nop dword ptr [rax + rax]
0x1401f68c0: mov r13, rcx
0x1401f68c3: add rcx, rsi
0x1401f68c6: lea rdx, [rsi + r13]
0x1401f68ca: add rdx, -0xf0
0x1401f68d1: mov r8d, 0xf0
0x1401f68d7: call 0x145d145fb
0x1401f68dc: cmp r13, 0xf0
0x1401f68e3: je 0x1401f6830
0x1401f68e9: lea rcx, [r13 - 0xf0]
0x1401f68f0: cmp qword ptr [rsi + r13 - 0x110], 0
0x1401f68f9: je 0x1401f68c0
0x1401f68fb: add rcx, rsi
0x1401f68fe: jmp 0x1401f6833
0x1401f6903: add rsp, 0x110
0x1401f690a: pop rbx
0x1401f690b: pop rdi
0x1401f690c: pop rsi
0x1401f690d: pop r12
0x1401f690f: pop r13
0x1401f6911: pop r14
0x1401f6913: pop r15
0x1401f6915: ret
