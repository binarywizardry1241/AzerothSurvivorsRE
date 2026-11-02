0000000145c107c0 0fb69664030000                 movzx edx, byte ptr [rsi + 0x364]
0000000145c107c7 4c8b86e0020000                 mov r8, qword ptr [rsi + 0x2e0]
0000000145c107ce 4c8b8ee8020000                 mov r9, qword ptr [rsi + 0x2e8]
0000000145c107d5 4889f1                         mov rcx, rsi
0000000145c107d8 e8e3880100                     call 0x145c290c0
0000000145c107dd 4889f1                         mov rcx, rsi
0000000145c107e0 e83b700100                     call 0x145c27820
0000000145c107e5 48837e1002                     cmp qword ptr [rsi + 0x10], 2
0000000145c107ea 0f8437080000                   je 0x145c11027
0000000145c107f0 80be620d000001                 cmp byte ptr [rsi + 0xd62], 1
