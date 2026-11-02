0000000145aca820 56                             push rsi
0000000145aca821 57                             push rdi
0000000145aca822 4c8b81e0000000                 mov r8, qword ptr [rcx + 0xe0]
0000000145aca829 488b81e8000000                 mov rax, qword ptr [rcx + 0xe8]
0000000145aca830 48c1e004                       shl rax, 4
0000000145aca834 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145aca840 4885c0                         test rax, rax
0000000145aca843 743d                           je 0x145aca882
0000000145aca845 4883c0f0                       add rax, -0x10
0000000145aca849 49395008                       cmp qword ptr [r8 + 8], rdx
0000000145aca84d 4d8d4010                       lea r8, [r8 + 0x10]
0000000145aca851 75ed                           jne 0x145aca840
0000000145aca853 4c8b89d8010000                 mov r9, qword ptr [rcx + 0x1d8]
0000000145aca85a b001                           mov al, 1
0000000145aca85c 4d85c9                         test r9, r9
0000000145aca85f 741e                           je 0x145aca87f
0000000145aca861 488b89d0010000                 mov rcx, qword ptr [rcx + 0x1d0]
0000000145aca868 49c1e104                       shl r9, 4
0000000145aca86c 4531c0                         xor r8d, r8d
0000000145aca86f 90                             nop
0000000145aca870 4a391401                       cmp qword ptr [rcx + r8], rdx
0000000145aca874 7411                           je 0x145aca887
0000000145aca876 4983c010                       add r8, 0x10
0000000145aca87a 4d39c1                         cmp r9, r8
0000000145aca87d 75f1                           jne 0x145aca870
0000000145aca87f 5f                             pop rdi
0000000145aca880 5e                             pop rsi
0000000145aca881 c3                             ret
0000000145aca882 31c0                           xor eax, eax
0000000145aca884 5f                             pop rdi
0000000145aca885 5e                             pop rsi
0000000145aca886 c3                             ret
0000000145aca887 420fb6440109                   movzx eax, byte ptr [rcx + r8 + 9]
0000000145aca88d 4d8d51f0                       lea r10, [r9 - 0x10]
0000000145aca891 4d39c2                         cmp r10, r8
0000000145aca894 0f84a1000000                   je 0x145aca93b
0000000145aca89a 4d29c1                         sub r9, r8
0000000145aca89d 4983c1f0                       add r9, -0x10
0000000145aca8a1 49c1e904                       shr r9, 4
0000000145aca8a5 4983f901                       cmp r9, 1
0000000145aca8a9 7505                           jne 0x145aca8b0
0000000145aca8ab 4531d2                         xor r10d, r10d
0000000145aca8ae eb6d                           jmp 0x145aca91d
0000000145aca8b0 4e8d1c01                       lea r11, [rcx + r8]
0000000145aca8b4 4983c329                       add r11, 0x29
0000000145aca8b8 4c89ce                         mov rsi, r9
0000000145aca8bb 4883e6fe                       and rsi, 0xfffffffffffffffe
0000000145aca8bf 4531d2                         xor r10d, r10d
0000000145aca8c2 eb19                           jmp 0x145aca8dd
0000000145aca8c4 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145aca8d0 4983c202                       add r10, 2
0000000145aca8d4 4983c320                       add r11, 0x20
0000000145aca8d8 4c39d6                         cmp rsi, r10
0000000145aca8db 743a                           je 0x145aca917
0000000145aca8dd 493953e7                       cmp qword ptr [r11 - 0x19], rdx
0000000145aca8e1 751d                           jne 0x145aca900
0000000145aca8e3 0fb6c0                         movzx eax, al
0000000145aca8e6 410fb67bf0                     movzx edi, byte ptr [r11 - 0x10]
0000000145aca8eb 4038f8                         cmp al, dil
0000000145aca8ee 0f47f8                         cmova edi, eax
0000000145aca8f1 89f8                           mov eax, edi
0000000145aca8f3 493953f7                       cmp qword ptr [r11 - 9], rdx
0000000145aca8f7 75d7                           jne 0x145aca8d0
0000000145aca8f9 eb0b                           jmp 0x145aca906
0000000145aca8fb 0f1f440000                     nop dword ptr [rax + rax]
0000000145aca900 493953f7                       cmp qword ptr [r11 - 9], rdx
0000000145aca904 75ca                           jne 0x145aca8d0
0000000145aca906 0fb6c0                         movzx eax, al
0000000145aca909 410fb63b                       movzx edi, byte ptr [r11]
0000000145aca90d 4038f8                         cmp al, dil
0000000145aca910 0f47f8                         cmova edi, eax
0000000145aca913 89f8                           mov eax, edi
0000000145aca915 ebb9                           jmp 0x145aca8d0
0000000145aca917 41f6c101                       test r9b, 1
0000000145aca91b 741e                           je 0x145aca93b
0000000145aca91d 49c1e204                       shl r10, 4
0000000145aca921 4c01d1                         add rcx, r10
0000000145aca924 4939540810                     cmp qword ptr [r8 + rcx + 0x10], rdx
0000000145aca929 7510                           jne 0x145aca93b
0000000145aca92b 0fb6c0                         movzx eax, al
0000000145aca92e 410fb64c0819                   movzx ecx, byte ptr [r8 + rcx + 0x19]
0000000145aca934 38c8                           cmp al, cl
0000000145aca936 0f47c8                         cmova ecx, eax
0000000145aca939 89c8                           mov eax, ecx
0000000145aca93b fec0                           inc al
0000000145aca93d 0fb6c8                         movzx ecx, al
0000000145aca940 80f905                         cmp cl, 5
0000000145aca943 b805000000                     mov eax, 5
0000000145aca948 0f42c1                         cmovb eax, ecx
0000000145aca94b 5f                             pop rdi
0000000145aca94c 5e                             pop rsi
0000000145aca94d c3                             ret
