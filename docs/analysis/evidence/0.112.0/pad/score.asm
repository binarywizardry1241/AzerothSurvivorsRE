1401c2e0e: f20f106108 movsd xmm4, qword ptr [rcx + 8]
1401c2e13: f20f105910 movsd xmm3, qword ptr [rcx + 0x10]
1401c2e18: 0f58dc addps xmm3, xmm4
1401c2e1b: 410f59d8 mulps xmm3, xmm8
1401c2e1f: 0f5cd9 subps xmm3, xmm1
1401c2e22: 0f28e8 movaps xmm5, xmm0
1401c2e25: 0f59eb mulps xmm5, xmm3
1401c2e28: f30f16e5 movshdup xmm4, xmm5
1401c2e2c: 0f58e5 addps xmm4, xmm5
1401c2e2f: 0f2ee2 ucomiss xmm4, xmm2
1401c2e32: 76bc jbe 0x1401c2df0
1401c2e34: f30f12ec movsldup xmm5, xmm4
1401c2e38: 0f59e8 mulps xmm5, xmm0
1401c2e3b: 0f5cdd subps xmm3, xmm5
1401c2e3e: 0f59db mulps xmm3, xmm3
1401c2e41: f30f16eb movshdup xmm5, xmm3
1401c2e45: f30f58eb addss xmm5, xmm3
1401c2e49: 0f57db xorps xmm3, xmm3
1401c2e4c: f30f51dd sqrtss xmm3, xmm5
1401c2e50: f30f58db addss xmm3, xmm3
1401c2e54: f30f58dc addss xmm3, xmm4
1401c2e58: 4989c8 mov r8, rcx
1401c2e5b: 4883c118 add rcx, 0x18
1401c2e5f: 4883c0e8 add rax, -0x18
1401c2e63: 4d85c0 test r8, r8
1401c2e66: 7498 je 0x1401c2e00
