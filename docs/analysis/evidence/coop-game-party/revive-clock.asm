0x1458f8886: 4180bd460c000004         cmp byte ptr [r13 + 0xc46], 4
0x1458f888e: 0f8511030000             jne 0x1458f8ba5
0x1458f8894: 4180bd330c000000         cmp byte ptr [r13 + 0xc33], 0
0x1458f889c: 0f8503030000             jne 0x1458f8ba5
0x1458f88a2: 418b442408               mov eax, dword ptr [r12 + 8]
0x1458f88a7: 8985b0120000             mov dword ptr [rbp + 0x12b0], eax
0x1458f88ad: 498b0424                 mov rax, qword ptr [r12]
0x1458f88b1: 488985a8120000           mov qword ptr [rbp + 0x12a8], rax
0x1458f88b8: 4d8bb5400b0000           mov r14, qword ptr [r13 + 0xb40]
0x1458f88bf: 4c89b5a0120000           mov qword ptr [rbp + 0x12a0], r14
0x1458f88c6: 488b85d8120000           mov rax, qword ptr [rbp + 0x12d8]
0x1458f88cd: 488b8de0120000           mov rcx, qword ptr [rbp + 0x12e0]
0x1458f88d4: 48c1e104                 shl rcx, 4
0x1458f88d8: 4801c1                   add rcx, rax
0x1458f88db: 48898520090000           mov qword ptr [rbp + 0x920], rax
0x1458f88e2: 48898d28090000           mov qword ptr [rbp + 0x928], rcx
0x1458f88e9: 48c7853009000000000000   mov qword ptr [rbp + 0x930], 0
0x1458f88f4: 488d85a0120000           lea rax, [rbp + 0x12a0]
0x1458f88fb: 48898538090000           mov qword ptr [rbp + 0x938], rax
0x1458f8902: 488d85a8120000           lea rax, [rbp + 0x12a8]
0x1458f8909: 48898540090000           mov qword ptr [rbp + 0x940], rax
0x1458f8910: 488d8d20130000           lea rcx, [rbp + 0x1320]
0x1458f8917: 488d9520090000           lea rdx, [rbp + 0x920]
0x1458f891e: e8fd3f0d00               call 0x1459cc920
0x1458f8923: 90                       nop
0x1458f8924: 488b8530130000           mov rax, qword ptr [rbp + 0x1330]
0x1458f892b: f3410f108d280c0000       movss xmm1, dword ptr [r13 + 0xc28]
0x1458f8934: 488b4da8                 mov rcx, qword ptr [rbp - 0x58]
0x1458f8938: f30f1001                 movss xmm0, dword ptr [rcx]
0x1458f893c: 4885c0                   test rax, rax
0x1458f893f: 0f84ef010000             je 0x1458f8b34
0x1458f8945: f30f58c8                 addss xmm1, xmm0
0x1458f8949: f3410f118d280c0000       movss dword ptr [r13 + 0xc28], xmm1
0x1458f8952: 0f2e0d67765e00           ucomiss xmm1, dword ptr [rip + 0x5e7667]
0x1458f8959: f30f118d48130000         movss dword ptr [rbp + 0x1348], xmm1
0x1458f8961: 0f83f6010000             jae 0x1458f8b5d
0x1458f8967: 0f28c1                   movaps xmm0, xmm1
0x1458f896a: f30f5e054e765e00         divss xmm0, dword ptr [rip + 0x5e764e]
0x1458f8972: 0f57c9                   xorps xmm1, xmm1
0x1458f8975: f30f5fc8                 maxss xmm1, xmm0
0x1458f8979: f30f10352f755e00         movss xmm6, dword ptr [rip + 0x5e752f]
0x1458f8981: f30f5df1                 minss xmm6, xmm1
0x1458f8985: 488b8d20130000           mov rcx, qword ptr [rbp + 0x1320]
0x1458f898c: 48898dc8120000           mov qword ptr [rbp + 0x12c8], rcx
0x1458f8993: 488b9d28130000           mov rbx, qword ptr [rbp + 0x1328]
0x1458f899a: 488d04c3                 lea rax, [rbx + rax*8]
0x1458f899e: 48898580130000           mov qword ptr [rbp + 0x1380], rax
0x1458f89a5: 488b75b0                 mov rsi, qword ptr [rbp - 0x50]
0x1458f89a9: 4c8b6db8                 mov r13, qword ptr [rbp - 0x48]
0x1458f89ad: 4b8d0476                 lea rax, [r14 + r14*2]
0x1458f89b1: 48c1e003                 shl rax, 3
0x1458f89b5: 48898560130000           mov qword ptr [rbp + 0x1360], rax
0x1458f89bc: 48899db8120000           mov qword ptr [rbp + 0x12b8], rbx
0x1458f89c3: eb59                     jmp 0x1458f8a1e
0x1458f89c5: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
0x1458f89d0: 4883c308                 add rbx, 8
0x1458f89d4: 488b4608                 mov rax, qword ptr [rsi + 8]
0x1458f89d8: 488d0cff                 lea rcx, [rdi + rdi*8]
0x1458f89dc: 488b9560090000           mov rdx, qword ptr [rbp + 0x960]
0x1458f89e3: 488954c840               mov qword ptr [rax + rcx*8 + 0x40], rdx
0x1458f89e8: 0f108520090000           movups xmm0, xmmword ptr [rbp + 0x920]
0x1458f89ef: 0f108d30090000           movups xmm1, xmmword ptr [rbp + 0x930]
0x1458f89f6: 0f109540090000           movups xmm2, xmmword ptr [rbp + 0x940]
0x1458f89fd: 0f109d50090000           movups xmm3, xmmword ptr [rbp + 0x950]
0x1458f8a04: 0f115cc830               movups xmmword ptr [rax + rcx*8 + 0x30], xmm3
0x1458f8a09: 0f1154c820               movups xmmword ptr [rax + rcx*8 + 0x20], xmm2
0x1458f8a0e: 0f114cc810               movups xmmword ptr [rax + rcx*8 + 0x10], xmm1
0x1458f8a13: 0f1104c8                 movups xmmword ptr [rax + rcx*8], xmm0
0x1458f8a17: 48ffc7                   inc rdi
0x1458f8a1a: 48897e10                 mov qword ptr [rsi + 0x10], rdi
0x1458f8a1e: 483b9d80130000           cmp rbx, qword ptr [rbp + 0x1380]
0x1458f8a25: 0f8450010000             je 0x1458f8b7b
0x1458f8a2b: 488b3b                   mov rdi, qword ptr [rbx]
0x1458f8a2e: 498b4510                 mov rax, qword ptr [r13 + 0x10]
0x1458f8a32: 41bf01000000             mov r15d, 1
0x1458f8a38: 4839c7                   cmp rdi, rax
0x1458f8a3b: 7343                     jae 0x1458f8a80
0x1458f8a3d: 488d147f                 lea rdx, [rdi + rdi*2]
0x1458f8a41: 48c1e203                 shl rdx, 3
0x1458f8a45: 49035508                 add rdx, qword ptr [r13 + 8]
0x1458f8a49: 488d8d20090000           lea rcx, [rbp + 0x920]
0x1458f8a50: e8bbed3e00               call 0x145ce7810
0x1458f8a55: 90                       nop
0x1458f8a56: 488b9520090000           mov rdx, qword ptr [rbp + 0x920]
0x1458f8a5d: 4c8b8528090000           mov r8, qword ptr [rbp + 0x928]
0x1458f8a64: 4c8ba530090000           mov r12, qword ptr [rbp + 0x930]
0x1458f8a6b: 498b4510                 mov rax, qword ptr [r13 + 0x10]
0x1458f8a6f: 4939c6                   cmp r14, rax
0x1458f8a72: 721c                     jb 0x1458f8a90
0x1458f8a74: 31c0                     xor eax, eax
0x1458f8a76: 31c9                     xor ecx, ecx
0x1458f8a78: eb5f                     jmp 0x1458f8ad9
0x1458f8a7a: 660f1f440000             nop word ptr [rax + rax]
0x1458f8a80: 31d2                     xor edx, edx
0x1458f8a82: 41b801000000             mov r8d, 1
0x1458f8a88: 4531e4                   xor r12d, r12d
0x1458f8a8b: 4939c6                   cmp r14, rax
0x1458f8a8e: 73e4                     jae 0x1458f8a74
0x1458f8a90: 4c898568130000           mov qword ptr [rbp + 0x1368], r8
0x1458f8a97: 48899570130000           mov qword ptr [rbp + 0x1370], rdx
0x1458f8a9e: 498b5508                 mov rdx, qword ptr [r13 + 8]
0x1458f8aa2: 48039560130000           add rdx, qword ptr [rbp + 0x1360]
0x1458f8aa9: 488d8d20090000           lea rcx, [rbp + 0x920]
0x1458f8ab0: e85bed3e00               call 0x145ce7810
0x1458f8ab5: 90                       nop
0x1458f8ab6: 488b8520090000           mov rax, qword ptr [rbp + 0x920]
0x1458f8abd: 4c8bbd28090000           mov r15, qword ptr [rbp + 0x928]
0x1458f8ac4: 488b8d30090000           mov rcx, qword ptr [rbp + 0x930]
0x1458f8acb: 488b9570130000           mov rdx, qword ptr [rbp + 0x1370]
0x1458f8ad2: 4c8b8568130000           mov r8, qword ptr [rbp + 0x1368]
0x1458f8ad9: 4889bd50090000           mov qword ptr [rbp + 0x950], rdi
0x1458f8ae0: 48899520090000           mov qword ptr [rbp + 0x920], rdx
0x1458f8ae7: 4c898528090000           mov qword ptr [rbp + 0x928], r8
0x1458f8aee: 4c89a530090000           mov qword ptr [rbp + 0x930], r12
0x1458f8af5: 4c89b558090000           mov qword ptr [rbp + 0x958], r14
0x1458f8afc: 48898538090000           mov qword ptr [rbp + 0x938], rax
0x1458f8b03: 4c89bd40090000           mov qword ptr [rbp + 0x940], r15
0x1458f8b0a: 48898d48090000           mov qword ptr [rbp + 0x948], rcx
0x1458f8b11: f30f11b560090000         movss dword ptr [rbp + 0x960], xmm6
0x1458f8b19: 488b7e10                 mov rdi, qword ptr [rsi + 0x10]
0x1458f8b1d: 483b3e                   cmp rdi, qword ptr [rsi]
0x1458f8b20: 0f85aafeffff             jne 0x1458f89d0
0x1458f8b26: 4889f1                   mov rcx, rsi
0x1458f8b29: e892c34100               call 0x145d14ec0
0x1458f8b2e: 90                       nop
0x1458f8b2f: e99cfeffff               jmp 0x1458f89d0
0x1458f8b34: f30f5cc8                 subss xmm1, xmm0
0x1458f8b38: 0f57c0                   xorps xmm0, xmm0
0x1458f8b3b: f30f5fc8                 maxss xmm1, xmm0
0x1458f8b3f: f3410f118d280c0000       movss dword ptr [r13 + 0xc28], xmm1
0x1458f8b48: 0f2e0d71745e00           ucomiss xmm1, dword ptr [rip + 0x5e7471]
0x1458f8b4f: f30f118d48130000         movss dword ptr [rbp + 0x1348], xmm1
0x1458f8b57: 0f820afeffff             jb 0x1458f8967
0x1458f8b5d: 4c89e9                   mov rcx, r13
0x1458f8b60: e85b760000               call 0x1459001c0
