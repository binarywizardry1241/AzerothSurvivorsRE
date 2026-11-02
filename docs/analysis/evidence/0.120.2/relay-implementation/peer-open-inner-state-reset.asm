; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf801e 48c7853002000000000000         mov qword ptr [rbp + 0x230], 0
0000000145bf8029 48c7850002000000000000         mov qword ptr [rbp + 0x200], 0
0000000145bf8034 48c7850802000008000000         mov qword ptr [rbp + 0x208], 8
0000000145bf803f 488d8518020000                 lea rax, [rbp + 0x218]
0000000145bf8046 0f1170f8                       movups xmmword ptr [rax - 8], xmm6
0000000145bf804a 0f117030                       movups xmmword ptr [rax + 0x30], xmm6
0000000145bf804e 0f117020                       movups xmmword ptr [rax + 0x20], xmm6
0000000145bf8052 c6404000                       mov byte ptr [rax + 0x40], 0
0000000145bf8056 c78528020000ffffffff           mov dword ptr [rbp + 0x228], 0xffffffff
0000000145bf8060 8b85a8020000                   mov eax, dword ptr [rbp + 0x2a8]
0000000145bf8066 894520                         mov dword ptr [rbp + 0x20], eax
0000000145bf8069 488b4d70                       mov rcx, qword ptr [rbp + 0x70]
0000000145bf806d 488d5520                       lea rdx, [rbp + 0x20]
0000000145bf8071 e8ea0892fa                     call 0x140518960
0000000145bf8076 4889c6                         mov rsi, rax
0000000145bf8079 4983bc24c001000000             cmp qword ptr [r12 + 0x1c0], 0
0000000145bf8082 0f847c070000                   je 0x145bf8804
0000000145bf8088 498b8424b0010000               mov rax, qword ptr [r12 + 0x1b0]
0000000145bf8090 498b9424b8010000               mov rdx, qword ptr [r12 + 0x1b8]
0000000145bf8098 4889f1                         mov rcx, rsi
0000000145bf809b 48c1e939                       shr rcx, 0x39
0000000145bf809f 660f6ec1                       movd xmm0, ecx
0000000145bf80a3 660f60c0                       punpcklbw xmm0, xmm0
0000000145bf80a7 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bf80ac 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bf80b1 4531d2                         xor r10d, r10d
0000000145bf80b4 4531c9                         xor r9d, r9d
0000000145bf80b7 4821d6                         and rsi, rdx
0000000145bf80ba f30f6f0c30                     movdqu xmm1, xmmword ptr [rax + rsi]
0000000145bf80bf 660f6fd1                       movdqa xmm2, xmm1
0000000145bf80c3 660f74d0                       pcmpeqb xmm2, xmm0
0000000145bf80c7 66440fd7da                     pmovmskb r11d, xmm2
0000000145bf80cc 4585db                         test r11d, r11d
0000000145bf80cf 743f                           je 0x145bf8110
0000000145bf80d1 4d89d0                         mov r8, r10
0000000145bf80d4 4d89ca                         mov r10, r9
0000000145bf80d7 f3450fbcf3                     tzcnt r14d, r11d
0000000145bf80dc 4901f6                         add r14, rsi
0000000145bf80df 4921d6                         and r14, rdx
0000000145bf80e2 49f7de                         neg r14
0000000145bf80e5 4d6bf668                       imul r14, r14, 0x68
0000000145bf80e9 448b8da8020000                 mov r9d, dword ptr [rbp + 0x2a8]
0000000145bf80f0 463b4c3098                     cmp r9d, dword ptr [rax + r14 - 0x68]
0000000145bf80f5 7476                           je 0x145bf816d
0000000145bf80f7 458d73ff                       lea r14d, [r11 - 1]
0000000145bf80fb 664521de                       and r14w, r11w
0000000145bf80ff 4589f3                         mov r11d, r14d
0000000145bf8102 4d89d1                         mov r9, r10
0000000145bf8105 4d89c2                         mov r10, r8
0000000145bf8108 75c7                           jne 0x145bf80d1
0000000145bf810a 660f1f440000                   nop word ptr [rax + rax]
0000000145bf8110 4983fa01                       cmp r10, 1
0000000145bf8114 4c8bb560020000                 mov r14, qword ptr [rbp + 0x260]
0000000145bf811b 4c8b85b0020000                 mov r8, qword ptr [rbp + 0x2b0]
0000000145bf8122 7415                           je 0x145bf8139
0000000145bf8124 66440fd7c1                     pmovmskb r8d, xmm1
0000000145bf8129 4585c0                         test r8d, r8d
0000000145bf812c 742c                           je 0x145bf815a
0000000145bf812e f3450fbcc0                     tzcnt r8d, r8d
0000000145bf8133 4901f0                         add r8, rsi
0000000145bf8136 4921d0                         and r8, rdx
0000000145bf8139 660f74cf                       pcmpeqb xmm1, xmm7
0000000145bf813d 66440fd7d1                     pmovmskb r10d, xmm1
0000000145bf8142 4585d2                         test r10d, r10d
0000000145bf8145 0f8578010000                   jne 0x145bf82c3
0000000145bf814b 4c8985b0020000                 mov qword ptr [rbp + 0x2b0], r8
0000000145bf8152 41ba01000000                   mov r10d, 1
0000000145bf8158 eb03                           jmp 0x145bf815d
0000000145bf815a 4531d2                         xor r10d, r10d
0000000145bf815d 4c01ce                         add rsi, r9
0000000145bf8160 4883c610                       add rsi, 0x10
0000000145bf8164 4983c110                       add r9, 0x10
0000000145bf8168 e94affffff                     jmp 0x145bf80b7
0000000145bf816d 4c01f0                         add rax, r14
0000000145bf8170 488b50a0                       mov rdx, qword ptr [rax - 0x60]
0000000145bf8174 488b48a8                       mov rcx, qword ptr [rax - 0x58]
0000000145bf8178 48898db0020000                 mov qword ptr [rbp + 0x2b0], rcx
0000000145bf817f 488b48b0                       mov rcx, qword ptr [rax - 0x50]
0000000145bf8183 4c8b50b8                       mov r10, qword ptr [rax - 0x48]
0000000145bf8187 f30f6f8500020000               movdqu xmm0, xmmword ptr [rbp + 0x200]
0000000145bf818f f30f6f8d10020000               movdqu xmm1, xmmword ptr [rbp + 0x210]
0000000145bf8197 0f109520020000                 movups xmm2, xmmword ptr [rbp + 0x220]
0000000145bf819e 0f109d30020000                 movups xmm3, xmmword ptr [rbp + 0x230]
0000000145bf81a5 0f1150c0                       movups xmmword ptr [rax - 0x40], xmm2
0000000145bf81a9 0f1158d0                       movups xmmword ptr [rax - 0x30], xmm3
0000000145bf81ad 0f109540020000                 movups xmm2, xmmword ptr [rbp + 0x240]
0000000145bf81b4 0f1150e0                       movups xmmword ptr [rax - 0x20], xmm2
0000000145bf81b8 f30f6f9550020000               movdqu xmm2, xmmword ptr [rbp + 0x250]
0000000145bf81c0 f30f7f50f0                     movdqu xmmword ptr [rax - 0x10], xmm2
0000000145bf81c5 f30f7f40a0                     movdqu xmmword ptr [rax - 0x60], xmm0
0000000145bf81ca f30f7f48b0                     movdqu xmmword ptr [rax - 0x50], xmm1
0000000145bf81cf 4883faff                       cmp rdx, -1
0000000145bf81d3 4c8bb560020000                 mov r14, qword ptr [rbp + 0x260]
0000000145bf81da 0f84cb000000                   je 0x145bf82ab
0000000145bf81e0 48899578020000                 mov qword ptr [rbp + 0x278], rdx
0000000145bf81e7 4d85d2                         test r10, r10
0000000145bf81ea 0f8492000000                   je 0x145bf8282
0000000145bf81f0 4c8b8d78020000                 mov r9, qword ptr [rbp + 0x278]
0000000145bf81f7 4c39c9                         cmp rcx, r9
0000000145bf81fa 4c89c8                         mov rax, r9
0000000145bf81fd 41b800000000                   mov r8d, 0
0000000145bf8203 490f42c0                       cmovb rax, r8
0000000145bf8207 4889ca                         mov rdx, rcx
0000000145bf820a 4829c2                         sub rdx, rax
0000000145bf820d 4d89cb                         mov r11, r9
0000000145bf8210 4929d3                         sub r11, rdx
0000000145bf8213 4e8d3412                       lea r14, [rdx + r10]
0000000145bf8217 4c899568020000                 mov qword ptr [rbp + 0x268], r10
0000000145bf821e 4d89d4                         mov r12, r10
0000000145bf8221 4c899d70020000                 mov qword ptr [rbp + 0x270], r11
0000000145bf8228 4d29dc                         sub r12, r11
0000000145bf822b 4d0f42e0                       cmovb r12, r8
0000000145bf822f 4d0f47f1                       cmova r14, r9
0000000145bf8233 4929d6                         sub r14, rdx
0000000145bf8236 0f850c050000                   jne 0x145bf8748
0000000145bf823c 488b8570020000                 mov rax, qword ptr [rbp + 0x270]
0000000145bf8243 483b8568020000                 cmp rax, qword ptr [rbp + 0x268]
0000000145bf824a 4c8bb560020000                 mov r14, qword ptr [rbp + 0x260]
0000000145bf8251 732f                           jae 0x145bf8282
0000000145bf8253 488b85b0020000                 mov rax, qword ptr [rbp + 0x2b0]
0000000145bf825a 488d7010                       lea rsi, [rax + 0x10]
0000000145bf825e eb09                           jmp 0x145bf8269
0000000145bf8260 4883c620                       add rsi, 0x20
0000000145bf8264 49ffcc                         dec r12
0000000145bf8267 7419                           je 0x145bf8282
0000000145bf8269 488b56f8                       mov rdx, qword ptr [rsi - 8]
0000000145bf826d 4885d2                         test rdx, rdx
0000000145bf8270 74ee                           je 0x145bf8260
0000000145bf8272 488b0e                         mov rcx, qword ptr [rsi]
0000000145bf8275 41b801000000                   mov r8d, 1
0000000145bf827b e8509f40fa                     call 0x1400021d0
0000000145bf8280 ebde                           jmp 0x145bf8260
0000000145bf8282 488b9578020000                 mov rdx, qword ptr [rbp + 0x278]
0000000145bf8289 4885d2                         test rdx, rdx
0000000145bf828c 4c8ba588020000                 mov r12, qword ptr [rbp + 0x288]
0000000145bf8293 7416                           je 0x145bf82ab
0000000145bf8295 48c1e205                       shl rdx, 5
0000000145bf8299 41b808000000                   mov r8d, 8
0000000145bf829f 488b8db0020000                 mov rcx, qword ptr [rbp + 0x2b0]
0000000145bf82a6 e8259f40fa                     call 0x1400021d0
0000000145bf82ab 498b4c2420                     mov rcx, qword ptr [r12 + 0x20]
0000000145bf82b0 498b442438                     mov rax, qword ptr [r12 + 0x38]
0000000145bf82b5 4839c8                         cmp rax, rcx
0000000145bf82b8 0f8413010000                   je 0x145bf83d1
0000000145bf82be e945010000                     jmp 0x145bf8408
0000000145bf82c3 460fb60c00                     movzx r9d, byte ptr [rax + r8]
0000000145bf82c8 4584c9                         test r9b, r9b
0000000145bf82cb 0f8966050000                   jns 0x145bf8837
0000000145bf82d1 0f108550020000                 movups xmm0, xmmword ptr [rbp + 0x250]
0000000145bf82d8 4c8d9508010000                 lea r10, [rbp + 0x108]
0000000145bf82df 410f11424c                     movups xmmword ptr [r10 + 0x4c], xmm0
0000000145bf82e4 0f108540020000                 movups xmm0, xmmword ptr [rbp + 0x240]
0000000145bf82eb 410f11423c                     movups xmmword ptr [r10 + 0x3c], xmm0
0000000145bf82f0 0f108500020000                 movups xmm0, xmmword ptr [rbp + 0x200]
0000000145bf82f7 0f108d10020000                 movups xmm1, xmmword ptr [rbp + 0x210]
0000000145bf82fe 0f109520020000                 movups xmm2, xmmword ptr [rbp + 0x220]
0000000145bf8305 0f109d30020000                 movups xmm3, xmmword ptr [rbp + 0x230]
0000000145bf830c 410f115a2c                     movups xmmword ptr [r10 + 0x2c], xmm3
0000000145bf8311 410f11521c                     movups xmmword ptr [r10 + 0x1c], xmm2
0000000145bf8316 410f114a0c                     movups xmmword ptr [r10 + 0xc], xmm1
0000000145bf831b 410f1142fc                     movups xmmword ptr [r10 - 4], xmm0
0000000145bf8320 4180e101                       and r9b, 1
0000000145bf8324 4d8d50f0                       lea r10, [r8 - 0x10]
0000000145bf8328 4921d2                         and r10, rdx
0000000145bf832b 42880c00                       mov byte ptr [rax + r8], cl
0000000145bf832f 42884c1010                     mov byte ptr [rax + r10 + 0x10], cl
0000000145bf8334 f3410f6f8424c0010000           movdqu xmm0, xmmword ptr [r12 + 0x1c0]
0000000145bf833e 410fb6c9                       movzx ecx, r9b
0000000145bf8342 660f6ec9                       movd xmm1, ecx
0000000145bf8346 410fc6c8e4                     shufps xmm1, xmm8, 0xe4
0000000145bf834b 660ffbc1                       psubq xmm0, xmm1
0000000145bf834f f3410f7f8424c0010000           movdqu xmmword ptr [r12 + 0x1c0], xmm0
0000000145bf8359 49f7d8                         neg r8
0000000145bf835c 496bc868                       imul rcx, r8, 0x68
0000000145bf8360 8b95a8020000                   mov edx, dword ptr [rbp + 0x2a8]
0000000145bf8366 89540898                       mov dword ptr [rax + rcx - 0x68], edx
0000000145bf836a 0f108500010000                 movups xmm0, xmmword ptr [rbp + 0x100]
0000000145bf8371 f30f6f8d10010000               movdqu xmm1, xmmword ptr [rbp + 0x110]
0000000145bf8379 f30f6f9520010000               movdqu xmm2, xmmword ptr [rbp + 0x120]
0000000145bf8381 0f109d30010000                 movups xmm3, xmmword ptr [rbp + 0x130]
0000000145bf8388 0f1144089c                     movups xmmword ptr [rax + rcx - 0x64], xmm0
0000000145bf838d f30f7f4c08ac                   movdqu xmmword ptr [rax + rcx - 0x54], xmm1
0000000145bf8393 f30f7f5408bc                   movdqu xmmword ptr [rax + rcx - 0x44], xmm2
0000000145bf8399 0f115c08cc                     movups xmmword ptr [rax + rcx - 0x34], xmm3
0000000145bf839e 0f108540010000                 movups xmm0, xmmword ptr [rbp + 0x140]
0000000145bf83a5 0f114408dc                     movups xmmword ptr [rax + rcx - 0x24], xmm0
0000000145bf83aa f30f6f8550010000               movdqu xmm0, xmmword ptr [rbp + 0x150]
0000000145bf83b2 f30f7f4408ec                   movdqu xmmword ptr [rax + rcx - 0x14], xmm0
0000000145bf83b8 8b9560010000                   mov edx, dword ptr [rbp + 0x160]
0000000145bf83be 895408fc                       mov dword ptr [rax + rcx - 4], edx
0000000145bf83c2 498b4c2420                     mov rcx, qword ptr [r12 + 0x20]
0000000145bf83c7 498b442438                     mov rax, qword ptr [r12 + 0x38]
0000000145bf83cc 4839c8                         cmp rax, rcx
0000000145bf83cf 7537                           jne 0x145bf8408
0000000145bf83d1 c685c602000001                 mov byte ptr [rbp + 0x2c6], 1
0000000145bf83d8 c685c502000001                 mov byte ptr [rbp + 0x2c5], 1
0000000145bf83df c685c402000001                 mov byte ptr [rbp + 0x2c4], 1
0000000145bf83e6 c685c302000001                 mov byte ptr [rbp + 0x2c3], 1
0000000145bf83ed c685c202000001                 mov byte ptr [rbp + 0x2c2], 1
0000000145bf83f4 488b4d00                       mov rcx, qword ptr [rbp]
0000000145bf83f8 e823d27efc                     call 0x1423e5620
0000000145bf83fd 90                             nop
0000000145bf83fe 498b4c2420                     mov rcx, qword ptr [r12 + 0x20]
0000000145bf8403 498b442438                     mov rax, qword ptr [r12 + 0x38]
0000000145bf8408 488d5001                       lea rdx, [rax + 1]
0000000145bf840c 4989542438                     mov qword ptr [r12 + 0x38], rdx
0000000145bf8411 4903442430                     add rax, qword ptr [r12 + 0x30]
0000000145bf8416 4839c8                         cmp rax, rcx
0000000145bf8419 ba00000000                     mov edx, 0
0000000145bf841e 480f43d1                       cmovae rdx, rcx
0000000145bf8422 4829d0                         sub rax, rdx
0000000145bf8425 498b4c2428                     mov rcx, qword ptr [r12 + 0x28]
0000000145bf842a 8b95a8020000                   mov edx, dword ptr [rbp + 0x2a8]
0000000145bf8430 891481                         mov dword ptr [rcx + rax*4], edx
