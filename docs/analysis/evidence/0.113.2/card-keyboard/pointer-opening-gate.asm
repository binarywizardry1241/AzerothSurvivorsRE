00000001400b54ba: 4c8b442458                     mov r8, qword ptr [rsp + 0x58]
00000001400b54bf: 418b5010                       mov edx, dword ptr [r8 + 0x10]
00000001400b54c3: 85d2                           test edx, edx
00000001400b54c5: 7405                           je 0x1400b54cc
00000001400b54c7: 4531c0                         xor r8d, r8d
00000001400b54ca: eb10                           jmp 0x1400b54dc
00000001400b54cc: 0f28c6                         movaps xmm0, xmm6
00000001400b54cf: f3410f5c4044                   subss xmm0, dword ptr [r8 + 0x44]
00000001400b54d5: 0f2ec7                         ucomiss xmm0, xmm7
00000001400b54d8: 410f93c0                       setae r8b
