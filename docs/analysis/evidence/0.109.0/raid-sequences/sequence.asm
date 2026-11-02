1459592f4: 488b5908 mov rbx, qword ptr [rcx + 8]
1459592f8: 4885db test rbx, rbx
1459592fb: 0f8477e6ffff je 0x145957978
145959301: 488b39 mov rdi, qword ptr [rcx]
145959304: f30f107110 movss xmm6, dword ptr [rcx + 0x10]
145959309: 0f1007 movups xmm0, xmmword ptr [rdi]
14595930c: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
145959310: 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
145959314: 0f299530010000 movaps xmmword ptr [rbp + 0x130], xmm2
14595931b: 0f298d20010000 movaps xmmword ptr [rbp + 0x120], xmm1
145959322: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
145959329: 4c8d8510010000 lea r8, [rbp + 0x110]
145959330: 4889f1 mov rcx, rsi
145959333: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595933a: e8a1e5ffff call 0x1459578e0
14595933f: 4883fb01 cmp rbx, 1
145959343: 0f842fe6ffff je 0x145957978
145959349: 48c1e304 shl rbx, 4
14595934d: 4c8d3c5b lea r15, [rbx + rbx*2]
145959351: 4c8d8514010000 lea r8, [rbp + 0x114]
145959358: 4c8ba6b0050000 mov r12, qword ptr [rsi + 0x5b0]
14595935f: 4d89e5 mov r13, r12
145959362: 49c1e506 shl r13, 6
145959366: 4983cd0c or r13, 0xc
14595936a: bb01000000 mov ebx, 1
14595936f: 41be30000000 mov r14d, 0x30
145959375: 4889bd78010000 mov qword ptr [rbp + 0x178], rdi
14595937c: eb79 jmp 0x1459593f7
14595937e: 0f57c0 xorps xmm0, xmm0
145959381: f3480f2ac3 cvtsi2ss xmm0, rbx
145959386: f30f59c6 mulss xmm0, xmm6
14595938a: f30f58c7 addss xmm0, xmm7
14595938e: 488b86a8050000 mov rax, qword ptr [rsi + 0x5a8]
145959395: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
14595939c: 4a894c28f4 mov qword ptr [rax + r13 - 0xc], rcx
1459593a1: f3420f114428fc movss dword ptr [rax + r13 - 4], xmm0
1459593a8: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
1459593af: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
1459593b6: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
1459593bd: 420f110428 movups xmmword ptr [rax + r13], xmm0
1459593c2: 420f114c2810 movups xmmword ptr [rax + r13 + 0x10], xmm1
1459593c8: 420f11542820 movups xmmword ptr [rax + r13 + 0x20], xmm2
1459593ce: 8b8d40010000 mov ecx, dword ptr [rbp + 0x140]
1459593d4: 42894c2830 mov dword ptr [rax + r13 + 0x30], ecx
1459593d9: 49ffc4 inc r12
1459593dc: 4c89a6b0050000 mov qword ptr [rsi + 0x5b0], r12
1459593e3: 4983c540 add r13, 0x40
1459593e7: 4983c630 add r14, 0x30
1459593eb: 48ffc3 inc rbx
1459593ee: 4d39f7 cmp r15, r14
1459593f1: 0f8481e5ffff je 0x145957978
1459593f7: f30f10be340a0000 movss xmm7, dword ptr [rsi + 0xa34]
1459593ff: 420f100437 movups xmm0, xmmword ptr [rdi + r14]
145959404: 420f104c3710 movups xmm1, xmmword ptr [rdi + r14 + 0x10]
14595940a: 420f10543720 movups xmm2, xmmword ptr [rdi + r14 + 0x20]
145959410: 410f115020 movups xmmword ptr [r8 + 0x20], xmm2
145959415: 410f114810 movups xmmword ptr [r8 + 0x10], xmm1
14595941a: 410f1100 movups xmmword ptr [r8], xmm0
14595941e: 4c3ba6a0050000 cmp r12, qword ptr [rsi + 0x5a0]
145959425: 0f8553ffffff jne 0x14595937e
14595942b: 488d8ea0050000 lea rcx, [rsi + 0x5a0]
145959432: 4c89c7 mov rdi, r8
145959435: e836d22c00 call 0x145c26670
14595943a: 4989f8 mov r8, rdi
14595943d: 488bbd78010000 mov rdi, qword ptr [rbp + 0x178]
145959444: e935ffffff jmp 0x14595937e
