0000000145ec0c80 4156                           push r14
0000000145ec0c82 56                             push rsi
0000000145ec0c83 57                             push rdi
0000000145ec0c84 53                             push rbx
0000000145ec0c85 4883ec28                       sub rsp, 0x28
0000000145ec0c89 4c89c7                         mov rdi, r8
0000000145ec0c8c 4889ce                         mov rsi, rcx
0000000145ec0c8f 488b01                         mov rax, qword ptr [rcx]
0000000145ec0c92 488b5910                       mov rbx, qword ptr [rcx + 0x10]
0000000145ec0c96 4889c1                         mov rcx, rax
0000000145ec0c99 4829d9                         sub rcx, rbx
0000000145ec0c9c 4883f903                       cmp rcx, 3
0000000145ec0ca0 763b                           jbe 0x145ec0cdd
0000000145ec0ca2 488b4e08                       mov rcx, qword ptr [rsi + 8]
0000000145ec0ca6 893c19                         mov dword ptr [rcx + rbx], edi
0000000145ec0ca9 4883c304                       add rbx, 4
0000000145ec0cad 48895e10                       mov qword ptr [rsi + 0x10], rbx
0000000145ec0cb1 4829d8                         sub rax, rbx
0000000145ec0cb4 4839c7                         cmp rdi, rax
0000000145ec0cb7 7744                           ja 0x145ec0cfd
0000000145ec0cb9 4885ff                         test rdi, rdi
0000000145ec0cbc 740b                           je 0x145ec0cc9
0000000145ec0cbe 4801d9                         add rcx, rbx
0000000145ec0cc1 4989f8                         mov r8, rdi
0000000145ec0cc4 e8520a1a00                     call 0x14606171b
0000000145ec0cc9 4801fb                         add rbx, rdi
0000000145ec0ccc 48895e10                       mov qword ptr [rsi + 0x10], rbx
0000000145ec0cd0 4889f0                         mov rax, rsi
0000000145ec0cd3 4883c428                       add rsp, 0x28
0000000145ec0cd7 5b                             pop rbx
0000000145ec0cd8 5f                             pop rdi
0000000145ec0cd9 5e                             pop rsi
0000000145ec0cda 415e                           pop r14
0000000145ec0cdc c3                             ret 
