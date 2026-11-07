0000000145bf1f80 4157                           push r15
0000000145bf1f82 4156                           push r14
0000000145bf1f84 4154                           push r12
0000000145bf1f86 56                             push rsi
0000000145bf1f87 57                             push rdi
0000000145bf1f88 55                             push rbp
0000000145bf1f89 53                             push rbx
0000000145bf1f8a 4881ecb0000000                 sub rsp, 0xb0
0000000145bf1f91 440f29a424a0000000             movaps xmmword ptr [rsp + 0xa0], xmm12
0000000145bf1f9a 440f299c2490000000             movaps xmmword ptr [rsp + 0x90], xmm11
0000000145bf1fa3 440f29942480000000             movaps xmmword ptr [rsp + 0x80], xmm10
0000000145bf1fac 440f294c2470                   movaps xmmword ptr [rsp + 0x70], xmm9
0000000145bf1fb2 440f29442460                   movaps xmmword ptr [rsp + 0x60], xmm8
0000000145bf1fb8 0f297c2450                     movaps xmmword ptr [rsp + 0x50], xmm7
0000000145bf1fbd 0f29742440                     movaps xmmword ptr [rsp + 0x40], xmm6
0000000145bf1fc2 0f28f3                         movaps xmm6, xmm3
0000000145bf1fc5 4c89c7                         mov rdi, r8
0000000145bf1fc8 4889d3                         mov rbx, rdx
0000000145bf1fcb 4889ce                         mov rsi, rcx
0000000145bf1fce 4c8bb42438010000               mov r14, qword ptr [rsp + 0x138]
0000000145bf1fd6 f30f10bc2410010000             movss xmm7, dword ptr [rsp + 0x110]
0000000145bf1fdf 8ba9780c0000                   mov ebp, dword ptr [rcx + 0xc78]
0000000145bf1fe5 ffc5                           inc ebp
0000000145bf1fe7 89a9780c0000                   mov dword ptr [rcx + 0xc78], ebp
0000000145bf1fed f3440f1089740c0000             movss xmm9, dword ptr [rcx + 0xc74]
0000000145bf1ff6 440fb6b96f030000               movzx r15d, byte ptr [rcx + 0x36f]
0000000145bf1ffe 4c8ba1b80b0000                 mov r12, qword ptr [rcx + 0xbb8]
0000000145bf2005 498d4c2410                     lea rcx, [r12 + 0x10]
0000000145bf200a 0f28cb                         movaps xmm1, xmm3
0000000145bf200d 0f28d7                         movaps xmm2, xmm7
0000000145bf2010 e84bebf9ff                     call 0x145b90b60
0000000145bf2015 a801                           test al, 1
0000000145bf2017 7406                           je 0x145bf201f
0000000145bf2019 440f28c0                       movaps xmm8, xmm0
0000000145bf201d eb37                           jmp 0x145bf2056
0000000145bf201f 49837c2468ff                   cmp qword ptr [r12 + 0x68], -1
0000000145bf2025 7425                           je 0x145bf204c
0000000145bf2027 498d542468                     lea rdx, [r12 + 0x68]
0000000145bf202c 488d4c2428                     lea rcx, [rsp + 0x28]
0000000145bf2031 0f28d6                         movaps xmm2, xmm6
0000000145bf2034 0f28df                         movaps xmm3, xmm7
0000000145bf2037 e8a443faff                     call 0x145b963e0
0000000145bf203c 837c242801                     cmp dword ptr [rsp + 0x28], 1
0000000145bf2041 7509                           jne 0x145bf204c
0000000145bf2043 f3440f10442434                 movss xmm8, dword ptr [rsp + 0x34]
0000000145bf204a eb0a                           jmp 0x145bf2056
0000000145bf204c f3450f108424b8000000           movss xmm8, dword ptr [r12 + 0xb8]
0000000145bf2056 f3440f10942430010000           movss xmm10, dword ptr [rsp + 0x130]
0000000145bf2060 448ba42428010000               mov r12d, dword ptr [rsp + 0x128]
0000000145bf2068 f3440f109c2420010000           movss xmm11, dword ptr [rsp + 0x120]
0000000145bf2072 f3440f10a42418010000           movss xmm12, dword ptr [rsp + 0x118]
0000000145bf207c 410f1006                       movups xmm0, xmmword ptr [r14]
0000000145bf2080 0f11442430                     movups xmmword ptr [rsp + 0x30], xmm0
0000000145bf2085 4c8bb6f0050000                 mov r14, qword ptr [rsi + 0x5f0]
0000000145bf208c 4c3bb6e0050000                 cmp r14, qword ptr [rsi + 0x5e0]
0000000145bf2093 750c                           jne 0x145bf20a1
0000000145bf2095 488d8ee0050000                 lea rcx, [rsi + 0x5e0]
0000000145bf209c e84fa53f00                     call 0x145fec5f0
0000000145bf20a1 31c0                           xor eax, eax
0000000145bf20a3 4584ff                         test r15b, r15b
0000000145bf20a6 0f94c0                         sete al
0000000145bf20a9 488d0dd0d4a901                 lea rcx, [rip + 0x1a9d4d0]
0000000145bf20b0 f3440f591c81                   mulss xmm11, dword ptr [rcx + rax*4]
0000000145bf20b6 f3450f58d9                     addss xmm11, xmm9
0000000145bf20bb 488b86e8050000                 mov rax, qword ptr [rsi + 0x5e8]
0000000145bf20c2 4c89f1                         mov rcx, r14
0000000145bf20c5 48c1e107                       shl rcx, 7
0000000145bf20c9 48c7040800000000               mov qword ptr [rax + rcx], 0
0000000145bf20d1 0f10442428                     movups xmm0, xmmword ptr [rsp + 0x28]
0000000145bf20d6 0f11440808                     movups xmmword ptr [rax + rcx + 8], xmm0
0000000145bf20db 488b542438                     mov rdx, qword ptr [rsp + 0x38]
0000000145bf20e0 4889540818                     mov qword ptr [rax + rcx + 0x18], rdx
0000000145bf20e5 48895c0820                     mov qword ptr [rax + rcx + 0x20], rbx
0000000145bf20ea 48c744082800000000             mov qword ptr [rax + rcx + 0x28], 0
0000000145bf20f3 488b17                         mov rdx, qword ptr [rdi]
0000000145bf20f6 4889540830                     mov qword ptr [rax + rcx + 0x30], rdx
0000000145bf20fb 8b5708                         mov edx, dword ptr [rdi + 8]
0000000145bf20fe 89540838                       mov dword ptr [rax + rcx + 0x38], edx
0000000145bf2102 896c083c                       mov dword ptr [rax + rcx + 0x3c], ebp
0000000145bf2106 f30f11740840                   movss dword ptr [rax + rcx + 0x40], xmm6
0000000145bf210c f30f117c0844                   movss dword ptr [rax + rcx + 0x44], xmm7
0000000145bf2112 f3440f11440848                 movss dword ptr [rax + rcx + 0x48], xmm8
0000000145bf2119 f3440f1164084c                 movss dword ptr [rax + rcx + 0x4c], xmm12
0000000145bf2120 f3440f114c0850                 movss dword ptr [rax + rcx + 0x50], xmm9
0000000145bf2127 f3440f115c0854                 movss dword ptr [rax + rcx + 0x54], xmm11
0000000145bf212e c744085800000000               mov dword ptr [rax + rcx + 0x58], 0
0000000145bf2136 448964085c                     mov dword ptr [rax + rcx + 0x5c], r12d
0000000145bf213b f3440f11540860                 movss dword ptr [rax + rcx + 0x60], xmm10
0000000145bf2142 c74408640000807f               mov dword ptr [rax + rcx + 0x64], 0x7f800000
0000000145bf214a 498d5601                       lea rdx, [r14 + 1]
0000000145bf214e 0f57c0                         xorps xmm0, xmm0
0000000145bf2151 0f11440868                     movups xmmword ptr [rax + rcx + 0x68], xmm0
0000000145bf2156 48c744087700000000             mov qword ptr [rax + rcx + 0x77], 0
0000000145bf215f 488996f0050000                 mov qword ptr [rsi + 0x5f0], rdx
0000000145bf2166 4c89f0                         mov rax, r14
0000000145bf2169 0f28742440                     movaps xmm6, xmmword ptr [rsp + 0x40]
0000000145bf216e 0f287c2450                     movaps xmm7, xmmword ptr [rsp + 0x50]
0000000145bf2173 440f28442460                   movaps xmm8, xmmword ptr [rsp + 0x60]
0000000145bf2179 440f284c2470                   movaps xmm9, xmmword ptr [rsp + 0x70]
0000000145bf217f 440f28942480000000             movaps xmm10, xmmword ptr [rsp + 0x80]
0000000145bf2188 440f289c2490000000             movaps xmm11, xmmword ptr [rsp + 0x90]
0000000145bf2191 440f28a424a0000000             movaps xmm12, xmmword ptr [rsp + 0xa0]
0000000145bf219a 4881c4b0000000                 add rsp, 0xb0
0000000145bf21a1 5b                             pop rbx
0000000145bf21a2 5d                             pop rbp
0000000145bf21a3 5f                             pop rdi
0000000145bf21a4 5e                             pop rsi
0000000145bf21a5 415c                           pop r12
0000000145bf21a7 415e                           pop r14
0000000145bf21a9 415f                           pop r15
0000000145bf21ab c3                             ret
