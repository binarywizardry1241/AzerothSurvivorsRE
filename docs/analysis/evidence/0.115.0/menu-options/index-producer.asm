00000001458e0210: 4883fa02                       cmp rdx, 2
00000001458e0214: 0f85a7000000                   jne 0x1458e02c1
00000001458e021a: 668139656e                     cmp word ptr [rcx], 0x6e65
00000001458e021f: 0f849c000000                   je 0x1458e02c1
00000001458e0225: 668139706c                     cmp word ptr [rcx], 0x6c70
00000001458e022a: 0f849b000000                   je 0x1458e02cb
00000001458e0230: 6681396373                     cmp word ptr [rcx], 0x7363
00000001458e0235: 0f849d000000                   je 0x1458e02d8
00000001458e023b: 6681396465                     cmp word ptr [rcx], 0x6564
00000001458e0240: 0f849f000000                   je 0x1458e02e5
00000001458e0246: 6681397074                     cmp word ptr [rcx], 0x7470
00000001458e024b: 0f84a1000000                   je 0x1458e02f2
00000001458e0251: 6681396573                     cmp word ptr [rcx], 0x7365
00000001458e0256: 0f84a3000000                   je 0x1458e02ff
00000001458e025c: 6681396672                     cmp word ptr [rcx], 0x7266
00000001458e0261: 0f84a5000000                   je 0x1458e030c
00000001458e0267: 668139726f                     cmp word ptr [rcx], 0x6f72
00000001458e026c: 0f84a7000000                   je 0x1458e0319
00000001458e0272: 6681397472                     cmp word ptr [rcx], 0x7274
00000001458e0277: 0f84a9000000                   je 0x1458e0326
00000001458e027d: 6681397275                     cmp word ptr [rcx], 0x7572
00000001458e0282: 0f84ab000000                   je 0x1458e0333
00000001458e0288: 668139756b                     cmp word ptr [rcx], 0x6b75
00000001458e028d: 0f84ad000000                   je 0x1458e0340
00000001458e0293: 6681397a68                     cmp word ptr [rcx], 0x687a
00000001458e0298: 0f84af000000                   je 0x1458e034d
00000001458e029e: 6681396a61                     cmp word ptr [rcx], 0x616a
00000001458e02a3: 0f84b1000000                   je 0x1458e035a
00000001458e02a9: 31d2                           xor edx, edx
00000001458e02ab: 6681396b6f                     cmp word ptr [rcx], 0x6f6b
00000001458e02b0: b80d000000                     mov eax, 0xd
00000001458e02b5: 480f45c2                       cmovne rax, rdx
00000001458e02b9: 488905a06e9302                 mov qword ptr [rip + 0x2936ea0], rax
00000001458e02c0: c3                             ret
00000001458e02c1: 31c0                           xor eax, eax
00000001458e02c3: 488905966e9302                 mov qword ptr [rip + 0x2936e96], rax
00000001458e02ca: c3                             ret
00000001458e02cb: b801000000                     mov eax, 1
00000001458e02d0: 488905896e9302                 mov qword ptr [rip + 0x2936e89], rax
00000001458e02d7: c3                             ret
00000001458e02d8: b802000000                     mov eax, 2
00000001458e02dd: 4889057c6e9302                 mov qword ptr [rip + 0x2936e7c], rax
00000001458e02e4: c3                             ret
00000001458e02e5: b803000000                     mov eax, 3
00000001458e02ea: 4889056f6e9302                 mov qword ptr [rip + 0x2936e6f], rax
00000001458e02f1: c3                             ret
00000001458e02f2: b804000000                     mov eax, 4
00000001458e02f7: 488905626e9302                 mov qword ptr [rip + 0x2936e62], rax
00000001458e02fe: c3                             ret
00000001458e02ff: b805000000                     mov eax, 5
00000001458e0304: 488905556e9302                 mov qword ptr [rip + 0x2936e55], rax
00000001458e030b: c3                             ret
00000001458e030c: b806000000                     mov eax, 6
00000001458e0311: 488905486e9302                 mov qword ptr [rip + 0x2936e48], rax
00000001458e0318: c3                             ret
00000001458e0319: b807000000                     mov eax, 7
00000001458e031e: 4889053b6e9302                 mov qword ptr [rip + 0x2936e3b], rax
00000001458e0325: c3                             ret
00000001458e0326: b808000000                     mov eax, 8
00000001458e032b: 4889052e6e9302                 mov qword ptr [rip + 0x2936e2e], rax
00000001458e0332: c3                             ret
00000001458e0333: b809000000                     mov eax, 9
00000001458e0338: 488905216e9302                 mov qword ptr [rip + 0x2936e21], rax
00000001458e033f: c3                             ret
00000001458e0340: b80a000000                     mov eax, 0xa
00000001458e0345: 488905146e9302                 mov qword ptr [rip + 0x2936e14], rax
00000001458e034c: c3                             ret
00000001458e034d: b80b000000                     mov eax, 0xb
00000001458e0352: 488905076e9302                 mov qword ptr [rip + 0x2936e07], rax
00000001458e0359: c3                             ret
00000001458e035a: b80c000000                     mov eax, 0xc
00000001458e035f: 488905fa6d9302                 mov qword ptr [rip + 0x2936dfa], rax
00000001458e0366: c3                             ret
