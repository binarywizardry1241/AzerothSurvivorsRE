; refresh-stat-dispatch: 0x1458f30af..0x1458f3107, exact selected 0.112.0 bytes
1458f30af: 440f285d00  movaps xmm11, xmmword ptr [rbp]
1458f30b4: f30f101574e64b00  movss xmm2, dword ptr [rip + 0x4be674]
1458f30bc: 4d85ed  test r13, r13
1458f30bf: 0f8434feffff  je 0x1458f2ef9
1458f30c5: 498d5604  lea rdx, [r14 + 4]
1458f30c9: f30f10155fe64b00  movss xmm2, dword ptr [rip + 0x4be65f]
1458f30d1: f30f115530  movss dword ptr [rbp + 0x30], xmm2
1458f30d6: 0f57d2  xorps xmm2, xmm2
1458f30d9: f30f1195ac000000  movss dword ptr [rbp + 0xac], xmm2
1458f30e1: 440fb64afc  movzx r9d, byte ptr [rdx - 4]
1458f30e6: 4c8d053b903101  lea r8, [rip + 0x131903b]
1458f30ed: 4f630c88  movsxd r9, dword ptr [r8 + r9*4]
1458f30f1: 4d01c1  add r9, r8
1458f30f4: f30f1195b4000000  movss dword ptr [rbp + 0xb4], xmm2
1458f30fc: f30f1195b0000000  movss dword ptr [rbp + 0xb0], xmm2
1458f3104: 41ffe1  jmp r9

; refresh-stat23-leaf: 0x1458f39bf..0x1458f39c6, exact selected 0.112.0 bytes
1458f39bf: f3440f581a  addss xmm11, dword ptr [rdx]
1458f39c4: ebaa  jmp 0x1458f3970

