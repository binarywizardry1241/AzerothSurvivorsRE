145947420: f3410f108e5c010000 movss xmm1, dword ptr [r14 + 0x15c]
145947429: 440f28c9 movaps xmm9, xmm1
14594742d: f3440f590dda134700 mulss xmm9, dword ptr [rip + 0x4713da]
145947436: f30f5f0d225e4600 maxss xmm1, dword ptr [rip + 0x465e22]
14594743e: 49837e58ff cmp qword ptr [r14 + 0x58], -1
145947443: 0f8448090000 je 0x145947d91
145947449: f3450f109658010000 movss xmm10, dword ptr [r14 + 0x158]
145947452: 498b9e98000000 mov rbx, qword ptr [r14 + 0x98]
145947459: 4885db test rbx, rbx
14594745c: 0f84ce060000 je 0x145947b30
145947462: 488b5328 mov rdx, qword ptr [rbx + 0x28]
145947466: 4883fa20 cmp rdx, 0x20
14594746a: 41b820000000 mov r8d, 0x20
145947470: 4c0f42c2 cmovb r8, rdx
145947474: 4885d2 test rdx, rdx
145947477: 0f84b3060000 je 0x145947b30
14594747d: 410f28c2 movaps xmm0, xmm10
145947481: f30f5ec1 divss xmm0, xmm1
145947485: 4c8b5320 mov r10, qword ptr [rbx + 0x20]
145947489: 458b8ea4000000 mov r9d, dword ptr [r14 + 0xa4]
145947490: b840000000 mov eax, 0x40
145947495: 31ff xor edi, edi
145947497: eb17 jmp 0x1459474b0
145947499: 0f1f8000000000 nop dword ptr [rax]
1459474a0: 48ffc7 inc rdi
1459474a3: 4883c048 add rax, 0x48
1459474a7: 4939f8 cmp r8, rdi
1459474aa: 0f8480060000 je 0x145947b30
1459474b0: 41bb01000000 mov r11d, 1
1459474b6: 89f9 mov ecx, edi
1459474b8: 41d3e3 shl r11d, cl
1459474bb: 410fa3f9 bt r9d, edi
1459474bf: 72df jb 0x1459474a0
1459474c1: 4839d7 cmp rdi, rdx
1459474c4: 0f8339360000 jae 0x14594ab03
1459474ca: f3410f100c02 movss xmm1, dword ptr [r10 + rax]
1459474d0: 0f2ec8 ucomiss xmm1, xmm0
1459474d3: 76cb jbe 0x1459474a0
1459474d5: 4509cb or r11d, r9d
1459474d8: 45899ea4000000 mov dword ptr [r14 + 0xa4], r11d
1459474df: 488b5328 mov rdx, qword ptr [rbx + 0x28]
1459474e3: 4839d7 cmp rdi, rdx
1459474e6: 0f83e6360000 jae 0x14594abd2
1459474ec: 488b4b20 mov rcx, qword ptr [rbx + 0x20]
1459474f0: 0f104401d0 movups xmm0, xmmword ptr [rcx + rax - 0x30]
1459474f5: 0f104c01e0 movups xmm1, xmmword ptr [rcx + rax - 0x20]
1459474fa: 0f105401f0 movups xmm2, xmmword ptr [rcx + rax - 0x10]
1459474ff: 0f299580020000 movaps xmmword ptr [rbp + 0x280], xmm2
145947506: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
14594750d: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
145947514: 488bb538020000 mov rsi, qword ptr [rbp + 0x238]
14594751b: 483bb528020000 cmp rsi, qword ptr [rbp + 0x228]
145947522: 7561 jne 0x145947585
145947524: c6853703000001 mov byte ptr [rbp + 0x337], 1
14594752b: c6853603000001 mov byte ptr [rbp + 0x336], 1
145947532: c6853503000001 mov byte ptr [rbp + 0x335], 1
145947539: c6853403000001 mov byte ptr [rbp + 0x334], 1
145947540: c6853303000001 mov byte ptr [rbp + 0x333], 1
145947547: c6853203000001 mov byte ptr [rbp + 0x332], 1
14594754e: c6853103000001 mov byte ptr [rbp + 0x331], 1
145947555: c6853003000001 mov byte ptr [rbp + 0x330], 1
14594755c: c6852f03000001 mov byte ptr [rbp + 0x32f], 1
145947563: c6852e03000001 mov byte ptr [rbp + 0x32e], 1
14594756a: c6852d03000001 mov byte ptr [rbp + 0x32d], 1
145947571: c6852c03000001 mov byte ptr [rbp + 0x32c], 1
145947578: 488d8d28020000 lea rcx, [rbp + 0x228]
14594757f: e8dc652c00 call 0x145c0db60
145947584: 90 nop
145947585: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
14594758c: 486bce38 imul rcx, rsi, 0x38
145947590: 488b95d8010000 mov rdx, qword ptr [rbp + 0x1d8]
145947597: 48891408 mov qword ptr [rax + rcx], rdx
14594759b: 0f288560020000 movaps xmm0, xmmword ptr [rbp + 0x260]
1459475a2: 0f288d70020000 movaps xmm1, xmmword ptr [rbp + 0x270]
1459475a9: 0f289580020000 movaps xmm2, xmmword ptr [rbp + 0x280]
1459475b0: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
1459475b5: 0f114c0818 movups xmmword ptr [rax + rcx + 0x18], xmm1
1459475ba: 0f11540828 movups xmmword ptr [rax + rcx + 0x28], xmm2
1459475bf: 48ffc6 inc rsi
1459475c2: 4889b538020000 mov qword ptr [rbp + 0x238], rsi
1459475c9: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
1459475d0: 488b88f8000000 mov rcx, qword ptr [rax + 0xf8]
1459475d7: 4885c9 test rcx, rcx
1459475da: 0f843e040000 je 0x145947a1e
