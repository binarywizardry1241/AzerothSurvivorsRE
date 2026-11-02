; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf737b 8b8d88000000                   mov ecx, dword ptr [rbp + 0x88]
0000000145bf7381 48c7850002000000000000         mov qword ptr [rbp + 0x200], 0
0000000145bf738c 48c7850802000008000000         mov qword ptr [rbp + 0x208], 8
0000000145bf7397 488d8518020000                 lea rax, [rbp + 0x218]
0000000145bf739e 0f1170f8                       movups xmmword ptr [rax - 8], xmm6
0000000145bf73a2 66c785200200000100             mov word ptr [rbp + 0x220], 1
0000000145bf73ab 898da8020000                   mov dword ptr [rbp + 0x2a8], ecx
0000000145bf73b1 894d20                         mov dword ptr [rbp + 0x20], ecx
0000000145bf73b4 488b8df0010000                 mov rcx, qword ptr [rbp + 0x1f0]
0000000145bf73bb 488d5520                       lea rdx, [rbp + 0x20]
0000000145bf73bf e89c1592fa                     call 0x140518960
0000000145bf73c4 4889c6                         mov rsi, rax
0000000145bf73c7 4983bc249001000000             cmp qword ptr [r12 + 0x190], 0
0000000145bf73d0 0f8410140000                   je 0x145bf87e6
0000000145bf73d6 498b842480010000               mov rax, qword ptr [r12 + 0x180]
0000000145bf73de 498b942488010000               mov rdx, qword ptr [r12 + 0x188]
0000000145bf73e6 4889f1                         mov rcx, rsi
0000000145bf73e9 48c1e939                       shr rcx, 0x39
0000000145bf73ed 660f6ec1                       movd xmm0, ecx
0000000145bf73f1 660f60c0                       punpcklbw xmm0, xmm0
0000000145bf73f5 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bf73fa 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bf73ff 4531d2                         xor r10d, r10d
0000000145bf7402 4531c9                         xor r9d, r9d
0000000145bf7405 4821d6                         and rsi, rdx
0000000145bf7408 f30f6f0c30                     movdqu xmm1, xmmword ptr [rax + rsi]
0000000145bf740d 660f6fd1                       movdqa xmm2, xmm1
0000000145bf7411 660f74d0                       pcmpeqb xmm2, xmm0
0000000145bf7415 66440fd7da                     pmovmskb r11d, xmm2
0000000145bf741a 4585db                         test r11d, r11d
0000000145bf741d 7441                           je 0x145bf7460
0000000145bf741f 4d89d0                         mov r8, r10
0000000145bf7422 4d89ca                         mov r10, r9
0000000145bf7425 f3450fbcf3                     tzcnt r14d, r11d
0000000145bf742a 4901f6                         add r14, rsi
0000000145bf742d 4921d6                         and r14, rdx
0000000145bf7430 49f7de                         neg r14
0000000145bf7433 4f8d3476                       lea r14, [r14 + r14*2]
0000000145bf7437 49c1e604                       shl r14, 4
0000000145bf743b 448b8da8020000                 mov r9d, dword ptr [rbp + 0x2a8]
0000000145bf7442 463b4c30d0                     cmp r9d, dword ptr [rax + r14 - 0x30]
0000000145bf7447 0f84c4060000                   je 0x145bf7b11
0000000145bf744d 458d73ff                       lea r14d, [r11 - 1]
0000000145bf7451 664521de                       and r14w, r11w
0000000145bf7455 4589f3                         mov r11d, r14d
0000000145bf7458 4d89d1                         mov r9, r10
0000000145bf745b 4d89c2                         mov r10, r8
0000000145bf745e 75bf                           jne 0x145bf741f
0000000145bf7460 4983fa01                       cmp r10, 1
0000000145bf7464 4c8b85b0020000                 mov r8, qword ptr [rbp + 0x2b0]
0000000145bf746b 7415                           je 0x145bf7482
0000000145bf746d 66440fd7c1                     pmovmskb r8d, xmm1
0000000145bf7472 4585c0                         test r8d, r8d
0000000145bf7475 742c                           je 0x145bf74a3
0000000145bf7477 f3450fbcc0                     tzcnt r8d, r8d
0000000145bf747c 4901f0                         add r8, rsi
0000000145bf747f 4921d0                         and r8, rdx
0000000145bf7482 660f74cf                       pcmpeqb xmm1, xmm7
0000000145bf7486 66440fd7d1                     pmovmskb r10d, xmm1
0000000145bf748b 4585d2                         test r10d, r10d
0000000145bf748e 0f85da0a0000                   jne 0x145bf7f6e
0000000145bf7494 4c8985b0020000                 mov qword ptr [rbp + 0x2b0], r8
0000000145bf749b 41ba01000000                   mov r10d, 1
0000000145bf74a1 eb03                           jmp 0x145bf74a6
0000000145bf74a3 4531d2                         xor r10d, r10d
0000000145bf74a6 4c01ce                         add rsi, r9
0000000145bf74a9 4883c610                       add rsi, 0x10
0000000145bf74ad 4983c110                       add r9, 0x10
0000000145bf74b1 e94fffffff                     jmp 0x145bf7405
