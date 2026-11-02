0000000145d17330 55                             push rbp
0000000145d17331 56                             push rsi
0000000145d17332 57                             push rdi
0000000145d17333 53                             push rbx
0000000145d17334 4881ece8000000                 sub rsp, 0xe8
0000000145d1733b 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145d17343 48c74560feffffff               mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0000000145d1734b 4c89c7                         mov rdi, r8
0000000145d1734e 4889d3                         mov rbx, rdx
0000000145d17351 4889ce                         mov rsi, rcx
0000000145d17354 48c7453000000000               mov qword ptr [rbp + 0x30], 0
0000000145d1735c 48c7453801000000               mov qword ptr [rbp + 0x38], 1
0000000145d17364 48c7454000000000               mov qword ptr [rbp + 0x40], 0
0000000145d1736c e88fae2efa                     call 0x140002200
0000000145d17371 b900800000                     mov ecx, 0x8000
0000000145d17376 ba01000000                     mov edx, 1
0000000145d1737b e870ae2efa                     call 0x1400021f0
0000000145d17380 48894558                       mov qword ptr [rbp + 0x58], rax
0000000145d17384 4885c0                         test rax, rax
0000000145d17387 0f84fc010000                   je 0x145d17589
0000000145d1738d 488d4d18                       lea rcx, [rbp + 0x18]
0000000145d17391 31d2                           xor edx, edx
0000000145d17393 e868e22d00                     call 0x145ff5600
0000000145d17398 90                             nop 
0000000145d17399 0f57c0                         xorps xmm0, xmm0
0000000145d1739c 0f1145d8                       movups xmmword ptr [rbp - 0x28], xmm0
0000000145d173a0 0f104518                       movups xmm0, xmmword ptr [rbp + 0x18]
0000000145d173a4 0f1145e8                       movups xmmword ptr [rbp - 0x18], xmm0
0000000145d173a8 488b4528                       mov rax, qword ptr [rbp + 0x28]
0000000145d173ac 488945f8                       mov qword ptr [rbp - 8], rax
0000000145d173b0 48895db8                       mov qword ptr [rbp - 0x48], rbx
0000000145d173b4 48897dc0                       mov qword ptr [rbp - 0x40], rdi
0000000145d173b8 488b4558                       mov rax, qword ptr [rbp + 0x58]
0000000145d173bc 488945c8                       mov qword ptr [rbp - 0x38], rax
0000000145d173c0 48c745d000800000               mov qword ptr [rbp - 0x30], 0x8000
0000000145d173c8 48c7450001004000               mov qword ptr [rbp], 0x400001
0000000145d173d0 48c7450801004000               mov qword ptr [rbp + 8], 0x400001
0000000145d173d8 488d4db8                       lea rcx, [rbp - 0x48]
0000000145d173dc 488d5530                       lea rdx, [rbp + 0x30]
0000000145d173e0 4531c0                         xor r8d, r8d
0000000145d173e3 e8c8e6e2ff                     call 0x145b45ab0
0000000145d173e8 90                             nop 
0000000145d173e9 4883f801                       cmp rax, 1
0000000145d173ed 7560                           jne 0x145d1744f
0000000145d173ef 89d0                           mov eax, edx
0000000145d173f1 83e003                         and eax, 3
0000000145d173f4 8d48fe                         lea ecx, [rax - 2]
0000000145d173f7 83f902                         cmp ecx, 2
0000000145d173fa 721b                           jb 0x145d17417
0000000145d173fc 4885c0                         test rax, rax
0000000145d173ff 7416                           je 0x145d17417
0000000145d17401 488d42ff                       lea rax, [rdx - 1]
0000000145d17405 488d4d20                       lea rcx, [rbp + 0x20]
0000000145d17409 48894520                       mov qword ptr [rbp + 0x20], rax
0000000145d1740d c6451803                       mov byte ptr [rbp + 0x18], 3
0000000145d17411 e8eaf93200                     call 0x146046e00
0000000145d17416 90                             nop 
0000000145d17417 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145d1741e 488b55d0                       mov rdx, qword ptr [rbp - 0x30]
0000000145d17422 4885d2                         test rdx, rdx
0000000145d17425 740f                           je 0x145d17436
0000000145d17427 488b4dc8                       mov rcx, qword ptr [rbp - 0x38]
0000000145d1742b 41b801000000                   mov r8d, 1
0000000145d17431 e89aad2efa                     call 0x1400021d0
0000000145d17436 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145d1743a ba20a90000                     mov edx, 0xa920
0000000145d1743f 41b808000000                   mov r8d, 8
0000000145d17445 e886ad2efa                     call 0x1400021d0
0000000145d1744a e913010000                     jmp 0x145d17562
0000000145d1744f 488b55d0                       mov rdx, qword ptr [rbp - 0x30]
0000000145d17453 4885d2                         test rdx, rdx
0000000145d17456 740f                           je 0x145d17467
0000000145d17458 488b4dc8                       mov rcx, qword ptr [rbp - 0x38]
0000000145d1745c 41b801000000                   mov r8d, 1
0000000145d17462 e869ad2efa                     call 0x1400021d0
0000000145d17467 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145d1746b ba20a90000                     mov edx, 0xa920
0000000145d17470 41b808000000                   mov r8d, 8
0000000145d17476 e855ad2efa                     call 0x1400021d0
0000000145d1747b 488b4540                       mov rax, qword ptr [rbp + 0x40]
0000000145d1747f 483d00004000                   cmp rax, 0x400000
0000000145d17485 760c                           jbe 0x145d17493
0000000145d17487 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145d1748e e9cf000000                     jmp 0x145d17562
0000000145d17493 488b4d38                       mov rcx, qword ptr [rbp + 0x38]
0000000145d17497 48894db8                       mov qword ptr [rbp - 0x48], rcx
0000000145d1749b 488945c0                       mov qword ptr [rbp - 0x40], rax
0000000145d1749f 48c745c800000000               mov qword ptr [rbp - 0x38], 0
0000000145d174a7 c645d001                       mov byte ptr [rbp - 0x30], 1
0000000145d174ab 488d7db8                       lea rdi, [rbp - 0x48]
0000000145d174af ba04000000                     mov edx, 4
0000000145d174b4 4889f9                         mov rcx, rdi
0000000145d174b7 e854c61a00                     call 0x145ec3b10
0000000145d174bc 90                             nop 
0000000145d174bd 48897d18                       mov qword ptr [rbp + 0x18], rdi
0000000145d174c1 48c7452000000000               mov qword ptr [rbp + 0x20], 0
0000000145d174c9 48894528                       mov qword ptr [rbp + 0x28], rax
0000000145d174cd 488d4da0                       lea rcx, [rbp - 0x60]
0000000145d174d1 488d5518                       lea rdx, [rbp + 0x18]
0000000145d174d5 e8869bfdff                     call 0x145cf1060
0000000145d174da 90                             nop 
0000000145d174db 807dd000                       cmp byte ptr [rbp - 0x30], 0
0000000145d174df 7411                           je 0x145d174f2
0000000145d174e1 488b45b0                       mov rax, qword ptr [rbp - 0x50]
0000000145d174e5 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145d174e9 0f1045a0                       movups xmm0, xmmword ptr [rbp - 0x60]
0000000145d174ed 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145d174f0 eb70                           jmp 0x145d17562
0000000145d174f2 488b45a0                       mov rax, qword ptr [rbp - 0x60]
0000000145d174f6 48894548                       mov qword ptr [rbp + 0x48], rax
0000000145d174fa 488b4da8                       mov rcx, qword ptr [rbp - 0x58]
0000000145d174fe 488b45b0                       mov rax, qword ptr [rbp - 0x50]
0000000145d17502 48894510                       mov qword ptr [rbp + 0x10], rax
0000000145d17506 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145d1750d 48c7455800000000               mov qword ptr [rbp + 0x58], 0
0000000145d17515 48894d50                       mov qword ptr [rbp + 0x50], rcx
0000000145d17519 0f1f8000000000                 nop dword ptr [rax]
0000000145d17520 488b4558                       mov rax, qword ptr [rbp + 0x58]
0000000145d17524 48394510                       cmp qword ptr [rbp + 0x10], rax
0000000145d17528 7419                           je 0x145d17543
0000000145d1752a 48ffc0                         inc rax
0000000145d1752d 48894558                       mov qword ptr [rbp + 0x58], rax
0000000145d17531 488db938020000                 lea rdi, [rcx + 0x238]
0000000145d17538 e8e327fdff                     call 0x145ce9d20
0000000145d1753d 90                             nop 
0000000145d1753e 4889f9                         mov rcx, rdi
0000000145d17541 ebdd                           jmp 0x145d17520
0000000145d17543 488b4548                       mov rax, qword ptr [rbp + 0x48]
0000000145d17547 4885c0                         test rax, rax
0000000145d1754a 7416                           je 0x145d17562
0000000145d1754c 4869d038020000                 imul rdx, rax, 0x238
0000000145d17553 41b808000000                   mov r8d, 8
0000000145d17559 488b4d50                       mov rcx, qword ptr [rbp + 0x50]
0000000145d1755d e9e3feffff                     jmp 0x145d17445
0000000145d17562 488b5530                       mov rdx, qword ptr [rbp + 0x30]
0000000145d17566 4885d2                         test rdx, rdx
0000000145d17569 740f                           je 0x145d1757a
0000000145d1756b 488b4d38                       mov rcx, qword ptr [rbp + 0x38]
0000000145d1756f 41b801000000                   mov r8d, 1
0000000145d17575 e856ac2efa                     call 0x1400021d0
0000000145d1757a 4889f0                         mov rax, rsi
0000000145d1757d 4881c4e8000000                 add rsp, 0xe8
0000000145d17584 5b                             pop rbx
0000000145d17585 5f                             pop rdi
0000000145d17586 5e                             pop rsi
0000000145d17587 5d                             pop rbp
0000000145d17588 c3                             ret 
0000000145d17589 b901000000                     mov ecx, 1
0000000145d1758e ba00800000                     mov edx, 0x8000
0000000145d17593 e8d3134f00                     call 0x14620896b
0000000145d17598 90                             nop 
0000000145d17599 0f0b                           ud2 
