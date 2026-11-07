1400836b0: push      rbp
1400836b1: push      r15
1400836b3: push      r14
1400836b5: push      r13
1400836b7: push      r12
1400836b9: push      rsi
1400836ba: push      rdi
1400836bb: push      rbx
1400836bc: sub       rsp, 0x358
1400836c3: lea       rbp, [rsp + 0x80]
1400836cb: mov       qword ptr [rbp + 0x2d0], 0xfffffffffffffffe
1400836d6: mov       rbx, r8
1400836d9: mov       rdi, rdx
1400836dc: mov       rsi, rcx
1400836df: cmp       qword ptr [rdx], -1
1400836e3: je        0x140083736
1400836e5: mov       rax, qword ptr [rbx + 0x5a0]
1400836ec: mov       qword ptr [rbp + 0xd0], rax
1400836f3: cmp       qword ptr [rdi + 0x1a0], rax
1400836fa: je        0x140083a05
140083700: add       rdi, 0x1a0
140083707: lea       rax, [rip + 0x5d4d38a]
14008370e: mov       qword ptr [rsp + 0x28], rax
140083713: mov       qword ptr [rsp + 0x20], 0x83
14008371c: lea       r9, [rip + 0x5d4d32d]
140083723: lea       r8, [rbp + 0xd0]
14008372a: xor       ecx, ecx
14008372c: mov       rdx, rdi
14008372f: call      0x145d4891d
140083734: ud2
140083736: lea       r8, [rip + 0x5d4ada3]
14008373d: lea       rcx, [rbp + 0x238]
140083744: mov       rdx, rbx
140083747: call      0x144e85b40
14008374c: lea       r12, [rbx + 0x40]
140083750: lea       r13, [rbx + 0x5a8]
140083757: mov       qword ptr [rbp - 0x30], r12
14008375b: mov       qword ptr [rbp - 0x28], r13
14008375f: mov       qword ptr [rbp - 0x48], 0
140083767: mov       qword ptr [rbp - 0x40], 8
14008376f: mov       qword ptr [rbp - 0x38], 0
140083777: lea       rdx, [rip + 0x5d1ac22]
14008377e: lea       rcx, [rbp - 0x48]
140083782: call      0x140003400
140083787: nop
140083788: mov       r15, rax
14008378b: mov       rdx, qword ptr [rbp - 0x48]
14008378f: test      rdx, rdx
140083792: je        0x1400837a8
140083794: mov       rcx, qword ptr [rbp - 0x40]
140083798: shl       rdx, 3
14008379c: mov       r8d, 8
1400837a2: call      0x1400021d0
1400837a7: nop
1400837a8: lea       rcx, [rbp - 0x48]
1400837ac: mov       rdx, rbx
1400837af: call      0x140385dc0
1400837b4: nop
1400837b5: mov       rcx, rbx
1400837b8: call      0x140033690
1400837bd: nop
1400837be: mov       r14, rax
1400837c1: mov       rcx, rbx
1400837c4: call      0x140031430
1400837c9: mov       qword ptr [rbp + 0x288], rax
1400837d0: mov       rcx, rbx
1400837d3: call      0x140033d70
1400837d8: mov       qword ptr [rbp + 0x290], rax
1400837df: mov       qword ptr [rbp + 0x298], r14
1400837e6: mov       byte ptr [rbp + 0x270], 2
1400837ed: mov       qword ptr [rbp + 0x2c0], r12
1400837f4: mov       qword ptr [rbp + 0x2c8], r13
1400837fb: mov       qword ptr [rbp + 0x2a8], 0
140083806: mov       qword ptr [rbp + 0x2b0], 8
140083811: mov       qword ptr [rbp + 0x2b8], 0
14008381c: lea       rdx, [rip + 0x5d1a735]
140083823: lea       rcx, [rbp + 0x2a8]
14008382a: call      0x140005770
14008382f: mov       qword ptr [rbp + 0x2a0], rax
140083836: mov       r14, r15
140083839: mov       rdx, qword ptr [rbp + 0x2a8]
140083840: test      rdx, rdx
140083843: je        0x14008385b
140083845: mov       rcx, qword ptr [rbp + 0x2b0]
14008384c: shl       rdx, 3
140083850: mov       r8d, 8
140083856: call      0x1400021d0
14008385b: mov       qword ptr [rbp + 0x2c0], r12
140083862: mov       qword ptr [rbp + 0x2c8], r13
140083869: mov       qword ptr [rbp + 0x2a8], 0
140083874: mov       qword ptr [rbp + 0x2b0], 8
14008387f: mov       qword ptr [rbp + 0x2b8], 0
14008388a: lea       rdx, [rip + 0x5d1a5b7]
140083891: lea       rcx, [rbp + 0x2a8]
140083898: call      0x140005a70
14008389d: nop
14008389e: mov       r15, rax
1400838a1: mov       rdx, qword ptr [rbp + 0x2a8]
1400838a8: test      rdx, rdx
1400838ab: je        0x1400838c3
1400838ad: mov       rcx, qword ptr [rbp + 0x2b0]
1400838b4: shl       rdx, 3
1400838b8: mov       r8d, 8
1400838be: call      0x1400021d0
1400838c3: mov       qword ptr [rbp + 0x2c0], r12
1400838ca: mov       qword ptr [rbp + 0x2c8], r13
1400838d1: mov       qword ptr [rbp + 0x2a8], 0
1400838dc: mov       qword ptr [rbp + 0x2b0], 8
1400838e7: mov       qword ptr [rbp + 0x2b8], 0
1400838f2: lea       rdx, [rip + 0x5d1a53f]
1400838f9: lea       rcx, [rbp + 0x2a8]
140083900: call      0x140006f50
140083905: nop
140083906: mov       r12, rax
140083909: mov       rdx, qword ptr [rbp + 0x2a8]
140083910: test      rdx, rdx
140083913: je        0x14008392b
140083915: mov       rcx, qword ptr [rbp + 0x2b0]
14008391c: shl       rdx, 3
140083920: mov       r8d, 8
140083926: call      0x1400021d0
14008392b: movups    xmm0, xmmword ptr [rbp + 0x238]
140083932: movups    xmm1, xmmword ptr [rbp + 0x248]
140083939: movups    xmm2, xmmword ptr [rbp + 0x258]
140083940: movaps    xmmword ptr [rbp + 0xd0], xmm0
140083947: movaps    xmmword ptr [rbp + 0xe0], xmm1
14008394e: movaps    xmmword ptr [rbp + 0xf0], xmm2
140083955: mov       rax, qword ptr [rbp + 0x268]
14008395c: mov       qword ptr [rbp + 0x100], rax
140083963: lea       rcx, [rbp + 0x108]
14008396a: lea       rdx, [rbp - 0x48]
14008396e: mov       r8d, 0x118
140083974: call      0x145bfa0e7
140083979: movups    xmm0, xmmword ptr [rbp + 0x270]
140083980: movaps    xmmword ptr [rbp + 0x220], xmm0
140083987: mov       rax, qword ptr [rbp + 0x280]
14008398e: mov       qword ptr [rbp + 0x230], rax
140083995: mov       r13, qword ptr [rbx + 0x5a0]
14008399c: lea       rdx, [rbp + 0xd0]
1400839a3: mov       r8d, 0x168
1400839a9: mov       rcx, rdi
1400839ac: call      0x145bfa0e7
1400839b1: mov       qword ptr [rdi + 0x168], r14
1400839b8: mov       rax, qword ptr [rbp + 0x298]
1400839bf: mov       qword ptr [rdi + 0x170], rax
1400839c6: mov       rax, qword ptr [rbp + 0x288]
1400839cd: mov       qword ptr [rdi + 0x178], rax
1400839d4: mov       rax, qword ptr [rbp + 0x290]
1400839db: mov       qword ptr [rdi + 0x180], rax
1400839e2: mov       rax, qword ptr [rbp + 0x2a0]
1400839e9: mov       qword ptr [rdi + 0x188], rax
1400839f0: mov       qword ptr [rdi + 0x190], r15
1400839f7: mov       qword ptr [rdi + 0x198], r12
1400839fe: mov       qword ptr [rdi + 0x1a0], r13
140083a05: mov       eax, 0x3dcc5000
140083a0a: add       eax, dword ptr [rbx + 0x5b0]
140083a10: lea       rdx, [rdi + 0x1a8]
140083a17: mov       dword ptr [rdi + 0x1a8], eax
140083a1d: mov       qword ptr [rbp + 0xe8], 0x10
140083a28: xorps     xmm0, xmm0
140083a2b: movups    xmmword ptr [rbp + 0xf0], xmm0
140083a32: mov       qword ptr [rbp + 0x100], 0x10
140083a3d: movups    xmmword ptr [rbp + 0x108], xmm0
140083a44: mov       qword ptr [rbp + 0x118], 0x10
140083a4f: movups    xmmword ptr [rbp + 0x120], xmm0
140083a56: mov       qword ptr [rbp + 0x130], 0x10
140083a61: movups    xmmword ptr [rbp + 0x138], xmm0
140083a68: mov       qword ptr [rbp + 0x148], 0x10
140083a73: mov       qword ptr [rbp + 0xd0], 0
140083a7e: movups    xmmword ptr [rbp + 0x150], xmm0
140083a85: mov       dword ptr [rbp + 0x160], 0
140083a8f: mov       qword ptr [rbp + 0xd8], 8
140083a9a: mov       qword ptr [rbp + 0xe0], 0
140083aa5: lea       r8, [rbp + 0xd0]
140083aac: mov       rcx, rdi
140083aaf: mov       r9, rbx
140083ab2: call      0x1402776b0
140083ab7: nop
140083ab8: lea       rdx, [rbp + 0xd0]
140083abf: mov       r8d, 0x98
140083ac5: mov       rcx, rsi
140083ac8: call      0x145bfa0e7
140083acd: mov       rax, rsi
140083ad0: add       rsp, 0x358
140083ad7: pop       rbx
140083ad8: pop       rdi
140083ad9: pop       rsi
140083ada: pop       r12
140083adc: pop       r13
140083ade: pop       r14
140083ae0: pop       r15
140083ae2: pop       rbp
140083ae3: ret
