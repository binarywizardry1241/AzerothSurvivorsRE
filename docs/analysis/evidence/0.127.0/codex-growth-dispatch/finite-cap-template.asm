000000014035346b c6858706000000                 mov byte ptr [rbp + 0x687], 0
0000000140353472 488d0da1caf205                 lea rcx, [rip + 0x5f2caa1]
0000000140353479 ba47000000                     mov edx, 0x47
000000014035347e e89d4d8905                     call 0x145be8220
0000000140353483 90                             nop
0000000140353484 4889c6                         mov rsi, rax
0000000140353487 4889d7                         mov rdi, rdx
000000014035348a 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
0000000140353491 0fb64044                       movzx eax, byte ptr [rax + 0x44]
0000000140353495 f30f10159394ef05               movss xmm2, dword ptr [rip + 0x5ef9493]
000000014035349d 4883f813                       cmp rax, 0x13
00000001403534a1 0f870a010000                   ja 0x1403535b1
00000001403534a7 488d0dc2e6f205                 lea rcx, [rip + 0x5f2e6c2]
00000001403534ae 48630481                       movsxd rax, dword ptr [rcx + rax*4]
00000001403534b2 4801c8                         add rax, rcx
00000001403534b5 ffe0                           jmp rax
00000001403534b7 f30f1015557bf205               movss xmm2, dword ptr [rip + 0x5f27b55]
00000001403534bf 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
00000001403534c6 e9f2000000                     jmp 0x1403535bd
