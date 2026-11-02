0000000145c5dc8d 41c68424e001000001             mov byte ptr [r12 + 0x1e0], 1
0000000145c5dc96 488b8d78020000                 mov rcx, qword ptr [rbp + 0x278]
0000000145c5dc9d e8ce770000                     call 0x145c65470
0000000145c5dca2 c685c602000001                 mov byte ptr [rbp + 0x2c6], 1
0000000145c5dca9 488b4d68                       mov rcx, qword ptr [rbp + 0x68]
0000000145c5dcad 31d2                           xor edx, edx
0000000145c5dcaf e8bc530100                     call 0x145c73070
0000000145c5dcb4 90                             nop
0000000145c5dcb5 49c744245000000000             mov qword ptr [r12 + 0x50], 0
0000000145c5dcbe 6641c78424e10100000000         mov word ptr [r12 + 0x1e1], 0
