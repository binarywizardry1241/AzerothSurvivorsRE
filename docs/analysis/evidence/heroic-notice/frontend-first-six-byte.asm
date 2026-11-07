00000001400637f0 8b08                           mov ecx, dword ptr [rax]
00000001400637f2 ba64656665                     mov edx, 0x65666564
00000001400637f7 31d1                           xor ecx, edx
00000001400637f9 0fb75004                       movzx edx, word ptr [rax + 4]
00000001400637fd 81f261740000                   xor edx, 0x7461
0000000140063803 09ca                           or edx, ecx
0000000140063805 7451                           je 0x140063858
0000000140063807 8b08                           mov ecx, dword ptr [rax]
0000000140063809 ba6c6f676f                     mov edx, 0x6f676f6c
000000014006380e 31d1                           xor ecx, edx
0000000140063810 0fb74004                       movzx eax, word ptr [rax + 4]
0000000140063814 3575740000                     xor eax, 0x7475
0000000140063819 09c8                           or eax, ecx
000000014006381b 0f855f010000                   jne 0x140063980
0000000140063821 eb35                           jmp 0x140063858
