1400c40a9 488d0d97fad005 lea rcx, [rip + 0x5d0fa97]
1400c40b0 ba02000000 mov edx, 2
1400c40b5 e8266ca202 call 0x142aeace0
1400c40ba 4885c0 test rax, rax
1400c40bd 7507 jne 0x1400c40c6
1400c40bf 488b05cac1f907 mov rax, qword ptr [rip + 0x7f9c1ca]
1400c40c6 4531e4 xor r12d, r12d
1400c40c9 803802 cmp byte ptr [rax], 2
1400c40cc 755a jne 0x1400c4128
1400c40ce 488b4808 mov rcx, qword ptr [rax + 8]
1400c40d2 4885c9 test rcx, rcx
1400c40d5 740d je 0x1400c40e4
1400c40d7 83f901 cmp ecx, 1
1400c40da 752a jne 0x1400c4106
1400c40dc f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1400c40e2 eb27 jmp 0x1400c410b
1400c40e4 f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1400c40e9 0f140d708ed005 unpcklps xmm1, xmmword ptr [rip + 0x5d08e70]
1400c40f0 660f5c0d788ed005 subpd xmm1, xmmword ptr [rip + 0x5d08e78]
1400c40f8 660f28c1 movapd xmm0, xmm1
1400c40fc 660f15c1 unpckhpd xmm0, xmm1
1400c4100 f20f58c1 addsd xmm0, xmm1
1400c4104 eb05 jmp 0x1400c410b
1400c4106 f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1400c410b 660f57c9 xorpd xmm1, xmm1
1400c410f f20f5fc1 maxsd xmm0, xmm1
1400c4113 f20f5fc8 maxsd xmm1, xmm0
1400c4117 f20f100539ecd005 movsd xmm0, qword ptr [rip + 0x5d0ec39]
1400c411f f20f5dc1 minsd xmm0, xmm1
1400c4123 f24c0f2ce0 cvttsd2si r12, xmm0
1400c4128 488d0d1afad005 lea rcx, [rip + 0x5d0fa1a]
1400c412f ba05000000 mov edx, 5
1400c4134 4989d8 mov r8, rbx
1400c4137 e8a46ba202 call 0x142aeace0
1400c413c 4885c0 test rax, rax
1400c413f 7507 jne 0x1400c4148
1400c4141 488b0548c1f907 mov rax, qword ptr [rip + 0x7f9c148]
1400c4148 4531ed xor r13d, r13d
1400c414b 803802 cmp byte ptr [rax], 2
1400c414e 7567 jne 0x1400c41b7
1400c4150 488b4808 mov rcx, qword ptr [rax + 8]
1400c4154 4883f902 cmp rcx, 2
1400c4158 7410 je 0x1400c416a
1400c415a 83f901 cmp ecx, 1
1400c415d 7512 jne 0x1400c4171
1400c415f 0f57c0 xorps xmm0, xmm0
1400c4162 f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1400c4168 eb27 jmp 0x1400c4191
1400c416a f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1400c416f eb20 jmp 0x1400c4191
1400c4171 f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1400c4176 0f140de38dd005 unpcklps xmm1, xmmword ptr [rip + 0x5d08de3]
1400c417d 660f5c0deb8dd005 subpd xmm1, xmmword ptr [rip + 0x5d08deb]
1400c4185 660f28c1 movapd xmm0, xmm1
1400c4189 660f15c1 unpckhpd xmm0, xmm1
1400c418d f20f58c1 addsd xmm0, xmm1
1400c4191 660f57c9 xorpd xmm1, xmm1
1400c4195 f20f5fc1 maxsd xmm0, xmm1
1400c4199 f20f5fc8 maxsd xmm1, xmm0
1400c419d f20f1005b3ebd005 movsd xmm0, qword ptr [rip + 0x5d0ebb3]
1400c41a5 f20f5dc1 minsd xmm0, xmm1
1400c41a9 f24c0f2ce8 cvttsd2si r13, xmm0
1400c41ae 31c0 xor eax, eax
1400c41b0 4529e5 sub r13d, r12d
1400c41b3 440f42e8 cmovb r13d, eax
1400c41b7 488d0d90f9d005 lea rcx, [rip + 0x5d0f990]
1400c41be ba06000000 mov edx, 6
1400c41c3 4989d8 mov r8, rbx
1400c41c6 e8156ba202 call 0x142aeace0
1400c41cb 4885c0 test rax, rax
1400c41ce 7507 jne 0x1400c41d7
1400c41d0 488b05b9c0f907 mov rax, qword ptr [rip + 0x7f9c0b9]
1400c41d7 0fb608 movzx ecx, byte ptr [rax]
1400c41da 80f902 cmp cl, 2
1400c41dd 7541 jne 0x1400c4220
1400c41df 488b5008 mov rdx, qword ptr [rax + 8]
1400c41e3 4883fa02 cmp rdx, 2
1400c41e7 7410 je 0x1400c41f9
1400c41e9 83fa01 cmp edx, 1
1400c41ec 7512 jne 0x1400c4200
1400c41ee 0f57c0 xorps xmm0, xmm0
1400c41f1 f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
1400c41f7 eb27 jmp 0x1400c4220
1400c41f9 f20f104010 movsd xmm0, qword ptr [rax + 0x10]
1400c41fe eb20 jmp 0x1400c4220
1400c4200 f20f104810 movsd xmm1, qword ptr [rax + 0x10]
1400c4205 0f140d548dd005 unpcklps xmm1, xmmword ptr [rip + 0x5d08d54]
1400c420c 660f5c0d5c8dd005 subpd xmm1, xmmword ptr [rip + 0x5d08d5c]
1400c4214 660f28c1 movapd xmm0, xmm1
1400c4218 660f15c1 unpckhpd xmm0, xmm1
1400c421c f20f58c1 addsd xmm0, xmm1
1400c4220 80f902 cmp cl, 2
1400c4223 660f57c9 xorpd xmm1, xmm1
1400c4227 f20f5fc8 maxsd xmm1, xmm0
1400c422b f20f100525ebd005 movsd xmm0, qword ptr [rip + 0x5d0eb25]
1400c4233 f20f5dc1 minsd xmm0, xmm1
1400c4237 f2480f2cc0 cvttsd2si rax, xmm0
1400c423c 440f44e8 cmove r13d, eax
1400c4342 b86e000000 mov eax, 0x6e
1400c4347 41be02000000 mov r14d, 2
1400c434d 4489ea mov edx, r13d
1400c4350 448d40e2 lea r8d, [rax - 0x1e]
1400c4354 89d1 mov ecx, edx
1400c4356 4429c1 sub ecx, r8d
1400c4359 7230 jb 0x1400c438b
1400c435b 8d50f1 lea edx, [rax - 0xf]
1400c435e 4189c8 mov r8d, ecx
1400c4361 4129d0 sub r8d, edx
1400c4364 7237 jb 0x1400c439d
1400c4366 4489c2 mov edx, r8d
1400c4369 29c2 sub edx, eax
1400c436b 723f jb 0x1400c43ac
1400c436d 4183c703 add r15d, 3
1400c4371 83c02d add eax, 0x2d
1400c4374 4183c603 add r14d, 3
1400c4378 3d6b030000 cmp eax, 0x36b
1400c437d 75d1 jne 0x1400c4350
1400c437f 41be33000000 mov r14d, 0x33
1400c4385 31c9 xor ecx, ecx
1400c4387 31c0 xor eax, eax
1400c4389 eb24 jmp 0x1400c43af
1400c438b 438d04bf lea eax, [r15 + r15*4]
1400c438f 8d0440 lea eax, [rax + rax*2]
1400c4392 83c050 add eax, 0x50
1400c4395 4183c6fe add r14d, -2
1400c4399 89d1 mov ecx, edx
1400c439b eb12 jmp 0x1400c43af
1400c439d 438d04bf lea eax, [r15 + r15*4]
1400c43a1 8d0440 lea eax, [rax + rax*2]
1400c43a4 83c05f add eax, 0x5f
1400c43a7 41ffce dec r14d
1400c43aa eb03 jmp 0x1400c43af
1400c43ac 4489c1 mov ecx, r8d
1400c43af 4489b5a4020000 mov dword ptr [rbp + 0x2a4], r14d
1400c43b6 898da0020000 mov dword ptr [rbp + 0x2a0], ecx
1400c43bc 89859c020000 mov dword ptr [rbp + 0x29c], eax
1400c43c2 4c8bbd90020000 mov r15, qword ptr [rbp + 0x290]
1400c43c9 488d4da8 lea rcx, [rbp - 0x58]
1400c43cd 488d9d68020000 lea rbx, [rbp + 0x268]
1400c43d4 4889da mov rdx, rbx
1400c43d7 e8148fb005 call 0x145bcd2f0
1400c43dc 90 nop
1400c43dd 488b45b8 mov rax, qword ptr [rbp - 0x48]
1400c43e1 488945f0 mov qword ptr [rbp - 0x10], rax
1400c43e5 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
1400c43e9 0f1145e0 movups xmmword ptr [rbp - 0x20], xmm0
1400c43ed 0f57c0 xorps xmm0, xmm0
1400c43f0 0f118580000000 movups xmmword ptr [rbp + 0x80], xmm0
1400c43f7 0f118590000000 movups xmmword ptr [rbp + 0x90], xmm0
1400c43fe 0f1185a8000000 movups xmmword ptr [rbp + 0xa8], xmm0
1400c4405 0f1185b8000000 movups xmmword ptr [rbp + 0xb8], xmm0
1400c440c 48c785c800000000000000 mov qword ptr [rbp + 0xc8], 0
1400c4417 c7859001000000000000 mov dword ptr [rbp + 0x190], 0
1400c4421 66c785940100000000 mov word ptr [rbp + 0x194], 0
1400c442a 0f1005cff2d005 movups xmm0, xmmword ptr [rip + 0x5d0f2cf]
1400c4431 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
1400c4438 48c7851002000000000000 mov qword ptr [rbp + 0x210], 0
1400c4443 0f1005cef2d005 movups xmm0, xmmword ptr [rip + 0x5d0f2ce]
1400c444a 0f118518020000 movups xmmword ptr [rbp + 0x218], xmm0
1400c4451 48c7852802000000000000 mov qword ptr [rbp + 0x228], 0
1400c445c 0f1005cdf2d005 movups xmm0, xmmword ptr [rip + 0x5d0f2cd]
1400c4463 0f298530020000 movaps xmmword ptr [rbp + 0x230], xmm0
1400c446a 48c7854002000000000000 mov qword ptr [rbp + 0x240], 0
1400c4475 0f1005ccf2d005 movups xmm0, xmmword ptr [rip + 0x5d0f2cc]
1400c447c 0f118548020000 movups xmmword ptr [rbp + 0x248], xmm0
1400c4483 48c7855802000000000000 mov qword ptr [rbp + 0x258], 0
1400c448e 488b07 mov rax, qword ptr [rdi]
1400c4491 4883c708 add rdi, 8
1400c4495 c745f800000000 mov dword ptr [rbp - 8], 0
1400c449c 4c897d00 mov qword ptr [rbp], r15
1400c44a0 f30f117508 movss dword ptr [rbp + 8], xmm6
1400c44a5 44896d0c mov dword ptr [rbp + 0xc], r13d
1400c44a9 44896510 mov dword ptr [rbp + 0x10], r12d
1400c44ad 44897514 mov dword ptr [rbp + 0x14], r14d
1400c4513 48b9010000000000d243 movabs rcx, 0x43d2000000000001
1400c451d 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
1400c4524 0f10059df2d005 movups xmm0, xmmword ptr [rip + 0x5d0f29d]
1400c452b 0f1185e0000000 movups xmmword ptr [rbp + 0xe0], xmm0
1400c4532 0f10057ff2d005 movups xmm0, xmmword ptr [rip + 0x5d0f27f]
1400c4539 0f1185d0000000 movups xmmword ptr [rbp + 0xd0], xmm0
1400c4540 0f28050991cd05 movaps xmm0, xmmword ptr [rip + 0x5cd9109]
1400c4547 0f1185f0000000 movups xmmword ptr [rbp + 0xf0], xmm0
1400c454e 0f28050b8ecd05 movaps xmm0, xmmword ptr [rip + 0x5cd8e0b]
1400c4555 0f118500010000 movups xmmword ptr [rbp + 0x100], xmm0
1400c455c 0f28054d8dcd05 movaps xmm0, xmmword ptr [rip + 0x5cd8d4d]
1400c4563 0f118510010000 movups xmmword ptr [rbp + 0x110], xmm0
1400c456a 0f118520010000 movups xmmword ptr [rbp + 0x120], xmm0
1400c4571 0f2805e88ccd05 movaps xmm0, xmmword ptr [rip + 0x5cd8ce8]
1400c4578 0f118530010000 movups xmmword ptr [rbp + 0x130], xmm0
1400c457f 0f118540010000 movups xmmword ptr [rbp + 0x140], xmm0
1400c4586 0f28052389d005 movaps xmm0, xmmword ptr [rip + 0x5d08923]
1400c458d 0f118550010000 movups xmmword ptr [rbp + 0x150], xmm0
1400c4594 c7856001000001000000 mov dword ptr [rbp + 0x160], 1
1400c459e 48c7856401000000000000 mov qword ptr [rbp + 0x164], 0
1400c45a9 c6856c01000001 mov byte ptr [rbp + 0x16c], 1
1400c45b0 48c7857001000000000000 mov qword ptr [rbp + 0x170], 0
1400c45bb c785780100000000803f mov dword ptr [rbp + 0x178], 0x3f800000
1400c45c5 66c7857c0100000000 mov word ptr [rbp + 0x17c], 0
1400c45ce 66c785820100000000 mov word ptr [rbp + 0x182], 0
1400c45d7 c7857e01000000000100 mov dword ptr [rbp + 0x17e], 0x10000
1400c45e1 66c785880100000000 mov word ptr [rbp + 0x188], 0
1400c45ea c7858401000000000100 mov dword ptr [rbp + 0x184], 0x10000
1400c45f4 c7858a01000000000000 mov dword ptr [rbp + 0x18a], 0
1400c45fe 66c7858e0100000100 mov word ptr [rbp + 0x18e], 1
1400c4607 0f100552f5d005 movups xmm0, xmmword ptr [rip + 0x5d0f552]
1400c460e 0f118598010000 movups xmmword ptr [rbp + 0x198], xmm0
1400c4615 c785a80100006666e63e mov dword ptr [rbp + 0x1a8], 0x3ee66666
1400c461f 0f1185ac010000 movups xmmword ptr [rbp + 0x1ac], xmm0
1400c4626 c785bc0100006666e63e mov dword ptr [rbp + 0x1bc], 0x3ee66666
1400c4630 0f1185c0010000 movups xmmword ptr [rbp + 0x1c0], xmm0
1400c4637 c785d00100006666e63e mov dword ptr [rbp + 0x1d0], 0x3ee66666
1400c4641 0f1185d4010000 movups xmmword ptr [rbp + 0x1d4], xmm0
1400c4648 48c785e40100006666e63e mov qword ptr [rbp + 0x1e4], 0x3ee66666
1400c4653 660f280505e7d005 movapd xmm0, xmmword ptr [rip + 0x5d0e705]
1400c465b 660f1185ec010000 movupd xmmword ptr [rbp + 0x1ec], xmm0
1400c4663 488945d8 mov qword ptr [rbp - 0x28], rax
1400c4667 4c8d0dc20dd105 lea r9, [rip + 0x5d10dc2]
1400c466e 488d4da8 lea rcx, [rbp - 0x58]
1400c4672 4c8d45d8 lea r8, [rbp - 0x28]
1400c4676 4889fa mov rdx, rdi
1400c4679 e8529d1200 call 0x1401ee3d0
1400c467e 90 nop
1400c467f 488975d8 mov qword ptr [rbp - 0x28], rsi
1400c4683 488d8580020000 lea rax, [rbp + 0x280]
1400c468a 488945e0 mov qword ptr [rbp - 0x20], rax
1400c468e 488d85a0020000 lea rax, [rbp + 0x2a0]
1400c4695 488945e8 mov qword ptr [rbp - 0x18], rax
1400c4699 488d859c020000 lea rax, [rbp + 0x29c]
1400c46a0 488945f0 mov qword ptr [rbp - 0x10], rax
1400c46a4 48895df8 mov qword ptr [rbp - 8], rbx
1400c46a8 488d85a4020000 lea rax, [rbp + 0x2a4]
1400c46af 48894500 mov qword ptr [rbp], rax
1400c46b3 488d4da8 lea rcx, [rbp - 0x58]
1400c46b7 488d55d8 lea rdx, [rbp - 0x28]
1400c46bb e850f81800 call 0x140253f10
1400c46c0 90 nop
1400c46c1 488b9568020000 mov rdx, qword ptr [rbp + 0x268]
1400c46c8 4885d2 test rdx, rdx
1400c46cb 7412 je 0x1400c46df
1400c46cd 488b8d70020000 mov rcx, qword ptr [rbp + 0x270]
1400c46d4 41b801000000 mov r8d, 1
1400c46da e8f1daf3ff call 0x1400021d0
1400c46df 488bb590020000 mov rsi, qword ptr [rbp + 0x290]
1400c46e6 4885f6 test rsi, rsi
1400c46e9 7437 je 0x1400c4722
1400c46eb 488bbd88020000 mov rdi, qword ptr [rbp + 0x288]
1400c46f2 4883c708 add rdi, 8
1400c46f6 eb11 jmp 0x1400c4709
1400c46f8 0f1f840000000000 nop dword ptr [rax + rax]
1400c4700 4883c720 add rdi, 0x20
1400c4704 48ffce dec rsi
1400c4707 7419 je 0x1400c4722
1400c4709 488b57f8 mov rdx, qword ptr [rdi - 8]
1400c470d 4885d2 test rdx, rdx
1400c4710 74ee je 0x1400c4700
1400c4712 488b0f mov rcx, qword ptr [rdi]
1400c4715 41b801000000 mov r8d, 1
1400c471b e8b0daf3ff call 0x1400021d0
1400c4720 ebde jmp 0x1400c4700
1400c4722 488b9580020000 mov rdx, qword ptr [rbp + 0x280]
1400c4729 4885d2 test rdx, rdx
1400c472c 7416 je 0x1400c4744
1400c472e 488b8d88020000 mov rcx, qword ptr [rbp + 0x288]
1400c4735 48c1e205 shl rdx, 5
1400c4739 41b808000000 mov r8d, 8
1400c473f e88cdaf3ff call 0x1400021d0
1400c4744 0f28b5b0020000 movaps xmm6, xmmword ptr [rbp + 0x2b0]
1400c474b 4881c448030000 add rsp, 0x348
1400c4752 5b pop rbx
1400c4753 5f pop rdi
1400c4754 5e pop rsi
1400c4755 415c pop r12
1400c4757 415d pop r13
1400c4759 415e pop r14
1400c475b 415f pop r15
1400c475d 5d pop rbp
1400c475e c3 ret
