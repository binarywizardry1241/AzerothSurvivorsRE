0x1402c25f0: push rbp
0x1402c25f1: push rsi
0x1402c25f2: push rdi
0x1402c25f3: push rbx
0x1402c25f4: sub rsp, 0x3e8
0x1402c25fb: lea rbp, [rsp + 0x80]
0x1402c2603: mov qword ptr [rbp + 0x360], 0xfffffffffffffffe
0x1402c260e: mov rsi, rdx
0x1402c2611: mov rdi, rcx
0x1402c2614: movaps xmm0, xmmword ptr [rbp + 0x3b0]
0x1402c261b: movups xmmword ptr [rbp + 0x278], xmm0
0x1402c2622: cmp r8d, 1
0x1402c2626: jne 0x1402c2675
0x1402c2628: cmp r9d, 0x64
0x1402c262c: jae 0x1402c26d8
0x1402c2632: mov dword ptr [rbp - 0x60], r9d
0x1402c2636: lea rax, [rbp - 0x60]
0x1402c263a: mov qword ptr [rbp + 0x80], rax
0x1402c2641: lea rax, [rip + 0x5d838d8]
0x1402c2648: mov qword ptr [rbp + 0x88], rax
0x1402c264f: lea rdx, [rip + 0x5fb6ad6]
0x1402c2656: lea rcx, [rbp + 0x340]
0x1402c265d: lea r8, [rbp + 0x80]
0x1402c2664: call 0x146034470
0x1402c2669: movups xmm0, xmmword ptr [rip + 0x5fb6ac4]
0x1402c2670: jmp 0x1402c275f
0x1402c2675: call 0x140002200
0x1402c267a: mov ecx, 6
0x1402c267f: mov edx, 1
0x1402c2684: call 0x1400021c0
0x1402c2689: test rax, rax
0x1402c268c: je 0x1402c2ab3
0x1402c2692: mov word ptr [rax + 4], 0x736d
0x1402c2698: mov dword ptr [rax], 0x20a680e2
0x1402c269e: mov qword ptr [rbp + 0x340], 6
0x1402c26a9: mov qword ptr [rbp + 0x348], rax
0x1402c26b0: mov qword ptr [rbp + 0x350], 6
0x1402c26bb: movups xmm0, xmmword ptr [rip + 0x5fb6a56]
0x1402c26c2: movaps xmmword ptr [rbp + 0x80], xmm0
0x1402c26c9: mov dword ptr [rbp + 0x90], 0x3f0ccccd
0x1402c26d3: jmp 0x1402c2770
0x1402c26d8: cmp r9d, 0xc8
0x1402c26df: jae 0x1402c2721
0x1402c26e1: mov dword ptr [rbp - 0x60], r9d
0x1402c26e5: lea rax, [rbp - 0x60]
0x1402c26e9: mov qword ptr [rbp + 0x80], rax
0x1402c26f0: lea rax, [rip + 0x5d83829]
0x1402c26f7: mov qword ptr [rbp + 0x88], rax
0x1402c26fe: lea rdx, [rip + 0x5fb6a27]
0x1402c2705: lea rcx, [rbp + 0x340]
0x1402c270c: lea r8, [rbp + 0x80]
0x1402c2713: call 0x146034470
0x1402c2718: movups xmm0, xmmword ptr [rip + 0x5fb5f85]
0x1402c271f: jmp 0x1402c275f
0x1402c2721: mov dword ptr [rbp - 0x60], r9d
0x1402c2725: lea rax, [rbp - 0x60]
0x1402c2729: mov qword ptr [rbp + 0x80], rax
0x1402c2730: lea rax, [rip + 0x5d837e9]
0x1402c2737: mov qword ptr [rbp + 0x88], rax
0x1402c273e: lea rdx, [rip + 0x5fb69e7]
0x1402c2745: lea rcx, [rbp + 0x340]
0x1402c274c: lea r8, [rbp + 0x80]
0x1402c2753: call 0x146034470
0x1402c2758: movups xmm0, xmmword ptr [rip + 0x5fb61e9]
0x1402c275f: movaps xmmword ptr [rbp + 0x80], xmm0
0x1402c2766: mov dword ptr [rbp + 0x90], 0x3f800000
0x1402c2770: mov eax, dword ptr [rbp + 0x90]
0x1402c2776: mov dword ptr [rbp + 0x330], eax
0x1402c277c: movaps xmm0, xmmword ptr [rbp + 0x80]
0x1402c2783: movaps xmmword ptr [rbp + 0x320], xmm0
0x1402c278a: mov rax, qword ptr [rbp + 0x340]
0x1402c2791: mov qword ptr [rbp + 0x338], rax
0x1402c2798: mov rax, qword ptr [rbp + 0x348]
0x1402c279f: mov qword ptr [rbp + 0x318], rax
0x1402c27a6: movups xmm0, xmmword ptr [rip + 0x5fb56eb]
0x1402c27ad: movaps xmmword ptr [rbp + 0x2a0], xmm0
0x1402c27b4: mov qword ptr [rbp + 0x2b0], 0
0x1402c27bf: movups xmm0, xmmword ptr [rip + 0x5fb56ea]
0x1402c27c6: movups xmmword ptr [rbp + 0x2b8], xmm0
0x1402c27cd: mov qword ptr [rbp + 0x2c8], 0
0x1402c27d8: movups xmm0, xmmword ptr [rip + 0x5fb56e9]
0x1402c27df: movaps xmmword ptr [rbp + 0x2d0], xmm0
0x1402c27e6: mov qword ptr [rbp + 0x2e0], 0
0x1402c27f1: movups xmm0, xmmword ptr [rip + 0x5fb56e8]
0x1402c27f8: movups xmmword ptr [rbp + 0x2e8], xmm0
0x1402c27ff: mov qword ptr [rbp + 0x2f8], 0
0x1402c280a: movaps xmm0, xmmword ptr [rbp + 0x320]
0x1402c2811: movups xmmword ptr [rbp + 0x244], xmm0
0x1402c2818: movaps xmm0, xmmword ptr [rbp + 0x320]
0x1402c281f: movups xmmword ptr [rbp + 0x290], xmm0
0x1402c2826: movaps xmm0, xmmword ptr [rbp + 0x320]
0x1402c282d: movups xmmword ptr [rbp + 0x21c], xmm0
0x1402c2834: movaps xmm0, xmmword ptr [rbp + 0x320]
0x1402c283b: movups xmmword ptr [rbp + 0x230], xmm0
0x1402c2842: mov rax, qword ptr [rbp + 0x2f0]
0x1402c2849: mov qword ptr [rbp - 0x10], rax
0x1402c284d: mov rax, qword ptr [rbp + 0x2f8]
0x1402c2854: mov qword ptr [rbp - 8], rax
0x1402c2858: mov rax, qword ptr [rbp + 0x2e0]
0x1402c285f: mov qword ptr [rbp - 0x20], rax
0x1402c2863: mov rax, qword ptr [rbp + 0x2e8]
0x1402c286a: mov qword ptr [rbp - 0x18], rax
0x1402c286e: movaps xmm0, xmmword ptr [rbp + 0x2a0]
0x1402c2875: movaps xmm1, xmmword ptr [rbp + 0x2b0]
0x1402c287c: movaps xmm2, xmmword ptr [rbp + 0x2c0]
0x1402c2883: movaps xmm3, xmmword ptr [rbp + 0x2d0]
0x1402c288a: movaps xmmword ptr [rbp - 0x30], xmm3
0x1402c288e: movaps xmmword ptr [rbp - 0x40], xmm2
0x1402c2892: movaps xmmword ptr [rbp - 0x50], xmm1
0x1402c2896: movaps xmmword ptr [rbp - 0x60], xmm0
0x1402c289a: xorps xmm0, xmm0
0x1402c289d: movaps xmmword ptr [rbp + 0x40], xmm0
0x1402c28a1: movaps xmmword ptr [rbp + 0x30], xmm0
0x1402c28a5: movaps xmmword ptr [rbp + 0x20], xmm0
0x1402c28a9: movaps xmmword ptr [rbp + 0x10], xmm0
0x1402c28ad: movaps xmmword ptr [rbp], xmm0
0x1402c28b1: mov qword ptr [rbp + 0x50], 0
0x1402c28b9: movups xmm1, xmmword ptr [rip + 0x5fb56a0]
0x1402c28c0: movups xmmword ptr [rbp + 0x68], xmm1
0x1402c28c4: movups xmm1, xmmword ptr [rip + 0x5fb5685]
0x1402c28cb: movups xmmword ptr [rbp + 0x58], xmm1
0x1402c28cf: mov qword ptr [rbp + 0x310], 0
0x1402c28da: mov qword ptr [rbp + 0x30a], 0
0x1402c28e5: movups xmmword ptr [rbp + 0x258], xmm0
0x1402c28ec: mov rbx, qword ptr [rdi]
0x1402c28ef: add rdi, 8
0x1402c28f3: lea rcx, [rbp + 0x88]
0x1402c28fa: lea rdx, [rbp - 0x60]
0x1402c28fe: mov r8d, 0xd8
0x1402c2904: call 0x14606171b
0x1402c2909: movaps xmm0, xmmword ptr [rip + 0x5f70790]
0x1402c2910: movups xmmword ptr [rbp + 0x160], xmm0
0x1402c2917: movaps xmm0, xmmword ptr [rip + 0x5f89d62]
0x1402c291e: movups xmmword ptr [rbp + 0x170], xmm0
0x1402c2925: movaps xmm0, xmmword ptr [rip + 0x5f70684]
0x1402c292c: movups xmmword ptr [rbp + 0x180], xmm0
0x1402c2933: movups xmmword ptr [rbp + 0x190], xmm0
0x1402c293a: movaps xmm0, xmmword ptr [rip + 0x5f89f6f]
0x1402c2941: movups xmmword ptr [rbp + 0x1a0], xmm0
0x1402c2948: movups xmmword ptr [rbp + 0x1b0], xmm0
0x1402c294f: movaps xmm0, xmmword ptr [rip + 0x5f705fa]
0x1402c2956: movups xmmword ptr [rbp + 0x1c0], xmm0
0x1402c295d: mov dword ptr [rbp + 0x1d0], 1
0x1402c2967: movss xmm0, dword ptr [rip + 0x5f89fc1]
0x1402c296f: movlps qword ptr [rbp + 0x1d4], xmm0
0x1402c2976: mov byte ptr [rbp + 0x1dc], 1
0x1402c297d: movzx eax, byte ptr [rbp + 0x317]
0x1402c2984: mov byte ptr [rbp + 0x1ed], al
0x1402c298a: movups xmm0, xmmword ptr [rbp + 0x307]
0x1402c2991: movups xmmword ptr [rbp + 0x1dd], xmm0
0x1402c2998: mov dword ptr [rbp + 0x1ee], 0x10000
0x1402c29a2: mov word ptr [rbp + 0x1f2], 0
0x1402c29ab: mov word ptr [rbp + 0x1f8], 0
0x1402c29b4: mov dword ptr [rbp + 0x1f4], 0x10000
0x1402c29be: mov qword ptr [rbp + 0x1fa], 0
0x1402c29c9: mov dword ptr [rbp + 0x202], 5
0x1402c29d3: movups xmm0, xmmword ptr [rbp + 0x28e]
0x1402c29da: movups xmmword ptr [rbp + 0x206], xmm0
0x1402c29e1: movzx eax, word ptr [rbp + 0x29e]
0x1402c29e8: mov word ptr [rbp + 0x216], ax
0x1402c29ef: mov dword ptr [rbp + 0x218], 0x3ee66666
0x1402c29f9: mov dword ptr [rbp + 0x22c], 0x3ee66666
0x1402c2a03: mov dword ptr [rbp + 0x240], 0x3ee66666
0x1402c2a0d: mov dword ptr [rbp + 0x254], 0x3ee66666
0x1402c2a17: mov dword ptr [rbp + 0x268], 0x3eb33333
0x1402c2a21: mov qword ptr [rbp + 0x80], rbx
0x1402c2a28: mov byte ptr [rbp + 0x35f], 0
0x1402c2a2f: lea r9, [rip + 0x5fafe1a]
0x1402c2a36: lea rcx, [rbp + 0x2a0]
0x1402c2a3d: lea r8, [rbp + 0x80]
0x1402c2a44: mov rdx, rdi
0x1402c2a47: call 0x1402f4d30
0x1402c2a4c: nop 
0x1402c2a4d: lea rax, [rbp + 0x320]
0x1402c2a54: mov qword ptr [rbp + 0x98], rax
0x1402c2a5b: mov qword ptr [rbp + 0xa0], rsi
0x1402c2a62: movups xmm0, xmmword ptr [rbp + 0x340]
0x1402c2a69: movaps xmmword ptr [rbp + 0x80], xmm0
0x1402c2a70: mov rax, qword ptr [rbp + 0x350]
0x1402c2a77: mov qword ptr [rbp + 0x90], rax
0x1402c2a7e: lea rax, [rbp + 0x278]
0x1402c2a85: mov qword ptr [rbp + 0xa8], rax
0x1402c2a8c: mov byte ptr [rbp + 0x35f], 1
0x1402c2a93: lea rcx, [rbp + 0x2a0]
0x1402c2a9a: lea rdx, [rbp + 0x80]
0x1402c2aa1: call 0x14033fea0
0x1402c2aa6: nop 
0x1402c2aa7: add rsp, 0x3e8
0x1402c2aae: pop rbx
0x1402c2aaf: pop rdi
0x1402c2ab0: pop rsi
0x1402c2ab1: pop rbp
0x1402c2ab2: ret 
0x1402c2ab3: mov ecx, 1
0x1402c2ab8: mov edx, 6
0x1402c2abd: call 0x14620896b
0x1402c2ac2: ud2 
