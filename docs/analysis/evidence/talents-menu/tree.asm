14026f360: push      rbp
14026f361: push      r15
14026f363: push      r14
14026f365: push      r13
14026f367: push      r12
14026f369: push      rsi
14026f36a: push      rdi
14026f36b: push      rbx
14026f36c: sub       rsp, 0x7c8
14026f373: lea       rbp, [rsp + 0x80]
14026f37b: movaps    xmmword ptr [rbp + 0x730], xmm15
14026f383: movaps    xmmword ptr [rbp + 0x720], xmm14
14026f38b: movaps    xmmword ptr [rbp + 0x710], xmm13
14026f393: movaps    xmmword ptr [rbp + 0x700], xmm12
14026f39b: movaps    xmmword ptr [rbp + 0x6f0], xmm11
14026f3a3: movaps    xmmword ptr [rbp + 0x6e0], xmm10
14026f3ab: movaps    xmmword ptr [rbp + 0x6d0], xmm9
14026f3b3: movaps    xmmword ptr [rbp + 0x6c0], xmm8
14026f3bb: movaps    xmmword ptr [rbp + 0x6b0], xmm7
14026f3c2: movaps    xmmword ptr [rbp + 0x6a0], xmm6
14026f3c9: mov       qword ptr [rbp + 0x698], 0xfffffffffffffffe
14026f3d4: mov       r14, rdx
14026f3d7: mov       r12, rcx
14026f3da: mov       rax, qword ptr [rcx]
14026f3dd: mov       rcx, qword ptr [rcx + 0x28]
14026f3e1: mov       qword ptr [rbp + 0x258], rax
14026f3e8: lea       rdx, [rbp + 0x260]
14026f3ef: movups    xmm0, xmmword ptr [r12 + 8]
14026f3f5: movups    xmmword ptr [rbp + 0x260], xmm0
14026f3fc: movups    xmm0, xmmword ptr [r12 + 0x18]
14026f402: movups    xmmword ptr [rbp + 0x270], xmm0
14026f409: mov       qword ptr [rbp + 0x280], rcx
14026f410: xorps     xmm9, xmm9
14026f414: movups    xmmword ptr [rbp + 0x410], xmm9
14026f41c: movups    xmmword ptr [rbp + 0x400], xmm9
14026f424: movups    xmmword ptr [rbp + 0x428], xmm9
14026f42c: movups    xmmword ptr [rbp + 0x438], xmm9
14026f434: mov       qword ptr [rbp + 0x448], 0
14026f43f: movups    xmm6, xmmword ptr [rip + 0x5b7c4ba]
14026f446: movaps    xmmword ptr [rbp], xmm6
14026f44a: mov       qword ptr [rbp + 0x10], 0
14026f452: movups    xmm7, xmmword ptr [rip + 0x5b7c4bf]
14026f459: movups    xmmword ptr [rbp + 0x18], xmm7
14026f45d: mov       qword ptr [rbp + 0x28], 0
14026f465: movups    xmm8, xmmword ptr [rip + 0x5b7c4c3]
14026f46d: movaps    xmmword ptr [rbp + 0x30], xmm8
14026f472: mov       qword ptr [rbp + 0x40], 0
14026f47a: movups    xmm15, xmmword ptr [rip + 0x5b7c4c6]
14026f482: movups    xmmword ptr [rbp + 0x48], xmm15
14026f487: mov       qword ptr [rbp + 0x58], 0
14026f48f: mov       rcx, qword ptr [rbp + 0x50]
14026f493: mov       qword ptr [rbp + 0x3e8], rcx
14026f49a: mov       rcx, qword ptr [rbp + 0x58]
14026f49e: mov       qword ptr [rbp + 0x3f0], rcx
14026f4a5: mov       rcx, qword ptr [rbp + 0x40]
14026f4a9: mov       qword ptr [rbp + 0x3d8], rcx
14026f4b0: mov       rcx, qword ptr [rbp + 0x48]
14026f4b4: mov       qword ptr [rbp + 0x3e0], rcx
14026f4bb: movaps    xmm0, xmmword ptr [rbp]
14026f4bf: movaps    xmm1, xmmword ptr [rbp + 0x10]
14026f4c3: movaps    xmm2, xmmword ptr [rbp + 0x20]
14026f4c7: movaps    xmm3, xmmword ptr [rbp + 0x30]
14026f4cb: movups    xmmword ptr [rbp + 0x3c8], xmm3
14026f4d2: movups    xmmword ptr [rbp + 0x3b8], xmm2
14026f4d9: movups    xmmword ptr [rbp + 0x3a8], xmm1
14026f4e0: movups    xmmword ptr [rbp + 0x398], xmm0
14026f4e7: mov       qword ptr [rbp + 0x3f8], 0
14026f4f2: movabs    rcx, 0x43b4000000000001
14026f4fc: mov       qword ptr [rbp + 0x420], rcx
14026f503: movups    xmm14, xmmword ptr [rip + 0x5b7c4bd]
14026f50b: movups    xmmword ptr [rbp + 0x460], xmm14
14026f513: movups    xmm11, xmmword ptr [rip + 0x5b7c49d]
14026f51b: movups    xmmword ptr [rbp + 0x450], xmm11
14026f523: movups    xmm10, xmmword ptr [rip + 0x5b7c4bd]
14026f52b: movups    xmmword ptr [rbp + 0x480], xmm10
14026f533: movups    xmm12, xmmword ptr [rip + 0x5b7c49d]
14026f53b: movups    xmmword ptr [rbp + 0x470], xmm12
14026f543: movups    xmm0, xmmword ptr [rip + 0x5b7c4be]
14026f54a: movups    xmmword ptr [rbp + 0x4a0], xmm0
14026f551: movups    xmm0, xmmword ptr [rip + 0x5b7c4a0]
14026f558: movups    xmmword ptr [rbp + 0x490], xmm0
14026f55f: movups    xmm0, xmmword ptr [rip + 0x5b7c4c2]
14026f566: movups    xmmword ptr [rbp + 0x4c0], xmm0
14026f56d: movups    xmm0, xmmword ptr [rip + 0x5b7c4a4]
14026f574: movups    xmmword ptr [rbp + 0x4b0], xmm0
14026f57b: movaps    xmm13, xmmword ptr [rip + 0x5b2dced]
14026f583: movups    xmmword ptr [rbp + 0x4d0], xmm13
14026f58b: mov       dword ptr [rbp + 0x4e0], 1
14026f595: movss     xmm0, dword ptr [rip + 0x5b2dd73]
14026f59d: movlps    qword ptr [rbp + 0x4e4], xmm0
14026f5a4: mov       byte ptr [rbp + 0x4ec], 1
14026f5ab: mov       qword ptr [rbp + 0x4f0], 0
14026f5b6: mov       dword ptr [rbp + 0x4f8], 0x3f800000
14026f5c0: mov       word ptr [rbp + 0x4fc], 0
14026f5c9: mov       word ptr [rbp + 0x502], 0
14026f5d2: mov       dword ptr [rbp + 0x4fe], 0x10000
14026f5dc: mov       word ptr [rbp + 0x508], 0
14026f5e5: mov       dword ptr [rbp + 0x504], 0x10000
14026f5ef: mov       qword ptr [rbp + 0x50a], 0
14026f5fa: mov       dword ptr [rbp + 0x512], 5
14026f604: mov       qword ptr [rbp + 0x390], rax
14026f60b: lea       rcx, [rbp - 0x30]
14026f60f: lea       r8, [rbp + 0x390]
14026f616: call      0x1401de510
14026f61b: mov       rdi, qword ptr [r14]
14026f61e: mov       r15, qword ptr [r14 + 8]
14026f622: mov       rax, qword ptr [r14 + 0x10]
14026f626: mov       qword ptr [rbp + 0x688], rax
14026f62d: mov       rax, qword ptr [r14 + 0x18]
14026f631: mov       qword ptr [rbp + 0x668], rax
14026f638: mov       r13, qword ptr [rbp - 0x30]
14026f63c: mov       rax, qword ptr [rbp - 8]
14026f640: mov       qword ptr [rbp + 0x340], r13
14026f647: movups    xmm0, xmmword ptr [rbp - 0x28]
14026f64b: movups    xmmword ptr [rbp + 0x348], xmm0
14026f652: movups    xmm0, xmmword ptr [rbp - 0x18]
14026f656: movups    xmmword ptr [rbp + 0x358], xmm0
14026f65d: mov       qword ptr [rbp + 0x368], rax
14026f664: mov       word ptr [rbp + 0x4f4], 0
14026f66d: mov       byte ptr [rbp + 0x4e4], 1
14026f674: movups    xmmword ptr [rbp + 0x3f8], xmm9
14026f67c: movups    xmmword ptr [rbp + 0x408], xmm9
14026f684: movaps    xmm0, xmmword ptr [rip + 0x5b7b595]
14026f68b: movups    xmmword ptr [rbp + 0x418], xmm0
14026f692: mov       qword ptr [rbp + 0x3f0], 0
14026f69d: movups    xmmword ptr [rbp + 0x428], xmm9
14026f6a5: movups    xmmword ptr [rbp + 0x438], xmm9
14026f6ad: movaps    xmm0, xmm14
14026f6b1: movaps    xmm14, xmm6
14026f6b5: mov       dword ptr [rbp + 0x508], 0
14026f6bf: mov       word ptr [rbp + 0x50c], 0
14026f6c8: movups    xmmword ptr [rbp + 0x448], xmm11
14026f6d0: movups    xmmword ptr [rbp + 0x458], xmm0
14026f6d7: movups    xmmword ptr [rbp + 0x468], xmm12
14026f6df: movups    xmmword ptr [rbp + 0x478], xmm10
14026f6e7: movaps    xmm9, xmmword ptr [rip + 0x5b2dbc1]
14026f6ef: movups    xmmword ptr [rbp + 0x488], xmm9
14026f6f7: movups    xmmword ptr [rbp + 0x498], xmm9
14026f6ff: movaps    xmm6, xmmword ptr [rip + 0x5b2deca]
14026f706: movups    xmmword ptr [rbp + 0x4a8], xmm6
14026f70d: movups    xmmword ptr [rbp + 0x4b8], xmm6
14026f714: mov       byte ptr [rbp + 0x506], 0
14026f71b: mov       dword ptr [rbp + 0x502], 0
14026f725: mov       qword ptr [rbp + 0x4e8], 0
14026f730: mov       dword ptr [rbp + 0x4f0], 0x3f800000
14026f73a: movups    xmmword ptr [rbp + 0x4c8], xmm13
14026f742: mov       dword ptr [rbp + 0x4d8], 1
14026f74c: mov       qword ptr [rbp + 0x4dc], 0
14026f757: mov       byte ptr [rbp + 0x507], 0
14026f75e: movaps    xmmword ptr [rbp + 0x390], xmm14
14026f766: mov       qword ptr [rbp + 0x3a0], 0
14026f771: movups    xmmword ptr [rbp + 0x3a8], xmm7
14026f778: mov       qword ptr [rbp + 0x3b8], 0
14026f783: movaps    xmmword ptr [rbp + 0x3c0], xmm8
14026f78b: mov       qword ptr [rbp + 0x3d0], 0
14026f796: movups    xmmword ptr [rbp + 0x3d8], xmm15
14026f79e: mov       qword ptr [rbp + 0x3e8], 0
14026f7a9: mov       word ptr [rbp + 0x4fa], 0
14026f7b2: mov       dword ptr [rbp + 0x4f6], 0x10000
14026f7bc: mov       word ptr [rbp + 0x500], 0
14026f7c5: mov       dword ptr [rbp + 0x4fc], 0x10000
14026f7cf: movups    xmm0, xmmword ptr [rip + 0x5b7c41a]
14026f7d6: movaps    xmmword ptr [rbp + 0x610], xmm0
14026f7dd: mov       dword ptr [rbp + 0x620], 0x3f800000
14026f7e7: movups    xmmword ptr [rbp + 0x624], xmm0
14026f7ee: mov       dword ptr [rbp + 0x634], 0x3f800000
14026f7f8: movups    xmmword ptr [rbp + 0x638], xmm0
14026f7ff: mov       dword ptr [rbp + 0x648], 0x3f800000
14026f809: movups    xmmword ptr [rbp + 0x64c], xmm0
14026f810: mov       dword ptr [rbp + 0x65c], 0x3f800000
14026f81a: mov       r8, qword ptr [r15 + 0x20]
14026f81e: mov       r9, qword ptr [r15 + 0x28]
14026f822: mov       rcx, rbp
14026f825: mov       rdx, rdi
14026f828: call      0x1401008c0
14026f82d: nop
14026f82e: lea       rcx, [rbp + 0x2a0]
14026f835: mov       rdx, rbp
14026f838: call      0x1426eca60
14026f83d: nop
14026f83e: lea       rsi, [rbp + 0x348]
14026f845: mov       rbx, rbp
14026f848: lea       rdx, [rbp + 0x390]
14026f84f: mov       r8d, 0x180
14026f855: mov       rcx, rbx
14026f858: call      0x145bfa0e7
14026f85d: movaps    xmm0, xmmword ptr [rbp + 0x610]
14026f864: movaps    xmm1, xmmword ptr [rbp + 0x620]
14026f86b: movaps    xmm2, xmmword ptr [rbp + 0x630]
14026f872: movaps    xmm3, xmmword ptr [rbp + 0x640]
14026f879: movups    xmmword ptr [rbp + 0x180], xmm0
14026f880: movups    xmmword ptr [rbp + 0x190], xmm1
14026f887: movups    xmmword ptr [rbp + 0x1a0], xmm2
14026f88e: movups    xmmword ptr [rbp + 0x1b0], xmm3
14026f895: movaps    xmm0, xmmword ptr [rbp + 0x650]
14026f89c: movups    xmmword ptr [rbp + 0x1c0], xmm0
14026f8a3: lea       rcx, [rbp + 0x1d0]
14026f8aa: lea       rdx, [rbp + 0x2a0]
14026f8b1: mov       r8d, 0x88
14026f8b7: call      0x145bfa0e7
14026f8bc: lea       rcx, [rbp + 0x398]
14026f8c3: mov       r8d, 0x258
14026f8c9: mov       rdx, rbx
14026f8cc: call      0x145bfa0e7
14026f8d1: mov       qword ptr [rbp + 0x390], r13
14026f8d8: lea       rcx, [rbp + 0x2a0]
14026f8df: lea       r8, [rbp + 0x390]
14026f8e6: mov       rdx, rsi
14026f8e9: call      0x1401e0300
14026f8ee: mov       word ptr [rbp + 0x164], 0
14026f8f7: mov       byte ptr [rbp + 0x154], 1
14026f8fe: xorps     xmm0, xmm0
14026f901: movaps    xmmword ptr [rbp + 0x60], xmm0
14026f905: movaps    xmmword ptr [rbp + 0x70], xmm0
14026f909: movaps    xmmword ptr [rbp + 0x80], xmm0
14026f910: movaps    xmmword ptr [rbp + 0x90], xmm0
14026f917: movaps    xmmword ptr [rbp + 0xa0], xmm0
14026f91e: mov       qword ptr [rbp + 0xb0], 0
14026f929: mov       dword ptr [rbp + 0x178], 0
14026f933: mov       word ptr [rbp + 0x17c], 0
14026f93c: movups    xmmword ptr [rbp + 0xb8], xmm11
14026f944: movups    xmm0, xmmword ptr [rip + 0x5b7c07d]
14026f94b: movups    xmmword ptr [rbp + 0xc8], xmm0
14026f952: movups    xmmword ptr [rbp + 0xd8], xmm12
14026f95a: movups    xmmword ptr [rbp + 0xe8], xmm10
14026f962: movups    xmm0, xmmword ptr [rip + 0x5b7c09f]
14026f969: movups    xmmword ptr [rbp + 0x108], xmm0
14026f970: movups    xmm0, xmmword ptr [rip + 0x5b7c081]
14026f977: movups    xmmword ptr [rbp + 0xf8], xmm0
14026f97e: movups    xmm0, xmmword ptr [rip + 0x5b7c0a3]
14026f985: movups    xmmword ptr [rbp + 0x128], xmm0
14026f98c: movups    xmm0, xmmword ptr [rip + 0x5b7c085]
14026f993: movups    xmmword ptr [rbp + 0x118], xmm0
14026f99a: mov       byte ptr [rbp + 0x176], 0
14026f9a1: mov       dword ptr [rbp + 0x172], 0
14026f9ab: movsd     xmm0, qword ptr [rip + 0x5b2da8d]
14026f9b3: movsd     qword ptr [rbp + 0x158], xmm0
14026f9bb: mov       dword ptr [rbp + 0x160], 0x3f800000
14026f9c5: movaps    xmm0, xmmword ptr [rip + 0x5b2d8a4]
14026f9cc: movups    xmmword ptr [rbp + 0x138], xmm0
14026f9d3: mov       dword ptr [rbp + 0x148], 1
14026f9dd: mov       qword ptr [rbp + 0x14c], 0
14026f9e8: mov       byte ptr [rbp + 0x177], 0
14026f9ef: movaps    xmmword ptr [rbp], xmm14
14026f9f4: mov       qword ptr [rbp + 0x10], 0
14026f9fc: movups    xmmword ptr [rbp + 0x18], xmm7
14026fa00: mov       qword ptr [rbp + 0x28], 0
14026fa08: movaps    xmmword ptr [rbp + 0x30], xmm8
14026fa0d: mov       qword ptr [rbp + 0x40], 0
14026fa15: movups    xmmword ptr [rbp + 0x48], xmm15
14026fa1a: mov       qword ptr [rbp + 0x58], 0
14026fa22: mov       word ptr [rbp + 0x16a], 0
14026fa2b: mov       dword ptr [rbp + 0x166], 0x10000
14026fa35: mov       word ptr [rbp + 0x170], 0
14026fa3e: mov       dword ptr [rbp + 0x16c], 0x10000
14026fa48: mov       rcx, r15
14026fa4b: call      0x14590d390
14026fa50: nop
14026fa51: mov       rbx, rdx
14026fa54: test      rdx, rdx
14026fa57: jns       0x14026fa6d
14026fa59: xor       r15d, r15d
14026fa5c: mov       rcx, r15
14026fa5f: mov       rdx, rbx
14026fa62: call      0x145d992bb
14026fa67: nop
14026fa68: jmp       0x14027026e
14026fa6d: mov       qword ptr [rbp + 0x680], r13
14026fa74: mov       qword ptr [rbp + 0x690], r15
14026fa7b: test      rbx, rbx
14026fa7e: je        0x14026faf0
14026fa80: mov       rsi, rax
14026fa83: call      0x140002200
14026fa88: mov       r15d, 1
14026fa8e: mov       edx, 1
14026fa93: mov       rcx, rbx
14026fa96: call      0x1400021c0
14026fa9b: test      rax, rax
14026fa9e: je        0x14026fa5c
14026faa0: mov       r13, rax
14026faa3: mov       rcx, rax
14026faa6: mov       rdx, rsi
14026faa9: mov       r8, rbx
14026faac: call      0x145bfa0e7
14026fab1: mov       rdx, qword ptr [rbp + 0x688]
14026fab8: cmp       byte ptr [rdx + 0x18], 1
14026fabc: mov       qword ptr [rbp + 0x330], rdi
14026fac3: jne       0x14026fb0a
14026fac5: movaps    xmm13, xmm6
14026fac9: movaps    xmm15, xmm8
14026facd: movaps    xmm8, xmm7
14026fad1: mov       eax, dword ptr [rdx + 0x19]
14026fad4: mov       ecx, dword ptr [rdx + 0x1c]
14026fad7: mov       dword ptr [rbp + 0x67b], ecx
14026fadd: mov       dword ptr [rbp + 0x678], eax
14026fae3: mov       rsi, qword ptr [rdx + 0x20]
14026fae7: movzx     edi, byte ptr [rdx + 0x28]
14026faeb: mov       r15b, 1
14026faee: jmp       0x14026fb27
14026faf0: mov       r13d, 1
14026faf6: mov       rdx, qword ptr [rbp + 0x688]
14026fafd: cmp       byte ptr [rdx + 0x18], 1
14026fb01: mov       qword ptr [rbp + 0x330], rdi
14026fb08: je        0x14026fac5
14026fb0a: mov       rsi, qword ptr [rdx + 0x20]
14026fb0e: lock inc  qword ptr [rsi]
14026fb12: jle       0x14027026e
14026fb18: movaps    xmm15, xmm8
14026fb1c: movaps    xmm13, xmm6
14026fb20: movaps    xmm8, xmm7
14026fb24: xor       r15d, r15d
14026fb27: movups    xmm0, xmmword ptr [rip + 0x5b7bd4a]
14026fb2e: movups    xmmword ptr [rbp + 0x28c], xmm0
14026fb35: mov       dword ptr [rbp + 0x29c], 0x3f800000
14026fb3f: lea       rcx, [rbp + 0x398]
14026fb46: mov       rdx, rbp
14026fb49: mov       r8d, 0x180
14026fb4f: call      0x145bfa0e7
14026fb54: mov       qword ptr [rbp + 0x518], rbx
14026fb5b: mov       qword ptr [rbp + 0x520], r13
14026fb62: mov       qword ptr [rbp + 0x528], rbx
14026fb69: mov       qword ptr [rbp + 0x530], 0
14026fb74: mov       qword ptr [rbp + 0x538], 4
14026fb7f: mov       qword ptr [rbp + 0x540], 0
14026fb8a: mov       byte ptr [rbp + 0x548], r15b
14026fb91: mov       eax, dword ptr [rbp + 0x678]
14026fb97: mov       ecx, dword ptr [rbp + 0x67b]
14026fb9d: mov       dword ptr [rbp + 0x549], eax
14026fba3: mov       dword ptr [rbp + 0x54c], ecx
14026fba9: mov       qword ptr [rbp + 0x550], rsi
14026fbb0: mov       qword ptr [rbp + 0x558], rdi
14026fbb7: mov       dword ptr [rbp + 0x560], 0x41c00000
14026fbc1: mov       word ptr [rbp + 0x564], 0x190
14026fbca: mov       byte ptr [rbp + 0x566], 1
14026fbd1: movups    xmm0, xmmword ptr [rbp + 0x28b]
14026fbd8: movups    xmmword ptr [rbp + 0x567], xmm0
14026fbdf: mov       rax, qword ptr [rbp + 0x298]
14026fbe6: mov       qword ptr [rbp + 0x574], rax
14026fbed: mov       esi, dword ptr [rip + 0x5b65ead]
14026fbf3: mov       dword ptr [rbp + 0x58c], esi
14026fbf9: movups    xmm6, xmmword ptr [rip + 0x5b65e90]
14026fc00: movups    xmmword ptr [rbp + 0x57c], xmm6
14026fc07: movsd     xmm7, qword ptr [rip + 0x5b2d891]
14026fc0f: movsd     qword ptr [rbp + 0x590], xmm7
14026fc17: mov       rax, qword ptr [rbp + 0x680]
14026fc1e: mov       qword ptr [rbp + 0x390], rax
14026fc25: mov       rcx, rbp
14026fc28: lea       r8, [rbp + 0x390]
14026fc2f: lea       rdx, [rbp + 0x348]
14026fc36: call      0x1401e2c10
14026fc3b: mov       r15, qword ptr [rbp + 0x668]
14026fc42: cmp       dword ptr [r15], 0
14026fc46: je        0x14026fc51
14026fc48: movups    xmm0, xmmword ptr [rip + 0x5b7bc9d]
14026fc4f: jmp       0x14026fc58
14026fc51: movups    xmm0, xmmword ptr [rip + 0x5b7bc64]
14026fc58: movaps    xmmword ptr [rbp + 0x5f0], xmm0
14026fc5f: mov       dword ptr [rbp + 0x600], 0x3f800000
14026fc69: lea       rbx, [rbp + 0x260]
14026fc70: mov       r13, qword ptr [rbp + 0x690]
14026fc77: mov       rdi, qword ptr [rbp + 0x688]
14026fc7e: lea       rcx, [rip + 0x5b7def5]
14026fc85: mov       edx, 0xe
14026fc8a: call      0x1458ec450
14026fc8f: mov       r8, rdx
14026fc92: lea       rcx, [rip + 0x5b7deef]
14026fc99: mov       qword ptr [rbp + 0x2a0], rcx
14026fca0: mov       qword ptr [rbp + 0x2a8], 5
14026fcab: mov       qword ptr [rbp + 0x2b0], r15
14026fcb2: lea       rcx, [rip + 0x5b7be97]
14026fcb9: mov       qword ptr [rbp + 0x2b8], rcx
14026fcc0: mov       qword ptr [rsp + 0x20], 1
14026fcc9: mov       rcx, rbp
14026fccc: lea       r9, [rbp + 0x2a0]
14026fcd3: mov       rdx, rax
14026fcd6: call      0x1458ec8b0
14026fcdb: cmp       byte ptr [rdi], 1
14026fcde: mov       qword ptr [rbp + 0x338], r12
14026fce5: jne       0x14026fd05
14026fce7: mov       eax, dword ptr [rdi + 1]
14026fcea: mov       ecx, dword ptr [rdi + 4]
14026fced: mov       dword ptr [rbp + 0x673], ecx
14026fcf3: mov       dword ptr [rbp + 0x670], eax
14026fcf9: mov       rax, qword ptr [rdi + 8]
14026fcfd: movzx     ecx, byte ptr [rdi + 0x10]
14026fd01: mov       dl, 1
14026fd03: jmp       0x14026fd15
14026fd05: mov       rax, qword ptr [rdi + 8]
14026fd09: lock inc  qword ptr [rax]
14026fd0d: jle       0x14027026e
14026fd13: xor       edx, edx
14026fd15: mov       r8, qword ptr [rbp + 0x10]
14026fd19: mov       qword ptr [rbp + 0x3a8], r8
14026fd20: movups    xmm0, xmmword ptr [rbp]
14026fd24: movups    xmmword ptr [rbp + 0x398], xmm0
14026fd2b: movaps    xmm0, xmmword ptr [rbp + 0x5f0]
14026fd32: movups    xmmword ptr [rbp + 0x611], xmm0
14026fd39: mov       r8d, dword ptr [rbp + 0x600]
14026fd40: mov       dword ptr [rbp + 0x621], r8d
14026fd47: mov       qword ptr [rbp + 0x3b0], 0
14026fd52: mov       qword ptr [rbp + 0x3b8], 4
14026fd5d: mov       qword ptr [rbp + 0x3c0], 0
14026fd68: mov       byte ptr [rbp + 0x3c8], dl
14026fd6e: mov       edx, dword ptr [rbp + 0x670]
14026fd74: mov       r8d, dword ptr [rbp + 0x673]
14026fd7b: mov       dword ptr [rbp + 0x3c9], edx
14026fd81: mov       dword ptr [rbp + 0x3cc], r8d
14026fd88: mov       qword ptr [rbp + 0x3d0], rax
14026fd8f: mov       qword ptr [rbp + 0x3d8], rcx
14026fd96: mov       dword ptr [rbp + 0x3e0], 0x41700000
14026fda0: mov       word ptr [rbp + 0x3e4], 0x190
14026fda9: mov       byte ptr [rbp + 0x3e6], 1
14026fdb0: mov       rax, qword ptr [rbp + 0x61d]
14026fdb7: mov       qword ptr [rbp + 0x3f4], rax
14026fdbe: movups    xmm0, xmmword ptr [rbp + 0x610]
14026fdc5: movups    xmmword ptr [rbp + 0x3e7], xmm0
14026fdcc: mov       dword ptr [rbp + 0x40c], esi
14026fdd2: movups    xmmword ptr [rbp + 0x3fc], xmm6
14026fdd9: movsd     qword ptr [rbp + 0x410], xmm7
14026fde1: mov       rax, qword ptr [rbp + 0x680]
14026fde8: mov       qword ptr [rbp + 0x390], rax
14026fdef: mov       rcx, rbp
14026fdf2: lea       r8, [rbp + 0x390]
14026fdf9: lea       rdx, [rbp + 0x348]
14026fe00: call      0x1401f2bf0
14026fe05: movaps    xmmword ptr [rbp + 0x2a0], xmm14
14026fe0d: mov       qword ptr [rbp + 0x2b0], 0
14026fe18: movups    xmmword ptr [rbp + 0x2b8], xmm8
14026fe20: mov       qword ptr [rbp + 0x2c8], 0
14026fe2b: movaps    xmmword ptr [rbp + 0x2d0], xmm15
14026fe33: mov       qword ptr [rbp + 0x2e0], 0
14026fe3e: movups    xmm0, xmmword ptr [rip + 0x5b7bb03]
14026fe45: movups    xmmword ptr [rbp + 0x2e8], xmm0
14026fe4c: mov       qword ptr [rbp + 0x2f8], 0
14026fe57: movups    xmm0, xmmword ptr [rip + 0x5b7be1a]
14026fe5e: movaps    xmmword ptr [rbp + 0x340], xmm0
14026fe65: mov       dword ptr [rbp + 0x350], 0x3f800000
14026fe6f: movups    xmmword ptr [rbp + 0x354], xmm0
14026fe76: mov       dword ptr [rbp + 0x364], 0x3f800000
14026fe80: movups    xmmword ptr [rbp + 0x368], xmm0
14026fe87: mov       dword ptr [rbp + 0x378], 0x3f800000
14026fe91: movups    xmmword ptr [rbp + 0x37c], xmm0
14026fe98: mov       dword ptr [rbp + 0x38c], 0x3f800000
14026fea2: mov       rax, qword ptr [rbp + 0x2f0]
14026fea9: mov       qword ptr [rbp + 0x50], rax
14026fead: mov       rax, qword ptr [rbp + 0x2f8]
14026feb4: mov       qword ptr [rbp + 0x58], rax
14026feb8: mov       rax, qword ptr [rbp + 0x2e0]
14026febf: mov       qword ptr [rbp + 0x40], rax
14026fec3: mov       rax, qword ptr [rbp + 0x2e8]
14026feca: mov       qword ptr [rbp + 0x48], rax
14026fece: movaps    xmm0, xmmword ptr [rbp + 0x2a0]
14026fed5: movaps    xmm1, xmmword ptr [rbp + 0x2b0]
14026fedc: movaps    xmm2, xmmword ptr [rbp + 0x2c0]
14026fee3: movaps    xmm3, xmmword ptr [rbp + 0x2d0]
14026feea: movaps    xmmword ptr [rbp + 0x30], xmm3
14026feee: movaps    xmmword ptr [rbp + 0x20], xmm2
14026fef2: movaps    xmmword ptr [rbp + 0x10], xmm1
14026fef6: movaps    xmmword ptr [rbp], xmm0
14026fefa: xorps     xmm0, xmm0
14026fefd: movaps    xmmword ptr [rbp + 0x70], xmm0
14026ff01: movaps    xmmword ptr [rbp + 0x60], xmm0
14026ff05: mov       qword ptr [rbp + 0x80], 0
14026ff10: movups    xmmword ptr [rbp + 0x440], xmm0
14026ff17: movups    xmmword ptr [rbp + 0x430], xmm0
14026ff1e: mov       qword ptr [rbp + 0x50a], 0
14026ff29: mov       dword ptr [rbp + 0x512], 0
14026ff33: movaps    xmm0, xmmword ptr [rbp + 0x380]
14026ff3a: movups    xmmword ptr [rbp + 0x652], xmm0
14026ff41: movaps    xmm0, xmmword ptr [rbp + 0x340]
14026ff48: movaps    xmm1, xmmword ptr [rbp + 0x350]
14026ff4f: movaps    xmm2, xmmword ptr [rbp + 0x360]
14026ff56: movaps    xmm3, xmmword ptr [rbp + 0x370]
14026ff5d: movups    xmmword ptr [rbp + 0x642], xmm3
14026ff64: movups    xmmword ptr [rbp + 0x632], xmm2
14026ff6b: movups    xmmword ptr [rbp + 0x622], xmm1
14026ff72: movups    xmmword ptr [rbp + 0x612], xmm0
14026ff79: mov       rsi, qword ptr [rbp + 0x258]
14026ff80: lea       rcx, [rbp + 0x398]
14026ff87: mov       rdx, rbp
14026ff8a: mov       r8d, 0x88
14026ff90: call      0x145bfa0e7
14026ff95: movaps    xmm0, xmmword ptr [rip + 0x5b7b7d4]
14026ff9c: movups    xmmword ptr [rbp + 0x420], xmm0
14026ffa3: movups    xmmword ptr [rbp + 0x450], xmm11
14026ffab: movups    xmm0, xmmword ptr [rip + 0x5b7ba16]
14026ffb2: movups    xmmword ptr [rbp + 0x460], xmm0
14026ffb9: movups    xmmword ptr [rbp + 0x470], xmm12
14026ffc1: movups    xmmword ptr [rbp + 0x480], xmm10
14026ffc9: movups    xmmword ptr [rbp + 0x490], xmm9
14026ffd1: movups    xmmword ptr [rbp + 0x4a0], xmm9
14026ffd9: movups    xmmword ptr [rbp + 0x4b0], xmm13
14026ffe1: movups    xmmword ptr [rbp + 0x4c0], xmm13
14026ffe9: movaps    xmm0, xmmword ptr [rip + 0x5b2d280]
14026fff0: movups    xmmword ptr [rbp + 0x4d0], xmm0
14026fff7: mov       dword ptr [rbp + 0x4e0], 1
140270001: mov       qword ptr [rbp + 0x4e4], 0
14027000c: mov       byte ptr [rbp + 0x4ec], 1
140270013: mov       qword ptr [rbp + 0x4f0], 0
14027001e: mov       dword ptr [rbp + 0x4f8], 0x3f800000
140270028: mov       word ptr [rbp + 0x4fc], 0x101
140270031: mov       word ptr [rbp + 0x502], 0
14027003a: mov       dword ptr [rbp + 0x4fe], 0x10000
140270044: mov       dword ptr [rbp + 0x504], 0x10000
14027004e: mov       word ptr [rbp + 0x508], 0
140270057: movups    xmm0, xmmword ptr [rbp + 0x610]
14027005e: movups    xmm1, xmmword ptr [rbp + 0x620]
140270065: movups    xmm2, xmmword ptr [rbp + 0x630]
14027006c: movups    xmm3, xmmword ptr [rbp + 0x640]
140270073: movups    xmmword ptr [rbp + 0x516], xmm0
14027007a: movups    xmmword ptr [rbp + 0x526], xmm1
140270081: movups    xmmword ptr [rbp + 0x536], xmm2
140270088: movups    xmmword ptr [rbp + 0x546], xmm3
14027008f: movups    xmm0, xmmword ptr [rbp + 0x650]
140270096: movups    xmmword ptr [rbp + 0x556], xmm0
14027009d: movzx     eax, word ptr [rbp + 0x660]
1402700a4: mov       word ptr [rbp + 0x566], ax
1402700ab: movups    xmm0, xmmword ptr [rip + 0x5b7bb16]
1402700b2: movups    xmmword ptr [rbp + 0x568], xmm0
1402700b9: mov       dword ptr [rbp + 0x578], 0x3f800000
1402700c3: mov       qword ptr [rbp + 0x390], rsi
1402700ca: lea       rcx, [rbp + 0x2a0]
1402700d1: lea       r8, [rbp + 0x390]
1402700d8: mov       rdx, rbx
1402700db: call      0x1401defd0
1402700e0: mov       rdi, qword ptr [r14 + 0x20]
1402700e4: mov       rbx, qword ptr [r14 + 0x28]
1402700e8: mov       rax, qword ptr [r14 + 0x30]
1402700ec: mov       qword ptr [rbp + 0x668], rax
1402700f3: mov       rax, qword ptr [r14 + 0x38]
1402700f7: mov       qword ptr [rbp + 0x680], rax
1402700fe: mov       r14, qword ptr [r14 + 0x40]
140270102: mov       rax, qword ptr [rbp + 0x2a0]
140270109: mov       rcx, qword ptr [rbp + 0x2c8]
140270110: mov       qword ptr [rbp + 0x390], rax
140270117: movups    xmm0, xmmword ptr [rbp + 0x2a8]
14027011e: movups    xmmword ptr [rbp + 0x398], xmm0
140270125: movups    xmm0, xmmword ptr [rbp + 0x2b8]
14027012c: movups    xmmword ptr [rbp + 0x3a8], xmm0
140270133: mov       qword ptr [rbp + 0x3b8], rcx
14027013a: mov       r8, qword ptr [r13 + 0x10]
14027013e: mov       r9, qword ptr [r13 + 0x18]
140270142: lea       rsi, [rbp + 0x390]
140270149: mov       rcx, rsi
14027014c: mov       r12, r13
14027014f: mov       r13, qword ptr [rbp + 0x330]
140270156: mov       rdx, r13
140270159: call      0x140106ed0
14027015e: movzx     edi, byte ptr [rdi]
140270161: mov       rcx, rsi
140270164: mov       edx, edi
140270166: mov       r8, r12
140270169: mov       r9, rbx
14027016c: call      0x14010b540
140270171: mov       rax, qword ptr [r12 + 0x38]
140270176: test      rax, rax
140270179: mov       r15, qword ptr [rbp + 0x688]
140270180: je        0x1402701e7
140270182: mov       rcx, qword ptr [rbp + 0x690]
140270189: mov       r12, qword ptr [rcx + 0x30]
14027018d: imul      rsi, rax, 0x78
140270191: nop       word ptr cs:[rax + rax]
1402701a0: mov       rax, qword ptr [rbp + 0x680]
1402701a7: mov       eax, dword ptr [rax]
1402701a9: movzx     ecx, byte ptr [r14]
1402701ad: mov       qword ptr [rsp + 0x28], r12
1402701b2: add       r12, 0x78
1402701b6: mov       byte ptr [rsp + 0x40], cl
1402701ba: mov       dword ptr [rsp + 0x38], eax
1402701be: mov       qword ptr [rsp + 0x30], rbx
1402701c3: mov       byte ptr [rsp + 0x20], dil
1402701c8: lea       rcx, [rbp + 0x390]
1402701cf: mov       rdx, r15
1402701d2: mov       r8, r13
1402701d5: mov       r9, qword ptr [rbp + 0x668]
1402701dc: call      0x140107ad0
1402701e1: add       rsi, -0x78
1402701e5: jne       0x1402701a0
1402701e7: mov       qword ptr [rsp + 0x20], rbx
1402701ec: lea       rcx, [rbp + 0x258]
1402701f3: mov       rdx, r15
1402701f6: mov       r8, r13
1402701f9: mov       r9, qword ptr [rbp + 0x690]
140270200: call      0x140107820
140270205: mov       rax, qword ptr [rbp + 0x338]
14027020c: movaps    xmm6, xmmword ptr [rbp + 0x6a0]
140270213: movaps    xmm7, xmmword ptr [rbp + 0x6b0]
14027021a: movaps    xmm8, xmmword ptr [rbp + 0x6c0]
140270222: movaps    xmm9, xmmword ptr [rbp + 0x6d0]
14027022a: movaps    xmm10, xmmword ptr [rbp + 0x6e0]
140270232: movaps    xmm11, xmmword ptr [rbp + 0x6f0]
14027023a: movaps    xmm12, xmmword ptr [rbp + 0x700]
140270242: movaps    xmm13, xmmword ptr [rbp + 0x710]
14027024a: movaps    xmm14, xmmword ptr [rbp + 0x720]
140270252: movaps    xmm15, xmmword ptr [rbp + 0x730]
14027025a: add       rsp, 0x7c8
140270261: pop       rbx
140270262: pop       rdi
140270263: pop       rsi
140270264: pop       r12
140270266: pop       r13
140270268: pop       r14
14027026a: pop       r15
14027026c: pop       rbp
14027026d: ret
14027026e: ud2
