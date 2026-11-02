0000000145b9e650 55                             push rbp
0000000145b9e651 4157                           push r15
0000000145b9e653 4156                           push r14
0000000145b9e655 4155                           push r13
0000000145b9e657 4154                           push r12
0000000145b9e659 56                             push rsi
0000000145b9e65a 57                             push rdi
0000000145b9e65b 53                             push rbx
0000000145b9e65c 4883ec68                       sub rsp, 0x68
0000000145b9e660 488d6c2460                     lea rbp, [rsp + 0x60]
0000000145b9e665 0f2975f0                       movaps xmmword ptr [rbp - 0x10], xmm6
0000000145b9e669 48c745e8feffffff               mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
0000000145b9e671 4889ce                         mov rsi, rcx
0000000145b9e674 4d85c9                         test r9, r9
0000000145b9e677 7448                           je 0x145b9e6c1
0000000145b9e679 4180381a                       cmp byte ptr [r8], 0x1a
0000000145b9e67d 7542                           jne 0x145b9e6c1
0000000145b9e67f 4983f905                       cmp r9, 5
0000000145b9e683 723c                           jb 0x145b9e6c1
0000000145b9e685 4983f911                       cmp r9, 0x11
0000000145b9e689 7636                           jbe 0x145b9e6c1
0000000145b9e68b 410fb64009                     movzx eax, byte ptr [r8 + 9]
0000000145b9e690 83f805                         cmp eax, 5
0000000145b9e693 7450                           je 0x145b9e6e5
0000000145b9e695 83f806                         cmp eax, 6
0000000145b9e698 7527                           jne 0x145b9e6c1
0000000145b9e69a 488b4d70                       mov rcx, qword ptr [rbp + 0x70]
0000000145b9e69e 492b480a                       sub rcx, qword ptr [r8 + 0xa]
0000000145b9e6a2 b800000000                     mov eax, 0
0000000145b9e6a7 480f43c1                       cmovae rax, rcx
0000000145b9e6ab 4885c0                         test rax, rax
0000000145b9e6ae 0f8880000000                   js 0x145b9e734
0000000145b9e6b4 0f57f6                         xorps xmm6, xmm6
0000000145b9e6b7 f3480f2af0                     cvtsi2ss xmm6, rax
0000000145b9e6bc e98b000000                     jmp 0x145b9e74c
0000000145b9e6c1 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145b9e6c8 b001                           mov al, 1
0000000145b9e6ca 884618                         mov byte ptr [rsi + 0x18], al
0000000145b9e6cd 4889f0                         mov rax, rsi
0000000145b9e6d0 0f2875f0                       movaps xmm6, xmmword ptr [rbp - 0x10]
0000000145b9e6d4 4883c468                       add rsp, 0x68
0000000145b9e6d8 5b                             pop rbx
0000000145b9e6d9 5f                             pop rdi
0000000145b9e6da 5e                             pop rsi
0000000145b9e6db 415c                           pop r12
0000000145b9e6dd 415d                           pop r13
0000000145b9e6df 415e                           pop r14
0000000145b9e6e1 415f                           pop r15
0000000145b9e6e3 5d                             pop rbp
0000000145b9e6e4 c3                             ret 
0000000145b9e6e5 4c89c7                         mov rdi, r8
0000000145b9e6e8 e8133b46fa                     call 0x140002200
0000000145b9e6ed b912000000                     mov ecx, 0x12
0000000145b9e6f2 ba01000000                     mov edx, 1
0000000145b9e6f7 e8c43a46fa                     call 0x1400021c0
0000000145b9e6fc 4885c0                         test rax, rax
0000000145b9e6ff 0f8486020000                   je 0x145b9e98b
0000000145b9e705 f30f6f07                       movdqu xmm0, xmmword ptr [rdi]
0000000145b9e709 f30f7f00                       movdqu xmmword ptr [rax], xmm0
0000000145b9e70d 0fb74f10                       movzx ecx, word ptr [rdi + 0x10]
0000000145b9e711 66894810                       mov word ptr [rax + 0x10], cx
0000000145b9e715 c60006                         mov byte ptr [rax], 6
0000000145b9e718 c6400906                       mov byte ptr [rax + 9], 6
0000000145b9e71c 48c70612000000                 mov qword ptr [rsi], 0x12
0000000145b9e723 48894608                       mov qword ptr [rsi + 8], rax
0000000145b9e727 48c7461012000000               mov qword ptr [rsi + 0x10], 0x12
0000000145b9e72f e9da010000                     jmp 0x145b9e90e
0000000145b9e734 4889c1                         mov rcx, rax
0000000145b9e737 48d1e9                         shr rcx, 1
0000000145b9e73a 83e001                         and eax, 1
0000000145b9e73d 4809c8                         or rax, rcx
0000000145b9e740 0f57f6                         xorps xmm6, xmm6
0000000145b9e743 f3480f2af0                     cvtsi2ss xmm6, rax
0000000145b9e748 f30f58f6                       addss xmm6, xmm6
0000000145b9e74c 458b7001                       mov r14d, dword ptr [r8 + 1]
0000000145b9e750 4c8b22                         mov r12, qword ptr [rdx]
0000000145b9e753 b101                           mov cl, 1
0000000145b9e755 31c0                           xor eax, eax
0000000145b9e757 f0410fb04c2410                 lock cmpxchg byte ptr [r12 + 0x10], cl
0000000145b9e75e 0f85b1010000                   jne 0x145b9e915
0000000145b9e764 4c8b3dfd03ac02                 mov r15, qword ptr [rip + 0x2ac03fd]
0000000145b9e76b 498b07                         mov rax, qword ptr [r15]
0000000145b9e76e 48d1e0                         shl rax, 1
0000000145b9e771 4885c0                         test rax, rax
0000000145b9e774 0f85aa010000                   jne 0x145b9e924
0000000145b9e77a c745e400000000                 mov dword ptr [rbp - 0x1c], 0
0000000145b9e781 410fb6442411                   movzx eax, byte ptr [r12 + 0x11]
