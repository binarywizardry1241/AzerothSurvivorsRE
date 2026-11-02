; Target0.119.0 SHA256 6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f
; Preferred PE addresses; exact instructions independently decoded with Capstone 5.0.7

; tranquility-pulse-and-critical
145bc5784: 488b9650080000                   mov rdx, qword ptr [rsi + 0x850]
145bc578b: 4885d2                           test rdx, rdx
145bc578e: 0f84bd020000                     je 0x145bc5a51
145bc5794: f30f1086dc0b0000                 movss xmm0, dword ptr [rsi + 0xbdc]
145bc579c: 488b8648080000                   mov rax, qword ptr [rsi + 0x848]
145bc57a3: 48c1e206                         shl rdx, 6
145bc57a7: 31c9                             xor ecx, ecx
145bc57a9: 4531f6                           xor r14d, r14d
145bc57ac: 0f1f4000                         nop dword ptr [rax]
145bc57b0: 803c0815                         cmp byte ptr [rax + rcx], 0x15
145bc57b4: 7411                             je 0x145bc57c7
145bc57b6: 49ffc6                           inc r14
145bc57b9: 4883c140                         add rcx, 0x40
145bc57bd: 4839ca                           cmp rdx, rcx
145bc57c0: 75ee                             jne 0x145bc57b0
145bc57c2: e98a020000                       jmp 0x145bc5a51
145bc57c7: f30f108ea4010000                 movss xmm1, dword ptr [rsi + 0x1a4]
145bc57cf: 0f2ec8                           ucomiss xmm1, xmm0
145bc57d2: 0f8779020000                     ja 0x145bc5a51
145bc57d8: f3440f1086a0010000               movss xmm8, dword ptr [rsi + 0x1a0]
145bc57e1: f30f100dabe35900                 movss xmm1, dword ptr [rip + 0x59e3ab]
145bc57e9: 410f2ec8                         ucomiss xmm1, xmm8
145bc57ed: 0f875e020000                     ja 0x145bc5a51
145bc57f3: f30f10740804                     movss xmm6, dword ptr [rax + rcx + 4]
145bc57f9: 8b7c080c                         mov edi, dword ptr [rax + rcx + 0xc]
145bc57fd: f30f105c0808                     movss xmm3, dword ptr [rax + rcx + 8]
145bc5803: f30f580589e35900                 addss xmm0, dword ptr [rip + 0x59e389]
145bc580b: f30f1186a4010000                 movss dword ptr [rsi + 0x1a4], xmm0
145bc5813: c786a001000000000000             mov dword ptr [rsi + 0x1a0], 0
145bc581d: 8b86f8040000                     mov eax, dword ptr [rsi + 0x4f8]
145bc5823: 894548                           mov dword ptr [rbp + 0x48], eax
145bc5826: 488b86f0040000                   mov rax, qword ptr [rsi + 0x4f0]
145bc582d: 48894540                         mov qword ptr [rbp + 0x40], rax
145bc5831: 48c744242800000000               mov qword ptr [rsp + 0x28], 0
145bc583a: 48c744242008000000               mov qword ptr [rsp + 0x20], 8
145bc5843: 488d8de0000000                   lea rcx, [rbp + 0xe0]
145bc584a: 4c8d4540                         lea r8, [rbp + 0x40]
145bc584e: 4889f2                           mov rdx, rsi
145bc5851: e86aacffff                       call 0x145bc04c0
145bc5856: 85ff                             test edi, edi
145bc5858: 0f84ad000000                     je 0x145bc590b
145bc585e: 488b9688040000                   mov rdx, qword ptr [rsi + 0x488]
145bc5865: 4c8b8de8000000                   mov r9, qword ptr [rbp + 0xe8]
145bc586c: 488b9df0000000                   mov rbx, qword ptr [rbp + 0xf0]
145bc5873: c785c000000002000000             mov dword ptr [rbp + 0xc0], 2
145bc587d: c785a800000000000000             mov dword ptr [rbp + 0xa8], 0
145bc5887: 4c894dd8                         mov qword ptr [rbp - 0x28], r9
145bc588b: c685ff00000001                   mov byte ptr [rbp + 0xff], 1
145bc5892: 488d85a8000000                   lea rax, [rbp + 0xa8]
145bc5899: 4889442430                       mov qword ptr [rsp + 0x30], rax
145bc589e: 488d85c0000000                   lea rax, [rbp + 0xc0]
145bc58a5: 4889442428                       mov qword ptr [rsp + 0x28], rax
145bc58aa: 48895c2420                       mov qword ptr [rsp + 0x20], rbx
145bc58af: 488d4d40                         lea rcx, [rbp + 0x40]
145bc58b3: 4189f8                           mov r8d, edi
145bc58b6: 4c898db8000000                   mov qword ptr [rbp + 0xb8], r9
145bc58bd: e83e6bfaff                       call 0x145b6c400
145bc58c2: 90                               nop
145bc58c3: 488bbe50060000                   mov rdi, qword ptr [rsi + 0x650]
145bc58ca: 483bbe40060000                   cmp rdi, qword ptr [rsi + 0x640]
145bc58d1: 750d                             jne 0x145bc58e0
145bc58d3: 488d8e40060000                   lea rcx, [rsi + 0x640]
145bc58da: e851f03c00                       call 0x145f94930
145bc58df: 90                               nop
145bc58e0: 488b8648060000                   mov rax, qword ptr [rsi + 0x648]
145bc58e7: 4889f9                           mov rcx, rdi
145bc58ea: 48c1e105                         shl rcx, 5
145bc58ee: 0f104540                         movups xmm0, xmmword ptr [rbp + 0x40]
145bc58f2: 0f104d50                         movups xmm1, xmmword ptr [rbp + 0x50]
145bc58f6: 0f114c0810                       movups xmmword ptr [rax + rcx + 0x10], xmm1
145bc58fb: 0f110408                         movups xmmword ptr [rax + rcx], xmm0
145bc58ff: 48ffc7                           inc rdi
145bc5902: 4889be50060000                   mov qword ptr [rsi + 0x650], rdi
145bc5909: eb15                             jmp 0x145bc5920
145bc590b: 488b85e8000000                   mov rax, qword ptr [rbp + 0xe8]
145bc5912: 488985b8000000                   mov qword ptr [rbp + 0xb8], rax
145bc5919: 488b9df0000000                   mov rbx, qword ptr [rbp + 0xf0]
145bc5920: 0f107e20                         movups xmm7, xmmword ptr [rsi + 0x20]
145bc5924: 48c7462001000000                 mov qword ptr [rsi + 0x20], 1
145bc592c: 4c897628                         mov qword ptr [rsi + 0x28], r14
145bc5930: 488b85e0000000                   mov rax, qword ptr [rbp + 0xe0]
145bc5937: 48894530                         mov qword ptr [rbp + 0x30], rax
145bc593b: 4885db                           test rbx, rbx
145bc593e: 0f84ea000000                     je 0x145bc5a2e
145bc5944: 48c1e303                         shl rbx, 3
145bc5948: f3410f59f0                       mulss xmm6, xmm8
145bc594d: 0fb6bead010000                   movzx edi, byte ptr [rsi + 0x1ad]
145bc5954: 4531f6                           xor r14d, r14d
145bc5957: f3440f100580106800               movss xmm8, dword ptr [rip + 0x681080]
145bc5960: 488b85b8000000                   mov rax, qword ptr [rbp + 0xb8]
145bc5967: 4a8b1430                         mov rdx, qword ptr [rax + r14]
145bc596b: 488b86280b0000                   mov rax, qword ptr [rsi + 0xb28]
145bc5972: 488b8e400b0000                   mov rcx, qword ptr [rsi + 0xb40]
145bc5979: 4c8d0401                         lea r8, [rcx + rax]
145bc597d: 49c1c017                         rol r8, 0x17
145bc5981: 4901c0                           add r8, rax
145bc5984: 4c8b8e300b0000                   mov r9, qword ptr [rsi + 0xb30]
145bc598b: 4d89ca                           mov r10, r9
145bc598e: 49c1e211                         shl r10, 0x11
145bc5992: 4c8b9e380b0000                   mov r11, qword ptr [rsi + 0xb38]
145bc5999: 4931c3                           xor r11, rax
145bc599c: 4c31c9                           xor rcx, r9
145bc599f: 4d31d9                           xor r9, r11
145bc59a2: 4c898e300b0000                   mov qword ptr [rsi + 0xb30], r9
145bc59a9: 4831c8                           xor rax, rcx
145bc59ac: 488986280b0000                   mov qword ptr [rsi + 0xb28], rax
145bc59b3: 4d31d3                           xor r11, r10
145bc59b6: 4c899e380b0000                   mov qword ptr [rsi + 0xb38], r11
145bc59bd: 48c1c12d                         rol rcx, 0x2d
145bc59c1: 48898e400b0000                   mov qword ptr [rsi + 0xb40], rcx
145bc59c8: 49c1e828                         shr r8, 0x28
145bc59cc: 0f57c0                           xorps xmm0, xmm0
145bc59cf: f3410f2ac0                       cvtsi2ss xmm0, r8d
145bc59d4: f3410f59c0                       mulss xmm0, xmm8
145bc59d9: f30f108eac040000                 movss xmm1, dword ptr [rsi + 0x4ac]
145bc59e1: f30f1096b0040000                 movss xmm2, dword ptr [rsi + 0x4b0]
145bc59e9: f30f59d6                         mulss xmm2, xmm6
145bc59ed: c686ad01000003                   mov byte ptr [rsi + 0x1ad], 3
145bc59f4: 0f2ec8                           ucomiss xmm1, xmm0
145bc59f7: 7703                             ja 0x145bc59fc
145bc59f9: 0f28d6                           movaps xmm2, xmm6
145bc59fc: 0f97442428                       seta byte ptr [rsp + 0x28]
145bc5a01: c644243000                       mov byte ptr [rsp + 0x30], 0
145bc5a06: c644242003                       mov byte ptr [rsp + 0x20], 3
145bc5a0b: 4889f1                           mov rcx, rsi
145bc5a0e: 41b9e4020000                     mov r9d, 0x2e4
145bc5a14: e8070a0100                       call 0x145bd6420
145bc5a19: 90                               nop
145bc5a1a: 4088bead010000                   mov byte ptr [rsi + 0x1ad], dil
145bc5a21: 4983c608                         add r14, 8
145bc5a25: 4c39f3                           cmp rbx, r14
145bc5a28: 0f8532ffffff                     jne 0x145bc5960
145bc5a2e: 488b5530                         mov rdx, qword ptr [rbp + 0x30]
145bc5a32: 4885d2                           test rdx, rdx
145bc5a35: 7416                             je 0x145bc5a4d
145bc5a37: 48c1e203                         shl rdx, 3
145bc5a3b: 41b808000000                     mov r8d, 8
145bc5a41: 488b8db8000000                   mov rcx, qword ptr [rbp + 0xb8]
145bc5a48: e883c743fa                       call 0x1400021d0
145bc5a4d: 0f117e20                         movups xmmword ptr [rsi + 0x20], xmm7

