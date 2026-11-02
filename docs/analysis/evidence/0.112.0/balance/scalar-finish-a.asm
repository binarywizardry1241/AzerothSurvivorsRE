1458f3234: f3440f10bda8000000 movss xmm15, dword ptr [rbp + 0xa8]
1458f323d: f3440f58ff addss xmm15, xmm7
1458f3242: f3440f597dd0 mulss xmm15, dword ptr [rbp - 0x30]
1458f3248: f3440f100d0fa04b00 movss xmm9, dword ptr [rip + 0x4ba00f]
1458f3251: f3410f5ff9 maxss xmm7, xmm9
1458f3256: 440f297540 movaps xmmword ptr [rbp + 0x40], xmm14
1458f325b: 0f28f1 movaps xmm6, xmm1
1458f325e: 0f299d90000000 movaps xmmword ptr [rbp + 0x90], xmm3
1458f3265: 450f28f7 movaps xmm14, xmm15
1458f3269: f3440f5ef7 divss xmm14, xmm7
1458f326e: f30f108db0000000 movss xmm1, dword ptr [rbp + 0xb0]
1458f3276: f3410f59cf mulss xmm1, xmm15
1458f327b: f30f58c1 addss xmm0, xmm1
1458f327f: f3410f58e1 addss xmm4, xmm9
1458f3284: 31d2 xor edx, edx
1458f3286: 410f2ee9 ucomiss xmm5, xmm9
1458f328a: f3440f5ecc divss xmm9, xmm4
1458f328f: 0f285dc0 movaps xmm3, xmmword ptr [rbp - 0x40]
1458f3293: 0f28fb movaps xmm7, xmm3
1458f3296: f30f104d30 movss xmm1, dword ptr [rbp + 0x30]
1458f329b: f30f5cf9 subss xmm7, xmm1
1458f329f: 0f57d2 xorps xmm2, xmm2
1458f32a2: f30f5ffa maxss xmm7, xmm2
1458f32a6: f30f10a5ac000000 movss xmm4, dword ptr [rbp + 0xac]
1458f32ae: f30f59e7 mulss xmm4, xmm7
1458f32b2: 0f28fb movaps xmm7, xmm3
1458f32b5: f30f5df9 minss xmm7, xmm1
1458f32b9: 440f28d7 movaps xmm10, xmm7
1458f32bd: f3440fc2d703 cmpunordss xmm10, xmm7
1458f32c3: 410f28cd movaps xmm1, xmm13
1458f32c7: 450f28ea movaps xmm13, xmm10
1458f32cb: 440f55ef andnps xmm13, xmm7
1458f32cf: 440f54d3 andps xmm10, xmm3
1458f32d3: 450f56d5 orps xmm10, xmm13
1458f32d7: 410f28fa movaps xmm7, xmm10
1458f32db: f3440f5995b4000000 mulss xmm10, dword ptr [rbp + 0xb4]
1458f32e4: f3440f5e15d3e14b00 divss xmm10, dword ptr [rip + 0x4be1d3]
1458f32ed: f3440f58d4 addss xmm10, xmm4
1458f32f2: f3450f58d4 addss xmm10, xmm12
1458f32f7: 410f28e7 movaps xmm4, xmm15
1458f32fb: f30f5ca680040000 subss xmm4, dword ptr [rsi + 0x480]
1458f3303: f3440f11be80040000 movss dword ptr [rsi + 0x480], xmm15
1458f330c: f3440f119684040000 movss dword ptr [rsi + 0x484], xmm10
1458f3315: f3440f118e88040000 movss dword ptr [rsi + 0x488], xmm9
1458f331e: f3440f100d41e04b00 movss xmm9, dword ptr [rip + 0x4be041]
1458f3327: f3450f58f1 addss xmm14, xmm9
1458f332c: f3440f58cd addss xmm9, xmm5
1458f3331: 0f285d20 movaps xmm3, xmmword ptr [rbp + 0x20]
1458f3335: f3440f58cb addss xmm9, xmm3
1458f333a: 440f28153e126c00 movaps xmm10, xmmword ptr [rip + 0x6c123e]
1458f3342: 450f14d1 unpcklps xmm10, xmm9
1458f3346: 0f14eb unpcklps xmm5, xmm3
1458f3349: 0f97c2 seta dl
1458f334c: 66440f6eca movd xmm9, edx
1458f3351: 66450f70c900 pshufd xmm9, xmm9, 0
1458f3357: 66410f72f11f pslld xmm9, 0x1f
1458f335d: 66410f72e11f psrad xmm9, 0x1f
1458f3363: 450f54d1 andps xmm10, xmm9
1458f3367: 440f55cd andnps xmm9, xmm5
1458f336b: 450f56ca orps xmm9, xmm10
1458f336f: 440f138e8c040000 movlps qword ptr [rsi + 0x48c], xmm9
1458f3377: 0f285df0 movaps xmm3, xmmword ptr [rbp - 0x10]
1458f337b: f30f5d1dc9573101 minss xmm3, dword ptr [rip + 0x13157c9]
1458f3383: f30f119e94040000 movss dword ptr [rsi + 0x494], xmm3
1458f338b: f30f118e98040000 movss dword ptr [rsi + 0x498], xmm1
1458f3393: f3440f119e9c040000 movss dword ptr [rsi + 0x49c], xmm11
1458f339c: f30f11bea0040000 movss dword ptr [rsi + 0x4a0], xmm7
1458f33a4: f30f1186a4040000 movss dword ptr [rsi + 0x4a4], xmm0
1458f33ac: 0f284550 movaps xmm0, xmmword ptr [rbp + 0x50]
1458f33b0: f30f1186a8040000 movss dword ptr [rsi + 0x4a8], xmm0
1458f33b8: f30f11b6ac040000 movss dword ptr [rsi + 0x4ac], xmm6
1458f33c0: 0f284540 movaps xmm0, xmmword ptr [rbp + 0x40]
1458f33c4: f30f1186b0040000 movss dword ptr [rsi + 0x4b0], xmm0
1458f33cc: 8986b4040000 mov dword ptr [rsi + 0x4b4], eax
1458f33d2: f3440f1186b8040000 movss dword ptr [rsi + 0x4b8], xmm8
1458f33db: 0f288590000000 movaps xmm0, xmmword ptr [rbp + 0x90]
1458f33e2: f30f1186bc040000 movss dword ptr [rsi + 0x4bc], xmm0
