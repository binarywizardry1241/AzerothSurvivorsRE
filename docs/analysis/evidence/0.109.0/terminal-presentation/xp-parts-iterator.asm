14012a310 4c8b3a mov r15, qword ptr [rdx]
14012a313 4c8b6a08 mov r13, qword ptr [rdx + 8]
14012a317 4d39ef cmp r15, r13
14012a31a 0f8449010000 je 0x14012a469
14012a320 4889d7 mov rdi, rdx
14012a323 488d1d5aebca05 lea rbx, [rip + 0x5caeb5a]
14012a32a 4c8b255f5ff307 mov r12, qword ptr [rip + 0x7f35f5f]
14012a331 f20f1035272cca05 movsd xmm6, qword ptr [rip + 0x5ca2c27]
14012a339 660f283d2f2cca05 movapd xmm7, xmmword ptr [rip + 0x5ca2c2f]
14012a341 f2440f10050e8aca05 movsd xmm8, qword ptr [rip + 0x5ca8a0e]
14012a34a 4d8d7720 lea r14, [r15 + 0x20]
14012a34e 4c8937 mov qword ptr [rdi], r14
14012a351 ba04000000 mov edx, 4
14012a356 4889d9 mov rcx, rbx
14012a359 4d89f8 mov r8, r15
14012a35c e87f099c02 call 0x142aeace0
14012a361 4885c0 test rax, rax
14012a364 7503 jne 0x14012a369
14012a366 4c89e0 mov rax, r12
14012a369 803803 cmp byte ptr [rax], 3
14012a36c 7552 jne 0x14012a3c0
14012a36e 488b4818 mov rcx, qword ptr [rax + 0x18]
14012a372 4885c9 test rcx, rcx
14012a375 0f8819010000 js 0x14012a494
14012a37b 48894dc0 mov qword ptr [rbp - 0x40], rcx
14012a37f 743f je 0x14012a3c0
14012a381 488b4010 mov rax, qword ptr [rax + 0x10]
14012a385 488945b0 mov qword ptr [rbp - 0x50], rax
14012a389 e8727eedff call 0x140002200
14012a38e ba01000000 mov edx, 1
14012a393 488b4dc0 mov rcx, qword ptr [rbp - 0x40]
14012a397 e8247eedff call 0x1400021c0
14012a39c 488945b8 mov qword ptr [rbp - 0x48], rax
14012a3a0 4885c0 test rax, rax
14012a3a3 0f8409010000 je 0x14012a4b2
14012a3a9 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14012a3ad 488b55b0 mov rdx, qword ptr [rbp - 0x50]
14012a3b1 4c8b45c0 mov r8, qword ptr [rbp - 0x40]
14012a3b5 e82dfdac05 call 0x145bfa0e7
14012a3ba eb15 jmp 0x14012a3d1
14012a3bc 0f1f4000 nop dword ptr [rax]
14012a3c0 b801000000 mov eax, 1
14012a3c5 488945b8 mov qword ptr [rbp - 0x48], rax
14012a3c9 48c745c000000000 mov qword ptr [rbp - 0x40], 0
14012a3d1 ba02000000 mov edx, 2
14012a3d6 488d0db2eaca05 lea rcx, [rip + 0x5caeab2]
14012a3dd 4d89f8 mov r8, r15
14012a3e0 e8fb089c02 call 0x142aeace0
14012a3e5 90 nop
14012a3e6 4885c0 test rax, rax
14012a3e9 7503 jne 0x14012a3ee
14012a3eb 4c89e0 mov rax, r12
14012a3ee 803802 cmp byte ptr [rax], 2
14012a3f1 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14012a3f5 7552 jne 0x14012a449
14012a3f7 488b4808 mov rcx, qword ptr [rax + 8]
14012a3fb 4885c9 test rcx, rcx
14012a3fe 7410 je 0x14012a410
14012a400 83f901 cmp ecx, 1
14012a403 7525 jne 0x14012a42a
14012a405 0f57c0 xorps xmm0, xmm0
14012a408 f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
14012a40e eb1f jmp 0x14012a42f
14012a410 f20f104810 movsd xmm1, qword ptr [rax + 0x10]
14012a415 0f14ce unpcklps xmm1, xmm6
14012a418 660f5ccf subpd xmm1, xmm7
14012a41c 660f28c1 movapd xmm0, xmm1
14012a420 660f15c1 unpckhpd xmm0, xmm1
14012a424 f20f58c1 addsd xmm0, xmm1
14012a428 eb05 jmp 0x14012a42f
14012a42a f20f104010 movsd xmm0, qword ptr [rax + 0x10]
14012a42f 660f57c9 xorpd xmm1, xmm1
14012a433 f20f5fc8 maxsd xmm1, xmm0
14012a437 66410f28c0 movapd xmm0, xmm8
14012a43c f20f5dc1 minsd xmm0, xmm1
14012a440 f2480f2cc0 cvttsd2si rax, xmm0
14012a445 85c0 test eax, eax
14012a447 7558 jne 0x14012a4a1
14012a449 4885d2 test rdx, rdx
14012a44c 740f je 0x14012a45d
14012a44e 41b801000000 mov r8d, 1
14012a454 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14012a458 e8737dedff call 0x1400021d0
14012a45d 4d89f7 mov r15, r14
14012a460 4d39ee cmp r14, r13
14012a463 0f85e1feffff jne 0x14012a34a
14012a469 48c7c2ffffffff mov rdx, 0xffffffffffffffff
14012a4a1 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14012a4a5 48894e08 mov qword ptr [rsi + 8], rcx
14012a4a9 48895610 mov qword ptr [rsi + 0x10], rdx
14012a4ad 894618 mov dword ptr [rsi + 0x18], eax
14012a4b0 ebbe jmp 0x14012a470
