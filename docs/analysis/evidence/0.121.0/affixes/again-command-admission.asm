0000000145b2a4b0 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145b2a4b4 0f849c0c0000                   je 0x145b2b156
0000000145b2a4ba 80be3a0d000000                 cmp byte ptr [rsi + 0xd3a], 0
0000000145b2a4c1 0f848f0c0000                   je 0x145b2b156
0000000145b2a4c7 4889f1                         mov rcx, rsi
0000000145b2a4ca e8c1dcffff                     call 0x145b28190
0000000145b2a4cf 90                             nop
0000000145b2a4d0 eba8                           jmp 0x145b2a47a
