; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b45a20 4156                           push r14
0000000145b45a22 56                             push rsi
0000000145b45a23 57                             push rdi
0000000145b45a24 53                             push rbx
0000000145b45a25 4883ec48                       sub rsp, 0x48
0000000145b45a29 0f29742430                     movaps xmmword ptr [rsp + 0x30], xmm6
0000000145b45a2e 4889ce                         mov rsi, rcx
0000000145b45a31 4885d2                         test rdx, rdx
0000000145b45a34 0f95c0                         setne al
0000000145b45a37 4983f802                       cmp r8, 2
0000000145b45a3b 0f94c1                         sete cl
0000000145b45a3e 20c1                           and cl, al
0000000145b45a40 80f901                         cmp cl, 1
0000000145b45a43 7571                           jne 0x145b45ab6
0000000145b45a45 66813a656e                     cmp word ptr [rdx], 0x6e65
0000000145b45a4a 746e                           je 0x145b45aba
0000000145b45a4c b801000000                     mov eax, 1
0000000145b45a51 66813a706c                     cmp word ptr [rdx], 0x6c70
0000000145b45a56 746b                           je 0x145b45ac3
0000000145b45a58 66813a6373                     cmp word ptr [rdx], 0x7363
0000000145b45a5d 746b                           je 0x145b45aca
0000000145b45a5f 66813a6465                     cmp word ptr [rdx], 0x6564
0000000145b45a64 746b                           je 0x145b45ad1
0000000145b45a66 66813a7074                     cmp word ptr [rdx], 0x7470
0000000145b45a6b 746b                           je 0x145b45ad8
0000000145b45a6d 66813a6573                     cmp word ptr [rdx], 0x7365
0000000145b45a72 746b                           je 0x145b45adf
0000000145b45a74 66813a6672                     cmp word ptr [rdx], 0x7266
0000000145b45a79 746b                           je 0x145b45ae6
0000000145b45a7b 66813a726f                     cmp word ptr [rdx], 0x6f72
0000000145b45a80 746b                           je 0x145b45aed
0000000145b45a82 66813a7472                     cmp word ptr [rdx], 0x7274
0000000145b45a87 746b                           je 0x145b45af4
0000000145b45a89 66813a7275                     cmp word ptr [rdx], 0x7572
0000000145b45a8e 746b                           je 0x145b45afb
0000000145b45a90 66813a756b                     cmp word ptr [rdx], 0x6b75
0000000145b45a95 746b                           je 0x145b45b02
0000000145b45a97 66813a7a68                     cmp word ptr [rdx], 0x687a
0000000145b45a9c 746b                           je 0x145b45b09
0000000145b45a9e 66813a6a61                     cmp word ptr [rdx], 0x616a
0000000145b45aa3 746b                           je 0x145b45b10
0000000145b45aa5 31c0                           xor eax, eax
0000000145b45aa7 66813a6b6f                     cmp word ptr [rdx], 0x6f6b
0000000145b45aac 0f94c0                         sete al
0000000145b45aaf b90d000000                     mov ecx, 0xd
0000000145b45ab4 eb5f                           jmp 0x145b45b15
0000000145b45ab6 31c0                           xor eax, eax
0000000145b45ab8 eb5b                           jmp 0x145b45b15
0000000145b45aba b801000000                     mov eax, 1
0000000145b45abf 31c9                           xor ecx, ecx
0000000145b45ac1 eb52                           jmp 0x145b45b15
0000000145b45ac3 b901000000                     mov ecx, 1
0000000145b45ac8 eb4b                           jmp 0x145b45b15
0000000145b45aca b902000000                     mov ecx, 2
0000000145b45acf eb44                           jmp 0x145b45b15
0000000145b45ad1 b903000000                     mov ecx, 3
0000000145b45ad6 eb3d                           jmp 0x145b45b15
0000000145b45ad8 b904000000                     mov ecx, 4
0000000145b45add eb36                           jmp 0x145b45b15
0000000145b45adf b905000000                     mov ecx, 5
0000000145b45ae4 eb2f                           jmp 0x145b45b15
0000000145b45ae6 b906000000                     mov ecx, 6
0000000145b45aeb eb28                           jmp 0x145b45b15
0000000145b45aed b907000000                     mov ecx, 7
0000000145b45af2 eb21                           jmp 0x145b45b15
0000000145b45af4 b908000000                     mov ecx, 8
0000000145b45af9 eb1a                           jmp 0x145b45b15
0000000145b45afb b909000000                     mov ecx, 9
0000000145b45b00 eb13                           jmp 0x145b45b15
0000000145b45b02 b90a000000                     mov ecx, 0xa
0000000145b45b07 eb0c                           jmp 0x145b45b15
0000000145b45b09 b90b000000                     mov ecx, 0xb
0000000145b45b0e eb05                           jmp 0x145b45b15
0000000145b45b10 b90c000000                     mov ecx, 0xc
0000000145b45b15 8b15cd189f02                   mov edx, dword ptr [rip + 0x29f18cd]
0000000145b45b1b 654c8b042558000000             mov r8, qword ptr gs:[0x58]
0000000145b45b24 498b14d0                       mov rdx, qword ptr [r8 + rdx*8]
0000000145b45b28 488d9a68030000                 lea rbx, [rdx + 0x368]
0000000145b45b2f 0f10b268030000                 movups xmm6, xmmword ptr [rdx + 0x368]
0000000145b45b36 48898268030000                 mov qword ptr [rdx + 0x368], rax
0000000145b45b3d 48898a70030000                 mov qword ptr [rdx + 0x370], rcx
0000000145b45b44 41803900                       cmp byte ptr [r9], 0
0000000145b45b48 7414                           je 0x145b45b5e
0000000145b45b4a 488d3d72727b01                 lea rdi, [rip + 0x17b7272]
0000000145b45b51 41be35000000                   mov r14d, 0x35
0000000145b45b57 ba35000000                     mov edx, 0x35
0000000145b45b5c eb12                           jmp 0x145b45b70
0000000145b45b5e 488d3d45727b01                 lea rdi, [rip + 0x17b7245]
0000000145b45b65 41be19000000                   mov r14d, 0x19
0000000145b45b6b ba19000000                     mov edx, 0x19
0000000145b45b70 4889f9                         mov rcx, rdi
0000000145b45b73 e898940000                     call 0x145b4f010
0000000145b45b78 4989d0                         mov r8, rdx
0000000145b45b7b 4885c0                         test rax, rax
0000000145b45b7e 480f45f8                       cmovne rdi, rax
0000000145b45b82 4d0f44c6                       cmove r8, r14
0000000145b45b86 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145b45b8f 41b908000000                   mov r9d, 8
0000000145b45b95 4889f1                         mov rcx, rsi
0000000145b45b98 4889fa                         mov rdx, rdi
0000000145b45b9b e850980000                     call 0x145b4f3f0
0000000145b45ba0 0f1133                         movups xmmword ptr [rbx], xmm6
0000000145b45ba3 4889f0                         mov rax, rsi
0000000145b45ba6 0f28742430                     movaps xmm6, xmmword ptr [rsp + 0x30]
0000000145b45bab 4883c448                       add rsp, 0x48
0000000145b45baf 5b                             pop rbx
0000000145b45bb0 5f                             pop rdi
0000000145b45bb1 5e                             pop rsi
0000000145b45bb2 415e                           pop r14
0000000145b45bb4 c3                             ret
