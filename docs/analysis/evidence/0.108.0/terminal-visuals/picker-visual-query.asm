1403d90e0 55 push rbp
1403d90e1 4157 push r15
1403d90e3 4156 push r14
1403d90e5 56 push rsi
1403d90e6 57 push rdi
1403d90e7 53 push rbx
1403d90e8 4881ece8020000 sub rsp, 0x2e8
1403d90ef 488dac2480000000 lea rbp, [rsp + 0x80]
1403d90f7 48c78560020000feffffff mov qword ptr [rbp + 0x260], 0xfffffffffffffffe
1403d9102 4889d7 mov rdi, rdx
1403d9105 4889ce mov rsi, rcx
1403d9108 4889d1 mov rcx, rdx
1403d910b e880dbefff call 0x1402d6c90
1403d9110 4889c3 mov rbx, rax
1403d9113 4889f9 mov rcx, rdi
1403d9116 e8c504f2ff call 0x1402f95e0
1403d911b 4989c6 mov r14, rax
1403d911e 4889f9 mov rcx, rdi
1403d9121 e84ae6efff call 0x1402d7770
1403d9126 4989c7 mov r15, rax
1403d9129 4889f9 mov rcx, rdi
1403d912c e87fcaefff call 0x1402d5bb0
1403d9131 48899d38020000 mov qword ptr [rbp + 0x238], rbx
1403d9138 4c89b540020000 mov qword ptr [rbp + 0x240], r14
1403d913f 4c89bd48020000 mov qword ptr [rbp + 0x248], r15
1403d9146 48898550020000 mov qword ptr [rbp + 0x250], rax
1403d914d 4889f9 mov rcx, rdi
1403d9150 e83bdbefff call 0x1402d6c90
1403d9155 4889c3 mov rbx, rax
1403d9158 4c8d75a0 lea r14, [rbp - 0x60]
1403d915c 4c89f1 mov rcx, r14
1403d915f e8ec06aa04 call 0x144e79850
1403d9164 c6855f02000001 mov byte ptr [rbp + 0x25f], 1
1403d916b 488d8d38020000 lea rcx, [rbp + 0x238]
1403d9172 4c89f2 mov rdx, r14
1403d9175 e8f658fdff call 0x1403aea70
1403d917a 90 nop
1403d917b c6855f02000001 mov byte ptr [rbp + 0x25f], 1
1403d9182 488d4d50 lea rcx, [rbp + 0x50]
1403d9186 e8c506aa04 call 0x144e79850
1403d918b 90 nop
1403d918c 0fb685e1000000 movzx eax, byte ptr [rbp + 0xe1]
1403d9193 483b9d90000000 cmp rbx, qword ptr [rbp + 0x90]
1403d919a 0f83ef000000 jae 0x1403d928f
1403d91a0 488b8d80000000 mov rcx, qword ptr [rbp + 0x80]
1403d91a7 4889da mov rdx, rbx
1403d91aa 48c1ea06 shr rdx, 6
1403d91ae 488b0cd1 mov rcx, qword ptr [rcx + rdx*8]
1403d91b2 480fa3d9 bt rcx, rbx
1403d91b6 1c00 sbb al, 0
1403d91b8 0f85d9000000 jne 0x1403d9297
1403d91be 488d4d50 lea rcx, [rbp + 0x50]
1403d91c2 4889da mov rdx, rbx
1403d91c5 e8569da904 call 0x144e72f20
1403d91ca 90 nop
1403d91cb 488d4da0 lea rcx, [rbp - 0x60]
1403d91cf 488d5550 lea rdx, [rbp + 0x50]
1403d91d3 e8b8a0a904 call 0x144e73290
1403d91d8 90 nop
1403d91d9 41b601 mov r14b, 1
1403d91dc 4883bf9000000000 cmp qword ptr [rdi + 0x90], 0
1403d91e4 0f8440010000 je 0x1403d932a
1403d91ea 488b4778 mov rax, qword ptr [rdi + 0x78]
1403d91ee 488b8f80000000 mov rcx, qword ptr [rdi + 0x80]
1403d91f5 48ba1942cea89620590e movabs rdx, 0xe592096a8ce4219
1403d91ff 4531c0 xor r8d, r8d
1403d9202 660f6f0506409f05 movdqa xmm0, xmmword ptr [rip + 0x59f4006]
1403d920a 660f76c9 pcmpeqd xmm1, xmm1
1403d920e 660f6f15ea74a205 movdqa xmm2, xmmword ptr [rip + 0x5a274ea]
1403d9216 4821ca and rdx, rcx
1403d9219 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1403d921e 660f6fe3 movdqa xmm4, xmm3
1403d9222 660f74e0 pcmpeqb xmm4, xmm0
1403d9226 66440fd7cc pmovmskb r9d, xmm4
1403d922b 4585c9 test r9d, r9d
1403d922e 7440 je 0x1403d9270
1403d9230 f3450fbcd1 tzcnt r10d, r9d
1403d9235 4901d2 add r10, rdx
1403d9238 4921ca and r10, rcx
1403d923b 49f7da neg r10
1403d923e 4f8d1452 lea r10, [r10 + r10*2]
1403d9242 f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403d9249 660f74e2 pcmpeqb xmm4, xmm2
1403d924d 66440fd7dc pmovmskb r11d, xmm4
1403d9252 4181fbffff0000 cmp r11d, 0xffff
1403d9259 7475 je 0x1403d92d0
1403d925b 458d51ff lea r10d, [r9 - 1]
1403d925f 664521ca and r10w, r9w
1403d9263 4589d1 mov r9d, r10d
1403d9266 75c8 jne 0x1403d9230
1403d9268 0f1f840000000000 nop dword ptr [rax + rax]
1403d9270 660f74d9 pcmpeqb xmm3, xmm1
1403d9274 66440fd7cb pmovmskb r9d, xmm3
1403d9279 4585c9 test r9d, r9d
1403d927c 0f85a8000000 jne 0x1403d932a
1403d9282 4c01c2 add rdx, r8
1403d9285 4883c210 add rdx, 0x10
1403d9289 4983c010 add r8, 0x10
1403d928d eb87 jmp 0x1403d9216
1403d928f 84c0 test al, al
1403d9291 0f8427ffffff je 0x1403d91be
1403d9297 488d855e020000 lea rax, [rbp + 0x25e]
1403d929e 48898500010000 mov qword ptr [rbp + 0x100], rax
1403d92a5 488d0574dcc104 lea rax, [rip + 0x4c1dc74]
1403d92ac 48898508010000 mov qword ptr [rbp + 0x108], rax
1403d92b3 488d0da675a205 lea rcx, [rip + 0x5a275a6]
1403d92ba 4c8d057f76a205 lea r8, [rip + 0x5a2767f]
1403d92c1 488d9500010000 lea rdx, [rbp + 0x100]
1403d92c8 e8a3a79b05 call 0x145d93a70
1403d92cd 90 nop
1403d92ce 0f0b ud2
1403d92d0 4a8d04d0 lea rax, [rax + r10*8]
1403d92d4 488b40f8 mov rax, qword ptr [rax - 8]
1403d92d8 483b8718020000 cmp rax, qword ptr [rdi + 0x218]
1403d92df 7349 jae 0x1403d932a
1403d92e1 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403d92e8 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1403d92ec 4885c9 test rcx, rcx
1403d92ef 7439 je 0x1403d932a
1403d92f1 488b87e0010000 mov rax, qword ptr [rdi + 0x1e0]
1403d92f8 48f7d1 not rcx
1403d92fb 486bc938 imul rcx, rcx, 0x38
1403d92ff 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
1403d9304 7524 jne 0x1403d932a
1403d9306 4801c8 add rax, rcx
1403d9309 4c8b7010 mov r14, qword ptr [rax + 0x10]
1403d930d 488d55a0 lea rdx, [rbp - 0x60]
1403d9311 4c89f1 mov rcx, r14
1403d9314 e8a799a204 call 0x144e02cc0
1403d9319 90 nop
1403d931a 488d5740 lea rdx, [rdi + 0x40]
1403d931e 4c89f1 mov rcx, r14
1403d9321 e8fa9aa204 call 0x144e02e20
1403d9326 90 nop
1403d9327 4189c6 mov r14d, eax
1403d932a 4c8bbfa0050000 mov r15, qword ptr [rdi + 0x5a0]
1403d9331 488d8d40010000 lea rcx, [rbp + 0x140]
1403d9338 488d55a0 lea rdx, [rbp - 0x60]
1403d933c 41b8b0000000 mov r8d, 0xb0
1403d9342 e8f4958105 call 0x145bf293b
1403d9347 4c89bd00010000 mov qword ptr [rbp + 0x100], r15
1403d934e c7850801000000000000 mov dword ptr [rbp + 0x108], 0
1403d9358 48c7851001000010000000 mov qword ptr [rbp + 0x110], 0x10
1403d9363 660fefc0 pxor xmm0, xmm0
1403d9367 f30f7f8518010000 movdqu xmmword ptr [rbp + 0x118], xmm0
1403d936f 48c7852801000010000000 mov qword ptr [rbp + 0x128], 0x10
1403d937a f30f7f8530010000 movdqu xmmword ptr [rbp + 0x130], xmm0
1403d9382 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
1403d938d 48c785f801000004000000 mov qword ptr [rbp + 0x1f8], 4
1403d9398 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1403d93a3 4488b508020000 mov byte ptr [rbp + 0x208], r14b
1403d93aa f30f6f8538020000 movdqu xmm0, xmmword ptr [rbp + 0x238]
1403d93b2 f30f6f8d48020000 movdqu xmm1, xmmword ptr [rbp + 0x248]
1403d93ba f30f7f8510020000 movdqu xmmword ptr [rbp + 0x210], xmm0
1403d93c2 f30f7f8d20020000 movdqu xmmword ptr [rbp + 0x220], xmm1
1403d93ca 48899d30020000 mov qword ptr [rbp + 0x230], rbx
1403d93d1 c6855f02000000 mov byte ptr [rbp + 0x25f], 0
1403d93d8 488d4d50 lea rcx, [rbp + 0x50]
1403d93dc e8af84fdff call 0x1403b1890
1403d93e1 90 nop
1403d93e2 488d8d00010000 lea rcx, [rbp + 0x100]
1403d93e9 4889fa mov rdx, rdi
1403d93ec e8cff8ffff call 0x1403d8cc0
1403d93f1 90 nop
1403d93f2 488d9500010000 lea rdx, [rbp + 0x100]
1403d93f9 41b838010000 mov r8d, 0x138
1403d93ff 4889f1 mov rcx, rsi
1403d9402 e834958105 call 0x145bf293b
1403d9407 4889f0 mov rax, rsi
1403d940a 4881c4e8020000 add rsp, 0x2e8
1403d9411 5b pop rbx
1403d9412 5f pop rdi
1403d9413 5e pop rsi
1403d9414 415e pop r14
1403d9416 415f pop r15
1403d9418 5d pop rbp
1403d9419 c3 ret
