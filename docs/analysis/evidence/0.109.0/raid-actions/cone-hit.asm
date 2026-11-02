1459504af: 410f2ec0 ucomiss xmm0, xmm8
1459504b3: 776f ja 0x145950524
1459504b5: b001 mov al, 1
1459504b7: 0f2ef8 ucomiss xmm7, xmm0
1459504ba: 776a ja 0x145950526
1459504bc: f3450f104538 movss xmm8, dword ptr [r13 + 0x38]
1459504c2: 410f28c7 movaps xmm0, xmm15
1459504c6: 410f28ce movaps xmm1, xmm14
1459504ca: e8549c2a00 call 0x145bfa123
1459504cf: f30f5cc6 subss xmm0, xmm6
1459504d3: f30f5805c51e4900 addss xmm0, dword ptr [rip + 0x491ec5]
1459504db: 410f28cc movaps xmm1, xmm12
1459504df: e8459c2a00 call 0x145bfa129
1459504e4: 0f28c8 movaps xmm1, xmm0
1459504e7: f3410f58cc addss xmm1, xmm12
1459504ec: 0f28d0 movaps xmm2, xmm0
1459504ef: 0f57db xorps xmm3, xmm3
1459504f2: f30fc2d301 cmpltss xmm2, xmm3
1459504f7: 0f54ca andps xmm1, xmm2
1459504fa: 0f55d0 andnps xmm2, xmm0
1459504fd: 0f56d1 orps xmm2, xmm1
145950500: f30f581528ed5600 addss xmm2, dword ptr [rip + 0x56ed28]
145950508: 410f54d3 andps xmm2, xmm11
14595050c: f3440f59c7 mulss xmm8, xmm7
145950511: 440f2ec2 ucomiss xmm8, xmm2
145950515: 0f93c0 setae al
145950518: eb0c jmp 0x145950526
