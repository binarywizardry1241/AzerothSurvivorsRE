0000000145aab85a 4983fa01                       cmp r10, 1
0000000145aab85e 0f8523feffff                   jne 0x145aab687
0000000145aab864 4080fe0b                       cmp sil, 0xb
0000000145aab868 0f8719feffff                   ja 0x145aab687
0000000145aab86e 440fb6c6                       movzx r8d, sil
0000000145aab872 babe0b0000                     mov edx, 0xbbe
0000000145aab877 440fa3c2                       bt edx, r8d
0000000145aab87b 0f8306feffff                   jae 0x145aab687
0000000145aab881 84c0                           test al, al
0000000145aab883 0f84fefdffff                   je 0x145aab687
0000000145aab889 0fb6d8                         movzx ebx, al
0000000145aab88c 3c05                           cmp al, 5
0000000145aab88e b805000000                     mov eax, 5
0000000145aab893 0f43d8                         cmovae ebx, eax
0000000145aab896 4c8ba5f8020000                 mov r12, qword ptr [rbp + 0x2f8]
0000000145aab89d 4c3ba5e8020000                 cmp r12, qword ptr [rbp + 0x2e8]
0000000145aab8a4 0f85a6fdffff                   jne 0x145aab650
0000000145aab8aa 488d8de8020000                 lea rcx, [rbp + 0x2e8]
0000000145aab8b1 e86a0f5400                     call 0x145fec820
0000000145aab8b6 90                             nop
