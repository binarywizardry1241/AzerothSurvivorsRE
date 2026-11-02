0x14592a4e8: 488b5540 mov rdx, qword ptr [rbp + 0x40]
0x14592a4ec: 488b82d0000000 mov rax, qword ptr [rdx + 0xd0]
0x14592a4f3: 488b8ad8000000 mov rcx, qword ptr [rdx + 0xd8]
0x14592a4fa: 48c1e107 shl rcx, 7
0x14592a4fe: 4c8b5548 mov r10, qword ptr [rbp + 0x48]
0x14592a502: 4c8b5d50 mov r11, qword ptr [rbp + 0x50]
0x14592a506: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14592a510: 4885c9 test rcx, rcx
0x14592a513: 0f845f010000 je 0x14592a678
0x14592a519: 4c8b4018 mov r8, qword ptr [rax + 0x18]
0x14592a51d: 4883e880 sub rax, -0x80
0x14592a521: 4883c180 add rcx, -0x80
0x14592a525: 4180783906 cmp byte ptr [r8 + 0x39], 6
0x14592a52a: 75e4 jne 0x14592a510
0x14592a52c: 488d05acf12d01 lea rax, [rip + 0x12df1ac]
0x14592a533: 48894508 mov qword ptr [rbp + 8], rax
0x14592a537: 48c7451008000000 mov qword ptr [rbp + 0x10], 8
0x14592a53f: 4531c9 xor r9d, r9d
0x14592a542: 488d0567b92c01 lea rax, [rip + 0x12cb967]
0x14592a549: 48b968656c6c66697265 movabs rcx, 0x657269666c6c6568
0x14592a553: eb1c jmp 0x14592a571
0x14592a555: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14592a560: 4983c178 add r9, 0x78
0x14592a564: 4981f9f8340000 cmp r9, 0x34f8
0x14592a56b: 0f8462010000 je 0x14592a6d3
0x14592a571: 49837c010808 cmp qword ptr [r9 + rax + 8], 8
0x14592a577: 75e7 jne 0x14592a560
0x14592a579: 4d8b0401 mov r8, qword ptr [r9 + rax]
0x14592a57d: 493908 cmp qword ptr [r8], rcx
0x14592a580: 75de jne 0x14592a560
0x14592a582: 4c01c8 add rax, r9
0x14592a585: f30f103dd32c4800 movss xmm7, dword ptr [rip + 0x482cd3]
0x14592a58d: 48837d6000 cmp qword ptr [rbp + 0x60], 0
0x14592a592: 7431 je 0x14592a5c5
0x14592a594: 4531c9 xor r9d, r9d
0x14592a597: eb10 jmp 0x14592a5a9
0x14592a599: 0f1f8000000000 nop dword ptr [rax]
0x14592a5a0: 4983c158 add r9, 0x58
0x14592a5a4: 4d39cb cmp r11, r9
0x14592a5a7: 741c je 0x14592a5c5
0x14592a5a9: 4b8b1c0a mov rbx, qword ptr [r10 + r9]
0x14592a5ad: 48837b0808 cmp qword ptr [rbx + 8], 8
0x14592a5b2: 75ec jne 0x14592a5a0
0x14592a5b4: 4c8b03 mov r8, qword ptr [rbx]
0x14592a5b7: 493908 cmp qword ptr [r8], rcx
0x14592a5ba: 75e4 jne 0x14592a5a0
0x14592a5bc: f3430f107c0a1c movss xmm7, dword ptr [r10 + r9 + 0x1c]
0x14592a5c3: eb03 jmp 0x14592a5c8
0x14592a5c5: 4889c3 mov rbx, rax
0x14592a5c8: 4881c2c8010000 add rdx, 0x1c8
0x14592a5cf: 488d4da8 lea rcx, [rbp - 0x58]
0x14592a5d3: e8a8d2f6ff call 0x145897880
0x14592a5d8: 90 nop
0x14592a5d9: 488d4d08 lea rcx, [rbp + 8]
0x14592a5dd: 488d55a8 lea rdx, [rbp - 0x58]
0x14592a5e1: 4989d8 mov r8, rbx
0x14592a5e4: e8c7d4f6ff call 0x145897ab0
0x14592a5e9: 90 nop
0x14592a5ea: f30f597d14 mulss xmm7, dword ptr [rbp + 0x14]
0x14592a5ef: 488d4da8 lea rcx, [rbp - 0x58]
0x14592a5f3: e808bdf6ff call 0x145896300
0x14592a5f8: f30f597b50 mulss xmm7, dword ptr [rbx + 0x50]
0x14592a5fd: f30f59f7 mulss xmm6, xmm7
0x14592a601: 440f2ed6 ucomiss xmm10, xmm6
0x14592a605: 7325 jae 0x14592a62c
0x14592a607: f30f583511e62d01 addss xmm6, dword ptr [rip + 0x12de611]
0x14592a60f: f3410f5ef1 divss xmm6, xmm9
0x14592a614: 0f28c6 movaps xmm0, xmm6
0x14592a617: e821ff2d00 call 0x145c0a53d
0x14592a61c: 0f28f0 movaps xmm6, xmm0
0x14592a61f: f3410f59f1 mulss xmm6, xmm9
0x14592a624: f30f58357c997800 addss xmm6, dword ptr [rip + 0x78997c]
0x14592a62c: 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
0x14592a633: 483bb580000000 cmp rsi, qword ptr [rbp + 0x80]
0x14592a63a: 750d jne 0x14592a649
0x14592a63c: 488d8d80000000 lea rcx, [rbp + 0x80]
0x14592a643: e8d8bc2e00 call 0x145c16320
0x14592a648: 90 nop
0x14592a649: f30f5e356f6e4800 divss xmm6, dword ptr [rip + 0x486e6f]
0x14592a651: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
0x14592a658: 488d0c76 lea rcx, [rsi + rsi*2]
0x14592a65c: c70488a32d0000 mov dword ptr [rax + rcx*4], 0x2da3
0x14592a663: f30f11748804 movss dword ptr [rax + rcx*4 + 4], xmm6
0x14592a669: c644880800 mov byte ptr [rax + rcx*4 + 8], 0
0x14592a66e: 48ffc6 inc rsi
0x14592a671: 4889b590000000 mov qword ptr [rbp + 0x90], rsi
