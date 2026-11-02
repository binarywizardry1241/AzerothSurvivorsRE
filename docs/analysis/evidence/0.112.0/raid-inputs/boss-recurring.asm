145948135: f3450f104e48 movss xmm9, dword ptr [r14 + 0x48]
14594813b: 4d8b7e20 mov r15, qword ptr [r14 + 0x20]
14594813f: 498b4628 mov rax, qword ptr [r14 + 0x28]
145948143: 498d1c87 lea rbx, [r15 + rax*4]
145948147: 31ff xor edi, edi
145948149: eb52 jmp 0x14594819d
14594814b: 0f1f440000 nop dword ptr [rax + rax]
145948150: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
145948157: 486bce38 imul rcx, rsi, 0x38
14594815b: 488b95d8010000 mov rdx, qword ptr [rbp + 0x1d8]
145948162: 48891408 mov qword ptr [rax + rcx], rdx
145948166: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
14594816a: 0f284de0 movaps xmm1, xmmword ptr [rbp - 0x20]
14594816e: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
145948173: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
145948178: 0f1045ed movups xmm0, xmmword ptr [rbp - 0x13]
14594817c: 0f11440825 movups xmmword ptr [rax + rcx + 0x25], xmm0
145948181: 44886c0835 mov byte ptr [rax + rcx + 0x35], r13b
145948186: 664489640836 mov word ptr [rax + rcx + 0x36], r12w
14594818c: 48ffc6 inc rsi
14594818f: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
145948196: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
14594819d: 4939df cmp r15, rbx
1459481a0: 0f84db010000 je 0x145948381
1459481a6: 4c89f8 mov rax, r15
1459481a9: f3410f1007 movss xmm0, dword ptr [r15]
1459481ae: f30f5cc7 subss xmm0, xmm7
1459481b2: f3410f1107 movss dword ptr [r15], xmm0
1459481b7: 498b5640 mov rdx, qword ptr [r14 + 0x40]
1459481bb: 4839d7 cmp rdi, rdx
1459481be: 0f83ef270000 jae 0x14594a9b3
1459481c4: 4c8d7804 lea r15, [rax + 4]
1459481c8: 498b4e38 mov rcx, qword ptr [r14 + 0x38]
1459481cc: 486bd738 imul rdx, rdi, 0x38
1459481d0: 48ffc7 inc rdi
1459481d3: 0f100c11 movups xmm1, xmmword ptr [rcx + rdx]
1459481d7: 0f10541110 movups xmm2, xmmword ptr [rcx + rdx + 0x10]
1459481dc: 0f105c111d movups xmm3, xmmword ptr [rcx + rdx + 0x1d]
1459481e1: 0f115ded movups xmmword ptr [rbp - 0x13], xmm3
1459481e5: 0f2955e0 movaps xmmword ptr [rbp - 0x20], xmm2
1459481e9: 0f294dd0 movaps xmmword ptr [rbp - 0x30], xmm1
1459481ed: 440f2ee8 ucomiss xmm13, xmm0
1459481f1: 72aa jb 0x14594819d
1459481f3: 440fb66c112d movzx r13d, byte ptr [rcx + rdx + 0x2d]
1459481f9: 440fb764112e movzx r12d, word ptr [rcx + rdx + 0x2e]
1459481ff: f30f10441130 movss xmm0, dword ptr [rcx + rdx + 0x30]
145948205: 440f2ece ucomiss xmm9, xmm6
145948209: 7635 jbe 0x145948240
14594820b: 4489ea mov edx, r13d
14594820e: 80ea03 sub dl, 3
145948211: 0fb6ca movzx ecx, dl
145948214: 41b81d000000 mov r8d, 0x1d
14594821a: 410f42c8 cmovb ecx, r8d
14594821e: 80f91f cmp cl, 0x1f
145948221: 0f8776ffffff ja 0x14594819d
145948227: 0fb6c9 movzx ecx, cl
14594822a: 41b8060018a0 mov r8d, 0xa0180006
145948230: 410fa3c8 bt r8d, ecx
145948234: 720e jb 0x145948244
145948236: e962ffffff jmp 0x14594819d
14594823b: 0f1f440000 nop dword ptr [rax + rax]
145948240: 418d55fd lea edx, [r13 - 3]
145948244: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
14594824b: 4c8b8538020000 mov r8, qword ptr [rbp + 0x238]
145948252: 4180fd03 cmp r13b, 3
145948256: 0fb6d2 movzx edx, dl
145948259: 41b91d000000 mov r9d, 0x1d
14594825f: 410f42d1 cmovb edx, r9d
145948263: 80fa1f cmp dl, 0x1f
145948266: 0f87ac000000 ja 0x145948318
14594826c: 0fb6d2 movzx edx, dl
14594826f: 41b9060018a0 mov r9d, 0xa0180006
145948275: 410fa3d1 bt r9d, edx
145948279: 0f8399000000 jae 0x145948318
14594827f: 41807e5000 cmp byte ptr [r14 + 0x50], 0
145948284: f30f100d04984a00 movss xmm1, dword ptr [rip + 0x4a9804]
14594828c: 7508 jne 0x145948296
14594828e: f30f100dca4f4600 movss xmm1, dword ptr [rip + 0x464fca]
145948296: f30f59c1 mulss xmm0, xmm1
14594829a: f30f1100 movss dword ptr [rax], xmm0
14594829e: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
1459482a5: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
1459482ac: 0f859efeffff jne 0x145948150
1459482b2: c6853703000001 mov byte ptr [rbp + 0x337], 1
1459482b9: c6853603000001 mov byte ptr [rbp + 0x336], 1
1459482c0: c6853503000001 mov byte ptr [rbp + 0x335], 1
1459482c7: c6853403000001 mov byte ptr [rbp + 0x334], 1
1459482ce: c6853303000001 mov byte ptr [rbp + 0x333], 1
1459482d5: c6853203000001 mov byte ptr [rbp + 0x332], 1
1459482dc: c6853103000001 mov byte ptr [rbp + 0x331], 1
1459482e3: c6853003000001 mov byte ptr [rbp + 0x330], 1
1459482ea: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
1459482f1: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
1459482f8: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
1459482ff: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145948306: 488d8d28020000 lea rcx, [rbp + 0x228]
14594830d: e84e582c00 call 0x145c0db60
145948312: 90 nop
145948313: e938feffff jmp 0x145948150
145948318: 4d85c0 test r8, r8
14594831b: 0f845effffff je 0x14594827f
145948321: 496bd038 imul rdx, r8, 0x38
145948325: 4531c0 xor r8d, r8d
145948328: eb13 jmp 0x14594833d
14594832a: 660f1f440000 nop word ptr [rax + rax]
145948330: 4983c038 add r8, 0x38
145948334: 4c39c2 cmp rdx, r8
145948337: 0f8442ffffff je 0x14594827f
14594833d: 4c8b8dd8010000 mov r9, qword ptr [rbp + 0x1d8]
145948344: 4e390c01 cmp qword ptr [rcx + r8], r9
145948348: 75e6 jne 0x145948330
14594834a: 460fb64c0135 movzx r9d, byte ptr [rcx + r8 + 0x35]
145948350: 4180e903 sub r9b, 3
145948354: 450fb6c9 movzx r9d, r9b
145948358: 41ba1d000000 mov r10d, 0x1d
14594835e: 450f42ca cmovb r9d, r10d
145948362: 4180f91f cmp r9b, 0x1f
145948366: 0f8731feffff ja 0x14594819d
14594836c: 450fb6c9 movzx r9d, r9b
145948370: 41ba060018a0 mov r10d, 0xa0180006
145948376: 450fa3ca bt r10d, r9d
14594837a: 72b4 jb 0x145948330
14594837c: e91cfeffff jmp 0x14594819d
