145b9e1e0: push rsi
145b9e1e1: sub rsp, 0x40
145b9e1e5: movaps xmmword ptr [rsp + 0x30], xmm7
145b9e1ea: movaps xmmword ptr [rsp + 0x20], xmm6
145b9e1ef: cmp byte ptr [rcx + 0xc4], 0
145b9e1f6: je 0x145b9e20a
145b9e1f8: movss xmm0, dword ptr [rcx + 0xc0]
145b9e200: mov eax, 1
145b9e205: jmp 0x145b9e3a4
145b9e20a: cmp qword ptr [rcx + 0x58], -1
145b9e20f: je 0x145b9e260
145b9e211: movsd xmm0, qword ptr [rcx + 0x90]
145b9e219: unpcklps xmm1, xmm2
145b9e21c: subps xmm1, xmm0
145b9e21f: addps xmm1, xmm1
145b9e222: xorps xmm0, xmm0
145b9e225: movaps xmm2, xmm1
145b9e228: cmpltps xmm2, xmm0
145b9e22c: unpcklps xmm2, xmm2
145b9e22f: movmskpd edx, xmm2
145b9e233: xor eax, eax
145b9e235: test edx, edx
145b9e237: jne 0x145b9e2d4
145b9e23d: mov rdx, qword ptr [rcx + 0x88]
145b9e244: test rdx, rdx
145b9e247: js 0x145b9e2d9
145b9e24d: xorps xmm0, xmm0
145b9e250: cvtsi2ss xmm0, rdx
145b9e255: ucomiss xmm1, xmm0
145b9e258: jb 0x145b9e2fa
145b9e25e: jmp 0x145b9e2d4
145b9e260: mov rsi, rcx
145b9e263: movaps xmm6, xmm1
145b9e266: movaps xmm7, xmm2
145b9e269: call 0x145b9a340
145b9e26e: test al, 1
145b9e270: je 0x145b9e2d2
145b9e272: mov eax, 1
145b9e277: cmp qword ptr [rsi + 0x98], -1
145b9e27f: je 0x145b9e3a4
145b9e285: mov r8, rsi
145b9e288: movsd xmm2, qword ptr [rsi + 0xb8]
145b9e290: movaps xmm1, xmm6
145b9e293: unpcklps xmm1, xmm7
145b9e296: subps xmm1, xmm2
145b9e299: addps xmm1, xmm1
145b9e29c: xorps xmm2, xmm2
145b9e29f: movaps xmm3, xmm1
145b9e2a2: cmpltps xmm3, xmm2
145b9e2a6: unpcklps xmm3, xmm3
145b9e2a9: movmskpd ecx, xmm3
145b9e2ad: test ecx, ecx
145b9e2af: jne 0x145b9e3a4
145b9e2b5: mov rdx, qword ptr [r8 + 0xb0]
145b9e2bc: test rdx, rdx
145b9e2bf: js 0x145b9e3b4
145b9e2c5: xorps xmm3, xmm3
145b9e2c8: cvtsi2ss xmm3, rdx
145b9e2cd: jmp 0x145b9e3d0
145b9e2d2: xor eax, eax
145b9e2d4: jmp 0x145b9e3a4
145b9e2d9: mov r8, rdx
145b9e2dc: shr r8, 1
145b9e2df: mov r9d, edx
145b9e2e2: and r9d, 1
145b9e2e6: or r9, r8
145b9e2e9: xorps xmm0, xmm0
145b9e2ec: cvtsi2ss xmm0, r9
145b9e2f1: addss xmm0, xmm0
145b9e2f5: ucomiss xmm1, xmm0
145b9e2f8: jae 0x145b9e2d4
145b9e2fa: movshdup xmm2, xmm1
145b9e2fe: ucomiss xmm2, xmm0
145b9e301: jae 0x145b9e3a4
145b9e307: movss xmm0, dword ptr [rip + 0x6b17b1]
145b9e30f: movaps xmm3, xmm2
145b9e312: subss xmm3, xmm0
145b9e316: cvttss2si rax, xmm3
145b9e31b: cvttss2si r8, xmm2
145b9e320: mov r9, r8
145b9e323: sar r9, 0x3f
145b9e327: and r9, rax
145b9e32a: or r9, r8
145b9e32d: xor r8d, r8d
145b9e330: xorps xmm3, xmm3
145b9e333: ucomiss xmm2, xmm3
145b9e336: cmovb r9, r8
145b9e33a: movss xmm4, dword ptr [rip + 0x6b1782]
145b9e342: ucomiss xmm2, xmm4
145b9e345: mov r10, 0xffffffffffffffff
145b9e34c: cmova r9, r10
145b9e350: imul rdx, r9
145b9e354: movaps xmm2, xmm1
145b9e357: subss xmm2, xmm0
145b9e35b: cvttss2si r9, xmm2
145b9e360: cvttss2si r11, xmm1
145b9e365: mov rax, r11
145b9e368: sar rax, 0x3f
145b9e36c: and rax, r9
145b9e36f: or rax, r11
145b9e372: ucomiss xmm1, xmm3
145b9e375: cmovb rax, r8
145b9e379: ucomiss xmm1, xmm4
145b9e37c: cmova rax, r10
145b9e380: add rax, rdx
145b9e383: mov rdx, qword ptr [rcx + 0x80]
145b9e38a: cmp rax, rdx
145b9e38d: jae 0x145b9e48f
145b9e393: mov rcx, qword ptr [rcx + 0x78]
145b9e397: movss xmm0, dword ptr [rcx + rax*4]
145b9e39c: xor eax, eax
145b9e39e: ucomiss xmm0, xmm0
145b9e3a1: setnp al
145b9e3a4: movaps xmm6, xmmword ptr [rsp + 0x20]
145b9e3a9: movaps xmm7, xmmword ptr [rsp + 0x30]
145b9e3ae: add rsp, 0x40
145b9e3b2: pop rsi
145b9e3b3: ret
145b9e3b4: mov rcx, rdx
145b9e3b7: shr rcx, 1
145b9e3ba: mov r9d, edx
145b9e3bd: and r9d, 1
145b9e3c1: or r9, rcx
145b9e3c4: xorps xmm3, xmm3
145b9e3c7: cvtsi2ss xmm3, r9
145b9e3cc: addss xmm3, xmm3
145b9e3d0: ucomiss xmm1, xmm3
145b9e3d3: jae 0x145b9e3a4
145b9e3d5: movshdup xmm2, xmm1
145b9e3d9: ucomiss xmm2, xmm3
145b9e3dc: jae 0x145b9e3a4
145b9e3de: movss xmm3, dword ptr [rip + 0x6b16da]
145b9e3e6: movaps xmm4, xmm2
145b9e3e9: subss xmm4, xmm3
145b9e3ed: cvttss2si rcx, xmm4
145b9e3f2: cvttss2si r9, xmm2
145b9e3f7: mov r10, r9
145b9e3fa: sar r10, 0x3f
145b9e3fe: and r10, rcx
145b9e401: or r10, r9
145b9e404: xor r9d, r9d
145b9e407: xorps xmm4, xmm4
145b9e40a: ucomiss xmm2, xmm4
145b9e40d: cmovb r10, r9
145b9e411: movss xmm5, dword ptr [rip + 0x6b16ab]
145b9e419: ucomiss xmm2, xmm5
145b9e41c: mov r11, 0xffffffffffffffff
145b9e423: cmova r10, r11
145b9e427: imul rdx, r10
145b9e42b: movaps xmm2, xmm1
145b9e42e: subss xmm2, xmm3
145b9e432: cvttss2si r10, xmm2
145b9e437: cvttss2si rsi, xmm1
145b9e43c: mov rcx, rsi
145b9e43f: sar rcx, 0x3f
145b9e443: and rcx, r10
145b9e446: or rcx, rsi
145b9e449: ucomiss xmm1, xmm4
145b9e44c: cmovb rcx, r9
145b9e450: ucomiss xmm1, xmm5
145b9e453: cmova rcx, r11
145b9e457: add rcx, rdx
145b9e45a: mov rdx, qword ptr [r8 + 0xa8]
145b9e461: cmp rcx, rdx
145b9e464: jae 0x145b9e4a0
145b9e466: mov rdx, qword ptr [r8 + 0xa0]
145b9e46d: movss xmm2, dword ptr [rdx + rcx*4]
145b9e472: ucomiss xmm2, xmm2
145b9e475: jp 0x145b9e3a4
145b9e47b: movaps xmm1, xmm2
145b9e47e: ucomiss xmm2, xmm0
145b9e481: jbe 0x145b9e3a4
145b9e487: movaps xmm0, xmm1
145b9e48a: jmp 0x145b9e3a4
145b9e48f: lea r8, [rip + 0x14e1042]
145b9e496: mov rcx, rax
145b9e499: call 0x146208d03
145b9e49e: ud2
145b9e4a0: lea r8, [rip + 0x14e0dc1]
145b9e4a7: call 0x146208d03
145b9e4ac: ud2
