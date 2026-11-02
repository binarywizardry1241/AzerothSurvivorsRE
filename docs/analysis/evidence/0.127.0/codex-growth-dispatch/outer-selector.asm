0000000140352e77 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
0000000140352e7e 0fb64044                       movzx eax, byte ptr [rax + 0x44]
0000000140352e82 4883f810                       cmp rax, 0x10
0000000140352e86 0f87df050000                   ja 0x14035346b
0000000140352e8c 488d0d49ecf205                 lea rcx, [rip + 0x5f2ec49]
0000000140352e93 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000140352e97 4801c8                         add rax, rcx
0000000140352e9a ffe0                           jmp rax
