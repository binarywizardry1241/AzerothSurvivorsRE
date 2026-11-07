14591d6b0 55 push rbp
14591d6b1 4157 push r15
14591d6b3 4156 push r14
14591d6b5 4154 push r12
14591d6b7 56 push rsi
14591d6b8 57 push rdi
14591d6b9 53 push rbx
14591d6ba 4883ec50 sub rsp, 0x50
14591d6be 488d6c2450 lea rbp, [rsp + 0x50]
14591d6c3 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14591d6cb 80b9c70a000005 cmp byte ptr [rcx + 0xac7], 5
14591d6d2 0f8532010000 jne 0x14591d80a
14591d6d8 4889ce mov rsi, rcx
14591d6db c681b80a000001 mov byte ptr [rcx + 0xab8], 1
14591d6e2 c681c70a000001 mov byte ptr [rcx + 0xac7], 1
14591d6e9 f30f1081340a0000 movss xmm0, dword ptr [rcx + 0xa34]
14591d6f1 f30f580597e52c01 addss xmm0, dword ptr [rip + 0x12ce597]
14591d6f9 f30f1181900a0000 movss dword ptr [rcx + 0xa90], xmm0
14591d701 488db918060000 lea rdi, [rcx + 0x618]
14591d708 488b9160040000 mov rdx, qword ptr [rcx + 0x460]
14591d70f 448b8148050000 mov r8d, dword ptr [rcx + 0x548]
14591d716 488d4dd8 lea rcx, [rbp - 0x28]
14591d71a e8414efaff call 0x1458c2560
14591d71f 488b9e28060000 mov rbx, qword ptr [rsi + 0x628]
14591d726 483b9e18060000 cmp rbx, qword ptr [rsi + 0x618]
14591d72d 7509 jne 0x14591d738
14591d72f 4889f9 mov rcx, rdi
14591d732 e8d9d62d00 call 0x145bfae10
14591d737 90 nop
14591d738 488b8620060000 mov rax, qword ptr [rsi + 0x620]
14591d73f 4889d9 mov rcx, rbx
14591d742 48c1e105 shl rcx, 5
14591d746 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14591d74a 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14591d74e 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14591d753 0f110408 movups xmmword ptr [rax + rcx], xmm0
14591d757 48ffc3 inc rbx
14591d75a 48899e28060000 mov qword ptr [rsi + 0x628], rbx
14591d761 ff8648050000 inc dword ptr [rsi + 0x548]
14591d767 488d1d49cb9001 lea rbx, [rip + 0x190cb49]
14591d76e 41be07000000 mov r14d, 7
14591d774 ba07000000 mov edx, 7
14591d779 4889d9 mov rcx, rbx
14591d77c e87fedfcff call 0x1458ec500
14591d781 4885c0 test rax, rax
14591d784 480f45d8 cmovne rbx, rax
14591d788 4c0f45f2 cmovne r14, rdx
14591d78c 4c8d3d2bcb9001 lea r15, [rip + 0x190cb2b]
14591d793 41bc1b000000 mov r12d, 0x1b
14591d799 ba1b000000 mov edx, 0x1b
14591d79e 4c89f9 mov rcx, r15
14591d7a1 e85aedfcff call 0x1458ec500
14591d7a6 4885c0 test rax, rax
14591d7a9 4c0f45f8 cmovne r15, rax
14591d7ad 490f44d4 cmove rdx, r12
14591d7b1 4889542420 mov qword ptr [rsp + 0x20], rdx
14591d7b6 488d4dd8 lea rcx, [rbp - 0x28]
14591d7ba 4889da mov rdx, rbx
14591d7bd 4d89f0 mov r8, r14
14591d7c0 4d89f9 mov r9, r15
14591d7c3 e8983afaff call 0x1458c1260
14591d7c8 488b9e28060000 mov rbx, qword ptr [rsi + 0x628]
14591d7cf 483b9e18060000 cmp rbx, qword ptr [rsi + 0x618]
14591d7d6 7509 jne 0x14591d7e1
14591d7d8 4889f9 mov rcx, rdi
14591d7db e830d62d00 call 0x145bfae10
14591d7e0 90 nop
14591d7e1 488b8620060000 mov rax, qword ptr [rsi + 0x620]
14591d7e8 4889d9 mov rcx, rbx
14591d7eb 48c1e105 shl rcx, 5
14591d7ef 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14591d7f3 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14591d7f7 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14591d7fc 0f110408 movups xmmword ptr [rax + rcx], xmm0
14591d800 48ffc3 inc rbx
14591d803 48899e28060000 mov qword ptr [rsi + 0x628], rbx
14591d80a 4883c450 add rsp, 0x50
14591d80e 5b pop rbx
14591d80f 5f pop rdi
14591d810 5e pop rsi
14591d811 415c pop r12
14591d813 415e pop r14
14591d815 415f pop r15
14591d817 5d pop rbp
14591d818 c3 ret
