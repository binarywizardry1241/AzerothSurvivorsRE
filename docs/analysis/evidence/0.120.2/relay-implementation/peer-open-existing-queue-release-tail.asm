; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf7d11 488b8578020000                 mov rax, qword ptr [rbp + 0x278]
0000000145bf7d18 4885c0                         test rax, rax
0000000145bf7d1b 0f84fd020000                   je 0x145bf801e
0000000145bf7d21 48c1e003                       shl rax, 3
0000000145bf7d25 488d1440                       lea rdx, [rax + rax*2]
0000000145bf7d29 41b808000000                   mov r8d, 8
0000000145bf7d2f 488b8db0020000                 mov rcx, qword ptr [rbp + 0x2b0]
0000000145bf7d36 e895a440fa                     call 0x1400021d0
0000000145bf7d3b e9de020000                     jmp 0x145bf801e
