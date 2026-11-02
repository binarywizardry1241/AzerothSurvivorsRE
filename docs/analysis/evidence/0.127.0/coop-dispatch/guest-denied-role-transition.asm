0000000145bd83e2 488b8560050000                 mov rax, qword ptr [rbp + 0x560]
0000000145bd83e9 488b4808                       mov rcx, qword ptr [rax + 8]
0000000145bd83ed 48898d68050000                 mov qword ptr [rbp + 0x568], rcx
0000000145bd83f4 488b4810                       mov rcx, qword ptr [rax + 0x10]
0000000145bd83f8 48898d78050000                 mov qword ptr [rbp + 0x578], rcx
0000000145bd83ff 488b7818                       mov rdi, qword ptr [rax + 0x18]
0000000145bd8403 488d96980d0000                 lea rdx, [rsi + 0xd98]
0000000145bd840a 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145bd840e 41b828040000                   mov r8d, 0x428
0000000145bd8414 e802934800                     call 0x14606171b
0000000145bd8419 48c786980d000002000000         mov qword ptr [rsi + 0xd98], 2
0000000145bd8424 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145bd8428 4883f801                       cmp rax, 1
0000000145bd842c 0f873b0c0000                   ja 0x145bd906d
0000000145bd8432 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000145bd8439 488b85b0030000                 mov rax, qword ptr [rbp + 0x3b0]
0000000145bd8440 ff5030                         call qword ptr [rax + 0x30]
0000000145bd8443 90                             nop 
0000000145bd8444 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145bd8448 e8632cfdff                     call 0x145bab0b0
0000000145bd844d 90                             nop 
0000000145bd844e e9290c0000                     jmp 0x145bd907c
