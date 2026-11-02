00000001400051c0: 488b11                         mov rdx, qword ptr [rcx]
00000001400051c3: 4885d2                         test rdx, rdx
00000001400051c6: 740f                           je 0x1400051d7
00000001400051c8: 488b4908                       mov rcx, qword ptr [rcx + 8]
00000001400051cc: 41b801000000                   mov r8d, 1
00000001400051d2: e9f9cfffff                     jmp 0x1400021d0
00000001400051d7: c3                             ret
