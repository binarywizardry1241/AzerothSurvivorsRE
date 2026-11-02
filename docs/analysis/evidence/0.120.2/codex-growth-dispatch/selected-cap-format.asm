00000001402e1ac8 c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001402e1acf 488d0dfdfced05                 lea rcx, [rip + 0x5edfcfd]
00000001402e1ad6 ba49000000                     mov edx, 0x49
00000001402e1adb e880d48605                     call 0x145b4ef60
00000001402e1ae0 90                             nop
00000001402e1ae1 4889c6                         mov rsi, rax
00000001402e1ae4 4889d7                         mov rdi, rdx
00000001402e1ae7 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
00000001402e1aee 0fb64044                       movzx eax, byte ptr [rax + 0x44]
00000001402e1af2 f30f1015f671eb05               movss xmm2, dword ptr [rip + 0x5eb71f6]
00000001402e1afa 4883f813                       cmp rax, 0x13
00000001402e1afe 0f87e9000000                   ja 0x1402e1bed
00000001402e1b04 488d0de517ee05                 lea rcx, [rip + 0x5ee17e5]
00000001402e1b0b 48630481                       movsxd rax, dword ptr [rcx + rax*4]
00000001402e1b0f 4801c8                         add rax, rcx
00000001402e1b12 ffe0                           jmp rax
00000001402e1b14 f30f101578b3ed05               movss xmm2, dword ptr [rip + 0x5edb378]
00000001402e1b1c 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
00000001402e1b23 e9d1000000                     jmp 0x1402e1bf9
00000001402e1b28 bb01000000                     mov ebx, 1
00000001402e1b2d 4889b500060000                 mov qword ptr [rbp + 0x600], rsi
00000001402e1b34 48899d08060000                 mov qword ptr [rbp + 0x608], rbx
00000001402e1b3b 4889b510060000                 mov qword ptr [rbp + 0x610], rsi
00000001402e1b42 e94a010000                     jmp 0x1402e1c91
00000001402e1b47 f30f10156170eb05               movss xmm2, dword ptr [rip + 0x5eb7061]
00000001402e1b4f eb15                           jmp 0x1402e1b66
00000001402e1b51 f30f10155770eb05               movss xmm2, dword ptr [rip + 0x5eb7057]
00000001402e1b59 e98f000000                     jmp 0x1402e1bed
00000001402e1b5e f30f1015d28ee905               movss xmm2, dword ptr [rip + 0x5e98ed2]
00000001402e1b66 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
00000001402e1b6d f30f595240                     mulss xmm2, dword ptr [rdx + 0x40]
00000001402e1b72 c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001402e1b79 488d9de0010000                 lea rbx, [rbp + 0x1e0]
00000001402e1b80 4889d9                         mov rcx, rbx
00000001402e1b83 e8c8d07b05                     call 0x145a9ec50
00000001402e1b88 90                             nop
00000001402e1b89 488d05f9fbed05                 lea rax, [rip + 0x5edfbf9]
00000001402e1b90 488985f0030000                 mov qword ptr [rbp + 0x3f0], rax
00000001402e1b97 48c785f803000007000000         mov qword ptr [rbp + 0x3f8], 7
00000001402e1ba2 48899d00040000                 mov qword ptr [rbp + 0x400], rbx
00000001402e1ba9 4c89ad08040000                 mov qword ptr [rbp + 0x408], r13
00000001402e1bb0 48c744242001000000             mov qword ptr [rsp + 0x20], 1
00000001402e1bb9 488d8d00060000                 lea rcx, [rbp + 0x600]
00000001402e1bc0 4c8d8df0030000                 lea r9, [rbp + 0x3f0]
00000001402e1bc7 4889f2                         mov rdx, rsi
00000001402e1bca 4989f8                         mov r8, rdi
00000001402e1bcd e81ed88605                     call 0x145b4f3f0
00000001402e1bd2 90                             nop
00000001402e1bd3 e982000000                     jmp 0x1402e1c5a
00000001402e1bd8 f30f10159c72eb05               movss xmm2, dword ptr [rip + 0x5eb729c]
00000001402e1be0 e98ffeffff                     jmp 0x1402e1a74
00000001402e1be5 f30f10154b8ee905               movss xmm2, dword ptr [rip + 0x5e98e4b]
00000001402e1bed 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
00000001402e1bf4 f30f595240                     mulss xmm2, dword ptr [rdx + 0x40]
00000001402e1bf9 c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001402e1c00 488d9de0010000                 lea rbx, [rbp + 0x1e0]
00000001402e1c07 4889d9                         mov rcx, rbx
00000001402e1c0a e841d07b05                     call 0x145a9ec50
00000001402e1c0f 90                             nop
00000001402e1c10 488d0572fbed05                 lea rax, [rip + 0x5edfb72]
00000001402e1c17 488985f0030000                 mov qword ptr [rbp + 0x3f0], rax
00000001402e1c1e 48c785f803000007000000         mov qword ptr [rbp + 0x3f8], 7
00000001402e1c29 48899d00040000                 mov qword ptr [rbp + 0x400], rbx
00000001402e1c30 4c89ad08040000                 mov qword ptr [rbp + 0x408], r13
00000001402e1c37 48c744242001000000             mov qword ptr [rsp + 0x20], 1
00000001402e1c40 488d8d00060000                 lea rcx, [rbp + 0x600]
00000001402e1c47 4c8d8df0030000                 lea r9, [rbp + 0x3f0]
00000001402e1c4e 4889f2                         mov rdx, rsi
00000001402e1c51 4989f8                         mov r8, rdi
00000001402e1c54 e897d78605                     call 0x145b4f3f0
00000001402e1c59 90                             nop
