145951a11: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
145951a18: 48894500 mov qword ptr [rbp], rax
145951a1c: 4c8bbdb8000000 mov r15, qword ptr [rbp + 0xb8]
145951a23: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
145951a2a: 498d0487 lea rax, [r15 + rax*4]
145951a2e: 48898520010000 mov qword ptr [rbp + 0x120], rax
145951a35: 4c8d3558b38d01 lea r14, [rip + 0x18db358]
145951a3c: 450f57ed xorps xmm13, xmm13
145951a40: f3440f1035c7bc4400 movss xmm14, dword ptr [rip + 0x44bcc7]
145951a49: 4c897d08 mov qword ptr [rbp + 8], r15
145951a4d: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
145951a54: 488db540010000 lea rsi, [rbp + 0x140]
145951a5b: eb0e jmp 0x145951a6b
145951a5d: 0f1f00 nop dword ptr [rax]
145951a60: 4983c704 add r15, 4
145951a64: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
145951a6b: 4c3bbd20010000 cmp r15, qword ptr [rbp + 0x120]
145951a72: 0f847d030000 je 0x145951df5
145951a78: 418b07 mov eax, dword ptr [r15]
145951a7b: 898540010000 mov dword ptr [rbp + 0x140], eax
145951a81: 498b842498050000 mov rax, qword ptr [r12 + 0x598]
145951a89: 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
145951a94: 488985f8010000 mov qword ptr [rbp + 0x1f8], rax
145951a9b: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
145951aa2: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
145951aa9: 4889b5e8010000 mov qword ptr [rbp + 0x1e8], rsi
145951ab0: 488d8d80010000 lea rcx, [rbp + 0x180]
145951ab7: 488d95e0010000 lea rdx, [rbp + 0x1e0]
145951abe: e87d140700 call 0x1459c2f40
145951ac3: 90 nop
145951ac4: 488b8588010000 mov rax, qword ptr [rbp + 0x188]
145951acb: 48898570020000 mov qword ptr [rbp + 0x270], rax
145951ad2: 4c8bad90010000 mov r13, qword ptr [rbp + 0x190]
145951ad9: 4e8d24ed00000000 lea r12, [r13*8]
145951ae1: 4d85ed test r13, r13
145951ae4: 0f845e020000 je 0x145951d48
145951aea: 4c89add0000000 mov qword ptr [rbp + 0xd0], r13
145951af1: 4c89bdd8010000 mov qword ptr [rbp + 0x1d8], r15
145951af8: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
145951aff: 488bb090050000 mov rsi, qword ptr [rax + 0x590]
145951b06: 4c8ba898050000 mov r13, qword ptr [rax + 0x598]
145951b0d: 31ff xor edi, edi
145951b0f: eb25 jmp 0x145951b36
145951b11: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145951b20: 0f2ec8 ucomiss xmm1, xmm0
145951b23: 0f8337010000 jae 0x145951c60
145951b29: 4883c708 add rdi, 8
145951b2d: 4939fc cmp r12, rdi
145951b30: 0f843a010000 je 0x145951c70
145951b36: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
145951b3d: 488b1c38 mov rbx, qword ptr [rax + rdi]
145951b41: 4c39eb cmp rbx, r13
145951b44: 0f83521b0000 jae 0x14595369c
145951b4a: 48c1e307 shl rbx, 7
145951b4e: 450f28c1 movaps xmm8, xmm9
145951b52: f3440f5c441e40 subss xmm8, dword ptr [rsi + rbx + 0x40]
145951b59: 4c8d3c1e lea r15, [rsi + rbx]
145951b5d: 410f28f2 movaps xmm6, xmm10
145951b61: f30f5c741e44 subss xmm6, dword ptr [rsi + rbx + 0x44]
145951b67: 410f28c0 movaps xmm0, xmm8
145951b6b: 0f28ce movaps xmm1, xmm6
145951b6e: e8bc852a00 call 0x145bfa12f
145951b73: 8b441e30 mov eax, dword ptr [rsi + rbx + 0x30]
145951b77: f30f104c1e34 movss xmm1, dword ptr [rsi + rbx + 0x34]
145951b7d: 49630486 movsxd rax, dword ptr [r14 + rax*4]
145951b81: 4c01f0 add rax, r14
145951b84: ffe0 jmp rax
145951b86: 0f2ec1 ucomiss xmm0, xmm1
145951b89: 729e jb 0x145951b29
145951b8b: f3410f104f38 movss xmm1, dword ptr [r15 + 0x38]
145951b91: eb8d jmp 0x145951b20
145951b93: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145951ba0: 0f28c6 movaps xmm0, xmm6
145951ba3: f3410f59c5 mulss xmm0, xmm13
145951ba8: f3410f58c0 addss xmm0, xmm8
145951bad: 410f2ec5 ucomiss xmm0, xmm13
145951bb1: 0f8272ffffff jb 0x145951b29
145951bb7: 0f2ec8 ucomiss xmm1, xmm0
145951bba: 0f8269ffffff jb 0x145951b29
145951bc0: f3450f59c6 mulss xmm8, xmm14
145951bc5: f3410f58f0 addss xmm6, xmm8
145951bca: 410f54f3 andps xmm6, xmm11
145951bce: f3410f104738 movss xmm0, dword ptr [r15 + 0x38]
145951bd4: f30f59c7 mulss xmm0, xmm7
145951bd8: 0f2ec6 ucomiss xmm0, xmm6
145951bdb: 0f8248ffffff jb 0x145951b29
145951be1: eb7d jmp 0x145951c60
145951be3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145951bf0: 0f2ec1 ucomiss xmm0, xmm1
145951bf3: 0f8730ffffff ja 0x145951b29
145951bf9: 0f2ef8 ucomiss xmm7, xmm0
145951bfc: 7762 ja 0x145951c60
145951bfe: f3450f107f38 movss xmm15, dword ptr [r15 + 0x38]
145951c04: 0f28c6 movaps xmm0, xmm6
145951c07: 410f28c8 movaps xmm1, xmm8
145951c0b: e813852a00 call 0x145bfa123
145951c10: f30f580588074900 addss xmm0, dword ptr [rip + 0x490788]
145951c18: 410f28cc movaps xmm1, xmm12
145951c1c: e808852a00 call 0x145bfa129
145951c21: 0f28c8 movaps xmm1, xmm0
145951c24: f3410f58cc addss xmm1, xmm12
145951c29: 0f28d0 movaps xmm2, xmm0
145951c2c: f3410fc2d501 cmpltss xmm2, xmm13
145951c32: 0f54ca andps xmm1, xmm2
145951c35: 0f55d0 andnps xmm2, xmm0
145951c38: 0f56d1 orps xmm2, xmm1
145951c3b: f30f5815edd55600 addss xmm2, dword ptr [rip + 0x56d5ed]
145951c43: 410f54d3 andps xmm2, xmm11
145951c47: f3440f59ff mulss xmm15, xmm7
145951c4c: 440f2efa ucomiss xmm15, xmm2
145951c50: 0f82d3feffff jb 0x145951b29
145951c56: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145951c60: 31c0 xor eax, eax
145951c62: eb0e jmp 0x145951c72
145951c64: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145951c70: b001 mov al, 1
145951c72: 488b8d70020000 mov rcx, qword ptr [rbp + 0x270]
145951c79: 488b09 mov rcx, qword ptr [rcx]
145951c7c: 488b9548020000 mov rdx, qword ptr [rbp + 0x248]
145951c83: 488b9298050000 mov rdx, qword ptr [rdx + 0x598]
145951c8a: 4839d1 cmp rcx, rdx
145951c8d: 4c8bbdd8010000 mov r15, qword ptr [rbp + 0x1d8]
145951c94: 4c8badd0000000 mov r13, qword ptr [rbp + 0xd0]
145951c9b: 0f83501c0000 jae 0x1459538f1
145951ca1: 84c0 test al, al
145951ca3: 0f8498000000 je 0x145951d41
145951ca9: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
145951cb0: 488b8090050000 mov rax, qword ptr [rax + 0x590]
145951cb7: 48c1e107 shl rcx, 7
145951cbb: f30f10740860 movss xmm6, dword ptr [rax + rcx + 0x60]
145951cc1: 488b540820 mov rdx, qword ptr [rax + rcx + 0x20]
145951cc6: 488995a8010000 mov qword ptr [rbp + 0x1a8], rdx
145951ccd: 8b7c085c mov edi, dword ptr [rax + rcx + 0x5c]
145951cd1: 488bb578010000 mov rsi, qword ptr [rbp + 0x178]
145951cd8: 483bb568010000 cmp rsi, qword ptr [rbp + 0x168]
145951cdf: 7514 jne 0x145951cf5
145951ce1: c6854702000001 mov byte ptr [rbp + 0x247], 1
145951ce8: 488d8d68010000 lea rcx, [rbp + 0x168]
145951cef: e8ec8e2a00 call 0x145bfabe0
145951cf4: 90 nop
145951cf5: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
145951cfc: 488d0c76 lea rcx, [rsi + rsi*2]
145951d00: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
145951d07: 488914c8 mov qword ptr [rax + rcx*8], rdx
145951d0b: 897cc808 mov dword ptr [rax + rcx*8 + 8], edi
145951d0f: 440f134cc80c movlps qword ptr [rax + rcx*8 + 0xc], xmm9
145951d15: f30f108528020000 movss xmm0, dword ptr [rbp + 0x228]
145951d1d: f30f1144c814 movss dword ptr [rax + rcx*8 + 0x14], xmm0
145951d23: 48ffc6 inc rsi
145951d26: 4889b578010000 mov qword ptr [rbp + 0x178], rsi
145951d2d: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145951d35: f30f58c6 addss xmm0, xmm6
145951d39: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
145951d41: 488db540010000 lea rsi, [rbp + 0x140]
145951d48: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145951d4f: 488b85b0010000 mov rax, qword ptr [rbp + 0x1b0]
145951d56: 488b9dc0010000 mov rbx, qword ptr [rbp + 0x1c0]
145951d5d: 4829d8 sub rax, rbx
145951d60: 4939c5 cmp r13, rax
145951d63: 7754 ja 0x145951db9
145951d65: 4d85ed test r13, r13
145951d68: 741e je 0x145951d88
145951d6a: 488d0cdd00000000 lea rcx, [rbx*8]
145951d72: 48038db8010000 add rcx, qword ptr [rbp + 0x1b8]
145951d79: 488b9570020000 mov rdx, qword ptr [rbp + 0x270]
145951d80: 4d89e0 mov r8, r12
145951d83: e85f832a00 call 0x145bfa0e7
145951d88: 4c01eb add rbx, r13
145951d8b: 48899dc0010000 mov qword ptr [rbp + 0x1c0], rbx
145951d92: 4885ff test rdi, rdi
145951d95: 0f84c5fcffff je 0x145951a60
145951d9b: 48c1e703 shl rdi, 3
145951d9f: 41b808000000 mov r8d, 8
145951da5: 488b8d70020000 mov rcx, qword ptr [rbp + 0x270]
145951dac: 4889fa mov rdx, rdi
145951daf: e81c046bfa call 0x1400021d0
145951db4: e9a7fcffff jmp 0x145951a60
145951db9: 4889bdd8010000 mov qword ptr [rbp + 0x1d8], rdi
145951dc0: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
145951dc9: 41b908000000 mov r9d, 8
145951dcf: 488d8db0010000 lea rcx, [rbp + 0x1b0]
145951dd6: 4889da mov rdx, rbx
145951dd9: 4d89e8 mov r8, r13
145951ddc: e88f8b2a00 call 0x145bfa970
145951de1: 90 nop
145951de2: 488b9dc0010000 mov rbx, qword ptr [rbp + 0x1c0]
145951de9: 488bbdd8010000 mov rdi, qword ptr [rbp + 0x1d8]
145951df0: e975ffffff jmp 0x145951d6a
