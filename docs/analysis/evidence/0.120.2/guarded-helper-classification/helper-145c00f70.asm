0000000145c00f49 80bdd80b000002                 cmp byte ptr [rbp + 0xbd8], 2
0000000145c00f50 0f85d5030000                   jne 0x145c0132b
0000000145c00f56 488b9de00b0000                 mov rbx, qword ptr [rbp + 0xbe0]
0000000145c00f5d 89d8                           mov eax, ebx
0000000145c00f5f 83e003                         and eax, 3
0000000145c00f62 488d0dff0ea001                 lea rcx, [rip + 0x1a00eff]
0000000145c00f69 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145c00f6d 4801c8                         add rax, rcx
0000000145c00f70 ffe0                           jmp rax
0000000145c00f72 0fb65b10                       movzx ebx, byte ptr [rbx + 0x10]
0000000145c00f76 80fb16                         cmp bl, 0x16
0000000145c00f79 7540                           jne 0x145c00fbb
0000000145c00f7b eb4a                           jmp 0x145c00fc7
0000000145c00f7d c685d60e000001                 mov byte ptr [rbp + 0xed6], 1
0000000145c00f84 e847583800                     call 0x145f867d0
0000000145c00f89 90                             nop
0000000145c00f8a 48c1eb20                       shr rbx, 0x20
0000000145c00f8e 488b4008                       mov rax, qword ptr [rax + 8]
0000000145c00f92 c685d60e000001                 mov byte ptr [rbp + 0xed6], 1
0000000145c00f99 89d9                           mov ecx, ebx
0000000145c00f9b ffd0                           call rax
0000000145c00f9d 90                             nop
0000000145c00f9e 89c3                           mov ebx, eax
0000000145c00fa0 80fb16                         cmp bl, 0x16
0000000145c00fa3 7516                           jne 0x145c00fbb
0000000145c00fa5 eb20                           jmp 0x145c00fc7
0000000145c00fa7 48c1eb20                       shr rbx, 0x20
0000000145c00fab 80fb16                         cmp bl, 0x16
0000000145c00fae 750b                           jne 0x145c00fbb
0000000145c00fb0 eb15                           jmp 0x145c00fc7
0000000145c00fb2 0fb65b1f                       movzx ebx, byte ptr [rbx + 0x1f]
0000000145c00fb6 80fb16                         cmp bl, 0x16
0000000145c00fb9 740c                           je 0x145c00fc7
0000000145c00fbb 0fb6c3                         movzx eax, bl
0000000145c00fbe 83f80d                         cmp eax, 0xd
0000000145c00fc1 0f8564030000                   jne 0x145c0132b
0000000145c00fc7 488bb5e00b0000                 mov rsi, qword ptr [rbp + 0xbe0]
0000000145c00fce 4889b5d00c0000                 mov qword ptr [rbp + 0xcd0], rsi
0000000145c00fd5 488d8d80050000                 lea rcx, [rbp + 0x580]
0000000145c00fdc 488d55b8                       lea rdx, [rbp - 0x48]
0000000145c00fe0 4c8d85b8000000                 lea r8, [rbp + 0xb8]
0000000145c00fe7 e84415ffff                     call 0x145bf2530
0000000145c00fec 90                             nop
0000000145c00fed 80bd80050000ff                 cmp byte ptr [rbp + 0x580], 0xff
0000000145c00ff4 740d                           je 0x145c01003
0000000145c00ff6 488d8d80050000                 lea rcx, [rbp + 0x580]
0000000145c00ffd e80e32ffff                     call 0x145bf4210
0000000145c01002 90                             nop
