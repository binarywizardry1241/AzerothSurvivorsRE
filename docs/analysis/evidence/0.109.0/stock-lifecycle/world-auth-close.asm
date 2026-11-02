0x145a175e0: 55                       push rbp
0x145a175e1: 4883ec40                 sub rsp, 0x40
0x145a175e5: 488d6c2440               lea rbp, [rsp + 0x40]
0x145a175ea: 48c745f8feffffff         mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145a175f2: 48894df0                 mov qword ptr [rbp - 0x10], rcx
0x145a175f6: 48833900                 cmp qword ptr [rcx], 0
0x145a175fa: 745b                     je 0x145a17657
0x145a175fc: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x145a17600: 488b4808                 mov rcx, qword ptr [rax + 8]
0x145a17604: 4885c9                   test rcx, rcx
0x145a17607: 7444                     je 0x145a1764d
0x145a17609: 48894de0                 mov qword ptr [rbp - 0x20], rcx
0x145a1760d: 488d4808                 lea rcx, [rax + 8]
0x145a17611: 48894de8                 mov qword ptr [rbp - 0x18], rcx
0x145a17615: e86645feff               call 0x1459fbb80
0x145a1761a: 90                       nop
0x145a1761b: 488b45e0                 mov rax, qword ptr [rbp - 0x20]
0x145a1761f: f048ff08                 lock dec qword ptr [rax]
0x145a17623: 750a                     jne 0x145a1762f
0x145a17625: 488b4de8                 mov rcx, qword ptr [rbp - 0x18]
0x145a17629: e8e2dcfeff               call 0x145a05310
0x145a1762e: 90                       nop
0x145a1762f: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x145a17633: 488b4010                 mov rax, qword ptr [rax + 0x10]
0x145a17637: f048ff08                 lock dec qword ptr [rax]
0x145a1763b: 751a                     jne 0x145a17657
0x145a1763d: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x145a17641: 488d4810                 lea rcx, [rax + 0x10]
0x145a17645: e8c6dcfeff               call 0x145a05310
0x145a1764a: 90                       nop
0x145a1764b: eb0a                     jmp 0x145a17657
0x145a1764d: 488b4810                 mov rcx, qword ptr [rax + 0x10]
0x145a17651: ff1579373800             call qword ptr [rip + 0x383779]
0x145a17657: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x145a1765b: 48c70000000000           mov qword ptr [rax], 0
0x145a17662: 4883c440                 add rsp, 0x40
0x145a17666: 5d                       pop rbp
0x145a17667: c3                       ret