; proc-kind-three-gate
145bd983b: 4c8b9d78010000                   mov r11, qword ptr [rbp + 0x178]
145bd9842: 450fb6b3ad010000                 movzx r14d, byte ptr [r11 + 0x1ad]
145bd984a: 4180fe03                         cmp r14b, 3
145bd984e: 745a                             je 0x145bd98aa
145bd9850: 4983bb5008000000                 cmp qword ptr [r11 + 0x850], 0
145bd9858: 7450                             je 0x145bd98aa

; local-hot-cast
145bbc25d: f3440f10666c                     movss xmm12, dword ptr [rsi + 0x6c]
145bbc263: f30f108708050000                 movss xmm0, dword ptr [rdi + 0x508]
145bbc26b: f30f100d25e55b00                 movss xmm1, dword ptr [rip + 0x5be525]
145bbc273: f30f59cf                         mulss xmm1, xmm7
145bbc277: 0f2ec1                           ucomiss xmm0, xmm1
145bbc27a: 7610                             jbe 0x145bbc28c
145bbc27c: 4889f9                           mov rcx, rdi
145bbc27f: e8ec9bfcff                       call 0x145b85e70
145bbc284: 84c0                             test al, al
145bbc286: 0f844fe6ffff                     je 0x145bba8db
145bbc28c: f3450f59cb                       mulss xmm9, xmm11
145bbc291: 0f57d2                           xorps xmm2, xmm2
145bbc294: f3410f51d1                       sqrtss xmm2, xmm9
145bbc299: f30f5915c37e5a00                 mulss xmm2, dword ptr [rip + 0x5a7ec3]
145bbc2a1: f3410f59fc                       mulss xmm7, xmm12
145bbc2a6: f30f59fa                         mulss xmm7, xmm2
145bbc2aa: 8b5640                           mov edx, dword ptr [rsi + 0x40]
145bbc2ad: f3410f59d4                       mulss xmm2, xmm12
145bbc2b2: 4889f9                           mov rcx, rdi
145bbc2b5: 410f28d8                         movaps xmm3, xmm8
145bbc2b9: e8b28ffcff                       call 0x145b85270
145bbc2be: 4c8db740060000                   lea r14, [rdi + 0x640]
145bbc2c5: 488b9788040000                   mov rdx, qword ptr [rdi + 0x488]
145bbc2cc: 448b4640                         mov r8d, dword ptr [rsi + 0x40]
145bbc2d0: 48899500010000                   mov qword ptr [rbp + 0x100], rdx
145bbc2d7: c7852801000002000000             mov dword ptr [rbp + 0x128], 2
145bbc2e1: c7455000000000                   mov dword ptr [rbp + 0x50], 0
145bbc2e8: 488d4550                         lea rax, [rbp + 0x50]
145bbc2ec: 4889442430                       mov qword ptr [rsp + 0x30], rax
145bbc2f1: 488d8528010000                   lea rax, [rbp + 0x128]
145bbc2f8: 4889442428                       mov qword ptr [rsp + 0x28], rax
145bbc2fd: 48c744242001000000               mov qword ptr [rsp + 0x20], 1
145bbc306: 4c8d7d70                         lea r15, [rbp + 0x70]
145bbc30a: 4c8d8d00010000                   lea r9, [rbp + 0x100]
145bbc311: 4c89f9                           mov rcx, r15
145bbc314: e8e700fbff                       call 0x145b6c400
145bbc319: 4c89f1                           mov rcx, r14
145bbc31c: 4c89fa                           mov rdx, r15
145bbc31f: e83c1df6ff                       call 0x145b1e060
145bbc324: f30f104658                       movss xmm0, dword ptr [rsi + 0x58]
145bbc329: 0f57c9                           xorps xmm1, xmm1
145bbc32c: 0f2ec1                           ucomiss xmm0, xmm1
145bbc32f: 0f869c000000                     jbe 0x145bbc3d1
145bbc335: 817e4006030000                   cmp dword ptr [rsi + 0x40], 0x306
145bbc33c: 0f948528010000                   sete byte ptr [rbp + 0x128]
145bbc343: 4c8db7a8030000                   lea r14, [rdi + 0x3a8]
145bbc34a: 4c8d8528010000                   lea r8, [rbp + 0x128]
145bbc351: 4c89f1                           mov rcx, r14
145bbc354: 4889f2                           mov rdx, rsi
145bbc357: e8f4480600                       call 0x145c20c50
145bbc35c: 8b7640                           mov esi, dword ptr [rsi + 0x40]
145bbc35f: 488d4d70                         lea rcx, [rbp + 0x70]
145bbc363: 4c89e2                           mov rdx, r12
145bbc366: e835ebfcff                       call 0x145b8aea0
145bbc36b: f3440f58d6                       addss xmm10, xmm6
145bbc370: 4889f8                           mov rax, rdi
145bbc373: 488bbfb8030000                   mov rdi, qword ptr [rdi + 0x3b8]
145bbc37a: 483bb8a8030000                   cmp rdi, qword ptr [rax + 0x3a8]
145bbc381: 7508                             jne 0x145bbc38b
145bbc383: 4c89f1                           mov rcx, r14
145bbc386: e8a5853d00                       call 0x145f94930
145bbc38b: 488b8d58010000                   mov rcx, qword ptr [rbp + 0x158]
145bbc392: 488b81b0030000                   mov rax, qword ptr [rcx + 0x3b0]
145bbc399: 4989f8                           mov r8, rdi
145bbc39c: 49c1e005                         shl r8, 5
145bbc3a0: 4ac7040000000000                 mov qword ptr [rax + r8], 0
145bbc3a8: 488b5570                         mov rdx, qword ptr [rbp + 0x70]
145bbc3ac: 4a89540008                       mov qword ptr [rax + r8 + 8], rdx
145bbc3b1: 8b5578                           mov edx, dword ptr [rbp + 0x78]
145bbc3b4: 4289540010                       mov dword ptr [rax + r8 + 0x10], edx
145bbc3b9: 4289740014                       mov dword ptr [rax + r8 + 0x14], esi
145bbc3be: f3460f11540018                   movss dword ptr [rax + r8 + 0x18], xmm10
145bbc3c5: f3420f117c001c                   movss dword ptr [rax + r8 + 0x1c], xmm7
145bbc3cc: e932f8ffff                       jmp 0x145bbbc03

