0x1458e2590: push rbp
0x1458e2591: push r15
0x1458e2593: push r14
0x1458e2595: push rsi
0x1458e2596: push rdi
0x1458e2597: push rbx
0x1458e2598: sub rsp, 0x108
0x1458e259f: lea rbp, [rsp + 0x80]
0x1458e25a7: mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
0x1458e25b2: mov rsi, rcx
0x1458e25b5: lea rdx, [rip + 0x1a4c514]
0x1458e25bc: lea rcx, [rbp - 0x10]
0x1458e25c0: mov r8d, 0x13
0x1458e25c6: call 0x145cd3d10
0x1458e25cb: mov rdx, qword ptr [rbp - 0x10]
0x1458e25cf: cmp rdx, -1
0x1458e25d3: je 0x1458e2601
0x1458e25d5: cmp qword ptr [rbp], 4
0x1458e25da: jne 0x1458e25ec
0x1458e25dc: mov rcx, qword ptr [rbp - 8]
0x1458e25e0: cmp dword ptr [rcx], 0x656e6f6e
0x1458e25e6: je 0x1458e27f4
0x1458e25ec: movups xmm0, xmmword ptr [rbp - 0x10]
0x1458e25f0: movups xmm1, xmmword ptr [rbp]
0x1458e25f4: movaps xmmword ptr [rbp + 0x20], xmm1
0x1458e25f8: movaps xmmword ptr [rbp + 0x10], xmm0
0x1458e25fc: jmp 0x1458e26c5
0x1458e2601: lea rdx, [rip + 0x1a4c4db]
0x1458e2608: lea rcx, [rbp + 0x48]
0x1458e260c: mov r8d, 7
0x1458e2612: call 0x145cd3d10
0x1458e2617: mov rax, qword ptr [rbp + 0x48]
0x1458e261b: cmp rax, -1
0x1458e261f: jne 0x1458e2645
0x1458e2621: lea rdx, [rip + 0x175a68c]
0x1458e2628: lea rcx, [rbp + 0x48]
0x1458e262c: mov r8d, 0xd
0x1458e2632: call 0x145cd3d10
0x1458e2637: mov rax, qword ptr [rbp + 0x48]
0x1458e263b: cmp rax, -1
0x1458e263f: je 0x1458e2834
0x1458e2645: mov qword ptr [rbp + 0x78], rax
0x1458e2649: mov rdx, qword ptr [rbp + 0x50]
0x1458e264d: mov r8, qword ptr [rbp + 0x58]
0x1458e2651: mov qword ptr [rsp + 0x20], 0xd
0x1458e265a: lea r9, [rip + 0x1a4c489]
0x1458e2661: lea rcx, [rbp + 0x48]
0x1458e2665: mov qword ptr [rbp + 0x70], rdx
0x1458e2669: call 0x145cc0e20
0x1458e266e: nop
0x1458e266f: mov rdx, qword ptr [rbp + 0x50]
0x1458e2673: mov r8, qword ptr [rbp + 0x58]
0x1458e2677: mov qword ptr [rsp + 0x20], 9
0x1458e2680: lea r9, [rip + 0x1a4c470]
0x1458e2687: lea rcx, [rbp + 0x10]
0x1458e268b: mov qword ptr [rbp + 0x68], rdx
0x1458e268f: call 0x145cc0e20
0x1458e2694: nop
0x1458e2695: mov rdx, qword ptr [rbp + 0x48]
0x1458e2699: test rdx, rdx
0x1458e269c: je 0x1458e26ad
0x1458e269e: mov r8d, 1
0x1458e26a4: mov rcx, qword ptr [rbp + 0x68]
0x1458e26a8: call 0x1400021d0
0x1458e26ad: mov rdx, qword ptr [rbp + 0x78]
0x1458e26b1: test rdx, rdx
0x1458e26b4: je 0x1458e26c5
0x1458e26b6: mov r8d, 1
0x1458e26bc: mov rcx, qword ptr [rbp + 0x70]
0x1458e26c0: call 0x1400021d0
0x1458e26c5: mov rdx, qword ptr [rbp + 0x18]
0x1458e26c9: mov r8, qword ptr [rbp + 0x20]
0x1458e26cd: lea rcx, [rbp + 0x30]
0x1458e26d1: mov qword ptr [rbp + 0x78], rdx
0x1458e26d5: call 0x145cd7790
0x1458e26da: nop
0x1458e26db: mov rdx, qword ptr [rbp + 0x10]
0x1458e26df: test rdx, rdx
0x1458e26e2: je 0x1458e26f3
0x1458e26e4: mov r8d, 1
0x1458e26ea: mov rcx, qword ptr [rbp + 0x78]
0x1458e26ee: call 0x1400021d0
0x1458e26f3: mov rax, qword ptr [rbp + 0x30]
0x1458e26f7: cmp rax, -1
0x1458e26fb: je 0x1458e272c
0x1458e26fd: mov qword ptr [rbp + 0x78], rax
0x1458e2701: mov rcx, qword ptr [rbp + 0x38]
0x1458e2705: mov rdx, qword ptr [rbp + 0x40]
0x1458e2709: mov qword ptr [rbp + 0x70], rcx
0x1458e270d: call 0x1401edaa0
0x1458e2712: nop
0x1458e2713: mov rdi, rdx
0x1458e2716: test rdx, rdx
0x1458e2719: jns 0x1458e277a
0x1458e271b: xor r15d, r15d
0x1458e271e: mov rcx, r15
0x1458e2721: mov rdx, rdi
0x1458e2724: call 0x145eb6fcb
0x1458e2729: nop
0x1458e272a: ud2
0x1458e272c: mov qword ptr [rsi], 0
0x1458e2733: mov qword ptr [rsi + 8], 1
0x1458e273b: mov qword ptr [rsi + 0x10], 0
0x1458e2743: mov rax, qword ptr [rbp + 0x38]
0x1458e2747: mov ecx, eax
0x1458e2749: and ecx, 3
0x1458e274c: lea edx, [rcx - 2]
0x1458e274f: cmp edx, 2
0x1458e2752: jb 0x1458e290a
0x1458e2758: test rcx, rcx
0x1458e275b: je 0x1458e290a
0x1458e2761: dec rax
0x1458e2764: lea rcx, [rbp + 0x50]
0x1458e2768: mov qword ptr [rbp + 0x50], rax
0x1458e276c: mov byte ptr [rbp + 0x48], 3
0x1458e2770: call 0x145cf9ce0
0x1458e2775: jmp 0x1458e290a
0x1458e277a: test rdi, rdi
0x1458e277d: je 0x1458e2824
0x1458e2783: mov r14, rax
0x1458e2786: call 0x140002200
0x1458e278b: mov r15d, 1
0x1458e2791: mov edx, 1
0x1458e2796: mov rcx, rdi
0x1458e2799: call 0x1400021c0
0x1458e279e: test rax, rax
0x1458e27a1: je 0x1458e271e
0x1458e27a7: mov rbx, rax
0x1458e27aa: mov rcx, rax
0x1458e27ad: mov rdx, r14
0x1458e27b0: mov r8, rdi
0x1458e27b3: call 0x145d145fb
0x1458e27b8: mov rdx, qword ptr [rbp + 0x78]
0x1458e27bc: test rdx, rdx
0x1458e27bf: je 0x1458e27d0
0x1458e27c1: mov r8d, 1
0x1458e27c7: mov rcx, qword ptr [rbp + 0x70]
0x1458e27cb: call 0x1400021d0
0x1458e27d0: mov qword ptr [rbp + 0x30], rdi
0x1458e27d4: mov qword ptr [rbp + 0x38], rbx
0x1458e27d8: mov qword ptr [rbp + 0x40], rdi
0x1458e27dc: mov qword ptr [rsi + 0x10], rdi
0x1458e27e0: mov rax, qword ptr [rbp + 0x30]
0x1458e27e4: mov qword ptr [rsi], rax
0x1458e27e7: mov rax, qword ptr [rbp + 0x38]
0x1458e27eb: mov qword ptr [rsi + 8], rax
0x1458e27ef: jmp 0x1458e290a
0x1458e27f4: mov qword ptr [rsi], 0
0x1458e27fb: mov qword ptr [rsi + 8], 1
0x1458e2803: mov qword ptr [rsi + 0x10], 0
0x1458e280b: test rdx, rdx
0x1458e280e: je 0x1458e290a
0x1458e2814: mov r8d, 1
0x1458e281a: call 0x1400021d0
0x1458e281f: jmp 0x1458e290a
0x1458e2824: mov ebx, 1
0x1458e2829: mov rdx, qword ptr [rbp + 0x78]
0x1458e282d: test rdx, rdx
0x1458e2830: jne 0x1458e27c1
0x1458e2832: jmp 0x1458e27d0
0x1458e2834: lea rdx, [rip + 0x175a3b0]
0x1458e283b: lea rcx, [rbp - 0x30]
0x1458e283f: mov r8d, 4
0x1458e2845: call 0x145cd3d10
0x1458e284a: mov rax, qword ptr [rbp - 0x30]
0x1458e284e: cmp rax, -1
0x1458e2852: je 0x1458e28f3
0x1458e2858: mov qword ptr [rbp + 0x78], rax
0x1458e285c: mov rdx, qword ptr [rbp - 0x28]
0x1458e2860: mov r8, qword ptr [rbp - 0x20]
0x1458e2864: mov qword ptr [rsp + 0x20], 6
0x1458e286d: lea r9, [rip + 0x175a36c]
0x1458e2874: lea rcx, [rbp + 0x48]
0x1458e2878: mov qword ptr [rbp + 0x70], rdx
0x1458e287c: call 0x145cc0e20
0x1458e2881: nop
0x1458e2882: mov rdx, qword ptr [rbp + 0x50]
0x1458e2886: mov r8, qword ptr [rbp + 0x58]
0x1458e288a: mov qword ptr [rsp + 0x20], 5
0x1458e2893: lea r9, [rip + 0x175a34c]
0x1458e289a: lea rcx, [rbp - 0x50]
0x1458e289e: mov qword ptr [rbp + 0x68], rdx
0x1458e28a2: call 0x145cc0e20
0x1458e28a7: nop
0x1458e28a8: mov rdx, qword ptr [rbp + 0x48]
0x1458e28ac: test rdx, rdx
0x1458e28af: je 0x1458e28c0
0x1458e28b1: mov r8d, 1
0x1458e28b7: mov rcx, qword ptr [rbp + 0x68]
0x1458e28bb: call 0x1400021d0
0x1458e28c0: mov rdx, qword ptr [rbp + 0x78]
0x1458e28c4: test rdx, rdx
0x1458e28c7: je 0x1458e28d8
0x1458e28c9: mov r8d, 1
0x1458e28cf: mov rcx, qword ptr [rbp + 0x70]
0x1458e28d3: call 0x1400021d0
0x1458e28d8: mov rax, qword ptr [rbp - 0x50]
0x1458e28dc: cmp rax, -1
0x1458e28e0: je 0x1458e28f3
0x1458e28e2: mov qword ptr [rbp + 0x78], rax
0x1458e28e6: mov rdx, qword ptr [rbp - 0x48]
0x1458e28ea: mov r8, qword ptr [rbp - 0x40]
0x1458e28ee: jmp 0x1458e2651
0x1458e28f3: mov qword ptr [rsi], 0
0x1458e28fa: mov qword ptr [rsi + 8], 1
0x1458e2902: mov qword ptr [rsi + 0x10], 0
0x1458e290a: mov rax, rsi
0x1458e290d: add rsp, 0x108
0x1458e2914: pop rbx
0x1458e2915: pop rdi
0x1458e2916: pop rsi
0x1458e2917: pop r14
0x1458e2919: pop r15
0x1458e291b: pop rbp
0x1458e291c: ret
