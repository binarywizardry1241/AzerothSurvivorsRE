000000014024a220: push rbp
000000014024a221: push r15
000000014024a223: push r14
000000014024a225: push r13
000000014024a227: push r12
000000014024a229: push rsi
000000014024a22a: push rdi
000000014024a22b: push rbx
000000014024a22c: sub rsp, 0x178
000000014024a233: lea rbp, [rsp + 0x80]
000000014024a23b: mov qword ptr [rbp + 0xf0], 0xfffffffffffffffe
000000014024a246: mov rsi, rcx
000000014024a249: mov rdi, qword ptr [rcx]
000000014024a24c: mov rax, qword ptr [rcx + 0x28]
000000014024a250: mov qword ptr [rbp - 0x60], rdi
000000014024a254: movups xmm0, xmmword ptr [rcx + 8]
000000014024a258: movups xmmword ptr [rbp - 0x58], xmm0
000000014024a25c: movups xmm0, xmmword ptr [rcx + 0x18]
000000014024a260: movups xmmword ptr [rbp - 0x48], xmm0
000000014024a264: mov qword ptr [rbp - 0x38], rax
000000014024a268: mov rbx, qword ptr [rdx]
000000014024a26b: mov r15, qword ptr [rdx + 8]
000000014024a26f: mov rax, qword ptr [rdx + 0x10]
000000014024a273: mov r13, rax
000000014024a276: shl r13, 5
000000014024a27a: add r13, r15
000000014024a27d: mov qword ptr [rbp + 0xa8], r15
000000014024a284: mov qword ptr [rbp + 0xb0], r15
000000014024a28b: mov qword ptr [rbp + 0xb8], rbx
000000014024a292: mov qword ptr [rbp + 0xc0], r13
000000014024a299: mov r9, r15
000000014024a29c: test rax, rax
000000014024a29f: je 0x14024a424
000000014024a2a5: mov qword ptr [rbp + 0xd0], rbx
000000014024a2ac: mov qword ptr [rbp + 0xc8], rsi
000000014024a2b3: mov rsi, qword ptr [rdx + 0x18]
000000014024a2b7: lea r14, [rbp + 0x5c]
000000014024a2bb: lea rbx, [rbp - 0x20]
000000014024a2bf: mov qword ptr [rbp + 0xd8], r15
000000014024a2c6: lea r9, [r15 + 0x20]
000000014024a2ca: lea r12, [rbp - 0x30]
000000014024a2ce: nop
000000014024a2d0: mov rax, qword ptr [r9 - 0x20]
000000014024a2d4: cmp rax, -1
000000014024a2d8: je 0x14024a408
000000014024a2de: lea r15, [r9 - 0x20]
000000014024a2e2: test byte ptr [r15 + 0x18], 1
000000014024a2e7: movups xmm0, xmmword ptr [r15 + 8]
000000014024a2ec: movaps xmmword ptr [rbp + 0x40], xmm0
000000014024a2f0: je 0x14024a300
000000014024a2f2: movups xmm0, xmmword ptr [rip + 0x5ba3727]
000000014024a2f9: jmp 0x14024a307
000000014024a2fb: nop dword ptr [rax + rax]
000000014024a300: movups xmm0, xmmword ptr [rip + 0x5ba3a2d]
000000014024a307: movaps xmmword ptr [rbp + 0x70], xmm0
000000014024a30b: mov dword ptr [rbp + 0x80], 0x3f800000
000000014024a315: cmp byte ptr [rsi], 1
000000014024a318: mov qword ptr [rbp + 0xe0], r9
000000014024a31f: jne 0x14024a350
000000014024a321: lea rdx, [rsi + 1]
000000014024a325: mov ecx, dword ptr [rdx]
000000014024a327: mov edx, dword ptr [rdx + 3]
000000014024a32a: mov dword ptr [rbp + 0xeb], edx
000000014024a330: mov dword ptr [rbp + 0xe8], ecx
000000014024a336: mov rcx, qword ptr [rsi + 8]
000000014024a33a: movzx r8d, byte ptr [rsi + 0x10]
000000014024a33f: mov dl, 1
000000014024a341: jmp 0x14024a360
000000014024a343: nop word ptr cs:[rax + rax]
000000014024a350: mov rcx, qword ptr [rsi + 8]
000000014024a354: lock inc qword ptr [rcx]
000000014024a358: jle 0x14024a499
000000014024a35e: xor edx, edx
000000014024a360: movaps xmm0, xmmword ptr [rbp + 0x40]
000000014024a364: movups xmmword ptr [rbx], xmm0
000000014024a367: mov r9d, dword ptr [rbp + 0xe8]
000000014024a36e: mov r10d, dword ptr [rbp + 0xeb]
000000014024a375: mov dword ptr [rbx + 0x2c], r10d
000000014024a379: mov dword ptr [rbx + 0x29], r9d
000000014024a37d: mov r9d, dword ptr [rbp + 0x80]
000000014024a384: mov dword ptr [r14 + 0x10], r9d
000000014024a388: movaps xmm0, xmmword ptr [rbp + 0x70]
000000014024a38c: movups xmmword ptr [r14], xmm0
000000014024a390: mov qword ptr [rbp - 0x28], rax
000000014024a394: mov qword ptr [rbp - 0x10], 0
000000014024a39c: mov qword ptr [rbp - 8], 4
000000014024a3a4: mov qword ptr [rbp], 0
000000014024a3ac: mov byte ptr [rbp + 8], dl
000000014024a3af: mov qword ptr [rbp + 0x10], rcx
000000014024a3b3: mov qword ptr [rbp + 0x18], r8
000000014024a3b7: mov dword ptr [rbp + 0x20], 0x41700000
000000014024a3be: mov word ptr [rbp + 0x24], 0x190
000000014024a3c4: mov byte ptr [rbp + 0x26], 1
000000014024a3c8: mov rax, qword ptr [rbp + 0x68]
000000014024a3cc: mov qword ptr [rbx + 0x54], rax
000000014024a3d0: movups xmm0, xmmword ptr [rbp + 0x5b]
000000014024a3d4: movups xmmword ptr [rbx + 0x47], xmm0
000000014024a3d8: mov qword ptr [rbp - 0x30], rdi
000000014024a3dc: lea rcx, [rbp + 0x70]
000000014024a3e0: lea rdx, [rbp - 0x58]
000000014024a3e4: mov r8, r12
000000014024a3e7: call 0x140211a60
000000014024a3ec: nop
000000014024a3ed: mov r9, qword ptr [rbp + 0xe0]
000000014024a3f4: add r9, 0x20
000000014024a3f8: add r15, 0x20
000000014024a3fc: cmp r15, r13
000000014024a3ff: jne 0x14024a2d0
000000014024a405: mov r9, r13
000000014024a408: mov qword ptr [rbp + 0xb0], r9
000000014024a40f: mov rsi, qword ptr [rbp + 0xc8]
000000014024a416: mov rbx, qword ptr [rbp + 0xd0]
000000014024a41d: mov r15, qword ptr [rbp + 0xd8]
000000014024a424: sub r13, r9
000000014024a427: je 0x14024a468
000000014024a429: shr r13, 5
000000014024a42d: add r9, 8
000000014024a431: jmp 0x14024a449
000000014024a433: nop word ptr cs:[rax + rax]
000000014024a440: add r9, 0x20
000000014024a444: dec r13
000000014024a447: je 0x14024a468
000000014024a449: mov rdx, qword ptr [r9 - 8]
000000014024a44d: test rdx, rdx
000000014024a450: je 0x14024a440
000000014024a452: mov rcx, qword ptr [r9]
000000014024a455: mov r8d, 1
000000014024a45b: mov rdi, r9
000000014024a45e: call 0x1400021d0
000000014024a463: mov r9, rdi
000000014024a466: jmp 0x14024a440
000000014024a468: test rbx, rbx
000000014024a46b: je 0x14024a482
000000014024a46d: shl rbx, 5
000000014024a471: mov r8d, 8
000000014024a477: mov rcx, r15
000000014024a47a: mov rdx, rbx
000000014024a47d: call 0x1400021d0
000000014024a482: mov rax, rsi
000000014024a485: add rsp, 0x178
000000014024a48c: pop rbx
000000014024a48d: pop rdi
000000014024a48e: pop rsi
000000014024a48f: pop r12
000000014024a491: pop r13
000000014024a493: pop r14
000000014024a495: pop r15
000000014024a497: pop rbp
000000014024a498: ret
000000014024a499: ud2
