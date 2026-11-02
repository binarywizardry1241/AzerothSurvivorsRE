0000000145c27846 0fb6866f030000                 movzx eax, byte ptr [rsi + 0x36f]
0000000145c2784d 8d48fa                         lea ecx, [rax - 6]
0000000145c27850 80f9fb                         cmp cl, 0xfb
0000000145c27853 0f92c1                         setb cl
0000000145c27856 488d0440                       lea rax, [rax + rax*2]
0000000145c2785a c1e004                         shl eax, 4
0000000145c2785d 4c8d257c2a3a01                 lea r12, [rip + 0x13a2a7c]
0000000145c27864 4901c4                         add r12, rax
0000000145c27867 4983fc30                       cmp r12, 0x30
0000000145c2786b 400f94c7                       sete dil
0000000145c2786f 4008cf                         or dil, cl
0000000145c27872 f30f102526095700               movss xmm4, dword ptr [rip + 0x570926]
0000000145c2787a 0f28cc                         movaps xmm1, xmm4
0000000145c2787d 7507                           jne 0x145c27886
0000000145c2787f f3410f104c24f0                 movss xmm1, dword ptr [r12 - 0x10]
