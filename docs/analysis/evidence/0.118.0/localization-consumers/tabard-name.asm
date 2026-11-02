0000000145aab420  55                     push rbp
0000000145aab421  4156                   push r14
0000000145aab423  56                     push rsi
0000000145aab424  57                     push rdi
0000000145aab425  53                     push rbx
0000000145aab426  4883ec60               sub rsp, 0x60
0000000145aab42a  488d6c2460             lea rbp, [rsp + 0x60]
0000000145aab42f  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145aab437  4889cf                 mov rdi, rcx
0000000145aab43a  488d4130               lea rax, [rcx + 0x30]
0000000145aab43e  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145aab442  488d0517d14c00         lea rax, [rip + 0x4cd117]
0000000145aab449  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145aab44d  488d156cd28101         lea rdx, [rip + 0x181d26c]
0000000145aab454  488d4dd8               lea rcx, [rbp - 0x28]
0000000145aab458  4c8d45c8               lea r8, [rbp - 0x38]
0000000145aab45c  e84fb64b00             call 0x145f66ab0
0000000145aab461  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145aab465  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145aab469  488b37                 mov rsi, qword ptr [rdi]
0000000145aab46c  488b5f08               mov rbx, qword ptr [rdi + 8]
0000000145aab470  48894df0               mov qword ptr [rbp - 0x10], rcx
0000000145aab474  e887e50700             call 0x145b29a00
0000000145aab479  90                     nop
0000000145aab47a  4889c7                 mov rdi, rax
0000000145aab47d  488b45d8               mov rax, qword ptr [rbp - 0x28]
0000000145aab481  4885c0                 test rax, rax
0000000145aab484  7418                   je 0x145aab49e
0000000145aab486  41b801000000           mov r8d, 1
0000000145aab48c  488b4df0               mov rcx, qword ptr [rbp - 0x10]
0000000145aab490  4989d6                 mov r14, rdx
0000000145aab493  4889c2                 mov rdx, rax
0000000145aab496  e8356d55fa             call 0x1400021d0
0000000145aab49b  4c89f2                 mov rdx, r14
0000000145aab49e  4885ff                 test rdi, rdi
0000000145aab4a1  480f45f7               cmovne rsi, rdi
0000000145aab4a5  480f44d3               cmove rdx, rbx
0000000145aab4a9  4889f0                 mov rax, rsi
0000000145aab4ac  4883c460               add rsp, 0x60
0000000145aab4b0  5b                     pop rbx
0000000145aab4b1  5f                     pop rdi
0000000145aab4b2  5e                     pop rsi
0000000145aab4b3  415e                   pop r14
0000000145aab4b5  5d                     pop rbp
0000000145aab4b6  c3                     ret
