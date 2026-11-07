1401b5bb0: 4883ec48 sub rsp, 0x48
1401b5bb4: 0f57d2 xorps xmm2, xmm2
1401b5bb7: 0f2eca ucomiss xmm1, xmm2
1401b5bba: 7210 jb 0x1401b5bcc
1401b5bbc: f30f5fd0 maxss xmm2, xmm0
1401b5bc0: f30f5dca minss xmm1, xmm2
1401b5bc4: 0f28c1 movaps xmm0, xmm1
1401b5bc7: 4883c448 add rsp, 0x48
1401b5bcb: c3 ret
