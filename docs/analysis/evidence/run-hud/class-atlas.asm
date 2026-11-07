140063ba0 4889c8 mov rax, rcx
140063ba3 440fb6828c000000 movzx r8d, byte ptr [rdx + 0x8c]
140063bab 0f57c0 xorps xmm0, xmm0
140063bae 488d1537acd605 lea rdx, [rip + 0x5d6ac37]
140063bb5 41ffc8 dec r8d
140063bb8 4183f808 cmp r8d, 8
140063bbc 0f8701010000 ja 0x140063cc3
140063bc2 b901000000 mov ecx, 1
140063bc7 4c8d0d1ad2d605 lea r9, [rip + 0x5d6d21a]
140063bce 4f630481 movsxd r8, dword ptr [r9 + r8*4]
140063bd2 4d01c8 add r8, r9
140063bd5 41ffe0 jmp r8
140063bd8 488d0de1abd605 lea rcx, [rip + 0x5d6abe1]
140063bdf eb22 jmp 0x140063c03
140063be1 488d15f1abd605 lea rdx, [rip + 0x5d6abf1]
140063be8 eb63 jmp 0x140063c4d
140063bea 488d15eeabd605 lea rdx, [rip + 0x5d6abee]
140063bf1 eb5a jmp 0x140063c4d
140063bf3 488d0debabd605 lea rcx, [rip + 0x5d6abeb]
140063bfa eb07 jmp 0x140063c03
140063bfc 488d0dc4abd605 lea rcx, [rip + 0x5d6abc4]
140063c03 ba57415252 mov edx, 0x52524157
140063c08 3311 xor edx, dword ptr [rcx]
140063c0a 41b852494f52 mov r8d, 0x524f4952
140063c10 44334103 xor r8d, dword ptr [rcx + 3]
140063c14 4109d0 or r8d, edx
140063c17 0f849b000000 je 0x140063cb8
140063c1d ba5741524c mov edx, 0x4c524157
140063c22 3311 xor edx, dword ptr [rcx]
140063c24 41b84c4f434b mov r8d, 0x4b434f4c
140063c2a 44334103 xor r8d, dword ptr [rcx + 3]
140063c2e 4109d0 or r8d, edx
140063c31 0f84c6000000 je 0x140063cfd
140063c37 31c9 xor ecx, ecx
140063c39 f30f10055792d605 movss xmm0, dword ptr [rip + 0x5d69257]
140063c41 e9cb000000 jmp 0x140063d11
140063c46 488d1581abd605 lea rdx, [rip + 0x5d6ab81]
140063c4d 41b848554e54 mov r8d, 0x544e5548
140063c53 443302 xor r8d, dword ptr [rdx]
140063c56 440fb74a04 movzx r9d, word ptr [rdx + 4]
140063c5b 4181f145520000 xor r9d, 0x5245
140063c62 f30f10052292d605 movss xmm0, dword ptr [rip + 0x5d69222]
140063c6a 4509c1 or r9d, r8d
140063c6d 7449 je 0x140063cb8
140063c6f 41b85348414d mov r8d, 0x4d414853
140063c75 443302 xor r8d, dword ptr [rdx]
140063c78 440fb74a04 movzx r9d, word ptr [rdx + 4]
140063c7d 4181f1414e0000 xor r9d, 0x4e41
140063c84 4509c1 or r9d, r8d
140063c87 0f8484000000 je 0x140063d11
140063c8d 41b850524945 mov r8d, 0x45495250
140063c93 443302 xor r8d, dword ptr [rdx]
140063c96 0fb75204 movzx edx, word ptr [rdx + 4]
140063c9a 81f253540000 xor edx, 0x5453
140063ca0 31c9 xor ecx, ecx
140063ca2 4409c2 or edx, r8d
140063ca5 0f94c1 sete cl
140063ca8 488d15e191d605 lea rdx, [rip + 0x5d691e1]
140063caf f30f10048a movss xmm0, dword ptr [rdx + rcx*4]
140063cb4 01c9 add ecx, ecx
140063cb6 eb59 jmp 0x140063d11
140063cb8 31c9 xor ecx, ecx
140063cba eb55 jmp 0x140063d11
140063cbc 488d1511abd605 lea rdx, [rip + 0x5d6ab11]
140063cc3 b9524f4755 mov ecx, 0x55474f52
140063cc8 330a xor ecx, dword ptr [rdx]
140063cca 440fb64204 movzx r8d, byte ptr [rdx + 4]
140063ccf 4183f045 xor r8d, 0x45
140063cd3 4109c8 or r8d, ecx
140063cd6 741e je 0x140063cf6
140063cd8 b944525549 mov ecx, 0x49555244
140063cdd 330a xor ecx, dword ptr [rdx]
140063cdf 0fb65204 movzx edx, byte ptr [rdx + 4]
140063ce3 83f244 xor edx, 0x44
140063ce6 09ca or edx, ecx
140063ce8 7422 je 0x140063d0c
140063cea f30f1005a691d605 movss xmm0, dword ptr [rip + 0x5d691a6]
140063cf2 31c9 xor ecx, ecx
140063cf4 eb1b jmp 0x140063d11
140063cf6 b902000000 mov ecx, 2
140063cfb eb14 jmp 0x140063d11
140063cfd b903000000 mov ecx, 3
140063d02 f30f10058291d605 movss xmm0, dword ptr [rip + 0x5d69182]
140063d0a eb05 jmp 0x140063d11
140063d0c b903000000 mov ecx, 3
140063d11 488d15dcaad605 lea rdx, [rip + 0x5d6aadc]
140063d18 f30f100d6c91d605 movss xmm1, dword ptr [rip + 0x5d6916c]
140063d20 f30f58c8 addss xmm1, xmm0
140063d24 f20f10148a movsd xmm2, qword ptr [rdx + rcx*4]
140063d29 0f28da movaps xmm3, xmm2
140063d2c 0fc6d804 shufps xmm3, xmm0, 4
140063d30 0fc6dbd8 shufps xmm3, xmm3, 0xd8
140063d34 0fc6d101 shufps xmm2, xmm1, 1
140063d38 0fc6d2d8 shufps xmm2, xmm2, 0xd8
140063d3c 0f28c3 movaps xmm0, xmm3
140063d3f 0fc2c201 cmpltps xmm0, xmm2
140063d43 f20f12ca movddup xmm1, xmm2
140063d47 0fc2d301 cmpltps xmm2, xmm3
140063d4b 0fc6d023 shufps xmm2, xmm0, 0x23
140063d4f 0fc6c224 shufps xmm0, xmm2, 0x24
140063d53 f20f12d3 movddup xmm2, xmm3
140063d57 660f54d0 andpd xmm2, xmm0
140063d5b 660f55c1 andnpd xmm0, xmm1
140063d5f 660f56c2 orpd xmm0, xmm2
140063d63 660f1100 movupd xmmword ptr [rax], xmm0
140063d67 c3 ret
