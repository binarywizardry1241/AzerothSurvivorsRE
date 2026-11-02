144e3e1a0 4889c8 mov rax, rcx
144e3e1a3 48899100010000 mov qword ptr [rcx + 0x100], rdx
144e3e1aa 410f1000 movups xmm0, xmmword ptr [r8]
144e3e1ae 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
144e3e1b3 410f105020 movups xmm2, xmmword ptr [r8 + 0x20]
144e3e1b8 410f105830 movups xmm3, xmmword ptr [r8 + 0x30]
144e3e1bd 0f1101 movups xmmword ptr [rcx], xmm0
144e3e1c0 0f114910 movups xmmword ptr [rcx + 0x10], xmm1
144e3e1c4 0f115120 movups xmmword ptr [rcx + 0x20], xmm2
144e3e1c8 0f115930 movups xmmword ptr [rcx + 0x30], xmm3
144e3e1cc 410f104040 movups xmm0, xmmword ptr [r8 + 0x40]
144e3e1d1 0f114140 movups xmmword ptr [rcx + 0x40], xmm0
144e3e1d5 498b4850 mov rcx, qword ptr [r8 + 0x50]
144e3e1d9 48894850 mov qword ptr [rax + 0x50], rcx
144e3e1dd 48c7405800000000 mov qword ptr [rax + 0x58], 0
144e3e1e5 0f57c0 xorps xmm0, xmm0
144e3e1e8 0f118008010000 movups xmmword ptr [rax + 0x108], xmm0
144e3e1ef 0f118018010000 movups xmmword ptr [rax + 0x118], xmm0
144e3e1f6 48c7802801000000000000 mov qword ptr [rax + 0x128], 0
144e3e201 48c7406008000000 mov qword ptr [rax + 0x60], 8
144e3e209 48c7406800000000 mov qword ptr [rax + 0x68], 0
144e3e211 0f1005c80bd001 movups xmm0, xmmword ptr [rip + 0x1d00bc8]
144e3e218 0f114070 movups xmmword ptr [rax + 0x70], xmm0
144e3e21c 0f100dcd0bd001 movups xmm1, xmmword ptr [rip + 0x1d00bcd]
144e3e223 0f118880000000 movups xmmword ptr [rax + 0x80], xmm1
144e3e22a 48c7809000000000000000 mov qword ptr [rax + 0x90], 0
144e3e235 48c7809800000008000000 mov qword ptr [rax + 0x98], 8
144e3e240 48c780a000000000000000 mov qword ptr [rax + 0xa0], 0
144e3e24b 0f1188b8000000 movups xmmword ptr [rax + 0xb8], xmm1
144e3e252 0f1180a8000000 movups xmmword ptr [rax + 0xa8], xmm0
144e3e259 48c780c800000000000000 mov qword ptr [rax + 0xc8], 0
144e3e264 48c780d000000008000000 mov qword ptr [rax + 0xd0], 8
144e3e26f 48c780d800000000000000 mov qword ptr [rax + 0xd8], 0
144e3e27a 0f1188f0000000 movups xmmword ptr [rax + 0xf0], xmm1
144e3e281 0f1180e0000000 movups xmmword ptr [rax + 0xe0], xmm0
144e3e288 c3 ret
