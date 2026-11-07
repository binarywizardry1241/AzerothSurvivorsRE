00000001458e1f35: 488b0524529302                 mov rax, qword ptr [rip + 0x2935224]
00000001458e1f3c: 4883f80d                       cmp rax, 0xd
00000001458e1f40: b90d000000                     mov ecx, 0xd
00000001458e1f45: 480f42c8                       cmovb rcx, rax
00000001458e1f49: 486bc938                       imul rcx, rcx, 0x38
00000001458e1f4d: 488d0514c8a401                 lea rax, [rip + 0x1a4c814]
00000001458e1f54: 4801c8                         add rax, rcx
00000001458e1f57: c3                             ret
