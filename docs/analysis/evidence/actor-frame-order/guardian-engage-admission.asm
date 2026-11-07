14597c822: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
14597c829: 48898520030000 mov qword ptr [rbp + 0x320], rax
14597c830: 4c8ba5e8000000 mov r12, qword ptr [rbp + 0xe8]
14597c837: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
14597c83e: 4d8d34c4 lea r14, [r12 + rax*8]
14597c842: 31f6 xor esi, esi
14597c844: 0f57ff xorps xmm7, xmm7
14597c847: 450f57d2 xorps xmm10, xmm10
14597c84b: 4c89a5c8020000 mov qword ptr [rbp + 0x2c8], r12
14597c852: eb4c jmp 0x14597c8a0
14597c854: 488b8720060000 mov rax, qword ptr [rdi + 0x620]
14597c85b: 4889f1 mov rcx, rsi
14597c85e: 48c1e105 shl rcx, 5
14597c862: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
14597c869: 0f108d70020000 movups xmm1, xmmword ptr [rbp + 0x270]
14597c870: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14597c875: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14597c879: 48ffc6 inc rsi
14597c87c: 4889b728060000 mov qword ptr [rdi + 0x628], rsi
14597c883: 488d8da8010000 lea rcx, [rbp + 0x1a8]
14597c88a: e8117f0300 call 0x1459b47a0
14597c88f: 90 nop 
14597c890: 31f6 xor esi, esi
14597c892: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14597c8a0: 4d39f4 cmp r12, r14
14597c8a3: 0f8466040000 je 0x14597cd0f
14597c8a9: 4d8b2c24 mov r13, qword ptr [r12]
14597c8ad: 4983c408 add r12, 8
14597c8b1: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
14597c8b8: 488b9860050000 mov rbx, qword ptr [rax + 0x560]
14597c8bf: 4c69b868050000d8010000 imul r15, qword ptr [rax + 0x568], 0x1d8
14597c8ca: 31c0 xor eax, eax
14597c8cc: 4889d9 mov rcx, rbx
14597c8cf: 90 nop 
14597c8d0: 4939c7 cmp r15, rax
14597c8d3: 74cb je 0x14597c8a0
14597c8d5: 4805d8010000 add rax, 0x1d8
14597c8db: 4c39a9f0000000 cmp qword ptr [rcx + 0xf0], r13
14597c8e2: 488d89d8010000 lea rcx, [rcx + 0x1d8]
14597c8e9: 75e5 jne 0x14597c8d0
14597c8eb: 4883bc0380feffffff cmp qword ptr [rbx + rax - 0x180], -1
14597c8f4: 74aa je 0x14597c8a0
14597c8f6: 488b8403b8feffff mov rax, qword ptr [rbx + rax - 0x148]
14597c8fe: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14597c905: 483b8170060000 cmp rax, qword ptr [rcx + 0x670]
14597c90c: 7392 jae 0x14597c8a0
14597c90e: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14597c915: 488b9168060000 mov rdx, qword ptr [rcx + 0x668]
14597c91c: 488d0480 lea rax, [rax + rax*4]
14597c920: 488b7cc210 mov rdi, qword ptr [rdx + rax*8 + 0x10]
14597c925: 4889fa mov rdx, rdi
14597c928: e8c3f80100 call 0x14599c1f0
14597c92d: 90 nop 
14597c92e: 0f28f0 movaps xmm6, xmm0
14597c931: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14597c938: 4889fa mov rdx, rdi
14597c93b: e8b0fc0100 call 0x14599c5f0
14597c940: 90 nop 
14597c941: 4881c328feffff add rbx, -0x1d8
14597c948: 0f1f840000000000 nop dword ptr [rax + rax]
14597c950: 4d85ff test r15, r15
14597c953: 0f8447ffffff je 0x14597c8a0
14597c959: 488dbbd8010000 lea rdi, [rbx + 0x1d8]
14597c960: 4981c728feffff add r15, -0x1d8
14597c967: 4c39abc8020000 cmp qword ptr [rbx + 0x2c8], r13
14597c96e: 4889fb mov rbx, rdi
14597c971: 75dd jne 0x14597c950
