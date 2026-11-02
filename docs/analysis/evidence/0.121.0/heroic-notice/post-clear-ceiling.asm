0000000145b2ec6f 488b8ef0110000                 mov rcx, qword ptr [rsi + 0x11f0]
0000000145b2ec76 488b86f8110000                 mov rax, qword ptr [rsi + 0x11f8]
0000000145b2ec7d 48c1e004                       shl rax, 4
0000000145b2ec81 488b95b0020000                 mov rdx, qword ptr [rbp + 0x2b0]
0000000145b2ec88 0f1f840000000000               nop dword ptr [rax + rax]
0000000145b2ec90 4885c0                         test rax, rax
0000000145b2ec93 7449                           je 0x145b2ecde
0000000145b2ec95 4883c0f0                       add rax, -0x10
0000000145b2ec99 48395108                       cmp qword ptr [rcx + 8], rdx
0000000145b2ec9d 488d4910                       lea rcx, [rcx + 0x10]
0000000145b2eca1 75ed                           jne 0x145b2ec90
0000000145b2eca3 488b96e8120000                 mov rdx, qword ptr [rsi + 0x12e8]
0000000145b2ecaa 41b401                         mov r12b, 1
0000000145b2ecad 4885d2                         test rdx, rdx
0000000145b2ecb0 0f84fa000000                   je 0x145b2edb0
0000000145b2ecb6 488b86e0120000                 mov rax, qword ptr [rsi + 0x12e0]
0000000145b2ecbd 48c1e204                       shl rdx, 4
0000000145b2ecc1 31c9                           xor ecx, ecx
0000000145b2ecc3 4c8b85b0020000                 mov r8, qword ptr [rbp + 0x2b0]
0000000145b2ecca 4c390408                       cmp qword ptr [rax + rcx], r8
0000000145b2ecce 7416                           je 0x145b2ece6
0000000145b2ecd0 4883c110                       add rcx, 0x10
0000000145b2ecd4 4839ca                         cmp rdx, rcx
0000000145b2ecd7 75f1                           jne 0x145b2ecca
0000000145b2ecd9 e9d2000000                     jmp 0x145b2edb0
0000000145b2ecde 4531e4                         xor r12d, r12d
0000000145b2ece1 e917020000                     jmp 0x145b2eefd
0000000145b2ece6 440fb6440809                   movzx r8d, byte ptr [rax + rcx + 9]
0000000145b2ecec 4c8d4af0                       lea r9, [rdx - 0x10]
0000000145b2ecf0 4939c9                         cmp r9, rcx
0000000145b2ecf3 0f84a4000000                   je 0x145b2ed9d
0000000145b2ecf9 4829ca                         sub rdx, rcx
0000000145b2ecfc 4883c2f0                       add rdx, -0x10
0000000145b2ed00 48c1ea04                       shr rdx, 4
0000000145b2ed04 4883fa01                       cmp rdx, 1
0000000145b2ed08 750c                           jne 0x145b2ed16
0000000145b2ed0a 4531c9                         xor r9d, r9d
0000000145b2ed0d 488b9db0020000                 mov rbx, qword ptr [rbp + 0x2b0]
0000000145b2ed14 eb68                           jmp 0x145b2ed7e
0000000145b2ed16 4c8d1408                       lea r10, [rax + rcx]
0000000145b2ed1a 4983c229                       add r10, 0x29
0000000145b2ed1e 4989d3                         mov r11, rdx
0000000145b2ed21 4983e3fe                       and r11, 0xfffffffffffffffe
0000000145b2ed25 4531c9                         xor r9d, r9d
0000000145b2ed28 488b9db0020000                 mov rbx, qword ptr [rbp + 0x2b0]
0000000145b2ed2f eb0d                           jmp 0x145b2ed3e
0000000145b2ed31 4983c102                       add r9, 2
0000000145b2ed35 4983c220                       add r10, 0x20
0000000145b2ed39 4d39cb                         cmp r11, r9
0000000145b2ed3c 743b                           je 0x145b2ed79
0000000145b2ed3e 49395ae7                       cmp qword ptr [r10 - 0x19], rbx
0000000145b2ed42 7408                           je 0x145b2ed4c
0000000145b2ed44 49395af7                       cmp qword ptr [r10 - 9], rbx
0000000145b2ed48 75e7                           jne 0x145b2ed31
0000000145b2ed4a eb19                           jmp 0x145b2ed65
0000000145b2ed4c 450fb6c0                       movzx r8d, r8b
0000000145b2ed50 410fb67af0                     movzx edi, byte ptr [r10 - 0x10]
0000000145b2ed55 4138f8                         cmp r8b, dil
0000000145b2ed58 410f47f8                       cmova edi, r8d
0000000145b2ed5c 4189f8                         mov r8d, edi
0000000145b2ed5f 49395af7                       cmp qword ptr [r10 - 9], rbx
0000000145b2ed63 75cc                           jne 0x145b2ed31
0000000145b2ed65 450fb6c0                       movzx r8d, r8b
0000000145b2ed69 410fb63a                       movzx edi, byte ptr [r10]
0000000145b2ed6d 4138f8                         cmp r8b, dil
0000000145b2ed70 410f47f8                       cmova edi, r8d
0000000145b2ed74 4189f8                         mov r8d, edi
0000000145b2ed77 ebb8                           jmp 0x145b2ed31
0000000145b2ed79 f6c201                         test dl, 1
0000000145b2ed7c 741f                           je 0x145b2ed9d
0000000145b2ed7e 49c1e104                       shl r9, 4
0000000145b2ed82 4c01c8                         add rax, r9
0000000145b2ed85 48395c0110                     cmp qword ptr [rcx + rax + 0x10], rbx
0000000145b2ed8a 7511                           jne 0x145b2ed9d
0000000145b2ed8c 410fb6d0                       movzx edx, r8b
0000000145b2ed90 0fb6440119                     movzx eax, byte ptr [rcx + rax + 0x19]
0000000145b2ed95 38c2                           cmp dl, al
0000000145b2ed97 0f47c2                         cmova eax, edx
0000000145b2ed9a 4189c0                         mov r8d, eax
0000000145b2ed9d 41fec0                         inc r8b
0000000145b2eda0 410fb6c0                       movzx eax, r8b
0000000145b2eda4 3c05                           cmp al, 5
0000000145b2eda6 41bc05000000                   mov r12d, 5
0000000145b2edac 440f42e0                       cmovb r12d, eax
0000000145b2edb0 443aa5a8020000                 cmp r12b, byte ptr [rbp + 0x2a8]
0000000145b2edb7 0f8640010000                   jbe 0x145b2eefd
