145947b30: 31c0 xor eax, eax
145947b32: 450f2eca ucomiss xmm9, xmm10
145947b36: 0f97c0 seta al
145947b39: f3450f108ea0000000 movss xmm9, dword ptr [r14 + 0xa0]
145947b42: 4d8b7e60 mov r15, qword ptr [r14 + 0x60]
145947b46: 498b4e68 mov rcx, qword ptr [r14 + 0x68]
145947b4a: 498d1c8f lea rbx, [r15 + rcx*4]
145947b4e: 488d0d3b132c01 lea rcx, [rip + 0x12c133b]
145947b55: f3440f101481 movss xmm10, dword ptr [rcx + rax*4]
145947b5b: 31ff xor edi, edi
145947b5d: eb4e jmp 0x145947bad
145947b5f: 90 nop
145947b60: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
145947b67: 486bce38 imul rcx, rsi, 0x38
145947b6b: 488b95d8010000 mov rdx, qword ptr [rbp + 0x1d8]
145947b72: 48891408 mov qword ptr [rax + rcx], rdx
145947b76: 0f284500 movaps xmm0, xmmword ptr [rbp]
145947b7a: 0f284d10 movaps xmm1, xmmword ptr [rbp + 0x10]
145947b7e: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
145947b83: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
145947b88: 0f10451d movups xmm0, xmmword ptr [rbp + 0x1d]
145947b8c: 0f11440825 movups xmmword ptr [rax + rcx + 0x25], xmm0
145947b91: 44886c0835 mov byte ptr [rax + rcx + 0x35], r13b
145947b96: 664489640836 mov word ptr [rax + rcx + 0x36], r12w
145947b9c: 48ffc6 inc rsi
145947b9f: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
145947ba6: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
145947bad: 4939df cmp r15, rbx
145947bb0: 0f84db010000 je 0x145947d91
145947bb6: 4c89f8 mov rax, r15
145947bb9: f3410f1007 movss xmm0, dword ptr [r15]
145947bbe: f30f5cc7 subss xmm0, xmm7
145947bc2: f3410f1107 movss dword ptr [r15], xmm0
145947bc7: 498b9688000000 mov rdx, qword ptr [r14 + 0x88]
145947bce: 4839d7 cmp rdi, rdx
145947bd1: 0f835a2e0000 jae 0x14594aa31
145947bd7: 4c8d7804 lea r15, [rax + 4]
145947bdb: 498b8e80000000 mov rcx, qword ptr [r14 + 0x80]
145947be2: 486bd738 imul rdx, rdi, 0x38
145947be6: 48ffc7 inc rdi
145947be9: 0f100c11 movups xmm1, xmmword ptr [rcx + rdx]
145947bed: 0f10541110 movups xmm2, xmmword ptr [rcx + rdx + 0x10]
145947bf2: 0f105c111d movups xmm3, xmmword ptr [rcx + rdx + 0x1d]
145947bf7: 0f115d1d movups xmmword ptr [rbp + 0x1d], xmm3
145947bfb: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
145947bff: 0f294d00 movaps xmmword ptr [rbp], xmm1
145947c03: 440f2ee8 ucomiss xmm13, xmm0
145947c07: 72a4 jb 0x145947bad
145947c09: 440fb66c112d movzx r13d, byte ptr [rcx + rdx + 0x2d]
145947c0f: 440fb764112e movzx r12d, word ptr [rcx + rdx + 0x2e]
145947c15: f30f10441130 movss xmm0, dword ptr [rcx + rdx + 0x30]
145947c1b: 440f2ece ucomiss xmm9, xmm6
145947c1f: 763f jbe 0x145947c60
145947c21: 4489ea mov edx, r13d
145947c24: 80ea03 sub dl, 3
145947c27: 0fb6ca movzx ecx, dl
145947c2a: 41b81d000000 mov r8d, 0x1d
145947c30: 410f42c8 cmovb ecx, r8d
145947c34: 80f91f cmp cl, 0x1f
145947c37: 0f8770ffffff ja 0x145947bad
145947c3d: 0fb6c9 movzx ecx, cl
145947c40: 41b8060018a0 mov r8d, 0xa0180006
145947c46: 410fa3c8 bt r8d, ecx
145947c4a: 7218 jb 0x145947c64
145947c4c: e95cffffff jmp 0x145947bad
145947c51: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145947c60: 418d55fd lea edx, [r13 - 3]
145947c64: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
145947c6b: 4c8b8538020000 mov r8, qword ptr [rbp + 0x238]
145947c72: 4180fd03 cmp r13b, 3
145947c76: 0fb6d2 movzx edx, dl
145947c79: 41b91d000000 mov r9d, 0x1d
145947c7f: 410f42d1 cmovb edx, r9d
145947c83: 80fa1f cmp dl, 0x1f
145947c86: 0f8796000000 ja 0x145947d22
145947c8c: 0fb6d2 movzx edx, dl
145947c8f: 41b9060018a0 mov r9d, 0xa0180006
145947c95: 410fa3d1 bt r9d, edx
145947c99: 0f8383000000 jae 0x145947d22
145947c9f: f3410f59c2 mulss xmm0, xmm10
145947ca4: f30f1100 movss dword ptr [rax], xmm0
145947ca8: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
145947caf: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
145947cb6: 0f85a4feffff jne 0x145947b60
145947cbc: c6853703000001 mov byte ptr [rbp + 0x337], 1
145947cc3: c6853603000001 mov byte ptr [rbp + 0x336], 1
145947cca: c6853503000001 mov byte ptr [rbp + 0x335], 1
145947cd1: c6853403000001 mov byte ptr [rbp + 0x334], 1
145947cd8: c6853303000001 mov byte ptr [rbp + 0x333], 1
145947cdf: c6853203000001 mov byte ptr [rbp + 0x332], 1
145947ce6: c6853103000001 mov byte ptr [rbp + 0x331], 1
145947ced: c6853003000001 mov byte ptr [rbp + 0x330], 1
145947cf4: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145947cfb: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
145947d02: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145947d09: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145947d10: 488d8d28020000 lea rcx, [rbp + 0x228]
145947d17: e8445e2c00 call 0x145c0db60
145947d1c: 90 nop
145947d1d: e93efeffff jmp 0x145947b60
145947d22: 4d85c0 test r8, r8
145947d25: 0f8474ffffff je 0x145947c9f
145947d2b: 496bd038 imul rdx, r8, 0x38
145947d2f: 4531c0 xor r8d, r8d
145947d32: eb19 jmp 0x145947d4d
145947d34: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145947d40: 4983c038 add r8, 0x38
145947d44: 4c39c2 cmp rdx, r8
145947d47: 0f8452ffffff je 0x145947c9f
145947d4d: 4c8b8dd8010000 mov r9, qword ptr [rbp + 0x1d8]
145947d54: 4e390c01 cmp qword ptr [rcx + r8], r9
145947d58: 75e6 jne 0x145947d40
145947d5a: 460fb64c0135 movzx r9d, byte ptr [rcx + r8 + 0x35]
145947d60: 4180e903 sub r9b, 3
145947d64: 450fb6c9 movzx r9d, r9b
145947d68: 41ba1d000000 mov r10d, 0x1d
145947d6e: 450f42ca cmovb r9d, r10d
145947d72: 4180f91f cmp r9b, 0x1f
145947d76: 0f8731feffff ja 0x145947bad
145947d7c: 450fb6c9 movzx r9d, r9b
145947d80: 41ba060018a0 mov r10d, 0xa0180006
145947d86: 450fa3ca bt r10d, r9d
145947d8a: 72b4 jb 0x145947d40
145947d8c: e91cfeffff jmp 0x145947bad
