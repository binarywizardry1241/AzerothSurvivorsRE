00000001401b782d  4a8d1401               lea rdx, [rcx + r8]
00000001401b7831  48ffc2                 inc rdx
00000001401b7834  4c01c1                 add rcx, r8
00000001401b7837  49f7d0                 not r8
00000001401b783a  4d01f0                 add r8, r14
00000001401b783d  e875c2de05             call 0x145fa3ab7
00000001401b7842  48c7c0ffffffff         mov rax, 0xffffffffffffffff
00000001401b7849  4c89f2                 mov rdx, r14
00000001401b784c  4c8bb508030000         mov r14, qword ptr [rbp + 0x308]
00000001401b7853  4801c2                 add rdx, rax
00000001401b7856  488995b0020000         mov qword ptr [rbp + 0x2b0], rdx
00000001401b785d  488995b0010000         mov qword ptr [rbp + 0x1b0], rdx
00000001401b7864  0f108570020000         movups xmm0, xmmword ptr [rbp + 0x270]
00000001401b786b  0f108d80020000         movups xmm1, xmmword ptr [rbp + 0x280]
00000001401b7872  0f109590020000         movups xmm2, xmmword ptr [rbp + 0x290]
00000001401b7879  0f109da0020000         movups xmm3, xmmword ptr [rbp + 0x2a0]
00000001401b7880  0f299da0010000         movaps xmmword ptr [rbp + 0x1a0], xmm3
00000001401b7887  0f299590010000         movaps xmmword ptr [rbp + 0x190], xmm2
00000001401b788e  0f298d80010000         movaps xmmword ptr [rbp + 0x180], xmm1
00000001401b7895  0f298570010000         movaps xmmword ptr [rbp + 0x170], xmm0
00000001401b789c  488b8520030000         mov rax, qword ptr [rbp + 0x320]
00000001401b78a3  8b8d30030000           mov ecx, dword ptr [rbp + 0x330]
00000001401b78a9  8908                   mov dword ptr [rax], ecx
00000001401b78ab  49833eff               cmp qword ptr [r14], -1
00000001401b78af  7408                   je 0x1401b78b9
00000001401b78b1  4c89f1                 mov rcx, r14
00000001401b78b4  e8b787fdff             call 0x140190070
00000001401b78b9  488b85b0010000         mov rax, qword ptr [rbp + 0x1b0]
00000001401b78c0  49894640               mov qword ptr [r14 + 0x40], rax
00000001401b78c4  0f288570010000         movaps xmm0, xmmword ptr [rbp + 0x170]
00000001401b78cb  0f288d80010000         movaps xmm1, xmmword ptr [rbp + 0x180]
00000001401b78d2  0f289590010000         movaps xmm2, xmmword ptr [rbp + 0x190]
00000001401b78d9  0f289da0010000         movaps xmm3, xmmword ptr [rbp + 0x1a0]
00000001401b78e0  410f115e30             movups xmmword ptr [r14 + 0x30], xmm3
00000001401b78e5  410f115620             movups xmmword ptr [r14 + 0x20], xmm2
00000001401b78ea  410f114e10             movups xmmword ptr [r14 + 0x10], xmm1
00000001401b78ef  410f1106               movups xmmword ptr [r14], xmm0
00000001401b78f3  4c8d9588000000         lea r10, [rbp + 0x88]
00000001401b78fa  e9d1f2ffff             jmp 0x1401b6bd0
