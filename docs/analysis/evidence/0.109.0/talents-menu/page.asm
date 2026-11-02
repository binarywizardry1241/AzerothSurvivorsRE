14010a2f0: push      rbp
14010a2f1: push      r15
14010a2f3: push      r14
14010a2f5: push      r13
14010a2f7: push      r12
14010a2f9: push      rsi
14010a2fa: push      rdi
14010a2fb: push      rbx
14010a2fc: sub       rsp, 0x458
14010a303: lea       rbp, [rsp + 0x80]
14010a30b: movaps    xmmword ptr [rbp + 0x3c0], xmm8
14010a313: movaps    xmmword ptr [rbp + 0x3b0], xmm7
14010a31a: movaps    xmmword ptr [rbp + 0x3a0], xmm6
14010a321: mov       qword ptr [rbp + 0x398], 0xfffffffffffffffe
14010a32c: mov       qword ptr [rbp + 0x360], r9
14010a333: mov       qword ptr [rbp + 0x358], r8
14010a33a: mov       qword ptr [rbp + 0x368], rdx
14010a341: mov       qword ptr [rbp + 0x378], rcx
14010a348: mov       rax, qword ptr [rbp + 0x440]
14010a34f: movzx     r15d, byte ptr [rax + 0x38]
14010a354: mov       ecx, r15d
14010a357: call      0x145912d70
14010a35c: mov       qword ptr [rbp + 0x338], rax
14010a363: test      rax, rax
14010a366: je        0x14010a938
14010a36c: mov       rsi, qword ptr [rbp + 0x448]
14010a373: lea       rcx, [rbp + 0x340]
14010a37a: mov       rdx, rsi
14010a37d: mov       r8d, r15d
14010a380: call      0x14589e020
14010a385: nop
14010a386: mov       rcx, rsi
14010a389: mov       edx, r15d
14010a38c: call      0x14589d0d0
14010a391: mov       dword ptr [rbp + 0x388], eax
14010a397: lea       rcx, [rbp - 0x58]
14010a39b: mov       rdx, qword ptr [rbp + 0x448]
14010a3a2: mov       r8d, r15d
14010a3a5: call      0x14589e020
14010a3aa: nop
14010a3ab: lea       rcx, [rbp - 0x58]
14010a3af: call      0x14590fcc0
14010a3b4: nop
14010a3b5: mov       dword ptr [rbp + 0x384], eax
14010a3bb: mov       rdx, qword ptr [rbp - 0x58]
14010a3bf: test      rdx, rdx
14010a3c2: je        0x14010a3d7
14010a3c4: mov       rcx, qword ptr [rbp - 0x50]
14010a3c8: shl       rdx, 4
14010a3cc: mov       r8d, 8
14010a3d2: call      0x1400021d0
14010a3d7: lea       r13, [rbp + 0x210]
14010a3de: mov       rax, qword ptr [rbp + 0x378]
14010a3e5: lea       rcx, [rax + 8]
14010a3e9: mov       qword ptr [rbp + 0x370], rcx
14010a3f0: mov       r12, qword ptr [rax]
14010a3f3: xor       edi, edi
14010a3f5: xorps     xmm6, xmm6
14010a3f8: movaps    xmm7, xmmword ptr [rip + 0x5c92f61]
14010a3ff: movaps    xmm8, xmmword ptr [rip + 0x5c93019]
14010a407: lea       r14, [rbp + 0x1b0]
14010a40e: lea       rbx, [rbp - 0x58]
14010a412: xor       esi, esi
14010a414: cmp       rsi, 0xc0
14010a41b: je        0x14010a67c
14010a421: nop       word ptr cs:[rax + rax]
14010a430: mov       byte ptr [rbp + 0x397], r15b
14010a437: mov       eax, dword ptr [rbp + 0x388]
14010a43d: mov       dword ptr [rbp + 0x390], eax
14010a443: movzx     eax, byte ptr [rbp + 0x450]
14010a44a: mov       byte ptr [rbp + 0x396], al
14010a450: lea       rcx, [rbp + 0x340]
14010a457: mov       edx, r15d
14010a45a: mov       r8, rdi
14010a45d: mov       r9b, 7
14010a460: call      0x145910430
14010a465: nop
14010a466: mov       dword ptr [rbp + 0x38c], eax
14010a46c: mov       word ptr [rbp + 0x314], 0
14010a475: mov       byte ptr [rbp + 0x304], 1
14010a47c: movups    xmmword ptr [r13 + 0x40], xmm6
14010a481: movups    xmmword ptr [r13 + 0x30], xmm6
14010a486: movups    xmmword ptr [r13 + 0x20], xmm6
14010a48b: movups    xmmword ptr [r13 + 0x10], xmm6
14010a490: movups    xmmword ptr [r13], xmm6
14010a495: mov       qword ptr [r13 + 0x50], 0
14010a49d: mov       dword ptr [rbp + 0x32a], 5
14010a4a7: movups    xmm0, xmmword ptr [rip + 0x5ccb94a]
14010a4ae: movups    xmmword ptr [r13 + 0x68], xmm0
14010a4b3: movups    xmm0, xmmword ptr [rip + 0x5ccb92e]
14010a4ba: movups    xmmword ptr [r13 + 0x58], xmm0
14010a4bf: movups    xmmword ptr [rbp + 0x288], xmm7
14010a4c6: movups    xmmword ptr [rbp + 0x298], xmm7
14010a4cd: movups    xmm0, xmmword ptr [rip + 0x5ccb964]
14010a4d4: movups    xmmword ptr [r13 + 0xa8], xmm0
14010a4dc: movups    xmm0, xmmword ptr [rip + 0x5ccb945]
14010a4e3: movups    xmmword ptr [r13 + 0x98], xmm0
14010a4eb: movups    xmm0, xmmword ptr [rip + 0x5ccb956]
14010a4f2: movups    xmmword ptr [r13 + 0xb8], xmm0
14010a4fa: movups    xmm0, xmmword ptr [rip + 0x5ccb957]
14010a501: movups    xmmword ptr [r13 + 0xc8], xmm0
14010a509: mov       qword ptr [rbp + 0x308], 0
14010a514: mov       dword ptr [rbp + 0x310], 0
14010a51e: movups    xmmword ptr [rbp + 0x2e8], xmm8
14010a526: mov       dword ptr [rbp + 0x2f8], 1
14010a530: mov       qword ptr [rbp + 0x2fc], 0
14010a53b: movabs    rax, 0x100000000
14010a545: mov       qword ptr [rbp + 0x322], rax
14010a54c: movups    xmm0, xmmword ptr [rip + 0x5ccb7dd]
14010a553: movaps    xmmword ptr [rbp + 0x1b0], xmm0
14010a55a: mov       qword ptr [rbp + 0x1c0], 0
14010a565: movups    xmm0, xmmword ptr [rip + 0x5ccb7dc]
14010a56c: movups    xmmword ptr [r13 - 0x48], xmm0
14010a571: mov       qword ptr [r13 - 0x38], 0
14010a579: movups    xmm0, xmmword ptr [rip + 0x5ccb7e0]
14010a580: movups    xmmword ptr [r13 - 0x30], xmm0
14010a585: mov       qword ptr [r13 - 0x20], 0
14010a58d: movups    xmm0, xmmword ptr [rip + 0x5ccb7e4]
14010a594: movups    xmmword ptr [r13 - 0x18], xmm0
14010a599: mov       qword ptr [r13 - 8], 0
14010a5a1: mov       dword ptr [r13 + 0x106], 0x10000
14010a5ac: mov       word ptr [r13 + 0x10a], 0
14010a5b6: mov       word ptr [r13 + 0x110], 0
14010a5c0: mov       dword ptr [r13 + 0x10c], 0x10000
14010a5cb: lea       rcx, [rbp - 0x50]
14010a5cf: mov       rdx, r14
14010a5d2: call      0x140101170
14010a5d7: nop
14010a5d8: mov       qword ptr [rbp - 0x58], r12
14010a5dc: mov       rcx, r14
14010a5df: mov       rdx, qword ptr [rbp + 0x370]
14010a5e6: mov       r8, rbx
14010a5e9: lea       r9, [rip + 0x5ccae40]
14010a5f0: call      0x1401e0050
14010a5f5: nop
14010a5f6: mov       rax, qword ptr [rbp + 0x338]
14010a5fd: add       rax, rsi
14010a600: mov       rcx, qword ptr [rbp + 0x358]
14010a607: mov       qword ptr [rbp - 0x58], rcx
14010a60b: mov       qword ptr [rbp - 0x50], rax
14010a60f: mov       rax, qword ptr [rbp + 0x368]
14010a616: mov       qword ptr [rbp - 0x48], rax
14010a61a: lea       rax, [rbp + 0x38c]
14010a621: mov       qword ptr [rbp - 0x40], rax
14010a625: lea       rax, [rbp + 0x397]
14010a62c: mov       qword ptr [rbp - 0x38], rax
14010a630: lea       rax, [rbp + 0x340]
14010a637: mov       qword ptr [rbp - 0x30], rax
14010a63b: mov       rax, qword ptr [rbp + 0x360]
14010a642: mov       qword ptr [rbp - 0x28], rax
14010a646: lea       rax, [rbp + 0x390]
14010a64d: mov       qword ptr [rbp - 0x20], rax
14010a651: lea       rax, [rbp + 0x396]
14010a658: mov       qword ptr [rbp - 0x18], rax
14010a65c: mov       rcx, r14
14010a65f: mov       rdx, rbx
14010a662: call      0x14026f360
14010a667: nop
14010a668: add       rsi, 0x40
14010a66c: inc       rdi
14010a66f: cmp       rsi, 0xc0
14010a676: jne       0x14010a430
14010a67c: mov       byte ptr [rbp + 0x397], r15b
14010a683: mov       eax, dword ptr [rbp + 0x388]
14010a689: mov       dword ptr [rbp + 0x390], eax
14010a68f: mov       eax, dword ptr [rbp + 0x384]
14010a695: mov       dword ptr [rbp + 0x38c], eax
14010a69b: movzx     eax, byte ptr [rbp + 0x450]
14010a6a2: mov       byte ptr [rbp + 0x396], al
14010a6a8: mov       word ptr [rbp + 0x314], 0
14010a6b1: mov       byte ptr [rbp + 0x304], 1
14010a6b8: xorps     xmm0, xmm0
14010a6bb: movups    xmmword ptr [rbp + 0x218], xmm0
14010a6c2: movups    xmmword ptr [rbp + 0x228], xmm0
14010a6c9: movabs    rax, 0x439b000000000001
14010a6d3: mov       qword ptr [rbp + 0x238], rax
14010a6da: movaps    xmmword ptr [rbp + 0x240], xmm0
14010a6e1: mov       dword ptr [rbp + 0x250], 1
14010a6eb: mov       qword ptr [rbp + 0x210], 0
14010a6f6: movups    xmmword ptr [rbp + 0x254], xmm0
14010a6fd: mov       dword ptr [rbp + 0x264], 0
14010a707: mov       dword ptr [rbp + 0x328], 0
14010a711: mov       word ptr [rbp + 0x32c], 0
14010a71a: movups    xmm0, xmmword ptr [rip + 0x5ccb6c7]
14010a721: movups    xmmword ptr [rbp + 0x268], xmm0
14010a728: movups    xmm0, xmmword ptr [rip + 0x5ccb6c9]
14010a72f: movups    xmmword ptr [rbp + 0x278], xmm0
14010a736: movaps    xmm0, xmmword ptr [rip + 0x5c92cc3]
14010a73d: movups    xmmword ptr [rbp + 0x288], xmm0
14010a744: movaps    xmm0, xmmword ptr [rip + 0x5c92cc5]
14010a74b: movups    xmmword ptr [rbp + 0x298], xmm0
14010a752: movups    xmm0, xmmword ptr [rip + 0x5ccb6df]
14010a759: movups    xmmword ptr [rbp + 0x2b8], xmm0
14010a760: movups    xmm0, xmmword ptr [rip + 0x5ccb6c1]
14010a767: movups    xmmword ptr [rbp + 0x2a8], xmm0
14010a76e: movups    xmm0, xmmword ptr [rip + 0x5ccb6e3]
14010a775: movups    xmmword ptr [rbp + 0x2d8], xmm0
14010a77c: movups    xmm0, xmmword ptr [rip + 0x5ccb6c5]
14010a783: movups    xmmword ptr [rbp + 0x2c8], xmm0
14010a78a: mov       byte ptr [rbp + 0x326], 1
14010a791: mov       dword ptr [rbp + 0x322], 0
14010a79b: mov       qword ptr [rbp + 0x308], 0
14010a7a6: mov       dword ptr [rbp + 0x310], 0
14010a7b0: movaps    xmm0, xmmword ptr [rip + 0x5cca579]
14010a7b7: movups    xmmword ptr [rbp + 0x2e8], xmm0
14010a7be: mov       dword ptr [rbp + 0x2f8], 1
14010a7c8: mov       qword ptr [rbp + 0x2fc], 0
14010a7d3: mov       byte ptr [rbp + 0x327], 0
14010a7da: movups    xmm0, xmmword ptr [rip + 0x5ccb54f]
14010a7e1: movaps    xmmword ptr [rbp + 0x1b0], xmm0
14010a7e8: mov       qword ptr [rbp + 0x1c0], 0
14010a7f3: movups    xmm0, xmmword ptr [rip + 0x5ccb54e]
14010a7fa: movups    xmmword ptr [rbp + 0x1c8], xmm0
14010a801: mov       qword ptr [rbp + 0x1d8], 0
14010a80c: movups    xmm0, xmmword ptr [rip + 0x5ccb54d]
14010a813: movaps    xmmword ptr [rbp + 0x1e0], xmm0
14010a81a: mov       qword ptr [rbp + 0x1f0], 0
14010a825: movups    xmm0, xmmword ptr [rip + 0x5ccb54c]
14010a82c: movups    xmmword ptr [rbp + 0x1f8], xmm0
14010a833: mov       qword ptr [rbp + 0x208], 0
14010a83e: mov       word ptr [rbp + 0x31a], 0
14010a847: mov       dword ptr [rbp + 0x316], 0x10000
14010a851: mov       word ptr [rbp + 0x320], 0
14010a85a: mov       dword ptr [rbp + 0x31c], 0x10000
14010a864: lea       rcx, [rbp - 0x50]
14010a868: lea       rdx, [rbp + 0x1b0]
14010a86f: call      0x140101170
14010a874: nop
14010a875: mov       rax, qword ptr [rbp + 0x378]
14010a87c: mov       rax, qword ptr [rax]
14010a87f: mov       qword ptr [rbp - 0x58], rax
14010a883: lea       r9, [rip + 0x5ccaba6]
14010a88a: lea       rcx, [rbp + 0x1b0]
14010a891: lea       r8, [rbp - 0x58]
14010a895: mov       rdx, qword ptr [rbp + 0x370]
14010a89c: call      0x1401e0050
14010a8a1: nop
14010a8a2: lea       rax, [rbp + 0x396]
14010a8a9: mov       qword ptr [rbp - 0x58], rax
14010a8ad: mov       rax, qword ptr [rbp + 0x368]
14010a8b4: mov       qword ptr [rbp - 0x50], rax
14010a8b8: mov       rax, qword ptr [rbp + 0x448]
14010a8bf: mov       qword ptr [rbp - 0x48], rax
14010a8c3: lea       rax, [rbp + 0x397]
14010a8ca: mov       qword ptr [rbp - 0x40], rax
14010a8ce: lea       rax, [rbp + 0x390]
14010a8d5: mov       qword ptr [rbp - 0x38], rax
14010a8d9: lea       rax, [rbp + 0x38c]
14010a8e0: mov       qword ptr [rbp - 0x30], rax
14010a8e4: lea       rax, [rbp + 0x340]
14010a8eb: mov       qword ptr [rbp - 0x28], rax
14010a8ef: mov       rax, qword ptr [rbp + 0x360]
14010a8f6: mov       qword ptr [rbp - 0x20], rax
14010a8fa: mov       rax, qword ptr [rbp + 0x358]
14010a901: mov       qword ptr [rbp - 0x18], rax
14010a905: lea       rcx, [rbp + 0x1b0]
14010a90c: lea       rdx, [rbp - 0x58]
14010a910: call      0x14026ba20
14010a915: nop
14010a916: mov       rdx, qword ptr [rbp + 0x340]
14010a91d: test      rdx, rdx
14010a920: je        0x14010a938
14010a922: mov       rcx, qword ptr [rbp + 0x348]
14010a929: shl       rdx, 4
14010a92d: mov       r8d, 8
14010a933: call      0x1400021d0
14010a938: movaps    xmm6, xmmword ptr [rbp + 0x3a0]
14010a93f: movaps    xmm7, xmmword ptr [rbp + 0x3b0]
14010a946: movaps    xmm8, xmmword ptr [rbp + 0x3c0]
14010a94e: add       rsp, 0x458
14010a955: pop       rbx
14010a956: pop       rdi
14010a957: pop       rsi
14010a958: pop       r12
14010a95a: pop       r13
14010a95c: pop       r14
14010a95e: pop       r15
14010a960: pop       rbp
14010a961: ret
