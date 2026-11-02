; AS0.113.2 SHA256 58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb
; Exclusive ranges; parser, definition getter, local raw-key accessor, guardian damage.

; [0x145808880,0x1458089a9)
0x145808880: 4883c2fe                       add rdx, -2
0x145808884: 4883fa06                       cmp rdx, 6
0x145808888: 0f87fa000000                   ja 0x145808988
0x14580888e: 488d0573b07f01                 lea rax, [rip + 0x17fb073]
0x145808895: 48631490                       movsxd rdx, dword ptr [rax + rdx*4]
0x145808899: 4801c2                         add rdx, rax
0x14580889c: ffe2                           jmp rdx
0x14580889e: 6681396162                     cmp word ptr [rcx], 0x6261
0x1458088a3: 0f84e2000000                   je 0x14580898b
0x1458088a9: 668139736d                     cmp word ptr [rcx], 0x6d73
0x1458088ae: 0f84e9000000                   je 0x14580899d
0x1458088b4: 6681396176                     cmp word ptr [rcx], 0x7661
0x1458088b9: 0f84e4000000                   je 0x1458089a3
0x1458088bf: 6681396171                     cmp word ptr [rcx], 0x7161
0x1458088c4: 0f85be000000                   jne 0x145808988
0x1458088ca: b80a000000                     mov eax, 0xa
0x1458088cf: c3                             ret
0x1458088d0: b8656c7779                     mov eax, 0x79776c65
0x1458088d5: 3301                           xor eax, dword ptr [rcx]
0x1458088d7: 0fb75104                       movzx edx, word ptr [rcx + 4]
0x1458088db: 81f26e6e0000                   xor edx, 0x6e6e
0x1458088e1: 09c2                           or edx, eax
0x1458088e3: 0f849f000000                   je 0x145808988
0x1458088e9: b8756e676f                     mov eax, 0x6f676e75
0x1458088ee: 3301                           xor eax, dword ptr [rcx]
0x1458088f0: 0fb74904                       movzx ecx, word ptr [rcx + 4]
0x1458088f4: 81f1726f0000                   xor ecx, 0x6f72
0x1458088fa: 09c1                           or ecx, eax
0x1458088fc: 0f8586000000                   jne 0x145808988
0x145808902: b803000000                     mov eax, 3
0x145808907: c3                             ret
0x145808908: 31d2                           xor edx, edx
0x14580890a: 81396e617878                   cmp dword ptr [rcx], 0x7878616e
0x145808910: b80b000000                     mov eax, 0xb
0x145808915: 480f45c2                       cmovne rax, rdx
0x145808919: c3                             ret
0x14580891a: b86172656e                     mov eax, 0x6e657261
0x14580891f: 3301                           xor eax, dword ptr [rcx]
0x145808921: 0fb64904                       movzx ecx, byte ptr [rcx + 4]
0x145808925: 83f161                         xor ecx, 0x61
0x145808928: 09c1                           or ecx, eax
0x14580892a: 755c                           jne 0x145808988
0x14580892c: b806000000                     mov eax, 6
0x145808931: c3                             ret
0x145808932: 0fb701                         movzx eax, word ptr [rcx]
0x145808935: 3577730000                     xor eax, 0x7377
0x14580893a: 0fb65102                       movzx edx, byte ptr [rcx + 2]
0x14580893e: 83f267                         xor edx, 0x67
0x145808941: 6609c2                         or dx, ax
0x145808944: 744b                           je 0x145808991
0x145808946: 0fb701                         movzx eax, word ptr [rcx]
0x145808949: 3562720000                     xor eax, 0x7262
0x14580894e: 0fb64902                       movzx ecx, byte ptr [rcx + 2]
0x145808952: 83f16d                         xor ecx, 0x6d
0x145808955: 6609c1                         or cx, ax
0x145808958: 752e                           jne 0x145808988
0x14580895a: b809000000                     mov eax, 9
0x14580895f: c3                             ret
0x145808960: b866657261                     mov eax, 0x61726566
0x145808965: 3301                           xor eax, dword ptr [rcx]
0x145808967: ba616c6173                     mov edx, 0x73616c61
0x14580896c: 335103                         xor edx, dword ptr [rcx + 3]
0x14580896f: 09c2                           or edx, eax
0x145808971: 7515                           jne 0x145808988
0x145808973: b805000000                     mov eax, 5
0x145808978: c3                             ret
0x145808979: 48b86475736b776f6f64           movabs rax, 0x646f6f776b737564
0x145808983: 483901                         cmp qword ptr [rcx], rax
0x145808986: 740f                           je 0x145808997
0x145808988: 31c0                           xor eax, eax
0x14580898a: c3                             ret
0x14580898b: b804000000                     mov eax, 4
0x145808990: c3                             ret
0x145808991: b802000000                     mov eax, 2
0x145808996: c3                             ret
0x145808997: b801000000                     mov eax, 1
0x14580899c: c3                             ret
0x14580899d: b807000000                     mov eax, 7
0x1458089a2: c3                             ret
0x1458089a3: b808000000                     mov eax, 8
0x1458089a8: c3                             ret

