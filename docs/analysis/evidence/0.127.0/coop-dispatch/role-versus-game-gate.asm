0000000145bb4ad0 488bbd800d0000                 mov rdi, qword ptr [rbp + 0xd80]
0000000145bb4ad7 488b87980d0000                 mov rax, qword ptr [rdi + 0xd98]
0000000145bb4ade 4889c1                         mov rcx, rax
0000000145bb4ae1 4883e902                       sub rcx, 2
0000000145bb4ae5 41be02000000                   mov r14d, 2
0000000145bb4aeb 490f42ce                       cmovb rcx, r14
0000000145bb4aef 4885c9                         test rcx, rcx
0000000145bb4af2 0f84380d0000                   je 0x145bb5830
0000000145bb4af8 4883f901                       cmp rcx, 1
0000000145bb4afc 0f853a030000                   jne 0x145bb4e3c
0000000145bb4b02 4c8bbd800d0000                 mov r15, qword ptr [rbp + 0xd80]
0000000145bb4b09 f2410f11b7280e0000             movsd qword ptr [r15 + 0xe28], xmm6
0000000145bb4b12 498b8f180e0000                 mov rcx, qword ptr [r15 + 0xe18]
0000000145bb4b19 498b87200e0000                 mov rax, qword ptr [r15 + 0xe20]
0000000145bb4b20 ff5018                         call qword ptr [rax + 0x18]
0000000145bb4b23 4885c0                         test rax, rax
