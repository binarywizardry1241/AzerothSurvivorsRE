1459c4940: 55 push rbp
1459c4941: 4157 push r15
1459c4943: 4156 push r14
1459c4945: 4155 push r13
1459c4947: 4154 push r12
1459c4949: 56 push rsi
1459c494a: 57 push rdi
1459c494b: 53 push rbx
1459c494c: 4881ec88000000 sub rsp, 0x88
1459c4953: 488dac2480000000 lea rbp, [rsp + 0x80]
1459c495b: 0f297df0 movaps xmmword ptr [rbp - 0x10], xmm7
1459c495f: 0f2975e0 movaps xmmword ptr [rbp - 0x20], xmm6
1459c4963: 48c745d8feffffff mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
1459c496b: 4889ce mov rsi, rcx
1459c496e: 4c8b22 mov r12, qword ptr [rdx]
1459c4971: 4c8b7a08 mov r15, qword ptr [rdx + 8]
1459c4975: 4d39fc cmp r12, r15
1459c4978: 0f84dc000000 je 0x1459c4a5a
1459c497e: 4889d7 mov rdi, rdx
1459c4981: 4c8b6a10 mov r13, qword ptr [rdx + 0x10]
1459c4985: 488b5a18 mov rbx, qword ptr [rdx + 0x18]
1459c4989: 4c8b7220 mov r14, qword ptr [rdx + 0x20]
1459c498d: 4981c4d8010000 add r12, 0x1d8
1459c4994: 0f57ff xorps xmm7, xmm7
1459c4997: f30f103501893d00 movss xmm6, dword ptr [rip + 0x3d8901]
1459c499f: eb4a jmp 0x1459c49eb
1459c49a1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c49b0: f2410f104c24a8 movsd xmm1, qword ptr [r12 - 0x58]
1459c49b7: f30f1013 movss xmm2, dword ptr [rbx]
1459c49bb: 0f28c1 movaps xmm0, xmm1
1459c49be: f30f5cc2 subss xmm0, xmm2
1459c49c2: f30f16c9 movshdup xmm1, xmm1
1459c49c6: f30f5c4b04 subss xmm1, dword ptr [rbx + 4]
1459c49cb: e85f572300 call 0x145bfa12f
1459c49d0: f3410f100e movss xmm1, dword ptr [r14]
1459c49d5: 0f2ec8 ucomiss xmm1, xmm0
1459c49d8: 0f8398000000 jae 0x1459c4a76
1459c49de: 4d39fc cmp r12, r15
1459c49e1: 4d8da424d8010000 lea r12, [r12 + 0x1d8]
1459c49e9: 746f je 0x1459c4a5a
1459c49eb: 4c8927 mov qword ptr [rdi], r12
1459c49ee: 4180bc24d8feffff00 cmp byte ptr [r12 - 0x128], 0
1459c49f7: 75e5 jne 0x1459c49de
1459c49f9: 4983bc2440feffffff cmp qword ptr [r12 - 0x1c0], -1
1459c4a02: 75da jne 0x1459c49de
1459c4a04: 4983bc2480feffffff cmp qword ptr [r12 - 0x180], -1
1459c4a0d: 75cf jne 0x1459c49de
1459c4a0f: f3410f104424b8 movss xmm0, dword ptr [r12 - 0x48]
1459c4a16: 0f2ef8 ucomiss xmm7, xmm0
1459c4a19: 7395 jae 0x1459c49b0
1459c4a1b: f3410f104d00 movss xmm1, dword ptr [r13]
1459c4a21: f3410f5c4c24b4 subss xmm1, dword ptr [r12 - 0x4c]
1459c4a28: f30f5ec8 divss xmm1, xmm0
1459c4a2c: 0f57c0 xorps xmm0, xmm0
1459c4a2f: f30f5fc1 maxss xmm0, xmm1
1459c4a33: 0f28ce movaps xmm1, xmm6
1459c4a36: f30f5dc8 minss xmm1, xmm0
1459c4a3a: f2410f1044249c movsd xmm0, qword ptr [r12 - 0x64]
1459c4a41: f2410f105424a8 movsd xmm2, qword ptr [r12 - 0x58]
1459c4a48: 0f5cd0 subps xmm2, xmm0
1459c4a4b: f30f12c9 movsldup xmm1, xmm1
1459c4a4f: 0f59ca mulps xmm1, xmm2
1459c4a52: 0f58c8 addps xmm1, xmm0
1459c4a55: e95dffffff jmp 0x1459c49b7
1459c4a5a: 48c70600000000 mov qword ptr [rsi], 0
1459c4a61: 48c7460808000000 mov qword ptr [rsi + 8], 8
1459c4a69: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1459c4a71: e983010000 jmp 0x1459c4bf9
1459c4a76: 498bbc2418ffffff mov rdi, qword ptr [r12 - 0xe8]
1459c4a7e: e87dd763fa call 0x140002200
1459c4a83: b920000000 mov ecx, 0x20
1459c4a88: ba08000000 mov edx, 8
1459c4a8d: e82ed763fa call 0x1400021c0
1459c4a92: 4885c0 test rax, rax
1459c4a95: 0f847d010000 je 0x1459c4c18
1459c4a9b: 488938 mov qword ptr [rax], rdi
1459c4a9e: 48c745c004000000 mov qword ptr [rbp - 0x40], 4
1459c4aa6: 488945c8 mov qword ptr [rbp - 0x38], rax
1459c4aaa: 48c745d001000000 mov qword ptr [rbp - 0x30], 1
1459c4ab2: 4d39fc cmp r12, r15
1459c4ab5: 0f8427010000 je 0x1459c4be2
1459c4abb: b901000000 mov ecx, 1
1459c4ac0: 48894db8 mov qword ptr [rbp - 0x48], rcx
1459c4ac4: 0f57ff xorps xmm7, xmm7
1459c4ac7: 4981c4d8010000 add r12, 0x1d8
1459c4ace: 4889c7 mov rdi, rax
1459c4ad1: eb48 jmp 0x1459c4b1b
1459c4ad3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c4ae0: f2410f104c24a8 movsd xmm1, qword ptr [r12 - 0x58]
1459c4ae7: f30f1013 movss xmm2, dword ptr [rbx]
1459c4aeb: 0f28c1 movaps xmm0, xmm1
1459c4aee: f30f5cc2 subss xmm0, xmm2
1459c4af2: f30f16c9 movshdup xmm1, xmm1
1459c4af6: f30f5c4b04 subss xmm1, dword ptr [rbx + 4]
1459c4afb: e82f562300 call 0x145bfa12f
1459c4b00: f3410f100e movss xmm1, dword ptr [r14]
1459c4b05: 0f2ec8 ucomiss xmm1, xmm0
1459c4b08: 737d jae 0x1459c4b87
1459c4b0a: 4d39fc cmp r12, r15
1459c4b0d: 4d8da424d8010000 lea r12, [r12 + 0x1d8]
1459c4b15: 0f84c7000000 je 0x1459c4be2
1459c4b1b: 4180bc24d8feffff00 cmp byte ptr [r12 - 0x128], 0
1459c4b24: 75e4 jne 0x1459c4b0a
1459c4b26: 4983bc2440feffffff cmp qword ptr [r12 - 0x1c0], -1
1459c4b2f: 75d9 jne 0x1459c4b0a
1459c4b31: 4983bc2480feffffff cmp qword ptr [r12 - 0x180], -1
1459c4b3a: 75ce jne 0x1459c4b0a
1459c4b3c: f3410f104424b8 movss xmm0, dword ptr [r12 - 0x48]
1459c4b43: 0f2ef8 ucomiss xmm7, xmm0
1459c4b46: 7398 jae 0x1459c4ae0
1459c4b48: f3410f104d00 movss xmm1, dword ptr [r13]
1459c4b4e: f3410f5c4c24b4 subss xmm1, dword ptr [r12 - 0x4c]
1459c4b55: f30f5ec8 divss xmm1, xmm0
1459c4b59: 0f57c0 xorps xmm0, xmm0
1459c4b5c: f30f5fc1 maxss xmm0, xmm1
1459c4b60: 0f28ce movaps xmm1, xmm6
1459c4b63: f30f5dc8 minss xmm1, xmm0
1459c4b67: f2410f1044249c movsd xmm0, qword ptr [r12 - 0x64]
1459c4b6e: f2410f105424a8 movsd xmm2, qword ptr [r12 - 0x58]
1459c4b75: 0f5cd0 subps xmm2, xmm0
1459c4b78: f30f12c9 movsldup xmm1, xmm1
1459c4b7c: 0f59ca mulps xmm1, xmm2
1459c4b7f: 0f58c8 addps xmm1, xmm0
1459c4b82: e960ffffff jmp 0x1459c4ae7
1459c4b87: 4889f8 mov rax, rdi
1459c4b8a: 498b8c2418ffffff mov rcx, qword ptr [r12 - 0xe8]
1459c4b92: 48894db0 mov qword ptr [rbp - 0x50], rcx
1459c4b96: 488b7db8 mov rdi, qword ptr [rbp - 0x48]
1459c4b9a: 483b7dc0 cmp rdi, qword ptr [rbp - 0x40]
1459c4b9e: 7526 jne 0x1459c4bc6
1459c4ba0: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
1459c4ba9: 41b801000000 mov r8d, 1
1459c4baf: 41b908000000 mov r9d, 8
1459c4bb5: 488d4dc0 lea rcx, [rbp - 0x40]
1459c4bb9: 4889fa mov rdx, rdi
1459c4bbc: e8af5d2300 call 0x145bfa970
1459c4bc1: 90 nop
1459c4bc2: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1459c4bc6: 488b4db0 mov rcx, qword ptr [rbp - 0x50]
1459c4bca: 48890cf8 mov qword ptr [rax + rdi*8], rcx
1459c4bce: 48ffc7 inc rdi
1459c4bd1: 48897db8 mov qword ptr [rbp - 0x48], rdi
1459c4bd5: 48897dd0 mov qword ptr [rbp - 0x30], rdi
1459c4bd9: 4d39fc cmp r12, r15
1459c4bdc: 0f85e5feffff jne 0x1459c4ac7
1459c4be2: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1459c4be6: 48894610 mov qword ptr [rsi + 0x10], rax
1459c4bea: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459c4bee: 488906 mov qword ptr [rsi], rax
1459c4bf1: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1459c4bf5: 48894608 mov qword ptr [rsi + 8], rax
1459c4bf9: 4889f0 mov rax, rsi
1459c4bfc: 0f2875e0 movaps xmm6, xmmword ptr [rbp - 0x20]
1459c4c00: 0f287df0 movaps xmm7, xmmword ptr [rbp - 0x10]
1459c4c04: 4881c488000000 add rsp, 0x88
1459c4c0b: 5b pop rbx
1459c4c0c: 5f pop rdi
1459c4c0d: 5e pop rsi
1459c4c0e: 415c pop r12
1459c4c10: 415d pop r13
1459c4c12: 415e pop r14
1459c4c14: 415f pop r15
1459c4c16: 5d pop rbp
1459c4c17: c3 ret
1459c4c18: b908000000 mov ecx, 8
1459c4c1d: ba20000000 mov edx, 0x20
1459c4c22: e894463d00 call 0x145d992bb
1459c4c27: 0f0b ud2
