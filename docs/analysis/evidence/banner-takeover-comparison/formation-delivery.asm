145952308 4885ff test rdi, rdi
14595230b 4c0f45f7 cmovne r14, rdi
14595230f 4c0f44fb cmove r15, rbx
145952313 4c896c2420 mov qword ptr [rsp + 0x20], r13
145952318 488d4d40 lea rcx, [rbp + 0x40]
14595231c 4c89f2 mov rdx, r14
14595231f 4d89f8 mov r8, r15
145952322 4d89e1 mov r9, r12
145952325 e81667f7ff call 0x1458c8a40
14595232a 90 nop
14595232b 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
145952332 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
145952339 750d jne 0x145952348
14595233b 488d8e20060000 lea rcx, [rsi + 0x620]
145952342 e8997d3a00 call 0x145cfa0e0
145952347 90 nop
145952348 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14595234f 4889f9 mov rcx, rdi
145952352 48c1e105 shl rcx, 5
145952356 0f104540 movups xmm0, xmmword ptr [rbp + 0x40]
14595235a 0f104d50 movups xmm1, xmmword ptr [rbp + 0x50]
14595235e 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145952363 0f110408 movups xmmword ptr [rax + rcx], xmm0
145952367 48ffc7 inc rdi
14595236a 4889be30060000 mov qword ptr [rsi + 0x630], rdi
