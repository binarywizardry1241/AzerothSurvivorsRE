14593b2d9: 83be8809000001 cmp dword ptr [rsi + 0x988], 1
14593b2e0: 754e jne 0x14593b330
14593b2e2: 80bed00a000000 cmp byte ptr [rsi + 0xad0], 0
14593b2e9: 7445 je 0x14593b330
14593b2eb: f30f10be4c0a0000 movss xmm7, dword ptr [rsi + 0xa4c]
14593b2f3: f30f5cbe8c090000 subss xmm7, dword ptr [rsi + 0x98c]
14593b2fb: f30f5e3dddd44700 divss xmm7, dword ptr [rip + 0x47d4dd]
14593b303: 660fefc0 pxor xmm0, xmm0
14593b307: f30f5ff8 maxss xmm7, xmm0
14593b30b: f30f1005edda2c01 movss xmm0, dword ptr [rip + 0x12cdaed]
14593b313: 0f28cf movaps xmm1, xmm7
14593b316: e84af12c00 call 0x145c0a465
14593b31b: 0f28f0 movaps xmm6, xmm0
14593b31e: f30f1005deda2c01 movss xmm0, dword ptr [rip + 0x12cdade]
14593b326: 0f28cf movaps xmm1, xmm7
14593b329: e837f12c00 call 0x145c0a465
14593b32e: eb0b jmp 0x14593b33b
14593b330: f30f1035281f4700 movss xmm6, dword ptr [rip + 0x471f28]
14593b338: 0f28c6 movaps xmm0, xmm6
14593b33b: 66440f6e8ecc020000 movd xmm9, dword ptr [rsi + 0x2cc]
14593b344: f3410f104d54 movss xmm1, dword ptr [r13 + 0x54]
14593b34a: f30f590db6da2c01 mulss xmm1, dword ptr [rip + 0x12cdab6]
14593b352: f3450f1096e0000000 movss xmm10, dword ptr [r14 + 0xe0]
14593b35b: f3410f59ca mulss xmm1, xmm10
14593b360: f30f598ec00a0000 mulss xmm1, dword ptr [rsi + 0xac0]
14593b368: f30f59c8 mulss xmm1, xmm0
14593b36c: 0fb786ca020000 movzx eax, word ptr [rsi + 0x2ca]
14593b373: 0f57ff xorps xmm7, xmm7
14593b376: f30f2af8 cvtsi2ss xmm7, eax
14593b37a: f30f5e3d06214700 divss xmm7, dword ptr [rip + 0x472106]
14593b382: f30f59f9 mulss xmm7, xmm1
