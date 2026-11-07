145897ef0: 4883ec38 sub rsp, 0x38
145897ef4: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
145897ef9: 488b442460 mov rax, qword ptr [rsp + 0x60]
145897efe: 4c39c8 cmp rax, r9
145897f01: 0f8315010000 jae 0x14589801c
145897f07: 4989d2 mov r10, rdx
145897f0a: 488d5001 lea rdx, [rax + 1]
145897f0e: 4c39ca cmp rdx, r9
145897f11: 0f8319010000 jae 0x145898030
145897f17: 458b1c80 mov r11d, dword ptr [r8 + rax*4]
145897f1b: 418b548004 mov edx, dword ptr [r8 + rax*4 + 4]
145897f20: 4439da cmp edx, r11d
145897f23: 0f82df000000 jb 0x145898008
145897f29: 4939d2 cmp r10, rdx
145897f2c: 0f82d6000000 jb 0x145898008
145897f32: 31c0 xor eax, eax
145897f34: 4139d3 cmp r11d, edx
145897f37: 745c je 0x145897f95
145897f39: f30f104c2468 movss xmm1, dword ptr [rsp + 0x68]
145897f3f: 4c8d0cd1 lea r9, [rcx + rdx*8]
145897f43: 4e8d04d9 lea r8, [rcx + r11*8]
145897f47: 4e8d14dd00000000 lea r10, [r11*8]
145897f4f: 488d0cd500000000 lea rcx, [rdx*8]
145897f57: 4c29d1 sub rcx, r10
145897f5a: 4883c1f8 add rcx, -8
145897f5e: 0f28154bb85100 movaps xmm2, xmmword ptr [rip + 0x51b84b]
145897f65: f30f101de3e55100 movss xmm3, dword ptr [rip + 0x51e5e3]
145897f6d: 0f1f00 nop dword ptr [rax]
145897f70: 498d5008 lea rdx, [r8 + 8]
145897f74: f3410f104004 movss xmm0, dword ptr [r8 + 4]
145897f7a: 0f28e0 movaps xmm4, xmm0
145897f7d: f30f5ce1 subss xmm4, xmm1
145897f81: 0f54e2 andps xmm4, xmm2
145897f84: 0f2edc ucomiss xmm3, xmm4
145897f87: 7316 jae 0x145897f9f
145897f89: 4883c1f8 add rcx, -8
145897f8d: 4989d0 mov r8, rdx
145897f90: 4c39ca cmp rdx, r9
145897f93: 75db jne 0x145897f70
145897f95: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145897f9a: 4883c438 add rsp, 0x38
145897f9e: c3 ret
145897f9f: b801000000 mov eax, 1
145897fa4: 4c39ca cmp rdx, r9
145897fa7: 74ec je 0x145897f95
145897fa9: 48c1e903 shr rcx, 3
145897fad: 31d2 xor edx, edx
145897faf: eb1d jmp 0x145897fce
145897fb1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145897fc0: 0f28c6 movaps xmm0, xmm6
145897fc3: 0f28e5 movaps xmm4, xmm5
145897fc6: 48ffc2 inc rdx
145897fc9: 4839d1 cmp rcx, rdx
145897fcc: 74c7 je 0x145897f95
145897fce: f3410f1074d00c movss xmm6, dword ptr [r8 + rdx*8 + 0xc]
145897fd5: 0f28ee movaps xmm5, xmm6
145897fd8: f30f5ce9 subss xmm5, xmm1
145897fdc: 0f54ea andps xmm5, xmm2
145897fdf: 0f2edd ucomiss xmm3, xmm5
145897fe2: 72e2 jb 0x145897fc6
145897fe4: 66410f7ee1 movd r9d, xmm4
145897fe9: 66410f7eea movd r10d, xmm5
145897fee: 4589cb mov r11d, r9d
145897ff1: 41c1fb1f sar r11d, 0x1f
145897ff5: 41d1eb shr r11d, 1
145897ff8: 4531cb xor r11d, r9d
145897ffb: 4539d3 cmp r11d, r10d
145897ffe: 7fc0 jg 0x145897fc0
145898000: 0f28ec movaps xmm5, xmm4
145898003: 0f28f0 movaps xmm6, xmm0
145898006: ebb8 jmp 0x145897fc0
145898008: 4c8d0dd9203601 lea r9, [rip + 0x13620d9]
14589800f: 4c89d9 mov rcx, r11
145898012: 4d89d0 mov r8, r10
145898015: e836c85000 call 0x145da4850
14589801a: 0f0b ud2
14589801c: 4c8d0595203601 lea r8, [rip + 0x1362095]
145898023: 4889c1 mov rcx, rax
145898026: 4c89ca mov rdx, r9
145898029: e815c65000 call 0x145da4643
14589802e: 0f0b ud2
145898030: 4c8d0599203601 lea r8, [rip + 0x1362099]
145898037: 4889d1 mov rcx, rdx
14589803a: 4c89ca mov rdx, r9
14589803d: e801c65000 call 0x145da4643
145898042: 0f0b ud2
