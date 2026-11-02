1458ef670 55 push rbp
1458ef671 56 push rsi
1458ef672 57 push rdi
1458ef673 53 push rbx
1458ef674 4883ec78 sub rsp, 0x78
1458ef678 488d6c2470 lea rbp, [rsp + 0x70]
1458ef67d 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1458ef685 4889d7 mov rdi, rdx
1458ef688 4889cb mov rbx, rcx
1458ef68b 488d4dd0 lea rcx, [rbp - 0x30]
1458ef68f e8ccfdffff call 0x1458ef460
1458ef694 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458ef698 4883f8ff cmp rax, -1
1458ef69c 0f8401010000 je 0x1458ef7a3
1458ef6a2 488945f8 mov qword ptr [rbp - 8], rax
1458ef6a6 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458ef6aa 488b75e0 mov rsi, qword ptr [rbp - 0x20]
1458ef6ae 48894df0 mov qword ptr [rbp - 0x10], rcx
1458ef6b2 4889f2 mov rdx, rsi
1458ef6b5 e8b6772b00 call 0x145ba6e70
1458ef6ba 90 nop
1458ef6bb 4885c0 test rax, rax
1458ef6be 7440 je 0x1458ef700
1458ef6c0 4989d0 mov r8, rdx
1458ef6c3 c645d001 mov byte ptr [rbp - 0x30], 1
1458ef6c7 488d4dd0 lea rcx, [rbp - 0x30]
1458ef6cb 4889c2 mov rdx, rax
1458ef6ce e86dea2b00 call 0x145bae140
1458ef6d3 90 nop
1458ef6d4 4885c0 test rax, rax
1458ef6d7 7427 je 0x1458ef700
1458ef6d9 89c1 mov ecx, eax
1458ef6db 83e103 and ecx, 3
1458ef6de 8d51fe lea edx, [rcx - 2]
1458ef6e1 83fa02 cmp edx, 2
1458ef6e4 721a jb 0x1458ef700
1458ef6e6 4885c9 test rcx, rcx
1458ef6e9 7415 je 0x1458ef700
1458ef6eb 48ffc8 dec rax
1458ef6ee 488d4dd8 lea rcx, [rbp - 0x28]
1458ef6f2 488945d8 mov qword ptr [rbp - 0x28], rax
1458ef6f6 c645d003 mov byte ptr [rbp - 0x30], 3
1458ef6fa e8c1002f00 call 0x145bdf7c0
1458ef6ff 90 nop
1458ef700 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1458ef704 4889f2 mov rdx, rsi
1458ef707 4989d8 mov r8, rbx
1458ef70a 4989f9 mov r9, rdi
1458ef70d e83ee02c00 call 0x145bbd750
1458ef712 90 nop
1458ef713 4885c0 test rax, rax
1458ef716 7472 je 0x1458ef78a
1458ef718 488945c8 mov qword ptr [rbp - 0x38], rax
1458ef71c 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458ef720 488945b8 mov qword ptr [rbp - 0x48], rax
1458ef724 488975c0 mov qword ptr [rbp - 0x40], rsi
1458ef728 488d45b8 lea rax, [rbp - 0x48]
1458ef72c 488945d0 mov qword ptr [rbp - 0x30], rax
1458ef730 488d05a9052d00 lea rax, [rip + 0x2d05a9]
1458ef737 488945d8 mov qword ptr [rbp - 0x28], rax
1458ef73b 488d45c8 lea rax, [rbp - 0x38]
1458ef73f 488945e0 mov qword ptr [rbp - 0x20], rax
1458ef743 488d05a6e32e00 lea rax, [rip + 0x2ee3a6]
1458ef74a 488945e8 mov qword ptr [rbp - 0x18], rax
1458ef74e 488d0d4f325e01 lea rcx, [rip + 0x15e324f]
1458ef755 488d55d0 lea rdx, [rbp - 0x30]
1458ef759 e8326e2c00 call 0x145bb6590
1458ef75e 90 nop
1458ef75f 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458ef763 89c1 mov ecx, eax
1458ef765 83e103 and ecx, 3
1458ef768 8d51fe lea edx, [rcx - 2]
1458ef76b 83fa02 cmp edx, 2
1458ef76e 721a jb 0x1458ef78a
1458ef770 4885c9 test rcx, rcx
1458ef773 7415 je 0x1458ef78a
1458ef775 48ffc8 dec rax
1458ef778 488d4dd8 lea rcx, [rbp - 0x28]
1458ef77c 488945d8 mov qword ptr [rbp - 0x28], rax
1458ef780 c645d003 mov byte ptr [rbp - 0x30], 3
1458ef784 e837002f00 call 0x145bdf7c0
1458ef789 90 nop
1458ef78a 488b55f8 mov rdx, qword ptr [rbp - 8]
1458ef78e 4885d2 test rdx, rdx
1458ef791 7410 je 0x1458ef7a3
1458ef793 41b801000000 mov r8d, 1
1458ef799 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1458ef79d e82e2a71fa call 0x1400021d0
1458ef7a2 90 nop
1458ef7a3 4883c478 add rsp, 0x78
1458ef7a7 5b pop rbx
1458ef7a8 5f pop rdi
1458ef7a9 5e pop rsi
1458ef7aa 5d pop rbp
1458ef7ab c3 ret
