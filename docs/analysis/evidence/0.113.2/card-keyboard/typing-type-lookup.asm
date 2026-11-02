00000001400cd8e3: 488b7118                       mov rsi, qword ptr [rcx + 0x18]
00000001400cd8e7: 48837e5000                     cmp qword ptr [rsi + 0x50], 0
00000001400cd8ec: 0f84a4000000                   je 0x1400cd996
00000001400cd8f2: 488b02                         mov rax, qword ptr [rdx]
00000001400cd8f5: 4c8b4208                       mov r8, qword ptr [rdx + 8]
00000001400cd8f9: 4d89c3                         mov r11, r8
00000001400cd8fc: 49c1eb39                       shr r11, 0x39
00000001400cd900: 4c8b4e38                       mov r9, qword ptr [rsi + 0x38]
00000001400cd904: 4c8b5640                       mov r10, qword ptr [rsi + 0x40]
00000001400cd908: 66410f6ec3                     movd xmm0, r11d
00000001400cd90d: 660f60c0                       punpcklbw xmm0, xmm0
00000001400cd911: f20f70c000                     pshuflw xmm0, xmm0, 0
00000001400cd916: 660f70c044                     pshufd xmm0, xmm0, 0x44
00000001400cd91b: 4531db                         xor r11d, r11d
00000001400cd91e: 660f76c9                       pcmpeqd xmm1, xmm1
00000001400cd922: 4c89c7                         mov rdi, r8
00000001400cd925: 4c21d7                         and rdi, r10
00000001400cd928: f3410f6f1439                   movdqu xmm2, xmmword ptr [r9 + rdi]
00000001400cd92e: 660f6fda                       movdqa xmm3, xmm2
00000001400cd932: 660f74d8                       pcmpeqb xmm3, xmm0
00000001400cd936: 660fd7db                       pmovmskb ebx, xmm3
00000001400cd93a: 85db                           test ebx, ebx
00000001400cd93c: 7432                           je 0x1400cd970
00000001400cd93e: f3440fbcf3                     tzcnt r14d, ebx
00000001400cd943: 4901fe                         add r14, rdi
00000001400cd946: 4d21d6                         and r14, r10
00000001400cd949: 49f7de                         neg r14
00000001400cd94c: 4f8d3476                       lea r14, [r14 + r14*2]
00000001400cd950: 4f8b7cf1f0                     mov r15, qword ptr [r9 + r14*8 - 0x10]
00000001400cd955: 4d31c7                         xor r15, r8
00000001400cd958: 4f8b64f1e8                     mov r12, qword ptr [r9 + r14*8 - 0x18]
00000001400cd95d: 4931c4                         xor r12, rax
00000001400cd960: 4d09fc                         or r12, r15
00000001400cd963: 7424                           je 0x1400cd989
00000001400cd965: 8d6bff                         lea ebp, [rbx - 1]
00000001400cd968: 6621dd                         and bp, bx
00000001400cd96b: 89eb                           mov ebx, ebp
00000001400cd96d: 75cf                           jne 0x1400cd93e
00000001400cd96f: 90                             nop
00000001400cd970: 660f74d1                       pcmpeqb xmm2, xmm1
00000001400cd974: 660fd7da                       pmovmskb ebx, xmm2
00000001400cd978: 85db                           test ebx, ebx
00000001400cd97a: 7521                           jne 0x1400cd99d
00000001400cd97c: 4c01df                         add rdi, r11
00000001400cd97f: 4883c710                       add rdi, 0x10
00000001400cd983: 4983c310                       add r11, 0x10
00000001400cd987: eb9c                           jmp 0x1400cd925
00000001400cd989: 4b8d04f1                       lea rax, [r9 + r14*8]
00000001400cd98d: 488b40f8                       mov rax, qword ptr [rax - 8]
00000001400cd991: e916020000                     jmp 0x1400cdbac
