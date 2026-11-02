; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone5.0.7
0000000145bf7cea 4c01d1                         add rcx, r10
0000000145bf7ced 48b80b00000000000080           movabs rax, 0x800000000000000b
0000000145bf7cf7 48398580020000                 cmp qword ptr [rbp + 0x280], rax
0000000145bf7cfe 0f9441f9                       sete byte ptr [rcx - 7]
