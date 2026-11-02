0000000145bd8728 488b86980d0000                 mov rax, qword ptr [rsi + 0xd98]
0000000145bd872f 83f801                         cmp eax, 1
0000000145bd8732 772b                           ja 0x145bd875f
0000000145bd8734 488dbeb0100000                 lea rdi, [rsi + 0x10b0]
0000000145bd873b 48c7869011000000000000         mov qword ptr [rsi + 0x1190], 0
0000000145bd8746 4883beb0100000ff               cmp qword ptr [rsi + 0x10b0], -1
0000000145bd874e 7408                           je 0x145bd8758
0000000145bd8750 4889f9                         mov rcx, rdi
0000000145bd8753 e8b8d1f6ff                     call 0x145b45910
0000000145bd8758 48c707ffffffff                 mov qword ptr [rdi], 0xffffffffffffffff
