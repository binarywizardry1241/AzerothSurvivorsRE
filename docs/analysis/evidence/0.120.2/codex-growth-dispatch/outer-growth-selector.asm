00000001402e141e 488bb5f8050000                 mov rsi, qword ptr [rbp + 0x5f8]
00000001402e1425 4883fe05                       cmp rsi, 5
00000001402e1429 0f827cf7ffff                   jb 0x1402e0bab
00000001402e142f 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
00000001402e1436 0fb64044                       movzx eax, byte ptr [rax + 0x44]
00000001402e143a 4883f810                       cmp rax, 0x10
00000001402e143e 0f87dc050000                   ja 0x1402e1a20
00000001402e1444 488d0d611eee05                 lea rcx, [rip + 0x5ee1e61]
00000001402e144b 48630481                       movsxd rax, dword ptr [rcx + rax*4]
00000001402e144f 4801c8                         add rax, rcx
00000001402e1452 ffe0                           jmp rax
