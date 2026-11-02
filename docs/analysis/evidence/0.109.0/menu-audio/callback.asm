;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1409705b0..0x140970ba3 SHA256 48b339af4e2b05420611b47b7b1d375344dac4bd879a7768a0c407f4c065617d
0x1409705b0: push r15
0x1409705b2: push r14
0x1409705b4: push r12
0x1409705b6: push rsi
0x1409705b7: push rdi
0x1409705b8: push rbp
0x1409705b9: push rbx
0x1409705ba: sub rsp, 0x50
0x1409705be: movdqa xmmword ptr [rsp + 0x40], xmm8
0x1409705c5: movdqa xmmword ptr [rsp + 0x30], xmm7
0x1409705cb: movdqa xmmword ptr [rsp + 0x20], xmm6
0x1409705d1: mov rdi, qword ptr [rdx + 8]
0x1409705d5: mov r15, qword ptr [r8]
0x1409705d8: mov r12, qword ptr [r8 + 0x10]
0x1409705dc: mov ebp, dword ptr [r8 + 0x1c]
0x1409705e0: mov rcx, qword ptr [rdi + 0x38]
0x1409705e4: mov rdx, qword ptr [rdi + 0x40]
0x1409705e8: call 0x140089200
0x1409705ed: mov rcx, rax
0x1409705f0: call 0x145bdb8d0
0x1409705f5: pxor xmm6, xmm6
0x1409705f9: test al, 1
0x1409705fb: jne 0x140970605
0x1409705fd: shr rax, 0x20
0x140970601: movd xmm6, eax
0x140970605: mov rsi, qword ptr [rdi + 0x10]
0x140970609: test rsi, rsi
0x14097060c: jns 0x14097061e
0x14097060e: xor r14d, r14d
0x140970611: mov rcx, r14
0x140970614: mov rdx, rsi
0x140970617: call 0x145d992bb
0x14097061c: ud2
0x14097061e: je 0x14097065f
0x140970620: mov rbx, qword ptr [rdi + 8]
0x140970624: call 0x140002200
0x140970629: mov r14d, 1
0x14097062f: mov edx, 1
0x140970634: mov rcx, rsi
0x140970637: call 0x1400021c0
0x14097063c: test rax, rax
0x14097063f: je 0x140970611
0x140970641: mov rdi, rax
0x140970644: mov rcx, rax
0x140970647: mov rdx, rbx
0x14097064a: mov r8, rsi
0x14097064d: call 0x145bfa0e7
0x140970652: cmp rsi, 8
0x140970656: jae 0x14097067e
0x140970658: xor eax, eax
0x14097065a: jmp 0x140970781
0x14097065f: movaps xmm6, xmmword ptr [rsp + 0x20]
0x140970664: movaps xmm7, xmmword ptr [rsp + 0x30]
0x140970669: movaps xmm8, xmmword ptr [rsp + 0x40]
0x14097066f: add rsp, 0x50
0x140970673: pop rbx
0x140970674: pop rbp
0x140970675: pop rdi
0x140970676: pop rsi
0x140970677: pop r12
0x140970679: pop r14
0x14097067b: pop r15
0x14097067d: ret
0x14097067e: cmp rsi, 0x20
0x140970682: jae 0x14097068b
0x140970684: xor eax, eax
0x140970686: jmp 0x140970728
0x14097068b: movabs rax, 0x7fffffffffffffe0
0x140970695: and rax, rsi
0x140970698: xor ecx, ecx
0x14097069a: movdqa xmm0, xmmword ptr [rip + 0x542cb1e]
0x1409706a2: movdqa xmm1, xmmword ptr [rip + 0x542cb26]
0x1409706aa: movdqa xmm2, xmmword ptr [rip + 0x542cb2e]
0x1409706b2: nop word ptr cs:[rax + rax]
0x1409706c0: movdqu xmm3, xmmword ptr [rdi + rcx]
0x1409706c5: movdqu xmm4, xmmword ptr [rdi + rcx + 0x10]
0x1409706cb: movdqa xmm5, xmm3
0x1409706cf: paddb xmm5, xmm0
0x1409706d3: movdqa xmm7, xmm4
0x1409706d7: paddb xmm7, xmm0
0x1409706db: movdqa xmm8, xmm5
0x1409706e0: pminub xmm8, xmm1
0x1409706e5: pcmpeqb xmm8, xmm5
0x1409706ea: pand xmm8, xmm2
0x1409706ef: movdqa xmm5, xmm7
0x1409706f3: pminub xmm5, xmm1
0x1409706f7: pcmpeqb xmm5, xmm7
0x1409706fb: pand xmm5, xmm2
0x1409706ff: por xmm8, xmm3
0x140970704: por xmm5, xmm4
0x140970708: movdqu xmmword ptr [rdi + rcx], xmm8
0x14097070e: movdqu xmmword ptr [rdi + rcx + 0x10], xmm5
0x140970714: add rcx, 0x20
0x140970718: cmp rax, rcx
0x14097071b: jne 0x1409706c0
0x14097071d: cmp rsi, rax
0x140970720: je 0x14097079e
0x140970722: test sil, 0x18
0x140970726: je 0x140970781
0x140970728: mov rcx, rax
0x14097072b: movabs rax, 0x7ffffffffffffff8
0x140970735: and rax, rsi
0x140970738: movdqa xmm0, xmmword ptr [rip + 0x542cab0]
0x140970740: movdqa xmm1, xmmword ptr [rip + 0x542cab8]
0x140970748: movdqa xmm2, xmmword ptr [rip + 0x542cac0]
0x140970750: movq xmm3, qword ptr [rdi + rcx]
0x140970755: movdqa xmm4, xmm3
0x140970759: paddb xmm4, xmm0
0x14097075d: movdqa xmm5, xmm4
0x140970761: pmaxub xmm5, xmm1
0x140970765: pcmpeqb xmm5, xmm4
0x140970769: pandn xmm5, xmm2
0x14097076d: por xmm5, xmm3
0x140970771: movq qword ptr [rdi + rcx], xmm5
0x140970776: add rcx, 8
0x14097077a: cmp rax, rcx
0x14097077d: jne 0x140970750
0x14097077f: jmp 0x140970799
0x140970781: movzx ecx, byte ptr [rdi + rax]
0x140970785: lea edx, [rcx - 0x41]
0x140970788: cmp dl, 0x1a
0x14097078b: setb dl
0x14097078e: shl dl, 5
0x140970791: or dl, cl
0x140970793: mov byte ptr [rdi + rax], dl
0x140970796: inc rax
0x140970799: cmp rsi, rax
0x14097079c: jne 0x140970781
0x14097079e: lea rax, [rsi - 0xb]
0x1409707a2: cmp rax, 0x14
0x1409707a6: ja 0x140970b74
0x1409707ac: lea rcx, [rip + 0x5573865]
0x1409707b3: movsxd rax, dword ptr [rcx + rax*4]
0x1409707b7: add rax, rcx
0x1409707ba: jmp rax
0x1409707bc: movabs rax, 0x6c6f76646e756f73
0x1409707c6: xor rax, qword ptr [rdi]
0x1409707c9: movabs rcx, 0x656d756c6f76646e
0x1409707d3: xor rcx, qword ptr [rdi + 3]
0x1409707d7: or rcx, rax
0x1409707da: je 0x140970aeb
0x1409707e0: movabs rax, 0x6c6f76636973756d
0x1409707ea: xor rax, qword ptr [rdi]
0x1409707ed: movabs rcx, 0x656d756c6f766369
0x1409707f7: xor rcx, qword ptr [rdi + 3]
0x1409707fb: or rcx, rax
0x1409707fe: je 0x140970b24
0x140970804: movabs rax, 0x756d656c62616e65
0x14097080e: xor rax, qword ptr [rdi]
0x140970811: movabs rcx, 0x636973756d656c62
0x14097081b: xor rcx, qword ptr [rdi + 3]
0x14097081f: or rcx, rax
0x140970822: je 0x140970b44
0x140970828: movabs rax, 0x766572646e756f73
0x140970832: xor rax, qword ptr [rdi]
0x140970835: movabs rcx, 0x627265766572646e
0x14097083f: xor rcx, qword ptr [rdi + 3]
0x140970843: or rcx, rax
0x140970846: je 0x140970b5d
0x14097084c: movabs rax, 0x756f7365746f6d65
0x140970856: xor rax, qword ptr [rdi]
0x140970859: movabs rcx, 0x73646e756f736574
0x140970863: xor rcx, qword ptr [rdi + 3]
0x140970867: or rcx, rax
0x14097086a: jne 0x140970b74
0x140970870: mov dword ptr [r12], ebp
0x140970874: pxor xmm0, xmm0
0x140970878: ucomiss xmm6, xmm0
0x14097087b: setp al
0x14097087e: setne cl
0x140970881: or cl, al
0x140970883: mov byte ptr [r15 + 0x1b], cl
0x140970887: jmp 0x140970b74
0x14097088c: movdqu xmm0, xmmword ptr [rdi]
0x140970890: movdqu xmm1, xmmword ptr [rdi + 5]
0x140970895: pcmpeqb xmm1, xmmword ptr [rip + 0x5560253]
0x14097089d: pcmpeqb xmm0, xmmword ptr [rip + 0x556025b]
0x1409708a5: pand xmm0, xmm1
0x1409708a9: pmovmskb eax, xmm0
0x1409708ad: cmp eax, 0xffff
0x1409708b2: jne 0x140970b74
0x1409708b8: mov dword ptr [r12], ebp
0x1409708bc: pxor xmm0, xmm0
0x1409708c0: ucomiss xmm6, xmm0
0x1409708c3: setp al
0x1409708c6: setne cl
0x1409708c9: or cl, al
0x1409708cb: mov byte ptr [r15 + 0x1c], cl
0x1409708cf: jmp 0x140970b74
0x1409708d4: movabs rax, 0x6f7672657473616d
0x1409708de: xor rax, qword ptr [rdi]
0x1409708e1: mov ecx, dword ptr [rdi + 8]
0x1409708e4: xor rcx, 0x656d756c
0x1409708eb: or rcx, rax
0x1409708ee: jne 0x140970b74
0x1409708f4: pxor xmm0, xmm0
0x1409708f8: maxss xmm0, xmm6
0x1409708fc: movss xmm1, dword ptr [rip + 0x542c99c]
0x140970904: minss xmm1, xmm0
0x140970908: mov dword ptr [r12], ebp
0x14097090c: movss dword ptr [r15], xmm1
0x140970911: jmp 0x140970b74
0x140970916: movdqu xmm0, xmmword ptr [rdi]
0x14097091a: movq xmm1, qword ptr [rdi + 0x10]
0x14097091f: pcmpeqb xmm1, xmmword ptr [rip + 0x55601e9]
0x140970927: pcmpeqb xmm0, xmmword ptr [rip + 0x55601f1]
0x14097092f: pand xmm0, xmm1
0x140970933: pmovmskb eax, xmm0
0x140970937: cmp eax, 0xffff
0x14097093c: jne 0x140970b74
0x140970942: mov dword ptr [r12], ebp
0x140970946: pxor xmm0, xmm0
0x14097094a: ucomiss xmm6, xmm0
0x14097094d: setp al
0x140970950: setne cl
0x140970953: or cl, al
0x140970955: mov byte ptr [r15 + 0x1a], cl
0x140970959: jmp 0x140970b74
0x14097095e: movdqu xmm0, xmmword ptr [rdi]
0x140970962: movdqu xmm1, xmmword ptr [rdi + 0xf]
0x140970967: pcmpeqb xmm1, xmmword ptr [rip + 0x55601c1]
0x14097096f: pcmpeqb xmm0, xmmword ptr [rip + 0x55601c9]
0x140970977: pand xmm0, xmm1
0x14097097b: pmovmskb eax, xmm0
0x14097097f: cmp eax, 0xffff
0x140970984: jne 0x140970b74
0x14097098a: mov dword ptr [r12], ebp
0x14097098e: pxor xmm0, xmm0
0x140970992: ucomiss xmm6, xmm0
0x140970995: setp al
0x140970998: setne cl
0x14097099b: or cl, al
0x14097099d: mov byte ptr [r15 + 0x15], cl
0x1409709a1: jmp 0x140970b74
0x1409709a6: movabs rax, 0x65636e6569626d61
0x1409709b0: mov rcx, qword ptr [rdi]
0x1409709b3: xor rcx, rax
0x1409709b6: movabs rdx, 0x656d756c6f766563
0x1409709c0: xor rdx, qword ptr [rdi + 6]
0x1409709c4: or rdx, rcx
0x1409709c7: je 0x140970ac8
0x1409709cd: movabs rcx, 0x6d61656c62616e65
0x1409709d7: xor rcx, qword ptr [rdi]
0x1409709da: xor rax, qword ptr [rdi + 6]
0x1409709de: or rax, rcx
0x1409709e1: jne 0x140970b74
0x1409709e7: mov dword ptr [r12], ebp
0x1409709eb: pxor xmm0, xmm0
0x1409709ef: ucomiss xmm6, xmm0
0x1409709f2: setp al
0x1409709f5: setne cl
0x1409709f8: or cl, al
0x1409709fa: mov byte ptr [r15 + 0x13], cl
0x1409709fe: jmp 0x140970b74
0x140970a03: movdqu xmm0, xmmword ptr [rdi]
0x140970a07: movzx eax, byte ptr [rdi + 0x10]
0x140970a0b: movd xmm1, eax
0x140970a0f: pcmpeqb xmm0, xmmword ptr [rip + 0x5560139]
0x140970a17: pcmpeqb xmm1, xmmword ptr [rip + 0x5560141]
0x140970a1f: pand xmm1, xmm0
0x140970a23: pmovmskb eax, xmm1
0x140970a27: cmp eax, 0xffff
0x140970a2c: jne 0x140970b74
0x140970a32: mov dword ptr [r12], ebp
0x140970a36: pxor xmm0, xmm0
0x140970a3a: ucomiss xmm6, xmm0
0x140970a3d: setp al
0x140970a40: setne cl
0x140970a43: or cl, al
0x140970a45: mov byte ptr [r15 + 0x14], cl
0x140970a49: jmp 0x140970b74
0x140970a4e: movdqu xmm0, xmmword ptr [rdi]
0x140970a52: movzx eax, word ptr [rdi + 0x10]
0x140970a56: movd xmm1, eax
0x140970a5a: pcmpeqb xmm0, xmmword ptr [rip + 0x556010e]
0x140970a62: pcmpeqb xmm1, xmmword ptr [rip + 0x5560116]
0x140970a6a: pand xmm1, xmm0
0x140970a6e: pmovmskb eax, xmm1
0x140970a72: cmp eax, 0xffff
0x140970a77: je 0x140970b0b
0x140970a7d: movdqu xmm0, xmmword ptr [rdi]
0x140970a81: movzx eax, word ptr [rdi + 0x10]
0x140970a85: movd xmm1, eax
0x140970a89: pcmpeqb xmm0, xmmword ptr [rip + 0x55600ff]
0x140970a91: pcmpeqb xmm1, xmmword ptr [rip + 0x5560107]
0x140970a99: pand xmm1, xmm0
0x140970a9d: pmovmskb eax, xmm1
0x140970aa1: cmp eax, 0xffff
0x140970aa6: jne 0x140970b74
0x140970aac: mov dword ptr [r12], ebp
0x140970ab0: pxor xmm0, xmm0
0x140970ab4: ucomiss xmm6, xmm0
0x140970ab7: setp al
0x140970aba: setne cl
0x140970abd: or cl, al
0x140970abf: mov byte ptr [r15 + 0x19], cl
0x140970ac3: jmp 0x140970b74
0x140970ac8: pxor xmm0, xmm0
0x140970acc: maxss xmm0, xmm6
0x140970ad0: movss xmm1, dword ptr [rip + 0x542c7c8]
0x140970ad8: minss xmm1, xmm0
0x140970adc: mov dword ptr [r12], ebp
0x140970ae0: movss dword ptr [r15 + 0xc], xmm1
0x140970ae6: jmp 0x140970b74
0x140970aeb: pxor xmm0, xmm0
0x140970aef: maxss xmm0, xmm6
0x140970af3: movss xmm1, dword ptr [rip + 0x542c7a5]
0x140970afb: minss xmm1, xmm0
0x140970aff: mov dword ptr [r12], ebp
0x140970b03: movss dword ptr [r15 + 4], xmm1
0x140970b09: jmp 0x140970b74
0x140970b0b: mov dword ptr [r12], ebp
0x140970b0f: pxor xmm0, xmm0
0x140970b13: ucomiss xmm6, xmm0
0x140970b16: setp al
0x140970b19: setne cl
0x140970b1c: or cl, al
0x140970b1e: mov byte ptr [r15 + 0x10], cl
0x140970b22: jmp 0x140970b74
0x140970b24: pxor xmm0, xmm0
0x140970b28: maxss xmm0, xmm6
0x140970b2c: movss xmm1, dword ptr [rip + 0x542c76c]
0x140970b34: minss xmm1, xmm0
0x140970b38: mov dword ptr [r12], ebp
0x140970b3c: movss dword ptr [r15 + 8], xmm1
0x140970b42: jmp 0x140970b74
0x140970b44: mov dword ptr [r12], ebp
0x140970b48: pxor xmm0, xmm0
0x140970b4c: ucomiss xmm6, xmm0
0x140970b4f: setp al
0x140970b52: setne cl
0x140970b55: or cl, al
0x140970b57: mov byte ptr [r15 + 0x12], cl
0x140970b5b: jmp 0x140970b74
0x140970b5d: mov dword ptr [r12], ebp
0x140970b61: pxor xmm0, xmm0
0x140970b65: ucomiss xmm6, xmm0
0x140970b68: setp al
0x140970b6b: setne cl
0x140970b6e: or cl, al
0x140970b70: mov byte ptr [r15 + 0x16], cl
0x140970b74: mov r8d, 1
0x140970b7a: mov rcx, rdi
0x140970b7d: mov rdx, rsi
0x140970b80: movaps xmm6, xmmword ptr [rsp + 0x20]
0x140970b85: movaps xmm7, xmmword ptr [rsp + 0x30]
0x140970b8a: movaps xmm8, xmmword ptr [rsp + 0x40]
0x140970b90: add rsp, 0x50
0x140970b94: pop rbx
0x140970b95: pop rbp
0x140970b96: pop rdi
0x140970b97: pop rsi
0x140970b98: pop r12
0x140970b9a: pop r14
0x140970b9c: pop r15
0x140970b9e: jmp 0x1400021d0
