0000000145c1609b 0fb64675                       movzx eax, byte ptr [rsi + 0x75]
0000000145c1609f 83f80b                         cmp eax, 0xb
0000000145c160a2 770e                           ja 0x145c160b2
0000000145c160a4 b90c0d0000                     mov ecx, 0xd0c
0000000145c160a9 0fa3c1                         bt ecx, eax
0000000145c160ac 0f82f4390000                   jb 0x145c19aa6
0000000145c160b2 f3410f10441c84                 movss xmm0, dword ptr [r12 + rbx - 0x7c]
0000000145c160b9 f30f5e05ff245800               divss xmm0, dword ptr [rip + 0x5824ff]
0000000145c160c1 410f28c8                       movaps xmm1, xmm8
0000000145c160c5 f30f5dc8                       minss xmm1, xmm0
0000000145c160c9 0f28c1                         movaps xmm0, xmm1
0000000145c160cc f30fc2c103                     cmpunordss xmm0, xmm1
0000000145c160d1 0f28d0                         movaps xmm2, xmm0
0000000145c160d4 0f55d1                         andnps xmm2, xmm1
0000000145c160d7 410f54c0                       andps xmm0, xmm8
0000000145c160db 0f56c2                         orps xmm0, xmm2
0000000145c160de 0f57c9                         xorps xmm1, xmm1
0000000145c160e1 0f2ec1                         ucomiss xmm0, xmm1
0000000145c160e4 7506                           jne 0x145c160ec
0000000145c160e6 0f8bba390000                   jnp 0x145c19aa6
0000000145c160ec 440f28c0                       movaps xmm8, xmm0
0000000145c160f0 4c8b9d28010000                 mov r11, qword ptr [rbp + 0x128]
