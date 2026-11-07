0000000145969c60: 498b08                         mov rcx, qword ptr [r8]
0000000145969c63: 48ba0000000000000080           movabs rdx, 0x8000000000000000
0000000145969c6d: 4889c8                         mov rax, rcx
0000000145969c70: 4831d0                         xor rax, rdx
0000000145969c73: 48898d98000000                 mov qword ptr [rbp + 0x98], rcx
0000000145969c7a: 4885c9                         test rcx, rcx
0000000145969c7d: b901000000                     mov ecx, 1
0000000145969c82: 480f48c8                       cmovs rcx, rax
0000000145969c86: 0f2945b0                       movaps xmmword ptr [rbp - 0x50], xmm0
0000000145969c8a: 488d05e3509a01                 lea rax, [rip + 0x19a50e3]
0000000145969c91: 48630c88                       movsxd rcx, dword ptr [rax + rcx*4]
0000000145969c95: 4801c1                         add rcx, rax
0000000145969c98: 4c898550010000                 mov qword ptr [rbp + 0x150], r8
0000000145969c9f: ffe1                           jmp rcx
