0000000145b362cc  498b4510               mov rax, qword ptr [r13 + 0x10]
0000000145b362d0  488945e0               mov qword ptr [rbp - 0x20], rax
0000000145b362d4  410f104500             movups xmm0, xmmword ptr [r13]
0000000145b362d9  0f2945d0               movaps xmmword ptr [rbp - 0x30], xmm0
0000000145b362dd  488dbe38010000         lea rdi, [rsi + 0x138]
0000000145b362e4  488b9638010000         mov rdx, qword ptr [rsi + 0x138]
0000000145b362eb  4885d2                 test rdx, rdx
0000000145b362ee  7412                   je 0x145b36302
0000000145b362f0  488b8e40010000         mov rcx, qword ptr [rsi + 0x140]
0000000145b362f7  41b801000000           mov r8d, 1
0000000145b362fd  e8cebe4cfa             call 0x1400021d0
0000000145b36302  488b45e0               mov rax, qword ptr [rbp - 0x20]
0000000145b36306  48894710               mov qword ptr [rdi + 0x10], rax
0000000145b3630a  0f2845d0               movaps xmm0, xmmword ptr [rbp - 0x30]
0000000145b3630e  0f1107                 movups xmmword ptr [rdi], xmm0
