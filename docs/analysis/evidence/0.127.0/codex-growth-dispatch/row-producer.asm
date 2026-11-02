0000000140351c5e 488b05c3c93008                 mov rax, qword ptr [rip + 0x830c9c3]
0000000140351c65 488b5008                       mov rdx, qword ptr [rax + 8]
0000000140351c69 4839d1                         cmp rcx, rdx
0000000140351c6c 0f83f21b0000                   jae 0x140353864
0000000140351c72 488d0cc9                       lea rcx, [rcx + rcx*8]
0000000140351c76 48c1e103                       shl rcx, 3
0000000140351c7a 480308                         add rcx, qword ptr [rax]
0000000140351c7d 48898d70060000                 mov qword ptr [rbp + 0x670], rcx