; local-hot-prune
145c20c50: 56                               push rsi
145c20c51: 4c8b4910                         mov r9, qword ptr [rcx + 0x10]
145c20c55: 4d85c9                           test r9, r9
145c20c58: 0f8481010000                     je 0x145c20ddf
145c20c5e: 488b4108                         mov rax, qword ptr [rcx + 8]
145c20c62: 8b5240                           mov edx, dword ptr [rdx + 0x40]
145c20c65: 450fb610                         movzx r10d, byte ptr [r8]
145c20c69: 41f6c201                         test r10b, 1
145c20c6d: 0f8450010000                     je 0x145c20dc3
145c20c73: 4531c0                           xor r8d, r8d
145c20c76: 4989c3                           mov r11, rax
145c20c79: eb15                             jmp 0x145c20c90
145c20c7b: 0f1f440000                       nop dword ptr [rax + rax]
145c20c80: 49ffc0                           inc r8
145c20c83: 4983c320                         add r11, 0x20
145c20c87: 4d39c1                           cmp r9, r8
145c20c8a: 0f844f010000                     je 0x145c20ddf
145c20c90: 41395314                         cmp dword ptr [r11 + 0x14], edx
145c20c94: 75ea                             jne 0x145c20c80
145c20c96: 49833b00                         cmp qword ptr [r11], 0
145c20c9a: 75e4                             jne 0x145c20c80
145c20c9c: 4d8d5801                         lea r11, [r8 + 1]
145c20ca0: 4d39cb                           cmp r11, r9
145c20ca3: 0f83a3000000                     jae 0x145c20d4c
145c20ca9: 41f6c201                         test r10b, 1
145c20cad: 744e                             je 0x145c20cfd
145c20caf: 4d89c2                           mov r10, r8
145c20cb2: 49f7d2                           not r10
145c20cb5: 4d01ca                           add r10, r9
145c20cb8: 4d89c1                           mov r9, r8
145c20cbb: 49c1e105                         shl r9, 5
145c20cbf: 4901c1                           add r9, rax
145c20cc2: 4983c120                         add r9, 0x20
145c20cc6: eb27                             jmp 0x145c20cef
145c20cc8: 4d89c3                           mov r11, r8
145c20ccb: 49c1e305                         shl r11, 5
145c20ccf: 410f1001                         movups xmm0, xmmword ptr [r9]
145c20cd3: 410f104910                       movups xmm1, xmmword ptr [r9 + 0x10]
145c20cd8: 420f114c1810                     movups xmmword ptr [rax + r11 + 0x10], xmm1
145c20cde: 420f110418                       movups xmmword ptr [rax + r11], xmm0
145c20ce3: 49ffc0                           inc r8
145c20ce6: 4983c120                         add r9, 0x20
145c20cea: 49ffca                           dec r10
145c20ced: 745d                             je 0x145c20d4c
145c20cef: 41395114                         cmp dword ptr [r9 + 0x14], edx
145c20cf3: 75d3                             jne 0x145c20cc8
145c20cf5: 49833900                         cmp qword ptr [r9], 0
145c20cf9: 75cd                             jne 0x145c20cc8
145c20cfb: ebe9                             jmp 0x145c20ce6
145c20cfd: 4d8d51fe                         lea r10, [r9 - 2]
145c20d01: 4489c6                           mov esi, r8d
145c20d04: 4429ce                           sub esi, r9d
145c20d07: 40f6c601                         test sil, 1
145c20d0b: 7534                             jne 0x145c20d41
145c20d0d: 49c1e305                         shl r11, 5
145c20d11: 4c89c6                           mov rsi, r8
145c20d14: 4239541814                       cmp dword ptr [rax + r11 + 0x14], edx
145c20d19: 7420                             je 0x145c20d3b
145c20d1b: 4901c3                           add r11, rax
145c20d1e: 4c89c6                           mov rsi, r8
145c20d21: 48c1e605                         shl rsi, 5
145c20d25: 410f1003                         movups xmm0, xmmword ptr [r11]
145c20d29: 410f104b10                       movups xmm1, xmmword ptr [r11 + 0x10]
145c20d2e: 0f114c3010                       movups xmmword ptr [rax + rsi + 0x10], xmm1
145c20d33: 0f110430                         movups xmmword ptr [rax + rsi], xmm0
145c20d37: 498d7001                         lea rsi, [r8 + 1]
145c20d3b: 4d8d5802                         lea r11, [r8 + 2]
145c20d3f: eb03                             jmp 0x145c20d44
145c20d41: 4c89c6                           mov rsi, r8
145c20d44: 4d39c2                           cmp r10, r8
145c20d47: 4989f0                           mov r8, rsi
145c20d4a: 7506                             jne 0x145c20d52
145c20d4c: 4c894110                         mov qword ptr [rcx + 0x10], r8
145c20d50: 5e                               pop rsi
145c20d51: c3                               ret
145c20d52: 4d29d9                           sub r9, r11
145c20d55: 49c1e305                         shl r11, 5
145c20d59: 4d8d1403                         lea r10, [r11 + rax]
145c20d5d: 4983c234                         add r10, 0x34
145c20d61: 4989f0                           mov r8, rsi
145c20d64: eb0a                             jmp 0x145c20d70
145c20d66: 4983c240                         add r10, 0x40
145c20d6a: 4983c1fe                         add r9, -2
145c20d6e: 74dc                             je 0x145c20d4c
145c20d70: 413952e0                         cmp dword ptr [r10 - 0x20], edx
145c20d74: 7507                             jne 0x145c20d7d
145c20d76: 413912                           cmp dword ptr [r10], edx
145c20d79: 74eb                             je 0x145c20d66
145c20d7b: eb25                             jmp 0x145c20da2
145c20d7d: 4d8d5acc                         lea r11, [r10 - 0x34]
145c20d81: 4c89c6                           mov rsi, r8
145c20d84: 48c1e605                         shl rsi, 5
145c20d88: 410f1003                         movups xmm0, xmmword ptr [r11]
145c20d8c: 410f104b10                       movups xmm1, xmmword ptr [r11 + 0x10]
145c20d91: 0f114c3010                       movups xmmword ptr [rax + rsi + 0x10], xmm1
145c20d96: 0f110430                         movups xmmword ptr [rax + rsi], xmm0
145c20d9a: 49ffc0                           inc r8
145c20d9d: 413912                           cmp dword ptr [r10], edx
145c20da0: 74c4                             je 0x145c20d66
145c20da2: 4d89c3                           mov r11, r8
145c20da5: 49c1e305                         shl r11, 5
145c20da9: 410f1042ec                       movups xmm0, xmmword ptr [r10 - 0x14]
145c20dae: 410f104afc                       movups xmm1, xmmword ptr [r10 - 4]
145c20db3: 420f114c1810                     movups xmmword ptr [rax + r11 + 0x10], xmm1
145c20db9: 420f110418                       movups xmmword ptr [rax + r11], xmm0
145c20dbe: 49ffc0                           inc r8
145c20dc1: eba3                             jmp 0x145c20d66
145c20dc3: 4c8d5814                         lea r11, [rax + 0x14]
145c20dc7: 4531c0                           xor r8d, r8d
145c20dca: 413913                           cmp dword ptr [r11], edx
145c20dcd: 0f84c9feffff                     je 0x145c20c9c
145c20dd3: 49ffc0                           inc r8
145c20dd6: 4983c320                         add r11, 0x20
145c20dda: 4d39c1                           cmp r9, r8
145c20ddd: 75eb                             jne 0x145c20dca
145c20ddf: 5e                               pop rsi
145c20de0: c3                               ret

; shared-heal-event
145b85270: 4156                             push r14
145b85272: 56                               push rsi
145b85273: 57                               push rdi
145b85274: 55                               push rbp
145b85275: 53                               push rbx
145b85276: 4883ec50                         sub rsp, 0x50
145b8527a: 0f297c2440                       movaps xmmword ptr [rsp + 0x40], xmm7
145b8527f: 0f29742430                       movaps xmmword ptr [rsp + 0x30], xmm6
145b85284: 80b9850c000001                   cmp byte ptr [rcx + 0xc85], 1
145b8528b: 0f85a7000000                     jne 0x145b85338
145b85291: 488bb9800b0000                   mov rdi, qword ptr [rcx + 0xb80]
145b85298: 488b9988040000                   mov rbx, qword ptr [rcx + 0x488]
145b8529f: 8b81f8040000                     mov eax, dword ptr [rcx + 0x4f8]
145b852a5: 89442428                         mov dword ptr [rsp + 0x28], eax
145b852a9: 488b81f0040000                   mov rax, qword ptr [rcx + 0x4f0]
145b852b0: 4889442420                       mov qword ptr [rsp + 0x20], rax
145b852b5: 488bb1400a0000                   mov rsi, qword ptr [rcx + 0xa40]
145b852bc: 483bb1300a0000                   cmp rsi, qword ptr [rcx + 0xa30]
145b852c3: 7525                             jne 0x145b852ea
145b852c5: 488d81300a0000                   lea rax, [rcx + 0xa30]
145b852cc: 4989ce                           mov r14, rcx
145b852cf: 4889c1                           mov rcx, rax
145b852d2: 0f28f3                           movaps xmm6, xmm3
145b852d5: 0f28fa                           movaps xmm7, xmm2
145b852d8: 89d5                             mov ebp, edx
145b852da: e8e1f54000                       call 0x145f948c0
145b852df: 89ea                             mov edx, ebp
145b852e1: 0f28d7                           movaps xmm2, xmm7
145b852e4: 0f28de                           movaps xmm3, xmm6
145b852e7: 4c89f1                           mov rcx, r14
145b852ea: 488b81380a0000                   mov rax, qword ptr [rcx + 0xa38]
145b852f1: 4c6bc638                         imul r8, rsi, 0x38
145b852f5: 4a893c00                         mov qword ptr [rax + r8], rdi
145b852f9: 4a895c0008                       mov qword ptr [rax + r8 + 8], rbx
145b852fe: 4c8b4c2420                       mov r9, qword ptr [rsp + 0x20]
145b85303: 4e894c0010                       mov qword ptr [rax + r8 + 0x10], r9
145b85308: 448b4c2428                       mov r9d, dword ptr [rsp + 0x28]
145b8530d: 46894c0018                       mov dword ptr [rax + r8 + 0x18], r9d
145b85312: 428954001c                       mov dword ptr [rax + r8 + 0x1c], edx
145b85317: f3420f11540020                   movss dword ptr [rax + r8 + 0x20], xmm2
145b8531e: f3420f115c0024                   movss dword ptr [rax + r8 + 0x24], xmm3
145b85325: 42c74400280e000000               mov dword ptr [rax + r8 + 0x28], 0xe
145b8532e: 48ffc6                           inc rsi
145b85331: 4889b1400a0000                   mov qword ptr [rcx + 0xa40], rsi
145b85338: 0f28742430                       movaps xmm6, xmmword ptr [rsp + 0x30]
145b8533d: 0f287c2440                       movaps xmm7, xmmword ptr [rsp + 0x40]
145b85342: 4883c450                         add rsp, 0x50
145b85346: 5b                               pop rbx
145b85347: 5d                               pop rbp
145b85348: 5f                               pop rdi
145b85349: 5e                               pop rsi
145b8534a: 415e                             pop r14
145b8534c: c3                               ret

