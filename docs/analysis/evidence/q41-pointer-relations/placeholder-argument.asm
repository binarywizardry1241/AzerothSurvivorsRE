0000000145895ce7: 4883bd9000000000               cmp qword ptr [rbp + 0x90], 0
0000000145895cef: 0f848b000000                   je 0x145895d80
0000000145895cf5: 4c8b75c8                       mov r14, qword ptr [rbp - 0x38]
0000000145895cf9: 488b75c0                       mov rsi, qword ptr [rbp - 0x40]
0000000145895cfd: eb0b                           jmp 0x145895d0a
0000000145895cff: 90                             nop
0000000145895d00: 4883c620                       add rsi, 0x20
0000000145895d04: 4983c6e0                       add r14, -0x20
0000000145895d08: 7476                           je 0x145895d80
0000000145895d0a: 48395ef8                       cmp qword ptr [rsi - 8], rbx
0000000145895d0e: 75f0                           jne 0x145895d00
0000000145895d10: 488b4ef0                       mov rcx, qword ptr [rsi - 0x10]
0000000145895d14: 4c89ea                         mov rdx, r13
0000000145895d17: 4989d8                         mov r8, rbx
0000000145895d1a: e8723c4600                     call 0x145cf9991
0000000145895d1f: 85c0                           test eax, eax
0000000145895d21: 75dd                           jne 0x145895d00
0000000145895d23: 488975a8                       mov qword ptr [rbp - 0x58], rsi
0000000145895d27: 4c897dd8                       mov qword ptr [rbp - 0x28], r15
0000000145895d2b: 488d05ee9a8efa                 lea rax, [rip - 0x5716512]
0000000145895d32: 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145895d36: 488d4d08                       lea rcx, [rbp + 8]
0000000145895d3a: 488d158f387801                 lea rdx, [rip + 0x178388f]
0000000145895d41: 4c8d0580387801                 lea r8, [rip + 0x1783880]
0000000145895d48: 4c8d4dd8                       lea r9, [rbp - 0x28]
0000000145895d4c: e88fe44300                     call 0x145cd41e0
0000000145895d51: 90                             nop
