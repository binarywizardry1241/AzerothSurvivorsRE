0x14587b322: mov rax, qword ptr [rbp + 0xdd0]
0x14587b329: cmp dword ptr [rax], 3
0x14587b32c: jne 0x14587d54c
0x14587b332: mov rax, qword ptr [rbp + 0xe00]
0x14587b339: mov rdx, qword ptr [rax + 0xc98]
0x14587b340: cmp r12, rdx
0x14587b343: jae 0x14587dffa
0x14587b349: mov rcx, qword ptr [rax + 0xc90]
0x14587b350: imul rsi, r12, 0x478
0x14587b357: lea rax, [rcx + rsi]
0x14587b35b: movapd xmm10, xmm6
0x14587b360: subsd xmm10, qword ptr [rcx + rsi + 0x230]
0x14587b36a: ucomisd xmm10, xmm7
0x14587b36f: jb 0x14587b379
0x14587b371: movsd qword ptr [rax + 0x230], xmm6
0x14587b379: movapd xmm0, xmm6
0x14587b37d: subsd xmm0, qword ptr [rcx + rsi + 0x238]
0x14587b386: ucomisd xmm0, xmm8
0x14587b38b: jb 0x14587b395
0x14587b38d: movsd qword ptr [rax + 0x238], xmm6
0x14587b395: mov rax, qword ptr [rax + 0x240]
0x14587b39c: mov qword ptr [rbp + 0xc78], rax
0x14587b3a3: mov rax, qword ptr [rbp + 0xdc0]
0x14587b3aa: cmp dword ptr [rax], 2
0x14587b3ad: je 0x14587d54c
0x14587b3b3: ucomisd xmm0, xmm8
0x14587b3b8: jae 0x14587b3da
0x14587b3ba: mov rcx, qword ptr [rbp + 0xe00]
0x14587b3c1: movzx eax, byte ptr [rcx + 0xc51]
0x14587b3c8: movzx eax, byte ptr [rcx + rax + 0xc56]
0x14587b3d0: and al, 6
0x14587b3d2: cmp al, 4
0x14587b3d4: jne 0x14587b4fc
0x14587b3da: mov dword ptr [rbp + 0xd88], edi
0x14587b3e0: mov byte ptr [rbp + 0xdfd], dil
0x14587b3e7: mov eax, dword ptr [rbp + 0xdf0]
0x14587b3ed: mov byte ptr [rbp + 0xdfc], al
0x14587b3f3: lea rcx, [rbp + 0x280]
0x14587b3fa: mov rdx, qword ptr [rbp + 0xdc0]
0x14587b401: mov r8, qword ptr [rbp + 0xd90]
0x14587b408: call 0x1458eb290
0x14587b40d: nop
0x14587b40e: mov r8d, 0x90
0x14587b414: lea rcx, [rbp + 0x788]
0x14587b41b: lea rdx, [rbp + 0x280]
0x14587b422: call 0x145d145fb
0x14587b427: movabs rax, 0x800000000000000e
0x14587b431: mov qword ptr [rbp + 0x780], rax
0x14587b438: mov rax, qword ptr [rbp + 0xe00]
0x14587b43f: cmp dword ptr [rax + 0xc58], 3
0x14587b446: jne 0x14587b4d1
0x14587b44c: mov rax, qword ptr [rbp + 0xe00]
0x14587b453: cmp r12, qword ptr [rax + 0xc98]
0x14587b45a: jae 0x14587b4d1
0x14587b45c: mov rax, qword ptr [rbp + 0xe00]
0x14587b463: mov r15, qword ptr [rax + 0xc90]
0x14587b46a: lea rcx, [rbp + 0x590]
0x14587b471: lea rdx, [rbp + 0x780]
0x14587b478: call 0x14581c690
0x14587b47d: nop
0x14587b47e: lea rdi, [r15 + rsi]
0x14587b482: mov rbx, qword ptr [rdi + 0x270]
0x14587b489: cmp rbx, qword ptr [rdi + 0x260]
0x14587b490: jne 0x14587b4a3
0x14587b492: lea rcx, [r15 + rsi]
0x14587b496: add rcx, 0x260
0x14587b49d: call 0x145d14e50
0x14587b4a2: nop
0x14587b4a3: mov rax, qword ptr [rdi + 0x268]
0x14587b4aa: lea rcx, [rbx + rbx*2]
0x14587b4ae: mov rdx, qword ptr [rbp + 0x5a0]
0x14587b4b5: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x14587b4ba: movupd xmm0, xmmword ptr [rbp + 0x590]
0x14587b4c2: movupd xmmword ptr [rax + rcx*8], xmm0
0x14587b4c7: inc rbx
0x14587b4ca: mov qword ptr [rdi + 0x270], rbx
0x14587b4d1: mov eax, dword ptr [rbp + 0xd88]
0x14587b4d7: mov byte ptr [rbp + 0xdfd], al
0x14587b4dd: mov eax, dword ptr [rbp + 0xdf0]
0x14587b4e3: mov byte ptr [rbp + 0xdfc], al
0x14587b4e9: lea rcx, [rbp + 0x780]
0x14587b4f0: call 0x1458712e0
0x14587b4f5: nop
0x14587b4f6: mov edi, dword ptr [rbp + 0xd88]
