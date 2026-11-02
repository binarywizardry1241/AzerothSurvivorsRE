14019c680: push      rbp
14019c681: push      r15
14019c683: push      r14
14019c685: push      r13
14019c687: push      r12
14019c689: push      rsi
14019c68a: push      rdi
14019c68b: push      rbx
14019c68c: sub       rsp, 0xbf8
14019c693: lea       rbp, [rsp + 0x80]
14019c69b: mov       qword ptr [rbp + 0xb70], 0xfffffffffffffffe
14019c6a6: mov       rbx, r8
14019c6a9: mov       rdi, rdx
14019c6ac: mov       rsi, rcx
14019c6af: cmp       qword ptr [rdx + 0x40], -1
14019c6b4: je        0x14019c707
14019c6b6: mov       rax, qword ptr [rbx + 0x5a0]
14019c6bd: mov       qword ptr [rbp + 0x580], rax
14019c6c4: cmp       qword ptr [rdi + 0x5d8], rax
14019c6cb: je        0x14019c87d
14019c6d1: add       rdi, 0x5d8
14019c6d8: lea       rax, [rip + 0x5c4a971]
14019c6df: mov       qword ptr [rsp + 0x28], rax
14019c6e4: mov       qword ptr [rsp + 0x20], 0x83
14019c6ed: lea       r9, [rip + 0x5c4a914]
14019c6f4: lea       r8, [rbp + 0x580]
14019c6fb: xor       ecx, ecx
14019c6fd: mov       rdx, rdi
14019c700: call      0x145d4891d
14019c705: ud2
14019c707: lea       rcx, [rbp + 0xf0]
14019c70e: mov       rdx, rbx
14019c711: call      0x1403a7150
14019c716: nop
14019c717: lea       rcx, [rbp - 0x48]
14019c71b: mov       rdx, rbx
14019c71e: call      0x14039b900
14019c723: nop
14019c724: lea       rcx, [rbp + 0x468]
14019c72b: mov       rdx, rbx
14019c72e: call      0x140396560
14019c733: nop
14019c734: lea       rcx, [rbp + 0x220]
14019c73b: mov       rdx, rbx
14019c73e: call      0x14039d0b0
14019c743: nop
14019c744: lea       rcx, [rbp + 0x348]
14019c74b: mov       rdx, rbx
14019c74e: call      0x140393600
14019c753: nop
14019c754: mov       rcx, rbx
14019c757: call      0x1400321f0
14019c75c: nop
14019c75d: mov       r14, rax
14019c760: lea       rax, [rbx + 0x40]
14019c764: lea       rcx, [rbx + 0x5a8]
14019c76b: mov       qword ptr [rbp + 0xb60], rax
14019c772: mov       qword ptr [rbp + 0xb68], rcx
14019c779: mov       qword ptr [rbp + 0xb48], 0
14019c784: mov       qword ptr [rbp + 0xb50], 8
14019c78f: mov       qword ptr [rbp + 0xb58], 0
14019c79a: lea       rdx, [rip + 0x5c01e2f]
14019c7a1: lea       rcx, [rbp + 0xb48]
14019c7a8: call      0x140007240
14019c7ad: nop
14019c7ae: mov       r15, rax
14019c7b1: mov       rdx, qword ptr [rbp + 0xb48]
14019c7b8: test      rdx, rdx
14019c7bb: je        0x14019c7d3
14019c7bd: mov       rcx, qword ptr [rbp + 0xb50]
14019c7c4: shl       rdx, 3
14019c7c8: mov       r8d, 8
14019c7ce: call      0x1400021d0
14019c7d3: lea       rcx, [rbp + 0x6b8]
14019c7da: lea       rdx, [rbp + 0xf0]
14019c7e1: mov       r8d, 0x130
14019c7e7: call      0x145bfa0e7
14019c7ec: lea       r12, [rbp + 0x580]
14019c7f3: lea       rdx, [rbp - 0x48]
14019c7f7: mov       r8d, 0x138
14019c7fd: mov       rcx, r12
14019c800: call      0x145bfa0e7
14019c805: lea       rcx, [rbp + 0x7e8]
14019c80c: lea       rdx, [rbp + 0x468]
14019c813: mov       r8d, 0x118
14019c819: call      0x145bfa0e7
14019c81e: lea       rcx, [rbp + 0x900]
14019c825: lea       rdx, [rbp + 0x220]
14019c82c: mov       r8d, 0x128
14019c832: call      0x145bfa0e7
14019c837: lea       rcx, [rbp + 0xa28]
14019c83e: lea       rdx, [rbp + 0x348]
14019c845: mov       r8d, 0x120
14019c84b: call      0x145bfa0e7
14019c850: mov       r13, qword ptr [rbx + 0x5a0]
14019c857: mov       r8d, 0x5c8
14019c85d: mov       rcx, rdi
14019c860: mov       rdx, r12
14019c863: call      0x145bfa0e7
14019c868: mov       qword ptr [rdi + 0x5c8], r14
14019c86f: mov       qword ptr [rdi + 0x5d0], r15
14019c876: mov       qword ptr [rdi + 0x5d8], r13
14019c87d: mov       eax, 0x3dcc5000
14019c882: add       eax, dword ptr [rbx + 0x5b0]
14019c888: lea       rdx, [rdi + 0x5e0]
14019c88f: mov       dword ptr [rdi + 0x5e0], eax
14019c895: mov       qword ptr [rbp + 0x598], 0x10
14019c8a0: xorps     xmm0, xmm0
14019c8a3: movups    xmmword ptr [rbp + 0x5a0], xmm0
14019c8aa: mov       qword ptr [rbp + 0x5b0], 0x10
14019c8b5: movups    xmmword ptr [rbp + 0x5b8], xmm0
14019c8bc: mov       qword ptr [rbp + 0x5c8], 0x10
14019c8c7: movups    xmmword ptr [rbp + 0x5d0], xmm0
14019c8ce: mov       qword ptr [rbp + 0x5e0], 0x10
14019c8d9: movups    xmmword ptr [rbp + 0x5e8], xmm0
14019c8e0: mov       qword ptr [rbp + 0x5f8], 0x10
14019c8eb: mov       qword ptr [rbp + 0x580], 0
14019c8f6: movups    xmmword ptr [rbp + 0x600], xmm0
14019c8fd: mov       dword ptr [rbp + 0x610], 0
14019c907: mov       qword ptr [rbp + 0x588], 8
14019c912: mov       qword ptr [rbp + 0x590], 0
14019c91d: lea       r8, [rbp + 0x580]
14019c924: mov       rcx, rdi
14019c927: mov       r9, rbx
14019c92a: call      0x1403b3e00
14019c92f: nop
14019c930: lea       rdx, [rbp + 0x580]
14019c937: mov       r8d, 0x98
14019c93d: mov       rcx, rsi
14019c940: call      0x145bfa0e7
14019c945: mov       rax, rsi
14019c948: add       rsp, 0xbf8
14019c94f: pop       rbx
14019c950: pop       rdi
14019c951: pop       rsi
14019c952: pop       r12
14019c954: pop       r13
14019c956: pop       r14
14019c958: pop       r15
14019c95a: pop       rbp
14019c95b: ret
