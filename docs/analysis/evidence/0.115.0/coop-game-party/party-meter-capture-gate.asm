0x1458fa9b4: 4180bd410c000000         cmp byte ptr [r13 + 0xc41], 0
0x1458fa9bc: 0f846c050000             je 0x1458faf2e
0x1458fa9c2: f3410f10859c0b0000       movss xmm0, dword ptr [r13 + 0xb9c]
0x1458fa9cb: 0f28c8                   movaps xmm1, xmm0
0x1458fa9ce: f3410f5c8d200c0000       subss xmm1, dword ptr [r13 + 0xc20]
0x1458fa9d7: 0f2e0dd2545e00           ucomiss xmm1, dword ptr [rip + 0x5e54d2]
0x1458fa9de: 0f824a050000             jb 0x1458faf2e
0x1458fa9e4: f3410f1185200c0000       movss dword ptr [r13 + 0xc20], xmm0
