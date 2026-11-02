0000000145b231ce 4981ffffffff00                 cmp r15, 0xffffff
0000000145b231d5 7542                           jne 0x145b23219
0000000145b231d7 48c785582f000000000000         mov qword ptr [rbp + 0x2f58], 0
0000000145b231e2 48c785602f000008000000         mov qword ptr [rbp + 0x2f60], 8
0000000145b231ed 48c785682f000000000000         mov qword ptr [rbp + 0x2f68], 0
0000000145b231f8 c685702f000000                 mov byte ptr [rbp + 0x2f70], 0
0000000145b231ff 660fefc0                       pxor xmm0, xmm0
0000000145b23203 660f7f85002f0000               movdqa xmmword ptr [rbp + 0x2f00], xmm0
0000000145b2320b c7850f2f000000000000           mov dword ptr [rbp + 0x2f0f], 0
0000000145b23215 31ff                           xor edi, edi
0000000145b23217 eb68                           jmp 0x145b23281
