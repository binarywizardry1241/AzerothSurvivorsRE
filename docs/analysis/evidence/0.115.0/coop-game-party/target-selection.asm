0x1458f75b5: f3410f10859c0b0000       movss xmm0, dword ptr [r13 + 0xb9c]
0x1458f75be: 498bb5f8090000           mov rsi, qword ptr [r13 + 0x9f8]
0x1458f75c5: 498b8d000a0000           mov rcx, qword ptr [r13 + 0xa00]
0x1458f75cc: 48898d80130000           mov qword ptr [rbp + 0x1380], rcx
0x1458f75d3: 48c1e104                 shl rcx, 4
0x1458f75d7: 488d040e                 lea rax, [rsi + rcx]
0x1458f75db: 4889f2                   mov rdx, rsi
0x1458f75de: 6690                     nop
0x1458f75e0: 4885c9                   test rcx, rcx
0x1458f75e3: 0f84a6020000             je 0x1458f788f
0x1458f75e9: 4883c1f0                 add rcx, -0x10
0x1458f75ed: 807a0c01                 cmp byte ptr [rdx + 0xc], 1
0x1458f75f1: 488d5210                 lea rdx, [rdx + 0x10]
0x1458f75f5: 75e9                     jne 0x1458f75e0
0x1458f75f7: 498b8df0090000           mov rcx, qword ptr [r13 + 0x9f0]
0x1458f75fe: 48898d70130000           mov qword ptr [rbp + 0x1370], rcx
0x1458f7605: 49c785f009000000000000   mov qword ptr [r13 + 0x9f0], 0
0x1458f7610: 49c785f809000004000000   mov qword ptr [r13 + 0x9f8], 4
0x1458f761b: 49c785000a000000000000   mov qword ptr [r13 + 0xa00], 0
0x1458f7626: 498b8d80050000           mov rcx, qword ptr [r13 + 0x580]
0x1458f762d: 4885c9                   test rcx, rcx
0x1458f7630: 0f8414020000             je 0x1458f784a
0x1458f7636: 498b9578050000           mov rdx, qword ptr [r13 + 0x578]
0x1458f763d: 4869c9e0010000           imul rcx, rcx, 0x1e0
0x1458f7644: 4801d1                   add rcx, rdx
0x1458f7647: 4c8b8580130000           mov r8, qword ptr [rbp + 0x1380]
0x1458f764e: 49c1e004                 shl r8, 4
0x1458f7652: 4983c0f0                 add r8, -0x10
0x1458f7656: 0f57c9                   xorps xmm1, xmm1
0x1458f7659: f30f10154f885e00         movss xmm2, dword ptr [rip + 0x5e884f]
0x1458f7661: f30f101d5b836100         movss xmm3, dword ptr [rip + 0x61835b]
0x1458f7669: eb0e                     jmp 0x1458f7679
0x1458f766b: 0f1f440000               nop dword ptr [rax + rax]
0x1458f7670: 4839ca                   cmp rdx, rcx
0x1458f7673: 0f84d1010000             je 0x1458f784a
0x1458f7679: 4989d2                   mov r10, rdx
0x1458f767c: 4881c2e0010000           add rdx, 0x1e0
0x1458f7683: 4183bab000000000         cmp dword ptr [r10 + 0xb0], 0
0x1458f768b: 75e3                     jne 0x1458f7670
0x1458f768d: f3410f10a298010000       movss xmm4, dword ptr [r10 + 0x198]
0x1458f7696: 0f2ecc                   ucomiss xmm1, xmm4
0x1458f7699: 7341                     jae 0x1458f76dc
0x1458f769b: 0f28e8                   movaps xmm5, xmm0
0x1458f769e: f3410f5caa94010000       subss xmm5, dword ptr [r10 + 0x194]
0x1458f76a7: f30f5eec                 divss xmm5, xmm4
0x1458f76ab: 0f57e4                   xorps xmm4, xmm4
0x1458f76ae: f30f5fe5                 maxss xmm4, xmm5
0x1458f76b2: 0f28ea                   movaps xmm5, xmm2
0x1458f76b5: f30f5dec                 minss xmm5, xmm4
0x1458f76b9: f2410f10ba7c010000       movsd xmm7, qword ptr [r10 + 0x17c]
0x1458f76c2: f2450f108288010000       movsd xmm8, qword ptr [r10 + 0x188]
0x1458f76cb: 440f5cc7                 subps xmm8, xmm7
0x1458f76cf: f30f12e5                 movsldup xmm4, xmm5
0x1458f76d3: 410f59e0                 mulps xmm4, xmm8
0x1458f76d7: 0f58e7                   addps xmm4, xmm7
0x1458f76da: eb09                     jmp 0x1458f76e5
0x1458f76dc: f2410f10a288010000       movsd xmm4, qword ptr [r10 + 0x188]
0x1458f76e5: 4c8d7e10                 lea r15, [rsi + 0x10]
0x1458f76e9: 4d89c6                   mov r14, r8
0x1458f76ec: 4531e4                   xor r12d, r12d
0x1458f76ef: 4889f3                   mov rbx, rsi
0x1458f76f2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458f7700: 4839c3                   cmp rbx, rax
0x1458f7703: 0f8431010000             je 0x1458f783a
0x1458f7709: 4989dd                   mov r13, rbx
0x1458f770c: 4d89e3                   mov r11, r12
0x1458f770f: 4c89f7                   mov rdi, r14
0x1458f7712: 4d89f9                   mov r9, r15
0x1458f7715: 4883c310                 add rbx, 0x10
0x1458f7719: 49ffc4                   inc r12
0x1458f771c: 4983c6f0                 add r14, -0x10
0x1458f7720: 4983c710                 add r15, 0x10
0x1458f7724: 41807d0c01               cmp byte ptr [r13 + 0xc], 1
0x1458f7729: 75d5                     jne 0x1458f7700
0x1458f772b: f2410f107d00             movsd xmm7, qword ptr [r13]
0x1458f7731: 0f5cfc                   subps xmm7, xmm4
0x1458f7734: 0f59ff                   mulps xmm7, xmm7
0x1458f7737: f30f16ef                 movshdup xmm5, xmm7
0x1458f773b: f30f58ef                 addss xmm5, xmm7
0x1458f773f: 4839c3                   cmp rbx, rax
0x1458f7742: 7478                     je 0x1458f77bc
0x1458f7744: 48c1ef04                 shr rdi, 4
0x1458f7748: 4531ed                   xor r13d, r13d
0x1458f774b: eb16                     jmp 0x1458f7763
0x1458f774d: 0f1f00                   nop dword ptr [rax]
0x1458f7750: 4c0f45db                 cmovne r11, rbx
0x1458f7754: 0f28ef                   movaps xmm5, xmm7
0x1458f7757: 49ffc5                   inc r13
0x1458f775a: 4983c110                 add r9, 0x10
0x1458f775e: 4c39ef                   cmp rdi, r13
0x1458f7761: 7459                     je 0x1458f77bc
0x1458f7763: 4180790c01               cmp byte ptr [r9 + 0xc], 1
0x1458f7768: 75ed                     jne 0x1458f7757
0x1458f776a: 4b8d1c2c                 lea rbx, [r12 + r13]
0x1458f776e: f2450f1001               movsd xmm8, qword ptr [r9]
0x1458f7773: 440f5cc4                 subps xmm8, xmm4
0x1458f7777: 450f59c0                 mulps xmm8, xmm8
0x1458f777b: f3410f16f8               movshdup xmm7, xmm8
0x1458f7780: 410f58f8                 addps xmm7, xmm8
0x1458f7784: 440f28c5                 movaps xmm8, xmm5
0x1458f7788: 440f14c7                 unpcklps xmm8, xmm7
0x1458f778c: 450f28c8                 movaps xmm9, xmm8
0x1458f7790: 66410f72e11f             psrad xmm9, 0x1f
0x1458f7796: 66410f72d101             psrld xmm9, 1
0x1458f779c: 66450fefc8               pxor xmm9, xmm8
0x1458f77a1: 66450f70c155             pshufd xmm8, xmm9, 0x55
0x1458f77a7: 66450f66c8               pcmpgtd xmm9, xmm8
0x1458f77ac: 66450f7ece               movd r14d, xmm9
0x1458f77b1: 41f6c601                 test r14b, 1
0x1458f77b5: 7599                     jne 0x1458f7750
0x1458f77b7: 0f28fd                   movaps xmm7, xmm5
0x1458f77ba: eb94                     jmp 0x1458f7750
0x1458f77bc: 498b9af8000000           mov rbx, qword ptr [r10 + 0xf8]
0x1458f77c3: 483b9d80130000           cmp rbx, qword ptr [rbp + 0x1380]
0x1458f77ca: 7332                     jae 0x1458f77fe
0x1458f77cc: 4989d9                   mov r9, rbx
0x1458f77cf: 49c1e104                 shl r9, 4
0x1458f77d3: 42807c0e0c01             cmp byte ptr [rsi + r9 + 0xc], 1
0x1458f77d9: 7523                     jne 0x1458f77fe
0x1458f77db: 4901f1                   add r9, rsi
0x1458f77de: f2410f1039               movsd xmm7, qword ptr [r9]
0x1458f77e3: 0f5cfc                   subps xmm7, xmm4
0x1458f77e6: 0f59ff                   mulps xmm7, xmm7
0x1458f77e9: f30f16e7                 movshdup xmm4, xmm7
0x1458f77ed: f30f58e7                 addss xmm4, xmm7
0x1458f77f1: f30f59e3                 mulss xmm4, xmm3
0x1458f77f5: f30f59e3                 mulss xmm4, xmm3
0x1458f77f9: 0f2eec                   ucomiss xmm5, xmm4
0x1458f77fc: 733c                     jae 0x1458f783a
0x1458f77fe: 4c39db                   cmp rbx, r11
0x1458f7801: 7437                     je 0x1458f783a
0x1458f7803: 4d899af8000000           mov qword ptr [r10 + 0xf8], r11
0x1458f780a: f3410f10a29c010000       movss xmm4, dword ptr [r10 + 0x19c]
0x1458f7813: 0f28ec                   movaps xmm5, xmm4
0x1458f7816: f30f5de8                 minss xmm5, xmm0
0x1458f781a: 0f28fd                   movaps xmm7, xmm5
0x1458f781d: f30fc2fd03               cmpunordss xmm7, xmm5
0x1458f7822: 440f28c7                 movaps xmm8, xmm7
0x1458f7826: 440f55c5                 andnps xmm8, xmm5
0x1458f782a: 0f54fc                   andps xmm7, xmm4
0x1458f782d: 410f56f8                 orps xmm7, xmm8
0x1458f7831: f3410f11ba9c010000       movss dword ptr [r10 + 0x19c], xmm7
0x1458f783a: 4839ca                   cmp rdx, rcx
0x1458f783d: 4c8bad50130000           mov r13, qword ptr [rbp + 0x1350]
0x1458f7844: 0f852ffeffff             jne 0x1458f7679
0x1458f784a: 498b95f0090000           mov rdx, qword ptr [r13 + 0x9f0]
0x1458f7851: 4885d2                   test rdx, rdx
0x1458f7854: 7416                     je 0x1458f786c
0x1458f7856: 498b8df8090000           mov rcx, qword ptr [r13 + 0x9f8]
0x1458f785d: 48c1e204                 shl rdx, 4
0x1458f7861: 41b804000000             mov r8d, 4
0x1458f7867: e864a970fa               call 0x1400021d0
0x1458f786c: 488b8570130000           mov rax, qword ptr [rbp + 0x1370]
0x1458f7873: 498985f0090000           mov qword ptr [r13 + 0x9f0], rax
0x1458f787a: 4989b5f8090000           mov qword ptr [r13 + 0x9f8], rsi
0x1458f7881: 488b8580130000           mov rax, qword ptr [rbp + 0x1380]
0x1458f7888: 498985000a0000           mov qword ptr [r13 + 0xa00], rax
