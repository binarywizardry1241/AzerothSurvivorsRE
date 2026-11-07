14028d169 f30f593513fdb305 mulss xmm6, dword ptr [rip + 0x5b3fd13]
14028d171 f30f5835c35cb405 addss xmm6, dword ptr [rip + 0x5b45cc3]
14028d179 0f28bdd0000000 movaps xmm7, xmmword ptr [rbp + 0xd0]
14028d180 f30f1003 movss xmm0, dword ptr [rbx]
14028d184 f30f59056450b505 mulss xmm0, dword ptr [rip + 0x5b55064]
14028d18c f30f58c6 addss xmm0, xmm6
14028d190 0f100d0d44b605 movups xmm1, xmmword ptr [rip + 0x5b6440d]
14028d197 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
14028d19b f30f1145c0 movss dword ptr [rbp - 0x40], xmm0
