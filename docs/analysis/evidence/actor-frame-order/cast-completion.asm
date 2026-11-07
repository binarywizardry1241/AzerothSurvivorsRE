14597babf: 498b8760040000 mov rax, qword ptr [r15 + 0x460]
14597bac6: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
14597bacd: 48898508020000 mov qword ptr [rbp + 0x208], rax
14597bad4: c7850002000000000000 mov dword ptr [rbp + 0x200], 0
14597bade: c7854002000000000000 mov dword ptr [rbp + 0x240], 0
14597bae8: 488d8540020000 lea rax, [rbp + 0x240]
14597baef: 4889442430 mov qword ptr [rsp + 0x30], rax
14597baf4: 488d8500020000 lea rax, [rbp + 0x200]
14597bafb: 4889442428 mov qword ptr [rsp + 0x28], rax
14597bb00: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14597bb09: 488d8d60020000 lea rcx, [rbp + 0x260]
14597bb10: 4889fa mov rdx, rdi
14597bb13: 4589e8 mov r8d, r13d
14597bb16: 4c8d8da8010000 lea r9, [rbp + 0x1a8]
14597bb1d: e84e1cf5ff call 0x1458cd770
14597bb22: 90 nop 
14597bb23: 498bb728060000 mov rsi, qword ptr [r15 + 0x628]
14597bb2a: 493bb718060000 cmp rsi, qword ptr [r15 + 0x618]
14597bb31: 750d jne 0x14597bb40
14597bb33: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14597bb3a: e8d1f22700 call 0x145bfae10
14597bb3f: 90 nop 
14597bb40: 498b8720060000 mov rax, qword ptr [r15 + 0x620]
14597bb47: 4889f1 mov rcx, rsi
14597bb4a: 48c1e105 shl rcx, 5
14597bb4e: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
14597bb55: 0f108d70020000 movups xmm1, xmmword ptr [rbp + 0x270]
14597bb5c: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14597bb61: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14597bb65: 48ffc6 inc rsi
14597bb68: 4989b728060000 mov qword ptr [r15 + 0x628], rsi
14597bb6f: 4489e9 mov ecx, r13d
14597bb72: e8e92e0200 call 0x14599ea60
14597bb77: 450f57ed xorps xmm13, xmm13
14597bb7b: 410f2ec5 ucomiss xmm0, xmm13
14597bb7f: 7629 jbe 0x14597bbaa
14597bb81: f2410f108fc8040000 movsd xmm1, qword ptr [r15 + 0x4c8]
14597bb8a: 440f5ce1 subps xmm12, xmm1
14597bb8e: 450f59e4 mulps xmm12, xmm12
14597bb92: f3410f16cc movshdup xmm1, xmm12
14597bb97: f3410f58cc addss xmm1, xmm12
14597bb9c: 450f57ed xorps xmm13, xmm13
14597bba0: f3440f51e9 sqrtss xmm13, xmm1
14597bba5: f3440f5ee8 divss xmm13, xmm0
14597bbaa: 4d8ba760040000 mov r12, qword ptr [r15 + 0x460]
14597bbb1: 498bb7e0050000 mov rsi, qword ptr [r15 + 0x5e0]
14597bbb8: 493bb7d0050000 cmp rsi, qword ptr [r15 + 0x5d0]
14597bbbf: 750d jne 0x14597bbce
14597bbc1: 488b8df0020000 mov rcx, qword ptr [rbp + 0x2f0]
14597bbc8: e863f12700 call 0x145bfad30
14597bbcd: 90 nop 
14597bbce: f3440f58ee addss xmm13, xmm6
14597bbd3: 498b87d8050000 mov rax, qword ptr [r15 + 0x5d8]
14597bbda: 4889f1 mov rcx, rsi
14597bbdd: 48c1e107 shl rcx, 7
14597bbe1: 48c7040800000000 mov qword ptr [rax + rcx], 0
14597bbe9: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
14597bbf1: c644084802 mov byte ptr [rax + rcx + 0x48], 2
14597bbf6: 4c89640850 mov qword ptr [rax + rcx + 0x50], r12
14597bbfb: 48897c0858 mov qword ptr [rax + rcx + 0x58], rdi
14597bc00: c744086000000000 mov dword ptr [rax + rcx + 0x60], 0
14597bc08: f3440f116c086c movss dword ptr [rax + rcx + 0x6c], xmm13
14597bc0f: 44896c0870 mov dword ptr [rax + rcx + 0x70], r13d
14597bc14: f3440f115c0874 movss dword ptr [rax + rcx + 0x74], xmm11
14597bc1b: c744087800010005 mov dword ptr [rax + rcx + 0x78], 0x5000100
14597bc23: 48ffc6 inc rsi
14597bc26: 4989b7e0050000 mov qword ptr [r15 + 0x5e0], rsi
14597bc2d: 4c89f0 mov rax, r14
14597bc30: e93dfdffff jmp 0x14597b972
