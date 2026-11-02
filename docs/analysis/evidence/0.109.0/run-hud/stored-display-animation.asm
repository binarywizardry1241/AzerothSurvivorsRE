14028cfdc 31c0 xor eax, eax
14028cfde 8b8d44010000 mov ecx, dword ptr [rbp + 0x144]
14028cfe4 84c9 test cl, cl
14028cfe6 0f94c0 sete al
14028cfe9 8d0440 lea eax, [rax + rax*2]
14028cfec 388675010000 cmp byte ptr [rsi + 0x175], al
14028cff2 740f je 0x14028d003
14028cff4 8b95f0000000 mov edx, dword ptr [rbp + 0xf0]
14028cffa 418911 mov dword ptr [r9], edx
14028cffd 888675010000 mov byte ptr [rsi + 0x175], al
14028d003 84c9 test cl, cl
14028d005 0f8458080000 je 0x14028d863
14028d00b 4c89d6 mov rsi, r10
14028d00e 488b8548010000 mov rax, qword ptr [rbp + 0x148]
14028d015 803802 cmp byte ptr [rax], 2
14028d018 0f57c0 xorps xmm0, xmm0
14028d01b f30f100d7d02b105 movss xmm1, dword ptr [rip + 0x5b1027d]
14028d023 7403 je 0x14028d028
14028d025 0f28c1 movaps xmm0, xmm1
14028d028 f30f5c03 subss xmm0, dword ptr [rbx]
14028d02c 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
14028d033 f30f107858 movss xmm7, dword ptr [rax + 0x58]
14028d038 f30f593de004b105 mulss xmm7, dword ptr [rip + 0x5b104e0]
14028d040 f30f5df9 minss xmm7, xmm1
14028d044 f30f59f8 mulss xmm7, xmm0
14028d048 8b8dec000000 mov ecx, dword ptr [rbp + 0xec]
14028d04e 4c8b8538010000 mov r8, qword ptr [rbp + 0x138]
14028d055 418908 mov dword ptr [r8], ecx
14028d058 f30f583b addss xmm7, dword ptr [rbx]
14028d05c f30f113b movss dword ptr [rbx], xmm7
14028d060 f30f10405c movss xmm0, dword ptr [rax + 0x5c]
14028d065 f30f5905377eb405 mulss xmm0, dword ptr [rip + 0x5b47e37]
14028d06d e8a5d09605 call 0x145bfa117
14028d072 0f28f0 movaps xmm6, xmm0
14028d075 f30f10052702b105 movss xmm0, dword ptr [rip + 0x5b10227]
14028d07d f30f59f0 mulss xmm6, xmm0
14028d081 f30f58f0 addss xmm6, xmm0
14028d085 f30f1005ab5db405 movss xmm0, dword ptr [rip + 0x5b45dab]
14028d08d f30f59c6 mulss xmm0, xmm6
14028d091 0f28cf movaps xmm1, xmm7
14028d094 f30f5fc8 maxss xmm1, xmm0
14028d098 0f28d9 movaps xmm3, xmm1
14028d09b f30fc2d903 cmpunordss xmm3, xmm1
14028d0a0 0f54fb andps xmm7, xmm3
14028d0a3 0f55d9 andnps xmm3, xmm1
14028d0a6 0f56df orps xmm3, xmm7
14028d0a9 488d15cc44b605 lea rdx, [rip + 0x5b644cc]
14028d0b0 4c8d05d944b605 lea r8, [rip + 0x5b644d9]
14028d0b7 488d8dd0000000 lea rcx, [rbp + 0xd0]
14028d0be e8dd7b9f04 call 0x144c84ca0