; aura-loop: 0x1458f3107..0x1458f3234, exact selected 0.112.0 bytes
1458f3107: f30f10964c0a0000  movss xmm2, dword ptr [rsi + 0xa4c]
1458f310f: 4c8b8690030000  mov r8, qword ptr [rsi + 0x390]
1458f3116: 488b9698030000  mov rdx, qword ptr [rsi + 0x398]
1458f311d: 488d1452  lea rdx, [rdx + rdx*2]
1458f3121: 498d14d0  lea rdx, [r8 + rdx*8]
1458f3125: f3440f100d32a14b00  movss xmm9, dword ptr [rip + 0x4ba132]
1458f312e: 440f295d00  movaps xmmword ptr [rbp], xmm11
1458f3133: f3450f58cb  addss xmm9, xmm11
1458f3138: 0f284d40  movaps xmm1, xmmword ptr [rbp + 0x40]
1458f313c: 440f28d8  movaps xmm11, xmm0
1458f3140: 410f28c2  movaps xmm0, xmm10
1458f3144: 0f289d90000000  movaps xmm3, xmmword ptr [rbp + 0x90]
1458f314b: 4d89c1  mov r9, r8
1458f314e: 6690  nop
1458f3150: 4939d1  cmp r9, rdx
1458f3153: 0f84db000000  je 0x1458f3234
1458f3159: 4d8d4118  lea r8, [r9 + 0x18]
1458f315d: 410f2e5110  ucomiss xmm2, dword ptr [r9 + 0x10]
1458f3162: 4d89c1  mov r9, r8
1458f3165: 73e9  jae 0x1458f3150
1458f3167: 410f28dd  movaps xmm3, xmm13
1458f316b: 0f28f5  movaps xmm6, xmm5
1458f316e: 0f28e9  movaps xmm5, xmm1
1458f3171: 450f28f8  movaps xmm15, xmm8
1458f3175: 458b48e8  mov r9d, dword ptr [r8 - 0x18]
1458f3179: 4183f908  cmp r9d, 8
1458f317d: 746a  je 0x1458f31e9
1458f317f: 440f284550  movaps xmm8, xmmword ptr [rbp + 0x50]
1458f3184: 4183f909  cmp r9d, 9
1458f3188: 750f  jne 0x1458f3199
1458f318a: f3410f1048ec  movss xmm1, dword ptr [r8 - 0x14]
1458f3190: f3410f59c9  mulss xmm1, xmm9
1458f3195: f30f58e1  addss xmm4, xmm1
1458f3199: 458b48f4  mov r9d, dword ptr [r8 - 0xc]
1458f319d: 4181f9d15b0000  cmp r9d, 0x5bd1
1458f31a4: 440f294550  movaps xmmword ptr [rbp + 0x50], xmm8
1458f31a9: 7465  je 0x1458f3210
1458f31ab: 4181f99b5b0000  cmp r9d, 0x5b9b
1458f31b2: 450f28c7  movaps xmm8, xmm15
1458f31b6: 0f28cd  movaps xmm1, xmm5
1458f31b9: 0f28ee  movaps xmm5, xmm6
1458f31bc: 440f28d0  movaps xmm10, xmm0
1458f31c0: 410f28c3  movaps xmm0, xmm11
1458f31c4: 440f28eb  movaps xmm13, xmm3
1458f31c8: 0f856effffff  jne 0x1458f313c
1458f31ce: 0f28f1  movaps xmm6, xmm1
1458f31d1: 0f284df0  movaps xmm1, xmmword ptr [rbp - 0x10]
1458f31d5: f30f580d53e54b00  addss xmm1, dword ptr [rip + 0x4be553]
1458f31dd: 0f294df0  movaps xmmword ptr [rbp - 0x10], xmm1
1458f31e1: 0f28ce  movaps xmm1, xmm6
1458f31e4: e953ffffff  jmp 0x1458f313c
1458f31e9: 440f284550  movaps xmm8, xmmword ptr [rbp + 0x50]
1458f31ee: f3410f1048ec  movss xmm1, dword ptr [r8 - 0x14]
1458f31f4: f3410f59c9  mulss xmm1, xmm9
1458f31f9: f3440f58e1  addss xmm12, xmm1
1458f31fe: 458b48f4  mov r9d, dword ptr [r8 - 0xc]
1458f3202: 4181f9d15b0000  cmp r9d, 0x5bd1
1458f3209: 440f294550  movaps xmmword ptr [rbp + 0x50], xmm8
1458f320e: 759b  jne 0x1458f31ab
1458f3210: f3440f58254ba04b00  addss xmm12, dword ptr [rip + 0x4ba04b]
1458f3219: 450f28c7  movaps xmm8, xmm15
1458f321d: 0f28cd  movaps xmm1, xmm5
1458f3220: 0f28ee  movaps xmm5, xmm6
1458f3223: 440f28d0  movaps xmm10, xmm0
1458f3227: 410f28c3  movaps xmm0, xmm11
1458f322b: 440f28eb  movaps xmm13, xmm3
1458f322f: e908ffffff  jmp 0x1458f313c

; buff-stat-store: 0x1458f33ea..0x1458f33f6, exact selected 0.112.0 bytes
1458f33ea: 0f284500  movaps xmm0, xmmword ptr [rbp]
1458f33ee: f30f1186c0040000  movss dword ptr [rsi + 0x4c0], xmm0

; jewelry-health-armor-leaf6: 0x1458f3847..0x1458f3865, exact selected 0.112.0 bytes
1458f3847: f3410f58e1  addss xmm4, xmm9
1458f384c: f3440f590ddb744c00  mulss xmm9, dword ptr [rip + 0x4c74db]
1458f3855: f3440f5d0dea324c00  minss xmm9, dword ptr [rip + 0x4c32ea]
1458f385e: f3410f58d9  addss xmm3, xmm9
1458f3863: eb6b  jmp 0x1458f38d0

