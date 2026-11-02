145b95c0f: 4889ce mov rsi, rcx
145b95c12: c6818a0c000004 mov byte ptr [rcx + 0xc8a], 4
145b95c19: f30f1081dc0b0000 movss xmm0, dword ptr [rcx + 0xbdc]
145b95c21: c781000b000001000000 mov dword ptr [rcx + 0xb00], 1
145b95c2b: f30f1181040b0000 movss dword ptr [rcx + 0xb04], xmm0
145b95c33: 80b9850c000000 cmp byte ptr [rcx + 0xc85], 0
145b95c3a: 0f840f010000 je 0x145b95d4f
145b95c40: 4889f1 mov rcx, rsi
145b95c43: e868d80200 call 0x145bc34b0
145b95c48: 4889f1 mov rcx, rsi
145b95c4b: e8f0c60300 call 0x145bd2340
