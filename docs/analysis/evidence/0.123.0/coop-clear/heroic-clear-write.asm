0000000145aca710 4157                           push r15
0000000145aca712 4156                           push r14
0000000145aca714 56                             push rsi
0000000145aca715 57                             push rdi
0000000145aca716 55                             push rbp
0000000145aca717 53                             push rbx
0000000145aca718 4883ec28                       sub rsp, 0x28
0000000145aca71c 410fb6c1                       movzx eax, r9b
0000000145aca720 3c05                           cmp al, 5
0000000145aca722 bf05000000                     mov edi, 5
0000000145aca727 0f42f8                         cmovb edi, eax
0000000145aca72a 84c0                           test al, al
0000000145aca72c 0f94c0                         sete al
0000000145aca72f 4983f80c                       cmp r8, 0xc
0000000145aca733 410f93c1                       setae r9b
0000000145aca737 4108c1                         or r9b, al
0000000145aca73a 754a                           jne 0x145aca786
0000000145aca73c 488b81d0010000                 mov rax, qword ptr [rcx + 0x1d0]
0000000145aca743 488bb1d8010000                 mov rsi, qword ptr [rcx + 0x1d8]
0000000145aca74a 4889f3                         mov rbx, rsi
0000000145aca74d 48c1e304                       shl rbx, 4
0000000145aca751 4885f6                         test rsi, rsi
0000000145aca754 7434                           je 0x145aca78a
0000000145aca756 4531c9                         xor r9d, r9d
0000000145aca759 eb0e                           jmp 0x145aca769
0000000145aca75b 0f1f440000                     nop dword ptr [rax + rax]
0000000145aca760 4983c110                       add r9, 0x10
0000000145aca764 4c39cb                         cmp rbx, r9
0000000145aca767 7421                           je 0x145aca78a
0000000145aca769 4238540808                     cmp byte ptr [rax + r9 + 8], dl
0000000145aca76e 75f0                           jne 0x145aca760
0000000145aca770 4e390408                       cmp qword ptr [rax + r9], r8
0000000145aca774 75ea                           jne 0x145aca760
0000000145aca776 42387c0809                     cmp byte ptr [rax + r9 + 9], dil
0000000145aca77b 7309                           jae 0x145aca786
0000000145aca77d 42887c0809                     mov byte ptr [rax + r9 + 9], dil
0000000145aca782 b001                           mov al, 1
0000000145aca784 eb52                           jmp 0x145aca7d8
0000000145aca786 31c0                           xor eax, eax
0000000145aca788 eb4e                           jmp 0x145aca7d8
0000000145aca78a 483bb1c8010000                 cmp rsi, qword ptr [rcx + 0x1c8]
0000000145aca791 7526                           jne 0x145aca7b9
0000000145aca793 488d81c8010000                 lea rax, [rcx + 0x1c8]
0000000145aca79a 4989ce                         mov r14, rcx
0000000145aca79d 4889c1                         mov rcx, rax
0000000145aca7a0 89d5                           mov ebp, edx
0000000145aca7a2 4d89c7                         mov r15, r8
0000000145aca7a5 e806be5300                     call 0x1460065b0
0000000145aca7aa 4d89f8                         mov r8, r15
0000000145aca7ad 89ea                           mov edx, ebp
0000000145aca7af 4c89f1                         mov rcx, r14
0000000145aca7b2 498b86d0010000                 mov rax, qword ptr [r14 + 0x1d0]
0000000145aca7b9 4c890418                       mov qword ptr [rax + rbx], r8
0000000145aca7bd 88541808                       mov byte ptr [rax + rbx + 8], dl
0000000145aca7c1 40887c1809                     mov byte ptr [rax + rbx + 9], dil
0000000145aca7c6 48ffc6                         inc rsi
0000000145aca7c9 4889b1d8010000                 mov qword ptr [rcx + 0x1d8], rsi
0000000145aca7d0 b001                           mov al, 1
0000000145aca7d2 4883fe02                       cmp rsi, 2
0000000145aca7d6 730d                           jae 0x145aca7e5
0000000145aca7d8 4883c428                       add rsp, 0x28
0000000145aca7dc 5b                             pop rbx
0000000145aca7dd 5d                             pop rbp
0000000145aca7de 5f                             pop rdi
0000000145aca7df 5e                             pop rsi
0000000145aca7e0 415e                           pop r14
0000000145aca7e2 415f                           pop r15
0000000145aca7e4 c3                             ret
0000000145aca7e5 488b89d0010000                 mov rcx, qword ptr [rcx + 0x1d0]
0000000145aca7ec 4883fe15                       cmp rsi, 0x15
0000000145aca7f0 7318                           jae 0x145aca80a
0000000145aca7f2 4c8d4c2427                     lea r9, [rsp + 0x27]
0000000145aca7f7 41b801000000                   mov r8d, 1
0000000145aca7fd 4889f2                         mov rdx, rsi
0000000145aca800 e81be21e00                     call 0x145cb8a20
0000000145aca805 e978ffffff                     jmp 0x145aca782
0000000145aca80a 4c8d442427                     lea r8, [rsp + 0x27]
0000000145aca80f 4889f2                         mov rdx, rsi
0000000145aca812 e8d9921800                     call 0x145c53af0
0000000145aca817 e966ffffff                     jmp 0x145aca782
