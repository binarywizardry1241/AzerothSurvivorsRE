0000000145b1bf91  488b9e58120000         mov rbx, qword ptr [rsi + 0x1258]
0000000145b1bf98  488b8690110000         mov rax, qword ptr [rsi + 0x1190]
0000000145b1bf9f  4c8bb698110000         mov r14, qword ptr [rsi + 0x1198]
0000000145b1bfa6  4a8d0cf500000000       lea rcx, [r14*8]
0000000145b1bfae  31d2                   xor edx, edx
0000000145b1bfb0  4839d1                 cmp rcx, rdx
0000000145b1bfb3  0f84ec020000           je 0x145b1c2a5
0000000145b1bfb9  4c8d4208               lea r8, [rdx + 8]
0000000145b1bfbd  381c10                 cmp byte ptr [rax + rdx], bl
0000000145b1bfc0  4c89c2                 mov rdx, r8
0000000145b1bfc3  75eb                   jne 0x145b1bfb0
0000000145b1bfc5  4a895c00f8             mov qword ptr [rax + r8 - 8], rbx
0000000145b1bfca  e901030000             jmp 0x145b1c2d0
