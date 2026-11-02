0000000145ec1e60 55                             push rbp
0000000145ec1e61 4157                           push r15
0000000145ec1e63 4156                           push r14
0000000145ec1e65 4155                           push r13
0000000145ec1e67 4154                           push r12
0000000145ec1e69 56                             push rsi
0000000145ec1e6a 57                             push rdi
0000000145ec1e6b 53                             push rbx
0000000145ec1e6c 4881ec38020000                 sub rsp, 0x238
0000000145ec1e73 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145ec1e7b 48c785b0010000feffffff         mov qword ptr [rbp + 0x1b0], 0xfffffffffffffffe
0000000145ec1e86 48899588010000                 mov qword ptr [rbp + 0x188], rdx
0000000145ec1e8d 4c898590010000                 mov qword ptr [rbp + 0x190], r8
0000000145ec1e94 c685a001000001                 mov byte ptr [rbp + 0x1a0], 1
0000000145ec1e9b 4d85c0                         test r8, r8
0000000145ec1e9e 746b                           je 0x145ec1f0b
0000000145ec1ea0 48c7859801000001000000         mov qword ptr [rbp + 0x198], 1
0000000145ec1eab 0fb602                         movzx eax, byte ptr [rdx]
0000000145ec1eae 83c0ec                         add eax, -0x14
0000000145ec1eb1 83f80d                         cmp eax, 0xd
0000000145ec1eb4 7755                           ja 0x145ec1f0b
0000000145ec1eb6 48898d80010000                 mov qword ptr [rbp + 0x180], rcx
0000000145ec1ebd 488d0df8148d01                 lea rcx, [rip + 0x18d14f8]
0000000145ec1ec4 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145ec1ec8 4801c8                         add rax, rcx
0000000145ec1ecb ffe0                           jmp rax
