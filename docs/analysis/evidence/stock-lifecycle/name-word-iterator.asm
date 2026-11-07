0x1458aabb0: 4157                     push r15
0x1458aabb2: 4156                     push r14
0x1458aabb4: 4155                     push r13
0x1458aabb6: 4154                     push r12
0x1458aabb8: 56                       push rsi
0x1458aabb9: 57                       push rdi
0x1458aabba: 55                       push rbp
0x1458aabbb: 53                       push rbx
0x1458aabbc: 4883ec28                 sub rsp, 0x28
0x1458aabc0: 4889d7                   mov rdi, rdx
0x1458aabc3: 4c8b6208                 mov r12, qword ptr [rdx + 8]
0x1458aabc7: 4c8b7a18                 mov r15, qword ptr [rdx + 0x18]
0x1458aabcb: 4d39e7                   cmp r15, r12
0x1458aabce: 0f97c0                   seta al
0x1458aabd1: 4c8b7210                 mov r14, qword ptr [rdx + 0x10]
0x1458aabd5: 4d39f7                   cmp r15, r14
0x1458aabd8: 0f92c2                   setb dl
0x1458aabdb: 08c2                     or dl, al
0x1458aabdd: 0f8558010000             jne 0x1458aad3b
0x1458aabe3: 488b37                   mov rsi, qword ptr [rdi]
0x1458aabe6: 0fb65f28                 movzx ebx, byte ptr [rdi + 0x28]
0x1458aabea: 0fb66c1f1f               movzx ebp, byte ptr [rdi + rbx + 0x1f]
0x1458aabef: 4883fb05                 cmp rbx, 5
0x1458aabf3: 48894c2420               mov qword ptr [rsp + 0x20], rcx
0x1458aabf8: 0f828b000000             jb 0x1458aac89
0x1458aabfe: 4d89f8                   mov r8, r15
0x1458aac01: 4d29f0                   sub r8, r14
0x1458aac04: 4a8d0436                 lea rax, [rsi + r14]
0x1458aac08: 4983f80f                 cmp r8, 0xf
0x1458aac0c: 771c                     ja 0x1458aac2a
0x1458aac0e: 31d2                     xor edx, edx
0x1458aac10: 4d85c0                   test r8, r8
0x1458aac13: 7421                     je 0x1458aac36
0x1458aac15: 40382c10                 cmp byte ptr [rax + rdx], bpl
0x1458aac19: 741f                     je 0x1458aac3a
0x1458aac1b: 48ffc2                   inc rdx
0x1458aac1e: 4939d0                   cmp r8, rdx
0x1458aac21: 75f2                     jne 0x1458aac15
0x1458aac23: 4c89c2                   mov rdx, r8
0x1458aac26: 31c0                     xor eax, eax
0x1458aac28: eb15                     jmp 0x1458aac3f
0x1458aac2a: 89e9                     mov ecx, ebp
0x1458aac2c: 4889c2                   mov rdx, rax
0x1458aac2f: e82cac3200               call 0x145bd5860
0x1458aac34: eb09                     jmp 0x1458aac3f
0x1458aac36: 31c0                     xor eax, eax
0x1458aac38: eb05                     jmp 0x1458aac3f
0x1458aac3a: b801000000               mov eax, 1
0x1458aac3f: 4883f801                 cmp rax, 1
0x1458aac43: 0f85e0000000             jne 0x1458aad29
0x1458aac49: 4901d6                   add r14, rdx
0x1458aac4c: 49ffc6                   inc r14
0x1458aac4f: 4c897710                 mov qword ptr [rdi + 0x10], r14
0x1458aac53: 4939de                   cmp r14, rbx
0x1458aac56: 0f92c0                   setb al
0x1458aac59: 4d39e6                   cmp r14, r12
0x1458aac5c: 0f97c1                   seta cl
0x1458aac5f: 08c1                     or cl, al
0x1458aac61: 0f84ea000000             je 0x1458aad51
0x1458aac67: 4d39f7                   cmp r15, r14
0x1458aac6a: 488b4c2420               mov rcx, qword ptr [rsp + 0x20]
0x1458aac6f: b800000000               mov eax, 0
0x1458aac74: 7388                     jae 0x1458aabfe
0x1458aac76: e9c2000000               jmp 0x1458aad3d
0x1458aac7b: 0f1f440000               nop dword ptr [rax + rax]
0x1458aac80: 4d39f7                   cmp r15, r14
0x1458aac83: 0f82ad000000             jb 0x1458aad36
0x1458aac89: 4d89f8                   mov r8, r15
0x1458aac8c: 4d29f0                   sub r8, r14
0x1458aac8f: 4a8d0436                 lea rax, [rsi + r14]
0x1458aac93: 4983f810                 cmp r8, 0x10
0x1458aac97: 7327                     jae 0x1458aacc0
0x1458aac99: 31d2                     xor edx, edx
0x1458aac9b: 4d85c0                   test r8, r8
0x1458aac9e: 7411                     je 0x1458aacb1
0x1458aaca0: 40382c10                 cmp byte ptr [rax + rdx], bpl
0x1458aaca4: 742c                     je 0x1458aacd2
0x1458aaca6: 48ffc2                   inc rdx
0x1458aaca9: 4939d0                   cmp r8, rdx
0x1458aacac: 75f2                     jne 0x1458aaca0
0x1458aacae: 4c89c2                   mov rdx, r8
0x1458aacb1: 31c0                     xor eax, eax
0x1458aacb3: 4883f801                 cmp rax, 1
0x1458aacb7: 7427                     je 0x1458aace0
0x1458aacb9: eb6e                     jmp 0x1458aad29
0x1458aacbb: 0f1f440000               nop dword ptr [rax + rax]
0x1458aacc0: 89e9                     mov ecx, ebp
0x1458aacc2: 4889c2                   mov rdx, rax
0x1458aacc5: e896ab3200               call 0x145bd5860
0x1458aacca: 4883f801                 cmp rax, 1
0x1458aacce: 7410                     je 0x1458aace0
0x1458aacd0: eb57                     jmp 0x1458aad29
0x1458aacd2: b801000000               mov eax, 1
0x1458aacd7: 4883f801                 cmp rax, 1
0x1458aacdb: 754c                     jne 0x1458aad29
0x1458aacdd: 0f1f00                   nop dword ptr [rax]
0x1458aace0: 4901d6                   add r14, rdx
0x1458aace3: 49ffc6                   inc r14
0x1458aace6: 4c897710                 mov qword ptr [rdi + 0x10], r14
0x1458aacea: 4d89f5                   mov r13, r14
0x1458aaced: 4929dd                   sub r13, rbx
0x1458aacf0: 0f92c0                   setb al
0x1458aacf3: 4d39e6                   cmp r14, r12
0x1458aacf6: 0f97c1                   seta cl
0x1458aacf9: 08c1                     or cl, al
0x1458aacfb: 7583                     jne 0x1458aac80
0x1458aacfd: 4a8d0c2e                 lea rcx, [rsi + r13]
0x1458aad01: 488d5720                 lea rdx, [rdi + 0x20]
0x1458aad05: 4989d8                   mov r8, rbx
0x1458aad08: e8d4f33400               call 0x145bfa0e1
0x1458aad0d: 85c0                     test eax, eax
0x1458aad0f: 0f856bffffff             jne 0x1458aac80
0x1458aad15: 488b4c2420               mov rcx, qword ptr [rsp + 0x20]
0x1458aad1a: 4c896908                 mov qword ptr [rcx + 8], r13
0x1458aad1e: 4c897110                 mov qword ptr [rcx + 0x10], r14
0x1458aad22: b801000000               mov eax, 1
0x1458aad27: eb14                     jmp 0x1458aad3d
0x1458aad29: 4c897f10                 mov qword ptr [rdi + 0x10], r15
0x1458aad2d: 31c0                     xor eax, eax
0x1458aad2f: 488b4c2420               mov rcx, qword ptr [rsp + 0x20]
0x1458aad34: eb07                     jmp 0x1458aad3d
0x1458aad36: 488b4c2420               mov rcx, qword ptr [rsp + 0x20]
0x1458aad3b: 31c0                     xor eax, eax
0x1458aad3d: 488901                   mov qword ptr [rcx], rax
0x1458aad40: 4883c428                 add rsp, 0x28
0x1458aad44: 5b                       pop rbx
0x1458aad45: 5d                       pop rbp
0x1458aad46: 5f                       pop rdi
0x1458aad47: 5e                       pop rsi
0x1458aad48: 415c                     pop r12
0x1458aad4a: 415d                     pop r13
0x1458aad4c: 415e                     pop r14
0x1458aad4e: 415f                     pop r15
0x1458aad50: c3                       ret
0x1458aad51: 4c8d0d200d3401           lea r9, [rip + 0x1340d20]
0x1458aad58: 41b804000000             mov r8d, 4
0x1458aad5e: 31c9                     xor ecx, ecx
0x1458aad60: 4889da                   mov rdx, rbx
0x1458aad63: e8f8ea4e00               call 0x145d99860
0x1458aad68: 0f0b                     ud2
