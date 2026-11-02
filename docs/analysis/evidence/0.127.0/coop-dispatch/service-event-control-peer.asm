0000000145cb8887 4c01d1                         add rcx, r10
0000000145cb888a 48b80b00000000000080           movabs rax, 0x800000000000000b
0000000145cb8894 4839c3                         cmp rbx, rax
0000000145cb8897 0f9441f9                       sete byte ptr [rcx - 7]
