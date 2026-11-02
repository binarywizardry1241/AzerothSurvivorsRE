145b7d08d: 3c01 cmp al, 1
145b7d08f: 4c89a570130000 mov qword ptr [rbp + 0x1370], r12
145b7d096: 0f85ad2e0000 jne 0x145b7ff49
145b7d09c: f3410f108424dc0b0000 movss xmm0, dword ptr [r12 + 0xbdc]
145b7d0a6: f30f58c6 addss xmm0, xmm6
145b7d0aa: f3410f118424dc0b0000 movss dword ptr [r12 + 0xbdc], xmm0
145b7d0b4: 4c89e1 mov rcx, r12
145b7d0b7: e884870000 call 0x145b85840
145b7d0bc: 498bbc2498090000 mov rdi, qword ptr [r12 + 0x998]
145b7d0c4: 488d34fd08000000 lea rsi, [rdi*8 + 8]
145b7d0cc: e82f5148fa call 0x140002200
145b7d0d1: ba04000000 mov edx, 4
145b7d0d6: 4889f1 mov rcx, rsi
145b7d0d9: e8e25048fa call 0x1400021c0
145b7d0de: 4885c0 test rax, rax
145b7d0e1: 0f8403430000 je 0x145b813ea
145b7d0e7: 488d4f01 lea rcx, [rdi + 1]
145b7d0eb: 48894da0 mov qword ptr [rbp - 0x60], rcx
145b7d0ef: 488945a8 mov qword ptr [rbp - 0x58], rax
145b7d0f3: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
145b7d0fb: 4180bc24770c000000 cmp byte ptr [r12 + 0xc77], 0
145b7d104: 0f8556030000 jne 0x145b7d460
145b7d10a: 4d8b842450030000 mov r8, qword ptr [r12 + 0x350]
145b7d112: 4d8b8c2458030000 mov r9, qword ptr [r12 + 0x358]
145b7d11a: 4d6bd158 imul r10, r9, 0x58
145b7d11e: 4d85c9 test r9, r9
145b7d121: 743c je 0x145b7d15f
145b7d123: 418b7008 mov esi, dword ptr [r8 + 8]
145b7d127: 4983f901 cmp r9, 1
145b7d12b: 0f84c4010000 je 0x145b7d2f5
145b7d131: 4989c3 mov r11, rax
145b7d134: 498d4aa8 lea rcx, [r10 - 0x58]
145b7d138: 48baa38b2ebae8a28b2e movabs rdx, 0x2e8ba2e8ba2e8ba3
145b7d142: 4889c8 mov rax, rcx
145b7d145: 48f7e2 mul rdx
145b7d148: 48c1ea04 shr rdx, 4
145b7d14c: 4881f9c0020000 cmp rcx, 0x2c0
145b7d153: 732a jae 0x145b7d17f
145b7d155: 31c9 xor ecx, ecx
145b7d157: 4c89d8 mov rax, r11
145b7d15a: e964010000 jmp 0x145b7d2c3
145b7d15f: 410fb68c243c030000 movzx ecx, byte ptr [r12 + 0x33c]
145b7d168: 4531db xor r11d, r11d
145b7d16b: 4c89c3 mov rbx, r8
145b7d16e: 4d01d0 add r8, r10
145b7d171: 4c39c3 cmp rbx, r8
145b7d174: 0f85b4010000 jne 0x145b7d32e
145b7d17a: e9d6010000 jmp 0x145b7d355
145b7d17f: 4889d1 mov rcx, rdx
145b7d182: 4883e1f8 and rcx, 0xfffffffffffffff8
145b7d186: 660f6ec6 movd xmm0, esi
145b7d18a: 660f70c800 pshufd xmm1, xmm0, 0
145b7d18f: 498d80c8020000 lea rax, [r8 + 0x2c8]
145b7d196: 660f6f0582795f00 movdqa xmm0, xmmword ptr [rip + 0x5f7982]
145b7d19e: 4889ce mov rsi, rcx
145b7d1a1: 660f6fd1 movdqa xmm2, xmm1
145b7d1a5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7d1b0: 660f6e98a0feffff movd xmm3, dword ptr [rax - 0x160]
145b7d1b8: 660f6ea048feffff movd xmm4, dword ptr [rax - 0x1b8]
145b7d1c0: 660f62e3 punpckldq xmm4, xmm3
145b7d1c4: 660f6e98f0fdffff movd xmm3, dword ptr [rax - 0x210]
145b7d1cc: 660f6ea898fdffff movd xmm5, dword ptr [rax - 0x268]
145b7d1d4: 660f62eb punpckldq xmm5, xmm3
145b7d1d8: 660f6cec punpcklqdq xmm5, xmm4
145b7d1dc: 660f6e18 movd xmm3, dword ptr [rax]
145b7d1e0: 660f6e60a8 movd xmm4, dword ptr [rax - 0x58]
145b7d1e5: 660f62e3 punpckldq xmm4, xmm3
145b7d1e9: 660f6e9850ffffff movd xmm3, dword ptr [rax - 0xb0]
145b7d1f1: 660f6eb8f8feffff movd xmm7, dword ptr [rax - 0x108]
145b7d1f9: 660f62fb punpckldq xmm7, xmm3
145b7d1fd: 660f6cfc punpcklqdq xmm7, xmm4
145b7d201: 660f6fdd movdqa xmm3, xmm5
145b7d205: 660fefd8 pxor xmm3, xmm0
145b7d209: 660f6fe1 movdqa xmm4, xmm1
145b7d20d: 660fefc8 pxor xmm1, xmm0
145b7d211: 660f66cb pcmpgtd xmm1, xmm3
145b7d215: 660fdbe1 pand xmm4, xmm1
145b7d219: 660fdfcd pandn xmm1, xmm5
145b7d21d: 660febcc por xmm1, xmm4
145b7d221: 660f6fdf movdqa xmm3, xmm7
145b7d225: 660fefd8 pxor xmm3, xmm0
145b7d229: 660f6fe2 movdqa xmm4, xmm2
145b7d22d: 660fefd0 pxor xmm2, xmm0
145b7d231: 660f66d3 pcmpgtd xmm2, xmm3
145b7d235: 660fdbe2 pand xmm4, xmm2
145b7d239: 660fdfd7 pandn xmm2, xmm7
145b7d23d: 660febd4 por xmm2, xmm4
145b7d241: 4805c0020000 add rax, 0x2c0
145b7d247: 4883c6f8 add rsi, -8
145b7d24b: 0f855fffffff jne 0x145b7d1b0
145b7d251: 660f6fda movdqa xmm3, xmm2
145b7d255: 660fefd8 pxor xmm3, xmm0
145b7d259: 660f6fe1 movdqa xmm4, xmm1
145b7d25d: 660fefe0 pxor xmm4, xmm0
145b7d261: 660f66e3 pcmpgtd xmm4, xmm3
145b7d265: 660fdbcc pand xmm1, xmm4
145b7d269: 660fdfe2 pandn xmm4, xmm2
145b7d26d: 660febe1 por xmm4, xmm1
145b7d271: 660f70ccee pshufd xmm1, xmm4, 0xee
145b7d276: 660f6fd4 movdqa xmm2, xmm4
145b7d27a: 660fefd0 pxor xmm2, xmm0
145b7d27e: 660f6fd9 movdqa xmm3, xmm1
145b7d282: 660fefd8 pxor xmm3, xmm0
145b7d286: 660f66d3 pcmpgtd xmm2, xmm3
145b7d28a: 660fdbe2 pand xmm4, xmm2
145b7d28e: 660fdfd1 pandn xmm2, xmm1
145b7d292: 660febd4 por xmm2, xmm4
145b7d296: 660f70ca55 pshufd xmm1, xmm2, 0x55
145b7d29b: 660f6fda movdqa xmm3, xmm2
145b7d29f: 660fefd8 pxor xmm3, xmm0
145b7d2a3: 660fefc1 pxor xmm0, xmm1
145b7d2a7: 660f66d8 pcmpgtd xmm3, xmm0
145b7d2ab: 660fdbd3 pand xmm2, xmm3
145b7d2af: 660fdfd9 pandn xmm3, xmm1
145b7d2b3: 660febda por xmm3, xmm2
145b7d2b7: 660f7ede movd esi, xmm3
145b7d2bb: 4839ca cmp rdx, rcx
145b7d2be: 4c89d8 mov rax, r11
145b7d2c1: 7432 je 0x145b7d2f5
145b7d2c3: 4829ca sub rdx, rcx
145b7d2c6: 486bc958 imul rcx, rcx, 0x58
145b7d2ca: 4c01c1 add rcx, r8
145b7d2cd: 4883c160 add rcx, 0x60
145b7d2d1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7d2e0: 4189f3 mov r11d, esi
145b7d2e3: 8b31 mov esi, dword ptr [rcx]
145b7d2e5: 4139f3 cmp r11d, esi
145b7d2e8: 410f47f3 cmova esi, r11d
145b7d2ec: 4883c158 add rcx, 0x58
145b7d2f0: 48ffca dec rdx
145b7d2f3: 75eb jne 0x145b7d2e0
145b7d2f5: 410fb68c243c030000 movzx ecx, byte ptr [r12 + 0x33c]
145b7d2fe: 31d2 xor edx, edx
145b7d300: 4c89d3 mov rbx, r10
145b7d303: 4d89c3 mov r11, r8
145b7d306: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7d310: 41397308 cmp dword ptr [r11 + 8], esi
145b7d314: 740c je 0x145b7d322
145b7d316: 4983c358 add r11, 0x58
145b7d31a: 4883c3a8 add rbx, -0x58
145b7d31e: 75f0 jne 0x145b7d310
145b7d320: eb42 jmp 0x145b7d364
145b7d322: 498d5b58 lea rbx, [r11 + 0x58]
145b7d326: 4d01d0 add r8, r10
145b7d329: 4c39c3 cmp rbx, r8
145b7d32c: 7427 je 0x145b7d355
145b7d32e: 31d2 xor edx, edx
145b7d330: eb17 jmp 0x145b7d349
145b7d332: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7d340: 4883c358 add rbx, 0x58
145b7d344: 4c39c3 cmp rbx, r8
145b7d347: 740c je 0x145b7d355
145b7d349: 4d85c9 test r9, r9
145b7d34c: 74f2 je 0x145b7d340
145b7d34e: 397308 cmp dword ptr [rbx + 8], esi
145b7d351: 75ed jne 0x145b7d340
145b7d353: eb0f jmp 0x145b7d364
145b7d355: 4d85db test r11, r11
145b7d358: 0f84cc000000 je 0x145b7d42a
145b7d35e: 498b13 mov rdx, qword ptr [r11]
145b7d361: 8b5240 mov edx, dword ptr [rdx + 0x40]
145b7d364: 4d8b8424d8010000 mov r8, qword ptr [r12 + 0x1d8]
145b7d36c: 4d85c0 test r8, r8
145b7d36f: 0f84c8000000 je 0x145b7d43d
145b7d375: 4d8b8c24d0010000 mov r9, qword ptr [r12 + 0x1d0]
145b7d37d: 49c1e004 shl r8, 4
145b7d381: 4531d2 xor r10d, r10d
145b7d384: eb13 jmp 0x145b7d399
145b7d386: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7d390: 4983c210 add r10, 0x10
145b7d394: 4d39d0 cmp r8, r10
145b7d397: 7435 je 0x145b7d3ce
145b7d399: 4f8b1c11 mov r11, qword ptr [r9 + r10]
145b7d39d: 49837b380b cmp qword ptr [r11 + 0x38], 0xb
145b7d3a2: 75ec jne 0x145b7d390
145b7d3a4: 4d8b5b30 mov r11, qword ptr [r11 + 0x30]
145b7d3a8: 498b33 mov rsi, qword ptr [r11]
145b7d3ab: 4833353a94a401 xor rsi, qword ptr [rip + 0x1a4943a]
145b7d3b2: 4d8b5b03 mov r11, qword ptr [r11 + 3]
145b7d3b6: 4c331d3294a401 xor r11, qword ptr [rip + 0x1a49432]
145b7d3bd: 4909f3 or r11, rsi
145b7d3c0: 75ce jne 0x145b7d390
145b7d3c2: 43807c110800 cmp byte ptr [r9 + r10 + 8], 0
145b7d3c8: 410f95c2 setne r10b
145b7d3cc: eb03 jmp 0x145b7d3d1
145b7d3ce: 4531d2 xor r10d, r10d
145b7d3d1: 4531db xor r11d, r11d
145b7d3d4: eb13 jmp 0x145b7d3e9
145b7d3d6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b7d3e0: 4983c310 add r11, 0x10
145b7d3e4: 4d39d8 cmp r8, r11
145b7d3e7: 7457 je 0x145b7d440
145b7d3e9: 4b8b3419 mov rsi, qword ptr [r9 + r11]
145b7d3ed: 48837e380a cmp qword ptr [rsi + 0x38], 0xa
145b7d3f2: 75ec jne 0x145b7d3e0
145b7d3f4: 488b7630 mov rsi, qword ptr [rsi + 0x30]
145b7d3f8: 488b1e mov rbx, qword ptr [rsi]
145b7d3fb: 48331d1597a401 xor rbx, qword ptr [rip + 0x1a49715]
145b7d402: 0fb77608 movzx esi, word ptr [rsi + 8]
145b7d406: 6633351297a401 xor si, word ptr [rip + 0x1a49712]
145b7d40d: 0fb7f6 movzx esi, si
145b7d410: 4809de or rsi, rbx
145b7d413: 75cb jne 0x145b7d3e0
145b7d415: 43807c190800 cmp byte ptr [r9 + r11 + 8], 0
145b7d41b: 410f95c0 setne r8b
145b7d41f: 4500c0 add r8b, r8b
145b7d422: 4508d0 or r8b, r10b
145b7d425: 4589c2 mov r10d, r8d
145b7d428: eb16 jmp 0x145b7d440
145b7d42a: 31d2 xor edx, edx
145b7d42c: 4d8b8424d8010000 mov r8, qword ptr [r12 + 0x1d8]
145b7d434: 4d85c0 test r8, r8
145b7d437: 0f8538ffffff jne 0x145b7d375
145b7d43d: 4531d2 xor r10d, r10d
145b7d440: 450fb6c2 movzx r8d, r10b
145b7d444: 49c1e028 shl r8, 0x28
145b7d448: 0fb6c9 movzx ecx, cl
145b7d44b: 48c1e120 shl rcx, 0x20
145b7d44f: 4c09c1 or rcx, r8
145b7d452: 4809d1 or rcx, rdx
145b7d455: 488908 mov qword ptr [rax], rcx
145b7d458: 48c745b001000000 mov qword ptr [rbp - 0x50], 1
145b7d460: 498b842490090000 mov rax, qword ptr [r12 + 0x990]
145b7d468: 4869cf90090000 imul rcx, rdi, 0x990
145b7d46f: 4801c1 add rcx, rax
145b7d472: 48898530090000 mov qword ptr [rbp + 0x930], rax
145b7d479: 48898d38090000 mov qword ptr [rbp + 0x938], rcx
145b7d480: 488d857f130000 lea rax, [rbp + 0x137f]
145b7d487: 48898540090000 mov qword ptr [rbp + 0x940], rax
145b7d48e: 488d4da0 lea rcx, [rbp - 0x60]
145b7d492: 488d9530090000 lea rdx, [rbp + 0x930]
145b7d499: e8624b0a00 call 0x145c22000
145b7d49e: 90 nop
145b7d49f: 488b45b0 mov rax, qword ptr [rbp - 0x50]
145b7d4a3: 48898540090000 mov qword ptr [rbp + 0x940], rax
145b7d4aa: 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
145b7d4ae: 0f298530090000 movaps xmmword ptr [rbp + 0x930], xmm0
145b7d4b5: 498db424900a0000 lea rsi, [r12 + 0xa90]
145b7d4bd: 498b9424900a0000 mov rdx, qword ptr [r12 + 0xa90]
145b7d4c5: 4885d2 test rdx, rdx
145b7d4c8: 7417 je 0x145b7d4e1
145b7d4ca: 498b8c24980a0000 mov rcx, qword ptr [r12 + 0xa98]
145b7d4d2: 48c1e203 shl rdx, 3
145b7d4d6: 41b804000000 mov r8d, 4
145b7d4dc: e8ef4c48fa call 0x1400021d0
145b7d4e1: 488b8540090000 mov rax, qword ptr [rbp + 0x940]
145b7d4e8: 48894610 mov qword ptr [rsi + 0x10], rax
145b7d4ec: 0f288530090000 movaps xmm0, xmmword ptr [rbp + 0x930]
145b7d4f3: 0f1106 movups xmmword ptr [rsi], xmm0