; [0x1458089b0,0x1458089cf)
0x1458089b0: 4883ec28                       sub rsp, 0x28
0x1458089b4: e8c7feffff                     call 0x145808880
0x1458089b9: 4869c8f0000000                 imul rcx, rax, 0xf0
0x1458089c0: 488d0581437d01                 lea rax, [rip + 0x17d4381]
0x1458089c7: 4801c8                         add rax, rcx
0x1458089ca: 4883c428                       add rsp, 0x28
0x1458089ce: c3                             ret

; [0x145881860,0x1458818f4)
0x145881860: 4883ec28                       sub rsp, 0x28
0x145881864: 80b94117000000                 cmp byte ptr [rcx + 0x1741], 0
0x14588186b: 743c                           je 0x1458818a9
0x14588186d: 488b8128110000                 mov rax, qword ptr [rcx + 0x1128]
0x145881874: 488b9130110000                 mov rdx, qword ptr [rcx + 0x1130]
0x14588187b: 4889c1                         mov rcx, rax
0x14588187e: e8fd6ff8ff                     call 0x145808880
0x145881883: 4869c8f0000000                 imul rcx, rax, 0xf0
0x14588188a: 488d15b7b47501                 lea rdx, [rip + 0x175b4b7]
0x145881891: 488d0411                       lea rax, [rcx + rdx]
0x145881895: 4883c008                       add rax, 8
0x145881899: 488d4c1110                     lea rcx, [rcx + rdx + 0x10]
0x14588189e: 488b00                         mov rax, qword ptr [rax]
0x1458818a1: 488b11                         mov rdx, qword ptr [rcx]
0x1458818a4: 4883c428                       add rsp, 0x28
0x1458818a8: c3                             ret
0x1458818a9: 488b81300f0000                 mov rax, qword ptr [rcx + 0xf30]
0x1458818b0: 4839c2                         cmp rdx, rax
0x1458818b3: 732b                           jae 0x1458818e0
0x1458818b5: 488b89280f0000                 mov rcx, qword ptr [rcx + 0xf28]
0x1458818bc: 4869d2b0000000                 imul rdx, rdx, 0xb0
0x1458818c3: 488d0411                       lea rax, [rcx + rdx]
0x1458818c7: 480598000000                   add rax, 0x98
0x1458818cd: 488d8c11a0000000               lea rcx, [rcx + rdx + 0xa0]
0x1458818d5: 488b00                         mov rax, qword ptr [rax]
0x1458818d8: 488b11                         mov rdx, qword ptr [rcx]
0x1458818db: 4883c428                       add rsp, 0x28
0x1458818df: c3                             ret
0x1458818e0: 4c8d0559497901                 lea r8, [rip + 0x1794959]
0x1458818e7: 4889d1                         mov rcx, rdx
0x1458818ea: 4889c2                         mov rdx, rax
0x1458818ed: e831a86100                     call 0x145e9c123
0x1458818f2: 0f0b                           ud2

