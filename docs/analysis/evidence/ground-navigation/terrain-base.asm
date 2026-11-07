14589a130: 4157 push r15
14589a132: 4156 push r14
14589a134: 4155 push r13
14589a136: 4154 push r12
14589a138: 56 push rsi
14589a139: 57 push rdi
14589a13a: 55 push rbp
14589a13b: 53 push rbx
14589a13c: 4883ec78 sub rsp, 0x78
14589a140: 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
14589a146: 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
14589a14c: 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
14589a151: 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
14589a156: 488b5910 mov rbx, qword ptr [rcx + 0x10]
14589a15a: 488b4128 mov rax, qword ptr [rcx + 0x28]
14589a15e: 4839d8 cmp rax, rbx
14589a161: 480f42d8 cmovb rbx, rax
14589a165: 31f6 xor esi, esi
14589a167: 4885db test rbx, rbx
14589a16a: 0f8489010000 je 0x14589a2f9
14589a170: 0f28f2 movaps xmm6, xmm2
14589a173: 0f28f9 movaps xmm7, xmm1
14589a176: 4c8b7108 mov r14, qword ptr [rcx + 8]
14589a17a: 4c8b7920 mov r15, qword ptr [rcx + 0x20]
14589a17e: 440f28c1 movaps xmm8, xmm1
14589a182: 440f14c2 unpcklps xmm8, xmm2
14589a186: 450f57c9 xorps xmm9, xmm9
14589a18a: 450f58c8 addps xmm9, xmm8
14589a18e: 4d8d670c lea r12, [r15 + 0xc]
14589a192: 4d8d6e10 lea r13, [r14 + 0x10]
14589a196: 488d7c2420 lea rdi, [rsp + 0x20]
14589a19b: 4889dd mov rbp, rbx
14589a19e: eb0d jmp 0x14589a1ad
14589a1a0: 4983c410 add r12, 0x10
14589a1a4: 4983c548 add r13, 0x48
14589a1a8: 48ffcd dec rbp
14589a1ab: 744e je 0x14589a1fb
14589a1ad: 410f2e7c24f4 ucomiss xmm7, dword ptr [r12 - 0xc]
14589a1b3: 72eb jb 0x14589a1a0
14589a1b5: 410f2e7424f8 ucomiss xmm6, dword ptr [r12 - 8]
14589a1bb: 72e3 jb 0x14589a1a0
14589a1bd: f3410f104424fc movss xmm0, dword ptr [r12 - 4]
14589a1c4: 0f2ec7 ucomiss xmm0, xmm7
14589a1c7: 72d7 jb 0x14589a1a0
14589a1c9: f3410f100424 movss xmm0, dword ptr [r12]
14589a1cf: 0f2ec6 ucomiss xmm0, xmm6
14589a1d2: 72cc jb 0x14589a1a0
14589a1d4: 498b4df8 mov rcx, qword ptr [r13 - 8]
14589a1d8: 498b5500 mov rdx, qword ptr [r13]
14589a1dc: 440f134c2420 movlps qword ptr [rsp + 0x20], xmm9
14589a1e2: c744242800000000 mov dword ptr [rsp + 0x28], 0
14589a1ea: 4989f8 mov r8, rdi
14589a1ed: e81e6b2a00 call 0x145b40d10
14589a1f2: a801 test al, 1
14589a1f4: 74aa je 0x14589a1a0
14589a1f6: e9f7000000 jmp 0x14589a2f2
14589a1fb: 0f28352efc3501 movaps xmm6, xmmword ptr [rip + 0x135fc2e]
14589a202: 410f58f0 addps xmm6, xmm8
14589a206: f30f16fe movshdup xmm7, xmm6
14589a20a: 4d8d670c lea r12, [r15 + 0xc]
14589a20e: 4d8d6e10 lea r13, [r14 + 0x10]
14589a212: 488d7c2420 lea rdi, [rsp + 0x20]
14589a217: 4889dd mov rbp, rbx
14589a21a: eb11 jmp 0x14589a22d
14589a21c: 0f1f4000 nop dword ptr [rax]
14589a220: 4983c410 add r12, 0x10
14589a224: 4983c548 add r13, 0x48
14589a228: 48ffcd dec rbp
14589a22b: 744a je 0x14589a277
14589a22d: 410f2e7424f4 ucomiss xmm6, dword ptr [r12 - 0xc]
14589a233: 72eb jb 0x14589a220
14589a235: 410f2e7c24f8 ucomiss xmm7, dword ptr [r12 - 8]
14589a23b: 72e3 jb 0x14589a220
14589a23d: f3410f104424fc movss xmm0, dword ptr [r12 - 4]
14589a244: 0f2ec6 ucomiss xmm0, xmm6
14589a247: 72d7 jb 0x14589a220
14589a249: f3410f100424 movss xmm0, dword ptr [r12]
14589a24f: 0f2ec7 ucomiss xmm0, xmm7
14589a252: 72cc jb 0x14589a220
14589a254: 498b4df8 mov rcx, qword ptr [r13 - 8]
14589a258: 498b5500 mov rdx, qword ptr [r13]
14589a25c: 0f13742420 movlps qword ptr [rsp + 0x20], xmm6
14589a261: c744242800000000 mov dword ptr [rsp + 0x28], 0
14589a269: 4989f8 mov r8, rdi
14589a26c: e89f6a2a00 call 0x145b40d10
14589a271: a801 test al, 1
14589a273: 74ab je 0x14589a220
14589a275: eb7b jmp 0x14589a2f2
14589a277: 440f5805c1fb3501 addps xmm8, xmmword ptr [rip + 0x135fbc1]
14589a27f: f3410f16f0 movshdup xmm6, xmm8
14589a284: 4983c70c add r15, 0xc
14589a288: 4983c610 add r14, 0x10
14589a28c: 488d7c2420 lea rdi, [rsp + 0x20]
14589a291: eb1a jmp 0x14589a2ad
14589a293: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589a2a0: 4983c710 add r15, 0x10
14589a2a4: 4983c648 add r14, 0x48
14589a2a8: 48ffcb dec rbx
14589a2ab: 744c je 0x14589a2f9
14589a2ad: 450f2e47f4 ucomiss xmm8, dword ptr [r15 - 0xc]
14589a2b2: 72ec jb 0x14589a2a0
14589a2b4: 410f2e77f8 ucomiss xmm6, dword ptr [r15 - 8]
14589a2b9: 72e5 jb 0x14589a2a0
14589a2bb: f3410f1047fc movss xmm0, dword ptr [r15 - 4]
14589a2c1: 410f2ec0 ucomiss xmm0, xmm8
14589a2c5: 72d9 jb 0x14589a2a0
14589a2c7: f3410f1007 movss xmm0, dword ptr [r15]
14589a2cc: 0f2ec6 ucomiss xmm0, xmm6
14589a2cf: 72cf jb 0x14589a2a0
14589a2d1: 498b4ef8 mov rcx, qword ptr [r14 - 8]
14589a2d5: 498b16 mov rdx, qword ptr [r14]
14589a2d8: 440f13442420 movlps qword ptr [rsp + 0x20], xmm8
14589a2de: c744242800000000 mov dword ptr [rsp + 0x28], 0
14589a2e6: 4989f8 mov r8, rdi
14589a2e9: e8226a2a00 call 0x145b40d10
14589a2ee: a801 test al, 1
14589a2f0: 74ae je 0x14589a2a0
14589a2f2: be01000000 mov esi, 1
14589a2f7: eb00 jmp 0x14589a2f9
14589a2f9: 89f0 mov eax, esi
14589a2fb: 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
14589a300: 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
14589a305: 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
14589a30b: 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
14589a311: 4883c478 add rsp, 0x78
14589a315: 5b pop rbx
14589a316: 5d pop rbp
14589a317: 5f pop rdi
14589a318: 5e pop rsi
14589a319: 415c pop r12
14589a31b: 415d pop r13
14589a31d: 415e pop r14
14589a31f: 415f pop r15
14589a321: c3 ret
