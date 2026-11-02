145947e20: be01000000 mov esi, 1
145947e25: 89f9 mov ecx, edi
145947e27: d3e6 shl esi, cl
145947e29: 410fa3fa bt r10d, edi
145947e2d: 72e1 jb 0x145947e10
145947e2f: 4839d7 cmp rdi, rdx
145947e32: 0f83622c0000 jae 0x14594aa9a
145947e38: f3430f100c03 movss xmm1, dword ptr [r11 + r8]
145947e3e: 0f2ec8 ucomiss xmm1, xmm0
145947e41: 76cd jbe 0x145947e10
145947e43: 4409d6 or esi, r10d
145947e46: 4189764c mov dword ptr [r14 + 0x4c], esi
145947e4a: 488b5038 mov rdx, qword ptr [rax + 0x38]
145947e4e: 4839d7 cmp rdi, rdx
145947e51: 0f83152d0000 jae 0x14594ab6c
145947e57: 488b4030 mov rax, qword ptr [rax + 0x30]
145947e5b: 420f104400d0 movups xmm0, xmmword ptr [rax + r8 - 0x30]
145947e61: 420f104c00e0 movups xmm1, xmmword ptr [rax + r8 - 0x20]
145947e67: 420f105400f0 movups xmm2, xmmword ptr [rax + r8 - 0x10]
145947e6d: 0f299580020000 movaps xmmword ptr [rbp + 0x280], xmm2
145947e74: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
145947e7b: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
145947e82: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
145947e89: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
145947e90: 7561 jne 0x145947ef3
145947e92: c6853703000001 mov byte ptr [rbp + 0x337], 1
145947e99: c6853603000001 mov byte ptr [rbp + 0x336], 1
145947ea0: c6853503000001 mov byte ptr [rbp + 0x335], 1
145947ea7: c6853403000001 mov byte ptr [rbp + 0x334], 1
145947eae: c6853303000001 mov byte ptr [rbp + 0x333], 1
145947eb5: c6853203000001 mov byte ptr [rbp + 0x332], 1
145947ebc: c6853103000001 mov byte ptr [rbp + 0x331], 1
145947ec3: c6853003000001 mov byte ptr [rbp + 0x330], 1
145947eca: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145947ed1: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145947ed8: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145947edf: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145947ee6: 488d8d28020000 lea rcx, [rbp + 0x228]
145947eed: e86e5c2c00 call 0x145c0db60
145947ef2: 90 nop
145947ef3: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
145947efa: 486bce38 imul rcx, rsi, 0x38
145947efe: 488b95d8010000 mov rdx, qword ptr [rbp + 0x1d8]
145947f05: 48891408 mov qword ptr [rax + rcx], rdx
145947f09: 0f288560020000 movaps xmm0, xmmword ptr [rbp + 0x260]
145947f10: 0f288d70020000 movaps xmm1, xmmword ptr [rbp + 0x270]
145947f17: 0f289580020000 movaps xmm2, xmmword ptr [rbp + 0x280]
145947f1e: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
145947f23: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
145947f28: 0f11540828 movups xmmword ptr [rax + rcx + 0x28], xmm2
145947f2d: 48ffc6 inc rsi
145947f30: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
145947f37: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
145947f3e: 488b7030 mov rsi, qword ptr [rax + 0x30]
145947f42: 4c8bb8f0000000 mov r15, qword ptr [rax + 0xf0]
145947f49: 488d4640 lea rax, [rsi + 0x40]
145947f4d: 48898540020000 mov qword ptr [rbp + 0x240], rax
145947f54: 488d05856c2a00 lea rax, [rip + 0x2a6c85]
145947f5b: 48898548020000 mov qword ptr [rbp + 0x248], rax
145947f62: c6853703000001 mov byte ptr [rbp + 0x337], 1
145947f69: c6853603000001 mov byte ptr [rbp + 0x336], 1
145947f70: c6853503000001 mov byte ptr [rbp + 0x335], 1
145947f77: c6853403000001 mov byte ptr [rbp + 0x334], 1
145947f7e: c6853303000001 mov byte ptr [rbp + 0x333], 1
145947f85: c6853203000001 mov byte ptr [rbp + 0x332], 1
145947f8c: c6853103000001 mov byte ptr [rbp + 0x331], 1
145947f93: c6853003000001 mov byte ptr [rbp + 0x330], 1
145947f9a: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145947fa1: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145947fa8: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145947faf: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145947fb6: 488d8d60020000 lea rcx, [rbp + 0x260]
145947fbd: 488d152cbf2901 lea rdx, [rip + 0x129bf2c]
145947fc4: 4c8d8540020000 lea r8, [rbp + 0x240]
145947fcb: e860512900 call 0x145bdd130
145947fd0: 90 nop
145947fd1: 488b8d68020000 mov rcx, qword ptr [rbp + 0x268]
145947fd8: 488b9570020000 mov rdx, qword ptr [rbp + 0x270]
145947fdf: 4c8b2e mov r13, qword ptr [rsi]
145947fe2: 488b7608 mov rsi, qword ptr [rsi + 8]
145947fe6: 48898d18030000 mov qword ptr [rbp + 0x318], rcx
145947fed: e8de5d0400 call 0x14598ddd0
145947ff2: 90 nop
145947ff3: 4989c4 mov r12, rax
145947ff6: 4989d6 mov r14, rdx
145947ff9: 488b9560020000 mov rdx, qword ptr [rbp + 0x260]
145948000: 4885d2 test rdx, rdx
145948003: 488b9d10030000 mov rbx, qword ptr [rbp + 0x310]
14594800a: 7412 je 0x14594801e
14594800c: 41b801000000 mov r8d, 1
145948012: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
145948019: e8b2a16bfa call 0x1400021d0
14594801e: 488b4b30 mov rcx, qword ptr [rbx + 0x30]
145948022: c6853703000001 mov byte ptr [rbp + 0x337], 1
145948029: c6853603000001 mov byte ptr [rbp + 0x336], 1
145948030: c6853503000001 mov byte ptr [rbp + 0x335], 1
145948037: c6853403000001 mov byte ptr [rbp + 0x334], 1
14594803e: c6853303000001 mov byte ptr [rbp + 0x333], 1
145948045: c6853203000001 mov byte ptr [rbp + 0x332], 1
14594804c: c6853103000001 mov byte ptr [rbp + 0x331], 1
145948053: c6853003000001 mov byte ptr [rbp + 0x330], 1
14594805a: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145948061: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145948068: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
14594806f: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145948076: 4889fa mov rdx, rdi
145948079: e842fef4ff call 0x145897ec0
14594807e: 90 nop
14594807f: 4889c7 mov rdi, rax
145948082: 4889d3 mov rbx, rdx
145948085: 4d85e4 test r12, r12
145948088: 4c0f44f6 cmove r14, rsi
14594808c: 4d0f45ec cmovne r13, r12
145948090: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
145948097: 483bb528010000 cmp rsi, qword ptr [rbp + 0x128]
14594809e: 7561 jne 0x145948101
1459480a0: c6853703000001 mov byte ptr [rbp + 0x337], 1
1459480a7: c6853603000001 mov byte ptr [rbp + 0x336], 1
1459480ae: c6853503000001 mov byte ptr [rbp + 0x335], 1
1459480b5: c6853403000001 mov byte ptr [rbp + 0x334], 1
1459480bc: c6853303000001 mov byte ptr [rbp + 0x333], 1
1459480c3: c6853203000001 mov byte ptr [rbp + 0x332], 1
1459480ca: c6853103000001 mov byte ptr [rbp + 0x331], 1
1459480d1: c6853003000001 mov byte ptr [rbp + 0x330], 1
1459480d8: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
1459480df: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
1459480e6: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
1459480ed: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
1459480f4: 488d8d28010000 lea rcx, [rbp + 0x128]
1459480fb: e8405b2c00 call 0x145c0dc40
145948100: 90 nop
145948101: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
145948108: 488d0cb6 lea rcx, [rsi + rsi*4]
14594810c: 4c892cc8 mov qword ptr [rax + rcx*8], r13
145948110: 4c8974c808 mov qword ptr [rax + rcx*8 + 8], r14
145948115: 4c897cc810 mov qword ptr [rax + rcx*8 + 0x10], r15
14594811a: 48897cc818 mov qword ptr [rax + rcx*8 + 0x18], rdi
14594811f: 48895cc820 mov qword ptr [rax + rcx*8 + 0x20], rbx
145948124: 48ffc6 inc rsi
145948127: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
14594812e: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
