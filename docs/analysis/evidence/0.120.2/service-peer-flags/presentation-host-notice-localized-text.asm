; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b45840 4157                           push r15
0000000145b45842 4156                           push r14
0000000145b45844 56                             push rsi
0000000145b45845 57                             push rdi
0000000145b45846 53                             push rbx
0000000145b45847 4883ec70                       sub rsp, 0x70
0000000145b4584b 0f29742460                     movaps xmmword ptr [rsp + 0x60], xmm6
0000000145b45850 4889ce                         mov rsi, rcx
0000000145b45853 4885d2                         test rdx, rdx
0000000145b45856 0f95c0                         setne al
0000000145b45859 4983f802                       cmp r8, 2
0000000145b4585d 0f94c1                         sete cl
0000000145b45860 20c1                           and cl, al
0000000145b45862 80f901                         cmp cl, 1
0000000145b45865 7571                           jne 0x145b458d8
0000000145b45867 66813a656e                     cmp word ptr [rdx], 0x6e65
0000000145b4586c 746e                           je 0x145b458dc
0000000145b4586e b801000000                     mov eax, 1
0000000145b45873 66813a706c                     cmp word ptr [rdx], 0x6c70
0000000145b45878 746b                           je 0x145b458e5
0000000145b4587a 66813a6373                     cmp word ptr [rdx], 0x7363
0000000145b4587f 746b                           je 0x145b458ec
0000000145b45881 66813a6465                     cmp word ptr [rdx], 0x6564
0000000145b45886 746b                           je 0x145b458f3
0000000145b45888 66813a7074                     cmp word ptr [rdx], 0x7470
0000000145b4588d 746b                           je 0x145b458fa
0000000145b4588f 66813a6573                     cmp word ptr [rdx], 0x7365
0000000145b45894 746b                           je 0x145b45901
0000000145b45896 66813a6672                     cmp word ptr [rdx], 0x7266
0000000145b4589b 746b                           je 0x145b45908
0000000145b4589d 66813a726f                     cmp word ptr [rdx], 0x6f72
0000000145b458a2 746b                           je 0x145b4590f
0000000145b458a4 66813a7472                     cmp word ptr [rdx], 0x7274
0000000145b458a9 746b                           je 0x145b45916
0000000145b458ab 66813a7275                     cmp word ptr [rdx], 0x7572
0000000145b458b0 746b                           je 0x145b4591d
0000000145b458b2 66813a756b                     cmp word ptr [rdx], 0x6b75
0000000145b458b7 746b                           je 0x145b45924
0000000145b458b9 66813a7a68                     cmp word ptr [rdx], 0x687a
0000000145b458be 746b                           je 0x145b4592b
0000000145b458c0 66813a6a61                     cmp word ptr [rdx], 0x616a
0000000145b458c5 746b                           je 0x145b45932
0000000145b458c7 31c0                           xor eax, eax
0000000145b458c9 66813a6b6f                     cmp word ptr [rdx], 0x6f6b
0000000145b458ce 0f94c0                         sete al
0000000145b458d1 b90d000000                     mov ecx, 0xd
0000000145b458d6 eb5f                           jmp 0x145b45937
0000000145b458d8 31c0                           xor eax, eax
0000000145b458da eb5b                           jmp 0x145b45937
0000000145b458dc b801000000                     mov eax, 1
0000000145b458e1 31c9                           xor ecx, ecx
0000000145b458e3 eb52                           jmp 0x145b45937
0000000145b458e5 b901000000                     mov ecx, 1
0000000145b458ea eb4b                           jmp 0x145b45937
0000000145b458ec b902000000                     mov ecx, 2
0000000145b458f1 eb44                           jmp 0x145b45937
0000000145b458f3 b903000000                     mov ecx, 3
0000000145b458f8 eb3d                           jmp 0x145b45937
0000000145b458fa b904000000                     mov ecx, 4
0000000145b458ff eb36                           jmp 0x145b45937
0000000145b45901 b905000000                     mov ecx, 5
0000000145b45906 eb2f                           jmp 0x145b45937
0000000145b45908 b906000000                     mov ecx, 6
0000000145b4590d eb28                           jmp 0x145b45937
0000000145b4590f b907000000                     mov ecx, 7
0000000145b45914 eb21                           jmp 0x145b45937
0000000145b45916 b908000000                     mov ecx, 8
0000000145b4591b eb1a                           jmp 0x145b45937
0000000145b4591d b909000000                     mov ecx, 9
0000000145b45922 eb13                           jmp 0x145b45937
0000000145b45924 b90a000000                     mov ecx, 0xa
0000000145b45929 eb0c                           jmp 0x145b45937
0000000145b4592b b90b000000                     mov ecx, 0xb
0000000145b45930 eb05                           jmp 0x145b45937
0000000145b45932 b90c000000                     mov ecx, 0xc
0000000145b45937 4c8bbc24c0000000               mov r15, qword ptr [rsp + 0xc0]
0000000145b4593f 8b15a31a9f02                   mov edx, dword ptr [rip + 0x29f1aa3]
0000000145b45945 654c8b042558000000             mov r8, qword ptr gs:[0x58]
0000000145b4594e 498b14d0                       mov rdx, qword ptr [r8 + rdx*8]
0000000145b45952 4c8db268030000                 lea r14, [rdx + 0x368]
0000000145b45959 0f10b268030000                 movups xmm6, xmmword ptr [rdx + 0x368]
0000000145b45960 48898268030000                 mov qword ptr [rdx + 0x368], rax
0000000145b45967 48898a70030000                 mov qword ptr [rdx + 0x370], rcx
0000000145b4596e 41803900                       cmp byte ptr [r9], 0
0000000145b45972 7413                           je 0x145b45987
0000000145b45974 488d3d01737b01                 lea rdi, [rip + 0x17b7301]
0000000145b4597b bb27000000                     mov ebx, 0x27
0000000145b45980 ba27000000                     mov edx, 0x27
0000000145b45985 eb11                           jmp 0x145b45998
0000000145b45987 488d3dba727b01                 lea rdi, [rip + 0x17b72ba]
0000000145b4598e bb0f000000                     mov ebx, 0xf
0000000145b45993 ba0f000000                     mov edx, 0xf
0000000145b45998 4889f9                         mov rcx, rdi
0000000145b4599b e870960000                     call 0x145b4f010
0000000145b459a0 4885c0                         test rax, rax
0000000145b459a3 480f45f8                       cmovne rdi, rax
0000000145b459a7 480f45da                       cmovne rbx, rdx
0000000145b459ab 488d05c6727b01                 lea rax, [rip + 0x17b72c6]
0000000145b459b2 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000145b459b7 48c744243004000000             mov qword ptr [rsp + 0x30], 4
0000000145b459c0 4c897c2438                     mov qword ptr [rsp + 0x38], r15
0000000145b459c5 488d058c727b01                 lea rax, [rip + 0x17b728c]
0000000145b459cc 4889442440                     mov qword ptr [rsp + 0x40], rax
0000000145b459d1 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b459da 488d4c2448                     lea rcx, [rsp + 0x48]
0000000145b459df 4c8d4c2428                     lea r9, [rsp + 0x28]
0000000145b459e4 4889fa                         mov rdx, rdi
0000000145b459e7 4989d8                         mov r8, rbx
0000000145b459ea e8019a0000                     call 0x145b4f3f0
0000000145b459ef 410f1136                       movups xmmword ptr [r14], xmm6
0000000145b459f3 488b442458                     mov rax, qword ptr [rsp + 0x58]
0000000145b459f8 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145b459fc 0f10442448                     movups xmm0, xmmword ptr [rsp + 0x48]
0000000145b45a01 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145b45a04 4889f0                         mov rax, rsi
0000000145b45a07 0f28742460                     movaps xmm6, xmmword ptr [rsp + 0x60]
0000000145b45a0c 4883c470                       add rsp, 0x70
0000000145b45a10 5b                             pop rbx
0000000145b45a11 5f                             pop rdi
0000000145b45a12 5e                             pop rsi
0000000145b45a13 415e                           pop r14
0000000145b45a15 415f                           pop r15
0000000145b45a17 c3                             ret
