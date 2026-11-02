; Selected0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Exact native health/actor-membership branches; original function bounds in manifest.
; Native range 0x145901216..0x145901289
0x145901216: 80be410c000001           cmp byte ptr [rsi + 0xc41], 1
0x14590121d: 752e                     jne 0x14590124d
0x14590121f: 488b8ea8020000           mov rcx, qword ptr [rsi + 0x2a8]
0x145901226: 488b96b0020000           mov rdx, qword ptr [rsi + 0x2b0]
0x14590122d: e8ae83f0ff               call 0x1458095e0
0x145901232: 31c9                     xor ecx, ecx
0x145901234: 83f803                   cmp eax, 3
0x145901237: 0f92c1                   setb cl
0x14590123a: 488b86500b0000           mov rax, qword ptr [rsi + 0xb50]
0x145901241: 48ffc8                   dec rax
0x145901244: 7810                     js 0x145901256
0x145901246: f3480f2ac0               cvtsi2ss xmm0, rax
0x14590124b: eb1e                     jmp 0x14590126b
0x14590124d: 0f28356cec5d00           movaps xmm6, xmmword ptr [rip + 0x5dec6c] ; 0x145edfec0 0000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f6473657479626465740000000000000000
0x145901254: eb33                     jmp 0x145901289
0x145901256: 4889c2                   mov rdx, rax
0x145901259: 48d1ea                   shr rdx, 1
0x14590125c: 83e001                   and eax, 1
0x14590125f: 4809d0                   or rax, rdx
0x145901262: f3480f2ac0               cvtsi2ss xmm0, rax
0x145901267: f30f58c0                 addss xmm0, xmm0
0x14590126b: 488d055eb87301           lea rax, [rip + 0x173b85e] ; 0x14703cad0 0000803f3333333f2f72757374632f343861323239636561656664343938356335303939306231343131366236643835366166303938352f6c6962726172795c636f72655c737263
0x145901272: f30f590488               mulss xmm0, dword ptr [rax + rcx*4]
0x145901277: f30f12f0                 movsldup xmm6, xmm0
0x14590127b: 0f59352ee0a201           mulps xmm6, xmmword ptr [rip + 0x1a2e02e] ; 0x14732f2b0 6666663f6666a63f00000000000000000000f0c2cdcc0c4000000000000000000000803f0000803fcdcc4c3d000000400000803f0000104100000000000000000000e040000020c1
0x145901282: 0f583537ec5d00           addps xmm6, xmmword ptr [rip + 0x5dec37] ; 0x145edfec0 0000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f6473657479626465740000000000000000
; Native range 0x1459015e8..0x1459017ab
0x1459015e8: 80be410c000001           cmp byte ptr [rsi + 0xc41], 1
0x1459015ef: 758b                     jne 0x14590157c
0x1459015f1: 488b8ea8020000           mov rcx, qword ptr [rsi + 0x2a8]
0x1459015f8: 488b96b0020000           mov rdx, qword ptr [rsi + 0x2b0]
0x1459015ff: e8dc7ff0ff               call 0x1458095e0
0x145901604: 31c9                     xor ecx, ecx
0x145901606: 83f803                   cmp eax, 3
0x145901609: 0f92c1                   setb cl
0x14590160c: 488b86500b0000           mov rax, qword ptr [rsi + 0xb50]
0x145901613: 48ffc8                   dec rax
0x145901616: 780a                     js 0x145901622
0x145901618: 0f57c0                   xorps xmm0, xmm0
0x14590161b: f3480f2ac0               cvtsi2ss xmm0, rax
0x145901620: eb18                     jmp 0x14590163a
0x145901622: 4889c2                   mov rdx, rax
0x145901625: 48d1ea                   shr rdx, 1
0x145901628: 83e001                   and eax, 1
0x14590162b: 4809d0                   or rax, rdx
0x14590162e: 0f57c0                   xorps xmm0, xmm0
0x145901631: f3480f2ac0               cvtsi2ss xmm0, rax
0x145901636: f30f58c0                 addss xmm0, xmm0
0x14590163a: 488d058fb47301           lea rax, [rip + 0x173b48f] ; 0x14703cad0 0000803f3333333f2f72757374632f343861323239636561656664343938356335303939306231343131366236643835366166303938352f6c6962726172795c636f72655c737263
0x145901641: f30f590488               mulss xmm0, dword ptr [rax + rcx*4]
0x145901646: f30f12f8                 movsldup xmm7, xmm0
0x14590164a: 0f593d5fdca201           mulps xmm7, xmmword ptr [rip + 0x1a2dc5f] ; 0x14732f2b0 6666663f6666a63f00000000000000000000f0c2cdcc0c4000000000000000000000803f0000803fcdcc4c3d000000400000803f0000104100000000000000000000e040000020c1
0x145901651: 0f583d68e85d00           addps xmm7, xmmword ptr [rip + 0x5de868] ; 0x145edfec0 0000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f6473657479626465740000000000000000
0x145901658: f3440f16c7               movshdup xmm8, xmm7
0x14590165d: f30f5efe                 divss xmm7, xmm6
0x145901661: f30f16c6                 movshdup xmm0, xmm6
0x145901665: f30f100dabe85d00         movss xmm1, dword ptr [rip + 0x5de8ab] ; 0x145edff18 000080bf000000000000000000000000ffffffffffffffff617a65726f74687375727669766f72735e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e4692e1a6a0abb2709c2e5c3a3fe773bd
0x14590166d: f30f58cf                 addss xmm1, xmm7
0x145901671: 0f540d08415e00           andps xmm1, xmmword ptr [rip + 0x5e4108] ; 0x145ee5780 ffffff7fffffff7fffffff7fffffff7facc5273700000000000000000000000058585858585858585858585858585858f23ecf574cab3317cb177f46442899b0b855982d1fe1d55b
0x145901678: f3440f5ec0               divss xmm8, xmm0
0x14590167d: f30f10059fce6b00         movss xmm0, dword ptr [rip + 0x6bce9f] ; 0x145fbe524 17b7d1388aab2a3e000000000000000000004e40faa44f3f000000000000003f0000803fd9cef753e3a5bbbf5c8fc2f5285cef3f000000000088c340aaaac23f00000000000020c0
0x145901685: 0f2ec1                   ucomiss xmm0, xmm1
0x145901688: 761d                     jbe 0x1459016a7
0x14590168a: f30f100d86e85d00         movss xmm1, dword ptr [rip + 0x5de886] ; 0x145edff18 000080bf000000000000000000000000ffffffffffffffff617a65726f74687375727669766f72735e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e4692e1a6a0abb2709c2e5c3a3fe773bd
0x145901692: f3410f58c8               addss xmm1, xmm8
0x145901697: 0f540de2405e00           andps xmm1, xmmword ptr [rip + 0x5e40e2] ; 0x145ee5780 ffffff7fffffff7fffffff7fffffff7facc5273700000000000000000000000058585858585858585858585858585858f23ecf574cab3317cb177f46442899b0b855982d1fe1d55b
0x14590169e: 0f2ec1                   ucomiss xmm0, xmm1
0x1459016a1: 0f879a020000             ja 0x145901941
0x1459016a7: c785d812000000000000     mov dword ptr [rbp + 0x12d8], 0
0x1459016b1: 48c785c012000000000000   mov qword ptr [rbp + 0x12c0], 0
0x1459016bc: 48c785c812000001000000   mov qword ptr [rbp + 0x12c8], 1
0x1459016c7: 48c785d012000000000000   mov qword ptr [rbp + 0x12d0], 0
0x1459016d2: 4c8ba678050000           mov r12, qword ptr [rsi + 0x578]
0x1459016d9: 4c69be80050000e0010000   imul r15, qword ptr [rsi + 0x580], 0x1e0
0x1459016e4: 4d01e7                   add r15, r12
0x1459016e7: 0f57f6                   xorps xmm6, xmm6
0x1459016ea: f3440f100dbde75d00       movss xmm9, dword ptr [rip + 0x5de7bd] ; 0x145edfeb0 0000803f0000000000000000000000000000803f0000803f000000000000000047a086257ea1b0f50c0b614ebeee215b75657370656d6f736172656e6567796c6d6f646e61726f64
0x1459016f3: f3440f1015b8f45f00       movss xmm10, dword ptr [rip + 0x5ff4b8] ; 0x145f00bb4 ffff7f4f6666e6be000000003ced8ec2cbc09dbff3f3fe9366c3ff7ceabda8935c9e9d2b8de3999b170ce6a13f110370385f36050b44e874c862d90f7bcdde9dd019c49d16b6a945
0x1459016fc: bbffffffff               mov ebx, 0xffffffff
0x145901701: 488dbd20090000           lea rdi, [rbp + 0x920]
0x145901708: 4d39fc                   cmp r12, r15
0x14590170b: 0f848d010000             je 0x14590189e
0x145901711: 4981c4e0010000           add r12, 0x1e0
0x145901718: 0f1f840000000000         nop dword ptr [rax + rax]
0x145901720: f3410f104c2480           movss xmm1, dword ptr [r12 - 0x80]
0x145901727: 0f2ece                   ucomiss xmm1, xmm6
0x14590172a: 7714                     ja 0x145901740
0x14590172c: 4d39fc                   cmp r12, r15
0x14590172f: 4d8da424e0010000         lea r12, [r12 + 0x1e0]
0x145901737: 75e7                     jne 0x145901720
0x145901739: e960010000               jmp 0x14590189e
0x14590173e: 6690                     nop
0x145901740: 4983bc2438feffffff       cmp qword ptr [r12 - 0x1c8], -1
0x145901749: 410f28d0                 movaps xmm2, xmm8
0x14590174d: 7521                     jne 0x145901770
0x14590174f: 4983bc2478feffffff       cmp qword ptr [r12 - 0x188], -1
0x145901758: 410f28d0                 movaps xmm2, xmm8
0x14590175c: 7512                     jne 0x145901770
0x14590175e: 0f28d7                   movaps xmm2, xmm7
0x145901761: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145901770: f3410f10442484           movss xmm0, dword ptr [r12 - 0x7c]
0x145901777: f30f59c2                 mulss xmm0, xmm2
0x14590177b: f3410f5fc1               maxss xmm0, xmm9
0x145901780: f3410f11442484           movss dword ptr [r12 - 0x7c], xmm0
0x145901787: 410f2ec1                 ucomiss xmm0, xmm9
0x14590178b: 0f82ea010000             jb 0x14590197b
0x145901791: f30f59ca                 mulss xmm1, xmm2
0x145901795: 410f28d1                 movaps xmm2, xmm9
0x145901799: f30f5fd1                 maxss xmm2, xmm1
0x14590179d: 0f28c8                   movaps xmm1, xmm0
0x1459017a0: f30f5dca                 minss xmm1, xmm2
0x1459017a4: f3410f114c2480           movss dword ptr [r12 - 0x80], xmm1
; Native range 0x1459017c6..0x14590181d
0x1459017c6: f34c0f2cc0               cvttss2si r8, xmm0
0x1459017cb: 0f2ec6                   ucomiss xmm0, xmm6
0x1459017ce: b800000000               mov eax, 0
0x1459017d3: 440f42c0                 cmovb r8d, eax
0x1459017d7: 410f2ec2                 ucomiss xmm0, xmm10
0x1459017db: 440f47c3                 cmova r8d, ebx
0x1459017df: 4889f9                   mov rcx, rdi
0x1459017e2: 66ba1c00                 mov dx, 0x1c
0x1459017e6: e8057bf0ff               call 0x1458092f0
0x1459017eb: 90                       nop
0x1459017ec: f3410f10442480           movss xmm0, dword ptr [r12 - 0x80]
0x1459017f3: e8632e4100               call 0x145d1465b
0x1459017f8: f34c0f2cc0               cvttss2si r8, xmm0
0x1459017fd: 0f2ec6                   ucomiss xmm0, xmm6
0x145901800: b800000000               mov eax, 0
0x145901805: 440f42c0                 cmovb r8d, eax
0x145901809: 410f2ec2                 ucomiss xmm0, xmm10
0x14590180d: 440f47c3                 cmova r8d, ebx
0x145901811: 4889f9                   mov rcx, rdi
0x145901814: 66ba1600                 mov dx, 0x16
0x145901818: e8d37af0ff               call 0x1458092f0
