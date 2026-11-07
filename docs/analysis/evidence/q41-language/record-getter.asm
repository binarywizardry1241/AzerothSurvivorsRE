00000001458971e0: 488b05f95e9502                 mov rax, qword ptr [rip + 0x2955ef9]
00000001458971e7: 4883f80d                       cmp rax, 0xd
00000001458971eb: b90d000000                     mov ecx, 0xd
00000001458971f0: 480f42c8                       cmovb rcx, rax
00000001458971f4: 486bc938                       imul rcx, rcx, 0x38
00000001458971f8: 488d05f18ca601                 lea rax, [rip + 0x1a68cf1]
00000001458971ff: 4801c8                         add rax, rcx
0000000145897202: c3                             ret
