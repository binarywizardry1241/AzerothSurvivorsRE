14594a80b: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
14594a812: 4885c0 test rax, rax
14594a815: 0f8492000000 je 0x14594a8ad
14594a81b: 486bd838 imul rbx, rax, 0x38
14594a81f: 4c8bb588030000 mov r14, qword ptr [rbp + 0x388]
14594a826: 4c01f3 add rbx, r14
14594a829: be1d000000 mov esi, 0x1d
14594a82e: 488dbd90020000 lea rdi, [rbp + 0x290]
14594a835: eb12 jmp 0x14594a849
14594a837: 660f1f840000000000 nop word ptr [rax + rax]
14594a840: 4983c638 add r14, 0x38
14594a844: 4939de cmp r14, rbx
14594a847: 7464 je 0x14594a8ad
14594a849: 410fb64635 movzx eax, byte ptr [r14 + 0x35]
14594a84e: 3cff cmp al, 0xff
14594a850: 745b je 0x14594a8ad
14594a852: 498b16 mov rdx, qword ptr [r14]
14594a855: 410fb74e36 movzx ecx, word ptr [r14 + 0x36]
14594a85a: 410f104608 movups xmm0, xmmword ptr [r14 + 8]
14594a85f: 410f104e18 movups xmm1, xmmword ptr [r14 + 0x18]
14594a864: 410f105625 movups xmm2, xmmword ptr [r14 + 0x25]
14594a869: 0f1195ad020000 movups xmmword ptr [rbp + 0x2ad], xmm2
14594a870: 0f298da0020000 movaps xmmword ptr [rbp + 0x2a0], xmm1
14594a877: 0f298590020000 movaps xmmword ptr [rbp + 0x290], xmm0
14594a87e: 8885bd020000 mov byte ptr [rbp + 0x2bd], al
14594a884: 66898dbe020000 mov word ptr [rbp + 0x2be], cx
14594a88b: 2c03 sub al, 3
14594a88d: 0fb6c0 movzx eax, al
14594a890: 0f42c6 cmovb eax, esi
14594a893: 3c09 cmp al, 9
14594a895: 74a9 je 0x14594a840
14594a897: 0fb6c0 movzx eax, al
14594a89a: 83f817 cmp eax, 0x17
14594a89d: 74a1 je 0x14594a840
14594a89f: 4c89e1 mov rcx, r12
14594a8a2: 4989f8 mov r8, rdi
14594a8a5: e8762afdff call 0x14591d320
14594a8aa: 90 nop
14594a8ab: eb93 jmp 0x14594a840