; [0x145974490,0x14597461f)
0x145974490: 56                             push rsi
0x145974491: 57                             push rdi
0x145974492: 4883ec78                       sub rsp, 0x78
0x145974496: 440f29542460                   movaps xmmword ptr [rsp + 0x60], xmm10
0x14597449c: 440f294c2450                   movaps xmmword ptr [rsp + 0x50], xmm9
0x1459744a2: 440f29442440                   movaps xmmword ptr [rsp + 0x40], xmm8
0x1459744a8: 0f297c2430                     movaps xmmword ptr [rsp + 0x30], xmm7
0x1459744ad: 0f29742420                     movaps xmmword ptr [rsp + 0x20], xmm6
0x1459744b2: 4889d7                         mov rdi, rdx
0x1459744b5: 4889ce                         mov rsi, rcx
0x1459744b8: 488b89a8020000                 mov rcx, qword ptr [rcx + 0x2a8]
0x1459744bf: 488b96b0020000                 mov rdx, qword ptr [rsi + 0x2b0]
0x1459744c6: e8b543e9ff                     call 0x145808880
0x1459744cb: 4869c8f0000000                 imul rcx, rax, 0xf0
0x1459744d2: 488d056f886601                 lea rax, [rip + 0x166886f]
0x1459744d9: 488b940180000000               mov rdx, qword ptr [rcx + rax + 0x80]
0x1459744e1: 4839d7                         cmp rdi, rdx
0x1459744e4: 0f8324010000                   jae 0x14597460e
0x1459744ea: 4801c8                         add rax, rcx
0x1459744ed: 488b4878                       mov rcx, qword ptr [rax + 0x78]
0x1459744f1: 488d14bf                       lea rdx, [rdi + rdi*4]
0x1459744f5: 48c1e204                       shl rdx, 4
0x1459744f9: f30f10741134                   movss xmm6, dword ptr [rcx + rdx + 0x34]
0x1459744ff: f3440f10966c0b0000             movss xmm10, dword ptr [rsi + 0xb6c]
0x145974508: f3440f1080e0000000             movss xmm8, dword ptr [rax + 0xe0]
0x145974511: f3440f108ee40b0000             movss xmm9, dword ptr [rsi + 0xbe4]
0x14597451a: f30f103d62db5200               movss xmm7, dword ptr [rip + 0x52db62]
0x145974522: 83be900a000001                 cmp dword ptr [rsi + 0xa90], 1
0x145974529: 0f28c7                         movaps xmm0, xmm7
0x14597452c: 7534                           jne 0x145974562
0x14597452e: 80be000c000000                 cmp byte ptr [rsi + 0xc00], 0
0x145974535: 0f28c7                         movaps xmm0, xmm7
0x145974538: 7428                           je 0x145974562
0x14597453a: 410f28ca                       movaps xmm1, xmm10
0x14597453e: f30f5c8e940a0000               subss xmm1, dword ptr [rsi + 0xa94]
0x145974546: f30f5e0d22b25700               divss xmm1, dword ptr [rip + 0x57b222]
0x14597454e: 0f57c0                         xorps xmm0, xmm0
0x145974551: f30f5fc8                       maxss xmm1, xmm0
0x145974555: f30f1005b36b9901               movss xmm0, dword ptr [rip + 0x1996bb3]
0x14597455d: e8b3543800                     call 0x145cf9a15
0x145974562: f3440f5e1505b25700             divss xmm10, dword ptr [rip + 0x57b205]
0x14597456b: f30f100dd5715500               movss xmm1, dword ptr [rip + 0x5571d5]
0x145974573: f3410f59ca                     mulss xmm1, xmm10
0x145974578: f30f58cf                       addss xmm1, xmm7
0x14597457c: f30f1015f86c9901               movss xmm2, dword ptr [rip + 0x1996cf8]
0x145974584: f3410f59d2                     mulss xmm2, xmm10
0x145974589: f3410f59d2                     mulss xmm2, xmm10
0x14597458e: f30f58d1                       addss xmm2, xmm1
0x145974592: f3450f59c1                     mulss xmm8, xmm9
0x145974597: 0f57c9                         xorps xmm1, xmm1
0x14597459a: f3410f51c8                     sqrtss xmm1, xmm8
0x14597459f: f30f59ca                       mulss xmm1, xmm2
0x1459745a3: f30f59f1                       mulss xmm6, xmm1
0x1459745a7: f30f593505e05200               mulss xmm6, dword ptr [rip + 0x52e005]
0x1459745af: f30f59f0                       mulss xmm6, xmm0
0x1459745b3: 8b8694070000                   mov eax, dword ptr [rsi + 0x794]
0x1459745b9: 0f57c9                         xorps xmm1, xmm1
0x1459745bc: f3480f2ac8                     cvtsi2ss xmm1, rax
0x1459745c1: f30f590d57db5600               mulss xmm1, dword ptr [rip + 0x56db57]
0x1459745c9: f30f58cf                       addss xmm1, xmm7
0x1459745cd: f30f59ce                       mulss xmm1, xmm6
0x1459745d1: 0fb786cc020000                 movzx eax, word ptr [rsi + 0x2cc]
0x1459745d8: 0f57c0                         xorps xmm0, xmm0
0x1459745db: f30f2ac0                       cvtsi2ss xmm0, eax
0x1459745df: f30f5e05a9df5200               divss xmm0, dword ptr [rip + 0x52dfa9]
0x1459745e7: f30f59c1                       mulss xmm0, xmm1
0x1459745eb: 0f28742420                     movaps xmm6, xmmword ptr [rsp + 0x20]
0x1459745f0: 0f287c2430                     movaps xmm7, xmmword ptr [rsp + 0x30]
0x1459745f5: 440f28442440                   movaps xmm8, xmmword ptr [rsp + 0x40]
0x1459745fb: 440f284c2450                   movaps xmm9, xmmword ptr [rsp + 0x50]
0x145974601: 440f28542460                   movaps xmm10, xmmword ptr [rsp + 0x60]
0x145974607: 4883c478                       add rsp, 0x78
0x14597460b: 5f                             pop rdi
0x14597460c: 5e                             pop rsi
0x14597460d: c3                             ret
0x14597460e: 4c8d05039d9901                 lea r8, [rip + 0x1999d03]
0x145974615: 4889f9                         mov rcx, rdi
0x145974618: e8067b5200                     call 0x145e9c123
0x14597461d: 0f0b                           ud2
