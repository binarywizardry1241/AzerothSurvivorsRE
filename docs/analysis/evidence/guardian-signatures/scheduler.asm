14597a230: 31c0 xor eax, eax
14597a232: 450f2eca ucomiss xmm9, xmm10
14597a236: 0f97c0 seta al
14597a239: f3450f108ea0000000 movss xmm9, dword ptr [r14 + 0xa0]
14597a242: 4d8b7e60 mov r15, qword ptr [r14 + 0x60]
14597a246: 498b4e68 mov rcx, qword ptr [r14 + 0x68]
14597a24a: 498d1c8f lea rbx, [r15 + rcx*4]
14597a24e: 488d0d4bf88a01 lea rcx, [rip + 0x18af84b]
14597a255: f3440f101481 movss xmm10, dword ptr [rcx + rax*4]
14597a25b: 31ff xor edi, edi
14597a25d: eb4e jmp 0x14597a2ad
14597a25f: 90 nop
14597a260: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
14597a267: 486bce38 imul rcx, rsi, 0x38
14597a26b: 488b9520020000 mov rdx, qword ptr [rbp + 0x220]
14597a272: 48891408 mov qword ptr [rax + rcx], rdx
14597a276: 0f284500 movaps xmm0, xmmword ptr [rbp]
14597a27a: 0f284d10 movaps xmm1, xmmword ptr [rbp + 0x10]
14597a27e: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
14597a283: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
14597a288: 0f10451d movups xmm0, xmmword ptr [rbp + 0x1d]
14597a28c: 0f11440825 movups xmmword ptr [rax + rcx + 0x25], xmm0
14597a291: 44886c0835 mov byte ptr [rax + rcx + 0x35], r13b
14597a296: 664489640836 mov word ptr [rax + rcx + 0x36], r12w
14597a29c: 48ffc6 inc rsi
14597a29f: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
14597a2a6: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
14597a2ad: 4939df cmp r15, rbx
14597a2b0: 0f84db010000 je 0x14597a491
14597a2b6: 4c89f8 mov rax, r15
14597a2b9: f3410f1007 movss xmm0, dword ptr [r15]
14597a2be: f30f5cc7 subss xmm0, xmm7
14597a2c2: f3410f1107 movss dword ptr [r15], xmm0
14597a2c7: 498b9688000000 mov rdx, qword ptr [r14 + 0x88]
14597a2ce: 4839d7 cmp rdi, rdx
14597a2d1: 0f837a2f0000 jae 0x14597d251
14597a2d7: 4c8d7804 lea r15, [rax + 4]
14597a2db: 498b8e80000000 mov rcx, qword ptr [r14 + 0x80]
14597a2e2: 486bd738 imul rdx, rdi, 0x38
14597a2e6: 48ffc7 inc rdi
14597a2e9: 0f100c11 movups xmm1, xmmword ptr [rcx + rdx]
14597a2ed: 0f10541110 movups xmm2, xmmword ptr [rcx + rdx + 0x10]
14597a2f2: 0f105c111d movups xmm3, xmmword ptr [rcx + rdx + 0x1d]
14597a2f7: 0f115d1d movups xmmword ptr [rbp + 0x1d], xmm3
14597a2fb: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
14597a2ff: 0f294d00 movaps xmmword ptr [rbp], xmm1
14597a303: 440f2ee8 ucomiss xmm13, xmm0
14597a307: 72a4 jb 0x14597a2ad
14597a309: 440fb66c112d movzx r13d, byte ptr [rcx + rdx + 0x2d]
14597a30f: 440fb764112e movzx r12d, word ptr [rcx + rdx + 0x2e]
14597a315: f30f10441130 movss xmm0, dword ptr [rcx + rdx + 0x30]
14597a31b: 440f2ece ucomiss xmm9, xmm6
14597a31f: 763f jbe 0x14597a360
14597a321: 4489ea mov edx, r13d
14597a324: 80ea03 sub dl, 3
14597a327: 0fb6ca movzx ecx, dl
14597a32a: 41b81d000000 mov r8d, 0x1d
14597a330: 410f42c8 cmovb ecx, r8d
14597a334: 80f91f cmp cl, 0x1f
14597a337: 0f8770ffffff ja 0x14597a2ad
14597a33d: 0fb6c9 movzx ecx, cl
14597a340: 41b8060018a0 mov r8d, 0xa0180006
14597a346: 410fa3c8 bt r8d, ecx
14597a34a: 7218 jb 0x14597a364
14597a34c: e95cffffff jmp 0x14597a2ad
14597a351: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14597a360: 418d55fd lea edx, [r13 - 3]
14597a364: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
14597a36b: 4c8b8538020000 mov r8, qword ptr [rbp + 0x238]
14597a372: 4180fd03 cmp r13b, 3
14597a376: 0fb6d2 movzx edx, dl
14597a379: 41b91d000000 mov r9d, 0x1d
14597a37f: 410f42d1 cmovb edx, r9d
14597a383: 80fa1f cmp dl, 0x1f
14597a386: 0f8796000000 ja 0x14597a422
14597a38c: 0fb6d2 movzx edx, dl
14597a38f: 41b9060018a0 mov r9d, 0xa0180006
14597a395: 410fa3d1 bt r9d, edx
14597a399: 0f8383000000 jae 0x14597a422
14597a39f: f3410f59c2 mulss xmm0, xmm10
14597a3a4: f30f1100 movss dword ptr [rax], xmm0
14597a3a8: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
14597a3af: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
14597a3b6: 0f85a4feffff jne 0x14597a260
14597a3bc: c6853703000001 mov byte ptr [rbp + 0x337], 1
14597a3c3: c6853603000001 mov byte ptr [rbp + 0x336], 1
14597a3ca: c6853503000001 mov byte ptr [rbp + 0x335], 1
14597a3d1: c6853403000001 mov byte ptr [rbp + 0x334], 1
14597a3d8: c6853303000001 mov byte ptr [rbp + 0x333], 1
14597a3df: c6853203000001 mov byte ptr [rbp + 0x332], 1
14597a3e6: c6853103000001 mov byte ptr [rbp + 0x331], 1
14597a3ed: c6853003000001 mov byte ptr [rbp + 0x330], 1
14597a3f4: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
14597a3fb: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
14597a402: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
14597a409: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
14597a410: 488d8d28020000 lea rcx, [rbp + 0x228]
14597a417: e884092800 call 0x145bfada0
14597a41c: 90 nop
14597a41d: e93efeffff jmp 0x14597a260
14597a422: 4d85c0 test r8, r8
14597a425: 0f8474ffffff je 0x14597a39f
14597a42b: 496bd038 imul rdx, r8, 0x38
14597a42f: 4531c0 xor r8d, r8d
14597a432: eb19 jmp 0x14597a44d
14597a434: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14597a440: 4983c038 add r8, 0x38
14597a444: 4c39c2 cmp rdx, r8
14597a447: 0f8452ffffff je 0x14597a39f
14597a44d: 4c8b8d20020000 mov r9, qword ptr [rbp + 0x220]
14597a454: 4e390c01 cmp qword ptr [rcx + r8], r9
14597a458: 75e6 jne 0x14597a440
14597a45a: 460fb64c0135 movzx r9d, byte ptr [rcx + r8 + 0x35]
14597a460: 4180e903 sub r9b, 3
14597a464: 450fb6c9 movzx r9d, r9b
14597a468: 41ba1d000000 mov r10d, 0x1d
14597a46e: 450f42ca cmovb r9d, r10d
14597a472: 4180f91f cmp r9b, 0x1f
14597a476: 0f8731feffff ja 0x14597a2ad
14597a47c: 450fb6c9 movzx r9d, r9b
14597a480: 41ba060018a0 mov r10d, 0xa0180006
14597a486: 450fa3ca bt r10d, r9d
14597a48a: 72b4 jb 0x14597a440
14597a48c: e91cfeffff jmp 0x14597a2ad
