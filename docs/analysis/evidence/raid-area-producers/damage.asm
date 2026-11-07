14594984a: 84c0 test al, al
14594984c: f30f108dcc000000 movss xmm1, dword ptr [rbp + 0xcc]
145949854: 0f849b080000 je 0x14594a0f5
14594985a: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145949862: f3410f584560 addss xmm0, dword ptr [r13 + 0x60]
145949868: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
145949870: 498b4520 mov rax, qword ptr [r13 + 0x20]
145949874: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
14594987b: f3410f10456c movss xmm0, dword ptr [r13 + 0x6c]
145949881: 0f57d2 xorps xmm2, xmm2
145949884: 0f2ec2 ucomiss xmm0, xmm2
145949887: f30f10851c010000 movss xmm0, dword ptr [rbp + 0x11c]
14594988f: 0f8668080000 jbe 0x14594a0fd
