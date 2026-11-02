145947d91: 49837e18ff cmp qword ptr [r14 + 0x18], -1
145947d96: 0f84e5050000 je 0x145948381
145947d9c: f3410f108658010000 movss xmm0, dword ptr [r14 + 0x158]
145947da5: f3410f108e5c010000 movss xmm1, dword ptr [r14 + 0x15c]
145947dae: 0f28d1 movaps xmm2, xmm1
145947db1: f30f5915570a4700 mulss xmm2, dword ptr [rip + 0x470a57]
145947db9: 41807e5000 cmp byte ptr [r14 + 0x50], 0
145947dbe: 750a jne 0x145947dca
145947dc0: 0f2ed0 ucomiss xmm2, xmm0
145947dc3: 7605 jbe 0x145947dca
145947dc5: 41c6465001 mov byte ptr [r14 + 0x50], 1
