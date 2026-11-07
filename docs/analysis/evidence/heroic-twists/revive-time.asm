0000000145bbc30d 31c9                           xor ecx, ecx
0000000145bbc30f 80be6f03000005                 cmp byte ptr [rsi + 0x36f], 5
0000000145bbc316 0f93c1                         setae cl
0000000145bbc319 488d15e0217501                 lea rdx, [rip + 0x17521e0]
0000000145bbc320 f30f100c8a                     movss xmm1, dword ptr [rdx + rcx*4]
0000000145bbc325 0f2ec1                         ucomiss xmm0, xmm1
0000000145bbc328 0f83c7010000                   jae 0x145bbc4f5
0000000145bbc32e f30f5ec1                       divss xmm0, xmm1
0000000145bbc332 0f57c9                         xorps xmm1, xmm1
0000000145bbc335 f30f5fc8                       maxss xmm1, xmm0
0000000145bbc339 f30f10355fbe5d00               movss xmm6, dword ptr [rip + 0x5dbe5f]
0000000145bbc341 f30f5df1                       minss xmm6, xmm1
