14596dab9: 83be7009000001 cmp dword ptr [rsi + 0x970], 1
14596dac0: 754e jne 0x14596db10
14596dac2: 80beb80a000000 cmp byte ptr [rsi + 0xab8], 0
14596dac9: 7445 je 0x14596db10
14596dacb: f30f10be340a0000 movss xmm7, dword ptr [rsi + 0xa34]
14596dad3: f30f5cbe74090000 subss xmm7, dword ptr [rsi + 0x974]
14596dadb: f30f5e3d5d2a4800 divss xmm7, dword ptr [rip + 0x482a5d]
14596dae3: 660fefc0 pxor xmm0, xmm0
14596dae7: f30f5ff8 maxss xmm7, xmm0
14596daeb: f30f10051dbf8b01 movss xmm0, dword ptr [rip + 0x18bbf1d]
14596daf3: 0f28cf movaps xmm1, xmm7
14596daf6: e86ac62800 call 0x145bfa165
14596dafb: 0f28f0 movaps xmm6, xmm0
14596dafe: f30f10050ebf8b01 movss xmm0, dword ptr [rip + 0x18bbf0e]
14596db06: 0f28cf movaps xmm1, xmm7
14596db09: e857c62800 call 0x145bfa165
14596db0e: eb0b jmp 0x14596db1b
14596db10: f30f103588f74200 movss xmm6, dword ptr [rip + 0x42f788]
14596db18: 0f28c6 movaps xmm0, xmm6
14596db1b: 66440f6e86b4020000 movd xmm8, dword ptr [rsi + 0x2b4]
14596db24: f3410f104d54 movss xmm1, dword ptr [r13 + 0x54]
14596db2a: f30f590de6be8b01 mulss xmm1, dword ptr [rip + 0x18bbee6]
14596db32: f3450f1096e0000000 movss xmm10, dword ptr [r14 + 0xe0]
14596db3b: f3410f59ca mulss xmm1, xmm10
14596db40: f30f598ea80a0000 mulss xmm1, dword ptr [rsi + 0xaa8]
14596db48: f30f59c8 mulss xmm1, xmm0
14596db4c: 0fb786b2020000 movzx eax, word ptr [rsi + 0x2b2]
14596db53: 0f57ff xorps xmm7, xmm7
14596db56: f30f2af8 cvtsi2ss xmm7, eax
14596db5a: f30f5e3d6ef74200 divss xmm7, dword ptr [rip + 0x42f76e]
14596db62: f30f59f9 mulss xmm7, xmm1
