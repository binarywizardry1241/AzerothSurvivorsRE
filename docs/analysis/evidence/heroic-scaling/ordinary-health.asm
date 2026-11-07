0000000145c14eb3 8d47fa                         lea eax, [rdi - 6]
0000000145c14eb6 3cfb                           cmp al, 0xfb
0000000145c14eb8 0f92c0                         setb al
0000000145c14ebb 488d0c7f                       lea rcx, [rdi + rdi*2]
0000000145c14ebf c1e104                         shl ecx, 4
0000000145c14ec2 4c8d2517543b01                 lea r12, [rip + 0x13b5417]
0000000145c14ec9 4901cc                         add r12, rcx
0000000145c14ecc 4983fc30                       cmp r12, 0x30
0000000145c14ed0 410f94c5                       sete r13b
0000000145c14ed4 4108c5                         or r13b, al
0000000145c14ed7 7507                           jne 0x145c14ee0
0000000145c14ed9 f3410f597424f0                 mulss xmm6, dword ptr [r12 - 0x10]
