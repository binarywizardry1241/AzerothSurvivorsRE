145924710: 55                       push rbp
145924711: 4157                     push r15
145924713: 4156                     push r14
145924715: 4155                     push r13
145924717: 4154                     push r12
145924719: 56                       push rsi
14592471a: 57                       push rdi
14592471b: 53                       push rbx
14592471c: 4881ec58010000           sub rsp, 0x158
145924723: 488dac2480000000         lea rbp, [rsp + 0x80]
14592472b: 440f29b5c0000000         movaps xmmword ptr [rbp + 0xc0], xmm14
145924733: 440f29adb0000000         movaps xmmword ptr [rbp + 0xb0], xmm13
14592473b: 440f29a5a0000000         movaps xmmword ptr [rbp + 0xa0], xmm12
145924743: 440f299d90000000         movaps xmmword ptr [rbp + 0x90], xmm11
14592474b: 440f299580000000         movaps xmmword ptr [rbp + 0x80], xmm10
145924753: 440f294d70               movaps xmmword ptr [rbp + 0x70], xmm9
145924758: 440f294560               movaps xmmword ptr [rbp + 0x60], xmm8
14592475d: 0f297d50                 movaps xmmword ptr [rbp + 0x50], xmm7
145924761: 0f297540                 movaps xmmword ptr [rbp + 0x40], xmm6
145924765: 48c74538feffffff         mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
14592476d: 4889ce                   mov rsi, rcx
145924770: f3440f1089340a0000       movss xmm9, dword ptr [rcx + 0xa34]
145924779: f3440f1091340a0000       movss xmm10, dword ptr [rcx + 0xa34]
145924782: 48c745e800000000         mov qword ptr [rbp - 0x18], 0
14592478a: 48c745f008000000         mov qword ptr [rbp - 0x10], 8
145924792: 48c745f800000000         mov qword ptr [rbp - 8], 0
14592479a: 488b9960050000           mov rbx, qword ptr [rcx + 0x560]
1459247a1: 48698168050000d8010000   imul rax, qword ptr [rcx + 0x568], 0x1d8
1459247ac: 4801d8                   add rax, rbx
1459247af: 4531f6                   xor r14d, r14d
1459247b2: 450f57db                 xorps xmm11, xmm11
1459247b6: f3440f1005e18a4700       movss xmm8, dword ptr [rip + 0x478ae1]
1459247bf: 488d7de8                 lea rdi, [rbp - 0x18]
1459247c3: 488945b0                 mov qword ptr [rbp - 0x50], rax
1459247c7: 660f1f840000000000       nop word ptr [rax + rax]
1459247d0: 4881c3d8010000           add rbx, 0x1d8
1459247d7: 488d8b28feffff           lea rcx, [rbx - 0x1d8]
1459247de: 4839c1                   cmp rcx, rax
1459247e1: 0f84f4000000             je 0x1459248db
1459247e7: 83b9b000000000           cmp dword ptr [rcx + 0xb0], 0
1459247ee: 75e0                     jne 0x1459247d0
1459247f0: f30f1043b8               movss xmm0, dword ptr [rbx - 0x48]
1459247f5: 410f2ec3                 ucomiss xmm0, xmm11
1459247f9: 76d5                     jbe 0x1459247d0
1459247fb: f30f104bb4               movss xmm1, dword ptr [rbx - 0x4c]
145924800: 0f28d0                   movaps xmm2, xmm0
145924803: f30f58d1                 addss xmm2, xmm1
145924807: 410f2ed1                 ucomiss xmm2, xmm9
14592480b: 76c3                     jbe 0x1459247d0
14592480d: 48894da8                 mov qword ptr [rbp - 0x58], rcx
145924811: 488b8e98090000           mov rcx, qword ptr [rsi + 0x998]
145924818: 410f28d1                 movaps xmm2, xmm9
14592481c: f30f5cd1                 subss xmm2, xmm1
145924820: f30f5ed0                 divss xmm2, xmm0
145924824: 0f57c0                   xorps xmm0, xmm0
145924827: f30f5fc2                 maxss xmm0, xmm2
14592482b: 450f28e0                 movaps xmm12, xmm8
14592482f: f3440f5de0               minss xmm12, xmm0
145924834: f20f10439c               movsd xmm0, qword ptr [rbx - 0x64]
145924839: f20f104ba8               movsd xmm1, qword ptr [rbx - 0x58]
14592483e: 0f5cc8                   subps xmm1, xmm0
145924841: f3410f12f4               movsldup xmm6, xmm12
145924846: 0f59f1                   mulps xmm6, xmm1
145924849: 0f58f0                   addps xmm6, xmm0
14592484c: f30f16d6                 movshdup xmm2, xmm6
145924850: f3440f106ba4             movss xmm13, dword ptr [rbx - 0x5c]
145924856: f3440f1073b0             movss xmm14, dword ptr [rbx - 0x50]
14592485c: 4883c110                 add rcx, 0x10
145924860: 0f28ce                   movaps xmm1, xmm6
145924863: e82827fbff               call 0x1458d6f90
145924868: 90                       nop
145924869: 0f28f8                   movaps xmm7, xmm0
14592486c: a801                     test al, 1
14592486e: 7513                     jne 0x145924883
145924870: f3450f5cf5               subss xmm14, xmm13
145924875: f3450f59e6               mulss xmm12, xmm14
14592487a: f3450f58e5               addss xmm12, xmm13
14592487f: 410f28fc                 movaps xmm7, xmm12
145924883: 0f13739c                 movlps qword ptr [rbx - 0x64], xmm6
145924887: f30f117ba4               movss dword ptr [rbx - 0x5c], xmm7
14592488c: 0f1373a8                 movlps qword ptr [rbx - 0x58], xmm6
145924890: f30f117bb0               movss dword ptr [rbx - 0x50], xmm7
145924895: 440f1353b4               movlps qword ptr [rbx - 0x4c], xmm10
14592489a: 4c8bbb18ffffff           mov r15, qword ptr [rbx - 0xe8]
1459248a1: 4c8b75f8                 mov r14, qword ptr [rbp - 8]
1459248a5: 4c3b75e8                 cmp r14, qword ptr [rbp - 0x18]
1459248a9: 7509                     jne 0x1459248b4
1459248ab: 4889f9                   mov rcx, rdi
1459248ae: e82d632d00               call 0x145bfabe0
1459248b3: 90                       nop
1459248b4: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
1459248b8: 4b8d0c76                 lea rcx, [r14 + r14*2]
1459248bc: 4c893cc8                 mov qword ptr [rax + rcx*8], r15
1459248c0: 0f1374c808               movlps qword ptr [rax + rcx*8 + 8], xmm6
1459248c5: f30f117cc810             movss dword ptr [rax + rcx*8 + 0x10], xmm7
1459248cb: 49ffc6                   inc r14
1459248ce: 4c8975f8                 mov qword ptr [rbp - 8], r14
1459248d2: 488b45b0                 mov rax, qword ptr [rbp - 0x50]
1459248d6: e9f5feffff               jmp 0x1459247d0
1459248db: 48894da8                 mov qword ptr [rbp - 0x58], rcx
1459248df: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
1459248e3: 48894530                 mov qword ptr [rbp + 0x30], rax
1459248e7: 4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
1459248eb: 4b8d0476                 lea rax, [r14 + r14*2]
1459248ef: 4d8d3cc4                 lea r15, [r12 + rax*8]
1459248f3: 488dbe18060000           lea rdi, [rsi + 0x618]
1459248fa: 488d5db8                 lea rbx, [rbp - 0x48]
1459248fe: 4c8d7510                 lea r14, [rbp + 0x10]
145924902: 4c896528                 mov qword ptr [rbp + 0x28], r12
145924906: eb35                     jmp 0x14592493d
145924908: 0f1f840000000000         nop dword ptr [rax + rax]
145924910: 4983c418                 add r12, 0x18
145924914: 488b8620060000           mov rax, qword ptr [rsi + 0x620]
14592491b: 4c89e9                   mov rcx, r13
14592491e: 48c1e105                 shl rcx, 5
145924922: 0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
145924926: 0f104dc8                 movups xmm1, xmmword ptr [rbp - 0x38]
14592492a: 0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
14592492f: 0f110408                 movups xmmword ptr [rax + rcx], xmm0
145924933: 49ffc5                   inc r13
145924936: 4c89ae28060000           mov qword ptr [rsi + 0x628], r13
14592493d: 4d39fc                   cmp r12, r15
145924940: 744d                     je 0x14592498f
145924942: 498b1424                 mov rdx, qword ptr [r12]
145924946: 418b442410               mov eax, dword ptr [r12 + 0x10]
14592494b: 894518                   mov dword ptr [rbp + 0x18], eax
14592494e: 498b442408               mov rax, qword ptr [r12 + 8]
145924953: 48894510                 mov qword ptr [rbp + 0x10], rax
145924957: 448b8e640a0000           mov r9d, dword ptr [rsi + 0xa64]
14592495e: 41ffc1                   inc r9d
145924961: 44898e640a0000           mov dword ptr [rsi + 0xa64], r9d
145924968: 4889d9                   mov rcx, rbx
14592496b: 4d89f0                   mov r8, r14
14592496e: e8cd21faff               call 0x1458c6b40
145924973: 90                       nop
145924974: 4c8bae28060000           mov r13, qword ptr [rsi + 0x628]
14592497b: 4c3bae18060000           cmp r13, qword ptr [rsi + 0x618]
145924982: 758c                     jne 0x145924910
145924984: 4889f9                   mov rcx, rdi
145924987: e884642d00               call 0x145bfae10
14592498c: 90                       nop
14592498d: eb81                     jmp 0x145924910
14592498f: 488b4530                 mov rax, qword ptr [rbp + 0x30]
145924993: 4885c0                   test rax, rax
145924996: 7417                     je 0x1459249af
145924998: 48c1e003                 shl rax, 3
14592499c: 488d1440                 lea rdx, [rax + rax*2]
1459249a0: 41b808000000             mov r8d, 8
1459249a6: 488b4d28                 mov rcx, qword ptr [rbp + 0x28]
1459249aa: e821d86dfa               call 0x1400021d0
1459249af: f3440f108e340a0000       movss xmm9, dword ptr [rsi + 0xa34]
1459249b8: f3440f1096340a0000       movss xmm10, dword ptr [rsi + 0xa34]
1459249c1: 48c7451000000000         mov qword ptr [rbp + 0x10], 0
1459249c9: 48c7451808000000         mov qword ptr [rbp + 0x18], 8
1459249d1: 48c7452000000000         mov qword ptr [rbp + 0x20], 0
1459249d9: 4c8bbed0000000           mov r15, qword ptr [rsi + 0xd0]
1459249e0: 486b86d800000078         imul rax, qword ptr [rsi + 0xd8], 0x78
1459249e8: 4c01f8                   add rax, r15
1459249eb: 488b9e98090000           mov rbx, qword ptr [rsi + 0x998]
1459249f2: 4883c310                 add rbx, 0x10
1459249f6: 4531e4                   xor r12d, r12d
1459249f9: 450f57db                 xorps xmm11, xmm11
1459249fd: 4c8d7510                 lea r14, [rbp + 0x10]
145924a01: 48894500                 mov qword ptr [rbp], rax
145924a05: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
145924a10: 4983c778                 add r15, 0x78
145924a14: 498d4f88                 lea rcx, [r15 - 0x78]
145924a18: 4839c1                   cmp rcx, rax
145924a1b: 0f84ed000000             je 0x145924b0e
145924a21: f30f10415c               movss xmm0, dword ptr [rcx + 0x5c]
145924a26: 410f2ec3                 ucomiss xmm0, xmm11
145924a2a: 76e4                     jbe 0x145924a10
145924a2c: f3410f104fe0             movss xmm1, dword ptr [r15 - 0x20]
145924a32: 0f28d0                   movaps xmm2, xmm0
145924a35: f30f58d1                 addss xmm2, xmm1
145924a39: 410f2ed1                 ucomiss xmm2, xmm9
145924a3d: 76d1                     jbe 0x145924a10
145924a3f: 48894d08                 mov qword ptr [rbp + 8], rcx
145924a43: 410f28d1                 movaps xmm2, xmm9
145924a47: f30f5cd1                 subss xmm2, xmm1
145924a4b: f30f5ed0                 divss xmm2, xmm0
145924a4f: 0f57c0                   xorps xmm0, xmm0
145924a52: f30f5fc2                 maxss xmm0, xmm2
145924a56: 450f28e0                 movaps xmm12, xmm8
145924a5a: f3440f5de0               minss xmm12, xmm0
145924a5f: f2410f1047c8             movsd xmm0, qword ptr [r15 - 0x38]
145924a65: f2410f104fd4             movsd xmm1, qword ptr [r15 - 0x2c]
145924a6b: 0f5cc8                   subps xmm1, xmm0
145924a6e: f3410f12f4               movsldup xmm6, xmm12
145924a73: 0f59f1                   mulps xmm6, xmm1
145924a76: 0f58f0                   addps xmm6, xmm0
145924a79: f30f16d6                 movshdup xmm2, xmm6
145924a7d: f3450f106fd0             movss xmm13, dword ptr [r15 - 0x30]
145924a83: f3450f1077dc             movss xmm14, dword ptr [r15 - 0x24]
145924a89: 4889d9                   mov rcx, rbx
145924a8c: 0f28ce                   movaps xmm1, xmm6
145924a8f: e8fc24fbff               call 0x1458d6f90
145924a94: 90                       nop
145924a95: 0f28f8                   movaps xmm7, xmm0
145924a98: a801                     test al, 1
145924a9a: 7513                     jne 0x145924aaf
145924a9c: f3450f5cf5               subss xmm14, xmm13
145924aa1: f3450f59e6               mulss xmm12, xmm14
145924aa6: f3450f58e5               addss xmm12, xmm13
145924aab: 410f28fc                 movaps xmm7, xmm12
145924aaf: 410f1377c8               movlps qword ptr [r15 - 0x38], xmm6
145924ab4: f3410f117fd0             movss dword ptr [r15 - 0x30], xmm7
145924aba: 410f1377d4               movlps qword ptr [r15 - 0x2c], xmm6
145924abf: f3410f117fdc             movss dword ptr [r15 - 0x24], xmm7
145924ac5: 450f1357e0               movlps qword ptr [r15 - 0x20], xmm10
145924aca: f3450f114fec             movss dword ptr [r15 - 0x14], xmm9
145924ad0: 4d8b6fa8                 mov r13, qword ptr [r15 - 0x58]
145924ad4: 4c8b6520                 mov r12, qword ptr [rbp + 0x20]
145924ad8: 4c3b6510                 cmp r12, qword ptr [rbp + 0x10]
145924adc: 7509                     jne 0x145924ae7
145924ade: 4c89f1                   mov rcx, r14
145924ae1: e8fa602d00               call 0x145bfabe0
145924ae6: 90                       nop
145924ae7: 488b4518                 mov rax, qword ptr [rbp + 0x18]
145924aeb: 4b8d0c64                 lea rcx, [r12 + r12*2]
145924aef: 4c892cc8                 mov qword ptr [rax + rcx*8], r13
145924af3: 0f1374c808               movlps qword ptr [rax + rcx*8 + 8], xmm6
145924af8: f30f117cc810             movss dword ptr [rax + rcx*8 + 0x10], xmm7
145924afe: 49ffc4                   inc r12
145924b01: 4c896520                 mov qword ptr [rbp + 0x20], r12
145924b05: 488b4500                 mov rax, qword ptr [rbp]
145924b09: e902ffffff               jmp 0x145924a10
145924b0e: 488b4510                 mov rax, qword ptr [rbp + 0x10]
145924b12: 48894530                 mov qword ptr [rbp + 0x30], rax
145924b16: 488b5518                 mov rdx, qword ptr [rbp + 0x18]
145924b1a: 4b8d0464                 lea rax, [r12 + r12*2]
145924b1e: 4c8d3cc2                 lea r15, [rdx + rax*8]
145924b22: 488d5db8                 lea rbx, [rbp - 0x48]
145924b26: 4c8d75d8                 lea r14, [rbp - 0x28]
145924b2a: 48895528                 mov qword ptr [rbp + 0x28], rdx
145924b2e: 4989d4                   mov r12, rdx
145924b31: 48894d08                 mov qword ptr [rbp + 8], rcx
145924b35: eb36                     jmp 0x145924b6d
145924b37: 660f1f840000000000       nop word ptr [rax + rax]
145924b40: 4983c418                 add r12, 0x18
145924b44: 488b8620060000           mov rax, qword ptr [rsi + 0x620]
145924b4b: 4c89e9                   mov rcx, r13
145924b4e: 48c1e105                 shl rcx, 5
145924b52: 0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
145924b56: 0f104dc8                 movups xmm1, xmmword ptr [rbp - 0x38]
145924b5a: 0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
145924b5f: 0f110408                 movups xmmword ptr [rax + rcx], xmm0
145924b63: 49ffc5                   inc r13
145924b66: 4c89ae28060000           mov qword ptr [rsi + 0x628], r13
145924b6d: 4d39fc                   cmp r12, r15
145924b70: 744d                     je 0x145924bbf
145924b72: 498b1424                 mov rdx, qword ptr [r12]
145924b76: 418b442410               mov eax, dword ptr [r12 + 0x10]
145924b7b: 8945e0                   mov dword ptr [rbp - 0x20], eax
145924b7e: 498b442408               mov rax, qword ptr [r12 + 8]
145924b83: 488945d8                 mov qword ptr [rbp - 0x28], rax
145924b87: 448b8e640a0000           mov r9d, dword ptr [rsi + 0xa64]
145924b8e: 41ffc1                   inc r9d
145924b91: 44898e640a0000           mov dword ptr [rsi + 0xa64], r9d
145924b98: 4889d9                   mov rcx, rbx
145924b9b: 4d89f0                   mov r8, r14
145924b9e: e89d1ffaff               call 0x1458c6b40
145924ba3: 90                       nop
145924ba4: 4c8bae28060000           mov r13, qword ptr [rsi + 0x628]
145924bab: 4c3bae18060000           cmp r13, qword ptr [rsi + 0x618]
145924bb2: 758c                     jne 0x145924b40
145924bb4: 4889f9                   mov rcx, rdi
145924bb7: e854622d00               call 0x145bfae10
145924bbc: 90                       nop
145924bbd: eb81                     jmp 0x145924b40
145924bbf: 488b4530                 mov rax, qword ptr [rbp + 0x30]
145924bc3: 4885c0                   test rax, rax
145924bc6: 7417                     je 0x145924bdf
145924bc8: 48c1e003                 shl rax, 3
145924bcc: 488d1440                 lea rdx, [rax + rax*2]
145924bd0: 41b808000000             mov r8d, 8
145924bd6: 488b4d28                 mov rcx, qword ptr [rbp + 0x28]
145924bda: e8f1d56dfa               call 0x1400021d0
145924bdf: f3440f108e340a0000       movss xmm9, dword ptr [rsi + 0xa34]
145924be8: f3440f1096340a0000       movss xmm10, dword ptr [rsi + 0xa34]
145924bf1: 48c7451000000000         mov qword ptr [rbp + 0x10], 0
145924bf9: 48c7451808000000         mov qword ptr [rbp + 0x18], 8
145924c01: 48c7452000000000         mov qword ptr [rbp + 0x20], 0
145924c09: 4c8bbe40090000           mov r15, qword ptr [rsi + 0x940]
145924c10: 488b9e98090000           mov rbx, qword ptr [rsi + 0x998]
145924c17: 486b864809000070         imul rax, qword ptr [rsi + 0x948], 0x70
145924c1f: 4c01f8                   add rax, r15
145924c22: 4883c310                 add rbx, 0x10
145924c26: 4531e4                   xor r12d, r12d
145924c29: 450f57db                 xorps xmm11, xmm11
145924c2d: 4c8d7510                 lea r14, [rbp + 0x10]
145924c31: 48894500                 mov qword ptr [rbp], rax
145924c35: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
145924c40: 4c89f9                   mov rcx, r15
145924c43: 4939c7                   cmp r15, rax
145924c46: 0f84fc000000             je 0x145924d48
145924c4c: 4c8d7970                 lea r15, [rcx + 0x70]
145924c50: f30f104958               movss xmm1, dword ptr [rcx + 0x58]
145924c55: f30f10415c               movss xmm0, dword ptr [rcx + 0x5c]
145924c5a: 0f28d1                   movaps xmm2, xmm1
145924c5d: f30f58d0                 addss xmm2, xmm0
145924c61: 440f2eca                 ucomiss xmm9, xmm2
145924c65: 73d9                     jae 0x145924c40
145924c67: 440f2ed8                 ucomiss xmm11, xmm0
145924c6b: 48894d28                 mov qword ptr [rbp + 0x28], rcx
145924c6f: 7351                     jae 0x145924cc2
145924c71: 410f28d1                 movaps xmm2, xmm9
145924c75: f30f5cd1                 subss xmm2, xmm1
145924c79: f30f5ed0                 divss xmm2, xmm0
145924c7d: 0f57c0                   xorps xmm0, xmm0
145924c80: f30f5fc2                 maxss xmm0, xmm2
145924c84: 410f28c8                 movaps xmm1, xmm8
145924c88: f30f5dc8                 minss xmm1, xmm0
145924c8c: f2410f1047d0             movsd xmm0, qword ptr [r15 - 0x30]
145924c92: f2410f1057dc             movsd xmm2, qword ptr [r15 - 0x24]
145924c98: 0f5cd0                   subps xmm2, xmm0
145924c9b: f30f12f1                 movsldup xmm6, xmm1
145924c9f: 0f59f2                   mulps xmm6, xmm2
145924ca2: 0f58f0                   addps xmm6, xmm0
145924ca5: f3410f1047d8             movss xmm0, dword ptr [r15 - 0x28]
145924cab: f3450f1067e4             movss xmm12, dword ptr [r15 - 0x1c]
145924cb1: f3440f5ce0               subss xmm12, xmm0
145924cb6: f3440f59e1               mulss xmm12, xmm1
145924cbb: f3440f58e0               addss xmm12, xmm0
145924cc0: eb0c                     jmp 0x145924cce
145924cc2: f2410f1077dc             movsd xmm6, qword ptr [r15 - 0x24]
145924cc8: f3450f1067e4             movss xmm12, dword ptr [r15 - 0x1c]
145924cce: f30f16d6                 movshdup xmm2, xmm6
145924cd2: 4889d9                   mov rcx, rbx
145924cd5: 0f28ce                   movaps xmm1, xmm6
145924cd8: e8b322fbff               call 0x1458d6f90
145924cdd: 90                       nop
145924cde: 0f28f8                   movaps xmm7, xmm0
145924ce1: a801                     test al, 1
145924ce3: 7504                     jne 0x145924ce9
145924ce5: 410f28fc                 movaps xmm7, xmm12
145924ce9: 410f1377d0               movlps qword ptr [r15 - 0x30], xmm6
145924cee: f3410f117fd8             movss dword ptr [r15 - 0x28], xmm7
145924cf4: 410f1377dc               movlps qword ptr [r15 - 0x24], xmm6
145924cf9: f3410f117fe4             movss dword ptr [r15 - 0x1c], xmm7
145924cff: 450f1357e8               movlps qword ptr [r15 - 0x18], xmm10
145924d04: f3450f114ff0             movss dword ptr [r15 - 0x10], xmm9
145924d0a: 4d8b6fc8                 mov r13, qword ptr [r15 - 0x38]
145924d0e: 4c8b6520                 mov r12, qword ptr [rbp + 0x20]
145924d12: 4c3b6510                 cmp r12, qword ptr [rbp + 0x10]
145924d16: 7509                     jne 0x145924d21
145924d18: 4c89f1                   mov rcx, r14
145924d1b: e8c05e2d00               call 0x145bfabe0
145924d20: 90                       nop
145924d21: 488b4518                 mov rax, qword ptr [rbp + 0x18]
145924d25: 4b8d0c64                 lea rcx, [r12 + r12*2]
145924d29: 4c892cc8                 mov qword ptr [rax + rcx*8], r13
145924d2d: 0f1374c808               movlps qword ptr [rax + rcx*8 + 8], xmm6
145924d32: f30f117cc810             movss dword ptr [rax + rcx*8 + 0x10], xmm7
145924d38: 49ffc4                   inc r12
145924d3b: 4c896520                 mov qword ptr [rbp + 0x20], r12
145924d3f: 488b4500                 mov rax, qword ptr [rbp]
145924d43: e9f8feffff               jmp 0x145924c40
145924d48: 488b4510                 mov rax, qword ptr [rbp + 0x10]
145924d4c: 48894530                 mov qword ptr [rbp + 0x30], rax
145924d50: 488b5518                 mov rdx, qword ptr [rbp + 0x18]
145924d54: 4b8d0464                 lea rax, [r12 + r12*2]
145924d58: 4c8d3cc2                 lea r15, [rdx + rax*8]
145924d5c: 488d5db8                 lea rbx, [rbp - 0x48]
145924d60: 4c8d75d8                 lea r14, [rbp - 0x28]
145924d64: 48895508                 mov qword ptr [rbp + 8], rdx
145924d68: 4989d4                   mov r12, rdx
145924d6b: 48894d28                 mov qword ptr [rbp + 0x28], rcx
145924d6f: eb3c                     jmp 0x145924dad
145924d71: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145924d80: 4983c418                 add r12, 0x18
145924d84: 488b8620060000           mov rax, qword ptr [rsi + 0x620]
145924d8b: 4c89e9                   mov rcx, r13
145924d8e: 48c1e105                 shl rcx, 5
145924d92: 0f1045b8                 movups xmm0, xmmword ptr [rbp - 0x48]
145924d96: 0f104dc8                 movups xmm1, xmmword ptr [rbp - 0x38]
145924d9a: 0f114c0810               movups xmmword ptr [rax + rcx + 0x10], xmm1
145924d9f: 0f110408                 movups xmmword ptr [rax + rcx], xmm0
145924da3: 49ffc5                   inc r13
145924da6: 4c89ae28060000           mov qword ptr [rsi + 0x628], r13
145924dad: 4d39fc                   cmp r12, r15
145924db0: 744d                     je 0x145924dff
145924db2: 498b1424                 mov rdx, qword ptr [r12]
145924db6: 418b442410               mov eax, dword ptr [r12 + 0x10]
145924dbb: 8945e0                   mov dword ptr [rbp - 0x20], eax
145924dbe: 498b442408               mov rax, qword ptr [r12 + 8]
145924dc3: 488945d8                 mov qword ptr [rbp - 0x28], rax
145924dc7: 448b8e640a0000           mov r9d, dword ptr [rsi + 0xa64]
145924dce: 41ffc1                   inc r9d
145924dd1: 44898e640a0000           mov dword ptr [rsi + 0xa64], r9d
145924dd8: 4889d9                   mov rcx, rbx
145924ddb: 4d89f0                   mov r8, r14
145924dde: e85d1dfaff               call 0x1458c6b40
145924de3: 90                       nop
145924de4: 4c8bae28060000           mov r13, qword ptr [rsi + 0x628]
145924deb: 4c3bae18060000           cmp r13, qword ptr [rsi + 0x618]
145924df2: 758c                     jne 0x145924d80
145924df4: 4889f9                   mov rcx, rdi
145924df7: e814602d00               call 0x145bfae10
145924dfc: 90                       nop
145924dfd: eb81                     jmp 0x145924d80
145924dff: 488b4530                 mov rax, qword ptr [rbp + 0x30]
145924e03: 4885c0                   test rax, rax
145924e06: 7417                     je 0x145924e1f
145924e08: 48c1e003                 shl rax, 3
145924e0c: 488d1440                 lea rdx, [rax + rax*2]
145924e10: 41b808000000             mov r8d, 8
145924e16: 488b4d08                 mov rcx, qword ptr [rbp + 8]
145924e1a: e8b1d36dfa               call 0x1400021d0
145924e1f: 0f287540                 movaps xmm6, xmmword ptr [rbp + 0x40]
145924e23: 0f287d50                 movaps xmm7, xmmword ptr [rbp + 0x50]
145924e27: 440f284560               movaps xmm8, xmmword ptr [rbp + 0x60]
145924e2c: 440f284d70               movaps xmm9, xmmword ptr [rbp + 0x70]
145924e31: 440f289580000000         movaps xmm10, xmmword ptr [rbp + 0x80]
145924e39: 440f289d90000000         movaps xmm11, xmmword ptr [rbp + 0x90]
145924e41: 440f28a5a0000000         movaps xmm12, xmmword ptr [rbp + 0xa0]
145924e49: 440f28adb0000000         movaps xmm13, xmmword ptr [rbp + 0xb0]
145924e51: 440f28b5c0000000         movaps xmm14, xmmword ptr [rbp + 0xc0]
145924e59: 4881c458010000           add rsp, 0x158
145924e60: 5b                       pop rbx
145924e61: 5f                       pop rdi
145924e62: 5e                       pop rsi
145924e63: 415c                     pop r12
145924e65: 415d                     pop r13
145924e67: 415e                     pop r14
145924e69: 415f                     pop r15
145924e6b: 5d                       pop rbp
145924e6c: c3                       ret
