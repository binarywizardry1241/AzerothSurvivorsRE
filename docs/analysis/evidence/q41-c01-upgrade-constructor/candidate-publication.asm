0000000145965770: 488b85d8000000                 mov rax, qword ptr [rbp + 0xd8]
0000000145965777: 488d0cb6                       lea rcx, [rsi + rsi*4]
000000014596577b: 488b5510                       mov rdx, qword ptr [rbp + 0x10]
000000014596577f: 488954c820                     mov qword ptr [rax + rcx*8 + 0x20], rdx
0000000145965784: f30f6f45f0                     movdqu xmm0, xmmword ptr [rbp - 0x10]
0000000145965789: f30f6f4d00                     movdqu xmm1, xmmword ptr [rbp]
000000014596578e: f30f7f4cc810                   movdqu xmmword ptr [rax + rcx*8 + 0x10], xmm1
0000000145965794: f30f7f04c8                     movdqu xmmword ptr [rax + rcx*8], xmm0
