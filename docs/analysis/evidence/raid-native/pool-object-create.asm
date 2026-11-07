145951e11: 498bb42498050000 mov rsi, qword ptr [r12 + 0x598]
145951e19: 31db xor ebx, ebx
145951e1b: 4c8d75d8 lea r14, [rbp - 0x28]
145951e1f: 90 nop
145951e20: 4839f3 cmp rbx, rsi
145951e23: 0f831a010000 jae 0x145951f43
145951e29: 4889df mov rdi, rbx
145951e2c: 498b942498050000 mov rdx, qword ptr [r12 + 0x598]
145951e34: 4839d3 cmp rbx, rdx
145951e37: 0f8384190000 jae 0x1459537c1
145951e3d: 488d5f01 lea rbx, [rdi + 1]
145951e41: 498b8c2490050000 mov rcx, qword ptr [r12 + 0x590]
145951e49: 4989ff mov r15, rdi
145951e4c: 49c1e707 shl r15, 7
145951e50: 4a837c3928ff cmp qword ptr [rcx + r15 + 0x28], -1
145951e56: 75c8 jne 0x145951e20
145951e58: 4c01f9 add rcx, r15
145951e5b: 448b4110 mov r8d, dword ptr [rcx + 0x10]
145951e5f: 8b411c mov eax, dword ptr [rcx + 0x1c]
145951e62: f30f105934 movss xmm3, dword ptr [rcx + 0x34]
145951e67: 4183f002 xor r8d, 2
145951e6b: 440b4130 or r8d, dword ptr [rcx + 0x30]
145951e6f: 410f95c0 setne r8b
145951e73: 448b4948 mov r9d, dword ptr [rcx + 0x48]
145951e77: 44894de0 mov dword ptr [rbp - 0x20], r9d
145951e7b: 488b4940 mov rcx, qword ptr [rcx + 0x40]
145951e7f: 48894dd8 mov qword ptr [rbp - 0x28], rcx
145951e83: 85c0 test eax, eax
145951e85: 0f94c1 sete cl
145951e88: 4408c1 or cl, r8b
145951e8b: 7407 je 0x145951e94
145951e8d: 31c0 xor eax, eax
145951e8f: e994000000 jmp 0x145951f28
145951e94: 488b8d78020000 mov rcx, qword ptr [rbp + 0x278]
145951e9b: 48898d68020000 mov qword ptr [rbp + 0x268], rcx
145951ea2: 488b8d80020000 mov rcx, qword ptr [rbp + 0x280]
145951ea9: 48898d60020000 mov qword ptr [rbp + 0x260], rcx
145951eb0: 488b8d88020000 mov rcx, qword ptr [rbp + 0x288]
145951eb7: 48898d58020000 mov qword ptr [rbp + 0x258], rcx
145951ebe: 488b8d90020000 mov rcx, qword ptr [rbp + 0x290]
145951ec5: 48898d50020000 mov qword ptr [rbp + 0x250], rcx
145951ecc: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
145951ed3: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145951eda: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145951ee1: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
145951ee8: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145951eef: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145951ef6: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
145951efd: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
145951f04: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145951f0b: 4c89e1 mov rcx, r12
145951f0e: 89c2 mov edx, eax
145951f10: 4d89f0 mov r8, r14
145951f13: e868200100 call 0x145963f80
145951f18: 90 nop
145951f19: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
145951f20: 498b942498050000 mov rdx, qword ptr [r12 + 0x598]
145951f28: 4839d7 cmp rdi, rdx
145951f2b: 0f83031a0000 jae 0x145953934
145951f31: 498b8c2490050000 mov rcx, qword ptr [r12 + 0x590]
145951f39: 4a89443928 mov qword ptr [rcx + r15 + 0x28], rax
145951f3e: e9ddfeffff jmp 0x145951e20
