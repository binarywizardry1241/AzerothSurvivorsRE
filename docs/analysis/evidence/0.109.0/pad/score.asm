1401c4b5e: f20f106108 movsd xmm4, qword ptr [rcx + 8]
1401c4b63: f20f105910 movsd xmm3, qword ptr [rcx + 0x10]
1401c4b68: 0f58dc addps xmm3, xmm4
1401c4b6b: 410f59d8 mulps xmm3, xmm8
1401c4b6f: 0f5cd9 subps xmm3, xmm1
1401c4b72: 0f28e8 movaps xmm5, xmm0
1401c4b75: 0f59eb mulps xmm5, xmm3
1401c4b78: f30f16e5 movshdup xmm4, xmm5
1401c4b7c: 0f58e5 addps xmm4, xmm5
1401c4b7f: 0f2ee2 ucomiss xmm4, xmm2
1401c4b82: 76bc jbe 0x1401c4b40
1401c4b84: f30f12ec movsldup xmm5, xmm4
1401c4b88: 0f59e8 mulps xmm5, xmm0
1401c4b8b: 0f5cdd subps xmm3, xmm5
1401c4b8e: 0f59db mulps xmm3, xmm3
1401c4b91: f30f16eb movshdup xmm5, xmm3
1401c4b95: f30f58eb addss xmm5, xmm3
1401c4b99: 0f57db xorps xmm3, xmm3
1401c4b9c: f30f51dd sqrtss xmm3, xmm5
1401c4ba0: f30f58db addss xmm3, xmm3
1401c4ba4: f30f58dc addss xmm3, xmm4
1401c4ba8: 4989c8 mov r8, rcx
1401c4bab: 4883c118 add rcx, 0x18
1401c4baf: 4883c0e8 add rax, -0x18
1401c4bb3: 4d85c0 test r8, r8
1401c4bb6: 7498 je 0x1401c4b50
