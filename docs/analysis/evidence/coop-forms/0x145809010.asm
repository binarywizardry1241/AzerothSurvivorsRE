0x145809010: push rbp
0x145809011: push r14
0x145809013: push rsi
0x145809014: push rdi
0x145809015: push rbx
0x145809016: sub rsp, 0x60
0x14580901a: lea rbp, [rsp + 0x60]
0x14580901f: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145809027: mov rdi, rcx
0x14580902a: lea rax, [rcx + 8]
0x14580902e: mov qword ptr [rbp - 0x38], rax
0x145809032: lea rax, [rip - 0x5806f79]
0x145809039: mov qword ptr [rbp - 0x30], rax
0x14580903d: lea rdx, [rip + 0x14abeb2]
0x145809044: lea rcx, [rbp - 0x28]
0x145809048: lea r8, [rbp - 0x38]
0x14580904c: call 0x145ce7350
0x145809051: mov rcx, qword ptr [rbp - 0x20]
0x145809055: mov rdx, qword ptr [rbp - 0x18]
0x145809059: mov rsi, qword ptr [rdi + 0x18]
0x14580905d: mov rbx, qword ptr [rdi + 0x20]
0x145809061: mov qword ptr [rbp - 0x10], rcx
0x145809065: call 0x1458dff90
0x14580906a: nop
0x14580906b: mov rdi, rax
0x14580906e: mov rax, qword ptr [rbp - 0x28]
0x145809072: test rax, rax
0x145809075: je 0x14580908f
0x145809077: mov r8d, 1
0x14580907d: mov rcx, qword ptr [rbp - 0x10]
0x145809081: mov r14, rdx
0x145809084: mov rdx, rax
0x145809087: call 0x1400021d0
0x14580908c: mov rdx, r14
0x14580908f: test rdi, rdi
0x145809092: cmovne rsi, rdi
0x145809096: cmove rdx, rbx
0x14580909a: mov rax, rsi
0x14580909d: add rsp, 0x60
0x1458090a1: pop rbx
0x1458090a2: pop rdi
0x1458090a3: pop rsi
0x1458090a4: pop r14
0x1458090a6: pop rbp
0x1458090a7: ret
