145957260: 56 push rsi
145957261: 57 push rdi
145957262: 53 push rbx
145957263: 4881ec80000000 sub rsp, 0x80
14595726a: 0f297c2470 movaps xmmword ptr [rsp + 0x70], xmm7
14595726f: 0f29742460 movaps xmmword ptr [rsp + 0x60], xmm6
145957274: 4c89c7 mov rdi, r8
145957277: 0f28f1 movaps xmm6, xmm1
14595727a: 4889ce mov rsi, rcx
14595727d: f30f10b9340a0000 movss xmm7, dword ptr [rcx + 0xa34]
145957285: 410f1001 movups xmm0, xmmword ptr [r9]
145957289: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
14595728e: 410f105120 movups xmm2, xmmword ptr [r9 + 0x20]
145957293: 0f11542450 movups xmmword ptr [rsp + 0x50], xmm2
145957298: 0f114c2440 movups xmmword ptr [rsp + 0x40], xmm1
14595729d: 0f11442430 movups xmmword ptr [rsp + 0x30], xmm0
1459572a2: 488b99b0050000 mov rbx, qword ptr [rcx + 0x5b0]
1459572a9: 483b99a0050000 cmp rbx, qword ptr [rcx + 0x5a0]
1459572b0: 750c jne 0x1459572be
1459572b2: 488d8ea0050000 lea rcx, [rsi + 0x5a0]
1459572b9: e8b2f32c00 call 0x145c26670
1459572be: f30f58f7 addss xmm6, xmm7
1459572c2: 488b86a8050000 mov rax, qword ptr [rsi + 0x5a8]
1459572c9: 4889d9 mov rcx, rbx
1459572cc: 48c1e106 shl rcx, 6
1459572d0: 48893c08 mov qword ptr [rax + rcx], rdi
1459572d4: f30f11740808 movss dword ptr [rax + rcx + 8], xmm6
1459572da: 0f1044242c movups xmm0, xmmword ptr [rsp + 0x2c]
1459572df: 0f104c243c movups xmm1, xmmword ptr [rsp + 0x3c]
1459572e4: 0f1054244c movups xmm2, xmmword ptr [rsp + 0x4c]
1459572e9: 0f1144080c movups xmmword ptr [rax + rcx + 0xc], xmm0
1459572ee: 0f114c081c movups xmmword ptr [rax + rcx + 0x1c], xmm1
1459572f3: 0f1154082c movups xmmword ptr [rax + rcx + 0x2c], xmm2
1459572f8: 8b54245c mov edx, dword ptr [rsp + 0x5c]
1459572fc: 8954083c mov dword ptr [rax + rcx + 0x3c], edx
145957300: 48ffc3 inc rbx
145957303: 48899eb0050000 mov qword ptr [rsi + 0x5b0], rbx
14595730a: 0f28742460 movaps xmm6, xmmword ptr [rsp + 0x60]
14595730f: 0f287c2470 movaps xmm7, xmmword ptr [rsp + 0x70]
145957314: 4881c480000000 add rsp, 0x80
14595731b: 5b pop rbx
14595731c: 5f pop rdi
14595731d: 5e pop rsi
14595731e: c3 ret
