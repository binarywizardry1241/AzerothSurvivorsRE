1401c1020: f20f104b10 movsd xmm1, qword ptr [rbx + 0x10]
1401c1025: f2410f105044 movsd xmm2, qword ptr [r8 + 0x44]
1401c102b: 0f5cd1 subps xmm2, xmm1
1401c102e: 0f59d2 mulps xmm2, xmm2
1401c1031: f30f16da movshdup xmm3, xmm2
1401c1035: f30f58da addss xmm3, xmm2
1401c1039: 0f57d2 xorps xmm2, xmm2
1401c103c: f30f51d3 sqrtss xmm2, xmm3
1401c1040: f30f58c2 addss xmm0, xmm2
1401c1044: 458911 mov dword ptr [r9], r10d
1401c1047: 41c7404001000000 mov dword ptr [r8 + 0x40], 1
1401c104f: 410f134844 movlps qword ptr [r8 + 0x44], xmm1
