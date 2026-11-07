14026dfa0: push      rbp
14026dfa1: push      r15
14026dfa3: push      r14
14026dfa5: push      r13
14026dfa7: push      r12
14026dfa9: push      rsi
14026dfaa: push      rdi
14026dfab: push      rbx
14026dfac: sub       rsp, 0x5f8
14026dfb3: lea       rbp, [rsp + 0x80]
14026dfbb: movaps    xmmword ptr [rbp + 0x560], xmm14
14026dfc3: movaps    xmmword ptr [rbp + 0x550], xmm13
14026dfcb: movaps    xmmword ptr [rbp + 0x540], xmm12
14026dfd3: movaps    xmmword ptr [rbp + 0x530], xmm11
14026dfdb: movaps    xmmword ptr [rbp + 0x520], xmm10
14026dfe3: movaps    xmmword ptr [rbp + 0x510], xmm9
14026dfeb: movaps    xmmword ptr [rbp + 0x500], xmm8
14026dff3: movaps    xmmword ptr [rbp + 0x4f0], xmm7
14026dffa: movaps    xmmword ptr [rbp + 0x4e0], xmm6
14026e001: mov       qword ptr [rbp + 0x4d8], 0xfffffffffffffffe
14026e00c: mov       r15, qword ptr [rcx]
14026e00f: mov       rax, qword ptr [rcx + 0x28]
14026e013: mov       qword ptr [rbp - 0x30], r15
14026e017: movups    xmm0, xmmword ptr [rcx + 8]
14026e01b: movups    xmmword ptr [rbp - 0x28], xmm0
14026e01f: mov       qword ptr [rbp + 0x348], rcx
14026e026: movups    xmm0, xmmword ptr [rcx + 0x18]
14026e02a: movups    xmmword ptr [rbp - 0x18], xmm0
14026e02e: mov       qword ptr [rbp - 8], rax
14026e032: mov       rax, qword ptr [rdx]
14026e035: mov       qword ptr [rbp + 0x330], rax
14026e03c: mov       rax, qword ptr [rdx + 8]
14026e040: mov       qword ptr [rbp + 0x338], rax
14026e047: mov       rax, qword ptr [rdx + 0x10]
14026e04b: mov       qword ptr [rbp + 0x340], rax
14026e052: lea       rdi, [rbp + 0xf8]
14026e059: lea       r13, [rbp + 0x3e4]
14026e060: mov       rbx, qword ptr [rdx + 0x18]
14026e064: xorps     xmm6, xmm6
14026e067: movaps    xmm7, xmmword ptr [rip + 0x5b2f1f2]
14026e06e: movaps    xmm8, xmmword ptr [rip + 0x5b5f08a]
14026e076: movaps    xmm9, xmmword ptr [rip + 0x5b2f232]
14026e07e: movaps    xmm10, xmmword ptr [rip + 0x5b2f3da]
14026e086: movsd     xmm11, qword ptr [rip + 0x5b2f3b1]
14026e08f: movaps    xmm12, xmmword ptr [rip + 0x5b66b99]
14026e097: movsd     xmm13, qword ptr [rip + 0x5b2f400]
14026e0a0: lea       rax, [rbx + 1]
14026e0a4: mov       qword ptr [rbp + 0x478], rax
14026e0ab: xor       r12d, r12d
14026e0ae: mov       qword ptr [rbp + 0x488], r15
14026e0b5: mov       qword ptr [rbp + 0x490], rbx
14026e0bc: cmp       r12, 2
14026e0c0: ja        0x14026ee76
14026e0c6: mov       rax, qword ptr [rbp + 0x330]
14026e0cd: mov       r14, qword ptr [rax]
14026e0d0: mov       rax, qword ptr [rbp + 0x340]
14026e0d7: mov       bl, byte ptr [rax]
14026e0d9: lea       rsi, [rbp + 0x318]
14026e0e0: mov       rcx, rsi
14026e0e3: mov       rdx, qword ptr [rbp + 0x338]
14026e0ea: mov       r8d, ebx
14026e0ed: mov       r9, r12
14026e0f0: call      0x14589c200
14026e0f5: nop
14026e0f6: lea       rcx, [rbp + 0x44c]
14026e0fd: mov       rdx, rsi
14026e100: mov       r8d, ebx
14026e103: call      0x14590fd60
14026e108: nop
14026e109: cmp       r12, r14
14026e10c: jne       0x14026e120
14026e10e: movups    xmm0, xmmword ptr [rip + 0x5b7d763]
14026e115: jmp       0x14026e127
14026e117: nop       word ptr [rax + rax]
14026e120: movups    xmm0, xmmword ptr [rip + 0x5b7dac9]
14026e127: movaps    xmmword ptr [rbp + 0x4a0], xmm0
14026e12e: mov       dword ptr [rbp + 0x4b0], 0x3f800000
14026e138: movups    xmm0, xmmword ptr [rip + 0x5b7d7c1]
14026e13f: movaps    xmmword ptr [rbp + 0xe0], xmm0
14026e146: mov       qword ptr [rbp + 0xf0], 0
14026e151: movups    xmm0, xmmword ptr [rip + 0x5b7d7c0]
14026e158: movups    xmmword ptr [rdi], xmm0
14026e15b: mov       qword ptr [rdi + 0x10], 0
14026e163: movups    xmm0, xmmword ptr [rip + 0x5b7d7c6]
14026e16a: movups    xmmword ptr [rdi + 0x18], xmm0
14026e16e: mov       qword ptr [rdi + 0x28], 0
14026e176: movups    xmm0, xmmword ptr [rip + 0x5b7d7cb]
14026e17d: movups    xmmword ptr [rdi + 0x30], xmm0
14026e181: mov       qword ptr [rdi + 0x40], 0
14026e189: mov       eax, dword ptr [rbp + 0x4b0]
14026e18f: lea       rcx, [rbp + 0x2d4]
14026e196: mov       dword ptr [rcx + 0x38], eax
14026e199: movaps    xmm0, xmmword ptr [rbp + 0x4a0]
14026e1a0: movups    xmmword ptr [rcx + 0x28], xmm0
14026e1a4: movaps    xmm0, xmmword ptr [rbp + 0x4a0]
14026e1ab: movaps    xmmword ptr [rbp + 0x2c0], xmm0
14026e1b2: mov       eax, dword ptr [rbp + 0x4b0]
14026e1b8: mov       dword ptr [rbp + 0x2d0], eax
14026e1be: mov       dword ptr [rcx + 0x10], eax
14026e1c1: movups    xmmword ptr [rcx], xmm0
14026e1c4: mov       eax, dword ptr [rbp + 0x4b0]
14026e1ca: mov       dword ptr [rcx + 0x24], eax
14026e1cd: movaps    xmm0, xmmword ptr [rbp + 0x4a0]
14026e1d4: movups    xmmword ptr [rcx + 0x14], xmm0
14026e1d8: movaps    xmm0, xmmword ptr [rbp + 0xe0]
14026e1df: movaps    xmm1, xmmword ptr [rbp + 0xf0]
14026e1e6: movaps    xmm2, xmmword ptr [rbp + 0x100]
14026e1ed: movaps    xmm3, xmmword ptr [rbp + 0x110]
14026e1f4: movaps    xmmword ptr [rbp], xmm0
14026e1f8: movaps    xmmword ptr [rbp + 0x10], xmm1
14026e1fc: movaps    xmmword ptr [rbp + 0x20], xmm2
14026e200: movaps    xmmword ptr [rbp + 0x30], xmm3
14026e204: movaps    xmm0, xmmword ptr [rbp + 0x120]
14026e20b: movaps    xmmword ptr [rbp + 0x40], xmm0
14026e20f: movaps    xmm0, xmmword ptr [rbp + 0x130]
14026e216: movaps    xmmword ptr [rbp + 0x50], xmm0
14026e21a: lea       rax, [rbp + 8]
14026e21e: movups    xmmword ptr [rax + 0x98], xmm6
14026e225: movups    xmmword ptr [rax + 0x88], xmm6
14026e22c: movups    xmmword ptr [rax + 0x78], xmm6
14026e230: movups    xmmword ptr [rax + 0x68], xmm6
14026e234: movups    xmmword ptr [rax + 0x58], xmm6
14026e238: mov       qword ptr [rax + 0xa8], 0
14026e243: movups    xmm0, xmmword ptr [rip + 0x5b7d77e]
14026e24a: movups    xmmword ptr [rax + 0xc0], xmm0
14026e251: movups    xmm0, xmmword ptr [rip + 0x5b7d760]
14026e258: movups    xmmword ptr [rax + 0xb0], xmm0
14026e25f: movaps    xmm0, xmmword ptr [rbp + 0x2c0]
14026e266: movaps    xmm1, xmmword ptr [rbp + 0x2d0]
14026e26d: movaps    xmm2, xmmword ptr [rbp + 0x2e0]
14026e274: movaps    xmm3, xmmword ptr [rbp + 0x2f0]
14026e27b: movups    xmmword ptr [r13 - 0x12], xmm0
14026e280: movups    xmmword ptr [r13 - 2], xmm1
14026e285: movups    xmmword ptr [r13 + 0xe], xmm2
14026e28a: movups    xmmword ptr [r13 + 0x1e], xmm3
14026e28f: movaps    xmm0, xmmword ptr [rbp + 0x300]
14026e296: movups    xmmword ptr [r13 + 0x2e], xmm0
14026e29b: mov       r8d, 0xd8
14026e2a1: lea       rcx, [rbp + 0xe8]
14026e2a8: mov       rdx, rbp
14026e2ab: call      0x145bfa0e7
14026e2b0: movups    xmmword ptr [rbp + 0x1c0], xmm7
14026e2b7: movups    xmmword ptr [rbp + 0x1d0], xmm8
14026e2bf: movups    xmmword ptr [rbp + 0x1e0], xmm9
14026e2c7: movups    xmmword ptr [rbp + 0x1f0], xmm9
14026e2cf: movups    xmmword ptr [rbp + 0x200], xmm8
14026e2d7: movups    xmmword ptr [rbp + 0x210], xmm8
14026e2df: movups    xmmword ptr [rbp + 0x220], xmm10
14026e2e7: mov       dword ptr [rbp + 0x230], 1
14026e2f1: mov       qword ptr [rbp + 0x234], 0
14026e2fc: mov       byte ptr [rbp + 0x23c], 1
14026e303: movsd     qword ptr [rbp + 0x240], xmm11
14026e30c: mov       dword ptr [rbp + 0x248], 0x3f800000
14026e316: mov       word ptr [rbp + 0x24c], 0
14026e31f: mov       dword ptr [rdi + 0x156], 0x10000
14026e329: mov       word ptr [rdi + 0x15a], 0
14026e332: mov       word ptr [rdi + 0x160], 0
14026e33b: mov       dword ptr [rdi + 0x15c], 0x10000
14026e345: mov       dword ptr [rbp + 0x25a], 0
14026e34f: movabs    rax, 0x500000001
14026e359: mov       qword ptr [rbp + 0x25e], rax
14026e360: movups    xmm0, xmmword ptr [rbp + 0x3d0]
14026e367: movups    xmm1, xmmword ptr [rbp + 0x3e0]
14026e36e: movups    xmm2, xmmword ptr [rbp + 0x3f0]
14026e375: movups    xmm3, xmmword ptr [rbp + 0x400]
14026e37c: movups    xmmword ptr [rdi + 0x16e], xmm0
14026e383: movups    xmmword ptr [rdi + 0x17e], xmm1
14026e38a: movups    xmmword ptr [rdi + 0x18e], xmm2
14026e391: movups    xmmword ptr [rdi + 0x19e], xmm3
14026e398: movups    xmm0, xmmword ptr [rbp + 0x410]
14026e39f: movups    xmmword ptr [rdi + 0x1ae], xmm0
14026e3a6: movzx     eax, word ptr [rbp + 0x420]
14026e3ad: mov       word ptr [rdi + 0x1be], ax
14026e3b4: mov       qword ptr [rbp + 0xe0], r15
14026e3bb: lea       rcx, [rbp + 0x2c0]
14026e3c2: lea       rdx, [rbp - 0x28]
14026e3c6: lea       r8, [rbp + 0xe0]
14026e3cd: call      0x1401ded20
14026e3d2: nop
14026e3d3: cmp       r12, r14
14026e3d6: jne       0x14026e520
14026e3dc: movups    xmm0, xmmword ptr [rip + 0x5b7d495]
14026e3e3: movaps    xmmword ptr [rbp + 0x3d0], xmm0
14026e3ea: mov       dword ptr [rbp + 0x3e0], 0x3eb33333
14026e3f4: lea       rcx, [rbp + 0xe0]
14026e3fb: lea       rdx, [rbp + 0x3d0]
14026e402: call      0x144c7dcf0
14026e407: nop
14026e408: movaps    xmm0, xmmword ptr [rbp + 0xe0]
14026e40f: movups    xmmword ptr [rbp + 4], xmm0
14026e413: mov       dword ptr [rbp], 1
14026e41a: mov       dword ptr [rsp + 0x48], 0x41200000
14026e422: mov       dword ptr [rsp + 0x40], 1
14026e42a: mov       dword ptr [rsp + 0x38], 0
14026e432: mov       dword ptr [rsp + 0x30], 1
14026e43a: mov       dword ptr [rsp + 0x28], 0
14026e442: mov       dword ptr [rsp + 0x20], 1
14026e44a: xorps     xmm3, xmm3
14026e44d: lea       rcx, [rbp + 0xe0]
14026e454: mov       rdx, rbp
14026e457: mov       r8d, 1
14026e45d: call      0x142649b80
14026e462: nop
14026e463: mov       rax, qword ptr [rbp + 0xe0]
14026e46a: mov       qword ptr [rbp + 0x4d0], rax
14026e471: mov       rcx, qword ptr [rbp + 0xe8]
14026e478: mov       r15, qword ptr [rbp + 0xf0]
14026e47f: mov       rax, qword ptr [rbp + 0x2c0]
14026e486: mov       qword ptr [rbp + 0x4c8], rax
14026e48d: mov       rbx, qword ptr [rbp + 0x2d8]
14026e494: mov       rsi, qword ptr [rbp + 0x2e0]
14026e49b: test      rbx, rbx
14026e49e: mov       qword ptr [rbp + 0x4c0], rcx
14026e4a5: je        0x14026ec0f
14026e4ab: mov       rax, qword ptr [rbx]
14026e4ae: mov       r13, qword ptr [rbx + 0x10]
14026e4b2: sub       rax, r13
14026e4b5: cmp       rax, 0x47
14026e4b9: jbe       0x14026edf3
14026e4bf: mov       rax, qword ptr [rbx + 8]
14026e4c3: lea       rcx, [rip + 0x11e36]
14026e4ca: mov       qword ptr [rax + r13], rcx
14026e4ce: mov       dword ptr [rax + r13 + 8], 0
14026e4d7: movups    xmmword ptr [rax + r13 + 0xc], xmm12
14026e4dd: mov       rcx, qword ptr [rbp + 0x4d0]
14026e4e4: mov       qword ptr [rax + r13 + 0x20], rcx
14026e4e9: mov       rcx, qword ptr [rbp + 0x4c0]
14026e4f0: mov       qword ptr [rax + r13 + 0x28], rcx
14026e4f5: mov       qword ptr [rax + r13 + 0x30], r15
14026e4fa: mov       byte ptr [rax + r13 + 0x38], 0
14026e500: mov       r15, qword ptr [rbp + 0x4c8]
14026e507: mov       qword ptr [rax + r13 + 0x40], r15
14026e50c: add       r13, 0x48
14026e510: mov       qword ptr [rbx + 0x10], r13
14026e514: jmp       0x14026e8e7
14026e519: nop       dword ptr [rax]
14026e520: mov       eax, dword ptr [rbp + 0x4b0]
14026e526: mov       dword ptr [rbp + 0x3e0], eax
14026e52c: movaps    xmm0, xmmword ptr [rbp + 0x4a0]
14026e533: movaps    xmmword ptr [rbp + 0x3d0], xmm0
14026e53a: movups    xmm0, xmmword ptr [rip + 0x5b7d3ab]
14026e541: movups    xmmword ptr [r13], xmm0
14026e546: mov       dword ptr [r13 + 0x10], 0x3f800000
14026e54e: lea       rcx, [rbp + 0xe0]
14026e555: call      0x140100690
14026e55a: nop
14026e55b: mov       rax, qword ptr [rbp + 0x3f0]
14026e562: lea       rcx, [rbp + 8]
14026e566: mov       qword ptr [rcx + 0x20], rax
14026e56a: movaps    xmm0, xmmword ptr [rbp + 0x3d0]
14026e571: movaps    xmm1, xmmword ptr [rbp + 0x3e0]
14026e578: movups    xmmword ptr [rcx + 0x10], xmm1
14026e57c: movups    xmmword ptr [rcx], xmm0
14026e57f: mov       rax, qword ptr [rbp + 0x140]
14026e586: lea       rcx, [rbp + 0x353]
14026e58d: mov       qword ptr [rcx + 0x60], rax
14026e591: movups    xmm0, xmmword ptr [rbp + 0x130]
14026e598: movups    xmmword ptr [rcx + 0x50], xmm0
14026e59c: movups    xmm0, xmmword ptr [rbp + 0x120]
14026e5a3: movups    xmmword ptr [rcx + 0x40], xmm0
14026e5a7: movups    xmm0, xmmword ptr [rbp + 0xe0]
14026e5ae: movups    xmm1, xmmword ptr [rbp + 0xf0]
14026e5b5: movups    xmm2, xmmword ptr [rbp + 0x100]
14026e5bc: movups    xmm3, xmmword ptr [rbp + 0x110]
14026e5c3: movups    xmmword ptr [rcx + 0x30], xmm3
14026e5c7: movups    xmmword ptr [rcx + 0x20], xmm2
14026e5cb: movups    xmmword ptr [rcx + 0x10], xmm1
14026e5cf: movups    xmmword ptr [rcx], xmm0
14026e5d2: mov       r15, qword ptr [rbp + 0x2c0]
14026e5d9: mov       rbx, qword ptr [rbp + 0x2d8]
14026e5e0: mov       rsi, qword ptr [rbp + 0x2e0]
14026e5e7: test      rbx, rbx
14026e5ea: je        0x14026e76e
14026e5f0: mov       qword ptr [rbp + 0xe0], 3
14026e5fb: mov       qword ptr [rbp + 0xe8], r12
14026e602: movups    xmm0, xmmword ptr [rbp]
14026e606: movups    xmm1, xmmword ptr [rbp + 0x10]
14026e60a: movups    xmm2, xmmword ptr [rbp + 0x20]
14026e60e: movups    xmmword ptr [rdi + 0x18], xmm2
14026e612: movups    xmmword ptr [rdi + 8], xmm1
14026e616: movups    xmmword ptr [rdi - 8], xmm0
14026e61a: mov       dword ptr [rbp + 0x120], 0
14026e624: mov       byte ptr [rbp + 0x124], 2
14026e62b: movups    xmm0, xmmword ptr [rbp + 0x3ab]
14026e632: movups    xmmword ptr [rdi + 0x88], xmm0
14026e639: movups    xmm0, xmmword ptr [rbp + 0x3a0]
14026e640: movups    xmmword ptr [rdi + 0x7d], xmm0
14026e644: movups    xmm0, xmmword ptr [rbp + 0x390]
14026e64b: movups    xmmword ptr [rdi + 0x6d], xmm0
14026e64f: movups    xmm0, xmmword ptr [rbp + 0x350]
14026e656: movups    xmm1, xmmword ptr [rbp + 0x360]
14026e65d: movups    xmm2, xmmword ptr [rbp + 0x370]
14026e664: movups    xmm3, xmmword ptr [rbp + 0x380]
14026e66b: movups    xmmword ptr [rdi + 0x5d], xmm3
14026e66f: movups    xmmword ptr [rdi + 0x4d], xmm2
14026e673: movups    xmmword ptr [rdi + 0x3d], xmm1
14026e677: movups    xmmword ptr [rdi + 0x2d], xmm0
14026e67b: mov       byte ptr [rbp + 0x190], 0
14026e682: mov       qword ptr [rbp + 0x198], r15
14026e689: mov       rax, qword ptr [rbx]
14026e68c: mov       r13, qword ptr [rbx + 0x10]
14026e690: sub       rax, r13
14026e693: cmp       rax, 0xc7
14026e699: jbe       0x14026edcd
14026e69f: mov       rax, qword ptr [rbx + 8]
14026e6a3: lea       rcx, [rip + 0x12126]
14026e6aa: mov       qword ptr [rax + r13], rcx
14026e6ae: mov       qword ptr [rax + r13 + 8], 3
14026e6b7: mov       qword ptr [rax + r13 + 0x10], r12
14026e6bc: movups    xmm0, xmmword ptr [rbp]
14026e6c0: movups    xmm1, xmmword ptr [rbp + 0x10]
14026e6c4: movups    xmm2, xmmword ptr [rbp + 0x20]
14026e6c8: movups    xmmword ptr [rax + r13 + 0x18], xmm0
14026e6ce: movups    xmmword ptr [rax + r13 + 0x28], xmm1
14026e6d4: movups    xmmword ptr [rax + r13 + 0x38], xmm2
14026e6da: mov       dword ptr [rax + r13 + 0x48], 0
14026e6e3: mov       byte ptr [rax + r13 + 0x4c], 2
14026e6e9: movups    xmm0, xmmword ptr [rbp + 0x350]
14026e6f0: movups    xmm1, xmmword ptr [rbp + 0x360]
14026e6f7: movups    xmm2, xmmword ptr [rbp + 0x370]
14026e6fe: movups    xmm3, xmmword ptr [rbp + 0x380]
14026e705: movups    xmmword ptr [rax + r13 + 0x4d], xmm0
14026e70b: movups    xmmword ptr [rax + r13 + 0x5d], xmm1
14026e711: movups    xmmword ptr [rax + r13 + 0x6d], xmm2
14026e717: movups    xmmword ptr [rax + r13 + 0x7d], xmm3
14026e71d: movups    xmm0, xmmword ptr [rbp + 0x390]
14026e724: movups    xmmword ptr [rax + r13 + 0x8d], xmm0
14026e72d: movups    xmm0, xmmword ptr [rbp + 0x3a0]
14026e734: movups    xmmword ptr [rax + r13 + 0x9d], xmm0
14026e73d: movups    xmm0, xmmword ptr [rbp + 0x3ab]
14026e744: movups    xmmword ptr [rax + r13 + 0xa8], xmm0
14026e74d: mov       byte ptr [rax + r13 + 0xb8], 0
14026e756: mov       qword ptr [rax + r13 + 0xc0], r15
14026e75e: add       r13, 0xc8
14026e765: mov       qword ptr [rbx + 0x10], r13
14026e769: jmp       0x14026e8e7
14026e76e: mov       qword ptr [rbp + 0xe0], 3
14026e779: mov       qword ptr [rbp + 0xe8], r12
14026e780: movups    xmm0, xmmword ptr [rbp]
14026e784: movups    xmm1, xmmword ptr [rbp + 0x10]
14026e788: movups    xmm2, xmmword ptr [rbp + 0x20]
14026e78c: movups    xmmword ptr [rdi + 0x18], xmm2
14026e790: movups    xmmword ptr [rdi + 8], xmm1
14026e794: movups    xmmword ptr [rdi - 8], xmm0
14026e798: mov       dword ptr [rbp + 0x120], 0
14026e7a2: mov       byte ptr [rbp + 0x124], 2
14026e7a9: movups    xmm0, xmmword ptr [rbp + 0x3ab]
14026e7b0: movups    xmmword ptr [rdi + 0x88], xmm0
14026e7b7: movups    xmm0, xmmword ptr [rbp + 0x3a0]
14026e7be: movups    xmmword ptr [rdi + 0x7d], xmm0
14026e7c2: movups    xmm0, xmmword ptr [rbp + 0x390]
14026e7c9: movups    xmmword ptr [rdi + 0x6d], xmm0
14026e7cd: movups    xmm0, xmmword ptr [rbp + 0x350]
14026e7d4: movups    xmm1, xmmword ptr [rbp + 0x360]
14026e7db: movups    xmm2, xmmword ptr [rbp + 0x370]
14026e7e2: movups    xmm3, xmmword ptr [rbp + 0x380]
14026e7e9: movups    xmmword ptr [rdi + 0x5d], xmm3
14026e7ed: movups    xmmword ptr [rdi + 0x4d], xmm2
14026e7f1: movups    xmmword ptr [rdi + 0x3d], xmm1
14026e7f5: movups    xmmword ptr [rdi + 0x2d], xmm0
14026e7f9: mov       byte ptr [rbp + 0x190], 0
14026e800: mov       qword ptr [rbp + 0x198], r15
14026e807: mov       rax, qword ptr [rsi]
14026e80a: mov       r13, qword ptr [rsi + 0x10]
14026e80e: sub       rax, r13
14026e811: cmp       rax, 0xc7
14026e817: jbe       0x14026ee19
14026e81d: mov       rax, qword ptr [rsi + 8]
14026e821: lea       rcx, [rip + 0x11fa8]
14026e828: mov       qword ptr [rax + r13], rcx
14026e82c: mov       qword ptr [rax + r13 + 8], 3
14026e835: mov       qword ptr [rax + r13 + 0x10], r12
14026e83a: movups    xmm0, xmmword ptr [rbp]
14026e83e: movups    xmm1, xmmword ptr [rbp + 0x10]
14026e842: movups    xmm2, xmmword ptr [rbp + 0x20]
14026e846: movups    xmmword ptr [rax + r13 + 0x18], xmm0
14026e84c: movups    xmmword ptr [rax + r13 + 0x28], xmm1
14026e852: movups    xmmword ptr [rax + r13 + 0x38], xmm2
14026e858: mov       dword ptr [rax + r13 + 0x48], 0
14026e861: mov       byte ptr [rax + r13 + 0x4c], 2
14026e867: movups    xmm0, xmmword ptr [rbp + 0x350]
14026e86e: movups    xmm1, xmmword ptr [rbp + 0x360]
14026e875: movups    xmm2, xmmword ptr [rbp + 0x370]
14026e87c: movups    xmm3, xmmword ptr [rbp + 0x380]
14026e883: movups    xmmword ptr [rax + r13 + 0x4d], xmm0
14026e889: movups    xmmword ptr [rax + r13 + 0x5d], xmm1
14026e88f: movups    xmmword ptr [rax + r13 + 0x6d], xmm2
14026e895: movups    xmmword ptr [rax + r13 + 0x7d], xmm3
14026e89b: movups    xmm0, xmmword ptr [rbp + 0x390]
14026e8a2: movups    xmmword ptr [rax + r13 + 0x8d], xmm0
14026e8ab: movups    xmm0, xmmword ptr [rbp + 0x3a0]
14026e8b2: movups    xmmword ptr [rax + r13 + 0x9d], xmm0
14026e8bb: movups    xmm0, xmmword ptr [rbp + 0x3ab]
14026e8c2: movups    xmmword ptr [rax + r13 + 0xa8], xmm0
14026e8cb: mov       byte ptr [rax + r13 + 0xb8], 0
14026e8d4: mov       qword ptr [rax + r13 + 0xc0], r15
14026e8dc: add       r13, 0xc8
14026e8e3: mov       qword ptr [rsi + 0x10], r13
14026e8e7: lea       r13, [rbp + 0x3e4]
14026e8ee: mov       qword ptr [rbp + 0x4c8], r15
14026e8f5: mov       qword ptr [rbp + 0x3d0], r15
14026e8fc: movups    xmm0, xmmword ptr [rbp + 0x2c8]
14026e903: movups    xmmword ptr [rbp + 0x3d8], xmm0
14026e90a: mov       qword ptr [rbp + 0x3e8], rbx
14026e911: mov       rax, qword ptr [rbp + 0x2e8]
14026e918: mov       qword ptr [rbp + 0x3f0], rsi
14026e91f: mov       qword ptr [rbp + 0x3f8], rax
14026e926: cmp       r12, r14
14026e929: jne       0x14026e940
14026e92b: movups    xmm0, xmmword ptr [rip + 0x5b7cfba]
14026e932: jmp       0x14026e947
14026e934: nop       word ptr cs:[rax + rax]
14026e940: movups    xmm0, xmmword ptr [rip + 0x5b7cf31]
14026e947: movaps    xmmword ptr [rbp + 0x430], xmm0
14026e94e: mov       dword ptr [rbp + 0x440], 0x3f800000
14026e958: mov       rbx, qword ptr [rbp + 0x490]
14026e95f: mov       r15, qword ptr [rbp + 0x488]
14026e966: mov       edx, 8
14026e96b: lea       rcx, [rip + 0x5b7f1f3]
14026e972: call      0x1458ec450
14026e977: nop
14026e978: mov       r8, rdx
14026e97b: inc       r12
14026e97e: mov       qword ptr [rbp + 0x310], r12
14026e985: lea       rcx, [rip + 0x5b7d998]
14026e98c: mov       qword ptr [rbp + 0x458], rcx
14026e993: mov       qword ptr [rbp + 0x460], 1
14026e99e: lea       rcx, [rbp + 0x310]
14026e9a5: mov       qword ptr [rbp + 0x468], rcx
14026e9ac: lea       rcx, [rip + 0x5b7d175]
14026e9b3: mov       qword ptr [rbp + 0x470], rcx
14026e9ba: mov       qword ptr [rsp + 0x20], 1
14026e9c3: mov       rcx, rbp
14026e9c6: mov       rdx, rax
14026e9c9: lea       r9, [rbp + 0x458]
14026e9d0: call      0x1458ec8b0
14026e9d5: nop
14026e9d6: cmp       byte ptr [rbx], 1
14026e9d9: jne       0x14026ea00
14026e9db: mov       rcx, qword ptr [rbp + 0x478]
14026e9e2: mov       eax, dword ptr [rcx]
14026e9e4: mov       ecx, dword ptr [rcx + 3]
14026e9e7: mov       dword ptr [rbp + 0x49b], ecx
14026e9ed: mov       dword ptr [rbp + 0x498], eax
14026e9f3: mov       rax, qword ptr [rbx + 8]
14026e9f7: movzx     edx, byte ptr [rbx + 0x10]
14026e9fb: mov       cl, 1
14026e9fd: jmp       0x14026ea10
14026e9ff: nop
14026ea00: mov       rax, qword ptr [rbx + 8]
14026ea04: lock inc  qword ptr [rax]
14026ea08: jle       0x14026ee74
14026ea0e: xor       ecx, ecx
14026ea10: mov       r8, qword ptr [rbp + 0x10]
14026ea14: lea       r9, [rbp + 0xe8]
14026ea1b: mov       qword ptr [r9 + 0x10], r8
14026ea1f: movups    xmm0, xmmword ptr [rbp]
14026ea23: movups    xmmword ptr [r9], xmm0
14026ea27: mov       r8d, dword ptr [rbp + 0x498]
14026ea2e: mov       r9d, dword ptr [rbp + 0x49b]
14026ea35: mov       dword ptr [rdi + 0x24], r9d
14026ea39: mov       dword ptr [rdi + 0x21], r8d
14026ea3d: mov       r8d, dword ptr [rbp + 0x440]
14026ea44: lea       r9, [rbp + 0x3bc]
14026ea4b: mov       dword ptr [r9 + 0x10], r8d
14026ea4f: movaps    xmm0, xmmword ptr [rbp + 0x430]
14026ea56: movups    xmmword ptr [r9], xmm0
14026ea5a: mov       qword ptr [rbp + 0x100], 0
14026ea65: mov       qword ptr [rbp + 0x108], 4
14026ea70: mov       qword ptr [rbp + 0x110], 0
14026ea7b: mov       byte ptr [rbp + 0x118], cl
14026ea81: mov       qword ptr [rbp + 0x120], rax
14026ea88: mov       qword ptr [rbp + 0x128], rdx
14026ea8f: mov       dword ptr [rbp + 0x130], 0x41600000
14026ea99: mov       word ptr [rbp + 0x134], 0x190
14026eaa2: mov       byte ptr [rbp + 0x136], 1
14026eaa9: mov       rax, qword ptr [rbp + 0x3c8]
14026eab0: mov       qword ptr [rdi + 0x4c], rax
14026eab4: movups    xmm0, xmmword ptr [rbp + 0x3bb]
14026eabb: movups    xmmword ptr [rdi + 0x3f], xmm0
14026eabf: mov       r14d, dword ptr [rip + 0x5b66fda]
14026eac6: mov       dword ptr [rdi + 0x64], r14d
14026eaca: movups    xmm14, xmmword ptr [rip + 0x5b66fbe]
14026ead2: movups    xmmword ptr [rdi + 0x54], xmm14
14026ead7: movsd     qword ptr [rbp + 0x160], xmm13
14026eae0: mov       rax, qword ptr [rbp + 0x4c8]
14026eae7: mov       qword ptr [rbp + 0xe0], rax
14026eaee: mov       rcx, rbp
14026eaf1: lea       rdx, [rbp + 0x3d8]
14026eaf8: lea       r8, [rbp + 0xe0]
14026eaff: call      0x1401f2bf0
14026eb04: nop
14026eb05: lea       rcx, [rbp + 0x318]
14026eb0c: call      0x14590fcc0
14026eb11: nop
14026eb12: test      eax, eax
14026eb14: je        0x14026ebb0
14026eb1a: lea       rax, [rbp + 0x44c]
14026eb21: mov       qword ptr [rbp + 0xe0], rax
14026eb28: lea       rcx, [rip + 0x596fdb1]
14026eb2f: mov       qword ptr [rbp + 0xe8], rcx
14026eb36: lea       rax, [rbp + 0x450]
14026eb3d: mov       qword ptr [rbp + 0xf0], rax
14026eb44: mov       qword ptr [rbp + 0xf8], rcx
14026eb4b: lea       rax, [rbp + 0x454]
14026eb52: mov       qword ptr [rbp + 0x100], rax
14026eb59: mov       qword ptr [rbp + 0x108], rcx
14026eb60: lea       rcx, [rbp + 0x458]
14026eb67: lea       rdx, [rip + 0x5b7f004]
14026eb6e: lea       r8, [rbp + 0xe0]
14026eb75: call      0x145bcce30
14026eb7a: nop
14026eb7b: cmp       byte ptr [rbx], 1
14026eb7e: jne       0x14026ecaf
14026eb84: mov       rcx, qword ptr [rbp + 0x478]
14026eb8b: mov       eax, dword ptr [rcx]
14026eb8d: mov       ecx, dword ptr [rcx + 3]
14026eb90: mov       dword ptr [rbp + 3], ecx
14026eb93: mov       dword ptr [rbp], eax
14026eb96: mov       rax, qword ptr [rbx + 8]
14026eb9a: movzx     edx, byte ptr [rbx + 0x10]
14026eb9e: mov       cl, 1
14026eba0: jmp       0x14026ecbf
14026eba5: nop       word ptr cs:[rax + rax]
14026ebb0: mov       edx, 5
14026ebb5: lea       rcx, [rip + 0x5b7efb1]
14026ebbc: call      0x1458ec450
14026ebc1: nop
14026ebc2: mov       rsi, rdx
14026ebc5: test      rdx, rdx
14026ebc8: js        0x14026ee65
14026ebce: test      rsi, rsi
14026ebd1: je        0x14026ec7d
14026ebd7: mov       rbx, rax
14026ebda: call      0x140002200
14026ebdf: mov       edx, 1
14026ebe4: mov       rcx, rsi
14026ebe7: call      0x1400021c0
14026ebec: test      rax, rax
14026ebef: je        0x14026eed7
14026ebf5: mov       r15, rax
14026ebf8: mov       rcx, rax
14026ebfb: mov       rdx, rbx
14026ebfe: mov       r8, rsi
14026ec01: call      0x145bfa0e7
14026ec06: mov       rbx, qword ptr [rbp + 0x490]
14026ec0d: jmp       0x14026ec83
14026ec0f: mov       rax, qword ptr [rsi]
14026ec12: mov       rbx, qword ptr [rsi + 0x10]
14026ec16: sub       rax, rbx
14026ec19: cmp       rax, 0x47
14026ec1d: jbe       0x14026ee3f
14026ec23: mov       rax, qword ptr [rsi + 8]
14026ec27: lea       rcx, [rip + 0x116d2]
14026ec2e: mov       qword ptr [rax + rbx], rcx
14026ec32: mov       dword ptr [rax + rbx + 8], 0
14026ec3a: movups    xmmword ptr [rax + rbx + 0xc], xmm12
14026ec40: mov       rcx, qword ptr [rbp + 0x4d0]
14026ec47: mov       qword ptr [rax + rbx + 0x20], rcx
14026ec4c: mov       rcx, qword ptr [rbp + 0x4c0]
14026ec53: mov       qword ptr [rax + rbx + 0x28], rcx
14026ec58: mov       qword ptr [rax + rbx + 0x30], r15
14026ec5d: mov       byte ptr [rax + rbx + 0x38], 0
14026ec62: mov       r15, qword ptr [rbp + 0x4c8]
14026ec69: mov       qword ptr [rax + rbx + 0x40], r15
14026ec6e: add       rbx, 0x48
14026ec72: mov       qword ptr [rsi + 0x10], rbx
14026ec76: xor       ebx, ebx
14026ec78: jmp       0x14026e8ee
14026ec7d: mov       r15d, 1
14026ec83: mov       qword ptr [rbp + 0x458], rsi
14026ec8a: mov       qword ptr [rbp + 0x480], r15
14026ec91: mov       qword ptr [rbp + 0x460], r15
14026ec98: mov       qword ptr [rbp + 0x468], rsi
14026ec9f: mov       r15, qword ptr [rbp + 0x488]
14026eca6: cmp       byte ptr [rbx], 1
14026eca9: je        0x14026eb84
14026ecaf: mov       rax, qword ptr [rbx + 8]
14026ecb3: lock inc  qword ptr [rax]
14026ecb7: jle       0x14026ee74
14026ecbd: xor       ecx, ecx
14026ecbf: mov       r8, qword ptr [rbp + 0x468]
14026ecc6: lea       r9, [rbp + 0xe8]
14026eccd: mov       qword ptr [r9 + 0x10], r8
14026ecd1: movups    xmm0, xmmword ptr [rbp + 0x458]
14026ecd8: movups    xmmword ptr [r9], xmm0
14026ecdc: mov       r8d, dword ptr [rbp]
14026ece0: mov       r9d, dword ptr [rbp + 3]
14026ece4: mov       dword ptr [rdi + 0x24], r9d
14026ece8: mov       dword ptr [rdi + 0x21], r8d
14026ecec: movups    xmm0, xmmword ptr [rip + 0x5b7cbc9]
14026ecf3: lea       r8, [rbp + 0x3bc]
14026ecfa: movups    xmmword ptr [r8], xmm0
14026ecfe: mov       dword ptr [r8 + 0x10], 0x3f800000
14026ed06: mov       qword ptr [rbp + 0x100], 0
14026ed11: mov       qword ptr [rbp + 0x108], 4
14026ed1c: mov       qword ptr [rbp + 0x110], 0
14026ed27: mov       byte ptr [rbp + 0x118], cl
14026ed2d: mov       qword ptr [rbp + 0x120], rax
14026ed34: mov       qword ptr [rbp + 0x128], rdx
14026ed3b: mov       dword ptr [rbp + 0x130], 0x41300000
14026ed45: mov       word ptr [rbp + 0x134], 0x190
14026ed4e: mov       byte ptr [rbp + 0x136], 1
14026ed55: mov       rax, qword ptr [rbp + 0x3c8]
14026ed5c: mov       qword ptr [rdi + 0x4c], rax
14026ed60: movups    xmm0, xmmword ptr [rbp + 0x3bb]
14026ed67: movups    xmmword ptr [rdi + 0x3f], xmm0
14026ed6b: mov       dword ptr [rdi + 0x64], r14d
14026ed6f: movups    xmmword ptr [rdi + 0x54], xmm14
14026ed74: movsd     qword ptr [rbp + 0x160], xmm13
14026ed7d: mov       rax, qword ptr [rbp + 0x4c8]
14026ed84: mov       qword ptr [rbp + 0xe0], rax
14026ed8b: mov       rcx, rbp
14026ed8e: lea       rdx, [rbp + 0x3d8]
14026ed95: lea       r8, [rbp + 0xe0]
14026ed9c: call      0x1401f2bf0
14026eda1: nop
14026eda2: mov       rdx, qword ptr [rbp + 0x318]
14026eda9: test      rdx, rdx
14026edac: je        0x14026e0bc
14026edb2: mov       rcx, qword ptr [rbp + 0x320]
14026edb9: shl       rdx, 4
14026edbd: mov       r8d, 8
14026edc3: call      0x1400021d0
14026edc8: jmp       0x14026e0bc
14026edcd: mov       qword ptr [rsp + 0x20], 1
14026edd6: mov       r8d, 0xc8
14026eddc: mov       r9d, 1
14026ede2: mov       rcx, rbx
14026ede5: mov       rdx, r13
14026ede8: call      0x145bfa970
14026eded: nop
14026edee: jmp       0x14026e69f
14026edf3: mov       qword ptr [rsp + 0x20], 1
14026edfc: mov       r8d, 0x48
14026ee02: mov       r9d, 1
14026ee08: mov       rcx, rbx
14026ee0b: mov       rdx, r13
14026ee0e: call      0x145bfa970
14026ee13: nop
14026ee14: jmp       0x14026e4bf
14026ee19: mov       qword ptr [rsp + 0x20], 1
14026ee22: mov       r8d, 0xc8
14026ee28: mov       r9d, 1
14026ee2e: mov       rcx, rsi
14026ee31: mov       rdx, r13
14026ee34: call      0x145bfa970
14026ee39: nop
14026ee3a: jmp       0x14026e81d
14026ee3f: mov       qword ptr [rsp + 0x20], 1
14026ee48: mov       r8d, 0x48
14026ee4e: mov       r9d, 1
14026ee54: mov       rcx, rsi
14026ee57: mov       rdx, rbx
14026ee5a: call      0x145bfa970
14026ee5f: nop
14026ee60: jmp       0x14026ec23
14026ee65: xor       ecx, ecx
14026ee67: mov       rdx, qword ptr [rbp + 0x480]
14026ee6e: call      0x145d992bb
14026ee73: nop
14026ee74: ud2
14026ee76: mov       rax, qword ptr [rbp + 0x348]
14026ee7d: movaps    xmm6, xmmword ptr [rbp + 0x4e0]
14026ee84: movaps    xmm7, xmmword ptr [rbp + 0x4f0]
14026ee8b: movaps    xmm8, xmmword ptr [rbp + 0x500]
14026ee93: movaps    xmm9, xmmword ptr [rbp + 0x510]
14026ee9b: movaps    xmm10, xmmword ptr [rbp + 0x520]
14026eea3: movaps    xmm11, xmmword ptr [rbp + 0x530]
14026eeab: movaps    xmm12, xmmword ptr [rbp + 0x540]
14026eeb3: movaps    xmm13, xmmword ptr [rbp + 0x550]
14026eebb: movaps    xmm14, xmmword ptr [rbp + 0x560]
14026eec3: add       rsp, 0x5f8
14026eeca: pop       rbx
14026eecb: pop       rdi
14026eecc: pop       rsi
14026eecd: pop       r12
14026eecf: pop       r13
14026eed1: pop       r14
14026eed3: pop       r15
14026eed5: pop       rbp
14026eed6: ret
14026eed7: mov       qword ptr [rbp + 0x480], rsi
14026eede: mov       ecx, 1
14026eee3: jmp       0x14026ee67
