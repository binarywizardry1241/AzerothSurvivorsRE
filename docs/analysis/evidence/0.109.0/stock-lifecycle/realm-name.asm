0x1458d07b0: 4883ec28                 sub rsp, 0x28
0x1458d07b4: e817c9fbff               call 0x14588d0d0
0x1458d07b9: 4869c8f0000000           imul rcx, rax, 0xf0
0x1458d07c0: 488d15c9db3001           lea rdx, [rip + 0x130dbc9]
0x1458d07c7: 488b441118               mov rax, qword ptr [rcx + rdx + 0x18]
0x1458d07cc: 488b541120               mov rdx, qword ptr [rcx + rdx + 0x20]
0x1458d07d1: 4883c428                 add rsp, 0x28
0x1458d07d5: c3                       ret
