145930334 f30f108680040000 movss xmm0, dword ptr [rsi + 0x480]
14593033c f30f59054c104800 mulss xmm0, dword ptr [rip + 0x48104c]
145930344 f30f108ea8010000 movss xmm1, dword ptr [rsi + 0x1a8]
14593034c 0f2ec8 ucomiss xmm1, xmm0
14593034f 7627 jbe 0x145930378
145930351 f30f5cc8 subss xmm1, xmm0
145930355 f30f1186a8010000 movss dword ptr [rsi + 0x1a8], xmm0
14593035d f30f1086ec040000 movss xmm0, dword ptr [rsi + 0x4ec]
145930365 f30f5cc1 subss xmm0, xmm1
145930369 0f57c9 xorps xmm1, xmm1
14593036c f30f5fc1 maxss xmm0, xmm1
145930370 f30f1186ec040000 movss dword ptr [rsi + 0x4ec], xmm0
