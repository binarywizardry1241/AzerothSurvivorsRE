14028b9f6 83791801 cmp dword ptr [rcx + 0x18], 1
14028b9fa 7552 jne 0x14028ba4e
14028b9fc 0f28c8 movaps xmm1, xmm0
14028b9ff f30f5c491c subss xmm1, dword ptr [rcx + 0x1c]
14028ba04 0f2ef1 ucomiss xmm6, xmm1
14028ba07 0f87d7faffff ja 0x14028b4e4
14028ba0d 0f2ef9 ucomiss xmm7, xmm1
14028ba10 763c jbe 0x14028ba4e
