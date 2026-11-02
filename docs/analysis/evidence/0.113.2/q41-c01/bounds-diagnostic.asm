0000000145e9c123: 55                             push rbp
0000000145e9c124: 4883ec50                       sub rsp, 0x50
0000000145e9c128: 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145e9c12d: 488d45f8                       lea rax, [rbp - 8]
0000000145e9c131: 488908                         mov qword ptr [rax], rcx
0000000145e9c134: 488d4df0                       lea rcx, [rbp - 0x10]
0000000145e9c138: 488911                         mov qword ptr [rcx], rdx
0000000145e9c13b: 488d55d0                       lea rdx, [rbp - 0x30]
0000000145e9c13f: 48890a                         mov qword ptr [rdx], rcx
0000000145e9c142: 488d0d372fe4ff                 lea rcx, [rip - 0x1bd0c9]
0000000145e9c149: 48894a08                       mov qword ptr [rdx + 8], rcx
0000000145e9c14d: 48894210                       mov qword ptr [rdx + 0x10], rax
0000000145e9c151: 48894a18                       mov qword ptr [rdx + 0x18], rcx
0000000145e9c155: 488d0d74c05001                 lea rcx, [rip + 0x150c074]
0000000145e9c15c: e89f010000                     call 0x145e9c300
0000000145e9c161: 0f0b                           ud2
