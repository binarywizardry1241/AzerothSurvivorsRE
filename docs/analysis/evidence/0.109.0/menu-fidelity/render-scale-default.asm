140beb6a0: push      rbp
140beb6a1: push      rsi
140beb6a2: sub       rsp, 0x78
140beb6a6: lea       rbp, [rsp + 0x70]
140beb6ab: movaps    xmmword ptr [rbp - 0x10], xmm6
140beb6af: mov       qword ptr [rbp - 0x18], 0xfffffffffffffffe
140beb6b7: lea       rdx, [rip + 0x53ae6e2]
140beb6be: lea       rcx, [rbp - 0x48]
140beb6c2: mov       r8d, 0x10
140beb6c8: call      0x145bbd970
140beb6cd: mov       rdx, qword ptr [rbp - 0x48]
140beb6d1: cmp       rdx, -2
140beb6d5: je        0x140beb707
140beb6d7: cmp       rdx, -1
140beb6db: je        0x140beb6f1
140beb6dd: test      rdx, rdx
140beb6e0: je        0x140beb6f1
140beb6e2: mov       rcx, qword ptr [rbp - 0x40]
140beb6e6: mov       r8d, 1
140beb6ec: call      0x1400021d0
140beb6f1: movss     xmm6, dword ptr [rip + 0x51b1ba7]
140beb6f9: movaps    xmm0, xmm6
140beb6fc: movaps    xmm6, xmmword ptr [rbp - 0x10]
140beb700: add       rsp, 0x78
140beb704: pop       rsi
140beb705: pop       rbp
140beb706: ret
140beb707: mov       rax, qword ptr [rbp - 0x40]
140beb70b: movss     xmm6, dword ptr [rip + 0x51b1b8d]
140beb713: cmp       rax, -1
140beb717: je        0x140beb6f9
140beb719: mov       qword ptr [rbp - 0x20], rax
140beb71d: mov       rcx, qword ptr [rbp - 0x38]
140beb721: mov       rdx, qword ptr [rbp - 0x30]
140beb725: mov       qword ptr [rbp - 0x28], rcx
140beb729: call      0x145bdb8d0
140beb72e: nop
140beb72f: mov       rsi, rax
140beb732: mov       rdx, qword ptr [rbp - 0x20]
140beb736: test      rdx, rdx
140beb739: je        0x140beb74a
140beb73b: mov       r8d, 1
140beb741: mov       rcx, qword ptr [rbp - 0x28]
140beb745: call      0x1400021d0
140beb74a: test      sil, 1
140beb74e: jne       0x140beb6f9
140beb750: shr       rsi, 0x20
140beb754: mov       eax, esi
140beb756: and       eax, 0x7fffffff
140beb75b: cmp       eax, 0x7f7fffff
140beb760: jg        0x140beb6f9
140beb762: movd      xmm0, esi
140beb766: movss     xmm1, dword ptr [rip + 0x51e1716]
140beb76e: maxss     xmm1, xmm0
140beb772: movss     xmm6, dword ptr [rip + 0x51b1d4e]
140beb77a: minss     xmm6, xmm1
140beb77e: jmp       0x140beb6f9
