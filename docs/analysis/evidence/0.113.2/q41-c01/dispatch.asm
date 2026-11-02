0000000140147509: 8b06                           mov eax, dword ptr [rsi]
000000014014750b: 89c1                           mov ecx, eax
000000014014750d: 83e902                         sub ecx, 2
0000000140147510: ba08000000                     mov edx, 8
0000000140147515: 0f42ca                         cmovb ecx, edx
0000000140147518: 488d15ddaad905                 lea rdx, [rip + 0x5d9aadd]
000000014014751f: 48630c8a                       movsxd rcx, dword ptr [rdx + rcx*4]
0000000140147523: 4801d1                         add rcx, rdx
0000000140147526: ffe1                           jmp rcx
