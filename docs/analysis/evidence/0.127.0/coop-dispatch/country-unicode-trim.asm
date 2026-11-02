0000000140207170 56                             push rsi
0000000140207171 57                             push rdi
0000000140207172 55                             push rbp
0000000140207173 53                             push rbx
0000000140207174 4889c8                         mov rax, rcx
0000000140207177 4c8d0411                       lea r8, [rcx + rdx]
000000014020717b 4885d2                         test rdx, rdx
000000014020717e 0f843e010000                   je 0x1402072c2
0000000140207184 4c8b15757a4508                 mov r10, qword ptr [rip + 0x8457a75]
000000014020718b 31d2                           xor edx, edx
000000014020718d 4989c1                         mov r9, rax
0000000140207190 eb27                           jmp 0x1402071b9
0000000140207192 450fb6db                       movzx r11d, r11b
0000000140207196 470fb61c1a                     movzx r11d, byte ptr [r10 + r11]
000000014020719b 41d0eb                         shr r11b, 1
000000014020719e 41f6c301                       test r11b, 1
00000001402071a2 0f8421010000                   je 0x1402072c9
00000001402071a8 0f1f840000000000               nop dword ptr [rax + rax]
00000001402071b0 4d39c1                         cmp r9, r8
00000001402071b3 0f8400010000                   je 0x1402072b9
00000001402071b9 4c89ce                         mov rsi, r9
00000001402071bc 4889d1                         mov rcx, rdx
00000001402071bf 450fb609                       movzx r9d, byte ptr [r9]
00000001402071c3 450fb6d9                       movzx r11d, r9b
00000001402071c7 4584db                         test r11b, r11b
00000001402071ca 7814                           js 0x1402071e0
00000001402071cc 4c8d4e01                       lea r9, [rsi + 1]
00000001402071d0 eb6e                           jmp 0x140207240
00000001402071d2 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
00000001402071e0 4489da                         mov edx, r11d
00000001402071e3 83e21f                         and edx, 0x1f
00000001402071e6 0fb67e01                       movzx edi, byte ptr [rsi + 1]
00000001402071ea 83e73f                         and edi, 0x3f
00000001402071ed 4180fbdf                       cmp r11b, 0xdf
00000001402071f1 7634                           jbe 0x140207227
00000001402071f3 440fb65e02                     movzx r11d, byte ptr [rsi + 2]
00000001402071f8 c1e706                         shl edi, 6
00000001402071fb 4183e33f                       and r11d, 0x3f
00000001402071ff 4109fb                         or r11d, edi
0000000140207202 4180f9f0                       cmp r9b, 0xf0
0000000140207206 722d                           jb 0x140207235
0000000140207208 4c8d4e04                       lea r9, [rsi + 4]
000000014020720c 0fb67e03                       movzx edi, byte ptr [rsi + 3]
0000000140207210 83e207                         and edx, 7
0000000140207213 c1e212                         shl edx, 0x12
0000000140207216 41c1e306                       shl r11d, 6
000000014020721a 83e73f                         and edi, 0x3f
000000014020721d 4409df                         or edi, r11d
0000000140207220 09d7                           or edi, edx
0000000140207222 4189fb                         mov r11d, edi
0000000140207225 eb19                           jmp 0x140207240
0000000140207227 4c8d4e02                       lea r9, [rsi + 2]
000000014020722b c1e206                         shl edx, 6
000000014020722e 09fa                           or edx, edi
0000000140207230 4189d3                         mov r11d, edx
0000000140207233 eb0b                           jmp 0x140207240
0000000140207235 4c8d4e03                       lea r9, [rsi + 3]
0000000140207239 c1e20c                         shl edx, 0xc
000000014020723c 4109d3                         or r11d, edx
000000014020723f 90                             nop 
0000000140207240 4c89ca                         mov rdx, r9
0000000140207243 4829f2                         sub rdx, rsi
0000000140207246 4801ca                         add rdx, rcx
0000000140207249 418d73f7                       lea esi, [r11 - 9]
000000014020724d 83fe05                         cmp esi, 5
0000000140207250 0f825affffff                   jb 0x1402071b0
0000000140207256 4183fb20                       cmp r11d, 0x20
000000014020725a 0f8450ffffff                   je 0x1402071b0
0000000140207260 4181fb85000000                 cmp r11d, 0x85
0000000140207267 7260                           jb 0x1402072c9
0000000140207269 4489de                         mov esi, r11d
000000014020726c c1ee08                         shr esi, 8
000000014020726f 83fe1f                         cmp esi, 0x1f
0000000140207272 7f19                           jg 0x14020728d
0000000140207274 85f6                           test esi, esi
0000000140207276 7433                           je 0x1402072ab
0000000140207278 83fe16                         cmp esi, 0x16
000000014020727b 754c                           jne 0x1402072c9
000000014020727d 4181fb80160000                 cmp r11d, 0x1680
0000000140207284 410f94c3                       sete r11b
0000000140207288 e911ffffff                     jmp 0x14020719e
000000014020728d 83fe20                         cmp esi, 0x20
0000000140207290 0f84fcfeffff                   je 0x140207192
0000000140207296 83fe30                         cmp esi, 0x30
0000000140207299 752e                           jne 0x1402072c9
000000014020729b 4181fb00300000                 cmp r11d, 0x3000
00000001402072a2 410f94c3                       sete r11b
00000001402072a6 e9f3feffff                     jmp 0x14020719e
00000001402072ab 450fb6db                       movzx r11d, r11b
00000001402072af 470fb61c1a                     movzx r11d, byte ptr [r10 + r11]
00000001402072b4 e9e5feffff                     jmp 0x14020719e
00000001402072b9 31c9                           xor ecx, ecx
00000001402072bb 31d2                           xor edx, edx
00000001402072bd e91c010000                     jmp 0x1402073de
00000001402072c2 31d2                           xor edx, edx
00000001402072c4 4989c1                         mov r9, rax
00000001402072c7 31c9                           xor ecx, ecx
00000001402072c9 4d39c1                         cmp r9, r8
00000001402072cc 0f840c010000                   je 0x1402073de
00000001402072d2 4c8b1527794508                 mov r10, qword ptr [rip + 0x8457927]
00000001402072d9 eb1e                           jmp 0x1402072f9
00000001402072db 400fb6f6                       movzx esi, sil
00000001402072df 410fb61c32                     movzx ebx, byte ptr [r10 + rsi]
00000001402072e4 d0eb                           shr bl, 1
00000001402072e6 f6c301                         test bl, 1
00000001402072e9 0f84e9000000                   je 0x1402073d8
00000001402072ef 90                             nop 
00000001402072f0 4d39c1                         cmp r9, r8
00000001402072f3 0f84e5000000                   je 0x1402073de
00000001402072f9 4d89c3                         mov r11, r8
00000001402072fc 410fbe70ff                     movsx esi, byte ptr [r8 - 1]
0000000140207301 85f6                           test esi, esi
0000000140207303 781b                           js 0x140207320
0000000140207305 4d8d43ff                       lea r8, [r11 - 1]
0000000140207309 8d7ef7                         lea edi, [rsi - 9]
000000014020730c 83ff05                         cmp edi, 5
000000014020730f 72df                           jb 0x1402072f0
0000000140207311 eb69                           jmp 0x14020737c
0000000140207313 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000140207320 410fb67bfe                     movzx edi, byte ptr [r11 - 2]
0000000140207325 4080ffc0                       cmp dil, 0xc0
0000000140207329 7d20                           jge 0x14020734b
000000014020732b 410fb65bfd                     movzx ebx, byte ptr [r11 - 3]
0000000140207330 80fbc0                         cmp bl, 0xc0
0000000140207333 7d1f                           jge 0x140207354
0000000140207335 4d8d43fc                       lea r8, [r11 - 4]
0000000140207339 410fb66bfc                     movzx ebp, byte ptr [r11 - 4]
000000014020733e 83e507                         and ebp, 7
0000000140207341 c1e506                         shl ebp, 6
0000000140207344 83e33f                         and ebx, 0x3f
0000000140207347 09eb                           or ebx, ebp
0000000140207349 eb10                           jmp 0x14020735b
000000014020734b 4d8d43fe                       lea r8, [r11 - 2]
000000014020734f 83e71f                         and edi, 0x1f
0000000140207352 eb0f                           jmp 0x140207363
0000000140207354 4d8d43fd                       lea r8, [r11 - 3]
0000000140207358 83e30f                         and ebx, 0xf
000000014020735b c1e306                         shl ebx, 6
000000014020735e 83e73f                         and edi, 0x3f
0000000140207361 09df                           or edi, ebx
0000000140207363 c1e706                         shl edi, 6
0000000140207366 4080e63f                       and sil, 0x3f
000000014020736a 400fb6f6                       movzx esi, sil
000000014020736e 09fe                           or esi, edi
0000000140207370 8d7ef7                         lea edi, [rsi - 9]
0000000140207373 83ff05                         cmp edi, 5
0000000140207376 0f8274ffffff                   jb 0x1402072f0
000000014020737c 83fe20                         cmp esi, 0x20
000000014020737f 0f846bffffff                   je 0x1402072f0
0000000140207385 81fe85000000                   cmp esi, 0x85
000000014020738b 724b                           jb 0x1402073d8
000000014020738d 89f7                           mov edi, esi
000000014020738f c1ef08                         shr edi, 8
0000000140207392 83ff1f                         cmp edi, 0x1f
0000000140207395 7f17                           jg 0x1402073ae
0000000140207397 85ff                           test edi, edi
0000000140207399 742f                           je 0x1402073ca
000000014020739b 83ff16                         cmp edi, 0x16
000000014020739e 7538                           jne 0x1402073d8
00000001402073a0 81fe80160000                   cmp esi, 0x1680
00000001402073a6 0f94c3                         sete bl
00000001402073a9 e938ffffff                     jmp 0x1402072e6
00000001402073ae 83ff20                         cmp edi, 0x20
00000001402073b1 0f8424ffffff                   je 0x1402072db
00000001402073b7 83ff30                         cmp edi, 0x30
00000001402073ba 751c                           jne 0x1402073d8
00000001402073bc 81fe00300000                   cmp esi, 0x3000
00000001402073c2 0f94c3                         sete bl
00000001402073c5 e91cffffff                     jmp 0x1402072e6
00000001402073ca 400fb6f6                       movzx esi, sil
00000001402073ce 410fb61c32                     movzx ebx, byte ptr [r10 + rsi]
00000001402073d3 e90effffff                     jmp 0x1402072e6
00000001402073d8 4c29ca                         sub rdx, r9
00000001402073db 4c01da                         add rdx, r11
00000001402073de 4829ca                         sub rdx, rcx
00000001402073e1 4801c8                         add rax, rcx
00000001402073e4 5b                             pop rbx
00000001402073e5 5d                             pop rbp
00000001402073e6 5f                             pop rdi
00000001402073e7 5e                             pop rsi
00000001402073e8 c3                             ret 
