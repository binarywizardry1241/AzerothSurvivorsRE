00000001400b38d9: 418b88e0000000                 mov ecx, dword ptr [r8 + 0xe0]
00000001400b38e0: 413b4c2440                     cmp ecx, dword ptr [r12 + 0x40]
00000001400b38e5: 0f84300e0000                   je 0x1400b471b
00000001400b38eb: 488b95d0030000                 mov rdx, qword ptr [rbp + 0x3d0]
00000001400b38f2: f30f10725c                     movss xmm6, dword ptr [rdx + 0x5c]
00000001400b38f7: 41837c241001                   cmp dword ptr [r12 + 0x10], 1
00000001400b38fd: 751b                           jne 0x1400b391a
00000001400b38ff: 0f28c6                         movaps xmm0, xmm6
00000001400b3902: f3410f5c442414                 subss xmm0, dword ptr [r12 + 0x14]
00000001400b3909: f30f100d9f81e105               movss xmm1, dword ptr [rip + 0x5e1819f]
00000001400b3911: 0f2ec8                         ucomiss xmm1, xmm0
00000001400b3914: 0f87010e0000                   ja 0x1400b471b
00000001400b391a: 4883bdb003000000               cmp qword ptr [rbp + 0x3b0], 0
00000001400b3922: 0f84f30d0000                   je 0x1400b471b
