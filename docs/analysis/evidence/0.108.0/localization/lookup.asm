; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e5790..0x1458e59d3 (579 bytes), SHA256 5f4aabf8c9d61a38ffa34aeee8cd2a272591ab19196ec6be2dd572fb9a58a3df
0x1458e5790: push r15
0x1458e5792: push r14
0x1458e5794: push r13
0x1458e5796: push r12
0x1458e5798: push rsi
0x1458e5799: push rdi
0x1458e579a: push rbp
0x1458e579b: push rbx
0x1458e579c: sub rsp, 0x68
0x1458e57a0: movdqa xmmword ptr [rsp + 0x50], xmm8
0x1458e57a7: movdqa xmmword ptr [rsp + 0x40], xmm7
0x1458e57ad: movdqa xmmword ptr [rsp + 0x30], xmm6
0x1458e57b3: mov rsi, rdx
0x1458e57b6: mov rdi, rcx
0x1458e57b9: mov eax, dword ptr [rip + 0x2769e01]
0x1458e57bf: test eax, eax
0x1458e57c1: jne 0x1458e59bb
0x1458e57c7: mov rbx, qword ptr [rip + 0x2769de2]
0x1458e57ce: mov rdx, qword ptr [rip + 0x2769de3]
0x1458e57d5: mov rcx, qword ptr [rip + 0x276c8f4]
0x1458e57dc: lea rax, [rdx - 1]
0x1458e57e0: cmp rax, rcx
0x1458e57e3: cmovb rcx, rax
0x1458e57e7: cmp rcx, rdx
0x1458e57ea: jae 0x1458e59c5
0x1458e57f0: lea r15, [rcx + rcx*2]
0x1458e57f4: shl r15, 4
0x1458e57f8: cmp qword ptr [rbx + r15 + 0x18], 0
0x1458e57fe: je 0x1458e58ce
0x1458e5804: add r15, rbx
0x1458e5807: lea rcx, [r15 + 0x20]
0x1458e580b: mov rdx, rdi
0x1458e580e: mov r8, rsi
0x1458e5811: call 0x1400179a0
0x1458e5816: mov rcx, rax
0x1458e5819: shr rcx, 0x39
0x1458e581d: mov r14, qword ptr [r15]
0x1458e5820: mov r15, qword ptr [r15 + 8]
0x1458e5824: movd xmm0, ecx
0x1458e5828: punpcklbw xmm0, xmm0
0x1458e582c: pshuflw xmm0, xmm0, 0
0x1458e5831: pshufd xmm6, xmm0, 0x44
0x1458e5836: xor edx, edx
0x1458e5838: pcmpeqd xmm7, xmm7
0x1458e583c: and rax, r15
0x1458e583f: movdqu xmm8, xmmword ptr [r14 + rax]
0x1458e5845: movdqa xmm0, xmm8
0x1458e584a: pcmpeqb xmm0, xmm6
0x1458e584e: pmovmskb r13d, xmm0
0x1458e5853: test r13d, r13d
0x1458e5856: je 0x1458e58b0
0x1458e5858: mov qword ptr [rsp + 0x28], rdx
0x1458e585d: tzcnt ecx, r13d
0x1458e5862: mov r12, rax
0x1458e5865: add rcx, rax
0x1458e5868: and rcx, r15
0x1458e586b: neg rcx
0x1458e586e: lea rax, [rcx + rcx*4]
0x1458e5872: cmp rsi, qword ptr [r14 + rax*8 - 0x18]
0x1458e5877: jne 0x1458e5894
0x1458e5879: lea rbp, [r14 + rax*8]
0x1458e587d: mov rdx, qword ptr [rbp - 0x20]
0x1458e5881: mov rcx, rdi
0x1458e5884: mov r8, rsi
0x1458e5887: call 0x145bf2947
0x1458e588c: test eax, eax
0x1458e588e: je 0x1458e598a
0x1458e5894: lea eax, [r13 - 1]
0x1458e5898: and ax, r13w
0x1458e589c: mov r13d, eax
0x1458e589f: mov rax, r12
0x1458e58a2: mov rdx, qword ptr [rsp + 0x28]
0x1458e58a7: jne 0x1458e585d
0x1458e58a9: nop dword ptr [rax]
0x1458e58b0: pcmpeqb xmm8, xmm7
0x1458e58b5: pmovmskb ecx, xmm8
0x1458e58ba: test ecx, ecx
0x1458e58bc: jne 0x1458e58ce
0x1458e58be: add rax, rdx
0x1458e58c1: add rax, 0x10
0x1458e58c5: add rdx, 0x10
0x1458e58c9: jmp 0x1458e583c
0x1458e58ce: cmp qword ptr [rbx + 0x18], 0
0x1458e58d3: je 0x1458e5994
0x1458e58d9: lea rcx, [rbx + 0x20]
0x1458e58dd: mov rdx, rdi
0x1458e58e0: mov r8, rsi
0x1458e58e3: call 0x1400179a0
0x1458e58e8: mov rcx, rax
0x1458e58eb: shr rcx, 0x39
0x1458e58ef: mov r14, qword ptr [rbx]
0x1458e58f2: mov rbx, qword ptr [rbx + 8]
0x1458e58f6: movd xmm0, ecx
0x1458e58fa: punpcklbw xmm0, xmm0
0x1458e58fe: pshuflw xmm0, xmm0, 0
0x1458e5903: pshufd xmm6, xmm0, 0x44
0x1458e5908: pcmpeqd xmm7, xmm7
0x1458e590c: xor r15d, r15d
0x1458e590f: and rax, rbx
0x1458e5912: movdqu xmm8, xmmword ptr [r14 + rax]
0x1458e5918: movdqa xmm0, xmm8
0x1458e591d: pcmpeqb xmm0, xmm6
0x1458e5921: pmovmskb r12d, xmm0
0x1458e5926: test r12d, r12d
0x1458e5929: je 0x1458e596f
0x1458e592b: tzcnt ecx, r12d
0x1458e5930: mov r13, rax
0x1458e5933: add rcx, rax
0x1458e5936: and rcx, rbx
0x1458e5939: neg rcx
0x1458e593c: lea rax, [rcx + rcx*4]
0x1458e5940: cmp rsi, qword ptr [r14 + rax*8 - 0x18]
0x1458e5945: jne 0x1458e595e
0x1458e5947: lea rbp, [r14 + rax*8]
0x1458e594b: mov rdx, qword ptr [rbp - 0x20]
0x1458e594f: mov rcx, rdi
0x1458e5952: mov r8, rsi
0x1458e5955: call 0x145bf2947
0x1458e595a: test eax, eax
0x1458e595c: je 0x1458e598a
0x1458e595e: lea eax, [r12 - 1]
0x1458e5963: and ax, r12w
0x1458e5967: mov r12d, eax
0x1458e596a: mov rax, r13
0x1458e596d: jne 0x1458e592b
0x1458e596f: pcmpeqb xmm8, xmm7
0x1458e5974: pmovmskb ecx, xmm8
0x1458e5979: test ecx, ecx
0x1458e597b: jne 0x1458e5998
0x1458e597d: add rax, r15
0x1458e5980: add rax, 0x10
0x1458e5984: add r15, 0x10
0x1458e5988: jmp 0x1458e590f
0x1458e598a: mov rax, qword ptr [rbp - 0x10]
0x1458e598e: mov rdx, qword ptr [rbp - 8]
0x1458e5992: jmp 0x1458e599a
0x1458e5994: xor eax, eax
0x1458e5996: jmp 0x1458e599a
0x1458e5998: xor eax, eax
0x1458e599a: movaps xmm6, xmmword ptr [rsp + 0x30]
0x1458e599f: movaps xmm7, xmmword ptr [rsp + 0x40]
0x1458e59a4: movaps xmm8, xmmword ptr [rsp + 0x50]
0x1458e59aa: add rsp, 0x68
0x1458e59ae: pop rbx
0x1458e59af: pop rbp
0x1458e59b0: pop rdi
0x1458e59b1: pop rsi
0x1458e59b2: pop r12
0x1458e59b4: pop r13
0x1458e59b6: pop r14
0x1458e59b8: pop r15
0x1458e59ba: ret
0x1458e59bb: call 0x145d7837e
0x1458e59c0: jmp 0x1458e57c7
0x1458e59c5: lea r8, [rip + 0x130581c]
0x1458e59cc: call 0x145d93893
0x1458e59d1: ud2
