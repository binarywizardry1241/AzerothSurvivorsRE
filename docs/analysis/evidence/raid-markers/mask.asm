14013d050: 53 push rbx
14013d051: 4883ec50 sub rsp, 0x50
14013d055: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
14013d05b: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
14013d060: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
14013d065: 89cb mov ebx, ecx
14013d067: 440f28c3 movaps xmm8, xmm3
14013d06b: 0f28f2 movaps xmm6, xmm2
14013d06e: 0f28f9 movaps xmm7, xmm1
14013d071: 0f28c1 movaps xmm0, xmm1
14013d074: f30f58c1 addss xmm0, xmm1
14013d078: f30f100d4400c905 movss xmm1, dword ptr [rip + 0x5c90044]
14013d080: f30f58c1 addss xmm0, xmm1
14013d084: f30f58f2 addss xmm6, xmm2
14013d088: f30f58f1 addss xmm6, xmm1
14013d08c: 0f28ce movaps xmm1, xmm6
14013d08f: e89bd0ab05 call 0x145bfa12f
14013d094: 0fb6c3 movzx eax, bl
14013d097: 488d0d0e7bca05 lea rcx, [rip + 0x5ca7b0e]
14013d09e: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14013d0a2: 4801c8 add rax, rcx
14013d0a5: ffe0 jmp rax
14013d0a7: 0f28c8 movaps xmm1, xmm0
14013d0aa: f30f1005ee01c605 movss xmm0, dword ptr [rip + 0x5c601ee]
14013d0b2: 0f28d1 movaps xmm2, xmm1
14013d0b5: f30f5dd0 minss xmm2, xmm0
14013d0b9: 0f28da movaps xmm3, xmm2
14013d0bc: f30f59da mulss xmm3, xmm2
14013d0c0: f30f59da mulss xmm3, xmm2
14013d0c4: f30f591d685dc905 mulss xmm3, dword ptr [rip + 0x5c95d68]
14013d0cc: f30f581dfcffc805 addss xmm3, dword ptr [rip + 0x5c8fffc]
14013d0d4: 0f28d0 movaps xmm2, xmm0
14013d0d7: f30f5cd1 subss xmm2, xmm1
14013d0db: f3410f5ed0 divss xmm2, xmm8
14013d0e0: 0f57c9 xorps xmm1, xmm1
14013d0e3: f30f5fca maxss xmm1, xmm2
14013d0e7: f30f5dc1 minss xmm0, xmm1
14013d0eb: f30f59c3 mulss xmm0, xmm3
14013d0ef: e93d030000 jmp 0x14013d431
14013d0f4: 0f54353506c605 andps xmm6, xmmword ptr [rip + 0x5c60635]
14013d0fb: f30f10057d51ca05 movss xmm0, dword ptr [rip + 0x5ca517d]
14013d103: f30f59c6 mulss xmm0, xmm6
14013d107: e829d0ab05 call 0x145bfa135
14013d10c: 0f28c8 movaps xmm1, xmm0
14013d10f: f30f590d8d01c605 mulss xmm1, dword ptr [rip + 0x5c6018d]
14013d117: 660f70c6a0 pshufd xmm0, xmm6, 0xa0
14013d11c: 0f58056d51ca05 addps xmm0, xmmword ptr [rip + 0x5ca516d]
14013d123: 0f5e057651ca05 divps xmm0, xmmword ptr [rip + 0x5ca5176]
14013d12a: 0f57d2 xorps xmm2, xmm2
14013d12d: 0f5fd0 maxps xmm2, xmm0
14013d130: 0f280529fdc805 movaps xmm0, xmmword ptr [rip + 0x5c8fd29]
14013d137: 0fc2c201 cmpltps xmm0, xmm2
14013d13b: 0f14c0 unpcklps xmm0, xmm0
14013d13e: 660f50c0 movmskpd eax, xmm0
14013d142: f30f10055601c605 movss xmm0, dword ptr [rip + 0x5c60156]
14013d14a: 0f28e0 movaps xmm4, xmm0
14013d14d: a802 test al, 2
14013d14f: 7504 jne 0x14013d155
14013d151: f30f16e2 movshdup xmm4, xmm2
14013d155: 0f28ec movaps xmm5, xmm4
14013d158: f30f59ec mulss xmm5, xmm4
14013d15c: f30f58e4 addss xmm4, xmm4
14013d160: f30f101d68fdc805 movss xmm3, dword ptr [rip + 0x5c8fd68]
14013d168: 0f28f3 movaps xmm6, xmm3
14013d16b: f30f5cf4 subss xmm6, xmm4
14013d16f: f30f59f5 mulss xmm6, xmm5
14013d173: 0f28e0 movaps xmm4, xmm0
14013d176: f30f5ce6 subss xmm4, xmm6
14013d17a: 0f28ec movaps xmm5, xmm4
14013d17d: f30f5fe9 maxss xmm5, xmm1
14013d181: 0f28cd movaps xmm1, xmm5
14013d184: f30fc2cd03 cmpunordss xmm1, xmm5
14013d189: 0f54e1 andps xmm4, xmm1
14013d18c: 0f55cd andnps xmm1, xmm5
14013d18f: 0f56cc orps xmm1, xmm4
14013d192: 0f28e0 movaps xmm4, xmm0
14013d195: a801 test al, 1
14013d197: 7503 jne 0x14013d19c
14013d199: 0f28e2 movaps xmm4, xmm2
14013d19c: 0f28d4 movaps xmm2, xmm4
14013d19f: f30f59d4 mulss xmm2, xmm4
14013d1a3: f30f58e4 addss xmm4, xmm4
14013d1a7: f30f5cdc subss xmm3, xmm4
14013d1ab: f30f59da mulss xmm3, xmm2
14013d1af: f30f5cc3 subss xmm0, xmm3
14013d1b3: e975020000 jmp 0x14013d42d
14013d1b8: 0f54357105c605 andps xmm6, xmmword ptr [rip + 0x5c60571]
14013d1bf: 0f28c6 movaps xmm0, xmm6
14013d1c2: f30f59c6 mulss xmm0, xmm6
14013d1c6: f30f59c6 mulss xmm0, xmm6
14013d1ca: f30f5905625cc905 mulss xmm0, dword ptr [rip + 0x5c95c62]
14013d1d2: f30f5805f6fec805 addss xmm0, dword ptr [rip + 0x5c8fef6]
14013d1da: e952020000 jmp 0x14013d431
14013d1df: f30f1005b900c605 movss xmm0, dword ptr [rip + 0x5c600b9]
14013d1e7: e945020000 jmp 0x14013d431
14013d1ec: f30f10055450ca05 movss xmm0, dword ptr [rip + 0x5ca5054]
14013d1f4: f30f59c7 mulss xmm0, xmm7
14013d1f8: e81acfab05 call 0x145bfa117
14013d1fd: 0f28f0 movaps xmm6, xmm0
14013d200: f30f593d4450ca05 mulss xmm7, dword ptr [rip + 0x5ca5044]
14013d208: f30f583d4050ca05 addss xmm7, dword ptr [rip + 0x5ca5040]
14013d210: 0f28c7 movaps xmm0, xmm7
14013d213: e8ffceab05 call 0x145bfa117
14013d218: 0f28c8 movaps xmm1, xmm0
14013d21b: 0f28c6 movaps xmm0, xmm6
14013d21e: 0f14c1 unpcklps xmm0, xmm1
14013d221: 0f280d3850ca05 movaps xmm1, xmmword ptr [rip + 0x5ca5038]
14013d228: 0f59c1 mulps xmm0, xmm1
14013d22b: 0f58c1 addps xmm0, xmm1
14013d22e: f30f16c8 movshdup xmm1, xmm0
14013d232: f30f59055afec805 mulss xmm0, dword ptr [rip + 0x5c8fe5a]
14013d23a: f30f59c1 mulss xmm0, xmm1
14013d23e: f30f580572fec805 addss xmm0, dword ptr [rip + 0x5c8fe72]
14013d246: e9e6010000 jmp 0x14013d431
14013d24b: 0f28c8 movaps xmm1, xmm0
14013d24e: f30f10054a00c605 movss xmm0, dword ptr [rip + 0x5c6004a]
14013d256: 0f28d0 movaps xmm2, xmm0
14013d259: f30f5cd1 subss xmm2, xmm1
14013d25d: f3410f5ed0 divss xmm2, xmm8
14013d262: 0f57c9 xorps xmm1, xmm1
14013d265: f30f5fca maxss xmm1, xmm2
14013d269: f30f5dc1 minss xmm0, xmm1
14013d26d: e9bf010000 jmp 0x14013d431
14013d272: 0f57c0 xorps xmm0, xmm0
14013d275: 0f2ef0 ucomiss xmm6, xmm0
14013d278: 7656 jbe 0x14013d2d0
14013d27a: f30f1005f24fca05 movss xmm0, dword ptr [rip + 0x5ca4ff2]
14013d282: f30f59c6 mulss xmm0, xmm6
14013d286: e8aaceab05 call 0x145bfa135
14013d28b: 0f28c8 movaps xmm1, xmm0
14013d28e: f30f590d22fec805 mulss xmm1, dword ptr [rip + 0x5c8fe22]
14013d296: e9ac000000 jmp 0x14013d347
14013d29b: f30f583d21fec805 addss xmm7, dword ptr [rip + 0x5c8fe21]
14013d2a3: 0f57c0 xorps xmm0, xmm0
14013d2a6: 0f2ef8 ucomiss xmm7, xmm0
14013d2a9: 0f86bb000000 jbe 0x14013d36a
14013d2af: f30f1005bd4fca05 movss xmm0, dword ptr [rip + 0x5ca4fbd]
14013d2b7: f30f59c7 mulss xmm0, xmm7
14013d2bb: e875ceab05 call 0x145bfa135
14013d2c0: 0f28c8 movaps xmm1, xmm0
14013d2c3: f30f590dedfdc805 mulss xmm1, dword ptr [rip + 0x5c8fded]
14013d2cb: e911010000 jmp 0x14013d3e1
14013d2d0: f30f100d7cfcc805 movss xmm1, dword ptr [rip + 0x5c8fc7c]
14013d2d8: f30f5cce subss xmm1, xmm6
14013d2dc: f30f5e0d8c4fca05 divss xmm1, dword ptr [rip + 0x5ca4f8c]
14013d2e4: f30f5fc1 maxss xmm0, xmm1
14013d2e8: f30f103db0ffc505 movss xmm7, dword ptr [rip + 0x5c5ffb0]
14013d2f0: 0f28cf movaps xmm1, xmm7
14013d2f3: f30f5dc8 minss xmm1, xmm0
14013d2f7: 0f28c1 movaps xmm0, xmm1
14013d2fa: f30f59c1 mulss xmm0, xmm1
14013d2fe: f30f58c9 addss xmm1, xmm1
14013d302: f30f1015c6fbc805 movss xmm2, dword ptr [rip + 0x5c8fbc6]
14013d30a: f30f5cd1 subss xmm2, xmm1
14013d30e: f30f59d0 mulss xmm2, xmm0
14013d312: f30f5cfa subss xmm7, xmm2
14013d316: f30f1005367bc905 movss xmm0, dword ptr [rip + 0x5c97b36]
14013d31e: f30f59c6 mulss xmm0, xmm6
14013d322: e80eceab05 call 0x145bfa135
14013d327: f30f5905c54eca05 mulss xmm0, dword ptr [rip + 0x5ca4ec5]
14013d32f: 0f28d7 movaps xmm2, xmm7
14013d332: f30f5fd0 maxss xmm2, xmm0
14013d336: 0f28ca movaps xmm1, xmm2
14013d339: f30fc2ca03 cmpunordss xmm1, xmm2
14013d33e: 0f54f9 andps xmm7, xmm1
14013d341: 0f55ca andnps xmm1, xmm2
14013d344: 0f56cf orps xmm1, xmm7
14013d347: 0f5435e203c605 andps xmm6, xmmword ptr [rip + 0x5c603e2]
14013d34e: f30f5835224fca05 addss xmm6, dword ptr [rip + 0x5ca4f22]
14013d356: f30f5e351e4fca05 divss xmm6, dword ptr [rip + 0x5ca4f1e]
14013d35e: 0f57d2 xorps xmm2, xmm2
14013d361: f30f5fd6 maxss xmm2, xmm6
14013d365: e995000000 jmp 0x14013d3ff
14013d36a: f30f100de2fbc805 movss xmm1, dword ptr [rip + 0x5c8fbe2]
14013d372: f30f5ccf subss xmm1, xmm7
14013d376: f30f5e0df24eca05 divss xmm1, dword ptr [rip + 0x5ca4ef2]
14013d37e: f30f5fc1 maxss xmm0, xmm1
14013d382: f30f103516ffc505 movss xmm6, dword ptr [rip + 0x5c5ff16]
14013d38a: 0f28ce movaps xmm1, xmm6
14013d38d: f30f5dc8 minss xmm1, xmm0
14013d391: 0f28c1 movaps xmm0, xmm1
14013d394: f30f59c1 mulss xmm0, xmm1
14013d398: f30f58c9 addss xmm1, xmm1
14013d39c: f30f10152cfbc805 movss xmm2, dword ptr [rip + 0x5c8fb2c]
14013d3a4: f30f5cd1 subss xmm2, xmm1
14013d3a8: f30f59d0 mulss xmm2, xmm0
14013d3ac: f30f5cf2 subss xmm6, xmm2
14013d3b0: f30f10059c7ac905 movss xmm0, dword ptr [rip + 0x5c97a9c]
14013d3b8: f30f59c7 mulss xmm0, xmm7
14013d3bc: e874cdab05 call 0x145bfa135
14013d3c1: f30f59052b4eca05 mulss xmm0, dword ptr [rip + 0x5ca4e2b]
14013d3c9: 0f28d6 movaps xmm2, xmm6
14013d3cc: f30f5fd0 maxss xmm2, xmm0
14013d3d0: 0f28ca movaps xmm1, xmm2
14013d3d3: f30fc2ca03 cmpunordss xmm1, xmm2
14013d3d8: 0f54f1 andps xmm6, xmm1
14013d3db: 0f55ca andnps xmm1, xmm2
14013d3de: 0f56ce orps xmm1, xmm6
14013d3e1: 0f543d4803c605 andps xmm7, xmmword ptr [rip + 0x5c60348]
14013d3e8: f30f583d884eca05 addss xmm7, dword ptr [rip + 0x5ca4e88]
14013d3f0: f30f5e3d844eca05 divss xmm7, dword ptr [rip + 0x5ca4e84]
14013d3f8: 0f57d2 xorps xmm2, xmm2
14013d3fb: f30f5fd7 maxss xmm2, xmm7
14013d3ff: f30f100599fec505 movss xmm0, dword ptr [rip + 0x5c5fe99]
14013d407: 0f28d8 movaps xmm3, xmm0
14013d40a: f30f5dda minss xmm3, xmm2
14013d40e: 0f28d3 movaps xmm2, xmm3
14013d411: f30f59d3 mulss xmm2, xmm3
14013d415: f30f58db addss xmm3, xmm3
14013d419: f30f1025affac805 movss xmm4, dword ptr [rip + 0x5c8faaf]
14013d421: f30f5ce3 subss xmm4, xmm3
14013d425: f30f59e2 mulss xmm4, xmm2
14013d429: f30f5cc4 subss xmm0, xmm4
14013d42d: f30f59c1 mulss xmm0, xmm1
14013d431: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14013d436: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
14013d43b: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
14013d441: 4883c450 add rsp, 0x50
14013d445: 5b pop rbx
14013d446: c3 ret
