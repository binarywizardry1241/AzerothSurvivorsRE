145925d75 448b7668 mov r14d, dword ptr [rsi + 0x68]
145925d79 f3440f10566c movss xmm10, dword ptr [rsi + 0x6c]
145925d7f 418d46ff lea eax, [r14 - 1]
145925d83 83f80a cmp eax, 0xa
145925d86 0f8758290000 ja 0x1459286e4
145925d8c f3410f10442450 movss xmm0, dword ptr [r12 + 0x50]
145925d93 488d0dde652e01 lea rcx, [rip + 0x12e65de]
145925d9a 48630481 movsxd rax, dword ptr [rcx + rax*4]
145925d9e 4801c8 add rax, rcx
145925da1 ffe0 jmp rax
145925da3 f3440f59d0 mulss xmm10, xmm0
