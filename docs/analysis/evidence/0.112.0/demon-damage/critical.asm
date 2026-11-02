0x14595c200: 4156 push r14
0x14595c202: 56 push rsi
0x14595c203: 57 push rdi
0x14595c204: 53 push rbx
0x14595c205: 4883ec48 sub rsp, 0x48
0x14595c209: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
0x14595c20e: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
0x14595c213: 488b81d8000000 mov rax, qword ptr [rcx + 0xd8]
0x14595c21a: 4839c2 cmp rdx, rax
0x14595c21d: 0f83ed050000 jae 0x14595c810
0x14595c223: 4c8b91d0000000 mov r10, qword ptr [rcx + 0xd0]
0x14595c22a: 48c1e207 shl rdx, 7
0x14595c22e: 488b81f8070000 mov rax, qword ptr [rcx + 0x7f8]
0x14595c235: 4c8b8100080000 mov r8, qword ptr [rcx + 0x800]
0x14595c23c: 4d85c0 test r8, r8
0x14595c23f: 7413 je 0x14595c254
0x14595c241: 4983f801 cmp r8, 1
0x14595c245: 7517 jne 0x14595c25e
0x14595c247: f30f101d91124500 movss xmm3, dword ptr [rip + 0x451291]
0x14595c24f: 4531db xor r11d, r11d
0x14595c252: eb6a jmp 0x14595c2be
0x14595c254: f30f101d04104500 movss xmm3, dword ptr [rip + 0x451004]
0x14595c25c: eb76 jmp 0x14595c2d4
0x14595c25e: 4c89c6 mov rsi, r8
0x14595c261: 4883e6fe and rsi, 0xfffffffffffffffe
0x14595c265: f30f101d73124500 movss xmm3, dword ptr [rip + 0x451273]
0x14595c26d: 4531db xor r11d, r11d
0x14595c270: eb17 jmp 0x14595c289
0x14595c272: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14595c280: 4983c302 add r11, 2
0x14595c284: 4c39de cmp rsi, r11
0x14595c287: 742f je 0x14595c2b8
0x14595c289: 42803cd811 cmp byte ptr [rax + r11*8], 0x11
0x14595c28e: 7410 je 0x14595c2a0
0x14595c290: 42807cd80811 cmp byte ptr [rax + r11*8 + 8], 0x11
0x14595c296: 75e8 jne 0x14595c280
0x14595c298: eb15 jmp 0x14595c2af
0x14595c29a: 660f1f440000 nop word ptr [rax + rax]
0x14595c2a0: f3420f585cd804 addss xmm3, dword ptr [rax + r11*8 + 4]
0x14595c2a7: 42807cd80811 cmp byte ptr [rax + r11*8 + 8], 0x11
0x14595c2ad: 75d1 jne 0x14595c280
0x14595c2af: f3420f585cd80c addss xmm3, dword ptr [rax + r11*8 + 0xc]
0x14595c2b6: ebc8 jmp 0x14595c280
0x14595c2b8: 41f6c001 test r8b, 1
0x14595c2bc: 740e je 0x14595c2cc
0x14595c2be: 42803cd811 cmp byte ptr [rax + r11*8], 0x11
0x14595c2c3: 7507 jne 0x14595c2cc
0x14595c2c5: f3420f585cd804 addss xmm3, dword ptr [rax + r11*8 + 4]
0x14595c2cc: f30f581d8c0f4500 addss xmm3, dword ptr [rip + 0x450f8c]
0x14595c2d4: f3410f10441270 movss xmm0, dword ptr [r10 + rdx + 0x70]
0x14595c2db: 488bb198030000 mov rsi, qword ptr [rcx + 0x398]
0x14595c2e2: f30f100df6114500 movss xmm1, dword ptr [rip + 0x4511f6]
0x14595c2ea: 0f28e1 movaps xmm4, xmm1
0x14595c2ed: 4885f6 test rsi, rsi
0x14595c2f0: 0f84c3000000 je 0x14595c3b9
0x14595c2f6: f30f10b14c0a0000 movss xmm6, dword ptr [rcx + 0xa4c]
0x14595c2fe: f30f10a9c0040000 movss xmm5, dword ptr [rcx + 0x4c0]
0x14595c306: f30f582d520f4500 addss xmm5, dword ptr [rip + 0x450f52]
0x14595c30e: 4c8b9990030000 mov r11, qword ptr [rcx + 0x390]
0x14595c315: 4883fe01 cmp rsi, 1
0x14595c319: 750c jne 0x14595c327
0x14595c31b: f30f1025bd114500 movss xmm4, dword ptr [rip + 0x4511bd]
0x14595c323: 31ff xor edi, edi
0x14595c325: eb6d jmp 0x14595c394
0x14595c327: 4889f3 mov rbx, rsi
0x14595c32a: 4883e3fe and rbx, 0xfffffffffffffffe
0x14595c32e: f30f1025aa114500 movss xmm4, dword ptr [rip + 0x4511aa]
0x14595c336: 31ff xor edi, edi
0x14595c338: 4d89de mov r14, r11
0x14595c33b: eb10 jmp 0x14595c34d
0x14595c33d: 0f1f00 nop dword ptr [rax]
0x14595c340: 4883c702 add rdi, 2
0x14595c344: 4983c630 add r14, 0x30
0x14595c348: 4839fb cmp rbx, rdi
0x14595c34b: 7441 je 0x14595c38e
0x14595c34d: f3410f107e10 movss xmm7, dword ptr [r14 + 0x10]
0x14595c353: 0f2efe ucomiss xmm7, xmm6
0x14595c356: 7614 jbe 0x14595c36c
0x14595c358: 41833e0a cmp dword ptr [r14], 0xa
0x14595c35c: 750e jne 0x14595c36c
0x14595c35e: f3410f107e04 movss xmm7, dword ptr [r14 + 4]
0x14595c364: f30f59fd mulss xmm7, xmm5
0x14595c368: f30f58e7 addss xmm4, xmm7
0x14595c36c: f3410f107e28 movss xmm7, dword ptr [r14 + 0x28]
0x14595c372: 0f2efe ucomiss xmm7, xmm6
0x14595c375: 76c9 jbe 0x14595c340
0x14595c377: 41837e180a cmp dword ptr [r14 + 0x18], 0xa
0x14595c37c: 75c2 jne 0x14595c340
0x14595c37e: f3410f107e1c movss xmm7, dword ptr [r14 + 0x1c]
0x14595c384: f30f59fd mulss xmm7, xmm5
0x14595c388: f30f58e7 addss xmm4, xmm7
0x14595c38c: ebb2 jmp 0x14595c340
0x14595c38e: 40f6c601 test sil, 1
0x14595c392: 7425 je 0x14595c3b9
0x14595c394: 488d347f lea rsi, [rdi + rdi*2]
0x14595c398: f3410f107cf310 movss xmm7, dword ptr [r11 + rsi*8 + 0x10]
0x14595c39f: 0f2efe ucomiss xmm7, xmm6
0x14595c3a2: 7615 jbe 0x14595c3b9
0x14595c3a4: 41833cf30a cmp dword ptr [r11 + rsi*8], 0xa
0x14595c3a9: 750e jne 0x14595c3b9
0x14595c3ab: 4d8d1cf3 lea r11, [r11 + rsi*8]
0x14595c3af: f3410f596b04 mulss xmm5, dword ptr [r11 + 4]
0x14595c3b5: f30f58e5 addss xmm4, xmm5
0x14595c3b9: f30f58dc addss xmm3, xmm4
0x14595c3bd: f30f59c3 mulss xmm0, xmm3
0x14595c3c1: 4d85c0 test r8, r8
0x14595c3c4: 7476 je 0x14595c43c
0x14595c3c6: 4983f801 cmp r8, 1
0x14595c3ca: 750d jne 0x14595c3d9
0x14595c3cc: f30f100d0c114500 movss xmm1, dword ptr [rip + 0x45110c]
0x14595c3d4: 4531db xor r11d, r11d
0x14595c3d7: eb55 jmp 0x14595c42e
0x14595c3d9: 4c89c6 mov rsi, r8
0x14595c3dc: 4883e6fe and rsi, 0xfffffffffffffffe
0x14595c3e0: f30f100df8104500 movss xmm1, dword ptr [rip + 0x4510f8]
0x14595c3e8: 4531db xor r11d, r11d
0x14595c3eb: eb0c jmp 0x14595c3f9
0x14595c3ed: 0f1f00 nop dword ptr [rax]
0x14595c3f0: 4983c302 add r11, 2
0x14595c3f4: 4c39de cmp rsi, r11
0x14595c3f7: 742f je 0x14595c428
0x14595c3f9: 42803cd81d cmp byte ptr [rax + r11*8], 0x1d
0x14595c3fe: 7410 je 0x14595c410
0x14595c400: 42807cd8081d cmp byte ptr [rax + r11*8 + 8], 0x1d
0x14595c406: 75e8 jne 0x14595c3f0
0x14595c408: eb15 jmp 0x14595c41f
0x14595c40a: 660f1f440000 nop word ptr [rax + rax]
0x14595c410: f3420f584cd804 addss xmm1, dword ptr [rax + r11*8 + 4]
0x14595c417: 42807cd8081d cmp byte ptr [rax + r11*8 + 8], 0x1d
0x14595c41d: 75d1 jne 0x14595c3f0
0x14595c41f: f3420f584cd80c addss xmm1, dword ptr [rax + r11*8 + 0xc]
0x14595c426: ebc8 jmp 0x14595c3f0
0x14595c428: 41f6c001 test r8b, 1
0x14595c42c: 740e je 0x14595c43c
0x14595c42e: 42803cd81d cmp byte ptr [rax + r11*8], 0x1d
0x14595c433: 7507 jne 0x14595c43c
0x14595c435: f3420f584cd804 addss xmm1, dword ptr [rax + r11*8 + 4]
0x14595c43c: 4d8b5c1218 mov r11, qword ptr [r10 + rdx + 0x18]
0x14595c441: f30f590517e74500 mulss xmm0, dword ptr [rip + 0x45e717]
0x14595c449: f30f10998c040000 movss xmm3, dword ptr [rcx + 0x48c]
0x14595c451: 488b9168050000 mov rdx, qword ptr [rcx + 0x568]
0x14595c458: 4869b170050000d8010000 imul rsi, qword ptr [rcx + 0x570], 0x1d8
0x14595c463: 4531d2 xor r10d, r10d
0x14595c466: 4889d7 mov rdi, rdx
0x14595c469: 0f1f8000000000 nop dword ptr [rax]
0x14595c470: 4c39d6 cmp rsi, r10
0x14595c473: 0f848a000000 je 0x14595c503
0x14595c479: 4981c2d8010000 add r10, 0x1d8
0x14595c480: 4c398ff0000000 cmp qword ptr [rdi + 0xf0], r9
0x14595c487: 488dbfd8010000 lea rdi, [rdi + 0x1d8]
0x14595c48e: 75e0 jne 0x14595c470
0x14595c490: f3420f106c1280 movss xmm5, dword ptr [rdx + r10 - 0x80]
0x14595c497: f3420f10741284 movss xmm6, dword ptr [rdx + r10 - 0x7c]
0x14595c49e: f30f1025ba0d4500 movss xmm4, dword ptr [rip + 0x450dba]
0x14595c4a6: f30f5ff4 maxss xmm6, xmm4
0x14595c4aa: f30f5eee divss xmm5, xmm6
0x14595c4ae: 0f28f4 movaps xmm6, xmm4
0x14595c4b1: f30f5cf5 subss xmm6, xmm5
0x14595c4b5: 0f57ff xorps xmm7, xmm7
0x14595c4b8: f30f5ffe maxss xmm7, xmm6
0x14595c4bc: 0f28ec movaps xmm5, xmm4
0x14595c4bf: f30f5def minss xmm5, xmm7
0x14595c4c3: 4a83bc1240feffffff cmp qword ptr [rdx + r10 - 0x1c0], -1
0x14595c4cc: 450fb64b39 movzx r9d, byte ptr [r11 + 0x39]
0x14595c4d1: 0f8484000000 je 0x14595c55b
0x14595c4d7: 41ffc9 dec r9d
0x14595c4da: 4183f906 cmp r9d, 6
0x14595c4de: 0f8732020000 ja 0x14595c716
0x14595c4e4: 4c8d1dc9012b01 lea r11, [rip + 0x12b01c9]
0x14595c4eb: 4f630c8b movsxd r9, dword ptr [r11 + r9*4]
0x14595c4ef: 4d01d9 add r9, r11
0x14595c4f2: 41ffe1 jmp r9
0x14595c4f5: 4d85c0 test r8, r8
0x14595c4f8: 0f8568010000 jne 0x14595c666
0x14595c4fe: e913020000 jmp 0x14595c716
0x14595c503: 410fb64339 movzx eax, byte ptr [r11 + 0x39]
0x14595c508: 83f801 cmp eax, 1
0x14595c50b: 746c je 0x14595c579
0x14595c50d: 83f802 cmp eax, 2
0x14595c510: 7474 je 0x14595c586
0x14595c512: 83f803 cmp eax, 3
0x14595c515: 0f85fb010000 jne 0x14595c716
0x14595c51b: f30f10a1a0040000 movss xmm4, dword ptr [rcx + 0x4a0]
0x14595c523: f30f10a9cc040000 movss xmm5, dword ptr [rcx + 0x4cc]
0x14595c52b: 0f57f6 xorps xmm6, xmm6
0x14595c52e: f30f5fee maxss xmm5, xmm6
0x14595c532: f30f58ed addss xmm5, xmm5
0x14595c536: f30f582d220d4500 addss xmm5, dword ptr [rip + 0x450d22]
0x14595c53e: f30f59253a0f4500 mulss xmm4, dword ptr [rip + 0x450f3a]
0x14595c546: f30f58e5 addss xmm4, xmm5
0x14595c54a: f30f5925061f5600 mulss xmm4, dword ptr [rip + 0x561f06]
0x14595c552: f30f59c4 mulss xmm0, xmm4
0x14595c556: e9bb010000 jmp 0x14595c716
0x14595c55b: 41ffc9 dec r9d
0x14595c55e: 4183f906 cmp r9d, 6
0x14595c562: 0f87ae010000 ja 0x14595c716
0x14595c568: 4c8d1d61012b01 lea r11, [rip + 0x12b0161]
0x14595c56f: 4f630c8b movsxd r9, dword ptr [r11 + r9*4]
0x14595c573: 4d01d9 add r9, r11
0x14595c576: 41ffe1 jmp r9
0x14595c579: f30f5905cf1e5600 mulss xmm0, dword ptr [rip + 0x561ecf]
0x14595c581: e990010000 jmp 0x14595c716
0x14595c586: 0f57ed xorps xmm5, xmm5
0x14595c589: 488b8128080000 mov rax, qword ptr [rcx + 0x828]
0x14595c590: 488b9130080000 mov rdx, qword ptr [rcx + 0x830]
0x14595c597: 48c1e206 shl rdx, 6
0x14595c59b: 4531c0 xor r8d, r8d
0x14595c59e: 6690 nop
0x14595c5a0: 4c39c2 cmp rdx, r8
0x14595c5a3: 0f846d010000 je 0x14595c716
0x14595c5a9: 4d8d4840 lea r9, [r8 + 0x40]
0x14595c5ad: 42803c001e cmp byte ptr [rax + r8], 0x1e
0x14595c5b2: 4d89c8 mov r8, r9
0x14595c5b5: 75e9 jne 0x14595c5a0
0x14595c5b7: 420fb64408c1 movzx eax, byte ptr [rax + r9 - 0x3f]
0x14595c5bd: 4885c0 test rax, rax
0x14595c5c0: 0f8450010000 je 0x14595c716
0x14595c5c6: 3c03 cmp al, 3
0x14595c5c8: 0f8756020000 ja 0x14595c824
0x14595c5ce: 488d15ebf22a01 lea rdx, [rip + 0x12af2eb]
0x14595c5d5: f30f596c82fc mulss xmm5, dword ptr [rdx + rax*4 - 4]
0x14595c5db: f30f592da50e4500 mulss xmm5, dword ptr [rip + 0x450ea5]
0x14595c5e3: f30f582d750c4500 addss xmm5, dword ptr [rip + 0x450c75]
0x14595c5eb: f30f59c5 mulss xmm0, xmm5
0x14595c5ef: e922010000 jmp 0x14595c716
0x14595c5f4: 4a8b841230feffff mov rax, qword ptr [rdx + r10 - 0x1d0]
0x14595c5fc: 4a8b941238feffff mov rdx, qword ptr [rdx + r10 - 0x1c8]
0x14595c604: 48c1e204 shl rdx, 4
0x14595c608: 488d1452 lea rdx, [rdx + rdx*2]
0x14595c60c: 0f1f4000 nop dword ptr [rax]
0x14595c610: 4885d2 test rdx, rdx
0x14595c613: 0f84fd000000 je 0x14595c716
0x14595c619: 4883c2d0 add rdx, -0x30
0x14595c61d: 817810ac000000 cmp dword ptr [rax + 0x10], 0xac
0x14595c624: 488d4030 lea rax, [rax + 0x30]
0x14595c628: 75e6 jne 0x14595c610
0x14595c62a: f30f5905ceea4500 mulss xmm0, dword ptr [rip + 0x45eace]
0x14595c632: e9df000000 jmp 0x14595c716
0x14595c637: 0f2e2d52544900 ucomiss xmm5, dword ptr [rip + 0x495452]
0x14595c63e: 0f86d2000000 jbe 0x14595c716
0x14595c644: f30f59054cea4500 mulss xmm0, dword ptr [rip + 0x45ea4c]
0x14595c64c: e9c5000000 jmp 0x14595c716
0x14595c651: 4d85c0 test r8, r8
0x14595c654: 0f84bc000000 je 0x14595c716
0x14595c65a: 42807c12f800 cmp byte ptr [rdx + r10 - 8], 0
0x14595c660: 0f84b0000000 je 0x14595c716
0x14595c666: 4983f801 cmp r8, 1
0x14595c66a: 750c jne 0x14595c678
0x14595c66c: f30f102d6c0e4500 movss xmm5, dword ptr [rip + 0x450e6c]
0x14595c674: 31d2 xor edx, edx
0x14595c676: eb53 jmp 0x14595c6cb
0x14595c678: 4d89c1 mov r9, r8
0x14595c67b: 4983e1fe and r9, 0xfffffffffffffffe
0x14595c67f: f30f102d590e4500 movss xmm5, dword ptr [rip + 0x450e59]
0x14595c687: 31d2 xor edx, edx
0x14595c689: eb0e jmp 0x14595c699
0x14595c68b: 0f1f440000 nop dword ptr [rax + rax]
0x14595c690: 4883c202 add rdx, 2
0x14595c694: 4939d1 cmp r9, rdx
0x14595c697: 742c je 0x14595c6c5
0x14595c699: 803cd020 cmp byte ptr [rax + rdx*8], 0x20
0x14595c69d: 7411 je 0x14595c6b0
0x14595c69f: 807cd00820 cmp byte ptr [rax + rdx*8 + 8], 0x20
0x14595c6a4: 75ea jne 0x14595c690
0x14595c6a6: eb15 jmp 0x14595c6bd
0x14595c6a8: 0f1f840000000000 nop dword ptr [rax + rax]
0x14595c6b0: f30f586cd004 addss xmm5, dword ptr [rax + rdx*8 + 4]
0x14595c6b6: 807cd00820 cmp byte ptr [rax + rdx*8 + 8], 0x20
0x14595c6bb: 75d3 jne 0x14595c690
0x14595c6bd: f30f586cd00c addss xmm5, dword ptr [rax + rdx*8 + 0xc]
0x14595c6c3: ebcb jmp 0x14595c690
0x14595c6c5: 41f6c001 test r8b, 1
0x14595c6c9: 740c je 0x14595c6d7
0x14595c6cb: 803cd020 cmp byte ptr [rax + rdx*8], 0x20
0x14595c6cf: 7506 jne 0x14595c6d7
0x14595c6d1: f30f586cd004 addss xmm5, dword ptr [rax + rdx*8 + 4]
0x14595c6d7: 0f57f6 xorps xmm6, xmm6
0x14595c6da: 0f2eee ucomiss xmm5, xmm6
0x14595c6dd: 7637 jbe 0x14595c716
0x14595c6df: 488b81d8010000 mov rax, qword ptr [rcx + 0x1d8]
0x14595c6e6: 4885c0 test rax, rax
0x14595c6e9: 0f8463feffff je 0x14595c552
0x14595c6ef: 488b91d0010000 mov rdx, qword ptr [rcx + 0x1d0]
0x14595c6f6: 48c1e004 shl rax, 4
0x14595c6fa: 4531c0 xor r8d, r8d
0x14595c6fd: 49b9736f756c5f646576 movabs r9, 0x7665645f6c756f73
0x14595c707: 49ba6465766f75726572 movabs r10, 0x726572756f766564
0x14595c711: e9b7000000 jmp 0x14595c7cd
0x14595c716: f30f58d9 addss xmm3, xmm1
0x14595c71a: 488b81d0090000 mov rax, qword ptr [rcx + 0x9d0]
0x14595c721: 488b91b8090000 mov rdx, qword ptr [rcx + 0x9b8]
0x14595c728: 4c8b81c0090000 mov r8, qword ptr [rcx + 0x9c0]
0x14595c72f: 4c8d0c10 lea r9, [rax + rdx]
0x14595c733: 49c1c117 rol r9, 0x17
0x14595c737: 4901d1 add r9, rdx
0x14595c73a: 4d89c2 mov r10, r8
0x14595c73d: 49c1e211 shl r10, 0x11
0x14595c741: 4c8b99c8090000 mov r11, qword ptr [rcx + 0x9c8]
0x14595c748: 4931d3 xor r11, rdx
0x14595c74b: 4c31c0 xor rax, r8
0x14595c74e: 4d31d8 xor r8, r11
0x14595c751: 4c8981c0090000 mov qword ptr [rcx + 0x9c0], r8
0x14595c758: 4831c2 xor rdx, rax
0x14595c75b: 488991b8090000 mov qword ptr [rcx + 0x9b8], rdx
0x14595c762: 4d31d3 xor r11, r10
0x14595c765: 4c8999c8090000 mov qword ptr [rcx + 0x9c8], r11
0x14595c76c: 49c1e928 shr r9, 0x28
0x14595c770: 0f57c9 xorps xmm1, xmm1
0x14595c773: f3410f2ac9 cvtsi2ss xmm1, r9d
0x14595c778: 48c1c02d rol rax, 0x2d
0x14595c77c: f30f590dbc625600 mulss xmm1, dword ptr [rip + 0x5662bc]
0x14595c784: f30f5d1dd40a4500 minss xmm3, dword ptr [rip + 0x450ad4]
0x14595c78c: 0f2ed9 ucomiss xmm3, xmm1
0x14595c78f: 488981d0090000 mov qword ptr [rcx + 0x9d0], rax
0x14595c796: 0f97c0 seta al
0x14595c799: f30f59d0 mulss xmm2, xmm0
0x14595c79d: 7608 jbe 0x14595c7a7
0x14595c79f: f30f599190040000 mulss xmm2, dword ptr [rcx + 0x490]
0x14595c7a7: 0f28c2 movaps xmm0, xmm2
0x14595c7aa: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
0x14595c7af: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
0x14595c7b4: 4883c448 add rsp, 0x48
0x14595c7b8: 5b pop rbx
0x14595c7b9: 5f pop rdi
0x14595c7ba: 5e pop rsi
0x14595c7bb: 415e pop r14
0x14595c7bd: c3 ret
0x14595c7be: 6690 nop
0x14595c7c0: 4983c010 add r8, 0x10
0x14595c7c4: 4c39c0 cmp rax, r8
0x14595c7c7: 0f8485fdffff je 0x14595c552
0x14595c7cd: 4e8b1c02 mov r11, qword ptr [rdx + r8]
0x14595c7d1: 49837b380d cmp qword ptr [r11 + 0x38], 0xd
0x14595c7d6: 75e8 jne 0x14595c7c0
0x14595c7d8: 4d8b5b30 mov r11, qword ptr [r11 + 0x30]
0x14595c7dc: 498b33 mov rsi, qword ptr [r11]
0x14595c7df: 4c31ce xor rsi, r9
0x14595c7e2: 4d8b5b05 mov r11, qword ptr [r11 + 5]
0x14595c7e6: 4d31d3 xor r11, r10
0x14595c7e9: 4909f3 or r11, rsi
0x14595c7ec: 75d2 jne 0x14595c7c0
0x14595c7ee: 420fb6440208 movzx eax, byte ptr [rdx + r8 + 8]
0x14595c7f4: 0f57e4 xorps xmm4, xmm4
0x14595c7f7: f30f2ae0 cvtsi2ss xmm4, eax
0x14595c7fb: f30f5925dde54500 mulss xmm4, dword ptr [rip + 0x45e5dd]
0x14595c803: f30f5825550a4500 addss xmm4, dword ptr [rip + 0x450a55]
0x14595c80b: e942fdffff jmp 0x14595c552
0x14595c810: 4c8d0591f02a01 lea r8, [rip + 0x12af091]
0x14595c817: 4889d1 mov rcx, rdx
0x14595c81a: 4889c2 mov rdx, rax
0x14595c81d: e861d04400 call 0x145da9883
0x14595c822: 0f0b ud2
0x14595c824: 48ffc8 dec rax
0x14595c827: 4c8d05a2f02a01 lea r8, [rip + 0x12af0a2]
0x14595c82e: ba03000000 mov edx, 3
0x14595c833: 4889c1 mov rcx, rax
0x14595c836: e848d04400 call 0x145da9883
0x14595c83b: 0f0b ud2
