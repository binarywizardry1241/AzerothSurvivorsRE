145979b20: f3410f108e5c010000 movss xmm1, dword ptr [r14 + 0x15c]
145979b29: 440f28c9 movaps xmm9, xmm1
145979b2d: f3440f590dba864600 mulss xmm9, dword ptr [rip + 0x4686ba]
145979b36: f30f5f0d62374200 maxss xmm1, dword ptr [rip + 0x423762]
145979b3e: 49837e58ff cmp qword ptr [r14 + 0x58], -1
145979b43: 0f8448090000 je 0x14597a491
145979b49: f3450f109658010000 movss xmm10, dword ptr [r14 + 0x158]
145979b52: 498b9e98000000 mov rbx, qword ptr [r14 + 0x98]
145979b59: 4885db test rbx, rbx
145979b5c: 0f84ce060000 je 0x14597a230
145979b62: 488b5328 mov rdx, qword ptr [rbx + 0x28]
145979b66: 4883fa20 cmp rdx, 0x20
145979b6a: 41b820000000 mov r8d, 0x20
145979b70: 4c0f42c2 cmovb r8, rdx
145979b74: 4885d2 test rdx, rdx
145979b77: 0f84b3060000 je 0x14597a230
145979b7d: 410f28c2 movaps xmm0, xmm10
145979b81: f30f5ec1 divss xmm0, xmm1
145979b85: 4c8b5320 mov r10, qword ptr [rbx + 0x20]
145979b89: 458b8ea4000000 mov r9d, dword ptr [r14 + 0xa4]
145979b90: b840000000 mov eax, 0x40
145979b95: 31ff xor edi, edi
145979b97: eb17 jmp 0x145979bb0
145979b99: 0f1f8000000000 nop dword ptr [rax]
145979ba0: 48ffc7 inc rdi
145979ba3: 4883c048 add rax, 0x48
145979ba7: 4939f8 cmp r8, rdi
145979baa: 0f8480060000 je 0x14597a230
145979bb0: 41bb01000000 mov r11d, 1
145979bb6: 89f9 mov ecx, edi
145979bb8: 41d3e3 shl r11d, cl
145979bbb: 410fa3f9 bt r9d, edi
145979bbf: 72df jb 0x145979ba0
145979bc1: 4839d7 cmp rdi, rdx
145979bc4: 0f8359370000 jae 0x14597d323
145979bca: f3410f100c02 movss xmm1, dword ptr [r10 + rax]
145979bd0: 0f2ec8 ucomiss xmm1, xmm0
145979bd3: 76cb jbe 0x145979ba0
145979bd5: 4509cb or r11d, r9d
145979bd8: 45899ea4000000 mov dword ptr [r14 + 0xa4], r11d
145979bdf: 488b5328 mov rdx, qword ptr [rbx + 0x28]
145979be3: 4839d7 cmp rdi, rdx
145979be6: 0f8306380000 jae 0x14597d3f2
145979bec: 488b4b20 mov rcx, qword ptr [rbx + 0x20]
145979bf0: 0f104401d0 movups xmm0, xmmword ptr [rcx + rax - 0x30]
145979bf5: 0f104c01e0 movups xmm1, xmmword ptr [rcx + rax - 0x20]
145979bfa: 0f105401f0 movups xmm2, xmmword ptr [rcx + rax - 0x10]
145979bff: 0f299580020000 movaps xmmword ptr [rbp + 0x280], xmm2
145979c06: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
145979c0d: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
145979c14: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
145979c1b: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
145979c22: 7561 jne 0x145979c85
145979c24: c6853703000001 mov byte ptr [rbp + 0x337], 1
145979c2b: c6853603000001 mov byte ptr [rbp + 0x336], 1
145979c32: c6853503000001 mov byte ptr [rbp + 0x335], 1
145979c39: c6853403000001 mov byte ptr [rbp + 0x334], 1
145979c40: c6853303000001 mov byte ptr [rbp + 0x333], 1
145979c47: c6853203000001 mov byte ptr [rbp + 0x332], 1
145979c4e: c6853103000001 mov byte ptr [rbp + 0x331], 1
145979c55: c6853003000001 mov byte ptr [rbp + 0x330], 1
145979c5c: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145979c63: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145979c6a: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145979c71: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145979c78: 488d8d28020000 lea rcx, [rbp + 0x228]
145979c7f: e81c112800 call 0x145bfada0
145979c84: 90 nop
145979c85: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
145979c8c: 486bce38 imul rcx, rsi, 0x38
145979c90: 488b9520020000 mov rdx, qword ptr [rbp + 0x220]
145979c97: 48891408 mov qword ptr [rax + rcx], rdx
145979c9b: 0f288560020000 movaps xmm0, xmmword ptr [rbp + 0x260]
145979ca2: 0f288d70020000 movaps xmm1, xmmword ptr [rbp + 0x270]
145979ca9: 0f289580020000 movaps xmm2, xmmword ptr [rbp + 0x280]
145979cb0: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
145979cb5: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
145979cba: 0f11540828 movups xmmword ptr [rax + rcx + 0x28], xmm2
145979cbf: 48ffc6 inc rsi
145979cc2: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
145979cc9: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
145979cd0: 488b88f8000000 mov rcx, qword ptr [rax + 0xf8]
145979cd7: 4885c9 test rcx, rcx
145979cda: 0f843e040000 je 0x14597a11e
