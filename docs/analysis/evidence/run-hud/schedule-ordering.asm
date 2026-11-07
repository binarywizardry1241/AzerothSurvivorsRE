14013d450 55 push rbp
14013d451 4156 push r14
14013d453 56 push rsi
14013d454 57 push rdi
14013d455 53 push rbx
14013d456 4883ec60 sub rsp, 0x60
14013d45a 488d6c2460 lea rbp, [rsp + 0x60]
14013d45f 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14013d467 4c89c7 mov rdi, r8
14013d46a 4889d3 mov rbx, rdx
14013d46d 4889ce mov rsi, rcx
14013d470 488339ff cmp qword ptr [rcx], -1
14013d474 7459 je 0x14013d4cf
14013d476 488d4dc0 lea rcx, [rbp - 0x40]
14013d47a b201 mov dl, 1
14013d47c 4989d8 mov r8, rbx
14013d47f 4989f9 mov r9, rdi
14013d482 e8d9a9cc04 call 0x144e07e60
14013d487 488b7e28 mov rdi, qword ptr [rsi + 0x28]
14013d48b 483b7e18 cmp rdi, qword ptr [rsi + 0x18]
14013d48f 750a jne 0x14013d49b
14013d491 488d4e18 lea rcx, [rsi + 0x18]
14013d495 e806d9ab05 call 0x145bfada0
14013d49a 90 nop
14013d49b 488b4620 mov rax, qword ptr [rsi + 0x20]
14013d49f 486bcf38 imul rcx, rdi, 0x38
14013d4a3 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14013d4a7 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
14013d4ac 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
14013d4b0 0f104dd0 movups xmm1, xmmword ptr [rbp - 0x30]
14013d4b4 0f1055e0 movups xmm2, xmmword ptr [rbp - 0x20]
14013d4b8 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
14013d4bd 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14013d4c2 0f110408 movups xmmword ptr [rax + rcx], xmm0
14013d4c6 48ffc7 inc rdi
14013d4c9 48897e28 mov qword ptr [rsi + 0x28], rdi
14013d4cd eb29 jmp 0x14013d4f8
14013d4cf 488b4618 mov rax, qword ptr [rsi + 0x18]
14013d4d3 4885c0 test rax, rax
14013d4d6 7420 je 0x14013d4f8
14013d4d8 488b4e10 mov rcx, qword ptr [rsi + 0x10]
14013d4dc 486bf070 imul rsi, rax, 0x70
14013d4e0 4c8d7170 lea r14, [rcx + 0x70]
14013d4e4 4889da mov rdx, rbx
14013d4e7 4989f8 mov r8, rdi
14013d4ea e861ffffff call 0x14013d450
14013d4ef 4c89f1 mov rcx, r14
14013d4f2 4883c690 add rsi, -0x70
14013d4f6 75e8 jne 0x14013d4e0
14013d4f8 4883c460 add rsp, 0x60
14013d4fc 5b pop rbx
14013d4fd 5f pop rdi
14013d4fe 5e pop rsi
14013d4ff 415e pop r14
14013d501 5d pop rbp
14013d502 c3 ret