; local-recipient-fanout
145b7db71: 498b8424400a0000                 mov rax, qword ptr [r12 + 0xa40]
145b7db79: 488945b0                         mov qword ptr [rbp - 0x50], rax
145b7db7d: 410f108424300a0000               movups xmm0, xmmword ptr [r12 + 0xa30]
145b7db86: 0f2945a0                         movaps xmmword ptr [rbp - 0x60], xmm0
145b7db8a: 49c78424300a000000000000         mov qword ptr [r12 + 0xa30], 0
145b7db96: 49c78424380a000008000000         mov qword ptr [r12 + 0xa38], 8
145b7dba2: 49c78424400a000000000000         mov qword ptr [r12 + 0xa40], 0
145b7dbae: 488b45b0                         mov rax, qword ptr [rbp - 0x50]
145b7dbb2: 4885c0                           test rax, rax
145b7dbb5: 0f8416020000                     je 0x145b7ddd1
145b7dbbb: 488d4da0                         lea rcx, [rbp - 0x60]
145b7dbbf: 48898d40130000                   mov qword ptr [rbp + 0x1340], rcx
145b7dbc6: 4180bc248a0c000001               cmp byte ptr [r12 + 0xc8a], 1
145b7dbcf: 7565                             jne 0x145b7dc36
145b7dbd1: 488b7da8                         mov rdi, qword ptr [rbp - 0x58]
145b7dbd5: 486bf038                         imul rsi, rax, 0x38
145b7dbd9: 4801fe                           add rsi, rdi
145b7dbdc: f30f103d64ff5f00                 movss xmm7, dword ptr [rip + 0x5fff64]
145b7dbe4: eb13                             jmp 0x145b7dbf9
145b7dbe6: 662e0f1f840000000000             nop word ptr cs:[rax + rax]
145b7dbf0: 4883c738                         add rdi, 0x38
145b7dbf4: 4839f7                           cmp rdi, rsi
145b7dbf7: 743d                             je 0x145b7dc36
145b7dbf9: 488b07                           mov rax, qword ptr [rdi]
145b7dbfc: 493b8424800b0000                 cmp rax, qword ptr [r12 + 0xb80]
145b7dc04: 74ea                             je 0x145b7dbf0
145b7dc06: f20f104710                       movsd xmm0, qword ptr [rdi + 0x10]
145b7dc0b: f2410f108c24f0040000             movsd xmm1, qword ptr [r12 + 0x4f0]
145b7dc15: 0f5cc1                           subps xmm0, xmm1
145b7dc18: 0f59c0                           mulps xmm0, xmm0
145b7dc1b: f30f16c8                         movshdup xmm1, xmm0
145b7dc1f: f30f58c8                         addss xmm1, xmm0
145b7dc23: 0f2ef9                           ucomiss xmm7, xmm1
145b7dc26: 72c8                             jb 0x145b7dbf0
145b7dc28: 4c89e1                           mov rcx, r12
145b7dc2b: 4889fa                           mov rdx, rdi
145b7dc2e: e86d910000                       call 0x145b86da0
145b7dc33: 90                               nop
145b7dc34: ebba                             jmp 0x145b7dbf0

; remote-recipient-fanout
145b245d9: 80be8a0c000001                   cmp byte ptr [rsi + 0xc8a], 1
145b245e0: 7561                             jne 0x145b24643
145b245e2: 498b00                           mov rax, qword ptr [r8]
145b245e5: 488b4810                         mov rcx, qword ptr [rax + 0x10]
145b245e9: 4885c9                           test rcx, rcx
145b245ec: 7455                             je 0x145b24643
145b245ee: 488b7808                         mov rdi, qword ptr [rax + 8]
145b245f2: 4c6bf138                         imul r14, rcx, 0x38
145b245f6: f30f103d4a956500                 movss xmm7, dword ptr [rip + 0x65954a]
145b245fe: eb0a                             jmp 0x145b2460a
145b24600: 4883c738                         add rdi, 0x38
145b24604: 4983c6c8                         add r14, -0x38
145b24608: 7439                             je 0x145b24643
145b2460a: 488b07                           mov rax, qword ptr [rdi]
145b2460d: 483b86800b0000                   cmp rax, qword ptr [rsi + 0xb80]
145b24614: 74ea                             je 0x145b24600
145b24616: f20f104710                       movsd xmm0, qword ptr [rdi + 0x10]
145b2461b: f20f108ef0040000                 movsd xmm1, qword ptr [rsi + 0x4f0]
145b24623: 0f5cc1                           subps xmm0, xmm1
145b24626: 0f59c0                           mulps xmm0, xmm0
145b24629: f30f16c8                         movshdup xmm1, xmm0
145b2462d: f30f58c8                         addss xmm1, xmm0
145b24631: 0f2ef9                           ucomiss xmm7, xmm1
145b24634: 72ca                             jb 0x145b24600
145b24636: 4889f1                           mov rcx, rsi
145b24639: 4889fa                           mov rdx, rdi
145b2463c: e85f270600                       call 0x145b86da0
145b24641: ebbd                             jmp 0x145b24600

