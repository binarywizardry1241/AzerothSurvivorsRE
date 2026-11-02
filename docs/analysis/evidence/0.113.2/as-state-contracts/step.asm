// server scalar
1458681b5: 660f28f1 movapd xmm6, xmm1
1458681b9: 0f57ff xorps xmm7, xmm7
1458681bc: 833901 cmp dword ptr [rcx], 1
1458681bf: 7524 jne 0x1458681e5
1458681c1: 660f28c6 movapd xmm0, xmm6
1458681c5: f20f5c4108 subsd xmm0, qword ptr [rcx + 8]
1458681ca: 660f57c9 xorpd xmm1, xmm1
1458681ce: f20f5fc8 maxsd xmm1, xmm0
1458681d2: f20f100546b47300 movsd xmm0, qword ptr [rip + 0x73b446]
1458681da: f20f5dc1 minsd xmm0, xmm1
1458681de: 0f57ff xorps xmm7, xmm7
1458681e1: f20f5af8 cvtsd2ss xmm7, xmm0
1458681e5: 48c70101000000 mov qword ptr [rcx], 1
1458681ec: f20f117108 movsd qword ptr [rcx + 8], xmm6
// actual Game update call
14586c2e1: 488b8d680f0000 mov rcx, qword ptr [rbp + 0xf68]
14586c2e8: 833902 cmp dword ptr [rcx], 2
14586c2eb: 0f8404010000 je 0x14586c3f5
14586c2f1: 0f28cf movaps xmm1, xmm7
14586c2f4: e8e7de0900 call 0x14590a1e0
// ordinary local phase clock gate
14590a241: 0f28f1 movaps xmm6, xmm1
14590a244: 4889ce mov rsi, rcx
14590a247: 80b90d0c000000 cmp byte ptr [rcx + 0xc0d], 0
14590a24e: 745c je 0x14590a2ac
14590a250: 4889f1 mov rcx, rsi
14590a253: 0f28ce movaps xmm1, xmm6
14590a256: 0f287560 movaps xmm6, xmmword ptr [rbp + 0x60]
14590a25a: 0f287d70 movaps xmm7, xmmword ptr [rbp + 0x70]
14590a25e: 440f288580000000 movaps xmm8, xmmword ptr [rbp + 0x80]
14590a266: 440f288d90000000 movaps xmm9, xmmword ptr [rbp + 0x90]
14590a26e: 440f2895a0000000 movaps xmm10, xmmword ptr [rbp + 0xa0]
14590a276: 440f289db0000000 movaps xmm11, xmmword ptr [rbp + 0xb0]
14590a27e: 440f28a5c0000000 movaps xmm12, xmmword ptr [rbp + 0xc0]
14590a286: 440f28add0000000 movaps xmm13, xmmword ptr [rbp + 0xd0]
14590a28e: 440f28b5e0000000 movaps xmm14, xmmword ptr [rbp + 0xe0]
14590a296: 4881c470010000 add rsp, 0x170
14590a29d: 5b pop rbx
14590a29e: 5f pop rdi
14590a29f: 5e pop rsi
14590a2a0: 415c pop r12
14590a2a2: 415e pop r14
14590a2a4: 415f pop r15
14590a2a6: 5d pop rbp
14590a2a7: e9a4f4fdff jmp 0x1458e9750
14590a2ac: 0fb686120c0000 movzx eax, byte ptr [rsi + 0xc12]
14590a2b3: 84c0 test al, al
14590a2b5: 751f jne 0x14590a2d6
14590a2b7: 80be070c000000 cmp byte ptr [rsi + 0xc07], 0
14590a2be: 7416 je 0x14590a2d6
14590a2c0: c686070c000000 mov byte ptr [rsi + 0xc07], 0
14590a2c7: 4889f1 mov rcx, rsi
14590a2ca: e881120000 call 0x14590b550
14590a2cf: 0fb686120c0000 movzx eax, byte ptr [rsi + 0xc12]
14590a2d6: 3c01 cmp al, 1
14590a2d8: 0f85da090000 jne 0x14590acb8
14590a2de: f30f10866c0b0000 movss xmm0, dword ptr [rsi + 0xb6c]
14590a2e6: f30f58c6 addss xmm0, xmm6
14590a2ea: f30f11866c0b0000 movss dword ptr [rsi + 0xb6c], xmm0
// same scalar hazard and enemy calls
14590ab19: 4889f1 mov rcx, rsi
14590ab1c: 0f28ce movaps xmm1, xmm6
14590ab1f: e8dcc6feff call 0x1458f7200
14590ab24: 4889f1 mov rcx, rsi
14590ab27: 0f28ce movaps xmm1, xmm6
14590ab2a: e881410200 call 0x14592ecb0
14590ab2f: 4889f1 mov rcx, rsi
14590ab32: 0f28ce movaps xmm1, xmm6
14590ab35: e8e6b40400 call 0x145956020
14590ab3a: 4889f1 mov rcx, rsi
14590ab3d: e87ef40100 call 0x145929fc0
14590ab42: 4889f1 mov rcx, rsi
14590ab45: e896cb0100 call 0x1459276e0
14590ab4a: 4889f1 mov rcx, rsi
14590ab4d: 0f28ce movaps xmm1, xmm6
14590ab50: e8bb920000 call 0x145913e10
14590ab55: 4889f1 mov rcx, rsi
14590ab58: e8731f0100 call 0x14591cad0
14590ab5d: 4889f1 mov rcx, rsi
14590ab60: e8cbd70100 call 0x145928330
14590ab65: 4889f1 mov rcx, rsi
14590ab68: 0f28ce movaps xmm1, xmm6
14590ab6b: e880b10300 call 0x145945cf0
