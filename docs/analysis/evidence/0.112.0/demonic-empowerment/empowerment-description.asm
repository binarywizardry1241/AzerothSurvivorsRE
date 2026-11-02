14597c3f8 f3440f10476c movss xmm8, dword ptr [rdi + 0x6c]
14597c3fe 4c8d3da6885c01 lea r15, [rip + 0x15c88a6]
14597c405 ba6f000000 mov edx, 0x6f
14597c40a 4c89f9 mov rcx, r15
14597c40d e8be190100 call 0x14598ddd0
14597c412 90 nop
14597c413 4889c6 mov rsi, rax
14597c416 4889d3 mov rbx, rdx
14597c419 f3410f10442440 movss xmm0, dword ptr [r12 + 0x40]
14597c420 f30f5805380e4300 addss xmm0, dword ptr [rip + 0x430e38]
14597c428 f3410f59f8 mulss xmm7, xmm8
14597c42d f30f59c7 mulss xmm0, xmm7
14597c431 f30f59054f104300 mulss xmm0, dword ptr [rip + 0x43104f]
14597c439 f30f1185c0010000 movss dword ptr [rbp + 0x1c0], xmm0
14597c441 488d85c0010000 lea rax, [rbp + 0x1c0]
14597c448 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14597c44f 488d058a1a2700 lea rax, [rip + 0x271a8a]
14597c456 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14597c45d 488d1549815c01 lea rdx, [rip + 0x15c8149]
14597c464 4c8da5e0010000 lea r12, [rbp + 0x1e0]
14597c46b 4c8d85b0000000 lea r8, [rbp + 0xb0]
14597c472 4c89e1 mov rcx, r12
14597c475 e8b60c2600 call 0x145bdd130
14597c47a 90 nop
14597c47b 4885f6 test rsi, rsi
14597c47e b86f000000 mov eax, 0x6f
14597c483 480f44d8 cmove rbx, rax
14597c487 4c0f45fe cmovne r15, rsi
14597c48b 488d0584835c01 lea rax, [rip + 0x15c8384]
14597c492 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14597c499 48c785b800000001000000 mov qword ptr [rbp + 0xb8], 1
14597c4a4 4c89a5c0000000 mov qword ptr [rbp + 0xc0], r12
14597c4ab 488d0d8e062901 lea rcx, [rip + 0x129068e]
14597c4b2 48898dc8000000 mov qword ptr [rbp + 0xc8], rcx
14597c4b9 488d05b57c5c01 lea rax, [rip + 0x15c7cb5]
14597c4c0 488985d0000000 mov qword ptr [rbp + 0xd0], rax
14597c4c7 48c785d800000003000000 mov qword ptr [rbp + 0xd8], 3
14597c4d2 4c89b5e0000000 mov qword ptr [rbp + 0xe0], r14
14597c4d9 48898de8000000 mov qword ptr [rbp + 0xe8], rcx
14597c4e0 48c744242002000000 mov qword ptr [rsp + 0x20], 2
14597c4e9 488d8d90000000 lea rcx, [rbp + 0x90]
14597c4f0 4c8d8db0000000 lea r9, [rbp + 0xb0]
14597c4f7 4c89fa mov rdx, r15
14597c4fa 4989d8 mov r8, rbx
14597c4fd e87e1c0100 call 0x14598e180
14597c502 90 nop
