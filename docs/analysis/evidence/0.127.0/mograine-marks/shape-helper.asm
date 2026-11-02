0x145b75e60: push rsi
0x145b75e61: sub rsp, 0x60
0x145b75e65: movaps xmmword ptr [rsp + 0x50], xmm9
0x145b75e6b: movaps xmmword ptr [rsp + 0x40], xmm8
0x145b75e71: movaps xmmword ptr [rsp + 0x30], xmm7
0x145b75e76: movaps xmmword ptr [rsp + 0x20], xmm6
0x145b75e7b: movaps xmm7, xmm2
0x145b75e7e: mov rsi, rcx
0x145b75e81: movsd xmm6, qword ptr [r9]
0x145b75e86: movsd xmm0, qword ptr [rdx]
0x145b75e8a: subps xmm6, xmm0
0x145b75e8d: movshdup xmm8, xmm6
0x145b75e92: movaps xmm0, xmm6
0x145b75e95: movaps xmm1, xmm8
0x145b75e99: call 0x14606177b
0x145b75e9e: mov eax, dword ptr [rsi]
0x145b75ea0: movss xmm9, dword ptr [rsi + 4]
0x145b75ea6: lea rcx, [rip + 0x14fb833]
0x145b75ead: movsxd rax, dword ptr [rcx + rax*4]
0x145b75eb1: add rax, rcx
0x145b75eb4: jmp rax
0x145b75eb6: ucomiss xmm9, xmm0
0x145b75eba: jmp 0x145b75fb3
0x145b75ebf: movaps xmm0, xmm7
0x145b75ec2: call 0x146061769
0x145b75ec7: movaps xmm8, xmm0
0x145b75ecb: movaps xmm0, xmm7
0x145b75ece: call 0x146061751
0x145b75ed3: movaps xmm2, xmm8
0x145b75ed7: unpcklps xmm2, xmm0
0x145b75eda: mulps xmm2, xmm6
0x145b75edd: movshdup xmm1, xmm2
0x145b75ee1: addss xmm1, xmm2
0x145b75ee5: xor eax, eax
0x145b75ee7: xorps xmm2, xmm2
0x145b75eea: ucomiss xmm1, xmm2
0x145b75eed: jb 0x145b75fb6
0x145b75ef3: ucomiss xmm9, xmm1
0x145b75ef7: jb 0x145b75fb6
0x145b75efd: movss xmm1, dword ptr [rsi + 8]
0x145b75f02: unpcklps xmm0, xmm8
0x145b75f06: mulps xmm0, xmm6
0x145b75f09: movshdup xmm2, xmm0
0x145b75f0d: subss xmm2, xmm0
0x145b75f11: andps xmm2, xmmword ptr [rip + 0x6bd258]
0x145b75f18: mulss xmm1, dword ptr [rip + 0x6bd204]
0x145b75f20: ucomiss xmm1, xmm2
0x145b75f23: jmp 0x145b75fb3
0x145b75f28: ucomiss xmm0, xmm9
0x145b75f2c: ja 0x145b75fa7
0x145b75f2e: mov al, 1
0x145b75f30: movss xmm1, dword ptr [rip + 0x6bd1ec]
0x145b75f38: ucomiss xmm1, xmm0
0x145b75f3b: ja 0x145b75fb6
0x145b75f3d: movss xmm9, dword ptr [rsi + 8]
0x145b75f43: movaps xmm0, xmm8
0x145b75f47: movaps xmm1, xmm6
0x145b75f4a: call 0x146061763
0x145b75f4f: subss xmm0, xmm7
0x145b75f53: addss xmm0, dword ptr [rip + 0x6bd1a1]
0x145b75f5b: movss xmm6, dword ptr [rip + 0x6d2b2d]
0x145b75f63: movaps xmm1, xmm6
0x145b75f66: call 0x14606178d
0x145b75f6b: addss xmm6, xmm0
0x145b75f6f: xorps xmm1, xmm1
0x145b75f72: movaps xmm2, xmm0
0x145b75f75: cmpltss xmm2, xmm1
0x145b75f7a: andps xmm6, xmm2
0x145b75f7d: andnps xmm2, xmm0
0x145b75f80: orps xmm2, xmm6
0x145b75f83: addss xmm2, dword ptr [rip + 0x7e310d]
0x145b75f8b: andps xmm2, xmmword ptr [rip + 0x6bd1de]
0x145b75f92: mulss xmm9, dword ptr [rip + 0x6bd189]
0x145b75f9b: ucomiss xmm9, xmm2
0x145b75f9f: jmp 0x145b75fb3
0x145b75fa1: ucomiss xmm0, xmm9
0x145b75fa5: jae 0x145b75fab
0x145b75fa7: xor eax, eax
0x145b75fa9: jmp 0x145b75fb6
0x145b75fab: movss xmm1, dword ptr [rsi + 8]
0x145b75fb0: ucomiss xmm1, xmm0
0x145b75fb3: setae al
0x145b75fb6: movaps xmm6, xmmword ptr [rsp + 0x20]
0x145b75fbb: movaps xmm7, xmmword ptr [rsp + 0x30]
0x145b75fc0: movaps xmm8, xmmword ptr [rsp + 0x40]
0x145b75fc6: movaps xmm9, xmmword ptr [rsp + 0x50]
0x145b75fcc: add rsp, 0x60
0x145b75fd0: pop rsi
0x145b75fd1: ret 
