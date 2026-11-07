0x1458f9e48: 4983bda009000000         cmp qword ptr [r13 + 0x9a0], 0
0x1458f9e50: 0f8476030000             je 0x1458fa1cc
0x1458f9e56: 498b85a0090000           mov rax, qword ptr [r13 + 0x9a0]
0x1458f9e5d: 488945b0                 mov qword ptr [rbp - 0x50], rax
0x1458f9e61: 410f108590090000         movups xmm0, xmmword ptr [r13 + 0x990]
0x1458f9e69: 0f2945a0                 movaps xmmword ptr [rbp - 0x60], xmm0
0x1458f9e6d: 49c7859009000000000000   mov qword ptr [r13 + 0x990], 0
0x1458f9e78: 49c7859809000008000000   mov qword ptr [r13 + 0x998], 8
0x1458f9e83: 49c785a009000000000000   mov qword ptr [r13 + 0x9a0], 0
0x1458f9e8e: 488d45a0                 lea rax, [rbp - 0x60]
0x1458f9e92: 48898520130000           mov qword ptr [rbp + 0x1320], rax
0x1458f9e99: 4c8b4db0                 mov r9, qword ptr [rbp - 0x50]
0x1458f9e9d: 4d85c9                   test r9, r9
0x1458f9ea0: 0f8466010000             je 0x1458fa00c
0x1458f9ea6: 498b95400b0000           mov rdx, qword ptr [r13 + 0xb40]
0x1458f9ead: 488b4da8                 mov rcx, qword ptr [rbp - 0x58]
0x1458f9eb1: 31c0                     xor eax, eax
0x1458f9eb3: 4983f901                 cmp r9, 1
0x1458f9eb7: 7507                     jne 0x1458f9ec0
0x1458f9eb9: 4531c0                   xor r8d, r8d
0x1458f9ebc: 31f6                     xor esi, esi
0x1458f9ebe: eb56                     jmp 0x1458f9f16
0x1458f9ec0: 4d89ca                   mov r10, r9
0x1458f9ec3: 4983e2fe                 and r10, 0xfffffffffffffffe
0x1458f9ec7: 4c8d5918                 lea r11, [rcx + 0x18]
0x1458f9ecb: 4531c0                   xor r8d, r8d
0x1458f9ece: 31f6                     xor esi, esi
0x1458f9ed0: eb1f                     jmp 0x1458f9ef1
0x1458f9ed2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458f9ee0: 01fe                     add esi, edi
0x1458f9ee2: 01de                     add esi, ebx
0x1458f9ee4: 4983c002                 add r8, 2
0x1458f9ee8: 4983c320                 add r11, 0x20
0x1458f9eec: 4d39c2                   cmp r10, r8
0x1458f9eef: 741f                     je 0x1458f9f10
0x1458f9ef1: bf00000000               mov edi, 0
0x1458f9ef6: 493953e8                 cmp qword ptr [r11 - 0x18], rdx
0x1458f9efa: 7404                     je 0x1458f9f00
0x1458f9efc: 418b7bf0                 mov edi, dword ptr [r11 - 0x10]
0x1458f9f00: bb00000000               mov ebx, 0
0x1458f9f05: 493953f8                 cmp qword ptr [r11 - 8], rdx
0x1458f9f09: 74d5                     je 0x1458f9ee0
0x1458f9f0b: 418b1b                   mov ebx, dword ptr [r11]
0x1458f9f0e: ebd0                     jmp 0x1458f9ee0
0x1458f9f10: 41f6c101                 test r9b, 1
0x1458f9f14: 7413                     je 0x1458f9f29
0x1458f9f16: 49c1e004                 shl r8, 4
0x1458f9f1a: 4a391401                 cmp qword ptr [rcx + r8], rdx
0x1458f9f1e: 7405                     je 0x1458f9f25
0x1458f9f20: 428b440108               mov eax, dword ptr [rcx + r8 + 8]
0x1458f9f25: 01f0                     add eax, esi
0x1458f9f27: 89c6                     mov esi, eax
0x1458f9f29: 85f6                     test esi, esi
0x1458f9f2b: 0f84db000000             je 0x1458fa00c
0x1458f9f31: 4180bd460c000004         cmp byte ptr [r13 + 0xc46], 4
0x1458f9f39: 0f84cd000000             je 0x1458fa00c
0x1458f9f3f: 4180bd410c000001         cmp byte ptr [r13 + 0xc41], 1
0x1458f9f47: 7531                     jne 0x1458f9f7a
0x1458f9f49: 498b8da8020000           mov rcx, qword ptr [r13 + 0x2a8]
0x1458f9f50: 498b95b0020000           mov rdx, qword ptr [r13 + 0x2b0]
0x1458f9f57: e884f6f0ff               call 0x1458095e0
0x1458f9f5c: 31c9                     xor ecx, ecx
0x1458f9f5e: 83f803                   cmp eax, 3
0x1458f9f61: 0f92c1                   setb cl
0x1458f9f64: 498b85500b0000           mov rax, qword ptr [r13 + 0xb50]
0x1458f9f6b: 48ffc8                   dec rax
0x1458f9f6e: 7814                     js 0x1458f9f84
0x1458f9f70: 0f57c0                   xorps xmm0, xmm0
0x1458f9f73: f3480f2ac0               cvtsi2ss xmm0, rax
0x1458f9f78: eb22                     jmp 0x1458f9f9c
0x1458f9f7a: f30f100d2e5f5e00         movss xmm1, dword ptr [rip + 0x5e5f2e] ; 0x145edfeb0 0000803f0000000000000000000000000000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f64
0x1458f9f82: eb3c                     jmp 0x1458f9fc0
0x1458f9f84: 4889c2                   mov rdx, rax
0x1458f9f87: 48d1ea                   shr rdx, 1
0x1458f9f8a: 83e001                   and eax, 1
0x1458f9f8d: 4809d0                   or rax, rdx
0x1458f9f90: 0f57c0                   xorps xmm0, xmm0
0x1458f9f93: f3480f2ac0               cvtsi2ss xmm0, rax
0x1458f9f98: f30f58c0                 addss xmm0, xmm0
0x1458f9f9c: 488d052d2b7401           lea rax, [rip + 0x1742b2d] ; 0x14703cad0 0000803f3333333f2f72757374632f343861323239636561656664343938356335303939306231343131366236643835366166303938352f6c6962726172795c636f72655c737263
0x1458f9fa3: f30f590488               mulss xmm0, dword ptr [rax + rcx*4]
0x1458f9fa8: f30f5905c8635e00         mulss xmm0, dword ptr [rip + 0x5e63c8] ; 0x145ee0378 9a99193f0000003f0000b4420000b8c14992944200002041000000000000000001000000000038426666e63e6666663f0000000000000000020000000000c8420100000000000041
0x1458f9fb0: f30f100df85e5e00         movss xmm1, dword ptr [rip + 0x5e5ef8] ; 0x145edfeb0 0000803f0000000000000000000000000000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f64
0x1458f9fb8: f30f58c1                 addss xmm0, xmm1
0x1458f9fbc: f30f5ec8                 divss xmm1, xmm0
0x1458f9fc0: 89f0                     mov eax, esi
0x1458f9fc2: 0f57c0                   xorps xmm0, xmm0
0x1458f9fc5: f3480f2ac0               cvtsi2ss xmm0, rax
0x1458f9fca: f3410f5985ac040000       mulss xmm0, dword ptr [r13 + 0x4ac]
0x1458f9fd3: f30f59c1                 mulss xmm0, xmm1
0x1458f9fd7: e861a64100               call 0x145d1463d
0x1458f9fdc: f30f5f05cc5e5e00         maxss xmm0, dword ptr [rip + 0x5e5ecc] ; 0x145edfeb0 0000803f0000000000000000000000000000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f64
0x1458f9fe4: f3480f2cc0               cvttss2si rax, xmm0
0x1458f9fe9: 31c9                     xor ecx, ecx
0x1458f9feb: 0f57c9                   xorps xmm1, xmm1
0x1458f9fee: 0f2ec1                   ucomiss xmm0, xmm1
0x1458f9ff1: 0f43c8                   cmovae ecx, eax
0x1458f9ff4: 0f2e05b96b6000           ucomiss xmm0, dword ptr [rip + 0x606bb9] ; 0x145f00bb4 ffff7f4f6666e6be000000003ced8ec2cbc09dbff3f3fe9366c3ff7ceabda8935c9e9d2b8de3999b170ce6a13f110370385f36050b44e874c862d90f7bcdde9dd019c49d16b6a945
0x1458f9ffb: baffffffff               mov edx, 0xffffffff
0x1458fa000: 0f46d1                   cmovbe edx, ecx
0x1458fa003: 4c89e9                   mov rcx, r13
0x1458fa006: e8253b0200               call 0x14591db30
0x1458fa00b: 90                       nop
0x1458fa00c: 4c89e9                   mov rcx, r13
0x1458fa00f: e82c700000               call 0x145901040
0x1458fa014: 90                       nop
0x1458fa015: 4983bd8809000000         cmp qword ptr [r13 + 0x988], 0
0x1458fa01d: 0f848d010000             je 0x1458fa1b0
0x1458fa023: 4d8db578090000           lea r14, [r13 + 0x978]
0x1458fa02a: 498b4610                 mov rax, qword ptr [r14 + 0x10]
0x1458fa02e: 48898530090000           mov qword ptr [rbp + 0x930], rax
0x1458fa035: 410f1006                 movups xmm0, xmmword ptr [r14]
0x1458fa039: 0f298520090000           movaps xmmword ptr [rbp + 0x920], xmm0
0x1458fa040: 49c7857809000000000000   mov qword ptr [r13 + 0x978], 0
0x1458fa04b: 49c7858009000008000000   mov qword ptr [r13 + 0x980], 8
0x1458fa056: 49c7858809000000000000   mov qword ptr [r13 + 0x988], 0
0x1458fa061: 4869853009000080090000   imul rax, qword ptr [rbp + 0x930], 0x980
0x1458fa06c: 488b9528090000           mov rdx, qword ptr [rbp + 0x928]
0x1458fa073: 4801d0                   add rax, rdx
0x1458fa076: 48898568130000           mov qword ptr [rbp + 0x1368], rax
0x1458fa07d: 31ff                     xor edi, edi
0x1458fa07f: 488db520130000           lea rsi, [rbp + 0x1320]
0x1458fa086: 483b9568130000           cmp rdx, qword ptr [rbp + 0x1368]
0x1458fa08d: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458fa094: 7473                     je 0x1458fa109
0x1458fa096: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458fa0a0: 48ffc7                   inc rdi
0x1458fa0a3: 4c89e9                   mov rcx, r13
0x1458fa0a6: e8256e0200               call 0x145920ed0
0x1458fa0ab: 4989bd400b0000           mov qword ptr [r13 + 0xb40], rdi
0x1458fa0b2: 498b8dd0020000           mov rcx, qword ptr [r13 + 0x2d0]
0x1458fa0b9: 498b95d8020000           mov rdx, qword ptr [r13 + 0x2d8]
0x1458fa0c0: 4989f0                   mov r8, rsi
0x1458fa0c3: 4d89e9                   mov r9, r13
0x1458fa0c6: e84509feff               call 0x1458daa10
0x1458fa0cb: 90                       nop
0x1458fa0cc: 4c89e9                   mov rcx, r13
0x1458fa0cf: e86c6f0000               call 0x145901040
0x1458fa0d4: 90                       nop
0x1458fa0d5: 488b9570130000           mov rdx, qword ptr [rbp + 0x1370]
0x1458fa0dc: 488d9a80090000           lea rbx, [rdx + 0x980]
0x1458fa0e3: 49c785400b000000000000   mov qword ptr [r13 + 0xb40], 0
0x1458fa0ee: 4c89e9                   mov rcx, r13
0x1458fa0f1: e8da6d0200               call 0x145920ed0
0x1458fa0f6: 4889da                   mov rdx, rbx
0x1458fa0f9: 483b9568130000           cmp rdx, qword ptr [rbp + 0x1368]
0x1458fa100: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458fa107: 7597                     jne 0x1458fa0a0
0x1458fa109: 4c89b578130000           mov qword ptr [rbp + 0x1378], r14
0x1458fa110: 498b8d80090000           mov rcx, qword ptr [r13 + 0x980]
0x1458fa117: 498b8588090000           mov rax, qword ptr [r13 + 0x988]
0x1458fa11e: 48898560130000           mov qword ptr [rbp + 0x1360], rax
0x1458fa125: 48c7858013000000000000   mov qword ptr [rbp + 0x1380], 0
0x1458fa130: 48898d48130000           mov qword ptr [rbp + 0x1348], rcx
0x1458fa137: 660f1f840000000000       nop word ptr [rax + rax]
0x1458fa140: 488b8580130000           mov rax, qword ptr [rbp + 0x1380]
0x1458fa147: 48398560130000           cmp qword ptr [rbp + 0x1360], rax
0x1458fa14e: 741c                     je 0x1458fa16c
0x1458fa150: 48ffc0                   inc rax
0x1458fa153: 48898580130000           mov qword ptr [rbp + 0x1380], rax
0x1458fa15a: 488db180090000           lea rsi, [rcx + 0x980]
0x1458fa161: e87a420c00               call 0x1459be3e0
0x1458fa166: 90                       nop
0x1458fa167: 4889f1                   mov rcx, rsi
0x1458fa16a: ebd4                     jmp 0x1458fa140
0x1458fa16c: 488bb578130000           mov rsi, qword ptr [rbp + 0x1378]
0x1458fa173: 488b06                   mov rax, qword ptr [rsi]
0x1458fa176: 4885c0                   test rax, rax
0x1458fa179: 4c8bad50130000           mov r13, qword ptr [rbp + 0x1350]
0x1458fa180: 7419                     je 0x1458fa19b
0x1458fa182: 498b8d80090000           mov rcx, qword ptr [r13 + 0x980]
0x1458fa189: 4869d080090000           imul rdx, rax, 0x980
0x1458fa190: 41b808000000             mov r8d, 8
0x1458fa196: e8358070fa               call 0x1400021d0
0x1458fa19b: 488b8530090000           mov rax, qword ptr [rbp + 0x930]
0x1458fa1a2: 48894610                 mov qword ptr [rsi + 0x10], rax
0x1458fa1a6: 0f288520090000           movaps xmm0, xmmword ptr [rbp + 0x920]
0x1458fa1ad: 0f1106                   movups xmmword ptr [rsi], xmm0
0x1458fa1b0: 488b55a0                 mov rdx, qword ptr [rbp - 0x60]
0x1458fa1b4: 4885d2                   test rdx, rdx
0x1458fa1b7: 7413                     je 0x1458fa1cc
0x1458fa1b9: 488b4da8                 mov rcx, qword ptr [rbp - 0x58]
0x1458fa1bd: 48c1e204                 shl rdx, 4
0x1458fa1c1: 41b808000000             mov r8d, 8
0x1458fa1c7: e8048070fa               call 0x1400021d0
0x1458fa1cc: 4983bdb809000000         cmp qword ptr [r13 + 0x9b8], 0
0x1458fa1d4: 0f8492030000             je 0x1458fa56c
0x1458fa1da: 498b85b8090000           mov rax, qword ptr [r13 + 0x9b8]
0x1458fa1e1: 488945b0                 mov qword ptr [rbp - 0x50], rax
0x1458fa1e5: 410f1085a8090000         movups xmm0, xmmword ptr [r13 + 0x9a8]
0x1458fa1ed: 0f2945a0                 movaps xmmword ptr [rbp - 0x60], xmm0
0x1458fa1f1: 49c785a809000000000000   mov qword ptr [r13 + 0x9a8], 0
0x1458fa1fc: 49c785b009000008000000   mov qword ptr [r13 + 0x9b0], 8
0x1458fa207: 49c785b809000000000000   mov qword ptr [r13 + 0x9b8], 0
0x1458fa212: 488d45a0                 lea rax, [rbp - 0x60]
0x1458fa216: 48898520130000           mov qword ptr [rbp + 0x1320], rax
0x1458fa21d: 4c8b4db0                 mov r9, qword ptr [rbp - 0x50]
0x1458fa221: 4d85c9                   test r9, r9
0x1458fa224: 0f8480010000             je 0x1458fa3aa
0x1458fa22a: 498b95400b0000           mov rdx, qword ptr [r13 + 0xb40]
0x1458fa231: 488b4da8                 mov rcx, qword ptr [rbp - 0x58]
0x1458fa235: 31c0                     xor eax, eax
0x1458fa237: 4983f901                 cmp r9, 1
0x1458fa23b: 7507                     jne 0x1458fa244
0x1458fa23d: 4531c0                   xor r8d, r8d
0x1458fa240: 31f6                     xor esi, esi
0x1458fa242: eb52                     jmp 0x1458fa296
0x1458fa244: 4d89ca                   mov r10, r9
0x1458fa247: 4983e2fe                 and r10, 0xfffffffffffffffe
0x1458fa24b: 4c8d5918                 lea r11, [rcx + 0x18]
0x1458fa24f: 4531c0                   xor r8d, r8d
0x1458fa252: 31f6                     xor esi, esi
0x1458fa254: eb1b                     jmp 0x1458fa271
0x1458fa256: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458fa260: 01fe                     add esi, edi
0x1458fa262: 01de                     add esi, ebx
0x1458fa264: 4983c002                 add r8, 2
0x1458fa268: 4983c320                 add r11, 0x20
0x1458fa26c: 4d39c2                   cmp r10, r8
0x1458fa26f: 741f                     je 0x1458fa290
0x1458fa271: bf00000000               mov edi, 0
0x1458fa276: 493953e8                 cmp qword ptr [r11 - 0x18], rdx
0x1458fa27a: 7404                     je 0x1458fa280
0x1458fa27c: 418b7bf0                 mov edi, dword ptr [r11 - 0x10]
0x1458fa280: bb00000000               mov ebx, 0
0x1458fa285: 493953f8                 cmp qword ptr [r11 - 8], rdx
0x1458fa289: 74d5                     je 0x1458fa260
0x1458fa28b: 418b1b                   mov ebx, dword ptr [r11]
0x1458fa28e: ebd0                     jmp 0x1458fa260
0x1458fa290: 41f6c101                 test r9b, 1
0x1458fa294: 7413                     je 0x1458fa2a9
0x1458fa296: 49c1e004                 shl r8, 4
0x1458fa29a: 4a391401                 cmp qword ptr [rcx + r8], rdx
0x1458fa29e: 7405                     je 0x1458fa2a5
0x1458fa2a0: 428b440108               mov eax, dword ptr [rcx + r8 + 8]
0x1458fa2a5: 01f0                     add eax, esi
0x1458fa2a7: 89c6                     mov esi, eax
0x1458fa2a9: 85f6                     test esi, esi
0x1458fa2ab: 0f84f9000000             je 0x1458fa3aa
0x1458fa2b1: 4180bd460c000004         cmp byte ptr [r13 + 0xc46], 4
0x1458fa2b9: 0f84eb000000             je 0x1458fa3aa
0x1458fa2bf: 4180bd410c000001         cmp byte ptr [r13 + 0xc41], 1
0x1458fa2c7: 7531                     jne 0x1458fa2fa
0x1458fa2c9: 498b8da8020000           mov rcx, qword ptr [r13 + 0x2a8]
0x1458fa2d0: 498b95b0020000           mov rdx, qword ptr [r13 + 0x2b0]
0x1458fa2d7: e804f3f0ff               call 0x1458095e0
0x1458fa2dc: 31c9                     xor ecx, ecx
0x1458fa2de: 83f803                   cmp eax, 3
0x1458fa2e1: 0f92c1                   setb cl
0x1458fa2e4: 498b85500b0000           mov rax, qword ptr [r13 + 0xb50]
0x1458fa2eb: 48ffc8                   dec rax
0x1458fa2ee: 7814                     js 0x1458fa304
0x1458fa2f0: 0f57c0                   xorps xmm0, xmm0
0x1458fa2f3: f3480f2ac0               cvtsi2ss xmm0, rax
0x1458fa2f8: eb22                     jmp 0x1458fa31c
0x1458fa2fa: f30f100dae5b5e00         movss xmm1, dword ptr [rip + 0x5e5bae] ; 0x145edfeb0 0000803f0000000000000000000000000000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f64
0x1458fa302: eb3c                     jmp 0x1458fa340
0x1458fa304: 4889c2                   mov rdx, rax
0x1458fa307: 48d1ea                   shr rdx, 1
0x1458fa30a: 83e001                   and eax, 1
0x1458fa30d: 4809d0                   or rax, rdx
0x1458fa310: 0f57c0                   xorps xmm0, xmm0
0x1458fa313: f3480f2ac0               cvtsi2ss xmm0, rax
0x1458fa318: f30f58c0                 addss xmm0, xmm0
0x1458fa31c: 488d05ad277401           lea rax, [rip + 0x17427ad] ; 0x14703cad0 0000803f3333333f2f72757374632f343861323239636561656664343938356335303939306231343131366236643835366166303938352f6c6962726172795c636f72655c737263
0x1458fa323: f30f590488               mulss xmm0, dword ptr [rax + rcx*4]
0x1458fa328: f30f590548605e00         mulss xmm0, dword ptr [rip + 0x5e6048] ; 0x145ee0378 9a99193f0000003f0000b4420000b8c14992944200002041000000000000000001000000000038426666e63e6666663f0000000000000000020000000000c8420100000000000041
0x1458fa330: f30f100d785b5e00         movss xmm1, dword ptr [rip + 0x5e5b78] ; 0x145edfeb0 0000803f0000000000000000000000000000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f64
0x1458fa338: f30f58c1                 addss xmm0, xmm1
0x1458fa33c: f30f5ec8                 divss xmm1, xmm0
0x1458fa340: 89f0                     mov eax, esi
0x1458fa342: 0f57c0                   xorps xmm0, xmm0
0x1458fa345: f3480f2ac0               cvtsi2ss xmm0, rax
0x1458fa34a: f3410f5985c0040000       mulss xmm0, dword ptr [r13 + 0x4c0]
0x1458fa353: f30f59c1                 mulss xmm0, xmm1
0x1458fa357: e8e1a24100               call 0x145d1463d
0x1458fa35c: f3480f2cc0               cvttss2si rax, xmm0
0x1458fa361: 31c9                     xor ecx, ecx
0x1458fa363: 0f57c9                   xorps xmm1, xmm1
0x1458fa366: 0f2ec1                   ucomiss xmm0, xmm1
0x1458fa369: 0f43c8                   cmovae ecx, eax
0x1458fa36c: 0f2e0541686000           ucomiss xmm0, dword ptr [rip + 0x606841] ; 0x145f00bb4 ffff7f4f6666e6be000000003ced8ec2cbc09dbff3f3fe9366c3ff7ceabda8935c9e9d2b8de3999b170ce6a13f110370385f36050b44e874c862d90f7bcdde9dd019c49d16b6a945
0x1458fa373: b8ffffffff               mov eax, 0xffffffff
0x1458fa378: 0f46c1                   cmovbe eax, ecx
0x1458fa37b: 418b8d00050000           mov ecx, dword ptr [r13 + 0x500]
0x1458fa382: 01c1                     add ecx, eax
0x1458fa384: 41898d00050000           mov dword ptr [r13 + 0x500], ecx
0x1458fa38b: 410185ac070000           add dword ptr [r13 + 0x7ac], eax
0x1458fa392: 4469c110270000           imul r8d, ecx, 0x2710
0x1458fa399: 498d8d200b0000           lea rcx, [r13 + 0xb20]
0x1458fa3a0: 66ba9804                 mov dx, 0x498
0x1458fa3a4: e847eff0ff               call 0x1458092f0
0x1458fa3a9: 90                       nop
0x1458fa3aa: 4c89e9                   mov rcx, r13
0x1458fa3ad: e88e6c0000               call 0x145901040
0x1458fa3b2: 90                       nop
0x1458fa3b3: 4983bd8809000000         cmp qword ptr [r13 + 0x988], 0
0x1458fa3bb: 0f848f010000             je 0x1458fa550
0x1458fa3c1: 4d8db578090000           lea r14, [r13 + 0x978]
0x1458fa3c8: 498b4610                 mov rax, qword ptr [r14 + 0x10]
0x1458fa3cc: 48898530090000           mov qword ptr [rbp + 0x930], rax
0x1458fa3d3: 410f1006                 movups xmm0, xmmword ptr [r14]
0x1458fa3d7: 0f298520090000           movaps xmmword ptr [rbp + 0x920], xmm0
0x1458fa3de: 49c7857809000000000000   mov qword ptr [r13 + 0x978], 0
0x1458fa3e9: 49c7858009000008000000   mov qword ptr [r13 + 0x980], 8
0x1458fa3f4: 49c7858809000000000000   mov qword ptr [r13 + 0x988], 0
0x1458fa3ff: 4869853009000080090000   imul rax, qword ptr [rbp + 0x930], 0x980
0x1458fa40a: 488b9528090000           mov rdx, qword ptr [rbp + 0x928]
0x1458fa411: 4801d0                   add rax, rdx
0x1458fa414: 48898568130000           mov qword ptr [rbp + 0x1368], rax
0x1458fa41b: 31ff                     xor edi, edi
0x1458fa41d: 488db520130000           lea rsi, [rbp + 0x1320]
0x1458fa424: 483b9568130000           cmp rdx, qword ptr [rbp + 0x1368]
0x1458fa42b: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458fa432: 7475                     je 0x1458fa4a9
0x1458fa434: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458fa440: 48ffc7                   inc rdi
0x1458fa443: 4c89e9                   mov rcx, r13
0x1458fa446: e8856a0200               call 0x145920ed0
0x1458fa44b: 4989bd400b0000           mov qword ptr [r13 + 0xb40], rdi
0x1458fa452: 498b8dd0020000           mov rcx, qword ptr [r13 + 0x2d0]
0x1458fa459: 498b95d8020000           mov rdx, qword ptr [r13 + 0x2d8]
0x1458fa460: 4989f0                   mov r8, rsi
0x1458fa463: 4d89e9                   mov r9, r13
0x1458fa466: e8a5d7fdff               call 0x1458d7c10
0x1458fa46b: 90                       nop
0x1458fa46c: 4c89e9                   mov rcx, r13
0x1458fa46f: e8cc6b0000               call 0x145901040
0x1458fa474: 90                       nop
0x1458fa475: 488b9570130000           mov rdx, qword ptr [rbp + 0x1370]
0x1458fa47c: 488d9a80090000           lea rbx, [rdx + 0x980]
0x1458fa483: 49c785400b000000000000   mov qword ptr [r13 + 0xb40], 0
0x1458fa48e: 4c89e9                   mov rcx, r13
0x1458fa491: e83a6a0200               call 0x145920ed0
0x1458fa496: 4889da                   mov rdx, rbx
0x1458fa499: 483b9568130000           cmp rdx, qword ptr [rbp + 0x1368]
0x1458fa4a0: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458fa4a7: 7597                     jne 0x1458fa440
0x1458fa4a9: 4c89b578130000           mov qword ptr [rbp + 0x1378], r14
0x1458fa4b0: 498b8d80090000           mov rcx, qword ptr [r13 + 0x980]
0x1458fa4b7: 498b8588090000           mov rax, qword ptr [r13 + 0x988]
0x1458fa4be: 48898560130000           mov qword ptr [rbp + 0x1360], rax
0x1458fa4c5: 48c7858013000000000000   mov qword ptr [rbp + 0x1380], 0
0x1458fa4d0: 48898d48130000           mov qword ptr [rbp + 0x1348], rcx
0x1458fa4d7: 660f1f840000000000       nop word ptr [rax + rax]
0x1458fa4e0: 488b8580130000           mov rax, qword ptr [rbp + 0x1380]
0x1458fa4e7: 48398560130000           cmp qword ptr [rbp + 0x1360], rax
0x1458fa4ee: 741c                     je 0x1458fa50c
0x1458fa4f0: 48ffc0                   inc rax
0x1458fa4f3: 48898580130000           mov qword ptr [rbp + 0x1380], rax
0x1458fa4fa: 488db180090000           lea rsi, [rcx + 0x980]
0x1458fa501: e8da3e0c00               call 0x1459be3e0
0x1458fa506: 90                       nop
0x1458fa507: 4889f1                   mov rcx, rsi
0x1458fa50a: ebd4                     jmp 0x1458fa4e0
0x1458fa50c: 488bb578130000           mov rsi, qword ptr [rbp + 0x1378]
0x1458fa513: 488b06                   mov rax, qword ptr [rsi]
0x1458fa516: 4885c0                   test rax, rax
0x1458fa519: 4c8bad50130000           mov r13, qword ptr [rbp + 0x1350]
0x1458fa520: 7419                     je 0x1458fa53b
0x1458fa522: 498b8d80090000           mov rcx, qword ptr [r13 + 0x980]
0x1458fa529: 4869d080090000           imul rdx, rax, 0x980
0x1458fa530: 41b808000000             mov r8d, 8
0x1458fa536: e8957c70fa               call 0x1400021d0
0x1458fa53b: 488b8530090000           mov rax, qword ptr [rbp + 0x930]
0x1458fa542: 48894610                 mov qword ptr [rsi + 0x10], rax
0x1458fa546: 0f288520090000           movaps xmm0, xmmword ptr [rbp + 0x920]
0x1458fa54d: 0f1106                   movups xmmword ptr [rsi], xmm0
0x1458fa550: 488b55a0                 mov rdx, qword ptr [rbp - 0x60]
0x1458fa554: 4885d2                   test rdx, rdx
0x1458fa557: 7413                     je 0x1458fa56c
0x1458fa559: 488b4da8                 mov rcx, qword ptr [rbp - 0x58]
0x1458fa55d: 48c1e204                 shl rdx, 4
0x1458fa561: 41b808000000             mov r8d, 8
0x1458fa567: e8647c70fa               call 0x1400021d0
0x1458fa56c: 498b85780a0000           mov rax, qword ptr [r13 + 0xa78]
0x1458fa573: 48898510130000           mov qword ptr [rbp + 0x1310], rax
0x1458fa57a: 410f1085680a0000         movups xmm0, xmmword ptr [r13 + 0xa68]
0x1458fa582: 0f298500130000           movaps xmmword ptr [rbp + 0x1300], xmm0
0x1458fa589: 49c785680a000000000000   mov qword ptr [r13 + 0xa68], 0
0x1458fa594: 49c785700a000008000000   mov qword ptr [r13 + 0xa70], 8
0x1458fa59f: 49c785780a000000000000   mov qword ptr [r13 + 0xa78], 0
0x1458fa5aa: 418b852c0c0000           mov eax, dword ptr [r13 + 0xc2c]
0x1458fa5b1: 8985e8120000             mov dword ptr [rbp + 0x12e8], eax
0x1458fa5b7: 41c7852c0c000000000000   mov dword ptr [r13 + 0xc2c], 0
0x1458fa5c2: 498b8d900a0000           mov rcx, qword ptr [r13 + 0xa90]
0x1458fa5c9: 48898d30130000           mov qword ptr [rbp + 0x1330], rcx
0x1458fa5d0: 410f1085800a0000         movups xmm0, xmmword ptr [r13 + 0xa80]
0x1458fa5d8: 0f298520130000           movaps xmmword ptr [rbp + 0x1320], xmm0
0x1458fa5df: 49c785800a000000000000   mov qword ptr [r13 + 0xa80], 0
0x1458fa5ea: 49c785880a000008000000   mov qword ptr [r13 + 0xa88], 8
0x1458fa5f5: 49c785900a000000000000   mov qword ptr [r13 + 0xa90], 0
0x1458fa600: 488bbd10130000           mov rdi, qword ptr [rbp + 0x1310]
0x1458fa607: 4885ff                   test rdi, rdi
0x1458fa60a: 0f95c1                   setne cl
0x1458fa60d: 85c0                     test eax, eax
0x1458fa60f: 0f95c0                   setne al
0x1458fa612: 08c8                     or al, cl
0x1458fa614: 7531                     jne 0x1458fa647
0x1458fa616: 4883bd3013000000         cmp qword ptr [rbp + 0x1330], 0
0x1458fa61e: 0f840e030000             je 0x1458fa932
0x1458fa624: 488d8500130000           lea rax, [rbp + 0x1300]
0x1458fa62b: 488945a0                 mov qword ptr [rbp - 0x60], rax
0x1458fa62f: 488d85e8120000           lea rax, [rbp + 0x12e8]
0x1458fa636: 488945a8                 mov qword ptr [rbp - 0x58], rax
0x1458fa63a: 488d8520130000           lea rax, [rbp + 0x1320]
0x1458fa641: 488945b0                 mov qword ptr [rbp - 0x50], rax
0x1458fa645: eb7d                     jmp 0x1458fa6c4
0x1458fa647: 488b9d08130000           mov rbx, qword ptr [rbp + 0x1308]
0x1458fa64e: 488d8500130000           lea rax, [rbp + 0x1300]
0x1458fa655: 488945a0                 mov qword ptr [rbp - 0x60], rax
0x1458fa659: 488d85e8120000           lea rax, [rbp + 0x12e8]
0x1458fa660: 488945a8                 mov qword ptr [rbp - 0x58], rax
0x1458fa664: 488d8520130000           lea rax, [rbp + 0x1320]
0x1458fa66b: 488945b0                 mov qword ptr [rbp - 0x50], rax
0x1458fa66f: 4885ff                   test rdi, rdi
0x1458fa672: 7450                     je 0x1458fa6c4
0x1458fa674: 48c1e705                 shl rdi, 5
0x1458fa678: 4801df                   add rdi, rbx
0x1458fa67b: 488db520090000           lea rsi, [rbp + 0x920]
0x1458fa682: eb15                     jmp 0x1458fa699
0x1458fa684: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458fa690: 4883c320                 add rbx, 0x20
0x1458fa694: 4839fb                   cmp rbx, rdi
0x1458fa697: 742b                     je 0x1458fa6c4
0x1458fa699: 488b03                   mov rax, qword ptr [rbx]
0x1458fa69c: 493b85400b0000           cmp rax, qword ptr [r13 + 0xb40]
0x1458fa6a3: 74eb                     je 0x1458fa690
0x1458fa6a5: 488b5310                 mov rdx, qword ptr [rbx + 0x10]
0x1458fa6a9: 4c8b4318                 mov r8, qword ptr [rbx + 0x18]
0x1458fa6ad: 4889f1                   mov rcx, rsi
0x1458fa6b0: e84b85f5ff               call 0x145852c00
0x1458fa6b5: 90                       nop
0x1458fa6b6: 4c89e9                   mov rcx, r13
0x1458fa6b9: 4889f2                   mov rdx, rsi
0x1458fa6bc: e82f420200               call 0x14591e8f0
0x1458fa6c1: 90                       nop
0x1458fa6c2: ebcc                     jmp 0x1458fa690
0x1458fa6c4: 4180bd460c000004         cmp byte ptr [r13 + 0xc46], 4
0x1458fa6cc: 740d                     je 0x1458fa6db
0x1458fa6ce: 8b85e8120000             mov eax, dword ptr [rbp + 0x12e8]
0x1458fa6d4: 410185bc0b0000           add dword ptr [r13 + 0xbbc], eax
0x1458fa6db: 488bb530130000           mov rsi, qword ptr [rbp + 0x1330]
0x1458fa6e2: 4885f6                   test rsi, rsi
0x1458fa6e5: 7447                     je 0x1458fa72e
0x1458fa6e7: 488bbd28130000           mov rdi, qword ptr [rbp + 0x1328]
0x1458fa6ee: 48c1e604                 shl rsi, 4
0x1458fa6f2: 4801fe                   add rsi, rdi
0x1458fa6f5: eb12                     jmp 0x1458fa709
0x1458fa6f7: 660f1f840000000000       nop word ptr [rax + rax]
0x1458fa700: 4883c710                 add rdi, 0x10
0x1458fa704: 4839f7                   cmp rdi, rsi
0x1458fa707: 7425                     je 0x1458fa72e
0x1458fa709: 488b07                   mov rax, qword ptr [rdi]
0x1458fa70c: 493b85400b0000           cmp rax, qword ptr [r13 + 0xb40]
0x1458fa713: 74eb                     je 0x1458fa700
0x1458fa715: 4180bd330c000000         cmp byte ptr [r13 + 0xc33], 0
0x1458fa71d: 75e1                     jne 0x1458fa700
0x1458fa71f: 488b5708                 mov rdx, qword ptr [rdi + 8]
0x1458fa723: 4c89e9                   mov rcx, r13
0x1458fa726: e8c5110500               call 0x14594b8f0
0x1458fa72b: 90                       nop
0x1458fa72c: ebd2                     jmp 0x1458fa700
0x1458fa72e: 4c89e9                   mov rcx, r13
0x1458fa731: e80a690000               call 0x145901040
0x1458fa736: 90                       nop
0x1458fa737: 4983bd8809000000         cmp qword ptr [r13 + 0x988], 0
0x1458fa73f: 0f848b010000             je 0x1458fa8d0
0x1458fa745: 4d8db578090000           lea r14, [r13 + 0x978]
0x1458fa74c: 498b4610                 mov rax, qword ptr [r14 + 0x10]
0x1458fa750: 48898530090000           mov qword ptr [rbp + 0x930], rax
0x1458fa757: 410f1006                 movups xmm0, xmmword ptr [r14]
0x1458fa75b: 0f298520090000           movaps xmmword ptr [rbp + 0x920], xmm0
0x1458fa762: 49c7857809000000000000   mov qword ptr [r13 + 0x978], 0
0x1458fa76d: 49c7858009000008000000   mov qword ptr [r13 + 0x980], 8
0x1458fa778: 49c7858809000000000000   mov qword ptr [r13 + 0x988], 0
0x1458fa783: 4869853009000080090000   imul rax, qword ptr [rbp + 0x930], 0x980
0x1458fa78e: 488b9528090000           mov rdx, qword ptr [rbp + 0x928]
0x1458fa795: 4801d0                   add rax, rdx
0x1458fa798: 48898568130000           mov qword ptr [rbp + 0x1368], rax
0x1458fa79f: 31ff                     xor edi, edi
0x1458fa7a1: 488d75a0                 lea rsi, [rbp - 0x60]
0x1458fa7a5: 483b9568130000           cmp rdx, qword ptr [rbp + 0x1368]
0x1458fa7ac: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458fa7b3: 7474                     je 0x1458fa829
0x1458fa7b5: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
0x1458fa7c0: 48ffc7                   inc rdi
0x1458fa7c3: 4c89e9                   mov rcx, r13
0x1458fa7c6: e805670200               call 0x145920ed0
0x1458fa7cb: 4989bd400b0000           mov qword ptr [r13 + 0xb40], rdi
0x1458fa7d2: 498b8dd0020000           mov rcx, qword ptr [r13 + 0x2d0]
0x1458fa7d9: 498b95d8020000           mov rdx, qword ptr [r13 + 0x2d8]
0x1458fa7e0: 4989f0                   mov r8, rsi
0x1458fa7e3: 4d89e9                   mov r9, r13
0x1458fa7e6: e8e5d6fdff               call 0x1458d7ed0
0x1458fa7eb: 90                       nop
0x1458fa7ec: 4c89e9                   mov rcx, r13
0x1458fa7ef: e84c680000               call 0x145901040
0x1458fa7f4: 90                       nop
0x1458fa7f5: 488b9570130000           mov rdx, qword ptr [rbp + 0x1370]
0x1458fa7fc: 488d9a80090000           lea rbx, [rdx + 0x980]
0x1458fa803: 49c785400b000000000000   mov qword ptr [r13 + 0xb40], 0
0x1458fa80e: 4c89e9                   mov rcx, r13
0x1458fa811: e8ba660200               call 0x145920ed0
0x1458fa816: 4889da                   mov rdx, rbx
0x1458fa819: 483b9568130000           cmp rdx, qword ptr [rbp + 0x1368]
0x1458fa820: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458fa827: 7597                     jne 0x1458fa7c0
0x1458fa829: 4c89b578130000           mov qword ptr [rbp + 0x1378], r14
0x1458fa830: 498b8d80090000           mov rcx, qword ptr [r13 + 0x980]
0x1458fa837: 498b8588090000           mov rax, qword ptr [r13 + 0x988]
0x1458fa83e: 48898560130000           mov qword ptr [rbp + 0x1360], rax
0x1458fa845: 48c7858013000000000000   mov qword ptr [rbp + 0x1380], 0
0x1458fa850: 48898d48130000           mov qword ptr [rbp + 0x1348], rcx
0x1458fa857: 660f1f840000000000       nop word ptr [rax + rax]
0x1458fa860: 488b8580130000           mov rax, qword ptr [rbp + 0x1380]
0x1458fa867: 48398560130000           cmp qword ptr [rbp + 0x1360], rax
0x1458fa86e: 741c                     je 0x1458fa88c
0x1458fa870: 48ffc0                   inc rax
0x1458fa873: 48898580130000           mov qword ptr [rbp + 0x1380], rax
0x1458fa87a: 488db180090000           lea rsi, [rcx + 0x980]
0x1458fa881: e85a3b0c00               call 0x1459be3e0
0x1458fa886: 90                       nop
0x1458fa887: 4889f1                   mov rcx, rsi
0x1458fa88a: ebd4                     jmp 0x1458fa860
0x1458fa88c: 488bb578130000           mov rsi, qword ptr [rbp + 0x1378]
0x1458fa893: 488b06                   mov rax, qword ptr [rsi]
0x1458fa896: 4885c0                   test rax, rax
0x1458fa899: 4c8bad50130000           mov r13, qword ptr [rbp + 0x1350]
0x1458fa8a0: 7419                     je 0x1458fa8bb
0x1458fa8a2: 498b8d80090000           mov rcx, qword ptr [r13 + 0x980]
0x1458fa8a9: 4869d080090000           imul rdx, rax, 0x980
0x1458fa8b0: 41b808000000             mov r8d, 8
0x1458fa8b6: e8157970fa               call 0x1400021d0
0x1458fa8bb: 488b8530090000           mov rax, qword ptr [rbp + 0x930]
0x1458fa8c2: 48894610                 mov qword ptr [rsi + 0x10], rax
0x1458fa8c6: 0f288520090000           movaps xmm0, xmmword ptr [rbp + 0x920]
0x1458fa8cd: 0f1106                   movups xmmword ptr [rsi], xmm0
0x1458fa8d0: 488b9520130000           mov rdx, qword ptr [rbp + 0x1320]
0x1458fa8d7: 4885d2                   test rdx, rdx
0x1458fa8da: 7416                     je 0x1458fa8f2
0x1458fa8dc: 488b8d28130000           mov rcx, qword ptr [rbp + 0x1328]
0x1458fa8e3: 48c1e204                 shl rdx, 4
0x1458fa8e7: 41b808000000             mov r8d, 8
0x1458fa8ed: e8de7870fa               call 0x1400021d0
0x1458fa8f2: 488bb510130000           mov rsi, qword ptr [rbp + 0x1310]
0x1458fa8f9: 4885f6                   test rsi, rsi
0x1458fa8fc: 0f8490000000             je 0x1458fa992
0x1458fa902: 488bbd08130000           mov rdi, qword ptr [rbp + 0x1308]
0x1458fa909: 4883c710                 add rdi, 0x10
0x1458fa90d: eb0a                     jmp 0x1458fa919
0x1458fa90f: 90                       nop
0x1458fa910: 4883c720                 add rdi, 0x20
0x1458fa914: 48ffce                   dec rsi
0x1458fa917: 7479                     je 0x1458fa992
0x1458fa919: 488b57f8                 mov rdx, qword ptr [rdi - 8]
0x1458fa91d: 4885d2                   test rdx, rdx
0x1458fa920: 74ee                     je 0x1458fa910
0x1458fa922: 488b0f                   mov rcx, qword ptr [rdi]
0x1458fa925: 41b801000000             mov r8d, 1
0x1458fa92b: e8a07870fa               call 0x1400021d0
0x1458fa930: ebde                     jmp 0x1458fa910
0x1458fa932: 488b9520130000           mov rdx, qword ptr [rbp + 0x1320]
0x1458fa939: 4885d2                   test rdx, rdx
0x1458fa93c: 7454                     je 0x1458fa992
0x1458fa93e: 488b8d28130000           mov rcx, qword ptr [rbp + 0x1328]
0x1458fa945: 48c1e204                 shl rdx, 4
0x1458fa949: 41b808000000             mov r8d, 8
0x1458fa94f: e87c7870fa               call 0x1400021d0
0x1458fa954: 488bb510130000           mov rsi, qword ptr [rbp + 0x1310]
0x1458fa95b: 4885f6                   test rsi, rsi
0x1458fa95e: 7432                     je 0x1458fa992
0x1458fa960: 488bbd08130000           mov rdi, qword ptr [rbp + 0x1308]
0x1458fa967: 4883c710                 add rdi, 0x10
0x1458fa96b: eb0c                     jmp 0x1458fa979
0x1458fa96d: 0f1f00                   nop dword ptr [rax]
0x1458fa970: 4883c720                 add rdi, 0x20
0x1458fa974: 48ffce                   dec rsi
0x1458fa977: 7419                     je 0x1458fa992
0x1458fa979: 488b57f8                 mov rdx, qword ptr [rdi - 8]
0x1458fa97d: 4885d2                   test rdx, rdx
0x1458fa980: 74ee                     je 0x1458fa970
0x1458fa982: 488b0f                   mov rcx, qword ptr [rdi]
0x1458fa985: 41b801000000             mov r8d, 1
0x1458fa98b: e8407870fa               call 0x1400021d0
0x1458fa990: ebde                     jmp 0x1458fa970
0x1458fa992: 488b9500130000           mov rdx, qword ptr [rbp + 0x1300]
0x1458fa999: 4885d2                   test rdx, rdx
0x1458fa99c: 7416                     je 0x1458fa9b4
0x1458fa99e: 488b8d08130000           mov rcx, qword ptr [rbp + 0x1308]
0x1458fa9a5: 48c1e205                 shl rdx, 5
0x1458fa9a9: 41b808000000             mov r8d, 8
0x1458fa9af: e81c7870fa               call 0x1400021d0
