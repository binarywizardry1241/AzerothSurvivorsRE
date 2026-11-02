1400f8000: 56 push rsi
1400f8001: 57 push rdi
1400f8002: 4881ecb8000000 sub rsp, 0xb8
1400f8009: 440f29b424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm14
1400f8012: 440f29ac2490000000 movaps xmmword ptr [rsp + 0x90], xmm13
1400f801b: 440f29a42480000000 movaps xmmword ptr [rsp + 0x80], xmm12
1400f8024: 440f295c2470 movaps xmmword ptr [rsp + 0x70], xmm11
1400f802a: 440f29542460 movaps xmmword ptr [rsp + 0x60], xmm10
1400f8030: 440f294c2450 movaps xmmword ptr [rsp + 0x50], xmm9
1400f8036: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
1400f803c: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1400f8041: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1400f8046: 0f28fa movaps xmm7, xmm2
1400f8049: 0f28f1 movaps xmm6, xmm1
1400f804c: 4889ce mov rsi, rcx
1400f804f: f3440f101dbcf5c905 movss xmm11, dword ptr [rip + 0x5c9f5bc]
1400f8058: f3440f59da mulss xmm11, xmm2
1400f805d: e89ea1f0ff call 0x140002200
1400f8062: f30f10054a50cd05 movss xmm0, dword ptr [rip + 0x5cd504a]
1400f806a: 0f2ec7 ucomiss xmm0, xmm7
1400f806d: 0f83e1000000 jae 0x1400f8154
1400f8073: b930000000 mov ecx, 0x30
1400f8078: ba04000000 mov edx, 4
1400f807d: e83ea1f0ff call 0x1400021c0
1400f8082: 4885c0 test rax, rax
1400f8085: 0f84a6010000 je 0x1400f8231
1400f808b: 4889c7 mov rdi, rax
1400f808e: 440f28c6 movaps xmm8, xmm6
1400f8092: f3450f5cc3 subss xmm8, xmm11
1400f8097: 410f28c0 movaps xmm0, xmm8
1400f809b: e8dda8af05 call 0x145bf297d
1400f80a0: 0f28f8 movaps xmm7, xmm0
1400f80a3: 410f28c0 movaps xmm0, xmm8
1400f80a7: e8cba8af05 call 0x145bf2977
1400f80ac: 440f28c0 movaps xmm8, xmm0
1400f80b0: 440f282518a4ca05 movaps xmm12, xmmword ptr [rip + 0x5caa418]
1400f80b8: 450f57c4 xorps xmm8, xmm12
1400f80bc: 0f28c6 movaps xmm0, xmm6
1400f80bf: e8b9a8af05 call 0x145bf297d
1400f80c4: 440f28c8 movaps xmm9, xmm0
1400f80c8: 0f28c6 movaps xmm0, xmm6
1400f80cb: e8a7a8af05 call 0x145bf2977
1400f80d0: 440f28d0 movaps xmm10, xmm0
1400f80d4: 450f28e9 movaps xmm13, xmm9
1400f80d8: 450f57ec xorps xmm13, xmm12
1400f80dc: f3410f58f3 addss xmm6, xmm11
1400f80e1: 440f28f0 movaps xmm14, xmm0
1400f80e5: 450f57f4 xorps xmm14, xmm12
1400f80e9: 0f28c6 movaps xmm0, xmm6
1400f80ec: e88ca8af05 call 0x145bf297d
1400f80f1: 440f28d8 movaps xmm11, xmm0
1400f80f5: 0f28c6 movaps xmm0, xmm6
1400f80f8: e87aa8af05 call 0x145bf2977
1400f80fd: 450f57dc xorps xmm11, xmm12
1400f8101: f3440f1107 movss dword ptr [rdi], xmm8
1400f8106: f30f117f04 movss dword ptr [rdi + 4], xmm7
1400f810b: c7470800000000 mov dword ptr [rdi + 8], 0
1400f8112: f3440f11570c movss dword ptr [rdi + 0xc], xmm10
1400f8118: f3440f116f10 movss dword ptr [rdi + 0x10], xmm13
1400f811e: c7471400000000 mov dword ptr [rdi + 0x14], 0
1400f8125: f3440f117718 movss dword ptr [rdi + 0x18], xmm14
1400f812b: f3440f114f1c movss dword ptr [rdi + 0x1c], xmm9
1400f8131: c7472000000000 mov dword ptr [rdi + 0x20], 0
1400f8138: f30f114724 movss dword ptr [rdi + 0x24], xmm0
1400f813d: f3440f115f28 movss dword ptr [rdi + 0x28], xmm11
1400f8143: c7472c00000000 mov dword ptr [rdi + 0x2c], 0
1400f814a: b802000000 mov eax, 2
1400f814f: e98b000000 jmp 0x1400f81df
1400f8154: b918000000 mov ecx, 0x18
1400f8159: ba04000000 mov edx, 4
1400f815e: e85da0f0ff call 0x1400021c0
1400f8163: 4885c0 test rax, rax
1400f8166: 0f84d6000000 je 0x1400f8242
1400f816c: 4889c7 mov rdi, rax
1400f816f: 0f28fe movaps xmm7, xmm6
1400f8172: f3410f5cfb subss xmm7, xmm11
1400f8177: f3410f58f3 addss xmm6, xmm11
1400f817c: 0f28c7 movaps xmm0, xmm7
1400f817f: e8f9a7af05 call 0x145bf297d
1400f8184: 440f28c0 movaps xmm8, xmm0
1400f8188: 0f28c7 movaps xmm0, xmm7
1400f818b: e8e7a7af05 call 0x145bf2977
1400f8190: 0f28f8 movaps xmm7, xmm0
1400f8193: 440f281535a3ca05 movaps xmm10, xmmword ptr [rip + 0x5caa335]
1400f819b: 410f57fa xorps xmm7, xmm10
1400f819f: 0f28c6 movaps xmm0, xmm6
1400f81a2: e8d6a7af05 call 0x145bf297d
1400f81a7: 440f28c8 movaps xmm9, xmm0
1400f81ab: 0f28c6 movaps xmm0, xmm6
1400f81ae: e8c4a7af05 call 0x145bf2977
1400f81b3: 450f57ca xorps xmm9, xmm10
1400f81b7: f30f113f movss dword ptr [rdi], xmm7
1400f81bb: f3440f114704 movss dword ptr [rdi + 4], xmm8
1400f81c1: c7470800000000 mov dword ptr [rdi + 8], 0
1400f81c8: f30f11470c movss dword ptr [rdi + 0xc], xmm0
1400f81cd: f3440f114f10 movss dword ptr [rdi + 0x10], xmm9
1400f81d3: c7471400000000 mov dword ptr [rdi + 0x14], 0
1400f81da: b801000000 mov eax, 1
1400f81df: 488906 mov qword ptr [rsi], rax
1400f81e2: 48897e08 mov qword ptr [rsi + 8], rdi
1400f81e6: 48894610 mov qword ptr [rsi + 0x10], rax
1400f81ea: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1400f81ef: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1400f81f4: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
1400f81fa: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
1400f8200: 440f28542460 movaps xmm10, xmmword ptr [rsp + 0x60]
1400f8206: 440f285c2470 movaps xmm11, xmmword ptr [rsp + 0x70]
1400f820c: 440f28a42480000000 movaps xmm12, xmmword ptr [rsp + 0x80]
1400f8215: 440f28ac2490000000 movaps xmm13, xmmword ptr [rsp + 0x90]
1400f821e: 440f28b424a0000000 movaps xmm14, xmmword ptr [rsp + 0xa0]
1400f8227: 4881c4b8000000 add rsp, 0xb8
1400f822e: 5f pop rdi
1400f822f: 5e pop rsi
1400f8230: c3 ret
1400f8231: b904000000 mov ecx, 4
1400f8236: ba30000000 mov edx, 0x30
1400f823b: e8a1b2c905 call 0x145d934e1
1400f8240: 0f0b ud2
1400f8242: b904000000 mov ecx, 4
1400f8247: ba18000000 mov edx, 0x18
1400f824c: e890b2c905 call 0x145d934e1
1400f8251: 0f0b ud2
