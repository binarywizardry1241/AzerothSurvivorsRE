0000000145bed763 0f57c0                         xorps xmm0, xmm0
0000000145bed766 f30f108da8010000               movss xmm1, dword ptr [rbp + 0x1a8]
0000000145bed76e 0f2ec8                         ucomiss xmm1, xmm0
0000000145bed771 0f86e5000000                   jbe 0x145bed85c
0000000145bed777 488b8d38020000                 mov rcx, qword ptr [rbp + 0x238]
0000000145bed77e 0fb6816f030000                 movzx eax, byte ptr [rcx + 0x36f]
0000000145bed785 3c04                           cmp al, 4
0000000145bed787 0f92c2                         setb dl
0000000145bed78a 84911c0d0000                   test byte ptr [rcx + 0xd1c], dl
0000000145bed790 4c8b8580020000                 mov r8, qword ptr [rbp + 0x280]
0000000145bed797 4c8b8d68020000                 mov r9, qword ptr [rbp + 0x268]
0000000145bed79e 4c8b9570020000                 mov r10, qword ptr [rbp + 0x270]
0000000145bed7a5 4c8b9d78020000                 mov r11, qword ptr [rbp + 0x278]
0000000145bed7ac 7529                           jne 0x145bed7d7
0000000145bed7ae 84c0                           test al, al
0000000145bed7b0 7415                           je 0x145bed7c7
0000000145bed7b2 31d2                           xor edx, edx
0000000145bed7b4 3c04                           cmp al, 4
0000000145bed7b6 0f93c2                         setae dl
0000000145bed7b9 488d05a01daa01                 lea rax, [rip + 0x1aa1da0]
0000000145bed7c0 f30f100490                     movss xmm0, dword ptr [rax + rdx*4]
0000000145bed7c5 eb08                           jmp 0x145bed7cf
0000000145bed7c7 f30f1005d5b15a00               movss xmm0, dword ptr [rip + 0x5ab1d5]
0000000145bed7cf f30f118500010000               movss dword ptr [rbp + 0x100], xmm0
0000000145bed7d7 f30f108da8010000               movss xmm1, dword ptr [rbp + 0x1a8]
0000000145bed7df f30f598d00010000               mulss xmm1, dword ptr [rbp + 0x100]
