0x1459598b0: 55 push rbp
0x1459598b1: 56 push rsi
0x1459598b2: 57 push rdi
0x1459598b3: 53 push rbx
0x1459598b4: 4881ecd8000000 sub rsp, 0xd8
0x1459598bb: 488dac2480000000 lea rbp, [rsp + 0x80]
0x1459598c3: 0f297d40 movaps xmmword ptr [rbp + 0x40], xmm7
0x1459598c7: 0f297530 movaps xmmword ptr [rbp + 0x30], xmm6
0x1459598cb: 48c74528feffffff mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
0x1459598d3: 488b81d8000000 mov rax, qword ptr [rcx + 0xd8]
0x1459598da: 4839c2 cmp rdx, rax
0x1459598dd: 0f83ed010000 jae 0x145959ad0
0x1459598e3: 488b81d0000000 mov rax, qword ptr [rcx + 0xd0]
0x1459598ea: 48c1e207 shl rdx, 7
0x1459598ee: 488b441018 mov rax, qword ptr [rax + rdx + 0x18]
0x1459598f3: 0fb65039 movzx edx, byte ptr [rax + 0x39]
0x1459598f7: 85d2 test edx, edx
0x1459598f9: 0f84d3000000 je 0x1459599d2
0x1459598ff: 83fa07 cmp edx, 7
0x145959902: 0f85d4000000 jne 0x1459599dc
0x145959908: 488b8130030000 mov rax, qword ptr [rcx + 0x330]
0x14595990f: 4c8b9138030000 mov r10, qword ptr [rcx + 0x338]
0x145959916: 488d15fdf62a01 lea rdx, [rip + 0x12af6fd]
0x14595991d: 48895508 mov qword ptr [rbp + 8], rdx
0x145959921: 48c745100b000000 mov qword ptr [rbp + 0x10], 0xb
0x145959929: 4531db xor r11d, r11d
0x14595992c: 488d157dc52901 lea rdx, [rip + 0x129c57d]
0x145959933: 49b8736861646f775f62 movabs r8, 0x625f776f64616873
0x14595993d: 49b9646f775f626f6c74 movabs r9, 0x746c6f625f776f64
0x145959947: eb18 jmp 0x145959961
0x145959949: 0f1f8000000000 nop dword ptr [rax]
0x145959950: 4983c378 add r11, 0x78
0x145959954: 4981fbf8340000 cmp r11, 0x34f8
0x14595995b: 0f8443010000 je 0x145959aa4
0x145959961: 49837c13080b cmp qword ptr [r11 + rdx + 8], 0xb
0x145959967: 75e7 jne 0x145959950
0x145959969: 498b3413 mov rsi, qword ptr [r11 + rdx]
0x14595996d: 488b3e mov rdi, qword ptr [rsi]
0x145959970: 4c31c7 xor rdi, r8
0x145959973: 488b7603 mov rsi, qword ptr [rsi + 3]
0x145959977: 4c31ce xor rsi, r9
0x14595997a: 4809fe or rsi, rdi
0x14595997d: 75d1 jne 0x145959950
0x14595997f: 4c01da add rdx, r11
0x145959982: f30f1035d6384500 movss xmm6, dword ptr [rip + 0x4538d6]
0x14595998a: 4d85d2 test r10, r10
0x14595998d: 745f je 0x1459599ee
0x14595998f: 4d6bda58 imul r11, r10, 0x58
0x145959993: 4531d2 xor r10d, r10d
0x145959996: eb11 jmp 0x1459599a9
0x145959998: 0f1f840000000000 nop dword ptr [rax + rax]
0x1459599a0: 4983c258 add r10, 0x58
0x1459599a4: 4d39d3 cmp r11, r10
0x1459599a7: 7445 je 0x1459599ee
0x1459599a9: 4a8b3410 mov rsi, qword ptr [rax + r10]
0x1459599ad: 48837e080b cmp qword ptr [rsi + 8], 0xb
0x1459599b2: 75ec jne 0x1459599a0
0x1459599b4: 488b3e mov rdi, qword ptr [rsi]
0x1459599b7: 488b1f mov rbx, qword ptr [rdi]
0x1459599ba: 4c31c3 xor rbx, r8
0x1459599bd: 488b7f03 mov rdi, qword ptr [rdi + 3]
0x1459599c1: 4c31cf xor rdi, r9
0x1459599c4: 4809df or rdi, rbx
0x1459599c7: 75d7 jne 0x1459599a0
0x1459599c9: f3420f10741014 movss xmm6, dword ptr [rax + r10 + 0x14]
0x1459599d0: eb1f jmp 0x1459599f1
0x1459599d2: f30f104030 movss xmm0, dword ptr [rax + 0x30]
0x1459599d7: e9b4000000 jmp 0x145959a90
0x1459599dc: f30f104030 movss xmm0, dword ptr [rax + 0x30]
0x1459599e1: f30f598188040000 mulss xmm0, dword ptr [rcx + 0x488]
0x1459599e9: e99a000000 jmp 0x145959a88
0x1459599ee: 4889d6 mov rsi, rdx
0x1459599f1: 4889cb mov rbx, rcx
0x1459599f4: 488d91c8010000 lea rdx, [rcx + 0x1c8]
0x1459599fb: 488d7da8 lea rdi, [rbp - 0x58]
0x1459599ff: 4889f9 mov rcx, rdi
0x145959a02: e879def3ff call 0x145897880
0x145959a07: 90 nop
0x145959a08: 488d4d08 lea rcx, [rbp + 8]
0x145959a0c: 4889fa mov rdx, rdi
0x145959a0f: 4989f0 mov r8, rsi
0x145959a12: e899e0f3ff call 0x145897ab0
0x145959a17: 90 nop
0x145959a18: f30f107d0c movss xmm7, dword ptr [rbp + 0xc]
0x145959a1d: 488d4da8 lea rcx, [rbp - 0x58]
0x145959a21: e8dac8f3ff call 0x145896300
0x145959a26: f30f108b88040000 movss xmm1, dword ptr [rbx + 0x488]
0x145959a2e: f30f10055a794500 movss xmm0, dword ptr [rip + 0x45795a]
0x145959a36: 48837e0808 cmp qword ptr [rsi + 8], 8
0x145959a3b: 751a jne 0x145959a57
0x145959a3d: 488b06 mov rax, qword ptr [rsi]
0x145959a40: 48b968656c6c66697265 movabs rcx, 0x657269666c6c6568
0x145959a4a: 483908 cmp qword ptr [rax], rcx
0x145959a4d: 7508 jne 0x145959a57
0x145959a4f: f30f10050d384500 movss xmm0, dword ptr [rip + 0x45380d]
0x145959a57: f30f105648 movss xmm2, dword ptr [rsi + 0x48]
0x145959a5c: f30f591530794500 mulss xmm2, dword ptr [rip + 0x457930]
0x145959a64: f30f59f2 mulss xmm6, xmm2
0x145959a68: f30f59fe mulss xmm7, xmm6
0x145959a6c: f30f59cf mulss xmm1, xmm7
0x145959a70: 0f28d1 movaps xmm2, xmm1
0x145959a73: f30f5fd0 maxss xmm2, xmm0
0x145959a77: 0f28c2 movaps xmm0, xmm2
0x145959a7a: f30fc2c203 cmpunordss xmm0, xmm2
0x145959a7f: 0f54c8 andps xmm1, xmm0
0x145959a82: 0f55c2 andnps xmm0, xmm2
0x145959a85: 0f56c1 orps xmm0, xmm1
0x145959a88: f30f5f05d4374500 maxss xmm0, dword ptr [rip + 0x4537d4]
0x145959a90: 0f287530 movaps xmm6, xmmword ptr [rbp + 0x30]
0x145959a94: 0f287d40 movaps xmm7, xmmword ptr [rbp + 0x40]
0x145959a98: 4881c4d8000000 add rsp, 0xd8
0x145959a9f: 5b pop rbx
0x145959aa0: 5f pop rdi
0x145959aa1: 5e pop rsi
0x145959aa2: 5d pop rbp
0x145959aa3: c3 ret
0x145959aa4: 488d4508 lea rax, [rbp + 8]
0x145959aa8: 488945a8 mov qword ptr [rbp - 0x58], rax
0x145959aac: 488d050d866afa lea rax, [rip - 0x59579f3]
0x145959ab3: 488945b0 mov qword ptr [rbp - 0x50], rax
0x145959ab7: 488d0ddab52901 lea rcx, [rip + 0x129b5da]
0x145959abe: 4c8d05e3b52901 lea r8, [rip + 0x129b5e3]
0x145959ac5: 488d55a8 lea rdx, [rbp - 0x58]
0x145959ac9: e892ff4400 call 0x145da9a60
0x145959ace: 0f0b ud2
0x145959ad0: 4c8d05211c2b01 lea r8, [rip + 0x12b1c21]
0x145959ad7: 4889d1 mov rcx, rdx
0x145959ada: 4889c2 mov rdx, rax
0x145959add: e8a1fd4400 call 0x145da9883
0x145959ae2: 0f0b ud2
