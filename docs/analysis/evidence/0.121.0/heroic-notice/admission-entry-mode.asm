0000000145b21ef6 488b81480d0000                 mov rax, qword ptr [rcx + 0xd48]
0000000145b21efd 4883f801                       cmp rax, 1
0000000145b21f01 7766                           ja 0x145b21f69
0000000145b21f03 80bec510000000                 cmp byte ptr [rsi + 0x10c5], 0
0000000145b21f0a 745d                           je 0x145b21f69
0000000145b21f0c 6683fb4b                       cmp bx, 0x4b
0000000145b21f10 0f84a2010000                   je 0x145b220b8
0000000145b21f16 0fb7c3                         movzx eax, bx
0000000145b21f19 3dce010000                     cmp eax, 0x1ce
0000000145b21f1e 0f8494010000                   je 0x145b220b8
0000000145b21f24 3ddc010000                     cmp eax, 0x1dc
0000000145b21f29 0f8489010000                   je 0x145b220b8
0000000145b21f2f 4d85f6                         test r14, r14
0000000145b21f32 0f8410030000                   je 0x145b22248
0000000145b21f38 e8c3024efa                     call 0x140002200
0000000145b21f3d ba01000000                     mov edx, 1
0000000145b21f42 4c89f1                         mov rcx, r14
0000000145b21f45 e876024efa                     call 0x1400021c0
0000000145b21f4a 4885c0                         test rax, rax
0000000145b21f4d 0f849f430000                   je 0x145b262f2
0000000145b21f53 4989c7                         mov r15, rax
0000000145b21f56 4889c1                         mov rcx, rax
0000000145b21f59 4889fa                         mov rdx, rdi
0000000145b21f5c 4d89f0                         mov r8, r14
0000000145b21f5f e8b79c4c00                     call 0x145febc1b
0000000145b21f64 e9e5020000                     jmp 0x145b2224e
