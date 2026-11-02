145959a10: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145959a17: 0f5c8dd0000000 subps xmm1, xmmword ptr [rbp + 0xd0]
145959a1e: 0f59c9 mulps xmm1, xmm1
145959a21: f30f16c1 movshdup xmm0, xmm1
145959a25: f30f58c1 addss xmm0, xmm1
145959a29: f30f51c0 sqrtss xmm0, xmm0
145959a2d: 0f2e05e0b24800 ucomiss xmm0, dword ptr [rip + 0x48b2e0]
145959a34: 0f873edfffff ja 0x145957978
145959a3a: f30f107104 movss xmm6, dword ptr [rcx + 4]
145959a3f: 8b19 mov ebx, dword ptr [rcx]
145959a41: f30f1015ab874800 movss xmm2, dword ptr [rip + 0x4887ab]
145959a49: f30f58d6 addss xmm2, xmm6
145959a4d: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145959a55: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145959a5b: 4889f1 mov rcx, rsi
145959a5e: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145959a65: 41b901000000 mov r9d, 1
145959a6b: e8b0d8ffff call 0x145957320
145959a70: 4889f1 mov rcx, rsi
145959a73: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145959a7a: 4889fa mov rdx, rdi
145959a7d: 4189d8 mov r8d, ebx
145959a80: 0f28de movaps xmm3, xmm6
145959a83: e868ddffff call 0x1459577f0
145959a88: c6853d01000024 mov byte ptr [rbp + 0x13d], 0x24
145959a8f: 4c8d8d10010000 lea r9, [rbp + 0x110]
145959a96: 4889f1 mov rcx, rsi
145959a99: 0f28ce movaps xmm1, xmm6
145959a9c: e93b260000 jmp 0x14595c0dc
