0x1402de390: push r15
0x1402de392: push r14
0x1402de394: push r13
0x1402de396: push r12
0x1402de398: push rsi
0x1402de399: push rdi
0x1402de39a: push rbp
0x1402de39b: push rbx
0x1402de39c: sub rsp, 0xa8
0x1402de3a3: movaps xmmword ptr [rsp + 0x90], xmm8
0x1402de3ac: movaps xmmword ptr [rsp + 0x80], xmm7
0x1402de3b4: movaps xmmword ptr [rsp + 0x70], xmm6
0x1402de3b9: mov rax, qword ptr [rdx]
0x1402de3bc: mov rcx, qword ptr [r8]
0x1402de3bf: mov r12, qword ptr [r8 + 8]
0x1402de3c3: mov edx, dword ptr [r8 + 0x14]
0x1402de3c7: mov dword ptr [rsp + 0x54], edx
0x1402de3cb: movss xmm6, dword ptr [rax + 0x5c]
0x1402de3d0: mov r13, qword ptr [rcx + 0xf8]
0x1402de3d7: mov rax, qword ptr [rcx + 0x100]
0x1402de3de: lea rsi, [r13 + rax*4]
0x1402de3e3: mov qword ptr [rsp + 0x58], rcx
0x1402de3e8: movzx eax, byte ptr [rcx + 0x108]
0x1402de3ef: mov byte ptr [rsp + 0x2b], al
0x1402de3f3: mulss xmm6, dword ptr [rip + 0x5f71831]
0x1402de3fb: xor edi, edi
0x1402de3fd: mov ebp, 8
0x1402de402: movss xmm7, dword ptr [rip + 0x5f54cde]
0x1402de40a: movss xmm8, dword ptr [rip + 0x5f54d11]
0x1402de413: mov eax, 8
0x1402de418: mov qword ptr [rsp + 0x68], rax
0x1402de41d: mov qword ptr [rsp + 0x40], 0
0x1402de426: xor ebx, ebx
0x1402de428: jmp 0x1402de44c
0x1402de42a: nop word ptr [rax + rax]
0x1402de430: mov eax, dword ptr [rsp + 0x54]
0x1402de434: mov rcx, qword ptr [rsp + 0x60]
0x1402de439: mov dword ptr [rcx], eax
0x1402de43b: mov eax, dword ptr [rsp + 0x3c]
0x1402de43f: mov dword ptr [r15 + 0x10], eax
0x1402de443: movups xmm0, xmmword ptr [rsp + 0x2c]
0x1402de448: movups xmmword ptr [r15], xmm0
0x1402de44c: cmp byte ptr [rsp + 0x2b], 0
0x1402de451: je 0x1402de460
0x1402de453: mov eax, edi
0x1402de455: jmp 0x1402de4cd
0x1402de457: nop word ptr [rax + rax]
0x1402de460: mov eax, edi
0x1402de462: jmp 0x1402de57b
0x1402de467: nop word ptr [rax + rax]
0x1402de470: lea rcx, [rcx + rdx*8]
0x1402de474: mov rdx, qword ptr [rsp + 0x58]
0x1402de479: mov rdx, qword ptr [rdx + 0x110]
0x1402de480: mov r8, qword ptr [rcx + 0x38]
0x1402de484: mov rdx, qword ptr [r8 + rdx*8]
0x1402de488: mov r8, qword ptr [rcx + 8]
0x1402de48c: mov qword ptr [rsp + 0x68], r8
0x1402de491: mov rcx, qword ptr [rcx + 0x18]
0x1402de495: not rdx
0x1402de498: lea rdx, [rdx + rdx*2]
0x1402de49c: shl rdx, 4
0x1402de4a0: mov r8, qword ptr [rcx + rdx + 0x10]
0x1402de4a5: mov qword ptr [rsp + 0x40], r8
0x1402de4aa: mov rcx, qword ptr [rcx + rdx + 0x28]
0x1402de4af: mov qword ptr [rsp + 0x48], rcx
0x1402de4b4: xor ebx, ebx
0x1402de4b6: mov edi, eax
0x1402de4b8: mov edx, ebx
0x1402de4ba: inc ebx
0x1402de4bc: mov rcx, qword ptr [rsp + 0x68]
0x1402de4c1: mov rcx, qword ptr [rcx + rdx*8]
0x1402de4c5: test ecx, ecx
0x1402de4c7: jne 0x1402de6af
0x1402de4cd: cmp ebx, eax
0x1402de4cf: jne 0x1402de4b8
0x1402de4d1: nop word ptr cs:[rax + rax]
0x1402de4e0: cmp r13, rsi
0x1402de4e3: je 0x1402de5b0
0x1402de4e9: mov eax, dword ptr [r13]
0x1402de4ed: add r13, 4
0x1402de4f1: mov rcx, qword ptr [r12 + 0x1a8]
0x1402de4f9: lea rdx, [rax + rax*8]
0x1402de4fd: mov rax, qword ptr [rcx + rdx*8 + 0x10]
0x1402de502: test rax, rax
0x1402de505: je 0x1402de4e0
0x1402de507: jmp 0x1402de470
0x1402de50c: nop dword ptr [rax]
0x1402de510: add rcx, rdx
0x1402de513: mov edx, dword ptr [rcx + 0x94]
0x1402de519: mov r8, qword ptr [r12 + 0x1a8]
0x1402de521: lea rdx, [rdx + rdx*8]
0x1402de525: mov r9, qword ptr [rsp + 0x58]
0x1402de52a: mov r9, qword ptr [r9 + 0x110]
0x1402de531: mov r10, qword ptr [r8 + rdx*8 + 0x18]
0x1402de536: mov rdx, qword ptr [r8 + rdx*8 + 0x38]
0x1402de53b: mov rdx, qword ptr [rdx + r9*8]
0x1402de53f: not rdx
0x1402de542: lea rdx, [rdx + rdx*2]
0x1402de546: shl rdx, 4
0x1402de54a: mov r8, qword ptr [r10 + rdx + 0x10]
0x1402de54f: mov qword ptr [rsp + 0x40], r8
0x1402de554: mov rdx, qword ptr [r10 + rdx + 0x28]
0x1402de559: mov qword ptr [rsp + 0x48], rdx
0x1402de55e: mov rbp, qword ptr [rcx + 0x50]
0x1402de562: xor ebx, ebx
0x1402de564: mov edi, eax
0x1402de566: mov edx, ebx
0x1402de568: shl rdx, 4
0x1402de56c: inc ebx
0x1402de56e: mov rcx, qword ptr [rbp + rdx]
0x1402de573: test ecx, ecx
0x1402de575: jne 0x1402de6c7
0x1402de57b: cmp ebx, eax
0x1402de57d: jne 0x1402de566
0x1402de57f: nop 
0x1402de580: cmp r13, rsi
0x1402de583: je 0x1402de5b0
0x1402de585: mov eax, dword ptr [r13]
0x1402de589: add r13, 4
0x1402de58d: mov rcx, qword ptr [r12 + 0x108]
0x1402de595: lea rdx, [rax + rax*4]
0x1402de599: shl rdx, 5
0x1402de59d: mov rax, qword ptr [rcx + rdx + 0x58]
0x1402de5a2: test rax, rax
0x1402de5a5: je 0x1402de580
0x1402de5a7: jmp 0x1402de510
0x1402de5ac: nop dword ptr [rax]
0x1402de5b0: movabs rax, 0xffffffff00000000
0x1402de5ba: and r14, rax
0x1402de5bd: test r14d, r14d
0x1402de5c0: je 0x1402de6f9
0x1402de5c6: mov rax, r14
0x1402de5c9: movabs rcx, 0x2492492492492493
0x1402de5d3: mul rcx
0x1402de5d6: mov rax, r14
0x1402de5d9: sub rax, rdx
0x1402de5dc: shr rax, 1
0x1402de5df: add rax, rdx
0x1402de5e2: shr rax, 2
0x1402de5e6: lea ecx, [rax*8]
0x1402de5ed: sub eax, ecx
0x1402de5ef: add eax, r14d
0x1402de5f2: xorps xmm0, xmm0
0x1402de5f5: cvtsi2ss xmm0, eax
0x1402de5f9: mulss xmm0, xmm7
0x1402de5fd: addss xmm0, xmm6
0x1402de601: call 0x146061751
0x1402de606: mulss xmm0, xmm8
0x1402de60b: addss xmm0, xmm8
0x1402de610: lea rcx, [rsp + 0x2c]
0x1402de615: lea rdx, [rip + 0x5f9a2d0]
0x1402de61c: lea r8, [rip + 0x5f9a2dd]
0x1402de623: movaps xmm3, xmm0
0x1402de626: call 0x144eaabf0
0x1402de62b: mov eax, dword ptr [r15]
0x1402de62e: cmp eax, dword ptr [rsp + 0x2c]
0x1402de632: jne 0x1402de430
0x1402de638: movss xmm0, dword ptr [r15 + 4]
0x1402de63e: movss xmm1, dword ptr [rsp + 0x30]
0x1402de644: mov eax, eax
0x1402de646: lea rcx, [rip + 0x5f9c35f]
0x1402de64d: movsxd rax, dword ptr [rcx + rax*4]
0x1402de651: add rax, rcx
0x1402de654: jmp rax
0x1402de656: ucomiss xmm0, xmm1
0x1402de659: jne 0x1402de430
0x1402de65f: jp 0x1402de430
0x1402de665: movss xmm0, dword ptr [r15 + 8]
0x1402de66b: ucomiss xmm0, dword ptr [rsp + 0x34]
0x1402de670: jne 0x1402de430
0x1402de676: jp 0x1402de430
0x1402de67c: movss xmm0, dword ptr [r15 + 0xc]
0x1402de682: ucomiss xmm0, dword ptr [rsp + 0x38]
0x1402de687: jne 0x1402de430
0x1402de68d: jp 0x1402de430
0x1402de693: movss xmm0, dword ptr [r15 + 0x10]
0x1402de699: ucomiss xmm0, dword ptr [rsp + 0x3c]
0x1402de69e: jne 0x1402de430
0x1402de6a4: jnp 0x1402de44c
0x1402de6aa: jmp 0x1402de430
0x1402de6af: lea rax, [rdx + rdx*4]
0x1402de6b3: mov r8, qword ptr [rsp + 0x40]
0x1402de6b8: lea r15, [r8 + rax*4]
0x1402de6bc: mov rax, qword ptr [rsp + 0x48]
0x1402de6c1: lea rax, [rax + rdx*4]
0x1402de6c5: jmp 0x1402de6e8
0x1402de6c7: mov rax, rbp
0x1402de6ca: add rax, rdx
0x1402de6cd: mov eax, dword ptr [rax + 8]
0x1402de6d0: not eax
0x1402de6d2: lea rdx, [rax + rax*4]
0x1402de6d6: mov r8, qword ptr [rsp + 0x40]
0x1402de6db: lea r15, [r8 + rdx*4]
0x1402de6df: mov rdx, qword ptr [rsp + 0x48]
0x1402de6e4: lea rax, [rdx + rax*4]
0x1402de6e8: mov qword ptr [rsp + 0x60], rax
0x1402de6ed: mov r14, rcx
0x1402de6f0: test r14d, r14d
0x1402de6f3: jne 0x1402de5c6
0x1402de6f9: movaps xmm6, xmmword ptr [rsp + 0x70]
0x1402de6fe: movaps xmm7, xmmword ptr [rsp + 0x80]
0x1402de706: movaps xmm8, xmmword ptr [rsp + 0x90]
0x1402de70f: add rsp, 0xa8
0x1402de716: pop rbx
0x1402de717: pop rbp
0x1402de718: pop rdi
0x1402de719: pop rsi
0x1402de71a: pop r12
0x1402de71c: pop r13
0x1402de71e: pop r14
0x1402de720: pop r15
0x1402de722: ret 
