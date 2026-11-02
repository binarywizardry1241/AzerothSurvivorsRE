0000000145b2274f 48c745e0ffffffff               mov qword ptr [rbp - 0x20], 0xffffffffffffffff
0000000145b22757 f30f119d38010000               movss dword ptr [rbp + 0x138], xmm3
0000000145b2275f f30f11953c010000               movss dword ptr [rbp + 0x13c], xmm2
0000000145b22767 418b4708                       mov eax, dword ptr [r15 + 8]
0000000145b2276b 89854c010000                   mov dword ptr [rbp + 0x14c], eax
0000000145b22771 498b07                         mov rax, qword ptr [r15]
0000000145b22774 48898544010000                 mov qword ptr [rbp + 0x144], rax
0000000145b2277b 498b07                         mov rax, qword ptr [r15]
0000000145b2277e 48898550010000                 mov qword ptr [rbp + 0x150], rax
0000000145b22785 418b4708                       mov eax, dword ptr [r15 + 8]
0000000145b22789 898558010000                   mov dword ptr [rbp + 0x158], eax
0000000145b2278f f30f11855c010000               movss dword ptr [rbp + 0x15c], xmm0
0000000145b22797 c7856001000000000000           mov dword ptr [rbp + 0x160], 0
0000000145b227a1 f30f118564010000               movss dword ptr [rbp + 0x164], xmm0
0000000145b227a9 f30f11a568010000               movss dword ptr [rbp + 0x168], xmm4
0000000145b227b1 48c745c800000000               mov qword ptr [rbp - 0x38], 0
0000000145b227b9 0f118dd0000000                 movups xmmword ptr [rbp + 0xd0], xmm1
0000000145b227c0 48c785e000000000000000         mov qword ptr [rbp + 0xe0], 0
0000000145b227cb 0f118d6c010000                 movups xmmword ptr [rbp + 0x16c], xmm1
0000000145b227d2 0f118d7c010000                 movups xmmword ptr [rbp + 0x17c], xmm1
0000000145b227d9 48c745d008000000               mov qword ptr [rbp - 0x30], 8
0000000145b227e1 48c745d800000000               mov qword ptr [rbp - 0x28], 0
0000000145b227e9 c7858c01000000000000           mov dword ptr [rbp + 0x18c], 0
0000000145b227f3 c7457800000000                 mov dword ptr [rbp + 0x78], 0
0000000145b227fa c7858000000000000000           mov dword ptr [rbp + 0x80], 0
0000000145b22804 48c74520ffffffff               mov qword ptr [rbp + 0x20], 0xffffffffffffffff
0000000145b2280c c7858800000000000000           mov dword ptr [rbp + 0x88], 0
0000000145b22816 48c785c800000000000000         mov qword ptr [rbp + 0xc8], 0
0000000145b22821 0f118d90010000                 movups xmmword ptr [rbp + 0x190], xmm1
0000000145b22828 66c785a00100000000             mov word ptr [rbp + 0x1a0], 0
0000000145b22831 f30f11b528010000               movss dword ptr [rbp + 0x128], xmm6
0000000145b22839 f30f11b52c010000               movss dword ptr [rbp + 0x12c], xmm6
0000000145b22841 48c7853001000000000000         mov qword ptr [rbp + 0x130], 0
0000000145b2284c f30f11bd40010000               movss dword ptr [rbp + 0x140], xmm7
0000000145b22854 0f100b                         movups xmm1, xmmword ptr [rbx]
0000000145b22857 0f118d98000000                 movups xmmword ptr [rbp + 0x98], xmm1
0000000145b2285e 4889bda8000000                 mov qword ptr [rbp + 0xa8], rdi
0000000145b22865 f30f108d40020000               movss xmm1, dword ptr [rbp + 0x240]
0000000145b2286d 0f28153cfa6800                 movaps xmm2, xmmword ptr [rip + 0x68fa3c]
0000000145b22874 f30f10d1                       movss xmm2, xmm1
0000000145b22878 f30f12c0                       movsldup xmm0, xmm0
0000000145b2287c 0f58c2                         addps xmm0, xmm2
0000000145b2287f 0f1385b0000000                 movlps qword ptr [rbp + 0xb0], xmm0
0000000145b22886 488bbec0050000                 mov rdi, qword ptr [rsi + 0x5c0]
0000000145b2288d 483bbeb0050000                 cmp rdi, qword ptr [rsi + 0x5b0]
0000000145b22894 750d                           jne 0x145b228a3
0000000145b22896 488d8eb0050000                 lea rcx, [rsi + 0x5b0]
0000000145b2289d e83e976600                     call 0x14618bfe0
0000000145b228a2 90                             nop
0000000145b228a3 4869cfe0010000                 imul rcx, rdi, 0x1e0
0000000145b228aa 48038eb8050000                 add rcx, qword ptr [rsi + 0x5b8]
0000000145b228b1 488d55c8                       lea rdx, [rbp - 0x38]
0000000145b228b5 41b8e0010000                   mov r8d, 0x1e0
0000000145b228bb e88b274e00                     call 0x14600504b
0000000145b228c0 48ffc7                         inc rdi
0000000145b228c3 4889bec0050000                 mov qword ptr [rsi + 0x5c0], rdi
