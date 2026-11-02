00000001405c90a0: 56                             push rsi
00000001405c90a1: 4883b99000000000               cmp qword ptr [rcx + 0x90], 0
00000001405c90a9: 0f84df000000                   je 0x1405c918e
00000001405c90af: 488b4178                       mov rax, qword ptr [rcx + 0x78]
00000001405c90b3: 488b9180000000                 mov rdx, qword ptr [rcx + 0x80]
00000001405c90ba: 49b818de39665306e2b4           movabs r8, 0xb4e206536639de18
00000001405c90c4: 4531c9                         xor r9d, r9d
00000001405c90c7: 660f6f0501938d05               movdqa xmm0, xmmword ptr [rip + 0x58d9301]
00000001405c90cf: 660f76c9                       pcmpeqd xmm1, xmm1
00000001405c90d3: 660f6f15659a9805               movdqa xmm2, xmmword ptr [rip + 0x5989a65]
00000001405c90db: 4921d0                         and r8, rdx
00000001405c90de: f3420f6f1c00                   movdqu xmm3, xmmword ptr [rax + r8]
00000001405c90e4: 660f6fe3                       movdqa xmm4, xmm3
00000001405c90e8: 660f74e0                       pcmpeqb xmm4, xmm0
00000001405c90ec: 66440fd7d4                     pmovmskb r10d, xmm4
00000001405c90f1: 4585d2                         test r10d, r10d
00000001405c90f4: 743a                           je 0x1405c9130
00000001405c90f6: f3450fbcda                     tzcnt r11d, r10d
00000001405c90fb: 4d01c3                         add r11, r8
00000001405c90fe: 4921d3                         and r11, rdx
00000001405c9101: 49f7db                         neg r11
00000001405c9104: 4f8d1c5b                       lea r11, [r11 + r11*2]
00000001405c9108: f3420f6f64d8e8                 movdqu xmm4, xmmword ptr [rax + r11*8 - 0x18]
00000001405c910f: 660f74e2                       pcmpeqb xmm4, xmm2
00000001405c9113: 660fd7f4                       pmovmskb esi, xmm4
00000001405c9117: 81feffff0000                   cmp esi, 0xffff
00000001405c911d: 742c                           je 0x1405c914b
00000001405c911f: 458d5aff                       lea r11d, [r10 - 1]
00000001405c9123: 664521d3                       and r11w, r10w
00000001405c9127: 4589da                         mov r10d, r11d
00000001405c912a: 75ca                           jne 0x1405c90f6
00000001405c912c: 0f1f4000                       nop dword ptr [rax]
00000001405c9130: 660f74d9                       pcmpeqb xmm3, xmm1
00000001405c9134: 66440fd7d3                     pmovmskb r10d, xmm3
00000001405c9139: 4585d2                         test r10d, r10d
00000001405c913c: 7550                           jne 0x1405c918e
00000001405c913e: 4d01c8                         add r8, r9
00000001405c9141: 4983c010                       add r8, 0x10
00000001405c9145: 4983c110                       add r9, 0x10
00000001405c9149: eb90                           jmp 0x1405c90db
00000001405c914b: 4a8d04d8                       lea rax, [rax + r11*8]
00000001405c914f: 488b40f8                       mov rax, qword ptr [rax - 8]
00000001405c9153: 483b8118020000                 cmp rax, qword ptr [rcx + 0x218]
00000001405c915a: 7332                           jae 0x1405c918e
00000001405c915c: 488b9110020000                 mov rdx, qword ptr [rcx + 0x210]
00000001405c9163: 488b14c2                       mov rdx, qword ptr [rdx + rax*8]
00000001405c9167: 4885d2                         test rdx, rdx
00000001405c916a: 7422                           je 0x1405c918e
00000001405c916c: 488b81e0010000                 mov rax, qword ptr [rcx + 0x1e0]
00000001405c9173: 48f7d2                         not rdx
00000001405c9176: 486bca38                       imul rcx, rdx, 0x38
00000001405c917a: 807c083001                     cmp byte ptr [rax + rcx + 0x30], 1
00000001405c917f: 750d                           jne 0x1405c918e
00000001405c9181: 4801c8                         add rax, rcx
00000001405c9184: 488b4010                       mov rax, qword ptr [rax + 0x10]
00000001405c9188: 0fb64018                       movzx eax, byte ptr [rax + 0x18]
00000001405c918c: 5e                             pop rsi
00000001405c918d: c3                             ret
00000001405c918e: 31c0                           xor eax, eax
00000001405c9190: 5e                             pop rsi
00000001405c9191: c3                             ret
