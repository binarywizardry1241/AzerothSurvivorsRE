0x1458a8cb0: 56                       push rsi
0x1458a8cb1: 57                       push rdi
0x1458a8cb2: 53                       push rbx
0x1458a8cb3: 4883ec20                 sub rsp, 0x20
0x1458a8cb7: 4c89c7                   mov rdi, r8
0x1458a8cba: 4889d3                   mov rbx, rdx
0x1458a8cbd: 4889ce                   mov rsi, rcx
0x1458a8cc0: 4889d1                   mov rcx, rdx
0x1458a8cc3: 4c89c2                   mov rdx, r8
0x1458a8cc6: e845faffff               call 0x1458a8710
0x1458a8ccb: 3cff                     cmp al, 0xff
0x1458a8ccd: 7409                     je 0x1458a8cd8
0x1458a8ccf: 48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
0x1458a8cd6: eb19                     jmp 0x1458a8cf1
0x1458a8cd8: 4889d9                   mov rcx, rbx
0x1458a8cdb: 4889fa                   mov rdx, rdi
0x1458a8cde: e81d057efa               call 0x140089200
0x1458a8ce3: 4989d0                   mov r8, rdx
0x1458a8ce6: 4889f1                   mov rcx, rsi
0x1458a8ce9: 4889c2                   mov rdx, rax
0x1458a8cec: e8af020000               call 0x1458a8fa0
0x1458a8cf1: 4889f0                   mov rax, rsi
0x1458a8cf4: 4883c420                 add rsp, 0x20
0x1458a8cf8: 5b                       pop rbx
0x1458a8cf9: 5f                       pop rdi
0x1458a8cfa: 5e                       pop rsi
0x1458a8cfb: c3                       ret
