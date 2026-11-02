0000000145b29ab0  4157                   push r15
0000000145b29ab2  4156                   push r14
0000000145b29ab4  4155                   push r13
0000000145b29ab6  4154                   push r12
0000000145b29ab8  56                     push rsi
0000000145b29ab9  57                     push rdi
0000000145b29aba  55                     push rbp
0000000145b29abb  53                     push rbx
0000000145b29abc  4883ec68               sub rsp, 0x68
0000000145b29ac0  66440f7f442450         movdqa xmmword ptr [rsp + 0x50], xmm8
0000000145b29ac7  660f7f7c2440           movdqa xmmword ptr [rsp + 0x40], xmm7
0000000145b29acd  660f7f742430           movdqa xmmword ptr [rsp + 0x30], xmm6
0000000145b29ad3  4889d6                 mov rsi, rdx
0000000145b29ad6  4889cf                 mov rdi, rcx
0000000145b29ad9  8b0539ca9e02           mov eax, dword ptr [rip + 0x29eca39]
0000000145b29adf  85c0                   test eax, eax
0000000145b29ae1  0f8524020000           jne 0x145b29d0b
0000000145b29ae7  488b1d1aca9e02         mov rbx, qword ptr [rip + 0x29eca1a]
0000000145b29aee  488b151bca9e02         mov rdx, qword ptr [rip + 0x29eca1b]
0000000145b29af5  8b05f5f89e02           mov eax, dword ptr [rip + 0x29ef8f5]
0000000145b29afb  65488b0c2558000000     mov rcx, qword ptr gs:[0x58]
0000000145b29b04  488b04c1               mov rax, qword ptr [rcx + rax*8]
0000000145b29b08  80b86803000000         cmp byte ptr [rax + 0x368], 0
0000000145b29b0f  7409                   je 0x145b29b1a
0000000145b29b11  488b8070030000         mov rax, qword ptr [rax + 0x370]
0000000145b29b18  eb07                   jmp 0x145b29b21
0000000145b29b1a  488b053ff79e02         mov rax, qword ptr [rip + 0x29ef73f]
0000000145b29b21  4c8d42ff               lea r8, [rdx - 1]
0000000145b29b25  4c39c0                 cmp rax, r8
0000000145b29b28  4c0f42c0               cmovb r8, rax
0000000145b29b2c  4983f80d               cmp r8, 0xd
0000000145b29b30  b90d000000             mov ecx, 0xd
0000000145b29b35  490f42c8               cmovb rcx, r8
0000000145b29b39  4839d1                 cmp rcx, rdx
0000000145b29b3c  0f83da010000           jae 0x145b29d1c
0000000145b29b42  4c8d3c49               lea r15, [rcx + rcx*2]
0000000145b29b46  49c1e704               shl r15, 4
0000000145b29b4a  4a837c3b1800           cmp qword ptr [rbx + r15 + 0x18], 0
0000000145b29b50  0f84c8000000           je 0x145b29c1e
0000000145b29b56  4901df                 add r15, rbx
0000000145b29b59  498d4f20               lea rcx, [r15 + 0x20]
0000000145b29b5d  4889fa                 mov rdx, rdi
0000000145b29b60  4989f0                 mov r8, rsi
0000000145b29b63  e8a8874efa             call 0x140012310
0000000145b29b68  4889c1                 mov rcx, rax
0000000145b29b6b  48c1e939               shr rcx, 0x39
0000000145b29b6f  4d8b37                 mov r14, qword ptr [r15]
0000000145b29b72  4d8b7f08               mov r15, qword ptr [r15 + 8]
0000000145b29b76  660f6ec1               movd xmm0, ecx
0000000145b29b7a  660f60c0               punpcklbw xmm0, xmm0
0000000145b29b7e  f20f70c000             pshuflw xmm0, xmm0, 0
0000000145b29b83  660f70f044             pshufd xmm6, xmm0, 0x44
0000000145b29b88  31d2                   xor edx, edx
0000000145b29b8a  660f76ff               pcmpeqd xmm7, xmm7
0000000145b29b8e  4c21f8                 and rax, r15
0000000145b29b91  f3450f6f0406           movdqu xmm8, xmmword ptr [r14 + rax]
0000000145b29b97  66410f6fc0             movdqa xmm0, xmm8
0000000145b29b9c  660f74c6               pcmpeqb xmm0, xmm6
0000000145b29ba0  66440fd7e8             pmovmskb r13d, xmm0
0000000145b29ba5  4585ed                 test r13d, r13d
0000000145b29ba8  7456                   je 0x145b29c00
0000000145b29baa  4889542428             mov qword ptr [rsp + 0x28], rdx
0000000145b29baf  f3410fbccd             tzcnt ecx, r13d
0000000145b29bb4  4989c4                 mov r12, rax
0000000145b29bb7  4801c1                 add rcx, rax
0000000145b29bba  4c21f9                 and rcx, r15
0000000145b29bbd  48f7d9                 neg rcx
0000000145b29bc0  488d0489               lea rax, [rcx + rcx*4]
0000000145b29bc4  493b74c6e8             cmp rsi, qword ptr [r14 + rax*8 - 0x18]
0000000145b29bc9  751b                   jne 0x145b29be6
0000000145b29bcb  498d2cc6               lea rbp, [r14 + rax*8]
0000000145b29bcf  488b55e0               mov rdx, qword ptr [rbp - 0x20]
0000000145b29bd3  4889f9                 mov rcx, rdi
0000000145b29bd6  4989f0                 mov r8, rsi
0000000145b29bd9  e809a64600             call 0x145f941e7
0000000145b29bde  85c0                   test eax, eax
0000000145b29be0  0f84f4000000           je 0x145b29cda
0000000145b29be6  418d45ff               lea eax, [r13 - 1]
0000000145b29bea  664421e8               and ax, r13w
0000000145b29bee  4189c5                 mov r13d, eax
0000000145b29bf1  4c89e0                 mov rax, r12
0000000145b29bf4  488b542428             mov rdx, qword ptr [rsp + 0x28]
0000000145b29bf9  75b4                   jne 0x145b29baf
0000000145b29bfb  0f1f440000             nop dword ptr [rax + rax]
0000000145b29c00  66440f74c7             pcmpeqb xmm8, xmm7
0000000145b29c05  66410fd7c8             pmovmskb ecx, xmm8
0000000145b29c0a  85c9                   test ecx, ecx
0000000145b29c0c  7510                   jne 0x145b29c1e
0000000145b29c0e  4801d0                 add rax, rdx
0000000145b29c11  4883c010               add rax, 0x10
0000000145b29c15  4883c210               add rdx, 0x10
0000000145b29c19  e970ffffff             jmp 0x145b29b8e
0000000145b29c1e  48837b1800             cmp qword ptr [rbx + 0x18], 0
0000000145b29c23  0f84bb000000           je 0x145b29ce4
0000000145b29c29  488d4b20               lea rcx, [rbx + 0x20]
0000000145b29c2d  4889fa                 mov rdx, rdi
0000000145b29c30  4989f0                 mov r8, rsi
0000000145b29c33  e8d8864efa             call 0x140012310
0000000145b29c38  4889c1                 mov rcx, rax
0000000145b29c3b  48c1e939               shr rcx, 0x39
0000000145b29c3f  4c8b33                 mov r14, qword ptr [rbx]
0000000145b29c42  488b5b08               mov rbx, qword ptr [rbx + 8]
0000000145b29c46  660f6ec1               movd xmm0, ecx
0000000145b29c4a  660f60c0               punpcklbw xmm0, xmm0
0000000145b29c4e  f20f70c000             pshuflw xmm0, xmm0, 0
0000000145b29c53  660f70f044             pshufd xmm6, xmm0, 0x44
0000000145b29c58  660f76ff               pcmpeqd xmm7, xmm7
0000000145b29c5c  4531ff                 xor r15d, r15d
0000000145b29c5f  4821d8                 and rax, rbx
0000000145b29c62  f3450f6f0406           movdqu xmm8, xmmword ptr [r14 + rax]
0000000145b29c68  66410f6fc0             movdqa xmm0, xmm8
0000000145b29c6d  660f74c6               pcmpeqb xmm0, xmm6
0000000145b29c71  66440fd7e0             pmovmskb r12d, xmm0
0000000145b29c76  4585e4                 test r12d, r12d
0000000145b29c79  7444                   je 0x145b29cbf
0000000145b29c7b  f3410fbccc             tzcnt ecx, r12d
0000000145b29c80  4989c5                 mov r13, rax
0000000145b29c83  4801c1                 add rcx, rax
0000000145b29c86  4821d9                 and rcx, rbx
0000000145b29c89  48f7d9                 neg rcx
0000000145b29c8c  488d0489               lea rax, [rcx + rcx*4]
0000000145b29c90  493b74c6e8             cmp rsi, qword ptr [r14 + rax*8 - 0x18]
0000000145b29c95  7517                   jne 0x145b29cae
0000000145b29c97  498d2cc6               lea rbp, [r14 + rax*8]
0000000145b29c9b  488b55e0               mov rdx, qword ptr [rbp - 0x20]
0000000145b29c9f  4889f9                 mov rcx, rdi
0000000145b29ca2  4989f0                 mov r8, rsi
0000000145b29ca5  e83da54600             call 0x145f941e7
0000000145b29caa  85c0                   test eax, eax
0000000145b29cac  742c                   je 0x145b29cda
0000000145b29cae  418d4424ff             lea eax, [r12 - 1]
0000000145b29cb3  664421e0               and ax, r12w
0000000145b29cb7  4189c4                 mov r12d, eax
0000000145b29cba  4c89e8                 mov rax, r13
0000000145b29cbd  75bc                   jne 0x145b29c7b
0000000145b29cbf  66440f74c7             pcmpeqb xmm8, xmm7
0000000145b29cc4  66410fd7c8             pmovmskb ecx, xmm8
0000000145b29cc9  85c9                   test ecx, ecx
0000000145b29ccb  751b                   jne 0x145b29ce8
0000000145b29ccd  4c01f8                 add rax, r15
0000000145b29cd0  4883c010               add rax, 0x10
0000000145b29cd4  4983c710               add r15, 0x10
0000000145b29cd8  eb85                   jmp 0x145b29c5f
0000000145b29cda  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145b29cde  488b55f8               mov rdx, qword ptr [rbp - 8]
0000000145b29ce2  eb06                   jmp 0x145b29cea
0000000145b29ce4  31c0                   xor eax, eax
0000000145b29ce6  eb02                   jmp 0x145b29cea
0000000145b29ce8  31c0                   xor eax, eax
0000000145b29cea  0f28742430             movaps xmm6, xmmword ptr [rsp + 0x30]
0000000145b29cef  0f287c2440             movaps xmm7, xmmword ptr [rsp + 0x40]
0000000145b29cf4  440f28442450           movaps xmm8, xmmword ptr [rsp + 0x50]
0000000145b29cfa  4883c468               add rsp, 0x68
0000000145b29cfe  5b                     pop rbx
0000000145b29cff  5d                     pop rbp
0000000145b29d00  5f                     pop rdi
0000000145b29d01  5e                     pop rsi
0000000145b29d02  415c                   pop r12
0000000145b29d04  415d                   pop r13
0000000145b29d06  415e                   pop r14
0000000145b29d08  415f                   pop r15
0000000145b29d0a  c3                     ret
0000000145b29d0b  488d0deec79e02         lea rcx, [rip + 0x29ec7ee]
0000000145b29d12  e81c2c5f00             call 0x14611c933
0000000145b29d17  e9cbfdffff             jmp 0x145b29ae7
0000000145b29d1c  4c8d0585427b01         lea r8, [rip + 0x17b4285]
0000000145b29d23  e82b186100             call 0x14613b553
0000000145b29d28  0f0b                   ud2
