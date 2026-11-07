0x140089200: 56                       push rsi
0x140089201: 57                       push rdi
0x140089202: 55                       push rbp
0x140089203: 53                       push rbx
0x140089204: 4889c8                   mov rax, rcx
0x140089207: 4c8d0411                 lea r8, [rcx + rdx]
0x14008920b: 4885d2                   test rdx, rdx
0x14008920e: 0f843e010000             je 0x140089352
0x140089214: 4c8b1565180008           mov r10, qword ptr [rip + 0x8001865]
0x14008921b: 31d2                     xor edx, edx
0x14008921d: 4989c1                   mov r9, rax
0x140089220: eb27                     jmp 0x140089249
0x140089222: 450fb6db                 movzx r11d, r11b
0x140089226: 470fb61c1a               movzx r11d, byte ptr [r10 + r11]
0x14008922b: 41d0eb                   shr r11b, 1
0x14008922e: 41f6c301                 test r11b, 1
0x140089232: 0f8421010000             je 0x140089359
0x140089238: 0f1f840000000000         nop dword ptr [rax + rax]
0x140089240: 4d39c1                   cmp r9, r8
0x140089243: 0f8400010000             je 0x140089349
0x140089249: 4c89ce                   mov rsi, r9
0x14008924c: 4889d1                   mov rcx, rdx
0x14008924f: 450fb609                 movzx r9d, byte ptr [r9]
0x140089253: 450fb6d9                 movzx r11d, r9b
0x140089257: 4584db                   test r11b, r11b
0x14008925a: 7814                     js 0x140089270
0x14008925c: 4c8d4e01                 lea r9, [rsi + 1]
0x140089260: eb6e                     jmp 0x1400892d0
0x140089262: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x140089270: 4489da                   mov edx, r11d
0x140089273: 83e21f                   and edx, 0x1f
0x140089276: 0fb67e01                 movzx edi, byte ptr [rsi + 1]
0x14008927a: 83e73f                   and edi, 0x3f
0x14008927d: 4180fbdf                 cmp r11b, 0xdf
0x140089281: 7634                     jbe 0x1400892b7
0x140089283: 440fb65e02               movzx r11d, byte ptr [rsi + 2]
0x140089288: c1e706                   shl edi, 6
0x14008928b: 4183e33f                 and r11d, 0x3f
0x14008928f: 4109fb                   or r11d, edi
0x140089292: 4180f9f0                 cmp r9b, 0xf0
0x140089296: 722d                     jb 0x1400892c5
0x140089298: 4c8d4e04                 lea r9, [rsi + 4]
0x14008929c: 0fb67e03                 movzx edi, byte ptr [rsi + 3]
0x1400892a0: 83e207                   and edx, 7
0x1400892a3: c1e212                   shl edx, 0x12
0x1400892a6: 41c1e306                 shl r11d, 6
0x1400892aa: 83e73f                   and edi, 0x3f
0x1400892ad: 4409df                   or edi, r11d
0x1400892b0: 09d7                     or edi, edx
0x1400892b2: 4189fb                   mov r11d, edi
0x1400892b5: eb19                     jmp 0x1400892d0
0x1400892b7: 4c8d4e02                 lea r9, [rsi + 2]
0x1400892bb: c1e206                   shl edx, 6
0x1400892be: 09fa                     or edx, edi
0x1400892c0: 4189d3                   mov r11d, edx
0x1400892c3: eb0b                     jmp 0x1400892d0
0x1400892c5: 4c8d4e03                 lea r9, [rsi + 3]
0x1400892c9: c1e20c                   shl edx, 0xc
0x1400892cc: 4109d3                   or r11d, edx
0x1400892cf: 90                       nop
0x1400892d0: 4c89ca                   mov rdx, r9
0x1400892d3: 4829f2                   sub rdx, rsi
0x1400892d6: 4801ca                   add rdx, rcx
0x1400892d9: 418d73f7                 lea esi, [r11 - 9]
0x1400892dd: 83fe05                   cmp esi, 5
0x1400892e0: 0f825affffff             jb 0x140089240
0x1400892e6: 4183fb20                 cmp r11d, 0x20
0x1400892ea: 0f8450ffffff             je 0x140089240
0x1400892f0: 4181fb85000000           cmp r11d, 0x85
0x1400892f7: 7260                     jb 0x140089359
0x1400892f9: 4489de                   mov esi, r11d
0x1400892fc: c1ee08                   shr esi, 8
0x1400892ff: 83fe1f                   cmp esi, 0x1f
0x140089302: 7f19                     jg 0x14008931d
0x140089304: 85f6                     test esi, esi
0x140089306: 7433                     je 0x14008933b
0x140089308: 83fe16                   cmp esi, 0x16
0x14008930b: 754c                     jne 0x140089359
0x14008930d: 4181fb80160000           cmp r11d, 0x1680
0x140089314: 410f94c3                 sete r11b
0x140089318: e911ffffff               jmp 0x14008922e
0x14008931d: 83fe20                   cmp esi, 0x20
0x140089320: 0f84fcfeffff             je 0x140089222
0x140089326: 83fe30                   cmp esi, 0x30
0x140089329: 752e                     jne 0x140089359
0x14008932b: 4181fb00300000           cmp r11d, 0x3000
0x140089332: 410f94c3                 sete r11b
0x140089336: e9f3feffff               jmp 0x14008922e
0x14008933b: 450fb6db                 movzx r11d, r11b
0x14008933f: 470fb61c1a               movzx r11d, byte ptr [r10 + r11]
0x140089344: e9e5feffff               jmp 0x14008922e
0x140089349: 31c9                     xor ecx, ecx
0x14008934b: 31d2                     xor edx, edx
0x14008934d: e91c010000               jmp 0x14008946e
0x140089352: 31d2                     xor edx, edx
0x140089354: 4989c1                   mov r9, rax
0x140089357: 31c9                     xor ecx, ecx
0x140089359: 4d39c1                   cmp r9, r8
0x14008935c: 0f840c010000             je 0x14008946e
0x140089362: 4c8b1517170008           mov r10, qword ptr [rip + 0x8001717]
0x140089369: eb1e                     jmp 0x140089389
0x14008936b: 400fb6f6                 movzx esi, sil
0x14008936f: 410fb61c32               movzx ebx, byte ptr [r10 + rsi]
0x140089374: d0eb                     shr bl, 1
0x140089376: f6c301                   test bl, 1
0x140089379: 0f84e9000000             je 0x140089468
0x14008937f: 90                       nop
0x140089380: 4d39c1                   cmp r9, r8
0x140089383: 0f84e5000000             je 0x14008946e
0x140089389: 4d89c3                   mov r11, r8
0x14008938c: 410fbe70ff               movsx esi, byte ptr [r8 - 1]
0x140089391: 85f6                     test esi, esi
0x140089393: 781b                     js 0x1400893b0
0x140089395: 4d8d43ff                 lea r8, [r11 - 1]
0x140089399: 8d7ef7                   lea edi, [rsi - 9]
0x14008939c: 83ff05                   cmp edi, 5
0x14008939f: 72df                     jb 0x140089380
0x1400893a1: eb69                     jmp 0x14008940c
0x1400893a3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1400893b0: 410fb67bfe               movzx edi, byte ptr [r11 - 2]
0x1400893b5: 4080ffc0                 cmp dil, 0xc0
0x1400893b9: 7d20                     jge 0x1400893db
0x1400893bb: 410fb65bfd               movzx ebx, byte ptr [r11 - 3]
0x1400893c0: 80fbc0                   cmp bl, 0xc0
0x1400893c3: 7d1f                     jge 0x1400893e4
0x1400893c5: 4d8d43fc                 lea r8, [r11 - 4]
0x1400893c9: 410fb66bfc               movzx ebp, byte ptr [r11 - 4]
0x1400893ce: 83e507                   and ebp, 7
0x1400893d1: c1e506                   shl ebp, 6
0x1400893d4: 83e33f                   and ebx, 0x3f
0x1400893d7: 09eb                     or ebx, ebp
0x1400893d9: eb10                     jmp 0x1400893eb
0x1400893db: 4d8d43fe                 lea r8, [r11 - 2]
0x1400893df: 83e71f                   and edi, 0x1f
0x1400893e2: eb0f                     jmp 0x1400893f3
0x1400893e4: 4d8d43fd                 lea r8, [r11 - 3]
0x1400893e8: 83e30f                   and ebx, 0xf
0x1400893eb: c1e306                   shl ebx, 6
0x1400893ee: 83e73f                   and edi, 0x3f
0x1400893f1: 09df                     or edi, ebx
0x1400893f3: c1e706                   shl edi, 6
0x1400893f6: 4080e63f                 and sil, 0x3f
0x1400893fa: 400fb6f6                 movzx esi, sil
0x1400893fe: 09fe                     or esi, edi
0x140089400: 8d7ef7                   lea edi, [rsi - 9]
0x140089403: 83ff05                   cmp edi, 5
0x140089406: 0f8274ffffff             jb 0x140089380
0x14008940c: 83fe20                   cmp esi, 0x20
0x14008940f: 0f846bffffff             je 0x140089380
0x140089415: 81fe85000000             cmp esi, 0x85
0x14008941b: 724b                     jb 0x140089468
0x14008941d: 89f7                     mov edi, esi
0x14008941f: c1ef08                   shr edi, 8
0x140089422: 83ff1f                   cmp edi, 0x1f
0x140089425: 7f17                     jg 0x14008943e
0x140089427: 85ff                     test edi, edi
0x140089429: 742f                     je 0x14008945a
0x14008942b: 83ff16                   cmp edi, 0x16
0x14008942e: 7538                     jne 0x140089468
0x140089430: 81fe80160000             cmp esi, 0x1680
0x140089436: 0f94c3                   sete bl
0x140089439: e938ffffff               jmp 0x140089376
0x14008943e: 83ff20                   cmp edi, 0x20
0x140089441: 0f8424ffffff             je 0x14008936b
0x140089447: 83ff30                   cmp edi, 0x30
0x14008944a: 751c                     jne 0x140089468
0x14008944c: 81fe00300000             cmp esi, 0x3000
0x140089452: 0f94c3                   sete bl
0x140089455: e91cffffff               jmp 0x140089376
0x14008945a: 400fb6f6                 movzx esi, sil
0x14008945e: 410fb61c32               movzx ebx, byte ptr [r10 + rsi]
0x140089463: e90effffff               jmp 0x140089376
0x140089468: 4c29ca                   sub rdx, r9
0x14008946b: 4c01da                   add rdx, r11
0x14008946e: 4829ca                   sub rdx, rcx
0x140089471: 4801c8                   add rax, rcx
0x140089474: 5b                       pop rbx
0x140089475: 5d                       pop rbp
0x140089476: 5f                       pop rdi
0x140089477: 5e                       pop rsi
0x140089478: c3                       ret
