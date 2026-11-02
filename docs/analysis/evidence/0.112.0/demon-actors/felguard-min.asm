0x1459efab0: 4883ec28 sub rsp, 0x28
0x1459efab4: 0f297c2410 movaps xmmword ptr [rsp + 0x10], xmm7
0x1459efab9: 0f293424 movaps xmmword ptr [rsp], xmm6
0x1459efabd: 4989d0 mov r8, rdx
0x1459efac0: 4c8b09 mov r9, qword ptr [rcx]
0x1459efac3: 488b4108 mov rax, qword ptr [rcx + 8]
0x1459efac7: 4939c1 cmp r9, rax
0x1459efaca: 0f8446010000 je 0x1459efc16
0x1459efad0: 4c8b5118 mov r10, qword ptr [rcx + 0x18]
0x1459efad4: 4c8b5920 mov r11, qword ptr [rcx + 0x20]
0x1459efad8: 488b4910 mov rcx, qword ptr [rcx + 0x10]
0x1459efadc: 4c29c8 sub rax, r9
0x1459efadf: 48ba236838a9fbf2d88a movabs rdx, 0x8ad8f2fba9386823
0x1459efae9: 48f7e2 mul rdx
0x1459efaec: 48c1ea08 shr rdx, 8
0x1459efaf0: 4981c1d0010000 add r9, 0x1d0
0x1459efaf7: 0f57c9 xorps xmm1, xmm1
0x1459efafa: f30f101d5ed73b00 movss xmm3, dword ptr [rip + 0x3bd75e]
0x1459efb02: f30f1025d6e83c00 movss xmm4, dword ptr [rip + 0x3ce8d6]
0x1459efb0a: 660f1f440000 nop word ptr [rax + rax]
0x1459efb10: 4180b9e0feffff00 cmp byte ptr [r9 - 0x120], 0
0x1459efb18: 0f8592000000 jne 0x1459efbb0
0x1459efb1e: 4983b948feffffff cmp qword ptr [r9 - 0x1b8], -1
0x1459efb26: 750a jne 0x1459efb32
0x1459efb28: 41803900 cmp byte ptr [r9], 0
0x1459efb2c: 0f847e000000 je 0x1459efbb0
0x1459efb32: f30f1001 movss xmm0, dword ptr [rcx]
0x1459efb36: 410f2e41d8 ucomiss xmm0, dword ptr [r9 - 0x28]
0x1459efb3b: 7273 jb 0x1459efbb0
0x1459efb3d: f3410f1041c0 movss xmm0, dword ptr [r9 - 0x40]
0x1459efb43: 0f2ec8 ucomiss xmm1, xmm0
0x1459efb46: 7338 jae 0x1459efb80
0x1459efb48: f3410f102a movss xmm5, dword ptr [r10]
0x1459efb4d: f3410f5c69bc subss xmm5, dword ptr [r9 - 0x44]
0x1459efb53: f30f5ee8 divss xmm5, xmm0
0x1459efb57: 0f57c0 xorps xmm0, xmm0
0x1459efb5a: f30f5fc5 maxss xmm0, xmm5
0x1459efb5e: 0f28eb movaps xmm5, xmm3
0x1459efb61: f30f5de8 minss xmm5, xmm0
0x1459efb65: f2410f1071a4 movsd xmm6, qword ptr [r9 - 0x5c]
0x1459efb6b: f2410f1079b0 movsd xmm7, qword ptr [r9 - 0x50]
0x1459efb71: 0f5cfe subps xmm7, xmm6
0x1459efb74: f30f12c5 movsldup xmm0, xmm5
0x1459efb78: 0f59c7 mulps xmm0, xmm7
0x1459efb7b: 0f58c6 addps xmm0, xmm6
0x1459efb7e: eb06 jmp 0x1459efb86
0x1459efb80: f2410f1041b0 movsd xmm0, qword ptr [r9 - 0x50]
0x1459efb86: f2410f10abd0040000 movsd xmm5, qword ptr [r11 + 0x4d0]
0x1459efb8f: 0f5cc5 subps xmm0, xmm5
0x1459efb92: 0f59c0 mulps xmm0, xmm0
0x1459efb95: f30f16e8 movshdup xmm5, xmm0
0x1459efb99: f30f58e8 addss xmm5, xmm0
0x1459efb9d: 0f57c0 xorps xmm0, xmm0
0x1459efba0: f30f51c5 sqrtss xmm0, xmm5
0x1459efba4: 0f2ee0 ucomiss xmm4, xmm0
0x1459efba7: 731f jae 0x1459efbc8
0x1459efba9: 0f1f8000000000 nop dword ptr [rax]
0x1459efbb0: 0f28c2 movaps xmm0, xmm2
0x1459efbb3: 4981c1d8010000 add r9, 0x1d8
0x1459efbba: 0f28d0 movaps xmm2, xmm0
0x1459efbbd: 48ffca dec rdx
0x1459efbc0: 0f854affffff jne 0x1459efb10
0x1459efbc6: eb51 jmp 0x1459efc19
0x1459efbc8: f3410f104188 movss xmm0, dword ptr [r9 - 0x78]
0x1459efbce: f3410f10698c movss xmm5, dword ptr [r9 - 0x74]
0x1459efbd4: f30f5feb maxss xmm5, xmm3
0x1459efbd8: f30f5ec5 divss xmm0, xmm5
0x1459efbdc: 0f28ea movaps xmm5, xmm2
0x1459efbdf: 0f14e8 unpcklps xmm5, xmm0
0x1459efbe2: 0f28f5 movaps xmm6, xmm5
0x1459efbe5: 660f72e61f psrad xmm6, 0x1f
0x1459efbea: 660f72d601 psrld xmm6, 1
0x1459efbef: 660feff5 pxor xmm6, xmm5
0x1459efbf3: 660f70ee55 pshufd xmm5, xmm6, 0x55
0x1459efbf8: 660f66f5 pcmpgtd xmm6, xmm5
0x1459efbfc: 660f7ef0 movd eax, xmm6
0x1459efc00: a801 test al, 1
0x1459efc02: 7507 jne 0x1459efc0b
0x1459efc04: 0f28c2 movaps xmm0, xmm2
0x1459efc07: 74aa je 0x1459efbb3
0x1459efc09: eb02 jmp 0x1459efc0d
0x1459efc0b: 74a6 je 0x1459efbb3
0x1459efc0d: 4d8b8120ffffff mov r8, qword ptr [r9 - 0xe0]
0x1459efc14: eb9d jmp 0x1459efbb3
0x1459efc16: 0f28c2 movaps xmm0, xmm2
0x1459efc19: 4c89c0 mov rax, r8
0x1459efc1c: 0f283424 movaps xmm6, xmmword ptr [rsp]
0x1459efc20: 0f287c2410 movaps xmm7, xmmword ptr [rsp + 0x10]
0x1459efc25: 4883c428 add rsp, 0x28
0x1459efc29: c3 ret
