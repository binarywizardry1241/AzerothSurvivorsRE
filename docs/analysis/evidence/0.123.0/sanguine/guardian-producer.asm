0000000145b8c478 0f57c0                         xorps xmm0, xmm0
0000000145b8c47b f30f58f8                       addss xmm7, xmm0
0000000145b8c47f 488d4d68                       lea rcx, [rbp + 0x68]
0000000145b8c483 c6410800                       mov byte ptr [rcx + 8], 0
0000000145b8c487 48c70100000000                 mov qword ptr [rcx], 0
0000000145b8c48e 48c745c800000000               mov qword ptr [rbp - 0x38], 0
0000000145b8c496 48c745d008000000               mov qword ptr [rbp - 0x30], 8
0000000145b8c49e 48c745d800000000               mov qword ptr [rbp - 0x28], 0
0000000145b8c4a6 48c745e0ffffffff               mov qword ptr [rbp - 0x20], 0xffffffffffffffff
0000000145b8c4ae 4c897d20                       mov qword ptr [rbp + 0x20], r15
0000000145b8c4b2 48894528                       mov qword ptr [rbp + 0x28], rax
0000000145b8c4b6 4c897d30                       mov qword ptr [rbp + 0x30], r15
0000000145b8c4ba 4c896538                       mov qword ptr [rbp + 0x38], r12
0000000145b8c4be 4c897d40                       mov qword ptr [rbp + 0x40], r15
0000000145b8c4c2 4c896548                       mov qword ptr [rbp + 0x48], r12
0000000145b8c4c6 4c897d50                       mov qword ptr [rbp + 0x50], r15
0000000145b8c4ca 48895d58                       mov qword ptr [rbp + 0x58], rbx
0000000145b8c4ce 48895560                       mov qword ptr [rbp + 0x60], rdx
0000000145b8c4d2 c7457800000000                 mov dword ptr [rbp + 0x78], 0
0000000145b8c4d9 c7858000000000000000           mov dword ptr [rbp + 0x80], 0
0000000145b8c4e3 c7858800000000000000           mov dword ptr [rbp + 0x88], 0
0000000145b8c4ed c78598000000ffffffff           mov dword ptr [rbp + 0x98], 0xffffffff
0000000145b8c4f7 4c89b5b8000000                 mov qword ptr [rbp + 0xb8], r14
0000000145b8c4fe 48c785c000000000000000         mov qword ptr [rbp + 0xc0], 0
0000000145b8c509 488b85f8010000                 mov rax, qword ptr [rbp + 0x1f8]
0000000145b8c510 488985c8000000                 mov qword ptr [rbp + 0xc8], rax
0000000145b8c517 0f57c0                         xorps xmm0, xmm0
0000000145b8c51a 0f1181a8000000                 movups xmmword ptr [rcx + 0xa8], xmm0
0000000145b8c521 0f118198000000                 movups xmmword ptr [rcx + 0x98], xmm0
0000000145b8c528 0f118188000000                 movups xmmword ptr [rcx + 0x88], xmm0
0000000145b8c52f 0f114178                       movups xmmword ptr [rcx + 0x78], xmm0
0000000145b8c533 0f114168                       movups xmmword ptr [rcx + 0x68], xmm0
0000000145b8c537 48c781b800000000000000         mov qword ptr [rcx + 0xb8], 0
0000000145b8c542 f30f11b528010000               movss dword ptr [rbp + 0x128], xmm6
0000000145b8c54a f30f11b52c010000               movss dword ptr [rbp + 0x12c], xmm6
0000000145b8c552 f30f11a530010000               movss dword ptr [rbp + 0x130], xmm4
0000000145b8c55a 450fc6e4e1                     shufps xmm12, xmm12, 0xe1
0000000145b8c55f 440f13a534010000               movlps qword ptr [rbp + 0x134], xmm12
0000000145b8c567 f3440f11ad3c010000             movss dword ptr [rbp + 0x13c], xmm13
0000000145b8c570 f3440f11b540010000             movss dword ptr [rbp + 0x140], xmm14
0000000145b8c579 8b85c8010000                   mov eax, dword ptr [rbp + 0x1c8]
0000000145b8c57f 8981e4000000                   mov dword ptr [rcx + 0xe4], eax
0000000145b8c585 488b85c0010000                 mov rax, qword ptr [rbp + 0x1c0]
0000000145b8c58c 488981dc000000                 mov qword ptr [rcx + 0xdc], rax
0000000145b8c593 8b85c8010000                   mov eax, dword ptr [rbp + 0x1c8]
0000000145b8c599 8981f0000000                   mov dword ptr [rcx + 0xf0], eax
0000000145b8c59f 488b85c0010000                 mov rax, qword ptr [rbp + 0x1c0]
0000000145b8c5a6 488981e8000000                 mov qword ptr [rcx + 0xe8], rax
0000000145b8c5ad f30f11ad5c010000               movss dword ptr [rbp + 0x15c], xmm5
0000000145b8c5b5 c7856001000000000000           mov dword ptr [rbp + 0x160], 0
0000000145b8c5bf f30f11ad64010000               movss dword ptr [rbp + 0x164], xmm5
0000000145b8c5c7 f3440f118568010000             movss dword ptr [rbp + 0x168], xmm8
0000000145b8c5d0 0f118114010000                 movups xmmword ptr [rcx + 0x114], xmm0
0000000145b8c5d7 0f118104010000                 movups xmmword ptr [rcx + 0x104], xmm0
0000000145b8c5de f30f11bd8c010000               movss dword ptr [rbp + 0x18c], xmm7
0000000145b8c5e6 0f118128010000                 movups xmmword ptr [rcx + 0x128], xmm0
0000000145b8c5ed 0fb68507020000                 movzx eax, byte ptr [rbp + 0x207]
0000000145b8c5f4 8885a0010000                   mov byte ptr [rbp + 0x1a0], al
0000000145b8c5fa c685a101000000                 mov byte ptr [rbp + 0x1a1], 0
0000000145b8c601 4c8bbec0050000                 mov r15, qword ptr [rsi + 0x5c0]
0000000145b8c608 4c3bbeb0050000                 cmp r15, qword ptr [rsi + 0x5b0]
0000000145b8c60f 750d                           jne 0x145b8c61e
0000000145b8c611 488d8eb0050000                 lea rcx, [rsi + 0x5b0]
0000000145b8c618 e8c3f95f00                     call 0x14618bfe0
0000000145b8c61d 90                             nop
0000000145b8c61e 4969cfe0010000                 imul rcx, r15, 0x1e0
0000000145b8c625 48038eb8050000                 add rcx, qword ptr [rsi + 0x5b8]
0000000145b8c62c 41b8e0010000                   mov r8d, 0x1e0
0000000145b8c632 488d55c8                       lea rdx, [rbp - 0x38]
0000000145b8c636 e8108a4700                     call 0x14600504b
0000000145b8c63b 49ffc7                         inc r15
0000000145b8c63e 4c89bec0050000                 mov qword ptr [rsi + 0x5c0], r15
