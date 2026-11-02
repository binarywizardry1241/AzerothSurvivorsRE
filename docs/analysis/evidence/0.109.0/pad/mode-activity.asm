1401c2b15: f20f10442458 movsd xmm0, qword ptr [rsp + 0x58]
1401c2b1b: 0f59c0 mulps xmm0, xmm0
1401c2b1e: f30f16c8 movshdup xmm1, xmm0
1401c2b22: f30f58c8 addss xmm1, xmm0
1401c2b26: 0f57c0 xorps xmm0, xmm0
1401c2b29: f30f51c1 sqrtss xmm0, xmm1
1401c2b2d: b001 mov al, 1
1401c2b2f: 0f2e056ea7bd05 ucomiss xmm0, dword ptr [rip + 0x5bda76e]
1401c2b36: 7722 ja 0x1401c2b5a
1401c2b38: f20f10442460 movsd xmm0, qword ptr [rsp + 0x60]
1401c2b3e: 0f59c0 mulps xmm0, xmm0
1401c2b41: f30f16c8 movshdup xmm1, xmm0
1401c2b45: f30f58c8 addss xmm1, xmm0
1401c2b49: 0f57c0 xorps xmm0, xmm0
1401c2b4c: f30f51c1 sqrtss xmm0, xmm1
1401c2b50: 0f2e054da7bd05 ucomiss xmm0, dword ptr [rip + 0x5bda74d]
1401c2b57: 0f97c0 seta al
1401c2b5a: 88442428 mov byte ptr [rsp + 0x28], al
