0000000145cca780 55                             push rbp
0000000145cca781 4157                           push r15
0000000145cca783 4156                           push r14
0000000145cca785 56                             push rsi
0000000145cca786 57                             push rdi
0000000145cca787 53                             push rbx
0000000145cca788 4883ec58                       sub rsp, 0x58
0000000145cca78c 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145cca791 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145cca799 4889ce                         mov rsi, rcx
0000000145cca79c 4c8b32                         mov r14, qword ptr [rdx]
0000000145cca79f b101                           mov cl, 1
0000000145cca7a1 31c0                           xor eax, eax
0000000145cca7a3 f0410fb04e10                   lock cmpxchg byte ptr [r14 + 0x10], cl
0000000145cca7a9 0f850e010000                   jne 0x145cca8bd
0000000145cca7af 488b3db2439902                 mov rdi, qword ptr [rip + 0x29943b2]
0000000145cca7b6 488b07                         mov rax, qword ptr [rdi]
0000000145cca7b9 48d1e0                         shl rax, 1
0000000145cca7bc 4885c0                         test rax, rax
0000000145cca7bf 0f850c010000                   jne 0x145cca8d1
0000000145cca7c5 4531ff                         xor r15d, r15d
0000000145cca7c8 410fb64611                     movzx eax, byte ptr [r14 + 0x11]
0000000145cca7cd 4983bef801000000               cmp qword ptr [r14 + 0x1f8], 0
0000000145cca7d5 0f841b010000                   je 0x145cca8f6
0000000145cca7db 488d4208                       lea rax, [rdx + 8]
0000000145cca7df 498d8e00020000                 lea rcx, [r14 + 0x200]
0000000145cca7e6 4889d3                         mov rbx, rdx
0000000145cca7e9 4889c2                         mov rdx, rax
0000000145cca7ec e84f141bfb                     call 0x140e7bc40
0000000145cca7f1 4889c2                         mov rdx, rax
0000000145cca7f4 48c1ea39                       shr rdx, 0x39
0000000145cca7f8 498b8ee0010000                 mov rcx, qword ptr [r14 + 0x1e0]
0000000145cca7ff 4d8b86e8010000                 mov r8, qword ptr [r14 + 0x1e8]
0000000145cca806 660f6ec2                       movd xmm0, edx
0000000145cca80a 660f60c0                       punpcklbw xmm0, xmm0
0000000145cca80e f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145cca813 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145cca818 448b4b08                       mov r9d, dword ptr [rbx + 8]
0000000145cca81c 4531d2                         xor r10d, r10d
0000000145cca81f 660f76c9                       pcmpeqd xmm1, xmm1
0000000145cca823 4c21c0                         and rax, r8
0000000145cca826 f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145cca82b 660f6fda                       movdqa xmm3, xmm2
0000000145cca82f 660f74d8                       pcmpeqb xmm3, xmm0
0000000145cca833 66440fd7db                     pmovmskb r11d, xmm3
0000000145cca838 4585db                         test r11d, r11d
0000000145cca83b 7433                           je 0x145cca870
0000000145cca83d f3410fbcdb                     tzcnt ebx, r11d
0000000145cca842 4801c3                         add rbx, rax
0000000145cca845 4c21c3                         and rbx, r8
0000000145cca848 48c1e305                       shl rbx, 5
0000000145cca84c 4889ca                         mov rdx, rcx
0000000145cca84f 4829da                         sub rdx, rbx
0000000145cca852 443b4ae0                       cmp r9d, dword ptr [rdx - 0x20]
0000000145cca856 7431                           je 0x145cca889
0000000145cca858 418d53ff                       lea edx, [r11 - 1]
0000000145cca85c 664421da                       and dx, r11w
0000000145cca860 4189d3                         mov r11d, edx
0000000145cca863 75d8                           jne 0x145cca83d
0000000145cca865 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145cca870 660f74d1                       pcmpeqb xmm2, xmm1
0000000145cca874 660fd7d2                       pmovmskb edx, xmm2
0000000145cca878 85d2                           test edx, edx
0000000145cca87a 757a                           jne 0x145cca8f6
0000000145cca87c 4c01d0                         add rax, r10
0000000145cca87f 4883c010                       add rax, 0x10
0000000145cca883 4983c210                       add r10, 0x10
0000000145cca887 eb9a                           jmp 0x145cca823
0000000145cca889 44897dfc                       mov dword ptr [rbp - 4], r15d
0000000145cca88d 4c8975f0                       mov qword ptr [rbp - 0x10], r14
0000000145cca891 4883c2e8                       add rdx, -0x18
0000000145cca895 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145cca899 e892a03600                     call 0x146034930
0000000145cca89e 90                             nop 
0000000145cca89f 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145cca8a3 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145cca8a7 0f1045d8                       movups xmm0, xmmword ptr [rbp - 0x28]
0000000145cca8ab 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145cca8ae 4c8b75f0                       mov r14, qword ptr [rbp - 0x10]
0000000145cca8b2 448b7dfc                       mov r15d, dword ptr [rbp - 4]
0000000145cca8b6 4584ff                         test r15b, r15b
0000000145cca8b9 7457                           je 0x145cca912
0000000145cca8bb eb60                           jmp 0x145cca91d
0000000145cca8bd 498d4e10                       lea rcx, [r14 + 0x10]
0000000145cca8c1 4889d7                         mov rdi, rdx
0000000145cca8c4 e847c75300                     call 0x146207010
0000000145cca8c9 4889fa                         mov rdx, rdi
0000000145cca8cc e9defeffff                     jmp 0x145cca7af
0000000145cca8d1 4889d3                         mov rbx, rdx
0000000145cca8d4 e8c7d45300                     call 0x146207da0
0000000145cca8d9 4889da                         mov rdx, rbx
0000000145cca8dc 4189c7                         mov r15d, eax
0000000145cca8df 4180f701                       xor r15b, 1
0000000145cca8e3 410fb64611                     movzx eax, byte ptr [r14 + 0x11]
0000000145cca8e8 4983bef801000000               cmp qword ptr [r14 + 0x1f8], 0
0000000145cca8f0 0f85e5feffff                   jne 0x145cca7db
0000000145cca8f6 48c70600000000                 mov qword ptr [rsi], 0
0000000145cca8fd 48c7460801000000               mov qword ptr [rsi + 8], 1
0000000145cca905 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145cca90d 4584ff                         test r15b, r15b
0000000145cca910 750b                           jne 0x145cca91d
0000000145cca912 488b07                         mov rax, qword ptr [rdi]
0000000145cca915 48d1e0                         shl rax, 1
0000000145cca918 4885c0                         test rax, rax
0000000145cca91b 7528                           jne 0x145cca945
0000000145cca91d 31c0                           xor eax, eax
0000000145cca91f 41864610                       xchg byte ptr [r14 + 0x10], al
0000000145cca923 3c02                           cmp al, 2
0000000145cca925 7410                           je 0x145cca937
0000000145cca927 4889f0                         mov rax, rsi
0000000145cca92a 4883c458                       add rsp, 0x58
0000000145cca92e 5b                             pop rbx
0000000145cca92f 5f                             pop rdi
0000000145cca930 5e                             pop rsi
0000000145cca931 415e                           pop r14
0000000145cca933 415f                           pop r15
0000000145cca935 5d                             pop rbp
0000000145cca936 c3                             ret 
0000000145cca937 4983c610                       add r14, 0x10
0000000145cca93b 4c89f1                         mov rcx, r14
0000000145cca93e e88dc75300                     call 0x1462070d0
0000000145cca943 ebe2                           jmp 0x145cca927
0000000145cca945 e856d45300                     call 0x146207da0
0000000145cca94a 84c0                           test al, al
0000000145cca94c 75cf                           jne 0x145cca91d
0000000145cca94e 41c6461101                     mov byte ptr [r14 + 0x11], 1
0000000145cca953 ebc8                           jmp 0x145cca91d
