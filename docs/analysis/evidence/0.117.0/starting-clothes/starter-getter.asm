; Current0.117.0 [0x145ab5910,0x145ab5b95) SHA-256 dc793b8fbc8801c6b654968e40fe20703bd165728fd47aed33d3577fe6dc404b
145ab5910  55                       push rbp
145ab5911  4157                     push r15
145ab5913  4156                     push r14
145ab5915  4154                     push r12
145ab5917  56                       push rsi
145ab5918  57                       push rdi
145ab5919  53                       push rbx
145ab591a  4881eca0000000           sub rsp, 0xa0
145ab5921  488dac2480000000         lea rbp, [rsp + 0x80]
145ab5929  48c74518feffffff         mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
145ab5931  4889ce                   mov rsi, rcx
145ab5934  41fec8                   dec r8b
145ab5937  0fb6c2                   movzx eax, dl
145ab593a  ffc8                     dec eax
145ab593c  83f807                   cmp eax, 7
145ab593f  0f8760010000             ja 0x145ab5aa5
145ab5945  488d0db8838101           lea rcx, [rip + 0x18183b8]
145ab594c  48630481                 movsxd rax, dword ptr [rcx + rax*4]
145ab5950  4801c8                   add rax, rcx
145ab5953  ffe0                     jmp rax
145ab5955  41bf04000000             mov r15d, 4
145ab595b  4180f80b                 cmp r8b, 0xb
145ab595f  0f8373010000             jae 0x145ab5ad8
145ab5965  410fb6c0                 movzx eax, r8b
145ab5969  b9df050000               mov ecx, 0x5df
145ab596e  0fa3c1                   bt ecx, eax
145ab5971  0f8248010000             jb 0x145ab5abf
145ab5977  e95c010000               jmp 0x145ab5ad8
145ab597c  41bf04000000             mov r15d, 4
145ab5982  4180f80b                 cmp r8b, 0xb
145ab5986  0f834c010000             jae 0x145ab5ad8
145ab598c  410fb6c0                 movzx eax, r8b
145ab5990  b9df050000               mov ecx, 0x5df
145ab5995  0fa3c1                   bt ecx, eax
145ab5998  0f833a010000             jae 0x145ab5ad8
145ab599e  488d0543788101           lea rax, [rip + 0x1817843]
145ab59a5  e91c010000               jmp 0x145ab5ac6
145ab59aa  41bf04000000             mov r15d, 4
145ab59b0  4180f80b                 cmp r8b, 0xb
145ab59b4  0f831e010000             jae 0x145ab5ad8
145ab59ba  410fb6c0                 movzx eax, r8b
145ab59be  b9df050000               mov ecx, 0x5df
145ab59c3  0fa3c1                   bt ecx, eax
145ab59c6  0f830c010000             jae 0x145ab5ad8
145ab59cc  488d0565778101           lea rax, [rip + 0x1817765]
145ab59d3  e9ee000000               jmp 0x145ab5ac6
145ab59d8  41bf04000000             mov r15d, 4
145ab59de  4180f80b                 cmp r8b, 0xb
145ab59e2  0f83f0000000             jae 0x145ab5ad8
145ab59e8  410fb6c0                 movzx eax, r8b
145ab59ec  b9df050000               mov ecx, 0x5df
145ab59f1  0fa3c1                   bt ecx, eax
145ab59f4  0f83de000000             jae 0x145ab5ad8
145ab59fa  488d058f778101           lea rax, [rip + 0x181778f]
145ab5a01  e9c0000000               jmp 0x145ab5ac6
145ab5a06  41bf04000000             mov r15d, 4
145ab5a0c  4180f80b                 cmp r8b, 0xb
145ab5a10  0f83c2000000             jae 0x145ab5ad8
145ab5a16  410fb6c0                 movzx eax, r8b
145ab5a1a  b9df050000               mov ecx, 0x5df
145ab5a1f  0fa3c1                   bt ecx, eax
145ab5a22  0f83b0000000             jae 0x145ab5ad8
145ab5a28  488d05c1788101           lea rax, [rip + 0x18178c1]
145ab5a2f  e992000000               jmp 0x145ab5ac6
145ab5a34  41bf04000000             mov r15d, 4
145ab5a3a  4180f80b                 cmp r8b, 0xb
145ab5a3e  0f8394000000             jae 0x145ab5ad8
145ab5a44  410fb6c0                 movzx eax, r8b
145ab5a48  b9df050000               mov ecx, 0x5df
145ab5a4d  0fa3c1                   bt ecx, eax
145ab5a50  0f8382000000             jae 0x145ab5ad8
145ab5a56  488d0583768101           lea rax, [rip + 0x1817683]
145ab5a5d  eb67                     jmp 0x145ab5ac6
145ab5a5f  41bf04000000             mov r15d, 4
145ab5a65  4180f80b                 cmp r8b, 0xb
145ab5a69  736d                     jae 0x145ab5ad8
145ab5a6b  410fb6c0                 movzx eax, r8b
145ab5a6f  b9df050000               mov ecx, 0x5df
145ab5a74  0fa3c1                   bt ecx, eax
145ab5a77  735f                     jae 0x145ab5ad8
145ab5a79  488d05c0778101           lea rax, [rip + 0x18177c0]
145ab5a80  eb44                     jmp 0x145ab5ac6
145ab5a82  41bf04000000             mov r15d, 4
145ab5a88  4180f80b                 cmp r8b, 0xb
145ab5a8c  734a                     jae 0x145ab5ad8
145ab5a8e  410fb6c0                 movzx eax, r8b
145ab5a92  b9df050000               mov ecx, 0x5df
145ab5a97  0fa3c1                   bt ecx, eax
145ab5a9a  733c                     jae 0x145ab5ad8
145ab5a9c  488d05f5778101           lea rax, [rip + 0x18177f5]
145ab5aa3  eb21                     jmp 0x145ab5ac6
145ab5aa5  41bf04000000             mov r15d, 4
145ab5aab  4180f80b                 cmp r8b, 0xb
145ab5aaf  7327                     jae 0x145ab5ad8
145ab5ab1  410fb6c0                 movzx eax, r8b
145ab5ab5  b9df050000               mov ecx, 0x5df
145ab5aba  0fa3c1                   bt ecx, eax
145ab5abd  7319                     jae 0x145ab5ad8
145ab5abf  488d0582788101           lea rax, [rip + 0x1817882]
145ab5ac6  410fb6c8                 movzx ecx, r8b
145ab5aca  488b04c8                 mov rax, qword ptr [rax + rcx*8]
145ab5ace  4c8b7808                 mov r15, qword ptr [rax + 8]
145ab5ad2  488b4010                 mov rax, qword ptr [rax + 0x10]
145ab5ad6  eb02                     jmp 0x145ab5ada
145ab5ad8  31c0                     xor eax, eax
145ab5ada  0f57c0                   xorps xmm0, xmm0
145ab5add  0f11463c                 movups xmmword ptr [rsi + 0x3c], xmm0
145ab5ae1  0f114630                 movups xmmword ptr [rsi + 0x30], xmm0
145ab5ae5  0f114620                 movups xmmword ptr [rsi + 0x20], xmm0
145ab5ae9  0f114610                 movups xmmword ptr [rsi + 0x10], xmm0
145ab5aed  0f1106                   movups xmmword ptr [rsi], xmm0
145ab5af0  4d8d2487                 lea r12, [r15 + rax*4]
145ab5af4  488d7da8                 lea rdi, [rbp - 0x58]
145ab5af8  0f1f840000000000         nop dword ptr [rax + rax]
145ab5b00  4d39e7                   cmp r15, r12
145ab5b03  7467                     je 0x145ab5b6c
145ab5b05  418b17                   mov edx, dword ptr [r15]
145ab5b08  4983c704                 add r15, 4
145ab5b0c  4889f9                   mov rcx, rdi
145ab5b0f  e8cc000000               call 0x145ab5be0
145ab5b14  48837da8ff               cmp qword ptr [rbp - 0x58], -1
145ab5b19  74e5                     je 0x145ab5b00
145ab5b1b  0fb64d10                 movzx ecx, byte ptr [rbp + 0x10]
145ab5b1f  4883f913                 cmp rcx, 0x13
145ab5b23  735c                     jae 0x145ab5b81
145ab5b25  488b55a8                 mov rdx, qword ptr [rbp - 0x58]
145ab5b29  488b45b0                 mov rax, qword ptr [rbp - 0x50]
145ab5b2d  488b5dc0                 mov rbx, qword ptr [rbp - 0x40]
145ab5b31  4c8b75c8                 mov r14, qword ptr [rbp - 0x38]
145ab5b35  448b45f8                 mov r8d, dword ptr [rbp - 8]
145ab5b39  4489048e                 mov dword ptr [rsi + rcx*4], r8d
145ab5b3d  4885d2                   test rdx, rdx
145ab5b40  740e                     je 0x145ab5b50
145ab5b42  41b801000000             mov r8d, 1
145ab5b48  4889c1                   mov rcx, rax
145ab5b4b  e880c654fa               call 0x1400021d0
145ab5b50  4885db                   test rbx, rbx
145ab5b53  74ab                     je 0x145ab5b00
145ab5b55  48c1e303                 shl rbx, 3
145ab5b59  41b804000000             mov r8d, 4
145ab5b5f  4c89f1                   mov rcx, r14
145ab5b62  4889da                   mov rdx, rbx
145ab5b65  e866c654fa               call 0x1400021d0
145ab5b6a  eb94                     jmp 0x145ab5b00
145ab5b6c  4889f0                   mov rax, rsi
145ab5b6f  4881c4a0000000           add rsp, 0xa0
145ab5b76  5b                       pop rbx
145ab5b77  5f                       pop rdi
145ab5b78  5e                       pop rsi
145ab5b79  415c                     pop r12
145ab5b7b  415e                     pop r14
145ab5b7d  415f                     pop r15
145ab5b7f  5d                       pop rbp
145ab5b80  c3                       ret
145ab5b81  4c8d05f83d8101           lea r8, [rip + 0x1813df8]
145ab5b88  ba13000000               mov edx, 0x13
145ab5b8d  e8c1546800               call 0x14613b053
145ab5b92  90                       nop
145ab5b93  0f0b                     ud2
