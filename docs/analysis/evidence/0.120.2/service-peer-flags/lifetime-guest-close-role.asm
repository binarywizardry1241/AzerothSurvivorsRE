; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b226b0 55                             push rbp
0000000145b226b1 4156                           push r14
0000000145b226b3 56                             push rsi
0000000145b226b4 57                             push rdi
0000000145b226b5 53                             push rbx
0000000145b226b6 4881eca0060000                 sub rsp, 0x6a0
0000000145b226bd 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b226c5 48c78518060000feffffff         mov qword ptr [rbp + 0x618], 0xfffffffffffffffe
0000000145b226d0 4c89c3                         mov rbx, r8
0000000145b226d3 4889d6                         mov rsi, rdx
0000000145b226d6 4889cf                         mov rdi, rcx
0000000145b226d9 4c8db1b80c0000                 lea r14, [rcx + 0xcb8]
0000000145b226e0 83b9b80c000001                 cmp dword ptr [rcx + 0xcb8], 1
0000000145b226e7 7724                           ja 0x145b2270d
0000000145b226e9 4883bfc00f000000               cmp qword ptr [rdi + 0xfc0], 0
0000000145b226f1 741a                           je 0x145b2270d
0000000145b226f3 4883bfe80e0000ff               cmp qword ptr [rdi + 0xee8], -1
0000000145b226fb 7410                           je 0x145b2270d
0000000145b226fd 4889f9                         mov rcx, rdi
0000000145b22700 e80b6dffff                     call 0x145b19410
0000000145b22705 4889f9                         mov rcx, rdi
0000000145b22708 e803cbffff                     call 0x145b1f210
0000000145b2270d 488d4da8                       lea rcx, [rbp - 0x58]
0000000145b22711 41b838030000                   mov r8d, 0x338
0000000145b22717 4c89f2                         mov rdx, r14
0000000145b2271a e80c874800                     call 0x145faae2b
0000000145b2271f 49c70602000000                 mov qword ptr [r14], 2
0000000145b22726 488b45a8                       mov rax, qword ptr [rbp - 0x58]
0000000145b2272a 4883f801                       cmp rax, 1
0000000145b2272e 7766                           ja 0x145b22796
0000000145b22730 488d8de0020000                 lea rcx, [rbp + 0x2e0]
0000000145b22737 488d55a8                       lea rdx, [rbp - 0x58]
0000000145b2273b 41b838030000                   mov r8d, 0x338
0000000145b22741 e8e5864800                     call 0x145faae2b
0000000145b22746 488b8dd8050000                 mov rcx, qword ptr [rbp + 0x5d8]
0000000145b2274d 488b85e0050000                 mov rax, qword ptr [rbp + 0x5e0]
0000000145b22754 ff5030                         call qword ptr [rax + 0x30]
0000000145b22757 90                             nop
0000000145b22758 80bd1106000000                 cmp byte ptr [rbp + 0x611], 0
0000000145b2275f 7409                           je 0x145b2276a
0000000145b22761 4889f9                         mov rcx, rdi
0000000145b22764 e8071a0000                     call 0x145b24170
0000000145b22769 90                             nop
0000000145b2276a 48895c2420                     mov qword ptr [rsp + 0x20], rbx
0000000145b2276f 488d1592cf7c01                 lea rdx, [rip + 0x17ccf92]
0000000145b22776 41b805000000                   mov r8d, 5
0000000145b2277c 4889f9                         mov rcx, rdi
0000000145b2277f 4989f1                         mov r9, rsi
0000000145b22782 e889040000                     call 0x145b22c10
0000000145b22787 90                             nop
0000000145b22788 488d8de0020000                 lea rcx, [rbp + 0x2e0]
0000000145b2278f e8bcd7fdff                     call 0x145afff50
0000000145b22794 eb0f                           jmp 0x145b227a5
0000000145b22796 83f802                         cmp eax, 2
0000000145b22799 740a                           je 0x145b227a5
0000000145b2279b 488d4db0                       lea rcx, [rbp - 0x50]
0000000145b2279f e80cd3fdff                     call 0x145affab0
0000000145b227a4 90                             nop
0000000145b227a5 4881c4a0060000                 add rsp, 0x6a0
0000000145b227ac 5b                             pop rbx
0000000145b227ad 5f                             pop rdi
0000000145b227ae 5e                             pop rsi
0000000145b227af 415e                           pop r14
0000000145b227b1 5d                             pop rbp
0000000145b227b2 c3                             ret
