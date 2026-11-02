; 0.120.2 SHA256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
0000000145bf8ed2 c683e201000000                 mov byte ptr [rbx + 0x1e2], 0
0000000145bf8ed9 488b8380010000                 mov rax, qword ptr [rbx + 0x180]
0000000145bf8ee0 488b8b98010000                 mov rcx, qword ptr [rbx + 0x198]
0000000145bf8ee7 660f6f00                       movdqa xmm0, xmmword ptr [rax]
0000000145bf8eeb 488d5010                       lea rdx, [rax + 0x10]
0000000145bf8eef 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bf8ef4 41f7d0                         not r8d
0000000145bf8ef7 eb2a                           jmp 0x145bf8f23
0000000145bf8ef9 0f1f8000000000                 nop dword ptr [rax]
0000000145bf8f00 458d48ff                       lea r9d, [r8 - 1]
0000000145bf8f04 f3450fbcd0                     tzcnt r10d, r8d
0000000145bf8f09 4521c1                         and r9d, r8d
0000000145bf8f0c 49f7da                         neg r10
0000000145bf8f0f 4f8d0452                       lea r8, [r10 + r10*2]
0000000145bf8f13 49c1e004                       shl r8, 4
0000000145bf8f17 42c64400f900                   mov byte ptr [rax + r8 - 7], 0
0000000145bf8f1d 48ffc9                         dec rcx
0000000145bf8f20 4589c8                         mov r8d, r9d
0000000145bf8f23 664585c0                       test r8w, r8w
0000000145bf8f27 75d7                           jne 0x145bf8f00
0000000145bf8f29 4885c9                         test rcx, rcx
0000000145bf8f2c 7420                           je 0x145bf8f4e
0000000145bf8f2e 6690                           nop
0000000145bf8f30 660f6f02                       movdqa xmm0, xmmword ptr [rdx]
0000000145bf8f34 480500fdffff                   add rax, -0x300
0000000145bf8f3a 4883c210                       add rdx, 0x10
0000000145bf8f3e 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bf8f43 4181f0ffff0000                 xor r8d, 0xffff
0000000145bf8f4a 74e4                           je 0x145bf8f30
0000000145bf8f4c ebb2                           jmp 0x145bf8f00
