0000000145bc4f2d 31c0                           xor eax, eax
0000000145bc4f2f 80be6f03000005                 cmp byte ptr [rsi + 0x36f], 5
0000000145bc4f36 f30f10b6c8040000               movss xmm6, dword ptr [rsi + 0x4c8]
0000000145bc4f3e 0f93c0                         setae al
0000000145bc4f41 488d0db8a4ac01                 lea rcx, [rip + 0x1aca4b8]
0000000145bc4f48 f30f100481                     movss xmm0, dword ptr [rcx + rax*4]
0000000145bc4f4d f30f59c6                       mulss xmm0, xmm6
0000000145bc4f51 f30f118638050000               movss dword ptr [rsi + 0x538], xmm0
