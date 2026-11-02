0000000145bfa620 4889542410                     mov qword ptr [rsp + 0x10], rdx
0000000145bfa625 55                             push rbp
0000000145bfa626 4157                           push r15
0000000145bfa628 4156                           push r14
0000000145bfa62a 4155                           push r13
0000000145bfa62c 4154                           push r12
0000000145bfa62e 56                             push rsi
0000000145bfa62f 57                             push rdi
0000000145bfa630 53                             push rbx
0000000145bfa631 4883ec68                       sub rsp, 0x68
0000000145bfa635 488daa80000000                 lea rbp, [rdx + 0x80]
0000000145bfa63c 440f294c2420                   movaps xmmword ptr [rsp + 0x20], xmm9
0000000145bfa642 440f29442430                   movaps xmmword ptr [rsp + 0x30], xmm8
0000000145bfa648 660f7f7c2440                   movdqa xmmword ptr [rsp + 0x40], xmm7
0000000145bfa64e 0f29742450                     movaps xmmword ptr [rsp + 0x50], xmm6
0000000145bfa653 80bdc602000000                 cmp byte ptr [rbp + 0x2c6], 0
0000000145bfa65a 0f84c9000000                   je 0x145bfa729
0000000145bfa660 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145bfa66a 488b8580020000                 mov rax, qword ptr [rbp + 0x280]
0000000145bfa671 4831c1                         xor rcx, rax
0000000145bfa674 4889c2                         mov rdx, rax
0000000145bfa677 4885c0                         test rax, rax
0000000145bfa67a b80a000000                     mov eax, 0xa
0000000145bfa67f 480f48c1                       cmovs rax, rcx
0000000145bfa683 4883c0fe                       add rax, -2
0000000145bfa687 4883f808                       cmp rax, 8
0000000145bfa68b 7768                           ja 0x145bfa6f5
0000000145bfa68d 488d0de876a001                 lea rcx, [rip + 0x1a076e8]
0000000145bfa694 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bfa698 4801c8                         add rax, rcx
0000000145bfa69b ffe0                           jmp rax
0000000145bfa69d f685c202000001                 test byte ptr [rbp + 0x2c2], 1
0000000145bfa6a4 0f84a0010000                   je 0x145bfa84a
0000000145bfa6aa 4885d2                         test rdx, rdx
0000000145bfa6ad 7412                           je 0x145bfa6c1
0000000145bfa6af 488b8d88000000                 mov rcx, qword ptr [rbp + 0x88]
0000000145bfa6b6 41b801000000                   mov r8d, 1
0000000145bfa6bc e80f7b40fa                     call 0x1400021d0
0000000145bfa6c1 488d8d98000000                 lea rcx, [rbp + 0x98]
0000000145bfa6c8 e8b3cb73fa                     call 0x140337280
0000000145bfa6cd 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa6d2 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa6d8 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa6de 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa6e4 4883c468                       add rsp, 0x68
0000000145bfa6e8 5b                             pop rbx
0000000145bfa6e9 5f                             pop rdi
0000000145bfa6ea 5e                             pop rsi
0000000145bfa6eb 415c                           pop r12
0000000145bfa6ed 415d                           pop r13
0000000145bfa6ef 415e                           pop r14
0000000145bfa6f1 415f                           pop r15
0000000145bfa6f3 5d                             pop rbp
0000000145bfa6f4 c3                             ret
0000000145bfa6f5 488d8d80000000                 lea rcx, [rbp + 0x80]
0000000145bfa6fc e81f91ffff                     call 0x145bf3820
0000000145bfa701 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa706 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa70c 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa712 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa718 4883c468                       add rsp, 0x68
0000000145bfa71c 5b                             pop rbx
0000000145bfa71d 5f                             pop rdi
0000000145bfa71e 5e                             pop rsi
0000000145bfa71f 415c                           pop r12
0000000145bfa721 415d                           pop r13
0000000145bfa723 415e                           pop r14
0000000145bfa725 415f                           pop r15
0000000145bfa727 5d                             pop rbp
0000000145bfa728 c3                             ret
0000000145bfa729 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa72e 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa734 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa73a 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa740 4883c468                       add rsp, 0x68
0000000145bfa744 5b                             pop rbx
0000000145bfa745 5f                             pop rdi
0000000145bfa746 5e                             pop rsi
0000000145bfa747 415c                           pop r12
0000000145bfa749 415d                           pop r13
0000000145bfa74b 415e                           pop r14
0000000145bfa74d 415f                           pop r15
0000000145bfa74f 5d                             pop rbp
0000000145bfa750 c3                             ret
0000000145bfa751 f685c402000001                 test byte ptr [rbp + 0x2c4], 1
0000000145bfa758 0f8414010000                   je 0x145bfa872
0000000145bfa75e 488b9588000000                 mov rdx, qword ptr [rbp + 0x88]
0000000145bfa765 4885d2                         test rdx, rdx
0000000145bfa768 7412                           je 0x145bfa77c
0000000145bfa76a 488b8d90000000                 mov rcx, qword ptr [rbp + 0x90]
0000000145bfa771 41b801000000                   mov r8d, 1
0000000145bfa777 e8547a40fa                     call 0x1400021d0
0000000145bfa77c 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa781 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa787 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa78d 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa793 4883c468                       add rsp, 0x68
0000000145bfa797 5b                             pop rbx
0000000145bfa798 5f                             pop rdi
0000000145bfa799 5e                             pop rsi
0000000145bfa79a 415c                           pop r12
0000000145bfa79c 415d                           pop r13
0000000145bfa79e 415e                           pop r14
0000000145bfa7a0 415f                           pop r15
0000000145bfa7a2 5d                             pop rbp
0000000145bfa7a3 c3                             ret
0000000145bfa7a4 f685c502000001                 test byte ptr [rbp + 0x2c5], 1
0000000145bfa7ab 0f84e9000000                   je 0x145bfa89a
0000000145bfa7b1 488b9588000000                 mov rdx, qword ptr [rbp + 0x88]
0000000145bfa7b8 4885d2                         test rdx, rdx
0000000145bfa7bb 7412                           je 0x145bfa7cf
0000000145bfa7bd 488b8d90000000                 mov rcx, qword ptr [rbp + 0x90]
0000000145bfa7c4 41b801000000                   mov r8d, 1
0000000145bfa7ca e8017a40fa                     call 0x1400021d0
0000000145bfa7cf 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa7d4 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa7da 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa7e0 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa7e6 4883c468                       add rsp, 0x68
0000000145bfa7ea 5b                             pop rbx
0000000145bfa7eb 5f                             pop rdi
0000000145bfa7ec 5e                             pop rsi
0000000145bfa7ed 415c                           pop r12
0000000145bfa7ef 415d                           pop r13
0000000145bfa7f1 415e                           pop r14
0000000145bfa7f3 415f                           pop r15
0000000145bfa7f5 5d                             pop rbp
0000000145bfa7f6 c3                             ret
0000000145bfa7f7 f685c302000001                 test byte ptr [rbp + 0x2c3], 1
0000000145bfa7fe 0f84be000000                   je 0x145bfa8c2
0000000145bfa804 488b9588000000                 mov rdx, qword ptr [rbp + 0x88]
0000000145bfa80b 4885d2                         test rdx, rdx
0000000145bfa80e 7412                           je 0x145bfa822
0000000145bfa810 488b8d90000000                 mov rcx, qword ptr [rbp + 0x90]
0000000145bfa817 41b801000000                   mov r8d, 1
0000000145bfa81d e8ae7940fa                     call 0x1400021d0
0000000145bfa822 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa827 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa82d 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa833 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa839 4883c468                       add rsp, 0x68
0000000145bfa83d 5b                             pop rbx
0000000145bfa83e 5f                             pop rdi
0000000145bfa83f 5e                             pop rsi
0000000145bfa840 415c                           pop r12
0000000145bfa842 415d                           pop r13
0000000145bfa844 415e                           pop r14
0000000145bfa846 415f                           pop r15
0000000145bfa848 5d                             pop rbp
0000000145bfa849 c3                             ret
0000000145bfa84a 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa84f 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa855 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa85b 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa861 4883c468                       add rsp, 0x68
0000000145bfa865 5b                             pop rbx
0000000145bfa866 5f                             pop rdi
0000000145bfa867 5e                             pop rsi
0000000145bfa868 415c                           pop r12
0000000145bfa86a 415d                           pop r13
0000000145bfa86c 415e                           pop r14
0000000145bfa86e 415f                           pop r15
0000000145bfa870 5d                             pop rbp
0000000145bfa871 c3                             ret
0000000145bfa872 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa877 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa87d 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa883 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa889 4883c468                       add rsp, 0x68
0000000145bfa88d 5b                             pop rbx
0000000145bfa88e 5f                             pop rdi
0000000145bfa88f 5e                             pop rsi
0000000145bfa890 415c                           pop r12
0000000145bfa892 415d                           pop r13
0000000145bfa894 415e                           pop r14
0000000145bfa896 415f                           pop r15
0000000145bfa898 5d                             pop rbp
0000000145bfa899 c3                             ret
0000000145bfa89a 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa89f 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa8a5 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa8ab 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa8b1 4883c468                       add rsp, 0x68
0000000145bfa8b5 5b                             pop rbx
0000000145bfa8b6 5f                             pop rdi
0000000145bfa8b7 5e                             pop rsi
0000000145bfa8b8 415c                           pop r12
0000000145bfa8ba 415d                           pop r13
0000000145bfa8bc 415e                           pop r14
0000000145bfa8be 415f                           pop r15
0000000145bfa8c0 5d                             pop rbp
0000000145bfa8c1 c3                             ret
0000000145bfa8c2 0f28742450                     movaps xmm6, xmmword ptr [rsp + 0x50]
0000000145bfa8c7 660f6f7c2440                   movdqa xmm7, xmmword ptr [rsp + 0x40]
0000000145bfa8cd 440f28442430                   movaps xmm8, xmmword ptr [rsp + 0x30]
0000000145bfa8d3 440f284c2420                   movaps xmm9, xmmword ptr [rsp + 0x20]
0000000145bfa8d9 4883c468                       add rsp, 0x68
0000000145bfa8dd 5b                             pop rbx
0000000145bfa8de 5f                             pop rdi
0000000145bfa8df 5e                             pop rsi
0000000145bfa8e0 415c                           pop r12
0000000145bfa8e2 415d                           pop r13
0000000145bfa8e4 415e                           pop r14
0000000145bfa8e6 415f                           pop r15
0000000145bfa8e8 5d                             pop rbp
0000000145bfa8e9 c3                             ret
