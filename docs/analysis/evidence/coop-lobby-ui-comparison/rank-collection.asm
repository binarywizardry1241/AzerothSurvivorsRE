0x140085820: push rbp
0x140085821: push r15
0x140085823: push r14
0x140085825: push r12
0x140085827: push rsi
0x140085828: push rdi
0x140085829: push rbx
0x14008582a: sub rsp, 0x50
0x14008582e: lea rbp, [rsp + 0x50]
0x140085833: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14008583b: mov rdi, r8
0x14008583e: mov rbx, rdx
0x140085841: mov rsi, rcx
0x140085844: nop word ptr cs:[rax + rax]
0x140085850: cmp rbx, rdi
0x140085853: je 0x1400858fc
0x140085859: mov r14, qword ptr [rbx + 0x108]
0x140085860: add rbx, 0x128
0x140085867: test r14, r14
0x14008586a: js 0x140085850
0x14008586c: call 0x140002200
0x140085871: mov ecx, 0x20
0x140085876: mov edx, 8
0x14008587b: call 0x1400021c0
0x140085880: test rax, rax
0x140085883: je 0x140085936
0x140085889: mov qword ptr [rax], r14
0x14008588c: mov qword ptr [rbp - 0x20], 4
0x140085894: mov qword ptr [rbp - 0x18], rax
0x140085898: mov r14d, 1
0x14008589e: lea r15, [rbp - 0x20]
0x1400858a2: mov qword ptr [rbp - 0x10], r14
0x1400858a6: nop word ptr cs:[rax + rax]
0x1400858b0: cmp rbx, rdi
0x1400858b3: je 0x140085915
0x1400858b5: mov r12, qword ptr [rbx + 0x108]
0x1400858bc: add rbx, 0x128
0x1400858c3: test r12, r12
0x1400858c6: js 0x1400858b0
0x1400858c8: cmp r14, qword ptr [rbp - 0x20]
0x1400858cc: jne 0x1400858f3
0x1400858ce: mov qword ptr [rsp + 0x20], 8
0x1400858d7: mov r8d, 1
0x1400858dd: mov r9d, 8
0x1400858e3: mov rcx, r15
0x1400858e6: mov rdx, r14
0x1400858e9: call 0x146005df0
0x1400858ee: nop 
0x1400858ef: mov rax, qword ptr [rbp - 0x18]
0x1400858f3: mov qword ptr [rax + r14*8], r12
0x1400858f7: inc r14
0x1400858fa: jmp 0x1400858a2
0x1400858fc: mov qword ptr [rsi], 0
0x140085903: mov qword ptr [rsi + 8], 8
0x14008590b: mov qword ptr [rsi + 0x10], 0
0x140085913: jmp 0x140085924
0x140085915: mov rax, qword ptr [rbp - 0x10]
0x140085919: mov qword ptr [rsi + 0x10], rax
0x14008591d: movups xmm0, xmmword ptr [rbp - 0x20]
0x140085921: movups xmmword ptr [rsi], xmm0
0x140085924: mov rax, rsi
0x140085927: add rsp, 0x50
0x14008592b: pop rbx
0x14008592c: pop rdi
0x14008592d: pop rsi
0x14008592e: pop r12
0x140085930: pop r14
0x140085932: pop r15
0x140085934: pop rbp
0x140085935: ret 
0x140085936: mov ecx, 8
0x14008593b: mov edx, 0x20
0x140085940: call 0x1461add5b
0x140085945: ud2 
