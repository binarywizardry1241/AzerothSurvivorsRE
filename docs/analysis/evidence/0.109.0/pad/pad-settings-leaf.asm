14458d640: 4889c8 mov rax, rcx
14458d643: 0f280556c03a02 movaps xmm0, xmmword ptr [rip + 0x23ac056]
14458d64a: 0f114160 movups xmmword ptr [rcx + 0x60], xmm0
14458d64e: 0f28055bc03a02 movaps xmm0, xmmword ptr [rip + 0x23ac05b]
14458d655: 0f114170 movups xmmword ptr [rcx + 0x70], xmm0
14458d659: f20f10055fc03a02 movsd xmm0, qword ptr [rip + 0x23ac05f]
14458d661: f20f118180000000 movsd qword ptr [rcx + 0x80], xmm0
14458d669: 0f100590e53a02 movups xmm0, xmmword ptr [rip + 0x23ae590]
14458d670: 0f1101 movups xmmword ptr [rcx], xmm0
14458d673: 0f100d96e53a02 movups xmm1, xmmword ptr [rip + 0x23ae596]
14458d67a: 0f114910 movups xmmword ptr [rcx + 0x10], xmm1
14458d67e: 0f114120 movups xmmword ptr [rcx + 0x20], xmm0
14458d682: 0f114930 movups xmmword ptr [rcx + 0x30], xmm1
14458d686: 0f114140 movups xmmword ptr [rcx + 0x40], xmm0
14458d68a: 0f114950 movups xmmword ptr [rcx + 0x50], xmm1
14458d68e: c3 ret
