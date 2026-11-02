1459532d0: 4d39f5 cmp r13, r14
1459532d3: 743b je 0x145953310
1459532d5: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
1459532dc: 4a8b1430 mov rdx, qword ptr [rax + r14]
1459532e0: 4983c608 add r14, 8
1459532e4: c644243000 mov byte ptr [rsp + 0x30], 0
1459532e9: c644242800 mov byte ptr [rsp + 0x28], 0
1459532ee: c644242002 mov byte ptr [rsp + 0x20], 2
1459532f3: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
1459532fa: 0f28d6 movaps xmm2, xmm6
1459532fd: 4589f9 mov r9d, r15d
145953300: e88be10100 call 0x145971490
