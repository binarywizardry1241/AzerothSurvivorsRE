1458b1a7d: 4c8b30 mov r14, qword ptr [rax]
1458b1a80: 4c8b7808 mov r15, qword ptr [rax + 8]
1458b1a84: 488b7018 mov rsi, qword ptr [rax + 0x18]
1458b1a88: 488b5820 mov rbx, qword ptr [rax + 0x20]
1458b1a8c: 493b5c2410 cmp rbx, qword ptr [r12 + 0x10]
1458b1a91: 7518 jne 0x1458b1aab
1458b1a93: 498b542408 mov rdx, qword ptr [r12 + 8]
1458b1a98: 4889f1 mov rcx, rsi
1458b1a9b: 4989d8 mov r8, rbx
1458b1a9e: e844893500 call 0x145c0a3e7
1458b1aa3: 85c0 test eax, eax
1458b1aa5: 0f84a7000000 je 0x1458b1b52
1458b1aab: 4c8bad68050000 mov r13, qword ptr [rbp + 0x568]
1458b1ab2: 498b9578040000 mov rdx, qword ptr [r13 + 0x478]
1458b1ab9: 48895c2428 mov qword ptr [rsp + 0x28], rbx
1458b1abe: 4889b550050000 mov qword ptr [rbp + 0x550], rsi
1458b1ac5: 4889742420 mov qword ptr [rsp + 0x20], rsi
1458b1aca: 4889f9 mov rcx, rdi
1458b1acd: 4d89f0 mov r8, r14
1458b1ad0: 4d89f9 mov r9, r15
1458b1ad3: e8582b0100 call 0x1458c4630
