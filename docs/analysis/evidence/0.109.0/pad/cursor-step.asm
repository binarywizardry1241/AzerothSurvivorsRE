1401c2db0: f20f104b10 movsd xmm1, qword ptr [rbx + 0x10]
1401c2db5: f2410f105044 movsd xmm2, qword ptr [r8 + 0x44]
1401c2dbb: 0f5cd1 subps xmm2, xmm1
1401c2dbe: 0f59d2 mulps xmm2, xmm2
1401c2dc1: f30f16da movshdup xmm3, xmm2
1401c2dc5: f30f58da addss xmm3, xmm2
1401c2dc9: 0f57d2 xorps xmm2, xmm2
1401c2dcc: f30f51d3 sqrtss xmm2, xmm3
1401c2dd0: f30f58c2 addss xmm0, xmm2
1401c2dd4: 458911 mov dword ptr [r9], r10d
1401c2dd7: 41c7404001000000 mov dword ptr [r8 + 0x40], 1
1401c2ddf: 410f134844 movlps qword ptr [r8 + 0x44], xmm1
