0000000145c58fd6 49837c2460ff                   cmp qword ptr [r12 + 0x60], -1
0000000145c58fdc 0f848c0d0000                   je 0x145c59d6e
0000000145c58fe2 4180bc244101000000             cmp byte ptr [r12 + 0x141], 0
0000000145c58feb 0f857d0d0000                   jne 0x145c59d6e
0000000145c58ff1 498bbc2490010000               mov rdi, qword ptr [r12 + 0x190]
0000000145c58ff9 498b8c2430010000               mov rcx, qword ptr [r12 + 0x130]
0000000145c59001 498b842438010000               mov rax, qword ptr [r12 + 0x138]
0000000145c59009 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145c5900d c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c59014 ffd0                           call rax
0000000145c59016 90                             nop
0000000145c59017 84c0                           test al, al
0000000145c59019 743f                           je 0x145c5905a
0000000145c5901b 0fb6c0                         movzx eax, al
0000000145c5901e 83f801                         cmp eax, 1
0000000145c59021 0f8592000000                   jne 0x145c590b9
0000000145c59027 c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c5902e 488b4d30                       mov rcx, qword ptr [rbp + 0x30]
0000000145c59032 e819c93300                     call 0x145f95950
0000000145c59037 90                             nop
0000000145c59038 4885c0                         test rax, rax
0000000145c5903b 7844                           js 0x145c59081
0000000145c5903d 0f57c0                         xorps xmm0, xmm0
0000000145c59040 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145c59045 eb52                           jmp 0x145c59099
0000000145c59047 31f6                           xor esi, esi
0000000145c59049 4889f1                         mov rcx, rsi
0000000145c5904c 4889da                         mov rdx, rbx
0000000145c5904f e867b05300                     call 0x1461940bb
0000000145c59054 90                             nop
0000000145c59055 e9ac120000                     jmp 0x145c5a306
0000000145c5905a c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c59061 488b4d38                       mov rcx, qword ptr [rbp + 0x38]
0000000145c59065 e8e6c83300                     call 0x145f95950
0000000145c5906a 90                             nop
0000000145c5906b 4885c0                         test rax, rax
0000000145c5906e 0f88b5010000                   js 0x145c59229
0000000145c59074 0f57c0                         xorps xmm0, xmm0
0000000145c59077 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145c5907c e9c0010000                     jmp 0x145c59241
0000000145c59081 4889c1                         mov rcx, rax
0000000145c59084 48d1e9                         shr rcx, 1
0000000145c59087 83e001                         and eax, 1
0000000145c5908a 4809c8                         or rax, rcx
0000000145c5908d 0f57c0                         xorps xmm0, xmm0
0000000145c59090 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145c59095 f30f58c0                       addss xmm0, xmm0
0000000145c59099 0f57c9                         xorps xmm1, xmm1
0000000145c5909c f30f2aca                       cvtsi2ss xmm1, edx
0000000145c590a0 f30f5e0d28365e00               divss xmm1, dword ptr [rip + 0x5e3628]
0000000145c590a8 f30f58c8                       addss xmm1, xmm0
0000000145c590ac 0f2e0dad2b5500                 ucomiss xmm1, dword ptr [rip + 0x552bad]
0000000145c590b3 0f86a8010000                   jbe 0x145c59261
0000000145c590b9 4180bc244001000000             cmp byte ptr [r12 + 0x140], 0
0000000145c590c2 7420                           je 0x145c590e4
0000000145c590c4 418bb42428010000               mov esi, dword ptr [r12 + 0x128]
0000000145c590cc 83feff                         cmp esi, -1
0000000145c590cf 0f843d020000                   je 0x145c59312
0000000145c590d5 498b842420010000               mov rax, qword ptr [r12 + 0x120]
0000000145c590dd 89f2                           mov edx, esi
0000000145c590df e94b020000                     jmp 0x145c5932f
0000000145c590e4 488b4550                       mov rax, qword ptr [rbp + 0x50]
0000000145c590e8 488b08                         mov rcx, qword ptr [rax]
0000000145c590eb 48c700ffffffff                 mov qword ptr [rax], 0xffffffffffffffff
0000000145c590f2 4883f9ff                       cmp rcx, -1
0000000145c590f6 0f84f3020000                   je 0x145c593ef
0000000145c590fc 48898db8020000                 mov qword ptr [rbp + 0x2b8], rcx
0000000145c59103 498b8424e0000000               mov rax, qword ptr [r12 + 0xe0]
0000000145c5910b 488985f8020000                 mov qword ptr [rbp + 0x2f8], rax
0000000145c59112 4d8bbc24e8000000               mov r15, qword ptr [r12 + 0xe8]
0000000145c5911a 498b8c2430010000               mov rcx, qword ptr [r12 + 0x130]
0000000145c59122 498b842438010000               mov rax, qword ptr [r12 + 0x138]
0000000145c5912a 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145c5912e c6853003000001                 mov byte ptr [rbp + 0x330], 1
0000000145c59135 ffd0                           call rax
0000000145c59137 90                             nop
0000000145c59138 c6853003000001                 mov byte ptr [rbp + 0x330], 1
0000000145c5913f 488b8df8020000                 mov rcx, qword ptr [rbp + 0x2f8]
0000000145c59146 4c89fa                         mov rdx, r15
0000000145c59149 ffd7                           call rdi
0000000145c5914b 488985d0020000                 mov qword ptr [rbp + 0x2d0], rax
0000000145c59152 488995c8020000                 mov qword ptr [rbp + 0x2c8], rdx
