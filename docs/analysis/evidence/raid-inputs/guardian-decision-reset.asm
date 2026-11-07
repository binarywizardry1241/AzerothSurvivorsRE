1459b7f00: 4157 push r15
1459b7f02: 4156 push r14
1459b7f04: 4154 push r12
1459b7f06: 56 push rsi
1459b7f07: 57 push rdi
1459b7f08: 53 push rbx
1459b7f09: 4883ec38 sub rsp, 0x38
1459b7f0d: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1459b7f12: f30f108990010000 movss xmm1, dword ptr [rcx + 0x190]
1459b7f1a: 0f57c0 xorps xmm0, xmm0
1459b7f1d: 0f2ec1 ucomiss xmm0, xmm1
1459b7f20: 734a jae 0x1459b7f6c
1459b7f22: f30f5c998c010000 subss xmm3, dword ptr [rcx + 0x18c]
1459b7f2a: f30f5ed9 divss xmm3, xmm1
1459b7f2e: f30f5fc3 maxss xmm0, xmm3
1459b7f32: f30f100d26533f00 movss xmm1, dword ptr [rip + 0x3f5326]
1459b7f3a: f30f5dc8 minss xmm1, xmm0
1459b7f3e: f20f109174010000 movsd xmm2, qword ptr [rcx + 0x174]
1459b7f46: f20f109980010000 movsd xmm3, qword ptr [rcx + 0x180]
1459b7f4e: 0f5cda subps xmm3, xmm2
1459b7f51: f30f12c1 movsldup xmm0, xmm1
1459b7f55: 0f59c3 mulps xmm0, xmm3
1459b7f58: 0f58c2 addps xmm0, xmm2
1459b7f5b: 488b7158 mov rsi, qword ptr [rcx + 0x58]
1459b7f5f: b003 mov al, 3
1459b7f61: 4883feff cmp rsi, -1
1459b7f65: 751d jne 0x1459b7f84
1459b7f67: e982020000 jmp 0x1459b81ee
1459b7f6c: f20f108180010000 movsd xmm0, qword ptr [rcx + 0x180]
1459b7f74: 488b7158 mov rsi, qword ptr [rcx + 0x58]
1459b7f78: b003 mov al, 3
1459b7f7a: 4883feff cmp rsi, -1
1459b7f7e: 0f846a020000 je 0x1459b81ee
1459b7f84: f30f10b15c010000 movss xmm6, dword ptr [rcx + 0x15c]
1459b7f8c: f30f100a movss xmm1, dword ptr [rdx]
1459b7f90: 80b9a800000000 cmp byte ptr [rcx + 0xa8], 0
1459b7f97: 0f8481010000 je 0x1459b811e
1459b7f9d: f2410f1000 movsd xmm0, qword ptr [r8]
1459b7fa2: f30f105204 movss xmm2, dword ptr [rdx + 4]
1459b7fa7: 0f14ca unpcklps xmm1, xmm2
1459b7faa: 0f5cc8 subps xmm1, xmm0
1459b7fad: 0f59c9 mulps xmm1, xmm1
1459b7fb0: f30f16c1 movshdup xmm0, xmm1
1459b7fb4: f30f58c1 addss xmm0, xmm1
1459b7fb8: f30f51c0 sqrtss xmm0, xmm0
1459b7fbc: 0f2e057d758801 ucomiss xmm0, dword ptr [rip + 0x188757d]
1459b7fc3: 0f8625020000 jbe 0x1459b81ee
1459b7fc9: c681a800000000 mov byte ptr [rcx + 0xa8], 0
1459b7fd0: c781a400000000000000 mov dword ptr [rcx + 0xa4], 0
1459b7fda: 4c8b7970 mov r15, qword ptr [rcx + 0x70]
1459b7fde: 4c8b7178 mov r14, qword ptr [rcx + 0x78]
1459b7fe2: 4c89b980000000 mov qword ptr [rcx + 0x80], r15
1459b7fe9: 4c89b188000000 mov qword ptr [rcx + 0x88], r14
1459b7ff0: 4d85f6 test r14, r14
1459b7ff3: 0f8499010000 je 0x1459b8192
1459b7ff9: 4989cc mov r12, rcx
1459b7ffc: 4a8d1cb500000000 lea rbx, [r14*4]
1459b8004: e8f7a164fa call 0x140002200
1459b8009: ba04000000 mov edx, 4
1459b800e: 4889d9 mov rcx, rbx
1459b8011: e8aaa164fa call 0x1400021c0
1459b8016: 4885c0 test rax, rax
1459b8019: 0f8478020000 je 0x1459b8297
1459b801f: 4889c7 mov rdi, rax
1459b8022: 4983fe0c cmp r14, 0xc
1459b8026: 4c89e1 mov rcx, r12
1459b8029: 7229 jb 0x1459b8054
1459b802b: 4a8d04b7 lea rax, [rdi + r14*4]
1459b802f: 498d5730 lea rdx, [r15 + 0x30]
1459b8033: 4d6bc638 imul r8, r14, 0x38
1459b8037: 4d01f8 add r8, r15
1459b803a: 4983c0fc add r8, -4
1459b803e: 4c39c7 cmp rdi, r8
1459b8041: 410f92c0 setb r8b
1459b8045: 4839c2 cmp rdx, rax
1459b8048: 0f92c0 setb al
1459b804b: 4184c0 test r8b, al
1459b804e: 0f84ad010000 je 0x1459b8201
1459b8054: 31c0 xor eax, eax
1459b8056: 4d89f0 mov r8, r14
1459b8059: 4889c2 mov rdx, rax
1459b805c: 4983e003 and r8, 3
1459b8060: 7449 je 0x1459b80ab
1459b8062: 486bd038 imul rdx, rax, 0x38
1459b8066: 4e8d0c3a lea r9, [rdx + r15]
1459b806a: 4983c130 add r9, 0x30
1459b806e: 4b8d1400 lea rdx, [r8 + r8]
1459b8072: 41c1e004 shl r8d, 4
1459b8076: 4929d0 sub r8, rdx
1459b8079: 4531d2 xor r10d, r10d
1459b807c: f30f1005e0513f00 movss xmm0, dword ptr [rip + 0x3f51e0]
1459b8084: 4889c2 mov rdx, rax
1459b8087: 660f1f840000000000 nop word ptr [rax + rax]
1459b8090: f3430f100c91 movss xmm1, dword ptr [r9 + r10*4]
1459b8096: f30f59c8 mulss xmm1, xmm0
1459b809a: f30f110c97 movss dword ptr [rdi + rdx*4], xmm1
1459b809f: 48ffc2 inc rdx
1459b80a2: 4983c20e add r10, 0xe
1459b80a6: 4d39d0 cmp r8, r10
1459b80a9: 75e5 jne 0x1459b8090
1459b80ab: 4c29f0 sub rax, r14
1459b80ae: 4883f8fc cmp rax, -4
1459b80b2: 0f87df000000 ja 0x1459b8197
1459b80b8: 486bc238 imul rax, rdx, 0x38
1459b80bc: 4c01f8 add rax, r15
1459b80bf: 4805d8000000 add rax, 0xd8
1459b80c5: f30f100597513f00 movss xmm0, dword ptr [rip + 0x3f5197]
1459b80cd: 0f1f00 nop dword ptr [rax]
1459b80d0: f30f108858ffffff movss xmm1, dword ptr [rax - 0xa8]
1459b80d8: f30f59c8 mulss xmm1, xmm0
1459b80dc: f30f110c97 movss dword ptr [rdi + rdx*4], xmm1
1459b80e1: f30f104890 movss xmm1, dword ptr [rax - 0x70]
1459b80e6: f30f59c8 mulss xmm1, xmm0
1459b80ea: f30f114c9704 movss dword ptr [rdi + rdx*4 + 4], xmm1
1459b80f0: f30f1048c8 movss xmm1, dword ptr [rax - 0x38]
1459b80f5: f30f59c8 mulss xmm1, xmm0
1459b80f9: f30f114c9708 movss dword ptr [rdi + rdx*4 + 8], xmm1
1459b80ff: f30f1008 movss xmm1, dword ptr [rax]
1459b8103: f30f59c8 mulss xmm1, xmm0
1459b8107: f30f114c970c movss dword ptr [rdi + rdx*4 + 0xc], xmm1
1459b810d: 4883c204 add rdx, 4
1459b8111: 4805e0000000 add rax, 0xe0
1459b8117: 4939d6 cmp r14, rdx
1459b811a: 75b4 jne 0x1459b80d0
1459b811c: eb79 jmp 0x1459b8197
1459b811e: f30f109158010000 movss xmm2, dword ptr [rcx + 0x158]
1459b8126: f30f105a04 movss xmm3, dword ptr [rdx + 4]
1459b812b: 0f14cb unpcklps xmm1, xmm3
1459b812e: 0f28d8 movaps xmm3, xmm0
1459b8131: 0f5cd9 subps xmm3, xmm1
1459b8134: 0f59db mulps xmm3, xmm3
1459b8137: f30f16cb movshdup xmm1, xmm3
1459b813b: f30f58cb addss xmm1, xmm3
1459b813f: f30f51c9 sqrtss xmm1, xmm1
1459b8143: f30f101d35533f00 movss xmm3, dword ptr [rip + 0x3f5335]
1459b814b: 0f2ed9 ucomiss xmm3, xmm1
1459b814e: 7307 jae 0x1459b8157
1459b8150: 0f2ef2 ucomiss xmm6, xmm2
1459b8153: 7732 ja 0x1459b8187
1459b8155: eb2c jmp 0x1459b8183
1459b8157: 0f2ef2 ucomiss xmm6, xmm2
1459b815a: 772b ja 0x1459b8187
1459b815c: f2410f1008 movsd xmm1, qword ptr [r8]
1459b8161: 0f5cc1 subps xmm0, xmm1
1459b8164: 0f59c0 mulps xmm0, xmm0
1459b8167: f30f16c8 movshdup xmm1, xmm0
1459b816b: f30f58c8 addss xmm1, xmm0
1459b816f: 0f57c0 xorps xmm0, xmm0
1459b8172: f30f51c1 sqrtss xmm0, xmm1
1459b8176: f30f100db6953f00 movss xmm1, dword ptr [rip + 0x3f95b6]
1459b817e: 0f2ec8 ucomiss xmm1, xmm0
1459b8181: 7304 jae 0x1459b8187
1459b8183: 31c0 xor eax, eax
1459b8185: eb67 jmp 0x1459b81ee
1459b8187: c681a800000001 mov byte ptr [rcx + 0xa8], 1
1459b818e: b001 mov al, 1
1459b8190: eb5c jmp 0x1459b81ee
1459b8192: bf04000000 mov edi, 4
1459b8197: 4885f6 test rsi, rsi
1459b819a: 741f je 0x1459b81bb
1459b819c: 488b4160 mov rax, qword ptr [rcx + 0x60]
1459b81a0: 48c1e602 shl rsi, 2
1459b81a4: 41b804000000 mov r8d, 4
1459b81aa: 4889cb mov rbx, rcx
1459b81ad: 4889c1 mov rcx, rax
1459b81b0: 4889f2 mov rdx, rsi
1459b81b3: e818a064fa call 0x1400021d0
1459b81b8: 4889d9 mov rcx, rbx
1459b81bb: 4c897158 mov qword ptr [rcx + 0x58], r14
1459b81bf: 48897960 mov qword ptr [rcx + 0x60], rdi
1459b81c3: 4c897168 mov qword ptr [rcx + 0x68], r14
1459b81c7: f30f11b158010000 movss dword ptr [rcx + 0x158], xmm6
1459b81cf: c781c801000000000000 mov dword ptr [rcx + 0x1c8], 0
1459b81d9: 48c7411000000000 mov qword ptr [rcx + 0x10], 0
1459b81e1: 48c7810001000000000000 mov qword ptr [rcx + 0x100], 0
1459b81ec: b002 mov al, 2
1459b81ee: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1459b81f3: 4883c438 add rsp, 0x38
1459b81f7: 5b pop rbx
1459b81f8: 5f pop rdi
1459b81f9: 5e pop rsi
1459b81fa: 415c pop r12
1459b81fc: 415e pop r14
1459b81fe: 415f pop r15
1459b8200: c3 ret
1459b8201: 4c89f0 mov rax, r14
1459b8204: 4883e0f8 and rax, 0xfffffffffffffff8
1459b8208: 498d97b8010000 lea rdx, [r15 + 0x1b8]
1459b820f: 4531c0 xor r8d, r8d
1459b8212: 0f2805d7523f00 movaps xmm0, xmmword ptr [rip + 0x3f52d7]
1459b8219: 0f1f8000000000 nop dword ptr [rax]
1459b8220: f30f108a78feffff movss xmm1, dword ptr [rdx - 0x188]
1459b8228: f30f1092b0feffff movss xmm2, dword ptr [rdx - 0x150]
1459b8230: 0f14ca unpcklps xmm1, xmm2
1459b8233: f30f1092e8feffff movss xmm2, dword ptr [rdx - 0x118]
1459b823b: f30f109a20ffffff movss xmm3, dword ptr [rdx - 0xe0]
1459b8243: 0f14d3 unpcklps xmm2, xmm3
1459b8246: 0f16ca movlhps xmm1, xmm2
1459b8249: f30f1012 movss xmm2, dword ptr [rdx]
1459b824d: f30f105ac8 movss xmm3, dword ptr [rdx - 0x38]
1459b8252: 0f14da unpcklps xmm3, xmm2
1459b8255: f30f105290 movss xmm2, dword ptr [rdx - 0x70]
1459b825a: f30f10a258ffffff movss xmm4, dword ptr [rdx - 0xa8]
1459b8262: 0f14e2 unpcklps xmm4, xmm2
1459b8265: 0f16e3 movlhps xmm4, xmm3
1459b8268: 0f59c8 mulps xmm1, xmm0
1459b826b: 0f59e0 mulps xmm4, xmm0
1459b826e: 420f110c87 movups xmmword ptr [rdi + r8*4], xmm1
1459b8273: 420f11648710 movups xmmword ptr [rdi + r8*4 + 0x10], xmm4
1459b8279: 4983c008 add r8, 8
1459b827d: 4881c2c0010000 add rdx, 0x1c0
1459b8284: 4c39c0 cmp rax, r8
1459b8287: 7597 jne 0x1459b8220
1459b8289: 4939c6 cmp r14, rax
1459b828c: 0f8405ffffff je 0x1459b8197
1459b8292: e9bffdffff jmp 0x1459b8056
1459b8297: b904000000 mov ecx, 4
1459b829c: 4889da mov rdx, rbx
1459b829f: e847123f00 call 0x145da94eb
1459b82a4: 0f0b ud2
