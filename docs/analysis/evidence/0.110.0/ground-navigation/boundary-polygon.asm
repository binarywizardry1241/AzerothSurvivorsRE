14590a0e3: e8d89ef8ff call 0x145893fc0
14590a0e8: 4869c8f0000000 imul rcx, rax, 0xf0
14590a0ef: 488d153a352e01 lea rdx, [rip + 0x12e353a]
14590a0f6: 4c8d040a lea r8, [rdx + rcx]
14590a0fa: 48c7853001000000000000 mov qword ptr [rbp + 0x130], 0
14590a105: 48c7853801000004000000 mov qword ptr [rbp + 0x138], 4
14590a110: 48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
14590a11b: 488b4c1160 mov rcx, qword ptr [rcx + rdx + 0x60]
14590a120: 4883f802 cmp rax, 2
14590a124: 4c8985e0000000 mov qword ptr [rbp + 0xe0], r8
14590a12b: 7409 je 0x14590a136
14590a12d: 83f807 cmp eax, 7
14590a130: 0f85a3050000 jne 0x14590a6d9
14590a136: 4d8b6058 mov r12, qword ptr [r8 + 0x58]
14590a13a: 498d04cc lea rax, [r12 + rcx*8]
14590a13e: 48898580010000 mov qword ptr [rbp + 0x180], rax
14590a145: f3440f100d22e14900 movss xmm9, dword ptr [rip + 0x49e122]
14590a14e: f3440f1015f9774a00 movss xmm10, dword ptr [rip + 0x4a77f9]
14590a157: 450f57db xorps xmm11, xmm11
14590a15b: f3440f1025f0774a00 movss xmm12, dword ptr [rip + 0x4a77f0]
14590a164: 488dbd30010000 lea rdi, [rbp + 0x130]
14590a16b: 31db xor ebx, ebx
14590a16d: 4d89e7 mov r15, r12
14590a170: 48898d70010000 mov qword ptr [rbp + 0x170], rcx
14590a177: eb15 jmp 0x14590a18e
14590a179: 0f1f8000000000 nop dword ptr [rax]
14590a180: 4c8bad28010000 mov r13, qword ptr [rbp + 0x128]
14590a187: 488b8d70010000 mov rcx, qword ptr [rbp + 0x170]
14590a18e: 4c3bbd80010000 cmp r15, qword ptr [rbp + 0x180]
14590a195: 0f849b010000 je 0x14590a336
14590a19b: 48ffc3 inc rbx
14590a19e: 4889d8 mov rax, rbx
14590a1a1: 4809c8 or rax, rcx
14590a1a4: 48c1e820 shr rax, 0x20
14590a1a8: 7416 je 0x14590a1c0
14590a1aa: 4889d8 mov rax, rbx
14590a1ad: 31d2 xor edx, edx
14590a1af: 48f7f1 div rcx
14590a1b2: eb12 jmp 0x14590a1c6
14590a1b4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14590a1c0: 89d8 mov eax, ebx
14590a1c2: 31d2 xor edx, edx
14590a1c4: f7f1 div ecx
14590a1c6: f3410f1034d4 movss xmm6, dword ptr [r12 + rdx*8]
14590a1cc: f3410f107cd404 movss xmm7, dword ptr [r12 + rdx*8 + 4]
14590a1d3: f3450f102f movss xmm13, dword ptr [r15]
14590a1d8: f3450f107704 movss xmm14, dword ptr [r15 + 4]
14590a1de: f3410f5cf5 subss xmm6, xmm13
14590a1e3: f3410f5cfe subss xmm7, xmm14
14590a1e8: 0f28c6 movaps xmm0, xmm6
14590a1eb: 0f28cf movaps xmm1, xmm7
14590a1ee: e8f6af2f00 call 0x145c051e9
14590a1f3: f30f5e05b9224a00 divss xmm0, dword ptr [rip + 0x4a22b9]
14590a1fb: e8fbaf2f00 call 0x145c051fb
14590a200: f3410f5fc1 maxss xmm0, xmm9
14590a205: f3480f2cc0 cvttss2si rax, xmm0
14590a20a: 4889c1 mov rcx, rax
14590a20d: 48c1f93f sar rcx, 0x3f
14590a211: 0f28c8 movaps xmm1, xmm0
14590a214: f3410f5cca subss xmm1, xmm10
14590a219: f34c0f2ce9 cvttss2si r13, xmm1
14590a21e: 4921cd and r13, rcx
14590a221: 4909c5 or r13, rax
14590a224: 410f2ec3 ucomiss xmm0, xmm11
14590a228: b800000000 mov eax, 0
14590a22d: 4c0f42e8 cmovb r13, rax
14590a231: 410f2ec4 ucomiss xmm0, xmm12
14590a235: 48c7c0ffffffff mov rax, 0xffffffffffffffff
14590a23c: 4c0f47e8 cmova r13, rax
14590a240: 4d85ed test r13, r13
14590a243: 780b js 0x14590a250
14590a245: 450f57ff xorps xmm15, xmm15
14590a249: f34d0f2afd cvtsi2ss xmm15, r13
14590a24e: eb1d jmp 0x14590a26d
14590a250: 4c89e8 mov rax, r13
14590a253: 48d1e8 shr rax, 1
14590a256: 4489e9 mov ecx, r13d
14590a259: 83e101 and ecx, 1
14590a25c: 4809c1 or rcx, rax
14590a25f: 450f57ff xorps xmm15, xmm15
14590a263: f34c0f2af9 cvtsi2ss xmm15, rcx
14590a268: f3450f58ff addss xmm15, xmm15
14590a26d: 4983c708 add r15, 8
14590a271: 4531f6 xor r14d, r14d
14590a274: eb5e jmp 0x14590a2d4
14590a276: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14590a280: c6856f01000001 mov byte ptr [rbp + 0x16f], 1
14590a287: 4889f9 mov rcx, rdi
14590a28a: e8a16f3000 call 0x145c11230
14590a28f: 90 nop
14590a290: f3450f5ec7 divss xmm8, xmm15
14590a295: 0f28c6 movaps xmm0, xmm6
14590a298: f3410f59c0 mulss xmm0, xmm8
14590a29d: f3410f58c5 addss xmm0, xmm13
14590a2a2: f3440f59c7 mulss xmm8, xmm7
14590a2a7: f3450f58c6 addss xmm8, xmm14
14590a2ac: 660f7ec0 movd eax, xmm0
14590a2b0: 66440f7ec1 movd ecx, xmm8
14590a2b5: 48c1e120 shl rcx, 0x20
14590a2b9: 4809c8 or rax, rcx
14590a2bc: 488b8d38010000 mov rcx, qword ptr [rbp + 0x138]
14590a2c3: 488904f1 mov qword ptr [rcx + rsi*8], rax
14590a2c7: 48ffc6 inc rsi
14590a2ca: 4889b540010000 mov qword ptr [rbp + 0x140], rsi
14590a2d1: 49ffc6 inc r14
14590a2d4: 4d39ee cmp r14, r13
14590a2d7: 0f83a3feffff jae 0x14590a180
14590a2dd: 4d85f6 test r14, r14
14590a2e0: 781e js 0x14590a300
14590a2e2: 450f57c0 xorps xmm8, xmm8
14590a2e6: f34d0f2ac6 cvtsi2ss xmm8, r14
14590a2eb: 488bb540010000 mov rsi, qword ptr [rbp + 0x140]
14590a2f2: 483bb530010000 cmp rsi, qword ptr [rbp + 0x130]
14590a2f9: 7595 jne 0x14590a290
14590a2fb: eb83 jmp 0x14590a280
14590a2fd: 0f1f00 nop dword ptr [rax]
14590a300: 4c89f0 mov rax, r14
14590a303: 48d1e8 shr rax, 1
14590a306: 4489f1 mov ecx, r14d
14590a309: 83e101 and ecx, 1
14590a30c: 4809c1 or rcx, rax
14590a30f: 450f57c0 xorps xmm8, xmm8
14590a313: f34c0f2ac1 cvtsi2ss xmm8, rcx
14590a318: f3450f58c0 addss xmm8, xmm8
14590a31d: 488bb540010000 mov rsi, qword ptr [rbp + 0x140]
14590a324: 483bb530010000 cmp rsi, qword ptr [rbp + 0x130]
14590a32b: 0f855fffffff jne 0x14590a290
14590a331: e94affffff jmp 0x14590a280
