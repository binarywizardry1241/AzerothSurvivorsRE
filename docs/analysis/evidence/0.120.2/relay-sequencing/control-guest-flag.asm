; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone5.0.7
0000000145bf7add 31c0                           xor eax, eax
0000000145bf7adf 48b90b00000000000080           movabs rcx, 0x800000000000000b
0000000145bf7ae9 48398d80020000                 cmp qword ptr [rbp + 0x280], rcx
0000000145bf7af0 7508                           jne 0x145bf7afa
0000000145bf7af2 418b8424e0010000               mov eax, dword ptr [r12 + 0x1e0]
0000000145bf7afa 41888424e2010000               mov byte ptr [r12 + 0x1e2], al
