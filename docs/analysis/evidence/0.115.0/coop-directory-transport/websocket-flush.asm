0x145828250: push rbp
0x145828251: push r15
0x145828253: push r14
0x145828255: push r13
0x145828257: push r12
0x145828259: push rsi
0x14582825a: push rdi
0x14582825b: push rbx
0x14582825c: sub rsp, 0xe8
0x145828263: lea rbp, [rsp + 0x80]
0x14582826b: mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0x145828273: mov rbx, r8
0x145828276: mov rdi, rdx
0x145828279: mov rsi, rcx
0x14582827c: cmp byte ptr [r9 + 0x20], 2
0x145828281: je 0x1458282c3
0x145828283: movups xmm0, xmmword ptr [r9]
0x145828287: movups xmm1, xmmword ptr [r9 + 0x10]
0x14582828c: movups xmm2, xmmword ptr [r9 + 0x20]
0x145828291: movaps xmmword ptr [rbp - 0x20], xmm2
0x145828295: movaps xmmword ptr [rbp - 0x30], xmm1
0x145828299: movaps xmmword ptr [rbp - 0x40], xmm0
0x14582829d: lea rcx, [rbp + 0x20]
0x1458282a1: lea r9, [rbp - 0x40]
0x1458282a5: mov rdx, rdi
0x1458282a8: mov r8, rbx
0x1458282ab: call 0x145826940
0x1458282b0: cmp byte ptr [rbp + 0x20], 0xff
0x1458282b4: je 0x1458282c3
0x1458282b6: movups xmm0, xmmword ptr [rbp + 0x20]
0x1458282ba: movups xmm1, xmmword ptr [rbp + 0x30]
0x1458282be: jmp 0x145828408
0x1458282c3: movzx eax, byte ptr [rdi + 0xe8]
0x1458282ca: mov byte ptr [rdi + 0xe8], 2
0x1458282d1: cmp al, 2
0x1458282d3: jne 0x1458282e1
0x1458282d5: movzx eax, byte ptr [rdi + 0xf9]
0x1458282dc: jmp 0x145828495
0x1458282e1: movups xmm0, xmmword ptr [rdi + 0xc8]
0x1458282e8: movups xmm1, xmmword ptr [rdi + 0xd8]
0x1458282ef: movaps xmmword ptr [rbp + 0x30], xmm1
0x1458282f3: movaps xmmword ptr [rbp + 0x20], xmm0
0x1458282f7: mov byte ptr [rbp + 0x40], al
0x1458282fa: mov rax, qword ptr [rdi + 0xe9]
0x145828301: mov rcx, qword ptr [rdi + 0xf0]
0x145828308: mov qword ptr [rbp + 0x41], rax
0x14582830c: mov qword ptr [rbp + 0x48], rcx
0x145828310: mov rax, qword ptr [rip + 0x29ec5d1]
0x145828317: mov rax, qword ptr [rax]
0x14582831a: cmp rax, 5
0x14582831e: jb 0x14582839d
0x145828320: mov qword ptr [rbp - 0x10], 5
0x145828328: lea rax, [rip + 0x14a2fda]
0x14582832f: mov qword ptr [rbp - 8], rax
0x145828333: mov qword ptr [rbp], 0x15
0x14582833b: lea rcx, [rip + 0x14a300a]
0x145828342: mov qword ptr [rbp + 0x10], rcx
0x145828346: mov qword ptr [rbp + 0x18], 0x25
0x14582834e: mov qword ptr [rbp - 0x40], 0
0x145828356: mov qword ptr [rbp - 0x38], rax
0x14582835a: mov qword ptr [rbp - 0x30], 0x15
0x145828362: mov qword ptr [rbp - 0x28], 0
0x14582836a: lea rax, [rip + 0x14a2f2c]
0x145828371: mov qword ptr [rbp - 0x20], rax
0x145828375: mov qword ptr [rbp - 0x18], 0x6b
0x14582837d: movabs rax, 0x22c00000001
0x145828387: mov qword ptr [rbp + 8], rax
0x14582838b: mov byte ptr [rbp + 0x5f], 1
0x14582838f: lea rcx, [rbp + 0x5e]
0x145828393: lea rdx, [rbp - 0x40]
0x145828397: call 0x145b714c0
0x14582839c: nop
0x14582839d: movaps xmm0, xmmword ptr [rbp + 0x20]
0x1458283a1: movaps xmm1, xmmword ptr [rbp + 0x30]
0x1458283a5: movzx eax, byte ptr [rbp + 0x40]
0x1458283a9: mov byte ptr [rbp - 0x20], al
0x1458283ac: mov rax, qword ptr [rbp + 0x41]
0x1458283b0: mov qword ptr [rbp - 0x1f], rax
0x1458283b4: mov eax, dword ptr [rbp + 0x49]
0x1458283b7: mov dword ptr [rbp - 0x17], eax
0x1458283ba: movzx eax, word ptr [rbp + 0x4d]
0x1458283be: mov word ptr [rbp - 0x13], ax
0x1458283c2: movzx eax, byte ptr [rbp + 0x4f]
0x1458283c6: mov byte ptr [rbp - 0x11], al
0x1458283c9: movaps xmmword ptr [rbp - 0x30], xmm1
0x1458283cd: movaps xmmword ptr [rbp - 0x40], xmm0
0x1458283d1: mov byte ptr [rbp + 0x5f], 0
0x1458283d5: lea rcx, [rbp - 0x60]
0x1458283d9: lea r9, [rbp - 0x40]
0x1458283dd: mov rdx, rdi
0x1458283e0: mov r8, rbx
0x1458283e3: call 0x145826940
0x1458283e8: nop
0x1458283e9: movzx ecx, byte ptr [rbp - 0x60]
0x1458283ed: cmp ecx, 6
0x1458283f0: je 0x145828414
0x1458283f2: mov al, 1
0x1458283f4: cmp ecx, 0xff
0x1458283fa: je 0x145828495
0x145828400: movups xmm0, xmmword ptr [rbp - 0x60]
0x145828404: movups xmm1, xmmword ptr [rbp - 0x50]
0x145828408: movups xmmword ptr [rsi + 0x10], xmm1
0x14582840c: movups xmmword ptr [rsi], xmm0
0x14582840f: jmp 0x1458284ad
0x145828414: mov rax, qword ptr [rbp - 0x58]
0x145828418: cmp dword ptr [rax], 5
0x14582841b: mov qword ptr [rbp + 0x50], rax
0x14582841f: jne 0x145828599
0x145828425: movups xmm0, xmmword ptr [rax + 8]
0x145828429: movups xmm1, xmmword ptr [rax + 0x18]
0x14582842d: movups xmm2, xmmword ptr [rax + 0x28]
0x145828431: movaps xmmword ptr [rbp - 0x20], xmm2
0x145828435: movaps xmmword ptr [rbp - 0x30], xmm1
0x145828439: movaps xmmword ptr [rbp - 0x40], xmm0
0x14582843d: lea rdx, [rbp - 0x40]
0x145828441: mov rcx, rdi
0x145828444: call 0x145a6b920
0x145828449: nop
0x14582844a: mov rax, qword ptr [rbp + 0x50]
0x14582844e: mov rax, qword ptr [rax]
0x145828451: cmp rax, 5
0x145828455: je 0x14582847f
0x145828457: cmp eax, 4
0x14582845a: jne 0x145828467
0x14582845c: mov rax, qword ptr [rbp + 0x50]
0x145828460: cmp word ptr [rax + 0x28], -1
0x145828465: je 0x14582847f
0x145828467: mov r8, qword ptr [rbp + 0x50]
0x14582846b: mov rax, qword ptr [r8 + 8]
0x14582846f: mov rdx, qword ptr [r8 + 0x10]
0x145828473: lea rcx, [r8 + 0x20]
0x145828477: mov r8, qword ptr [r8 + 0x18]
0x14582847b: call qword ptr [rax + 0x20]
0x14582847e: nop
0x14582847f: mov edx, 0x38
0x145828484: mov r8d, 8
0x14582848a: mov rcx, qword ptr [rbp + 0x50]
0x14582848e: call 0x1400021d0
0x145828493: xor eax, eax
0x145828495: cmp byte ptr [rdi + 0xf8], 0
0x14582849c: jne 0x1458284a7
0x14582849e: cmp byte ptr [rdi + 0xfa], 2
0x1458284a5: jae 0x1458284c4
0x1458284a7: mov byte ptr [rsi + 1], al
0x1458284aa: mov byte ptr [rsi], 0xff
0x1458284ad: mov rax, rsi
0x1458284b0: add rsp, 0xe8
0x1458284b7: pop rbx
0x1458284b8: pop rdi
0x1458284b9: pop rsi
0x1458284ba: pop r12
0x1458284bc: pop r13
0x1458284be: pop r14
0x1458284c0: pop r15
0x1458284c2: pop rbp
0x1458284c3: ret
0x1458284c4: mov r15, qword ptr [rdi + 0x50]
0x1458284c8: test r15, r15
0x1458284cb: je 0x145828554
0x1458284d1: mov r14, qword ptr [rdi + 0x48]
0x1458284d5: lea r13, [rbp - 0x40]
0x1458284d9: cmp dword ptr [rbx], 2
0x1458284dc: jne 0x145828500
0x1458284de: nop
0x1458284e0: lea rcx, [rbx + 8]
0x1458284e4: mov rdx, r14
0x1458284e7: mov r8, r15
0x1458284ea: call 0x145cbeae0
0x1458284ef: jmp 0x14582851d
0x1458284f1: nop word ptr cs:[rax + rax]
0x145828500: mov qword ptr [rbp - 0x40], rbx
0x145828504: lea rax, [rbx + 0x420]
0x14582850b: mov qword ptr [rbp - 0x38], rax
0x14582850f: mov rcx, r13
0x145828512: mov rdx, r14
0x145828515: mov r8, r15
0x145828518: call 0x145824800
0x14582851d: test al, 1
0x14582851f: jne 0x14582857a
0x145828521: test rdx, rdx
0x145828524: je 0x145828563
0x145828526: mov r12, r15
0x145828529: sub r12, rdx
0x14582852c: jb 0x145828586
0x14582852e: mov qword ptr [rdi + 0x50], 0
0x145828536: je 0x145828554
0x145828538: add rdx, r14
0x14582853b: mov rcx, r14
0x14582853e: mov r8, r12
0x145828541: call 0x145d14607
0x145828546: mov qword ptr [rdi + 0x50], r12
0x14582854a: mov r15, r12
0x14582854d: cmp dword ptr [rbx], 2
0x145828550: jne 0x145828500
0x145828552: jmp 0x1458284e0
0x145828554: mov byte ptr [rdi + 0xfa], 4
0x14582855b: mov byte ptr [rsi], 0
0x14582855e: jmp 0x1458284ad
0x145828563: lea rdx, [rip + 0x1808476]
0x14582856a: mov r8d, 0x1e
0x145828570: mov cl, 3
0x145828572: call 0x145cb8110
0x145828577: mov rdx, rax
0x14582857a: mov byte ptr [rsi], 2
0x14582857d: mov qword ptr [rsi + 8], rdx
0x145828581: jmp 0x1458284ad
0x145828586: lea r9, [rip + 0x1b117b3]
0x14582858d: xor ecx, ecx
0x14582858f: mov r8, r15
0x145828592: call 0x145eb7570
0x145828597: ud2
0x145828599: lea rcx, [rip + 0x14a2dbe]
0x1458285a0: lea r8, [rip + 0x14a2de1]
0x1458285a7: mov edx, 0x28
0x1458285ac: call 0x145eb7520
0x1458285b1: nop
0x1458285b2: ud2
