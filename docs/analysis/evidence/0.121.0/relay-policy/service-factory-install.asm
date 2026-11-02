0000000145c5e328 488b8d08030000                 mov rcx, qword ptr [rbp + 0x308]
0000000145c5e32f 48898d40010000                 mov qword ptr [rbp + 0x140], rcx
0000000145c5e336 488b8d00030000                 mov rcx, qword ptr [rbp + 0x300]
0000000145c5e33d 48898d48010000                 mov qword ptr [rbp + 0x148], rcx
0000000145c5e344 488d0de50ee8ff                 lea rcx, [rip - 0x17f11b]
0000000145c5e34b 48898d50010000                 mov qword ptr [rbp + 0x150], rcx
0000000145c5e352 0f11b598010000                 movups xmmword ptr [rbp + 0x198], xmm6
0000000145c5e359 0f11bd88010000                 movups xmmword ptr [rbp + 0x188], xmm7
0000000145c5e360 488985a8010000                 mov qword ptr [rbp + 0x1a8], rax
0000000145c5e367 488995b0010000                 mov qword ptr [rbp + 0x1b0], rdx
0000000145c5e36e 66c785b80100000000             mov word ptr [rbp + 0x1b8], 0
0000000145c5e377 c685ba01000000                 mov byte ptr [rbp + 0x1ba], 0
0000000145c5e37e e87d3e3afa                     call 0x140002200
0000000145c5e383 b918020000                     mov ecx, 0x218
0000000145c5e388 ba08000000                     mov edx, 8
0000000145c5e38d e82e3e3afa                     call 0x1400021c0
0000000145c5e392 4885c0                         test rax, rax
0000000145c5e395 746e                           je 0x145c5e405
0000000145c5e397 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c5e39b 41b818020000                   mov r8d, 0x218
0000000145c5e3a1 4889c1                         mov rcx, rax
0000000145c5e3a4 4889c6                         mov rsi, rax
0000000145c5e3a7 e86fd83800                     call 0x145febc1b
