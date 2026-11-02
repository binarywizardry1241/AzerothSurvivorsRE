0000000145bb880a 31c0                           xor eax, eax
0000000145bb880c 80bf6f03000005                 cmp byte ptr [rdi + 0x36f], 5
0000000145bb8813 0f93c0                         setae al
0000000145bb8816 488d0de35c7501                 lea rcx, [rip + 0x1755ce3]
0000000145bb881d f30f5e0481                     divss xmm0, dword ptr [rcx + rax*4]
0000000145bb8822 0f57c9                         xorps xmm1, xmm1
0000000145bb8825 f30f5fc8                       maxss xmm1, xmm0
0000000145bb8829 f30f10056ff95d00               movss xmm0, dword ptr [rip + 0x5df96f]
0000000145bb8831 f30f5dc1                       minss xmm0, xmm1
