0000000145b1b76c  48899580260000         mov qword ptr [rbp + 0x2680], rdx
0000000145b1b773  8b02                   mov eax, dword ptr [rdx]
0000000145b1b775  83e802                 sub eax, 2
0000000145b1b778  ba0b000000             mov edx, 0xb
0000000145b1b77d  0f43d0                 cmovae edx, eax
0000000145b1b780  4889ce                 mov rsi, rcx
0000000145b1b783  488d0532024a01         lea rax, [rip + 0x14a0232]
0000000145b1b78a  48899568260000         mov qword ptr [rbp + 0x2668], rdx
0000000145b1b791  48630c90               movsxd rcx, dword ptr [rax + rdx*4]
0000000145b1b795  4801c1                 add rcx, rax
0000000145b1b798  ffe1                   jmp rcx
