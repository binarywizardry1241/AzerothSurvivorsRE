0000000145ec0790 4156                           push r14
0000000145ec0792 56                             push rsi
0000000145ec0793 57                             push rdi
0000000145ec0794 53                             push rbx
0000000145ec0795 4883ec48                       sub rsp, 0x48
0000000145ec0799 660f7f7c2430                   movdqa xmmword ptr [rsp + 0x30], xmm7
0000000145ec079f 660f7f742420                   movdqa xmmword ptr [rsp + 0x20], xmm6
0000000145ec07a5 4889ce                         mov rsi, rcx
0000000145ec07a8 4889d1                         mov rcx, rdx
0000000145ec07ab 4c89c2                         mov rdx, r8
0000000145ec07ae e8bd6934fa                     call 0x140207170
0000000145ec07b3 4885d2                         test rdx, rdx
0000000145ec07b6 743f                           je 0x145ec07f7
0000000145ec07b8 4989c6                         mov r14, rax
0000000145ec07bb 4889d7                         mov rdi, rdx
0000000145ec07be e83d1a14fa                     call 0x140002200
0000000145ec07c3 ba01000000                     mov edx, 1
0000000145ec07c8 4889f9                         mov rcx, rdi
0000000145ec07cb e8f01914fa                     call 0x1400021c0
0000000145ec07d0 4885c0                         test rax, rax
0000000145ec07d3 0f8438010000                   je 0x145ec0911
0000000145ec07d9 4889c3                         mov rbx, rax
0000000145ec07dc 4889c1                         mov rcx, rax
0000000145ec07df 4c89f2                         mov rdx, r14
0000000145ec07e2 4989f8                         mov r8, rdi
0000000145ec07e5 e8310f1a00                     call 0x14606171b
0000000145ec07ea 4883ff08                       cmp rdi, 8
0000000145ec07ee 7323                           jae 0x145ec0813
0000000145ec07f0 31c0                           xor eax, eax
0000000145ec07f2 e929010000                     jmp 0x145ec0920
0000000145ec07f7 48c70600000000                 mov qword ptr [rsi], 0
0000000145ec07fe 48c7460801000000               mov qword ptr [rsi + 8], 1
0000000145ec0806 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145ec080e e987010000                     jmp 0x145ec099a
0000000145ec0813 4883ff20                       cmp rdi, 0x20
0000000145ec0817 7307                           jae 0x145ec0820
0000000145ec0819 31c0                           xor eax, eax
0000000145ec081b e996000000                     jmp 0x145ec08b6
0000000145ec0820 4889f8                         mov rax, rdi
0000000145ec0823 4883e0e0                       and rax, 0xffffffffffffffe0
0000000145ec0827 31c9                           xor ecx, ecx
0000000145ec0829 660f6f059fa63b00               movdqa xmm0, xmmword ptr [rip + 0x3ba69f]
0000000145ec0831 660f6f0d37c93400               movdqa xmm1, xmmword ptr [rip + 0x34c937]
0000000145ec0839 660f6f153fc93400               movdqa xmm2, xmmword ptr [rip + 0x34c93f]
0000000145ec0841 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145ec0850 f30f6f1c0b                     movdqu xmm3, xmmword ptr [rbx + rcx]
0000000145ec0855 f30f6f640b10                   movdqu xmm4, xmmword ptr [rbx + rcx + 0x10]
0000000145ec085b 660f6feb                       movdqa xmm5, xmm3
0000000145ec085f 660ffce8                       paddb xmm5, xmm0
0000000145ec0863 660f6ff4                       movdqa xmm6, xmm4
0000000145ec0867 660ffcf0                       paddb xmm6, xmm0
0000000145ec086b 660f6ffd                       movdqa xmm7, xmm5
0000000145ec086f 660fdaf9                       pminub xmm7, xmm1
0000000145ec0873 660f74fd                       pcmpeqb xmm7, xmm5
0000000145ec0877 660fdbfa                       pand xmm7, xmm2
0000000145ec087b 660f6fee                       movdqa xmm5, xmm6
0000000145ec087f 660fdae9                       pminub xmm5, xmm1
0000000145ec0883 660f74ee                       pcmpeqb xmm5, xmm6
0000000145ec0887 660fdbea                       pand xmm5, xmm2
0000000145ec088b 660feffb                       pxor xmm7, xmm3
0000000145ec088f 660fefec                       pxor xmm5, xmm4
0000000145ec0893 f30f7f3c0b                     movdqu xmmword ptr [rbx + rcx], xmm7
0000000145ec0898 f30f7f6c0b10                   movdqu xmmword ptr [rbx + rcx + 0x10], xmm5
0000000145ec089e 4883c120                       add rcx, 0x20
0000000145ec08a2 4839c8                         cmp rax, rcx
0000000145ec08a5 75a9                           jne 0x145ec0850
0000000145ec08a7 4839c7                         cmp rdi, rax
0000000145ec08aa 0f848d000000                   je 0x145ec093d
0000000145ec08b0 40f6c718                       test dil, 0x18
0000000145ec08b4 746a                           je 0x145ec0920
0000000145ec08b6 4889c1                         mov rcx, rax
0000000145ec08b9 4889f8                         mov rax, rdi
0000000145ec08bc 4883e0f8                       and rax, 0xfffffffffffffff8
0000000145ec08c0 660f6f0518a63b00               movdqa xmm0, xmmword ptr [rip + 0x3ba618]
0000000145ec08c8 660f6f0d60c93400               movdqa xmm1, xmmword ptr [rip + 0x34c960]
0000000145ec08d0 660f6f1568c93400               movdqa xmm2, xmmword ptr [rip + 0x34c968]
0000000145ec08d8 0f1f840000000000               nop dword ptr [rax + rax]
0000000145ec08e0 f30f7e1c0b                     movq xmm3, qword ptr [rbx + rcx]
0000000145ec08e5 660f6fe3                       movdqa xmm4, xmm3
0000000145ec08e9 660ffce0                       paddb xmm4, xmm0
0000000145ec08ed 660f6fec                       movdqa xmm5, xmm4
0000000145ec08f1 660fdee9                       pmaxub xmm5, xmm1
0000000145ec08f5 660f74ec                       pcmpeqb xmm5, xmm4
0000000145ec08f9 660fdfea                       pandn xmm5, xmm2
0000000145ec08fd 660fefeb                       pxor xmm5, xmm3
0000000145ec0901 660fd62c0b                     movq qword ptr [rbx + rcx], xmm5
0000000145ec0906 4883c108                       add rcx, 8
0000000145ec090a 4839c8                         cmp rax, rcx
0000000145ec090d 75d1                           jne 0x145ec08e0
0000000145ec090f eb27                           jmp 0x145ec0938
0000000145ec0911 b901000000                     mov ecx, 1
0000000145ec0916 4889fa                         mov rdx, rdi
0000000145ec0919 e84d803400                     call 0x14620896b
0000000145ec091e 0f0b                           ud2 
0000000145ec0920 0fb60c03                       movzx ecx, byte ptr [rbx + rax]
0000000145ec0924 8d519f                         lea edx, [rcx - 0x61]
0000000145ec0927 80fa1a                         cmp dl, 0x1a
0000000145ec092a 0f92c2                         setb dl
0000000145ec092d c0e205                         shl dl, 5
0000000145ec0930 30ca                           xor dl, cl
0000000145ec0932 881403                         mov byte ptr [rbx + rax], dl
0000000145ec0935 48ffc0                         inc rax
0000000145ec0938 4839c7                         cmp rdi, rax
0000000145ec093b 75e3                           jne 0x145ec0920
0000000145ec093d 4883ff02                       cmp rdi, 2
0000000145ec0941 752f                           jne 0x145ec0972
0000000145ec0943 0fb603                         movzx eax, byte ptr [rbx]
0000000145ec0946 04a5                           add al, 0xa5
0000000145ec0948 3ce6                           cmp al, 0xe6
0000000145ec094a 7226                           jb 0x145ec0972
0000000145ec094c 0fb64301                       movzx eax, byte ptr [rbx + 1]
0000000145ec0950 04a5                           add al, 0xa5
0000000145ec0952 3ce5                           cmp al, 0xe5
0000000145ec0954 761c                           jbe 0x145ec0972
0000000145ec0956 66813b5858                     cmp word ptr [rbx], 0x5858
0000000145ec095b 7415                           je 0x145ec0972
0000000145ec095d 48c70602000000                 mov qword ptr [rsi], 2
0000000145ec0964 48895e08                       mov qword ptr [rsi + 8], rbx
0000000145ec0968 48c7461002000000               mov qword ptr [rsi + 0x10], 2
0000000145ec0970 eb28                           jmp 0x145ec099a
0000000145ec0972 48c70600000000                 mov qword ptr [rsi], 0
0000000145ec0979 48c7460801000000               mov qword ptr [rsi + 8], 1
0000000145ec0981 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145ec0989 41b801000000                   mov r8d, 1
0000000145ec098f 4889d9                         mov rcx, rbx
0000000145ec0992 4889fa                         mov rdx, rdi
0000000145ec0995 e8361814fa                     call 0x1400021d0
0000000145ec099a 4889f0                         mov rax, rsi
0000000145ec099d 0f28742420                     movaps xmm6, xmmword ptr [rsp + 0x20]
0000000145ec09a2 0f287c2430                     movaps xmm7, xmmword ptr [rsp + 0x30]
0000000145ec09a7 4883c448                       add rsp, 0x48
0000000145ec09ab 5b                             pop rbx
0000000145ec09ac 5f                             pop rdi
0000000145ec09ad 5e                             pop rsi
0000000145ec09ae 415e                           pop r14
0000000145ec09b0 c3                             ret 
