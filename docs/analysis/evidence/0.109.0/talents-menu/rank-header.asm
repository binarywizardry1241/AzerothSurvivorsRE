14026d360: push      rbp
14026d361: push      r15
14026d363: push      r14
14026d365: push      r13
14026d367: push      r12
14026d369: push      rsi
14026d36a: push      rdi
14026d36b: push      rbx
14026d36c: sub       rsp, 0x728
14026d373: lea       rbp, [rsp + 0x80]
14026d37b: movaps    xmmword ptr [rbp + 0x690], xmm14
14026d383: movaps    xmmword ptr [rbp + 0x680], xmm13
14026d38b: movaps    xmmword ptr [rbp + 0x670], xmm12
14026d393: movaps    xmmword ptr [rbp + 0x660], xmm11
14026d39b: movaps    xmmword ptr [rbp + 0x650], xmm10
14026d3a3: movaps    xmmword ptr [rbp + 0x640], xmm9
14026d3ab: movaps    xmmword ptr [rbp + 0x630], xmm8
14026d3b3: movaps    xmmword ptr [rbp + 0x620], xmm7
14026d3ba: movaps    xmmword ptr [rbp + 0x610], xmm6
14026d3c1: mov       qword ptr [rbp + 0x608], 0xfffffffffffffffe
14026d3cc: mov       rbx, rdx
14026d3cf: mov       rsi, rcx
14026d3d2: mov       r12, qword ptr [rcx]
14026d3d5: mov       rax, qword ptr [rcx + 0x28]
14026d3d9: mov       qword ptr [rbp + 0x2c8], r12
14026d3e0: movups    xmm0, xmmword ptr [rcx + 8]
14026d3e4: movups    xmmword ptr [rbp + 0x2d0], xmm0
14026d3eb: movups    xmm0, xmmword ptr [rcx + 0x18]
14026d3ef: movups    xmmword ptr [rbp + 0x2e0], xmm0
14026d3f6: mov       qword ptr [rbp + 0x2f0], rax
14026d3fd: mov       word ptr [rbp + 0x474], 0
14026d406: mov       byte ptr [rbp + 0x464], 1
14026d40d: xorps     xmm0, xmm0
14026d410: movups    xmmword ptr [rbp + 0x378], xmm0
14026d417: movups    xmmword ptr [rbp + 0x388], xmm0
14026d41e: movaps    xmm1, xmmword ptr [rip + 0x5b7e10b]
14026d425: movups    xmmword ptr [rbp + 0x398], xmm1
14026d42c: mov       qword ptr [rbp + 0x370], 0
14026d437: movups    xmmword ptr [rbp + 0x3a8], xmm0
14026d43e: movups    xmmword ptr [rbp + 0x3b8], xmm0
14026d445: mov       dword ptr [rbp + 0x488], 0
14026d44f: mov       word ptr [rbp + 0x48c], 0
14026d458: movups    xmm6, xmmword ptr [rip + 0x5b7e559]
14026d45f: movups    xmmword ptr [rbp + 0x3c8], xmm6
14026d466: movups    xmm8, xmmword ptr [rip + 0x5b7e55a]
14026d46e: movups    xmmword ptr [rbp + 0x3d8], xmm8
14026d476: movups    xmm7, xmmword ptr [rip + 0x5b7e55b]
14026d47d: movups    xmmword ptr [rbp + 0x3e8], xmm7
14026d484: movups    xmm9, xmmword ptr [rip + 0x5b7e55c]
14026d48c: movups    xmmword ptr [rbp + 0x3f8], xmm9
14026d494: movaps    xmm0, xmmword ptr [rip + 0x5b2fdb5]
14026d49b: movups    xmmword ptr [rbp + 0x408], xmm0
14026d4a2: movups    xmmword ptr [rbp + 0x418], xmm0
14026d4a9: movaps    xmm0, xmmword ptr [rip + 0x5b2fdb0]
14026d4b0: movups    xmmword ptr [rbp + 0x428], xmm0
14026d4b7: movups    xmmword ptr [rbp + 0x438], xmm0
14026d4be: mov       byte ptr [rbp + 0x486], 0
14026d4c5: mov       dword ptr [rbp + 0x482], 0
14026d4cf: mov       qword ptr [rbp + 0x468], 0
14026d4da: mov       dword ptr [rbp + 0x470], 0
14026d4e4: movaps    xmm10, xmmword ptr [rip + 0x5b2fd84]
14026d4ec: movups    xmmword ptr [rbp + 0x448], xmm10
14026d4f4: mov       dword ptr [rbp + 0x458], 1
14026d4fe: mov       qword ptr [rbp + 0x45c], 0
14026d509: mov       byte ptr [rbp + 0x487], 0
14026d510: movups    xmm11, xmmword ptr [rip + 0x5b7e3e8]
14026d518: movaps    xmmword ptr [rbp + 0x310], xmm11
14026d520: mov       qword ptr [rbp + 0x320], 0
14026d52b: movups    xmm12, xmmword ptr [rip + 0x5b7e3e5]
14026d533: movups    xmmword ptr [rbp + 0x328], xmm12
14026d53b: mov       qword ptr [rbp + 0x338], 0
14026d546: movups    xmm13, xmmword ptr [rip + 0x5b7e3e2]
14026d54e: movaps    xmmword ptr [rbp + 0x340], xmm13
14026d556: mov       qword ptr [rbp + 0x350], 0
14026d561: movups    xmm14, xmmword ptr [rip + 0x5b7e3df]
14026d569: movups    xmmword ptr [rbp + 0x358], xmm14
14026d571: mov       qword ptr [rbp + 0x368], 0
14026d57c: mov       word ptr [rbp + 0x47a], 0
14026d585: mov       dword ptr [rbp + 0x476], 0x10000
14026d58f: mov       word ptr [rbp + 0x480], 0
14026d598: mov       dword ptr [rbp + 0x47c], 0x10000
14026d5a2: mov       rdi, qword ptr [rdx]
14026d5a5: mov       rcx, rdi
14026d5a8: call      0x14590f1f0
14026d5ad: nop
14026d5ae: test      al, al
14026d5b0: je        0x14026d5bb
14026d5b2: movups    xmm0, xmmword ptr [rip + 0x5b8054b]
14026d5b9: jmp       0x14026d5c2
14026d5bb: movups    xmm0, xmmword ptr [rip + 0x5b7e62e]
14026d5c2: movaps    xmmword ptr [rbp + 0x5d0], xmm0
14026d5c9: mov       dword ptr [rbp + 0x5e0], 0x3f800000
14026d5d3: mov       eax, dword ptr [rbp + 0x5e0]
14026d5d9: mov       dword ptr [rbp + 0x580], eax
14026d5df: movaps    xmm0, xmmword ptr [rbp + 0x5d0]
14026d5e6: movaps    xmmword ptr [rbp + 0x570], xmm0
14026d5ed: movups    xmmword ptr [rbp + 0x584], xmm0
14026d5f4: mov       dword ptr [rbp + 0x594], eax
14026d5fa: movups    xmmword ptr [rbp + 0x598], xmm0
14026d601: mov       dword ptr [rbp + 0x5a8], eax
14026d607: movups    xmmword ptr [rbp + 0x5ac], xmm0
14026d60e: mov       dword ptr [rbp + 0x5bc], eax
14026d614: mov       rdx, qword ptr [rbx + 8]
14026d618: mov       r8, qword ptr [rdi + 0x40]
14026d61c: mov       r9, qword ptr [rdi + 0x48]
14026d620: lea       rcx, [rbp - 0x50]
14026d624: call      0x1401008c0
14026d629: nop
14026d62a: lea       rcx, [rbp + 0x210]
14026d631: lea       rdx, [rbp - 0x50]
14026d635: call      0x1426eca60
14026d63a: nop
14026d63b: mov       qword ptr [rbp + 0x5f0], rsi
14026d642: lea       r14, [rbp + 0x2d0]
14026d649: lea       r15, [rbp - 0x50]
14026d64d: lea       rdx, [rbp + 0x310]
14026d654: mov       r8d, 0x180
14026d65a: mov       rcx, r15
14026d65d: call      0x145bfa0e7
14026d662: movaps    xmm0, xmmword ptr [rbp + 0x570]
14026d669: movaps    xmm1, xmmword ptr [rbp + 0x580]
14026d670: movaps    xmm2, xmmword ptr [rbp + 0x590]
14026d677: movaps    xmm3, xmmword ptr [rbp + 0x5a0]
14026d67e: movups    xmmword ptr [rbp + 0x130], xmm0
14026d685: movups    xmmword ptr [rbp + 0x140], xmm1
14026d68c: movups    xmmword ptr [rbp + 0x150], xmm2
14026d693: movups    xmmword ptr [rbp + 0x160], xmm3
14026d69a: movaps    xmm0, xmmword ptr [rbp + 0x5b0]
14026d6a1: movups    xmmword ptr [rbp + 0x170], xmm0
14026d6a8: lea       rcx, [rbp + 0x180]
14026d6af: lea       rdx, [rbp + 0x210]
14026d6b6: mov       r8d, 0x88
14026d6bc: call      0x145bfa0e7
14026d6c1: lea       rcx, [rbp + 0x318]
14026d6c8: mov       r8d, 0x258
14026d6ce: mov       rdx, r15
14026d6d1: call      0x145bfa0e7
14026d6d6: mov       qword ptr [rbp + 0x310], r12
14026d6dd: lea       rcx, [rbp + 0x210]
14026d6e4: lea       r8, [rbp + 0x310]
14026d6eb: mov       rdx, r14
14026d6ee: call      0x1401e0300
14026d6f3: xorps     xmm0, xmm0
14026d6f6: movups    xmmword ptr [rbp + 0x3a0], xmm0
14026d6fd: movups    xmmword ptr [rbp + 0x390], xmm0
14026d704: movups    xmmword ptr [rbp + 0x380], xmm0
14026d70b: movups    xmmword ptr [rbp + 0x3b4], xmm0
14026d712: movups    xmmword ptr [rbp + 0x3c0], xmm0
14026d719: mov       dword ptr [rbp + 0x490], 0
14026d723: mov       word ptr [rbp + 0x494], 0
14026d72c: movaps    xmmword ptr [rbp - 0x50], xmm11
14026d731: mov       qword ptr [rbp - 0x40], 0
14026d739: movups    xmmword ptr [rbp - 0x38], xmm12
14026d73e: mov       qword ptr [rbp - 0x28], 0
14026d746: movaps    xmmword ptr [rbp - 0x20], xmm13
14026d74b: mov       qword ptr [rbp - 0x10], 0
14026d753: movups    xmmword ptr [rbp - 8], xmm14
14026d758: mov       qword ptr [rbp + 8], 0
14026d760: mov       rax, qword ptr [rbp]
14026d764: mov       qword ptr [rbp + 0x368], rax
14026d76b: mov       rax, qword ptr [rbp + 8]
14026d76f: mov       qword ptr [rbp + 0x370], rax
14026d776: mov       rax, qword ptr [rbp - 0x10]
14026d77a: mov       qword ptr [rbp + 0x358], rax
14026d781: mov       rax, qword ptr [rbp - 8]
14026d785: mov       qword ptr [rbp + 0x360], rax
14026d78c: movaps    xmm0, xmmword ptr [rbp - 0x50]
14026d790: movaps    xmm1, xmmword ptr [rbp - 0x40]
14026d794: mov       rax, qword ptr [rbp - 0x30]
14026d798: mov       rcx, qword ptr [rbp - 0x28]
14026d79c: movaps    xmm2, xmmword ptr [rbp - 0x20]
14026d7a0: movups    xmmword ptr [rbp + 0x348], xmm2
14026d7a7: mov       qword ptr [rbp + 0x338], rax
14026d7ae: mov       qword ptr [rbp + 0x340], rcx
14026d7b5: movups    xmmword ptr [rbp + 0x328], xmm1
14026d7bc: movups    xmmword ptr [rbp + 0x318], xmm0
14026d7c3: mov       qword ptr [rbp + 0x378], 0
14026d7ce: mov       dword ptr [rbp + 0x3b0], 1
14026d7d8: movups    xmmword ptr [rbp + 0x3e0], xmm8
14026d7e0: movups    xmmword ptr [rbp + 0x3d0], xmm6
14026d7e7: movups    xmmword ptr [rbp + 0x400], xmm9
14026d7ef: movups    xmmword ptr [rbp + 0x3f0], xmm7
14026d7f6: movups    xmm0, xmmword ptr [rip + 0x5b7e20b]
14026d7fd: movups    xmmword ptr [rbp + 0x420], xmm0
14026d804: movups    xmm0, xmmword ptr [rip + 0x5b7e1ed]
14026d80b: movups    xmmword ptr [rbp + 0x410], xmm0
14026d812: movups    xmm0, xmmword ptr [rip + 0x5b7e20f]
14026d819: movups    xmmword ptr [rbp + 0x440], xmm0
14026d820: movups    xmm0, xmmword ptr [rip + 0x5b7e1f1]
14026d827: movups    xmmword ptr [rbp + 0x430], xmm0
14026d82e: movups    xmmword ptr [rbp + 0x450], xmm10
14026d836: mov       dword ptr [rbp + 0x460], 1
14026d840: mov       qword ptr [rbp + 0x464], 0
14026d84b: mov       byte ptr [rbp + 0x46c], 1
14026d852: movsd     xmm0, qword ptr [rip + 0x5b2fbe6]
14026d85a: movsd     qword ptr [rbp + 0x470], xmm0
14026d862: mov       dword ptr [rbp + 0x478], 0x3f800000
14026d86c: mov       word ptr [rbp + 0x47c], 0
14026d875: mov       word ptr [rbp + 0x482], 0
14026d87e: mov       dword ptr [rbp + 0x47e], 0x10000
14026d888: mov       word ptr [rbp + 0x488], 0
14026d891: mov       dword ptr [rbp + 0x484], 0x10000
14026d89b: mov       dword ptr [rbp + 0x48a], 0
14026d8a5: mov       word ptr [rbp + 0x48e], 1
14026d8ae: mov       qword ptr [rbp + 0x310], r12
14026d8b5: lea       rcx, [rbp + 0x298]
14026d8bc: lea       r8, [rbp + 0x310]
14026d8c3: mov       rdx, r14
14026d8c6: call      0x1401de510
14026d8cb: mov       rsi, qword ptr [rbx + 0x10]
14026d8cf: mov       r12, qword ptr [rbx + 0x18]
14026d8d3: mov       r13, qword ptr [rbp + 0x298]
14026d8da: mov       rax, qword ptr [rbp + 0x2c0]
14026d8e1: mov       qword ptr [rbp + 0x570], r13
14026d8e8: movups    xmm0, xmmword ptr [rbp + 0x2a0]
14026d8ef: movups    xmmword ptr [rbp + 0x578], xmm0
14026d8f6: movups    xmm0, xmmword ptr [rbp + 0x2b0]
14026d8fd: movups    xmmword ptr [rbp + 0x588], xmm0
14026d904: mov       qword ptr [rbp + 0x598], rax
14026d90b: mov       rcx, rdi
14026d90e: call      0x14590eac0
14026d913: mov       r14, rdx
14026d916: test      rdx, rdx
14026d919: jns       0x14026d92b
14026d91b: xor       r12d, r12d
14026d91e: mov       rcx, r12
14026d921: mov       rdx, r14
14026d924: call      0x145d992bb
14026d929: ud2
14026d92b: je        0x14026d98f
14026d92d: mov       qword ptr [rbp + 0x5c8], r12
14026d934: mov       rbx, rax
14026d937: call      0x140002200
14026d93c: mov       r12d, 1
14026d942: mov       edx, 1
14026d947: mov       rcx, r14
14026d94a: call      0x1400021c0
14026d94f: test      rax, rax
14026d952: je        0x14026d91e
14026d954: mov       r15, rax
14026d957: mov       rcx, rax
14026d95a: mov       rdx, rbx
14026d95d: mov       r8, r14
14026d960: call      0x145bfa0e7
14026d965: mov       r12, qword ptr [rbp + 0x5c8]
14026d96c: cmp       byte ptr [rsi], 1
14026d96f: jne       0x14026d99a
14026d971: mov       eax, dword ptr [rsi + 1]
14026d974: mov       ecx, dword ptr [rsi + 4]
14026d977: mov       dword ptr [rbp + 0x603], ecx
14026d97d: mov       dword ptr [rbp + 0x600], eax
14026d983: mov       rax, qword ptr [rsi + 8]
14026d987: movzx     ecx, byte ptr [rsi + 0x10]
14026d98b: mov       dl, 1
14026d98d: jmp       0x14026d9aa
14026d98f: mov       r15d, 1
14026d995: cmp       byte ptr [rsi], 1
14026d998: je        0x14026d971
14026d99a: mov       rax, qword ptr [rsi + 8]
14026d99e: lock inc  qword ptr [rax]
14026d9a2: jle       0x14026dc9d
14026d9a8: xor       edx, edx
14026d9aa: lea       rbx, [rbp + 0x578]
14026d9b1: movups    xmm0, xmmword ptr [rip + 0x5b7e41c]
14026d9b8: movups    xmmword ptr [rbp + 0x211], xmm0
14026d9bf: mov       dword ptr [rbp + 0x221], 0x3f800000
14026d9c9: mov       qword ptr [rbp + 0x318], r14
14026d9d0: mov       qword ptr [rbp + 0x320], r15
14026d9d7: mov       qword ptr [rbp + 0x328], r14
14026d9de: mov       qword ptr [rbp + 0x330], 0
14026d9e9: mov       qword ptr [rbp + 0x338], 4
14026d9f4: mov       qword ptr [rbp + 0x340], 0
14026d9ff: mov       byte ptr [rbp + 0x348], dl
14026da05: mov       edx, dword ptr [rbp + 0x600]
14026da0b: mov       r8d, dword ptr [rbp + 0x603]
14026da12: mov       dword ptr [rbp + 0x349], edx
14026da18: mov       dword ptr [rbp + 0x34c], r8d
14026da1f: mov       qword ptr [rbp + 0x350], rax
14026da26: mov       qword ptr [rbp + 0x358], rcx
14026da2d: mov       dword ptr [rbp + 0x360], 0x41900000
14026da37: mov       word ptr [rbp + 0x364], 0x190
14026da40: mov       byte ptr [rbp + 0x366], 1
14026da47: movups    xmm0, xmmword ptr [rbp + 0x210]
14026da4e: movups    xmmword ptr [rbp + 0x367], xmm0
14026da55: mov       rax, qword ptr [rbp + 0x21d]
14026da5c: mov       qword ptr [rbp + 0x374], rax
14026da63: mov       r14d, dword ptr [rip + 0x5b68036]
14026da6a: mov       dword ptr [rbp + 0x38c], r14d
14026da71: movups    xmm6, xmmword ptr [rip + 0x5b68018]
14026da78: movups    xmmword ptr [rbp + 0x37c], xmm6
14026da7f: movsd     xmm7, qword ptr [rip + 0x5b2fa19]
14026da87: movsd     qword ptr [rbp + 0x390], xmm7
14026da8f: mov       qword ptr [rbp + 0x310], r13
14026da96: lea       rcx, [rbp - 0x50]
14026da9a: lea       r8, [rbp + 0x310]
14026daa1: mov       rdx, rbx
14026daa4: call      0x1401f2bf0
14026daa9: lea       rcx, [rip + 0x5b8007c]
14026dab0: mov       edx, 0x13
14026dab5: call      0x1458ec450
14026daba: mov       r8, rdx
14026dabd: add       rdi, 0x72
14026dac1: lea       rcx, [rip + 0x5b7e858]
14026dac8: mov       qword ptr [rbp - 0x50], rcx
14026dacc: mov       qword ptr [rbp - 0x48], 4
14026dad4: mov       qword ptr [rbp - 0x40], r12
14026dad8: lea       rcx, [rip + 0x5b80061]
14026dadf: mov       qword ptr [rbp - 0x38], rcx
14026dae3: lea       rdx, [rip + 0x5b80076]
14026daea: mov       qword ptr [rbp - 0x30], rdx
14026daee: mov       qword ptr [rbp - 0x28], 5
14026daf6: mov       qword ptr [rbp - 0x20], rdi
14026dafa: mov       qword ptr [rbp - 0x18], rcx
14026dafe: mov       qword ptr [rsp + 0x20], 2
14026db07: lea       rcx, [rbp + 0x210]
14026db0e: lea       r9, [rbp - 0x50]
14026db12: mov       rdx, rax
14026db15: call      0x1458ec8b0
14026db1a: cmp       byte ptr [rsi], 1
14026db1d: jne       0x14026db3d
14026db1f: mov       eax, dword ptr [rsi + 1]
14026db22: mov       ecx, dword ptr [rsi + 4]
14026db25: mov       dword ptr [rbp + 0x5fb], ecx
14026db2b: mov       dword ptr [rbp + 0x5f8], eax
14026db31: mov       rax, qword ptr [rsi + 8]
14026db35: movzx     ecx, byte ptr [rsi + 0x10]
14026db39: mov       dl, 1
14026db3b: jmp       0x14026db4d
14026db3d: mov       rax, qword ptr [rsi + 8]
14026db41: lock inc  qword ptr [rax]
14026db45: jle       0x14026dc9d
14026db4b: xor       edx, edx
14026db4d: mov       rsi, qword ptr [rbp + 0x5f0]
14026db54: mov       r8, qword ptr [rbp + 0x220]
14026db5b: mov       qword ptr [rbp + 0x328], r8
14026db62: movups    xmm0, xmmword ptr [rbp + 0x210]
14026db69: movups    xmmword ptr [rbp + 0x318], xmm0
14026db70: movups    xmm0, xmmword ptr [rip + 0x5b7dd45]
14026db77: movups    xmmword ptr [rbp + 0x2fc], xmm0
14026db7e: mov       dword ptr [rbp + 0x30c], 0x3f800000
14026db88: mov       qword ptr [rbp + 0x330], 0
14026db93: mov       qword ptr [rbp + 0x338], 4
14026db9e: mov       qword ptr [rbp + 0x340], 0
14026dba9: mov       byte ptr [rbp + 0x348], dl
14026dbaf: mov       edx, dword ptr [rbp + 0x5f8]
14026dbb5: mov       r8d, dword ptr [rbp + 0x5fb]
14026dbbc: mov       dword ptr [rbp + 0x349], edx
14026dbc2: mov       dword ptr [rbp + 0x34c], r8d
14026dbc9: mov       qword ptr [rbp + 0x350], rax
14026dbd0: mov       qword ptr [rbp + 0x358], rcx
14026dbd7: mov       dword ptr [rbp + 0x360], 0x41500000
14026dbe1: mov       word ptr [rbp + 0x364], 0x190
14026dbea: mov       byte ptr [rbp + 0x366], 1
14026dbf1: mov       rax, qword ptr [rbp + 0x308]
14026dbf8: mov       qword ptr [rbp + 0x374], rax
14026dbff: movups    xmm0, xmmword ptr [rbp + 0x2fb]
14026dc06: movups    xmmword ptr [rbp + 0x367], xmm0
14026dc0d: mov       dword ptr [rbp + 0x38c], r14d
14026dc14: movups    xmmword ptr [rbp + 0x37c], xmm6
14026dc1b: movsd     qword ptr [rbp + 0x390], xmm7
14026dc23: mov       qword ptr [rbp + 0x310], r13
14026dc2a: lea       rcx, [rbp + 0x210]
14026dc31: lea       r8, [rbp + 0x310]
14026dc38: mov       rdx, rbx
14026dc3b: call      0x1401f2bf0
14026dc40: mov       rax, rsi
14026dc43: movaps    xmm6, xmmword ptr [rbp + 0x610]
14026dc4a: movaps    xmm7, xmmword ptr [rbp + 0x620]
14026dc51: movaps    xmm8, xmmword ptr [rbp + 0x630]
14026dc59: movaps    xmm9, xmmword ptr [rbp + 0x640]
14026dc61: movaps    xmm10, xmmword ptr [rbp + 0x650]
14026dc69: movaps    xmm11, xmmword ptr [rbp + 0x660]
14026dc71: movaps    xmm12, xmmword ptr [rbp + 0x670]
14026dc79: movaps    xmm13, xmmword ptr [rbp + 0x680]
14026dc81: movaps    xmm14, xmmword ptr [rbp + 0x690]
14026dc89: add       rsp, 0x728
14026dc90: pop       rbx
14026dc91: pop       rdi
14026dc92: pop       rsi
14026dc93: pop       r12
14026dc95: pop       r13
14026dc97: pop       r14
14026dc99: pop       r15
14026dc9b: pop       rbp
14026dc9c: ret
14026dc9d: ud2
