1402139eb 0f28c1 movaps xmm0, xmm1
1402139ee f30f5cc3 subss xmm0, xmm3
1402139f2 f30f5e0566e4cd05 divss xmm0, dword ptr [rip + 0x5cde466]
1402139fa 488b842498010000 mov rax, qword ptr [rsp + 0x198]
140213a02 4889442440 mov qword ptr [rsp + 0x40], rax
140213a07 f30f58cb addss xmm1, xmm3
140213a0b f30f590df5eac805 mulss xmm1, dword ptr [rip + 0x5c8eaf5]
140213a13 f30f101d49e4cd05 movss xmm3, dword ptr [rip + 0x5cde449]
140213a1b f30f59d8 mulss xmm3, xmm0
140213a1f f30f102541e4cd05 movss xmm4, dword ptr [rip + 0x5cde441]
140213a27 f30f59e0 mulss xmm4, xmm0
