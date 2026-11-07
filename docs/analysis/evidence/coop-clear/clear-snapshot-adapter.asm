0000000145c27846 4889ce                         mov rsi, rcx
0000000145c27849 488d8db8000000                 lea rcx, [rbp + 0xb8]
0000000145c27850 4889f2                         mov rdx, rsi
0000000145c27853 e8b8f7ffff                     call 0x145c27010
0000000145c27858 4883bdb8000000ff               cmp qword ptr [rbp + 0xb8], -1
0000000145c27860 7442                           je 0x145c278a4
0000000145c27862 488d4db8                       lea rcx, [rbp - 0x48]
0000000145c27866 488d95b8000000                 lea rdx, [rbp + 0xb8]
0000000145c2786d 41b8c8000000                   mov r8d, 0xc8
0000000145c27873 e8d3d73d00                     call 0x14600504b
