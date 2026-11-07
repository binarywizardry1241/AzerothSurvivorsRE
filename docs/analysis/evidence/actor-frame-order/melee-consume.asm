14597b7ed: eb4a jmp 0x14597b839
14597b7ef: 90 nop 
14597b7f0: 4983c410 add r12, 0x10
14597b7f4: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14597b7fb: 488b8120060000 mov rax, qword ptr [rcx + 0x620]
14597b802: 4889f2 mov rdx, rsi
14597b805: 48c1e205 shl rdx, 5
14597b809: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
14597b810: 0f108d70020000 movups xmm1, xmmword ptr [rbp + 0x270]
14597b817: 0f114c1010 movups xmmword ptr [rax + rdx + 0x10], xmm1
14597b81c: 0f110410 movups xmmword ptr [rax + rdx], xmm0
14597b820: 48ffc6 inc rsi
14597b823: 4889b128060000 mov qword ptr [rcx + 0x628], rsi
14597b82a: 0f28cf movaps xmm1, xmm7
14597b82d: 4989d8 mov r8, rbx
14597b830: 41b101 mov r9b, 1
14597b833: e89850faff call 0x1459208d0
14597b838: 90 nop 
14597b839: 4d39f4 cmp r12, r14
14597b83c: 0f8481000000 je 0x14597b8c3
14597b842: f3410f103c24 movss xmm7, dword ptr [r12]
14597b848: 410f28c0 movaps xmm0, xmm8
14597b84c: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
14597b853: f30f5c8098040000 subss xmm0, dword ptr [rax + 0x498]
14597b85b: f30f59c7 mulss xmm0, xmm7
14597b85f: f3410f5fc0 maxss xmm0, xmm8
14597b864: f3480f2cc0 cvttss2si rax, xmm0
14597b869: 410f2ec2 ucomiss xmm0, xmm10
14597b86d: 410f42c7 cmovb eax, r15d
14597b871: 410f2ec1 ucomiss xmm0, xmm9
14597b875: 41b9ffffffff mov r9d, 0xffffffff
14597b87b: 7703 ja 0x14597b880
14597b87d: 4189c1 mov r9d, eax
14597b880: 498b5c2408 mov rbx, qword ptr [r12 + 8]
14597b885: 4d8b8560040000 mov r8, qword ptr [r13 + 0x460]
14597b88c: c644242000 mov byte ptr [rsp + 0x20], 0
14597b891: 4889f9 mov rcx, rdi
14597b894: 4889da mov rdx, rbx
14597b897: e8f482f4ff call 0x1458c3b90
14597b89c: 90 nop 
14597b89d: 498bb528060000 mov rsi, qword ptr [r13 + 0x628]
14597b8a4: 493bb518060000 cmp rsi, qword ptr [r13 + 0x618]
14597b8ab: 0f853fffffff jne 0x14597b7f0
14597b8b1: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14597b8b8: e853f52700 call 0x145bfae10
14597b8bd: 90 nop 
14597b8be: e92dffffff jmp 0x14597b7f0
