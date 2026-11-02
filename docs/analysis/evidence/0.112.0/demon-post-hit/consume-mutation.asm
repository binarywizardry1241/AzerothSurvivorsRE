1459577d0 4839c1 cmp rcx, rax
1459577d3 488d4930 lea rcx, [rcx + 0x30]
1459577d7 745e je 0x145957837
1459577d9 443979e0 cmp dword ptr [rcx - 0x20], r15d
1459577dd 75f1 jne 0x1459577d0
1459577df 8b51f0 mov edx, dword ptr [rcx - 0x10]
1459577e2 85d2 test edx, edx
1459577e4 74ea je 0x1459577d0
1459577e6 89d2 mov edx, edx
1459577e8 0f57c0 xorps xmm0, xmm0
1459577eb f3480f2ac2 cvtsi2ss xmm0, rdx
1459577f0 f20f1049e4 movsd xmm1, qword ptr [rcx - 0x1c]
1459577f5 0f28d9 movaps xmm3, xmm1
1459577f8 f30f591d785c4500 mulss xmm3, dword ptr [rip + 0x455c78]
145957800 f30f59d8 mulss xmm3, xmm0
145957804 f30f58d3 addss xmm2, xmm3
145957808 0f590da1162b01 mulps xmm1, xmmword ptr [rip + 0x12b16a1]
14595780f 0f1349e4 movlps qword ptr [rcx - 0x1c], xmm1
145957813 f30f1041ec movss xmm0, dword ptr [rcx - 0x14]
145957818 f30f5cc7 subss xmm0, xmm7
14595781c f3410f5fc1 maxss xmm0, xmm9
145957821 f30f5905e39e4500 mulss xmm0, dword ptr [rip + 0x459ee3]
145957829 f30f58c7 addss xmm0, xmm7
14595782d f30f1141ec movss dword ptr [rcx - 0x14], xmm0
145957832 4839c1 cmp rcx, rax
145957835 7590 jne 0x1459577c7
145957837 410f2ed1 ucomiss xmm2, xmm9
14595783b 0f86eff5ffff jbe 0x145956e30
