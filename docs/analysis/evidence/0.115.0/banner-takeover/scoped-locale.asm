1458d6dc0 56 push rsi
1458d6dc1 57 push rdi
1458d6dc2 4883ec48 sub rsp, 0x48
1458d6dc6 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
1458d6dcb 4889ce mov rsi, rcx
1458d6dce 4885d2 test rdx, rdx
1458d6dd1 0f95c0 setne al
1458d6dd4 4983f802 cmp r8, 2
1458d6dd8 0f94c1 sete cl
1458d6ddb 20c1 and cl, al
1458d6ddd 80f901 cmp cl, 1
1458d6de0 7571 jne 0x1458d6e53
1458d6de2 66813a656e cmp word ptr [rdx], 0x6e65
1458d6de7 746e je 0x1458d6e57
1458d6de9 b801000000 mov eax, 1
1458d6dee 66813a706c cmp word ptr [rdx], 0x6c70
1458d6df3 746b je 0x1458d6e60
1458d6df5 66813a6373 cmp word ptr [rdx], 0x7363
1458d6dfa 746b je 0x1458d6e67
1458d6dfc 66813a6465 cmp word ptr [rdx], 0x6564
1458d6e01 746b je 0x1458d6e6e
1458d6e03 66813a7074 cmp word ptr [rdx], 0x7470
1458d6e08 746b je 0x1458d6e75
1458d6e0a 66813a6573 cmp word ptr [rdx], 0x7365
1458d6e0f 746b je 0x1458d6e7c
1458d6e11 66813a6672 cmp word ptr [rdx], 0x7266
1458d6e16 746b je 0x1458d6e83
1458d6e18 66813a726f cmp word ptr [rdx], 0x6f72
1458d6e1d 746b je 0x1458d6e8a
1458d6e1f 66813a7472 cmp word ptr [rdx], 0x7274
1458d6e24 746b je 0x1458d6e91
1458d6e26 66813a7275 cmp word ptr [rdx], 0x7572
1458d6e2b 746b je 0x1458d6e98
1458d6e2d 66813a756b cmp word ptr [rdx], 0x6b75
1458d6e32 746b je 0x1458d6e9f
1458d6e34 66813a7a68 cmp word ptr [rdx], 0x687a
1458d6e39 746b je 0x1458d6ea6
1458d6e3b 66813a6a61 cmp word ptr [rdx], 0x616a
1458d6e40 746b je 0x1458d6ead
1458d6e42 31c0 xor eax, eax
1458d6e44 66813a6b6f cmp word ptr [rdx], 0x6f6b
1458d6e49 0f94c0 sete al
1458d6e4c b90d000000 mov ecx, 0xd
1458d6e51 eb5f jmp 0x1458d6eb2
1458d6e53 31c0 xor eax, eax
1458d6e55 eb5b jmp 0x1458d6eb2
1458d6e57 b801000000 mov eax, 1
1458d6e5c 31c9 xor ecx, ecx
1458d6e5e eb52 jmp 0x1458d6eb2
1458d6e60 b901000000 mov ecx, 1
1458d6e65 eb4b jmp 0x1458d6eb2
1458d6e67 b902000000 mov ecx, 2
1458d6e6c eb44 jmp 0x1458d6eb2
1458d6e6e b903000000 mov ecx, 3
1458d6e73 eb3d jmp 0x1458d6eb2
1458d6e75 b904000000 mov ecx, 4
1458d6e7a eb36 jmp 0x1458d6eb2
1458d6e7c b905000000 mov ecx, 5
1458d6e81 eb2f jmp 0x1458d6eb2
1458d6e83 b906000000 mov ecx, 6
1458d6e88 eb28 jmp 0x1458d6eb2
1458d6e8a b907000000 mov ecx, 7
1458d6e8f eb21 jmp 0x1458d6eb2
1458d6e91 b908000000 mov ecx, 8
1458d6e96 eb1a jmp 0x1458d6eb2
1458d6e98 b909000000 mov ecx, 9
1458d6e9d eb13 jmp 0x1458d6eb2
1458d6e9f b90a000000 mov ecx, 0xa
1458d6ea4 eb0c jmp 0x1458d6eb2
1458d6ea6 b90b000000 mov ecx, 0xb
1458d6eab eb05 jmp 0x1458d6eb2
1458d6ead b90c000000 mov ecx, 0xc
1458d6eb2 8b1538049402 mov edx, dword ptr [rip + 0x2940438]
1458d6eb8 654c8b042558000000 mov r8, qword ptr gs:[0x58]
1458d6ec1 498b14d0 mov rdx, qword ptr [r8 + rdx*8]
1458d6ec5 488dba30030000 lea rdi, [rdx + 0x330]
1458d6ecc 0f10b230030000 movups xmm6, xmmword ptr [rdx + 0x330]
1458d6ed3 48898230030000 mov qword ptr [rdx + 0x330], rax
1458d6eda 48898a38030000 mov qword ptr [rdx + 0x338], rcx
1458d6ee1 498b01 mov rax, qword ptr [r9]
1458d6ee4 498b4908 mov rcx, qword ptr [r9 + 8]
1458d6ee8 488b5008 mov rdx, qword ptr [rax + 8]
1458d6eec 4c8b4010 mov r8, qword ptr [rax + 0x10]
1458d6ef0 498b4110 mov rax, qword ptr [r9 + 0x10]
1458d6ef4 488b00 mov rax, qword ptr [rax]
1458d6ef7 488b09 mov rcx, qword ptr [rcx]
1458d6efa 483b4110 cmp rax, qword ptr [rcx + 0x10]
1458d6efe 7313 jae 0x1458d6f13
1458d6f00 488b4908 mov rcx, qword ptr [rcx + 8]
1458d6f04 48c1e004 shl rax, 4
1458d6f08 4c8b0c01 mov r9, qword ptr [rcx + rax]
1458d6f0c 488b440108 mov rax, qword ptr [rcx + rax + 8]
1458d6f11 eb03 jmp 0x1458d6f16
1458d6f13 4531c9 xor r9d, r9d
1458d6f16 4889442420 mov qword ptr [rsp + 0x20], rax
1458d6f1b 4889f1 mov rcx, rsi
1458d6f1e e84dc5f7ff call 0x145853470
1458d6f23 0f1137 movups xmmword ptr [rdi], xmm6
1458d6f26 4889f0 mov rax, rsi
1458d6f29 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
1458d6f2e 4883c448 add rsp, 0x48
1458d6f32 5f pop rdi
1458d6f33 5e pop rsi
1458d6f34 c3 ret
