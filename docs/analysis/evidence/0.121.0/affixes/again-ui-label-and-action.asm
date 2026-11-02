00000001400d5ad7 488d0d25670d06                 lea rcx, [rip + 0x60d6725]
00000001400d5ade ba09000000                     mov edx, 9
00000001400d5ae3 e8c853a105                     call 0x145aeaeb0
00000001400d5ae8 90                             nop
00000001400d5ae9 488b8d90070000                 mov rcx, qword ptr [rbp + 0x790]
00000001400d5af0 c60100                         mov byte ptr [rcx], 0
00000001400d5af3 48894108                       mov qword ptr [rcx + 8], rax
00000001400d5af7 48895110                       mov qword ptr [rcx + 0x10], rdx
