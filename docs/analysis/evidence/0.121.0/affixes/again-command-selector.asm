0000000145b2a453 8b02                           mov eax, dword ptr [rdx]
0000000145b2a455 83e802                         sub eax, 2
0000000145b2a458 ba0b000000                     mov edx, 0xb
0000000145b2a45d 0f43d0                         cmovae edx, eax
0000000145b2a460 4889ce                         mov rsi, rcx
0000000145b2a463 488d0586b6b301                 lea rax, [rip + 0x1b3b686]
0000000145b2a46a 48899568280000                 mov qword ptr [rbp + 0x2868], rdx
0000000145b2a471 48630c90                       movsxd rcx, dword ptr [rax + rdx*4]
0000000145b2a475 4801c1                         add rcx, rax
0000000145b2a478 ffe1                           jmp rcx
