0000000145aa3f70 4157                           push r15
0000000145aa3f72 4156                           push r14
0000000145aa3f74 56                             push rsi
0000000145aa3f75 57                             push rdi
0000000145aa3f76 55                             push rbp
0000000145aa3f77 53                             push rbx
0000000145aa3f78 4883ec28                       sub rsp, 0x28
0000000145aa3f7c 410fb6c1                       movzx eax, r9b
0000000145aa3f80 3c05                           cmp al, 5
0000000145aa3f82 bf05000000                     mov edi, 5
0000000145aa3f87 0f42f8                         cmovb edi, eax
0000000145aa3f8a 84c0                           test al, al
0000000145aa3f8c 0f94c0                         sete al
0000000145aa3f8f 4983f80c                       cmp r8, 0xc
0000000145aa3f93 410f93c1                       setae r9b
0000000145aa3f97 4108c1                         or r9b, al
0000000145aa3f9a 754a                           jne 0x145aa3fe6
0000000145aa3f9c 488b81d0010000                 mov rax, qword ptr [rcx + 0x1d0]
0000000145aa3fa3 488bb1d8010000                 mov rsi, qword ptr [rcx + 0x1d8]
0000000145aa3faa 4889f3                         mov rbx, rsi
0000000145aa3fad 48c1e304                       shl rbx, 4
0000000145aa3fb1 4885f6                         test rsi, rsi
0000000145aa3fb4 7434                           je 0x145aa3fea
0000000145aa3fb6 4531c9                         xor r9d, r9d
0000000145aa3fb9 eb0e                           jmp 0x145aa3fc9
0000000145aa3fbb 0f1f440000                     nop dword ptr [rax + rax]
0000000145aa3fc0 4983c110                       add r9, 0x10
0000000145aa3fc4 4c39cb                         cmp rbx, r9
0000000145aa3fc7 7421                           je 0x145aa3fea
0000000145aa3fc9 4238540808                     cmp byte ptr [rax + r9 + 8], dl
0000000145aa3fce 75f0                           jne 0x145aa3fc0
0000000145aa3fd0 4e390408                       cmp qword ptr [rax + r9], r8
0000000145aa3fd4 75ea                           jne 0x145aa3fc0
0000000145aa3fd6 42387c0809                     cmp byte ptr [rax + r9 + 9], dil
0000000145aa3fdb 7309                           jae 0x145aa3fe6
0000000145aa3fdd 42887c0809                     mov byte ptr [rax + r9 + 9], dil
0000000145aa3fe2 b001                           mov al, 1
0000000145aa3fe4 eb52                           jmp 0x145aa4038
0000000145aa3fe6 31c0                           xor eax, eax
0000000145aa3fe8 eb4e                           jmp 0x145aa4038
0000000145aa3fea 483bb1c8010000                 cmp rsi, qword ptr [rcx + 0x1c8]
0000000145aa3ff1 7526                           jne 0x145aa4019
0000000145aa3ff3 488d81c8010000                 lea rax, [rcx + 0x1c8]
0000000145aa3ffa 4989ce                         mov r14, rcx
0000000145aa3ffd 4889c1                         mov rcx, rax
0000000145aa4000 89d5                           mov ebp, edx
0000000145aa4002 4d89c7                         mov r15, r8
0000000145aa4005 e816885400                     call 0x145fec820
0000000145aa400a 4d89f8                         mov r8, r15
0000000145aa400d 89ea                           mov edx, ebp
0000000145aa400f 4c89f1                         mov rcx, r14
0000000145aa4012 498b86d0010000                 mov rax, qword ptr [r14 + 0x1d0]
0000000145aa4019 4c890418                       mov qword ptr [rax + rbx], r8
0000000145aa401d 88541808                       mov byte ptr [rax + rbx + 8], dl
0000000145aa4021 40887c1809                     mov byte ptr [rax + rbx + 9], dil
0000000145aa4026 48ffc6                         inc rsi
0000000145aa4029 4889b1d8010000                 mov qword ptr [rcx + 0x1d8], rsi
0000000145aa4030 b001                           mov al, 1
0000000145aa4032 4883fe02                       cmp rsi, 2
0000000145aa4036 730d                           jae 0x145aa4045
0000000145aa4038 4883c428                       add rsp, 0x28
0000000145aa403c 5b                             pop rbx
0000000145aa403d 5d                             pop rbp
0000000145aa403e 5f                             pop rdi
0000000145aa403f 5e                             pop rsi
0000000145aa4040 415e                           pop r14
0000000145aa4042 415f                           pop r15
0000000145aa4044 c3                             ret
0000000145aa4045 488b89d0010000                 mov rcx, qword ptr [rcx + 0x1d0]
0000000145aa404c 4883fe15                       cmp rsi, 0x15
0000000145aa4050 7318                           jae 0x145aa406a
0000000145aa4052 4c8d4c2427                     lea r9, [rsp + 0x27]
0000000145aa4057 41b801000000                   mov r8d, 1
0000000145aa405d 4889f2                         mov rdx, rsi
0000000145aa4060 e86b8a2000                     call 0x145cacad0
0000000145aa4065 e978ffffff                     jmp 0x145aa3fe2
0000000145aa406a 4c8d442427                     lea r8, [rsp + 0x27]
0000000145aa406f 4889f2                         mov rdx, rsi
0000000145aa4072 e859360c00                     call 0x145b676d0
0000000145aa4077 e966ffffff                     jmp 0x145aa3fe2
