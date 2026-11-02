0000000145c1637e 488b8520010000                 mov rax, qword ptr [rbp + 0x120]
0000000145c16385 48c1e005                       shl rax, 5
0000000145c16389 488d0440                       lea rax, [rax + rax*2]
0000000145c1638d 31c9                           xor ecx, ecx
0000000145c1638f 4c8b95e8010000                 mov r10, qword ptr [rbp + 0x1e8]
0000000145c16396 488bbdd0010000                 mov rdi, qword ptr [rbp + 0x1d0]
0000000145c1639d 4c8ba5c0010000                 mov r12, qword ptr [rbp + 0x1c0]
0000000145c163a4 488b95d8010000                 mov rdx, qword ptr [rbp + 0x1d8]
0000000145c163ab 0f1f440000                     nop dword ptr [rax + rax]
0000000145c163b0 4839c8                         cmp rax, rcx
0000000145c163b3 0f84ed360000                   je 0x145c19aa6
0000000145c163b9 488b340a                       mov rsi, qword ptr [rdx + rcx]
0000000145c163bd 44397e40                       cmp dword ptr [rsi + 0x40], r15d
0000000145c163c1 0f84d4fcffff                   je 0x145c1609b
0000000145c163c7 4883c160                       add rcx, 0x60
0000000145c163cb 44397e64                       cmp dword ptr [rsi + 0x64], r15d
0000000145c163cf 75df                           jne 0x145c163b0
0000000145c163d1 e9c5fcffff                     jmp 0x145c1609b
