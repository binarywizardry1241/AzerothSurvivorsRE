; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone5.0.7
0000000145bf7925 8bb5a0000000                   mov esi, dword ptr [rbp + 0xa0]
0000000145bf792b 85f6                           test esi, esi
0000000145bf792d 0f85d3020000                   jne 0x145bf7c06
0000000145bf7933 4180bc24e001000000             cmp byte ptr [r12 + 0x1e0], 0
0000000145bf793c 0f84c4020000                   je 0x145bf7c06
0000000145bf7942 488b8588000000                 mov rax, qword ptr [rbp + 0x88]
0000000145bf7949 488985a8020000                 mov qword ptr [rbp + 0x2a8], rax
0000000145bf7950 4c8b8590000000                 mov r8, qword ptr [rbp + 0x90]
0000000145bf7957 4c8b8d98000000                 mov r9, qword ptr [rbp + 0x98]
0000000145bf795e 4c89e1                         mov rcx, r12
0000000145bf7961 31d2                           xor edx, edx
0000000145bf7963 4c8985b0020000                 mov qword ptr [rbp + 0x2b0], r8
0000000145bf796a e821330000                     call 0x145bfac90
