0000000145cb7d37 448b85b0010000                 mov r8d, dword ptr [rbp + 0x1b0]
0000000145cb7d3e 488d8d98010000                 lea rcx, [rbp + 0x198]
0000000145cb7d45 488b4110                       mov rax, qword ptr [rcx + 0x10]
0000000145cb7d49 48894560                       mov qword ptr [rbp + 0x60], rax
0000000145cb7d4d f30f6f01                       movdqu xmm0, xmmword ptr [rcx]
0000000145cb7d51 660f7f4550                     movdqa xmmword ptr [rbp + 0x50], xmm0
0000000145cb7d56 c6856603000001                 mov byte ptr [rbp + 0x366], 1
0000000145cb7d5d c6856503000001                 mov byte ptr [rbp + 0x365], 1
0000000145cb7d64 c6856403000001                 mov byte ptr [rbp + 0x364], 1
0000000145cb7d6b c6856303000001                 mov byte ptr [rbp + 0x363], 1
0000000145cb7d72 c6856203000001                 mov byte ptr [rbp + 0x362], 1
0000000145cb7d79 c6856103000001                 mov byte ptr [rbp + 0x361], 1
0000000145cb7d80 c6856003000000                 mov byte ptr [rbp + 0x360], 0
0000000145cb7d87 488d8d10020000                 lea rcx, [rbp + 0x210]
0000000145cb7d8e 488b5538                       mov rdx, qword ptr [rbp + 0x38]
0000000145cb7d92 4c8d4d50                       lea r9, [rbp + 0x50]
0000000145cb7d96 e89572eeff                     call 0x145b9f030
0000000145cb7d9b 90                             nop 
0000000145cb7d9c 488b9510020000                 mov rdx, qword ptr [rbp + 0x210]
0000000145cb7da3 4883faff                       cmp rdx, -1
0000000145cb7da7 0f8415120000                   je 0x145cb8fc2
0000000145cb7dad 4885d2                         test rdx, rdx
0000000145cb7db0 0f840c120000                   je 0x145cb8fc2
0000000145cb7db6 488b8d18020000                 mov rcx, qword ptr [rbp + 0x218]
0000000145cb7dbd 41b801000000                   mov r8d, 1
0000000145cb7dc3 e808a434fa                     call 0x1400021d0
0000000145cb7dc8 e9f5110000                     jmp 0x145cb8fc2
