0000000145b2852b 8b7550                         mov esi, dword ptr [rbp + 0x50]
0000000145b2852e 48898da0000000                 mov qword ptr [rbp + 0xa0], rcx
0000000145b28535 488995a8000000                 mov qword ptr [rbp + 0xa8], rdx
0000000145b2853c e84f3cf7ff                     call 0x145a9c190
0000000145b28541 48898588020000                 mov qword ptr [rbp + 0x288], rax
0000000145b28548 448b6d5c                       mov r13d, dword ptr [rbp + 0x5c]
0000000145b2854c f3480f2afe                     cvtsi2ss xmm7, rsi
0000000145b28551 8b5d74                         mov ebx, dword ptr [rbp + 0x74]
0000000145b28554 f30f593d58fd6600               mulss xmm7, dword ptr [rip + 0x66fd58]
0000000145b2855c 0f28c7                         movaps xmm0, xmm7
0000000145b2855f e811374c00                     call 0x145febc75
0000000145b28564 f34c0f2ce0                     cvttss2si r12, xmm0
0000000145b28569 f3440f100d2af07300             movss xmm9, dword ptr [rip + 0x73f02a]
0000000145b28572 410f2ec1                       ucomiss xmm0, xmm9
0000000145b28576 49bfffffffffffffff7f           movabs r15, 0x7fffffffffffffff
0000000145b28580 4d0f47e7                       cmova r12, r15
0000000145b28584 0f2ec0                         ucomiss xmm0, xmm0
0000000145b28587 b800000000                     mov eax, 0
0000000145b2858c 4c0f4ae0                       cmovp r12, rax
0000000145b28590 f30f5e3598136c00               divss xmm6, dword ptr [rip + 0x6c1398]
0000000145b28598 f30f5935d0fb6600               mulss xmm6, dword ptr [rip + 0x66fbd0]
0000000145b285a0 0f28c6                         movaps xmm0, xmm6
0000000145b285a3 e8cd364c00                     call 0x145febc75
0000000145b285a8 f3480f2cf0                     cvttss2si rsi, xmm0
0000000145b285ad 410f2ec1                       ucomiss xmm0, xmm9
0000000145b285b1 490f47f7                       cmova rsi, r15
0000000145b285b5 0f2ec0                         ucomiss xmm0, xmm0
0000000145b285b8 b800000000                     mov eax, 0
0000000145b285bd 480f4af0                       cmovp rsi, rax
0000000145b285c1 4a8d0ced00000000               lea rcx, [r13*8]
0000000145b285c9 4c8d3c89                       lea r15, [rcx + rcx*4]
0000000145b285cd 4488b597020000                 mov byte ptr [rbp + 0x297], r14b
0000000145b285d4 4584f6                         test r14b, r14b
0000000145b285d7 49c7c638ffffff                 mov r14, 0xffffffffffffff38
0000000145b285de 4c0f44f0                       cmove r14, rax
0000000145b285e2 480f44f8                       cmove rdi, rax
0000000145b285e6 7505                           jne 0x145b285ed
0000000145b285e8 0f57c9                         xorps xmm1, xmm1
0000000145b285eb eb08                           jmp 0x145b285f5
0000000145b285ed f30f100d4be46d00               movss xmm1, dword ptr [rip + 0x6de44b]
0000000145b285f5 f3490f2ad5                     cvtsi2ss xmm2, r13
0000000145b285fa f30f58f7                       addss xmm6, xmm7
0000000145b285fe f30f59151e026700               mulss xmm2, dword ptr [rip + 0x67021e]
0000000145b28606 f30f58d6                       addss xmm2, xmm6
0000000145b2860a 0f57c0                         xorps xmm0, xmm0
0000000145b2860d f30f2a8588020000               cvtsi2ss xmm0, dword ptr [rbp + 0x288]
0000000145b28615 f30f590563036700               mulss xmm0, dword ptr [rip + 0x670363]
0000000145b2861d f30f5e059b6d7200               divss xmm0, dword ptr [rip + 0x726d9b]
0000000145b28625 f30f58d1                       addss xmm2, xmm1
0000000145b28629 f30f58056ffb6600               addss xmm0, dword ptr [rip + 0x66fb6f]
0000000145b28631 f30f59c2                       mulss xmm0, xmm2
0000000145b28635 e83b364c00                     call 0x145febc75
0000000145b2863a f3480f2cc0                     cvttss2si rax, xmm0
0000000145b2863f 410f2ec0                       ucomiss xmm0, xmm8
0000000145b28643 b900000000                     mov ecx, 0
0000000145b28648 0f42c1                         cmovb eax, ecx
0000000145b2864b 410f2ec2                       ucomiss xmm0, xmm10
0000000145b2864f b9ffffffff                     mov ecx, 0xffffffff
0000000145b28654 0f47c1                         cmova eax, ecx
0000000145b28657 4a8d0c3e                       lea rcx, [rsi + r15]
0000000145b2865b 4c01e1                         add rcx, r12
0000000145b2865e 4929ce                         sub r14, rcx
0000000145b28661 4901c6                         add r14, rax
0000000145b28664 4889b5c0000000                 mov qword ptr [rbp + 0xc0], rsi
0000000145b2866b 4c89a5c8000000                 mov qword ptr [rbp + 0xc8], r12
0000000145b28672 4c89bdd0000000                 mov qword ptr [rbp + 0xd0], r15
0000000145b28679 4889bdd8000000                 mov qword ptr [rbp + 0xd8], rdi
0000000145b28680 4c89b5e0000000                 mov qword ptr [rbp + 0xe0], r14
0000000145b28687 80fb05                         cmp bl, 5
0000000145b2868a b805000000                     mov eax, 5
0000000145b2868f 0f42c3                         cmovb eax, ebx
0000000145b28692 84db                           test bl, bl
0000000145b28694 7430                           je 0x145b286c6
0000000145b28696 0fb6c0                         movzx eax, al
0000000145b28699 488d0440                       lea rax, [rax + rax*2]
0000000145b2869d c1e004                         shl eax, 4
0000000145b286a0 488d0d391c4a01                 lea rcx, [rip + 0x14a1c39]
0000000145b286a7 488d1408                       lea rdx, [rax + rcx]
0000000145b286ab 4883c2d0                       add rdx, -0x30
0000000145b286af 4885d2                         test rdx, rdx
0000000145b286b2 7412                           je 0x145b286c6
0000000145b286b4 4801c1                         add rcx, rax
0000000145b286b7 f3440f1041fc                   movss xmm8, dword ptr [rcx - 4]
0000000145b286bd f3440f58056afb6600             addss xmm8, dword ptr [rip + 0x66fb6a]
0000000145b286c6 4901f4                         add r12, rsi
0000000145b286c9 4c01ff                         add rdi, r15
0000000145b286cc 4c01e7                         add rdi, r12
0000000145b286cf 4c01f7                         add rdi, r14
0000000145b286d2 0f57c0                         xorps xmm0, xmm0
0000000145b286d5 f3480f2ac7                     cvtsi2ss xmm0, rdi
0000000145b286da f3410f59c0                     mulss xmm0, xmm8
0000000145b286df e891354c00                     call 0x145febc75
0000000145b286e4 f3480f2cc0                     cvttss2si rax, xmm0
0000000145b286e9 410f2ec1                       ucomiss xmm0, xmm9
0000000145b286ed 48bbffffffffffffff7f           movabs rbx, 0x7fffffffffffffff
0000000145b286f7 480f47c3                       cmova rax, rbx
0000000145b286fb 31f6                           xor esi, esi
0000000145b286fd 0f2ec0                         ucomiss xmm0, xmm0
0000000145b28700 480f4ac6                       cmovp rax, rsi
0000000145b28704 488985e8000000                 mov qword ptr [rbp + 0xe8], rax
0000000145b2870b 4801f8                         add rax, rdi
0000000145b2870e 0f57c0                         xorps xmm0, xmm0
0000000145b28711 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145b28716 4c8bb580020000                 mov r14, qword ptr [rbp + 0x280]
0000000145b2871d f3410f5986401a0000             mulss xmm0, dword ptr [r14 + 0x1a40]
0000000145b28726 e84a354c00                     call 0x145febc75
0000000145b2872b f3480f2cc0                     cvttss2si rax, xmm0
0000000145b28730 410f2ec1                       ucomiss xmm0, xmm9
0000000145b28734 480f47c3                       cmova rax, rbx
0000000145b28738 0f2ec0                         ucomiss xmm0, xmm0
0000000145b2873b 480f4ac6                       cmovp rax, rsi
0000000145b2873f 488985f0000000                 mov qword ptr [rbp + 0xf0], rax
