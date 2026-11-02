0000000145a8b4c0  55                     push rbp
0000000145a8b4c1  4157                   push r15
0000000145a8b4c3  4156                   push r14
0000000145a8b4c5  4154                   push r12
0000000145a8b4c7  56                     push rsi
0000000145a8b4c8  57                     push rdi
0000000145a8b4c9  53                     push rbx
0000000145a8b4ca  4883ec30               sub rsp, 0x30
0000000145a8b4ce  488d6c2430             lea rbp, [rsp + 0x30]
0000000145a8b4d3  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145a8b4db  4989d6                 mov r14, rdx
0000000145a8b4de  4889ce                 mov rsi, rcx
0000000145a8b4e1  418a5838               mov bl, byte ptr [r8 + 0x38]
0000000145a8b4e5  4c8945f0               mov qword ptr [rbp - 0x10], r8
0000000145a8b4e9  418a7839               mov dil, byte ptr [r8 + 0x39]
0000000145a8b4ed  4889d1                 mov rcx, rdx
0000000145a8b4f0  89da                   mov edx, ebx
0000000145a8b4f2  4189f8                 mov r8d, edi
0000000145a8b4f5  e8860a0000             call 0x145a8bf80
0000000145a8b4fa  90                     nop
0000000145a8b4fb  4038f8                 cmp al, dil
0000000145a8b4fe  4c8b65f0               mov r12, qword ptr [rbp - 0x10]
0000000145a8b502  7437                   je 0x145a8b53b
0000000145a8b504  4188442439             mov byte ptr [r12 + 0x39], al
0000000145a8b509  418b54243b             mov edx, dword ptr [r12 + 0x3b]
0000000145a8b50e  410fb64c243f           movzx ecx, byte ptr [r12 + 0x3f]
0000000145a8b514  48c1e120               shl rcx, 0x20
0000000145a8b518  4809d1                 or rcx, rdx
0000000145a8b51b  450fb644243a           movzx r8d, byte ptr [r12 + 0x3a]
0000000145a8b521  89c2                   mov edx, eax
0000000145a8b523  e83845ffff             call 0x145a7fa60
0000000145a8b528  90                     nop
0000000145a8b529  4c8b65f0               mov r12, qword ptr [rbp - 0x10]
0000000145a8b52d  418944243b             mov dword ptr [r12 + 0x3b], eax
0000000145a8b532  48c1e820               shr rax, 0x20
0000000145a8b536  418844243f             mov byte ptr [r12 + 0x3f], al
0000000145a8b53b  498b7c2420             mov rdi, qword ptr [r12 + 0x20]
0000000145a8b540  498b542428             mov rdx, qword ptr [r12 + 0x28]
0000000145a8b545  4889f9                 mov rcx, rdi
0000000145a8b548  e85377ffff             call 0x145a82ca0
0000000145a8b54d  498b4e20               mov rcx, qword ptr [r14 + 0x20]
0000000145a8b551  498b5628               mov rdx, qword ptr [r14 + 0x28]
0000000145a8b555  48c1e204               shl rdx, 4
0000000145a8b559  4531c0                 xor r8d, r8d
0000000145a8b55c  0f1f4000               nop dword ptr [rax]
0000000145a8b560  4c39c2                 cmp rdx, r8
0000000145a8b563  7437                   je 0x145a8b59c
0000000145a8b565  4d8d4810               lea r9, [r8 + 0x10]
0000000145a8b569  42381c01               cmp byte ptr [rcx + r8], bl
0000000145a8b56d  4d89c8                 mov r8, r9
0000000145a8b570  75ee                   jne 0x145a8b560
0000000145a8b572  4e8b4409f8             mov r8, qword ptr [rcx + r9 - 8]
0000000145a8b577  4983f80c               cmp r8, 0xc
0000000145a8b57b  41b90c000000           mov r9d, 0xc
0000000145a8b581  4d0f42c8               cmovb r9, r8
0000000145a8b585  4d85c0                 test r8, r8
0000000145a8b588  41b801000000           mov r8d, 1
0000000145a8b58e  4d0f45c1               cmovne r8, r9
0000000145a8b592  4c39c0                 cmp rax, r8
0000000145a8b595  7314                   jae 0x145a8b5ab
0000000145a8b597  e9af000000             jmp 0x145a8b64b
0000000145a8b59c  41b801000000           mov r8d, 1
0000000145a8b5a2  4c39c0                 cmp rax, r8
0000000145a8b5a5  0f82a0000000           jb 0x145a8b64b
0000000145a8b5ab  31c0                   xor eax, eax
0000000145a8b5ad  4531c0                 xor r8d, r8d
0000000145a8b5b0  4c39c2                 cmp rdx, r8
0000000145a8b5b3  742b                   je 0x145a8b5e0
0000000145a8b5b5  4d8d4810               lea r9, [r8 + 0x10]
0000000145a8b5b9  42381c01               cmp byte ptr [rcx + r8], bl
0000000145a8b5bd  4d89c8                 mov r8, r9
0000000145a8b5c0  75ee                   jne 0x145a8b5b0
0000000145a8b5c2  4a8b4c09f8             mov rcx, qword ptr [rcx + r9 - 8]
0000000145a8b5c7  4885c9                 test rcx, rcx
0000000145a8b5ca  7412                   je 0x145a8b5de
0000000145a8b5cc  4883f90c               cmp rcx, 0xc
0000000145a8b5d0  b80c000000             mov eax, 0xc
0000000145a8b5d5  480f42c1               cmovb rax, rcx
0000000145a8b5d9  48ffc8                 dec rax
0000000145a8b5dc  eb02                   jmp 0x145a8b5e0
0000000145a8b5de  31c0                   xor eax, eax
0000000145a8b5e0  4869c0f0000000         imul rax, rax, 0xf0
0000000145a8b5e7  488d0dbad74e01         lea rcx, [rip + 0x14ed7ba]
0000000145a8b5ee  4c8b7c0808             mov r15, qword ptr [rax + rcx + 8]
0000000145a8b5f3  488b5c0810             mov rbx, qword ptr [rax + rcx + 0x10]
0000000145a8b5f8  e8036c57fa             call 0x140002200
0000000145a8b5fd  ba01000000             mov edx, 1
0000000145a8b602  4889d9                 mov rcx, rbx
0000000145a8b605  e8b66b57fa             call 0x1400021c0
0000000145a8b60a  4885c0                 test rax, rax
0000000145a8b60d  0f8480000000           je 0x145a8b693
0000000145a8b613  4989c6                 mov r14, rax
0000000145a8b616  4889c1                 mov rcx, rax
0000000145a8b619  4c89fa                 mov rdx, r15
0000000145a8b61c  4989d8                 mov r8, rbx
0000000145a8b61f  e887845100             call 0x145fa3aab
0000000145a8b624  498b542418             mov rdx, qword ptr [r12 + 0x18]
0000000145a8b629  4885d2                 test rdx, rdx
0000000145a8b62c  740e                   je 0x145a8b63c
0000000145a8b62e  41b801000000           mov r8d, 1
0000000145a8b634  4889f9                 mov rcx, rdi
0000000145a8b637  e8946b57fa             call 0x1400021d0
0000000145a8b63c  49895c2418             mov qword ptr [r12 + 0x18], rbx
0000000145a8b641  4d89742420             mov qword ptr [r12 + 0x20], r14
0000000145a8b646  49895c2428             mov qword ptr [r12 + 0x28], rbx
0000000145a8b64b  410f100424             movups xmm0, xmmword ptr [r12]
0000000145a8b650  498b442410             mov rax, qword ptr [r12 + 0x10]
0000000145a8b655  498b4c2418             mov rcx, qword ptr [r12 + 0x18]
0000000145a8b65a  498b542420             mov rdx, qword ptr [r12 + 0x20]
0000000145a8b65f  4d8b442428             mov r8, qword ptr [r12 + 0x28]
0000000145a8b664  410f104c2430           movups xmm1, xmmword ptr [r12 + 0x30]
0000000145a8b66a  0f114e30               movups xmmword ptr [rsi + 0x30], xmm1
0000000145a8b66e  48895620               mov qword ptr [rsi + 0x20], rdx
0000000145a8b672  4c894628               mov qword ptr [rsi + 0x28], r8
0000000145a8b676  48894610               mov qword ptr [rsi + 0x10], rax
0000000145a8b67a  48894e18               mov qword ptr [rsi + 0x18], rcx
0000000145a8b67e  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145a8b681  4889f0                 mov rax, rsi
0000000145a8b684  4883c430               add rsp, 0x30
0000000145a8b688  5b                     pop rbx
0000000145a8b689  5f                     pop rdi
0000000145a8b68a  5e                     pop rsi
0000000145a8b68b  415c                   pop r12
0000000145a8b68d  415e                   pop r14
0000000145a8b68f  415f                   pop r15
0000000145a8b691  5d                     pop rbp
0000000145a8b692  c3                     ret
0000000145a8b693  b901000000             mov ecx, 1
0000000145a8b698  4889da                 mov rdx, rbx
0000000145a8b69b  e8cbf66b00             call 0x14614ad6b
0000000145a8b6a0  90                     nop
0000000145a8b6a1  0f0b                   ud2
