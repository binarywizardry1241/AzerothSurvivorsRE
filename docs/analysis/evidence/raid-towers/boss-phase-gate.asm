14597a520: be01000000 mov esi, 1
14597a525: 89f9 mov ecx, edi
14597a527: d3e6 shl esi, cl
14597a529: 410fa3fa bt r10d, edi
14597a52d: 72e1 jb 0x14597a510
14597a52f: 4839d7 cmp rdi, rdx
14597a532: 0f83822d0000 jae 0x14597d2ba
14597a538: f3430f100c03 movss xmm1, dword ptr [r11 + r8]
14597a53e: 0f2ec8 ucomiss xmm1, xmm0
14597a541: 76cd jbe 0x14597a510
14597a543: 4409d6 or esi, r10d
14597a546: 4189764c mov dword ptr [r14 + 0x4c], esi
