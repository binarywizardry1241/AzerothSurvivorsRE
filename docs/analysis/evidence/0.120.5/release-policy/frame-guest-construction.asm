0000000145b16ede 4c8bad700b0000                 mov r13, qword ptr [rbp + 0xb70]
0000000145b16ee5 f049ff4500                     lock inc qword ptr [r13]
0000000145b16eea 0f8e14620000                   jle 0x145b1d104
0000000145b16ef0 4c89adb0020000                 mov qword ptr [rbp + 0x2b0], r13
0000000145b16ef7 c685b802000001                 mov byte ptr [rbp + 0x2b8], 1
0000000145b16efe e8fdb24efa                     call 0x140002200
0000000145b16f03 b910000000                     mov ecx, 0x10
0000000145b16f08 ba08000000                     mov edx, 8
0000000145b16f0d e8aeb24efa                     call 0x1400021c0
0000000145b16f12 4885c0                         test rax, rax
0000000145b16f15 4c89a5280b0000                 mov qword ptr [rbp + 0xb28], r12
0000000145b16f1c 488985200b0000                 mov qword ptr [rbp + 0xb20], rax
0000000145b16f23 0f8455040000                   je 0x145b1737e
0000000145b16f29 4989c0                         mov r8, rax
0000000145b16f2c 4983fcff                       cmp r12, -1
0000000145b16f30 4c8b8d200c0000                 mov r9, qword ptr [rbp + 0xc20]
0000000145b16f37 b801000000                     mov eax, 1
0000000145b16f3c 4c0f44c8                       cmove r9, rax
0000000145b16f40 4d8928                         mov qword ptr [r8], r13
0000000145b16f43 488b85480c0000                 mov rax, qword ptr [rbp + 0xc48]
0000000145b16f4a b900000000                     mov ecx, 0
0000000145b16f4f 480f44c1                       cmove rax, rcx
0000000145b16f53 41c6400801                     mov byte ptr [r8 + 8], 1
0000000145b16f58 4c89e2                         mov rdx, r12
0000000145b16f5b 480f44d1                       cmove rdx, rcx
0000000145b16f5f 488995a00c0000                 mov qword ptr [rbp + 0xca0], rdx
0000000145b16f66 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b16f6b 488b8db00c0000                 mov rcx, qword ptr [rbp + 0xcb0]
0000000145b16f72 4c89c2                         mov rdx, r8
0000000145b16f75 4c8d05bc5a4a01                 lea r8, [rip + 0x14a5abc]
0000000145b16f7c 4c898d900c0000                 mov qword ptr [rbp + 0xc90], r9
0000000145b16f83 e888a70100                     call 0x145b31710
