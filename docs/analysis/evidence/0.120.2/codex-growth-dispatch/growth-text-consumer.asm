00000001402e1c91 488b9568060000                 mov rdx, qword ptr [rbp + 0x668]
00000001402e1c98 803a01                         cmp byte ptr [rdx], 1
00000001402e1c9b 7524                           jne 0x1402e1cc1
00000001402e1c9d 488b8d40060000                 mov rcx, qword ptr [rbp + 0x640]
00000001402e1ca4 8b01                           mov eax, dword ptr [rcx]
00000001402e1ca6 8b4903                         mov ecx, dword ptr [rcx + 3]
00000001402e1ca9 898dd3030000                   mov dword ptr [rbp + 0x3d3], ecx
00000001402e1caf 8985d0030000                   mov dword ptr [rbp + 0x3d0], eax
00000001402e1cb5 488b4208                       mov rax, qword ptr [rdx + 8]
00000001402e1cb9 0fb64a10                       movzx ecx, byte ptr [rdx + 0x10]
00000001402e1cbd b201                           mov dl, 1
00000001402e1cbf eb10                           jmp 0x1402e1cd1
00000001402e1cc1 488b4208                       mov rax, qword ptr [rdx + 8]
00000001402e1cc5 f048ff00                       lock inc qword ptr [rax]
00000001402e1cc9 0f8e54010000                   jle 0x1402e1e23
00000001402e1ccf 31d2                           xor edx, edx
00000001402e1cd1 4c8b8510060000                 mov r8, qword ptr [rbp + 0x610]
00000001402e1cd8 4c898508040000                 mov qword ptr [rbp + 0x408], r8
00000001402e1cdf 0f108500060000                 movups xmm0, xmmword ptr [rbp + 0x600]
00000001402e1ce6 0f1185f8030000                 movups xmmword ptr [rbp + 0x3f8], xmm0
00000001402e1ced 440f117dc1                     movups xmmword ptr [rbp - 0x3f], xmm15
00000001402e1cf2 c745d10000803f                 mov dword ptr [rbp - 0x2f], 0x3f800000
00000001402e1cf9 48c7851004000000000000         mov qword ptr [rbp + 0x410], 0
00000001402e1d04 48c7851804000004000000         mov qword ptr [rbp + 0x418], 4
00000001402e1d0f 48c7852004000000000000         mov qword ptr [rbp + 0x420], 0
00000001402e1d1a 889528040000                   mov byte ptr [rbp + 0x428], dl
00000001402e1d20 8b95d0030000                   mov edx, dword ptr [rbp + 0x3d0]
00000001402e1d26 448b85d3030000                 mov r8d, dword ptr [rbp + 0x3d3]
00000001402e1d2d 899529040000                   mov dword ptr [rbp + 0x429], edx
00000001402e1d33 4489852c040000                 mov dword ptr [rbp + 0x42c], r8d
00000001402e1d3a 48898530040000                 mov qword ptr [rbp + 0x430], rax
00000001402e1d41 48898d38040000                 mov qword ptr [rbp + 0x438], rcx
00000001402e1d48 c7854004000000004041           mov dword ptr [rbp + 0x440], 0x41400000
00000001402e1d52 66c785440400009001             mov word ptr [rbp + 0x444], 0x190
00000001402e1d5b c6854604000001                 mov byte ptr [rbp + 0x446], 1
00000001402e1d62 488b45cd                       mov rax, qword ptr [rbp - 0x33]
00000001402e1d66 48898554040000                 mov qword ptr [rbp + 0x454], rax
00000001402e1d6d 0f1045c0                       movups xmm0, xmmword ptr [rbp - 0x40]
00000001402e1d71 0f118547040000                 movups xmmword ptr [rbp + 0x447], xmm0
00000001402e1d78 440f11b55c040000               movups xmmword ptr [rbp + 0x45c], xmm14
00000001402e1d80 8b054a41ed05                   mov eax, dword ptr [rip + 0x5ed414a]
00000001402e1d86 89856c040000                   mov dword ptr [rbp + 0x46c], eax
00000001402e1d8c f2440f118570040000             movsd qword ptr [rbp + 0x470], xmm8
00000001402e1d95 488b8548060000                 mov rax, qword ptr [rbp + 0x648]
00000001402e1d9c 488985f0030000                 mov qword ptr [rbp + 0x3f0], rax
00000001402e1da3 c6858706000000                 mov byte ptr [rbp + 0x687], 0
00000001402e1daa 488d8de0010000                 lea rcx, [rbp + 0x1e0]
00000001402e1db1 4c8d85f0030000                 lea r8, [rbp + 0x3f0]
00000001402e1db8 488d95b8010000                 lea rdx, [rbp + 0x1b8]
00000001402e1dbf e85c6cfbff                     call 0x140298a20
00000001402e1dc4 90                             nop