; jewelry-potency-leaf17: 0x1458f3956..0x1458f3968, exact selected 0.112.0 bytes
1458f3956: 0f285500  movaps xmm2, xmmword ptr [rbp]
1458f395a: f3410f58d1  addss xmm2, xmm9
1458f395f: 0f295500  movaps xmmword ptr [rbp], xmm2
1458f3963: e968ffffff  jmp 0x1458f38d0

; shield-fraction: 0x145927f46..0x145927f52, exact selected 0.112.0 bytes
145927f46: f3410f104c2450  movss xmm1, dword ptr [r12 + 0x50]
145927f4d: f30f594e6c  mulss xmm1, dword ptr [rsi + 0x6c]

; shield-order-once: 0x14592818b..0x1459281f7, exact selected 0.112.0 bytes
14592818b: 4c8db788030000  lea r14, [rdi + 0x388]
145928192: f30f59c1  mulss xmm0, xmm1
145928196: f3450f59cb  mulss xmm9, xmm11
14592819b: 0f57c9  xorps xmm1, xmm1
14592819e: f3410f51c9  sqrtss xmm1, xmm9
1459281a3: f30f590de9914800  mulss xmm1, dword ptr [rip + 0x4891e9]
1459281ab: f30f59c8  mulss xmm1, xmm0
1459281af: f30f1087c0040000  movss xmm0, dword ptr [rdi + 0x4c0]
1459281b7: f30f1097ec040000  movss xmm2, dword ptr [rdi + 0x4ec]
1459281bf: f30f580599504800  addss xmm0, dword ptr [rip + 0x485099]
1459281c7: f30f59c1  mulss xmm0, xmm1
1459281cb: f30f5c9774040000  subss xmm2, dword ptr [rdi + 0x474]
1459281d3: 0f57c9  xorps xmm1, xmm1
1459281d6: f30f5fd1  maxss xmm2, xmm1
1459281da: f30f58d0  addss xmm2, xmm0
1459281de: f30f1197ec040000  movss dword ptr [rdi + 0x4ec], xmm2
1459281e6: 8b4640  mov eax, dword ptr [rsi + 0x40]
1459281e9: 898770040000  mov dword ptr [rdi + 0x470], eax
1459281ef: f30f118774040000  movss dword ptr [rdi + 0x474], xmm0

