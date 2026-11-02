0000000145b28bd2 4883fe05                       cmp rsi, 5
0000000145b28bd6 7532                           jne 0x145b28c0a
0000000145b28bd8 c685a202000001                 mov byte ptr [rbp + 0x2a2], 1
0000000145b28bdf ba06000000                     mov edx, 6
0000000145b28be4 488d0d65a7b301                 lea rcx, [rip + 0x1b3a765]
0000000145b28beb e87023fcff                     call 0x145aeaf60
0000000145b28bf0 90                             nop
0000000145b28bf1 4885c0                         test rax, rax
0000000145b28bf4 b906000000                     mov ecx, 6
0000000145b28bf9 480f44d1                       cmove rdx, rcx
0000000145b28bfd 488d0d4ca7b301                 lea rcx, [rip + 0x1b3a74c]
0000000145b28c04 480f44c1                       cmove rax, rcx
0000000145b28c08 eb76                           jmp 0x145b28c80
