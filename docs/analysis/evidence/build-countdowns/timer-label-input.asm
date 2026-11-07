1400d1d52 488b8df0030000 mov rcx, qword ptr [rbp + 0x3f0]
1400d1d59 488d04c1 lea rax, [rcx + rax*8]
1400d1d5d 488b38 mov rdi, qword ptr [rax]
1400d1d60 4488a517040000 mov byte ptr [rbp + 0x417], r12b
1400d1d67 ba06000000 mov edx, 6
1400d1d6c 488d0d9573ce05 lea rcx, [rip + 0x5ce7395]
1400d1d73 4c8b8588030000 mov r8, qword ptr [rbp + 0x388]
1400d1d7a e81151a202 call 0x142af6e90
1400d1d7f 90 nop
1400d1d80 4885c0 test rax, rax
1400d1d83 488b0dfee4f907 mov rcx, qword ptr [rip + 0x7f9e4fe]
1400d1d8a 480f44c1 cmove rax, rcx
1400d1d8e 4989f8 mov r8, rdi
1400d1d91 49c1e005 shl r8, 5
1400d1d95 4c034010 add r8, qword ptr [rax + 0x10]
1400d1d99 483b7818 cmp rdi, qword ptr [rax + 0x18]
1400d1d9d 4c0f43c1 cmovae r8, rcx
1400d1da1 803804 cmp byte ptr [rax], 4
1400d1da4 4c0f45c1 cmovne r8, rcx
1400d1da8 4488a517040000 mov byte ptr [rbp + 0x417], r12b
1400d1daf ba04000000 mov edx, 4
1400d1db4 488d0d5373ce05 lea rcx, [rip + 0x5ce7353]
1400d1dbb e8d050a202 call 0x142af6e90
1400d1dc0 90 nop
1400d1dc1 4885c0 test rax, rax
1400d1dc4 7507 jne 0x1400d1dcd
1400d1dc6 488b05bbe4f907 mov rax, qword ptr [rip + 0x7f9e4bb]
1400d1dcd 803802 cmp byte ptr [rax], 2
1400d1dd0 751a jne 0x1400d1dec
1400d1dd2 488b4808 mov rcx, qword ptr [rax + 8]
1400d1dd6 4883f902 cmp rcx, 2
1400d1dda 743f je 0x1400d1e1b
1400d1ddc 83f901 cmp ecx, 1
1400d1ddf 7546 jne 0x1400d1e27
1400d1de1 0f57c0 xorps xmm0, xmm0
1400d1de4 f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1400d1dea eb53 jmp 0x1400d1e3f
1400d1dec 48c785b003000000000000 mov qword ptr [rbp + 0x3b0], 0
1400d1df7 48c785b803000001000000 mov qword ptr [rbp + 0x3b8], 1
1400d1e02 48c785c003000000000000 mov qword ptr [rbp + 0x3c0], 0
1400d1e0d 4531c0 xor r8d, r8d
1400d1e10 4d394510 cmp qword ptr [r13 + 0x10], r8
1400d1e14 747c je 0x1400d1e92
1400d1e16 e98e000000 jmp 0x1400d1ea9
1400d1e1b f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1400d1e20 e80486b305 call 0x145c0a429
1400d1e25 eb18 jmp 0x1400d1e3f
1400d1e27 f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1400d1e2c 0f14ce unpcklps xmm1, xmm6
1400d1e2f 660f5ccf subpd xmm1, xmm7
1400d1e33 660f28c1 movapd xmm0, xmm1
1400d1e37 660f15c1 unpckhpd xmm0, xmm1
1400d1e3b f20f58c1 addsd xmm0, xmm1
