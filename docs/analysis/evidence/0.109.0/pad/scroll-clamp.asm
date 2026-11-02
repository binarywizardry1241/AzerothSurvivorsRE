1401b5e60: 4883ec48 sub rsp, 0x48
1401b5e64: 0f57d2 xorps xmm2, xmm2
1401b5e67: 0f2eca ucomiss xmm1, xmm2
1401b5e6a: 7210 jb 0x1401b5e7c
1401b5e6c: f30f5fd0 maxss xmm2, xmm0
1401b5e70: f30f5dca minss xmm1, xmm2
1401b5e74: 0f28c1 movaps xmm0, xmm1
1401b5e77: 4883c448 add rsp, 0x48
1401b5e7b: c3 ret
