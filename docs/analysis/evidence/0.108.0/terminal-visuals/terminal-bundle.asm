140377d00 55 push rbp
140377d01 4157 push r15
140377d03 4156 push r14
140377d05 56 push rsi
140377d06 57 push rdi
140377d07 53 push rbx
140377d08 4881ec08010000 sub rsp, 0x108
140377d0f 488dac2480000000 lea rbp, [rsp + 0x80]
140377d17 48c78580000000feffffff mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
140377d22 4889ce mov rsi, rcx
140377d25 488b4118 mov rax, qword ptr [rcx + 0x18]
140377d29 488b4920 mov rcx, qword ptr [rcx + 0x20]
140377d2d 49b9d9e2ce3f0774873b movabs r9, 0x3b8774073fcee2d9
140377d37 4531d2 xor r10d, r10d
140377d3a 660f6f05fea5a205 movdqa xmm0, xmmword ptr [rip + 0x5a2a5fe]
140377d42 660f76c9 pcmpeqd xmm1, xmm1
140377d46 660f6f1542dca705 movdqa xmm2, xmmword ptr [rip + 0x5a7dc42]
140377d4e 4921c9 and r9, rcx
140377d51 f3420f6f1c08 movdqu xmm3, xmmword ptr [rax + r9]
140377d57 660f6fe3 movdqa xmm4, xmm3
140377d5b 660f74e0 pcmpeqb xmm4, xmm0
140377d5f 66440fd7dc pmovmskb r11d, xmm4
140377d64 4585db test r11d, r11d
140377d67 7437 je 0x140377da0
140377d69 f3410fbcfb tzcnt edi, r11d
140377d6e 4c01cf add rdi, r9
140377d71 4821cf and rdi, rcx
140377d74 48f7df neg rdi
140377d77 488d3c7f lea rdi, [rdi + rdi*2]
140377d7b f30f6f64f8e8 movdqu xmm4, xmmword ptr [rax + rdi*8 - 0x18]
140377d81 660f74e2 pcmpeqb xmm4, xmm2
140377d85 660fd7dc pmovmskb ebx, xmm4
140377d89 81fbffff0000 cmp ebx, 0xffff
140377d8f 742a je 0x140377dbb
140377d91 418d7bff lea edi, [r11 - 1]
140377d95 664421df and di, r11w
140377d99 4189fb mov r11d, edi
140377d9c 75cb jne 0x140377d69
140377d9e 6690 nop
140377da0 660f74d9 pcmpeqb xmm3, xmm1
140377da4 66440fd7db pmovmskb r11d, xmm3
140377da9 4585db test r11d, r11d
140377dac 751a jne 0x140377dc8
140377dae 4d01d1 add r9, r10
140377db1 4983c110 add r9, 0x10
140377db5 4983c210 add r10, 0x10
140377db9 eb93 jmp 0x140377d4e
140377dbb 488d04f8 lea rax, [rax + rdi*8]
140377dbf 488b78f8 mov rdi, qword ptr [rax - 8]
140377dc3 e93f010000 jmp 0x140377f07
140377dc8 4889d1 mov rcx, rdx
140377dcb 4c89c3 mov rbx, r8
140377dce 4989d6 mov r14, rdx
140377dd1 e87af60100 call 0x140397450
140377dd6 4889d7 mov rdi, rdx
140377dd9 488d4dd0 lea rcx, [rbp - 0x30]
140377ddd 4c89f2 mov rdx, r14
140377de0 e82b82f5ff call 0x1402d0010
140377de5 48c745b801000000 mov qword ptr [rbp - 0x48], 1
140377ded 48897dc0 mov qword ptr [rbp - 0x40], rdi
140377df1 c645c801 mov byte ptr [rbp - 0x38], 1
140377df5 4c8d7d40 lea r15, [rbp + 0x40]
140377df9 488d55b8 lea rdx, [rbp - 0x48]
140377dfd 4c89f9 mov rcx, r15
140377e00 e8cb84e3ff call 0x1401b02d0
140377e05 488b7e10 mov rdi, qword ptr [rsi + 0x10]
140377e09 498b4618 mov rax, qword ptr [r14 + 0x18]
140377e0d 48897c2430 mov qword ptr [rsp + 0x30], rdi
140377e12 4c897c2428 mov qword ptr [rsp + 0x28], r15
140377e17 4889442420 mov qword ptr [rsp + 0x20], rax
140377e1c 488d15970aa805 lea rdx, [rip + 0x5a80a97]
140377e23 488d4d58 lea rcx, [rbp + 0x58]
140377e27 41b8e7000000 mov r8d, 0xe7
140377e2d 4989d9 mov r9, rbx
140377e30 e8cb72b004 call 0x144e7f100
140377e35 483b3e cmp rdi, qword ptr [rsi]
140377e38 7509 jne 0x140377e43
140377e3a 4889f1 mov rcx, rsi
140377e3d e80ed18705 call 0x145bf4f50
140377e42 90 nop
140377e43 488b4608 mov rax, qword ptr [rsi + 8]
140377e47 488d0cbf lea rcx, [rdi + rdi*4]
140377e4b 488b5578 mov rdx, qword ptr [rbp + 0x78]
140377e4f 488954c820 mov qword ptr [rax + rcx*8 + 0x20], rdx
140377e54 0f104558 movups xmm0, xmmword ptr [rbp + 0x58]
140377e58 f30f6f4d68 movdqu xmm1, xmmword ptr [rbp + 0x68]
140377e5d f30f7f4cc810 movdqu xmmword ptr [rax + rcx*8 + 0x10], xmm1
140377e63 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
140377e67 488d4701 lea rax, [rdi + 1]
140377e6b 48894610 mov qword ptr [rsi + 0x10], rax
140377e6f 488b5e18 mov rbx, qword ptr [rsi + 0x18]
140377e73 4c8b7620 mov r14, qword ptr [rsi + 0x20]
140377e77 49bfd9e2ce3f0774873b movabs r15, 0x3b8774073fcee2d9
140377e81 4c89f1 mov rcx, r14
140377e84 4c21f9 and rcx, r15
140377e87 f30f6f040b movdqu xmm0, xmmword ptr [rbx + rcx]
140377e8c 660fd7c0 pmovmskb eax, xmm0
140377e90 85c0 test eax, eax
140377e92 0f8482000000 je 0x140377f1a
140377e98 f30fbcc0 tzcnt eax, eax
140377e9c 4801c8 add rax, rcx
140377e9f 4c21f0 and rax, r14
140377ea2 0fb60c03 movzx ecx, byte ptr [rbx + rax]
140377ea6 84c9 test cl, cl
140377ea8 0f898e000000 jns 0x140377f3c
140377eae 488b5628 mov rdx, qword ptr [rsi + 0x28]
140377eb2 4885d2 test rdx, rdx
140377eb5 410f95c0 setne r8b
140377eb9 80e101 and cl, 1
140377ebc 410f94c1 sete r9b
140377ec0 4508c1 or r9b, r8b
140377ec3 0f8488000000 je 0x140377f51
140377ec9 0fb6c9 movzx ecx, cl
140377ecc 4829ca sub rdx, rcx
140377ecf 48895628 mov qword ptr [rsi + 0x28], rdx
140377ed3 488d48f0 lea rcx, [rax - 0x10]
140377ed7 4c21f1 and rcx, r14
140377eda c604031d mov byte ptr [rbx + rax], 0x1d
140377ede c6440b101d mov byte ptr [rbx + rcx + 0x10], 0x1d
140377ee3 48ff4630 inc qword ptr [rsi + 0x30]
140377ee7 48f7d8 neg rax
140377eea 488d0440 lea rax, [rax + rax*2]
140377eee 48b9a283389063720416 movabs rcx, 0x16047263903883a2
140377ef8 48894cc3e8 mov qword ptr [rbx + rax*8 - 0x18], rcx
140377efd 4c897cc3f0 mov qword ptr [rbx + rax*8 - 0x10], r15
140377f02 48897cc3f8 mov qword ptr [rbx + rax*8 - 8], rdi
140377f07 4889f8 mov rax, rdi
140377f0a 4881c408010000 add rsp, 0x108
140377f11 5b pop rbx
140377f12 5f pop rdi
140377f13 5e pop rsi
140377f14 415e pop r14
140377f16 415f pop r15
140377f18 5d pop rbp
140377f19 c3 ret
140377f1a ba10000000 mov edx, 0x10
140377f1f 4801d1 add rcx, rdx
140377f22 4c21f1 and rcx, r14
140377f25 f30f6f040b movdqu xmm0, xmmword ptr [rbx + rcx]
140377f2a 660fd7c0 pmovmskb eax, xmm0
140377f2e 4883c210 add rdx, 0x10
140377f32 85c0 test eax, eax
140377f34 0f855effffff jne 0x140377e98
140377f3a ebe3 jmp 0x140377f1f
140377f3c 660f6f03 movdqa xmm0, xmmword ptr [rbx]
140377f40 660fd7c0 pmovmskb eax, xmm0
140377f44 f30fbcc0 tzcnt eax, eax
140377f48 0fb60c03 movzx ecx, byte ptr [rbx + rax]
140377f4c e95dffffff jmp 0x140377eae
140377f51 488d4e18 lea rcx, [rsi + 0x18]
140377f55 4c8d4638 lea r8, [rsi + 0x38]
140377f59 ba01000000 mov edx, 1
140377f5e 41b101 mov r9b, 1
140377f61 e80a099d05 call 0x145d48870
140377f66 488b5e18 mov rbx, qword ptr [rsi + 0x18]
140377f6a 4c8b7620 mov r14, qword ptr [rsi + 0x20]
140377f6e 49b8d9e2ce3f0774873b movabs r8, 0x3b8774073fcee2d9
140377f78 4889d9 mov rcx, rbx
140377f7b 4c89f2 mov rdx, r14
140377f7e e8cd08caff call 0x140018850
140377f83 0fb60c03 movzx ecx, byte ptr [rbx + rax]
140377f87 488b5628 mov rdx, qword ptr [rsi + 0x28]
140377f8b 80e101 and cl, 1
140377f8e e936ffffff jmp 0x140377ec9