; shared-heal-recipient
145b86da0: 55                               push rbp
145b86da1: 4157                             push r15
145b86da3: 4156                             push r14
145b86da5: 56                               push rsi
145b86da6: 57                               push rdi
145b86da7: 53                               push rbx
145b86da8: 4881ec98000000                   sub rsp, 0x98
145b86daf: 488dac2480000000                 lea rbp, [rsp + 0x80]
145b86db7: 440f294500                       movaps xmmword ptr [rbp], xmm8
145b86dbc: 0f297df0                         movaps xmmword ptr [rbp - 0x10], xmm7
145b86dc0: 0f2975e0                         movaps xmmword ptr [rbp - 0x20], xmm6
145b86dc4: 48c745d8feffffff                 mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
145b86dcc: 4889ce                           mov rsi, rcx
145b86dcf: f30f1081a0040000                 movss xmm0, dword ptr [rcx + 0x4a0]
145b86dd7: f30f107220                       movss xmm6, dword ptr [rdx + 0x20]
145b86ddc: 0f28f8                           movaps xmm7, xmm0
145b86ddf: f30f59fe                         mulss xmm7, xmm6
145b86de3: 8b4a28                           mov ecx, dword ptr [rdx + 0x28]
145b86de6: 83e90e                           sub ecx, 0xe
145b86de9: b802000000                       mov eax, 2
145b86dee: 0f43c1                           cmovae eax, ecx
145b86df1: 85c0                             test eax, eax
145b86df3: 7466                             je 0x145b86e5b
145b86df5: 83f801                           cmp eax, 1
145b86df8: 0f85f5000000                     jne 0x145b86ef3
145b86dfe: f30f10860c050000                 movss xmm0, dword ptr [rsi + 0x50c]
145b86e06: f30f58c7                         addss xmm0, xmm7
145b86e0a: f30f11860c050000                 movss dword ptr [rsi + 0x50c], xmm0
145b86e12: 83be9004000000                   cmp dword ptr [rsi + 0x490], 0
145b86e19: 8b7a1c                           mov edi, dword ptr [rdx + 0x1c]
145b86e1c: 0f8477020000                     je 0x145b87099
145b86e22: 488b9eb8030000                   mov rbx, qword ptr [rsi + 0x3b8]
145b86e29: 4885db                           test rbx, rbx
145b86e2c: 0f8485020000                     je 0x145b870b7
145b86e32: 488b86b0030000                   mov rax, qword ptr [rsi + 0x3b0]
145b86e39: 4c8d4034                         lea r8, [rax + 0x34]
145b86e3d: 31c9                             xor ecx, ecx
145b86e3f: 90                               nop
145b86e40: 413978e0                         cmp dword ptr [r8 - 0x20], edi
145b86e44: 0f840d040000                     je 0x145b87257
145b86e4a: 48ffc1                           inc rcx
145b86e4d: 4983c020                         add r8, 0x20
145b86e51: 4839cb                           cmp rbx, rcx
145b86e54: 75ea                             jne 0x145b86e40
145b86e56: e95e020000                       jmp 0x145b870b9
145b86e5b: f3440f104224                     movss xmm8, dword ptr [rdx + 0x24]
145b86e61: 0f57c9                           xorps xmm1, xmm1
145b86e64: 440f2ec1                         ucomiss xmm8, xmm1
145b86e68: 0f86cd000000                     jbe 0x145b86f3b
145b86e6e: 8b7a1c                           mov edi, dword ptr [rdx + 0x1c]
145b86e71: 4c8bb6b8030000                   mov r14, qword ptr [rsi + 0x3b8]
145b86e78: 4d85f6                           test r14, r14
145b86e7b: 0f8416030000                     je 0x145b87197
145b86e81: 488b86b0030000                   mov rax, qword ptr [rsi + 0x3b0]
145b86e88: 488b5a08                         mov rbx, qword ptr [rdx + 8]
145b86e8c: 81ff06030000                     cmp edi, 0x306
145b86e92: 0f8549060000                     jne 0x145b874e1
145b86e98: 31c9                             xor ecx, ecx
145b86e9a: 4889c2                           mov rdx, rax
145b86e9d: eb11                             jmp 0x145b86eb0
145b86e9f: 90                               nop
145b86ea0: 48ffc1                           inc rcx
145b86ea3: 4883c220                         add rdx, 0x20
145b86ea7: 4939ce                           cmp r14, rcx
145b86eaa: 0f84ee020000                     je 0x145b8719e
145b86eb0: 817a1406030000                   cmp dword ptr [rdx + 0x14], 0x306
145b86eb7: 75e7                             jne 0x145b86ea0
145b86eb9: 48391a                           cmp qword ptr [rdx], rbx
145b86ebc: 75e2                             jne 0x145b86ea0
145b86ebe: 488d5101                         lea rdx, [rcx + 1]
145b86ec2: 4c39f2                           cmp rdx, r14
145b86ec5: 0f839a050000                     jae 0x145b87465
145b86ecb: 81ff06030000                     cmp edi, 0x306
145b86ed1: 0f8540050000                     jne 0x145b87417
145b86ed7: 4889ca                           mov rdx, rcx
145b86eda: 48f7d2                           not rdx
145b86edd: 4c01f2                           add rdx, r14
145b86ee0: 4989c8                           mov r8, rcx
145b86ee3: 49c1e005                         shl r8, 5
145b86ee7: 4901c0                           add r8, rax
145b86eea: 4983c020                         add r8, 0x20
145b86eee: e953030000                       jmp 0x145b87246
145b86ef3: 488bbeb8030000                   mov rdi, qword ptr [rsi + 0x3b8]
145b86efa: 4885ff                           test rdi, rdi
145b86efd: 0f841d020000                     je 0x145b87120
145b86f03: 488b86b0030000                   mov rax, qword ptr [rsi + 0x3b0]
145b86f0a: 8b5a1c                           mov ebx, dword ptr [rdx + 0x1c]
145b86f0d: 4c8d4034                         lea r8, [rax + 0x34]
145b86f11: 31c9                             xor ecx, ecx
145b86f13: 666666662e0f1f840000000000       nop word ptr cs:[rax + rax]
145b86f20: 413958e0                         cmp dword ptr [r8 - 0x20], ebx
145b86f24: 0f84a3030000                     je 0x145b872cd
145b86f2a: 48ffc1                           inc rcx
145b86f2d: 4983c020                         add r8, 0x20
145b86f31: 4839cf                           cmp rdi, rcx
145b86f34: 75ea                             jne 0x145b86f20
145b86f36: e9ea010000                       jmp 0x145b87125
145b86f3b: f30f108e08050000                 movss xmm1, dword ptr [rsi + 0x508]
145b86f43: f30f58f9                         addss xmm7, xmm1
145b86f47: 0f28d7                           movaps xmm2, xmm7
145b86f4a: f30f5dd0                         minss xmm2, xmm0
145b86f4e: 0f28c2                           movaps xmm0, xmm2
145b86f51: f30fc2c203                       cmpunordss xmm0, xmm2
145b86f56: 0f54f8                           andps xmm7, xmm0
145b86f59: 0f55c2                           andnps xmm0, xmm2
145b86f5c: 0f56c7                           orps xmm0, xmm7
145b86f5f: f30f118608050000                 movss dword ptr [rsi + 0x508], xmm0
145b86f67: f30f5cc1                         subss xmm0, xmm1
145b86f6b: 0f2e0522cc5d00                   ucomiss xmm0, dword ptr [rip + 0x5dcc22]
145b86f72: 0f8204010000                     jb 0x145b8707c
145b86f78: 488b8688040000                   mov rax, qword ptr [rsi + 0x488]
145b86f7f: 4c8b4208                         mov r8, qword ptr [rdx + 8]
145b86f83: f3480f2cc8                       cvttss2si rcx, xmm0
145b86f88: 4531f6                           xor r14d, r14d
145b86f8b: 0f57ff                           xorps xmm7, xmm7
145b86f8e: 0f2ec7                           ucomiss xmm0, xmm7
145b86f91: 410f42ce                         cmovb ecx, r14d
145b86f95: 448b4a1c                         mov r9d, dword ptr [rdx + 0x1c]
145b86f99: 0f2e05f4a15f00                   ucomiss xmm0, dword ptr [rip + 0x5fa1f4]
145b86fa0: 41bfffffffff                     mov r15d, 0xffffffff
145b86fa6: 410f47cf                         cmova ecx, r15d
145b86faa: 894c2420                         mov dword ptr [rsp + 0x20], ecx
145b86fae: c644242800                       mov byte ptr [rsp + 0x28], 0
145b86fb3: 488d4db8                         lea rcx, [rbp - 0x48]
145b86fb7: 4889c2                           mov rdx, rax
145b86fba: e8c1c5fdff                       call 0x145b63580
145b86fbf: 488bbe50060000                   mov rdi, qword ptr [rsi + 0x650]
145b86fc6: 483bbe40060000                   cmp rdi, qword ptr [rsi + 0x640]
145b86fcd: 750d                             jne 0x145b86fdc
145b86fcf: 488d8e40060000                   lea rcx, [rsi + 0x640]
145b86fd6: e855d94000                       call 0x145f94930
145b86fdb: 90                               nop
145b86fdc: 488b8648060000                   mov rax, qword ptr [rsi + 0x648]
145b86fe3: 4889f9                           mov rcx, rdi
145b86fe6: 48c1e105                         shl rcx, 5
145b86fea: 0f1045b8                         movups xmm0, xmmword ptr [rbp - 0x48]
145b86fee: 0f104dc8                         movups xmm1, xmmword ptr [rbp - 0x38]
145b86ff2: 0f114c0810                       movups xmmword ptr [rax + rcx + 0x10], xmm1
145b86ff7: 0f110408                         movups xmmword ptr [rax + rcx], xmm0
145b86ffb: 48ffc7                           inc rdi
145b86ffe: 4889be50060000                   mov qword ptr [rsi + 0x650], rdi
145b87005: f30f10b6a0040000                 movss xmm6, dword ptr [rsi + 0x4a0]
145b8700d: f30f108608050000                 movss xmm0, dword ptr [rsi + 0x508]
145b87015: f30f5fc7                         maxss xmm0, xmm7
145b87019: e829d24000                       call 0x145f94247
145b8701e: f3480f2cf8                       cvttss2si rdi, xmm0
145b87023: 0f2ec7                           ucomiss xmm0, xmm7
145b87026: 410f42fe                         cmovb edi, r14d
145b8702a: f3440f100561a15f00               movss xmm8, dword ptr [rip + 0x5fa161]
145b87033: 410f2ec0                         ucomiss xmm0, xmm8
145b87037: 410f47ff                         cmova edi, r15d
145b8703b: 0f28c6                           movaps xmm0, xmm6
145b8703e: e804d24000                       call 0x145f94247
145b87043: f3480f2cd8                       cvttss2si rbx, xmm0
145b87048: 0f2ec7                           ucomiss xmm0, xmm7
145b8704b: 410f42de                         cmovb ebx, r14d
145b8704f: 410f2ec0                         ucomiss xmm0, xmm8
145b87053: 410f47df                         cmova ebx, r15d
145b87057: 4881c6600b0000                   add rsi, 0xb60
145b8705e: 4889f1                           mov rcx, rsi
145b87061: 66ba1600                         mov dx, 0x16
145b87065: 4189f8                           mov r8d, edi
145b87068: e853daeeff                       call 0x145a74ac0
145b8706d: 4889f1                           mov rcx, rsi
145b87070: 66ba1c00                         mov dx, 0x1c
145b87074: 4189d8                           mov r8d, ebx
145b87077: e844daeeff                       call 0x145a74ac0
145b8707c: 0f2875e0                         movaps xmm6, xmmword ptr [rbp - 0x20]
145b87080: 0f287df0                         movaps xmm7, xmmword ptr [rbp - 0x10]
145b87084: 440f284500                       movaps xmm8, xmmword ptr [rbp]
145b87089: 4881c498000000                   add rsp, 0x98
145b87090: 5b                               pop rbx
145b87091: 5f                               pop rdi
145b87092: 5e                               pop rsi
145b87093: 415e                             pop r14
145b87095: 415f                             pop r15
145b87097: 5d                               pop rbp
145b87098: c3                               ret
145b87099: 89be90040000                     mov dword ptr [rsi + 0x490], edi
145b8709f: f30f11be94040000                 movss dword ptr [rsi + 0x494], xmm7
145b870a7: 488b9eb8030000                   mov rbx, qword ptr [rsi + 0x3b8]
145b870ae: 4885db                           test rbx, rbx
145b870b1: 0f857bfdffff                     jne 0x145b86e32
145b870b7: 31db                             xor ebx, ebx
145b870b9: f30f10bedc0b0000                 movss xmm7, dword ptr [rsi + 0xbdc]
145b870c1: f30f587a24                       addss xmm7, dword ptr [rdx + 0x24]
145b870c6: 483b9ea8030000                   cmp rbx, qword ptr [rsi + 0x3a8]
145b870cd: 750c                             jne 0x145b870db
145b870cf: 488d8ea8030000                   lea rcx, [rsi + 0x3a8]
145b870d6: e855d84000                       call 0x145f94930
145b870db: 488b86b0030000                   mov rax, qword ptr [rsi + 0x3b0]
145b870e2: 4889d9                           mov rcx, rbx
145b870e5: 48c1e105                         shl rcx, 5
145b870e9: 48c7040800000000                 mov qword ptr [rax + rcx], 0
145b870f1: c744080807000000                 mov dword ptr [rax + rcx + 8], 7
145b870f9: f30f1174080c                     movss dword ptr [rax + rcx + 0xc], xmm6
145b870ff: 897c0814                         mov dword ptr [rax + rcx + 0x14], edi
145b87103: f30f117c0818                     movss dword ptr [rax + rcx + 0x18], xmm7
145b87109: c744081c00000000                 mov dword ptr [rax + rcx + 0x1c], 0
145b87111: 48ffc3                           inc rbx
145b87114: 48899eb8030000                   mov qword ptr [rsi + 0x3b8], rbx
145b8711b: e9d7000000                       jmp 0x145b871f7
145b87120: 8b5a1c                           mov ebx, dword ptr [rdx + 0x1c]
145b87123: 31ff                             xor edi, edi
145b87125: f30f10b6dc0b0000                 movss xmm6, dword ptr [rsi + 0xbdc]
145b8712d: f30f587224                       addss xmm6, dword ptr [rdx + 0x24]
145b87132: 4c8d7228                         lea r14, [rdx + 0x28]
145b87136: 4c8b7a08                         mov r15, qword ptr [rdx + 8]
145b8713a: 483bbea8030000                   cmp rdi, qword ptr [rsi + 0x3a8]
145b87141: 750c                             jne 0x145b8714f
145b87143: 488d8ea8030000                   lea rcx, [rsi + 0x3a8]
145b8714a: e8e1d74000                       call 0x145f94930
145b8714f: 488b86b0030000                   mov rax, qword ptr [rsi + 0x3b0]
145b87156: 4889f9                           mov rcx, rdi
145b87159: 48c1e105                         shl rcx, 5
145b8715d: 4c893c08                         mov qword ptr [rax + rcx], r15
145b87161: 498b16                           mov rdx, qword ptr [r14]
145b87164: 4889540808                       mov qword ptr [rax + rcx + 8], rdx
145b87169: 418b5608                         mov edx, dword ptr [r14 + 8]
145b8716d: 89540810                         mov dword ptr [rax + rcx + 0x10], edx
145b87171: 895c0814                         mov dword ptr [rax + rcx + 0x14], ebx
145b87175: f30f11740818                     movss dword ptr [rax + rcx + 0x18], xmm6
145b8717b: c744081c00000000                 mov dword ptr [rax + rcx + 0x1c], 0
145b87183: 48ffc7                           inc rdi
145b87186: 4889beb8030000                   mov qword ptr [rsi + 0x3b8], rdi
145b8718d: 4889f1                           mov rcx, rsi
145b87190: e86bd40000                       call 0x145b94600
145b87195: eb60                             jmp 0x145b871f7
145b87197: 488b5a08                         mov rbx, qword ptr [rdx + 8]
145b8719b: 4531f6                           xor r14d, r14d
145b8719e: f3440f5886dc0b0000               addss xmm8, dword ptr [rsi + 0xbdc]
145b871a7: 4c3bb6a8030000                   cmp r14, qword ptr [rsi + 0x3a8]
145b871ae: 750c                             jne 0x145b871bc
145b871b0: 488d8ea8030000                   lea rcx, [rsi + 0x3a8]
145b871b7: e874d74000                       call 0x145f94930
145b871bc: 488b86b0030000                   mov rax, qword ptr [rsi + 0x3b0]
145b871c3: 4c89f1                           mov rcx, r14
145b871c6: 48c1e105                         shl rcx, 5
145b871ca: 48891c08                         mov qword ptr [rax + rcx], rbx
145b871ce: c744080806000000                 mov dword ptr [rax + rcx + 8], 6
145b871d6: f30f1174080c                     movss dword ptr [rax + rcx + 0xc], xmm6
145b871dc: 897c0814                         mov dword ptr [rax + rcx + 0x14], edi
145b871e0: f3440f11440818                   movss dword ptr [rax + rcx + 0x18], xmm8
145b871e7: f30f117c081c                     movss dword ptr [rax + rcx + 0x1c], xmm7
145b871ed: 49ffc6                           inc r14
145b871f0: 4c89b6b8030000                   mov qword ptr [rsi + 0x3b8], r14
145b871f7: 4889f1                           mov rcx, rsi
145b871fa: 0f2875e0                         movaps xmm6, xmmword ptr [rbp - 0x20]
145b871fe: 0f287df0                         movaps xmm7, xmmword ptr [rbp - 0x10]
145b87202: 440f284500                       movaps xmm8, xmmword ptr [rbp]
145b87207: 4881c498000000                   add rsp, 0x98
145b8720e: 5b                               pop rbx
145b8720f: 5f                               pop rdi
145b87210: 5e                               pop rsi
145b87211: 415e                             pop r14
145b87213: 415f                             pop r15
145b87215: 5d                               pop rbp
145b87216: e9454b0000                       jmp 0x145b8bd60
145b8721b: 4989c9                           mov r9, rcx
145b8721e: 49c1e105                         shl r9, 5
145b87222: 410f1000                         movups xmm0, xmmword ptr [r8]
145b87226: 410f104810                       movups xmm1, xmmword ptr [r8 + 0x10]
145b8722b: 420f114c0810                     movups xmmword ptr [rax + r9 + 0x10], xmm1
145b87231: 420f110408                       movups xmmword ptr [rax + r9], xmm0
145b87236: 48ffc1                           inc rcx
145b87239: 4983c020                         add r8, 0x20
145b8723d: 48ffca                           dec rdx
145b87240: 0f841f020000                     je 0x145b87465
145b87246: 4181781406030000                 cmp dword ptr [r8 + 0x14], 0x306
145b8724e: 75cb                             jne 0x145b8721b
145b87250: 493918                           cmp qword ptr [r8], rbx
145b87253: 75c6                             jne 0x145b8721b
145b87255: ebe2                             jmp 0x145b87239
145b87257: 4c8d5101                         lea r10, [rcx + 1]
145b8725b: 4939da                           cmp r10, rbx
145b8725e: 7344                             jae 0x145b872a4
145b87260: 4c8d4bfe                         lea r9, [rbx - 2]
145b87264: 448d340b                         lea r14d, [rbx + rcx]
145b87268: 4989cb                           mov r11, rcx
145b8726b: 41f6c601                         test r14b, 1
145b8726f: 7527                             jne 0x145b87298
145b87271: 4989cb                           mov r11, rcx
145b87274: 413938                           cmp dword ptr [r8], edi
145b87277: 741b                             je 0x145b87294
145b87279: 4d8d50ec                         lea r10, [r8 - 0x14]
145b8727d: 410f1002                         movups xmm0, xmmword ptr [r10]
145b87281: 410f104a10                       movups xmm1, xmmword ptr [r10 + 0x10]
145b87286: 410f1148dc                       movups xmmword ptr [r8 - 0x24], xmm1
145b8728b: 410f1140cc                       movups xmmword ptr [r8 - 0x34], xmm0
145b87290: 4c8d5901                         lea r11, [rcx + 1]
145b87294: 4c8d5102                         lea r10, [rcx + 2]
145b87298: 4939c9                           cmp r9, rcx
145b8729b: 4c89d9                           mov rcx, r11
145b8729e: 0f8585000000                     jne 0x145b87329
145b872a4: 48898eb8030000                   mov qword ptr [rsi + 0x3b8], rcx
145b872ab: 4889cb                           mov rbx, rcx
145b872ae: f30f10bedc0b0000                 movss xmm7, dword ptr [rsi + 0xbdc]
145b872b6: f30f587a24                       addss xmm7, dword ptr [rdx + 0x24]
145b872bb: 483b9ea8030000                   cmp rbx, qword ptr [rsi + 0x3a8]
145b872c2: 0f8407feffff                     je 0x145b870cf
145b872c8: e90efeffff                       jmp 0x145b870db
145b872cd: 4c8d5101                         lea r10, [rcx + 1]
145b872d1: 4939fa                           cmp r10, rdi
145b872d4: 7344                             jae 0x145b8731a
145b872d6: 4c8d4ffe                         lea r9, [rdi - 2]
145b872da: 448d340f                         lea r14d, [rdi + rcx]
145b872de: 4989cb                           mov r11, rcx
145b872e1: 41f6c601                         test r14b, 1
145b872e5: 7527                             jne 0x145b8730e
145b872e7: 4989cb                           mov r11, rcx
145b872ea: 413918                           cmp dword ptr [r8], ebx
145b872ed: 741b                             je 0x145b8730a
145b872ef: 4d8d50ec                         lea r10, [r8 - 0x14]
145b872f3: 410f1002                         movups xmm0, xmmword ptr [r10]
145b872f7: 410f104a10                       movups xmm1, xmmword ptr [r10 + 0x10]
145b872fc: 410f1148dc                       movups xmmword ptr [r8 - 0x24], xmm1
145b87301: 410f1140cc                       movups xmmword ptr [r8 - 0x34], xmm0
145b87306: 4c8d5901                         lea r11, [rcx + 1]
145b8730a: 4c8d5102                         lea r10, [rcx + 2]
145b8730e: 4939c9                           cmp r9, rcx
145b87311: 4c89d9                           mov rcx, r11
145b87314: 0f8586000000                     jne 0x145b873a0
145b8731a: 48898eb8030000                   mov qword ptr [rsi + 0x3b8], rcx
145b87321: 4889cf                           mov rdi, rcx
145b87324: e9fcfdffff                       jmp 0x145b87125
145b87329: 4c29d3                           sub rbx, r10
145b8732c: 49c1e205                         shl r10, 5
145b87330: 4d8d0402                         lea r8, [r10 + rax]
145b87334: 4983c034                         add r8, 0x34
145b87338: 4c89d9                           mov rcx, r11
145b8733b: eb0e                             jmp 0x145b8734b
145b8733d: 4983c040                         add r8, 0x40
145b87341: 4883c3fe                         add rbx, -2
145b87345: 0f8459ffffff                     je 0x145b872a4
145b8734b: 413978e0                         cmp dword ptr [r8 - 0x20], edi
145b8734f: 7507                             jne 0x145b87358
145b87351: 413938                           cmp dword ptr [r8], edi
145b87354: 74e7                             je 0x145b8733d
145b87356: eb27                             jmp 0x145b8737f
145b87358: 4d8d48cc                         lea r9, [r8 - 0x34]
145b8735c: 4989ca                           mov r10, rcx
145b8735f: 49c1e205                         shl r10, 5
145b87363: 410f1001                         movups xmm0, xmmword ptr [r9]
145b87367: 410f104910                       movups xmm1, xmmword ptr [r9 + 0x10]
145b8736c: 420f114c1010                     movups xmmword ptr [rax + r10 + 0x10], xmm1
145b87372: 420f110410                       movups xmmword ptr [rax + r10], xmm0
145b87377: 48ffc1                           inc rcx
145b8737a: 413938                           cmp dword ptr [r8], edi
145b8737d: 74be                             je 0x145b8733d
145b8737f: 4989c9                           mov r9, rcx
145b87382: 49c1e105                         shl r9, 5
145b87386: 410f1040ec                       movups xmm0, xmmword ptr [r8 - 0x14]
145b8738b: 410f1048fc                       movups xmm1, xmmword ptr [r8 - 4]
145b87390: 420f114c0810                     movups xmmword ptr [rax + r9 + 0x10], xmm1
145b87396: 420f110408                       movups xmmword ptr [rax + r9], xmm0
145b8739b: 48ffc1                           inc rcx
145b8739e: eb9d                             jmp 0x145b8733d
145b873a0: 4c29d7                           sub rdi, r10
145b873a3: 49c1e205                         shl r10, 5
145b873a7: 4d8d0402                         lea r8, [r10 + rax]
145b873ab: 4983c034                         add r8, 0x34
145b873af: 4c89d9                           mov rcx, r11
145b873b2: eb0e                             jmp 0x145b873c2
145b873b4: 4983c040                         add r8, 0x40
145b873b8: 4883c7fe                         add rdi, -2
145b873bc: 0f8458ffffff                     je 0x145b8731a
145b873c2: 413958e0                         cmp dword ptr [r8 - 0x20], ebx
145b873c6: 7507                             jne 0x145b873cf
145b873c8: 413918                           cmp dword ptr [r8], ebx
145b873cb: 74e7                             je 0x145b873b4
145b873cd: eb27                             jmp 0x145b873f6
145b873cf: 4d8d48cc                         lea r9, [r8 - 0x34]
145b873d3: 4989ca                           mov r10, rcx
145b873d6: 49c1e205                         shl r10, 5
145b873da: 410f1001                         movups xmm0, xmmword ptr [r9]
145b873de: 410f104910                       movups xmm1, xmmword ptr [r9 + 0x10]
145b873e3: 420f114c1010                     movups xmmword ptr [rax + r10 + 0x10], xmm1
145b873e9: 420f110410                       movups xmmword ptr [rax + r10], xmm0
145b873ee: 48ffc1                           inc rcx
145b873f1: 413918                           cmp dword ptr [r8], ebx
145b873f4: 74be                             je 0x145b873b4
145b873f6: 4989c9                           mov r9, rcx
145b873f9: 49c1e105                         shl r9, 5
145b873fd: 410f1040ec                       movups xmm0, xmmword ptr [r8 - 0x14]
145b87402: 410f1048fc                       movups xmm1, xmmword ptr [r8 - 4]
145b87407: 420f114c0810                     movups xmmword ptr [rax + r9 + 0x10], xmm1
145b8740d: 420f110408                       movups xmmword ptr [rax + r9], xmm0
145b87412: 48ffc1                           inc rcx
145b87415: eb9d                             jmp 0x145b873b4
145b87417: 4d8d46fe                         lea r8, [r14 - 2]
145b8741b: 4189c9                           mov r9d, ecx
145b8741e: 4529f1                           sub r9d, r14d
145b87421: 41f6c101                         test r9b, 1
145b87425: 7533                             jne 0x145b8745a
145b87427: 48c1e205                         shl rdx, 5
145b8742b: 4989c9                           mov r9, rcx
145b8742e: 397c1014                         cmp dword ptr [rax + rdx + 0x14], edi
145b87432: 7420                             je 0x145b87454
145b87434: 4801c2                           add rdx, rax
145b87437: 4989c9                           mov r9, rcx
145b8743a: 49c1e105                         shl r9, 5
145b8743e: 0f1002                           movups xmm0, xmmword ptr [rdx]
145b87441: 0f104a10                         movups xmm1, xmmword ptr [rdx + 0x10]
145b87445: 420f114c0810                     movups xmmword ptr [rax + r9 + 0x10], xmm1
145b8744b: 420f110408                       movups xmmword ptr [rax + r9], xmm0
145b87450: 4c8d4901                         lea r9, [rcx + 1]
145b87454: 488d5102                         lea rdx, [rcx + 2]
145b87458: eb03                             jmp 0x145b8745d
145b8745a: 4989c9                           mov r9, rcx
145b8745d: 4939c8                           cmp r8, rcx
145b87460: 4c89c9                           mov rcx, r9
145b87463: 750f                             jne 0x145b87474
145b87465: 48898eb8030000                   mov qword ptr [rsi + 0x3b8], rcx
145b8746c: 4989ce                           mov r14, rcx
145b8746f: e92afdffff                       jmp 0x145b8719e
145b87474: 4929d6                           sub r14, rdx
145b87477: 48c1e205                         shl rdx, 5
145b8747b: 4801c2                           add rdx, rax
145b8747e: 4883c234                         add rdx, 0x34
145b87482: 4c89c9                           mov rcx, r9
145b87485: eb0a                             jmp 0x145b87491
145b87487: 4883c240                         add rdx, 0x40
145b8748b: 4983c6fe                         add r14, -2
145b8748f: 74d4                             je 0x145b87465
145b87491: 397ae0                           cmp dword ptr [rdx - 0x20], edi
145b87494: 7506                             jne 0x145b8749c
145b87496: 393a                             cmp dword ptr [rdx], edi
145b87498: 74ed                             je 0x145b87487
145b8749a: eb26                             jmp 0x145b874c2
145b8749c: 4c8d42cc                         lea r8, [rdx - 0x34]
145b874a0: 4989c9                           mov r9, rcx
145b874a3: 49c1e105                         shl r9, 5
145b874a7: 410f1000                         movups xmm0, xmmword ptr [r8]
145b874ab: 410f104810                       movups xmm1, xmmword ptr [r8 + 0x10]
145b874b0: 420f114c0810                     movups xmmword ptr [rax + r9 + 0x10], xmm1
145b874b6: 420f110408                       movups xmmword ptr [rax + r9], xmm0
145b874bb: 48ffc1                           inc rcx
145b874be: 393a                             cmp dword ptr [rdx], edi
145b874c0: 74c5                             je 0x145b87487
145b874c2: 4989c8                           mov r8, rcx
145b874c5: 49c1e005                         shl r8, 5
145b874c9: 0f1042ec                         movups xmm0, xmmword ptr [rdx - 0x14]
145b874cd: 0f104afc                         movups xmm1, xmmword ptr [rdx - 4]
145b874d1: 420f114c0010                     movups xmmword ptr [rax + r8 + 0x10], xmm1
145b874d7: 420f110400                       movups xmmword ptr [rax + r8], xmm0
145b874dc: 48ffc1                           inc rcx
145b874df: eba6                             jmp 0x145b87487
145b874e1: 488d5014                         lea rdx, [rax + 0x14]
145b874e5: 31c9                             xor ecx, ecx
145b874e7: 393a                             cmp dword ptr [rdx], edi
145b874e9: 0f84cff9ffff                     je 0x145b86ebe
145b874ef: 48ffc1                           inc rcx
145b874f2: 4883c220                         add rdx, 0x20
145b874f6: 4939ce                           cmp r14, rcx
145b874f9: 75ec                             jne 0x145b874e7
145b874fb: e99efcffff                       jmp 0x145b8719e

