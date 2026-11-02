0000000145b8d950 56                             push rsi
0000000145b8d951 4883ec50                       sub rsp, 0x50
0000000145b8d955 0f297c2440                     movaps xmmword ptr [rsp + 0x40], xmm7
0000000145b8d95a 0f29742430                     movaps xmmword ptr [rsp + 0x30], xmm6
0000000145b8d95f 0f28f2                         movaps xmm6, xmm2
0000000145b8d962 0f28f9                         movaps xmm7, xmm1
0000000145b8d965 4889ce                         mov rsi, rcx
0000000145b8d968 e8f3310000                     call 0x145b90b60
0000000145b8d96d a801                           test al, 1
0000000145b8d96f 7532                           jne 0x145b8d9a3
0000000145b8d971 48837e58ff                     cmp qword ptr [rsi + 0x58], -1
0000000145b8d976 7423                           je 0x145b8d99b
0000000145b8d978 488d5658                       lea rdx, [rsi + 0x58]
0000000145b8d97c 488d4c2420                     lea rcx, [rsp + 0x20]
0000000145b8d981 0f28d7                         movaps xmm2, xmm7
0000000145b8d984 0f28de                         movaps xmm3, xmm6
0000000145b8d987 e8548a0000                     call 0x145b963e0
0000000145b8d98c 837c242001                     cmp dword ptr [rsp + 0x20], 1
0000000145b8d991 7508                           jne 0x145b8d99b
0000000145b8d993 f30f1044242c                   movss xmm0, dword ptr [rsp + 0x2c]
0000000145b8d999 eb08                           jmp 0x145b8d9a3
0000000145b8d99b f30f1086a8000000               movss xmm0, dword ptr [rsi + 0xa8]
0000000145b8d9a3 0f28742430                     movaps xmm6, xmmword ptr [rsp + 0x30]
0000000145b8d9a8 0f287c2440                     movaps xmm7, xmmword ptr [rsp + 0x40]
0000000145b8d9ad 4883c450                       add rsp, 0x50
0000000145b8d9b1 5e                             pop rsi
0000000145b8d9b2 c3                             ret
