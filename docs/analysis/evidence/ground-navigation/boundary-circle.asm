14590a6d9: f3450f1080d8000000 movss xmm8, dword ptr [r8 + 0xd8]
14590a6e2: f3440f5805c51d4a00 addss xmm8, dword ptr [rip + 0x4a1dc5]
14590a6eb: f30f10056d204a00 movss xmm0, dword ptr [rip + 0x4a206d]
14590a6f3: f3410f59c0 mulss xmm0, xmm8
14590a6f8: f30f5e05b41d4a00 divss xmm0, dword ptr [rip + 0x4a1db4]
14590a700: e8f6aa2f00 call 0x145c051fb
14590a705: f3480f2cc0 cvttss2si rax, xmm0
14590a70a: 4889c1 mov rcx, rax
14590a70d: 48c1f93f sar rcx, 0x3f
14590a711: 0f28c8 movaps xmm1, xmm0
14590a714: f30f5c0d34724a00 subss xmm1, dword ptr [rip + 0x4a7234]
14590a71c: f3480f2cd1 cvttss2si rdx, xmm1
14590a721: 4821ca and rdx, rcx
14590a724: 4809c2 or rdx, rax
14590a727: 31f6 xor esi, esi
14590a729: 0f57c9 xorps xmm1, xmm1
14590a72c: 0f2ec1 ucomiss xmm0, xmm1
14590a72f: 480f42d6 cmovb rdx, rsi
14590a733: 0f2e051a724a00 ucomiss xmm0, dword ptr [rip + 0x4a721a]
14590a73a: 48c7c3ffffffff mov rbx, 0xffffffffffffffff
14590a741: 480f46da cmovbe rbx, rdx
14590a745: 4885db test rbx, rbx
14590a748: 780b js 0x14590a755
14590a74a: 450f57c9 xorps xmm9, xmm9
14590a74e: f34c0f2acb cvtsi2ss xmm9, rbx
14590a753: eb1c jmp 0x14590a771
14590a755: 4889d8 mov rax, rbx
14590a758: 48d1e8 shr rax, 1
14590a75b: 89d9 mov ecx, ebx
14590a75d: 83e101 and ecx, 1
14590a760: 4809c1 or rcx, rax
14590a763: 450f57c9 xorps xmm9, xmm9
14590a767: f34c0f2ac9 cvtsi2ss xmm9, rcx
14590a76c: f3450f58c9 addss xmm9, xmm9
14590a771: f3440f1015e61f4a00 movss xmm10, dword ptr [rip + 0x4a1fe6]
14590a77a: 488dbd30010000 lea rdi, [rbp + 0x130]
14590a781: 4531ff xor r15d, r15d
14590a784: 4c8bb5e0000000 mov r14, qword ptr [rbp + 0xe0]
14590a78b: eb31 jmp 0x14590a7be
14590a78d: 0f1f00 nop dword ptr [rax]
14590a790: 660f7ef0 movd eax, xmm6
14590a794: 660f7ef9 movd ecx, xmm7
14590a798: 48c1e120 shl rcx, 0x20
14590a79c: 4809c8 or rax, rcx
14590a79f: 488b8d38010000 mov rcx, qword ptr [rbp + 0x138]
14590a7a6: 488904f1 mov qword ptr [rcx + rsi*8], rax
14590a7aa: 48ffc6 inc rsi
14590a7ad: 4889b540010000 mov qword ptr [rbp + 0x140], rsi
14590a7b4: 49ffc7 inc r15
14590a7b7: 4c8bad28010000 mov r13, qword ptr [rbp + 0x128]
14590a7be: 4939df cmp r15, rbx
14590a7c1: 0f8376fbffff jae 0x14590a33d
14590a7c7: 4d85ff test r15, r15
14590a7ca: 7814 js 0x14590a7e0
14590a7cc: 0f57ff xorps xmm7, xmm7
14590a7cf: f3490f2aff cvtsi2ss xmm7, r15
14590a7d4: eb25 jmp 0x14590a7fb
14590a7d6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14590a7e0: 4c89f8 mov rax, r15
14590a7e3: 48d1e8 shr rax, 1
14590a7e6: 4489f9 mov ecx, r15d
14590a7e9: 83e101 and ecx, 1
14590a7ec: 4809c1 or rcx, rax
14590a7ef: 0f57ff xorps xmm7, xmm7
14590a7f2: f3480f2af9 cvtsi2ss xmm7, rcx
14590a7f7: f30f58ff addss xmm7, xmm7
14590a7fb: f3410f59fa mulss xmm7, xmm10
14590a800: f3410f5ef9 divss xmm7, xmm9
14590a805: 0f28c7 movaps xmm0, xmm7
14590a808: e8caa92f00 call 0x145c051d7
14590a80d: 0f28f0 movaps xmm6, xmm0
14590a810: f3410f59f0 mulss xmm6, xmm8
14590a815: f3410f58b6c8000000 addss xmm6, dword ptr [r14 + 0xc8]
14590a81e: 0f28c7 movaps xmm0, xmm7
14590a821: e8aba92f00 call 0x145c051d1
14590a826: 0f28f8 movaps xmm7, xmm0
14590a829: f3410f59f8 mulss xmm7, xmm8
14590a82e: f3410f58becc000000 addss xmm7, dword ptr [r14 + 0xcc]
14590a837: 483bb530010000 cmp rsi, qword ptr [rbp + 0x130]
14590a83e: 0f854cffffff jne 0x14590a790
14590a844: c6856f01000001 mov byte ptr [rbp + 0x16f], 1
14590a84b: 4889f9 mov rcx, rdi
14590a84e: e8dd693000 call 0x145c11230
14590a853: 90 nop
14590a854: e937ffffff jmp 0x14590a790
