145939fb0 4157 push r15
145939fb2 4156 push r14
145939fb4 4155 push r13
145939fb6 4154 push r12
145939fb8 56 push rsi
145939fb9 57 push rdi
145939fba 55 push rbp
145939fbb 53 push rbx
145939fbc 4883ec38 sub rsp, 0x38
145939fc0 4c89442428 mov qword ptr [rsp + 0x28], r8
145939fc5 4889d3 mov rbx, rdx
145939fc8 4889ce mov rsi, rcx
145939fcb 4c8baa30030000 mov r13, qword ptr [rdx + 0x330]
145939fd2 488b8238030000 mov rax, qword ptr [rdx + 0x338]
145939fd9 4889442430 mov qword ptr [rsp + 0x30], rax
145939fde 4885c0 test rax, rax
145939fe1 0f84a1000000 je 0x14593a088
145939fe7 4c6b64243058 imul r12, qword ptr [rsp + 0x30], 0x58
145939fed 488b442428 mov rax, qword ptr [rsp + 0x28]
145939ff2 4c8b30 mov r14, qword ptr [rax]
145939ff5 4c8b7808 mov r15, qword ptr [rax + 8]
145939ff9 31ed xor ebp, ebp
145939ffb eb0c jmp 0x14593a009
145939ffd 0f1f00 nop dword ptr [rax]
14593a000 4883c558 add rbp, 0x58
14593a004 4939ec cmp r12, rbp
14593a007 747f je 0x14593a088
14593a009 498b7c2d00 mov rdi, qword ptr [r13 + rbp]
14593a00e 4c397f08 cmp qword ptr [rdi + 8], r15
14593a012 75ec jne 0x14593a000
14593a014 488b0f mov rcx, qword ptr [rdi]
14593a017 4c89f2 mov rdx, r14
14593a01a 4d89f8 mov r8, r15
14593a01d e8c5032d00 call 0x145c0a3e7
14593a022 85c0 test eax, eax
14593a024 75da jne 0x14593a000
14593a026 418b442d08 mov eax, dword ptr [r13 + rbp + 8]
14593a02b f3410f10442d14 movss xmm0, dword ptr [r13 + rbp + 0x14]
14593a032 418b4c2d18 mov ecx, dword ptr [r13 + rbp + 0x18]
14593a037 418b542d34 mov edx, dword ptr [r13 + rbp + 0x34]
14593a03c 895634 mov dword ptr [rsi + 0x34], edx
14593a03f 410f104c2d24 movups xmm1, xmmword ptr [r13 + rbp + 0x24]
14593a045 0f114e24 movups xmmword ptr [rsi + 0x24], xmm1
14593a049 410f104c2d38 movups xmm1, xmmword ptr [r13 + rbp + 0x38]
14593a04f 410f10542d44 movups xmm2, xmmword ptr [r13 + rbp + 0x44]
14593a055 0f115644 movups xmmword ptr [rsi + 0x44], xmm2
14593a059 0f114e38 movups xmmword ptr [rsi + 0x38], xmm1
14593a05d 48893e mov qword ptr [rsi], rdi
14593a060 894608 mov dword ptr [rsi + 8], eax
14593a063 f2410f104c2d0c movsd xmm1, qword ptr [r13 + rbp + 0xc]
14593a06a f20f114e0c movsd qword ptr [rsi + 0xc], xmm1
14593a06f f30f114614 movss dword ptr [rsi + 0x14], xmm0
14593a074 894e18 mov dword ptr [rsi + 0x18], ecx
14593a077 f2410f10442d1c movsd xmm0, qword ptr [r13 + rbp + 0x1c]
14593a07e f20f11461c movsd qword ptr [rsi + 0x1c], xmm0
14593a083 e92c010000 jmp 0x14593a1b4
14593a088 0f57c0 xorps xmm0, xmm0
14593a08b 0f114624 movups xmmword ptr [rsi + 0x24], xmm0
14593a08f c7463400000000 mov dword ptr [rsi + 0x34], 0
14593a096 4c8b442428 mov r8, qword ptr [rsp + 0x28]
14593a09b 4c8906 mov qword ptr [rsi], r8
14593a09e c7460801000000 mov dword ptr [rsi + 8], 1
14593a0a5 f20f1005c3724700 movsd xmm0, qword ptr [rip + 0x4772c3]
14593a0ad f20f11460c movsd qword ptr [rsi + 0xc], xmm0
14593a0b2 48c746140000803f mov qword ptr [rsi + 0x14], 0x3f800000
14593a0ba f20f10054e344700 movsd xmm0, qword ptr [rip + 0x47344e]
14593a0c2 f20f11461c movsd qword ptr [rsi + 0x1c], xmm0
14593a0c7 488d4e38 lea rcx, [rsi + 0x38]
14593a0cb f20f114638 movsd qword ptr [rsi + 0x38], xmm0
14593a0d0 c7464000000000 mov dword ptr [rsi + 0x40], 0
14593a0d7 0f2805a2724700 movaps xmm0, xmmword ptr [rip + 0x4772a2]
14593a0de 0f114644 movups xmmword ptr [rsi + 0x44], xmm0
14593a0e2 4881c3f0070000 add rbx, 0x7f0
14593a0e9 4889da mov rdx, rbx
14593a0ec e8bfd9f5ff call 0x145897ab0
14593a0f1 4c8b4c2430 mov r9, qword ptr [rsp + 0x30]
14593a0f6 4d85c9 test r9, r9
14593a0f9 0f84b5000000 je 0x14593a1b4
14593a0ff 4489c8 mov eax, r9d
14593a102 83e003 and eax, 3
14593a105 4983f904 cmp r9, 4
14593a109 730c jae 0x14593a117
14593a10b f30f1005cd334700 movss xmm0, dword ptr [rip + 0x4733cd]
14593a113 31c9 xor ecx, ecx
14593a115 eb5b jmp 0x14593a172
14593a117 48bafcffffffffffff01 movabs rdx, 0x1fffffffffffffc
14593a121 4c21ca and rdx, r9
14593a124 4d8d8518010000 lea r8, [r13 + 0x118]
14593a12b f30f1005ad334700 movss xmm0, dword ptr [rip + 0x4733ad]
14593a133 31c9 xor ecx, ecx
14593a135 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593a140 f3410f5880f8feffff addss xmm0, dword ptr [r8 - 0x108]
14593a149 f3410f588050ffffff addss xmm0, dword ptr [r8 - 0xb0]
14593a152 f3410f5840a8 addss xmm0, dword ptr [r8 - 0x58]
14593a158 f3410f5800 addss xmm0, dword ptr [r8]
14593a15d 4883c104 add rcx, 4
14593a161 4981c060010000 add r8, 0x160
14593a168 4839ca cmp rdx, rcx
14593a16b 75d3 jne 0x14593a140
14593a16d 4885c0 test rax, rax
14593a170 742c je 0x14593a19e
14593a172 486bc958 imul rcx, rcx, 0x58
14593a176 4c01e9 add rcx, r13
14593a179 4883c110 add rcx, 0x10
14593a17d 486bc058 imul rax, rax, 0x58
14593a181 31d2 xor edx, edx
14593a183 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593a190 f30f580411 addss xmm0, dword ptr [rcx + rdx]
14593a195 4883c258 add rdx, 0x58
14593a199 4839d0 cmp rax, rdx
14593a19c 75f2 jne 0x14593a190
14593a19e f3490f2ac9 cvtsi2ss xmm1, r9
14593a1a3 f30f5ec1 divss xmm0, xmm1
14593a1a7 f30f5f05b1304700 maxss xmm0, dword ptr [rip + 0x4730b1]
14593a1af f30f114610 movss dword ptr [rsi + 0x10], xmm0
14593a1b4 4883c438 add rsp, 0x38
14593a1b8 5b pop rbx
14593a1b9 5d pop rbp
14593a1ba 5f pop rdi
14593a1bb 5e pop rsi
14593a1bc 415c pop r12
14593a1be 415d pop r13
14593a1c0 415e pop r14
14593a1c2 415f pop r15
14593a1c4 c3 ret
