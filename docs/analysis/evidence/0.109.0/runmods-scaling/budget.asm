0x14593b1bb: f3410f108d340a0000 movss xmm1, dword ptr [r13 + 0xa34]
0x14593b1c4: 450fb785b0020000 movzx r8d, word ptr [r13 + 0x2b0]
0x14593b1cc: 498b8560050000 mov rax, qword ptr [r13 + 0x560]
0x14593b1d3: 498b9568050000 mov rdx, qword ptr [r13 + 0x568]
0x14593b1da: 4869cad8010000 imul rcx, rdx, 0x1d8
0x14593b1e1: 4801c1 add rcx, rax
0x14593b1e4: 4885d2 test rdx, rdx
0x14593b1e7: 4c8b9da0030000 mov r11, qword ptr [rbp + 0x3a0]
0x14593b1ee: f3440f1005a9204600 movss xmm8, dword ptr [rip + 0x4620a9]
0x14593b1f7: 7457 je 0x14593b250
0x14593b1f9: f3440f10059e204600 movss xmm8, dword ptr [rip + 0x46209e]
0x14593b202: f30f1015e66f4a00 movss xmm2, dword ptr [rip + 0x4a6fe6]
0x14593b20a: f30f101da61e4900 movss xmm3, dword ptr [rip + 0x491ea6]
0x14593b212: 4989c1 mov r9, rax
0x14593b215: eb15 jmp 0x14593b22c
0x14593b217: f3440f5dc4 minss xmm8, xmm4
0x14593b21c: 0f1f4000 nop dword ptr [rax]
0x14593b220: 4981c1d8010000 add r9, 0x1d8
0x14593b227: 4939c9 cmp r9, rcx
0x14593b22a: 7424 je 0x14593b250
0x14593b22c: 4180b9b000000000 cmp byte ptr [r9 + 0xb0], 0
0x14593b234: 75ea jne 0x14593b220
0x14593b236: 49837918ff cmp qword ptr [r9 + 0x18], -1
0x14593b23b: 74e3 je 0x14593b220
0x14593b23d: 4d8b5130 mov r10, qword ptr [r9 + 0x30]
0x14593b241: 41807a6400 cmp byte ptr [r10 + 0x64], 0
0x14593b246: 0f28e2 movaps xmm4, xmm2
0x14593b249: 75cc jne 0x14593b217
0x14593b24b: 0f28e3 movaps xmm4, xmm3
0x14593b24e: ebc7 jmp 0x14593b217
0x14593b250: 0f28d1 movaps xmm2, xmm1
0x14593b253: f30f5e15e5524b00 divss xmm2, dword ptr [rip + 0x4b52e5]
0x14593b25b: f30f101d9d9b4900 movss xmm3, dword ptr [rip + 0x499b9d]
0x14593b263: f30f59da mulss xmm3, xmm2
0x14593b267: f30f581d6d1e4900 addss xmm3, dword ptr [rip + 0x491e6d]
0x14593b26f: f30f102579445800 movss xmm4, dword ptr [rip + 0x584479]
0x14593b277: f30f59e2 mulss xmm4, xmm2
0x14593b27b: f30f59e2 mulss xmm4, xmm2
0x14593b27f: f30f58e3 addss xmm4, xmm3
0x14593b283: 450fb7c0 movzx r8d, r8w
0x14593b287: 0f57d2 xorps xmm2, xmm2
0x14593b28a: f3410f2ad0 cvtsi2ss xmm2, r8d
0x14593b28f: f30f5925651e4900 mulss xmm4, dword ptr [rip + 0x491e65]
0x14593b297: f30f5e1531204600 divss xmm2, dword ptr [rip + 0x462031]
0x14593b29f: f30f59d4 mulss xmm2, xmm4
0x14593b2a3: f3440f59c2 mulss xmm8, xmm2
0x14593b2a8: 450fb685b80a0000 movzx r8d, byte ptr [r13 + 0xab8]
0x14593b2b0: 4180f801 cmp r8b, 1
0x14593b2b4: 7544 jne 0x14593b2fa
0x14593b2b6: 4183bd7009000001 cmp dword ptr [r13 + 0x970], 1
0x14593b2be: 752d jne 0x14593b2ed
0x14593b2c0: 0f28d9 movaps xmm3, xmm1
0x14593b2c3: f3410f5c9d74090000 subss xmm3, dword ptr [r13 + 0x974]
0x14593b2cc: f30f5e1d6c524b00 divss xmm3, dword ptr [rip + 0x4b526c]
0x14593b2d4: 0f57e4 xorps xmm4, xmm4
0x14593b2d7: f30f5fdc maxss xmm3, xmm4
0x14593b2db: f30f591ded1d4900 mulss xmm3, dword ptr [rip + 0x491ded]
0x14593b2e3: f30f581ddd994900 addss xmm3, dword ptr [rip + 0x4999dd]
0x14593b2eb: eb08 jmp 0x14593b2f5
0x14593b2ed: f30f101dd3994900 movss xmm3, dword ptr [rip + 0x4999d3]
0x14593b2f5: f3440f59c3 mulss xmm8, xmm3
