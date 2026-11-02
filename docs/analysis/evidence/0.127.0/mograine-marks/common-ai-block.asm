0x145c5ab67: call 0x145af1fb0
0x145c5ab6c: mov rdx, qword ptr [rsi + 0x5c0]
0x145c5ab73: mov rcx, qword ptr [rbp + 0x160]
0x145c5ab7a: cmp rcx, rdx
0x145c5ab7d: jae 0x145c602b3
0x145c5ab83: addss xmm0, xmm15
0x145c5ab88: addss xmm0, dword ptr [rip + 0x5d8554]
0x145c5ab90: mov rcx, qword ptr [rsi + 0x5b8]
0x145c5ab97: lea rax, [rcx + r14]
0x145c5ab9b: cmp qword ptr [rcx + r14 + 0x18], -1
0x145c5aba1: je 0x145c5abc8
0x145c5aba3: movss xmm1, dword ptr [rax + 0x48]
0x145c5aba8: movaps xmm2, xmm1
0x145c5abab: maxss xmm2, xmm0
0x145c5abaf: movaps xmm3, xmm2
0x145c5abb2: cmpunordss xmm3, xmm2
0x145c5abb7: movaps xmm4, xmm3
0x145c5abba: andnps xmm4, xmm2
0x145c5abbd: andps xmm3, xmm1
0x145c5abc0: orps xmm3, xmm4
0x145c5abc3: movss dword ptr [rax + 0x48], xmm3
0x145c5abc8: cmp qword ptr [rax + 0x58], -1
0x145c5abcd: mov rcx, rdi
0x145c5abd0: je 0x145c5aab2
0x145c5abd6: movss xmm1, dword ptr [rax + 0xa0]
0x145c5abde: movaps xmm2, xmm1
0x145c5abe1: maxss xmm2, xmm0
0x145c5abe5: movaps xmm0, xmm2
0x145c5abe8: cmpunordss xmm0, xmm2
0x145c5abed: movaps xmm3, xmm0
0x145c5abf0: andnps xmm3, xmm2
0x145c5abf3: andps xmm0, xmm1
0x145c5abf6: orps xmm0, xmm3
0x145c5abf9: movss dword ptr [rax + 0xa0], xmm0
0x145c5ac01: lea rax, [rip + 0x1786be0]
0x145c5ac08: movsxd rdx, dword ptr [rax + rbx*4]
0x145c5ac0c: add rdx, rax
0x145c5ac0f: jmp rdx