; independent-hot-tick
145b8d793: 4c8ba1b0030000                   mov r12, qword ptr [rcx + 0x3b0]
145b8d79a: 4c8bb1b8030000                   mov r14, qword ptr [rcx + 0x3b8]
145b8d7a1: 49c1e605                         shl r14, 5
145b8d7a5: 4d01e6                           add r14, r12
145b8d7a8: 450f57d2                         xorps xmm10, xmm10
145b8d7ac: f30f103de0635d00                 movss xmm7, dword ptr [rip + 0x5d63e0]
145b8d7b4: 488d7d10                         lea rdi, [rbp + 0x10]
145b8d7b8: 488d5df8                         lea rbx, [rbp - 8]
145b8d7bc: 450f57c9                         xorps xmm9, xmm9
145b8d7c0: eb1d                             jmp 0x145b8d7df
145b8d7c2: 66666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
145b8d7d0: 488b4500                         mov rax, qword ptr [rbp]
145b8d7d4: 46892cb8                         mov dword ptr [rax + r15*4], r13d
145b8d7d8: 49ffc7                           inc r15
145b8d7db: 4c897d08                         mov qword ptr [rbp + 8], r15
145b8d7df: 4d39f4                           cmp r12, r14
145b8d7e2: 0f84c0000000                     je 0x145b8d8a8
145b8d7e8: 4d89e7                           mov r15, r12
145b8d7eb: f3410f1044241c                   movss xmm0, dword ptr [r12 + 0x1c]
145b8d7f2: 410f2ec2                         ucomiss xmm0, xmm10
145b8d7f6: 767a                             jbe 0x145b8d872
145b8d7f8: f3410f104f18                     movss xmm1, dword ptr [r15 + 0x18]
145b8d7fe: f3410f5cc8                       subss xmm1, xmm8
145b8d803: 0f28d1                           movaps xmm2, xmm1
145b8d806: f30f5fd6                         maxss xmm2, xmm6
145b8d80a: 0f28da                           movaps xmm3, xmm2
145b8d80d: f30fc2da03                       cmpunordss xmm3, xmm2
145b8d812: 0f54cb                           andps xmm1, xmm3
145b8d815: 0f55da                           andnps xmm3, xmm2
145b8d818: 0f56d9                           orps xmm3, xmm1
145b8d81b: 440f28de                         movaps xmm11, xmm6
145b8d81f: f3440f5edb                       divss xmm11, xmm3
145b8d824: f3440f5ddf                       minss xmm11, xmm7
145b8d829: f3440f59d8                       mulss xmm11, xmm0
145b8d82e: f3410f5cc3                       subss xmm0, xmm11
145b8d833: f3410f11471c                     movss dword ptr [r15 + 0x1c], xmm0
145b8d839: 458b6f14                         mov r13d, dword ptr [r15 + 0x14]
145b8d83d: 4c8b6520                         mov r12, qword ptr [rbp + 0x20]
145b8d841: 4c3b6510                         cmp r12, qword ptr [rbp + 0x10]
145b8d845: 7510                             jne 0x145b8d857
145b8d847: c6859700000001                   mov byte ptr [rbp + 0x97], 1
145b8d84e: 4889f9                           mov rcx, rdi
145b8d851: e8ba6f4300                       call 0x145fc4810
145b8d856: 90                               nop
145b8d857: f3450f58cb                       addss xmm9, xmm11
145b8d85c: 488b4518                         mov rax, qword ptr [rbp + 0x18]
145b8d860: 46892ce0                         mov dword ptr [rax + r12*8], r13d
145b8d864: f3460f115ce004                   movss dword ptr [rax + r12*8 + 4], xmm11
145b8d86b: 49ffc4                           inc r12
145b8d86e: 4c896520                         mov qword ptr [rbp + 0x20], r12
145b8d872: 4d8d6720                         lea r12, [r15 + 0x20]
145b8d876: 450f2e4718                       ucomiss xmm8, dword ptr [r15 + 0x18]
145b8d87b: 0f825effffff                     jb 0x145b8d7df
145b8d881: 458b6f14                         mov r13d, dword ptr [r15 + 0x14]
145b8d885: 4c8b7d08                         mov r15, qword ptr [rbp + 8]
145b8d889: 4c3b7df8                         cmp r15, qword ptr [rbp - 8]
145b8d88d: 0f853dffffff                     jne 0x145b8d7d0
145b8d893: c6859700000001                   mov byte ptr [rbp + 0x97], 1
145b8d89a: 4889d9                           mov rcx, rbx
145b8d89d: e89ebd4000                       call 0x145f99640
145b8d8a2: 90                               nop
145b8d8a3: e928ffffff                       jmp 0x145b8d7d0

