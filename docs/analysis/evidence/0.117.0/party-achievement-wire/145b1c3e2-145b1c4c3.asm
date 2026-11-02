145b1c3e2 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145b1c3e9 488d5008 lea rdx, [rax + 8]
145b1c3ed 83bea00c000001 cmp dword ptr [rsi + 0xca0], 1
145b1c3f4 0f87a40c0000 ja 0x145b1d09e
145b1c3fa 488bbea80f0000 mov rdi, qword ptr [rsi + 0xfa8]
145b1c401 4885ff test rdi, rdi
145b1c404 0f84940c0000 je 0x145b1d09e
145b1c40a 8a9e40120000 mov bl, byte ptr [rsi + 0x1240]
145b1c410 4c8bbeb00f0000 mov r15, qword ptr [rsi + 0xfb0]
145b1c417 4c8d75b0 lea r14, [rbp - 0x50]
145b1c41b 41b8c8000000 mov r8d, 0xc8
145b1c421 4c89f1 mov rcx, r14
145b1c424 e8b2784700 call 0x145f93cdb
145b1c429 f20f5cb6b80f0000 subsd xmm6, qword ptr [rsi + 0xfb8]
145b1c431 c6855704000001 mov byte ptr [rbp + 0x457], 1
145b1c438 c6855604000001 mov byte ptr [rbp + 0x456], 1
145b1c43f f20f11742428 movsd qword ptr [rsp + 0x28], xmm6
145b1c445 4c897c2420 mov qword ptr [rsp + 0x20], r15
145b1c44a 488d8df0020000 lea rcx, [rbp + 0x2f0]
145b1c451 4c89f2 mov rdx, r14
145b1c454 4189d8 mov r8d, ebx
145b1c457 4989f9 mov r9, rdi
145b1c45a e8a147fcff call 0x145ae0c00
145b1c45f 90 nop
145b1c460 4883bdf0020000ff cmp qword ptr [rbp + 0x2f0], -1
145b1c468 0f843c0f0000 je 0x145b1d3aa
145b1c46e 488d4db0 lea rcx, [rbp - 0x50]
145b1c472 488d95f0020000 lea rdx, [rbp + 0x2f0]
145b1c479 41b8c8000000 mov r8d, 0xc8
145b1c47f e857784700 call 0x145f93cdb
145b1c484 807d6d00 cmp byte ptr [rbp + 0x6d], 0
145b1c488 0f84370f0000 je 0x145b1d3c5
145b1c48e 8a5d70 mov bl, byte ptr [rbp + 0x70]
145b1c491 488d8df8020000 lea rcx, [rbp + 0x2f8]
145b1c498 c6855504000001 mov byte ptr [rbp + 0x455], 1
145b1c49f 488d55b0 lea rdx, [rbp - 0x50]
145b1c4a3 e848aa4400 call 0x145f66ef0
145b1c4a8 90 nop
145b1c4a9 4c8bbdf8020000 mov r15, qword ptr [rbp + 0x2f8]
145b1c4b0 4c8ba500030000 mov r12, qword ptr [rbp + 0x300]
145b1c4b7 488bbd08030000 mov rdi, qword ptr [rbp + 0x308]
145b1c4be e9090f0000 jmp 0x145b1d3cc
