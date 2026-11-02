; 0.120.2 SHA256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
0000000145b08856 488b85800c0000                 mov rax, qword ptr [rbp + 0xc80]
0000000145b0885d 488b88f00c0000                 mov rcx, qword ptr [rax + 0xcf0]
0000000145b08864 488b80f80c0000                 mov rax, qword ptr [rax + 0xcf8]
0000000145b0886b 488d34c0                       lea rsi, [rax + rax*8]
0000000145b0886f 48c1e607                       shl rsi, 7
0000000145b08873 4801ce                         add rsi, rcx
0000000145b08876 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b08880 4889cf                         mov rdi, rcx
0000000145b08883 4839f1                         cmp rcx, rsi
0000000145b08886 744b                           je 0x145b088d3
0000000145b08888 488b8f68040000                 mov rcx, qword ptr [rdi + 0x468]
0000000145b0888f 488b8770040000                 mov rax, qword ptr [rdi + 0x470]
0000000145b08896 488b4040                       mov rax, qword ptr [rax + 0x40]
0000000145b0889a c6855f0c000001                 mov byte ptr [rbp + 0xc5f], 1
0000000145b088a1 ffd0                           call rax
0000000145b088a3 90                             nop
0000000145b088a4 488d8f80040000                 lea rcx, [rdi + 0x480]
0000000145b088ab 84c0                           test al, al
0000000145b088ad 74d1                           je 0x145b08880
0000000145b088af 488b85800c0000                 mov rax, qword ptr [rbp + 0xc80]
0000000145b088b6 80b8380d000000                 cmp byte ptr [rax + 0xd38], 0
0000000145b088bd 0f85ec000000                   jne 0x145b089af
0000000145b088c3 488b85800c0000                 mov rax, qword ptr [rbp + 0xc80]
0000000145b088ca 488d98380d0000                 lea rbx, [rax + 0xd38]
0000000145b088d1 eb6d                           jmp 0x145b08940
0000000145b088d3 488b85800c0000                 mov rax, qword ptr [rbp + 0xc80]
0000000145b088da 80b8380d000000                 cmp byte ptr [rax + 0xd38], 0
0000000145b088e1 0f84c8000000                   je 0x145b089af
0000000145b088e7 488b85800c0000                 mov rax, qword ptr [rbp + 0xc80]
0000000145b088ee 488d98380d0000                 lea rbx, [rax + 0xd38]
0000000145b088f5 4c8bb0f00c0000                 mov r14, qword ptr [rax + 0xcf0]
0000000145b088fc 488b80f80c0000                 mov rax, qword ptr [rax + 0xcf8]
0000000145b08903 4c8d3cc0                       lea r15, [rax + rax*8]
0000000145b08907 49c1e707                       shl r15, 7
0000000145b0890b 4d01f7                         add r15, r14
0000000145b0890e 6690                           nop
0000000145b08910 4d39fe                         cmp r14, r15
0000000145b08913 0f8496000000                   je 0x145b089af
0000000145b08919 498b8e68040000                 mov rcx, qword ptr [r14 + 0x468]
0000000145b08920 498b8670040000                 mov rax, qword ptr [r14 + 0x470]
0000000145b08927 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145b0892b c6855f0c000001                 mov byte ptr [rbp + 0xc5f], 1
0000000145b08932 ffd0                           call rax
0000000145b08934 90                             nop
0000000145b08935 4981c680040000                 add r14, 0x480
0000000145b0893c 84c0                           test al, al
0000000145b0893e 74d0                           je 0x145b08910
0000000145b08940 4839f7                         cmp rdi, rsi
0000000145b08943 0f9503                         setne byte ptr [rbx]
0000000145b08946 0f95c3                         setne bl
0000000145b08949 488bb5d00b0000                 mov rsi, qword ptr [rbp + 0xbd0]
0000000145b08950 483bb5c00b0000                 cmp rsi, qword ptr [rbp + 0xbc0]
0000000145b08957 7514                           jne 0x145b0896d
0000000145b08959 c6855f0c000001                 mov byte ptr [rbp + 0xc5f], 1
0000000145b08960 488d8dc00b0000                 lea rcx, [rbp + 0xbc0]
0000000145b08967 e874294a00                     call 0x145fab2e0
0000000145b0896c 90                             nop
0000000145b0896d 488b85c80b0000                 mov rax, qword ptr [rbp + 0xbc8]
0000000145b08974 488d0c76                       lea rcx, [rsi + rsi*2]
0000000145b08978 48c704c800000000               mov qword ptr [rax + rcx*8], 0
0000000145b08980 885cc810                       mov byte ptr [rax + rcx*8 + 0x10], bl
0000000145b08984 48ffc6                         inc rsi
0000000145b08987 4889b5d00b0000                 mov qword ptr [rbp + 0xbd0], rsi
0000000145b0898e 4885f6                         test rsi, rsi
0000000145b08991 7528                           jne 0x145b089bb
0000000145b08993 488b85c00b0000                 mov rax, qword ptr [rbp + 0xbc0]
0000000145b0899a 4885c0                         test rax, rax
0000000145b0899d 0f847b080000                   je 0x145b0921e
0000000145b089a3 488b8dc80b0000                 mov rcx, qword ptr [rbp + 0xbc8]
0000000145b089aa e9ea060000                     jmp 0x145b09099
0000000145b089af 488bb5d00b0000                 mov rsi, qword ptr [rbp + 0xbd0]
0000000145b089b6 4885f6                         test rsi, rsi
