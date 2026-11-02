1458d66d0: push      rbp
1458d66d1: push      r15
1458d66d3: push      r14
1458d66d5: push      r13
1458d66d7: push      r12
1458d66d9: push      rsi
1458d66da: push      rdi
1458d66db: push      rbx
1458d66dc: sub       rsp, 0xe8
1458d66e3: lea       rbp, [rsp + 0x80]
1458d66eb: mov       qword ptr [rbp + 0x60], 0xfffffffffffffffe
1458d66f3: mov       rsi, rcx
1458d66f6: cmp       byte ptr [rdx + 0xc0d], 0
1458d66fd: je        0x1458d6808
1458d6703: mov       rdi, rdx
1458d6706: movzx     r14d, byte ptr [rdx + 0xc12]
1458d670e: cmp       r14b, 4
1458d6712: jne       0x1458d6824
1458d6718: cmp       byte ptr [rdi + 0xbff], 0
1458d671f: jne       0x1458d6824
1458d6725: cmp       byte ptr [rdi + 0xc13], 1
1458d672c: jne       0x1458d6824
1458d6732: movss     xmm0, dword ptr [rdi + 0xbf4]
1458d673a: divss     xmm0, dword ptr [rip + 0x5e40c6]
1458d6742: xorps     xmm1, xmm1
1458d6745: maxss     xmm1, xmm0
1458d6749: movss     xmm0, dword ptr [rip + 0x5c9b3f]
1458d6751: minss     xmm0, xmm1
1458d6755: movss     dword ptr [rbp - 0x14], xmm0
1458d675a: mov       r15, qword ptr [rdi + 0x9b8]
1458d6761: mov       r12, qword ptr [rdi + 0x9c0]
1458d6768: lea       rax, [r12 + r12*8]
1458d676c: lea       rax, [r15 + rax*8]
1458d6770: mov       qword ptr [rbp + 0x38], r15
1458d6774: mov       qword ptr [rbp + 0x40], rax
1458d6778: mov       qword ptr [rbp + 0x48], rdi
1458d677c: mov       rcx, rbp
1458d677f: lea       rdx, [rbp + 0x38]
1458d6783: call      0x14598d280
1458d6788: mov       r13, qword ptr [rbp + 0x10]
1458d678c: test      r13, r13
1458d678f: je        0x1458d687d
1458d6795: mov       rax, qword ptr [rbp + 8]
1458d6799: mov       rcx, qword ptr [rax + 8]
1458d679d: mov       rax, qword ptr [rax + 0x10]
1458d67a1: lea       rdx, [rcx + rax]
1458d67a5: mov       qword ptr [rbp + 0x38], 0
1458d67ad: mov       qword ptr [rbp + 0x40], 1
1458d67b5: mov       qword ptr [rbp + 0x48], 0
1458d67bd: test      rax, rax
1458d67c0: je        0x1458d689f
1458d67c6: mov       r8, rax
1458d67c9: shr       r8, 2
1458d67cd: and       eax, 3
1458d67d0: cmp       rax, 1
1458d67d4: sbb       r8, -1
1458d67d8: mov       qword ptr [rsp + 0x20], 1
1458d67e1: lea       rax, [rbp + 0x38]
1458d67e5: mov       r9d, 1
1458d67eb: mov       qword ptr [rbp + 0x58], rcx
1458d67ef: mov       rcx, rax
1458d67f2: mov       rbx, rdx
1458d67f5: xor       edx, edx
1458d67f7: call      0x145cfd5e0
1458d67fc: mov       rcx, qword ptr [rbp + 0x58]
1458d6800: mov       rdx, rbx
1458d6803: jmp       0x1458d689f
1458d6808: mov       qword ptr [rsi], 0
1458d680f: mov       qword ptr [rsi + 8], 1
1458d6817: mov       qword ptr [rsi + 0x10], 0
1458d681f: jmp       0x1458d6b70
1458d6824: call      0x140002200
1458d6829: mov       ecx, 6
1458d682e: mov       edx, 1
1458d6833: call      0x1400021c0
1458d6838: test      rax, rax
1458d683b: je        0x1458d6bfc
1458d6841: mov       word ptr [rax + 4], 0x303d
1458d6847: mov       dword ptr [rax], 0x6e776f64
1458d684d: mov       qword ptr [rbp + 0x20], 6
1458d6855: mov       qword ptr [rbp + 0x28], rax
1458d6859: mov       qword ptr [rbp + 0x30], 6
1458d6861: mov       r15, qword ptr [rdi + 0x9b8]
1458d6868: mov       r12, qword ptr [rdi + 0x9c0]
1458d686f: test      r12, r12
1458d6872: jne       0x1458d698b
1458d6878: jmp       0x1458d6b61
1458d687d: mov       qword ptr [rbp + 0x38], 0
1458d6885: mov       qword ptr [rbp + 0x40], 1
1458d688d: mov       qword ptr [rbp + 0x48], 0
1458d6895: mov       edx, 1
1458d689a: mov       ecx, 1
1458d689f: lea       r8, [rbp + 0x38]
1458d68a3: call      0x1459b04e0
1458d68a8: nop
1458d68a9: mov       rax, qword ptr [rbp + 0x48]
1458d68ad: mov       qword ptr [rbp - 0x20], rax
1458d68b1: movups    xmm0, xmmword ptr [rbp + 0x38]
1458d68b5: movaps    xmmword ptr [rbp - 0x30], xmm0
1458d68b9: lea       rax, [rbp - 0x14]
1458d68bd: mov       qword ptr [rbp + 0x38], rax
1458d68c1: lea       rax, [rip + 0x4058c8]
1458d68c8: mov       qword ptr [rbp + 0x40], rax
1458d68cc: lea       rax, [rbp - 0x30]
1458d68d0: mov       qword ptr [rbp + 0x48], rax
1458d68d4: lea       rax, [rip - 0x58d47fb]
1458d68db: mov       qword ptr [rbp + 0x50], rax
1458d68df: lea       rdx, [rip + 0x1a3f519]
1458d68e6: lea       rcx, [rbp - 0x50]
1458d68ea: lea       r8, [rbp + 0x38]
1458d68ee: call      0x145ccb3e0
1458d68f3: nop
1458d68f4: mov       rdx, qword ptr [rbp - 0x30]
1458d68f8: test      rdx, rdx
1458d68fb: je        0x1458d690c
1458d68fd: mov       rcx, qword ptr [rbp - 0x28]
1458d6901: mov       r8d, 1
1458d6907: call      0x1400021d0
1458d690c: mov       rax, qword ptr [rbp + 8]
1458d6910: mov       qword ptr [rbp + 0x58], rax
1458d6914: test      r13, r13
1458d6917: je        0x1458d6952
1458d6919: mov       rax, qword ptr [rbp + 0x58]
1458d691d: lea       rbx, [rax + 8]
1458d6921: jmp       0x1458d6939
1458d6923: nop       word ptr cs:[rax + rax]
1458d6930: add       rbx, 0x18
1458d6934: dec       r13
1458d6937: je        0x1458d6952
1458d6939: mov       rdx, qword ptr [rbx - 8]
1458d693d: test      rdx, rdx
1458d6940: je        0x1458d6930
1458d6942: mov       rcx, qword ptr [rbx]
1458d6945: mov       r8d, 1
1458d694b: call      0x1400021d0
1458d6950: jmp       0x1458d6930
1458d6952: mov       rax, qword ptr [rbp]
1458d6956: test      rax, rax
1458d6959: je        0x1458d6972
1458d695b: shl       rax, 3
1458d695f: lea       rdx, [rax + rax*2]
1458d6963: mov       r8d, 8
1458d6969: mov       rcx, qword ptr [rbp + 0x58]
1458d696d: call      0x1400021d0
1458d6972: movups    xmm0, xmmword ptr [rbp - 0x50]
1458d6976: movaps    xmmword ptr [rbp + 0x20], xmm0
1458d697a: mov       rax, qword ptr [rbp - 0x40]
1458d697e: mov       qword ptr [rbp + 0x30], rax
1458d6982: test      r12, r12
1458d6985: je        0x1458d6b61
1458d698b: cmp       r14b, 1
1458d698f: jne       0x1458d6b61
1458d6995: shl       r12, 3
1458d6999: lea       rax, [r12 + r12*8]
1458d699d: mov       rcx, qword ptr [rdi + 0xb18]
1458d69a4: lea       r8, [rax - 0x48]
1458d69a8: xor       edx, edx
1458d69aa: nop       word ptr [rax + rax]
1458d69b0: cmp       qword ptr [r15 + rdx + 0x30], rcx
1458d69b5: je        0x1458d69c5
1458d69b7: add       rdx, 0x48
1458d69bb: cmp       rax, rdx
1458d69be: jne       0x1458d69b0
1458d69c0: jmp       0x1458d6b61
1458d69c5: lea       rdi, [r15 + rdx]
1458d69c9: cmp       r8, rdx
1458d69cc: je        0x1458d6a28
1458d69ce: sub       rax, rdx
1458d69d1: add       rax, -0x48
1458d69d5: lea       r8, [r15 + rdx]
1458d69d9: add       r8, 0x48
1458d69dd: movabs    rdx, 0xe38e38e38e38e38f
1458d69e7: mul       rdx
1458d69ea: shr       rdx, 6
1458d69ee: jmp       0x1458d69f9
1458d69f0: add       r8, 0x48
1458d69f4: dec       rdx
1458d69f7: je        0x1458d6a28
1458d69f9: cmp       qword ptr [r8 + 0x30], rcx
1458d69fd: jne       0x1458d69f0
1458d69ff: mov       eax, dword ptr [rdi + 0x40]
1458d6a02: mov       r9d, dword ptr [r8 + 0x40]
1458d6a06: mov       r10d, eax
1458d6a09: sar       r10d, 0x1f
1458d6a0d: shr       r10d, 1
1458d6a10: xor       r10d, eax
1458d6a13: mov       eax, r9d
1458d6a16: sar       eax, 0x1f
1458d6a19: shr       eax, 1
1458d6a1b: xor       eax, r9d
1458d6a1e: cmp       r10d, eax
1458d6a21: jg        0x1458d69f0
1458d6a23: mov       rdi, r8
1458d6a26: jmp       0x1458d69f0
1458d6a28: lea       rdx, [rdi + 0x18]
1458d6a2c: lea       rcx, [rbp + 0x38]
1458d6a30: call      0x145ccb8a0
1458d6a35: nop
1458d6a36: mov       rax, qword ptr [rbp + 0x38]
1458d6a3a: cmp       rax, -1
1458d6a3e: je        0x1458d6b61
1458d6a44: mov       qword ptr [rbp - 0x10], rax
1458d6a48: movss     xmm0, dword ptr [rdi + 0x40]
1458d6a4d: mov       rax, qword ptr [rbp + 0x40]
1458d6a51: mov       qword ptr [rbp + 0x58], rax
1458d6a55: mov       rdx, qword ptr [rbp + 0x48]
1458d6a59: movss     dword ptr [rbp - 0x50], xmm0
1458d6a5e: mov       qword ptr [rbp + 0x38], 0
1458d6a66: mov       qword ptr [rbp + 0x40], 1
1458d6a6e: mov       qword ptr [rbp + 0x48], 0
1458d6a76: test      rdx, rdx
1458d6a79: jne       0x1458d6b87
1458d6a7f: mov       rcx, qword ptr [rbp + 0x58]
1458d6a83: add       rdx, rcx
1458d6a86: lea       r8, [rbp + 0x38]
1458d6a8a: call      0x1459b04e0
1458d6a8f: nop
1458d6a90: mov       rax, qword ptr [rbp + 0x48]
1458d6a94: mov       qword ptr [rbp + 0x10], rax
1458d6a98: movups    xmm0, xmmword ptr [rbp + 0x38]
1458d6a9c: movaps    xmmword ptr [rbp], xmm0
1458d6aa0: mov       rax, rbp
1458d6aa3: mov       qword ptr [rbp + 0x38], rax
1458d6aa7: lea       rax, [rip - 0x58d49ce]
1458d6aae: mov       qword ptr [rbp + 0x40], rax
1458d6ab2: lea       rax, [rbp - 0x50]
1458d6ab6: mov       qword ptr [rbp + 0x48], rax
1458d6aba: lea       rax, [rip + 0x4056cf]
1458d6ac1: mov       qword ptr [rbp + 0x50], rax
1458d6ac5: lea       rdx, [rip + 0x1a3f34f]
1458d6acc: lea       rcx, [rbp - 0x30]
1458d6ad0: lea       r8, [rbp + 0x38]
1458d6ad4: call      0x145ccb3e0
1458d6ad9: nop
1458d6ada: mov       rdx, qword ptr [rbp]
1458d6ade: test      rdx, rdx
1458d6ae1: je        0x1458d6af2
1458d6ae3: mov       rcx, qword ptr [rbp + 8]
1458d6ae7: mov       r8d, 1
1458d6aed: call      0x1400021d0
1458d6af2: mov       r15, qword ptr [rbp - 0x30]
1458d6af6: mov       r12, qword ptr [rbp - 0x28]
1458d6afa: mov       rdi, qword ptr [rbp - 0x20]
1458d6afe: mov       rax, qword ptr [rbp + 0x20]
1458d6b02: mov       rbx, qword ptr [rbp + 0x30]
1458d6b06: sub       rax, rbx
1458d6b09: cmp       rdi, rax
1458d6b0c: ja        0x1458d6bc0
1458d6b12: test      rdi, rdi
1458d6b15: mov       r14, qword ptr [rbp + 0x58]
1458d6b19: je        0x1458d6b2d
1458d6b1b: mov       rcx, qword ptr [rbp + 0x28]
1458d6b1f: add       rcx, rbx
1458d6b22: mov       rdx, r12
1458d6b25: mov       r8, rdi
1458d6b28: call      0x145cf868b
1458d6b2d: add       rbx, rdi
1458d6b30: mov       qword ptr [rbp + 0x30], rbx
1458d6b34: test      r15, r15
1458d6b37: je        0x1458d6b4a
1458d6b39: mov       r8d, 1
1458d6b3f: mov       rcx, r12
1458d6b42: mov       rdx, r15
1458d6b45: call      0x1400021d0
1458d6b4a: mov       rdx, qword ptr [rbp - 0x10]
1458d6b4e: test      rdx, rdx
1458d6b51: je        0x1458d6b61
1458d6b53: mov       r8d, 1
1458d6b59: mov       rcx, r14
1458d6b5c: call      0x1400021d0
1458d6b61: mov       rax, qword ptr [rbp + 0x30]
1458d6b65: mov       qword ptr [rsi + 0x10], rax
1458d6b69: movaps    xmm0, xmmword ptr [rbp + 0x20]
1458d6b6d: movups    xmmword ptr [rsi], xmm0
1458d6b70: mov       rax, rsi
1458d6b73: add       rsp, 0xe8
1458d6b7a: pop       rbx
1458d6b7b: pop       rdi
1458d6b7c: pop       rsi
1458d6b7d: pop       r12
1458d6b7f: pop       r13
1458d6b81: pop       r14
1458d6b83: pop       r15
1458d6b85: pop       rbp
1458d6b86: ret
1458d6b87: mov       r8, rdx
1458d6b8a: shr       r8, 2
1458d6b8e: mov       eax, edx
1458d6b90: and       eax, 3
1458d6b93: cmp       rax, 1
1458d6b97: sbb       r8, -1
1458d6b9b: mov       qword ptr [rsp + 0x20], 1
1458d6ba4: lea       rcx, [rbp + 0x38]
1458d6ba8: mov       r9d, 1
1458d6bae: mov       rdi, rdx
1458d6bb1: xor       edx, edx
1458d6bb3: call      0x145cfd5e0
1458d6bb8: mov       rdx, rdi
1458d6bbb: jmp       0x1458d6a7f
1458d6bc0: mov       qword ptr [rbp - 0x38], r12
1458d6bc4: mov       qword ptr [rbp - 8], r15
1458d6bc8: mov       qword ptr [rsp + 0x20], 1
1458d6bd1: lea       rcx, [rbp + 0x20]
1458d6bd5: mov       r9d, 1
1458d6bdb: mov       rdx, rbx
1458d6bde: mov       r8, rdi
1458d6be1: call      0x145cfd5e0
1458d6be6: nop
1458d6be7: mov       rbx, qword ptr [rbp + 0x30]
1458d6beb: mov       r14, qword ptr [rbp + 0x58]
1458d6bef: mov       r15, qword ptr [rbp - 8]
1458d6bf3: mov       r12, qword ptr [rbp - 0x38]
1458d6bf7: jmp       0x1458d6b1b
1458d6bfc: mov       ecx, 1
1458d6c01: mov       edx, 6
1458d6c06: call      0x145e99f5b
1458d6c0b: ud2
