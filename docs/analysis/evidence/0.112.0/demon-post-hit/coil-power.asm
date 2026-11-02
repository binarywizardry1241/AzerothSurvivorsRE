145957ace 49c1ea28 shr r10, 0x28
145957ad2 0f57c0 xorps xmm0, xmm0
145957ad5 f3410f2ac2 cvtsi2ss xmm0, r10d
145957ada f30f59055eaf5600 mulss xmm0, dword ptr [rip + 0x56af5e]
145957ae2 f30f1185cc000000 movss dword ptr [rbp + 0xcc], xmm0
145957aea 450fb6442475 movzx r8d, byte ptr [r12 + 0x75]
145957af0 4180c0fe add r8b, 0xfe
145957af4 0f28c3 movaps xmm0, xmm3
145957af7 4180f806 cmp r8b, 6
145957afb 7711 ja 0x145957b0e
145957afd 450fb6c0 movzx r8d, r8b
145957b01 4c8d0d7c442b01 lea r9, [rip + 0x12b447c]
145957b08 f3430f100481 movss xmm0, dword ptr [r9 + r8*4]
145957b0e f30f108b8c040000 movss xmm1, dword ptr [rbx + 0x48c]
145957b16 f30f114d34 movss dword ptr [rbp + 0x34], xmm1
145957b1b f30f108b80040000 movss xmm1, dword ptr [rbx + 0x480]
145957b23 f3450f10642444 movss xmm12, dword ptr [r12 + 0x44]
145957b2a f30f598dac000000 mulss xmm1, dword ptr [rbp + 0xac]
145957b32 450f57f6 xorps xmm14, xmm14
145957b36 0f57d2 xorps xmm2, xmm2
145957b39 f3410fc2d401 cmpltss xmm2, xmm12
145957b3f 0f54d1 andps xmm2, xmm1
145957b42 f3440f592549984500 mulss xmm12, dword ptr [rip + 0x459849]
145957b4b f3440f596570 mulss xmm12, dword ptr [rbp + 0x70]
145957b51 f3440f59a598000000 mulss xmm12, dword ptr [rbp + 0x98]
145957b5a f3440f59e0 mulss xmm12, xmm0
145957b5f f3440f58e2 addss xmm12, xmm2
145957b64 f3440f59a384040000 mulss xmm12, dword ptr [rbx + 0x484]
145957b6d f30f108390040000 movss xmm0, dword ptr [rbx + 0x490]
145957b75 f3410f59c4 mulss xmm0, xmm12
145957b7a 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
