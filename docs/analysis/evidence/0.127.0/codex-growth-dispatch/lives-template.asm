00000001403534cb c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001403534d2 488d0d88caf205                 lea rcx, [rip + 0x5f2ca88]
00000001403534d9 ba39000000                     mov edx, 0x39
00000001403534de e83d4d8905                     call 0x145be8220
00000001403534e3 90                             nop
00000001403534e4 4989d0                         mov r8, rdx
00000001403534e7 c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001403534ee 48c744242001000000             mov qword ptr [rsp + 0x20], 1
00000001403534f7 4c8d0da2caf205                 lea r9, [rip + 0x5f2caa2]
00000001403534fe 488d8df8050000                 lea rcx, [rbp + 0x5f8]
0000000140353505 4889c2                         mov rdx, rax
0000000140353508 e8a3518905                     call 0x145be86b0
000000014035350d 90                             nop
000000014035350e e9c9010000                     jmp 0x1403536dc
