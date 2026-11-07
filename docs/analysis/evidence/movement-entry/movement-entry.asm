1458fddc7: f20f1086d0040000 movsd xmm0, qword ptr [rsi + 0x4d0]
1458fddcf: 440f139ed0040000 movlps qword ptr [rsi + 0x4d0], xmm11
1458fddd7: f3440f11aed8040000 movss dword ptr [rsi + 0x4d8], xmm13
1458fdde0: f30f11b6dc040000 movss dword ptr [rsi + 0x4dc], xmm6
1458fdde8: f30f108e6c0b0000 movss xmm1, dword ptr [rsi + 0xb6c]
1458fddf0: f30f118ed80b0000 movss dword ptr [rsi + 0xbd8], xmm1
1458fddf8: 80be120c000000 cmp byte ptr [rsi + 0xc12], 0
1458fddff: 7533 jne 0x1458fde34
1458fde01: 410f5cc3 subps xmm0, xmm11
1458fde05: 0f59c0 mulps xmm0, xmm0
1458fde08: f30f16c8 movshdup xmm1, xmm0
1458fde0c: f30f58c8 addss xmm1, xmm0
1458fde10: 0f2e0d81425e00 ucomiss xmm1, dword ptr [rip + 0x5e4281]
1458fde17: 761b jbe 0x1458fde34
1458fde19: 4883be180b000000 cmp qword ptr [rsi + 0xb18], 0
1458fde21: 7511 jne 0x1458fde34
1458fde23: 80be0e0c000000 cmp byte ptr [rsi + 0xc0e], 0
1458fde2a: 7508 jne 0x1458fde34
1458fde2c: 4889f1 mov rcx, rsi
1458fde2f: e81cd70000 call 0x14590b550
14590b5c4: 4989cc mov r12, rcx
14590b5c7: c681120c000001 mov byte ptr [rcx + 0xc12], 1
