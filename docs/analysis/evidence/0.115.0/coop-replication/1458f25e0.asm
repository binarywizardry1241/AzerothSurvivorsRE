0x1458f25e0: push rbp
0x1458f25e1: push r15
0x1458f25e3: push r14
0x1458f25e5: push r13
0x1458f25e7: push r12
0x1458f25e9: push rsi
0x1458f25ea: push rdi
0x1458f25eb: push rbx
0x1458f25ec: sub rsp, 0x478
0x1458f25f3: lea rbp, [rsp + 0x80]
0x1458f25fb: movaps xmmword ptr [rbp + 0x3e0], xmm9
0x1458f2603: movaps xmmword ptr [rbp + 0x3d0], xmm8
0x1458f260b: movaps xmmword ptr [rbp + 0x3c0], xmm7
0x1458f2612: movaps xmmword ptr [rbp + 0x3b0], xmm6
0x1458f2619: mov qword ptr [rbp + 0x3a8], 0xfffffffffffffffe
0x1458f2624: mov rdi, rdx
0x1458f2627: mov qword ptr [rbp + 0x2e0], rcx
0x1458f262e: mov rbx, qword ptr [rdx + 0x2a8]
0x1458f2635: mov r14, qword ptr [rdx + 0x2b0]
0x1458f263c: mov rsi, qword ptr [rdx + 0xb18]
0x1458f2643: cmp rsi, 4
0x1458f2647: ja 0x1458f269b
0x1458f2649: mov rcx, rbx
0x1458f264c: mov rdx, r14
0x1458f264f: call 0x1458095e0
0x1458f2654: imul rax, rax, 0xf0
0x1458f265b: lea rcx, [rip + 0x13ce6a6]
0x1458f2662: mov rax, qword ptr [rax + rcx + 0x88]
0x1458f266a: imul rcx, rsi, 0x68
0x1458f266e: movss xmm0, dword ptr [rax + rcx + 0x50]
0x1458f2674: mulss xmm0, dword ptr [rip + 0x601b7c]
0x1458f267c: lea r15, [rax + rcx]
0x1458f2680: movss xmm7, dword ptr [rdi + 0xb9c]
0x1458f2688: subss xmm0, xmm7
0x1458f268c: xorps xmm1, xmm1
0x1458f268f: ucomiss xmm0, xmm1
0x1458f2692: seta al
0x1458f2695: test al, al
0x1458f2697: je 0x1458f26c5
0x1458f2699: jmp 0x1458f26cd
0x1458f269b: movss xmm7, dword ptr [rdi + 0xb9c]
0x1458f26a3: movss xmm0, dword ptr [rdi + 0xbf8]
0x1458f26ab: subss xmm0, xmm7
0x1458f26af: xorps xmm1, xmm1
0x1458f26b2: ucomiss xmm0, xmm1
0x1458f26b5: seta al
0x1458f26b8: and al, byte ptr [rdi + 0xc34]
0x1458f26be: xor r15d, r15d
0x1458f26c1: test al, al
0x1458f26c3: jne 0x1458f26cd
0x1458f26c5: movss xmm0, dword ptr [rip + 0x5ed84b]
0x1458f26cd: movss dword ptr [rbp + 0x36c], xmm0
0x1458f26d5: mov dword ptr [rbp + 0x394], 0
0x1458f26df: mov dword ptr [rbp + 0x390], 0
0x1458f26e9: mov rax, qword ptr [rdi + 0x578]
0x1458f26f0: mov rcx, qword ptr [rdi + 0x580]
0x1458f26f7: test rcx, rcx
0x1458f26fa: je 0x1458f27e3
0x1458f2700: imul r8, rcx, 0x1e0
0x1458f2707: add r8, rax
0x1458f270a: xor edx, edx
0x1458f270c: lea r11, [rip + 0x1a3d5a0]
0x1458f2713: lea r10, [rip + 0x1a3d5a2]
0x1458f271a: xor r9d, r9d
0x1458f271d: mov r12, rax
0x1458f2720: cmp dword ptr [r12 + 0xb0], 0
0x1458f2729: je 0x1458f273c
0x1458f272b: add r12, 0x1e0
0x1458f2732: cmp r12, r8
0x1458f2735: jne 0x1458f2720
0x1458f2737: jmp 0x1458f27c9
0x1458f273c: cmp qword ptr [r12 + 0x18], -1
0x1458f2742: je 0x1458f279a
0x1458f2744: mov rsi, qword ptr [r12 + 0x30]
0x1458f2749: xor r13d, r13d
0x1458f274c: cmp byte ptr [rsi + 0x64], 0
0x1458f2750: mov rsi, r10
0x1458f2753: je 0x1458f27b3
0x1458f2755: mov qword ptr [rbp + 0x398], r15
0x1458f275c: mov r15, r10
0x1458f275f: mov r10, r14
0x1458f2762: mov r14, rbx
0x1458f2765: mov rbx, r11
0x1458f2768: mov r11d, dword ptr [rsi]
0x1458f276b: mov r13d, 0x74696c65
0x1458f2771: xor r11d, r13d
0x1458f2774: movzx esi, byte ptr [rsi + 4]
0x1458f2778: xor esi, 0x65
0x1458f277b: xor r13d, r13d
0x1458f277e: or esi, r11d
0x1458f2781: mov r11, rbx
0x1458f2784: mov rbx, r14
0x1458f2787: mov r14, r10
0x1458f278a: mov r10, r15
0x1458f278d: mov r15, qword ptr [rbp + 0x398]
0x1458f2794: sete r13b
0x1458f2798: jmp 0x1458f27b3
0x1458f279a: xor r13d, r13d
0x1458f279d: cmp qword ptr [r12 + 0x58], -1
0x1458f27a3: jne 0x1458f27b3
0x1458f27a5: cmp byte ptr [r12 + 0x1d8], 1
0x1458f27ae: mov rsi, r11
0x1458f27b1: je 0x1458f2755
0x1458f27b3: inc r9d
0x1458f27b6: add r12, 0x1e0
0x1458f27bd: add edx, r13d
0x1458f27c0: cmp r12, r8
0x1458f27c3: jne 0x1458f2720
0x1458f27c9: mov dword ptr [rbp + 0x394], r9d
0x1458f27d0: mov dword ptr [rbp + 0x390], edx
0x1458f27d6: cmp rcx, 1
0x1458f27da: jne 0x1458f27eb
0x1458f27dc: xor edx, edx
0x1458f27de: xor r8d, r8d
0x1458f27e1: jmp 0x1458f2855
0x1458f27e3: xor r8d, r8d
0x1458f27e6: jmp 0x1458f287e
0x1458f27eb: mov r9, rcx
0x1458f27ee: and r9, 0xfffffffffffffffe
0x1458f27f2: lea r10, [rax + 0x290]
0x1458f27f9: xor edx, edx
0x1458f27fb: xor r8d, r8d
0x1458f27fe: nop
0x1458f2800: cmp dword ptr [r10 - 0x1e0], 0
0x1458f2808: sete r11b
0x1458f280c: cmp qword ptr [r10 - 0x278], -1
0x1458f2814: setne sil
0x1458f2818: and sil, r11b
0x1458f281b: movzx r11d, sil
0x1458f281f: add r11, r8
0x1458f2822: cmp dword ptr [r10], 0
0x1458f2826: sete r8b
0x1458f282a: cmp qword ptr [r10 - 0x98], -1
0x1458f2832: setne sil
0x1458f2836: and sil, r8b
0x1458f2839: movzx r8d, sil
0x1458f283d: add r8, r11
0x1458f2840: add rdx, 2
0x1458f2844: add r10, 0x3c0
0x1458f284b: cmp r9, rdx
0x1458f284e: jne 0x1458f2800
0x1458f2850: test cl, 1
0x1458f2853: je 0x1458f287e
0x1458f2855: imul rdx, rdx, 0x1e0
0x1458f285c: cmp dword ptr [rax + rdx + 0xb0], 0
0x1458f2864: mov r9, r8
0x1458f2867: sete r8b
0x1458f286b: cmp qword ptr [rax + rdx + 0x18], -1
0x1458f2871: setne dl
0x1458f2874: and dl, r8b
0x1458f2877: movzx r8d, dl
0x1458f287b: add r8, r9
0x1458f287e: mov qword ptr [rbp + 0x2d8], r8
0x1458f2885: mov r12, qword ptr [rdi + 0x688]
0x1458f288c: test r12, r12
0x1458f288f: je 0x1458f28ac
0x1458f2891: mov r9, qword ptr [rdi + 0x680]
0x1458f2898: mov r8d, r12d
0x1458f289b: and r8d, 3
0x1458f289f: cmp r12, 4
0x1458f28a3: jae 0x1458f28b0
0x1458f28a5: xor r10d, r10d
0x1458f28a8: xor edx, edx
0x1458f28aa: jmp 0x1458f28e4
0x1458f28ac: xor edx, edx
0x1458f28ae: jmp 0x1458f290d
0x1458f28b0: mov r11, r12
0x1458f28b3: and r11, 0xfffffffffffffffc
0x1458f28b7: xor r10d, r10d
0x1458f28ba: mov rsi, r9
0x1458f28bd: xor edx, edx
0x1458f28bf: nop
0x1458f28c0: add rdx, qword ptr [rsi]
0x1458f28c3: add rdx, qword ptr [rsi + 0x28]
0x1458f28c7: add rdx, qword ptr [rsi + 0x50]
0x1458f28cb: add rdx, qword ptr [rsi + 0x78]
0x1458f28cf: add r10, 4
0x1458f28d3: add rsi, 0xa0
0x1458f28da: cmp r11, r10
0x1458f28dd: jne 0x1458f28c0
0x1458f28df: test r8, r8
0x1458f28e2: je 0x1458f290d
0x1458f28e4: lea r10, [r10 + r10*4]
0x1458f28e8: lea r9, [r9 + r10*8]
0x1458f28ec: shl r8d, 3
0x1458f28f0: lea r8, [r8 + r8*4]
0x1458f28f4: xor r10d, r10d
0x1458f28f7: nop word ptr [rax + rax]
0x1458f2900: add rdx, qword ptr [r9 + r10]
0x1458f2904: add r10, 0x28
0x1458f2908: cmp r8, r10
0x1458f290b: jne 0x1458f2900
0x1458f290d: mov qword ptr [rbp + 0x2d0], rdx
0x1458f2914: test rcx, rcx
0x1458f2917: je 0x1458f2926
0x1458f2919: cmp rcx, 1
0x1458f291d: jne 0x1458f292d
0x1458f291f: xor r8d, r8d
0x1458f2922: xor edx, edx
0x1458f2924: jmp 0x1458f29a1
0x1458f2926: xor edx, edx
0x1458f2928: jmp 0x1458f29d1
0x1458f292d: mov r9, rcx
0x1458f2930: and r9, 0xfffffffffffffffe
0x1458f2934: lea r10, [rax + 0x290]
0x1458f293b: xor r11d, r11d
0x1458f293e: xor r8d, r8d
0x1458f2941: xor edx, edx
0x1458f2943: nop word ptr cs:[rax + rax]
0x1458f2950: cmp qword ptr [r10 - 0x238], -1
0x1458f2958: movzx esi, byte ptr [r10 - 0x1e8]
0x1458f2960: cmove rsi, r11
0x1458f2964: cmp byte ptr [r10 - 0x1e0], 0
0x1458f296c: cmovne rsi, r11
0x1458f2970: add rsi, rdx
0x1458f2973: cmp qword ptr [r10 - 0x58], -1
0x1458f2978: movzx edx, byte ptr [r10 - 8]
0x1458f297d: cmove rdx, r11
0x1458f2981: cmp byte ptr [r10], 0
0x1458f2985: cmovne rdx, r11
0x1458f2989: add rdx, rsi
0x1458f298c: add r8, 2
0x1458f2990: add r10, 0x3c0
0x1458f2997: cmp r9, r8
0x1458f299a: jne 0x1458f2950
0x1458f299c: test cl, 1
0x1458f299f: je 0x1458f29d1
0x1458f29a1: mov rcx, rdx
0x1458f29a4: imul r8, r8, 0x1e0
0x1458f29ab: xor r9d, r9d
0x1458f29ae: cmp qword ptr [rax + r8 + 0x58], -1
0x1458f29b4: movzx edx, byte ptr [rax + r8 + 0xa8]
0x1458f29bd: cmove rdx, r9
0x1458f29c1: cmp byte ptr [rax + r8 + 0xb0], 0
0x1458f29ca: cmovne rdx, r9
0x1458f29ce: add rdx, rcx
0x1458f29d1: mov qword ptr [rbp + 0x2c8], rdx
0x1458f29d8: mov rdx, qword ptr [rdi + 0x6d0]
0x1458f29df: test rdx, rdx
0x1458f29e2: je 0x1458f2a03
0x1458f29e4: mov rcx, qword ptr [rdi + 0x6c8]
0x1458f29eb: mov eax, edx
0x1458f29ed: and eax, 3
0x1458f29f0: cmp rdx, 4
0x1458f29f4: jae 0x1458f2a10
0x1458f29f6: movsd xmm0, qword ptr [rip + 0x5f1262]
0x1458f29fe: xor r8d, r8d
0x1458f2a01: jmp 0x1458f2a62
0x1458f2a03: movsd xmm6, qword ptr [rip + 0x5f1255]
0x1458f2a0b: jmp 0x1458f2a97
0x1458f2a10: and rdx, 0xfffffffffffffffc
0x1458f2a14: lea r9, [rcx + 0x130]
0x1458f2a1b: movsd xmm0, qword ptr [rip + 0x5f123d]
0x1458f2a23: xor r8d, r8d
0x1458f2a26: nop word ptr cs:[rax + rax]
0x1458f2a30: addsd xmm0, qword ptr [r9 - 0xf0]
0x1458f2a39: addsd xmm0, qword ptr [r9 - 0xa0]
0x1458f2a42: addsd xmm0, qword ptr [r9 - 0x50]
0x1458f2a48: addsd xmm0, qword ptr [r9]
0x1458f2a4d: add r8, 4
0x1458f2a51: add r9, 0x140
0x1458f2a58: cmp rdx, r8
0x1458f2a5b: jne 0x1458f2a30
0x1458f2a5d: test rax, rax
0x1458f2a60: je 0x1458f2a8e
0x1458f2a62: lea rdx, [r8 + r8*4]
0x1458f2a66: shl rdx, 4
0x1458f2a6a: add rcx, rdx
0x1458f2a6d: add rcx, 0x40
0x1458f2a71: shl eax, 4
0x1458f2a74: lea rax, [rax + rax*4]
0x1458f2a78: xor edx, edx
0x1458f2a7a: nop word ptr [rax + rax]
0x1458f2a80: addsd xmm0, qword ptr [rcx + rdx]
0x1458f2a85: add rdx, 0x50
0x1458f2a89: cmp rax, rdx
0x1458f2a8c: jne 0x1458f2a80
0x1458f2a8e: call 0x145d14667
0x1458f2a93: movapd xmm6, xmm0
0x1458f2a97: mov rcx, rbx
0x1458f2a9a: mov rdx, r14
0x1458f2a9d: call 0x1458095e0
0x1458f2aa2: imul rax, rax, 0xf0
0x1458f2aa9: lea rcx, [rip + 0x13ce258]
0x1458f2ab0: mov rax, qword ptr [rax + rcx + 0x88]
0x1458f2ab8: cmp byte ptr [rax + 0x64], 0
0x1458f2abc: jne 0x1458f2b02
0x1458f2abe: cmp byte ptr [rax + 0xcc], 0
0x1458f2ac5: je 0x1458f2acd
0x1458f2ac7: add rax, 0x68
0x1458f2acb: jmp 0x1458f2b02
0x1458f2acd: cmp byte ptr [rax + 0x134], 0
0x1458f2ad4: je 0x1458f2ade
0x1458f2ad6: add rax, 0xd0
0x1458f2adc: jmp 0x1458f2b02
0x1458f2ade: cmp byte ptr [rax + 0x19c], 0
0x1458f2ae5: je 0x1458f2aef
0x1458f2ae7: add rax, 0x138
0x1458f2aed: jmp 0x1458f2b02
0x1458f2aef: cmp byte ptr [rax + 0x204], 1
0x1458f2af6: jne 0x1458f336c
0x1458f2afc: add rax, 0x1a0
0x1458f2b02: movss xmm9, dword ptr [rax + 0x50]
0x1458f2b08: mulss xmm9, dword ptr [rip + 0x6016e7]
0x1458f2b11: movss dword ptr [rbp + 0x368], xmm9
0x1458f2b1a: lea rcx, [rbp + 0x290]
0x1458f2b21: mov rdx, rdi
0x1458f2b24: call 0x145964e50
0x1458f2b29: movzx r13d, byte ptr [rdi + 0xc34]
0x1458f2b31: xorps xmm8, xmm8
0x1458f2b35: xorps xmm1, xmm1
0x1458f2b38: cmpnltss xmm1, xmm9
0x1458f2b3e: movss xmm0, dword ptr [rip + 0x5ed3d2]
0x1458f2b46: movaps xmm2, xmm0
0x1458f2b49: test r13b, 1
0x1458f2b4d: jne 0x1458f2b5d
0x1458f2b4f: subss xmm9, xmm7
0x1458f2b54: maxss xmm9, xmm8
0x1458f2b59: movaps xmm2, xmm9
0x1458f2b5d: movaps xmm3, xmm1
0x1458f2b60: andnps xmm3, xmm2
0x1458f2b63: andps xmm0, xmm1
0x1458f2b66: orps xmm0, xmm3
0x1458f2b69: movss dword ptr [rbp + 0x364], xmm0
0x1458f2b71: movzx eax, byte ptr [rdi + 0xc46]
0x1458f2b78: shl eax, 3
0x1458f2b7b: lea rcx, [rip + 0x1a3fca6]
0x1458f2b82: mov rcx, qword ptr [rax + rcx]
0x1458f2b86: lea rdx, [rip + 0x1a3fc6b]
0x1458f2b8d: mov rax, qword ptr [rax + rdx]
0x1458f2b91: mov qword ptr [rbp + 0x280], rcx
0x1458f2b98: mov ecx, dword ptr [rdi + 0x4f0]
0x1458f2b9e: cmp ecx, 1
0x1458f2ba1: adc ecx, -1
0x1458f2ba4: mov qword ptr [rbp + 0x288], rax
0x1458f2bab: xorps xmm1, xmm1
0x1458f2bae: cvtsi2ss xmm1, rcx
0x1458f2bb3: movss xmm2, dword ptr [rip + 0x5f2a05]
0x1458f2bbb: mulss xmm2, xmm1
0x1458f2bbf: addss xmm2, dword ptr [rip + 0x5ed639]
0x1458f2bc7: movss xmm0, dword ptr [rip + 0x5ed3f5]
0x1458f2bcf: mulss xmm0, xmm1
0x1458f2bd3: mulss xmm0, xmm1
0x1458f2bd7: addss xmm0, xmm2
0x1458f2bdb: call 0x145d1463d
0x1458f2be0: cvttss2si rax, xmm0
0x1458f2be5: xor ecx, ecx
0x1458f2be7: ucomiss xmm0, xmm8
0x1458f2beb: cmovae ecx, eax
0x1458f2bee: ucomiss xmm0, dword ptr [rip + 0x60dfbf]
0x1458f2bf5: mov eax, 0xffffffff
0x1458f2bfa: cmovbe eax, ecx
0x1458f2bfd: mov dword ptr [rbp + 0x360], eax
0x1458f2c03: movss xmm0, dword ptr [rdi + 0x4f8]
0x1458f2c0b: maxss xmm0, xmm8
0x1458f2c10: movss dword ptr [rbp + 0x35c], xmm0
0x1458f2c18: mov qword ptr [rbp + 0x2c0], r12
0x1458f2c1f: mov qword ptr [rbp + 0x2b8], 5
0x1458f2c2a: test r15, r15
0x1458f2c2d: je 0x1458f2cfa
0x1458f2c33: lea rax, [r15 + 0x40]
0x1458f2c37: mov qword ptr [rbp + 0x370], rax
0x1458f2c3e: lea rax, [rip + 0x4061bb]
0x1458f2c45: mov qword ptr [rbp + 0x378], rax
0x1458f2c4c: lea rdx, [rip + 0x13c2265]
0x1458f2c53: lea rcx, [rbp - 0x50]
0x1458f2c57: lea r8, [rbp + 0x370]
0x1458f2c5e: call 0x145ce7350
0x1458f2c63: mov rcx, qword ptr [rbp - 0x48]
0x1458f2c67: mov rdx, qword ptr [rbp - 0x40]
0x1458f2c6b: mov rbx, qword ptr [r15]
0x1458f2c6e: mov rsi, qword ptr [r15 + 8]
0x1458f2c72: mov qword ptr [rbp + 0x398], rcx
0x1458f2c79: call 0x1458dff90
0x1458f2c7e: nop
0x1458f2c7f: mov r14, rax
0x1458f2c82: mov rax, qword ptr [rbp - 0x50]
0x1458f2c86: test rax, rax
0x1458f2c89: je 0x1458f2ca6
0x1458f2c8b: mov r8d, 1
0x1458f2c91: mov rcx, qword ptr [rbp + 0x398]
0x1458f2c98: mov r15, rdx
0x1458f2c9b: mov rdx, rax
0x1458f2c9e: call 0x1400021d0
0x1458f2ca3: mov rdx, r15
0x1458f2ca6: test r14, r14
0x1458f2ca9: cmovne rbx, r14
0x1458f2cad: cmove rdx, rsi
0x1458f2cb1: mov qword ptr [rbp - 0x50], 0
0x1458f2cb9: mov qword ptr [rbp - 0x48], 1
0x1458f2cc1: mov qword ptr [rbp - 0x40], 0
0x1458f2cc9: test rdx, rdx
0x1458f2ccc: jne 0x1458f337a
0x1458f2cd2: add rdx, rbx
0x1458f2cd5: lea r8, [rbp - 0x50]
0x1458f2cd9: mov rcx, rbx
0x1458f2cdc: call 0x1459e6cb0
0x1458f2ce1: nop
0x1458f2ce2: mov rax, qword ptr [rbp - 0x40]
0x1458f2ce6: mov qword ptr [rbp + 0x380], rax
0x1458f2ced: movups xmm0, xmmword ptr [rbp - 0x50]
0x1458f2cf1: movaps xmmword ptr [rbp + 0x370], xmm0
0x1458f2cf8: jmp 0x1458f2d1b
0x1458f2cfa: mov qword ptr [rbp + 0x370], 0
0x1458f2d05: mov qword ptr [rbp + 0x378], 1
0x1458f2d10: mov qword ptr [rbp + 0x380], 0
0x1458f2d1b: mov byte ptr [rbp + 0x3a7], r13b
0x1458f2d22: movzx eax, byte ptr [rdi + 0xab8]
0x1458f2d29: mov byte ptr [rbp + 0x3a6], al
0x1458f2d2f: xor ebx, ebx
0x1458f2d31: cmp dword ptr [rdi + 0x558], 0
0x1458f2d38: mov ecx, 0
0x1458f2d3d: jne 0x1458f2de4
0x1458f2d43: mov r8d, dword ptr [rdi + 0x55c]
0x1458f2d4a: mov eax, 1
0x1458f2d4f: test r8d, r8d
0x1458f2d52: je 0x1458f2dcd
0x1458f2d54: test r8b, 1
0x1458f2d58: je 0x1458f2d65
0x1458f2d5a: mov eax, 3
0x1458f2d5f: cmp r8d, 1
0x1458f2d63: je 0x1458f2dcd
0x1458f2d65: test r8b, 2
0x1458f2d69: je 0x1458f2d79
0x1458f2d6b: lea eax, [rax + rax*8]
0x1458f2d6e: mov ecx, r8d
0x1458f2d71: and ecx, 0xfffffffe
0x1458f2d74: cmp ecx, 2
0x1458f2d77: je 0x1458f2dcd
0x1458f2d79: test r8b, 4
0x1458f2d7d: je 0x1458f2d90
0x1458f2d7f: lea eax, [rax + rax*8]
0x1458f2d82: lea eax, [rax + rax*8]
0x1458f2d85: mov ecx, r8d
0x1458f2d88: and ecx, 0xfffffffc
0x1458f2d8b: cmp ecx, 4
0x1458f2d8e: je 0x1458f2dcd
0x1458f2d90: test r8b, 8
0x1458f2d94: je 0x1458f2da7
0x1458f2d96: imul eax, eax, 0x19a1
0x1458f2d9c: mov ecx, r8d
0x1458f2d9f: and ecx, 0xfffffff8
0x1458f2da2: cmp ecx, 8
0x1458f2da5: je 0x1458f2dcd
0x1458f2da7: mov r9b, 1
0x1458f2daa: mov ecx, 0xffffff9c
0x1458f2daf: test r8b, 0x10
0x1458f2db3: je 0x1458f2dda
0x1458f2db5: mov edx, 0x290d741
0x1458f2dba: mul edx
0x1458f2dbc: seto dl
0x1458f2dbf: and r8d, 0xfffffff0
0x1458f2dc3: cmp r8d, 0x10
0x1458f2dc7: jne 0x1458f2dda
0x1458f2dc9: test dl, dl
0x1458f2dcb: jne 0x1458f2dda
0x1458f2dcd: mov ecx, 0x64
0x1458f2dd2: mul ecx
0x1458f2dd4: mov ecx, eax
0x1458f2dd6: seto r9b
0x1458f2dda: test r9b, 1
0x1458f2dde: jne 0x1458f33b3
0x1458f2de4: mov dword ptr [rbp + 0x358], ecx
0x1458f2dea: movsd qword ptr [rbp + 0x2b0], xmm6
0x1458f2df2: movsd xmm0, qword ptr [rdi + 0x758]
0x1458f2dfa: call 0x145d14667
0x1458f2dff: movsd qword ptr [rbp + 0x2a8], xmm0
0x1458f2e07: mov eax, dword ptr [rdi + 0xbb0]
0x1458f2e0d: mov ecx, dword ptr [rdi + 0xbb4]
0x1458f2e13: add ecx, eax
0x1458f2e15: add ecx, dword ptr [rdi + 0xbb8]
0x1458f2e1b: cmp byte ptr [rdi + 0xc38], 0
0x1458f2e22: mov dword ptr [rbp + 0x354], ecx
0x1458f2e28: cmovne ebx, eax
0x1458f2e2b: mov dword ptr [rbp + 0x350], ebx
0x1458f2e31: mov rsi, qword ptr [rbp + 0x290]
0x1458f2e38: xorps xmm7, xmm7
0x1458f2e3b: xorps xmm0, xmm0
0x1458f2e3e: test rsi, rsi
0x1458f2e41: mov rax, qword ptr [rbp + 0x298]
0x1458f2e48: cmove rax, rsi
0x1458f2e4c: mov ecx, 1
0x1458f2e51: cmovne rcx, rsi
0x1458f2e55: mov qword ptr [rbp + 0x270], rcx
0x1458f2e5c: mov qword ptr [rbp + 0x278], rax
0x1458f2e63: je 0x1458f2e82
0x1458f2e65: movss xmm6, dword ptr [rip + 0x5ed553]
0x1458f2e6d: movss xmm0, dword ptr [rbp + 0x2a0]
0x1458f2e75: mulss xmm0, xmm6
0x1458f2e79: call 0x145d1463d
0x1458f2e7e: divss xmm0, xmm6
0x1458f2e82: lea rax, [rdi + 0xb18]
0x1458f2e89: mov qword ptr [rbp + 0x328], rax
0x1458f2e90: lea rbx, [rdi + 0xb9c]
0x1458f2e97: lea r13, [rdi + 0x4f0]
0x1458f2e9e: lea r12, [rdi + 0x4f4]
0x1458f2ea5: lea r15, [rdi + 0x490]
0x1458f2eac: lea r14, [rdi + 0x4fc]
0x1458f2eb3: lea rax, [rdi + 0x500]
0x1458f2eba: mov qword ptr [rbp + 0x338], rax
0x1458f2ec1: lea rax, [rdi + 0x79c]
0x1458f2ec8: mov qword ptr [rbp + 0x330], rax
0x1458f2ecf: lea rax, [rdi + 0x554]
0x1458f2ed6: mov qword ptr [rbp + 0x320], rax
0x1458f2edd: lea rax, [rdi + 0x558]
0x1458f2ee4: mov qword ptr [rbp + 0x318], rax
0x1458f2eeb: lea rax, [rdi + 0xbf4]
0x1458f2ef2: mov qword ptr [rbp + 0x300], rax
0x1458f2ef9: lea rax, [rdi + 0x7a8]
0x1458f2f00: mov qword ptr [rbp + 0x2e8], rax
0x1458f2f07: movss dword ptr [rbp + 0x34c], xmm0
0x1458f2f0f: xorps xmm0, xmm0
0x1458f2f12: lea rax, [rdi + 0x7a4]
0x1458f2f19: mov qword ptr [rbp + 0x310], rax
0x1458f2f20: lea rax, [rdi + 0x7a0]
0x1458f2f27: mov qword ptr [rbp + 0x308], rax
0x1458f2f2e: lea rax, [rdi + 0x7b0]
0x1458f2f35: mov qword ptr [rbp + 0x2f8], rax
0x1458f2f3c: lea rax, [rdi + 0x7ac]
0x1458f2f43: mov qword ptr [rbp + 0x2f0], rax
0x1458f2f4a: test rsi, rsi
0x1458f2f4d: je 0x1458f2f57
0x1458f2f4f: movss xmm0, dword ptr [rbp + 0x2a4]
0x1458f2f57: movss dword ptr [rbp + 0x348], xmm0
0x1458f2f5f: lea rax, [rdi + 0x4e0]
0x1458f2f66: mov qword ptr [rbp + 0x398], rax
0x1458f2f6d: lea rsi, [rdi + 0x4e4]
0x1458f2f74: movss xmm0, dword ptr [rdi + 0x4ec]
0x1458f2f7c: add rdi, 0x4e8
0x1458f2f83: movss xmm6, dword ptr [rip + 0x5f0cc9]
0x1458f2f8b: movaps xmm1, xmm6
0x1458f2f8e: call 0x145d14643
0x1458f2f93: mov qword ptr [rbp - 0x50], rbx
0x1458f2f97: lea rax, [rip + 0x405162]
0x1458f2f9e: mov qword ptr [rbp - 0x48], rax
0x1458f2fa2: lea rcx, [rbp + 0x280]
0x1458f2fa9: mov qword ptr [rbp - 0x40], rcx
0x1458f2fad: lea rcx, [rip - 0x58f0ef4]
0x1458f2fb4: mov qword ptr [rbp - 0x38], rcx
0x1458f2fb8: mov qword ptr [rbp - 0x30], r13
0x1458f2fbc: lea rdx, [rip + 0x405e3d]
0x1458f2fc3: mov qword ptr [rbp - 0x28], rdx
0x1458f2fc7: mov qword ptr [rbp - 0x20], r12
0x1458f2fcb: mov qword ptr [rbp - 0x18], rdx
0x1458f2fcf: lea r8, [rbp + 0x360]
0x1458f2fd6: mov qword ptr [rbp - 0x10], r8
0x1458f2fda: mov qword ptr [rbp - 8], rdx
0x1458f2fde: lea r8, [rbp + 0x35c]
0x1458f2fe5: mov qword ptr [rbp], r8
0x1458f2fe9: mov qword ptr [rbp + 8], rax
0x1458f2fed: mov qword ptr [rbp + 0x10], r15
0x1458f2ff1: mov qword ptr [rbp + 0x18], rax
0x1458f2ff5: mov qword ptr [rbp + 0x20], r14
0x1458f2ff9: mov qword ptr [rbp + 0x28], rax
0x1458f2ffd: mov r8, qword ptr [rbp + 0x338]
0x1458f3004: mov qword ptr [rbp + 0x30], r8
0x1458f3008: mov qword ptr [rbp + 0x38], rdx
0x1458f300c: mov r8, qword ptr [rbp + 0x330]
0x1458f3013: mov qword ptr [rbp + 0x40], r8
0x1458f3017: mov qword ptr [rbp + 0x48], rdx
0x1458f301b: lea r8, [rbp + 0x394]
0x1458f3022: mov qword ptr [rbp + 0x50], r8
0x1458f3026: mov qword ptr [rbp + 0x58], rdx
0x1458f302a: lea r8, [rbp + 0x390]
0x1458f3031: mov qword ptr [rbp + 0x60], r8
0x1458f3035: mov qword ptr [rbp + 0x68], rdx
0x1458f3039: lea r8, [rbp + 0x2d8]
0x1458f3040: mov qword ptr [rbp + 0x70], r8
0x1458f3044: lea r8, [rip + 0x406ca5]
0x1458f304b: mov qword ptr [rbp + 0x78], r8
0x1458f304f: lea r9, [rbp + 0x2d0]
0x1458f3056: mov qword ptr [rbp + 0x80], r9
0x1458f305d: mov qword ptr [rbp + 0x88], r8
0x1458f3064: lea r9, [rbp + 0x2c8]
0x1458f306b: mov qword ptr [rbp + 0x90], r9
0x1458f3072: mov qword ptr [rbp + 0x98], r8
0x1458f3079: lea r9, [rbp + 0x2c0]
0x1458f3080: mov qword ptr [rbp + 0xa0], r9
0x1458f3087: mov qword ptr [rbp + 0xa8], r8
0x1458f308e: mov r9, qword ptr [rbp + 0x328]
0x1458f3095: mov qword ptr [rbp + 0xb0], r9
0x1458f309c: mov qword ptr [rbp + 0xb8], r8
0x1458f30a3: lea r9, [rbp + 0x2b8]
0x1458f30aa: mov qword ptr [rbp + 0xc0], r9
0x1458f30b1: mov qword ptr [rbp + 0xc8], r8
0x1458f30b8: lea r8, [rbp + 0x36c]
0x1458f30bf: mov qword ptr [rbp + 0xd0], r8
0x1458f30c6: mov qword ptr [rbp + 0xd8], rax
0x1458f30cd: lea r8, [rbp + 0x370]
0x1458f30d4: mov qword ptr [rbp + 0xe0], r8
0x1458f30db: lea r8, [rip - 0x58f1002]
0x1458f30e2: mov qword ptr [rbp + 0xe8], r8
0x1458f30e9: lea r8, [rbp + 0x368]
0x1458f30f0: mov qword ptr [rbp + 0xf0], r8
0x1458f30f7: mov qword ptr [rbp + 0xf8], rax
0x1458f30fe: lea r8, [rbp + 0x364]
0x1458f3105: mov qword ptr [rbp + 0x100], r8
0x1458f310c: mov qword ptr [rbp + 0x108], rax
0x1458f3113: lea r8, [rbp + 0x3a7]
0x1458f311a: mov qword ptr [rbp + 0x110], r8
0x1458f3121: lea r8, [rip + 0x402608]
0x1458f3128: mov qword ptr [rbp + 0x118], r8
0x1458f312f: lea r9, [rbp + 0x3a6]
0x1458f3136: mov qword ptr [rbp + 0x120], r9
0x1458f313d: mov qword ptr [rbp + 0x128], r8
0x1458f3144: mov r8, qword ptr [rbp + 0x320]
0x1458f314b: mov qword ptr [rbp + 0x130], r8
0x1458f3152: mov qword ptr [rbp + 0x138], rdx
0x1458f3159: mov r8, qword ptr [rbp + 0x318]
0x1458f3160: mov qword ptr [rbp + 0x140], r8
0x1458f3167: mov qword ptr [rbp + 0x148], rdx
0x1458f316e: lea r8, [rbp + 0x358]
0x1458f3175: mov qword ptr [rbp + 0x150], r8
0x1458f317c: mov qword ptr [rbp + 0x158], rdx
0x1458f3183: mov r8, qword ptr [rbp + 0x300]
0x1458f318a: mov qword ptr [rbp + 0x160], r8
0x1458f3191: mov qword ptr [rbp + 0x168], rdx
0x1458f3198: lea r8, [rbp + 0x2b0]
0x1458f319f: mov qword ptr [rbp + 0x170], r8
0x1458f31a6: lea r8, [rip + 0x4057e3]
0x1458f31ad: mov qword ptr [rbp + 0x178], r8
0x1458f31b4: mov r9, qword ptr [rbp + 0x2e8]
0x1458f31bb: mov qword ptr [rbp + 0x180], r9
0x1458f31c2: mov qword ptr [rbp + 0x188], rdx
0x1458f31c9: mov r9, qword ptr [rbp + 0x310]
0x1458f31d0: mov qword ptr [rbp + 0x190], r9
0x1458f31d7: mov qword ptr [rbp + 0x198], rdx
0x1458f31de: mov r9, qword ptr [rbp + 0x308]
0x1458f31e5: mov qword ptr [rbp + 0x1a0], r9
0x1458f31ec: mov qword ptr [rbp + 0x1a8], rdx
0x1458f31f3: mov r9, qword ptr [rbp + 0x2f8]
0x1458f31fa: mov qword ptr [rbp + 0x1b0], r9
0x1458f3201: mov qword ptr [rbp + 0x1b8], rdx
0x1458f3208: lea r9, [rbp + 0x2a8]
0x1458f320f: mov qword ptr [rbp + 0x1c0], r9
0x1458f3216: mov qword ptr [rbp + 0x1c8], r8
0x1458f321d: mov r8, qword ptr [rbp + 0x2f0]
0x1458f3224: mov qword ptr [rbp + 0x1d0], r8
0x1458f322b: mov qword ptr [rbp + 0x1d8], rdx
0x1458f3232: lea r8, [rbp + 0x354]
0x1458f3239: mov qword ptr [rbp + 0x1e0], r8
0x1458f3240: mov qword ptr [rbp + 0x1e8], rdx
0x1458f3247: lea r8, [rbp + 0x350]
0x1458f324e: mov qword ptr [rbp + 0x1f0], r8
0x1458f3255: mov qword ptr [rbp + 0x1f8], rdx
0x1458f325c: lea rdx, [rbp + 0x270]
0x1458f3263: mov qword ptr [rbp + 0x200], rdx
0x1458f326a: mov qword ptr [rbp + 0x208], rcx
0x1458f3271: lea rcx, [rbp + 0x34c]
0x1458f3278: mov qword ptr [rbp + 0x210], rcx
0x1458f327f: mov qword ptr [rbp + 0x218], rax
0x1458f3286: lea rcx, [rbp + 0x348]
0x1458f328d: mov qword ptr [rbp + 0x220], rcx
0x1458f3294: mov qword ptr [rbp + 0x228], rax
0x1458f329b: mov rcx, qword ptr [rbp + 0x398]
0x1458f32a2: mov qword ptr [rbp + 0x230], rcx
0x1458f32a9: mov qword ptr [rbp + 0x238], rax
0x1458f32b0: mov qword ptr [rbp + 0x240], rsi
0x1458f32b7: mov qword ptr [rbp + 0x248], rax
0x1458f32be: mov qword ptr [rbp + 0x250], rdi
0x1458f32c5: mov qword ptr [rbp + 0x258], rax
0x1458f32cc: lea rcx, [rbp + 0x344]
0x1458f32d3: mov qword ptr [rbp + 0x260], rcx
0x1458f32da: mov qword ptr [rbp + 0x268], rax
0x1458f32e1: addss xmm6, xmm0
0x1458f32e5: movaps xmm1, xmm0
0x1458f32e8: cmpltss xmm1, xmm7
0x1458f32ed: andps xmm6, xmm1
0x1458f32f0: andnps xmm1, xmm0
0x1458f32f3: orps xmm1, xmm6
0x1458f32f6: movss dword ptr [rbp + 0x344], xmm1
0x1458f32fe: lea rdx, [rip + 0x1a3c834]
0x1458f3305: lea r8, [rbp - 0x50]
0x1458f3309: mov rsi, qword ptr [rbp + 0x2e0]
0x1458f3310: mov rcx, rsi
0x1458f3313: call 0x145ce7350
0x1458f3318: nop
0x1458f3319: mov rdx, qword ptr [rbp + 0x370]
0x1458f3320: test rdx, rdx
0x1458f3323: je 0x1458f3337
0x1458f3325: mov rcx, qword ptr [rbp + 0x378]
0x1458f332c: mov r8d, 1
0x1458f3332: call 0x1400021d0
0x1458f3337: mov rax, rsi
0x1458f333a: movaps xmm6, xmmword ptr [rbp + 0x3b0]
0x1458f3341: movaps xmm7, xmmword ptr [rbp + 0x3c0]
0x1458f3348: movaps xmm8, xmmword ptr [rbp + 0x3d0]
0x1458f3350: movaps xmm9, xmmword ptr [rbp + 0x3e0]
0x1458f3358: add rsp, 0x478
0x1458f335f: pop rbx
0x1458f3360: pop rdi
0x1458f3361: pop rsi
0x1458f3362: pop r12
0x1458f3364: pop r13
0x1458f3366: pop r14
0x1458f3368: pop r15
0x1458f336a: pop rbp
0x1458f336b: ret
0x1458f336c: movss xmm9, dword ptr [rip + 0x5ecba3]
0x1458f3375: jmp 0x1458f2b11
0x1458f337a: mov r8, rdx
0x1458f337d: shr r8, 2
0x1458f3381: mov eax, edx
0x1458f3383: and eax, 3
0x1458f3386: cmp rax, 1
0x1458f338a: sbb r8, -1
0x1458f338e: mov qword ptr [rsp + 0x20], 1
0x1458f3397: lea rcx, [rbp - 0x50]
0x1458f339b: mov r9d, 1
0x1458f33a1: mov rsi, rdx
0x1458f33a4: xor edx, edx
0x1458f33a6: call 0x145d14a10
0x1458f33ab: mov rdx, rsi
0x1458f33ae: jmp 0x1458f2cd2
0x1458f33b3: mov ecx, 0xffffffff
0x1458f33b8: jmp 0x1458f2de4
