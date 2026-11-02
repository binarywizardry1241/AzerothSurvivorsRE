144598df0: 4889c8 mov rax, rcx
144598df3: 0f2805a6223b02 movaps xmm0, xmmword ptr [rip + 0x23b22a6]
144598dfa: 0f114160 movups xmmword ptr [rcx + 0x60], xmm0
144598dfe: 0f2805ab223b02 movaps xmm0, xmmword ptr [rip + 0x23b22ab]
144598e05: 0f114170 movups xmmword ptr [rcx + 0x70], xmm0
144598e09: f20f1005af223b02 movsd xmm0, qword ptr [rip + 0x23b22af]
144598e11: f20f118180000000 movsd qword ptr [rcx + 0x80], xmm0
144598e19: 0f1005e0473b02 movups xmm0, xmmword ptr [rip + 0x23b47e0]
144598e20: 0f1101 movups xmmword ptr [rcx], xmm0
144598e23: 0f100de6473b02 movups xmm1, xmmword ptr [rip + 0x23b47e6]
144598e2a: 0f114910 movups xmmword ptr [rcx + 0x10], xmm1
144598e2e: 0f114120 movups xmmword ptr [rcx + 0x20], xmm0
144598e32: 0f114930 movups xmmword ptr [rcx + 0x30], xmm1
144598e36: 0f114140 movups xmmword ptr [rcx + 0x40], xmm0
144598e3a: 0f114950 movups xmmword ptr [rcx + 0x50], xmm1
144598e3e: c3 ret
