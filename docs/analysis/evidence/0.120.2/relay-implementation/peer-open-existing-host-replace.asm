; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf7b11 4c01f0                         add rax, r14
0000000145bf7b14 4c8b40d8                       mov r8, qword ptr [rax - 0x28]
0000000145bf7b18 488b48e0                       mov rcx, qword ptr [rax - 0x20]
0000000145bf7b1c 48898db0020000                 mov qword ptr [rbp + 0x2b0], rcx
0000000145bf7b23 488b48e8                       mov rcx, qword ptr [rax - 0x18]
0000000145bf7b27 488b70f0                       mov rsi, qword ptr [rax - 0x10]
0000000145bf7b2b 488b9520020000                 mov rdx, qword ptr [rbp + 0x220]
0000000145bf7b32 488950f8                       mov qword ptr [rax - 8], rdx
0000000145bf7b36 f30f6f8500020000               movdqu xmm0, xmmword ptr [rbp + 0x200]
0000000145bf7b3e f30f6f8d10020000               movdqu xmm1, xmmword ptr [rbp + 0x210]
0000000145bf7b46 f30f7f40d8                     movdqu xmmword ptr [rax - 0x28], xmm0
0000000145bf7b4b f30f7f48e8                     movdqu xmmword ptr [rax - 0x18], xmm1
0000000145bf7b50 4983f8ff                       cmp r8, -1
0000000145bf7b54 0f84c4040000                   je 0x145bf801e
0000000145bf7b5a 4c898578020000                 mov qword ptr [rbp + 0x278], r8
0000000145bf7b61 4885f6                         test rsi, rsi
0000000145bf7b64 0f84a7010000                   je 0x145bf7d11
0000000145bf7b6a 4c8b8d78020000                 mov r9, qword ptr [rbp + 0x278]
0000000145bf7b71 4c39c9                         cmp rcx, r9
0000000145bf7b74 4c89c8                         mov rax, r9
0000000145bf7b77 41b800000000                   mov r8d, 0
0000000145bf7b7d 490f42c0                       cmovb rax, r8
0000000145bf7b81 4889ca                         mov rdx, rcx
0000000145bf7b84 4829c2                         sub rdx, rax
0000000145bf7b87 4d89ca                         mov r10, r9
0000000145bf7b8a 4929d2                         sub r10, rdx
0000000145bf7b8d 4c8d3432                       lea r14, [rdx + rsi]
0000000145bf7b91 4889b568020000                 mov qword ptr [rbp + 0x268], rsi
0000000145bf7b98 4c899570020000                 mov qword ptr [rbp + 0x270], r10
0000000145bf7b9f 4c29d6                         sub rsi, r10
0000000145bf7ba2 490f42f0                       cmovb rsi, r8
0000000145bf7ba6 4d0f47f1                       cmova r14, r9
0000000145bf7baa 4929d6                         sub r14, rdx
0000000145bf7bad 0f85450b0000                   jne 0x145bf86f8
0000000145bf7bb3 488b8570020000                 mov rax, qword ptr [rbp + 0x270]
0000000145bf7bba 483b8568020000                 cmp rax, qword ptr [rbp + 0x268]
0000000145bf7bc1 4c8ba588020000                 mov r12, qword ptr [rbp + 0x288]
0000000145bf7bc8 0f8343010000                   jae 0x145bf7d11
0000000145bf7bce 488b85b0020000                 mov rax, qword ptr [rbp + 0x2b0]
0000000145bf7bd5 4c8d7008                       lea r14, [rax + 8]
0000000145bf7bd9 eb12                           jmp 0x145bf7bed
0000000145bf7bdb 0f1f440000                     nop dword ptr [rax + rax]
0000000145bf7be0 4983c618                       add r14, 0x18
0000000145bf7be4 48ffce                         dec rsi
0000000145bf7be7 0f8424010000                   je 0x145bf7d11
0000000145bf7bed 498b56f8                       mov rdx, qword ptr [r14 - 8]
0000000145bf7bf1 4885d2                         test rdx, rdx
0000000145bf7bf4 74ea                           je 0x145bf7be0
0000000145bf7bf6 498b0e                         mov rcx, qword ptr [r14]
0000000145bf7bf9 41b801000000                   mov r8d, 1
0000000145bf7bff e8cca540fa                     call 0x1400021d0
0000000145bf7c04 ebda                           jmp 0x145bf7be0
