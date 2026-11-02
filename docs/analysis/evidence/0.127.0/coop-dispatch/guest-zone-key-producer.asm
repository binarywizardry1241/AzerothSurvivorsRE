0000000145bd7fa6 488b8560050000                 mov rax, qword ptr [rbp + 0x560]
0000000145bd7fad 488b4808                       mov rcx, qword ptr [rax + 8]
0000000145bd7fb1 48898d68050000                 mov qword ptr [rbp + 0x568], rcx
0000000145bd7fb8 488b4810                       mov rcx, qword ptr [rax + 0x10]
0000000145bd7fbc 488b5018                       mov rdx, qword ptr [rax + 0x18]
0000000145bd7fc0 48898d50050000                 mov qword ptr [rbp + 0x550], rcx
0000000145bd7fc7 e834d3f2ff                     call 0x145b05300
0000000145bd7fcc 4869c0f0000000                 imul rax, rax, 0xf0
0000000145bd7fd3 488d0dd6254601                 lea rcx, [rip + 0x14625d6]
0000000145bd7fda 488b5c0808                     mov rbx, qword ptr [rax + rcx + 8]
0000000145bd7fdf 4c8b740810                     mov r14, qword ptr [rax + rcx + 0x10]
0000000145bd7fe4 83be980d000001                 cmp dword ptr [rsi + 0xd98], 1
0000000145bd7feb 0f8798000000                   ja 0x145bd8089
0000000145bd7ff1 48899e90110000                 mov qword ptr [rsi + 0x1190], rbx
0000000145bd7ff8 4c89b698110000                 mov qword ptr [rsi + 0x1198], r14
0000000145bd7fff 4883beb0100000ff               cmp qword ptr [rsi + 0x10b0], -1
0000000145bd8007 740c                           je 0x145bd8015
0000000145bd8009 488d8eb0100000                 lea rcx, [rsi + 0x10b0]
0000000145bd8010 e8fbd8f6ff                     call 0x145b45910
0000000145bd8015 48c786b0100000ffffffff         mov qword ptr [rsi + 0x10b0], 0xffffffffffffffff
0000000145bd8020 f20f11b6a0110000               movsd qword ptr [rsi + 0x11a0], xmm6
0000000145bd8028 0f57c0                         xorps xmm0, xmm0
0000000145bd802b 0f1186a8110000                 movups xmmword ptr [rsi + 0x11a8], xmm0
0000000145bd8032 c786b811000000000000           mov dword ptr [rsi + 0x11b8], 0
