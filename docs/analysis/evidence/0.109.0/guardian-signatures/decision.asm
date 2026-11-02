145899e70: 4157 push r15
145899e72: 4156 push r14
145899e74: 4154 push r12
145899e76: 56 push rsi
145899e77: 57 push rdi
145899e78: 53 push rbx
145899e79: 4883ec38 sub rsp, 0x38
145899e7d: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
145899e82: f30f108990010000 movss xmm1, dword ptr [rcx + 0x190]
145899e8a: 0f57c0 xorps xmm0, xmm0
145899e8d: 0f2ec1 ucomiss xmm0, xmm1
145899e90: 734a jae 0x145899edc
145899e92: f30f5c998c010000 subss xmm3, dword ptr [rcx + 0x18c]
145899e9a: f30f5ed9 divss xmm3, xmm1
145899e9e: f30f5fc3 maxss xmm0, xmm3
145899ea2: f30f100df6335000 movss xmm1, dword ptr [rip + 0x5033f6]
145899eaa: f30f5dc8 minss xmm1, xmm0
145899eae: f20f109174010000 movsd xmm2, qword ptr [rcx + 0x174]
145899eb6: f20f109980010000 movsd xmm3, qword ptr [rcx + 0x180]
145899ebe: 0f5cda subps xmm3, xmm2
145899ec1: f30f12c1 movsldup xmm0, xmm1
145899ec5: 0f59c3 mulps xmm0, xmm3
145899ec8: 0f58c2 addps xmm0, xmm2
145899ecb: 488b7158 mov rsi, qword ptr [rcx + 0x58]
145899ecf: b003 mov al, 3
145899ed1: 4883feff cmp rsi, -1
145899ed5: 751d jne 0x145899ef4
145899ed7: e982020000 jmp 0x14589a15e
145899edc: f20f108180010000 movsd xmm0, qword ptr [rcx + 0x180]
145899ee4: 488b7158 mov rsi, qword ptr [rcx + 0x58]
145899ee8: b003 mov al, 3
145899eea: 4883feff cmp rsi, -1
145899eee: 0f846a020000 je 0x14589a15e
145899ef4: f30f10b15c010000 movss xmm6, dword ptr [rcx + 0x15c]
145899efc: f30f100a movss xmm1, dword ptr [rdx]
145899f00: 80b9a800000000 cmp byte ptr [rcx + 0xa8], 0
145899f07: 0f8481010000 je 0x14589a08e
145899f0d: f2410f1000 movsd xmm0, qword ptr [r8]
145899f12: f30f105204 movss xmm2, dword ptr [rdx + 4]
145899f17: 0f14ca unpcklps xmm1, xmm2
145899f1a: 0f5cc8 subps xmm1, xmm0
145899f1d: 0f59c9 mulps xmm1, xmm1
145899f20: f30f16c1 movshdup xmm0, xmm1
145899f24: f30f58c1 addss xmm0, xmm1
145899f28: f30f51c0 sqrtss xmm0, xmm0
145899f2c: 0f2e051ddf3401 ucomiss xmm0, dword ptr [rip + 0x134df1d]
145899f33: 0f8625020000 jbe 0x14589a15e
145899f39: c681a800000000 mov byte ptr [rcx + 0xa8], 0
145899f40: c781a400000000000000 mov dword ptr [rcx + 0xa4], 0
145899f4a: 4c8b7970 mov r15, qword ptr [rcx + 0x70]
145899f4e: 4c8b7178 mov r14, qword ptr [rcx + 0x78]
145899f52: 4c89b980000000 mov qword ptr [rcx + 0x80], r15
145899f59: 4c89b188000000 mov qword ptr [rcx + 0x88], r14
145899f60: 4d85f6 test r14, r14
145899f63: 0f8499010000 je 0x14589a102
145899f69: 4989cc mov r12, rcx
145899f6c: 4a8d1cb500000000 lea rbx, [r14*4]
145899f74: e8878276fa call 0x140002200
145899f79: ba04000000 mov edx, 4
145899f7e: 4889d9 mov rcx, rbx
145899f81: e83a8276fa call 0x1400021c0
145899f86: 4885c0 test rax, rax
145899f89: 0f8478020000 je 0x14589a207
145899f8f: 4889c7 mov rdi, rax
145899f92: 4983fe0c cmp r14, 0xc
145899f96: 4c89e1 mov rcx, r12
145899f99: 7229 jb 0x145899fc4
145899f9b: 4a8d04b7 lea rax, [rdi + r14*4]
145899f9f: 498d5730 lea rdx, [r15 + 0x30]
145899fa3: 4d6bc638 imul r8, r14, 0x38
145899fa7: 4d01f8 add r8, r15
145899faa: 4983c0fc add r8, -4
145899fae: 4c39c7 cmp rdi, r8
145899fb1: 410f92c0 setb r8b
145899fb5: 4839c2 cmp rdx, rax
145899fb8: 0f92c0 setb al
145899fbb: 4184c0 test r8b, al
145899fbe: 0f84ad010000 je 0x14589a171
145899fc4: 31c0 xor eax, eax
145899fc6: 4d89f0 mov r8, r14
145899fc9: 4889c2 mov rdx, rax
145899fcc: 4983e003 and r8, 3
145899fd0: 7449 je 0x14589a01b
145899fd2: 486bd038 imul rdx, rax, 0x38
145899fd6: 4e8d0c3a lea r9, [rdx + r15]
145899fda: 4983c130 add r9, 0x30
145899fde: 4b8d1400 lea rdx, [r8 + r8]
145899fe2: 41c1e004 shl r8d, 4
145899fe6: 4929d0 sub r8, rdx
145899fe9: 4531d2 xor r10d, r10d
145899fec: f30f1005b0325000 movss xmm0, dword ptr [rip + 0x5032b0]
145899ff4: 4889c2 mov rdx, rax
145899ff7: 660f1f840000000000 nop word ptr [rax + rax]
14589a000: f3430f100c91 movss xmm1, dword ptr [r9 + r10*4]
14589a006: f30f59c8 mulss xmm1, xmm0
14589a00a: f30f110c97 movss dword ptr [rdi + rdx*4], xmm1
14589a00f: 48ffc2 inc rdx
14589a012: 4983c20e add r10, 0xe
14589a016: 4d39d0 cmp r8, r10
14589a019: 75e5 jne 0x14589a000
14589a01b: 4c29f0 sub rax, r14
14589a01e: 4883f8fc cmp rax, -4
14589a022: 0f87df000000 ja 0x14589a107
14589a028: 486bc238 imul rax, rdx, 0x38
14589a02c: 4c01f8 add rax, r15
14589a02f: 4805d8000000 add rax, 0xd8
14589a035: f30f100567325000 movss xmm0, dword ptr [rip + 0x503267]
14589a03d: 0f1f00 nop dword ptr [rax]
14589a040: f30f108858ffffff movss xmm1, dword ptr [rax - 0xa8]
14589a048: f30f59c8 mulss xmm1, xmm0
14589a04c: f30f110c97 movss dword ptr [rdi + rdx*4], xmm1
14589a051: f30f104890 movss xmm1, dword ptr [rax - 0x70]
14589a056: f30f59c8 mulss xmm1, xmm0
14589a05a: f30f114c9704 movss dword ptr [rdi + rdx*4 + 4], xmm1
14589a060: f30f1048c8 movss xmm1, dword ptr [rax - 0x38]
14589a065: f30f59c8 mulss xmm1, xmm0
14589a069: f30f114c9708 movss dword ptr [rdi + rdx*4 + 8], xmm1
14589a06f: f30f1008 movss xmm1, dword ptr [rax]
14589a073: f30f59c8 mulss xmm1, xmm0
14589a077: f30f114c970c movss dword ptr [rdi + rdx*4 + 0xc], xmm1
14589a07d: 4883c204 add rdx, 4
14589a081: 4805e0000000 add rax, 0xe0
14589a087: 4939d6 cmp r14, rdx
14589a08a: 75b4 jne 0x14589a040
14589a08c: eb79 jmp 0x14589a107
14589a08e: f30f109158010000 movss xmm2, dword ptr [rcx + 0x158]
14589a096: f30f105a04 movss xmm3, dword ptr [rdx + 4]
14589a09b: 0f14cb unpcklps xmm1, xmm3
14589a09e: 0f28d8 movaps xmm3, xmm0
14589a0a1: 0f5cd9 subps xmm3, xmm1
14589a0a4: 0f59db mulps xmm3, xmm3
14589a0a7: f30f16cb movshdup xmm1, xmm3
14589a0ab: f30f58cb addss xmm1, xmm3
14589a0af: f30f51c9 sqrtss xmm1, xmm1
14589a0b3: f30f101d152e5300 movss xmm3, dword ptr [rip + 0x532e15]
14589a0bb: 0f2ed9 ucomiss xmm3, xmm1
14589a0be: 7307 jae 0x14589a0c7
14589a0c0: 0f2ef2 ucomiss xmm6, xmm2
14589a0c3: 7732 ja 0x14589a0f7
14589a0c5: eb2c jmp 0x14589a0f3
14589a0c7: 0f2ef2 ucomiss xmm6, xmm2
14589a0ca: 772b ja 0x14589a0f7
14589a0cc: f2410f1008 movsd xmm1, qword ptr [r8]
14589a0d1: 0f5cc1 subps xmm0, xmm1
14589a0d4: 0f59c0 mulps xmm0, xmm0
14589a0d7: f30f16c8 movshdup xmm1, xmm0
14589a0db: f30f58c8 addss xmm1, xmm0
14589a0df: 0f57c0 xorps xmm0, xmm0
14589a0e2: f30f51c1 sqrtss xmm0, xmm1
14589a0e6: f30f100d32315000 movss xmm1, dword ptr [rip + 0x503132]
14589a0ee: 0f2ec8 ucomiss xmm1, xmm0
14589a0f1: 7304 jae 0x14589a0f7
14589a0f3: 31c0 xor eax, eax
14589a0f5: eb67 jmp 0x14589a15e
14589a0f7: c681a800000001 mov byte ptr [rcx + 0xa8], 1
14589a0fe: b001 mov al, 1
14589a100: eb5c jmp 0x14589a15e
14589a102: bf04000000 mov edi, 4
14589a107: 4885f6 test rsi, rsi
14589a10a: 741f je 0x14589a12b
14589a10c: 488b4160 mov rax, qword ptr [rcx + 0x60]
14589a110: 48c1e602 shl rsi, 2
14589a114: 41b804000000 mov r8d, 4
14589a11a: 4889cb mov rbx, rcx
14589a11d: 4889c1 mov rcx, rax
14589a120: 4889f2 mov rdx, rsi
14589a123: e8a88076fa call 0x1400021d0
14589a128: 4889d9 mov rcx, rbx
14589a12b: 4c897158 mov qword ptr [rcx + 0x58], r14
14589a12f: 48897960 mov qword ptr [rcx + 0x60], rdi
14589a133: 4c897168 mov qword ptr [rcx + 0x68], r14
14589a137: f30f11b158010000 movss dword ptr [rcx + 0x158], xmm6
14589a13f: c781cc01000000000000 mov dword ptr [rcx + 0x1cc], 0
14589a149: 48c7411000000000 mov qword ptr [rcx + 0x10], 0
14589a151: 48c7810001000000000000 mov qword ptr [rcx + 0x100], 0
14589a15c: b002 mov al, 2
14589a15e: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14589a163: 4883c438 add rsp, 0x38
14589a167: 5b pop rbx
14589a168: 5f pop rdi
14589a169: 5e pop rsi
14589a16a: 415c pop r12
14589a16c: 415e pop r14
14589a16e: 415f pop r15
14589a170: c3 ret
14589a171: 4c89f0 mov rax, r14
14589a174: 4883e0f8 and rax, 0xfffffffffffffff8
14589a178: 498d97b8010000 lea rdx, [r15 + 0x1b8]
14589a17f: 4531c0 xor r8d, r8d
14589a182: 0f280547eb5000 movaps xmm0, xmmword ptr [rip + 0x50eb47]
14589a189: 0f1f8000000000 nop dword ptr [rax]
14589a190: f30f108a78feffff movss xmm1, dword ptr [rdx - 0x188]
14589a198: f30f1092b0feffff movss xmm2, dword ptr [rdx - 0x150]
14589a1a0: 0f14ca unpcklps xmm1, xmm2
14589a1a3: f30f1092e8feffff movss xmm2, dword ptr [rdx - 0x118]
14589a1ab: f30f109a20ffffff movss xmm3, dword ptr [rdx - 0xe0]
14589a1b3: 0f14d3 unpcklps xmm2, xmm3
14589a1b6: 0f16ca movlhps xmm1, xmm2
14589a1b9: f30f1012 movss xmm2, dword ptr [rdx]
14589a1bd: f30f105ac8 movss xmm3, dword ptr [rdx - 0x38]
14589a1c2: 0f14da unpcklps xmm3, xmm2
14589a1c5: f30f105290 movss xmm2, dword ptr [rdx - 0x70]
14589a1ca: f30f10a258ffffff movss xmm4, dword ptr [rdx - 0xa8]
14589a1d2: 0f14e2 unpcklps xmm4, xmm2
14589a1d5: 0f16e3 movlhps xmm4, xmm3
14589a1d8: 0f59c8 mulps xmm1, xmm0
14589a1db: 0f59e0 mulps xmm4, xmm0
14589a1de: 420f110c87 movups xmmword ptr [rdi + r8*4], xmm1
14589a1e3: 420f11648710 movups xmmword ptr [rdi + r8*4 + 0x10], xmm4
14589a1e9: 4983c008 add r8, 8
14589a1ed: 4881c2c0010000 add rdx, 0x1c0
14589a1f4: 4c39c0 cmp rax, r8
14589a1f7: 7597 jne 0x14589a190
14589a1f9: 4939c6 cmp r14, rax
14589a1fc: 0f8405ffffff je 0x14589a107
14589a202: e9bffdffff jmp 0x145899fc6
14589a207: b904000000 mov ecx, 4
14589a20c: 4889da mov rdx, rbx
14589a20f: e8a7f04f00 call 0x145d992bb
14589a214: 0f0b ud2
