14597a835: f3450f104e48 movss xmm9, dword ptr [r14 + 0x48]
14597a83b: 4d8b7e20 mov r15, qword ptr [r14 + 0x20]
14597a83f: 498b4628 mov rax, qword ptr [r14 + 0x28]
14597a843: 498d1c87 lea rbx, [r15 + rax*4]
14597a847: 31ff xor edi, edi
14597a849: eb52 jmp 0x14597a89d
14597a84b: 0f1f440000 nop dword ptr [rax + rax]
14597a850: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
14597a857: 486bce38 imul rcx, rsi, 0x38
14597a85b: 488b9520020000 mov rdx, qword ptr [rbp + 0x220]
14597a862: 48891408 mov qword ptr [rax + rcx], rdx
14597a866: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
14597a86a: 0f284de0 movaps xmm1, xmmword ptr [rbp - 0x20]
14597a86e: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
14597a873: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
14597a878: 0f1045ed movups xmm0, xmmword ptr [rbp - 0x13]
14597a87c: 0f11440825 movups xmmword ptr [rax + rcx + 0x25], xmm0
14597a881: 44886c0835 mov byte ptr [rax + rcx + 0x35], r13b
14597a886: 664489640836 mov word ptr [rax + rcx + 0x36], r12w
14597a88c: 48ffc6 inc rsi
14597a88f: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
14597a896: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
14597a89d: 4939df cmp r15, rbx
14597a8a0: 0f84db010000 je 0x14597aa81
14597a8a6: 4c89f8 mov rax, r15
14597a8a9: f3410f1007 movss xmm0, dword ptr [r15]
14597a8ae: f30f5cc7 subss xmm0, xmm7
14597a8b2: f3410f1107 movss dword ptr [r15], xmm0
14597a8b7: 498b5640 mov rdx, qword ptr [r14 + 0x40]
14597a8bb: 4839d7 cmp rdi, rdx
14597a8be: 0f830f290000 jae 0x14597d1d3
14597a8c4: 4c8d7804 lea r15, [rax + 4]
14597a8c8: 498b4e38 mov rcx, qword ptr [r14 + 0x38]
14597a8cc: 486bd738 imul rdx, rdi, 0x38
14597a8d0: 48ffc7 inc rdi
14597a8d3: 0f100c11 movups xmm1, xmmword ptr [rcx + rdx]
14597a8d7: 0f10541110 movups xmm2, xmmword ptr [rcx + rdx + 0x10]
14597a8dc: 0f105c111d movups xmm3, xmmword ptr [rcx + rdx + 0x1d]
14597a8e1: 0f115ded movups xmmword ptr [rbp - 0x13], xmm3
14597a8e5: 0f2955e0 movaps xmmword ptr [rbp - 0x20], xmm2
14597a8e9: 0f294dd0 movaps xmmword ptr [rbp - 0x30], xmm1
14597a8ed: 440f2ee8 ucomiss xmm13, xmm0
14597a8f1: 72aa jb 0x14597a89d
14597a8f3: 440fb66c112d movzx r13d, byte ptr [rcx + rdx + 0x2d]
14597a8f9: 440fb764112e movzx r12d, word ptr [rcx + rdx + 0x2e]
14597a8ff: f30f10441130 movss xmm0, dword ptr [rcx + rdx + 0x30]
14597a905: 440f2ece ucomiss xmm9, xmm6
14597a909: 7635 jbe 0x14597a940
14597a90b: 4489ea mov edx, r13d
14597a90e: 80ea03 sub dl, 3
14597a911: 0fb6ca movzx ecx, dl
14597a914: 41b81d000000 mov r8d, 0x1d
14597a91a: 410f42c8 cmovb ecx, r8d
14597a91e: 80f91f cmp cl, 0x1f
14597a921: 0f8776ffffff ja 0x14597a89d
14597a927: 0fb6c9 movzx ecx, cl
14597a92a: 41b8060018a0 mov r8d, 0xa0180006
14597a930: 410fa3c8 bt r8d, ecx
14597a934: 720e jb 0x14597a944
14597a936: e962ffffff jmp 0x14597a89d
14597a93b: 0f1f440000 nop dword ptr [rax + rax]
14597a940: 418d55fd lea edx, [r13 - 3]
14597a944: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
14597a94b: 4c8b8538020000 mov r8, qword ptr [rbp + 0x238]
14597a952: 4180fd03 cmp r13b, 3
14597a956: 0fb6d2 movzx edx, dl
14597a959: 41b91d000000 mov r9d, 0x1d
14597a95f: 410f42d1 cmovb edx, r9d
14597a963: 80fa1f cmp dl, 0x1f
14597a966: 0f87ac000000 ja 0x14597aa18
14597a96c: 0fb6d2 movzx edx, dl
14597a96f: 41b9060018a0 mov r9d, 0xa0180006
14597a975: 410fa3d1 bt r9d, edx
14597a979: 0f8399000000 jae 0x14597aa18
14597a97f: 41807e5000 cmp byte ptr [r14 + 0x50], 0
14597a984: f30f100da4d04600 movss xmm1, dword ptr [rip + 0x46d0a4]
14597a98c: 7508 jne 0x14597a996
14597a98e: f30f100d0a294200 movss xmm1, dword ptr [rip + 0x42290a]
14597a996: f30f59c1 mulss xmm0, xmm1
14597a99a: f30f1100 movss dword ptr [rax], xmm0
14597a99e: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
14597a9a5: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
14597a9ac: 0f859efeffff jne 0x14597a850
14597a9b2: c6853703000001 mov byte ptr [rbp + 0x337], 1
14597a9b9: c6853603000001 mov byte ptr [rbp + 0x336], 1
14597a9c0: c6853503000001 mov byte ptr [rbp + 0x335], 1
14597a9c7: c6853403000001 mov byte ptr [rbp + 0x334], 1
14597a9ce: c6853303000001 mov byte ptr [rbp + 0x333], 1
14597a9d5: c6853203000001 mov byte ptr [rbp + 0x332], 1
14597a9dc: c6853103000001 mov byte ptr [rbp + 0x331], 1
14597a9e3: c6853003000001 mov byte ptr [rbp + 0x330], 1
14597a9ea: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
14597a9f1: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
14597a9f8: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
14597a9ff: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
14597aa06: 488d8d28020000 lea rcx, [rbp + 0x228]
14597aa0d: e88e032800 call 0x145bfada0
14597aa12: 90 nop
14597aa13: e938feffff jmp 0x14597a850
14597aa18: 4d85c0 test r8, r8
14597aa1b: 0f845effffff je 0x14597a97f
14597aa21: 496bd038 imul rdx, r8, 0x38
14597aa25: 4531c0 xor r8d, r8d
14597aa28: eb13 jmp 0x14597aa3d
14597aa2a: 660f1f440000 nop word ptr [rax + rax]
14597aa30: 4983c038 add r8, 0x38
14597aa34: 4c39c2 cmp rdx, r8
14597aa37: 0f8442ffffff je 0x14597a97f
14597aa3d: 4c8b8d20020000 mov r9, qword ptr [rbp + 0x220]
14597aa44: 4e390c01 cmp qword ptr [rcx + r8], r9
14597aa48: 75e6 jne 0x14597aa30
14597aa4a: 460fb64c0135 movzx r9d, byte ptr [rcx + r8 + 0x35]
14597aa50: 4180e903 sub r9b, 3
14597aa54: 450fb6c9 movzx r9d, r9b
14597aa58: 41ba1d000000 mov r10d, 0x1d
14597aa5e: 450f42ca cmovb r9d, r10d
14597aa62: 4180f91f cmp r9b, 0x1f
14597aa66: 0f8731feffff ja 0x14597a89d
14597aa6c: 450fb6c9 movzx r9d, r9b
14597aa70: 41ba060018a0 mov r10d, 0xa0180006
14597aa76: 450fa3ca bt r10d, r9d
14597aa7a: 72b4 jb 0x14597aa30
14597aa7c: e91cfeffff jmp 0x14597a89d
