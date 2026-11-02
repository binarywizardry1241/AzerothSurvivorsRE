0000000145bd6fd3 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145bd6fdd 4c31e1                         xor rcx, r12
0000000145bd6fe0 4d85e4                         test r12, r12
0000000145bd6fe3 b803000000                     mov eax, 3
0000000145bd6fe8 480f48c1                       cmovs rax, rcx
0000000145bd6fec 4883f815                       cmp rax, 0x15
0000000145bd6ff0 488bb598060000                 mov rsi, qword ptr [rbp + 0x698]
0000000145bd6ff7 771a                           ja 0x145bd7013
0000000145bd6ff9 488d0d48ee4a01                 lea rcx, [rip + 0x14aee48]
0000000145bd7000 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bd7004 4801c8                         add rax, rcx
0000000145bd7007 ffe0                           jmp rax
0000000145bd7009 4889f1                         mov rcx, rsi
0000000145bd700c e89f47faff                     call 0x145b7b7b0
0000000145bd7011 eb57                           jmp 0x145bd706a
0000000145bd7013 4889f1                         mov rcx, rsi
0000000145bd7016 e8b535fdff                     call 0x145baa5d0
0000000145bd701b eb4d                           jmp 0x145bd706a
0000000145bd701d 488b7e08                       mov rdi, qword ptr [rsi + 8]
0000000145bd7021 4885ff                         test rdi, rdi
0000000145bd7024 7444                           je 0x145bd706a
0000000145bd7026 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145bd702a 41b801000000                   mov r8d, 1
0000000145bd7030 4889fa                         mov rdx, rdi
0000000145bd7033 eb30                           jmp 0x145bd7065
0000000145bd7035 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145bd7039 4885d2                         test rdx, rdx
0000000145bd703c 740f                           je 0x145bd704d
0000000145bd703e 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145bd7042 41b801000000                   mov r8d, 1
0000000145bd7048 e883b142fa                     call 0x1400021d0
0000000145bd704d 4084ff                         test dil, dil
0000000145bd7050 7418                           je 0x145bd706a
0000000145bd7052 488b5620                       mov rdx, qword ptr [rsi + 0x20]
0000000145bd7056 4885d2                         test rdx, rdx
0000000145bd7059 740f                           je 0x145bd706a
0000000145bd705b 488b4e28                       mov rcx, qword ptr [rsi + 0x28]
0000000145bd705f 41b801000000                   mov r8d, 1
0000000145bd7065 e866b142fa                     call 0x1400021d0
0000000145bd706a 0f28b5b0060000                 movaps xmm6, xmmword ptr [rbp + 0x6b0]
0000000145bd7071 4881c448070000                 add rsp, 0x748
0000000145bd7078 5b                             pop rbx
0000000145bd7079 5f                             pop rdi
0000000145bd707a 5e                             pop rsi
0000000145bd707b 415c                           pop r12
0000000145bd707d 415d                           pop r13
0000000145bd707f 415e                           pop r14
0000000145bd7081 415f                           pop r15
0000000145bd7083 5d                             pop rbp
0000000145bd7084 c3                             ret 
