14594fdaa: 83f803 cmp eax, 3
14594fdad: 0f85a3020000 jne 0x145950056
14594fdb3: b001 mov al, 1
14594fdb5: 41807d7d00 cmp byte ptr [r13 + 0x7d], 0
14594fdba: 741a je 0x14594fdd6
14594fdbc: f3410f10451c movss xmm0, dword ptr [r13 + 0x1c]
14594fdc2: f30f5985d8010000 mulss xmm0, dword ptr [rbp + 0x1d8]
14594fdca: f3410f58454c addss xmm0, dword ptr [r13 + 0x4c]
14594fdd0: f3410f11454c movss dword ptr [r13 + 0x4c], xmm0
