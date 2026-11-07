0000000145b25968 4889f9                         mov rcx, rdi
0000000145b2596b 4889da                         mov rdx, rbx
0000000145b2596e e81d68f7ff                     call 0x145a9c190
0000000145b25973 0fb696d8130000                 movzx edx, byte ptr [rsi + 0x13d8]
0000000145b2597a 488d8e10110000                 lea rcx, [rsi + 0x1110]
0000000145b25981 4989c0                         mov r8, rax
0000000145b25984 e8f7e1f7ff                     call 0x145aa3b80
0000000145b25989 90                             nop
0000000145b2598a 8b8ee0130000                   mov ecx, dword ptr [rsi + 0x13e0]
0000000145b25990 0fb6c0                         movzx eax, al
0000000145b25993 38c8                           cmp al, cl
0000000145b25995 0f42c8                         cmovb ecx, eax
0000000145b25998 888d10300000                   mov byte ptr [rbp + 0x3010], cl
