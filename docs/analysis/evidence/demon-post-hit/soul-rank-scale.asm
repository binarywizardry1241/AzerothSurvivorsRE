14599dd24 f30f58153c364100 addss xmm2, dword ptr [rip + 0x41363c]
14599dd2c f30f591530f54000 mulss xmm2, dword ptr [rip + 0x40f530]
14599dd34 f30f100524f54000 movss xmm0, dword ptr [rip + 0x40f524]
14599dd3c f30f58d0 addss xmm2, xmm0
14599dd40 f30f5fd0 maxss xmm2, xmm0
14599dd44 f30f595204 mulss xmm2, dword ptr [rdx + 4]
14599dd49 f30f115004 movss dword ptr [rax + 4], xmm2
14599dd4e c60023 mov byte ptr [rax], 0x23
