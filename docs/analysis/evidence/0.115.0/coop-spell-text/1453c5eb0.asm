0x1453c5eb0: push rbp
0x1453c5eb1: push r15
0x1453c5eb3: push r14
0x1453c5eb5: push r13
0x1453c5eb7: push r12
0x1453c5eb9: push rsi
0x1453c5eba: push rdi
0x1453c5ebb: push rbx
0x1453c5ebc: sub rsp, 0x238
0x1453c5ec3: lea rbp, [rsp + 0x80]
0x1453c5ecb: movapd xmmword ptr [rbp + 0x1a0], xmm6
0x1453c5ed3: mov qword ptr [rbp + 0x190], 0xfffffffffffffffe
0x1453c5ede: mov rsi, r8
0x1453c5ee1: mov rdi, rdx
0x1453c5ee4: mov rcx, rdx
0x1453c5ee7: call 0x14579a780
0x1453c5eec: mov qword ptr [rbp + 0x180], rax
0x1453c5ef3: inc dword ptr [rax + 0x50]
0x1453c5ef6: mov rbx, qword ptr [rax + 0x18]
0x1453c5efa: mov r14, qword ptr [rax + 0x48]
0x1453c5efe: mov qword ptr [rax + 0x18], rdi
0x1453c5f02: call 0x14579ed00
0x1453c5f07: nop
0x1453c5f08: movups xmm0, xmmword ptr [rax]
0x1453c5f0b: mov qword ptr [rax], r14
0x1453c5f0e: mov qword ptr [rax + 8], rdi
0x1453c5f12: lea rax, [rbp + 0x180]
0x1453c5f19: mov qword ptr [rbp - 0x48], rax
0x1453c5f1d: mov qword ptr [rbp - 0x40], rbx
0x1453c5f21: movups xmmword ptr [rbp - 0x38], xmm0
0x1453c5f25: movapd xmm0, xmmword ptr [rip + 0x18c72e3]
0x1453c5f2d: movupd xmmword ptr [rbp], xmm0
0x1453c5f32: movupd xmmword ptr [rbp - 0x10], xmm0
0x1453c5f37: movupd xmmword ptr [rbp + 0x20], xmm0
0x1453c5f3c: movupd xmmword ptr [rbp + 0x10], xmm0
0x1453c5f41: mov rdi, qword ptr [rbp + 0x180]
0x1453c5f48: cmp rsi, 9
0x1453c5f4c: jae 0x1453c5f6d
0x1453c5f4e: mov byte ptr [rbp + 0x18f], 0
0x1453c5f55: call 0x14579ed00
0x1453c5f5a: nop
0x1453c5f5b: mov rcx, qword ptr [rax]
0x1453c5f5e: cmp rcx, qword ptr [rdi + 0x48]
0x1453c5f62: jne 0x1453c5f8c
0x1453c5f64: add rax, 8
0x1453c5f68: mov rdi, rax
0x1453c5f6b: jmp 0x1453c5fa0
0x1453c5f6d: mov byte ptr [rbp + 0x18f], 0
0x1453c5f74: call 0x14579ed00
0x1453c5f79: nop
0x1453c5f7a: mov rcx, qword ptr [rax]
0x1453c5f7d: cmp rcx, qword ptr [rdi + 0x48]
0x1453c5f81: jne 0x1453c5fde
0x1453c5f83: add rax, 8
0x1453c5f87: mov rdi, rax
0x1453c5f8a: jmp 0x1453c5ff2
0x1453c5f8c: cmp byte ptr [rdi + 0x54], 0
0x1453c5f90: je 0x1453c5f9c
0x1453c5f92: cmp dword ptr [rdi + 0x50], 0
0x1453c5f96: je 0x1453c669a
0x1453c5f9c: add rdi, 0x18
0x1453c5fa0: mov rcx, qword ptr [rdi]
0x1453c5fa3: mov byte ptr [rbp + 0x18f], 0
0x1453c5faa: mov rdx, rsi
0x1453c5fad: call 0x1457b9e20
0x1453c5fb2: nop
0x1453c5fb3: cmp rsi, rdx
0x1453c5fb6: jne 0x1453c6665
0x1453c5fbc: lea r8, [rsi*8]
0x1453c5fc4: lea r12, [rbp - 0x10]
0x1453c5fc8: mov rcx, r12
0x1453c5fcb: mov rdx, rax
0x1453c5fce: call 0x145d145fb
0x1453c5fd3: xor r14d, r14d
0x1453c5fd6: mov rdi, rsi
0x1453c5fd9: jmp 0x1453c60a2
0x1453c5fde: cmp byte ptr [rdi + 0x54], 0
0x1453c5fe2: je 0x1453c5fee
0x1453c5fe4: cmp dword ptr [rdi + 0x50], 0
0x1453c5fe8: je 0x1453c66dd
0x1453c5fee: add rdi, 0x18
0x1453c5ff2: mov rcx, qword ptr [rdi]
0x1453c5ff5: mov byte ptr [rbp + 0x18f], 0
0x1453c5ffc: mov rdx, rsi
0x1453c5fff: call 0x1457b9e20
0x1453c6004: nop
0x1453c6005: mov rdi, rdx
0x1453c6008: lea rbx, [rdx*8]
0x1453c6010: mov rcx, rdx
0x1453c6013: shr rcx, 0x3d
0x1453c6017: setne cl
0x1453c601a: movabs rdx, 0x7ffffffffffffff8
0x1453c6024: cmp rbx, rdx
0x1453c6027: seta dl
0x1453c602a: or dl, cl
0x1453c602c: je 0x1453c6049
0x1453c602e: xor r14d, r14d
0x1453c6031: mov byte ptr [rbp + 0x18f], 0
0x1453c6038: mov rcx, r14
0x1453c603b: mov rdx, rbx
0x1453c603e: call 0x145eb6fcb
0x1453c6043: nop
0x1453c6044: jmp 0x1453c680d
0x1453c6049: test rbx, rbx
0x1453c604c: je 0x1453c608f
0x1453c604e: mov r15, rax
0x1453c6051: call 0x140002200
0x1453c6056: mov r14d, 8
0x1453c605c: mov edx, 8
0x1453c6061: mov rcx, rbx
0x1453c6064: call 0x1400021c0
0x1453c6069: test rax, rax
0x1453c606c: je 0x1453c6031
0x1453c606e: mov r12, rax
0x1453c6071: mov r13, rdi
0x1453c6074: mov rax, r15
0x1453c6077: mov r14b, 1
0x1453c607a: test rdi, rdi
0x1453c607d: je 0x1453c60a0
0x1453c607f: mov rcx, r12
0x1453c6082: mov rdx, rax
0x1453c6085: mov r8, rbx
0x1453c6088: call 0x145d145fb
0x1453c608d: jmp 0x1453c60a2
0x1453c608f: mov r12d, 8
0x1453c6095: xor r13d, r13d
0x1453c6098: mov r14b, 1
0x1453c609b: test rdi, rdi
0x1453c609e: jne 0x1453c607f
0x1453c60a0: xor edi, edi
0x1453c60a2: mov qword ptr [rbp + 0x118], r12
0x1453c60a9: mov qword ptr [rbp + 0x110], r13
0x1453c60b0: mov byte ptr [rbp + 0x18f], r14b
0x1453c60b7: lea rcx, [rbp + 0x128]
0x1453c60be: lea r9, [rbp + 0x180]
0x1453c60c5: mov rdx, r12
0x1453c60c8: mov r8, rdi
0x1453c60cb: call 0x14570ec90
0x1453c60d0: nop
0x1453c60d1: mov dword ptr [rbp + 0x170], r14d
0x1453c60d8: movzx ebx, byte ptr [rbp + 0x128]
0x1453c60df: mov r14, qword ptr [rbp + 0x138]
0x1453c60e6: lea rax, [rbp + 0x140]
0x1453c60ed: cmp bl, 0xff
0x1453c60f0: je 0x1453c6130
0x1453c60f2: movzx ecx, byte ptr [rbp + 0x12f]
0x1453c60f9: shl ecx, 0x10
0x1453c60fc: movzx edx, word ptr [rbp + 0x12d]
0x1453c6103: or edx, ecx
0x1453c6105: shl rdx, 0x20
0x1453c6109: mov r15d, dword ptr [rbp + 0x129]
0x1453c6110: or r15, rdx
0x1453c6113: mov rdi, qword ptr [rbp + 0x130]
0x1453c611a: movupd xmm0, xmmword ptr [rax]
0x1453c611e: movupd xmm1, xmmword ptr [rax + 0x10]
0x1453c6123: movupd xmm6, xmmword ptr [rbp + 0x160]
0x1453c612b: jmp 0x1453c6532
0x1453c6130: mov qword ptr [rbp + 0x108], r13
0x1453c6137: mov qword ptr [rbp + 0x100], r12
0x1453c613e: mov rcx, qword ptr [rbp + 0x130]
0x1453c6145: mov rdi, qword ptr [rbp + 0x160]
0x1453c614c: movupd xmm0, xmmword ptr [rax]
0x1453c6150: movupd xmm1, xmmword ptr [rax + 0x10]
0x1453c6155: movapd xmmword ptr [rbp + 0x40], xmm0
0x1453c615a: movapd xmmword ptr [rbp + 0x50], xmm1
0x1453c615f: mov qword ptr [rbp + 0xa8], rcx
0x1453c6166: mov qword ptr [rbp + 0xb0], r14
0x1453c616d: movupd xmmword ptr [rbp + 0xb8], xmm0
0x1453c6175: movupd xmmword ptr [rbp + 0xc8], xmm1
0x1453c617d: lea rcx, [rbp + 0x180]
0x1453c6184: call 0x14523a950
0x1453c6189: nop
0x1453c618a: movapd xmm6, xmm0
0x1453c618e: mov rcx, qword ptr [rbp + 0x180]
0x1453c6195: call 0x1452c4780
0x1453c619a: nop
0x1453c619b: mov r15, rax
0x1453c619e: test rax, rax
0x1453c61a1: je 0x1453c6720
0x1453c61a7: mov qword ptr [rbp + 0x128], r15
0x1453c61ae: cmp qword ptr [r15 + 0x10], 0
0x1453c61b3: jne 0x1453c6681
0x1453c61b9: lea r13, [r15 + 0x10]
0x1453c61bd: mov qword ptr [r15 + 0x10], 0xffffffffffffffff
0x1453c61c5: mov rax, r15
0x1453c61c8: add rax, 0x18
0x1453c61cc: mov qword ptr [rbp + 0xe0], rax
0x1453c61d3: mov qword ptr [rbp + 0xe8], r13
0x1453c61da: mov qword ptr [rbp + 0xf0], r15
0x1453c61e1: mov qword ptr [rbp + 0x178], 0xffffffffffffffff
0x1453c61ec: test rdi, rdi
0x1453c61ef: js 0x1453c62c1
0x1453c61f5: cmp rdi, qword ptr [r15 + 0x44a8]
0x1453c61fc: jae 0x1453c62c1
0x1453c6202: mov rax, qword ptr [r15 + 0x44a0]
0x1453c6209: imul rcx, rdi, 0x68
0x1453c620d: lea r14, [rax + rcx]
0x1453c6211: movzx r12d, byte ptr [rax + rcx + 0x5e]
0x1453c6217: mov qword ptr [rbp + 0x120], rax
0x1453c621e: test r12b, r12b
0x1453c6221: jne 0x1453c626a
0x1453c6223: movsd xmm0, qword ptr [r14 + 0x50]
0x1453c6229: subsd xmm0, xmm6
0x1453c622d: mulsd xmm0, qword ptr [rip + 0xb1da4b]
0x1453c6235: call 0x145d14667
0x1453c623a: xorpd xmm1, xmm1
0x1453c623e: xorpd xmm2, xmm2
0x1453c6242: maxsd xmm2, xmm0
0x1453c6246: movsd xmm0, qword ptr [rip + 0xb1da0a]
0x1453c624e: movapd xmm3, xmm0
0x1453c6252: minsd xmm3, xmm2
0x1453c6256: maxsd xmm1, xmm3
0x1453c625a: minsd xmm0, xmm1
0x1453c625e: cvttsd2si rax, xmm0
0x1453c6263: mov qword ptr [rbp + 0x120], rax
0x1453c626a: xor r12b, 1
0x1453c626e: mov edi, dword ptr [r14 + 0x58]
0x1453c6272: cmp qword ptr [r14], -1
0x1453c6276: je 0x1453c664a
0x1453c627c: lea rcx, [rbp + 0x128]
0x1453c6283: mov rdx, r14
0x1453c6286: call 0x145ce7810
0x1453c628b: nop
0x1453c628c: mov rax, qword ptr [rbp + 0x128]
0x1453c6293: mov qword ptr [rbp + 0x178], rax
0x1453c629a: mov rax, qword ptr [rbp + 0x130]
0x1453c62a1: mov qword ptr [rbp + 0xd8], rax
0x1453c62a8: mov rbx, qword ptr [rbp + 0x138]
0x1453c62af: mov rax, qword ptr [r13]
0x1453c62b3: inc rax
0x1453c62b6: mov qword ptr [r15 + 0x10], rax
0x1453c62ba: dec qword ptr [r15]
0x1453c62bd: jne 0x1453c62e5
0x1453c62bf: jmp 0x1453c62d8
0x1453c62c1: xor eax, eax
0x1453c62c3: mov qword ptr [rbp + 0x120], rcx
0x1453c62ca: xor r12d, r12d
0x1453c62cd: xor edi, edi
0x1453c62cf: mov qword ptr [r15 + 0x10], rax
0x1453c62d3: dec qword ptr [r15]
0x1453c62d6: jne 0x1453c62e5
0x1453c62d8: lea rcx, [rbp + 0xf0]
0x1453c62df: call 0x145074f00
0x1453c62e4: nop
0x1453c62e5: test r12b, r12b
0x1453c62e8: je 0x1453c63be
0x1453c62ee: mov byte ptr [rbp + 0x18e], 1
0x1453c62f5: lea r14, [rbp + 0x128]
0x1453c62fc: lea rdx, [rbp + 0x180]
0x1453c6303: mov rcx, r14
0x1453c6306: call 0x14579ab50
0x1453c630b: nop
0x1453c630c: mov qword ptr [rbp + 0xe0], r14
0x1453c6313: lea rax, [rip + 0x18d72ae]
0x1453c631a: mov qword ptr [rsp + 0x30], rax
0x1453c631f: lea rax, [rbp + 0xe0]
0x1453c6326: mov qword ptr [rsp + 0x28], rax
0x1453c632b: mov byte ptr [rsp + 0x20], 1
0x1453c6330: lea r8, [rip + 0x18d72c1]
0x1453c6337: lea rcx, [rbp + 0x68]
0x1453c633b: mov r9d, 0x14
0x1453c6341: mov rdx, qword ptr [rbp + 0x120]
0x1453c6348: call 0x14519e390
0x1453c634d: nop
0x1453c634e: lea rcx, [rbp + 0x128]
0x1453c6355: call 0x14579e640
0x1453c635a: nop
0x1453c635b: mov rax, qword ptr [rbp + 0x128]
0x1453c6362: dec qword ptr [rax]
0x1453c6365: jne 0x1453c6374
0x1453c6367: lea rcx, [rbp + 0x128]
0x1453c636e: call 0x1457c1790
0x1453c6373: nop
0x1453c6374: mov rcx, qword ptr [rbp + 0x130]
0x1453c637b: cmp rcx, -1
0x1453c637f: je 0x1453c63c6
0x1453c6381: dec qword ptr [rcx + 8]
0x1453c6385: jne 0x1453c63c6
0x1453c6387: mov rax, qword ptr [rbp + 0x138]
0x1453c638e: mov rdx, qword ptr [rax + 8]
0x1453c6392: mov rax, qword ptr [rax + 0x10]
0x1453c6396: cmp rax, 9
0x1453c639a: mov r8d, 8
0x1453c63a0: cmovae r8, rax
0x1453c63a4: lea rax, [rdx + r8]
0x1453c63a8: add rax, 0xf
0x1453c63ac: mov rdx, r8
0x1453c63af: neg rdx
0x1453c63b2: and rdx, rax
0x1453c63b5: je 0x1453c63c6
0x1453c63b7: call 0x1400021d0
0x1453c63bc: jmp 0x1453c63c6
0x1453c63be: mov qword ptr [rbp + 0x68], 0xffffffffffffffff
0x1453c63c6: mov rax, qword ptr [rbp + 0x178]
0x1453c63cd: mov qword ptr [rbp - 0x28], rax
0x1453c63d1: mov rax, qword ptr [rbp + 0xd8]
0x1453c63d8: mov qword ptr [rbp - 0x20], rax
0x1453c63dc: mov qword ptr [rbp - 0x18], rbx
0x1453c63e0: mov rax, qword ptr [rbp + 0x78]
0x1453c63e4: mov qword ptr [rbp + 0xf0], rax
0x1453c63eb: mov rax, qword ptr [rbp + 0x68]
0x1453c63ef: mov qword ptr [rbp + 0xe0], rax
0x1453c63f6: mov rax, qword ptr [rbp + 0x70]
0x1453c63fa: mov qword ptr [rbp + 0xe8], rax
0x1453c6401: mov byte ptr [rbp + 0x18e], 0
0x1453c6408: lea rax, [rbp + 0xe0]
0x1453c640f: mov qword ptr [rsp + 0x30], rax
0x1453c6414: movabs rax, 0x100000000
0x1453c641e: mov qword ptr [rsp + 0x28], rax
0x1453c6423: lea rax, [rbp - 0x28]
0x1453c6427: mov qword ptr [rsp + 0x20], rax
0x1453c642c: lea rcx, [rbp + 0x128]
0x1453c6433: lea rdx, [rbp + 0x180]
0x1453c643a: lea r8, [rbp + 0xa8]
0x1453c6441: mov r9d, edi
0x1453c6444: call 0x1451c9110
0x1453c6449: nop
0x1453c644a: movzx ebx, byte ptr [rbp + 0x128]
0x1453c6451: cmp bl, 0xff
0x1453c6454: je 0x1453c64a7
0x1453c6456: movzx eax, byte ptr [rbp + 0x12f]
0x1453c645d: shl eax, 0x10
0x1453c6460: movzx ecx, word ptr [rbp + 0x12d]
0x1453c6467: or ecx, eax
0x1453c6469: shl rcx, 0x20
0x1453c646d: mov r15d, dword ptr [rbp + 0x129]
0x1453c6474: or r15, rcx
0x1453c6477: mov rdi, qword ptr [rbp + 0x130]
0x1453c647e: mov r14, qword ptr [rbp + 0x138]
0x1453c6485: movups xmm0, xmmword ptr [rbp + 0x140]
0x1453c648c: movaps xmmword ptr [rbp + 0x40], xmm0
0x1453c6490: movupd xmm0, xmmword ptr [rbp + 0x150]
0x1453c6498: movapd xmmword ptr [rbp + 0x50], xmm0
0x1453c649d: movupd xmm6, xmmword ptr [rbp + 0x160]
0x1453c64a5: jmp 0x1453c64a7
0x1453c64a7: lea rcx, [rbp + 0xa8]
0x1453c64ae: call 0x14579e640
0x1453c64b3: nop
0x1453c64b4: mov rax, qword ptr [rbp + 0xa8]
0x1453c64bb: dec qword ptr [rax]
0x1453c64be: jne 0x1453c64cd
0x1453c64c0: lea rcx, [rbp + 0xa8]
0x1453c64c7: call 0x1457c1790
0x1453c64cc: nop
0x1453c64cd: mov rcx, qword ptr [rbp + 0xb0]
0x1453c64d4: cmp rcx, -1
0x1453c64d8: je 0x1453c6515
0x1453c64da: dec qword ptr [rcx + 8]
0x1453c64de: jne 0x1453c6515
0x1453c64e0: mov rax, qword ptr [rbp + 0xb8]
0x1453c64e7: mov rdx, qword ptr [rax + 8]
0x1453c64eb: mov rax, qword ptr [rax + 0x10]
0x1453c64ef: cmp rax, 9
0x1453c64f3: mov r8d, 8
0x1453c64f9: cmovae r8, rax
0x1453c64fd: lea rax, [rdx + r8]
0x1453c6501: add rax, 0xf
0x1453c6505: mov rdx, r8
0x1453c6508: neg rdx
0x1453c650b: and rdx, rax
0x1453c650e: je 0x1453c6515
0x1453c6510: call 0x1400021d0
0x1453c6515: cmp bl, 0xff
0x1453c6518: mov r12, qword ptr [rbp + 0x100]
0x1453c651f: mov r13, qword ptr [rbp + 0x108]
0x1453c6526: je 0x1453c658b
0x1453c6528: movapd xmm0, xmmword ptr [rbp + 0x40]
0x1453c652d: movapd xmm1, xmmword ptr [rbp + 0x50]
0x1453c6532: movapd xmmword ptr [rbp + 0x90], xmm1
0x1453c653a: movapd xmmword ptr [rbp + 0x80], xmm0
0x1453c6542: cmp byte ptr [rbp + 0x170], 0
0x1453c6549: je 0x1453c65a3
0x1453c654b: test r13, r13
0x1453c654e: je 0x1453c6565
0x1453c6550: shl r13, 3
0x1453c6554: mov r8d, 8
0x1453c655a: mov rcx, r12
0x1453c655d: mov rdx, r13
0x1453c6560: call 0x1400021d0
0x1453c6565: movapd xmm0, xmmword ptr [rbp + 0x80]
0x1453c656d: movapd xmm1, xmmword ptr [rbp + 0x90]
0x1453c6575: movapd xmmword ptr [rbp - 0x10], xmm0
0x1453c657a: movapd xmmword ptr [rbp], xmm1
0x1453c657f: cmp bl, 0xff
0x1453c6582: jne 0x1453c65bd
0x1453c6584: xor esi, esi
0x1453c6586: jmp 0x1453c6795
0x1453c658b: cmp rsi, 0x1f3f
0x1453c6592: jbe 0x1453c662f
0x1453c6598: mov bl, 4
0x1453c659a: cmp byte ptr [rbp + 0x170], 0
0x1453c65a1: jne 0x1453c654b
0x1453c65a3: movapd xmm0, xmmword ptr [rbp + 0x80]
0x1453c65ab: movapd xmm1, xmmword ptr [rbp + 0x90]
0x1453c65b3: movapd xmmword ptr [rbp - 0x10], xmm0
0x1453c65b8: movapd xmmword ptr [rbp], xmm1
0x1453c65bd: mov byte ptr [rbp + 0x128], bl
0x1453c65c3: mov dword ptr [rbp + 0x129], r15d
0x1453c65ca: mov rax, r15
0x1453c65cd: shr rax, 0x30
0x1453c65d1: mov byte ptr [rbp + 0x12f], al
0x1453c65d7: shr r15, 0x20
0x1453c65db: mov word ptr [rbp + 0x12d], r15w
0x1453c65e3: mov qword ptr [rbp + 0x130], rdi
0x1453c65ea: mov qword ptr [rbp + 0x138], r14
0x1453c65f1: movapd xmm0, xmmword ptr [rbp - 0x10]
0x1453c65f6: movapd xmm1, xmmword ptr [rbp]
0x1453c65fb: movupd xmmword ptr [rbp + 0x140], xmm0
0x1453c6603: movupd xmmword ptr [rbp + 0x150], xmm1
0x1453c660b: movupd xmmword ptr [rbp + 0x160], xmm6
0x1453c6613: lea rcx, [rbp + 0x180]
0x1453c661a: lea r8, [rbp + 0x128]
0x1453c6621: mov rdx, rsi
0x1453c6624: call 0x1457980b0
0x1453c6629: nop
0x1453c662a: jmp 0x1453c678d
0x1453c662f: cmp byte ptr [rbp + 0x170], 0
0x1453c6636: je 0x1453c665e
0x1453c6638: mov bl, 0xff
0x1453c663a: xor edi, edi
0x1453c663c: test r13, r13
0x1453c663f: jne 0x1453c6550
0x1453c6645: jmp 0x1453c6565
0x1453c664a: xor eax, eax
0x1453c664c: mov qword ptr [r15 + 0x10], rax
0x1453c6650: dec qword ptr [r15]
0x1453c6653: jne 0x1453c62e5
0x1453c6659: jmp 0x1453c62d8
0x1453c665e: xor edi, edi
0x1453c6660: jmp 0x1453c6584
0x1453c6665: mov byte ptr [rbp + 0x18f], 0
0x1453c666c: lea r8, [rip + 0x18d6e9d]
0x1453c6673: mov rcx, rsi
0x1453c6676: call 0x145eb7730
0x1453c667b: nop
0x1453c667c: jmp 0x1453c680d
0x1453c6681: mov qword ptr [rbp + 0x178], r15
0x1453c6688: lea rcx, [rip + 0x18c6d29]
0x1453c668f: call 0x145eb7200
0x1453c6694: nop
0x1453c6695: jmp 0x1453c680d
0x1453c669a: lea rax, [rip + 0x18e33cf]
0x1453c66a1: mov qword ptr [rbp + 0x128], rax
0x1453c66a8: lea rax, [rip - 0x53c45ef]
0x1453c66af: mov qword ptr [rbp + 0x130], rax
0x1453c66b6: mov byte ptr [rbp + 0x18f], 0
0x1453c66bd: lea rcx, [rip + 0x18e33bc]
0x1453c66c4: lea r8, [rip + 0x18e33bd]
0x1453c66cb: lea rdx, [rbp + 0x128]
0x1453c66d2: call 0x145eb7540
0x1453c66d7: nop
0x1453c66d8: jmp 0x1453c680d
0x1453c66dd: lea rax, [rip + 0x18e338c]
0x1453c66e4: mov qword ptr [rbp + 0x128], rax
0x1453c66eb: lea rax, [rip - 0x53c4632]
0x1453c66f2: mov qword ptr [rbp + 0x130], rax
0x1453c66f9: mov byte ptr [rbp + 0x18f], 0
0x1453c6700: lea rcx, [rip + 0x18e3379]
0x1453c6707: lea r8, [rip + 0x18e337a]
0x1453c670e: lea rdx, [rbp + 0x128]
0x1453c6715: call 0x145eb7540
0x1453c671a: nop
0x1453c671b: jmp 0x1453c680d
0x1453c6720: lea rcx, [rip + 0x18d7050]
0x1453c6727: lea r8, [rip + 0x18da6fa]
0x1453c672e: mov edx, 0xe
0x1453c6733: call 0x145eb7280
0x1453c6738: nop
0x1453c6739: jmp 0x1453c680d
0x1453c673e: mov rsi, qword ptr [rbp + 0x180]
0x1453c6745: mov byte ptr [rbp + 0x18d], 1
0x1453c674c: lea rcx, [rip + 0x18c6c3d]
0x1453c6753: call 0x145096100
0x1453c6758: nop
0x1453c6759: cmp rax, qword ptr [rsi + 0x48]
0x1453c675d: je 0x1453c676f
0x1453c675f: cmp byte ptr [rsi + 0x54], 0
0x1453c6763: je 0x1453c676b
0x1453c6765: cmp dword ptr [rsi + 0x50], 0
0x1453c6769: je 0x1453c67d8
0x1453c676b: mov rdx, qword ptr [rsi + 0x18]
0x1453c676f: mov byte ptr [rbp + 0x18d], 0
0x1453c6776: mov rcx, rdx
0x1453c6779: mov rdx, qword ptr [rbp + 0x170]
0x1453c6780: mov r8, qword ptr [rbp + 0x178]
0x1453c6787: call 0x1457979a0
0x1453c678c: nop
0x1453c678d: mov rdi, rax
0x1453c6790: mov esi, 1
0x1453c6795: lea rcx, [rbp - 0x48]
0x1453c6799: call 0x14579d940
0x1453c679e: nop
0x1453c679f: mov rax, qword ptr [rbp + 0x180]
0x1453c67a6: dec qword ptr [rax]
0x1453c67a9: jne 0x1453c67b7
0x1453c67ab: lea rcx, [rbp + 0x180]
0x1453c67b2: call 0x1457a1ee0
0x1453c67b7: mov rax, rsi
0x1453c67ba: mov rdx, rdi
0x1453c67bd: movaps xmm6, xmmword ptr [rbp + 0x1a0]
0x1453c67c4: add rsp, 0x238
0x1453c67cb: pop rbx
0x1453c67cc: pop rdi
0x1453c67cd: pop rsi
0x1453c67ce: pop r12
0x1453c67d0: pop r13
0x1453c67d2: pop r14
0x1453c67d4: pop r15
0x1453c67d6: pop rbp
0x1453c67d7: ret
0x1453c67d8: lea rax, [rip + 0x18e3291]
0x1453c67df: mov qword ptr [rbp + 0x30], rax
0x1453c67e3: lea rax, [rip - 0x53c472a]
0x1453c67ea: mov qword ptr [rbp + 0x38], rax
0x1453c67ee: mov byte ptr [rbp + 0x18d], 1
0x1453c67f5: lea rcx, [rip + 0x18e3284]
0x1453c67fc: lea r8, [rip + 0x18e3285]
0x1453c6803: lea rdx, [rbp + 0x30]
0x1453c6807: call 0x145eb7540
0x1453c680c: nop
0x1453c680d: ud2
