145957f2c 4989c8 mov r8, rcx
145957f2f 4983e0fe and r8, 0xfffffffffffffffe
145957f33 4c8d4850 lea r9, [rax + 0x50]
145957f37 31d2 xor edx, edx
145957f39 410f28cd movaps xmm1, xmm13
145957f3d eb0e jmp 0x145957f4d
145957f3f 90 nop
145957f40 4883c202 add rdx, 2
145957f44 4983c160 add r9, 0x60
145957f48 4939d0 cmp r8, rdx
145957f4b 744d je 0x145957f9a
145957f4d 418179c0b1020000 cmp dword ptr [r9 - 0x40], 0x2b1
145957f55 740c je 0x145957f63
145957f57 418179f0b1020000 cmp dword ptr [r9 - 0x10], 0x2b1
145957f5f 75df jne 0x145957f40
145957f61 eb20 jmp 0x145957f83
145957f63 458b51d0 mov r10d, dword ptr [r9 - 0x30]
145957f67 0f57d2 xorps xmm2, xmm2
145957f6a f3490f2ad2 cvtsi2ss xmm2, r10
145957f6f f3410f5951c4 mulss xmm2, dword ptr [r9 - 0x3c]
145957f75 f30f58ca addss xmm1, xmm2
145957f79 418179f0b1020000 cmp dword ptr [r9 - 0x10], 0x2b1
145957f81 75bd jne 0x145957f40
145957f83 458b11 mov r10d, dword ptr [r9]
145957f86 0f57d2 xorps xmm2, xmm2
145957f89 f3490f2ad2 cvtsi2ss xmm2, r10
145957f8e f3410f5951f4 mulss xmm2, dword ptr [r9 - 0xc]
145957f94 f30f58ca addss xmm1, xmm2
145957f98 eba6 jmp 0x145957f40
145957f9a f6c101 test cl, 1
145957f9d 7429 je 0x145957fc8
145957f9f 488d0c52 lea rcx, [rdx + rdx*2]
145957fa3 48c1e104 shl rcx, 4
145957fa7 817c0810b1020000 cmp dword ptr [rax + rcx + 0x10], 0x2b1
145957faf 7517 jne 0x145957fc8
145957fb1 4801c8 add rax, rcx
145957fb4 8b4820 mov ecx, dword ptr [rax + 0x20]
145957fb7 0f57d2 xorps xmm2, xmm2
145957fba f3480f2ad1 cvtsi2ss xmm2, rcx
145957fbf f30f595014 mulss xmm2, dword ptr [rax + 0x14]
145957fc4 f30f58ca addss xmm1, xmm2
145957fc8 f30f59c1 mulss xmm0, xmm1
145957fcc 440f28f0 movaps xmm14, xmm0
