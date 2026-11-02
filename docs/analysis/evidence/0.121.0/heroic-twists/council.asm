0000000145c2bad7 80be6f03000005                 cmp byte ptr [rsi + 0x36f], 5
0000000145c2bade 0f8264010000                   jb 0x145c2bc48
0000000145c2bae4 f6436401                       test byte ptr [rbx + 0x64], 1
0000000145c2bae8 0f845a010000                   je 0x145c2bc48
0000000145c2baee 488b96c00b0000                 mov rdx, qword ptr [rsi + 0xbc0]
0000000145c2baf5 488b86c80b0000                 mov rax, qword ptr [rsi + 0xbc8]
0000000145c2bafc 4c8b86d80b0000                 mov r8, qword ptr [rsi + 0xbd8]
0000000145c2bb03 488b8ed00b0000                 mov rcx, qword ptr [rsi + 0xbd0]
0000000145c2bb0a 660f1f440000                   nop word ptr [rax + rax]
0000000145c2bb10 4e8d0c02                       lea r9, [rdx + r8]
0000000145c2bb14 49c1c117                       rol r9, 0x17
0000000145c2bb18 4901d1                         add r9, rdx
0000000145c2bb1b 4989c2                         mov r10, rax
0000000145c2bb1e 49c1e211                       shl r10, 0x11
0000000145c2bb22 4831d1                         xor rcx, rdx
0000000145c2bb25 4931c0                         xor r8, rax
0000000145c2bb28 4831c8                         xor rax, rcx
0000000145c2bb2b 4c31c2                         xor rdx, r8
0000000145c2bb2e 4c31d1                         xor rcx, r10
0000000145c2bb31 49c1c02d                       rol r8, 0x2d
0000000145c2bb35 490fbae13d                     bt r9, 0x3d
0000000145c2bb3a 72d4                           jb 0x145c2bb10
0000000145c2bb3c 488996c00b0000                 mov qword ptr [rsi + 0xbc0], rdx
0000000145c2bb43 4c8986d80b0000                 mov qword ptr [rsi + 0xbd8], r8
0000000145c2bb4a 488986c80b0000                 mov qword ptr [rsi + 0xbc8], rax
0000000145c2bb51 48898ed00b0000                 mov qword ptr [rsi + 0xbd0], rcx
0000000145c2bb58 49c1e93e                       shr r9, 0x3e
0000000145c2bb5c 496bc168                       imul rax, r9, 0x68
0000000145c2bb60 4801c7                         add rdi, rax
0000000145c2bb63 f30f101561cd5600               movss xmm2, dword ptr [rip + 0x56cd61]
0000000145c2bb6b 4889f1                         mov rcx, rsi
0000000145c2bb6e 4889fa                         mov rdx, rdi
0000000145c2bb71 e87abaffff                     call 0x145c275f0
0000000145c2bb76 90                             nop
