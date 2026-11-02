; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145c5a560 55                             push rbp
0000000145c5a561 4157                           push r15
0000000145c5a563 4156                           push r14
0000000145c5a565 4155                           push r13
0000000145c5a567 4154                           push r12
0000000145c5a569 56                             push rsi
0000000145c5a56a 57                             push rdi
0000000145c5a56b 53                             push rbx
0000000145c5a56c 4881ec98000000                 sub rsp, 0x98
0000000145c5a573 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c5a57b 48c74510feffffff               mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0000000145c5a583 4889ce                         mov rsi, rcx
0000000145c5a586 4c8b7a10                       mov r15, qword ptr [rdx + 0x10]
0000000145c5a58a 4c8b32                         mov r14, qword ptr [rdx]
0000000145c5a58d 488b7a08                       mov rdi, qword ptr [rdx + 8]
0000000145c5a591 4889f9                         mov rcx, rdi
0000000145c5a594 48c1e104                       shl rcx, 4
0000000145c5a598 4883c1f8                       add rcx, -8
0000000145c5a59c 0f1f4000                       nop dword ptr [rax]
0000000145c5a5a0 4c39ff                         cmp rdi, r15
0000000145c5a5a3 0f83a4010000                   jae 0x145c5a74d
0000000145c5a5a9 4889fb                         mov rbx, rdi
0000000145c5a5ac 48ffc7                         inc rdi
0000000145c5a5af 4883c110                       add rcx, 0x10
0000000145c5a5b3 493b1e                         cmp rbx, qword ptr [r14]
0000000145c5a5b6 74e8                           je 0x145c5a5a0
0000000145c5a5b8 4c8b6218                       mov r12, qword ptr [rdx + 0x18]
0000000145c5a5bc 498b442410                     mov rax, qword ptr [r12 + 0x10]
0000000145c5a5c1 4839c3                         cmp rbx, rax
0000000145c5a5c4 0f83c2010000                   jae 0x145c5a78c
0000000145c5a5ca 4d8b442408                     mov r8, qword ptr [r12 + 8]
0000000145c5a5cf 498b4408f8                     mov rax, qword ptr [r8 + rcx - 8]
0000000145c5a5d4 4d8b0408                       mov r8, qword ptr [r8 + rcx]
0000000145c5a5d8 4c8b4a20                       mov r9, qword ptr [rdx + 0x20]
0000000145c5a5dc 488b5228                       mov rdx, qword ptr [rdx + 0x28]
0000000145c5a5e0 488d4db0                       lea rcx, [rbp - 0x50]
0000000145c5a5e4 488955d0                       mov qword ptr [rbp - 0x30], rdx
0000000145c5a5e8 4889542420                     mov qword ptr [rsp + 0x20], rdx
0000000145c5a5ed 4889c2                         mov rdx, rax
0000000145c5a5f0 4c894dc8                       mov qword ptr [rbp - 0x38], r9
0000000145c5a5f4 e847b2eeff                     call 0x145b45840
0000000145c5a5f9 488b45b0                       mov rax, qword ptr [rbp - 0x50]
0000000145c5a5fd 4883f8ff                       cmp rax, -1
0000000145c5a601 0f8446010000                   je 0x145c5a74d
0000000145c5a607 48894508                       mov qword ptr [rbp + 8], rax
0000000145c5a60b 4c8965d8                       mov qword ptr [rbp - 0x28], r12
0000000145c5a60f 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145c5a613 48894500                       mov qword ptr [rbp], rax
0000000145c5a617 4c8b6dc0                       mov r13, qword ptr [rbp - 0x40]
0000000145c5a61b e8e07b3afa                     call 0x140002200
0000000145c5a620 b980000000                     mov ecx, 0x80
0000000145c5a625 ba08000000                     mov edx, 8
0000000145c5a62a e8917b3afa                     call 0x1400021c0
0000000145c5a62f 4885c0                         test rax, rax
0000000145c5a632 0f8468010000                   je 0x145c5a7a0
0000000145c5a638 4989c4                         mov r12, rax
0000000145c5a63b 488918                         mov qword ptr [rax], rbx
0000000145c5a63e 488b4508                       mov rax, qword ptr [rbp + 8]
0000000145c5a642 4989442408                     mov qword ptr [r12 + 8], rax
0000000145c5a647 488b4500                       mov rax, qword ptr [rbp]
0000000145c5a64b 4989442410                     mov qword ptr [r12 + 0x10], rax
0000000145c5a650 4d896c2418                     mov qword ptr [r12 + 0x18], r13
0000000145c5a655 48c745e804000000               mov qword ptr [rbp - 0x18], 4
0000000145c5a65d 4c8965f0                       mov qword ptr [rbp - 0x10], r12
0000000145c5a661 48c745f801000000               mov qword ptr [rbp - 8], 1
0000000145c5a669 bb01000000                     mov ebx, 1
0000000145c5a66e 4889f8                         mov rax, rdi
0000000145c5a671 48c1e004                       shl rax, 4
0000000145c5a675 4883c0f8                       add rax, -8
0000000145c5a679 0f1f8000000000                 nop dword ptr [rax]
0000000145c5a680 4c39ff                         cmp rdi, r15
0000000145c5a683 0f83dd000000                   jae 0x145c5a766
0000000145c5a689 4989fd                         mov r13, rdi
0000000145c5a68c 48ffc7                         inc rdi
0000000145c5a68f 4883c010                       add rax, 0x10
0000000145c5a693 4d3b2e                         cmp r13, qword ptr [r14]
0000000145c5a696 74e8                           je 0x145c5a680
0000000145c5a698 488b4dd8                       mov rcx, qword ptr [rbp - 0x28]
0000000145c5a69c 488b5110                       mov rdx, qword ptr [rcx + 0x10]
0000000145c5a6a0 4939d5                         cmp r13, rdx
0000000145c5a6a3 0f8309010000                   jae 0x145c5a7b2
0000000145c5a6a9 488b4908                       mov rcx, qword ptr [rcx + 8]
0000000145c5a6ad 488b5401f8                     mov rdx, qword ptr [rcx + rax - 8]
0000000145c5a6b2 4c8b0401                       mov r8, qword ptr [rcx + rax]
0000000145c5a6b6 488b45d0                       mov rax, qword ptr [rbp - 0x30]
0000000145c5a6ba 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145c5a6bf 488d4db0                       lea rcx, [rbp - 0x50]
0000000145c5a6c3 4c8b4dc8                       mov r9, qword ptr [rbp - 0x38]
0000000145c5a6c7 e874b1eeff                     call 0x145b45840
0000000145c5a6cc 90                             nop
0000000145c5a6cd 488b45b0                       mov rax, qword ptr [rbp - 0x50]
0000000145c5a6d1 4883f8ff                       cmp rax, -1
0000000145c5a6d5 0f848b000000                   je 0x145c5a766
0000000145c5a6db 48894508                       mov qword ptr [rbp + 8], rax
0000000145c5a6df 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145c5a6e3 48894500                       mov qword ptr [rbp], rax
0000000145c5a6e7 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145c5a6eb 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145c5a6ef 483b5de8                       cmp rbx, qword ptr [rbp - 0x18]
0000000145c5a6f3 7526                           jne 0x145c5a71b
0000000145c5a6f5 48c744242020000000             mov qword ptr [rsp + 0x20], 0x20
0000000145c5a6fe 41b801000000                   mov r8d, 1
0000000145c5a704 41b908000000                   mov r9d, 8
0000000145c5a70a 488d4de8                       lea rcx, [rbp - 0x18]
0000000145c5a70e 4889da                         mov rdx, rbx
0000000145c5a711 e82a0b3500                     call 0x145fab240
0000000145c5a716 90                             nop
0000000145c5a717 4c8b65f0                       mov r12, qword ptr [rbp - 0x10]
0000000145c5a71b 4889d8                         mov rax, rbx
0000000145c5a71e 48c1e005                       shl rax, 5
0000000145c5a722 4d892c04                       mov qword ptr [r12 + rax], r13
0000000145c5a726 488b4d08                       mov rcx, qword ptr [rbp + 8]
0000000145c5a72a 49894c0408                     mov qword ptr [r12 + rax + 8], rcx
0000000145c5a72f 488b4d00                       mov rcx, qword ptr [rbp]
0000000145c5a733 49894c0410                     mov qword ptr [r12 + rax + 0x10], rcx
0000000145c5a738 488b4de0                       mov rcx, qword ptr [rbp - 0x20]
0000000145c5a73c 49894c0418                     mov qword ptr [r12 + rax + 0x18], rcx
0000000145c5a741 48ffc3                         inc rbx
0000000145c5a744 48895df8                       mov qword ptr [rbp - 8], rbx
0000000145c5a748 e921ffffff                     jmp 0x145c5a66e
0000000145c5a74d 48c70600000000                 mov qword ptr [rsi], 0
0000000145c5a754 48c7460808000000               mov qword ptr [rsi + 8], 8
0000000145c5a75c 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145c5a764 eb0f                           jmp 0x145c5a775
0000000145c5a766 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145c5a76a 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145c5a76e 0f1045e8                       movups xmm0, xmmword ptr [rbp - 0x18]
0000000145c5a772 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145c5a775 4889f0                         mov rax, rsi
0000000145c5a778 4881c498000000                 add rsp, 0x98
0000000145c5a77f 5b                             pop rbx
0000000145c5a780 5f                             pop rdi
0000000145c5a781 5e                             pop rsi
0000000145c5a782 415c                           pop r12
0000000145c5a784 415d                           pop r13
0000000145c5a786 415e                           pop r14
0000000145c5a788 415f                           pop r15
0000000145c5a78a 5d                             pop rbp
0000000145c5a78b c3                             ret
0000000145c5a78c 4c8d050daa9a01                 lea r8, [rip + 0x19aaa0d]
0000000145c5a793 4889d9                         mov rcx, rbx
0000000145c5a796 4889c2                         mov rdx, rax
0000000145c5a799 e8a57c4f00                     call 0x146152443
0000000145c5a79e 0f0b                           ud2
0000000145c5a7a0 b908000000                     mov ecx, 8
0000000145c5a7a5 ba80000000                     mov edx, 0x80
0000000145c5a7aa e8fc784f00                     call 0x1461520ab
0000000145c5a7af 90                             nop
0000000145c5a7b0 eb10                           jmp 0x145c5a7c2
0000000145c5a7b2 4c8d05e7a99a01                 lea r8, [rip + 0x19aa9e7]
0000000145c5a7b9 4c89e9                         mov rcx, r13
0000000145c5a7bc e8827c4f00                     call 0x146152443
0000000145c5a7c1 90                             nop
0000000145c5a7c2 0f0b                           ud2
