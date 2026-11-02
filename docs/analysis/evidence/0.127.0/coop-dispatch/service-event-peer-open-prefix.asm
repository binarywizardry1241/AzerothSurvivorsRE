0000000145cb7f04 8bbd98010000                   mov edi, dword ptr [rbp + 0x198]
0000000145cb7f0a 48c7851002000000000000         mov qword ptr [rbp + 0x210], 0
0000000145cb7f15 48c7851802000008000000         mov qword ptr [rbp + 0x218], 8
0000000145cb7f20 488d8518020000                 lea rax, [rbp + 0x218]
0000000145cb7f27 0f117008                       movups xmmword ptr [rax + 8], xmm6
0000000145cb7f2b 66c785300200000100             mov word ptr [rbp + 0x230], 1
0000000145cb7f34 c6856603000001                 mov byte ptr [rbp + 0x366], 1
0000000145cb7f3b c6856503000001                 mov byte ptr [rbp + 0x365], 1
0000000145cb7f42 c6856403000001                 mov byte ptr [rbp + 0x364], 1
0000000145cb7f49 c6856303000001                 mov byte ptr [rbp + 0x363], 1
0000000145cb7f50 c6856203000001                 mov byte ptr [rbp + 0x362], 1
0000000145cb7f57 c6856103000001                 mov byte ptr [rbp + 0x361], 1
0000000145cb7f5e c6856003000001                 mov byte ptr [rbp + 0x360], 1
0000000145cb7f65 488d4d50                       lea rcx, [rbp + 0x50]
0000000145cb7f69 488b55e0                       mov rdx, qword ptr [rbp - 0x20]
0000000145cb7f6d 4189f8                         mov r8d, edi
0000000145cb7f70 4c8d8d10020000                 lea r9, [rbp + 0x210]
0000000145cb7f77 e86475eeff                     call 0x145b9f4e0
0000000145cb7f7c 90                             nop 
