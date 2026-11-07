1458a5ab0: 4157 push r15
1458a5ab2: 4156 push r14
1458a5ab4: 4155 push r13
1458a5ab6: 4154 push r12
1458a5ab8: 56 push rsi
1458a5ab9: 57 push rdi
1458a5aba: 55 push rbp
1458a5abb: 53 push rbx
1458a5abc: 4881ec48010000 sub rsp, 0x148
1458a5ac3: 440f29bc2430010000 movaps xmmword ptr [rsp + 0x130], xmm15
1458a5acc: 440f29b42420010000 movaps xmmword ptr [rsp + 0x120], xmm14
1458a5ad5: 440f29ac2410010000 movaps xmmword ptr [rsp + 0x110], xmm13
1458a5ade: 440f29a42400010000 movaps xmmword ptr [rsp + 0x100], xmm12
1458a5ae7: 440f299c24f0000000 movaps xmmword ptr [rsp + 0xf0], xmm11
1458a5af0: 440f299424e0000000 movaps xmmword ptr [rsp + 0xe0], xmm10
1458a5af9: 440f298c24d0000000 movaps xmmword ptr [rsp + 0xd0], xmm9
1458a5b02: 440f298424c0000000 movaps xmmword ptr [rsp + 0xc0], xmm8
1458a5b0b: 0f29bc24b0000000 movaps xmmword ptr [rsp + 0xb0], xmm7
1458a5b13: 0f29b424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm6
1458a5b1b: 488b8424b0010000 mov rax, qword ptr [rsp + 0x1b0]
1458a5b23: f3410f104908 movss xmm1, dword ptr [r9 + 8]
1458a5b29: f3410f106808 movss xmm5, dword ptr [r8 + 8]
1458a5b2f: f30f104008 movss xmm0, dword ptr [rax + 8]
1458a5b34: 0f28f0 movaps xmm6, xmm0
1458a5b37: 0f14f1 unpcklps xmm6, xmm1
1458a5b3a: f30f12d5 movsldup xmm2, xmm5
1458a5b3e: 0f5cf2 subps xmm6, xmm2
1458a5b41: f30f16d6 movshdup xmm2, xmm6
1458a5b45: f2450f1031 movsd xmm14, qword ptr [r9]
1458a5b4a: f2410f1038 movsd xmm7, qword ptr [r8]
1458a5b4f: 410f28e6 movaps xmm4, xmm14
1458a5b53: 0f5ce7 subps xmm4, xmm7
1458a5b56: f2440f1008 movsd xmm9, qword ptr [rax]
1458a5b5b: 450f28c1 movaps xmm8, xmm9
1458a5b5f: 440f5cc7 subps xmm8, xmm7
1458a5b63: 440f28fe movaps xmm15, xmm6
1458a5b67: 450fc6f810 shufps xmm15, xmm8, 0x10
1458a5b6c: 450fc6f8e2 shufps xmm15, xmm8, 0xe2
1458a5b71: 440f59fc mulps xmm15, xmm4
1458a5b75: 0f28de movaps xmm3, xmm6
1458a5b78: 0fc6dc11 shufps xmm3, xmm4, 0x11
1458a5b7c: 0fc6dce2 shufps xmm3, xmm4, 0xe2
1458a5b80: 410f59d8 mulps xmm3, xmm8
1458a5b84: 440f5cfb subps xmm15, xmm3
1458a5b88: 410f28df movaps xmm3, xmm15
1458a5b8c: 410f59df mulps xmm3, xmm15
1458a5b90: 0f29642460 movaps xmmword ptr [rsp + 0x60], xmm4
1458a5b95: f30f59e6 mulss xmm4, xmm6
1458a5b99: 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
1458a5b9f: f3410f59d0 mulss xmm2, xmm8
1458a5ba4: f30f5cd4 subss xmm2, xmm4
1458a5ba8: f30f59d2 mulss xmm2, xmm2
1458a5bac: f30f16e3 movshdup xmm4, xmm3
1458a5bb0: f30f58e2 addss xmm4, xmm2
1458a5bb4: f30f58e3 addss xmm4, xmm3
1458a5bb8: 0f57d2 xorps xmm2, xmm2
1458a5bbb: f30f51d4 sqrtss xmm2, xmm4
1458a5bbf: f30f101da9066000 movss xmm3, dword ptr [rip + 0x6006a9]
1458a5bc7: 0f2eda ucomiss xmm3, xmm2
1458a5bca: 0f87ef040000 ja 0x1458a60bf
1458a5bd0: 0f281dd9db5000 movaps xmm3, xmmword ptr [rip + 0x50dbd9]
1458a5bd7: 410f54df andps xmm3, xmm15
1458a5bdb: f30f5eda divss xmm3, xmm2
1458a5bdf: f30f101519755400 movss xmm2, dword ptr [rip + 0x547519]
1458a5be7: 0f2ed3 ucomiss xmm2, xmm3
1458a5bea: 0f87cf040000 ja 0x1458a60bf
1458a5bf0: 0f28d5 movaps xmm2, xmm5
1458a5bf3: f30f5dd1 minss xmm2, xmm1
1458a5bf7: 0f28ca movaps xmm1, xmm2
1458a5bfa: f30fc2ca03 cmpunordss xmm1, xmm2
1458a5bff: 0f28d9 movaps xmm3, xmm1
1458a5c02: 0f55da andnps xmm3, xmm2
1458a5c05: 0f54cd andps xmm1, xmm5
1458a5c08: 0f56cb orps xmm1, xmm3
1458a5c0b: 0f28d1 movaps xmm2, xmm1
1458a5c0e: f30f5dd0 minss xmm2, xmm0
1458a5c12: 0f28c2 movaps xmm0, xmm2
1458a5c15: f30fc2c203 cmpunordss xmm0, xmm2
1458a5c1a: 0f54c8 andps xmm1, xmm0
1458a5c1d: 0f55c2 andnps xmm0, xmm2
1458a5c20: 0f56c1 orps xmm0, xmm1
1458a5c23: 0f2e8424b8010000 ucomiss xmm0, dword ptr [rsp + 0x1b8]
1458a5c2b: 0f878e040000 ja 0x1458a60bf
1458a5c31: 4889ce mov rsi, rcx
1458a5c34: 0f29742470 movaps xmmword ptr [rsp + 0x70], xmm6
1458a5c39: 0f29ac2480000000 movaps xmmword ptr [rsp + 0x80], xmm5
1458a5c41: f3440f102a movss xmm13, dword ptr [rdx]
1458a5c46: f30f104204 movss xmm0, dword ptr [rdx + 4]
1458a5c4b: f30f1144242c movss dword ptr [rsp + 0x2c], xmm0
1458a5c51: 4c8b7208 mov r14, qword ptr [rdx + 8]
1458a5c55: 0f28c7 movaps xmm0, xmm7
1458a5c58: f3410f5dc6 minss xmm0, xmm14
1458a5c5d: 0f28c8 movaps xmm1, xmm0
1458a5c60: f30fc2c803 cmpunordss xmm1, xmm0
1458a5c65: 0f28d1 movaps xmm2, xmm1
1458a5c68: 0f55d0 andnps xmm2, xmm0
1458a5c6b: 0f54cf andps xmm1, xmm7
1458a5c6e: 0f56ca orps xmm1, xmm2
1458a5c71: 0f28c1 movaps xmm0, xmm1
1458a5c74: f3410f5dc1 minss xmm0, xmm9
1458a5c79: 0f28f0 movaps xmm6, xmm0
1458a5c7c: f30fc2f003 cmpunordss xmm6, xmm0
1458a5c81: 0f54ce andps xmm1, xmm6
1458a5c84: 0f55f0 andnps xmm6, xmm0
1458a5c87: 0f56f1 orps xmm6, xmm1
1458a5c8a: 0f28c7 movaps xmm0, xmm7
1458a5c8d: f3410f5fc6 maxss xmm0, xmm14
1458a5c92: 0f28c8 movaps xmm1, xmm0
1458a5c95: f30fc2c803 cmpunordss xmm1, xmm0
1458a5c9a: 0f28d1 movaps xmm2, xmm1
1458a5c9d: 0f55d0 andnps xmm2, xmm0
1458a5ca0: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1458a5ca5: 0f54cf andps xmm1, xmm7
1458a5ca8: 0f56ca orps xmm1, xmm2
1458a5cab: 0f28d1 movaps xmm2, xmm1
1458a5cae: f3410f5fd1 maxss xmm2, xmm9
1458a5cb3: 0f28c2 movaps xmm0, xmm2
1458a5cb6: f30fc2c203 cmpunordss xmm0, xmm2
1458a5cbb: 0f54c8 andps xmm1, xmm0
1458a5cbe: 0f55c2 andnps xmm0, xmm2
1458a5cc1: 0f56c1 orps xmm0, xmm1
1458a5cc4: f3410f5cc5 subss xmm0, xmm13
1458a5cc9: f30f58c0 addss xmm0, xmm0
1458a5ccd: f30f58055b285000 addss xmm0, dword ptr [rip + 0x50285b]
1458a5cd5: e83ff53500 call 0x145c05219
1458a5cda: 450f57d2 xorps xmm10, xmm10
1458a5cde: 440f2ed0 ucomiss xmm10, xmm0
1458a5ce2: 7604 jbe 0x1458a5ce8
1458a5ce4: 31db xor ebx, ebx
1458a5ce6: eb48 jmp 0x1458a5d30
1458a5ce8: f3480f2cc0 cvttss2si rax, xmm0
1458a5ced: 4889c1 mov rcx, rax
1458a5cf0: 0f28c8 movaps xmm1, xmm0
1458a5cf3: f30f5c0d55bc5000 subss xmm1, dword ptr [rip + 0x50bc55]
1458a5cfb: f3480f2cd1 cvttss2si rdx, xmm1
1458a5d00: 48c1f93f sar rcx, 0x3f
1458a5d04: 4821ca and rdx, rcx
1458a5d07: 4809c2 or rdx, rax
1458a5d0a: 31c0 xor eax, eax
1458a5d0c: 410f2ec2 ucomiss xmm0, xmm10
1458a5d10: 480f43c2 cmovae rax, rdx
1458a5d14: 0f2e0539bc5000 ucomiss xmm0, dword ptr [rip + 0x50bc39]
1458a5d1b: 48c7c3ffffffff mov rbx, 0xffffffffffffffff
1458a5d22: 480f46d8 cmovbe rbx, rax
1458a5d26: 48ffc3 inc rbx
1458a5d29: 4939de cmp r14, rbx
1458a5d2c: 490f42de cmovb rbx, r14
1458a5d30: f3410f5cf5 subss xmm6, xmm13
1458a5d35: f30f58f6 addss xmm6, xmm6
1458a5d39: f30f103def275000 movss xmm7, dword ptr [rip + 0x5027ef]
1458a5d41: f30f58f7 addss xmm6, xmm7
1458a5d45: 0f28c6 movaps xmm0, xmm6
1458a5d48: e8aef43500 call 0x145c051fb
1458a5d4d: f3410f5fc2 maxss xmm0, xmm10
1458a5d52: f3480f2cc0 cvttss2si rax, xmm0
1458a5d57: 4889c1 mov rcx, rax
1458a5d5a: 0f28c8 movaps xmm1, xmm0
1458a5d5d: f30f5c0debbb5000 subss xmm1, dword ptr [rip + 0x50bbeb]
1458a5d65: f3480f2cf9 cvttss2si rdi, xmm1
1458a5d6a: 48c1f93f sar rcx, 0x3f
1458a5d6e: 4821cf and rdi, rcx
1458a5d71: 4809c7 or rdi, rax
1458a5d74: 4531ff xor r15d, r15d
1458a5d77: 410f2ec2 ucomiss xmm0, xmm10
1458a5d7b: 490f42ff cmovb rdi, r15
1458a5d7f: 0f2e05cebb5000 ucomiss xmm0, dword ptr [rip + 0x50bbce]
1458a5d86: 49c7c5ffffffff mov r13, 0xffffffffffffffff
1458a5d8d: 490f47fd cmova rdi, r13
1458a5d91: f3410f16c6 movshdup xmm0, xmm14
1458a5d96: f30f16642430 movshdup xmm4, xmmword ptr [rsp + 0x30]
1458a5d9c: 0f28cc movaps xmm1, xmm4
1458a5d9f: f30f5dc8 minss xmm1, xmm0
1458a5da3: 0f28d1 movaps xmm2, xmm1
1458a5da6: f30fc2d103 cmpunordss xmm2, xmm1
1458a5dab: 0f28da movaps xmm3, xmm2
1458a5dae: 0f55d9 andnps xmm3, xmm1
1458a5db1: 0f54d4 andps xmm2, xmm4
1458a5db4: 0f56d3 orps xmm2, xmm3
1458a5db7: f3410f16c9 movshdup xmm1, xmm9
1458a5dbc: 0f28da movaps xmm3, xmm2
1458a5dbf: f30f5dd9 minss xmm3, xmm1
1458a5dc3: 0f28f3 movaps xmm6, xmm3
1458a5dc6: f30fc2f303 cmpunordss xmm6, xmm3
1458a5dcb: 0f54d6 andps xmm2, xmm6
1458a5dce: 0f55f3 andnps xmm6, xmm3
1458a5dd1: 0f56f2 orps xmm6, xmm2
1458a5dd4: 0f28d4 movaps xmm2, xmm4
1458a5dd7: f30f5fd0 maxss xmm2, xmm0
1458a5ddb: 0f28da movaps xmm3, xmm2
1458a5dde: f30fc2da03 cmpunordss xmm3, xmm2
1458a5de3: 0f28c3 movaps xmm0, xmm3
1458a5de6: 0f55c2 andnps xmm0, xmm2
1458a5de9: 0f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm4
1458a5df1: 0f54dc andps xmm3, xmm4
1458a5df4: 0f56d8 orps xmm3, xmm0
1458a5df7: 0f28d3 movaps xmm2, xmm3
1458a5dfa: f30f5fd1 maxss xmm2, xmm1
1458a5dfe: 0f28c2 movaps xmm0, xmm2
1458a5e01: f30fc2c203 cmpunordss xmm0, xmm2
1458a5e06: 0f54d8 andps xmm3, xmm0
1458a5e09: 0f55c2 andnps xmm0, xmm2
1458a5e0c: 0f56c3 orps xmm0, xmm3
1458a5e0f: f30f5c44242c subss xmm0, dword ptr [rsp + 0x2c]
1458a5e15: f30f58c0 addss xmm0, xmm0
1458a5e19: f30f58c7 addss xmm0, xmm7
1458a5e1d: e8f7f33500 call 0x145c05219
1458a5e22: 440f2ed0 ucomiss xmm10, xmm0
1458a5e26: 7744 ja 0x1458a5e6c
1458a5e28: f3480f2cc0 cvttss2si rax, xmm0
1458a5e2d: 4889c1 mov rcx, rax
1458a5e30: 48c1f93f sar rcx, 0x3f
1458a5e34: 0f28c8 movaps xmm1, xmm0
1458a5e37: f30f5c0d11bb5000 subss xmm1, dword ptr [rip + 0x50bb11]
1458a5e3f: f3480f2cd1 cvttss2si rdx, xmm1
1458a5e44: 4821ca and rdx, rcx
1458a5e47: 4809c2 or rdx, rax
1458a5e4a: 4531ff xor r15d, r15d
1458a5e4d: 0f57c9 xorps xmm1, xmm1
1458a5e50: 0f2ec1 ucomiss xmm0, xmm1
1458a5e53: 4c0f43fa cmovae r15, rdx
1458a5e57: 0f2e05f6ba5000 ucomiss xmm0, dword ptr [rip + 0x50baf6]
1458a5e5e: 4d0f47fd cmova r15, r13
1458a5e62: 49ffc7 inc r15
1458a5e65: 4d39fe cmp r14, r15
1458a5e68: 4d0f42fe cmovb r15, r14
1458a5e6c: f30f5c74242c subss xmm6, dword ptr [rsp + 0x2c]
1458a5e72: f30f58f6 addss xmm6, xmm6
1458a5e76: f30f5835b2265000 addss xmm6, dword ptr [rip + 0x5026b2]
1458a5e7e: 0f28c6 movaps xmm0, xmm6
1458a5e81: e875f33500 call 0x145c051fb
1458a5e86: 0f57c9 xorps xmm1, xmm1
1458a5e89: f30f5fc1 maxss xmm0, xmm1
1458a5e8d: f3480f2cc0 cvttss2si rax, xmm0
1458a5e92: 4889c1 mov rcx, rax
1458a5e95: 0f28d0 movaps xmm2, xmm0
1458a5e98: f30f5c15b0ba5000 subss xmm2, dword ptr [rip + 0x50bab0]
1458a5ea0: f3480f2cd2 cvttss2si rdx, xmm2
1458a5ea5: 48c1f93f sar rcx, 0x3f
1458a5ea9: 4821ca and rdx, rcx
1458a5eac: 4809c2 or rdx, rax
1458a5eaf: 4531e4 xor r12d, r12d
1458a5eb2: 0f2ec1 ucomiss xmm0, xmm1
1458a5eb5: 4c0f43e2 cmovae r12, rdx
1458a5eb9: 0f2e0594ba5000 ucomiss xmm0, dword ptr [rip + 0x50ba94]
1458a5ec0: 4d0f47e5 cmova r12, r13
1458a5ec4: 4c897c2448 mov qword ptr [rsp + 0x48], r15
1458a5ec9: 4d39fc cmp r12, r15
1458a5ecc: 0f28942480000000 movaps xmm2, xmmword ptr [rsp + 0x80]
1458a5ed4: 0f285c2470 movaps xmm3, xmmword ptr [rsp + 0x70]
1458a5ed9: 0f28642430 movaps xmm4, xmmword ptr [rsp + 0x30]
1458a5ede: 0f83db010000 jae 0x1458a60bf
1458a5ee4: 4839df cmp rdi, rbx
1458a5ee7: 0f83d2010000 jae 0x1458a60bf
1458a5eed: f3410f12f7 movsldup xmm6, xmm15
1458a5ef2: f3440f16742460 movshdup xmm14, xmmword ptr [rsp + 0x60]
1458a5ef9: f3440f167c2450 movshdup xmm15, xmmword ptr [rsp + 0x50]
1458a5f00: 4489e5 mov ebp, r12d
1458a5f03: 410fafee imul ebp, r14d
1458a5f07: 01fd add ebp, edi
1458a5f09: f3440f101562235000 movss xmm10, dword ptr [rip + 0x502362]
1458a5f12: f3440f101dfdcc6700 movss xmm11, dword ptr [rip + 0x67ccfd]
1458a5f1b: f3440f1025fc718e00 movss xmm12, dword ptr [rip + 0x8e71fc]
1458a5f24: 4c89742440 mov qword ptr [rsp + 0x40], r14
1458a5f29: eb17 jmp 0x1458a5f42
1458a5f2b: 0f1f440000 nop dword ptr [rax + rax]
1458a5f30: 49ffc4 inc r12
1458a5f33: 036c2440 add ebp, dword ptr [rsp + 0x40]
1458a5f37: 4c3b642448 cmp r12, qword ptr [rsp + 0x48]
1458a5f3c: 0f847d010000 je 0x1458a60bf
1458a5f42: 4d85e4 test r12, r12
1458a5f45: 7819 js 0x1458a5f60
1458a5f47: 0f57ff xorps xmm7, xmm7
1458a5f4a: f3490f2afc cvtsi2ss xmm7, r12
1458a5f4f: eb2a jmp 0x1458a5f7b
1458a5f51: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458a5f60: 4c89e0 mov rax, r12
1458a5f63: 48d1e8 shr rax, 1
1458a5f66: 4489e1 mov ecx, r12d
1458a5f69: 83e101 and ecx, 1
1458a5f6c: 4809c1 or rcx, rax
1458a5f6f: 0f57ff xorps xmm7, xmm7
1458a5f72: f3480f2af9 cvtsi2ss xmm7, rcx
1458a5f77: f30f58ff addss xmm7, xmm7
1458a5f7b: f30f10ac24b8010000 movss xmm5, dword ptr [rsp + 0x1b8]
1458a5f84: f3410f58fa addss xmm7, xmm10
1458a5f89: f3410f59fa mulss xmm7, xmm10
1458a5f8e: f30f587c242c addss xmm7, dword ptr [rsp + 0x2c]
1458a5f94: f30f5cbc2490000000 subss xmm7, dword ptr [rsp + 0x90]
1458a5f9d: 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
1458a5fa3: f3440f59c7 mulss xmm8, xmm7
1458a5fa8: f30f597c2460 mulss xmm7, dword ptr [rsp + 0x60]
1458a5fae: 4189ed mov r13d, ebp
1458a5fb1: 4989fe mov r14, rdi
1458a5fb4: eb2f jmp 0x1458a5fe5
1458a5fb6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458a5fc0: 488b4608 mov rax, qword ptr [rsi + 8]
1458a5fc4: 46892cf8 mov dword ptr [rax + r15*8], r13d
1458a5fc8: f3460f114cf804 movss dword ptr [rax + r15*8 + 4], xmm9
1458a5fcf: 49ffc7 inc r15
1458a5fd2: 4c897e10 mov qword ptr [rsi + 0x10], r15
1458a5fd6: 49ffc6 inc r14
1458a5fd9: 41ffc5 inc r13d
1458a5fdc: 4c39f3 cmp rbx, r14
1458a5fdf: 0f844bffffff je 0x1458a5f30
1458a5fe5: 4d85f6 test r14, r14
1458a5fe8: 7816 js 0x1458a6000
1458a5fea: 0f57c9 xorps xmm1, xmm1
1458a5fed: f3490f2ace cvtsi2ss xmm1, r14
1458a5ff2: eb27 jmp 0x1458a601b
1458a5ff4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458a6000: 4c89f0 mov rax, r14
1458a6003: 48d1e8 shr rax, 1
1458a6006: 4489f1 mov ecx, r14d
1458a6009: 83e101 and ecx, 1
1458a600c: 4809c1 or rcx, rax
1458a600f: 0f57c9 xorps xmm1, xmm1
1458a6012: f3480f2ac9 cvtsi2ss xmm1, rcx
1458a6017: f30f58c9 addss xmm1, xmm1
1458a601b: f3410f58ca addss xmm1, xmm10
1458a6020: f3410f59ca mulss xmm1, xmm10
1458a6025: f3410f58cd addss xmm1, xmm13
1458a602a: f30f5ccc subss xmm1, xmm4
1458a602e: 410f28c7 movaps xmm0, xmm15
1458a6032: f30f59c1 mulss xmm0, xmm1
1458a6036: f3410f59ce mulss xmm1, xmm14
1458a603b: 410f14c8 unpcklps xmm1, xmm8
1458a603f: 0f16c7 movlhps xmm0, xmm7
1458a6042: 0fc6c7e2 shufps xmm0, xmm7, 0xe2
1458a6046: 0f5cc1 subps xmm0, xmm1
1458a6049: 0f5ec6 divps xmm0, xmm6
1458a604c: f30f16c8 movshdup xmm1, xmm0
1458a6050: 440f2ed9 ucomiss xmm11, xmm1
1458a6054: 7780 ja 0x1458a5fd6
1458a6056: 440f2ed8 ucomiss xmm11, xmm0
1458a605a: 0f8776ffffff ja 0x1458a5fd6
1458a6060: f30f58c8 addss xmm1, xmm0
1458a6064: 410f2ecc ucomiss xmm1, xmm12
1458a6068: 0f8768ffffff ja 0x1458a5fd6
1458a606e: 0f59c3 mulps xmm0, xmm3
1458a6071: f3440f16c8 movshdup xmm9, xmm0
1458a6076: f3440f58ca addss xmm9, xmm2
1458a607b: f3440f58c8 addss xmm9, xmm0
1458a6080: 410f2ee9 ucomiss xmm5, xmm9
1458a6084: 0f824cffffff jb 0x1458a5fd6
1458a608a: 4c8b7e10 mov r15, qword ptr [rsi + 0x10]
1458a608e: 4c3b3e cmp r15, qword ptr [rsi]
1458a6091: 0f8529ffffff jne 0x1458a5fc0
1458a6097: 4889f1 mov rcx, rsi
1458a609a: e891b13600 call 0x145c11230
1458a609f: f30f10ac24b8010000 movss xmm5, dword ptr [rsp + 0x1b8]
1458a60a8: 0f28642430 movaps xmm4, xmmword ptr [rsp + 0x30]
1458a60ad: 0f285c2470 movaps xmm3, xmmword ptr [rsp + 0x70]
1458a60b2: 0f28942480000000 movaps xmm2, xmmword ptr [rsp + 0x80]
1458a60ba: e901ffffff jmp 0x1458a5fc0
1458a60bf: 0f28b424a0000000 movaps xmm6, xmmword ptr [rsp + 0xa0]
1458a60c7: 0f28bc24b0000000 movaps xmm7, xmmword ptr [rsp + 0xb0]
1458a60cf: 440f288424c0000000 movaps xmm8, xmmword ptr [rsp + 0xc0]
1458a60d8: 440f288c24d0000000 movaps xmm9, xmmword ptr [rsp + 0xd0]
1458a60e1: 440f289424e0000000 movaps xmm10, xmmword ptr [rsp + 0xe0]
1458a60ea: 440f289c24f0000000 movaps xmm11, xmmword ptr [rsp + 0xf0]
1458a60f3: 440f28a42400010000 movaps xmm12, xmmword ptr [rsp + 0x100]
1458a60fc: 440f28ac2410010000 movaps xmm13, xmmword ptr [rsp + 0x110]
1458a6105: 440f28b42420010000 movaps xmm14, xmmword ptr [rsp + 0x120]
1458a610e: 440f28bc2430010000 movaps xmm15, xmmword ptr [rsp + 0x130]
1458a6117: 4881c448010000 add rsp, 0x148
1458a611e: 5b pop rbx
1458a611f: 5d pop rbp
1458a6120: 5f pop rdi
1458a6121: 5e pop rsi
1458a6122: 415c pop r12
1458a6124: 415d pop r13
1458a6126: 415e pop r14
1458a6128: 415f pop r15
1458a612a: c3 ret
