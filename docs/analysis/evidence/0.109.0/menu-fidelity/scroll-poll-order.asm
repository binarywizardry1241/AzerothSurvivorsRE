14019e4f0: push      r15
14019e4f2: push      r14
14019e4f4: push      r13
14019e4f6: push      r12
14019e4f8: push      rsi
14019e4f9: push      rdi
14019e4fa: push      rbp
14019e4fb: push      rbx
14019e4fc: sub       rsp, 0xd8
14019e503: mov       ebx, 1
14019e508: lock xadd dword ptr [r8 + 0x5b0], ebx
14019e511: cmp       dword ptr [rdx], 1
14019e514: jne       0x14019e7b4
14019e51a: mov       rsi, rdx
14019e51d: mov       rax, qword ptr [r8 + 0x5a0]
14019e524: mov       qword ptr [rsp + 0x38], rax
14019e529: cmp       qword ptr [rdx + 0x30], rax
14019e52d: jne       0x14019e7ce
14019e533: mov       rdi, rcx
14019e536: mov       rcx, qword ptr [rsi + 8]
14019e53a: mov       rax, qword ptr [r8 + 0x218]
14019e541: cmp       rcx, rax
14019e544: jae       0x14019e83d
14019e54a: mov       rdx, qword ptr [r8 + 0x210]
14019e551: mov       rcx, qword ptr [rdx + rcx*8]
14019e555: test      rcx, rcx
14019e558: je        0x14019e83d
14019e55e: mov       r9, qword ptr [r8 + 0x1e0]
14019e565: not       rcx
14019e568: imul      rcx, rcx, 0x38
14019e56c: cmp       byte ptr [r9 + rcx + 0x30], 0
14019e572: je        0x14019e83d
14019e578: mov       r10, qword ptr [rsi + 0x10]
14019e57c: cmp       r10, rax
14019e57f: jae       0x14019e7ff
14019e585: mov       rax, qword ptr [rdx + r10*8]
14019e589: test      rax, rax
14019e58c: je        0x14019e7ff
14019e592: not       rax
14019e595: imul      rdx, rax, 0x38
14019e599: cmp       byte ptr [r9 + rdx + 0x30], 0
14019e59f: je        0x14019e7ff
14019e5a5: add       rcx, r9
14019e5a8: mov       r11, qword ptr [rcx + 0x10]
14019e5ac: mov       eax, dword ptr [rsi + 0x38]
14019e5af: add       rdx, r9
14019e5b2: mov       r9, qword ptr [rdx + 0x10]
14019e5b6: mov       r10d, dword ptr [r8 + 0x5b0]
14019e5bd: mov       r10, qword ptr [rsi + 0x18]
14019e5c1: cmp       r10, qword ptr [r8 + 0x218]
14019e5c8: jae       0x14019e7ff
14019e5ce: mov       r14, qword ptr [r8 + 0x210]
14019e5d5: mov       r14, qword ptr [r14 + r10*8]
14019e5d9: test      r14, r14
14019e5dc: je        0x14019e7ff
14019e5e2: mov       r10, qword ptr [r8 + 0x1e0]
14019e5e9: not       r14
14019e5ec: imul      r14, r14, 0x38
14019e5f0: cmp       byte ptr [r10 + r14 + 0x30], 0
14019e5f6: je        0x14019e7ff
14019e5fc: add       r10, r14
14019e5ff: mov       r14, qword ptr [r10 + 0x10]
14019e603: mov       ebp, dword ptr [r8 + 0x5b0]
14019e60a: mov       r15, qword ptr [rsi + 0x20]
14019e60e: cmp       r15, qword ptr [r8 + 0x218]
14019e615: jae       0x14019e7ff
14019e61b: mov       r12, qword ptr [r8 + 0x210]
14019e622: mov       r12, qword ptr [r12 + r15*8]
14019e626: test      r12, r12
14019e629: je        0x14019e7ff
14019e62f: mov       r15, qword ptr [r8 + 0x1e0]
14019e636: not       r12
14019e639: imul      r12, r12, 0x38
14019e63d: cmp       byte ptr [r15 + r12 + 0x30], 0
14019e643: je        0x14019e7ff
14019e649: add       r15, r12
14019e64c: mov       r13, qword ptr [r15 + 0x10]
14019e650: mov       ebp, dword ptr [r8 + 0x5b0]
14019e657: mov       r12, qword ptr [rsi + 0x28]
14019e65b: cmp       r12, qword ptr [r8 + 0x218]
14019e662: jae       0x14019e83d
14019e668: mov       rbp, qword ptr [r8 + 0x210]
14019e66f: mov       rbp, qword ptr [rbp + r12*8]
14019e674: test      rbp, rbp
14019e677: je        0x14019e83d
14019e67d: mov       r12, qword ptr [r8 + 0x1e0]
14019e684: not       rbp
14019e687: imul      r8, rbp, 0x38
14019e68b: cmp       byte ptr [r12 + r8 + 0x30], 0
14019e691: je        0x14019e83d
14019e697: add       r12, r8
14019e69a: mov       r8, qword ptr [r12 + 0x10]
14019e69f: mov       qword ptr [rsp + 0x38], r11
14019e6a4: lea       r11, [rcx + 0x2c]
14019e6a8: add       rcx, 0x28
14019e6ac: mov       qword ptr [rsp + 0x40], rcx
14019e6b1: mov       qword ptr [rsp + 0x48], r11
14019e6b6: mov       dword ptr [rsp + 0x50], eax
14019e6ba: mov       dword ptr [rsp + 0x54], ebx
14019e6be: mov       qword ptr [rsp + 0x58], r9
14019e6c3: lea       rcx, [rdx + 0x2c]
14019e6c7: add       rdx, 0x28
14019e6cb: mov       qword ptr [rsp + 0x60], rdx
14019e6d0: mov       qword ptr [rsp + 0x68], rcx
14019e6d5: mov       dword ptr [rsp + 0x70], eax
14019e6d9: mov       dword ptr [rsp + 0x74], ebx
14019e6dd: mov       qword ptr [rsp + 0x78], r14
14019e6e2: lea       rcx, [r10 + 0x2c]
14019e6e6: add       r10, 0x28
14019e6ea: mov       qword ptr [rsp + 0x80], r10
14019e6f2: mov       qword ptr [rsp + 0x88], rcx
14019e6fa: mov       dword ptr [rsp + 0x90], eax
14019e701: mov       dword ptr [rsp + 0x94], ebx
14019e708: mov       qword ptr [rsp + 0x98], r13
14019e710: lea       rcx, [r15 + 0x2c]
14019e714: add       r15, 0x28
14019e718: mov       qword ptr [rsp + 0xa0], r15
14019e720: mov       qword ptr [rsp + 0xa8], rcx
14019e728: lea       rcx, [r12 + 0x28]
14019e72d: add       r12, 0x2c
14019e731: mov       dword ptr [rsp + 0xb0], eax
14019e738: mov       dword ptr [rsp + 0xb4], ebx
14019e73f: mov       qword ptr [rsp + 0xb8], r8
14019e747: lea       r8, [rsp + 0x58]
14019e74c: mov       qword ptr [rsp + 0xc0], rcx
14019e754: lea       r9, [rsp + 0x78]
14019e759: mov       qword ptr [rsp + 0xc8], r12
14019e761: lea       rcx, [rsp + 0x98]
14019e769: mov       dword ptr [rsp + 0xd0], eax
14019e770: lea       rax, [rsp + 0xb8]
14019e778: mov       dword ptr [rsp + 0xd4], ebx
14019e77f: mov       qword ptr [rsp + 0x28], rax
14019e784: mov       qword ptr [rsp + 0x20], rcx
14019e789: lea       rdx, [rsp + 0x38]
14019e78e: call      0x140191820
14019e793: mov       dword ptr [rsi + 0x38], ebx
14019e796: mov       qword ptr [rdi], 0xfffffffffffffffd
14019e79d: mov       rax, rdi
14019e7a0: add       rsp, 0xd8
14019e7a7: pop       rbx
14019e7a8: pop       rbp
14019e7a9: pop       rdi
14019e7aa: pop       rsi
14019e7ab: pop       r12
14019e7ad: pop       r13
14019e7af: pop       r14
14019e7b1: pop       r15
14019e7b3: ret
14019e7b4: lea       rcx, [rip + 0x5c488ad]
14019e7bb: lea       r8, [rip + 0x5c48906]
14019e7c2: mov       edx, 0x59
14019e7c7: call      0x145d99570
14019e7cc: ud2
14019e7ce: add       rsi, 0x30
14019e7d2: lea       rax, [rip + 0x5c48977]
14019e7d9: mov       qword ptr [rsp + 0x28], rax
14019e7de: mov       qword ptr [rsp + 0x20], 0xdf
14019e7e7: lea       r9, [rip + 0x5c488f2]
14019e7ee: lea       r8, [rsp + 0x38]
14019e7f3: xor       ecx, ecx
14019e7f5: mov       rdx, rsi
14019e7f8: call      0x145d4891d
14019e7fd: ud2
14019e7ff: add       rsi, 0x3c
14019e803: mov       qword ptr [rsp + 0x38], rsi
14019e808: lea       rax, [rip + 0x4e5eaf1]
14019e80f: mov       qword ptr [rsp + 0x40], rax
14019e814: lea       rcx, [rsp + 0x37]
14019e819: mov       qword ptr [rsp + 0x48], rcx
14019e81e: mov       qword ptr [rsp + 0x50], rax
14019e823: lea       rcx, [rip + 0x5c4859e]
14019e82a: lea       r8, [rip + 0x5c4864f]
14019e831: lea       rdx, [rsp + 0x38]
14019e836: call      0x145d99830
14019e83b: ud2
14019e83d: add       rsi, 0x3c
14019e841: mov       qword ptr [rsp + 0x38], rsi
14019e846: lea       rax, [rip + 0x4e5eab3]
14019e84d: mov       qword ptr [rsp + 0x40], rax
14019e852: lea       rcx, [rsp + 0x37]
14019e857: mov       qword ptr [rsp + 0x48], rcx
14019e85c: mov       qword ptr [rsp + 0x50], rax
14019e861: lea       rcx, [rip + 0x5c48560]
14019e868: lea       r8, [rip + 0x5c485f9]
14019e86f: lea       rdx, [rsp + 0x38]
14019e874: call      0x145d99830
14019e879: ud2