; thorns-sum-and-attribution: 0x1458ecb21..0x1458ecc20, exact selected 0.112.0 bytes
1458ecb21: 498b8d98030000  mov rcx, qword ptr [r13 + 0x398]
1458ecb28: 4885c9  test rcx, rcx
1458ecb2b: 488bb590000000  mov rsi, qword ptr [rbp + 0x90]
1458ecb32: 0f84e8000000  je 0x1458ecc20
1458ecb38: 498b8590030000  mov rax, qword ptr [r13 + 0x390]
1458ecb3f: 4883f901  cmp rcx, 1
1458ecb43: 750c  jne 0x1458ecb51
1458ecb45: f30f101593094c00  movss xmm2, dword ptr [rip + 0x4c0993]
1458ecb4d: 31d2  xor edx, edx
1458ecb4f: eb64  jmp 0x1458ecbb5
1458ecb51: 4989c8  mov r8, rcx
1458ecb54: 4983e0fe  and r8, 0xfffffffffffffffe
1458ecb58: f30f101580094c00  movss xmm2, dword ptr [rip + 0x4c0980]
1458ecb60: 31d2  xor edx, edx
1458ecb62: 4989c1  mov r9, rax
1458ecb65: eb16  jmp 0x1458ecb7d
1458ecb67: 660f1f840000000000  nop word ptr [rax + rax]
1458ecb70: 4883c202  add rdx, 2
1458ecb74: 4983c130  add r9, 0x30
1458ecb78: 4939d0  cmp r8, rdx
1458ecb7b: 7433  je 0x1458ecbb0
1458ecb7d: f3410f104110  movss xmm0, dword ptr [r9 + 0x10]
1458ecb83: 410f2ec0  ucomiss xmm0, xmm8
1458ecb87: 760c  jbe 0x1458ecb95
1458ecb89: 4183390d  cmp dword ptr [r9], 0xd
1458ecb8d: 7506  jne 0x1458ecb95
1458ecb8f: f3410f585104  addss xmm2, dword ptr [r9 + 4]
1458ecb95: f3410f104128  movss xmm0, dword ptr [r9 + 0x28]
1458ecb9b: 410f2ec0  ucomiss xmm0, xmm8
1458ecb9f: 76cf  jbe 0x1458ecb70
1458ecba1: 418379180d  cmp dword ptr [r9 + 0x18], 0xd
1458ecba6: 75c8  jne 0x1458ecb70
1458ecba8: f3410f58511c  addss xmm2, dword ptr [r9 + 0x1c]
1458ecbae: ebc0  jmp 0x1458ecb70
1458ecbb0: f6c101  test cl, 1
1458ecbb3: 741e  je 0x1458ecbd3
1458ecbb5: 488d1452  lea rdx, [rdx + rdx*2]
1458ecbb9: f30f1044d010  movss xmm0, dword ptr [rax + rdx*8 + 0x10]
1458ecbbf: 410f2ec0  ucomiss xmm0, xmm8
1458ecbc3: 760e  jbe 0x1458ecbd3
1458ecbc5: 488d14d0  lea rdx, [rax + rdx*8]
1458ecbc9: 833a0d  cmp dword ptr [rdx], 0xd
1458ecbcc: 7505  jne 0x1458ecbd3
1458ecbce: f30f585204  addss xmm2, dword ptr [rdx + 4]
1458ecbd3: 660f57c0  xorpd xmm0, xmm0
1458ecbd7: 0f2ed0  ucomiss xmm2, xmm0
1458ecbda: 7644  jbe 0x1458ecc20
1458ecbdc: 4885f6  test rsi, rsi
1458ecbdf: 0f94c2  sete dl
1458ecbe2: 80f301  xor bl, 1
1458ecbe5: 08d3  or bl, dl
1458ecbe7: 0f85fe010000  jne 0x1458ecdeb
1458ecbed: 48c1e103  shl rcx, 3
1458ecbf1: 488d0c49  lea rcx, [rcx + rcx*2]
1458ecbf5: 31d2  xor edx, edx
1458ecbf7: 660f1f840000000000  nop word ptr [rax + rax]
1458ecc00: 4839d1  cmp rcx, rdx
1458ecc03: 0f84990b0000  je 0x1458ed7a2
1458ecc09: 4c8d4218  lea r8, [rdx + 0x18]
1458ecc0d: 833c100d  cmp dword ptr [rax + rdx], 0xd
1458ecc11: 4c89c2  mov rdx, r8
1458ecc14: 75ea  jne 0x1458ecc00
1458ecc16: 468b4c00f4  mov r9d, dword ptr [rax + r8 - 0xc]
1458ecc1b: e9880b0000  jmp 0x1458ed7a8

; thorns-once: 0x1458ed7a2..0x1458ed7e0, exact selected 0.112.0 bytes
1458ed7a2: 41b9d3010000  mov r9d, 0x1d3
1458ed7a8: f3410f1085c0040000  movss xmm0, dword ptr [r13 + 0x4c0]
1458ed7b1: f30f5805a7fa4b00  addss xmm0, dword ptr [rip + 0x4bfaa7]
1458ed7b9: f30f59d0  mulss xmm2, xmm0
1458ed7bd: f3410f599584040000  mulss xmm2, dword ptr [r13 + 0x484]
1458ed7c6: c644243000  mov byte ptr [rsp + 0x30], 0
1458ed7cb: c644242800  mov byte ptr [rsp + 0x28], 0
1458ed7d0: c644242003  mov byte ptr [rsp + 0x20], 3
1458ed7d5: 4c89e9  mov rcx, r13
1458ed7d8: 4889f2  mov rdx, rsi
1458ed7db: e8b0140500  call 0x14593ec90
