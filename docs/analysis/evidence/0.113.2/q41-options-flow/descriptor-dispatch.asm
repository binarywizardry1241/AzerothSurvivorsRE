00000001401a6770: 55                             push rbp
00000001401a6771: 4157                           push r15
00000001401a6773: 4156                           push r14
00000001401a6775: 4155                           push r13
00000001401a6777: 4154                           push r12
00000001401a6779: 56                             push rsi
00000001401a677a: 57                             push rdi
00000001401a677b: 53                             push rbx
00000001401a677c: 4881eca8000000                 sub rsp, 0xa8
00000001401a6783: 488dac2480000000               lea rbp, [rsp + 0x80]
00000001401a678b: 0f297510                       movaps xmmword ptr [rbp + 0x10], xmm6
00000001401a678f: 48c74508feffffff               mov qword ptr [rbp + 8], 0xfffffffffffffffe
00000001401a6797: 4c8945b0                       mov qword ptr [rbp - 0x50], r8
00000001401a679b: 4c894db8                       mov qword ptr [rbp - 0x48], r9
00000001401a679f: 4883fa68                       cmp rdx, 0x68
00000001401a67a3: 0f8719050000                   ja 0x1401a6cc2
00000001401a67a9: 4d89cd                         mov r13, r9
00000001401a67ac: 4d89c6                         mov r14, r8
00000001401a67af: 4889ce                         mov rsi, rcx
00000001401a67b2: 4869c298000000                 imul rax, rdx, 0x98
00000001401a67b9: 488d0df037d405                 lea rcx, [rip + 0x5d437f0]
00000001401a67c0: 4c8d3c01                       lea r15, [rcx + rax]
00000001401a67c4: 488b440818                     mov rax, qword ptr [rax + rcx + 0x18]
00000001401a67c9: 488d0dd88dd405                 lea rcx, [rip + 0x5d48dd8]
00000001401a67d0: 48630481                       movsxd rax, dword ptr [rcx + rax*4]
00000001401a67d4: 4801c8                         add rax, rcx
00000001401a67d7: ffe0                           jmp rax
