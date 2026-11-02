0000000140264b70  55                     push rbp
0000000140264b71  4157                   push r15
0000000140264b73  4156                   push r14
0000000140264b75  4155                   push r13
0000000140264b77  4154                   push r12
0000000140264b79  56                     push rsi
0000000140264b7a  57                     push rdi
0000000140264b7b  53                     push rbx
0000000140264b7c  4881ec48040000         sub rsp, 0x448
0000000140264b83  488dac2480000000       lea rbp, [rsp + 0x80]
0000000140264b8b  48c785c0030000feffffff mov qword ptr [rbp + 0x3c0], 0xfffffffffffffffe
0000000140264b96  4c89ce                 mov rsi, r9
0000000140264b99  4c89c3                 mov rbx, r8
0000000140264b9c  48899578030000         mov qword ptr [rbp + 0x378], rdx
0000000140264ba3  4989cf                 mov r15, rcx
0000000140264ba6  4c8bb530040000         mov r14, qword ptr [rbp + 0x430]
0000000140264bad  4d8b6608               mov r12, qword ptr [r14 + 8]
0000000140264bb1  498b7e10               mov rdi, qword ptr [r14 + 0x10]
0000000140264bb5  4c89c9                 mov rcx, r9
0000000140264bb8  4c89e2                 mov rdx, r12
0000000140264bbb  4989f8                 mov r8, rdi
0000000140264bbe  e8bda88605             call 0x145acf480
0000000140264bc3  4189c5                 mov r13d, eax
0000000140264bc6  8885bf030000           mov byte ptr [rbp + 0x3bf], al
0000000140264bcc  488d4d48               lea rcx, [rbp + 0x48]
0000000140264bd0  4889f2                 mov rdx, rsi
0000000140264bd3  4d89f0                 mov r8, r14
0000000140264bd6  e805c88d05             call 0x145b413e0
0000000140264bdb  837d4801               cmp dword ptr [rbp + 0x48], 1
0000000140264bdf  7510                   jne 0x140264bf1
0000000140264be1  488b4558               mov rax, qword ptr [rbp + 0x58]
0000000140264be5  4883f802               cmp rax, 2
0000000140264be9  0f92c1                 setb cl
0000000140264bec  4408e9                 or cl, r13b
0000000140264bef  7404                   je 0x140264bf5
0000000140264bf1  31c0                   xor eax, eax
0000000140264bf3  eb17                   jmp 0x140264c0c
0000000140264bf5  488b4d50               mov rcx, qword ptr [rbp + 0x50]
0000000140264bf9  48898df0020000         mov qword ptr [rbp + 0x2f0], rcx
0000000140264c00  488985f8020000         mov qword ptr [rbp + 0x2f8], rax
0000000140264c07  b801000000             mov eax, 1
0000000140264c0c  488985e8020000         mov qword ptr [rbp + 0x2e8], rax
0000000140264c13  488d8d60030000         lea rcx, [rbp + 0x360]
0000000140264c1a  4c89e2                 mov rdx, r12
0000000140264c1d  4989f8                 mov r8, rdi
0000000140264c20  e8cbf98d05             call 0x145b445f0
0000000140264c25  0f1005ac88f305         movups xmm0, xmmword ptr [rip + 0x5f388ac]
0000000140264c2c  0f298500030000         movaps xmmword ptr [rbp + 0x300], xmm0
0000000140264c33  48c7851003000000000000 mov qword ptr [rbp + 0x310], 0
0000000140264c3e  0f1005ab88f305         movups xmm0, xmmword ptr [rip + 0x5f388ab]
0000000140264c45  0f118518030000         movups xmmword ptr [rbp + 0x318], xmm0
0000000140264c4c  48c7852803000000000000 mov qword ptr [rbp + 0x328], 0
0000000140264c57  0f1005aa88f305         movups xmm0, xmmword ptr [rip + 0x5f388aa]
0000000140264c5e  0f298530030000         movaps xmmword ptr [rbp + 0x330], xmm0
0000000140264c65  48c7854003000000000000 mov qword ptr [rbp + 0x340], 0
0000000140264c70  0f1005a988f305         movups xmm0, xmmword ptr [rip + 0x5f388a9]
0000000140264c77  0f118548030000         movups xmmword ptr [rbp + 0x348], xmm0
0000000140264c7e  48c7855803000000000000 mov qword ptr [rbp + 0x358], 0
0000000140264c89  4584ed                 test r13b, r13b
0000000140264c8c  7409                   je 0x140264c97
0000000140264c8e  0f1005938af305         movups xmm0, xmmword ptr [rip + 0x5f38a93]
0000000140264c95  eb07                   jmp 0x140264c9e
0000000140264c97  0f1005ba89f305         movups xmm0, xmmword ptr [rip + 0x5f389ba]
0000000140264c9e  0f2985a0030000         movaps xmmword ptr [rbp + 0x3a0], xmm0
0000000140264ca5  c785b00300000000803f   mov dword ptr [rbp + 0x3b0], 0x3f800000
0000000140264caf  8b85b0030000           mov eax, dword ptr [rbp + 0x3b0]
0000000140264cb5  8985a0020000           mov dword ptr [rbp + 0x2a0], eax
0000000140264cbb  0f2885a0030000         movaps xmm0, xmmword ptr [rbp + 0x3a0]
0000000140264cc2  0f298590020000         movaps xmmword ptr [rbp + 0x290], xmm0
0000000140264cc9  0f1185a4020000         movups xmmword ptr [rbp + 0x2a4], xmm0
0000000140264cd0  8985b4020000           mov dword ptr [rbp + 0x2b4], eax
0000000140264cd6  0f1185b8020000         movups xmmword ptr [rbp + 0x2b8], xmm0
0000000140264cdd  8985c8020000           mov dword ptr [rbp + 0x2c8], eax
0000000140264ce3  0f1185cc020000         movups xmmword ptr [rbp + 0x2cc], xmm0
0000000140264cea  8985dc020000           mov dword ptr [rbp + 0x2dc], eax
0000000140264cf0  4584ed                 test r13b, r13b
0000000140264cf3  741a                   je 0x140264d0f
0000000140264cf5  0f1005548af305         movups xmm0, xmmword ptr [rip + 0x5f38a54]
0000000140264cfc  0f298580030000         movaps xmmword ptr [rbp + 0x380], xmm0
0000000140264d03  c785900300001f856b3f   mov dword ptr [rbp + 0x390], 0x3f6b851f
0000000140264d0d  eb18                   jmp 0x140264d27
0000000140264d0f  0f1005268af305         movups xmm0, xmmword ptr [rip + 0x5f38a26]
0000000140264d16  0f298580030000         movaps xmmword ptr [rbp + 0x380], xmm0
0000000140264d1d  c785900300000000403f   mov dword ptr [rbp + 0x390], 0x3f400000
0000000140264d27  0f288550030000         movaps xmm0, xmmword ptr [rbp + 0x350]
0000000140264d2e  0f2945f0               movaps xmmword ptr [rbp - 0x10], xmm0
0000000140264d32  0f288540030000         movaps xmm0, xmmword ptr [rbp + 0x340]
0000000140264d39  0f2945e0               movaps xmmword ptr [rbp - 0x20], xmm0
0000000140264d3d  0f288500030000         movaps xmm0, xmmword ptr [rbp + 0x300]
0000000140264d44  0f288d10030000         movaps xmm1, xmmword ptr [rbp + 0x310]
0000000140264d4b  0f289520030000         movaps xmm2, xmmword ptr [rbp + 0x320]
0000000140264d52  0f289d30030000         movaps xmm3, xmmword ptr [rbp + 0x330]
0000000140264d59  0f295dd0               movaps xmmword ptr [rbp - 0x30], xmm3
0000000140264d5d  0f2955c0               movaps xmmword ptr [rbp - 0x40], xmm2
0000000140264d61  0f294db0               movaps xmmword ptr [rbp - 0x50], xmm1
0000000140264d65  0f2945a0               movaps xmmword ptr [rbp - 0x60], xmm0
0000000140264d69  0f57c0                 xorps xmm0, xmm0
0000000140264d6c  0f294500               movaps xmmword ptr [rbp], xmm0
0000000140264d70  0f294510               movaps xmmword ptr [rbp + 0x10], xmm0
0000000140264d74  0f294520               movaps xmmword ptr [rbp + 0x20], xmm0
0000000140264d78  0f294530               movaps xmmword ptr [rbp + 0x30], xmm0
0000000140264d7c  0f1185f8000000         movups xmmword ptr [rbp + 0xf8], xmm0
0000000140264d83  0f2885d0020000         movaps xmm0, xmmword ptr [rbp + 0x2d0]
0000000140264d8a  0f118580020000         movups xmmword ptr [rbp + 0x280], xmm0
0000000140264d91  0f288590020000         movaps xmm0, xmmword ptr [rbp + 0x290]
0000000140264d98  0f288da0020000         movaps xmm1, xmmword ptr [rbp + 0x2a0]
0000000140264d9f  0f2895b0020000         movaps xmm2, xmmword ptr [rbp + 0x2b0]
0000000140264da6  0f289dc0020000         movaps xmm3, xmmword ptr [rbp + 0x2c0]
0000000140264dad  0f119d70020000         movups xmmword ptr [rbp + 0x270], xmm3
0000000140264db4  0f119560020000         movups xmmword ptr [rbp + 0x260], xmm2
0000000140264dbb  0f118d50020000         movups xmmword ptr [rbp + 0x250], xmm1
0000000140264dc2  0f118540020000         movups xmmword ptr [rbp + 0x240], xmm0
0000000140264dc9  498b3f                 mov rdi, qword ptr [r15]
0000000140264dcc  4983c708               add r15, 8
0000000140264dd0  488d4d50               lea rcx, [rbp + 0x50]
0000000140264dd4  488d55a0               lea rdx, [rbp - 0x60]
0000000140264dd8  41b8a0000000           mov r8d, 0xa0
0000000140264dde  e8f8f3d205             call 0x145f941db
0000000140264de3  48b80100000000009842   movabs rax, 0x4298000000000001
0000000140264ded  488985f0000000         mov qword ptr [rbp + 0xf0], rax
0000000140264df4  0f10059587f305         movups xmm0, xmmword ptr [rip + 0x5f38795]
0000000140264dfb  0f118508010000         movups xmmword ptr [rbp + 0x108], xmm0
0000000140264e02  0f10059787f305         movups xmm0, xmmword ptr [rip + 0x5f38797]
0000000140264e09  0f118518010000         movups xmmword ptr [rbp + 0x118], xmm0
0000000140264e10  0f280519eeef05         movaps xmm0, xmmword ptr [rip + 0x5efee19]
0000000140264e17  0f118528010000         movups xmmword ptr [rbp + 0x128], xmm0
0000000140264e1e  0f2805fb8bf105         movaps xmm0, xmmword ptr [rip + 0x5f18bfb]
0000000140264e25  0f118538010000         movups xmmword ptr [rbp + 0x138], xmm0
0000000140264e2c  0f2805bdedef05         movaps xmm0, xmmword ptr [rip + 0x5efedbd]
0000000140264e33  0f118548010000         movups xmmword ptr [rbp + 0x148], xmm0
0000000140264e3a  0f118558010000         movups xmmword ptr [rbp + 0x158], xmm0
0000000140264e41  0f280508f1ef05         movaps xmm0, xmmword ptr [rip + 0x5eff108]
0000000140264e48  0f118568010000         movups xmmword ptr [rbp + 0x168], xmm0
0000000140264e4f  0f118578010000         movups xmmword ptr [rbp + 0x178], xmm0
0000000140264e56  0f2805e3ecef05         movaps xmm0, xmmword ptr [rip + 0x5efece3]
0000000140264e5d  0f118588010000         movups xmmword ptr [rbp + 0x188], xmm0
0000000140264e64  c7859801000001000000   mov dword ptr [rbp + 0x198], 1
0000000140264e6e  f30f100522edef05       movss xmm0, dword ptr [rip + 0x5efed22]
0000000140264e76  0f13859c010000         movlps qword ptr [rbp + 0x19c], xmm0
0000000140264e7d  c685a401000001         mov byte ptr [rbp + 0x1a4], 1
0000000140264e84  48c785a801000000000000 mov qword ptr [rbp + 0x1a8], 0
0000000140264e8f  c785b00100000000803f   mov dword ptr [rbp + 0x1b0], 0x3f800000
0000000140264e99  66c785b40100000101     mov word ptr [rbp + 0x1b4], 0x101
0000000140264ea2  66c785ba0100000000     mov word ptr [rbp + 0x1ba], 0
0000000140264eab  c785b601000000000100   mov dword ptr [rbp + 0x1b6], 0x10000
0000000140264eb5  c785bc01000000000100   mov dword ptr [rbp + 0x1bc], 0x10000
0000000140264ebf  66c785c00100000000     mov word ptr [rbp + 0x1c0], 0
0000000140264ec8  48c785c201000000000000 mov qword ptr [rbp + 0x1c2], 0
0000000140264ed3  c785ca01000005000000   mov dword ptr [rbp + 0x1ca], 5
0000000140264edd  0f10853e020000         movups xmm0, xmmword ptr [rbp + 0x23e]
0000000140264ee4  0f108d4e020000         movups xmm1, xmmword ptr [rbp + 0x24e]
0000000140264eeb  0f10955e020000         movups xmm2, xmmword ptr [rbp + 0x25e]
0000000140264ef2  0f109d6e020000         movups xmm3, xmmword ptr [rbp + 0x26e]
0000000140264ef9  0f1185ce010000         movups xmmword ptr [rbp + 0x1ce], xmm0
0000000140264f00  0f118dde010000         movups xmmword ptr [rbp + 0x1de], xmm1
0000000140264f07  0f1195ee010000         movups xmmword ptr [rbp + 0x1ee], xmm2
0000000140264f0e  0f119dfe010000         movups xmmword ptr [rbp + 0x1fe], xmm3
0000000140264f15  0f10857e020000         movups xmm0, xmmword ptr [rbp + 0x27e]
0000000140264f1c  0f11850e020000         movups xmmword ptr [rbp + 0x20e], xmm0
0000000140264f23  0fb7858e020000         movzx eax, word ptr [rbp + 0x28e]
0000000140264f2a  6689851e020000         mov word ptr [rbp + 0x21e], ax
0000000140264f31  8b8590030000           mov eax, dword ptr [rbp + 0x390]
0000000140264f37  898530020000           mov dword ptr [rbp + 0x230], eax
0000000140264f3d  0f288580030000         movaps xmm0, xmmword ptr [rbp + 0x380]
0000000140264f44  0f118520020000         movups xmmword ptr [rbp + 0x220], xmm0
0000000140264f4b  48897d48               mov qword ptr [rbp + 0x48], rdi
0000000140264f4f  4c8d0dbaf7ef05         lea r9, [rip + 0x5eff7ba]
0000000140264f56  488d8d00030000         lea rcx, [rbp + 0x300]
0000000140264f5d  4c8d4548               lea r8, [rbp + 0x48]
0000000140264f61  4c89fa                 mov rdx, r15
0000000140264f64  e8774e0500             call 0x1402b9de0
0000000140264f69  90                     nop
0000000140264f6a  488d85bf030000         lea rax, [rbp + 0x3bf]
0000000140264f71  48894548               mov qword ptr [rbp + 0x48], rax
0000000140264f75  48895d50               mov qword ptr [rbp + 0x50], rbx
0000000140264f79  4c897558               mov qword ptr [rbp + 0x58], r14
0000000140264f7d  488b8578030000         mov rax, qword ptr [rbp + 0x378]
0000000140264f84  48894560               mov qword ptr [rbp + 0x60], rax
0000000140264f88  488d85e8020000         lea rax, [rbp + 0x2e8]
0000000140264f8f  48894568               mov qword ptr [rbp + 0x68], rax
0000000140264f93  488d8560030000         lea rax, [rbp + 0x360]
0000000140264f9a  48894570               mov qword ptr [rbp + 0x70], rax
0000000140264f9e  48897578               mov qword ptr [rbp + 0x78], rsi
0000000140264fa2  488d8d00030000         lea rcx, [rbp + 0x300]
0000000140264fa9  488d5548               lea rdx, [rbp + 0x48]
0000000140264fad  e8be450700             call 0x1402d9570
0000000140264fb2  90                     nop
0000000140264fb3  488b8560030000         mov rax, qword ptr [rbp + 0x360]
0000000140264fba  4885c0                 test rax, rax
0000000140264fbd  741b                   je 0x140264fda
0000000140264fbf  488b8d68030000         mov rcx, qword ptr [rbp + 0x368]
0000000140264fc6  48c1e004               shl rax, 4
0000000140264fca  488d1440               lea rdx, [rax + rax*2]
0000000140264fce  41b808000000           mov r8d, 8
0000000140264fd4  e8f7d1d9ff             call 0x1400021d0
0000000140264fd9  90                     nop
0000000140264fda  4881c448040000         add rsp, 0x448
0000000140264fe1  5b                     pop rbx
0000000140264fe2  5f                     pop rdi
0000000140264fe3  5e                     pop rsi
0000000140264fe4  415c                   pop r12
0000000140264fe6  415d                   pop r13
0000000140264fe8  415e                   pop r14
0000000140264fea  415f                   pop r15
0000000140264fec  5d                     pop rbp
0000000140264fed  c3                     ret
