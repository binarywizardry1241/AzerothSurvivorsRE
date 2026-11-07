0000000145c278b8 448a757f                       mov r14b, byte ptr [rbp + 0x7f]
0000000145c278bc 488b4dc0                       mov rcx, qword ptr [rbp - 0x40]
0000000145c278c0 488b55c8                       mov rdx, qword ptr [rbp - 0x38]
0000000145c278c4 e88776e8ff                     call 0x145aaef50
0000000145c278c9 4869c0f0000000                 imul rax, rax, 0xf0
0000000145c278d0 4c8d2d99163b01                 lea r13, [rip + 0x13b1699]
0000000145c278d7 4a8b4c2808                     mov rcx, qword ptr [rax + r13 + 8]
0000000145c278dc 4a8b542810                     mov rdx, qword ptr [rax + r13 + 0x10]
0000000145c278e1 e86a76e8ff                     call 0x145aaef50
0000000145c278e6 4889c7                         mov rdi, rax
0000000145c278e9 4889f1                         mov rcx, rsi
0000000145c278ec e80f04feff                     call 0x145c07d00
0000000145c278f1 8885f0010000                   mov byte ptr [rbp + 0x1f0], al
0000000145c278f7 488b8678120000                 mov rax, qword ptr [rsi + 0x1278]
0000000145c278fe 4c8bbe80120000                 mov r15, qword ptr [rsi + 0x1280]
0000000145c27905 4d89fc                         mov r12, r15
0000000145c27908 4d85ff                         test r15, r15
0000000145c2790b 7478                           je 0x145c27985
