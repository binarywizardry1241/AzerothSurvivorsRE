0000000145c1d57a 4488f7                         mov dil, r14b
0000000145c1d57d c1e702                         shl edi, 2
0000000145c1d580 488d05a921a701                 lea rax, [rip + 0x1a721a9]
0000000145c1d587 f30f100407                     movss xmm0, dword ptr [rdi + rax]
0000000145c1d58c f30f11859c000000               movss dword ptr [rbp + 0x9c], xmm0
0000000145c1d594 488d059d21a701                 lea rax, [rip + 0x1a7219d]
0000000145c1d59b f30f100407                     movss xmm0, dword ptr [rdi + rax]
0000000145c1d5a0 f30f118594000000               movss dword ptr [rbp + 0x94], xmm0
