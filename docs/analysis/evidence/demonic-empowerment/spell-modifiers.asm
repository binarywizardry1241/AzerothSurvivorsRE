145897ab0 4157 push r15
145897ab2 4156 push r14
145897ab4 4155 push r13
145897ab6 4154 push r12
145897ab8 56 push rsi
145897ab9 57 push rdi
145897aba 55 push rbp
145897abb 53 push rbx
145897abc 4881ecb8000000 sub rsp, 0xb8
145897ac3 440f29ac24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm13
145897acc 440f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm12
145897ad5 440f299c2480000000 movaps xmmword ptr [rsp + 0x80], xmm11
145897ade 440f29542470 movaps xmmword ptr [rsp + 0x70], xmm10
145897ae4 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
145897aea 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
145897af0 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
145897af5 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
145897afa f20f10050e5a5100 movsd xmm0, qword ptr [rip + 0x515a0e]
145897b02 f20f1101 movsd qword ptr [rcx], xmm0
145897b06 c7410800000000 mov dword ptr [rcx + 8], 0
145897b0d 0f28056c985100 movaps xmm0, xmmword ptr [rip + 0x51986c]
145897b14 48894c2428 mov qword ptr [rsp + 0x28], rcx
145897b19 0f11410c movups xmmword ptr [rcx + 0xc], xmm0
145897b1d 4c8b7a28 mov r15, qword ptr [rdx + 0x28]
145897b21 0f57ff xorps xmm7, xmm7
145897b24 0f57f6 xorps xmm6, xmm6
145897b27 450f57c0 xorps xmm8, xmm8
145897b2b 4d85ff test r15, r15
145897b2e 0f8473010000 je 0x145897ca7
145897b34 4c8b6a20 mov r13, qword ptr [rdx + 0x20]
145897b38 49c1e705 shl r15, 5
145897b3c 4d01ef add r15, r13
145897b3f 410fb64075 movzx eax, byte ptr [r8 + 0x75]
145897b44 88442427 mov byte ptr [rsp + 0x27], al
145897b48 410fb64074 movzx eax, byte ptr [r8 + 0x74]
145897b4d 88442426 mov byte ptr [rsp + 0x26], al
145897b51 498b38 mov rdi, qword ptr [r8]
145897b54 498b5808 mov rbx, qword ptr [r8 + 8]
145897b58 f3440f100dff565100 movss xmm9, dword ptr [rip + 0x5156ff]
145897b61 450f57d2 xorps xmm10, xmm10
145897b65 450f28d9 movaps xmm11, xmm9
145897b69 450f28e1 movaps xmm12, xmm9
145897b6d 450f28e9 movaps xmm13, xmm9
145897b71 eb16 jmp 0x145897b89
145897b73 38442427 cmp byte ptr [rsp + 0x27], al
145897b77 0f8486000000 je 0x145897c03
145897b7d 0f1f00 nop dword ptr [rax]
145897b80 4d39fd cmp r13, r15
145897b83 0f841e010000 je 0x145897ca7
145897b89 4d89ec mov r12, r13
145897b8c 4983c520 add r13, 0x20
145897b90 410fb60c24 movzx ecx, byte ptr [r12]
145897b95 410fb6442401 movzx eax, byte ptr [r12 + 1]
145897b9b 4d8b742408 mov r14, qword ptr [r12 + 8]
145897ba0 498b742410 mov rsi, qword ptr [r12 + 0x10]
145897ba5 488d15a0713601 lea rdx, [rip + 0x13671a0]
145897bac 48630c8a movsxd rcx, dword ptr [rdx + rcx*4]
145897bb0 4801d1 add rcx, rdx
145897bb3 ffe1 jmp rcx
145897bb5 4839f3 cmp rbx, rsi
145897bb8 75c6 jne 0x145897b80
145897bba 4889f9 mov rcx, rdi
145897bbd 4c89f2 mov rdx, r14
145897bc0 4989d8 mov r8, rbx
145897bc3 e81f283700 call 0x145c0a3e7
145897bc8 85c0 test eax, eax
145897bca 75b4 jne 0x145897b80
145897bcc eb35 jmp 0x145897c03
145897bce 4885f6 test rsi, rsi
145897bd1 74ad je 0x145897b80
145897bd3 48c1e604 shl rsi, 4
145897bd7 31ed xor ebp, ebp
145897bd9 eb0e jmp 0x145897be9
145897bdb 0f1f440000 nop dword ptr [rax + rax]
145897be0 4883c510 add rbp, 0x10
145897be4 4839ee cmp rsi, rbp
145897be7 7497 je 0x145897b80
145897be9 49395c2e08 cmp qword ptr [r14 + rbp + 8], rbx
145897bee 75f0 jne 0x145897be0
145897bf0 498b0c2e mov rcx, qword ptr [r14 + rbp]
145897bf4 4889fa mov rdx, rdi
145897bf7 4989d8 mov r8, rbx
145897bfa e8e8273700 call 0x145c0a3e7
145897bff 85c0 test eax, eax
145897c01 75dd jne 0x145897be0
145897c03 f3410f1044241c movss xmm0, dword ptr [r12 + 0x1c]
145897c0a 410fb6442418 movzx eax, byte ptr [r12 + 0x18]
145897c10 488d0d51713601 lea rcx, [rip + 0x1367151]
145897c17 48630481 movsxd rax, dword ptr [rcx + rax*4]
145897c1b 4801c8 add rax, rcx
145897c1e ffe0 jmp rax
145897c20 f3440f58e8 addss xmm13, xmm0
145897c25 488b442428 mov rax, qword ptr [rsp + 0x28]
145897c2a f3440f1128 movss dword ptr [rax], xmm13
145897c2f e94cffffff jmp 0x145897b80
145897c34 38442426 cmp byte ptr [rsp + 0x26], al
145897c38 0f8542ffffff jne 0x145897b80
145897c3e ebc3 jmp 0x145897c03
145897c40 f3440f58d8 addss xmm11, xmm0
145897c45 488b442428 mov rax, qword ptr [rsp + 0x28]
145897c4a f3440f115810 movss dword ptr [rax + 0x10], xmm11
145897c50 e92bffffff jmp 0x145897b80
145897c55 f30f58f0 addss xmm6, xmm0
145897c59 e922ffffff jmp 0x145897b80
145897c5e f3440f58e0 addss xmm12, xmm0
145897c63 488b442428 mov rax, qword ptr [rsp + 0x28]
145897c68 f3440f11600c movss dword ptr [rax + 0xc], xmm12
145897c6e e90dffffff jmp 0x145897b80
145897c73 f3440f58c0 addss xmm8, xmm0
145897c78 e903ffffff jmp 0x145897b80
145897c7d f3440f58d0 addss xmm10, xmm0
145897c82 488b442428 mov rax, qword ptr [rsp + 0x28]
145897c87 f3440f115014 movss dword ptr [rax + 0x14], xmm10
145897c8d e9eefeffff jmp 0x145897b80
145897c92 f3440f58c8 addss xmm9, xmm0
145897c97 488b442428 mov rax, qword ptr [rsp + 0x28]
145897c9c f3440f114818 movss dword ptr [rax + 0x18], xmm9
145897ca2 e9d9feffff jmp 0x145897b80
145897ca7 f30f1005b1555100 movss xmm0, dword ptr [rip + 0x5155b1]
145897caf f3410f5cc0 subss xmm0, xmm8
145897cb4 f30f5f05442e5200 maxss xmm0, dword ptr [rip + 0x522e44]
145897cbc 488b742428 mov rsi, qword ptr [rsp + 0x28]
145897cc1 f30f114604 movss dword ptr [rsi + 4], xmm0
145897cc6 0f28c6 movaps xmm0, xmm6
145897cc9 e84f273700 call 0x145c0a41d
145897cce f3480f2cc0 cvttss2si rax, xmm0
145897cd3 31c9 xor ecx, ecx
145897cd5 0f2ec7 ucomiss xmm0, xmm7
145897cd8 0f43c8 cmovae ecx, eax
145897cdb 0f2e0562ee5100 ucomiss xmm0, dword ptr [rip + 0x51ee62]
145897ce2 b8ffffffff mov eax, 0xffffffff
145897ce7 0f46c1 cmovbe eax, ecx
145897cea 894608 mov dword ptr [rsi + 8], eax
145897ced 4889f0 mov rax, rsi
145897cf0 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
145897cf5 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
145897cfa 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
145897d00 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
145897d06 440f28542470 movaps xmm10, xmmword ptr [rsp + 0x70]
145897d0c 440f289c2480000000 movaps xmm11, xmmword ptr [rsp + 0x80]
145897d15 440f28a42490000000 movaps xmm12, xmmword ptr [rsp + 0x90]
145897d1e 440f28ac24a0000000 movaps xmm13, xmmword ptr [rsp + 0xa0]
145897d27 4881c4b8000000 add rsp, 0xb8
145897d2e 5b pop rbx
145897d2f 5d pop rbp
145897d30 5f pop rdi
145897d31 5e pop rsi
145897d32 415c pop r12
145897d34 415d pop r13
145897d36 415e pop r14
145897d38 415f pop r15
145897d3a c3 ret
