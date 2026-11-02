0000000145bf22a0 4157                           push r15
0000000145bf22a2 4156                           push r14
0000000145bf22a4 4155                           push r13
0000000145bf22a6 4154                           push r12
0000000145bf22a8 56                             push rsi
0000000145bf22a9 57                             push rdi
0000000145bf22aa 55                             push rbp
0000000145bf22ab 53                             push rbx
0000000145bf22ac 4881ecc8000000                 sub rsp, 0xc8
0000000145bf22b3 440f29b424b0000000             movaps xmmword ptr [rsp + 0xb0], xmm14
0000000145bf22bc 440f29ac24a0000000             movaps xmmword ptr [rsp + 0xa0], xmm13
0000000145bf22c5 440f29a42490000000             movaps xmmword ptr [rsp + 0x90], xmm12
0000000145bf22ce 440f299c2480000000             movaps xmmword ptr [rsp + 0x80], xmm11
0000000145bf22d7 440f29542470                   movaps xmmword ptr [rsp + 0x70], xmm10
0000000145bf22dd 440f294c2460                   movaps xmmword ptr [rsp + 0x60], xmm9
0000000145bf22e3 440f29442450                   movaps xmmword ptr [rsp + 0x50], xmm8
0000000145bf22e9 0f297c2440                     movaps xmmword ptr [rsp + 0x40], xmm7
0000000145bf22ee 0f29742430                     movaps xmmword ptr [rsp + 0x30], xmm6
0000000145bf22f3 0f28f3                         movaps xmm6, xmm3
0000000145bf22f6 4c89c3                         mov rbx, r8
0000000145bf22f9 4989d6                         mov r14, rdx
0000000145bf22fc 4889ce                         mov rsi, rcx
0000000145bf22ff 4c8bbab80b0000                 mov r15, qword ptr [rdx + 0xbb8]
0000000145bf2306 498d7f10                       lea rdi, [r15 + 0x10]
0000000145bf230a f2440f108220050000             movsd xmm8, qword ptr [rdx + 0x520]
0000000145bf2313 f3450f16c8                     movshdup xmm9, xmm8
0000000145bf2318 4889f9                         mov rcx, rdi
0000000145bf231b 410f28c8                       movaps xmm1, xmm8
0000000145bf231f 410f28d1                       movaps xmm2, xmm9
0000000145bf2323 e838e8f9ff                     call 0x145b90b60
0000000145bf2328 f3450f109e28050000             movss xmm11, dword ptr [r14 + 0x528]
0000000145bf2331 a801                           test al, 1
0000000145bf2333 7504                           jne 0x145bf2339
0000000145bf2335 410f28c3                       movaps xmm0, xmm11
0000000145bf2339 f2440f1106                     movsd qword ptr [rsi], xmm8
0000000145bf233e f30f114608                     movss dword ptr [rsi + 8], xmm0
0000000145bf2343 493b9ec0050000                 cmp rbx, qword ptr [r14 + 0x5c0]
0000000145bf234a 0f8312060000                   jae 0x145bf2962
0000000145bf2350 498b86b8050000                 mov rax, qword ptr [r14 + 0x5b8]
0000000145bf2357 4869cbe0010000                 imul rcx, rbx, 0x1e0
0000000145bf235e 48837c0818ff                   cmp qword ptr [rax + rcx + 0x18], -1
0000000145bf2364 0f84f8050000                   je 0x145bf2962
0000000145bf236a 4d8d6f40                       lea r13, [r15 + 0x40]
0000000145bf236e 49837f40ff                     cmp qword ptr [r15 + 0x40], -1
0000000145bf2373 0f8495000000                   je 0x145bf240e
0000000145bf2379 418baee80c0000                 mov ebp, dword ptr [r14 + 0xce8]
0000000145bf2380 89e8                           mov eax, ebp
0000000145bf2382 c0e004                         shl al, 4
0000000145bf2385 c0f807                         sar al, 7
0000000145bf2388 0fbae502                       bt ebp, 2
0000000145bf238c 1400                           adc al, 0
0000000145bf238e 450f57d2                       xorps xmm10, xmm10
0000000145bf2392 440f28e0                       movaps xmm12, xmm0
0000000145bf2396 f7c500100000                   test ebp, 0x1000
0000000145bf239c 0f853d010000                   jne 0x145bf24df
0000000145bf23a2 89e9                           mov ecx, ebp
0000000145bf23a4 80e101                         and cl, 1
0000000145bf23a7 4189ef                         mov r15d, ebp
0000000145bf23aa 41c0e706                       shl r15b, 6
0000000145bf23ae 41c0ff07                       sar r15b, 7
0000000145bf23b2 4100cf                         add r15b, cl
0000000145bf23b5 4489f9                         mov ecx, r15d
0000000145bf23b8 08c1                           or cl, al
0000000145bf23ba 0f841f010000                   je 0x145bf24df
0000000145bf23c0 0fbed8                         movsx ebx, al
0000000145bf23c3 0f57c0                         xorps xmm0, xmm0
0000000145bf23c6 f30f2ac3                       cvtsi2ss xmm0, ebx
0000000145bf23ca 410fbec7                       movsx eax, r15b
0000000145bf23ce 0f57c9                         xorps xmm1, xmm1
0000000145bf23d1 f30f2ac8                       cvtsi2ss xmm1, eax
0000000145bf23d5 f3410f10be2c050000             movss xmm7, dword ptr [r14 + 0x52c]
0000000145bf23de e88c983f00                     call 0x145febc6f
0000000145bf23e3 f3410f108ea4050000             movss xmm1, dword ptr [r14 + 0x5a4]
0000000145bf23ec f30f5f0dac5d5a00               maxss xmm1, dword ptr [rip + 0x5a5dac]
0000000145bf23f4 84db                           test bl, bl
0000000145bf23f6 0f849a000000                   je 0x145bf2496
0000000145bf23fc 440f28e9                       movaps xmm13, xmm1
0000000145bf2400 4584ff                         test r15b, r15b
0000000145bf2403 0f899b000000                   jns 0x145bf24a4
0000000145bf2409 e99a000000                     jmp 0x145bf24a8
0000000145bf240e 418baee80c0000                 mov ebp, dword ptr [r14 + 0xce8]
0000000145bf2415 89e8                           mov eax, ebp
0000000145bf2417 c0e004                         shl al, 4
0000000145bf241a c0f807                         sar al, 7
0000000145bf241d 0fbae502                       bt ebp, 2
0000000145bf2421 1400                           adc al, 0
0000000145bf2423 450f57c9                       xorps xmm9, xmm9
0000000145bf2427 f7c500100000                   test ebp, 0x1000
0000000145bf242d 0f85c0010000                   jne 0x145bf25f3
0000000145bf2433 89e9                           mov ecx, ebp
0000000145bf2435 80e101                         and cl, 1
0000000145bf2438 4189ef                         mov r15d, ebp
0000000145bf243b 41c0e706                       shl r15b, 6
0000000145bf243f 41c0ff07                       sar r15b, 7
0000000145bf2443 4100cf                         add r15b, cl
0000000145bf2446 4489f9                         mov ecx, r15d
0000000145bf2449 08c1                           or cl, al
0000000145bf244b 0f84a2010000                   je 0x145bf25f3
0000000145bf2451 0fbed8                         movsx ebx, al
0000000145bf2454 0f57c0                         xorps xmm0, xmm0
0000000145bf2457 f30f2ac3                       cvtsi2ss xmm0, ebx
0000000145bf245b 410fbec7                       movsx eax, r15b
0000000145bf245f 0f57c9                         xorps xmm1, xmm1
0000000145bf2462 f30f2ac8                       cvtsi2ss xmm1, eax
0000000145bf2466 f3410f10be2c050000             movss xmm7, dword ptr [r14 + 0x52c]
0000000145bf246f e8fb973f00                     call 0x145febc6f
0000000145bf2474 f3410f108ea4050000             movss xmm1, dword ptr [r14 + 0x5a4]
0000000145bf247d f30f5f0d1b5d5a00               maxss xmm1, dword ptr [rip + 0x5a5d1b]
0000000145bf2485 84db                           test bl, bl
0000000145bf2487 0f841d010000                   je 0x145bf25aa
0000000145bf248d 440f28d1                       movaps xmm10, xmm1
0000000145bf2491 e91d010000                     jmp 0x145bf25b3
0000000145bf2496 f3440f102d19456100             movss xmm13, dword ptr [rip + 0x614519]
0000000145bf249f 4584ff                         test r15b, r15b
0000000145bf24a2 7804                           js 0x145bf24a8
0000000145bf24a4 440f28e9                       movaps xmm13, xmm1
0000000145bf24a8 f30f58f8                       addss xmm7, xmm0
0000000145bf24ac f7c500010000                   test ebp, 0x100
0000000145bf24b2 7409                           je 0x145bf24bd
0000000145bf24b4 f3440f102d53975b00             movss xmm13, dword ptr [rip + 0x5b9753]
0000000145bf24bd 0f28c7                         movaps xmm0, xmm7
0000000145bf24c0 e8a4973f00                     call 0x145febc69
0000000145bf24c5 440f28d0                       movaps xmm10, xmm0
0000000145bf24c9 f3450f59d5                     mulss xmm10, xmm13
0000000145bf24ce 0f28c7                         movaps xmm0, xmm7
0000000145bf24d1 e881973f00                     call 0x145febc57
0000000145bf24d6 f3410f59c5                     mulss xmm0, xmm13
0000000145bf24db 440f14d0                       unpcklps xmm10, xmm0
0000000145bf24df f3410f1086740c0000             movss xmm0, dword ptr [r14 + 0xc74]
0000000145bf24e8 f3410f5c86ec0c0000             subss xmm0, dword ptr [r14 + 0xcec]
0000000145bf24f1 450f57ed                       xorps xmm13, xmm13
0000000145bf24f5 f3410f58c5                     addss xmm0, xmm13
0000000145bf24fa 0f57c9                         xorps xmm1, xmm1
0000000145bf24fd f30f5fc8                       maxss xmm1, xmm0
0000000145bf2501 f3440f1035965c5a00             movss xmm14, dword ptr [rip + 0x5a5c96]
0000000145bf250a 410f28c6                       movaps xmm0, xmm14
0000000145bf250e f30f5dc1                       minss xmm0, xmm1
0000000145bf2512 f30f12f8                       movsldup xmm7, xmm0
0000000145bf2516 410f59fa                       mulps xmm7, xmm10
0000000145bf251a 410f58f8                       addps xmm7, xmm8
0000000145bf251e 66440f7ec2                     movd edx, xmm8
0000000145bf2523 66440f7ec8                     movd eax, xmm9
0000000145bf2528 48c1e020                       shl rax, 0x20
0000000145bf252c 4809c2                         or rdx, rax
0000000145bf252f 66410f7ef8                     movd r8d, xmm7
0000000145bf2534 f30f16c7                       movshdup xmm0, xmm7
0000000145bf2538 660f7ec0                       movd eax, xmm0
0000000145bf253c 48c1e020                       shl rax, 0x20
0000000145bf2540 4909c0                         or r8, rax
0000000145bf2543 4c89e9                         mov rcx, r13
0000000145bf2546 e8958af9ff                     call 0x145b8afe0
0000000145bf254b 410f2ec6                       ucomiss xmm0, xmm14
0000000145bf254f 0f83d3000000                   jae 0x145bf2628
0000000145bf2555 410f28c8                       movaps xmm1, xmm8
0000000145bf2559 0f5ccf                         subps xmm1, xmm7
0000000145bf255c 0f59c9                         mulps xmm1, xmm1
0000000145bf255f f30f16d1                       movshdup xmm2, xmm1
0000000145bf2563 f30f58d1                       addss xmm2, xmm1
0000000145bf2567 0f57c9                         xorps xmm1, xmm1
0000000145bf256a f30f51ca                       sqrtss xmm1, xmm2
0000000145bf256e f30f10158e5c5a00               movss xmm2, dword ptr [rip + 0x5a5c8e]
0000000145bf2576 f30f5fca                       maxss xmm1, xmm2
0000000145bf257a f30f5ed1                       divss xmm2, xmm1
0000000145bf257e f30f5cc2                       subss xmm0, xmm2
0000000145bf2582 f3410f5fc5                     maxss xmm0, xmm13
0000000145bf2587 410f5cf8                       subps xmm7, xmm8
0000000145bf258b f30f12c8                       movsldup xmm1, xmm0
0000000145bf258f 0f59cf                         mulps xmm1, xmm7
0000000145bf2592 410f58c8                       addps xmm1, xmm8
0000000145bf2596 f3450f5cdc                     subss xmm11, xmm12
0000000145bf259b f3440f59d8                     mulss xmm11, xmm0
0000000145bf25a0 f3450f58dc                     addss xmm11, xmm12
0000000145bf25a5 0f28f9                         movaps xmm7, xmm1
0000000145bf25a8 eb7e                           jmp 0x145bf2628
0000000145bf25aa f3440f101505446100             movss xmm10, dword ptr [rip + 0x614405]
0000000145bf25b3 4584ff                         test r15b, r15b
0000000145bf25b6 7804                           js 0x145bf25bc
0000000145bf25b8 440f28d1                       movaps xmm10, xmm1
0000000145bf25bc f30f58f8                       addss xmm7, xmm0
0000000145bf25c0 f7c500010000                   test ebp, 0x100
0000000145bf25c6 7409                           je 0x145bf25d1
0000000145bf25c8 f3440f10153f965b00             movss xmm10, dword ptr [rip + 0x5b963f]
0000000145bf25d1 0f28c7                         movaps xmm0, xmm7
0000000145bf25d4 e890963f00                     call 0x145febc69
0000000145bf25d9 440f28c8                       movaps xmm9, xmm0
0000000145bf25dd f3450f59ca                     mulss xmm9, xmm10
0000000145bf25e2 0f28c7                         movaps xmm0, xmm7
0000000145bf25e5 e86d963f00                     call 0x145febc57
0000000145bf25ea f3410f59c2                     mulss xmm0, xmm10
0000000145bf25ef 440f14c8                       unpcklps xmm9, xmm0
0000000145bf25f3 f3410f1086740c0000             movss xmm0, dword ptr [r14 + 0xc74]
0000000145bf25fc f3410f5c86ec0c0000             subss xmm0, dword ptr [r14 + 0xcec]
0000000145bf2605 0f57c9                         xorps xmm1, xmm1
0000000145bf2608 f30f58c1                       addss xmm0, xmm1
0000000145bf260c f30f5fc8                       maxss xmm1, xmm0
0000000145bf2610 f30f1005885b5a00               movss xmm0, dword ptr [rip + 0x5a5b88]
0000000145bf2618 f30f5dc1                       minss xmm0, xmm1
0000000145bf261c f30f12f8                       movsldup xmm7, xmm0
0000000145bf2620 410f59f9                       mulps xmm7, xmm9
0000000145bf2624 410f58f8                       addps xmm7, xmm8
0000000145bf2628 4d8ba6d0020000                 mov r12, qword ptr [r14 + 0x2d0]
0000000145bf262f 498b96d8020000                 mov rdx, qword ptr [r14 + 0x2d8]
0000000145bf2636 4c89e1                         mov rcx, r12
0000000145bf2639 4889542428                     mov qword ptr [rsp + 0x28], rdx
0000000145bf263e e84d9beaff                     call 0x145a9c190
0000000145bf2643 4869d8f0000000                 imul rbx, rax, 0xf0
0000000145bf264a 4c8d3dffbb3c01                 lea r15, [rip + 0x13cbbff]
0000000145bf2651 f2460f108c3bc8000000           movsd xmm9, qword ptr [rbx + r15 + 0xc8]
0000000145bf265b 440f28c7                       movaps xmm8, xmm7
0000000145bf265f 450f5cc1                       subps xmm8, xmm9
0000000145bf2663 f3410f16c8                     movshdup xmm1, xmm8
0000000145bf2668 410f28c0                       movaps xmm0, xmm8
0000000145bf266c e8da953f00                     call 0x145febc4b
0000000145bf2671 f3440f102516635a00             movss xmm12, dword ptr [rip + 0x5a6316]
0000000145bf267a 440f2ee0                       ucomiss xmm12, xmm0
0000000145bf267e 772f                           ja 0x145bf26af
0000000145bf2680 f3420f108c3bd8000000           movss xmm1, dword ptr [rbx + r15 + 0xd8]
0000000145bf268a f30f580d5e899e00               addss xmm1, dword ptr [rip + 0x9e895e]
0000000145bf2692 0f2ec8                         ucomiss xmm1, xmm0
0000000145bf2695 7318                           jae 0x145bf26af
0000000145bf2697 f30f12c0                       movsldup xmm0, xmm0
0000000145bf269b 440f5ec0                       divps xmm8, xmm0
0000000145bf269f f30f12c1                       movsldup xmm0, xmm1
0000000145bf26a3 410f59c0                       mulps xmm0, xmm8
0000000145bf26a7 440f58c8                       addps xmm9, xmm0
0000000145bf26ab 410f28f9                       movaps xmm7, xmm9
0000000145bf26af f3440f16cf                     movshdup xmm9, xmm7
0000000145bf26b4 4889f9                         mov rcx, rdi
0000000145bf26b7 0f28cf                         movaps xmm1, xmm7
0000000145bf26ba 410f28d1                       movaps xmm2, xmm9
0000000145bf26be e89de4f9ff                     call 0x145b90b60
0000000145bf26c3 440f28c0                       movaps xmm8, xmm0
0000000145bf26c7 a801                           test al, 1
0000000145bf26c9 7504                           jne 0x145bf26cf
0000000145bf26cb 450f28c3                       movaps xmm8, xmm11
0000000145bf26cf 0f133e                         movlps qword ptr [rsi], xmm7
0000000145bf26d2 410fb6866f030000               movzx eax, byte ptr [r14 + 0x36f]
0000000145bf26da 31c9                           xor ecx, ecx
0000000145bf26dc 85c0                           test eax, eax
0000000145bf26de 0f94c1                         sete cl
0000000145bf26e1 488d1598cea901                 lea rdx, [rip + 0x1a9ce98]
0000000145bf26e8 450f57d2                       xorps xmm10, xmm10
0000000145bf26ec f3440f2ad0                     cvtsi2ss xmm10, eax
0000000145bf26f1 f30f59348a                     mulss xmm6, dword ptr [rdx + rcx*4]
0000000145bf26f6 f3440f5915b55b5a00             mulss xmm10, dword ptr [rip + 0x5a5bb5]
0000000145bf26ff f3440f114608                   movss dword ptr [rsi + 8], xmm8
0000000145bf2705 f3440f5815fe605a00             addss xmm10, dword ptr [rip + 0x5a60fe]
0000000145bf270e f3440f59d6                     mulss xmm10, xmm6
0000000145bf2713 89e8                           mov eax, ebp
0000000145bf2715 c0e004                         shl al, 4
0000000145bf2718 c0f807                         sar al, 7
0000000145bf271b 0fbae502                       bt ebp, 2
0000000145bf271f 1400                           adc al, 0
0000000145bf2721 450f57db                       xorps xmm11, xmm11
0000000145bf2725 f7c500100000                   test ebp, 0x1000
0000000145bf272b 0f85b5000000                   jne 0x145bf27e6
0000000145bf2731 89e9                           mov ecx, ebp
0000000145bf2733 80e101                         and cl, 1
0000000145bf2736 89eb                           mov ebx, ebp
0000000145bf2738 c0e306                         shl bl, 6
0000000145bf273b c0fb07                         sar bl, 7
0000000145bf273e 00cb                           add bl, cl
0000000145bf2740 89d9                           mov ecx, ebx
0000000145bf2742 08c1                           or cl, al
0000000145bf2744 0f849c000000                   je 0x145bf27e6
0000000145bf274a 4d89ef                         mov r15, r13
0000000145bf274d 440fbee8                       movsx r13d, al
0000000145bf2751 0f57c0                         xorps xmm0, xmm0
0000000145bf2754 f3410f2ac5                     cvtsi2ss xmm0, r13d
0000000145bf2759 0fbec3                         movsx eax, bl
0000000145bf275c 0f57c9                         xorps xmm1, xmm1
0000000145bf275f f30f2ac8                       cvtsi2ss xmm1, eax
0000000145bf2763 f3410f10b62c050000             movss xmm6, dword ptr [r14 + 0x52c]
0000000145bf276c e8fe943f00                     call 0x145febc6f
0000000145bf2771 f3410f108ea4050000             movss xmm1, dword ptr [r14 + 0x5a4]
0000000145bf277a f30f5f0d1e5a5a00               maxss xmm1, dword ptr [rip + 0x5a5a1e]
0000000145bf2782 4584ed                         test r13b, r13b
0000000145bf2785 740d                           je 0x145bf2794
0000000145bf2787 440f28e9                       movaps xmm13, xmm1
0000000145bf278b 84db                           test bl, bl
0000000145bf278d 4d89fd                         mov r13, r15
0000000145bf2790 7912                           jns 0x145bf27a4
0000000145bf2792 eb14                           jmp 0x145bf27a8
0000000145bf2794 f3440f102d1b426100             movss xmm13, dword ptr [rip + 0x61421b]
0000000145bf279d 84db                           test bl, bl
0000000145bf279f 4d89fd                         mov r13, r15
0000000145bf27a2 7804                           js 0x145bf27a8
0000000145bf27a4 440f28e9                       movaps xmm13, xmm1
0000000145bf27a8 f30f58f0                       addss xmm6, xmm0
0000000145bf27ac f7c500010000                   test ebp, 0x100
0000000145bf27b2 4c8d3d97ba3c01                 lea r15, [rip + 0x13cba97]
0000000145bf27b9 7409                           je 0x145bf27c4
0000000145bf27bb f3440f102d4c945b00             movss xmm13, dword ptr [rip + 0x5b944c]
0000000145bf27c4 0f28c6                         movaps xmm0, xmm6
0000000145bf27c7 e89d943f00                     call 0x145febc69
0000000145bf27cc 440f28d8                       movaps xmm11, xmm0
0000000145bf27d0 f3450f59dd                     mulss xmm11, xmm13
0000000145bf27d5 0f28c6                         movaps xmm0, xmm6
0000000145bf27d8 e87a943f00                     call 0x145febc57
0000000145bf27dd f3410f59c5                     mulss xmm0, xmm13
0000000145bf27e2 440f14d8                       unpcklps xmm11, xmm0
0000000145bf27e6 f3450f12d2                     movsldup xmm10, xmm10
0000000145bf27eb 450f59d3                       mulps xmm10, xmm11
0000000145bf27ef f3410f16ca                     movshdup xmm1, xmm10
0000000145bf27f4 410f28c2                       movaps xmm0, xmm10
0000000145bf27f8 e84e943f00                     call 0x145febc4b
0000000145bf27fd f30f100dbb615a00               movss xmm1, dword ptr [rip + 0x5a61bb]
0000000145bf2805 0f2ec8                         ucomiss xmm1, xmm0
0000000145bf2808 0f8754010000                   ja 0x145bf2962
0000000145bf280e f30f100dba605a00               movss xmm1, dword ptr [rip + 0x5a60ba]
0000000145bf2816 31c0                           xor eax, eax
0000000145bf2818 0f2ec1                         ucomiss xmm0, xmm1
0000000145bf281b 0f97c0                         seta al
0000000145bf281e f30f5ec8                       divss xmm1, xmm0
0000000145bf2822 f30f12c1                       movsldup xmm0, xmm1
0000000145bf2826 410f59c2                       mulps xmm0, xmm10
0000000145bf282a 660f6ec8                       movd xmm1, eax
0000000145bf282e 660f70f100                     pshufd xmm6, xmm1, 0
0000000145bf2833 660f72f61f                     pslld xmm6, 0x1f
0000000145bf2838 660f72e61f                     psrad xmm6, 0x1f
0000000145bf283d 0f54c6                         andps xmm0, xmm6
0000000145bf2840 410f55f2                       andnps xmm6, xmm10
0000000145bf2844 0f56f0                         orps xmm6, xmm0
0000000145bf2847 0f58f7                         addps xmm6, xmm7
0000000145bf284a 49837d00ff                     cmp qword ptr [r13], -1
0000000145bf284f 0f848a000000                   je 0x145bf28df
0000000145bf2855 660f7efa                       movd edx, xmm7
0000000145bf2859 66440f7ec8                     movd eax, xmm9
0000000145bf285e 48c1e020                       shl rax, 0x20
0000000145bf2862 4809c2                         or rdx, rax
0000000145bf2865 66410f7ef0                     movd r8d, xmm6
0000000145bf286a f30f16c6                       movshdup xmm0, xmm6
0000000145bf286e 660f7ec0                       movd eax, xmm0
0000000145bf2872 48c1e020                       shl rax, 0x20
0000000145bf2876 4909c0                         or r8, rax
0000000145bf2879 4c89e9                         mov rcx, r13
0000000145bf287c e85f87f9ff                     call 0x145b8afe0
0000000145bf2881 0f2e0518595a00                 ucomiss xmm0, dword ptr [rip + 0x5a5918]
0000000145bf2888 7355                           jae 0x145bf28df
0000000145bf288a 0f28cf                         movaps xmm1, xmm7
0000000145bf288d 0f5cce                         subps xmm1, xmm6
0000000145bf2890 0f59c9                         mulps xmm1, xmm1
0000000145bf2893 f30f16d1                       movshdup xmm2, xmm1
0000000145bf2897 f30f58d1                       addss xmm2, xmm1
0000000145bf289b 0f57c9                         xorps xmm1, xmm1
0000000145bf289e f30f51ca                       sqrtss xmm1, xmm2
0000000145bf28a2 f30f10155a595a00               movss xmm2, dword ptr [rip + 0x5a595a]
0000000145bf28aa f30f5fca                       maxss xmm1, xmm2
0000000145bf28ae f30f5ed1                       divss xmm2, xmm1
0000000145bf28b2 f30f5cc2                       subss xmm0, xmm2
0000000145bf28b6 0f57c9                         xorps xmm1, xmm1
0000000145bf28b9 f30f5fc1                       maxss xmm0, xmm1
0000000145bf28bd 0f5cf7                         subps xmm6, xmm7
0000000145bf28c0 f30f12c8                       movsldup xmm1, xmm0
0000000145bf28c4 0f59ce                         mulps xmm1, xmm6
0000000145bf28c7 0f58cf                         addps xmm1, xmm7
0000000145bf28ca 410f28d0                       movaps xmm2, xmm8
0000000145bf28ce f3410f5cd0                     subss xmm2, xmm8
0000000145bf28d3 f30f59d0                       mulss xmm2, xmm0
0000000145bf28d7 f3440f58c2                     addss xmm8, xmm2
0000000145bf28dc 0f28f1                         movaps xmm6, xmm1
0000000145bf28df 4c89e1                         mov rcx, r12
0000000145bf28e2 488b542428                     mov rdx, qword ptr [rsp + 0x28]
0000000145bf28e7 e8a498eaff                     call 0x145a9c190
0000000145bf28ec 4869d8f0000000                 imul rbx, rax, 0xf0
0000000145bf28f3 f2460f108c3bc8000000           movsd xmm9, qword ptr [rbx + r15 + 0xc8]
0000000145bf28fd 0f28fe                         movaps xmm7, xmm6
0000000145bf2900 410f5cf9                       subps xmm7, xmm9
0000000145bf2904 f30f16cf                       movshdup xmm1, xmm7
0000000145bf2908 0f28c7                         movaps xmm0, xmm7
0000000145bf290b e83b933f00                     call 0x145febc4b
0000000145bf2910 440f2ee0                       ucomiss xmm12, xmm0
0000000145bf2914 772d                           ja 0x145bf2943
0000000145bf2916 f3420f108c3bd8000000           movss xmm1, dword ptr [rbx + r15 + 0xd8]
0000000145bf2920 f30f580dc8869e00               addss xmm1, dword ptr [rip + 0x9e86c8]
0000000145bf2928 0f2ec8                         ucomiss xmm1, xmm0
0000000145bf292b 7316                           jae 0x145bf2943
0000000145bf292d f30f12c0                       movsldup xmm0, xmm0
0000000145bf2931 0f5ef8                         divps xmm7, xmm0
0000000145bf2934 f30f12c1                       movsldup xmm0, xmm1
0000000145bf2938 0f59c7                         mulps xmm0, xmm7
0000000145bf293b 440f58c8                       addps xmm9, xmm0
0000000145bf293f 410f28f1                       movaps xmm6, xmm9
0000000145bf2943 f30f16d6                       movshdup xmm2, xmm6
0000000145bf2947 4889f9                         mov rcx, rdi
0000000145bf294a 0f28ce                         movaps xmm1, xmm6
0000000145bf294d e80ee2f9ff                     call 0x145b90b60
0000000145bf2952 a801                           test al, 1
0000000145bf2954 7504                           jne 0x145bf295a
0000000145bf2956 410f28c0                       movaps xmm0, xmm8
0000000145bf295a 0f1336                         movlps qword ptr [rsi], xmm6
0000000145bf295d f30f114608                     movss dword ptr [rsi + 8], xmm0
0000000145bf2962 0f28742430                     movaps xmm6, xmmword ptr [rsp + 0x30]
0000000145bf2967 0f287c2440                     movaps xmm7, xmmword ptr [rsp + 0x40]
0000000145bf296c 440f28442450                   movaps xmm8, xmmword ptr [rsp + 0x50]
0000000145bf2972 440f284c2460                   movaps xmm9, xmmword ptr [rsp + 0x60]
0000000145bf2978 440f28542470                   movaps xmm10, xmmword ptr [rsp + 0x70]
0000000145bf297e 440f289c2480000000             movaps xmm11, xmmword ptr [rsp + 0x80]
0000000145bf2987 440f28a42490000000             movaps xmm12, xmmword ptr [rsp + 0x90]
0000000145bf2990 440f28ac24a0000000             movaps xmm13, xmmword ptr [rsp + 0xa0]
0000000145bf2999 440f28b424b0000000             movaps xmm14, xmmword ptr [rsp + 0xb0]
0000000145bf29a2 4881c4c8000000                 add rsp, 0xc8
0000000145bf29a9 5b                             pop rbx
0000000145bf29aa 5d                             pop rbp
0000000145bf29ab 5f                             pop rdi
0000000145bf29ac 5e                             pop rsi
0000000145bf29ad 415c                           pop r12
0000000145bf29af 415d                           pop r13
0000000145bf29b1 415e                           pop r14
0000000145bf29b3 415f                           pop r15
0000000145bf29b5 c3                             ret
