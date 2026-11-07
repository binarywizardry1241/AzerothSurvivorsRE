0000000145c17cce 4883bd20010000ff               cmp qword ptr [rbp + 0x120], -1
0000000145c17cd6 0f845d050000                   je 0x145c18239
0000000145c17cdc 488b8de0000000                 mov rcx, qword ptr [rbp + 0xe0]
0000000145c17ce3 493b8c24c8060000               cmp rcx, qword ptr [r12 + 0x6c8]
0000000145c17ceb 733f                           jae 0x145c17d2c
0000000145c17ced 498b8424c0060000               mov rax, qword ptr [r12 + 0x6c0]
0000000145c17cf5 488d0c89                       lea rcx, [rcx + rcx*4]
0000000145c17cf9 48c704c800000000               mov qword ptr [rax + rcx*8], 0
0000000145c17d01 f3410f108424740c0000           movss xmm0, dword ptr [r12 + 0xc74]
0000000145c17d0b 31d2                           xor edx, edx
0000000145c17d0d 4180bc246f03000002             cmp byte ptr [r12 + 0x36f], 2
0000000145c17d16 0f93c2                         setae dl
0000000145c17d19 4c8d05e079a701                 lea r8, [rip + 0x1a779e0]
0000000145c17d20 f3410f580490                   addss xmm0, dword ptr [r8 + rdx*4]
0000000145c17d26 f30f1144c824                   movss dword ptr [rax + rcx*8 + 0x24], xmm0
0000000145c17d2c 49c7042400000000               mov qword ptr [r12], 0
0000000145c17d34 41ff842404080000               inc dword ptr [r12 + 0x804]
