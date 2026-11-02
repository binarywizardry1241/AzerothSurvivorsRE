0000000140353513 c6858706000000                 mov byte ptr [rbp + 0x687], 0
000000014035351a 488d0db0c9f205                 lea rcx, [rip + 0x5f2c9b0]
0000000140353521 ba49000000                     mov edx, 0x49
0000000140353526 e8f54c8905                     call 0x145be8220
000000014035352b 90                             nop
000000014035352c 4889c6                         mov rsi, rax
000000014035352f 4889d7                         mov rdi, rdx
0000000140353532 488b8570060000                 mov rax, qword ptr [rbp + 0x670]
0000000140353539 0fb64044                       movzx eax, byte ptr [rax + 0x44]
000000014035353d f30f1015eb93ef05               movss xmm2, dword ptr [rip + 0x5ef93eb]
0000000140353545 4883f813                       cmp rax, 0x13
0000000140353549 0f87e9000000                   ja 0x140353638
000000014035354f 488d0dcae5f205                 lea rcx, [rip + 0x5f2e5ca]
0000000140353556 48630481                       movsxd rax, dword ptr [rcx + rax*4]
000000014035355a 4801c8                         add rax, rcx
000000014035355d ffe0                           jmp rax
000000014035355f f30f1015ad7af205               movss xmm2, dword ptr [rip + 0x5f27aad]
0000000140353567 488b9570060000                 mov rdx, qword ptr [rbp + 0x670]
000000014035356e e9d1000000                     jmp 0x140353644
