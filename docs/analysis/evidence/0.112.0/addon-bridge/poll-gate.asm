1458b0d97: 660f28c6 movapd xmm0, xmm6
1458b0d9b: f20f5c8610110000 subsd xmm0, qword ptr [rsi + 0x1110]
1458b0da3: 660f2e0505533501 ucomisd xmm0, qword ptr [rip + 0x1355305]
1458b0dab: 0f82c00e0000 jb 0x1458b1c71
1458b0db1: f20f11b610110000 movsd qword ptr [rsi + 0x1110], xmm6
1458b0db9: 837e1002 cmp dword ptr [rsi + 0x10], 2
1458b0dbd: 7470 je 0x1458b0e2f
