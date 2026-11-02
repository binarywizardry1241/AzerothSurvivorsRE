; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b456f0 56                             push rsi
0000000145b456f1 57                             push rdi
0000000145b456f2 4883ec38                       sub rsp, 0x38
0000000145b456f6 0f29742420                     movaps xmmword ptr [rsp + 0x20], xmm6
0000000145b456fb 4889ce                         mov rsi, rcx
0000000145b456fe 4885d2                         test rdx, rdx
0000000145b45701 0f95c0                         setne al
0000000145b45704 4983f802                       cmp r8, 2
0000000145b45708 0f94c1                         sete cl
0000000145b4570b 20c1                           and cl, al
0000000145b4570d 80f901                         cmp cl, 1
0000000145b45710 7571                           jne 0x145b45783
0000000145b45712 66813a656e                     cmp word ptr [rdx], 0x6e65
0000000145b45717 746e                           je 0x145b45787
0000000145b45719 b801000000                     mov eax, 1
0000000145b4571e 66813a706c                     cmp word ptr [rdx], 0x6c70
0000000145b45723 746b                           je 0x145b45790
0000000145b45725 66813a6373                     cmp word ptr [rdx], 0x7363
0000000145b4572a 746b                           je 0x145b45797
0000000145b4572c 66813a6465                     cmp word ptr [rdx], 0x6564
0000000145b45731 746b                           je 0x145b4579e
0000000145b45733 66813a7074                     cmp word ptr [rdx], 0x7470
0000000145b45738 746b                           je 0x145b457a5
0000000145b4573a 66813a6573                     cmp word ptr [rdx], 0x7365
0000000145b4573f 746b                           je 0x145b457ac
0000000145b45741 66813a6672                     cmp word ptr [rdx], 0x7266
0000000145b45746 746b                           je 0x145b457b3
0000000145b45748 66813a726f                     cmp word ptr [rdx], 0x6f72
0000000145b4574d 746b                           je 0x145b457ba
0000000145b4574f 66813a7472                     cmp word ptr [rdx], 0x7274
0000000145b45754 746b                           je 0x145b457c1
0000000145b45756 66813a7275                     cmp word ptr [rdx], 0x7572
0000000145b4575b 746b                           je 0x145b457c8
0000000145b4575d 66813a756b                     cmp word ptr [rdx], 0x6b75
0000000145b45762 746b                           je 0x145b457cf
0000000145b45764 66813a7a68                     cmp word ptr [rdx], 0x687a
0000000145b45769 746b                           je 0x145b457d6
0000000145b4576b 66813a6a61                     cmp word ptr [rdx], 0x616a
0000000145b45770 746b                           je 0x145b457dd
0000000145b45772 31c0                           xor eax, eax
0000000145b45774 66813a6b6f                     cmp word ptr [rdx], 0x6f6b
0000000145b45779 0f94c0                         sete al
0000000145b4577c b90d000000                     mov ecx, 0xd
0000000145b45781 eb5f                           jmp 0x145b457e2
0000000145b45783 31c0                           xor eax, eax
0000000145b45785 eb5b                           jmp 0x145b457e2
0000000145b45787 b801000000                     mov eax, 1
0000000145b4578c 31c9                           xor ecx, ecx
0000000145b4578e eb52                           jmp 0x145b457e2
0000000145b45790 b901000000                     mov ecx, 1
0000000145b45795 eb4b                           jmp 0x145b457e2
0000000145b45797 b902000000                     mov ecx, 2
0000000145b4579c eb44                           jmp 0x145b457e2
0000000145b4579e b903000000                     mov ecx, 3
0000000145b457a3 eb3d                           jmp 0x145b457e2
0000000145b457a5 b904000000                     mov ecx, 4
0000000145b457aa eb36                           jmp 0x145b457e2
0000000145b457ac b905000000                     mov ecx, 5
0000000145b457b1 eb2f                           jmp 0x145b457e2
0000000145b457b3 b906000000                     mov ecx, 6
0000000145b457b8 eb28                           jmp 0x145b457e2
0000000145b457ba b907000000                     mov ecx, 7
0000000145b457bf eb21                           jmp 0x145b457e2
0000000145b457c1 b908000000                     mov ecx, 8
0000000145b457c6 eb1a                           jmp 0x145b457e2
0000000145b457c8 b909000000                     mov ecx, 9
0000000145b457cd eb13                           jmp 0x145b457e2
0000000145b457cf b90a000000                     mov ecx, 0xa
0000000145b457d4 eb0c                           jmp 0x145b457e2
0000000145b457d6 b90b000000                     mov ecx, 0xb
0000000145b457db eb05                           jmp 0x145b457e2
0000000145b457dd b90c000000                     mov ecx, 0xc
0000000145b457e2 8b15001c9f02                   mov edx, dword ptr [rip + 0x29f1c00]
0000000145b457e8 654c8b042558000000             mov r8, qword ptr gs:[0x58]
0000000145b457f1 498b3cd0                       mov rdi, qword ptr [r8 + rdx*8]
0000000145b457f5 4981c1b0010000                 add r9, 0x1b0
0000000145b457fc 0f10b768030000                 movups xmm6, xmmword ptr [rdi + 0x368]
0000000145b45803 48898768030000                 mov qword ptr [rdi + 0x368], rax
0000000145b4580a 48898f70030000                 mov qword ptr [rdi + 0x370], rcx
0000000145b45811 4889f1                         mov rcx, rsi
0000000145b45814 4c89ca                         mov rdx, r9
0000000145b45817 e824884300                     call 0x145f7e040
0000000145b4581c 0f11b768030000                 movups xmmword ptr [rdi + 0x368], xmm6
0000000145b45823 4889f0                         mov rax, rsi
0000000145b45826 0f28742420                     movaps xmm6, xmmword ptr [rsp + 0x20]
0000000145b4582b 4883c438                       add rsp, 0x38
0000000145b4582f 5f                             pop rdi
0000000145b45830 5e                             pop rsi
0000000145b45831 c3                             ret
