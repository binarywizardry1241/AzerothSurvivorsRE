00000001402e021e 488b053b442508                 mov rax, qword ptr [rip + 0x825443b]
00000001402e0225 488b5008                       mov rdx, qword ptr [rax + 8]
00000001402e0229 4839d1                         cmp rcx, rdx
00000001402e022c 0f83dd1b0000                   jae 0x1402e1e0f
00000001402e0232 488d0cc9                       lea rcx, [rcx + rcx*8]
00000001402e0236 48c1e103                       shl rcx, 3
00000001402e023a 480308                         add rcx, qword ptr [rax]
00000001402e023d 48898d70060000                 mov qword ptr [rbp + 0x670], rcx