; combined-hot-health
145b8d9ef: f3440f1096c4040000               movss xmm10, dword ptr [rsi + 0x4c4]
145b8d9f8: f3440f59d6                       mulss xmm10, xmm6
145b8d9fd: f3440f1086a0040000               movss xmm8, dword ptr [rsi + 0x4a0]
145b8da06: f3440f109e08050000               movss xmm11, dword ptr [rsi + 0x508]
145b8da0f: 450f2ec3                         ucomiss xmm8, xmm11
145b8da13: 450f28e3                         movaps xmm12, xmm11
145b8da17: 0f86b6000000                     jbe 0x145b8dad3
145b8da1d: 410f28ca                         movaps xmm1, xmm10
145b8da21: f3410f58cb                       addss xmm1, xmm11
145b8da26: f3410f58c9                       addss xmm1, xmm9
145b8da2b: 0f28d1                           movaps xmm2, xmm1
145b8da2e: f3410f5dd0                       minss xmm2, xmm8
145b8da33: 0f28c2                           movaps xmm0, xmm2
145b8da36: f30fc2c203                       cmpunordss xmm0, xmm2
145b8da3b: 0f54c8                           andps xmm1, xmm0
145b8da3e: 0f55c2                           andnps xmm0, xmm2
145b8da41: 0f56c1                           orps xmm0, xmm1
145b8da44: f30f118608050000                 movss dword ptr [rsi + 0x508], xmm0

