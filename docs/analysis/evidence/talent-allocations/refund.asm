14599f500: push      rbp
14599f501: push      r15
14599f503: push      r14
14599f505: push      r13
14599f507: push      r12
14599f509: push      rsi
14599f50a: push      rdi
14599f50b: push      rbx
14599f50c: sub       rsp, 0x68
14599f510: lea       rbp, [rsp + 0x60]
14599f515: mov       qword ptr [rbp], 0xfffffffffffffffe
14599f51d: mov       r13, qword ptr [rcx + 0x10]
14599f521: test      r13, r13
14599f524: je        0x14599f876
14599f52a: mov       r14, r9
14599f52d: mov       r15, r8
14599f530: mov       ebx, edx
14599f532: mov       rsi, rcx
14599f535: mov       rdi, qword ptr [rcx + 8]
14599f539: mov       r8, r13
14599f53c: shl       r8, 4
14599f540: xor       r12d, r12d
14599f543: mov       qword ptr [rbp - 0x10], r8
14599f547: jmp       0x14599f55d
14599f549: nop       dword ptr [rax]
14599f550: add       r12, 0x10
14599f554: cmp       r8, r12
14599f557: je        0x14599f876
14599f55d: mov       rax, qword ptr [rdi + r12]
14599f561: cmp       qword ptr [rax + 0x38], r14
14599f565: jne       0x14599f550
14599f567: mov       rcx, qword ptr [rax + 0x30]
14599f56b: mov       rdx, r15
14599f56e: mov       r8, r14
14599f571: call      0x145c0a3e7
14599f576: mov       r8, qword ptr [rbp - 0x10]
14599f57a: test      eax, eax
14599f57c: jne       0x14599f550
14599f57e: mov       rax, r13
14599f581: shr       rax, 0x3c
14599f585: setne     al
14599f588: movabs    rcx, 0x7ffffffffffffff8
14599f592: cmp       r8, rcx
14599f595: seta      cl
14599f598: or        cl, al
14599f59a: je        0x14599f5ac
14599f59c: xor       r14d, r14d
14599f59f: mov       rcx, r14
14599f5a2: mov       rdx, r8
14599f5a5: call      0x145da94eb
14599f5aa: ud2
14599f5ac: call      0x140002200
14599f5b1: mov       r14d, 8
14599f5b7: mov       edx, 8
14599f5bc: mov       rcx, qword ptr [rbp - 0x10]
14599f5c0: call      0x1400021c0
14599f5c5: mov       r8, qword ptr [rbp - 0x10]
14599f5c9: test      rax, rax
14599f5cc: je        0x14599f59f
14599f5ce: mov       r15, rax
14599f5d1: mov       rcx, rax
14599f5d4: mov       rdx, rdi
14599f5d7: call      0x145c0a3db
14599f5dc: dec       byte ptr [r15 + r12 + 8]
14599f5e1: lea       rax, [r15 + 0x18]
14599f5e5: xor       r14d, r14d
14599f5e8: nop       dword ptr [rax + rax]
14599f5f0: cmp       byte ptr [rax - 0x10], 0
14599f5f4: je        0x14599f889
14599f5fa: inc       r14
14599f5fd: add       rax, 0x10
14599f601: cmp       r13, r14
14599f604: jne       0x14599f5f0
14599f606: mov       r14, r13
14599f609: movabs    r9, 0x7ffffffffffffff8
14599f613: mov       qword ptr [rbp - 8], r15
14599f617: mov       r15, r14
14599f61a: shl       r15, 4
14599f61e: mov       rax, r14
14599f621: shr       rax, 0x3c
14599f625: setne     al
14599f628: cmp       r15, r9
14599f62b: seta      cl
14599f62e: or        cl, al
14599f630: je        0x14599f643
14599f632: xor       r12d, r12d
14599f635: mov       rcx, r12
14599f638: mov       rdx, r15
14599f63b: call      0x145da94eb
14599f640: nop
14599f641: ud2
14599f643: test      r15, r15
14599f646: je        0x14599f6d8
14599f64c: call      0x140002200
14599f651: mov       r12d, 8
14599f657: mov       edx, 8
14599f65c: mov       rcx, r15
14599f65f: call      0x1400021c0
14599f664: test      rax, rax
14599f667: je        0x14599f635
14599f669: mov       r12, r14
14599f66c: test      r14, r14
14599f66f: je        0x14599f686
14599f671: mov       rcx, rax
14599f674: mov       rdx, qword ptr [rbp - 8]
14599f678: mov       r8, r15
14599f67b: mov       r15, rax
14599f67e: call      0x145c0a3db
14599f683: mov       rax, r15
14599f686: mov       qword ptr [rbp - 0x40], r12
14599f68a: mov       qword ptr [rbp - 0x38], rax
14599f68e: mov       qword ptr [rbp - 0x30], r14
14599f692: lea       rcx, [rbp - 0x28]
14599f696: lea       rdx, [rbp - 0x40]
14599f69a: mov       r8d, ebx
14599f69d: mov       r9d, 0xffffffff
14599f6a3: call      0x14599fe20
14599f6a8: nop
14599f6a9: mov       rbx, qword ptr [rbp - 0x20]
14599f6ad: mov       r8, qword ptr [rbp - 0x18]
14599f6b1: xor       eax, eax
14599f6b3: mov       ecx, 0
14599f6b8: test      r8, r8
14599f6bb: mov       r15, qword ptr [rbp - 8]
14599f6bf: je        0x14599f761
14599f6c5: mov       edx, r8d
14599f6c8: and       edx, 3
14599f6cb: cmp       r8, 4
14599f6cf: jae       0x14599f6e7
14599f6d1: xor       r9d, r9d
14599f6d4: xor       ecx, ecx
14599f6d6: jmp       0x14599f735
14599f6d8: mov       eax, 8
14599f6dd: xor       r12d, r12d
14599f6e0: test      r14, r14
14599f6e3: jne       0x14599f671
14599f6e5: jmp       0x14599f686
14599f6e7: and       r8, 0xfffffffffffffffc
14599f6eb: lea       r10, [rbx + 0x38]
14599f6ef: xor       r9d, r9d
14599f6f2: xor       ecx, ecx
14599f6f4: nop       word ptr cs:[rax + rax]
14599f700: movzx     r11d, byte ptr [r10 - 0x30]
14599f705: add       r11d, ecx
14599f708: movzx     ecx, byte ptr [r10 - 0x20]
14599f70d: movzx     r15d, byte ptr [r10 - 0x10]
14599f712: add       r15d, ecx
14599f715: add       r15d, r11d
14599f718: movzx     ecx, byte ptr [r10]
14599f71c: add       ecx, r15d
14599f71f: add       r9, 4
14599f723: add       r10, 0x40
14599f727: cmp       r8, r9
14599f72a: jne       0x14599f700
14599f72c: test      rdx, rdx
14599f72f: mov       r15, qword ptr [rbp - 8]
14599f733: je        0x14599f761
14599f735: shl       r9, 4
14599f739: lea       r8, [r9 + rbx]
14599f73d: add       r8, 8
14599f741: shl       edx, 4
14599f744: xor       r9d, r9d
14599f747: nop       word ptr [rax + rax]
14599f750: movzx     r10d, byte ptr [r8 + r9]
14599f755: add       ecx, r10d
14599f758: add       r9, 0x10
14599f75c: cmp       rdx, r9
14599f75f: jne       0x14599f750
14599f761: test      r14, r14
14599f764: je        0x14599f801
14599f76a: mov       edx, r14d
14599f76d: and       edx, 3
14599f770: cmp       r14, 4
14599f774: jae       0x14599f77d
14599f776: xor       r8d, r8d
14599f779: xor       eax, eax
14599f77b: jmp       0x14599f7d5
14599f77d: movabs    r9, 0xffffffffffffffc
14599f787: and       r9, r14
14599f78a: lea       r10, [r15 + 0x38]
14599f78e: xor       r8d, r8d
14599f791: xor       eax, eax
14599f793: nop       word ptr cs:[rax + rax]
14599f7a0: movzx     r11d, byte ptr [r10 - 0x30]
14599f7a5: add       r11d, eax
14599f7a8: movzx     eax, byte ptr [r10 - 0x20]
14599f7ad: movzx     r15d, byte ptr [r10 - 0x10]
14599f7b2: add       r15d, eax
14599f7b5: add       r15d, r11d
14599f7b8: movzx     eax, byte ptr [r10]
14599f7bc: add       eax, r15d
14599f7bf: add       r8, 4
14599f7c3: add       r10, 0x40
14599f7c7: cmp       r9, r8
14599f7ca: jne       0x14599f7a0
14599f7cc: test      rdx, rdx
14599f7cf: mov       r15, qword ptr [rbp - 8]
14599f7d3: je        0x14599f801
14599f7d5: shl       r8, 4
14599f7d9: add       r8, r15
14599f7dc: add       r8, 8
14599f7e0: shl       edx, 4
14599f7e3: xor       r9d, r9d
14599f7e6: nop       word ptr cs:[rax + rax]
14599f7f0: movzx     r10d, byte ptr [r8 + r9]
14599f7f5: add       eax, r10d
14599f7f8: add       r9, 0x10
14599f7fc: cmp       rdx, r9
14599f7ff: jne       0x14599f7f0
14599f801: cmp       ecx, eax
14599f803: jne       0x14599f849
14599f805: mov       rdx, qword ptr [rsi]
14599f808: test      rdx, rdx
14599f80b: je        0x14599f81f
14599f80d: shl       rdx, 4
14599f811: mov       r8d, 8
14599f817: mov       rcx, rdi
14599f81a: call      0x1400021d0
14599f81f: mov       qword ptr [rsi], r13
14599f822: mov       qword ptr [rsi + 8], r15
14599f826: mov       qword ptr [rsi + 0x10], r14
14599f82a: mov       rdx, qword ptr [rbp - 0x28]
14599f82e: test      rdx, rdx
14599f831: je        0x14599f845
14599f833: shl       rdx, 4
14599f837: mov       r8d, 8
14599f83d: mov       rcx, rbx
14599f840: call      0x1400021d0
14599f845: mov       al, 1
14599f847: jmp       0x14599f878
14599f849: mov       rdx, qword ptr [rbp - 0x28]
14599f84d: test      rdx, rdx
14599f850: je        0x14599f864
14599f852: shl       rdx, 4
14599f856: mov       r8d, 8
14599f85c: mov       rcx, rbx
14599f85f: call      0x1400021d0
14599f864: mov       r8d, 8
14599f86a: mov       rcx, r15
14599f86d: mov       rdx, qword ptr [rbp - 0x10]
14599f871: call      0x1400021d0
14599f876: xor       eax, eax
14599f878: add       rsp, 0x68
14599f87c: pop       rbx
14599f87d: pop       rdi
14599f87e: pop       rsi
14599f87f: pop       r12
14599f881: pop       r13
14599f883: pop       r14
14599f885: pop       r15
14599f887: pop       rbp
14599f888: ret
14599f889: lea       rdx, [r14 + 1]
14599f88d: cmp       rdx, r13
14599f890: jae       0x14599f609
14599f896: lea       rcx, [r13 - 2]
14599f89a: lea       r9d, [r14 + r13]
14599f89e: mov       r8, r14
14599f8a1: test      r9b, 1
14599f8a5: movabs    r9, 0x7ffffffffffffff8
14599f8af: jne       0x14599f8cc
14599f8b1: cmp       byte ptr [rax], 0
14599f8b4: mov       r8, r14
14599f8b7: je        0x14599f8c8
14599f8b9: lea       rdx, [rax - 8]
14599f8bd: movups    xmm0, xmmword ptr [rdx]
14599f8c0: movups    xmmword ptr [rax - 0x18], xmm0
14599f8c4: lea       r8, [r14 + 1]
14599f8c8: lea       rdx, [r14 + 2]
14599f8cc: cmp       rcx, r14
14599f8cf: mov       r14, r8
14599f8d2: je        0x14599f613
14599f8d8: mov       rax, r13
14599f8db: sub       rax, rdx
14599f8de: shl       rdx, 4
14599f8e2: lea       rcx, [rdx + r15]
14599f8e6: add       rcx, 0x18
14599f8ea: mov       r14, r8
14599f8ed: jmp       0x14599f8fd
14599f8ef: add       rcx, 0x20
14599f8f3: add       rax, -2
14599f8f7: je        0x14599f613
14599f8fd: cmp       byte ptr [rcx - 0x10], 0
14599f901: je        0x14599f919
14599f903: lea       rdx, [rcx - 0x18]
14599f907: mov       r8, r14
14599f90a: shl       r8, 4
14599f90e: movups    xmm0, xmmword ptr [rdx]
14599f911: movups    xmmword ptr [r15 + r8], xmm0
14599f916: inc       r14
14599f919: cmp       byte ptr [rcx], 0
14599f91c: je        0x14599f8ef
14599f91e: mov       rdx, r14
14599f921: shl       rdx, 4
14599f925: movups    xmm0, xmmword ptr [rcx - 8]
14599f929: movups    xmmword ptr [r15 + rdx], xmm0
14599f92e: inc       r14
14599f931: jmp       0x14599f8ef
