14038cfe0 55 push rbp
14038cfe1 4157 push r15
14038cfe3 4156 push r14
14038cfe5 56 push rsi
14038cfe6 57 push rdi
14038cfe7 53 push rbx
14038cfe8 4881ecf8000000 sub rsp, 0xf8
14038cfef 488dac2480000000 lea rbp, [rsp + 0x80]
14038cff7 48c74570feffffff mov qword ptr [rbp + 0x70], 0xfffffffffffffffe
14038cfff 4889ce mov rsi, rcx
14038d002 488b4118 mov rax, qword ptr [rcx + 0x18]
14038d006 488b4920 mov rcx, qword ptr [rcx + 0x20]
14038d00a 49b90ae40ff264c92e44 movabs r9, 0x442ec964f20fe40a
14038d014 4531d2 xor r10d, r10d
14038d017 660f6f05a192a105 movdqa xmm0, xmmword ptr [rip + 0x5a192a1]
14038d01f 660f76c9 pcmpeqd xmm1, xmm1
14038d023 660f6f159590a605 movdqa xmm2, xmmword ptr [rip + 0x5a69095]
14038d02b 4921c9 and r9, rcx
14038d02e f3420f6f1c08 movdqu xmm3, xmmword ptr [rax + r9]
14038d034 660f6fe3 movdqa xmm4, xmm3
14038d038 660f74e0 pcmpeqb xmm4, xmm0
14038d03c 66440fd7dc pmovmskb r11d, xmm4
14038d041 4585db test r11d, r11d
14038d044 743a je 0x14038d080
14038d046 f3410fbcfb tzcnt edi, r11d
14038d04b 4c01cf add rdi, r9
14038d04e 4821cf and rdi, rcx
14038d051 48f7df neg rdi
14038d054 488d3c7f lea rdi, [rdi + rdi*2]
14038d058 f30f6f64f8e8 movdqu xmm4, xmmword ptr [rax + rdi*8 - 0x18]
14038d05e 660f74e2 pcmpeqb xmm4, xmm2
14038d062 660fd7dc pmovmskb ebx, xmm4
14038d066 81fbffff0000 cmp ebx, 0xffff
14038d06c 742d je 0x14038d09b
14038d06e 418d7bff lea edi, [r11 - 1]
14038d072 664421df and di, r11w
14038d076 4189fb mov r11d, edi
14038d079 75cb jne 0x14038d046
14038d07b 0f1f440000 nop dword ptr [rax + rax]
14038d080 660f74d9 pcmpeqb xmm3, xmm1
14038d084 66440fd7db pmovmskb r11d, xmm3
14038d089 4585db test r11d, r11d
14038d08c 751a jne 0x14038d0a8
14038d08e 4d01d1 add r9, r10
14038d091 4983c110 add r9, 0x10
14038d095 4983c210 add r10, 0x10
14038d099 eb90 jmp 0x14038d02b
14038d09b 488d04f8 lea rax, [rax + rdi*8]
14038d09f 488b78f8 mov rdi, qword ptr [rax - 8]
14038d0a3 e923010000 jmp 0x14038d1cb
14038d0a8 488d7db8 lea rdi, [rbp - 0x48]
14038d0ac 4889f9 mov rcx, rdi
14038d0af 4889d3 mov rbx, rdx
14038d0b2 4d89c6 mov r14, r8
14038d0b5 e87661d5ff call 0x1400e3230
14038d0ba 4c8d7d58 lea r15, [rbp + 0x58]
14038d0be 4c89f9 mov rcx, r15
14038d0c1 4889fa mov rdx, rdi
14038d0c4 e857cde1ff call 0x1401a9e20
14038d0c9 488b7e10 mov rdi, qword ptr [rsi + 0x10]
14038d0cd 488b4318 mov rax, qword ptr [rbx + 0x18]
14038d0d1 48897c2430 mov qword ptr [rsp + 0x30], rdi
14038d0d6 4c897c2428 mov qword ptr [rsp + 0x28], r15
14038d0db 4889442420 mov qword ptr [rsp + 0x20], rax
14038d0e0 488d158e0da705 lea rdx, [rip + 0x5a70d8e]
14038d0e7 488d4db8 lea rcx, [rbp - 0x48]
14038d0eb 41b833010000 mov r8d, 0x133
14038d0f1 4d89f1 mov r9, r14
14038d0f4 e80720af04 call 0x144e7f100
14038d0f9 483b3e cmp rdi, qword ptr [rsi]
14038d0fc 7509 jne 0x14038d107
14038d0fe 4889f1 mov rcx, rsi
14038d101 e84a7e8605 call 0x145bf4f50
14038d106 90 nop
14038d107 488b4608 mov rax, qword ptr [rsi + 8]
14038d10b 488d0cbf lea rcx, [rdi + rdi*4]
14038d10f 488b55d8 mov rdx, qword ptr [rbp - 0x28]
14038d113 488954c820 mov qword ptr [rax + rcx*8 + 0x20], rdx
14038d118 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
14038d11c f30f6f4dc8 movdqu xmm1, xmmword ptr [rbp - 0x38]
14038d121 f30f7f4cc810 movdqu xmmword ptr [rax + rcx*8 + 0x10], xmm1
14038d127 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
14038d12b 488d4701 lea rax, [rdi + 1]
14038d12f 48894610 mov qword ptr [rsi + 0x10], rax
14038d133 488b5e18 mov rbx, qword ptr [rsi + 0x18]
14038d137 4c8b7620 mov r14, qword ptr [rsi + 0x20]
14038d13b 49bf0ae40ff264c92e44 movabs r15, 0x442ec964f20fe40a
14038d145 4c89f1 mov rcx, r14
14038d148 4c21f9 and rcx, r15
14038d14b f30f6f040b movdqu xmm0, xmmword ptr [rbx + rcx]
14038d150 660fd7c0 pmovmskb eax, xmm0
14038d154 85c0 test eax, eax
14038d156 0f8482000000 je 0x14038d1de
14038d15c f30fbcc0 tzcnt eax, eax
14038d160 4801c8 add rax, rcx
14038d163 4c21f0 and rax, r14
14038d166 0fb60c03 movzx ecx, byte ptr [rbx + rax]
14038d16a 84c9 test cl, cl
14038d16c 0f898e000000 jns 0x14038d200
14038d172 488b5628 mov rdx, qword ptr [rsi + 0x28]
14038d176 4885d2 test rdx, rdx
14038d179 410f95c0 setne r8b
14038d17d 80e101 and cl, 1
14038d180 410f94c1 sete r9b
14038d184 4508c1 or r9b, r8b
14038d187 0f8488000000 je 0x14038d215
14038d18d 0fb6c9 movzx ecx, cl
14038d190 4829ca sub rdx, rcx
14038d193 48895628 mov qword ptr [rsi + 0x28], rdx
14038d197 488d48f0 lea rcx, [rax - 0x10]
14038d19b 4c21f1 and rcx, r14
14038d19e c6040322 mov byte ptr [rbx + rax], 0x22
14038d1a2 c6440b1022 mov byte ptr [rbx + rcx + 0x10], 0x22
14038d1a7 48ff4630 inc qword ptr [rsi + 0x30]
14038d1ab 48f7d8 neg rax
14038d1ae 488d0440 lea rax, [rax + rax*2]
14038d1b2 48b975496a2e9d012fca movabs rcx, 0xca2f019d2e6a4975
14038d1bc 48894cc3e8 mov qword ptr [rbx + rax*8 - 0x18], rcx
14038d1c1 4c897cc3f0 mov qword ptr [rbx + rax*8 - 0x10], r15
14038d1c6 48897cc3f8 mov qword ptr [rbx + rax*8 - 8], rdi
14038d1cb 4889f8 mov rax, rdi
14038d1ce 4881c4f8000000 add rsp, 0xf8
14038d1d5 5b pop rbx
14038d1d6 5f pop rdi
14038d1d7 5e pop rsi
14038d1d8 415e pop r14
14038d1da 415f pop r15
14038d1dc 5d pop rbp
14038d1dd c3 ret
14038d1de ba10000000 mov edx, 0x10
14038d1e3 4801d1 add rcx, rdx
14038d1e6 4c21f1 and rcx, r14
14038d1e9 f30f6f040b movdqu xmm0, xmmword ptr [rbx + rcx]
14038d1ee 660fd7c0 pmovmskb eax, xmm0
14038d1f2 4883c210 add rdx, 0x10
14038d1f6 85c0 test eax, eax
14038d1f8 0f855effffff jne 0x14038d15c
14038d1fe ebe3 jmp 0x14038d1e3
14038d200 660f6f03 movdqa xmm0, xmmword ptr [rbx]
14038d204 660fd7c0 pmovmskb eax, xmm0
14038d208 f30fbcc0 tzcnt eax, eax
14038d20c 0fb60c03 movzx ecx, byte ptr [rbx + rax]
14038d210 e95dffffff jmp 0x14038d172
14038d215 488d4e18 lea rcx, [rsi + 0x18]
14038d219 4c8d4638 lea r8, [rsi + 0x38]
14038d21d ba01000000 mov edx, 1
14038d222 41b101 mov r9b, 1
14038d225 e846b69b05 call 0x145d48870
14038d22a 488b5e18 mov rbx, qword ptr [rsi + 0x18]
14038d22e 4c8b7620 mov r14, qword ptr [rsi + 0x20]
14038d232 49b80ae40ff264c92e44 movabs r8, 0x442ec964f20fe40a
14038d23c 4889d9 mov rcx, rbx
14038d23f 4c89f2 mov rdx, r14
14038d242 e809b6c8ff call 0x140018850
14038d247 0fb60c03 movzx ecx, byte ptr [rbx + rax]
14038d24b 488b5628 mov rdx, qword ptr [rsi + 0x28]
14038d24f 80e101 and cl, 1
14038d252 e936ffffff jmp 0x14038d18d
