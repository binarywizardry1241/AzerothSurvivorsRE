0x145bd5590: 4885d2                   test rdx, rdx
0x145bd5593: 7410                     je 0x145bd55a5
0x145bd5595: 4883fa04                 cmp rdx, 4
0x145bd5599: 730d                     jae 0x145bd55a8
0x145bd559b: 4531c0                   xor r8d, r8d
0x145bd559e: 31c0                     xor eax, eax
0x145bd55a0: e991000000               jmp 0x145bd5636
0x145bd55a5: 31c0                     xor eax, eax
0x145bd55a7: c3                       ret
0x145bd55a8: 49b8fcffffffffffff7f     movabs r8, 0x7ffffffffffffffc
0x145bd55b2: 4921d0                   and r8, rdx
0x145bd55b5: 660fefc0                 pxor xmm0, xmm0
0x145bd55b9: 31c0                     xor eax, eax
0x145bd55bb: 660f6f0ded676901         movdqa xmm1, xmmword ptr [rip + 0x16967ed]
0x145bd55c3: 660f6f1d957e1c00         movdqa xmm3, xmmword ptr [rip + 0x1c7e95]
0x145bd55cb: 660fefd2                 pxor xmm2, xmm2
0x145bd55cf: 90                       nop
0x145bd55d0: 440fb70c01               movzx r9d, word ptr [rcx + rax]
0x145bd55d5: 66410f6ee1               movd xmm4, r9d
0x145bd55da: 440fb74c0102             movzx r9d, word ptr [rcx + rax + 2]
0x145bd55e0: 66410f6ee9               movd xmm5, r9d
0x145bd55e5: 660f64e1                 pcmpgtb xmm4, xmm1
0x145bd55e9: 660f60e4                 punpcklbw xmm4, xmm4
0x145bd55ed: f20f70e4d4               pshuflw xmm4, xmm4, 0xd4
0x145bd55f2: 660f70e4d4               pshufd xmm4, xmm4, 0xd4
0x145bd55f7: 660fdbe3                 pand xmm4, xmm3
0x145bd55fb: 660fd4d4                 paddq xmm2, xmm4
0x145bd55ff: 660f64e9                 pcmpgtb xmm5, xmm1
0x145bd5603: 660f60ed                 punpcklbw xmm5, xmm5
0x145bd5607: f20f70e5d4               pshuflw xmm4, xmm5, 0xd4
0x145bd560c: 660f70e4d4               pshufd xmm4, xmm4, 0xd4
0x145bd5611: 660fdbe3                 pand xmm4, xmm3
0x145bd5615: 660fd4c4                 paddq xmm0, xmm4
0x145bd5619: 4883c004                 add rax, 4
0x145bd561d: 4939c0                   cmp r8, rax
0x145bd5620: 75ae                     jne 0x145bd55d0
0x145bd5622: 660fd4c2                 paddq xmm0, xmm2
0x145bd5626: 660f70c8ee               pshufd xmm1, xmm0, 0xee
0x145bd562b: 660fd4c8                 paddq xmm1, xmm0
0x145bd562f: 66480f7ec8               movq rax, xmm1
0x145bd5634: eb12                     jmp 0x145bd5648
0x145bd5636: 4531c9                   xor r9d, r9d
0x145bd5639: 42803c01c0               cmp byte ptr [rcx + r8], 0xc0
0x145bd563e: 410f9dc1                 setge r9b
0x145bd5642: 4c01c8                   add rax, r9
0x145bd5645: 49ffc0                   inc r8
0x145bd5648: 4c39c2                   cmp rdx, r8
0x145bd564b: 75e9                     jne 0x145bd5636
0x145bd564d: c3                       ret
