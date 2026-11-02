1402b23f0 55 push rbp
1402b23f1 4157 push r15
1402b23f3 4156 push r14
1402b23f5 4155 push r13
1402b23f7 4154 push r12
1402b23f9 56 push rsi
1402b23fa 57 push rdi
1402b23fb 53 push rbx
1402b23fc 4881ec08070000 sub rsp, 0x708
1402b2403 488dac2480000000 lea rbp, [rsp + 0x80]
1402b240b 440f29bd70060000 movaps xmmword ptr [rbp + 0x670], xmm15
1402b2413 440f29b560060000 movaps xmmword ptr [rbp + 0x660], xmm14
1402b241b 440f29ad50060000 movaps xmmword ptr [rbp + 0x650], xmm13
1402b2423 440f29a540060000 movaps xmmword ptr [rbp + 0x640], xmm12
1402b242b 440f299d30060000 movaps xmmword ptr [rbp + 0x630], xmm11
1402b2433 440f299520060000 movaps xmmword ptr [rbp + 0x620], xmm10
1402b243b 440f298d10060000 movaps xmmword ptr [rbp + 0x610], xmm9
1402b2443 440f298500060000 movaps xmmword ptr [rbp + 0x600], xmm8
1402b244b 0f29bdf0050000 movaps xmmword ptr [rbp + 0x5f0], xmm7
1402b2452 0f29b5e0050000 movaps xmmword ptr [rbp + 0x5e0], xmm6
1402b2459 48c785d8050000feffffff mov qword ptr [rbp + 0x5d8], 0xfffffffffffffffe
1402b2464 4889ce mov rsi, rcx
1402b2467 4c8b39 mov r15, qword ptr [rcx]
1402b246a 488b4128 mov rax, qword ptr [rcx + 0x28]
1402b246e 4c89bdc0010000 mov qword ptr [rbp + 0x1c0], r15
1402b2475 488dbdc8010000 lea rdi, [rbp + 0x1c8]
1402b247c 0f104108 movups xmm0, xmmword ptr [rcx + 8]
1402b2480 0f1185c8010000 movups xmmword ptr [rbp + 0x1c8], xmm0
1402b2487 0f104118 movups xmm0, xmmword ptr [rcx + 0x18]
1402b248b 0f1185d8010000 movups xmmword ptr [rbp + 0x1d8], xmm0
1402b2492 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
1402b2499 488b5a08 mov rbx, qword ptr [rdx + 8]
1402b249d 488b4210 mov rax, qword ptr [rdx + 0x10]
1402b24a1 488985a8030000 mov qword ptr [rbp + 0x3a8], rax
1402b24a8 0f100521b5c405 movups xmm0, xmmword ptr [rip + 0x5c4b521]
1402b24af 0f2985f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm0
1402b24b6 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1402b24c1 0f100520b5c405 movups xmm0, xmmword ptr [rip + 0x5c4b520]
1402b24c8 0f118508020000 movups xmmword ptr [rbp + 0x208], xmm0
1402b24cf 48c7851802000000000000 mov qword ptr [rbp + 0x218], 0
1402b24da 440f10251eb5c405 movups xmm12, xmmword ptr [rip + 0x5c4b51e]
1402b24e2 440f29a520020000 movaps xmmword ptr [rbp + 0x220], xmm12
1402b24ea 48c7853002000000000000 mov qword ptr [rbp + 0x230], 0
1402b24f5 440f102d1bb5c405 movups xmm13, xmmword ptr [rip + 0x5c4b51b]
1402b24fd 440f11ad38020000 movups xmmword ptr [rbp + 0x238], xmm13
1402b2505 48c7854802000000000000 mov qword ptr [rbp + 0x248], 0
1402b2510 0f57ff xorps xmm7, xmm7
1402b2513 0f11bd60040000 movups xmmword ptr [rbp + 0x460], xmm7
1402b251a 0f11bd50040000 movups xmmword ptr [rbp + 0x450], xmm7
1402b2521 48c7852c05000000000000 mov qword ptr [rbp + 0x52c], 0
1402b252c 66c785340500000000 mov word ptr [rbp + 0x534], 0
1402b2535 0f11bda2020000 movups xmmword ptr [rbp + 0x2a2], xmm7
1402b253c 0f2885f0010000 movaps xmm0, xmmword ptr [rbp + 0x1f0]
1402b2543 488b8500020000 mov rax, qword ptr [rbp + 0x200]
1402b254a 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
1402b2551 488b9510020000 mov rdx, qword ptr [rbp + 0x210]
1402b2558 4c8b8518020000 mov r8, qword ptr [rbp + 0x218]
1402b255f 0f288d20020000 movaps xmm1, xmmword ptr [rbp + 0x220]
1402b2566 0f1185b8030000 movups xmmword ptr [rbp + 0x3b8], xmm0
1402b256d 488985c8030000 mov qword ptr [rbp + 0x3c8], rax
1402b2574 48898dd0030000 mov qword ptr [rbp + 0x3d0], rcx
1402b257b 488995d8030000 mov qword ptr [rbp + 0x3d8], rdx
1402b2582 4c8985e0030000 mov qword ptr [rbp + 0x3e0], r8
1402b2589 0f118de8030000 movups xmmword ptr [rbp + 0x3e8], xmm1
1402b2590 0f288530020000 movaps xmm0, xmmword ptr [rbp + 0x230]
1402b2597 0f1185f8030000 movups xmmword ptr [rbp + 0x3f8], xmm0
1402b259e 0f288540020000 movaps xmm0, xmmword ptr [rbp + 0x240]
1402b25a5 0f118508040000 movups xmmword ptr [rbp + 0x408], xmm0
1402b25ac 0f28057d93c105 movaps xmm0, xmmword ptr [rip + 0x5c1937d]
1402b25b3 0f118518040000 movups xmmword ptr [rbp + 0x418], xmm0
1402b25ba 0f2805affbc205 movaps xmm0, xmmword ptr [rip + 0x5c2fbaf]
1402b25c1 0f118528040000 movups xmmword ptr [rbp + 0x428], xmm0
1402b25c8 0f280581abc405 movaps xmm0, xmmword ptr [rip + 0x5c4ab81]
1402b25cf 0f118538040000 movups xmmword ptr [rbp + 0x438], xmm0
1402b25d6 48b8010000000000a841 movabs rax, 0x41a8000000000001
1402b25e0 48898548040000 mov qword ptr [rbp + 0x448], rax
1402b25e7 440f1005a9b4c405 movups xmm8, xmmword ptr [rip + 0x5c4b4a9]
1402b25ef 440f118580040000 movups xmmword ptr [rbp + 0x480], xmm8
1402b25f7 440f100d89b4c405 movups xmm9, xmmword ptr [rip + 0x5c4b489]
1402b25ff 440f118d70040000 movups xmmword ptr [rbp + 0x470], xmm9
1402b2607 440f1035a9b4c405 movups xmm14, xmmword ptr [rip + 0x5c4b4a9]
1402b260f 440f11b5a0040000 movups xmmword ptr [rbp + 0x4a0], xmm14
1402b2617 440f103d89b4c405 movups xmm15, xmmword ptr [rip + 0x5c4b489]
1402b261f 440f11bd90040000 movups xmmword ptr [rbp + 0x490], xmm15
1402b2627 0f1035aab4c405 movups xmm6, xmmword ptr [rip + 0x5c4b4aa]
1402b262e 0f11b5c0040000 movups xmmword ptr [rbp + 0x4c0], xmm6
1402b2635 440f10158bb4c405 movups xmm10, xmmword ptr [rip + 0x5c4b48b]
1402b263d 440f1195b0040000 movups xmmword ptr [rbp + 0x4b0], xmm10
1402b2645 0f1005dce8c405 movups xmm0, xmmword ptr [rip + 0x5c4e8dc]
1402b264c 0f1185e0040000 movups xmmword ptr [rbp + 0x4e0], xmm0
1402b2653 0f1005bee8c405 movups xmm0, xmmword ptr [rip + 0x5c4e8be]
1402b265a 0f1185d0040000 movups xmmword ptr [rbp + 0x4d0], xmm0
1402b2661 440f281dc7f9be05 movaps xmm11, xmmword ptr [rip + 0x5bef9c7]
1402b2669 440f119df0040000 movups xmmword ptr [rbp + 0x4f0], xmm11
1402b2671 c7850005000001000000 mov dword ptr [rbp + 0x500], 1
1402b267b 48c7850405000000000000 mov qword ptr [rbp + 0x504], 0
1402b2686 c6850c05000001 mov byte ptr [rbp + 0x50c], 1
1402b268d 48c7851005000000000000 mov qword ptr [rbp + 0x510], 0
1402b2698 c785180500000000803f mov dword ptr [rbp + 0x518], 0x3f800000
1402b26a2 66c7851c0500000000 mov word ptr [rbp + 0x51c], 0
1402b26ab 66c785220500000000 mov word ptr [rbp + 0x522], 0
1402b26b4 c7851e05000000000100 mov dword ptr [rbp + 0x51e], 0x10000
1402b26be 66c785280500000000 mov word ptr [rbp + 0x528], 0
1402b26c7 c7852405000000000100 mov dword ptr [rbp + 0x524], 0x10000
1402b26d1 66c7852a0500000001 mov word ptr [rbp + 0x52a], 0x100
1402b26da 0fb785b0020000 movzx eax, word ptr [rbp + 0x2b0]
1402b26e1 66898546050000 mov word ptr [rbp + 0x546], ax
1402b26e8 0f1085a0020000 movups xmm0, xmmword ptr [rbp + 0x2a0]
1402b26ef 0f118536050000 movups xmmword ptr [rbp + 0x536], xmm0
1402b26f6 c78548050000cdcc4c3f mov dword ptr [rbp + 0x548], 0x3f4ccccd
1402b2700 66c7854c0500000000 mov word ptr [rbp + 0x54c], 0
1402b2709 4c89bdb0030000 mov qword ptr [rbp + 0x3b0], r15
1402b2710 488d4db0 lea rcx, [rbp - 0x50]
1402b2714 4c8d85b0030000 lea r8, [rbp + 0x3b0]
1402b271b 4889fa mov rdx, rdi
1402b271e e8ad32fbff call 0x1402659d0
1402b2723 66c785140500000000 mov word ptr [rbp + 0x514], 0
1402b272c c6850405000001 mov byte ptr [rbp + 0x504], 1
1402b2733 f20f100525aac405 movsd xmm0, qword ptr [rip + 0x5c4aa25]
1402b273b 0f118518040000 movups xmmword ptr [rbp + 0x418], xmm0
1402b2742 f20f100526aac405 movsd xmm0, qword ptr [rip + 0x5c4aa26]
1402b274a 0f118528040000 movups xmmword ptr [rbp + 0x428], xmm0
1402b2751 0f280528aac405 movaps xmm0, xmmword ptr [rip + 0x5c4aa28]
1402b2758 0f118538040000 movups xmmword ptr [rbp + 0x438], xmm0
1402b275f 48c7851004000000000000 mov qword ptr [rbp + 0x410], 0
1402b276a 0f11bd48040000 movups xmmword ptr [rbp + 0x448], xmm7
1402b2771 0f11bd58040000 movups xmmword ptr [rbp + 0x458], xmm7
1402b2778 c7852805000000000000 mov dword ptr [rbp + 0x528], 0
1402b2782 66c7852c0500000000 mov word ptr [rbp + 0x52c], 0
1402b278b 440f118d68040000 movups xmmword ptr [rbp + 0x468], xmm9
1402b2793 410f28c3 movaps xmm0, xmm11
1402b2797 440f100d31b2c405 movups xmm9, xmmword ptr [rip + 0x5c4b231]
1402b279f 440f101d41b2c405 movups xmm11, xmmword ptr [rip + 0x5c4b241]
1402b27a7 440f118578040000 movups xmmword ptr [rbp + 0x478], xmm8
1402b27af 440f11bd88040000 movups xmmword ptr [rbp + 0x488], xmm15
1402b27b7 440f11b598040000 movups xmmword ptr [rbp + 0x498], xmm14
1402b27bf 0f11b5b8040000 movups xmmword ptr [rbp + 0x4b8], xmm6
1402b27c6 440f1195a8040000 movups xmmword ptr [rbp + 0x4a8], xmm10
1402b27ce 0f103d23b3c405 movups xmm7, xmmword ptr [rip + 0x5c4b323]
1402b27d5 0f11bdd8040000 movups xmmword ptr [rbp + 0x4d8], xmm7
1402b27dc 440f100504b3c405 movups xmm8, xmmword ptr [rip + 0x5c4b304]
1402b27e4 440f1185c8040000 movups xmmword ptr [rbp + 0x4c8], xmm8
1402b27ec c6852605000000 mov byte ptr [rbp + 0x526], 0
1402b27f3 c7852205000000010000 mov dword ptr [rbp + 0x522], 0x100
1402b27fd 48c7850805000000000000 mov qword ptr [rbp + 0x508], 0
1402b2808 c785100500000000803f mov dword ptr [rbp + 0x510], 0x3f800000
1402b2812 0f1185e8040000 movups xmmword ptr [rbp + 0x4e8], xmm0
1402b2819 c785f804000001000000 mov dword ptr [rbp + 0x4f8], 1
1402b2823 48c785fc04000000000000 mov qword ptr [rbp + 0x4fc], 0
1402b282e c6852705000000 mov byte ptr [rbp + 0x527], 0
1402b2835 440f298db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm9
1402b283d 48c785c003000000000000 mov qword ptr [rbp + 0x3c0], 0
1402b2848 440f119dc8030000 movups xmmword ptr [rbp + 0x3c8], xmm11
1402b2850 48c785d803000000000000 mov qword ptr [rbp + 0x3d8], 0
1402b285b 440f29a5e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm12
1402b2863 48c785f003000000000000 mov qword ptr [rbp + 0x3f0], 0
1402b286e 440f11adf8030000 movups xmmword ptr [rbp + 0x3f8], xmm13
1402b2876 48c7850804000000000000 mov qword ptr [rbp + 0x408], 0
1402b2881 66c7851a0500000000 mov word ptr [rbp + 0x51a], 0
1402b288a c7851605000000000100 mov dword ptr [rbp + 0x516], 0x10000
1402b2894 66c785200500000000 mov word ptr [rbp + 0x520], 0
1402b289d c7851c05000000000100 mov dword ptr [rbp + 0x51c], 0x10000
1402b28a7 4c8d05a4eec405 lea r8, [rip + 0x5c4eea4]
1402b28ae 488d4db0 lea rcx, [rbp - 0x50]
1402b28b2 41b911000000 mov r9d, 0x11
1402b28b8 4889da mov rdx, rbx
1402b28bb e890bce2ff call 0x1400de550
1402b28c0 90 nop
1402b28c1 488d8da0020000 lea rcx, [rbp + 0x2a0]
1402b28c8 488d55b0 lea rdx, [rbp - 0x50]
1402b28cc e87f1c3c02 call 0x142674550
1402b28d1 90 nop
1402b28d2 0f1085d8020000 movups xmm0, xmmword ptr [rbp + 0x2d8]
1402b28d9 0f118568030000 movups xmmword ptr [rbp + 0x368], xmm0
1402b28e0 8b85e8020000 mov eax, dword ptr [rbp + 0x2e8]
1402b28e6 898578030000 mov dword ptr [rbp + 0x378], eax
1402b28ec 0f1085a0020000 movups xmm0, xmmword ptr [rbp + 0x2a0]
1402b28f3 0f108db0020000 movups xmm1, xmmword ptr [rbp + 0x2b0]
1402b28fa 0f1095c0020000 movups xmm2, xmmword ptr [rbp + 0x2c0]
1402b2901 0f299550030000 movaps xmmword ptr [rbp + 0x350], xmm2
1402b2908 488b85d0020000 mov rax, qword ptr [rbp + 0x2d0]
1402b290f 48898560030000 mov qword ptr [rbp + 0x360], rax
1402b2916 0f298530030000 movaps xmmword ptr [rbp + 0x330], xmm0
1402b291d 0f298d40030000 movaps xmmword ptr [rbp + 0x340], xmm1
1402b2924 440fb7a524030000 movzx r12d, word ptr [rbp + 0x324]
1402b292c 0f1085ec020000 movups xmm0, xmmword ptr [rbp + 0x2ec]
1402b2933 0f11857c030000 movups xmmword ptr [rbp + 0x37c], xmm0
1402b293a 0f1085fc020000 movups xmm0, xmmword ptr [rbp + 0x2fc]
1402b2941 0f11858c030000 movups xmmword ptr [rbp + 0x38c], xmm0
1402b2948 8b850c030000 mov eax, dword ptr [rbp + 0x30c]
1402b294e 89859c030000 mov dword ptr [rbp + 0x39c], eax
1402b2954 4c8d75b0 lea r14, [rbp - 0x50]
1402b2958 488d95b0030000 lea rdx, [rbp + 0x3b0]
1402b295f 41b880010000 mov r8d, 0x180
1402b2965 4c89f1 mov rcx, r14
1402b2968 e81e70a405 call 0x145cf998b
1402b296d 0f288530030000 movaps xmm0, xmmword ptr [rbp + 0x330]
1402b2974 0f288d40030000 movaps xmm1, xmmword ptr [rbp + 0x340]
1402b297b 0f289550030000 movaps xmm2, xmmword ptr [rbp + 0x350]
1402b2982 0f289d60030000 movaps xmm3, xmmword ptr [rbp + 0x360]
1402b2989 0f118530010000 movups xmmword ptr [rbp + 0x130], xmm0
1402b2990 0f118d40010000 movups xmmword ptr [rbp + 0x140], xmm1
1402b2997 0f119550010000 movups xmmword ptr [rbp + 0x150], xmm2
1402b299e 0f119d60010000 movups xmmword ptr [rbp + 0x160], xmm3
1402b29a5 0f288570030000 movaps xmm0, xmmword ptr [rbp + 0x370]
1402b29ac 0f118570010000 movups xmmword ptr [rbp + 0x170], xmm0
1402b29b3 0f288580030000 movaps xmm0, xmmword ptr [rbp + 0x380]
1402b29ba 0f118580010000 movups xmmword ptr [rbp + 0x180], xmm0
1402b29c1 0f288590030000 movaps xmm0, xmmword ptr [rbp + 0x390]
1402b29c8 0f118590010000 movups xmmword ptr [rbp + 0x190], xmm0
1402b29cf 488d8db8030000 lea rcx, [rbp + 0x3b8]
1402b29d6 41b8f0010000 mov r8d, 0x1f0
1402b29dc 4c89f2 mov rdx, r14
1402b29df e8a76fa405 call 0x145cf998b
1402b29e4 c785a805000001000000 mov dword ptr [rbp + 0x5a8], 1
1402b29ee 0f28059ba7c405 movaps xmm0, xmmword ptr [rip + 0x5c4a79b]
1402b29f5 0f1185ac050000 movups xmmword ptr [rbp + 0x5ac], xmm0
1402b29fc 664489a5bc050000 mov word ptr [rbp + 0x5bc], r12w
1402b2a04 66c785c00500000000 mov word ptr [rbp + 0x5c0], 0
1402b2a0d 4c89bdb0030000 mov qword ptr [rbp + 0x3b0], r15
1402b2a14 488d8d30030000 lea rcx, [rbp + 0x330]
1402b2a1b 4c8d85b0030000 lea r8, [rbp + 0x3b0]
1402b2a22 4889fa mov rdx, rdi
1402b2a25 e81648fbff call 0x140267240
1402b2a2a 66c785140500000000 mov word ptr [rbp + 0x514], 0
1402b2a33 c6850405000001 mov byte ptr [rbp + 0x504], 1
1402b2a3a f30f10059ea7c405 movss xmm0, dword ptr [rip + 0x5c4a79e]
1402b2a42 0f118518040000 movups xmmword ptr [rbp + 0x418], xmm0
1402b2a49 0f118528040000 movups xmmword ptr [rbp + 0x428], xmm0
1402b2a50 0f280559a7c405 movaps xmm0, xmmword ptr [rip + 0x5c4a759]
1402b2a57 0f118538040000 movups xmmword ptr [rbp + 0x438], xmm0
1402b2a5e 48c7851004000000000000 mov qword ptr [rbp + 0x410], 0
1402b2a69 0f57c0 xorps xmm0, xmm0
1402b2a6c 0f118548040000 movups xmmword ptr [rbp + 0x448], xmm0
1402b2a73 0f118558040000 movups xmmword ptr [rbp + 0x458], xmm0
1402b2a7a c7852805000000000000 mov dword ptr [rbp + 0x528], 0
1402b2a84 66c7852c0500000000 mov word ptr [rbp + 0x52c], 0
1402b2a8d 0f1005f4afc405 movups xmm0, xmmword ptr [rip + 0x5c4aff4]
1402b2a94 0f118568040000 movups xmmword ptr [rbp + 0x468], xmm0
1402b2a9b 0f1005f6afc405 movups xmm0, xmmword ptr [rip + 0x5c4aff6]
1402b2aa2 0f118578040000 movups xmmword ptr [rbp + 0x478], xmm0
1402b2aa9 440f11bd88040000 movups xmmword ptr [rbp + 0x488], xmm15
1402b2ab1 440f11b598040000 movups xmmword ptr [rbp + 0x498], xmm14
1402b2ab9 0f11b5b8040000 movups xmmword ptr [rbp + 0x4b8], xmm6
1402b2ac0 0f100501b0c405 movups xmm0, xmmword ptr [rip + 0x5c4b001]
1402b2ac7 0f1185a8040000 movups xmmword ptr [rbp + 0x4a8], xmm0
1402b2ace 0f11bdd8040000 movups xmmword ptr [rbp + 0x4d8], xmm7
1402b2ad5 440f1185c8040000 movups xmmword ptr [rbp + 0x4c8], xmm8
1402b2add c6852605000000 mov byte ptr [rbp + 0x526], 0
1402b2ae4 c7852205000000010000 mov dword ptr [rbp + 0x522], 0x100
1402b2aee 48c7850805000000000000 mov qword ptr [rbp + 0x508], 0
1402b2af9 c785100500000000803f mov dword ptr [rbp + 0x510], 0x3f800000
1402b2b03 0f280526f5be05 movaps xmm0, xmmword ptr [rip + 0x5bef526]
1402b2b0a 0f1185e8040000 movups xmmword ptr [rbp + 0x4e8], xmm0
1402b2b11 c785f804000001000000 mov dword ptr [rbp + 0x4f8], 1
1402b2b1b 48c785fc04000000000000 mov qword ptr [rbp + 0x4fc], 0
1402b2b26 c6852705000000 mov byte ptr [rbp + 0x527], 0
1402b2b2d 440f298db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm9
1402b2b35 48c785c003000000000000 mov qword ptr [rbp + 0x3c0], 0
1402b2b40 440f119dc8030000 movups xmmword ptr [rbp + 0x3c8], xmm11
1402b2b48 48c785d803000000000000 mov qword ptr [rbp + 0x3d8], 0
1402b2b53 440f29a5e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm12
1402b2b5b 48c785f003000000000000 mov qword ptr [rbp + 0x3f0], 0
1402b2b66 440f11adf8030000 movups xmmword ptr [rbp + 0x3f8], xmm13
1402b2b6e 48c7850804000000000000 mov qword ptr [rbp + 0x408], 0
1402b2b79 66c7851a0500000000 mov word ptr [rbp + 0x51a], 0
1402b2b82 c7851605000000000100 mov dword ptr [rbp + 0x516], 0x10000
1402b2b8c 66c785200500000000 mov word ptr [rbp + 0x520], 0
1402b2b95 c7851c05000000000100 mov dword ptr [rbp + 0x51c], 0x10000
1402b2b9f e85cf6d4ff call 0x140002200
1402b2ba4 b932000000 mov ecx, 0x32
1402b2ba9 ba01000000 mov edx, 1
1402b2bae e80df6d4ff call 0x1400021c0
1402b2bb3 4885c0 test rax, rax
1402b2bb6 0f840a080000 je 0x1402b33c6
1402b2bbc 0f1005c0ebc405 movups xmm0, xmmword ptr [rip + 0x5c4ebc0]
1402b2bc3 0f114020 movups xmmword ptr [rax + 0x20], xmm0
1402b2bc7 0f1005a5ebc405 movups xmm0, xmmword ptr [rip + 0x5c4eba5]
1402b2bce 0f114010 movups xmmword ptr [rax + 0x10], xmm0
1402b2bd2 0f10058aebc405 movups xmm0, xmmword ptr [rip + 0x5c4eb8a]
1402b2bd9 0f1100 movups xmmword ptr [rax], xmm0
1402b2bdc 66c740306c70 mov word ptr [rax + 0x30], 0x706c
1402b2be2 48c745b032000000 mov qword ptr [rbp - 0x50], 0x32
1402b2bea 488945b8 mov qword ptr [rbp - 0x48], rax
1402b2bee 48c745c032000000 mov qword ptr [rbp - 0x40], 0x32
1402b2bf6 488d053bf9c205 lea rax, [rip + 0x5c2f93b]
1402b2bfd 4889442420 mov qword ptr [rsp + 0x20], rax
1402b2c02 488d8d30030000 lea rcx, [rbp + 0x330]
1402b2c09 4c8d45b0 lea r8, [rbp - 0x50]
1402b2c0d 41b901000000 mov r9d, 1
1402b2c13 4889da mov rdx, rbx
1402b2c16 e8f56deaff call 0x140159a10
1402b2c1b 90 nop
1402b2c1c 488d8da0020000 lea rcx, [rbp + 0x2a0]
1402b2c23 488d9530030000 lea rdx, [rbp + 0x330]
1402b2c2a e821193c02 call 0x142674550
1402b2c2f 90 nop
1402b2c30 488d5db0 lea rbx, [rbp - 0x50]
1402b2c34 488d95b0030000 lea rdx, [rbp + 0x3b0]
1402b2c3b 41b880010000 mov r8d, 0x180
1402b2c41 4889d9 mov rcx, rbx
1402b2c44 e8426da405 call 0x145cf998b
1402b2c49 488d8d30010000 lea rcx, [rbp + 0x130]
1402b2c50 488d95a0020000 lea rdx, [rbp + 0x2a0]
1402b2c57 41b888000000 mov r8d, 0x88
1402b2c5d e8296da405 call 0x145cf998b
1402b2c62 488d8db8030000 lea rcx, [rbp + 0x3b8]
1402b2c69 41b808020000 mov r8d, 0x208
1402b2c6f 4889da mov rdx, rbx
1402b2c72 e8146da405 call 0x145cf998b
1402b2c77 66c785c00500000000 mov word ptr [rbp + 0x5c0], 0
1402b2c80 4c89bdb0030000 mov qword ptr [rbp + 0x3b0], r15
1402b2c87 488d8da0020000 lea rcx, [rbp + 0x2a0]
1402b2c8e 4c8d85b0030000 lea r8, [rbp + 0x3b0]
1402b2c95 4889fa mov rdx, rdi
1402b2c98 e8d342fbff call 0x140266f70
