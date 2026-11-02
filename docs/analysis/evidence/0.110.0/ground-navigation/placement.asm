1459b1ac0: 56 push rsi
1459b1ac1: 57 push rdi
1459b1ac2: 53 push rbx
1459b1ac3: 4881ec70010000 sub rsp, 0x170
1459b1aca: 440f29bc2460010000 movaps xmmword ptr [rsp + 0x160], xmm15
1459b1ad3: 440f29b42450010000 movaps xmmword ptr [rsp + 0x150], xmm14
1459b1adc: 440f29ac2440010000 movaps xmmword ptr [rsp + 0x140], xmm13
1459b1ae5: 440f29a42430010000 movaps xmmword ptr [rsp + 0x130], xmm12
1459b1aee: 440f299c2420010000 movaps xmmword ptr [rsp + 0x120], xmm11
1459b1af7: 440f29942410010000 movaps xmmword ptr [rsp + 0x110], xmm10
1459b1b00: 440f298c2400010000 movaps xmmword ptr [rsp + 0x100], xmm9
1459b1b09: 440f298424f0000000 movaps xmmword ptr [rsp + 0xf0], xmm8
1459b1b12: 0f29bc24e0000000 movaps xmmword ptr [rsp + 0xe0], xmm7
1459b1b1a: 0f29b424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm6
1459b1b22: 4c89c7 mov rdi, r8
1459b1b25: 4889d3 mov rbx, rdx
1459b1b28: 4889ce mov rsi, rcx
1459b1b2b: f3450f1019 movss xmm11, dword ptr [r9]
1459b1b30: f3440f101573844d00 movss xmm10, dword ptr [rip + 0x4d8473]
1459b1b39: f3410f107104 movss xmm6, dword ptr [r9 + 4]
1459b1b3f: f3410f59f2 mulss xmm6, xmm10
1459b1b44: f3450f595108 mulss xmm10, dword ptr [r9 + 8]
1459b1b4a: f30f58359e105700 addss xmm6, dword ptr [rip + 0x57109e]
1459b1b52: 0f28c6 movaps xmm0, xmm6
1459b1b55: e877362500 call 0x145c051d1
1459b1b5a: 440f28c8 movaps xmm9, xmm0
1459b1b5e: 0f28c6 movaps xmm0, xmm6
1459b1b61: e871362500 call 0x145c051d7
1459b1b66: 410f28f9 movaps xmm7, xmm9
1459b1b6a: f30f593de6128901 mulss xmm7, dword ptr [rip + 0x18912e6]
1459b1b72: 450f57e4 xorps xmm12, xmm12
1459b1b76: 0f28c8 movaps xmm1, xmm0
1459b1b79: 440f28f8 movaps xmm15, xmm0
1459b1b7d: f3410f58cc addss xmm1, xmm12
1459b1b82: 0f294c2460 movaps xmmword ptr [rsp + 0x60], xmm1
1459b1b87: f3440f591d007e4d00 mulss xmm11, dword ptr [rip + 0x4d7e00]
1459b1b90: 410f28c3 movaps xmm0, xmm11
1459b1b94: e83e362500 call 0x145c051d7
1459b1b99: 0f28f0 movaps xmm6, xmm0
1459b1b9c: f3440f58150f335800 addss xmm10, dword ptr [rip + 0x58330f]
1459b1ba5: 410f28c2 movaps xmm0, xmm10
1459b1ba9: e823362500 call 0x145c051d1
1459b1bae: 440f28c0 movaps xmm8, xmm0
1459b1bb2: 410f28c2 movaps xmm0, xmm10
1459b1bb6: e81c362500 call 0x145c051d7
1459b1bbb: 440f28d0 movaps xmm10, xmm0
1459b1bbf: 0f29442450 movaps xmmword ptr [rsp + 0x50], xmm0
1459b1bc4: 410f28c3 movaps xmm0, xmm11
1459b1bc8: e804362500 call 0x145c051d1
1459b1bcd: 440f28f0 movaps xmm14, xmm0
1459b1bd1: 0f28d8 movaps xmm3, xmm0
1459b1bd4: f3410f59dc mulss xmm3, xmm12
1459b1bd9: 450f57ed xorps xmm13, xmm13
1459b1bdd: f3440f10eb movss xmm13, xmm3
1459b1be2: 0f28c6 movaps xmm0, xmm6
1459b1be5: 410f14c0 unpcklps xmm0, xmm8
1459b1be9: 410f28d7 movaps xmm2, xmm15
1459b1bed: 440f29bc2490000000 movaps xmmword ptr [rsp + 0x90], xmm15
1459b1bf6: 410f28cf movaps xmm1, xmm15
1459b1bfa: 410f16ca movlhps xmm1, xmm10
1459b1bfe: 0fc6c124 shufps xmm0, xmm1, 0x24
1459b1c02: 0f28ce movaps xmm1, xmm6
1459b1c05: 0f28e6 movaps xmm4, xmm6
1459b1c08: 0f5ccb subps xmm1, xmm3
1459b1c0b: 440f59e8 mulps xmm13, xmm0
1459b1c0f: 450f28fd movaps xmm15, xmm13
1459b1c13: 410f28ed movaps xmm5, xmm13
1459b1c17: f30f10e9 movss xmm5, xmm1
1459b1c1b: 0f29ac2480000000 movaps xmmword ptr [rsp + 0x80], xmm5
1459b1c23: 450fc6f902 shufps xmm15, xmm9, 2
1459b1c28: 0f28ca movaps xmm1, xmm2
1459b1c2b: 410fc6c9f4 shufps xmm1, xmm9, 0xf4
1459b1c30: 440f294c2470 movaps xmmword ptr [rsp + 0x70], xmm9
1459b1c36: 410f28ef movaps xmm5, xmm15
1459b1c3a: 440fc6f982 shufps xmm15, xmm1, 0x82
1459b1c3f: 450fc6ff24 shufps xmm15, xmm15, 0x24
1459b1c44: 0f57c9 xorps xmm1, xmm1
1459b1c47: 440f59f9 mulps xmm15, xmm1
1459b1c4b: 410f28d7 movaps xmm2, xmm15
1459b1c4f: 66410f15d7 unpckhpd xmm2, xmm15
1459b1c54: f3410f58d4 addss xmm2, xmm12
1459b1c59: f30f58d7 addss xmm2, xmm7
1459b1c5d: 410fc6e9e2 shufps xmm5, xmm9, 0xe2
1459b1c62: 0f58e9 addps xmm5, xmm1
1459b1c65: 410fc6efe4 shufps xmm5, xmm15, 0xe4
1459b1c6a: 0f28fd movaps xmm7, xmm5
1459b1c6d: 0fc6f8d2 shufps xmm7, xmm0, 0xd2
1459b1c71: 0fc6ffd8 shufps xmm7, xmm7, 0xd8
1459b1c75: 440f28cd movaps xmm9, xmm5
1459b1c79: 440f58cf addps xmm9, xmm7
1459b1c7d: 0f5cef subps xmm5, xmm7
1459b1c80: 450f57db xorps xmm11, xmm11
1459b1c84: 450fc6dd9c shufps xmm11, xmm13, 0x9c
1459b1c89: f3410f16fd movshdup xmm7, xmm13
1459b1c8e: 450fc6ffff shufps xmm15, xmm15, 0xff
1459b1c93: 440f28542460 movaps xmm10, xmmword ptr [rsp + 0x60]
1459b1c99: f3450f5cd7 subss xmm10, xmm15
1459b1c9e: f3450f58fc addss xmm15, xmm12
1459b1ca3: f3440f5ce7 subss xmm12, xmm7
1459b1ca8: 0f28742450 movaps xmm6, xmmword ptr [rsp + 0x50]
1459b1cad: f3440f58e6 addss xmm12, xmm6
1459b1cb2: 450f28ec movaps xmm13, xmm12
1459b1cb6: 440fc6edf4 shufps xmm13, xmm5, 0xf4
1459b1cbb: 0f28fd movaps xmm7, xmm5
1459b1cbe: 410fc6f923 shufps xmm7, xmm9, 0x23
1459b1cc3: 410f28e9 movaps xmm5, xmm9
1459b1cc7: 0fc6ef24 shufps xmm5, xmm7, 0x24
1459b1ccb: f30f7efe movq xmm7, xmm6
1459b1ccf: 0fc6f9e2 shufps xmm7, xmm1, 0xe2
1459b1cd3: f30f12c4 movsldup xmm0, xmm4
1459b1cd7: 0f59c7 mulps xmm0, xmm7
1459b1cda: 0f28fc movaps xmm7, xmm4
1459b1cdd: f3410f59f8 mulss xmm7, xmm8
1459b1ce2: 410f28e6 movaps xmm4, xmm14
1459b1ce6: 0f14e3 unpcklps xmm4, xmm3
1459b1ce9: f30f5cdf subss xmm3, xmm7
1459b1ced: 0f58e0 addps xmm4, xmm0
1459b1cf0: 0fc6dc30 shufps xmm3, xmm4, 0x30
1459b1cf4: 0fc6e384 shufps xmm4, xmm3, 0x84
1459b1cf8: 0fc6e424 shufps xmm4, xmm4, 0x24
1459b1cfc: 450fc6db78 shufps xmm11, xmm11, 0x78
1459b1d01: 440f58dc addps xmm11, xmm4
1459b1d05: f3450f59c6 mulss xmm8, xmm14
1459b1d0a: f3440f59f6 mulss xmm14, xmm6
1459b1d0f: f3440f58c0 addss xmm8, xmm0
1459b1d14: f3410f5cc6 subss xmm0, xmm14
1459b1d19: 440f14442470 unpcklps xmm8, xmmword ptr [rsp + 0x70]
1459b1d1f: f30f10c8 movss xmm1, xmm0
1459b1d23: 410fc6c841 shufps xmm1, xmm8, 0x41
1459b1d28: 0f588c2480000000 addps xmm1, xmmword ptr [rsp + 0x80]
1459b1d30: 0f28c1 movaps xmm0, xmm1
1459b1d33: 0fc6c1e3 shufps xmm0, xmm1, 0xe3
1459b1d37: f3410f10c2 movss xmm0, xmm10
1459b1d3c: 0fc6c040 shufps xmm0, xmm0, 0x40
1459b1d40: 0f59c1 mulps xmm0, xmm1
1459b1d43: 0f281d16118901 movaps xmm3, xmmword ptr [rip + 0x1891116]
1459b1d4a: 410f59db mulps xmm3, xmm11
1459b1d4e: 0f28e0 movaps xmm4, xmm0
1459b1d51: 0f58e3 addps xmm4, xmm3
1459b1d54: 0f5cc3 subps xmm0, xmm3
1459b1d57: 0f28d9 movaps xmm3, xmm1
1459b1d5a: 660f15d9 unpckhpd xmm3, xmm1
1459b1d5e: 0fc6c423 shufps xmm0, xmm4, 0x23
1459b1d62: 0fc6e024 shufps xmm4, xmm0, 0x24
1459b1d66: 410f28c3 movaps xmm0, xmm11
1459b1d6a: 66410f15c3 unpckhpd xmm0, xmm11
1459b1d6f: f30f59da mulss xmm3, xmm2
1459b1d73: f30f58d8 addss xmm3, xmm0
1459b1d77: 0f28842490000000 movaps xmm0, xmmword ptr [rsp + 0x90]
1459b1d7f: f30f5905d1108901 mulss xmm0, dword ptr [rip + 0x18910d1]
1459b1d87: f3440f5cf8 subss xmm15, xmm0
1459b1d8c: 0fc6d1f4 shufps xmm2, xmm1, 0xf4
1459b1d90: 0fc6c964 shufps xmm1, xmm1, 0x64
1459b1d94: 0fc6d228 shufps xmm2, xmm2, 0x28
1459b1d98: 0f59d1 mulps xmm2, xmm1
1459b1d9b: 450fc6db64 shufps xmm11, xmm11, 0x64
1459b1da0: 440f591dc8108901 mulps xmm11, xmmword ptr [rip + 0x18910c8]
1459b1da8: 0f28c2 movaps xmm0, xmm2
1459b1dab: 410f5cc3 subps xmm0, xmm11
1459b1daf: 440f58da addps xmm11, xmm2
1459b1db3: 410f28cf movaps xmm1, xmm15
1459b1db7: 410fc6c9d4 shufps xmm1, xmm9, 0xd4
1459b1dbc: f3410f7ed1 movq xmm2, xmm9
1459b1dc1: 410fc6c3c9 shufps xmm0, xmm11, 0xc9
1459b1dc6: f3410f7ef4 movq xmm6, xmm12
1459b1dcb: 0fc6d682 shufps xmm2, xmm6, 0x82
1459b1dcf: f3410f7ef7 movq xmm6, xmm15
1459b1dd4: 0f59d5 mulps xmm2, xmm5
1459b1dd7: 0fc6ee2d shufps xmm5, xmm6, 0x2d
1459b1ddb: 440fc6e982 shufps xmm13, xmm1, 0x82
1459b1de0: 440f59ed mulps xmm13, xmm5
1459b1de4: 440f58e8 addps xmm13, xmm0
1459b1de8: 0f58d4 addps xmm2, xmm4
1459b1deb: f3450f59fc mulss xmm15, xmm12
1459b1df0: f3440f58fb addss xmm15, xmm3
1459b1df5: 0f299424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm2
1459b1dfd: 440f29ac24b0000000 movaps xmmword ptr [rsp + 0xb0], xmm13
1459b1e06: f3440f11bc24c0000000 movss dword ptr [rsp + 0xc0], xmm15
1459b1e10: 488b4308 mov rax, qword ptr [rbx + 8]
1459b1e14: 488b4b10 mov rcx, qword ptr [rbx + 0x10]
1459b1e18: 488d0c49 lea rcx, [rcx + rcx*2]
1459b1e1c: 488d0c88 lea rcx, [rax + rcx*4]
1459b1e20: 4889442428 mov qword ptr [rsp + 0x28], rax
1459b1e25: 48894c2430 mov qword ptr [rsp + 0x30], rcx
1459b1e2a: 488d8424a0000000 lea rax, [rsp + 0xa0]
1459b1e32: 4889442438 mov qword ptr [rsp + 0x38], rax
1459b1e37: 48897c2440 mov qword ptr [rsp + 0x40], rdi
1459b1e3c: 488d8424b0010000 lea rax, [rsp + 0x1b0]
1459b1e44: 4889442448 mov qword ptr [rsp + 0x48], rax
1459b1e49: 488d542428 lea rdx, [rsp + 0x28]
1459b1e4e: 4889f1 mov rcx, rsi
1459b1e51: e81adf0200 call 0x1459dfd70
1459b1e56: 4889f0 mov rax, rsi
1459b1e59: 0f28b424d0000000 movaps xmm6, xmmword ptr [rsp + 0xd0]
1459b1e61: 0f28bc24e0000000 movaps xmm7, xmmword ptr [rsp + 0xe0]
1459b1e69: 440f288424f0000000 movaps xmm8, xmmword ptr [rsp + 0xf0]
1459b1e72: 440f288c2400010000 movaps xmm9, xmmword ptr [rsp + 0x100]
1459b1e7b: 440f28942410010000 movaps xmm10, xmmword ptr [rsp + 0x110]
1459b1e84: 440f289c2420010000 movaps xmm11, xmmword ptr [rsp + 0x120]
1459b1e8d: 440f28a42430010000 movaps xmm12, xmmword ptr [rsp + 0x130]
1459b1e96: 440f28ac2440010000 movaps xmm13, xmmword ptr [rsp + 0x140]
1459b1e9f: 440f28b42450010000 movaps xmm14, xmmword ptr [rsp + 0x150]
1459b1ea8: 440f28bc2460010000 movaps xmm15, xmmword ptr [rsp + 0x160]
1459b1eb1: 4881c470010000 add rsp, 0x170
1459b1eb8: 5b pop rbx
1459b1eb9: 5f pop rdi
1459b1eba: 5e pop rsi
1459b1ebb: c3 ret
