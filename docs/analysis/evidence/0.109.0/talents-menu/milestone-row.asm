140107820: push      r15
140107822: push      r14
140107824: push      rsi
140107825: push      rdi
140107826: push      rbx
140107827: sub       rsp, 0x240
14010782e: mov       rbx, r9
140107831: mov       rdi, r8
140107834: mov       rsi, rdx
140107837: mov       r15, qword ptr [rsp + 0x290]
14010783f: movups    xmm0, xmmword ptr [rip + 0x5cce4ea]
140107846: movaps    xmmword ptr [rsp + 0x20], xmm0
14010784b: mov       qword ptr [rsp + 0x30], 0
140107854: movups    xmm1, xmmword ptr [rip + 0x5cce4ed]
14010785b: movups    xmmword ptr [rsp + 0x38], xmm1
140107860: mov       qword ptr [rsp + 0x48], 0
140107869: movups    xmm1, xmmword ptr [rip + 0x5cce4f0]
140107870: movaps    xmmword ptr [rsp + 0x50], xmm1
140107875: mov       qword ptr [rsp + 0x60], 0
14010787e: movups    xmm2, xmmword ptr [rip + 0x5cce4f3]
140107885: movups    xmmword ptr [rsp + 0x68], xmm2
14010788a: mov       qword ptr [rsp + 0x78], 0
140107893: mov       rax, qword ptr [rcx]
140107896: lea       rdx, [rcx + 8]
14010789a: mov       rcx, qword ptr [rsp + 0x70]
14010789f: mov       qword ptr [rsp + 0xe0], rcx
1401078a7: mov       rcx, qword ptr [rsp + 0x78]
1401078ac: mov       qword ptr [rsp + 0xe8], rcx
1401078b4: mov       rcx, qword ptr [rsp + 0x60]
1401078b9: mov       qword ptr [rsp + 0xd0], rcx
1401078c1: mov       rcx, qword ptr [rsp + 0x68]
1401078c6: mov       qword ptr [rsp + 0xd8], rcx
1401078ce: movups    xmmword ptr [rsp + 0xc0], xmm1
1401078d6: movaps    xmm1, xmmword ptr [rsp + 0x40]
1401078db: movups    xmmword ptr [rsp + 0xb0], xmm1
1401078e3: movaps    xmm1, xmmword ptr [rsp + 0x30]
1401078e8: movups    xmmword ptr [rsp + 0xa0], xmm1
1401078f0: movups    xmmword ptr [rsp + 0x90], xmm0
1401078f8: xorps     xmm0, xmm0
1401078fb: movups    xmmword ptr [rsp + 0xf0], xmm0
140107903: movups    xmmword ptr [rsp + 0x100], xmm0
14010790b: mov       qword ptr [rsp + 0x110], 0
140107917: movabs    rcx, 0x43b4000000000001
140107921: mov       qword ptr [rsp + 0x118], rcx
140107929: movups    xmmword ptr [rsp + 0x120], xmm0
140107931: movups    xmmword ptr [rsp + 0x130], xmm0
140107939: mov       qword ptr [rsp + 0x140], 0
140107945: movaps    xmm0, xmmword ptr [rip + 0x5c95b14]
14010794c: movups    xmmword ptr [rsp + 0x148], xmm0
140107954: movaps    xmm0, xmmword ptr [rip + 0x5c95b15]
14010795b: movups    xmmword ptr [rsp + 0x158], xmm0
140107963: movups    xmm0, xmmword ptr [rip + 0x5cce49e]
14010796a: movups    xmmword ptr [rsp + 0x168], xmm0
140107972: movups    xmm0, xmmword ptr [rip + 0x5cce49f]
140107979: movups    xmmword ptr [rsp + 0x178], xmm0
140107981: movups    xmm0, xmmword ptr [rip + 0x5cce4a0]
140107988: movups    xmmword ptr [rsp + 0x188], xmm0
140107990: movups    xmm0, xmmword ptr [rip + 0x5cce4a1]
140107997: movups    xmmword ptr [rsp + 0x198], xmm0
14010799f: movups    xmm0, xmmword ptr [rip + 0x5cce4a2]
1401079a6: movups    xmmword ptr [rsp + 0x1a8], xmm0
1401079ae: movups    xmm0, xmmword ptr [rip + 0x5cce4a3]
1401079b5: movups    xmmword ptr [rsp + 0x1b8], xmm0
1401079bd: movaps    xmm0, xmmword ptr [rip + 0x5c95b4c]
1401079c4: movups    xmmword ptr [rsp + 0x1c8], xmm0
1401079cc: mov       dword ptr [rsp + 0x1d8], 1
1401079d7: mov       qword ptr [rsp + 0x1dc], 0
1401079e3: mov       byte ptr [rsp + 0x1e4], 1
1401079eb: mov       qword ptr [rsp + 0x1e8], 0
1401079f7: mov       dword ptr [rsp + 0x1f0], 0x3f800000
140107a02: mov       word ptr [rsp + 0x1f4], 0
140107a0c: mov       word ptr [rsp + 0x1fa], 0
140107a16: mov       dword ptr [rsp + 0x1f6], 0x10000
140107a21: mov       word ptr [rsp + 0x200], 0
140107a2b: mov       dword ptr [rsp + 0x1fc], 0x10000
140107a36: mov       dword ptr [rsp + 0x202], 0
140107a41: mov       byte ptr [rsp + 0x206], 1
140107a49: mov       dword ptr [rsp + 0x207], 0
140107a54: mov       dword ptr [rsp + 0x20a], 0
140107a5f: mov       qword ptr [rsp + 0x88], rax
140107a67: lea       r9, [rip + 0x5ccd9c2]
140107a6e: lea       r14, [rsp + 0x210]
140107a76: lea       r8, [rsp + 0x88]
140107a7e: mov       rcx, r14
140107a81: call      0x1401de510
140107a86: movups    xmm0, xmmword ptr [rbx + 0x30]
140107a8a: movups    xmmword ptr [rsp + 0x88], xmm0
140107a92: mov       qword ptr [rsp + 0x98], r15
140107a9a: mov       qword ptr [rsp + 0xa0], rdi
140107aa2: mov       qword ptr [rsp + 0xa8], rsi
140107aaa: lea       rdx, [rsp + 0x88]
140107ab2: mov       rcx, r14
140107ab5: call      0x140269d70
140107aba: nop
140107abb: add       rsp, 0x240
140107ac2: pop       rbx
140107ac3: pop       rdi
140107ac4: pop       rsi
140107ac5: pop       r14
140107ac7: pop       r15
140107ac9: ret
