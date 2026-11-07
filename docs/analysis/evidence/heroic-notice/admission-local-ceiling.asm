0000000145b23219 488b8d78300000                 mov rcx, qword ptr [rbp + 0x3078]
0000000145b23220 488b9570300000                 mov rdx, qword ptr [rbp + 0x3070]
0000000145b23227 e8648ff7ff                     call 0x145a9c190
0000000145b2322c 90                             nop
0000000145b2322d 4c89e1                         mov rcx, r12
0000000145b23230 89da                           mov edx, ebx
0000000145b23232 4989c0                         mov r8, rax
0000000145b23235 e84609f8ff                     call 0x145aa3b80
0000000145b2323a 90                             nop
0000000145b2323b 4088c7                         mov dil, al
0000000145b2323e 448ab6e0130000                 mov r14b, byte ptr [rsi + 0x13e0]
0000000145b23245 488d8d582f0000                 lea rcx, [rbp + 0x2f58]
0000000145b2324c 4c89e2                         mov rdx, r12
0000000145b2324f 4189d8                         mov r8d, ebx
0000000145b23252 e8d931f8ff                     call 0x145aa6430
0000000145b23257 90                             nop
0000000145b23258 400fb6c7                       movzx eax, dil
0000000145b2325c 410fb6fe                       movzx edi, r14b
0000000145b23260 4038f8                         cmp al, dil
0000000145b23263 0f42f8                         cmovb edi, eax
