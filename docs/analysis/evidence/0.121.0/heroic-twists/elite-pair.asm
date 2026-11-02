0000000145c2a016 4883f801                       cmp rax, 1
0000000145c2a01a 0f85f2000000                   jne 0x145c2a112
0000000145c2a020 80be6f03000000                 cmp byte ptr [rsi + 0x36f], 0
0000000145c2a027 0f84e5000000                   je 0x145c2a112
0000000145c2a02d 488b86b8050000                 mov rax, qword ptr [rsi + 0x5b8]
0000000145c2a034 4c6986c0050000e0010000         imul r8, qword ptr [rsi + 0x5c0], 0x1e0
0000000145c2a03f 31c9                           xor ecx, ecx
0000000145c2a041 4989c1                         mov r9, rax
0000000145c2a044 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145c2a050 4939c8                         cmp r8, rcx
0000000145c2a053 0f84b9000000                   je 0x145c2a112
0000000145c2a059 4881c1e0010000                 add rcx, 0x1e0
0000000145c2a060 493b91f0000000                 cmp rdx, qword ptr [r9 + 0xf0]
0000000145c2a067 4d8d89e0010000                 lea r9, [r9 + 0x1e0]
0000000145c2a06e 75e0                           jne 0x145c2a050
0000000145c2a070 f30f104c08b8                   movss xmm1, dword ptr [rax + rcx - 0x48]
0000000145c2a076 0f57c0                         xorps xmm0, xmm0
0000000145c2a079 0f2ec1                         ucomiss xmm0, xmm1
0000000145c2a07c 7355                           jae 0x145c2a0d3
0000000145c2a07e f30f1096740c0000               movss xmm2, dword ptr [rsi + 0xc74]
0000000145c2a086 f30f5c5408b4                   subss xmm2, dword ptr [rax + rcx - 0x4c]
0000000145c2a08c f30f5ed1                       divss xmm2, xmm1
0000000145c2a090 f30f5fc2                       maxss xmm0, xmm2
0000000145c2a094 f30f101504e15600               movss xmm2, dword ptr [rip + 0x56e104]
0000000145c2a09c f30f5dd0                       minss xmm2, xmm0
0000000145c2a0a0 f20f104c089c                   movsd xmm1, qword ptr [rax + rcx - 0x64]
0000000145c2a0a6 f20f105c08a8                   movsd xmm3, qword ptr [rax + rcx - 0x58]
0000000145c2a0ac 0f5cd9                         subps xmm3, xmm1
0000000145c2a0af f30f12c2                       movsldup xmm0, xmm2
0000000145c2a0b3 0f59c3                         mulps xmm0, xmm3
0000000145c2a0b6 0f58c1                         addps xmm0, xmm1
0000000145c2a0b9 f30f105c08a4                   movss xmm3, dword ptr [rax + rcx - 0x5c]
0000000145c2a0bf f30f104c08b0                   movss xmm1, dword ptr [rax + rcx - 0x50]
0000000145c2a0c5 f30f5ccb                       subss xmm1, xmm3
0000000145c2a0c9 f30f59ca                       mulss xmm1, xmm2
0000000145c2a0cd f30f58cb                       addss xmm1, xmm3
0000000145c2a0d1 eb0c                           jmp 0x145c2a0df
0000000145c2a0d3 f20f104408a8                   movsd xmm0, qword ptr [rax + rcx - 0x58]
0000000145c2a0d9 f30f104c08b0                   movss xmm1, dword ptr [rax + rcx - 0x50]
0000000145c2a0df 0f58059a56a601                 addps xmm0, xmmword ptr [rip + 0x1a6569a]
0000000145c2a0e6 0f1385d4000000                 movlps qword ptr [rbp + 0xd4], xmm0
0000000145c2a0ed f30f118ddc000000               movss dword ptr [rbp + 0xdc], xmm1
0000000145c2a0f5 c785d000000001000000           mov dword ptr [rbp + 0xd0], 1
0000000145c2a0ff 4c8d85d0000000                 lea r8, [rbp + 0xd0]
0000000145c2a106 4889f1                         mov rcx, rsi
0000000145c2a109 4c89f2                         mov rdx, r14
0000000145c2a10c e8cfa9feff                     call 0x145c14ae0
0000000145c2a111 90                             nop
