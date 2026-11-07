00000001458956d0: 4156                           push r14
00000001458956d2: 56                             push rsi
00000001458956d3: 57                             push rdi
00000001458956d4: 53                             push rbx
00000001458956d5: 4883ec28                       sub rsp, 0x28
00000001458956d9: 4c89ce                         mov rsi, r9
00000001458956dc: 4c89c7                         mov rdi, r8
00000001458956df: 4889d3                         mov rbx, rdx
00000001458956e2: 4989ce                         mov r14, rcx
00000001458956e5: 4889d1                         mov rcx, rdx
00000001458956e8: 4c89c2                         mov rdx, r8
00000001458956eb: e830000000                     call 0x145895720
00000001458956f0: 4885c0                         test rax, rax
00000001458956f3: 480f45d8                       cmovne rbx, rax
00000001458956f7: 480f45fa                       cmovne rdi, rdx
00000001458956fb: 4c89f1                         mov rcx, r14
00000001458956fe: 4889da                         mov rdx, rbx
0000000145895701: 4989f8                         mov r8, rdi
0000000145895704: 4989f1                         mov r9, rsi
0000000145895707: 4883c428                       add rsp, 0x28
000000014589570b: 5b                             pop rbx
000000014589570c: 5f                             pop rdi
000000014589570d: 5e                             pop rsi
000000014589570e: 415e                           pop r14
0000000145895710: e9bb030000                     jmp 0x145895ad0
