14589c630: push      rbp
14589c631: push      r15
14589c633: push      r14
14589c635: push      r13
14589c637: push      r12
14589c639: push      rsi
14589c63a: push      rdi
14589c63b: push      rbx
14589c63c: sub       rsp, 0xc8
14589c643: lea       rbp, [rsp + 0x80]
14589c64b: mov       qword ptr [rbp + 0x40], 0xfffffffffffffffe
14589c653: mov       rdi, r8
14589c656: mov       ebx, edx
14589c658: mov       rsi, rcx
14589c65b: mov       rax, qword ptr [rcx + 0x80]
14589c662: mov       rcx, qword ptr [rcx + 0x88]
14589c669: shl       rcx, 4
14589c66d: lea       rcx, [rcx + rcx*4]
14589c671: xor       r15d, r15d
14589c674: xor       edx, edx
14589c676: nop       word ptr cs:[rax + rax]
14589c680: cmp       rcx, rdx
14589c683: je        0x14589c697
14589c685: lea       r8, [rdx + 0x50]
14589c689: cmp       byte ptr [rax + rdx], bl
14589c68c: mov       rdx, r8
14589c68f: jne       0x14589c680
14589c691: movzx     r15d, byte ptr [rax + r8 - 0x4f]
14589c697: cmp       rdi, 3
14589c69b: setb      al
14589c69e: cmp       rdi, r15
14589c6a1: setne     r14b
14589c6a5: and       r14b, al
14589c6a8: cmp       r14b, 1
14589c6ac: jne       0x14589ca06
14589c6b2: mov       rax, qword ptr [rsi + 0x68]
14589c6b6: mov       rdx, qword ptr [rsi + 0x70]
14589c6ba: shl       rdx, 5
14589c6be: xor       r13d, r13d
14589c6c1: xor       ecx, ecx
14589c6c3: mov       r8, rax
14589c6c6: nop       word ptr cs:[rax + rax]
14589c6d0: cmp       rdx, rcx
14589c6d3: je        0x14589c71f
14589c6d5: add       rcx, 0x20
14589c6d9: cmp       byte ptr [r8 + 4], bl
14589c6dd: lea       r8, [r8 + 0x20]
14589c6e1: jne       0x14589c6d0
14589c6e3: mov       r13, qword ptr [rax + rcx - 8]
14589c6e8: mov       r12, r13
14589c6eb: shl       r12, 4
14589c6ef: mov       rdx, r13
14589c6f2: shr       rdx, 0x3c
14589c6f6: setne     dl
14589c6f9: movabs    r8, 0x7ffffffffffffff8
14589c703: cmp       r12, r8
14589c706: seta      r8b
14589c70a: or        r8b, dl
14589c70d: je        0x14589c732
14589c70f: xor       r13d, r13d
14589c712: mov       rcx, r13
14589c715: mov       rdx, r12
14589c718: call      0x145d992bb
14589c71d: ud2
14589c71f: mov       eax, 8
14589c724: mov       qword ptr [rbp + 0x20], rax
14589c728: mov       qword ptr [rbp + 0x30], 0
14589c730: jmp       0x14589c79d
14589c732: mov       rdx, qword ptr [rax + rcx - 0x10]
14589c737: test      r12, r12
14589c73a: je        0x14589c784
14589c73c: mov       qword ptr [rbp + 0x28], rdx
14589c740: mov       qword ptr [rbp + 0x10], r13
14589c744: call      0x140002200
14589c749: mov       r13d, 8
14589c74f: mov       edx, 8
14589c754: mov       rcx, r12
14589c757: call      0x1400021c0
14589c75c: mov       qword ptr [rbp + 0x20], rax
14589c760: test      rax, rax
14589c763: je        0x14589c712
14589c765: mov       r13, qword ptr [rbp + 0x10]
14589c769: mov       qword ptr [rbp + 0x30], r13
14589c76d: mov       rdx, qword ptr [rbp + 0x28]
14589c771: test      r13, r13
14589c774: je        0x14589c79a
14589c776: mov       rcx, qword ptr [rbp + 0x20]
14589c77a: mov       r8, r12
14589c77d: call      0x145bfa0e7
14589c782: jmp       0x14589c79d
14589c784: mov       eax, 8
14589c789: mov       qword ptr [rbp + 0x20], rax
14589c78d: mov       qword ptr [rbp + 0x30], 0
14589c795: test      r13, r13
14589c798: jne       0x14589c776
14589c79a: xor       r13d, r13d
14589c79d: mov       byte ptr [rbp + 0x3d], 1
14589c7a1: lea       rcx, [rbp - 0x10]
14589c7a5: mov       rdx, rsi
14589c7a8: mov       r8d, ebx
14589c7ab: mov       r9, rdi
14589c7ae: call      0x14589c200
14589c7b3: nop
14589c7b4: mov       rax, qword ptr [rsi + 0x80]
14589c7bb: mov       r12, qword ptr [rsi + 0x88]
14589c7c2: test      r12, r12
14589c7c5: je        0x14589c7f6
14589c7c7: mov       rcx, r12
14589c7ca: shl       rcx, 4
14589c7ce: lea       rdx, [rcx + rcx*4]
14589c7d2: xor       ecx, ecx
14589c7d4: xor       r8d, r8d
14589c7d7: nop       word ptr [rax + rax]
14589c7e0: cmp       byte ptr [rax + r8], bl
14589c7e4: je        0x14589ca1d
14589c7ea: inc       rcx
14589c7ed: add       r8, 0x50
14589c7f1: cmp       rdx, r8
14589c7f4: jne       0x14589c7e0
14589c7f6: lea       rcx, [rsi + 0x78]
14589c7fa: xorps     xmm0, xmm0
14589c7fd: movups    xmmword ptr [rbp - 0x48], xmm0
14589c801: movups    xmmword ptr [rbp - 0x30], xmm0
14589c805: mov       byte ptr [rbp - 0x60], bl
14589c808: mov       byte ptr [rbp - 0x5f], 0
14589c80c: mov       qword ptr [rbp - 0x58], 0
14589c814: mov       qword ptr [rbp - 0x50], 8
14589c81c: mov       qword ptr [rbp - 0x38], 8
14589c824: mov       qword ptr [rbp - 0x20], 8
14589c82c: mov       qword ptr [rbp - 0x18], 0
14589c834: cmp       r12, qword ptr [rcx]
14589c837: jne       0x14589c846
14589c839: call      0x145c26910
14589c83e: nop
14589c83f: mov       rax, qword ptr [rsi + 0x80]
14589c846: lea       rcx, [r12 + r12*4]
14589c84a: shl       rcx, 4
14589c84e: movups    xmm0, xmmword ptr [rbp - 0x20]
14589c852: movups    xmmword ptr [rax + rcx + 0x40], xmm0
14589c857: movups    xmm0, xmmword ptr [rbp - 0x60]
14589c85b: movups    xmm1, xmmword ptr [rbp - 0x50]
14589c85f: movups    xmm2, xmmword ptr [rbp - 0x40]
14589c863: movups    xmm3, xmmword ptr [rbp - 0x30]
14589c867: movups    xmmword ptr [rax + rcx + 0x30], xmm3
14589c86c: movups    xmmword ptr [rax + rcx + 0x20], xmm2
14589c871: movups    xmmword ptr [rax + rcx + 0x10], xmm1
14589c876: movups    xmmword ptr [rax + rcx], xmm0
14589c87a: lea       rdx, [r12 + 1]
14589c87f: mov       qword ptr [rsi + 0x88], rdx
14589c886: cmp       r12, rdx
14589c889: jae       0x14589ca2c
14589c88f: mov       qword ptr [rbp + 0x10], rdi
14589c893: cmp       r15d, 3
14589c897: jae       0x14589ca5d
14589c89d: lea       rdi, [r12 + r12*4]
14589c8a1: shl       rdi, 4
14589c8a5: mov       rax, qword ptr [rsi + 0x80]
14589c8ac: add       rax, rdi
14589c8af: lea       rcx, [r15 + r15*2]
14589c8b3: lea       r15, [rax + rcx*8]
14589c8b7: add       r15, 8
14589c8bb: mov       rdx, qword ptr [rax + rcx*8 + 8]
14589c8c0: test      rdx, rdx
14589c8c3: je        0x14589c8d8
14589c8c5: mov       rcx, qword ptr [r15 + 8]
14589c8c9: shl       rdx, 4
14589c8cd: mov       r8d, 8
14589c8d3: call      0x1400021d0
14589c8d8: mov       rax, qword ptr [rbp + 0x30]
14589c8dc: mov       qword ptr [r15], rax
14589c8df: mov       rax, qword ptr [rbp + 0x20]
14589c8e3: mov       qword ptr [r15 + 8], rax
14589c8e7: mov       qword ptr [r15 + 0x10], r13
14589c8eb: mov       r13, qword ptr [rbp]
14589c8ef: mov       r15, r13
14589c8f2: shl       r15, 4
14589c8f6: mov       rax, r13
14589c8f9: shr       rax, 0x3c
14589c8fd: setne     al
14589c900: movabs    rcx, 0x7ffffffffffffff8
14589c90a: cmp       r15, rcx
14589c90d: seta      cl
14589c910: or        cl, al
14589c912: je        0x14589c92c
14589c914: xor       ecx, ecx
14589c916: mov       byte ptr [rbp + 0x3f], 1
14589c91a: mov       byte ptr [rbp + 0x3e], 0
14589c91e: mov       rdx, r15
14589c921: call      0x145d992bb
14589c926: nop
14589c927: jmp       0x14589ca9e
14589c92c: mov       rdx, qword ptr [rbp - 8]
14589c930: test      r15, r15
14589c933: je        0x14589ca3e
14589c939: mov       qword ptr [rbp + 8], rdx
14589c93d: call      0x140002200
14589c942: mov       edx, 8
14589c947: mov       rcx, r15
14589c94a: call      0x1400021c0
14589c94f: mov       ecx, 8
14589c954: mov       qword ptr [rbp + 0x28], rax
14589c958: test      rax, rax
14589c95b: je        0x14589c916
14589c95d: mov       qword ptr [rbp + 0x18], r13
14589c961: mov       rdx, qword ptr [rbp + 8]
14589c965: test      r13, r13
14589c968: je        0x14589c976
14589c96a: mov       rcx, qword ptr [rbp + 0x28]
14589c96e: mov       r8, r15
14589c971: call      0x145bfa0e7
14589c976: mov       rdx, qword ptr [rsi + 0x88]
14589c97d: cmp       r12, rdx
14589c980: jae       0x14589ca74
14589c986: mov       rax, qword ptr [rsi + 0x80]
14589c98d: add       rax, rdi
14589c990: mov       rcx, qword ptr [rbp + 0x10]
14589c994: lea       rcx, [rcx + rcx*2]
14589c998: lea       r15, [rax + rcx*8]
14589c99c: add       r15, 8
14589c9a0: mov       rdx, qword ptr [rax + rcx*8 + 8]
14589c9a5: test      rdx, rdx
14589c9a8: je        0x14589c9bd
14589c9aa: mov       rcx, qword ptr [r15 + 8]
14589c9ae: shl       rdx, 4
14589c9b2: mov       r8d, 8
14589c9b8: call      0x1400021d0
14589c9bd: mov       rax, qword ptr [rbp + 0x18]
14589c9c1: mov       qword ptr [r15], rax
14589c9c4: mov       rax, qword ptr [rbp + 0x28]
14589c9c8: mov       qword ptr [r15 + 8], rax
14589c9cc: mov       qword ptr [r15 + 0x10], r13
14589c9d0: mov       rdx, qword ptr [rsi + 0x88]
14589c9d7: cmp       r12, rdx
14589c9da: jae       0x14589ca86
14589c9e0: mov       rax, qword ptr [rsi + 0x80]
14589c9e7: mov       rcx, qword ptr [rbp + 0x10]
14589c9eb: mov       byte ptr [rax + rdi + 1], cl
14589c9ef: mov       byte ptr [rbp + 0x3f], 0
14589c9f3: mov       byte ptr [rbp + 0x3e], 0
14589c9f7: lea       r8, [rbp - 0x10]
14589c9fb: mov       rcx, rsi
14589c9fe: mov       edx, ebx
14589ca00: call      0x1458a7b80
14589ca05: nop
14589ca06: mov       eax, r14d
14589ca09: add       rsp, 0xc8
14589ca10: pop       rbx
14589ca11: pop       rdi
14589ca12: pop       rsi
14589ca13: pop       r12
14589ca15: pop       r13
14589ca17: pop       r14
14589ca19: pop       r15
14589ca1b: pop       rbp
14589ca1c: ret
14589ca1d: mov       rdx, r12
14589ca20: mov       r12, rcx
14589ca23: cmp       r12, rdx
14589ca26: jb        0x14589c88f
14589ca2c: lea       r8, [rip + 0x134ec4d]
14589ca33: mov       rcx, r12
14589ca36: call      0x145d99653
14589ca3b: nop
14589ca3c: jmp       0x14589ca9e
14589ca3e: mov       eax, 8
14589ca43: mov       qword ptr [rbp + 0x28], rax
14589ca47: mov       qword ptr [rbp + 0x18], 0
14589ca4f: test      r13, r13
14589ca52: jne       0x14589c96a
14589ca58: jmp       0x14589c976
14589ca5d: lea       r8, [rip + 0x134ec34]
14589ca64: mov       edx, 3
14589ca69: mov       rcx, r15
14589ca6c: call      0x145d99653
14589ca71: nop
14589ca72: jmp       0x14589ca9e
14589ca74: lea       r8, [rip + 0x134ec35]
14589ca7b: mov       rcx, r12
14589ca7e: call      0x145d99653
14589ca83: nop
14589ca84: jmp       0x14589ca9e
14589ca86: mov       byte ptr [rbp + 0x3f], 1
14589ca8a: mov       byte ptr [rbp + 0x3e], 0
14589ca8e: lea       r8, [rip + 0x134ec33]
14589ca95: mov       rcx, r12
14589ca98: call      0x145d99653
14589ca9d: nop
14589ca9e: ud2
