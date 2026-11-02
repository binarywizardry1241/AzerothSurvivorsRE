00000001459659de: 488b4930                       mov rcx, qword ptr [rcx + 0x30]
00000001459659e2: 0fb609                         movzx ecx, byte ptr [rcx]
00000001459659e5: 8808                           mov byte ptr [rax], cl
00000001459659e7: c745f06666a63f                 mov dword ptr [rbp - 0x10], 0x3fa66666
00000001459659ee: 48c745f801000000               mov qword ptr [rbp - 8], 1
00000001459659f6: 48894500                       mov qword ptr [rbp], rax
00000001459659fa: 48c7450801000000               mov qword ptr [rbp + 8], 1
0000000145965a02: 4c896d10                       mov qword ptr [rbp + 0x10], r13
