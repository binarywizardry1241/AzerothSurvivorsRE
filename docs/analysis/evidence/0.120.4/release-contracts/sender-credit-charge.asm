0000000145c62314 4839d0                         cmp rax, rdx
0000000145c62317 7315                           jae 0x145c6232e
0000000145c62319 0f57c9                         xorps xmm1, xmm1
0000000145c6231c f2480f2a4918                   cvtsi2sd xmm1, qword ptr [rcx + 0x18]
0000000145c62322 f20f5cc1                       subsd xmm0, xmm1
0000000145c62326 f20f118650010000               movsd qword ptr [rsi + 0x150], xmm0
