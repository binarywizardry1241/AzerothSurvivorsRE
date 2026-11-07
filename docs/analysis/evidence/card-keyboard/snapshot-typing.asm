00000001400d8667: 48c74558feffffff               mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
00000001400d866f: 4c89c7                         mov rdi, r8
00000001400d8672: 4889d6                         mov rsi, rdx
00000001400d8675: 4889d1                         mov rcx, rdx
00000001400d8678: e8230a4f00                     call 0x1405c90a0
00000001400d867d: 4883be9000000000               cmp qword ptr [rsi + 0x90], 0
00000001400d8685: 0f849f020000                   je 0x1400d892a
00000001400d868b: 488b4e78                       mov rcx, qword ptr [rsi + 0x78]
00000001400d868f: 488b9680000000                 mov rdx, qword ptr [rsi + 0x80]
00000001400d8696: 49b8ae2aad7a9fab2f6d           movabs r8, 0x6d2fab9f7aad2aae
00000001400d86a0: 4531c9                         xor r9d, r9d
00000001400d86a3: 660f6f35e569df05               movdqa xmm6, xmmword ptr [rip + 0x5df69e5]
00000001400d86ab: 660f76c0                       pcmpeqd xmm0, xmm0
00000001400d86af: 660f6f3de969df05               movdqa xmm7, xmmword ptr [rip + 0x5df69e9]
00000001400d86b7: 4921d0                         and r8, rdx
00000001400d86ba: f3420f6f0c01                   movdqu xmm1, xmmword ptr [rcx + r8]
00000001400d86c0: 660f6fd1                       movdqa xmm2, xmm1
00000001400d86c4: 660f74d6                       pcmpeqb xmm2, xmm6
00000001400d86c8: 66440fd7d2                     pmovmskb r10d, xmm2
00000001400d86cd: 4585d2                         test r10d, r10d
00000001400d86d0: 743e                           je 0x1400d8710
00000001400d86d2: f3450fbcda                     tzcnt r11d, r10d
00000001400d86d7: 4d01c3                         add r11, r8
00000001400d86da: 4921d3                         and r11, rdx
00000001400d86dd: 49f7db                         neg r11
00000001400d86e0: 4f8d1c5b                       lea r11, [r11 + r11*2]
00000001400d86e4: f3420f6f54d9e8                 movdqu xmm2, xmmword ptr [rcx + r11*8 - 0x18]
00000001400d86eb: 660f74d7                       pcmpeqb xmm2, xmm7
00000001400d86ef: 660fd7da                       pmovmskb ebx, xmm2
00000001400d86f3: 81fbffff0000                   cmp ebx, 0xffff
00000001400d86f9: 7434                           je 0x1400d872f
00000001400d86fb: 458d5aff                       lea r11d, [r10 - 1]
00000001400d86ff: 664521d3                       and r11w, r10w
00000001400d8703: 4589da                         mov r10d, r11d
00000001400d8706: 75ca                           jne 0x1400d86d2
00000001400d8708: 0f1f840000000000               nop dword ptr [rax + rax]
00000001400d8710: 660f74c8                       pcmpeqb xmm1, xmm0
00000001400d8714: 66440fd7d1                     pmovmskb r10d, xmm1
00000001400d8719: 4585d2                         test r10d, r10d
00000001400d871c: 0f8508020000                   jne 0x1400d892a
00000001400d8722: 4d01c8                         add r8, r9
00000001400d8725: 4983c010                       add r8, 0x10
00000001400d8729: 4983c110                       add r9, 0x10
00000001400d872d: eb88                           jmp 0x1400d86b7
00000001400d872f: 4a8d0cd9                       lea rcx, [rcx + r11*8]
00000001400d8733: 488b49f8                       mov rcx, qword ptr [rcx - 8]
00000001400d8737: 483b8e18020000                 cmp rcx, qword ptr [rsi + 0x218]
00000001400d873e: 0f83e6010000                   jae 0x1400d892a
00000001400d8744: 488b9610020000                 mov rdx, qword ptr [rsi + 0x210]
00000001400d874b: 488b14ca                       mov rdx, qword ptr [rdx + rcx*8]
00000001400d874f: 4885d2                         test rdx, rdx
00000001400d8752: 0f84d2010000                   je 0x1400d892a
00000001400d8758: 488b8ee0010000                 mov rcx, qword ptr [rsi + 0x1e0]
00000001400d875f: 48f7d2                         not rdx
00000001400d8762: 486bd238                       imul rdx, rdx, 0x38
00000001400d8766: 807c113000                     cmp byte ptr [rcx + rdx + 0x30], 0
00000001400d876b: 0f84b9010000                   je 0x1400d892a
00000001400d8771: 4801d1                         add rcx, rdx
00000001400d8774: 488b5110                       mov rdx, qword ptr [rcx + 0x10]
00000001400d8778: 448b86b0050000                 mov r8d, dword ptr [rsi + 0x5b0]
00000001400d877f: c60200                         mov byte ptr [rdx], 0
00000001400d8782: 4489412c                       mov dword ptr [rcx + 0x2c], r8d
00000001400d8786: 884201                         mov byte ptr [rdx + 1], al
