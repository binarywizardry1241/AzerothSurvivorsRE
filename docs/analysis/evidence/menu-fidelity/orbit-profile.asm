1459a77c0: mov       rax, rcx
1459a77c3: movsd     xmm0, qword ptr [rdx + 0xc8]
1459a77cb: movss     xmm1, dword ptr [rdx + 0xd0]
1459a77d3: mov       rcx, qword ptr [rdx + 0x10]
1459a77d7: add       rcx, -2
1459a77db: cmp       rcx, 6
1459a77df: ja        0x1459a7923
1459a77e5: lea       r8, [rip + 0x188ea5c]
1459a77ec: movsxd    rcx, dword ptr [r8 + rcx*4]
1459a77f0: add       rcx, r8
1459a77f3: jmp       rcx
1459a77f5: mov       rcx, qword ptr [rdx + 8]
1459a77f9: cmp       word ptr [rcx], 0x6d73
1459a77fe: jne       0x1459a7923
1459a7804: movsd     xmm0, qword ptr [rip + 0x1885d74]
1459a780c: movaps    xmm3, xmmword ptr [rip + 0x1885d7d]
1459a7813: movaps    xmm2, xmmword ptr [rip + 0x1885d86]
1459a781a: xorps     xmm4, xmm4
1459a781d: movss     xmm1, dword ptr [rip + 0xb8cbcf]
1459a7825: jmp       0x1459a794e
1459a782a: mov       rcx, qword ptr [rdx + 8]
1459a782e: mov       r8d, 0x6e657261
1459a7834: xor       r8d, dword ptr [rcx]
1459a7837: movzx     ecx, byte ptr [rcx + 4]
1459a783b: xor       ecx, 0x61
1459a783e: or        ecx, r8d
1459a7841: jne       0x1459a7923
1459a7847: movaps    xmm3, xmmword ptr [rip + 0x1885cf2]
1459a784e: movaps    xmm2, xmmword ptr [rip + 0x1885cfb]
1459a7855: xorps     xmm4, xmm4
1459a7858: jmp       0x1459a794e
1459a785d: mov       rcx, qword ptr [rdx + 8]
1459a7861: movabs    r8, 0x646f6f776b737564
1459a786b: cmp       qword ptr [rcx], r8
1459a786e: jne       0x1459a7923
1459a7874: movsd     xmm0, qword ptr [rip + 0x1885c54]
1459a787c: movsd     xmm3, qword ptr [rip + 0x1885c5c]
1459a7884: movaps    xmm2, xmmword ptr [rip + 0x1885c65]
1459a788b: movss     xmm4, dword ptr [rip + 0x43d481]
1459a7893: movss     xmm1, dword ptr [rip + 0x3f5d05]
1459a789b: jmp       0x1459a794e
1459a78a0: mov       rcx, qword ptr [rdx + 8]
1459a78a4: cmp       dword ptr [rcx], 0x7878616e
1459a78aa: jne       0x1459a7923
1459a78ac: movaps    xmm3, xmmword ptr [rip + 0x1885cad]
1459a78b3: movaps    xmm2, xmmword ptr [rip + 0x1885cb6]
1459a78ba: xorps     xmm4, xmm4
1459a78bd: jmp       0x1459a794e
1459a78c2: mov       rcx, qword ptr [rdx + 8]
1459a78c6: mov       r8d, 0x79776c65
1459a78cc: xor       r8d, dword ptr [rcx]
1459a78cf: movzx     ecx, word ptr [rcx + 4]
1459a78d3: xor       ecx, 0x6e6e
1459a78d9: or        ecx, r8d
1459a78dc: jne       0x1459a7923
1459a78de: movsd     xmm0, qword ptr [rip + 0x1885c1a]
1459a78e6: movsd     xmm3, qword ptr [rip + 0x1885c22]
1459a78ee: movaps    xmm2, xmmword ptr [rip + 0x1885c2b]
1459a78f5: movss     xmm4, dword ptr [rip + 0x1885c33]
1459a78fd: movss     xmm1, dword ptr [rip + 0x1885c2f]
1459a7905: jmp       0x1459a794e
1459a7907: mov       rcx, qword ptr [rdx + 8]
1459a790b: mov       r8d, 0x61726566
1459a7911: xor       r8d, dword ptr [rcx]
1459a7914: mov       r9d, 0x73616c61
1459a791a: xor       r9d, dword ptr [rcx + 3]
1459a791e: or        r9d, r8d
1459a7921: je        0x1459a7964
1459a7923: movss     xmm3, dword ptr [rdx + 0xd8]
1459a792b: mulss     xmm3, dword ptr [rip + 0x4257c9]
1459a7933: movaps    xmm2, xmmword ptr [rip + 0x1885c76]
1459a793a: movss     xmm2, xmm3
1459a793e: movsd     xmm3, qword ptr [rip + 0x1885b6a]
1459a7946: movss     xmm4, dword ptr [rip + 0x43d3c6]
1459a794e: movlps    qword ptr [rax], xmm0
1459a7951: movss     dword ptr [rax + 8], xmm1
1459a7956: movups    xmmword ptr [rax + 0xc], xmm2
1459a795a: movups    xmmword ptr [rax + 0x1c], xmm3
1459a795e: movss     dword ptr [rax + 0x2c], xmm4
1459a7963: ret
1459a7964: movss     xmm3, dword ptr [rdx + 0xd8]
1459a796c: mulss     xmm3, dword ptr [rip + 0x425788]
1459a7974: movaps    xmm2, xmmword ptr [rip + 0x1885b25]
1459a797b: movss     xmm2, xmm3
1459a797f: movsd     xmm3, qword ptr [rip + 0x1885b29]
1459a7987: movss     xmm4, dword ptr [rip + 0x1885b31]
1459a798f: jmp       0x1459a794e
