144c84e2e 450fc6c900 shufps xmm9, xmm9, 0
144c84e33 450f59c8 mulps xmm9, xmm8
144c84e37 0fc6f600 shufps xmm6, xmm6, 0
144c84e3b 0f59742420 mulps xmm6, xmmword ptr [rsp + 0x20]
144c84e40 410f58f1 addps xmm6, xmm9
144c84e44 e9cf000000 jmp 0x144c84f18
