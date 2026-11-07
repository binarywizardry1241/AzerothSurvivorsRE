0x140618d11: 488d8d60020000           lea rcx, [rbp + 0x260]
0x140618d18: 4c8db5f0040000           lea r14, [rbp + 0x4f0]
0x140618d1f: 4c8d8530070000           lea r8, [rbp + 0x730]
0x140618d26: 4c89f2                   mov rdx, r14
0x140618d29: e882334305               call 0x145a4c0b0
0x140618d2e: 90                       nop
0x140618d2f: 488b9560020000           mov rdx, qword ptr [rbp + 0x260]
0x140618d36: 4883faff                 cmp rdx, -1
0x140618d3a: 0f84cc050000             je 0x14061930c
