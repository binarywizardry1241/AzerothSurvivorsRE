14595053a: 84c0 test al, al
14595053c: f30f108dcc000000 movss xmm1, dword ptr [rbp + 0xcc]
145950544: 0f849b080000 je 0x145950de5
14595054a: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145950552: f3410f584560 addss xmm0, dword ptr [r13 + 0x60]
145950558: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
145950560: 498b4520 mov rax, qword ptr [r13 + 0x20]
145950564: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
