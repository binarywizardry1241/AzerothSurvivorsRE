14597a491: 49837e18ff cmp qword ptr [r14 + 0x18], -1
14597a496: 0f84e5050000 je 0x14597aa81
14597a49c: f3410f108658010000 movss xmm0, dword ptr [r14 + 0x158]
14597a4a5: f3410f108e5c010000 movss xmm1, dword ptr [r14 + 0x15c]
14597a4ae: 0f28d1 movaps xmm2, xmm1
14597a4b1: f30f5915377d4600 mulss xmm2, dword ptr [rip + 0x467d37]
14597a4b9: 41807e5000 cmp byte ptr [r14 + 0x50], 0
14597a4be: 750a jne 0x14597a4ca
14597a4c0: 0f2ed0 ucomiss xmm2, xmm0
14597a4c3: 7605 jbe 0x14597a4ca
14597a4c5: 41c6465001 mov byte ptr [r14 + 0x50], 1
