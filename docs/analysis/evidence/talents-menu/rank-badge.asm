14026b440: push      rsi
14026b441: push      rdi
14026b442: push      rbx
14026b443: sub       rsp, 0x3c0
14026b44a: mov       rdi, rdx
14026b44d: mov       rsi, rcx
14026b450: mov       rax, qword ptr [rcx]
14026b453: mov       rcx, qword ptr [rcx + 0x28]
14026b457: mov       qword ptr [rsp + 0x390], rax
14026b45f: lea       rdx, [rsp + 0x398]
14026b467: movups    xmm0, xmmword ptr [rsi + 8]
14026b46b: movups    xmmword ptr [rsp + 0x398], xmm0
14026b473: movups    xmm0, xmmword ptr [rsi + 0x18]
14026b477: movups    xmmword ptr [rsp + 0x3a8], xmm0
14026b47f: mov       qword ptr [rsp + 0x3b8], rcx
14026b487: movups    xmm0, xmmword ptr [rip + 0x5b80472]
14026b48e: movaps    xmmword ptr [rsp + 0xd0], xmm0
14026b496: mov       qword ptr [rsp + 0xe0], 0
14026b4a2: movups    xmm0, xmmword ptr [rip + 0x5b8046f]
14026b4a9: movups    xmmword ptr [rsp + 0xe8], xmm0
14026b4b1: mov       qword ptr [rsp + 0xf8], 0
14026b4bd: movups    xmm0, xmmword ptr [rip + 0x5b8046c]
14026b4c4: movaps    xmmword ptr [rsp + 0x100], xmm0
14026b4cc: mov       qword ptr [rsp + 0x110], 0
14026b4d8: movups    xmm0, xmmword ptr [rip + 0x5b80469]
14026b4df: movups    xmmword ptr [rsp + 0x118], xmm0
14026b4e7: mov       qword ptr [rsp + 0x128], 0
14026b4f3: movups    xmm0, xmmword ptr [rip + 0x5b8077e]
14026b4fa: movaps    xmmword ptr [rsp + 0x80], xmm0
14026b502: mov       dword ptr [rsp + 0x90], 0x3f800000
14026b50d: movups    xmmword ptr [rsp + 0x94], xmm0
14026b515: mov       dword ptr [rsp + 0xa4], 0x3f800000
14026b520: movups    xmmword ptr [rsp + 0xa8], xmm0
14026b528: mov       dword ptr [rsp + 0xb8], 0x3f800000
14026b533: movups    xmmword ptr [rsp + 0xbc], xmm0
14026b53b: mov       dword ptr [rsp + 0xcc], 0x3f800000
14026b546: mov       rcx, qword ptr [rsp + 0x120]
14026b54e: mov       qword ptr [rsp + 0x180], rcx
14026b556: mov       rcx, qword ptr [rsp + 0x128]
14026b55e: mov       qword ptr [rsp + 0x188], rcx
14026b566: mov       rcx, qword ptr [rsp + 0x110]
14026b56e: mov       qword ptr [rsp + 0x170], rcx
14026b576: mov       rcx, qword ptr [rsp + 0x118]
14026b57e: mov       qword ptr [rsp + 0x178], rcx
14026b586: movaps    xmm0, xmmword ptr [rsp + 0xd0]
14026b58e: movaps    xmm1, xmmword ptr [rsp + 0xe0]
14026b596: movaps    xmm2, xmmword ptr [rsp + 0xf0]
14026b59e: movaps    xmm3, xmmword ptr [rsp + 0x100]
14026b5a6: movaps    xmmword ptr [rsp + 0x160], xmm3
14026b5ae: movaps    xmmword ptr [rsp + 0x150], xmm2
14026b5b6: movaps    xmmword ptr [rsp + 0x140], xmm1
14026b5be: movaps    xmmword ptr [rsp + 0x130], xmm0
14026b5c6: xorps     xmm0, xmm0
14026b5c9: movaps    xmmword ptr [rsp + 0x190], xmm0
14026b5d1: movups    xmmword ptr [rsp + 0x250], xmm0
14026b5d9: movups    xmmword ptr [rsp + 0x240], xmm0
14026b5e1: movups    xmmword ptr [rsp + 0x230], xmm0
14026b5e9: mov       qword ptr [rsp + 0x31c], 0
14026b5f5: mov       word ptr [rsp + 0x324], 0
14026b5ff: movaps    xmm1, xmmword ptr [rsp + 0xc0]
14026b607: movups    xmmword ptr [rsp + 0x62], xmm1
14026b60c: movaps    xmm1, xmmword ptr [rsp + 0x80]
14026b614: movaps    xmm2, xmmword ptr [rsp + 0x90]
14026b61c: movaps    xmm3, xmmword ptr [rsp + 0xa0]
14026b624: movaps    xmm4, xmmword ptr [rsp + 0xb0]
14026b62c: movups    xmmword ptr [rsp + 0x52], xmm4
14026b631: movups    xmmword ptr [rsp + 0x42], xmm3
14026b636: movups    xmmword ptr [rsp + 0x32], xmm2
14026b63b: movups    xmmword ptr [rsp + 0x22], xmm1
14026b640: movups    xmmword ptr [rsp + 0x378], xmm0
14026b648: movaps    xmm0, xmmword ptr [rsp + 0x190]
14026b650: movups    xmmword ptr [rsp + 0x208], xmm0
14026b658: movaps    xmm0, xmmword ptr [rsp + 0x180]
14026b660: movups    xmmword ptr [rsp + 0x1f8], xmm0
14026b668: movaps    xmm0, xmmword ptr [rsp + 0x170]
14026b670: movups    xmmword ptr [rsp + 0x1e8], xmm0
14026b678: movaps    xmm0, xmmword ptr [rsp + 0x130]
14026b680: movaps    xmm1, xmmword ptr [rsp + 0x140]
14026b688: movaps    xmm2, xmmword ptr [rsp + 0x150]
14026b690: movaps    xmm3, xmmword ptr [rsp + 0x160]
14026b698: movups    xmmword ptr [rsp + 0x1d8], xmm3
14026b6a0: movups    xmmword ptr [rsp + 0x1c8], xmm2
14026b6a8: movups    xmmword ptr [rsp + 0x1b8], xmm1
14026b6b0: movups    xmmword ptr [rsp + 0x1a8], xmm0
14026b6b8: movsd     xmm0, qword ptr [rip + 0x5b800a0]
14026b6c0: movups    xmmword ptr [rsp + 0x218], xmm0
14026b6c8: movabs    rcx, 0xc100000000000001
14026b6d2: mov       qword ptr [rsp + 0x228], rcx
14026b6da: movups    xmm0, xmmword ptr [rip + 0x5b802e7]
14026b6e1: movups    xmmword ptr [rsp + 0x270], xmm0
14026b6e9: movups    xmm0, xmmword ptr [rip + 0x5b802c8]
14026b6f0: movups    xmmword ptr [rsp + 0x260], xmm0
14026b6f8: movaps    xmm0, xmmword ptr [rip + 0x5b31ed1]
14026b6ff: movups    xmmword ptr [rsp + 0x280], xmm0
14026b707: movaps    xmm1, xmmword ptr [rip + 0x5b31d52]
14026b70e: movups    xmmword ptr [rsp + 0x290], xmm1
14026b716: movaps    xmm1, xmmword ptr [rip + 0x5b31b93]
14026b71d: movups    xmmword ptr [rsp + 0x2a0], xmm1
14026b725: movups    xmmword ptr [rsp + 0x2b0], xmm1
14026b72d: movups    xmmword ptr [rsp + 0x2c0], xmm0
14026b735: movups    xmmword ptr [rsp + 0x2d0], xmm0
14026b73d: movaps    xmm0, xmmword ptr [rip + 0x5b31b2c]
14026b744: movups    xmmword ptr [rsp + 0x2e0], xmm0
14026b74c: mov       dword ptr [rsp + 0x2f0], 1
14026b757: mov       qword ptr [rsp + 0x2f4], 0
14026b763: mov       byte ptr [rsp + 0x2fc], 1
14026b76b: mov       qword ptr [rsp + 0x300], 0
14026b777: mov       dword ptr [rsp + 0x308], 0x3f800000
14026b782: mov       word ptr [rsp + 0x30c], 0
14026b78c: mov       word ptr [rsp + 0x312], 0
14026b796: mov       dword ptr [rsp + 0x30e], 0x10000
14026b7a1: mov       word ptr [rsp + 0x318], 0
14026b7ab: mov       dword ptr [rsp + 0x314], 0x10000
14026b7b6: mov       word ptr [rsp + 0x31a], 0x100
14026b7c0: movzx     ecx, word ptr [rsp + 0x70]
14026b7c5: mov       word ptr [rsp + 0x376], cx
14026b7cd: movups    xmm0, xmmword ptr [rsp + 0x60]
14026b7d2: movups    xmmword ptr [rsp + 0x366], xmm0
14026b7da: movups    xmm0, xmmword ptr [rsp + 0x20]
14026b7df: movups    xmm1, xmmword ptr [rsp + 0x30]
14026b7e4: movups    xmm2, xmmword ptr [rsp + 0x40]
14026b7e9: movups    xmm3, xmmword ptr [rsp + 0x50]
14026b7ee: movups    xmmword ptr [rsp + 0x356], xmm3
14026b7f6: movups    xmmword ptr [rsp + 0x346], xmm2
14026b7fe: movups    xmmword ptr [rsp + 0x336], xmm1
14026b806: movups    xmmword ptr [rsp + 0x326], xmm0
14026b80e: mov       dword ptr [rsp + 0x388], 0x3f666666
14026b819: mov       qword ptr [rsp + 0x1a0], rax
14026b821: lea       rcx, [rsp + 0xd0]
14026b829: lea       r8, [rsp + 0x1a0]
14026b831: call      0x1401defd0
14026b836: mov       rbx, qword ptr [rdi]
14026b839: mov       rax, qword ptr [rdi + 8]
14026b83d: cmp       byte ptr [rax], 0
14026b840: je        0x14026b85c
14026b842: movups    xmm0, xmmword ptr [rip + 0x5b8002f]
14026b849: movaps    xmmword ptr [rsp + 0x20], xmm0
14026b84e: mov       dword ptr [rsp + 0x30], 0x3f800000
14026b856: mov       rax, qword ptr [rdi + 0x10]
14026b85a: jmp       0x14026b886
14026b85c: mov       rax, qword ptr [rdi + 0x10]
14026b860: cmp       byte ptr [rax], 0
14026b863: jne       0x14026b872
14026b865: mov       rcx, qword ptr [rdi + 0x18]
14026b869: cmp       byte ptr [rcx], 0
14026b86c: je        0x14026ba04
14026b872: movups    xmm0, xmmword ptr [rip + 0x5b80247]
14026b879: movaps    xmmword ptr [rsp + 0x20], xmm0
14026b87e: mov       dword ptr [rsp + 0x30], 0x3f800000
14026b886: mov       rcx, qword ptr [rdi + 0x20]
14026b88a: add       rcx, 0x72
14026b88e: mov       qword ptr [rsp + 0x1a0], rax
14026b896: lea       rax, [rip + 0x596f973]
14026b89d: mov       qword ptr [rsp + 0x1a8], rax
14026b8a5: mov       qword ptr [rsp + 0x1b0], rcx
14026b8ad: mov       qword ptr [rsp + 0x1b8], rax
14026b8b5: lea       rdx, [rip + 0x5b82a3f]
14026b8bc: lea       rcx, [rsp + 0x130]
14026b8c4: lea       r8, [rsp + 0x1a0]
14026b8cc: call      0x145bcce30
14026b8d1: cmp       byte ptr [rbx], 1
14026b8d4: jne       0x14026b8f6
14026b8d6: mov       eax, dword ptr [rbx + 1]
14026b8d9: mov       ecx, dword ptr [rbx + 4]
14026b8dc: mov       dword ptr [rsp + 0x83], ecx
14026b8e3: mov       dword ptr [rsp + 0x80], eax
14026b8ea: mov       rax, qword ptr [rbx + 8]
14026b8ee: movzx     ecx, byte ptr [rbx + 0x10]
14026b8f2: mov       dl, 1
14026b8f4: jmp       0x14026b906
14026b8f6: mov       rax, qword ptr [rbx + 8]
14026b8fa: lock inc  qword ptr [rax]
14026b8fe: jle       0x14026ba10
14026b904: xor       edx, edx
14026b906: mov       r8, qword ptr [rsp + 0x140]
14026b90e: mov       qword ptr [rsp + 0x1b0], r8
14026b916: movups    xmm0, xmmword ptr [rsp + 0x130]
14026b91e: movaps    xmmword ptr [rsp + 0x1a0], xmm0
14026b926: mov       qword ptr [rsp + 0x1b8], 0
14026b932: mov       qword ptr [rsp + 0x1c0], 4
14026b93e: mov       qword ptr [rsp + 0x1c8], 0
14026b94a: mov       byte ptr [rsp + 0x1d0], dl
14026b951: mov       edx, dword ptr [rsp + 0x80]
14026b958: mov       r8d, dword ptr [rsp + 0x83]
14026b960: mov       dword ptr [rsp + 0x1d1], edx
14026b967: mov       dword ptr [rsp + 0x1d4], r8d
14026b96f: mov       qword ptr [rsp + 0x1d8], rax
14026b977: mov       qword ptr [rsp + 0x1e0], rcx
14026b97f: mov       dword ptr [rsp + 0x1e8], 0x41300000
14026b98a: mov       word ptr [rsp + 0x1ec], 0x190
14026b994: mov       byte ptr [rsp + 0x1ee], 1
14026b99c: mov       eax, dword ptr [rsp + 0x30]
14026b9a0: mov       dword ptr [rsp + 0x200], eax
14026b9a7: movaps    xmm0, xmmword ptr [rsp + 0x20]
14026b9ac: movaps    xmmword ptr [rsp + 0x1f0], xmm0
14026b9b4: movups    xmm0, xmmword ptr [rip + 0x5b6a0d5]
14026b9bb: movups    xmmword ptr [rsp + 0x204], xmm0
14026b9c3: mov       eax, dword ptr [rip + 0x5b6a0d7]
14026b9c9: mov       dword ptr [rsp + 0x214], eax
14026b9d0: movsd     xmm0, qword ptr [rip + 0x5b31ac8]
14026b9d8: movsd     qword ptr [rsp + 0x218], xmm0
14026b9e1: lea       rcx, [rsp + 0xd0]
14026b9e9: lea       rdx, [rsp + 0x1a0]
14026b9f1: call      0x1401f9650
14026b9f6: mov       rax, rsi
14026b9f9: add       rsp, 0x3c0
14026ba00: pop       rbx
14026ba01: pop       rdi
14026ba02: pop       rsi
14026ba03: ret
14026ba04: movups    xmm0, xmmword ptr [rip + 0x5b7feb1]
14026ba0b: jmp       0x14026b879
14026ba10: ud2
