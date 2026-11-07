; rotation-arc 0x144ff9f20..0x144ffa07a
144ff9f20: 4883ec28 sub rsp, 0x28
144ff9f24: 0f297c2410 movaps xmmword ptr [rsp + 0x10], xmm7
144ff9f29: 0f293424 movaps xmmword ptr [rsp], xmm6
144ff9f2d: 4889c8 mov rax, rcx
144ff9f30: f20f1002 movsd xmm0, qword ptr [rdx]
144ff9f34: f20f104a04 movsd xmm1, qword ptr [rdx + 4]
144ff9f39: f2410f1010 movsd xmm2, qword ptr [r8]
144ff9f3e: f2410f105804 movsd xmm3, qword ptr [r8 + 4]
144ff9f44: 0f28e1 movaps xmm4, xmm1
144ff9f47: 0f59e3 mulps xmm4, xmm3
144ff9f4a: 0f28e8 movaps xmm5, xmm0
144ff9f4d: f30f59ea mulss xmm5, xmm2
144ff9f51: f30f58ec addss xmm5, xmm4
144ff9f55: f30f16e4 movshdup xmm4, xmm4
144ff9f59: f30f58e5 addss xmm4, xmm5
144ff9f5d: 0f2e254c291f01 ucomiss xmm4, dword ptr [rip + 0x11f294c]
144ff9f64: 760c jbe 0x144ff9f72
144ff9f66: 0f28054341e800 movaps xmm0, xmmword ptr [rip + 0xe84143]
144ff9f6d: e9f7000000 jmp 0x144ffa069
144ff9f72: f30f102d3a291f01 movss xmm5, dword ptr [rip + 0x11f293a]
144ff9f7a: 0f2eec ucomiss xmm5, xmm4
144ff9f7d: 766e jbe 0x144ff9fed
144ff9f7f: f30f16d1 movshdup xmm2, xmm1
144ff9f83: 0f281d1631dd00 movaps xmm3, xmmword ptr [rip + 0xdd3116]
144ff9f8a: 0f28e2 movaps xmm4, xmm2
144ff9f8d: 0f54e3 andps xmm4, xmm3
144ff9f90: 0f5625f932da00 orps xmm4, xmmword ptr [rip + 0xda32f9]
144ff9f97: 0f28ea movaps xmm5, xmm2
144ff9f9a: f30fc2ea03 cmpunordss xmm5, xmm2
144ff9f9f: f30f1035298edd00 movss xmm6, dword ptr [rip + 0xdd8e29]
144ff9fa7: 0f54f5 andps xmm6, xmm5
144ff9faa: 0f55ec andnps xmm5, xmm4
144ff9fad: 0f56ee orps xmm5, xmm6
144ff9fb0: f30f58d5 addss xmm2, xmm5
144ff9fb4: f30f10250831dd00 movss xmm4, dword ptr [rip + 0xdd3108]
144ff9fbc: f30f5ee2 divss xmm4, xmm2
144ff9fc0: f30f59c1 mulss xmm0, xmm1
144ff9fc4: f30f59c4 mulss xmm0, xmm4
144ff9fc8: 0f28d1 movaps xmm2, xmm1
144ff9fcb: f30f59d1 mulss xmm2, xmm1
144ff9fcf: f30f59d4 mulss xmm2, xmm4
144ff9fd3: f30f58d5 addss xmm2, xmm5
144ff9fd7: 0f14c2 unpcklps xmm0, xmm2
144ff9fda: 0f57cb xorps xmm1, xmm3
144ff9fdd: f30f1015d3281f01 movss xmm2, dword ptr [rip + 0x11f28d3]
144ff9fe5: 0f14ca unpcklps xmm1, xmm2
144ff9fe8: 0f16c1 movlhps xmm0, xmm1
144ff9feb: eb7c jmp 0x144ffa069
144ff9fed: 0f28e9 movaps xmm5, xmm1
144ff9ff0: 0f16e8 movlhps xmm5, xmm0
144ff9ff3: 0fc6c811 shufps xmm1, xmm0, 0x11
144ff9ff7: 0f16e0 movlhps xmm4, xmm0
144ff9ffa: 0fc6cc22 shufps xmm1, xmm4, 0x22
144ff9ffe: f30f10259a32da00 movss xmm4, dword ptr [rip + 0xda329a]
144ffa006: 0f28f4 movaps xmm6, xmm4
144ffa009: 0fc6f2d4 shufps xmm6, xmm2, 0xd4
144ffa00d: 0f28fa movaps xmm7, xmm2
144ffa010: 0fc6fe20 shufps xmm7, xmm6, 0x20
144ffa014: f30f16db movshdup xmm3, xmm3
144ffa018: f30f10fb movss xmm7, xmm3
144ffa01c: 0f59cf mulps xmm1, xmm7
144ffa01f: 0f28dc movaps xmm3, xmm4
144ffa022: 0fc6d8d4 shufps xmm3, xmm0, 0xd4
144ffa026: 0fc6eb29 shufps xmm5, xmm3, 0x29
144ffa02a: 0f16e2 movlhps xmm4, xmm2
144ffa02d: 0fc6fc22 shufps xmm7, xmm4, 0x22
144ffa031: 0f59fd mulps xmm7, xmm5
144ffa034: 0f28c1 movaps xmm0, xmm1
144ffa037: 0f5cc7 subps xmm0, xmm7
144ffa03a: 0f58f9 addps xmm7, xmm1
144ffa03d: 0fc6f823 shufps xmm7, xmm0, 0x23
144ffa041: 0fc6c724 shufps xmm0, xmm7, 0x24
144ffa045: 0f28c8 movaps xmm1, xmm0
144ffa048: 0f59c8 mulps xmm1, xmm0
144ffa04b: 0f28d1 movaps xmm2, xmm1
144ffa04e: 0fc6d10e shufps xmm2, xmm1, 0xe
144ffa052: 0f58d1 addps xmm2, xmm1
144ffa055: 0f28ca movaps xmm1, xmm2
144ffa058: 0fc6ca00 shufps xmm1, xmm2, 0
144ffa05c: 0fc6d255 shufps xmm2, xmm2, 0x55
144ffa060: 0f58d1 addps xmm2, xmm1
144ffa063: 0f51ca sqrtps xmm1, xmm2
144ffa066: 0f5ec1 divps xmm0, xmm1
144ffa069: 0f2900 movaps xmmword ptr [rax], xmm0
144ffa06c: 0f283424 movaps xmm6, xmmword ptr [rsp]
144ffa070: 0f287c2410 movaps xmm7, xmmword ptr [rsp + 0x10]
144ffa075: 4883c428 add rsp, 0x28
144ffa079: c3 ret 
