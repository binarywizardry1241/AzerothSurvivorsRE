145899d70 55 push rbp
145899d71 4157 push r15
145899d73 4156 push r14
145899d75 56 push rsi
145899d76 57 push rdi
145899d77 53 push rbx
145899d78 4881eca8000000 sub rsp, 0xa8
145899d7f 488dac2480000000 lea rbp, [rsp + 0x80]
145899d87 0f297510 movaps xmmword ptr [rbp + 0x10], xmm6
145899d8b 48c74508feffffff mov qword ptr [rbp + 8], 0xfffffffffffffffe
145899d93 4889d7 mov rdi, rdx
145899d96 4889ce mov rsi, rcx
145899d99 4d85c0 test r8, r8
145899d9c 7438 je 0x145899dd6
145899d9e 488b17 mov rdx, qword ptr [rdi]
145899da1 0fb64275 movzx eax, byte ptr [rdx + 0x75]
145899da5 83f809 cmp eax, 9
145899da8 7467 je 0x145899e11
145899daa 83f80b cmp eax, 0xb
145899dad 0f85ac000000 jne 0x145899e5f
145899db3 488b4230 mov rax, qword ptr [rdx + 0x30]
145899db7 488b4a38 mov rcx, qword ptr [rdx + 0x38]
145899dbb 4531c9 xor r9d, r9d
145899dbe 6690 nop
145899dc0 4c39c9 cmp rcx, r9
145899dc3 0f84a3000000 je 0x145899e6c
145899dc9 42803c0800 cmp byte ptr [rax + r9], 0
145899dce 4d8d4901 lea r9, [r9 + 1]
145899dd2 75ec jne 0x145899dc0
145899dd4 eb4d jmp 0x145899e23
145899dd6 488b4750 mov rax, qword ptr [rdi + 0x50]
145899dda 48894650 mov qword ptr [rsi + 0x50], rax
145899dde 0f104740 movups xmm0, xmmword ptr [rdi + 0x40]
145899de2 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
145899de6 0f1007 movups xmm0, xmmword ptr [rdi]
145899de9 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
145899ded 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
145899df1 0f105f30 movups xmm3, xmmword ptr [rdi + 0x30]
145899df5 0f115e30 movups xmmword ptr [rsi + 0x30], xmm3
145899df9 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
145899dfd 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
145899e01 0f1106 movups xmmword ptr [rsi], xmm0
145899e04 48c74658ffffffff mov qword ptr [rsi + 0x58], 0xffffffffffffffff
145899e0c e97a010000 jmp 0x145899f8b
145899e11 8b4268 mov eax, dword ptr [rdx + 0x68]
145899e14 83f80d cmp eax, 0xd
145899e17 7753 ja 0x145899e6c
145899e19 b9c0200000 mov ecx, 0x20c0
145899e1e 0fa3c1 bt ecx, eax
145899e21 7349 jae 0x145899e6c
145899e23 4983f806 cmp r8, 6
145899e27 0f8375010000 jae 0x145899fa2
145899e2d 488d05e44c3601 lea rax, [rip + 0x1364ce4]
145899e34 f3420f105480fc movss xmm2, dword ptr [rax + r8*4 - 4]
145899e3b f30f10051d345100 movss xmm0, dword ptr [rip + 0x51341d]
145899e43 f30f58c2 addss xmm0, xmm2
145899e47 f30f594710 mulss xmm0, dword ptr [rdi + 0x10]
145899e4c f30f114710 movss dword ptr [rdi + 0x10], xmm0
145899e51 488d4db0 lea rcx, [rbp - 0x50]
145899e55 e8c6fbffff call 0x145899a20
145899e5a e9ee000000 jmp 0x145899f4d
145899e5f f30f104244 movss xmm0, dword ptr [rdx + 0x44]
145899e64 0f57c9 xorps xmm1, xmm1
145899e67 0f2ec1 ucomiss xmm0, xmm1
145899e6a 77b7 ja 0x145899e23
145899e6c 4983f806 cmp r8, 6
145899e70 0f8338010000 jae 0x145899fae
145899e76 488d052f4c3601 lea rax, [rip + 0x1364c2f]
145899e7d f3420f107480fc movss xmm6, dword ptr [rax + r8*4 - 4]
145899e84 f30f1005d4335100 movss xmm0, dword ptr [rip + 0x5133d4]
145899e8c f30f5cc6 subss xmm0, xmm6
145899e90 f30f594714 mulss xmm0, dword ptr [rdi + 0x14]
145899e95 f30f114714 movss dword ptr [rdi + 0x14], xmm0
145899e9a 488d1d674c3601 lea rbx, [rip + 0x1364c67]
145899ea1 41be0e000000 mov r14d, 0xe
145899ea7 ba0e000000 mov edx, 0xe
145899eac 4889d9 mov rcx, rbx
145899eaf e81c3f0f00 call 0x14598ddd0
145899eb4 4885c0 test rax, rax
145899eb7 480f45d8 cmovne rbx, rax
145899ebb 4c0f45f2 cmovne r14, rdx
145899ebf f30f5935c1355100 mulss xmm6, dword ptr [rip + 0x5135c1]
145899ec7 f30f117504 movss dword ptr [rbp + 4], xmm6
145899ecc 488d4504 lea rax, [rbp + 4]
145899ed0 488945e0 mov qword ptr [rbp - 0x20], rax
145899ed4 488d0505403500 lea rax, [rip + 0x354005]
145899edb 488945e8 mov qword ptr [rbp - 0x18], rax
145899edf 488d15844b3601 lea rdx, [rip + 0x1364b84]
145899ee6 4c8d7dc8 lea r15, [rbp - 0x38]
145899eea 4c8d45e0 lea r8, [rbp - 0x20]
145899eee 4c89f9 mov rcx, r15
145899ef1 e83a323400 call 0x145bdd130
145899ef6 488d05934b3601 lea rax, [rip + 0x1364b93]
145899efd 488945e0 mov qword ptr [rbp - 0x20], rax
145899f01 48c745e801000000 mov qword ptr [rbp - 0x18], 1
145899f09 4c897df0 mov qword ptr [rbp - 0x10], r15
145899f0d 488d055c4b3601 lea rax, [rip + 0x1364b5c]
145899f14 488945f8 mov qword ptr [rbp - 8], rax
145899f18 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145899f21 488d4db0 lea rcx, [rbp - 0x50]
145899f25 4c8d4de0 lea r9, [rbp - 0x20]
145899f29 4889da mov rdx, rbx
145899f2c 4d89f0 mov r8, r14
145899f2f e84c420f00 call 0x14598e180
145899f34 90 nop
145899f35 488b55c8 mov rdx, qword ptr [rbp - 0x38]
145899f39 4885d2 test rdx, rdx
145899f3c 740f je 0x145899f4d
145899f3e 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
145899f42 41b801000000 mov r8d, 1
145899f48 e8838276fa call 0x1400021d0
145899f4d 488b45c0 mov rax, qword ptr [rbp - 0x40]
145899f51 48894668 mov qword ptr [rsi + 0x68], rax
145899f55 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
145899f59 0f114658 movups xmmword ptr [rsi + 0x58], xmm0
145899f5d 0f1007 movups xmm0, xmmword ptr [rdi]
145899f60 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
145899f64 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
145899f68 0f105f30 movups xmm3, xmmword ptr [rdi + 0x30]
145899f6c 0f1106 movups xmmword ptr [rsi], xmm0
145899f6f 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
145899f73 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
145899f77 0f115e30 movups xmmword ptr [rsi + 0x30], xmm3
145899f7b 0f104740 movups xmm0, xmmword ptr [rdi + 0x40]
145899f7f 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
145899f83 488b4750 mov rax, qword ptr [rdi + 0x50]
145899f87 48894650 mov qword ptr [rsi + 0x50], rax
145899f8b 4889f0 mov rax, rsi
145899f8e 0f287510 movaps xmm6, xmmword ptr [rbp + 0x10]
145899f92 4881c4a8000000 add rsp, 0xa8
145899f99 5b pop rbx
145899f9a 5f pop rdi
145899f9b 5e pop rsi
145899f9c 415e pop r14
145899f9e 415f pop r15
145899fa0 5d pop rbp
145899fa1 c3 ret
145899fa2 49ffc8 dec r8
145899fa5 488d05844b3601 lea rax, [rip + 0x1364b84]
145899fac eb0a jmp 0x145899fb8
145899fae 49ffc8 dec r8
145899fb1 488d05384b3601 lea rax, [rip + 0x1364b38]
145899fb8 ba05000000 mov edx, 5
145899fbd 4c89c1 mov rcx, r8
145899fc0 4989c0 mov r8, rax
145899fc3 e8bbf85000 call 0x145da9883
145899fc8 0f0b ud2
