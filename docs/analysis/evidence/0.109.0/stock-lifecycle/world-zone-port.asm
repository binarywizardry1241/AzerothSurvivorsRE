0x1458ada80: 6681e9951f               sub cx, 0x1f95
0x1458ada85: b800000000               mov eax, 0
0x1458ada8a: 0f42c8                   cmovb ecx, eax
0x1458ada8d: 6683f90c                 cmp cx, 0xc
0x1458ada91: 0f43c8                   cmovae ecx, eax
0x1458ada94: 0fb7c1                   movzx eax, cx
0x1458ada97: 4869c0f0000000           imul rax, rax, 0xf0
0x1458ada9e: 488d0deb083301           lea rcx, [rip + 0x13308eb]
0x1458adaa5: 0f10440808               movups xmm0, xmmword ptr [rax + rcx + 8]
0x1458adaaa: 48899d08040000           mov qword ptr [rbp + 0x408], rbx
0x1458adab1: 4c89ad10040000           mov qword ptr [rbp + 0x410], r13
