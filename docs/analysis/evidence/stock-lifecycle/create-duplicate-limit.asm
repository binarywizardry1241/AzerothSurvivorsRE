0x1458b5eca: 488b8538170000           mov rax, qword ptr [rbp + 0x1738]
0x1458b5ed1: 488985b8250000           mov qword ptr [rbp + 0x25b8], rax
0x1458b5ed8: 488b8540170000           mov rax, qword ptr [rbp + 0x1740]
0x1458b5edf: 4885c0                   test rax, rax
0x1458b5ee2: 0f84c6010000             je 0x1458b60ae
0x1458b5ee8: 486bf838                 imul rdi, rax, 0x38
0x1458b5eec: 4983ff0f                 cmp r15, 0xf
0x1458b5ef0: 0f864d010000             jbe 0x1458b6043
0x1458b5ef6: 31f6                     xor esi, esi
0x1458b5ef8: eb0d                     jmp 0x1458b5f07
0x1458b5efa: 4883c638                 add rsi, 0x38
0x1458b5efe: 4839f7                   cmp rdi, rsi
0x1458b5f01: 0f84a7010000             je 0x1458b60ae
0x1458b5f07: 488b85b8250000           mov rax, qword ptr [rbp + 0x25b8]
0x1458b5f0e: 4c397c3010               cmp qword ptr [rax + rsi + 0x10], r15
0x1458b5f13: 75e5                     jne 0x1458b5efa
0x1458b5f15: 488b85b8250000           mov rax, qword ptr [rbp + 0x25b8]
0x1458b5f1c: 488b4c3008               mov rcx, qword ptr [rax + rsi + 8]
0x1458b5f21: 4c89fa                   mov rdx, r15
0x1458b5f24: 4c8b85e8250000           mov r8, qword ptr [rbp + 0x25e8]
0x1458b5f2b: 4d89f9                   mov r9, r15
0x1458b5f2e: e85d348cfa               call 0x140179390
0x1458b5f33: 84c0                     test al, al
0x1458b5f35: 74c3                     je 0x1458b5efa
0x1458b5f37: 488d8d30170000           lea rcx, [rbp + 0x1730]
0x1458b5f3e: e80d611100               call 0x1459cc050
0x1458b5f43: 90                       nop
0x1458b5f44: 488b8530170000           mov rax, qword ptr [rbp + 0x1730]
0x1458b5f4b: 4885c0                   test rax, rax
0x1458b5f4e: 4c89e6                   mov rsi, r12
0x1458b5f51: 7416                     je 0x1458b5f69
0x1458b5f53: 486bd038                 imul rdx, rax, 0x38
0x1458b5f57: 41b808000000             mov r8d, 8
0x1458b5f5d: 488b8db8250000           mov rcx, qword ptr [rbp + 0x25b8]
0x1458b5f64: e867c274fa               call 0x1400021d0
0x1458b5f69: 40b731                   mov dil, 0x31
0x1458b5f6c: e97c010000               jmp 0x1458b60ed
0x1458b5f71: 40b748                   mov dil, 0x48
0x1458b5f74: e936d0ffff               jmp 0x1458b2faf
0x1458b5f79: 8d83dadaffff             lea eax, [rbx - 0x2526]
0x1458b5f7f: 83f80d                   cmp eax, 0xd
0x1458b5f82: 0f8768030000             ja 0x1458b62f0
0x1458b5f88: 488d0dbd6a3301           lea rcx, [rip + 0x1336abd]
0x1458b5f8f: 48630481                 movsxd rax, dword ptr [rcx + rax*4]
0x1458b5f93: 4801c8                   add rax, rcx
0x1458b5f96: ffe0                     jmp rax
0x1458b5f98: 488d0501fe9601           lea rax, [rip + 0x196fe01]
0x1458b5f9f: e9fe030000               jmp 0x1458b63a2
0x1458b5fa4: 498b5424c8               mov rdx, qword ptr [r12 - 0x38]
0x1458b5fa9: 4885d2                   test rdx, rdx
0x1458b5fac: 7417                     je 0x1458b5fc5
0x1458b5fae: 498b4c24d0               mov rcx, qword ptr [r12 - 0x30]
0x1458b5fb3: 41b801000000             mov r8d, 1
0x1458b5fb9: e812c274fa               call 0x1400021d0
0x1458b5fbe: 488d8e200b0000           lea rcx, [rsi + 0xb20]
0x1458b5fc5: 488d4701                 lea rax, [rdi + 1]
0x1458b5fc9: 4c39e8                   cmp rax, r13
0x1458b5fcc: 7369                     jae 0x1458b6037
0x1458b5fce: 4929ff                   sub r15, rdi
0x1458b5fd1: eb3b                     jmp 0x1458b600e
0x1458b5fd3: 486bc738                 imul rax, rdi, 0x38
0x1458b5fd7: 498b542430               mov rdx, qword ptr [r12 + 0x30]
0x1458b5fdc: 4889540330               mov qword ptr [rbx + rax + 0x30], rdx
0x1458b5fe1: 410f100424               movups xmm0, xmmword ptr [r12]
0x1458b5fe6: 410f104c2410             movups xmm1, xmmword ptr [r12 + 0x10]
0x1458b5fec: f3410f6f542420           movdqu xmm2, xmmword ptr [r12 + 0x20]
0x1458b5ff3: f30f7f540320             movdqu xmmword ptr [rbx + rax + 0x20], xmm2
0x1458b5ff9: 0f114c0310               movups xmmword ptr [rbx + rax + 0x10], xmm1
0x1458b5ffe: 0f110403                 movups xmmword ptr [rbx + rax], xmm0
0x1458b6002: 48ffc7                   inc rdi
0x1458b6005: 4983c438                 add r12, 0x38
0x1458b6009: 49ffcf                   dec r15
0x1458b600c: 7429                     je 0x1458b6037
0x1458b600e: 4d39742418               cmp qword ptr [r12 + 0x18], r14
0x1458b6013: 75be                     jne 0x1458b5fd3
0x1458b6015: 498b1424                 mov rdx, qword ptr [r12]
0x1458b6019: 4885d2                   test rdx, rdx
0x1458b601c: 74e7                     je 0x1458b6005
0x1458b601e: 498b4c2408               mov rcx, qword ptr [r12 + 8]
0x1458b6023: 41b801000000             mov r8d, 1
0x1458b6029: e8a2c174fa               call 0x1400021d0
0x1458b602e: 488d8e200b0000           lea rcx, [rsi + 0xb20]
0x1458b6035: ebce                     jmp 0x1458b6005
0x1458b6037: 4889be300b0000           mov qword ptr [rsi + 0xb30], rdi
0x1458b603e: e904d2ffff               jmp 0x1458b3247
0x1458b6043: 488b85b8250000           mov rax, qword ptr [rbp + 0x25b8]
0x1458b604a: 4801c7                   add rdi, rax
0x1458b604d: eb09                     jmp 0x1458b6058
0x1458b604f: 4883c038                 add rax, 0x38
0x1458b6053: 4839f8                   cmp rax, rdi
0x1458b6056: 7456                     je 0x1458b60ae
0x1458b6058: 4c397810                 cmp qword ptr [rax + 0x10], r15
0x1458b605c: 75f1                     jne 0x1458b604f
0x1458b605e: 488b4808                 mov rcx, qword ptr [rax + 8]
0x1458b6062: 31d2                     xor edx, edx
0x1458b6064: 4939d7                   cmp r15, rdx
0x1458b6067: 0f84cafeffff             je 0x1458b5f37
0x1458b606d: 440fb60411               movzx r8d, byte ptr [rcx + rdx]
0x1458b6072: 458d48bf                 lea r9d, [r8 - 0x41]
0x1458b6076: 4180f91a                 cmp r9b, 0x1a
0x1458b607a: 410f92c1                 setb r9b
0x1458b607e: 41c0e105                 shl r9b, 5
0x1458b6082: 4508c1                   or r9b, r8b
0x1458b6085: 4c8b85e8250000           mov r8, qword ptr [rbp + 0x25e8]
0x1458b608c: 450fb60410               movzx r8d, byte ptr [r8 + rdx]
0x1458b6091: 458d50bf                 lea r10d, [r8 - 0x41]
0x1458b6095: 4180fa1a                 cmp r10b, 0x1a
0x1458b6099: 410f92c2                 setb r10b
0x1458b609d: 41c0e205                 shl r10b, 5
0x1458b60a1: 4508c2                   or r10b, r8b
0x1458b60a4: 48ffc2                   inc rdx
0x1458b60a7: 4538d1                   cmp r9b, r10b
0x1458b60aa: 74b8                     je 0x1458b6064
0x1458b60ac: eba1                     jmp 0x1458b604f
0x1458b60ae: 488d8d30170000           lea rcx, [rbp + 0x1730]
0x1458b60b5: e8965f1100               call 0x1459cc050
0x1458b60ba: 90                       nop
0x1458b60bb: 488b8530170000           mov rax, qword ptr [rbp + 0x1730]
0x1458b60c2: 4885c0                   test rax, rax
0x1458b60c5: 4c89e6                   mov rsi, r12
0x1458b60c8: 7416                     je 0x1458b60e0
0x1458b60ca: 486bd038                 imul rdx, rax, 0x38
0x1458b60ce: 41b808000000             mov r8d, 8
0x1458b60d4: 488b8db8250000           mov rcx, qword ptr [rbp + 0x25b8]
0x1458b60db: e8f0c074fa               call 0x1400021d0
0x1458b60e0: 40b734                   mov dil, 0x34
0x1458b60e3: 4883be300b000009         cmp qword ptr [rsi + 0xb30], 9
0x1458b60eb: 7627                     jbe 0x1458b6114
0x1458b60ed: 488b95a8250000           mov rdx, qword ptr [rbp + 0x25a8]
0x1458b60f4: 4885d2                   test rdx, rdx
0x1458b60f7: 0f84b2ceffff             je 0x1458b2faf
0x1458b60fd: 41b801000000             mov r8d, 1
0x1458b6103: 488b8de8250000           mov rcx, qword ptr [rbp + 0x25e8]
0x1458b610a: e8c1c074fa               call 0x1400021d0
0x1458b610f: e99bceffff               jmp 0x1458b2faf
