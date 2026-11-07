0000000145a95c14  4d8b8748010000         mov r8, qword ptr [r15 + 0x148]
0000000145a95c1b  4d85c0                 test r8, r8
0000000145a95c1e  0f8470010000           je 0x145a95d94
0000000145a95c24  498b9740010000         mov rdx, qword ptr [r15 + 0x140]
0000000145a95c2b  4901d0                 add r8, rdx
0000000145a95c2e  488d8dd0000000         lea rcx, [rbp + 0xd0]
0000000145a95c35  e876551b00             call 0x145c4b1b0
0000000145a95c3a  90                     nop
0000000145a95c3b  488bb5d8000000         mov rsi, qword ptr [rbp + 0xd8]
0000000145a95c42  488bbde0000000         mov rdi, qword ptr [rbp + 0xe0]
0000000145a95c49  48c744242001000000     mov qword ptr [rsp + 0x20], 1
0000000145a95c52  4c8d0db7f94e01         lea r9, [rip + 0x14ef9b7]
0000000145a95c59  488d4d10               lea rcx, [rbp + 0x10]
0000000145a95c5d  4889f2                 mov rdx, rsi
0000000145a95c60  4989f8                 mov r8, rdi
0000000145a95c63  e8a875feff             call 0x145a7d210
0000000145a95c68  90                     nop
0000000145a95c69  488b4520               mov rax, qword ptr [rbp + 0x20]
0000000145a95c6d  48898500010000         mov qword ptr [rbp + 0x100], rax
0000000145a95c74  f30f6f4510             movdqu xmm0, xmmword ptr [rbp + 0x10]
0000000145a95c79  660f7f85f0000000       movdqa xmmword ptr [rbp + 0xf0], xmm0
0000000145a95c81  488d85f0000000         lea rax, [rbp + 0xf0]
0000000145a95c88  488985b0000000         mov qword ptr [rbp + 0xb0], rax
0000000145a95c8f  488d054ac456fa         lea rax, [rip - 0x5a93bb6]
0000000145a95c96  488985b8000000         mov qword ptr [rbp + 0xb8], rax
0000000145a95c9d  488d15b3024f01         lea rdx, [rip + 0x14f02b3]
0000000145a95ca4  488d4d10               lea rcx, [rbp + 0x10]
0000000145a95ca8  4c8d85b0000000         lea r8, [rbp + 0xb0]
0000000145a95caf  e84c0b4e00             call 0x145f76800
