0000000145b51ad2 48c745c000000000               mov qword ptr [rbp - 0x40], 0
0000000145b51ada 48c745c808000000               mov qword ptr [rbp - 0x38], 8
0000000145b51ae2 48c745d000000000               mov qword ptr [rbp - 0x30], 0
0000000145b51aea 48c745d8ffffffff               mov qword ptr [rbp - 0x28], 0xffffffffffffffff
0000000145b51af2 48c74518ffffffff               mov qword ptr [rbp + 0x18], 0xffffffffffffffff
0000000145b51afa c7457000000000                 mov dword ptr [rbp + 0x70], 0
0000000145b51b01 c7457800000000                 mov dword ptr [rbp + 0x78], 0
0000000145b51b08 c7858000000000000000           mov dword ptr [rbp + 0x80], 0
0000000145b51b12 c78590000000ffffffff           mov dword ptr [rbp + 0x90], 0xffffffff
0000000145b51b1c 48899db0000000                 mov qword ptr [rbp + 0xb0], rbx
0000000145b51b23 4c89b5b8000000                 mov qword ptr [rbp + 0xb8], r14
0000000145b51b2a 4c89bdc0000000                 mov qword ptr [rbp + 0xc0], r15
0000000145b51b31 0f57d2                         xorps xmm2, xmm2
0000000145b51b34 0f1195c8000000                 movups xmmword ptr [rbp + 0xc8], xmm2
0000000145b51b3b 0f1195d8000000                 movups xmmword ptr [rbp + 0xd8], xmm2
0000000145b51b42 0f1195e8000000                 movups xmmword ptr [rbp + 0xe8], xmm2
0000000145b51b49 0f1195f8000000                 movups xmmword ptr [rbp + 0xf8], xmm2
0000000145b51b50 0f119508010000                 movups xmmword ptr [rbp + 0x108], xmm2
0000000145b51b57 48c7851801000000000000         mov qword ptr [rbp + 0x118], 0
0000000145b51b62 f30f11b520010000               movss dword ptr [rbp + 0x120], xmm6
0000000145b51b6a f30f11b524010000               movss dword ptr [rbp + 0x124], xmm6
0000000145b51b72 0f138d28010000                 movlps qword ptr [rbp + 0x128], xmm1
0000000145b51b79 f30f108dc0010000               movss xmm1, dword ptr [rbp + 0x1c0]
0000000145b51b81 f30f118d30010000               movss dword ptr [rbp + 0x130], xmm1
0000000145b51b89 f3440f119534010000             movss dword ptr [rbp + 0x134], xmm10
0000000145b51b92 f30f108da8010000               movss xmm1, dword ptr [rbp + 0x1a8]
0000000145b51b9a f30f118d38010000               movss dword ptr [rbp + 0x138], xmm1
0000000145b51ba2 8b85b8010000                   mov eax, dword ptr [rbp + 0x1b8]
0000000145b51ba8 898544010000                   mov dword ptr [rbp + 0x144], eax
0000000145b51bae 488b8db0010000                 mov rcx, qword ptr [rbp + 0x1b0]
0000000145b51bb5 48898d3c010000                 mov qword ptr [rbp + 0x13c], rcx
0000000145b51bbc 898550010000                   mov dword ptr [rbp + 0x150], eax
0000000145b51bc2 48898d48010000                 mov qword ptr [rbp + 0x148], rcx
0000000145b51bc9 f30f119d54010000               movss dword ptr [rbp + 0x154], xmm3
0000000145b51bd1 c7855801000000000000           mov dword ptr [rbp + 0x158], 0
0000000145b51bdb f30f11855c010000               movss dword ptr [rbp + 0x15c], xmm0
0000000145b51be3 f3440f11ad60010000             movss dword ptr [rbp + 0x160], xmm13
0000000145b51bec 0f119564010000                 movups xmmword ptr [rbp + 0x164], xmm2
0000000145b51bf3 0f119574010000                 movups xmmword ptr [rbp + 0x174], xmm2
0000000145b51bfa f3440f119d84010000             movss dword ptr [rbp + 0x184], xmm11
0000000145b51c03 0f119588010000                 movups xmmword ptr [rbp + 0x188], xmm2
0000000145b51c0a 4088bd98010000                 mov byte ptr [rbp + 0x198], dil
0000000145b51c11 c6859901000000                 mov byte ptr [rbp + 0x199], 0
0000000145b51c18 488bbec0050000                 mov rdi, qword ptr [rsi + 0x5c0]
0000000145b51c1f 483bbeb0050000                 cmp rdi, qword ptr [rsi + 0x5b0]
0000000145b51c26 750d                           jne 0x145b51c35
0000000145b51c28 488d8eb0050000                 lea rcx, [rsi + 0x5b0]
0000000145b51c2f e8aca36300                     call 0x14618bfe0
0000000145b51c34 90                             nop
0000000145b51c35 4869cfe0010000                 imul rcx, rdi, 0x1e0
0000000145b51c3c 48038eb8050000                 add rcx, qword ptr [rsi + 0x5b8]
0000000145b51c43 488d55c0                       lea rdx, [rbp - 0x40]
0000000145b51c47 41b8e0010000                   mov r8d, 0x1e0
0000000145b51c4d e8f9334b00                     call 0x14600504b
0000000145b51c52 48ffc7                         inc rdi
0000000145b51c55 4889bec0050000                 mov qword ptr [rsi + 0x5c0], rdi
