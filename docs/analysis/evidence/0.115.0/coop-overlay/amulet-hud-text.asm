14583cdd0 push rbp
14583cdd1 push r14
14583cdd3 push rsi
14583cdd4 push rdi
14583cdd5 push rbx
14583cdd6 sub rsp, 0x60
14583cdda lea rbp, [rsp + 0x60]
14583cddf mov qword ptr [rbp - 8], 0xfffffffffffffffe
14583cde7 mov rsi, rcx
14583cdea lea rcx, [rbp - 0x20]
14583cdee call 0x14583d200
14583cdf3 mov rdi, qword ptr [rbp - 0x18]
14583cdf7 mov rbx, qword ptr [rbp - 0x10]
14583cdfb mov qword ptr [rsp + 0x20], 2
14583ce04 lea r9, [rip + 0x148fd8d]
14583ce0b lea rcx, [rbp - 0x38]
14583ce0f mov rdx, rdi
14583ce12 mov r8, rbx
14583ce15 call 0x1458c01f0
14583ce1a nop
14583ce1b mov rax, qword ptr [rbp - 0x28]
14583ce1f mov qword ptr [rsi + 0x10], rax
14583ce23 movups xmm0, xmmword ptr [rbp - 0x38]
14583ce27 movups xmmword ptr [rsi], xmm0
14583ce2a test rbx, rbx
14583ce2d je 0x14583ce62
14583ce2f lea r14, [rdi + 8]
14583ce33 jmp 0x14583ce49
14583ce35 nop word ptr cs:[rax + rax]
14583ce40 add r14, 0x18
14583ce44 dec rbx
14583ce47 je 0x14583ce62
14583ce49 mov rdx, qword ptr [r14 - 8]
14583ce4d test rdx, rdx
14583ce50 je 0x14583ce40
14583ce52 mov rcx, qword ptr [r14]
14583ce55 mov r8d, 1
14583ce5b call 0x1400021d0
14583ce60 jmp 0x14583ce40
14583ce62 mov rax, qword ptr [rbp - 0x20]
14583ce66 test rax, rax
14583ce69 je 0x14583ce81
14583ce6b shl rax, 3
14583ce6f lea rdx, [rax + rax*2]
14583ce73 mov r8d, 8
14583ce79 mov rcx, rdi
14583ce7c call 0x1400021d0
14583ce81 mov rax, rsi
14583ce84 add rsp, 0x60
14583ce88 pop rbx
14583ce89 pop rdi
14583ce8a pop rsi
14583ce8b pop r14
14583ce8d pop rbp
14583ce8e ret
