0000000145b232cb e810624700                     call 0x145f994e0
0000000145b232d0 90                             nop
0000000145b232d1 8985d80d0000                   mov dword ptr [rbp + 0xdd8], eax
0000000145b232d7 8995dc0d0000                   mov dword ptr [rbp + 0xddc], edx
0000000145b232dd c6856c30000001                 mov byte ptr [rbp + 0x306c], 1
0000000145b232e4 488d8dd01c0000                 lea rcx, [rbp + 0x1cd0]
0000000145b232eb 488dbdd80d0000                 lea rdi, [rbp + 0xdd8]
0000000145b232f2 4889fa                         mov rdx, rdi
0000000145b232f5 41b800803ed5                   mov r8d, 0xd53e8000
0000000145b232fb 41b9deb19d01                   mov r9d, 0x19db1de
0000000145b23301 e88a614700                     call 0x145f99490
0000000145b23306 90                             nop
0000000145b23307 48b85915de6926ef7a37           movabs rax, 0x377aef2669de1559
0000000145b23311 48f7a5d81c0000                 mul qword ptr [rbp + 0x1cd8]
0000000145b23318 4989d5                         mov r13, rdx
0000000145b2331b 49c1ed11                       shr r13, 0x11
0000000145b2331f 4531e4                         xor r12d, r12d
0000000145b23322 80bdd01c000000                 cmp byte ptr [rbp + 0x1cd0], 0
0000000145b23329 450f45ec                       cmovne r13d, r12d
