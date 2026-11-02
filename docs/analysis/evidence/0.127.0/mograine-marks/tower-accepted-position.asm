0x145c53ffe: movaps xmm12, xmm10
0x145c54002: subss xmm12, dword ptr [rsi + r15 + 0x40]
0x145c54009: lea r13, [rsi + r15]
0x145c5400d: movaps xmm8, xmm11
0x145c54011: subss xmm8, dword ptr [rsi + r15 + 0x44]
0x145c54018: movaps xmm0, xmm12
0x145c5401c: movaps xmm1, xmm8
0x145c54020: call 0x14606177b
0x145c54025: mov eax, dword ptr [rsi + r15 + 0x30]
0x145c5402a: movss xmm1, dword ptr [rsi + r15 + 0x34]
0x145c54031: movsxd rax, dword ptr [rbx + rax*4]
0x145c54035: add rax, rbx
0x145c54038: jmp rax
