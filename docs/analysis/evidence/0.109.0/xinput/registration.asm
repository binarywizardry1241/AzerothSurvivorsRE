1401bab3d: e85ed01a00 call 0x140367ba0
1401bab42: 84c0 test al, al
1401bab44: 7412 je 0x1401bab58
1401bab46: 0fb6c0 movzx eax, al
1401bab49: 83f801 cmp eax, 1
1401bab4c: 7527 jne 0x1401bab75
1401bab4e: 4889f1 mov rcx, rsi
1401bab51: e80aca1a00 call 0x140367560
1401bab56: eb1d jmp 0x1401bab75
1401bab58: 4883bef005000000 cmp qword ptr [rsi + 0x5f0], 0
1401bab60: 0f85aa090000 jne 0x1401bb510
1401bab66: 488d1513e2c205 lea rdx, [rip + 0x5c2e213]
1401bab6d: 4889f1 mov rcx, rsi
1401bab70: e84b82efff call 0x1400b2dc0
