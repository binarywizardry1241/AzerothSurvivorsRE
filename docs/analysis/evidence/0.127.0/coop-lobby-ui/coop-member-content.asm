0x14033a290: push rbp
0x14033a291: push r15
0x14033a293: push r14
0x14033a295: push r13
0x14033a297: push r12
0x14033a299: push rsi
0x14033a29a: push rdi
0x14033a29b: push rbx
0x14033a29c: sub rsp, 0x7a8
0x14033a2a3: lea rbp, [rsp + 0x80]
0x14033a2ab: movaps xmmword ptr [rbp + 0x710], xmm15
0x14033a2b3: movaps xmmword ptr [rbp + 0x700], xmm14
0x14033a2bb: movaps xmmword ptr [rbp + 0x6f0], xmm13
0x14033a2c3: movaps xmmword ptr [rbp + 0x6e0], xmm12
0x14033a2cb: movaps xmmword ptr [rbp + 0x6d0], xmm11
0x14033a2d3: movaps xmmword ptr [rbp + 0x6c0], xmm10
0x14033a2db: movaps xmmword ptr [rbp + 0x6b0], xmm9
0x14033a2e3: movaps xmmword ptr [rbp + 0x6a0], xmm8
0x14033a2eb: movaps xmmword ptr [rbp + 0x690], xmm7
0x14033a2f2: movaps xmmword ptr [rbp + 0x680], xmm6
0x14033a2f9: mov qword ptr [rbp + 0x678], 0xfffffffffffffffe
0x14033a304: mov r12, rdx
0x14033a307: mov rsi, rcx
0x14033a30a: mov rdi, qword ptr [rcx]
0x14033a30d: mov rax, qword ptr [rcx + 0x28]
0x14033a311: mov qword ptr [rbp + 0x2f8], rdi
0x14033a318: lea r13, [rbp + 0x300]
0x14033a31f: movups xmm0, xmmword ptr [rcx + 8]
0x14033a323: movups xmmword ptr [rbp + 0x300], xmm0
0x14033a32a: movups xmm0, xmmword ptr [rcx + 0x18]
0x14033a32e: movups xmmword ptr [rbp + 0x310], xmm0
0x14033a335: mov qword ptr [rbp + 0x320], rax
0x14033a33c: mov rax, qword ptr [rdx]
0x14033a33f: mov r14, qword ptr [rax]
0x14033a342: test r14, r14
0x14033a345: je 0x14033a40b
0x14033a34b: movzx ecx, byte ptr [r14 + 0x8f]
0x14033a353: call 0x145b059c0
0x14033a358: mov rdx, qword ptr [rax + 0x50]
0x14033a35c: mov r8, qword ptr [rax + 0x58]
0x14033a360: mov rcx, r8
0x14033a363: sub rcx, rdx
0x14033a366: sub rcx, r8
0x14033a369: xor r9d, r9d
0x14033a36c: jmp 0x14033a380
0x14033a36e: nop 
0x14033a370: inc r9
0x14033a373: add r9, rcx
0x14033a376: cmp r10d, 0x23
0x14033a37a: jne 0x14033a71d
0x14033a380: cmp r9, r8
0x14033a383: je 0x14033a71a
0x14033a389: mov rax, r9
0x14033a38c: add r9, rdx
0x14033a38f: movzx ebx, byte ptr [r9]
0x14033a393: movzx r10d, bl
0x14033a397: test r10b, r10b
0x14033a39a: jns 0x14033a370
0x14033a39c: mov r11d, r10d
0x14033a39f: and r11d, 0x1f
0x14033a3a3: movzx edi, byte ptr [r9 + 1]
0x14033a3a8: and edi, 0x3f
0x14033a3ab: cmp r10b, 0xdf
0x14033a3af: jbe 0x14033a3e8
0x14033a3b1: movzx r10d, byte ptr [r9 + 2]
0x14033a3b6: shl edi, 6
0x14033a3b9: and r10d, 0x3f
0x14033a3bd: or r10d, edi
0x14033a3c0: cmp bl, 0xf0
0x14033a3c3: jb 0x14033a3fb
0x14033a3c5: movzx edi, byte ptr [r9 + 3]
0x14033a3ca: add r9, 4
0x14033a3ce: and r11d, 7
0x14033a3d2: shl r11d, 0x12
0x14033a3d6: shl r10d, 6
0x14033a3da: and edi, 0x3f
0x14033a3dd: or edi, r10d
0x14033a3e0: or edi, r11d
0x14033a3e3: mov r10d, edi
0x14033a3e6: jmp 0x14033a373
0x14033a3e8: add r9, 2
0x14033a3ec: shl r11d, 6
0x14033a3f0: or r11d, edi
0x14033a3f3: mov r10d, r11d
0x14033a3f6: jmp 0x14033a373
0x14033a3fb: add r9, 3
0x14033a3ff: shl r11d, 0xc
0x14033a403: or r10d, r11d
0x14033a406: jmp 0x14033a373
0x14033a40b: movups xmm0, xmmword ptr [rip + 0x5f414a6]
0x14033a412: movaps xmmword ptr [rbp + 0x5e0], xmm0
0x14033a419: mov qword ptr [rbp + 0x5f0], 0
0x14033a424: movups xmm0, xmmword ptr [rip + 0x5f414a5]
0x14033a42b: movups xmmword ptr [rbp + 0x5f8], xmm0
0x14033a432: mov qword ptr [rbp + 0x608], 0
0x14033a43d: movups xmm0, xmmword ptr [rip + 0x5f414a4]
0x14033a444: movaps xmmword ptr [rbp + 0x610], xmm0
0x14033a44b: mov qword ptr [rbp + 0x620], 0
0x14033a456: movups xmm0, xmmword ptr [rip + 0x5f414a3]
0x14033a45d: movups xmmword ptr [rbp + 0x628], xmm0
0x14033a464: mov qword ptr [rbp + 0x638], 0
0x14033a46f: movups xmm0, xmmword ptr [rip + 0x5f41872]
0x14033a476: movaps xmmword ptr [rbp - 0x20], xmm0
0x14033a47a: mov dword ptr [rbp - 0x10], 0x3f800000
0x14033a481: movups xmmword ptr [rbp - 0xc], xmm0
0x14033a485: mov dword ptr [rbp + 4], 0x3f800000
0x14033a48c: movups xmmword ptr [rbp + 8], xmm0
0x14033a490: mov dword ptr [rbp + 0x18], 0x3f800000
0x14033a497: movups xmmword ptr [rbp + 0x1c], xmm0
0x14033a49b: mov dword ptr [rbp + 0x2c], 0x3f800000
0x14033a4a2: mov rax, qword ptr [rbp + 0x630]
0x14033a4a9: mov qword ptr [rbp + 0x90], rax
0x14033a4b0: mov rax, qword ptr [rbp + 0x638]
0x14033a4b7: mov qword ptr [rbp + 0x98], rax
0x14033a4be: mov rax, qword ptr [rbp + 0x620]
0x14033a4c5: mov qword ptr [rbp + 0x80], rax
0x14033a4cc: mov rax, qword ptr [rbp + 0x628]
0x14033a4d3: mov qword ptr [rbp + 0x88], rax
0x14033a4da: movaps xmm0, xmmword ptr [rbp + 0x5e0]
0x14033a4e1: movaps xmm1, xmmword ptr [rbp + 0x5f0]
0x14033a4e8: movaps xmm2, xmmword ptr [rbp + 0x600]
0x14033a4ef: movaps xmm3, xmmword ptr [rbp + 0x610]
0x14033a4f6: movaps xmmword ptr [rbp + 0x70], xmm3
0x14033a4fa: movaps xmmword ptr [rbp + 0x60], xmm2
0x14033a4fe: movaps xmmword ptr [rbp + 0x50], xmm1
0x14033a502: movaps xmmword ptr [rbp + 0x40], xmm0
0x14033a506: xorps xmm0, xmm0
0x14033a509: movaps xmmword ptr [rbp + 0xb0], xmm0
0x14033a510: movaps xmmword ptr [rbp + 0xa0], xmm0
0x14033a517: mov qword ptr [rbp + 0xc0], 0
0x14033a522: movups xmmword ptr [rbp + 0x400], xmm0
0x14033a529: movups xmmword ptr [rbp + 0x3f0], xmm0
0x14033a530: mov qword ptr [rbp - 0x47], 0
0x14033a538: mov qword ptr [rbp - 0x4d], 0
0x14033a540: mov qword ptr [rbp + 0x4ca], 0
0x14033a54b: mov dword ptr [rbp + 0x4d2], 0
0x14033a555: movaps xmm0, xmmword ptr [rbp + 0x20]
0x14033a559: movups xmmword ptr [rbp + 0x2e2], xmm0
0x14033a560: movaps xmm0, xmmword ptr [rbp - 0x20]
0x14033a564: movaps xmm1, xmmword ptr [rbp - 0x10]
0x14033a568: movaps xmm2, xmmword ptr [rbp]
0x14033a56c: movaps xmm3, xmmword ptr [rbp + 0x10]
0x14033a570: movups xmmword ptr [rbp + 0x2d2], xmm3
0x14033a577: movups xmmword ptr [rbp + 0x2c2], xmm2
0x14033a57e: movups xmmword ptr [rbp + 0x2b2], xmm1
0x14033a585: movups xmmword ptr [rbp + 0x2a2], xmm0
0x14033a58c: lea rcx, [rbp + 0x358]
0x14033a593: lea rdx, [rbp + 0x40]
0x14033a597: mov r8d, 0x88
0x14033a59d: call 0x14606171b
0x14033a5a2: movaps xmm0, xmmword ptr [rip + 0x5f40837]
0x14033a5a9: movups xmmword ptr [rbp + 0x3e0], xmm0
0x14033a5b0: movups xmm0, xmmword ptr [rip + 0x5f413b9]
0x14033a5b7: movups xmmword ptr [rbp + 0x410], xmm0
0x14033a5be: movups xmm0, xmmword ptr [rip + 0x5f413bb]
0x14033a5c5: movups xmmword ptr [rbp + 0x420], xmm0
0x14033a5cc: movups xmm0, xmmword ptr [rip + 0x5f413bd]
0x14033a5d3: movups xmmword ptr [rbp + 0x430], xmm0
0x14033a5da: movups xmm0, xmmword ptr [rip + 0x5f413bf]
0x14033a5e1: movups xmmword ptr [rbp + 0x440], xmm0
0x14033a5e8: movaps xmm0, xmmword ptr [rip + 0x5ef89c1]
0x14033a5ef: movups xmmword ptr [rbp + 0x450], xmm0
0x14033a5f6: movups xmmword ptr [rbp + 0x460], xmm0
0x14033a5fd: movaps xmm0, xmmword ptr [rip + 0x5ef89dc]
0x14033a604: movups xmmword ptr [rbp + 0x470], xmm0
0x14033a60b: movups xmmword ptr [rbp + 0x480], xmm0
0x14033a612: movaps xmm0, xmmword ptr [rip + 0x5ef8937]
0x14033a619: movups xmmword ptr [rbp + 0x490], xmm0
0x14033a620: mov dword ptr [rbp + 0x4a0], 1
0x14033a62a: mov qword ptr [rbp + 0x4a4], 0
0x14033a635: mov byte ptr [rbp + 0x4ac], 1
0x14033a63c: movzx eax, byte ptr [rbp - 0x40]
0x14033a640: mov byte ptr [rbp + 0x4bd], al
0x14033a646: movups xmm0, xmmword ptr [rbp - 0x50]
0x14033a64a: movups xmmword ptr [rbp + 0x4ad], xmm0
0x14033a651: mov dword ptr [rbp + 0x4be], 0x10000
0x14033a65b: mov word ptr [rbp + 0x4c2], 0
0x14033a664: mov dword ptr [rbp + 0x4c4], 0x10000
0x14033a66e: mov word ptr [rbp + 0x4c8], 0
0x14033a677: movups xmm0, xmmword ptr [rbp + 0x2a0]
0x14033a67e: movups xmm1, xmmword ptr [rbp + 0x2b0]
0x14033a685: movups xmm2, xmmword ptr [rbp + 0x2c0]
0x14033a68c: movups xmm3, xmmword ptr [rbp + 0x2d0]
0x14033a693: movups xmmword ptr [rbp + 0x4d6], xmm0
0x14033a69a: movups xmmword ptr [rbp + 0x4e6], xmm1
0x14033a6a1: movups xmmword ptr [rbp + 0x4f6], xmm2
0x14033a6a8: movups xmmword ptr [rbp + 0x506], xmm3
0x14033a6af: movups xmm0, xmmword ptr [rbp + 0x2e0]
0x14033a6b6: movups xmmword ptr [rbp + 0x516], xmm0
0x14033a6bd: movzx eax, word ptr [rbp + 0x2f0]
0x14033a6c4: mov word ptr [rbp + 0x526], ax
0x14033a6cb: mov qword ptr [rbp + 0x350], rdi
0x14033a6d2: lea rcx, [rbp + 0x5e0]
0x14033a6d9: lea r8, [rbp + 0x350]
0x14033a6e0: mov rdx, r13
0x14033a6e3: call 0x1402f4a80
0x14033a6e8: mov r12, qword ptr [r12 + 0x10]
0x14033a6ed: lea rcx, [rip + 0x5f45473]
0x14033a6f4: mov edx, 9
0x14033a6f9: call 0x145be8220
0x14033a6fe: mov rbx, rdx
0x14033a701: test rdx, rdx
0x14033a704: jns 0x14033aec8
0x14033a70a: xor r15d, r15d
0x14033a70d: mov rcx, r15
0x14033a710: mov rdx, rbx
0x14033a713: call 0x14620896b
0x14033a718: ud2 
0x14033a71a: mov rax, r8
0x14033a71d: sub r8, rax
0x14033a720: add rdx, rax
0x14033a723: lea rcx, [rbp + 0x350]
0x14033a72a: call 0x140056f40
0x14033a72f: cmp dword ptr [rbp + 0x350], 1
0x14033a736: jne 0x14033a741
0x14033a738: movups xmm0, xmmword ptr [rip + 0x5f26ba1]
0x14033a73f: jmp 0x14033a748
0x14033a741: movups xmm0, xmmword ptr [rbp + 0x354]
0x14033a748: movaps xmmword ptr [rbp + 0x5b0], xmm0
0x14033a74f: mov rdi, qword ptr [r12 + 8]
0x14033a754: movzx ecx, byte ptr [r14 + 0x8f]
0x14033a75c: call 0x145b059c0
0x14033a761: mov r8, qword ptr [rax + 0x60]
0x14033a765: mov r9, qword ptr [rax + 0x68]
0x14033a769: lea rbx, [rbp + 0x350]
0x14033a770: mov rcx, rbx
0x14033a773: mov rdx, rdi
0x14033a776: call 0x140217830
0x14033a77b: lea rcx, [rbp + 0x1c0]
0x14033a782: mov rdx, rbx
0x14033a785: call 0x142926130
0x14033a78a: movups xmm8, xmmword ptr [rip + 0x5f41126]
0x14033a792: movaps xmmword ptr [rbp + 0x350], xmm8
0x14033a79a: mov qword ptr [rbp + 0x360], 0
0x14033a7a5: movups xmm6, xmmword ptr [rip + 0x5f41124]
0x14033a7ac: movups xmmword ptr [rbp + 0x368], xmm6
0x14033a7b3: mov qword ptr [rbp + 0x378], 0
0x14033a7be: movups xmm11, xmmword ptr [rip + 0x5f41122]
0x14033a7c6: movaps xmmword ptr [rbp + 0x380], xmm11
0x14033a7ce: mov qword ptr [rbp + 0x390], 0
0x14033a7d9: movups xmm15, xmmword ptr [rip + 0x5f4111f]
0x14033a7e1: movups xmmword ptr [rbp + 0x398], xmm15
0x14033a7e9: mov qword ptr [rbp + 0x3a8], 0
0x14033a7f4: mov dword ptr [rbp + 0x284], 0
0x14033a7fe: mov rax, qword ptr [rbp + 0x5b0]
0x14033a805: mov qword ptr [rbp + 0x288], rax
0x14033a80c: mov eax, dword ptr [rbp + 0x5b8]
0x14033a812: mov dword ptr [rbp + 0x290], eax
0x14033a818: mov dword ptr [rbp + 0x248], 0
0x14033a822: mov rax, qword ptr [rbp + 0x5b0]
0x14033a829: mov qword ptr [rbp + 0x24c], rax
0x14033a830: mov ecx, dword ptr [rbp + 0x5b8]
0x14033a836: mov dword ptr [rbp + 0x254], ecx
0x14033a83c: mov dword ptr [rbp + 0x25c], 0
0x14033a846: mov qword ptr [rbp + 0x260], rax
0x14033a84d: mov dword ptr [rbp + 0x268], ecx
0x14033a853: mov dword ptr [rbp + 0x270], 0
0x14033a85d: mov qword ptr [rbp + 0x274], rax
0x14033a864: mov dword ptr [rbp + 0x27c], ecx
0x14033a86a: movaps xmm0, xmmword ptr [rbp + 0x350]
0x14033a871: movaps xmm1, xmmword ptr [rbp + 0x360]
0x14033a878: movaps xmm2, xmmword ptr [rbp + 0x370]
0x14033a87f: movaps xmm3, xmmword ptr [rbp + 0x380]
0x14033a886: movaps xmmword ptr [rbp + 0x40], xmm0
0x14033a88a: movaps xmmword ptr [rbp + 0x50], xmm1
0x14033a88e: movaps xmmword ptr [rbp + 0x60], xmm2
0x14033a892: movaps xmmword ptr [rbp + 0x70], xmm3
0x14033a896: movaps xmm0, xmmword ptr [rbp + 0x390]
0x14033a89d: movaps xmmword ptr [rbp + 0x80], xmm0
0x14033a8a4: movaps xmm0, xmmword ptr [rbp + 0x3a0]
0x14033a8ab: movaps xmmword ptr [rbp + 0x90], xmm0
0x14033a8b2: xorps xmm9, xmm9
0x14033a8b6: movaps xmmword ptr [rbp + 0xb0], xmm9
0x14033a8be: movaps xmmword ptr [rbp + 0xa0], xmm9
0x14033a8c6: mov qword ptr [rbp + 0xc0], 0
0x14033a8d1: movaps xmm0, xmmword ptr [rip + 0x5f40508]
0x14033a8d8: movups xmmword ptr [rbp + 0xc8], xmm0
0x14033a8df: movups xmmword ptr [rbp + 0xe8], xmm9
0x14033a8e7: movups xmmword ptr [rbp + 0xd8], xmm9
0x14033a8ef: movups xmm7, xmmword ptr [rip + 0x5f4108a]
0x14033a8f6: movups xmmword ptr [rbp + 0x108], xmm7
0x14033a8fd: movups xmm13, xmmword ptr [rip + 0x5f4106b]
0x14033a905: movups xmmword ptr [rbp + 0xf8], xmm13
0x14033a90d: movups xmm12, xmmword ptr [rip + 0x5f4108b]
0x14033a915: movups xmmword ptr [rbp + 0x128], xmm12
0x14033a91d: movups xmm14, xmmword ptr [rip + 0x5f4106b]
0x14033a925: movups xmmword ptr [rbp + 0x118], xmm14
0x14033a92d: movaps xmm0, xmmword ptr [rip + 0x5ef867c]
0x14033a934: movups xmmword ptr [rbp + 0x138], xmm0
0x14033a93b: movups xmmword ptr [rbp + 0x148], xmm0
0x14033a942: movaps xmm0, xmmword ptr [rip + 0x5ef8697]
0x14033a949: movups xmmword ptr [rbp + 0x158], xmm0
0x14033a950: movups xmmword ptr [rbp + 0x168], xmm0
0x14033a957: movaps xmm10, xmmword ptr [rip + 0x5ef85f1]
0x14033a95f: movups xmmword ptr [rbp + 0x178], xmm10
0x14033a967: mov dword ptr [rbp + 0x188], 1
0x14033a971: mov qword ptr [rbp + 0x18c], 0
0x14033a97c: mov byte ptr [rbp + 0x194], 1
0x14033a983: mov qword ptr [rbp + 0x19e], 0
0x14033a98e: mov qword ptr [rbp + 0x198], 0
0x14033a999: mov word ptr [rbp + 0x1aa], 0
0x14033a9a2: mov dword ptr [rbp + 0x1a6], 0x10000
0x14033a9ac: mov word ptr [rbp + 0x1b0], 0
0x14033a9b5: mov dword ptr [rbp + 0x1ac], 0x10000
0x14033a9bf: mov dword ptr [rbp + 0x1ba], 0
0x14033a9c9: mov qword ptr [rbp + 0x1b2], 0
0x14033a9d4: mov dword ptr [rbp + 0x258], 0x3f333333
0x14033a9de: mov dword ptr [rbp + 0x26c], 0x3f333333
0x14033a9e8: mov dword ptr [rbp + 0x280], 0x3f333333
0x14033a9f2: mov dword ptr [rbp + 0x294], 0x3f333333
0x14033a9fc: mov rdi, qword ptr [rbp + 0x2f8]
0x14033aa03: lea rcx, [rbp + 0x358]
0x14033aa0a: lea rdx, [rbp + 0x40]
0x14033aa0e: mov r8d, 0x258
0x14033aa14: call 0x14606171b
0x14033aa19: mov qword ptr [rbp + 0x350], rdi
0x14033aa20: lea rcx, [rbp + 0x5e0]
0x14033aa27: lea r8, [rbp + 0x350]
0x14033aa2e: mov rdx, r13
0x14033aa31: call 0x1402f9fc0
0x14033aa36: movups xmmword ptr [rbp + 0x3e0], xmm9
0x14033aa3e: movups xmmword ptr [rbp + 0x3d0], xmm9
0x14033aa46: movups xmmword ptr [rbp + 0x3c0], xmm9
0x14033aa4e: movups xmmword ptr [rbp + 0x3f4], xmm9
0x14033aa56: movups xmmword ptr [rbp + 0x400], xmm9
0x14033aa5e: mov dword ptr [rbp + 0x4d0], 0
0x14033aa68: mov word ptr [rbp + 0x4d4], 0
0x14033aa71: movaps xmmword ptr [rbp + 0x40], xmm8
0x14033aa76: mov qword ptr [rbp + 0x50], 0
0x14033aa7e: movups xmmword ptr [rbp + 0x58], xmm6
0x14033aa82: mov qword ptr [rbp + 0x68], 0
0x14033aa8a: movaps xmmword ptr [rbp + 0x70], xmm11
0x14033aa8f: mov qword ptr [rbp + 0x80], 0
0x14033aa9a: movups xmmword ptr [rbp + 0x88], xmm15
0x14033aaa2: mov qword ptr [rbp + 0x98], 0
0x14033aaad: mov rax, qword ptr [rbp + 0x90]
0x14033aab4: mov qword ptr [rbp + 0x3a8], rax
0x14033aabb: mov rax, qword ptr [rbp + 0x98]
0x14033aac2: mov qword ptr [rbp + 0x3b0], rax
0x14033aac9: mov rax, qword ptr [rbp + 0x80]
0x14033aad0: mov qword ptr [rbp + 0x398], rax
0x14033aad7: mov rax, qword ptr [rbp + 0x88]
0x14033aade: mov qword ptr [rbp + 0x3a0], rax
0x14033aae5: movaps xmm0, xmmword ptr [rbp + 0x40]
0x14033aae9: movaps xmm1, xmmword ptr [rbp + 0x50]
0x14033aaed: mov rax, qword ptr [rbp + 0x60]
0x14033aaf1: mov rcx, qword ptr [rbp + 0x68]
0x14033aaf5: movaps xmm2, xmmword ptr [rbp + 0x70]
0x14033aaf9: movups xmmword ptr [rbp + 0x388], xmm2
0x14033ab00: mov qword ptr [rbp + 0x378], rax
0x14033ab07: mov qword ptr [rbp + 0x380], rcx
0x14033ab0e: movups xmmword ptr [rbp + 0x368], xmm1
0x14033ab15: movups xmmword ptr [rbp + 0x358], xmm0
0x14033ab1c: mov qword ptr [rbp + 0x3b8], 0
0x14033ab27: mov dword ptr [rbp + 0x3f0], 1
0x14033ab31: movups xmmword ptr [rbp + 0x420], xmm7
0x14033ab38: movups xmmword ptr [rbp + 0x410], xmm13
0x14033ab40: movups xmmword ptr [rbp + 0x440], xmm12
0x14033ab48: movups xmmword ptr [rbp + 0x430], xmm14
0x14033ab50: movups xmm8, xmmword ptr [rip + 0x5f40e68]
0x14033ab58: movups xmmword ptr [rbp + 0x460], xmm8
0x14033ab60: movups xmm15, xmmword ptr [rip + 0x5f40e48]
0x14033ab68: movups xmmword ptr [rbp + 0x450], xmm15
0x14033ab70: movups xmm6, xmmword ptr [rip + 0x5f40e69]
0x14033ab77: movups xmmword ptr [rbp + 0x480], xmm6
0x14033ab7e: movups xmm11, xmmword ptr [rip + 0x5f40e4a]
0x14033ab86: movups xmmword ptr [rbp + 0x470], xmm11
0x14033ab8e: movaps xmm0, xmmword ptr [rip + 0x5f20b0b]
0x14033ab95: movups xmmword ptr [rbp + 0x490], xmm0
0x14033ab9c: mov dword ptr [rbp + 0x4a0], 1
0x14033aba6: mov qword ptr [rbp + 0x4a4], 0
0x14033abb1: mov byte ptr [rbp + 0x4ac], 1
0x14033abb8: movsd xmm0, qword ptr [rip + 0x5f11b00]
0x14033abc0: movsd qword ptr [rbp + 0x4b0], xmm0
0x14033abc8: mov dword ptr [rbp + 0x4b8], 0x3f800000
0x14033abd2: mov word ptr [rbp + 0x4bc], 0
0x14033abdb: mov word ptr [rbp + 0x4c2], 0
0x14033abe4: mov dword ptr [rbp + 0x4be], 0x10000
0x14033abee: mov word ptr [rbp + 0x4c8], 0
0x14033abf7: mov dword ptr [rbp + 0x4c4], 0x10000
0x14033ac01: mov dword ptr [rbp + 0x4ca], 0
0x14033ac0b: mov word ptr [rbp + 0x4ce], 1
0x14033ac14: mov qword ptr [rbp + 0x350], rdi
0x14033ac1b: lea rcx, [rbp - 0x50]
0x14033ac1f: lea r8, [rbp + 0x350]
0x14033ac26: mov rdx, r13
0x14033ac29: call 0x1402f4270
0x14033ac2e: mov r15, qword ptr [r12 + 0x10]
0x14033ac33: mov qword ptr [rbp + 0x330], r12
0x14033ac3a: mov rax, qword ptr [r12 + 0x18]
0x14033ac3f: mov qword ptr [rbp + 0x328], rax
0x14033ac46: mov rbx, qword ptr [rbp - 0x50]
0x14033ac4a: mov rax, qword ptr [rbp - 0x28]
0x14033ac4e: mov qword ptr [rbp - 0x20], rbx
0x14033ac52: lea rdi, [rbp - 0x18]
0x14033ac56: movups xmm0, xmmword ptr [rbp - 0x48]
0x14033ac5a: movups xmmword ptr [rbp - 0x18], xmm0
0x14033ac5e: movups xmm0, xmmword ptr [rbp - 0x38]
0x14033ac62: movups xmmword ptr [rbp - 8], xmm0
0x14033ac66: mov qword ptr [rbp + 8], rax
0x14033ac6a: movaps xmmword ptr [rbp + 0xe0], xmm9
0x14033ac72: movaps xmmword ptr [rbp + 0xd0], xmm9
0x14033ac7a: movaps xmmword ptr [rbp + 0xc0], xmm9
0x14033ac82: movaps xmmword ptr [rbp + 0xb0], xmm9
0x14033ac8a: movaps xmmword ptr [rbp + 0xa0], xmm9
0x14033ac92: movups xmm9, xmmword ptr [rip + 0x5f40c1e]
0x14033ac9a: movups xmm1, xmmword ptr [rip + 0x5f40c47]
0x14033aca1: movups xmm2, xmmword ptr [rip + 0x5f40c28]
0x14033aca8: mov qword ptr [rbp + 0xf0], 0
0x14033acb3: movups xmmword ptr [rbp + 0xf8], xmm13
0x14033acbb: movups xmmword ptr [rbp + 0x108], xmm7
0x14033acc2: movups xmmword ptr [rbp + 0x118], xmm14
0x14033acca: movups xmmword ptr [rbp + 0x128], xmm12
0x14033acd2: movups xmmword ptr [rbp + 0x138], xmm15
0x14033acda: movaps xmm15, xmm11
0x14033acde: movups xmmword ptr [rbp + 0x148], xmm8
0x14033ace6: movups xmmword ptr [rbp + 0x168], xmm6
0x14033aced: movups xmmword ptr [rbp + 0x158], xmm11
0x14033acf5: movaps xmmword ptr [rbp + 0x40], xmm9
0x14033acfa: mov qword ptr [rbp + 0x50], 0
0x14033ad02: movaps xmm11, xmm2
0x14033ad06: movups xmmword ptr [rbp + 0x58], xmm2
0x14033ad0a: mov qword ptr [rbp + 0x68], 0
0x14033ad12: movaps xmm6, xmm1
0x14033ad15: movaps xmmword ptr [rbp + 0x70], xmm1
0x14033ad19: mov qword ptr [rbp + 0x80], 0
0x14033ad24: movups xmm0, xmmword ptr [rip + 0x5f40bd5]
0x14033ad2b: movups xmmword ptr [rbp + 0x88], xmm0
0x14033ad32: mov qword ptr [rbp + 0x98], 0
0x14033ad3d: lea rcx, [rbp + 0x358]
0x14033ad44: lea rdx, [rbp + 0x40]
0x14033ad48: mov r8d, 0x138
0x14033ad4e: call 0x14606171b
0x14033ad53: movups xmmword ptr [rbp + 0x490], xmm10
0x14033ad5b: mov dword ptr [rbp + 0x4a0], 1
0x14033ad65: movss xmm0, dword ptr [rip + 0x5f11a73]
0x14033ad6d: movlps qword ptr [rbp + 0x4a4], xmm0
0x14033ad74: mov byte ptr [rbp + 0x4ac], 1
0x14033ad7b: mov qword ptr [rbp + 0x4b0], 0
0x14033ad86: mov dword ptr [rbp + 0x4b8], 0x3f800000
0x14033ad90: mov word ptr [rbp + 0x4bc], 0
0x14033ad99: mov dword ptr [rbp + 0x4be], 0x10000
0x14033ada3: mov word ptr [rbp + 0x4c2], 0
0x14033adac: mov dword ptr [rbp + 0x4c4], 0x10000
0x14033adb6: mov word ptr [rbp + 0x4c8], 0
0x14033adbf: mov qword ptr [rbp + 0x4ca], 0
0x14033adca: mov dword ptr [rbp + 0x4d2], 5
0x14033add4: mov qword ptr [rbp + 0x350], rbx
0x14033addb: lea rcx, [rbp + 0x2a0]
0x14033ade2: lea r13, [rbp + 0x350]
0x14033ade9: mov rdx, rdi
0x14033adec: mov r8, r13
0x14033adef: call 0x1402f4270
0x14033adf4: mov rax, qword ptr [rbp + 0x2a0]
0x14033adfb: mov rcx, qword ptr [rbp + 0x2c8]
0x14033ae02: mov qword ptr [rbp + 0x5e0], rax
0x14033ae09: movups xmm0, xmmword ptr [rbp + 0x2a8]
0x14033ae10: movups xmmword ptr [rbp + 0x5e8], xmm0
0x14033ae17: movups xmm0, xmmword ptr [rbp + 0x2b8]
0x14033ae1e: movups xmmword ptr [rbp + 0x5f8], xmm0
0x14033ae25: mov qword ptr [rbp + 0x608], rcx
0x14033ae2c: mov r12, qword ptr [r14 + 0x58]
0x14033ae30: test r12, r12
0x14033ae33: je 0x14033aeab
0x14033ae35: lea rdi, [rbp + 0x350]
0x14033ae3c: mov rcx, rdi
0x14033ae3f: mov rdx, r14
0x14033ae42: call 0x146034930
0x14033ae47: mov r9, qword ptr [r14 + 0x50]
0x14033ae4b: mov qword ptr [rsp + 0x20], r12
0x14033ae50: mov dword ptr [rsp + 0x28], 0x41880000
0x14033ae58: lea rcx, [rbp + 0x5e0]
0x14033ae5f: mov rdx, r15
0x14033ae62: mov r8, rdi
0x14033ae65: call 0x1402b8eb0
0x14033ae6a: movzx edi, byte ptr [r14 + 0x8d]
0x14033ae72: cmp byte ptr [r14 + 0x8c], 0
0x14033ae7a: je 0x14033b0d0
0x14033ae80: test dil, dil
0x14033ae83: je 0x14033af36
0x14033ae89: lea rcx, [rip + 0x5f41107]
0x14033ae90: mov edx, 0xa
0x14033ae95: call 0x145be8220
0x14033ae9a: mov r9, rdx
0x14033ae9d: test rdx, rdx
0x14033aea0: jne 0x14033af53
0x14033aea6: jmp 0x14033b11d
0x14033aeab: movzx edi, byte ptr [r14 + 0x8d]
0x14033aeb3: test dil, dil
0x14033aeb6: je 0x14033af5f
0x14033aebc: movups xmm0, xmmword ptr [rip + 0x5f40c29]
0x14033aec3: jmp 0x14033af66
0x14033aec8: je 0x14033b5e1
0x14033aece: mov rdi, rax
0x14033aed1: call 0x140002200
0x14033aed6: mov r15d, 1
0x14033aedc: mov edx, 1
0x14033aee1: mov rcx, rbx
0x14033aee4: call 0x1400021c0
0x14033aee9: test rax, rax
0x14033aeec: je 0x14033a70d
0x14033aef2: mov r14, rax
0x14033aef5: mov rcx, rax
0x14033aef8: mov rdx, rdi
0x14033aefb: mov r8, rbx
0x14033aefe: call 0x14606171b
0x14033af03: cmp byte ptr [r12], 1
0x14033af08: jne 0x14033b5f2
0x14033af0e: mov eax, dword ptr [r12 + 1]
0x14033af13: mov ecx, dword ptr [r12 + 4]
0x14033af18: mov dword ptr [rbp + 0x65b], ecx
0x14033af1e: mov dword ptr [rbp + 0x658], eax
0x14033af24: mov rax, qword ptr [r12 + 8]
0x14033af29: movzx ecx, byte ptr [r12 + 0x10]
0x14033af2f: mov dl, 1
0x14033af31: jmp 0x14033b603
0x14033af36: lea rcx, [rip + 0x5f40cca]
0x14033af3d: mov edx, 4
0x14033af42: call 0x145be8220
0x14033af47: mov r9, rdx
0x14033af4a: test rdx, rdx
0x14033af4d: je 0x14033b11d
0x14033af53: movups xmm0, xmmword ptr [rip + 0x5f40b0e]
0x14033af5a: jmp 0x14033b0f5
0x14033af5f: movups xmm0, xmmword ptr [rip + 0x5f40bee]
0x14033af66: movaps xmmword ptr [rbp + 0x660], xmm0
0x14033af6d: mov dword ptr [rbp + 0x670], 0x3f800000
0x14033af77: lea rcx, [rbp + 0x40]
0x14033af7b: mov rdx, r14
0x14033af7e: call 0x146034930
0x14033af83: cmp byte ptr [r15], 1
0x14033af87: jne 0x14033afaa
0x14033af89: mov eax, dword ptr [r15 + 1]
0x14033af8d: mov ecx, dword ptr [r15 + 4]
0x14033af91: mov dword ptr [rbp + 0x33b], ecx
0x14033af97: mov dword ptr [rbp + 0x338], eax
0x14033af9d: mov rax, qword ptr [r15 + 8]
0x14033afa1: movzx r8d, byte ptr [r15 + 0x10]
0x14033afa6: mov cl, 1
0x14033afa8: jmp 0x14033afba
0x14033afaa: mov rax, qword ptr [r15 + 8]
0x14033afae: lock inc qword ptr [rax]
0x14033afb2: jle 0x14033bc83
0x14033afb8: xor ecx, ecx
0x14033afba: lea rdx, [rbp + 0x5e8]
0x14033afc1: mov r9, qword ptr [rbp + 0x50]
0x14033afc5: mov qword ptr [rbp + 0x368], r9
0x14033afcc: movups xmm0, xmmword ptr [rbp + 0x40]
0x14033afd0: movups xmmword ptr [rbp + 0x358], xmm0
0x14033afd7: mov r9d, dword ptr [rbp + 0x338]
0x14033afde: mov r10d, dword ptr [rbp + 0x33b]
0x14033afe5: mov dword ptr [rbp + 0x389], r9d
0x14033afec: mov dword ptr [rbp + 0x38c], r10d
0x14033aff3: movaps xmm0, xmmword ptr [rbp + 0x660]
0x14033affa: movups xmmword ptr [rbp + 0x5c9], xmm0
0x14033b001: mov r9d, dword ptr [rbp + 0x670]
0x14033b008: mov dword ptr [rbp + 0x5d9], r9d
0x14033b00f: mov r9, qword ptr [rbp + 0x5e0]
0x14033b016: mov qword ptr [rbp + 0x370], 0
0x14033b021: mov qword ptr [rbp + 0x378], 4
0x14033b02c: mov qword ptr [rbp + 0x380], 0
0x14033b037: mov byte ptr [rbp + 0x388], cl
0x14033b03d: mov qword ptr [rbp + 0x390], rax
0x14033b044: mov qword ptr [rbp + 0x398], r8
0x14033b04b: mov dword ptr [rbp + 0x3a0], 0x41880000
0x14033b055: mov word ptr [rbp + 0x3a4], 0x190
0x14033b05e: mov byte ptr [rbp + 0x3a6], 1
0x14033b065: mov rax, qword ptr [rbp + 0x5d5]
0x14033b06c: mov qword ptr [rbp + 0x3b4], rax
0x14033b073: movups xmm0, xmmword ptr [rbp + 0x5c8]
0x14033b07a: movups xmmword ptr [rbp + 0x3a7], xmm0
0x14033b081: mov eax, dword ptr [rip + 0x5f257e9]
0x14033b087: mov dword ptr [rbp + 0x3cc], eax
0x14033b08d: movups xmm0, xmmword ptr [rip + 0x5f257cc]
0x14033b094: movups xmmword ptr [rbp + 0x3bc], xmm0
0x14033b09b: movsd xmm0, qword ptr [rip + 0x5ef7e8d]
0x14033b0a3: movsd qword ptr [rbp + 0x3d0], xmm0
0x14033b0ab: mov qword ptr [rbp + 0x350], r9
0x14033b0b2: lea rcx, [rbp + 0x40]
0x14033b0b6: lea r8, [rbp + 0x350]
0x14033b0bd: call 0x1402f9a60
0x14033b0c2: cmp byte ptr [r14 + 0x8c], 0
0x14033b0ca: jne 0x14033ae80
0x14033b0d0: test dil, dil
0x14033b0d3: je 0x14033b11d
0x14033b0d5: lea rcx, [rip + 0x5f40eb8]
0x14033b0dc: mov edx, 3
0x14033b0e1: call 0x145be8220
0x14033b0e6: test rdx, rdx
0x14033b0e9: je 0x14033b11d
0x14033b0eb: mov r9, rdx
0x14033b0ee: movups xmm0, xmmword ptr [rip + 0x5f40943]
0x14033b0f5: movaps xmmword ptr [rbp + 0x350], xmm0
0x14033b0fc: mov dword ptr [rbp + 0x360], 0x3f800000
0x14033b106: mov qword ptr [rsp + 0x20], r13
0x14033b10b: lea rcx, [rbp + 0x5e0]
0x14033b112: mov rdx, r15
0x14033b115: mov r8, rax
0x14033b118: call 0x1402b98a0
0x14033b11d: xorps xmm0, xmm0
0x14033b120: movaps xmmword ptr [rbp + 0xe0], xmm0
0x14033b127: movaps xmmword ptr [rbp + 0xd0], xmm0
0x14033b12e: movaps xmmword ptr [rbp + 0xc0], xmm0
0x14033b135: movaps xmmword ptr [rbp + 0xb0], xmm0
0x14033b13c: movaps xmmword ptr [rbp + 0xa0], xmm0
0x14033b143: mov qword ptr [rbp + 0xf0], 0
0x14033b14e: movups xmmword ptr [rbp + 0xf8], xmm13
0x14033b156: movups xmmword ptr [rbp + 0x108], xmm7
0x14033b15d: movups xmmword ptr [rbp + 0x118], xmm14
0x14033b165: movups xmmword ptr [rbp + 0x128], xmm12
0x14033b16d: movups xmm0, xmmword ptr [rip + 0x5f4083c]
0x14033b174: movups xmmword ptr [rbp + 0x138], xmm0
0x14033b17b: movups xmmword ptr [rbp + 0x148], xmm8
0x14033b183: movups xmm0, xmmword ptr [rip + 0x5f40856]
0x14033b18a: movups xmmword ptr [rbp + 0x168], xmm0
0x14033b191: movups xmmword ptr [rbp + 0x158], xmm15
0x14033b199: movaps xmmword ptr [rbp + 0x40], xmm9
0x14033b19e: mov qword ptr [rbp + 0x50], 0
0x14033b1a6: movups xmmword ptr [rbp + 0x58], xmm11
0x14033b1ab: mov qword ptr [rbp + 0x68], 0
0x14033b1b3: movaps xmmword ptr [rbp + 0x70], xmm6
0x14033b1b7: mov qword ptr [rbp + 0x80], 0
0x14033b1c2: movups xmm0, xmmword ptr [rip + 0x5f40737]
0x14033b1c9: movups xmmword ptr [rbp + 0x88], xmm0
0x14033b1d0: mov qword ptr [rbp + 0x98], 0
0x14033b1db: lea rcx, [rbp + 0x358]
0x14033b1e2: lea rdx, [rbp + 0x40]
0x14033b1e6: mov r8d, 0x138
0x14033b1ec: call 0x14606171b
0x14033b1f1: movaps xmm0, xmmword ptr [rip + 0x5ef7d58]
0x14033b1f8: movups xmmword ptr [rbp + 0x490], xmm0
0x14033b1ff: mov dword ptr [rbp + 0x4a0], 1
0x14033b209: movss xmm0, dword ptr [rip + 0x5ef7edf]
0x14033b211: movlps qword ptr [rbp + 0x4a4], xmm0
0x14033b218: mov byte ptr [rbp + 0x4ac], 1
0x14033b21f: mov qword ptr [rbp + 0x4b0], 0
0x14033b22a: mov dword ptr [rbp + 0x4b8], 0x3f800000
0x14033b234: mov word ptr [rbp + 0x4bc], 0
0x14033b23d: mov dword ptr [rbp + 0x4be], 0x10000
0x14033b247: mov word ptr [rbp + 0x4c2], 0
0x14033b250: mov dword ptr [rbp + 0x4c4], 0x10000
0x14033b25a: mov word ptr [rbp + 0x4c8], 0
0x14033b263: mov qword ptr [rbp + 0x4ca], 0
0x14033b26e: mov dword ptr [rbp + 0x4d2], 5
0x14033b278: mov qword ptr [rbp + 0x350], rbx
0x14033b27f: lea rcx, [rbp + 0x2a0]
0x14033b286: lea r8, [rbp + 0x350]
0x14033b28d: lea rdx, [rbp - 0x18]
0x14033b291: call 0x1402f4270
0x14033b296: mov r12, qword ptr [rbp + 0x2a0]
0x14033b29d: mov rax, qword ptr [rbp + 0x2c8]
0x14033b2a4: mov qword ptr [rbp + 0x5e0], r12
0x14033b2ab: movups xmm0, xmmword ptr [rbp + 0x2a8]
0x14033b2b2: movups xmmword ptr [rbp + 0x5e8], xmm0
0x14033b2b9: movups xmm0, xmmword ptr [rbp + 0x2b8]
0x14033b2c0: movups xmmword ptr [rbp + 0x5f8], xmm0
0x14033b2c7: mov qword ptr [rbp + 0x608], rax
0x14033b2ce: lea rdx, [r14 + 0x18]
0x14033b2d2: lea rcx, [rbp + 0x40]
0x14033b2d6: call 0x146034930
0x14033b2db: cmp byte ptr [r15], 1
0x14033b2df: jne 0x14033b309
0x14033b2e1: mov eax, dword ptr [r15 + 1]
0x14033b2e5: mov ecx, dword ptr [r15 + 4]
0x14033b2e9: mov dword ptr [rbp + 0x663], ecx
0x14033b2ef: mov dword ptr [rbp + 0x660], eax
0x14033b2f5: mov rax, qword ptr [r15 + 8]
0x14033b2f9: movzx edx, byte ptr [r15 + 0x10]
0x14033b2fe: mov cl, 1
0x14033b300: lea r13, [rbp + 0x300]
0x14033b307: jmp 0x14033b320
0x14033b309: mov rax, qword ptr [r15 + 8]
0x14033b30d: lock inc qword ptr [rax]
0x14033b311: lea r13, [rbp + 0x300]
0x14033b318: jle 0x14033bc83
0x14033b31e: xor ecx, ecx
0x14033b320: lea rdi, [rbp + 0x5e8]
0x14033b327: mov r8, qword ptr [rbp + 0x50]
0x14033b32b: mov qword ptr [rbp + 0x368], r8
0x14033b332: movups xmm0, xmmword ptr [rbp + 0x40]
0x14033b336: movups xmmword ptr [rbp + 0x358], xmm0
0x14033b33d: mov r8d, dword ptr [rbp + 0x660]
0x14033b344: mov r9d, dword ptr [rbp + 0x663]
0x14033b34b: mov dword ptr [rbp + 0x389], r8d
0x14033b352: mov dword ptr [rbp + 0x38c], r9d
0x14033b359: movups xmm6, xmmword ptr [rip + 0x5f4075c]
0x14033b360: movups xmmword ptr [rbp + 0x5c9], xmm6
0x14033b367: mov dword ptr [rbp + 0x5d9], 0x3f800000
0x14033b371: mov qword ptr [rbp + 0x370], 0
0x14033b37c: mov qword ptr [rbp + 0x378], 4
0x14033b387: mov qword ptr [rbp + 0x380], 0
0x14033b392: mov byte ptr [rbp + 0x388], cl
0x14033b398: mov qword ptr [rbp + 0x390], rax
0x14033b39f: mov qword ptr [rbp + 0x398], rdx
0x14033b3a6: mov dword ptr [rbp + 0x3a0], 0x41500000
0x14033b3b0: mov word ptr [rbp + 0x3a4], 0x190
0x14033b3b9: mov byte ptr [rbp + 0x3a6], 1
0x14033b3c0: mov rax, qword ptr [rbp + 0x5d5]
0x14033b3c7: mov qword ptr [rbp + 0x3b4], rax
0x14033b3ce: movups xmm0, xmmword ptr [rbp + 0x5c8]
0x14033b3d5: movups xmmword ptr [rbp + 0x3a7], xmm0
0x14033b3dc: mov ebx, dword ptr [rip + 0x5f2548e]
0x14033b3e2: mov dword ptr [rbp + 0x3cc], ebx
0x14033b3e8: movups xmm7, xmmword ptr [rip + 0x5f25471]
0x14033b3ef: movups xmmword ptr [rbp + 0x3bc], xmm7
0x14033b3f6: movsd xmm8, qword ptr [rip + 0x5ef7b31]
0x14033b3ff: movsd qword ptr [rbp + 0x3d0], xmm8
0x14033b408: mov qword ptr [rbp + 0x350], r12
0x14033b40f: lea rcx, [rbp + 0x40]
0x14033b413: lea r8, [rbp + 0x350]
0x14033b41a: mov rdx, rdi
0x14033b41d: call 0x1402f9a60
0x14033b422: lea rdx, [r14 + 0x30]
0x14033b426: lea rcx, [rbp + 0x40]
0x14033b42a: call 0x146034930
0x14033b42f: cmp byte ptr [r15], 1
0x14033b433: jne 0x14033b456
0x14033b435: mov eax, dword ptr [r15 + 1]
0x14033b439: mov ecx, dword ptr [r15 + 4]
0x14033b43d: mov dword ptr [rbp + 0x653], ecx
0x14033b443: mov dword ptr [rbp + 0x650], eax
0x14033b449: mov rax, qword ptr [r15 + 8]
0x14033b44d: movzx ecx, byte ptr [r15 + 0x10]
0x14033b452: mov dl, 1
0x14033b454: jmp 0x14033b466
0x14033b456: mov rax, qword ptr [r15 + 8]
0x14033b45a: lock inc qword ptr [rax]
0x14033b45e: jle 0x14033bc83
0x14033b464: xor edx, edx
0x14033b466: mov r8, qword ptr [rbp + 0x50]
0x14033b46a: mov qword ptr [rbp + 0x368], r8
0x14033b471: movups xmm0, xmmword ptr [rbp + 0x40]
0x14033b475: movups xmmword ptr [rbp + 0x358], xmm0
0x14033b47c: movaps xmm0, xmmword ptr [rbp + 0x5b0]
0x14033b483: movups xmmword ptr [rbp + 0x3ac], xmm0
0x14033b48a: mov qword ptr [rbp + 0x370], 0
0x14033b495: mov qword ptr [rbp + 0x378], 4
0x14033b4a0: mov qword ptr [rbp + 0x380], 0
0x14033b4ab: mov byte ptr [rbp + 0x388], dl
0x14033b4b1: mov edx, dword ptr [rbp + 0x650]
0x14033b4b7: mov r8d, dword ptr [rbp + 0x653]
0x14033b4be: mov dword ptr [rbp + 0x389], edx
0x14033b4c4: mov dword ptr [rbp + 0x38c], r8d
0x14033b4cb: mov qword ptr [rbp + 0x390], rax
0x14033b4d2: mov qword ptr [rbp + 0x398], rcx
0x14033b4d9: mov dword ptr [rbp + 0x3a0], 0x41500000
0x14033b4e3: mov word ptr [rbp + 0x3a4], 0x190
0x14033b4ec: mov byte ptr [rbp + 0x3a6], 1
0x14033b4f3: mov dword ptr [rbp + 0x3a8], 0
0x14033b4fd: mov dword ptr [rbp + 0x3cc], ebx
0x14033b503: movups xmmword ptr [rbp + 0x3bc], xmm7
0x14033b50a: movsd qword ptr [rbp + 0x3d0], xmm8
0x14033b513: mov qword ptr [rbp + 0x350], r12
0x14033b51a: lea rcx, [rbp + 0x40]
0x14033b51e: lea r8, [rbp + 0x350]
0x14033b525: mov rdx, rdi
0x14033b528: call 0x1402f9a60
0x14033b52d: cmp byte ptr [r14 + 0x8e], 0
0x14033b535: jne 0x14033b8e0
0x14033b53b: mov rdi, qword ptr [rbp + 0x328]
0x14033b542: cmp byte ptr [rdi + 0x1bb], 0
0x14033b549: je 0x14033b5b8
0x14033b54b: lea rcx, [rip + 0x5f40a68]
0x14033b552: mov edx, 0x1f
0x14033b557: call 0x145be8220
0x14033b55c: mov r8, rdx
0x14033b55f: lea rcx, [rdi + 0xb8]
0x14033b566: lea rdx, [rip + 0x5f40a6c]
0x14033b56d: mov qword ptr [rbp + 0x350], rdx
0x14033b574: mov qword ptr [rbp + 0x358], 0xa
0x14033b57f: mov qword ptr [rbp + 0x360], rcx
0x14033b586: lea rcx, [rip + 0x5f408c3]
0x14033b58d: mov qword ptr [rbp + 0x368], rcx
0x14033b594: mov qword ptr [rsp + 0x20], 1
0x14033b59d: lea rcx, [rbp + 0x660]
0x14033b5a4: lea r9, [rbp + 0x350]
0x14033b5ab: mov rdx, rax
0x14033b5ae: call 0x145be86b0
0x14033b5b3: jmp 0x14033b761
0x14033b5b8: lea rcx, [rip + 0x5f409e2]
0x14033b5bf: mov edx, 0x19
0x14033b5c4: call 0x145be8220
0x14033b5c9: mov rdi, rdx
0x14033b5cc: test rdx, rdx
0x14033b5cf: jns 0x14033b705
0x14033b5d5: xor ecx, ecx
0x14033b5d7: mov rdx, rdi
0x14033b5da: call 0x14620896b
0x14033b5df: ud2 
0x14033b5e1: mov r14d, 1
0x14033b5e7: cmp byte ptr [r12], 1
0x14033b5ec: je 0x14033af0e
0x14033b5f2: mov rax, qword ptr [r12 + 8]
0x14033b5f7: lock inc qword ptr [rax]
0x14033b5fb: jle 0x14033bc83
0x14033b601: xor edx, edx
0x14033b603: movups xmm0, xmmword ptr [rip + 0x5f425e6]
0x14033b60a: movups xmmword ptr [rbp + 0x5e1], xmm0
0x14033b611: mov dword ptr [rbp + 0x5f1], 0x3f0ccccd
0x14033b61b: mov r8, qword ptr [rbp + 0x2f8]
0x14033b622: mov qword ptr [rbp + 0x358], rbx
0x14033b629: mov qword ptr [rbp + 0x360], r14
0x14033b630: mov qword ptr [rbp + 0x368], rbx
0x14033b637: mov qword ptr [rbp + 0x370], 0
0x14033b642: mov qword ptr [rbp + 0x378], 4
0x14033b64d: mov qword ptr [rbp + 0x380], 0
0x14033b658: mov byte ptr [rbp + 0x388], dl
0x14033b65e: mov edx, dword ptr [rbp + 0x658]
0x14033b664: mov r9d, dword ptr [rbp + 0x65b]
0x14033b66b: mov dword ptr [rbp + 0x389], edx
0x14033b671: mov dword ptr [rbp + 0x38c], r9d
0x14033b678: mov qword ptr [rbp + 0x390], rax
0x14033b67f: mov qword ptr [rbp + 0x398], rcx
0x14033b686: mov dword ptr [rbp + 0x3a0], 0x41700000
0x14033b690: mov word ptr [rbp + 0x3a4], 0x190
0x14033b699: mov byte ptr [rbp + 0x3a6], 1
0x14033b6a0: movups xmm0, xmmword ptr [rbp + 0x5e0]
0x14033b6a7: movups xmmword ptr [rbp + 0x3a7], xmm0
0x14033b6ae: mov rax, qword ptr [rbp + 0x5ed]
0x14033b6b5: mov qword ptr [rbp + 0x3b4], rax
0x14033b6bc: movups xmm0, xmmword ptr [rip + 0x5f2519d]
0x14033b6c3: movups xmmword ptr [rbp + 0x3bc], xmm0
0x14033b6ca: mov eax, dword ptr [rip + 0x5f251a0]
0x14033b6d0: mov dword ptr [rbp + 0x3cc], eax
0x14033b6d6: movsd xmm0, qword ptr [rip + 0x5ef7852]
0x14033b6de: movsd qword ptr [rbp + 0x3d0], xmm0
0x14033b6e6: mov qword ptr [rbp + 0x350], r8
0x14033b6ed: lea rcx, [rbp + 0x40]
0x14033b6f1: lea r8, [rbp + 0x350]
0x14033b6f8: mov rdx, r13
0x14033b6fb: call 0x1402f9a60
0x14033b700: jmp 0x14033bc1e
0x14033b705: je 0x14033b73f
0x14033b707: mov qword ptr [rbp + 0x38], rax
0x14033b70b: call 0x140002200
0x14033b710: mov edx, 1
0x14033b715: mov rcx, rdi
0x14033b718: call 0x1400021c0
0x14033b71d: mov ecx, 1
0x14033b722: test rax, rax
0x14033b725: je 0x14033b5d7
0x14033b72b: mov r13, rax
0x14033b72e: mov rcx, rax
0x14033b731: mov rdx, qword ptr [rbp + 0x38]
0x14033b735: mov r8, rdi
0x14033b738: call 0x14606171b
0x14033b73d: jmp 0x14033b745
0x14033b73f: mov r13d, 1
0x14033b745: mov qword ptr [rbp + 0x660], rdi
0x14033b74c: mov qword ptr [rbp + 0x668], r13
0x14033b753: mov qword ptr [rbp + 0x670], rdi
0x14033b75a: lea r13, [rbp + 0x300]
0x14033b761: lea rax, [rbp + 0x660]
0x14033b768: mov qword ptr [rbp + 0x350], rax
0x14033b76f: lea rax, [rip - 0x339696]
0x14033b776: mov qword ptr [rbp + 0x358], rax
0x14033b77d: lea rdx, [rip + 0x5f4085f]
0x14033b784: lea rcx, [rbp + 0x5c8]
0x14033b78b: lea r8, [rbp + 0x350]
0x14033b792: call 0x146034470
0x14033b797: nop 
0x14033b798: lea rdx, [rbp + 0x5e8]
0x14033b79f: cmp byte ptr [r15], 1
0x14033b7a3: jne 0x14033b7c7
0x14033b7a5: mov eax, dword ptr [r15 + 1]
0x14033b7a9: mov ecx, dword ptr [r15 + 4]
0x14033b7ad: mov dword ptr [rbp + 0x64b], ecx
0x14033b7b3: mov dword ptr [rbp + 0x648], eax
0x14033b7b9: mov rax, qword ptr [r15 + 8]
0x14033b7bd: movzx ecx, byte ptr [r15 + 0x10]
0x14033b7c2: mov r9b, 1
0x14033b7c5: jmp 0x14033b7d8
0x14033b7c7: mov rax, qword ptr [r15 + 8]
0x14033b7cb: lock inc qword ptr [rax]
0x14033b7cf: jle 0x14033bc83
0x14033b7d5: xor r9d, r9d
0x14033b7d8: mov r8, qword ptr [rbp + 0x5d8]
0x14033b7df: mov qword ptr [rbp + 0x368], r8
0x14033b7e6: movups xmm0, xmmword ptr [rbp + 0x5c8]
0x14033b7ed: movups xmmword ptr [rbp + 0x358], xmm0
0x14033b7f4: movups xmm0, xmmword ptr [rip + 0x5f402dd]
0x14033b7fb: movups xmmword ptr [rbp + 0x339], xmm0
0x14033b802: mov dword ptr [rbp + 0x349], 0x3f800000
0x14033b80c: mov qword ptr [rbp + 0x370], 0
0x14033b817: mov qword ptr [rbp + 0x378], 4
0x14033b822: mov qword ptr [rbp + 0x380], 0
0x14033b82d: mov byte ptr [rbp + 0x388], r9b
0x14033b834: mov r9d, dword ptr [rbp + 0x648]
0x14033b83b: mov r8d, dword ptr [rbp + 0x64b]
0x14033b842: mov dword ptr [rbp + 0x389], r9d
0x14033b849: mov dword ptr [rbp + 0x38c], r8d
0x14033b850: mov qword ptr [rbp + 0x390], rax
0x14033b857: mov qword ptr [rbp + 0x398], rcx
0x14033b85e: mov dword ptr [rbp + 0x3a0], 0x41500000
0x14033b868: mov word ptr [rbp + 0x3a4], 0x190
0x14033b871: mov byte ptr [rbp + 0x3a6], 1
0x14033b878: mov rax, qword ptr [rbp + 0x345]
0x14033b87f: mov qword ptr [rbp + 0x3b4], rax
0x14033b886: movups xmm0, xmmword ptr [rbp + 0x338]
0x14033b88d: movups xmmword ptr [rbp + 0x3a7], xmm0
0x14033b894: movups xmmword ptr [rbp + 0x3bc], xmm7
0x14033b89b: mov dword ptr [rbp + 0x3cc], ebx
0x14033b8a1: movsd qword ptr [rbp + 0x3d0], xmm8
0x14033b8aa: mov qword ptr [rbp + 0x350], r12
0x14033b8b1: lea rcx, [rbp + 0x40]
0x14033b8b5: lea r8, [rbp + 0x350]
0x14033b8bc: call 0x1402f9a60
0x14033b8c1: nop 
0x14033b8c2: mov rdx, qword ptr [rbp + 0x660]
0x14033b8c9: test rdx, rdx
0x14033b8cc: je 0x14033b8e0
0x14033b8ce: mov rcx, qword ptr [rbp + 0x668]
0x14033b8d5: mov r8d, 1
0x14033b8db: call 0x1400021d0
0x14033b8e0: cmp byte ptr [r14 + 0x8c], 0
0x14033b8e8: je 0x14033b92c
0x14033b8ea: mov r9, qword ptr [r14 + 0x70]
0x14033b8ee: test r9, r9
0x14033b8f1: mov rbx, qword ptr [rbp + 0x330]
0x14033b8f8: je 0x14033b954
0x14033b8fa: mov r8, qword ptr [r14 + 0x68]
0x14033b8fe: movaps xmmword ptr [rbp + 0x350], xmm6
0x14033b905: mov dword ptr [rbp + 0x360], 0x3f800000
0x14033b90f: lea rax, [rbp + 0x350]
0x14033b916: mov qword ptr [rsp + 0x20], rax
0x14033b91b: lea rcx, [rbp + 0x2f8]
0x14033b922: mov rdx, r15
0x14033b925: call 0x1402b98a0
0x14033b92a: jmp 0x14033b954
0x14033b92c: mov r8d, dword ptr [r14 + 0x78]
0x14033b930: mov r9d, dword ptr [r14 + 0x7c]
0x14033b934: movups xmm0, xmmword ptr [r14 + 0x68]
0x14033b939: movups xmmword ptr [rsp + 0x20], xmm0
0x14033b93e: lea rcx, [rbp + 0x2f8]
0x14033b945: mov rdx, r15
0x14033b948: call 0x1402c25f0
0x14033b94d: mov rbx, qword ptr [rbp + 0x330]
0x14033b954: mov eax, dword ptr [r14 + 0x88]
0x14033b95b: mov dword ptr [rbp + 0x2a0], eax
0x14033b961: mov rax, qword ptr [rip + 0x5f3c540]
0x14033b968: mov qword ptr [rbp + 0x5f0], rax
0x14033b96f: movups xmm0, xmmword ptr [rip + 0x5f3c522]
0x14033b976: movaps xmmword ptr [rbp + 0x5e0], xmm0
0x14033b97d: mov rax, qword ptr [rip + 0x5f3c53c]
0x14033b984: mov qword ptr [rbp + 0x608], rax
0x14033b98b: movups xmm1, xmmword ptr [rip + 0x5f3c51e]
0x14033b992: movups xmmword ptr [rbp + 0x5f8], xmm1
0x14033b999: movups xmm1, xmmword ptr [rip + 0x5f3c528]
0x14033b9a0: movaps xmmword ptr [rbp + 0x610], xmm1
0x14033b9a7: mov rax, qword ptr [rip + 0x5f3c52a]
0x14033b9ae: mov qword ptr [rbp + 0x620], rax
0x14033b9b5: mov rax, qword ptr [rip + 0x5f3c534]
0x14033b9bc: mov qword ptr [rbp + 0x638], rax
0x14033b9c3: movups xmm2, xmmword ptr [rip + 0x5f3c516]
0x14033b9ca: movups xmmword ptr [rbp + 0x628], xmm2
0x14033b9d1: movaps xmmword ptr [rbp + 0x70], xmm1
0x14033b9d5: mov rax, qword ptr [rbp + 0x600]
0x14033b9dc: mov qword ptr [rbp + 0x60], rax
0x14033b9e0: mov rax, qword ptr [rbp + 0x608]
0x14033b9e7: mov qword ptr [rbp + 0x68], rax
0x14033b9eb: movaps xmm1, xmmword ptr [rbp + 0x5f0]
0x14033b9f2: movaps xmmword ptr [rbp + 0x50], xmm1
0x14033b9f6: movaps xmmword ptr [rbp + 0x40], xmm0
0x14033b9fa: mov rax, qword ptr [rbp + 0x630]
0x14033ba01: mov qword ptr [rbp + 0x90], rax
0x14033ba08: mov rax, qword ptr [rbp + 0x638]
0x14033ba0f: mov qword ptr [rbp + 0x98], rax
0x14033ba16: movaps xmm0, xmmword ptr [rbp + 0x620]
0x14033ba1d: movaps xmmword ptr [rbp + 0x80], xmm0
0x14033ba24: xorps xmm0, xmm0
0x14033ba27: movaps xmmword ptr [rbp + 0xe0], xmm0
0x14033ba2e: movaps xmmword ptr [rbp + 0xd0], xmm0
0x14033ba35: movaps xmmword ptr [rbp + 0xc0], xmm0
0x14033ba3c: movaps xmmword ptr [rbp + 0xb0], xmm0
0x14033ba43: movaps xmmword ptr [rbp + 0xa0], xmm0
0x14033ba4a: mov qword ptr [rbp + 0xf0], 0
0x14033ba55: movups xmm0, xmmword ptr [rip + 0x5f3c504]
0x14033ba5c: movups xmmword ptr [rbp + 0x108], xmm0
0x14033ba63: movups xmm0, xmmword ptr [rip + 0x5f3c4e6]
0x14033ba6a: movups xmmword ptr [rbp + 0xf8], xmm0
0x14033ba71: movups xmm0, xmmword ptr [rip + 0x5f3c508]
0x14033ba78: movups xmmword ptr [rbp + 0x128], xmm0
0x14033ba7f: movups xmm0, xmmword ptr [rip + 0x5f3c4ea]
0x14033ba86: movups xmmword ptr [rbp + 0x118], xmm0
0x14033ba8d: movups xmm0, xmmword ptr [rip + 0x5f3c50c]
0x14033ba94: movups xmmword ptr [rbp + 0x148], xmm0
0x14033ba9b: movups xmm0, xmmword ptr [rip + 0x5f3c4ee]
0x14033baa2: movups xmmword ptr [rbp + 0x138], xmm0
0x14033baa9: movups xmm0, xmmword ptr [rip + 0x5f3c510]
0x14033bab0: movups xmmword ptr [rbp + 0x168], xmm0
0x14033bab7: movups xmm0, xmmword ptr [rip + 0x5f3c4f2]
0x14033babe: movups xmmword ptr [rbp + 0x158], xmm0
0x14033bac5: mov dword ptr [rbp + 0x4d2], 0
0x14033bacf: mov qword ptr [rbp + 0x4ca], 0
0x14033bada: mov rdi, qword ptr [rbp + 0x2f8]
0x14033bae1: lea rcx, [rbp + 0x358]
0x14033bae8: lea rdx, [rbp + 0x40]
0x14033baec: mov r8d, 0x138
0x14033baf2: call 0x14606171b
0x14033baf7: movaps xmm0, xmmword ptr [rip + 0x5ef7452]
0x14033bafe: movups xmmword ptr [rbp + 0x490], xmm0
0x14033bb05: mov dword ptr [rbp + 0x4a0], 1
0x14033bb0f: mov qword ptr [rbp + 0x4a4], 0
0x14033bb1a: mov byte ptr [rbp + 0x4ac], 1
0x14033bb21: mov qword ptr [rbp + 0x4b0], 0
0x14033bb2c: mov dword ptr [rbp + 0x4b8], 0x3f800000
0x14033bb36: mov word ptr [rbp + 0x4bc], 0
0x14033bb3f: mov eax, dword ptr [rip + 0x5f3c4b9]
0x14033bb45: mov dword ptr [rbp + 0x4be], eax
0x14033bb4b: movzx eax, word ptr [rip + 0x5f3c4b0]
0x14033bb52: mov word ptr [rbp + 0x4c2], ax
0x14033bb59: mov eax, dword ptr [rip + 0x5f3c4a5]
0x14033bb5f: mov dword ptr [rbp + 0x4c4], eax
0x14033bb65: movzx eax, word ptr [rip + 0x5f3c49c]
0x14033bb6c: mov word ptr [rbp + 0x4c8], ax
0x14033bb73: mov word ptr [rbp + 0x4d8], 0x102
0x14033bb7c: mov qword ptr [rbp + 0x350], rdi
0x14033bb83: lea rdi, [rbp + 0x5e0]
0x14033bb8a: lea r8, [rbp + 0x350]
0x14033bb91: mov rcx, rdi
0x14033bb94: mov rdx, r13
0x14033bb97: call 0x1402f7e50
0x14033bb9c: lea r8, [rbp + 0x2a0]
0x14033bba3: mov rcx, rdi
0x14033bba6: mov rdx, r15
0x14033bba9: call 0x140335210
0x14033bbae: mov rax, qword ptr [rbp + 0x328]
0x14033bbb5: cmp qword ptr [rax + 0x50], 4
0x14033bbba: jne 0x14033bc1e
0x14033bbbc: mov rax, qword ptr [rax + 0x48]
0x14033bbc0: cmp dword ptr [rax], 0x74736f68
0x14033bbc6: jne 0x14033bc1e
0x14033bbc8: cmp byte ptr [r14 + 0x8c], 0
0x14033bbd0: jne 0x14033bc1e
0x14033bbd2: mov rax, qword ptr [rbx + 0x20]
0x14033bbd6: mov rax, qword ptr [rax]
0x14033bbd9: mov qword ptr [rbp + 0x358], rax
0x14033bbe0: mov byte ptr [rbp + 0x350], 8
0x14033bbe7: lea rcx, [rip + 0x5f43f82]
0x14033bbee: mov edx, 4
0x14033bbf3: call 0x145be8220
0x14033bbf8: mov qword ptr [rsp + 0x20], rdx
0x14033bbfd: mov dword ptr [rsp + 0x28], 0x41500000
0x14033bc05: lea rcx, [rbp + 0x2f8]
0x14033bc0c: lea r8, [rbp + 0x350]
0x14033bc13: mov rdx, r15
0x14033bc16: mov r9, rax
0x14033bc19: call 0x1402bc4d0
0x14033bc1e: mov rax, rsi
0x14033bc21: movaps xmm6, xmmword ptr [rbp + 0x680]
0x14033bc28: movaps xmm7, xmmword ptr [rbp + 0x690]
0x14033bc2f: movaps xmm8, xmmword ptr [rbp + 0x6a0]
0x14033bc37: movaps xmm9, xmmword ptr [rbp + 0x6b0]
0x14033bc3f: movaps xmm10, xmmword ptr [rbp + 0x6c0]
0x14033bc47: movaps xmm11, xmmword ptr [rbp + 0x6d0]
0x14033bc4f: movaps xmm12, xmmword ptr [rbp + 0x6e0]
0x14033bc57: movaps xmm13, xmmword ptr [rbp + 0x6f0]
0x14033bc5f: movaps xmm14, xmmword ptr [rbp + 0x700]
0x14033bc67: movaps xmm15, xmmword ptr [rbp + 0x710]
0x14033bc6f: add rsp, 0x7a8
0x14033bc76: pop rbx
0x14033bc77: pop rdi
0x14033bc78: pop rsi
0x14033bc79: pop r12
0x14033bc7b: pop r13
0x14033bc7d: pop r14
0x14033bc7f: pop r15
0x14033bc81: pop rbp
0x14033bc82: ret 
0x14033bc83: ud2 
