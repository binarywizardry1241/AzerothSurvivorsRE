0000000145b2b156 4889f1                         mov rcx, rsi
0000000145b2b159 e8b2d2ffff                     call 0x145b28410
0000000145b2b15e 90                             nop
0000000145b2b15f 488d4e10                       lea rcx, [rsi + 0x10]
0000000145b2b163 488b01                         mov rax, qword ptr [rcx]
0000000145b2b166 48c70102000000                 mov qword ptr [rcx], 2
0000000145b2b16d 4883f802                       cmp rax, 2
0000000145b2b171 0f8403f3ffff                   je 0x145b2a47a
0000000145b2b177 4989cc                         mov r12, rcx
0000000145b2b17a 488d5618                       lea rdx, [rsi + 0x18]
0000000145b2b17e 488945b0                       mov qword ptr [rbp - 0x50], rax
0000000145b2b182 488d4db8                       lea rcx, [rbp - 0x48]
0000000145b2b186 41b8300d0000                   mov r8d, 0xd30
0000000145b2b18c e88a0a4c00                     call 0x145febc1b
0000000145b2b191 488b8e08110000                 mov rcx, qword ptr [rsi + 0x1108]
0000000145b2b198 4885c9                         test rcx, rcx
0000000145b2b19b 0f84bd030000                   je 0x145b2b55e
0000000145b2b1a1 488b8600110000                 mov rax, qword ptr [rsi + 0x1100]
0000000145b2b1a8 4869c9b0000000                 imul rcx, rcx, 0xb0
0000000145b2b1af 31db                           xor ebx, ebx
0000000145b2b1b1 31d2                           xor edx, edx
0000000145b2b1b3 80bc10a800000000               cmp byte ptr [rax + rdx + 0xa8], 0
0000000145b2b1bb 0f853b020000                   jne 0x145b2b3fc
0000000145b2b1c1 48ffc3                         inc rbx
0000000145b2b1c4 4881c2b0000000                 add rdx, 0xb0
0000000145b2b1cb 4839d1                         cmp rcx, rdx
0000000145b2b1ce 75e3                           jne 0x145b2b1b3
0000000145b2b1d0 e989030000                     jmp 0x145b2b55e
