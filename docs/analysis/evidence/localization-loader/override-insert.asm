0000000145b4bfd0  55                     push rbp
0000000145b4bfd1  4157                   push r15
0000000145b4bfd3  4156                   push r14
0000000145b4bfd5  4155                   push r13
0000000145b4bfd7  4154                   push r12
0000000145b4bfd9  56                     push rsi
0000000145b4bfda  57                     push rdi
0000000145b4bfdb  53                     push rbx
0000000145b4bfdc  4881ecb8000000         sub rsp, 0xb8
0000000145b4bfe3  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b4bfeb  66440f7f4520           movdqa xmmword ptr [rbp + 0x20], xmm8
0000000145b4bff1  660f7f7d10             movdqa xmmword ptr [rbp + 0x10], xmm7
0000000145b4bff6  0f297500               movaps xmmword ptr [rbp], xmm6
0000000145b4bffa  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145b4c002  4c89cf                 mov rdi, r9
0000000145b4c005  4c89c6                 mov rsi, r8
0000000145b4c008  4889cb                 mov rbx, rcx
0000000145b4c00b  4c8d7920               lea r15, [rcx + 0x20]
0000000145b4c00f  4c89f9                 mov rcx, r15
0000000145b4c012  488955f0               mov qword ptr [rbp - 0x10], rdx
0000000145b4c016  e8955e4cfa             call 0x140011eb0
0000000145b4c01b  90                     nop
0000000145b4c01c  4989c6                 mov r14, rax
0000000145b4c01f  48837b1000             cmp qword ptr [rbx + 0x10], 0
0000000145b4c024  0f84f6010000           je 0x145b4c220
0000000145b4c02a  488975e0               mov qword ptr [rbp - 0x20], rsi
0000000145b4c02e  4c8b2b                 mov r13, qword ptr [rbx]
0000000145b4c031  4c8b4b08               mov r9, qword ptr [rbx + 8]
0000000145b4c035  4c89f6                 mov rsi, r14
0000000145b4c038  48c1ee39               shr rsi, 0x39
0000000145b4c03c  660f6ec6               movd xmm0, esi
0000000145b4c040  660f60c0               punpcklbw xmm0, xmm0
0000000145b4c044  f20f70c000             pshuflw xmm0, xmm0, 0
0000000145b4c049  660f70f044             pshufd xmm6, xmm0, 0x44
0000000145b4c04e  4c8b5df0               mov r11, qword ptr [rbp - 0x10]
0000000145b4c052  4d8b7b08               mov r15, qword ptr [r11 + 8]
0000000145b4c056  4d8b4310               mov r8, qword ptr [r11 + 0x10]
0000000145b4c05a  31d2                   xor edx, edx
0000000145b4c05c  660f76ff               pcmpeqd xmm7, xmm7
0000000145b4c060  31c9                   xor ecx, ecx
0000000145b4c062  4d21ce                 and r14, r9
0000000145b4c065  f3470f6f443500         movdqu xmm8, xmmword ptr [r13 + r14]
0000000145b4c06c  66410f6fc0             movdqa xmm0, xmm8
0000000145b4c071  660f74c6               pcmpeqb xmm0, xmm6
0000000145b4c075  66440fd7e0             pmovmskb r12d, xmm0
0000000145b4c07a  4585e4                 test r12d, r12d
0000000145b4c07d  0f847d000000           je 0x145b4c100
0000000145b4c083  48897de8               mov qword ptr [rbp - 0x18], rdi
0000000145b4c087  4c894db8               mov qword ptr [rbp - 0x48], r9
0000000145b4c08b  48895dc0               mov qword ptr [rbp - 0x40], rbx
0000000145b4c08f  48894dc8               mov qword ptr [rbp - 0x38], rcx
0000000145b4c093  488955d0               mov qword ptr [rbp - 0x30], rdx
0000000145b4c097  f3410fbcc4             tzcnt eax, r12d
0000000145b4c09c  4c01f0                 add rax, r14
0000000145b4c09f  4c21c8                 and rax, r9
0000000145b4c0a2  48f7d8                 neg rax
0000000145b4c0a5  488d0480               lea rax, [rax + rax*4]
0000000145b4c0a9  4d3b44c5e8             cmp r8, qword ptr [r13 + rax*8 - 0x18]
0000000145b4c0ae  7525                   jne 0x145b4c0d5
0000000145b4c0b0  488d3cc500000000       lea rdi, [rax*8]
0000000145b4c0b8  4c01ef                 add rdi, r13
0000000145b4c0bb  488b57e0               mov rdx, qword ptr [rdi - 0x20]
0000000145b4c0bf  4c89f9                 mov rcx, r15
0000000145b4c0c2  4c89c3                 mov rbx, r8
0000000145b4c0c5  e81d814400             call 0x145f941e7
0000000145b4c0ca  4989d8                 mov r8, rbx
0000000145b4c0cd  4c8b5df0               mov r11, qword ptr [rbp - 0x10]
0000000145b4c0d1  85c0                   test eax, eax
0000000145b4c0d3  7474                   je 0x145b4c149
0000000145b4c0d5  418d4424ff             lea eax, [r12 - 1]
0000000145b4c0da  664421e0               and ax, r12w
0000000145b4c0de  4189c4                 mov r12d, eax
0000000145b4c0e1  488b7de8               mov rdi, qword ptr [rbp - 0x18]
0000000145b4c0e5  4c8b4db8               mov r9, qword ptr [rbp - 0x48]
0000000145b4c0e9  488b5dc0               mov rbx, qword ptr [rbp - 0x40]
0000000145b4c0ed  488b4dc8               mov rcx, qword ptr [rbp - 0x38]
0000000145b4c0f1  488b55d0               mov rdx, qword ptr [rbp - 0x30]
0000000145b4c0f5  75a0                   jne 0x145b4c097
0000000145b4c0f7  660f1f840000000000     nop word ptr [rax + rax]
0000000145b4c100  4883fa01               cmp rdx, 1
0000000145b4c104  4c8b55d8               mov r10, qword ptr [rbp - 0x28]
0000000145b4c108  7414                   je 0x145b4c11e
0000000145b4c10a  66410fd7c0             pmovmskb eax, xmm8
0000000145b4c10f  85c0                   test eax, eax
0000000145b4c111  7420                   je 0x145b4c133
0000000145b4c113  f3440fbcd0             tzcnt r10d, eax
0000000145b4c118  4d01f2                 add r10, r14
0000000145b4c11b  4d21ca                 and r10, r9
0000000145b4c11e  66440f74c7             pcmpeqb xmm8, xmm7
0000000145b4c123  66410fd7c0             pmovmskb eax, xmm8
0000000145b4c128  85c0                   test eax, eax
0000000145b4c12a  7552                   jne 0x145b4c17e
0000000145b4c12c  ba01000000             mov edx, 1
0000000145b4c131  eb02                   jmp 0x145b4c135
0000000145b4c133  31d2                   xor edx, edx
0000000145b4c135  4c8955d8               mov qword ptr [rbp - 0x28], r10
0000000145b4c139  4901ce                 add r14, rcx
0000000145b4c13c  4983c610               add r14, 0x10
0000000145b4c140  4883c110               add rcx, 0x10
0000000145b4c144  e919ffffff             jmp 0x145b4c062
0000000145b4c149  488b5ff0               mov rbx, qword ptr [rdi - 0x10]
0000000145b4c14d  4c8b77f8               mov r14, qword ptr [rdi - 8]
0000000145b4c151  488b45e0               mov rax, qword ptr [rbp - 0x20]
0000000145b4c155  488947f0               mov qword ptr [rdi - 0x10], rax
0000000145b4c159  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145b4c15d  488947f8               mov qword ptr [rdi - 8], rax
0000000145b4c161  498b13                 mov rdx, qword ptr [r11]
0000000145b4c164  4885d2                 test rdx, rdx
0000000145b4c167  0f848c000000           je 0x145b4c1f9
0000000145b4c16d  498b4b08               mov rcx, qword ptr [r11 + 8]
0000000145b4c171  41b801000000           mov r8d, 1
0000000145b4c177  e854604bfa             call 0x1400021d0
0000000145b4c17c  eb7b                   jmp 0x145b4c1f9
0000000145b4c17e  430fb6441500           movzx eax, byte ptr [r13 + r10]
0000000145b4c184  84c0                   test al, al
0000000145b4c186  488b55e0               mov rdx, qword ptr [rbp - 0x20]
0000000145b4c18a  0f89a9000000           jns 0x145b4c239
0000000145b4c190  498b4b10               mov rcx, qword ptr [r11 + 0x10]
0000000145b4c194  48894db0               mov qword ptr [rbp - 0x50], rcx
0000000145b4c198  410f1003               movups xmm0, xmmword ptr [r11]
0000000145b4c19c  0f2945a0               movaps xmmword ptr [rbp - 0x60], xmm0
0000000145b4c1a0  2401                   and al, 1
0000000145b4c1a2  498d4af0               lea rcx, [r10 - 0x10]
0000000145b4c1a6  4c21c9                 and rcx, r9
0000000145b4c1a9  4388741500             mov byte ptr [r13 + r10], sil
0000000145b4c1ae  4188740d10             mov byte ptr [r13 + rcx + 0x10], sil
0000000145b4c1b3  0fb6c0                 movzx eax, al
0000000145b4c1b6  660f6ec0               movd xmm0, eax
0000000145b4c1ba  660fc6056d79610002     shufpd xmm0, xmmword ptr [rip + 0x61796d], 2
0000000145b4c1c3  f30f6f4b10             movdqu xmm1, xmmword ptr [rbx + 0x10]
0000000145b4c1c8  660ffbc8               psubq xmm1, xmm0
0000000145b4c1cc  f30f7f4b10             movdqu xmmword ptr [rbx + 0x10], xmm1
0000000145b4c1d1  49f7da                 neg r10
0000000145b4c1d4  4b8d0492               lea rax, [r10 + r10*4]
0000000145b4c1d8  488b4db0               mov rcx, qword ptr [rbp - 0x50]
0000000145b4c1dc  49894cc5e8             mov qword ptr [r13 + rax*8 - 0x18], rcx
0000000145b4c1e1  660f6f45a0             movdqa xmm0, xmmword ptr [rbp - 0x60]
0000000145b4c1e6  f3410f7f44c5d8         movdqu xmmword ptr [r13 + rax*8 - 0x28], xmm0
0000000145b4c1ed  498954c5f0             mov qword ptr [r13 + rax*8 - 0x10], rdx
0000000145b4c1f2  49897cc5f8             mov qword ptr [r13 + rax*8 - 8], rdi
0000000145b4c1f7  31db                   xor ebx, ebx
0000000145b4c1f9  4889d8                 mov rax, rbx
0000000145b4c1fc  4c89f2                 mov rdx, r14
0000000145b4c1ff  0f287500               movaps xmm6, xmmword ptr [rbp]
0000000145b4c203  0f287d10               movaps xmm7, xmmword ptr [rbp + 0x10]
0000000145b4c207  440f284520             movaps xmm8, xmmword ptr [rbp + 0x20]
0000000145b4c20c  4881c4b8000000         add rsp, 0xb8
0000000145b4c213  5b                     pop rbx
0000000145b4c214  5f                     pop rdi
0000000145b4c215  5e                     pop rsi
0000000145b4c216  415c                   pop r12
0000000145b4c218  415d                   pop r13
0000000145b4c21a  415e                   pop r14
0000000145b4c21c  415f                   pop r15
0000000145b4c21e  5d                     pop rbp
0000000145b4c21f  c3                     ret
0000000145b4c220  ba01000000             mov edx, 1
0000000145b4c225  4889d9                 mov rcx, rbx
0000000145b4c228  4d89f8                 mov r8, r15
0000000145b4c22b  41b101                 mov r9b, 1
0000000145b4c22e  e8fde55c00             call 0x14611a830
0000000145b4c233  90                     nop
0000000145b4c234  e9f1fdffff             jmp 0x145b4c02a
0000000145b4c239  66410f6f4500           movdqa xmm0, xmmword ptr [r13]
0000000145b4c23f  660fd7c0               pmovmskb eax, xmm0
0000000145b4c243  f3440fbcd0             tzcnt r10d, eax
0000000145b4c248  430fb6441500           movzx eax, byte ptr [r13 + r10]
0000000145b4c24e  e93dffffff             jmp 0x145b4c190
