0000000145b7d844 e8b74948fa                     call 0x140002200
0000000145b7d849 b948000000                     mov ecx, 0x48
0000000145b7d84e ba08000000                     mov edx, 8
0000000145b7d853 e8684948fa                     call 0x1400021c0
0000000145b7d858 4885c0                         test rax, rax
0000000145b7d85b 0f842e040000                   je 0x145b7dc8f
0000000145b7d861 48894378                       mov qword ptr [rbx + 0x78], rax
0000000145b7d865 31c9                           xor ecx, ecx
0000000145b7d867 e844cb94fa                     call 0x1404ca3b0
0000000145b7d86c 90                             nop 
0000000145b7d86d 4885c0                         test rax, rax
0000000145b7d870 0f8433040000                   je 0x145b7dca9
0000000145b7d876 0f1000                         movups xmm0, xmmword ptr [rax]
0000000145b7d879 48ff00                         inc qword ptr [rax]
0000000145b7d87c 0f100ddd135001                 movups xmm1, xmmword ptr [rip + 0x15013dd]
0000000145b7d883 0f118b96010000                 movups xmmword ptr [rbx + 0x196], xmm1
0000000145b7d88a 0f100dbf135001                 movups xmm1, xmmword ptr [rip + 0x15013bf]
0000000145b7d891 0f118b86010000                 movups xmmword ptr [rbx + 0x186], xmm1
0000000145b7d898 488b5378                       mov rdx, qword ptr [rbx + 0x78]
0000000145b7d89c 66c742100000                   mov word ptr [rdx + 0x10], 0
0000000145b7d8a2 0f108b80010000                 movups xmm1, xmmword ptr [rbx + 0x180]
0000000145b7d8a9 0f109390010000                 movups xmm2, xmmword ptr [rbx + 0x190]
0000000145b7d8b0 0f114a12                       movups xmmword ptr [rdx + 0x12], xmm1
0000000145b7d8b4 0f115222                       movups xmmword ptr [rdx + 0x22], xmm2
0000000145b7d8b8 488b839e010000                 mov rax, qword ptr [rbx + 0x19e]
0000000145b7d8bf 48894230                       mov qword ptr [rdx + 0x30], rax
0000000145b7d8c3 0f114238                       movups xmmword ptr [rdx + 0x38], xmm0
0000000145b7d8c7 48c70201000000                 mov qword ptr [rdx], 1
0000000145b7d8ce 48c7420801000000               mov qword ptr [rdx + 8], 1
0000000145b7d8d6 488993d0000000                 mov qword ptr [rbx + 0xd0], rdx
