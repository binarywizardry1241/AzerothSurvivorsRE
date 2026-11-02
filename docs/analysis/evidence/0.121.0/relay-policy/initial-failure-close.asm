0000000145c593ef 41c684244101000001             mov byte ptr [r12 + 0x141], 1
0000000145c593f8 498b8c2430010000               mov rcx, qword ptr [r12 + 0x130]
0000000145c59400 498b842438010000               mov rax, qword ptr [r12 + 0x138]
0000000145c59408 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145c5940c c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c59413 ffd0                           call rax
0000000145c59415 90                             nop
0000000145c59416 e953090000                     jmp 0x145c59d6e
