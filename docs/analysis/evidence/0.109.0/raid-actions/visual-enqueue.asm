14594e230: 4156 push r14
14594e232: 56 push rsi
14594e233: 57 push rdi
14594e234: 55 push rbp
14594e235: 53 push rbx
14594e236: 4883ec30 sub rsp, 0x30
14594e23a: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
14594e23f: 4585c9 test r9d, r9d
14594e242: 747f je 0x14594e2c3
14594e244: f30f5889340a0000 addss xmm1, dword ptr [rcx + 0xa34]
14594e24c: 488bbc2480000000 mov rdi, qword ptr [rsp + 0x80]
14594e254: 488bb1c8050000 mov rsi, qword ptr [rcx + 0x5c8]
14594e25b: 483bb1b8050000 cmp rsi, qword ptr [rcx + 0x5b8]
14594e262: 7527 jne 0x14594e28b
14594e264: 488d81b8050000 lea rax, [rcx + 0x5b8]
14594e26b: 4889cb mov rbx, rcx
14594e26e: 4889c1 mov rcx, rax
14594e271: 4489cd mov ebp, r9d
14594e274: 0f28f1 movaps xmm6, xmm1
14594e277: 4d89c6 mov r14, r8
14594e27a: e891cb2a00 call 0x145bfae10
14594e27f: 4d89f0 mov r8, r14
14594e282: 0f28ce movaps xmm1, xmm6
14594e285: 4189e9 mov r9d, ebp
14594e288: 4889d9 mov rcx, rbx
14594e28b: 488b81c0050000 mov rax, qword ptr [rcx + 0x5c0]
14594e292: 4889f2 mov rdx, rsi
14594e295: 48c1e205 shl rdx, 5
14594e299: 4c890410 mov qword ptr [rax + rdx], r8
14594e29d: f30f114c1008 movss dword ptr [rax + rdx + 8], xmm1
14594e2a3: 44894c100c mov dword ptr [rax + rdx + 0xc], r9d
14594e2a8: 4c8b07 mov r8, qword ptr [rdi]
14594e2ab: 4c89441010 mov qword ptr [rax + rdx + 0x10], r8
14594e2b0: 448b4708 mov r8d, dword ptr [rdi + 8]
14594e2b4: 4489441018 mov dword ptr [rax + rdx + 0x18], r8d
14594e2b9: 48ffc6 inc rsi
14594e2bc: 4889b1c8050000 mov qword ptr [rcx + 0x5c8], rsi
14594e2c3: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14594e2c8: 4883c430 add rsp, 0x30
14594e2cc: 5b pop rbx
14594e2cd: 5d pop rbp
14594e2ce: 5f pop rdi
14594e2cf: 5e pop rsi
14594e2d0: 415e pop r14
14594e2d2: c3 ret
