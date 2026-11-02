0x14587824f: lea rax, [rbx + 0x1590]
0x145878256: mov qword ptr [rbp + 0xdb0], rax
0x14587825d: mov rsi, qword ptr [rbx + 0x1590]
0x145878264: cmp rsi, -1
0x145878268: je 0x14587975f
0x14587826e: cmp dword ptr [rbx + 0xc58], 2
0x145878275: jne 0x145878291
0x145878277: movapd xmm0, xmm6
0x14587827b: subsd xmm0, qword ptr [rbx + 0x16c8]
0x145878283: ucomisd xmm0, qword ptr [rip + 0x7462a5]
0x14587828b: jae 0x145878ebe
