0000000145aab4a0  55                     push rbp
0000000145aab4a1  4156                   push r14
0000000145aab4a3  56                     push rsi
0000000145aab4a4  57                     push rdi
0000000145aab4a5  53                     push rbx
0000000145aab4a6  4883ec60               sub rsp, 0x60
0000000145aab4aa  488d6c2460             lea rbp, [rsp + 0x60]
0000000145aab4af  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145aab4b7  4889cf                 mov rdi, rcx
0000000145aab4ba  488d4130               lea rax, [rcx + 0x30]
0000000145aab4be  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145aab4c2  488d0517d54c00         lea rax, [rip + 0x4cd517]
0000000145aab4c9  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145aab4cd  488d156cd18101         lea rdx, [rip + 0x181d16c]
0000000145aab4d4  488d4dd8               lea rcx, [rbp - 0x28]
0000000145aab4d8  4c8d45c8               lea r8, [rbp - 0x38]
0000000145aab4dc  e84fba4b00             call 0x145f66f30
0000000145aab4e1  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145aab4e5  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145aab4e9  488b37                 mov rsi, qword ptr [rdi]
0000000145aab4ec  488b5f08               mov rbx, qword ptr [rdi + 8]
0000000145aab4f0  48894df0               mov qword ptr [rbp - 0x10], rcx
0000000145aab4f4  e8b7e50700             call 0x145b29ab0
0000000145aab4f9  90                     nop
0000000145aab4fa  4889c7                 mov rdi, rax
0000000145aab4fd  488b45d8               mov rax, qword ptr [rbp - 0x28]
0000000145aab501  4885c0                 test rax, rax
0000000145aab504  7418                   je 0x145aab51e
0000000145aab506  41b801000000           mov r8d, 1
0000000145aab50c  488b4df0               mov rcx, qword ptr [rbp - 0x10]
0000000145aab510  4989d6                 mov r14, rdx
0000000145aab513  4889c2                 mov rdx, rax
0000000145aab516  e8b56c55fa             call 0x1400021d0
0000000145aab51b  4c89f2                 mov rdx, r14
0000000145aab51e  4885ff                 test rdi, rdi
0000000145aab521  480f45f7               cmovne rsi, rdi
0000000145aab525  480f44d3               cmove rdx, rbx
0000000145aab529  4889f0                 mov rax, rsi
0000000145aab52c  4883c460               add rsp, 0x60
0000000145aab530  5b                     pop rbx
0000000145aab531  5f                     pop rdi
0000000145aab532  5e                     pop rsi
0000000145aab533  415e                   pop r14
0000000145aab535  5d                     pop rbp
0000000145aab536  c3                     ret
