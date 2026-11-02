0000000145b7c450 55                             push rbp
0000000145b7c451 4157                           push r15
0000000145b7c453 4156                           push r14
0000000145b7c455 4154                           push r12
0000000145b7c457 56                             push rsi
0000000145b7c458 57                             push rdi
0000000145b7c459 53                             push rbx
0000000145b7c45a 4883ec50                       sub rsp, 0x50
0000000145b7c45e 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145b7c463 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145b7c46b 4c89c7                         mov rdi, r8
0000000145b7c46e 4889d3                         mov rbx, rdx
0000000145b7c471 4889ce                         mov rsi, rcx
0000000145b7c474 e8875d48fa                     call 0x140002200
0000000145b7c479 b920000000                     mov ecx, 0x20
0000000145b7c47e ba01000000                     mov edx, 1
0000000145b7c483 e8385d48fa                     call 0x1400021c0
0000000145b7c488 4885c0                         test rax, rax
0000000145b7c48b 0f84be000000                   je 0x145b7c54f
0000000145b7c491 4989c6                         mov r14, rax
0000000145b7c494 66c745f0cb01                   mov word ptr [rbp - 0x10], 0x1cb
0000000145b7c49a 48c745d820000000               mov qword ptr [rbp - 0x28], 0x20
0000000145b7c4a2 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145b7c4a6 48c745e800000000               mov qword ptr [rbp - 0x18], 0
0000000145b7c4ae 4883ff21                       cmp rdi, 0x21
0000000145b7c4b2 736c                           jae 0x145b7c520
0000000145b7c4b4 41bc20000000                   mov r12d, 0x20
0000000145b7c4ba 4531ff                         xor r15d, r15d
0000000145b7c4bd 4885ff                         test rdi, rdi
0000000145b7c4c0 740f                           je 0x145b7c4d1
0000000145b7c4c2 4b8d0c3e                       lea rcx, [r14 + r15]
0000000145b7c4c6 4889da                         mov rdx, rbx
0000000145b7c4c9 4989f8                         mov r8, rdi
0000000145b7c4cc e84af74600                     call 0x145febc1b
0000000145b7c4d1 4901ff                         add r15, rdi
0000000145b7c4d4 4c897de8                       mov qword ptr [rbp - 0x18], r15
0000000145b7c4d8 4d39e7                         cmp r15, r12
0000000145b7c4db 750e                           jne 0x145b7c4eb
0000000145b7c4dd 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145b7c4e1 e8ca7a6100                     call 0x146193fb0
0000000145b7c4e6 90                             nop
0000000145b7c4e7 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145b7c4eb 43c6043e00                     mov byte ptr [r14 + r15], 0
0000000145b7c4f0 49ffc7                         inc r15
0000000145b7c4f3 4c897de8                       mov qword ptr [rbp - 0x18], r15
0000000145b7c4f7 0f1045d8                       movups xmm0, xmmword ptr [rbp - 0x28]
0000000145b7c4fb 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145b7c4fe 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145b7c502 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145b7c506 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b7c50a 48894618                       mov qword ptr [rsi + 0x18], rax
0000000145b7c50e 4889f0                         mov rax, rsi
0000000145b7c511 4883c450                       add rsp, 0x50
0000000145b7c515 5b                             pop rbx
0000000145b7c516 5f                             pop rdi
0000000145b7c517 5e                             pop rsi
0000000145b7c518 415c                           pop r12
0000000145b7c51a 415e                           pop r14
0000000145b7c51c 415f                           pop r15
0000000145b7c51e 5d                             pop rbp
0000000145b7c51f c3                             ret
0000000145b7c520 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b7c529 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145b7c52d 41b901000000                   mov r9d, 1
0000000145b7c533 31d2                           xor edx, edx
0000000145b7c535 4989f8                         mov r8, rdi
0000000145b7c538 e853fe4600                     call 0x145fec390
0000000145b7c53d 90                             nop
0000000145b7c53e 4c8b7de8                       mov r15, qword ptr [rbp - 0x18]
0000000145b7c542 4c8b65d8                       mov r12, qword ptr [rbp - 0x28]
0000000145b7c546 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145b7c54a e973ffffff                     jmp 0x145b7c4c2
0000000145b7c54f b901000000                     mov ecx, 1
0000000145b7c554 ba20000000                     mov edx, 0x20
0000000145b7c559 e85d7b6100                     call 0x1461940bb
0000000145b7c55e 0f0b                           ud2
