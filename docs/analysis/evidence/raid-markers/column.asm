140147a50: 4156 push r14
140147a52: 56 push rsi
140147a53: 57 push rdi
140147a54: 55 push rbp
140147a55: 53 push rbx
140147a56: 4881ecd0000000 sub rsp, 0xd0
140147a5d: 440f29bc24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm15
140147a66: 440f29b424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm14
140147a6f: 440f29ac24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm13
140147a78: 440f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm12
140147a81: 440f299c2480000000 movaps xmmword ptr [rsp + 0x80], xmm11
140147a8a: 440f29542470 movaps xmmword ptr [rsp + 0x70], xmm10
140147a90: 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
140147a96: 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
140147a9c: 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
140147aa1: 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
140147aa6: 0f28f3 movaps xmm6, xmm3
140147aa9: f30f1154242c movss dword ptr [rsp + 0x2c], xmm2
140147aaf: f30f114c2428 movss dword ptr [rsp + 0x28], xmm1
140147ab5: 4889ce mov rsi, rcx
140147ab8: 488b842440010000 mov rax, qword ptr [rsp + 0x140]
140147ac0: 488b9c2438010000 mov rbx, qword ptr [rsp + 0x138]
140147ac8: 89dd mov ebp, ebx
140147aca: 48c1eb20 shr rbx, 0x20
140147ace: f2440f1038 movsd xmm15, qword ptr [rax]
140147ad3: f3440f106808 movss xmm13, dword ptr [rax + 8]
140147ad9: 488b7910 mov rdi, qword ptr [rcx + 0x10]
140147add: 4531f6 xor r14d, r14d
140147ae0: 450f57f6 xorps xmm14, xmm14
140147ae4: f34d0f2af6 cvtsi2ss xmm14, r14
140147ae9: 49ffc6 inc r14
140147aec: f3440f1025afa8c905 movss xmm12, dword ptr [rip + 0x5c9a8af]
140147af5: f3450f59f4 mulss xmm14, xmm12
140147afa: 450f28d6 movaps xmm10, xmm14
140147afe: f3440f10053956c805 movss xmm8, dword ptr [rip + 0x5c85639]
140147b07: f3450f59d0 mulss xmm10, xmm8
140147b0c: f3440f109c2420010000 movss xmm11, dword ptr [rsp + 0x120]
140147b16: f3450f58d3 addss xmm10, xmm11
140147b1b: 410f28c2 movaps xmm0, xmm10
140147b1f: e8f925ab05 call 0x145bfa11d
140147b24: 440f28c8 movaps xmm9, xmm0
140147b28: 410f28c2 movaps xmm0, xmm10
140147b2c: e8e625ab05 call 0x145bfa117
140147b31: 440f28d0 movaps xmm10, xmm0
140147b35: 0f57ff xorps xmm7, xmm7
140147b38: f3490f2afe cvtsi2ss xmm7, r14
140147b3d: f3410f59fc mulss xmm7, xmm12
140147b42: 440f28e7 movaps xmm12, xmm7
140147b46: f3450f59e0 mulss xmm12, xmm8
140147b4b: f3450f58e3 addss xmm12, xmm11
140147b50: 410f28c4 movaps xmm0, xmm12
140147b54: e8c425ab05 call 0x145bfa11d
140147b59: 440f28d8 movaps xmm11, xmm0
140147b5d: 410f28c4 movaps xmm0, xmm12
140147b61: e8b125ab05 call 0x145bfa117
140147b66: 488b06 mov rax, qword ptr [rsi]
140147b69: 4829f8 sub rax, rdi
140147b6c: 4883f805 cmp rax, 5
140147b70: 0f86ca010000 jbe 0x140147d40
140147b76: f3440f59ce mulss xmm9, xmm6
140147b7b: f30f10542428 movss xmm2, dword ptr [rsp + 0x28]
140147b81: f3440f58ca addss xmm9, xmm2
140147b86: f3440f59d6 mulss xmm10, xmm6
140147b8b: f30f104c242c movss xmm1, dword ptr [rsp + 0x2c]
140147b91: f3440f58d1 addss xmm10, xmm1
140147b96: f3440f59de mulss xmm11, xmm6
140147b9b: f3440f58da addss xmm11, xmm2
140147ba0: f30f59c6 mulss xmm0, xmm6
140147ba4: f30f58c1 addss xmm0, xmm1
140147ba8: 488b4608 mov rax, qword ptr [rsi + 8]
140147bac: 488d0cff lea rcx, [rdi + rdi*8]
140147bb0: f3440f110c88 movss dword ptr [rax + rcx*4], xmm9
140147bb6: f30f10942428010000 movss xmm2, dword ptr [rsp + 0x128]
140147bbf: f30f11548804 movss dword ptr [rax + rcx*4 + 4], xmm2
140147bc5: f3440f11548808 movss dword ptr [rax + rcx*4 + 8], xmm10
140147bcc: f3440f1174880c movss dword ptr [rax + rcx*4 + 0xc], xmm14
140147bd3: c74488100000003f mov dword ptr [rax + rcx*4 + 0x10], 0x3f000000
140147bdb: 440f137c8814 movlps qword ptr [rax + rcx*4 + 0x14], xmm15
140147be1: f3440f116c881c movss dword ptr [rax + rcx*4 + 0x1c], xmm13
140147be8: 896c8820 mov dword ptr [rax + rcx*4 + 0x20], ebp
140147bec: f3440f115c8824 movss dword ptr [rax + rcx*4 + 0x24], xmm11
140147bf3: f30f11548828 movss dword ptr [rax + rcx*4 + 0x28], xmm2
140147bf9: f30f1144882c movss dword ptr [rax + rcx*4 + 0x2c], xmm0
140147bff: f30f117c8830 movss dword ptr [rax + rcx*4 + 0x30], xmm7
140147c05: c74488340000003f mov dword ptr [rax + rcx*4 + 0x34], 0x3f000000
140147c0d: 440f137c8838 movlps qword ptr [rax + rcx*4 + 0x38], xmm15
140147c13: f3440f116c8840 movss dword ptr [rax + rcx*4 + 0x40], xmm13
140147c1a: 896c8844 mov dword ptr [rax + rcx*4 + 0x44], ebp
140147c1e: f3440f115c8848 movss dword ptr [rax + rcx*4 + 0x48], xmm11
140147c25: f30f108c2430010000 movss xmm1, dword ptr [rsp + 0x130]
140147c2e: f30f114c884c movss dword ptr [rax + rcx*4 + 0x4c], xmm1
140147c34: f30f11448850 movss dword ptr [rax + rcx*4 + 0x50], xmm0
140147c3a: f30f117c8854 movss dword ptr [rax + rcx*4 + 0x54], xmm7
140147c40: c74488580000003f mov dword ptr [rax + rcx*4 + 0x58], 0x3f000000
140147c48: 440f137c885c movlps qword ptr [rax + rcx*4 + 0x5c], xmm15
140147c4e: f3440f116c8864 movss dword ptr [rax + rcx*4 + 0x64], xmm13
140147c55: 895c8868 mov dword ptr [rax + rcx*4 + 0x68], ebx
140147c59: f3440f114c886c movss dword ptr [rax + rcx*4 + 0x6c], xmm9
140147c60: f30f11548870 movss dword ptr [rax + rcx*4 + 0x70], xmm2
140147c66: f3440f11548874 movss dword ptr [rax + rcx*4 + 0x74], xmm10
140147c6d: f3440f11748878 movss dword ptr [rax + rcx*4 + 0x78], xmm14
140147c74: c744887c0000003f mov dword ptr [rax + rcx*4 + 0x7c], 0x3f000000
140147c7c: 440f13bc8880000000 movlps qword ptr [rax + rcx*4 + 0x80], xmm15
140147c85: f3440f11ac8888000000 movss dword ptr [rax + rcx*4 + 0x88], xmm13
140147c8f: 89ac888c000000 mov dword ptr [rax + rcx*4 + 0x8c], ebp
140147c96: f3440f119c8890000000 movss dword ptr [rax + rcx*4 + 0x90], xmm11
140147ca0: f30f118c8894000000 movss dword ptr [rax + rcx*4 + 0x94], xmm1
140147ca9: f30f11848898000000 movss dword ptr [rax + rcx*4 + 0x98], xmm0
140147cb2: f30f11bc889c000000 movss dword ptr [rax + rcx*4 + 0x9c], xmm7
140147cbb: c78488a00000000000003f mov dword ptr [rax + rcx*4 + 0xa0], 0x3f000000
140147cc6: 440f13bc88a4000000 movlps qword ptr [rax + rcx*4 + 0xa4], xmm15
140147ccf: f3440f11ac88ac000000 movss dword ptr [rax + rcx*4 + 0xac], xmm13
140147cd9: 899c88b0000000 mov dword ptr [rax + rcx*4 + 0xb0], ebx
140147ce0: f3440f118c88b4000000 movss dword ptr [rax + rcx*4 + 0xb4], xmm9
140147cea: f30f118c88b8000000 movss dword ptr [rax + rcx*4 + 0xb8], xmm1
140147cf3: f3440f119488bc000000 movss dword ptr [rax + rcx*4 + 0xbc], xmm10
140147cfd: f3440f11b488c0000000 movss dword ptr [rax + rcx*4 + 0xc0], xmm14
140147d07: c78488c40000000000003f mov dword ptr [rax + rcx*4 + 0xc4], 0x3f000000
140147d12: 440f13bc88c8000000 movlps qword ptr [rax + rcx*4 + 0xc8], xmm15
140147d1b: f3440f11ac88d0000000 movss dword ptr [rax + rcx*4 + 0xd0], xmm13
140147d25: 899c88d4000000 mov dword ptr [rax + rcx*4 + 0xd4], ebx
140147d2c: 4883c706 add rdi, 6
140147d30: 48897e10 mov qword ptr [rsi + 0x10], rdi
140147d34: 4983fe20 cmp r14, 0x20
140147d38: 0f85a2fdffff jne 0x140147ae0
140147d3e: eb31 jmp 0x140147d71
140147d40: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140147d49: 41b806000000 mov r8d, 6
140147d4f: 41b904000000 mov r9d, 4
140147d55: 4889f1 mov rcx, rsi
140147d58: 4889fa mov rdx, rdi
140147d5b: 440f28e0 movaps xmm12, xmm0
140147d5f: e80c2cab05 call 0x145bfa970
140147d64: 410f28c4 movaps xmm0, xmm12
140147d68: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
140147d6c: e905feffff jmp 0x140147b76
140147d71: 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
140147d76: 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
140147d7b: 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
140147d81: 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
140147d87: 440f28542470 movaps xmm10, xmmword ptr [rsp + 0x70]
140147d8d: 440f289c2480000000 movaps xmm11, xmmword ptr [rsp + 0x80]
140147d96: 440f28a42490000000 movaps xmm12, xmmword ptr [rsp + 0x90]
140147d9f: 440f28ac24a0000000 movaps xmm13, xmmword ptr [rsp + 0xa0]
140147da8: 440f28b424b0000000 movaps xmm14, xmmword ptr [rsp + 0xb0]
140147db1: 440f28bc24c0000000 movaps xmm15, xmmword ptr [rsp + 0xc0]
140147dba: 4881c4d0000000 add rsp, 0xd0
140147dc1: 5b pop rbx
140147dc2: 5d pop rbp
140147dc3: 5f pop rdi
140147dc4: 5e pop rsi
140147dc5: 415e pop r14
140147dc7: c3 ret
