1415ec990: 4881ec98000000 sub rsp, 0x98
1415ec997: 440f29b42480000000 movaps xmmword ptr [rsp + 0x80], xmm14
1415ec9a0: 440f296c2470 movaps xmmword ptr [rsp + 0x70], xmm13
1415ec9a6: 440f29642460 movaps xmmword ptr [rsp + 0x60], xmm12
1415ec9ac: 440f295c2450 movaps xmmword ptr [rsp + 0x50], xmm11
1415ec9b2: 440f29542440 movaps xmmword ptr [rsp + 0x40], xmm10
1415ec9b8: 440f294c2430 movaps xmmword ptr [rsp + 0x30], xmm9
1415ec9be: 440f29442420 movaps xmmword ptr [rsp + 0x20], xmm8
1415ec9c4: 0f297c2410 movaps xmmword ptr [rsp + 0x10], xmm7
1415ec9c9: 0f293424 movaps xmmword ptr [rsp], xmm6
1415ec9cd: 4889c8 mov rax, rcx
1415ec9d0: f30f107a14 movss xmm7, dword ptr [rdx + 0x14]
1415ec9d5: f30f105220 movss xmm2, dword ptr [rdx + 0x20]
1415ec9da: f2440f105218 movsd xmm10, qword ptr [rdx + 0x18]
1415ec9e0: f20f1002 movsd xmm0, qword ptr [rdx]
1415ec9e4: f20f104a04 movsd xmm1, qword ptr [rdx + 4]
1415ec9e9: f20f10620c movsd xmm4, qword ptr [rdx + 0xc]
1415ec9ee: 0f28dc movaps xmm3, xmm4
1415ec9f1: 0fc6dce1 shufps xmm3, xmm4, 0xe1
1415ec9f5: f3440f16e4 movshdup xmm12, xmm4
1415ec9fa: 440f28cf movaps xmm9, xmm7
1415ec9fe: f3450f59cc mulss xmm9, xmm12
1415eca03: f30f59fc mulss xmm7, xmm4
1415eca07: 410f59da mulps xmm3, xmm10
1415eca0b: 440f59d4 mulps xmm10, xmm4
1415eca0f: f3450f16ea movshdup xmm13, xmm10
1415eca14: 450f28f5 movaps xmm14, xmm13
1415eca18: f3440f5cf7 subss xmm14, xmm7
1415eca1d: f30f102d47ba8f04 movss xmm5, dword ptr [rip + 0x48fba47]
1415eca25: 440f28c5 movaps xmm8, xmm5
1415eca29: f3450f5dc6 minss xmm8, xmm14
1415eca2e: f3440f101d39ba8f04 movss xmm11, dword ptr [rip + 0x48fba39]
1415eca37: 410f28f3 movaps xmm6, xmm11
1415eca3b: f3410f5ff6 maxss xmm6, xmm14
1415eca40: f30f59e2 mulss xmm4, xmm2
1415eca44: 450f28f1 movaps xmm14, xmm9
1415eca48: f3440f58f4 addss xmm14, xmm4
1415eca4d: f3410f59d4 mulss xmm2, xmm12
1415eca52: 440f28e2 movaps xmm12, xmm2
1415eca56: f3440f5ce7 subss xmm12, xmm7
1415eca5b: f3450f5dc4 minss xmm8, xmm12
1415eca60: f3410f5ff4 maxss xmm6, xmm12
1415eca65: f30f16fb movshdup xmm7, xmm3
1415eca69: f3440f58cf addss xmm9, xmm7
1415eca6e: f3410f5de9 minss xmm5, xmm9
1415eca73: f3450f5fd9 maxss xmm11, xmm9
1415eca78: f3410f5dee minss xmm5, xmm14
1415eca7d: f3450f5fde maxss xmm11, xmm14
1415eca82: f30f58fb addss xmm7, xmm3
1415eca86: f3450f5cea subss xmm13, xmm10
1415eca8b: f30f5def minss xmm5, xmm7
1415eca8f: f3450f5dc5 minss xmm8, xmm13
1415eca94: f3440f5fdf maxss xmm11, xmm7
1415eca99: f3410f5ff5 maxss xmm6, xmm13
1415eca9e: f30f58dc addss xmm3, xmm4
1415ecaa2: f3410f5cd2 subss xmm2, xmm10
1415ecaa7: f30f5deb minss xmm5, xmm3
1415ecaab: f3440f5dc2 minss xmm8, xmm2
1415ecab0: f3440f5fdb maxss xmm11, xmm3
1415ecab5: 450f14c3 unpcklps xmm8, xmm11
1415ecab9: f30f5ff2 maxss xmm6, xmm2
1415ecabd: f30f105224 movss xmm2, dword ptr [rdx + 0x24]
1415ecac2: 0f14ea unpcklps xmm5, xmm2
1415ecac5: 410f16e8 movlhps xmm5, xmm8
1415ecac9: f30f105228 movss xmm2, dword ptr [rdx + 0x28]
1415ecace: 0f14d6 unpcklps xmm2, xmm6
1415ecad1: 0f58d1 addps xmm2, xmm1
1415ecad4: 0fc6c801 shufps xmm1, xmm0, 1
1415ecad8: 0fc6c184 shufps xmm0, xmm1, 0x84
1415ecadc: 0f58c5 addps xmm0, xmm5
1415ecadf: 0f1101 movups xmmword ptr [rcx], xmm0
1415ecae2: 0f135110 movlps qword ptr [rcx + 0x10], xmm2
1415ecae6: 0f283424 movaps xmm6, xmmword ptr [rsp]
1415ecaea: 0f287c2410 movaps xmm7, xmmword ptr [rsp + 0x10]
1415ecaef: 440f28442420 movaps xmm8, xmmword ptr [rsp + 0x20]
1415ecaf5: 440f284c2430 movaps xmm9, xmmword ptr [rsp + 0x30]
1415ecafb: 440f28542440 movaps xmm10, xmmword ptr [rsp + 0x40]
1415ecb01: 440f285c2450 movaps xmm11, xmmword ptr [rsp + 0x50]
1415ecb07: 440f28642460 movaps xmm12, xmmword ptr [rsp + 0x60]
1415ecb0d: 440f286c2470 movaps xmm13, xmmword ptr [rsp + 0x70]
1415ecb13: 440f28b42480000000 movaps xmm14, xmmword ptr [rsp + 0x80]
1415ecb1c: 4881c498000000 add rsp, 0x98
1415ecb23: c3 ret
