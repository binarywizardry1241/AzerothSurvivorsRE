0000000145b2b1d0  55                     push rbp
0000000145b2b1d1  4157                   push r15
0000000145b2b1d3  4156                   push r14
0000000145b2b1d5  4155                   push r13
0000000145b2b1d7  4154                   push r12
0000000145b2b1d9  56                     push rsi
0000000145b2b1da  57                     push rdi
0000000145b2b1db  53                     push rbx
0000000145b2b1dc  4881ece8000000         sub rsp, 0xe8
0000000145b2b1e3  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b2b1eb  48c74560feffffff       mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0000000145b2b1f3  4889ce                 mov rsi, rcx
0000000145b2b1f6  4c89c1                 mov rcx, r8
0000000145b2b1f9  4829d1                 sub rcx, rdx
0000000145b2b1fc  4c29c1                 sub rcx, r8
0000000145b2b1ff  4531c9                 xor r9d, r9d
0000000145b2b202  eb39                   jmp 0x145b2b23d
0000000145b2b204  6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b2b210  410fb67903             movzx edi, byte ptr [r9 + 3]
0000000145b2b215  4983c104               add r9, 4
0000000145b2b219  4183e307               and r11d, 7
0000000145b2b21d  41c1e312               shl r11d, 0x12
0000000145b2b221  41c1e206               shl r10d, 6
0000000145b2b225  83e73f                 and edi, 0x3f
0000000145b2b228  4409d7                 or edi, r10d
0000000145b2b22b  4409df                 or edi, r11d
0000000145b2b22e  4189fa                 mov r10d, edi
0000000145b2b231  4901c9                 add r9, rcx
0000000145b2b234  4181fafffe0000         cmp r10d, 0xfeff
0000000145b2b23b  7558                   jne 0x145b2b295
0000000145b2b23d  4d39c1                 cmp r9, r8
0000000145b2b240  7450                   je 0x145b2b292
0000000145b2b242  4c89c8                 mov rax, r9
0000000145b2b245  4901d1                 add r9, rdx
0000000145b2b248  410fb619               movzx ebx, byte ptr [r9]
0000000145b2b24c  84db                   test bl, bl
0000000145b2b24e  7945                   jns 0x145b2b295
0000000145b2b250  80fbe0                 cmp bl, 0xe0
0000000145b2b253  7240                   jb 0x145b2b295
0000000145b2b255  440fb6db               movzx r11d, bl
0000000145b2b259  4183e31f               and r11d, 0x1f
0000000145b2b25d  410fb67901             movzx edi, byte ptr [r9 + 1]
0000000145b2b262  83e73f                 and edi, 0x3f
0000000145b2b265  450fb65102             movzx r10d, byte ptr [r9 + 2]
0000000145b2b26a  c1e706                 shl edi, 6
0000000145b2b26d  4183e23f               and r10d, 0x3f
0000000145b2b271  4109fa                 or r10d, edi
0000000145b2b274  80fbf0                 cmp bl, 0xf0
0000000145b2b277  7397                   jae 0x145b2b210
0000000145b2b279  4983c103               add r9, 3
0000000145b2b27d  41c1e30c               shl r11d, 0xc
0000000145b2b281  4509da                 or r10d, r11d
0000000145b2b284  4901c9                 add r9, rcx
0000000145b2b287  4181fafffe0000         cmp r10d, 0xfeff
0000000145b2b28e  74ad                   je 0x145b2b23d
0000000145b2b290  eb03                   jmp 0x145b2b295
0000000145b2b292  4c89c0                 mov rax, r8
0000000145b2b295  4801c2                 add rdx, rax
0000000145b2b298  48c7450800000000       mov qword ptr [rbp + 8], 0
0000000145b2b2a0  48c7451008000000       mov qword ptr [rbp + 0x10], 8
0000000145b2b2a8  48c7451800000000       mov qword ptr [rbp + 0x18], 0
0000000145b2b2b0  4929c0                 sub r8, rax
0000000145b2b2b3  48895530               mov qword ptr [rbp + 0x30], rdx
0000000145b2b2b7  4c894538               mov qword ptr [rbp + 0x38], r8
0000000145b2b2bb  7431                   je 0x145b2b2ee
0000000145b2b2bd  31c0                   xor eax, eax
0000000145b2b2bf  48b90026000001000000   movabs rcx, 0x100002600
0000000145b2b2c9  0f1f8000000000         nop dword ptr [rax]
0000000145b2b2d0  440fb60c02             movzx r9d, byte ptr [rdx + rax]
0000000145b2b2d5  4983f920               cmp r9, 0x20
0000000145b2b2d9  7715                   ja 0x145b2b2f0
0000000145b2b2db  4c0fa3c9               bt rcx, r9
0000000145b2b2df  730f                   jae 0x145b2b2f0
0000000145b2b2e1  48ffc0                 inc rax
0000000145b2b2e4  4939c0                 cmp r8, rax
0000000145b2b2e7  75e7                   jne 0x145b2b2d0
0000000145b2b2e9  4c89c0                 mov rax, r8
0000000145b2b2ec  eb02                   jmp 0x145b2b2f0
0000000145b2b2ee  31c0                   xor eax, eax
0000000145b2b2f0  48894540               mov qword ptr [rbp + 0x40], rax
0000000145b2b2f4  488d4dd8               lea rcx, [rbp - 0x28]
0000000145b2b2f8  488d5530               lea rdx, [rbp + 0x30]
0000000145b2b2fc  41b07b                 mov r8b, 0x7b
0000000145b2b2ff  e8acc0ffff             call 0x145b273b0
0000000145b2b304  90                     nop
0000000145b2b305  48837dd8ff             cmp qword ptr [rbp - 0x28], -1
0000000145b2b30a  0f84a1000000           je 0x145b2b3b1
0000000145b2b310  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145b2b314  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b2b318  f30f6f45d8             movdqu xmm0, xmmword ptr [rbp - 0x28]
0000000145b2b31d  f30f7f4608             movdqu xmmword ptr [rsi + 8], xmm0
0000000145b2b322  48c70601000000         mov qword ptr [rsi], 1
0000000145b2b329  488b7d18               mov rdi, qword ptr [rbp + 0x18]
0000000145b2b32d  4885ff                 test rdi, rdi
0000000145b2b330  7448                   je 0x145b2b37a
0000000145b2b332  488b5d10               mov rbx, qword ptr [rbp + 0x10]
0000000145b2b336  4883c320               add rbx, 0x20
0000000145b2b33a  eb0d                   jmp 0x145b2b349
0000000145b2b33c  0f1f4000               nop dword ptr [rax]
0000000145b2b340  4883c330               add rbx, 0x30
0000000145b2b344  48ffcf                 dec rdi
0000000145b2b347  7431                   je 0x145b2b37a
0000000145b2b349  488b53e0               mov rdx, qword ptr [rbx - 0x20]
0000000145b2b34d  4885d2                 test rdx, rdx
0000000145b2b350  740f                   je 0x145b2b361
0000000145b2b352  488b4be8               mov rcx, qword ptr [rbx - 0x18]
0000000145b2b356  41b801000000           mov r8d, 1
0000000145b2b35c  e86f6e4dfa             call 0x1400021d0
0000000145b2b361  488b53f8               mov rdx, qword ptr [rbx - 8]
0000000145b2b365  4885d2                 test rdx, rdx
0000000145b2b368  74d6                   je 0x145b2b340
0000000145b2b36a  488b0b                 mov rcx, qword ptr [rbx]
0000000145b2b36d  41b801000000           mov r8d, 1
0000000145b2b373  e8586e4dfa             call 0x1400021d0
0000000145b2b378  ebc6                   jmp 0x145b2b340
0000000145b2b37a  488b4508               mov rax, qword ptr [rbp + 8]
0000000145b2b37e  4885c0                 test rax, rax
0000000145b2b381  7417                   je 0x145b2b39a
0000000145b2b383  488b4d10               mov rcx, qword ptr [rbp + 0x10]
0000000145b2b387  48c1e004               shl rax, 4
0000000145b2b38b  488d1440               lea rdx, [rax + rax*2]
0000000145b2b38f  41b808000000           mov r8d, 8
0000000145b2b395  e8366e4dfa             call 0x1400021d0
0000000145b2b39a  4889f0                 mov rax, rsi
0000000145b2b39d  4881c4e8000000         add rsp, 0xe8
0000000145b2b3a4  5b                     pop rbx
0000000145b2b3a5  5f                     pop rdi
0000000145b2b3a6  5e                     pop rsi
0000000145b2b3a7  415c                   pop r12
0000000145b2b3a9  415d                   pop r13
0000000145b2b3ab  415e                   pop r14
0000000145b2b3ad  415f                   pop r15
0000000145b2b3af  5d                     pop rbp
0000000145b2b3b0  c3                     ret
0000000145b2b3b1  4c8b7538               mov r14, qword ptr [rbp + 0x38]
0000000145b2b3b5  4c8b6540               mov r12, qword ptr [rbp + 0x40]
0000000145b2b3b9  4d39f4                 cmp r12, r14
0000000145b2b3bc  7350                   jae 0x145b2b40e
0000000145b2b3be  488b4530               mov rax, qword ptr [rbp + 0x30]
0000000145b2b3c2  48b90026000001000000   movabs rcx, 0x100002600
0000000145b2b3cc  0f1f4000               nop dword ptr [rax]
0000000145b2b3d0  420fb61420             movzx edx, byte ptr [rax + r12]
0000000145b2b3d5  4883fa20               cmp rdx, 0x20
0000000145b2b3d9  7713                   ja 0x145b2b3ee
0000000145b2b3db  480fa3d1               bt rcx, rdx
0000000145b2b3df  730d                   jae 0x145b2b3ee
0000000145b2b3e1  49ffc4                 inc r12
0000000145b2b3e4  4d39e6                 cmp r14, r12
0000000145b2b3e7  75e7                   jne 0x145b2b3d0
0000000145b2b3e9  4d89f4                 mov r12, r14
0000000145b2b3ec  eb20                   jmp 0x145b2b40e
0000000145b2b3ee  83fa7d                 cmp edx, 0x7d
0000000145b2b3f1  751b                   jne 0x145b2b40e
0000000145b2b3f3  488b4518               mov rax, qword ptr [rbp + 0x18]
0000000145b2b3f7  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b2b3fb  f30f6f4508             movdqu xmm0, xmmword ptr [rbp + 8]
0000000145b2b400  f30f7f4608             movdqu xmmword ptr [rsi + 8], xmm0
0000000145b2b405  48c70600000000         mov qword ptr [rsi], 0
0000000145b2b40c  eb8c                   jmp 0x145b2b39a
0000000145b2b40e  49bf0026000001000000   movabs r15, 0x100002600
0000000145b2b418  488d7dd8               lea rdi, [rbp - 0x28]
0000000145b2b41c  488d5d30               lea rbx, [rbp + 0x30]
0000000145b2b420  4d39f4                 cmp r12, r14
0000000145b2b423  7327                   jae 0x145b2b44c
0000000145b2b425  488b4530               mov rax, qword ptr [rbp + 0x30]
0000000145b2b429  0f1f8000000000         nop dword ptr [rax]
0000000145b2b430  420fb60c20             movzx ecx, byte ptr [rax + r12]
0000000145b2b435  4883f920               cmp rcx, 0x20
0000000145b2b439  7711                   ja 0x145b2b44c
0000000145b2b43b  490fa3cf               bt r15, rcx
0000000145b2b43f  730b                   jae 0x145b2b44c
0000000145b2b441  49ffc4                 inc r12
0000000145b2b444  4d39e6                 cmp r14, r12
0000000145b2b447  75e7                   jne 0x145b2b430
0000000145b2b449  4d89f4                 mov r12, r14
0000000145b2b44c  4c896540               mov qword ptr [rbp + 0x40], r12
0000000145b2b450  4889f9                 mov rcx, rdi
0000000145b2b453  4889da                 mov rdx, rbx
0000000145b2b456  e865c1ffff             call 0x145b275c0
0000000145b2b45b  90                     nop
0000000145b2b45c  488b45e0               mov rax, qword ptr [rbp - 0x20]
0000000145b2b460  48894550               mov qword ptr [rbp + 0x50], rax
0000000145b2b464  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145b2b468  48894548               mov qword ptr [rbp + 0x48], rax
0000000145b2b46c  4c8b75f0               mov r14, qword ptr [rbp - 0x10]
0000000145b2b470  837dd801               cmp dword ptr [rbp - 0x28], 1
0000000145b2b474  0f849f020000           je 0x145b2b719
0000000145b2b47a  488b4d38               mov rcx, qword ptr [rbp + 0x38]
0000000145b2b47e  488b4540               mov rax, qword ptr [rbp + 0x40]
0000000145b2b482  4839c8                 cmp rax, rcx
0000000145b2b485  7325                   jae 0x145b2b4ac
0000000145b2b487  488b5530               mov rdx, qword ptr [rbp + 0x30]
0000000145b2b48b  0f1f440000             nop dword ptr [rax + rax]
0000000145b2b490  440fb60402             movzx r8d, byte ptr [rdx + rax]
0000000145b2b495  4983f820               cmp r8, 0x20
0000000145b2b499  7711                   ja 0x145b2b4ac
0000000145b2b49b  4d0fa3c7               bt r15, r8
0000000145b2b49f  730b                   jae 0x145b2b4ac
0000000145b2b4a1  48ffc0                 inc rax
0000000145b2b4a4  4839c1                 cmp rcx, rax
0000000145b2b4a7  75e7                   jne 0x145b2b490
0000000145b2b4a9  4889c8                 mov rax, rcx
0000000145b2b4ac  48894540               mov qword ptr [rbp + 0x40], rax
0000000145b2b4b0  c6455f01               mov byte ptr [rbp + 0x5f], 1
0000000145b2b4b4  4889f9                 mov rcx, rdi
0000000145b2b4b7  4889da                 mov rdx, rbx
0000000145b2b4ba  41b03a                 mov r8b, 0x3a
0000000145b2b4bd  e8eebeffff             call 0x145b273b0
0000000145b2b4c2  90                     nop
0000000145b2b4c3  48837dd8ff             cmp qword ptr [rbp - 0x28], -1
0000000145b2b4c8  0f8564020000           jne 0x145b2b732
0000000145b2b4ce  488b4d38               mov rcx, qword ptr [rbp + 0x38]
0000000145b2b4d2  488b4540               mov rax, qword ptr [rbp + 0x40]
0000000145b2b4d6  4839c8                 cmp rax, rcx
0000000145b2b4d9  7321                   jae 0x145b2b4fc
0000000145b2b4db  488b5530               mov rdx, qword ptr [rbp + 0x30]
0000000145b2b4df  90                     nop
0000000145b2b4e0  440fb60402             movzx r8d, byte ptr [rdx + rax]
0000000145b2b4e5  4983f820               cmp r8, 0x20
0000000145b2b4e9  7711                   ja 0x145b2b4fc
0000000145b2b4eb  4d0fa3c7               bt r15, r8
0000000145b2b4ef  730b                   jae 0x145b2b4fc
0000000145b2b4f1  48ffc0                 inc rax
0000000145b2b4f4  4839c1                 cmp rcx, rax
0000000145b2b4f7  75e7                   jne 0x145b2b4e0
0000000145b2b4f9  4889c8                 mov rax, rcx
0000000145b2b4fc  48894540               mov qword ptr [rbp + 0x40], rax
0000000145b2b500  c6455f01               mov byte ptr [rbp + 0x5f], 1
0000000145b2b504  4889f9                 mov rcx, rdi
0000000145b2b507  4889da                 mov rdx, rbx
0000000145b2b50a  e8b1c0ffff             call 0x145b275c0
0000000145b2b50f  90                     nop
0000000145b2b510  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145b2b514  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145b2b518  48894528               mov qword ptr [rbp + 0x28], rax
0000000145b2b51c  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145b2b520  837dd801               cmp dword ptr [rbp - 0x28], 1
0000000145b2b524  0f8424020000           je 0x145b2b74e
0000000145b2b52a  48894d20               mov qword ptr [rbp + 0x20], rcx
0000000145b2b52e  4d85f6                 test r14, r14
0000000145b2b531  740c                   je 0x145b2b53f
0000000145b2b533  41b501                 mov r13b, 1
0000000145b2b536  488b4d48               mov rcx, qword ptr [rbp + 0x48]
0000000145b2b53a  80395f                 cmp byte ptr [rcx], 0x5f
0000000145b2b53d  7472                   je 0x145b2b5b1
0000000145b2b53f  488b4d50               mov rcx, qword ptr [rbp + 0x50]
0000000145b2b543  48894dd8               mov qword ptr [rbp - 0x28], rcx
0000000145b2b547  488b4d48               mov rcx, qword ptr [rbp + 0x48]
0000000145b2b54b  48894de0               mov qword ptr [rbp - 0x20], rcx
0000000145b2b54f  4c8975e8               mov qword ptr [rbp - 0x18], r14
0000000145b2b553  488b4d20               mov rcx, qword ptr [rbp + 0x20]
0000000145b2b557  48894df0               mov qword ptr [rbp - 0x10], rcx
0000000145b2b55b  488b4d28               mov rcx, qword ptr [rbp + 0x28]
0000000145b2b55f  48894df8               mov qword ptr [rbp - 8], rcx
0000000145b2b563  48894500               mov qword ptr [rbp], rax
0000000145b2b567  4c8b7518               mov r14, qword ptr [rbp + 0x18]
0000000145b2b56b  4c3b7508               cmp r14, qword ptr [rbp + 8]
0000000145b2b56f  750a                   jne 0x145b2b57b
0000000145b2b571  488d4d08               lea rcx, [rbp + 8]
0000000145b2b575  e866924600             call 0x145f947e0
0000000145b2b57a  90                     nop
0000000145b2b57b  488b4510               mov rax, qword ptr [rbp + 0x10]
0000000145b2b57f  4b8d0c76               lea rcx, [r14 + r14*2]
0000000145b2b583  48c1e104               shl rcx, 4
0000000145b2b587  f30f6f45d8             movdqu xmm0, xmmword ptr [rbp - 0x28]
0000000145b2b58c  f30f6f4de8             movdqu xmm1, xmmword ptr [rbp - 0x18]
0000000145b2b591  f30f6f55f8             movdqu xmm2, xmmword ptr [rbp - 8]
0000000145b2b596  f30f7f540820           movdqu xmmword ptr [rax + rcx + 0x20], xmm2
0000000145b2b59c  f30f7f4c0810           movdqu xmmword ptr [rax + rcx + 0x10], xmm1
0000000145b2b5a2  f30f7f0408             movdqu xmmword ptr [rax + rcx], xmm0
0000000145b2b5a7  49ffc6                 inc r14
0000000145b2b5aa  4c897518               mov qword ptr [rbp + 0x18], r14
0000000145b2b5ae  4531ed                 xor r13d, r13d
0000000145b2b5b1  488b4530               mov rax, qword ptr [rbp + 0x30]
0000000145b2b5b5  4c8b7538               mov r14, qword ptr [rbp + 0x38]
0000000145b2b5b9  4c8b6540               mov r12, qword ptr [rbp + 0x40]
0000000145b2b5bd  4d39f4                 cmp r12, r14
0000000145b2b5c0  0f8382000000           jae 0x145b2b648
0000000145b2b5c6  49ffc4                 inc r12
0000000145b2b5c9  4c89f1                 mov rcx, r14
0000000145b2b5cc  48f7d9                 neg rcx
0000000145b2b5cf  90                     nop
0000000145b2b5d0  420fb65420ff           movzx edx, byte ptr [rax + r12 - 1]
0000000145b2b5d6  4883fa20               cmp rdx, 0x20
0000000145b2b5da  7718                   ja 0x145b2b5f4
0000000145b2b5dc  490fa3d7               bt r15, rdx
0000000145b2b5e0  7312                   jae 0x145b2b5f4
0000000145b2b5e2  4a8d1421               lea rdx, [rcx + r12]
0000000145b2b5e6  48ffc2                 inc rdx
0000000145b2b5e9  49ffc4                 inc r12
0000000145b2b5ec  4883fa01               cmp rdx, 1
0000000145b2b5f0  75de                   jne 0x145b2b5d0
0000000145b2b5f2  eb51                   jmp 0x145b2b645
0000000145b2b5f4  4c896540               mov qword ptr [rbp + 0x40], r12
0000000145b2b5f8  83fa2c                 cmp edx, 0x2c
0000000145b2b5fb  0f8569010000           jne 0x145b2b76a
0000000145b2b601  4584ed                 test r13b, r13b
0000000145b2b604  0f8416feffff           je 0x145b2b420
0000000145b2b60a  488b5520               mov rdx, qword ptr [rbp + 0x20]
0000000145b2b60e  4885d2                 test rdx, rdx
0000000145b2b611  740f                   je 0x145b2b622
0000000145b2b613  41b801000000           mov r8d, 1
0000000145b2b619  488b4d28               mov rcx, qword ptr [rbp + 0x28]
0000000145b2b61d  e8ae6b4dfa             call 0x1400021d0
0000000145b2b622  48837d5000             cmp qword ptr [rbp + 0x50], 0
0000000145b2b627  0f84f3fdffff           je 0x145b2b420
0000000145b2b62d  41b801000000           mov r8d, 1
0000000145b2b633  488b4d48               mov rcx, qword ptr [rbp + 0x48]
0000000145b2b637  488b5550               mov rdx, qword ptr [rbp + 0x50]
0000000145b2b63b  e8906b4dfa             call 0x1400021d0
0000000145b2b640  e9dbfdffff             jmp 0x145b2b420
0000000145b2b645  4d89f4                 mov r12, r14
0000000145b2b648  49ffc4                 inc r12
0000000145b2b64b  4c896540               mov qword ptr [rbp + 0x40], r12
0000000145b2b64f  488d0d7a2a7b01         lea rcx, [rip + 0x17b2a7a]
0000000145b2b656  48894dc0               mov qword ptr [rbp - 0x40], rcx
0000000145b2b65a  48c745c80f000000       mov qword ptr [rbp - 0x38], 0xf
0000000145b2b662  4d39e6                 cmp r14, r12
0000000145b2b665  4d0f42e6               cmovb r12, r14
0000000145b2b669  4d85e4                 test r12, r12
0000000145b2b66c  740f                   je 0x145b2b67d
0000000145b2b66e  4983fc04               cmp r12, 4
0000000145b2b672  7310                   jae 0x145b2b684
0000000145b2b674  31c9                   xor ecx, ecx
0000000145b2b676  31d2                   xor edx, edx
0000000145b2b678  e93a010000             jmp 0x145b2b7b7
0000000145b2b67d  31d2                   xor edx, edx
0000000145b2b67f  e949010000             jmp 0x145b2b7cd
0000000145b2b684  4c89e1                 mov rcx, r12
0000000145b2b687  4883e1fc               and rcx, 0xfffffffffffffffc
0000000145b2b68b  660fefc0               pxor xmm0, xmm0
0000000145b2b68f  31d2                   xor edx, edx
0000000145b2b691  660f6f0d27798b00       movdqa xmm1, xmmword ptr [rip + 0x8b7927]
0000000145b2b699  660f6f1d6f876300       movdqa xmm3, xmmword ptr [rip + 0x63876f]
0000000145b2b6a1  660fefd2               pxor xmm2, xmm2
0000000145b2b6a5  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b2b6b0  440fb70410             movzx r8d, word ptr [rax + rdx]
0000000145b2b6b5  66410f6ee0             movd xmm4, r8d
0000000145b2b6ba  440fb7441002           movzx r8d, word ptr [rax + rdx + 2]
0000000145b2b6c0  66410f6ee8             movd xmm5, r8d
0000000145b2b6c5  660f74e1               pcmpeqb xmm4, xmm1
0000000145b2b6c9  660f60e4               punpcklbw xmm4, xmm4
0000000145b2b6cd  f20f70e4d4             pshuflw xmm4, xmm4, 0xd4
0000000145b2b6d2  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b2b6d7  660fdbe3               pand xmm4, xmm3
0000000145b2b6db  660fd4d4               paddq xmm2, xmm4
0000000145b2b6df  660f74e9               pcmpeqb xmm5, xmm1
0000000145b2b6e3  660f60ed               punpcklbw xmm5, xmm5
0000000145b2b6e7  f20f70e5d4             pshuflw xmm4, xmm5, 0xd4
0000000145b2b6ec  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b2b6f1  660fdbe3               pand xmm4, xmm3
0000000145b2b6f5  660fd4c4               paddq xmm0, xmm4
0000000145b2b6f9  4883c204               add rdx, 4
0000000145b2b6fd  4839d1                 cmp rcx, rdx
0000000145b2b700  75ae                   jne 0x145b2b6b0
0000000145b2b702  660fd4c2               paddq xmm0, xmm2
0000000145b2b706  660f70c8ee             pshufd xmm1, xmm0, 0xee
0000000145b2b70b  660fd4c8               paddq xmm1, xmm0
0000000145b2b70f  66480f7eca             movq rdx, xmm1
0000000145b2b714  e9af000000             jmp 0x145b2b7c8
0000000145b2b719  488b4550               mov rax, qword ptr [rbp + 0x50]
0000000145b2b71d  48894608               mov qword ptr [rsi + 8], rax
0000000145b2b721  488b4548               mov rax, qword ptr [rbp + 0x48]
0000000145b2b725  48894610               mov qword ptr [rsi + 0x10], rax
0000000145b2b729  4c897618               mov qword ptr [rsi + 0x18], r14
0000000145b2b72d  e9f0fbffff             jmp 0x145b2b322
0000000145b2b732  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145b2b736  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b2b73a  0f1045d8               movups xmm0, xmmword ptr [rbp - 0x28]
0000000145b2b73e  0f114608               movups xmmword ptr [rsi + 8], xmm0
0000000145b2b742  48c70601000000         mov qword ptr [rsi], 1
0000000145b2b749  e9fd000000             jmp 0x145b2b84b
0000000145b2b74e  48894e08               mov qword ptr [rsi + 8], rcx
0000000145b2b752  488b4d28               mov rcx, qword ptr [rbp + 0x28]
0000000145b2b756  48894e10               mov qword ptr [rsi + 0x10], rcx
0000000145b2b75a  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b2b75e  48c70601000000         mov qword ptr [rsi], 1
0000000145b2b765  e9e1000000             jmp 0x145b2b84b
0000000145b2b76a  83fa7d                 cmp edx, 0x7d
0000000145b2b76d  0f85dcfeffff           jne 0x145b2b64f
0000000145b2b773  4584ed                 test r13b, r13b
0000000145b2b776  0f8477fcffff           je 0x145b2b3f3
0000000145b2b77c  488b5520               mov rdx, qword ptr [rbp + 0x20]
0000000145b2b780  4885d2                 test rdx, rdx
0000000145b2b783  740f                   je 0x145b2b794
0000000145b2b785  41b801000000           mov r8d, 1
0000000145b2b78b  488b4d28               mov rcx, qword ptr [rbp + 0x28]
0000000145b2b78f  e83c6a4dfa             call 0x1400021d0
0000000145b2b794  48837d5000             cmp qword ptr [rbp + 0x50], 0
0000000145b2b799  0f8454fcffff           je 0x145b2b3f3
0000000145b2b79f  41b801000000           mov r8d, 1
0000000145b2b7a5  488b4d48               mov rcx, qword ptr [rbp + 0x48]
0000000145b2b7a9  488b5550               mov rdx, qword ptr [rbp + 0x50]
0000000145b2b7ad  e81e6a4dfa             call 0x1400021d0
0000000145b2b7b2  e93cfcffff             jmp 0x145b2b3f3
0000000145b2b7b7  4531c0                 xor r8d, r8d
0000000145b2b7ba  803c080a               cmp byte ptr [rax + rcx], 0xa
0000000145b2b7be  410f94c0               sete r8b
0000000145b2b7c2  4c01c2                 add rdx, r8
0000000145b2b7c5  48ffc1                 inc rcx
0000000145b2b7c8  4939cc                 cmp r12, rcx
0000000145b2b7cb  75ea                   jne 0x145b2b7b7
0000000145b2b7cd  48ffc2                 inc rdx
0000000145b2b7d0  488955d0               mov qword ptr [rbp - 0x30], rdx
0000000145b2b7d4  488d45d0               lea rax, [rbp - 0x30]
0000000145b2b7d8  488945d8               mov qword ptr [rbp - 0x28], rax
0000000145b2b7dc  488d05ede04400         lea rax, [rip + 0x44e0ed]
0000000145b2b7e3  488945e0               mov qword ptr [rbp - 0x20], rax
0000000145b2b7e7  488d45c0               lea rax, [rbp - 0x40]
0000000145b2b7eb  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145b2b7ef  488d05ca684dfa         lea rax, [rip - 0x5b29736]
0000000145b2b7f6  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b2b7fa  44886d5e               mov byte ptr [rbp + 0x5e], r13b
0000000145b2b7fe  488d152c277b01         lea rdx, [rip + 0x17b272c]
0000000145b2b805  488d4da8               lea rcx, [rbp - 0x58]
0000000145b2b809  4c8d45d8               lea r8, [rbp - 0x28]
0000000145b2b80d  e81eb74300             call 0x145f66f30
0000000145b2b812  90                     nop
0000000145b2b813  488b45b8               mov rax, qword ptr [rbp - 0x48]
0000000145b2b817  48894618               mov qword ptr [rsi + 0x18], rax
0000000145b2b81b  0f1045a8               movups xmm0, xmmword ptr [rbp - 0x58]
0000000145b2b81f  0f114608               movups xmmword ptr [rsi + 8], xmm0
0000000145b2b823  48c70601000000         mov qword ptr [rsi], 1
0000000145b2b82a  4584ed                 test r13b, r13b
0000000145b2b82d  0f84f6faffff           je 0x145b2b329
0000000145b2b833  488b5520               mov rdx, qword ptr [rbp + 0x20]
0000000145b2b837  4885d2                 test rdx, rdx
0000000145b2b83a  740f                   je 0x145b2b84b
0000000145b2b83c  41b801000000           mov r8d, 1
0000000145b2b842  488b4d28               mov rcx, qword ptr [rbp + 0x28]
0000000145b2b846  e885694dfa             call 0x1400021d0
0000000145b2b84b  48837d5000             cmp qword ptr [rbp + 0x50], 0
0000000145b2b850  0f84d3faffff           je 0x145b2b329
0000000145b2b856  41b801000000           mov r8d, 1
0000000145b2b85c  488b4d48               mov rcx, qword ptr [rbp + 0x48]
0000000145b2b860  488b5550               mov rdx, qword ptr [rbp + 0x50]
0000000145b2b864  e867694dfa             call 0x1400021d0
0000000145b2b869  e9bbfaffff             jmp 0x145b2b329