; hot-meter-credits
145b8dbb6: 488b4520                         mov rax, qword ptr [rbp + 0x20]
145b8dbba: 4885c0                           test rax, rax
145b8dbbd: 7441                             je 0x145b8dc00
145b8dbbf: 4c8bb580000000                   mov r14, qword ptr [rbp + 0x80]
145b8dbc6: 498d1cc6                         lea rbx, [r14 + rax*8]
145b8dbca: 488d7d28                         lea rdi, [rbp + 0x28]
145b8dbce: 6690                             nop
145b8dbd0: 458b06                           mov r8d, dword ptr [r14]
145b8dbd3: f3410f104e04                     movss xmm1, dword ptr [r14 + 4]
145b8dbd9: f3410f59c8                       mulss xmm1, xmm8
145b8dbde: f3410f5ec9                       divss xmm1, xmm9
145b8dbe3: 48c74528feffffff                 mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
145b8dbeb: 4889f1                           mov rcx, rsi
145b8dbee: 4989f9                           mov r9, rdi
145b8dbf1: e88a540000                       call 0x145b93080
145b8dbf6: 90                               nop
145b8dbf7: 4983c608                         add r14, 8
145b8dbfb: 4939de                           cmp r14, rbx
145b8dbfe: 75d0                             jne 0x145b8dbd0

; merged-aura-stacks
145b8bd9c: f30f10b1dc0b0000                 movss xmm6, dword ptr [rcx + 0xbdc]
145b8bda4: 48c745f800000000                 mov qword ptr [rbp - 8], 0
145b8bdac: 48c7450004000000                 mov qword ptr [rbp], 4
145b8bdb4: 48c7450800000000                 mov qword ptr [rbp + 8], 0
145b8bdbc: 488bb1b0030000                   mov rsi, qword ptr [rcx + 0x3b0]
145b8bdc3: 488b99b8030000                   mov rbx, qword ptr [rcx + 0x3b8]
145b8bdca: 48c1e305                         shl rbx, 5
145b8bdce: 4c8d341e                         lea r14, [rsi + rbx]
145b8bdd2: 488d7df8                         lea rdi, [rbp - 8]
145b8bdd6: 4989f7                           mov r15, rsi
145b8bdd9: 4d39f7                           cmp r15, r14
145b8bddc: 0f84d3000000                     je 0x145b8beb5
145b8bde2: 4983c720                         add r15, 0x20
145b8bde6: 662e0f1f840000000000             nop word ptr cs:[rax + rax]
145b8bdf0: f3410f107ff8                     movss xmm7, dword ptr [r15 - 8]
145b8bdf6: 0f2efe                           ucomiss xmm7, xmm6
145b8bdf9: 7715                             ja 0x145b8be10
145b8bdfb: 4d39f7                           cmp r15, r14
145b8bdfe: 4d8d7f20                         lea r15, [r15 + 0x20]
145b8be02: 75ec                             jne 0x145b8bdf0
145b8be04: e9ac000000                       jmp 0x145b8beb5
145b8be09: 0f1f8000000000                   nop dword ptr [rax]
145b8be10: 488b4500                         mov rax, qword ptr [rbp]
145b8be14: 4c8b6508                         mov r12, qword ptr [rbp + 8]
145b8be18: 458b6ff4                         mov r13d, dword ptr [r15 - 0xc]
145b8be1c: 4a8d0ca500000000                 lea rcx, [r12*4]
145b8be24: 488d1449                         lea rdx, [rcx + rcx*2]
145b8be28: 4531c0                           xor r8d, r8d
145b8be2b: 0f1f440000                       nop dword ptr [rax + rax]
145b8be30: 4c39c2                           cmp rdx, r8
145b8be33: 744b                             je 0x145b8be80
145b8be35: 498d480c                         lea rcx, [r8 + 0xc]
145b8be39: 46392c00                         cmp dword ptr [rax + r8], r13d
145b8be3d: 4989c8                           mov r8, rcx
145b8be40: 75ee                             jne 0x145b8be30
145b8be42: ff4408fc                         inc dword ptr [rax + rcx - 4]
145b8be46: f30f104408f8                     movss xmm0, dword ptr [rax + rcx - 8]
145b8be4c: 0f28c8                           movaps xmm1, xmm0
145b8be4f: f3410f5f4ff8                     maxss xmm1, dword ptr [r15 - 8]
145b8be55: 0f28d1                           movaps xmm2, xmm1
145b8be58: f30fc2d103                       cmpunordss xmm2, xmm1
145b8be5d: 0f54c2                           andps xmm0, xmm2
145b8be60: 0f55d1                           andnps xmm2, xmm1
145b8be63: 0f56d0                           orps xmm2, xmm0
145b8be66: f30f115408f8                     movss dword ptr [rax + rcx - 8], xmm2
145b8be6c: e968ffffff                       jmp 0x145b8bdd9
145b8be71: 6666666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
145b8be80: 4c3b65f8                         cmp r12, qword ptr [rbp - 8]
145b8be84: 750d                             jne 0x145b8be93
145b8be86: 4889f9                           mov rcx, rdi
145b8be89: e8728d4300                       call 0x145fc4c00
145b8be8e: 90                               nop
145b8be8f: 488b4500                         mov rax, qword ptr [rbp]
145b8be93: 4b8d0c64                         lea rcx, [r12 + r12*2]
145b8be97: 44892c88                         mov dword ptr [rax + rcx*4], r13d
145b8be9b: f30f117c8804                     movss dword ptr [rax + rcx*4 + 4], xmm7
145b8bea1: c744880801000000                 mov dword ptr [rax + rcx*4 + 8], 1
145b8bea9: 49ffc4                           inc r12
145b8beac: 4c896508                         mov qword ptr [rbp + 8], r12
145b8beb0: e924ffffff                       jmp 0x145b8bdd9
