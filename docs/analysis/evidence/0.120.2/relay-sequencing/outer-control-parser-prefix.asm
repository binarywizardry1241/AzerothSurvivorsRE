; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone5.0.7
0000000145e0b690 55                             push rbp
0000000145e0b691 4157                           push r15
0000000145e0b693 4156                           push r14
0000000145e0b695 4155                           push r13
0000000145e0b697 4154                           push r12
0000000145e0b699 56                             push rsi
0000000145e0b69a 57                             push rdi
0000000145e0b69b 53                             push rbx
0000000145e0b69c 4881ec28020000                 sub rsp, 0x228
0000000145e0b6a3 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145e0b6ab 48c785a0010000feffffff         mov qword ptr [rbp + 0x1a0], 0xfffffffffffffffe
0000000145e0b6b6 48898d60010000                 mov qword ptr [rbp + 0x160], rcx
0000000145e0b6bd 48899570010000                 mov qword ptr [rbp + 0x170], rdx
0000000145e0b6c4 4c898578010000                 mov qword ptr [rbp + 0x178], r8
0000000145e0b6cb c6858801000001                 mov byte ptr [rbp + 0x188], 1
0000000145e0b6d2 4d85c0                         test r8, r8
0000000145e0b6d5 7464                           je 0x145e0b73b
0000000145e0b6d7 48c7858001000001000000         mov qword ptr [rbp + 0x180], 1
0000000145e0b6e2 0fb602                         movzx eax, byte ptr [rdx]
0000000145e0b6e5 83c0ec                         add eax, -0x14
0000000145e0b6e8 83f80c                         cmp eax, 0xc
0000000145e0b6eb 774e                           ja 0x145e0b73b
0000000145e0b6ed 488d0dc8bc8601                 lea rcx, [rip + 0x186bcc8]
0000000145e0b6f4 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145e0b6f8 4801c8                         add rax, rcx
0000000145e0b6fb ffe0                           jmp rax
0000000145e0b6fd 48c7853001000000000000         mov qword ptr [rbp + 0x130], 0
0000000145e0b708 48c7853801000008000000         mov qword ptr [rbp + 0x138], 8
0000000145e0b713 48c7854001000000000000         mov qword ptr [rbp + 0x140], 0
0000000145e0b71e 4983f804                       cmp r8, 4
0000000145e0b722 0f8724030000                   ja 0x145e0ba4c
0000000145e0b728 c6858801000000                 mov byte ptr [rbp + 0x188], 0
0000000145e0b72f 4c898580010000                 mov qword ptr [rbp + 0x180], r8
0000000145e0b736 e94e030000                     jmp 0x145e0ba89
0000000145e0b73b 488b8560010000                 mov rax, qword ptr [rbp + 0x160]
0000000145e0b742 48c700ffffffff                 mov qword ptr [rax], 0xffffffffffffffff
0000000145e0b749 e93c0a0000                     jmp 0x145e0c18a
0000000145e0b74e 4889d0                         mov rax, rdx
0000000145e0b751 48ba0b00000000000080           movabs rdx, 0x800000000000000b
0000000145e0b75b 4983f804                       cmp r8, 4
0000000145e0b75f 0f87b8020000                   ja 0x145e0ba1d
0000000145e0b765 c6858801000000                 mov byte ptr [rbp + 0x188], 0
0000000145e0b76c e9c6010000                     jmp 0x145e0b937
0000000145e0b771 4983f804                       cmp r8, 4
0000000145e0b775 0f87ab020000                   ja 0x145e0ba26
0000000145e0b77b c6858801000000                 mov byte ptr [rbp + 0x188], 0
0000000145e0b782 48ba0400000000000080           movabs rdx, 0x8000000000000004
0000000145e0b78c e9a6010000                     jmp 0x145e0b937
0000000145e0b791 4983f804                       cmp r8, 4
0000000145e0b795 0f879e020000                   ja 0x145e0ba39
0000000145e0b79b c6858801000000                 mov byte ptr [rbp + 0x188], 0
0000000145e0b7a2 48ba0c00000000000080           movabs rdx, 0x800000000000000c
0000000145e0b7ac e986010000                     jmp 0x145e0b937
0000000145e0b7b1 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0b7b5 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145e0b7bc e84f0f0000                     call 0x145e0c710
0000000145e0b7c1 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e0b7c5 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e0b7c9 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e0b7cd 488b4560                       mov rax, qword ptr [rbp + 0x60]
0000000145e0b7d1 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0b7d8 8b7568                         mov esi, dword ptr [rbp + 0x68]
0000000145e0b7db 448b6d6c                       mov r13d, dword ptr [rbp + 0x6c]
0000000145e0b7df 4c8b5d70                       mov r11, qword ptr [rbp + 0x70]
0000000145e0b7e3 488b4578                       mov rax, qword ptr [rbp + 0x78]
0000000145e0b7e7 48898568010000                 mov qword ptr [rbp + 0x168], rax
0000000145e0b7ee 4c8b9580000000                 mov r10, qword ptr [rbp + 0x80]
0000000145e0b7f5 488b9d88000000                 mov rbx, qword ptr [rbp + 0x88]
0000000145e0b7fc 488b8590000000                 mov rax, qword ptr [rbp + 0x90]
0000000145e0b803 48898550010000                 mov qword ptr [rbp + 0x150], rax
0000000145e0b80a 488b8598000000                 mov rax, qword ptr [rbp + 0x98]
0000000145e0b811 48898590010000                 mov qword ptr [rbp + 0x190], rax
0000000145e0b818 488b85b8000000                 mov rax, qword ptr [rbp + 0xb8]
0000000145e0b81f 48894540                       mov qword ptr [rbp + 0x40], rax
0000000145e0b823 4c8bb5a0000000                 mov r14, qword ptr [rbp + 0xa0]
0000000145e0b82a 0f1085a8000000                 movups xmm0, xmmword ptr [rbp + 0xa8]
0000000145e0b831 0f294530                       movaps xmmword ptr [rbp + 0x30], xmm0
0000000145e0b835 48ba0900000000000080           movabs rdx, 0x8000000000000009
0000000145e0b83f e967080000                     jmp 0x145e0c0ab
0000000145e0b844 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0b848 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145e0b84f e82c150000                     call 0x145e0cd80
0000000145e0b854 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e0b858 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e0b85c 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e0b860 488b4560                       mov rax, qword ptr [rbp + 0x60]
0000000145e0b864 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0b86b 48ba0200000000000080           movabs rdx, 0x8000000000000002
0000000145e0b875 e931080000                     jmp 0x145e0c0ab
0000000145e0b87a 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0b87e 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145e0b885 e8f6140000                     call 0x145e0cd80
0000000145e0b88a 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e0b88e 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e0b892 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e0b896 488b4560                       mov rax, qword ptr [rbp + 0x60]
0000000145e0b89a 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0b8a1 48ba0300000000000080           movabs rdx, 0x8000000000000003
0000000145e0b8ab e9fb070000                     jmp 0x145e0c0ab
0000000145e0b8b0 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0b8b4 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145e0b8bb e8c0140000                     call 0x145e0cd80
0000000145e0b8c0 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e0b8c4 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e0b8c8 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e0b8cc 488b4560                       mov rax, qword ptr [rbp + 0x60]
0000000145e0b8d0 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0b8d7 48ba0700000000000080           movabs rdx, 0x8000000000000007
0000000145e0b8e1 e9c5070000                     jmp 0x145e0c0ab
0000000145e0b8e6 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0b8ea 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145e0b8f1 e88a140000                     call 0x145e0cd80
0000000145e0b8f6 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e0b8fa 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e0b8fe 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e0b902 488b4560                       mov rax, qword ptr [rbp + 0x60]
0000000145e0b906 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0b90d 48ba0100000000000080           movabs rdx, 0x8000000000000001
0000000145e0b917 e98f070000                     jmp 0x145e0c0ab
0000000145e0b91c 4983f804                       cmp r8, 4
0000000145e0b920 0f877a060000                   ja 0x145e0bfa0
0000000145e0b926 c6858801000000                 mov byte ptr [rbp + 0x188], 0
0000000145e0b92d 48ba0500000000000080           movabs rdx, 0x8000000000000005
0000000145e0b937 4531e4                         xor r12d, r12d
0000000145e0b93a e96c070000                     jmp 0x145e0c0ab
0000000145e0b93f 4983f804                       cmp r8, 4
0000000145e0b943 0f876a060000                   ja 0x145e0bfb3
0000000145e0b949 c6858801000000                 mov byte ptr [rbp + 0x188], 0
0000000145e0b950 31f6                           xor esi, esi
0000000145e0b952 4c89c0                         mov rax, r8
0000000145e0b955 4c8d7004                       lea r14, [rax + 4]
0000000145e0b959 4d39c6                         cmp r14, r8
0000000145e0b95c 0f8662060000                   jbe 0x145e0bfc4
0000000145e0b962 e96f060000                     jmp 0x145e0bfd6
0000000145e0b967 488d8d18010000                 lea rcx, [rbp + 0x118]
0000000145e0b96e 488dbd70010000                 lea rdi, [rbp + 0x170]
0000000145e0b975 4889fa                         mov rdx, rdi
0000000145e0b978 e803140000                     call 0x145e0cd80
0000000145e0b97d 90                             nop 
0000000145e0b97e 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0b982 4889fa                         mov rdx, rdi
0000000145e0b985 e806edffff                     call 0x145e0a690
0000000145e0b98a 90                             nop 
0000000145e0b98b 488b9518010000                 mov rdx, qword ptr [rbp + 0x118]
0000000145e0b992 448ba520010000                 mov r12d, dword ptr [rbp + 0x120]
0000000145e0b999 448bbd24010000                 mov r15d, dword ptr [rbp + 0x124]
0000000145e0b9a0 488bbd28010000                 mov rdi, qword ptr [rbp + 0x128]
0000000145e0b9a7 488b4550                       mov rax, qword ptr [rbp + 0x50]
0000000145e0b9ab 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0b9b2 8b7558                         mov esi, dword ptr [rbp + 0x58]
0000000145e0b9b5 448b6d5c                       mov r13d, dword ptr [rbp + 0x5c]
0000000145e0b9b9 4c8b5d60                       mov r11, qword ptr [rbp + 0x60]
0000000145e0b9bd 488b4568                       mov rax, qword ptr [rbp + 0x68]
0000000145e0b9c1 48898568010000                 mov qword ptr [rbp + 0x168], rax
0000000145e0b9c8 4c8b5570                       mov r10, qword ptr [rbp + 0x70]
0000000145e0b9cc 488b5d78                       mov rbx, qword ptr [rbp + 0x78]
0000000145e0b9d0 488b8580000000                 mov rax, qword ptr [rbp + 0x80]
0000000145e0b9d7 48898550010000                 mov qword ptr [rbp + 0x150], rax
0000000145e0b9de 488b85a8000000                 mov rax, qword ptr [rbp + 0xa8]
0000000145e0b9e5 48894540                       mov qword ptr [rbp + 0x40], rax
0000000145e0b9e9 488b8588000000                 mov rax, qword ptr [rbp + 0x88]
0000000145e0b9f0 48898590010000                 mov qword ptr [rbp + 0x190], rax
0000000145e0b9f7 0f108598000000                 movups xmm0, xmmword ptr [rbp + 0x98]
0000000145e0b9fe 0f294530                       movaps xmmword ptr [rbp + 0x30], xmm0
0000000145e0ba02 4c8bb590000000                 mov r14, qword ptr [rbp + 0x90]
0000000145e0ba09 e99d060000                     jmp 0x145e0c0ab
0000000145e0ba0e 48ba0800000000000080           movabs rdx, 0x8000000000000008
0000000145e0ba18 e98e060000                     jmp 0x145e0c0ab
0000000145e0ba1d 448b6001                       mov r12d, dword ptr [rax + 1]
0000000145e0ba21 e914ffffff                     jmp 0x145e0b93a
0000000145e0ba26 448b6201                       mov r12d, dword ptr [rdx + 1]
0000000145e0ba2a 48ba0400000000000080           movabs rdx, 0x8000000000000004
0000000145e0ba34 e901ffffff                     jmp 0x145e0b93a
0000000145e0ba39 448b6201                       mov r12d, dword ptr [rdx + 1]
0000000145e0ba3d 48ba0c00000000000080           movabs rdx, 0x800000000000000c
