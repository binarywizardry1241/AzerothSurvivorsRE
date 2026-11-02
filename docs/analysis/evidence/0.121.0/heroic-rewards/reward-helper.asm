0000000145ac0330 8d41fa                         lea eax, [rcx - 6]
0000000145ac0333 3cfb                           cmp al, 0xfb
0000000145ac0335 0f92c2                         setb dl
0000000145ac0338 0fb6c1                         movzx eax, cl
0000000145ac033b 488d0c40                       lea rcx, [rax + rax*2]
0000000145ac033f c1e104                         shl ecx, 4
0000000145ac0342 488d05979f5001                 lea rax, [rip + 0x1509f97]
0000000145ac0349 4801c8                         add rax, rcx
0000000145ac034c 4883f830                       cmp rax, 0x30
0000000145ac0350 0f94c1                         sete cl
0000000145ac0353 08d1                           or cl, dl
0000000145ac0355 7409                           je 0x145ac0360
0000000145ac0357 f30f1005417e6d00               movss xmm0, dword ptr [rip + 0x6d7e41]
0000000145ac035f c3                             ret
0000000145ac0360 f30f1040fc                     movss xmm0, dword ptr [rax - 4]
0000000145ac0365 c3                             ret
