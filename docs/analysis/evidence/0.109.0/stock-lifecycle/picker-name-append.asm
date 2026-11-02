0x140067e90: 4156                     push r14
0x140067e92: 56                       push rsi
0x140067e93: 57                       push rdi
0x140067e94: 53                       push rbx
0x140067e95: 4883ec28                 sub rsp, 0x28
0x140067e99: 4189d6                   mov r14d, edx
0x140067e9c: 4889ce                   mov rsi, rcx
0x140067e9f: 488b5908                 mov rbx, qword ptr [rcx + 8]
0x140067ea3: 488b7910                 mov rdi, qword ptr [rcx + 0x10]
0x140067ea7: 4889d9                   mov rcx, rbx
0x140067eaa: 4889fa                   mov rdx, rdi
0x140067ead: 4883ff20                 cmp rdi, 0x20
0x140067eb1: 734f                     jae 0x140067f02
0x140067eb3: e8d8d6b605               call 0x145bd5590
0x140067eb8: 418d4e9f                 lea ecx, [r14 - 0x61]
0x140067ebc: 83f91a                   cmp ecx, 0x1a
0x140067ebf: 724f                     jb 0x140067f10
0x140067ec1: 418d4ebf                 lea ecx, [r14 - 0x41]
0x140067ec5: 83f919                   cmp ecx, 0x19
0x140067ec8: 7706                     ja 0x140067ed0
0x140067eca: 4883f814                 cmp rax, 0x14
0x140067ece: 7246                     jb 0x140067f16
0x140067ed0: 4183fe20                 cmp r14d, 0x20
0x140067ed4: 7550                     jne 0x140067f26
0x140067ed6: 4885c0                   test rax, rax
0x140067ed9: 744b                     je 0x140067f26
0x140067edb: 4883ff0f                 cmp rdi, 0xf
0x140067edf: 774f                     ja 0x140067f30
0x140067ee1: 4885ff                   test rdi, rdi
0x140067ee4: 7418                     je 0x140067efe
0x140067ee6: 31c9                     xor ecx, ecx
0x140067ee8: 0f1f840000000000         nop dword ptr [rax + rax]
0x140067ef0: 803c0b20                 cmp byte ptr [rbx + rcx], 0x20
0x140067ef4: 7430                     je 0x140067f26
0x140067ef6: 48ffc1                   inc rcx
0x140067ef9: 4839cf                   cmp rdi, rcx
0x140067efc: 75f2                     jne 0x140067ef0
0x140067efe: 31c9                     xor ecx, ecx
0x140067f00: eb4b                     jmp 0x140067f4d
0x140067f02: e869d0b605               call 0x145bd4f70
0x140067f07: 418d4e9f                 lea ecx, [r14 - 0x61]
0x140067f0b: 83f91a                   cmp ecx, 0x1a
0x140067f0e: 73b1                     jae 0x140067ec1
0x140067f10: 4883f813                 cmp rax, 0x13
0x140067f14: 7710                     ja 0x140067f26
0x140067f16: 48393e                   cmp qword ptr [rsi], rdi
0x140067f19: 744b                     je 0x140067f66
0x140067f1b: 4488343b                 mov byte ptr [rbx + rdi], r14b
0x140067f1f: 48ffc7                   inc rdi
0x140067f22: 48897e10                 mov qword ptr [rsi + 0x10], rdi
0x140067f26: 4883c428                 add rsp, 0x28
0x140067f2a: 5b                       pop rbx
0x140067f2b: 5f                       pop rdi
0x140067f2c: 5e                       pop rsi
0x140067f2d: 415e                     pop r14
0x140067f2f: c3                       ret
0x140067f30: b120                     mov cl, 0x20
0x140067f32: 4889da                   mov rdx, rbx
0x140067f35: 4989f8                   mov r8, rdi
0x140067f38: 4989c6                   mov r14, rax
0x140067f3b: e820d9b605               call 0x145bd5860
0x140067f40: 4889c1                   mov rcx, rax
0x140067f43: 4c89f0                   mov rax, r14
0x140067f46: 4883f901                 cmp rcx, 1
0x140067f4a: 0f94c1                   sete cl
0x140067f4d: 4883c0ed                 add rax, -0x13
0x140067f51: 4883f8ec                 cmp rax, -0x14
0x140067f55: 72cf                     jb 0x140067f26
0x140067f57: 84c9                     test cl, cl
0x140067f59: 75cb                     jne 0x140067f26
0x140067f5b: 48393e                   cmp qword ptr [rsi], rdi
0x140067f5e: 742c                     je 0x140067f8c
0x140067f60: c6043b20                 mov byte ptr [rbx + rdi], 0x20
0x140067f64: ebb9                     jmp 0x140067f1f
0x140067f66: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x140067f6f: 41b801000000             mov r8d, 1
0x140067f75: 41b901000000             mov r9d, 1
0x140067f7b: 4889f1                   mov rcx, rsi
0x140067f7e: 4889fa                   mov rdx, rdi
0x140067f81: e8ea29b905               call 0x145bfa970
0x140067f86: 488b5e08                 mov rbx, qword ptr [rsi + 8]
0x140067f8a: eb8f                     jmp 0x140067f1b
0x140067f8c: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x140067f95: 41b801000000             mov r8d, 1
0x140067f9b: 41b901000000             mov r9d, 1
0x140067fa1: 4889f1                   mov rcx, rsi
0x140067fa4: 4889fa                   mov rdx, rdi
0x140067fa7: e8c429b905               call 0x145bfa970
0x140067fac: 488b5e08                 mov rbx, qword ptr [rsi + 8]
0x140067fb0: ebae                     jmp 0x140067f60
