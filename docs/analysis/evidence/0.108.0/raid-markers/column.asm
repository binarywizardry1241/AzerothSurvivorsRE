1400f8260: 4156 push r14
1400f8262: 56 push rsi
1400f8263: 57 push rdi
1400f8264: 55 push rbp
1400f8265: 53 push rbx
1400f8266: 4881ecd0000000 sub rsp, 0xd0
1400f826d: 440f29bc24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm15
1400f8276: 440f29b424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm14
1400f827f: 440f29ac24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm13
1400f8288: 440f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm12
1400f8291: 440f299c2480000000 movaps xmmword ptr [rsp + 0x80], xmm11
1400f829a: 440f29542470 movaps xmmword ptr [rsp + 0x70], xmm10
1400f82a0: 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
1400f82a6: 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
1400f82ac: 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
1400f82b1: 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
1400f82b6: 0f28f3 movaps xmm6, xmm3
1400f82b9: f30f1154242c movss dword ptr [rsp + 0x2c], xmm2
1400f82bf: f30f114c2428 movss dword ptr [rsp + 0x28], xmm1
1400f82c5: 4889ce mov rsi, rcx
1400f82c8: 488b842440010000 mov rax, qword ptr [rsp + 0x140]
1400f82d0: 488b9c2438010000 mov rbx, qword ptr [rsp + 0x138]
1400f82d8: 89dd mov ebp, ebx
1400f82da: 48c1eb20 shr rbx, 0x20
1400f82de: f2440f1038 movsd xmm15, qword ptr [rax]
1400f82e3: f3440f106808 movss xmm13, dword ptr [rax + 8]
1400f82e9: 488b7910 mov rdi, qword ptr [rcx + 0x10]
1400f82ed: 4531f6 xor r14d, r14d
1400f82f0: 450f57f6 xorps xmm14, xmm14
1400f82f4: f34d0f2af6 cvtsi2ss xmm14, r14
1400f82f9: 49ffc6 inc r14
1400f82fc: f3440f10254b87cd05 movss xmm12, dword ptr [rip + 0x5cd874b]
1400f8305: f3450f59f4 mulss xmm14, xmm12
1400f830a: 450f28d6 movaps xmm10, xmm14
1400f830e: f3440f100519dfca05 movss xmm8, dword ptr [rip + 0x5cadf19]
1400f8317: f3450f59d0 mulss xmm10, xmm8
1400f831c: f3440f109c2420010000 movss xmm11, dword ptr [rsp + 0x120]
1400f8326: f3450f58d3 addss xmm10, xmm11
1400f832b: 410f28c2 movaps xmm0, xmm10
1400f832f: e849a6af05 call 0x145bf297d
1400f8334: 440f28c8 movaps xmm9, xmm0
1400f8338: 410f28c2 movaps xmm0, xmm10
1400f833c: e836a6af05 call 0x145bf2977
1400f8341: 440f28d0 movaps xmm10, xmm0
1400f8345: 0f57ff xorps xmm7, xmm7
1400f8348: f3490f2afe cvtsi2ss xmm7, r14
1400f834d: f3410f59fc mulss xmm7, xmm12
1400f8352: 440f28e7 movaps xmm12, xmm7
1400f8356: f3450f59e0 mulss xmm12, xmm8
1400f835b: f3450f58e3 addss xmm12, xmm11
1400f8360: 410f28c4 movaps xmm0, xmm12
1400f8364: e814a6af05 call 0x145bf297d
1400f8369: 440f28d8 movaps xmm11, xmm0
1400f836d: 410f28c4 movaps xmm0, xmm12
1400f8371: e801a6af05 call 0x145bf2977
1400f8376: 488b06 mov rax, qword ptr [rsi]
1400f8379: 4829f8 sub rax, rdi
1400f837c: 4883f805 cmp rax, 5
1400f8380: 0f86ca010000 jbe 0x1400f8550
1400f8386: f3440f59ce mulss xmm9, xmm6
1400f838b: f30f10542428 movss xmm2, dword ptr [rsp + 0x28]
1400f8391: f3440f58ca addss xmm9, xmm2
1400f8396: f3440f59d6 mulss xmm10, xmm6
1400f839b: f30f104c242c movss xmm1, dword ptr [rsp + 0x2c]
1400f83a1: f3440f58d1 addss xmm10, xmm1
1400f83a6: f3440f59de mulss xmm11, xmm6
1400f83ab: f3440f58da addss xmm11, xmm2
1400f83b0: f30f59c6 mulss xmm0, xmm6
1400f83b4: f30f58c1 addss xmm0, xmm1
1400f83b8: 488b4608 mov rax, qword ptr [rsi + 8]
1400f83bc: 488d0cff lea rcx, [rdi + rdi*8]
1400f83c0: f3440f110c88 movss dword ptr [rax + rcx*4], xmm9
1400f83c6: f30f10942428010000 movss xmm2, dword ptr [rsp + 0x128]
1400f83cf: f30f11548804 movss dword ptr [rax + rcx*4 + 4], xmm2
1400f83d5: f3440f11548808 movss dword ptr [rax + rcx*4 + 8], xmm10
1400f83dc: f3440f1174880c movss dword ptr [rax + rcx*4 + 0xc], xmm14
1400f83e3: c74488100000003f mov dword ptr [rax + rcx*4 + 0x10], 0x3f000000
1400f83eb: 440f137c8814 movlps qword ptr [rax + rcx*4 + 0x14], xmm15
1400f83f1: f3440f116c881c movss dword ptr [rax + rcx*4 + 0x1c], xmm13
1400f83f8: 896c8820 mov dword ptr [rax + rcx*4 + 0x20], ebp
1400f83fc: f3440f115c8824 movss dword ptr [rax + rcx*4 + 0x24], xmm11
1400f8403: f30f11548828 movss dword ptr [rax + rcx*4 + 0x28], xmm2
1400f8409: f30f1144882c movss dword ptr [rax + rcx*4 + 0x2c], xmm0
1400f840f: f30f117c8830 movss dword ptr [rax + rcx*4 + 0x30], xmm7
1400f8415: c74488340000003f mov dword ptr [rax + rcx*4 + 0x34], 0x3f000000
1400f841d: 440f137c8838 movlps qword ptr [rax + rcx*4 + 0x38], xmm15
1400f8423: f3440f116c8840 movss dword ptr [rax + rcx*4 + 0x40], xmm13
1400f842a: 896c8844 mov dword ptr [rax + rcx*4 + 0x44], ebp
1400f842e: f3440f115c8848 movss dword ptr [rax + rcx*4 + 0x48], xmm11
1400f8435: f30f108c2430010000 movss xmm1, dword ptr [rsp + 0x130]
1400f843e: f30f114c884c movss dword ptr [rax + rcx*4 + 0x4c], xmm1
1400f8444: f30f11448850 movss dword ptr [rax + rcx*4 + 0x50], xmm0
1400f844a: f30f117c8854 movss dword ptr [rax + rcx*4 + 0x54], xmm7
1400f8450: c74488580000003f mov dword ptr [rax + rcx*4 + 0x58], 0x3f000000
1400f8458: 440f137c885c movlps qword ptr [rax + rcx*4 + 0x5c], xmm15
1400f845e: f3440f116c8864 movss dword ptr [rax + rcx*4 + 0x64], xmm13
1400f8465: 895c8868 mov dword ptr [rax + rcx*4 + 0x68], ebx
1400f8469: f3440f114c886c movss dword ptr [rax + rcx*4 + 0x6c], xmm9
1400f8470: f30f11548870 movss dword ptr [rax + rcx*4 + 0x70], xmm2
1400f8476: f3440f11548874 movss dword ptr [rax + rcx*4 + 0x74], xmm10
1400f847d: f3440f11748878 movss dword ptr [rax + rcx*4 + 0x78], xmm14
1400f8484: c744887c0000003f mov dword ptr [rax + rcx*4 + 0x7c], 0x3f000000
1400f848c: 440f13bc8880000000 movlps qword ptr [rax + rcx*4 + 0x80], xmm15
1400f8495: f3440f11ac8888000000 movss dword ptr [rax + rcx*4 + 0x88], xmm13
1400f849f: 89ac888c000000 mov dword ptr [rax + rcx*4 + 0x8c], ebp
1400f84a6: f3440f119c8890000000 movss dword ptr [rax + rcx*4 + 0x90], xmm11
1400f84b0: f30f118c8894000000 movss dword ptr [rax + rcx*4 + 0x94], xmm1
1400f84b9: f30f11848898000000 movss dword ptr [rax + rcx*4 + 0x98], xmm0
1400f84c2: f30f11bc889c000000 movss dword ptr [rax + rcx*4 + 0x9c], xmm7
1400f84cb: c78488a00000000000003f mov dword ptr [rax + rcx*4 + 0xa0], 0x3f000000
1400f84d6: 440f13bc88a4000000 movlps qword ptr [rax + rcx*4 + 0xa4], xmm15
1400f84df: f3440f11ac88ac000000 movss dword ptr [rax + rcx*4 + 0xac], xmm13
1400f84e9: 899c88b0000000 mov dword ptr [rax + rcx*4 + 0xb0], ebx
1400f84f0: f3440f118c88b4000000 movss dword ptr [rax + rcx*4 + 0xb4], xmm9
1400f84fa: f30f118c88b8000000 movss dword ptr [rax + rcx*4 + 0xb8], xmm1
1400f8503: f3440f119488bc000000 movss dword ptr [rax + rcx*4 + 0xbc], xmm10
1400f850d: f3440f11b488c0000000 movss dword ptr [rax + rcx*4 + 0xc0], xmm14
1400f8517: c78488c40000000000003f mov dword ptr [rax + rcx*4 + 0xc4], 0x3f000000
1400f8522: 440f13bc88c8000000 movlps qword ptr [rax + rcx*4 + 0xc8], xmm15
1400f852b: f3440f11ac88d0000000 movss dword ptr [rax + rcx*4 + 0xd0], xmm13
1400f8535: 899c88d4000000 mov dword ptr [rax + rcx*4 + 0xd4], ebx
1400f853c: 4883c706 add rdi, 6
1400f8540: 48897e10 mov qword ptr [rsi + 0x10], rdi
1400f8544: 4983fe20 cmp r14, 0x20
1400f8548: 0f85a2fdffff jne 0x1400f82f0
1400f854e: eb31 jmp 0x1400f8581
1400f8550: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1400f8559: 41b806000000 mov r8d, 6
1400f855f: 41b904000000 mov r9d, 4
1400f8565: 4889f1 mov rcx, rsi
1400f8568: 4889fa mov rdx, rdi
1400f856b: 440f28e0 movaps xmm12, xmm0
1400f856f: e81cc5af05 call 0x145bf4a90
1400f8574: 410f28c4 movaps xmm0, xmm12
1400f8578: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
1400f857c: e905feffff jmp 0x1400f8386
1400f8581: 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
1400f8586: 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
1400f858b: 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
1400f8591: 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
1400f8597: 440f28542470 movaps xmm10, xmmword ptr [rsp + 0x70]
1400f859d: 440f289c2480000000 movaps xmm11, xmmword ptr [rsp + 0x80]
1400f85a6: 440f28a42490000000 movaps xmm12, xmmword ptr [rsp + 0x90]
1400f85af: 440f28ac24a0000000 movaps xmm13, xmmword ptr [rsp + 0xa0]
1400f85b8: 440f28b424b0000000 movaps xmm14, xmmword ptr [rsp + 0xb0]
1400f85c1: 440f28bc24c0000000 movaps xmm15, xmmword ptr [rsp + 0xc0]
1400f85ca: 4881c4d0000000 add rsp, 0xd0
1400f85d1: 5b pop rbx
1400f85d2: 5d pop rbp
1400f85d3: 5f pop rdi
1400f85d4: 5e pop rsi
1400f85d5: 415e pop r14
1400f85d7: c3 ret
