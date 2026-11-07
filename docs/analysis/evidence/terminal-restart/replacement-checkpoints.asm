00000001458b79e8: 41c6856211000000               mov byte ptr [r13 + 0x1162], 0
00000001458b79f0: 0f57f6                         xorps xmm6, xmm6
00000001458b79f3: 410f11b5a8100000               movups xmmword ptr [r13 + 0x10a8], xmm6
00000001458b79fb: 410f11b5b8100000               movups xmmword ptr [r13 + 0x10b8], xmm6
00000001458b7a03: 410f11b5c8100000               movups xmmword ptr [r13 + 0x10c8], xmm6
00000001458b7a0b: 49c785d810000000000000         mov qword ptr [r13 + 0x10d8], 0
00000001458b7a16: 660fefc0                       pxor xmm0, xmm0
00000001458b7a1a: 4981bda0100000ffffff00         cmp qword ptr [r13 + 0x10a0], 0xffffff
00000001458b7a25: 7410                           je 0x1458b7a37
00000001458b7a27: 498d8d200b0000                 lea rcx, [r13 + 0xb20]
00000001458b7a2e: 4489fa                         mov edx, r15d
00000001458b7a31: e80a680200                     call 0x1458de240
00000001458b7a36: 90                             nop
00000001458b7a37: 66410f7e8520110000             movd dword ptr [r13 + 0x1120], xmm0
00000001458b7a40: 41c68566110000ff               mov byte ptr [r13 + 0x1166], 0xff
00000001458b7a48: 410f11b524110000               movups xmmword ptr [r13 + 0x1124], xmm6
00000001458b7a50: 41c7853411000000000000         mov dword ptr [r13 + 0x1134], 0
00000001458b7a5b: 488d55b8                       lea rdx, [rbp - 0x48]
00000001458b7a5f: 41b8c80a0000                   mov r8d, 0xac8
00000001458b7a65: 4889f1                         mov rcx, rsi
00000001458b7a68: e8ceae3300                     call 0x145bf293b
