0000000145b537ba 450f2ecc                       ucomiss xmm9, xmm12
0000000145b537be 0f82b6000000                   jb 0x145b5387a
0000000145b537c4 488b87b8050000                 mov rax, qword ptr [rdi + 0x5b8]
0000000145b537cb 488b8fc0050000                 mov rcx, qword ptr [rdi + 0x5c0]
0000000145b537d2 4c8d8820feffff                 lea r9, [rax - 0x1e0]
0000000145b537d9 4c69c1e0010000                 imul r8, rcx, 0x1e0
0000000145b537e0 4d85c0                         test r8, r8
0000000145b537e3 0f84a1000000                   je 0x145b5388a
0000000145b537e9 498d91e0010000                 lea rdx, [r9 + 0x1e0]
0000000145b537f0 4981c020feffff                 add r8, -0x1e0
0000000145b537f7 4d39a1d0020000                 cmp qword ptr [r9 + 0x2d0], r12
0000000145b537fe 4989d1                         mov r9, rdx
0000000145b53801 75dd                           jne 0x145b537e0
