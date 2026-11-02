; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b22c10 55                             push rbp
0000000145b22c11 4157                           push r15
0000000145b22c13 4156                           push r14
0000000145b22c15 4155                           push r13
0000000145b22c17 4154                           push r12
0000000145b22c19 56                             push rsi
0000000145b22c1a 57                             push rdi
0000000145b22c1b 53                             push rbx
0000000145b22c1c 4881eca8000000                 sub rsp, 0xa8
0000000145b22c23 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b22c2b 48c74520feffffff               mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
0000000145b22c33 4c89cf                         mov rdi, r9
0000000145b22c36 4d89c6                         mov r14, r8
0000000145b22c39 4889d3                         mov rbx, rdx
0000000145b22c3c 4889ce                         mov rsi, rcx
0000000145b22c3f 488b81b80c0000                 mov rax, qword ptr [rcx + 0xcb8]
0000000145b22c46 4883e802                       sub rax, 2
0000000145b22c4a 41bc02000000                   mov r12d, 2
0000000145b22c50 4c0f43e0                       cmovae r12, rax
0000000145b22c54 4d85e4                         test r12, r12
0000000145b22c57 7419                           je 0x145b22c72
0000000145b22c59 4983fc01                       cmp r12, 1
0000000145b22c5d 7521                           jne 0x145b22c80
0000000145b22c5f 488d05a5ce7c01                 lea rax, [rip + 0x17ccea5]
0000000145b22c66 48894518                       mov qword ptr [rbp + 0x18], rax
0000000145b22c6a 41bd04000000                   mov r13d, 4
0000000145b22c70 eb1f                           jmp 0x145b22c91
0000000145b22c72 b801000000                     mov eax, 1
0000000145b22c77 48894518                       mov qword ptr [rbp + 0x18], rax
0000000145b22c7b 4d89e5                         mov r13, r12
0000000145b22c7e eb11                           jmp 0x145b22c91
0000000145b22c80 488d0588ce7c01                 lea rax, [rip + 0x17cce88]
0000000145b22c87 48894518                       mov qword ptr [rbp + 0x18], rax
0000000145b22c8b 41bd05000000                   mov r13d, 5
0000000145b22c91 e86af54dfa                     call 0x140002200
0000000145b22c96 b901000000                     mov ecx, 1
0000000145b22c9b ba01000000                     mov edx, 1
0000000145b22ca0 e81bf54dfa                     call 0x1400021c0
0000000145b22ca5 4885c0                         test rax, rax
0000000145b22ca8 0f840a030000                   je 0x145b22fb8
0000000145b22cae c6007b                         mov byte ptr [rax], 0x7b
0000000145b22cb1 48c745d001000000               mov qword ptr [rbp - 0x30], 1
0000000145b22cb9 488945d8                       mov qword ptr [rbp - 0x28], rax
0000000145b22cbd 48c745e001000000               mov qword ptr [rbp - 0x20], 1
0000000145b22cc5 c645e801                       mov byte ptr [rbp - 0x18], 1
0000000145b22cc9 488d0544ce7c01                 lea rax, [rip + 0x17cce44]
0000000145b22cd0 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b22cd5 48c744242804000000             mov qword ptr [rsp + 0x28], 4
0000000145b22cde 4c8d0516c27c01                 lea r8, [rip + 0x17cc216]
0000000145b22ce5 4c8d7df0                       lea r15, [rbp - 0x10]
0000000145b22ce9 488d55d0                       lea rdx, [rbp - 0x30]
0000000145b22ced 41b904000000                   mov r9d, 4
0000000145b22cf3 4c89f9                         mov rcx, r15
0000000145b22cf6 e8f5edf7ff                     call 0x145aa1af0
0000000145b22cfb 4c89742428                     mov qword ptr [rsp + 0x28], r14
0000000145b22d00 48895c2420                     mov qword ptr [rsp + 0x20], rbx
0000000145b22d05 4c8d050cce7c01                 lea r8, [rip + 0x17cce0c]
0000000145b22d0c 488d5dd0                       lea rbx, [rbp - 0x30]
0000000145b22d10 41b905000000                   mov r9d, 5
0000000145b22d16 4889d9                         mov rcx, rbx
0000000145b22d19 4c89fa                         mov rdx, r15
0000000145b22d1c e8cfedf7ff                     call 0x145aa1af0
0000000145b22d21 488b8590000000                 mov rax, qword ptr [rbp + 0x90]
0000000145b22d28 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000145b22d2d 48897c2420                     mov qword ptr [rsp + 0x20], rdi
0000000145b22d32 4c8d05e4cd7c01                 lea r8, [rip + 0x17ccde4]
0000000145b22d39 488d7df0                       lea rdi, [rbp - 0x10]
0000000145b22d3d 41b903000000                   mov r9d, 3
0000000145b22d43 4889f9                         mov rcx, rdi
0000000145b22d46 4889da                         mov rdx, rbx
0000000145b22d49 e8a2edf7ff                     call 0x145aa1af0
0000000145b22d4e 4c896c2428                     mov qword ptr [rsp + 0x28], r13
0000000145b22d53 488b4518                       mov rax, qword ptr [rbp + 0x18]
0000000145b22d57 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b22d5c 4c8d05bdcd7c01                 lea r8, [rip + 0x17ccdbd]
0000000145b22d63 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145b22d67 41b904000000                   mov r9d, 4
0000000145b22d6d 4889fa                         mov rdx, rdi
0000000145b22d70 e87bedf7ff                     call 0x145aa1af0
0000000145b22d75 488bbe70160000                 mov rdi, qword ptr [rsi + 0x1670]
0000000145b22d7c 4883ffff                       cmp rdi, -1
0000000145b22d80 7425                           je 0x145b22da7
0000000145b22d82 4883bea0160000ff               cmp qword ptr [rsi + 0x16a0], -1
0000000145b22d8a 741b                           je 0x145b22da7
0000000145b22d8c 488d96a0160000                 lea rdx, [rsi + 0x16a0]
0000000145b22d93 488d4db8                       lea rcx, [rbp - 0x48]
0000000145b22d97 e8a4b24500                     call 0x145f7e040
0000000145b22d9c 90                             nop
0000000145b22d9d 488b4dc0                       mov rcx, qword ptr [rbp - 0x40]
0000000145b22da1 488b45c8                       mov rax, qword ptr [rbp - 0x38]
0000000145b22da5 eb0f                           jmp 0x145b22db6
0000000145b22da7 48c745b800000000               mov qword ptr [rbp - 0x48], 0
0000000145b22daf b901000000                     mov ecx, 1
0000000145b22db4 31c0                           xor eax, eax
0000000145b22db6 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000145b22dbb 48894d10                       mov qword ptr [rbp + 0x10], rcx
0000000145b22dbf 48894c2420                     mov qword ptr [rsp + 0x20], rcx
0000000145b22dc4 4c8d0559cd7c01                 lea r8, [rip + 0x17ccd59]
0000000145b22dcb 488d4df0                       lea rcx, [rbp - 0x10]
0000000145b22dcf 488d55d0                       lea rdx, [rbp - 0x30]
0000000145b22dd3 41b904000000                   mov r9d, 4
0000000145b22dd9 e812edf7ff                     call 0x145aa1af0
0000000145b22dde 90                             nop
0000000145b22ddf 4d85e4                         test r12, r12
0000000145b22de2 742c                           je 0x145b22e10
0000000145b22de4 4983fc01                       cmp r12, 1
0000000145b22de8 7530                           jne 0x145b22e1a
0000000145b22dea 4c8b86f80c0000                 mov r8, qword ptr [rsi + 0xcf8]
0000000145b22df1 4d85c0                         test r8, r8
0000000145b22df4 7430                           je 0x145b22e26
0000000145b22df6 488b96f00c0000                 mov rdx, qword ptr [rsi + 0xcf0]
0000000145b22dfd 4489c1                         mov ecx, r8d
0000000145b22e00 83e103                         and ecx, 3
0000000145b22e03 4983f804                       cmp r8, 4
0000000145b22e07 7324                           jae 0x145b22e2d
0000000145b22e09 4531c9                         xor r9d, r9d
0000000145b22e0c 31c0                           xor eax, eax
0000000145b22e0e eb6d                           jmp 0x145b22e7d
0000000145b22e10 b801000000                     mov eax, 1
0000000145b22e15 e99d000000                     jmp 0x145b22eb7
0000000145b22e1a 0fb686e80f0000                 movzx eax, byte ptr [rsi + 0xfe8]
0000000145b22e21 e98e000000                     jmp 0x145b22eb4
0000000145b22e26 31c0                           xor eax, eax
0000000145b22e28 e987000000                     jmp 0x145b22eb4
0000000145b22e2d 4983e0fc                       and r8, 0xfffffffffffffffc
0000000145b22e31 4c8d92f8110000                 lea r10, [rdx + 0x11f8]
0000000145b22e38 4531c9                         xor r9d, r9d
0000000145b22e3b 31c0                           xor eax, eax
0000000145b22e3d 0f1f00                         nop dword ptr [rax]
0000000145b22e40 450fb69a80f2ffff               movzx r11d, byte ptr [r10 - 0xd80]
0000000145b22e48 4901c3                         add r11, rax
0000000145b22e4b 410fb68200f7ffff               movzx eax, byte ptr [r10 - 0x900]
0000000145b22e53 410fb69a80fbffff               movzx ebx, byte ptr [r10 - 0x480]
0000000145b22e5b 4801c3                         add rbx, rax
0000000145b22e5e 4c01db                         add rbx, r11
0000000145b22e61 410fb602                       movzx eax, byte ptr [r10]
0000000145b22e65 4801d8                         add rax, rbx
0000000145b22e68 4983c104                       add r9, 4
0000000145b22e6c 4981c200120000                 add r10, 0x1200
0000000145b22e73 4d39c8                         cmp r8, r9
0000000145b22e76 75c8                           jne 0x145b22e40
0000000145b22e78 4885c9                         test rcx, rcx
0000000145b22e7b 7437                           je 0x145b22eb4
0000000145b22e7d 4f8d04c9                       lea r8, [r9 + r9*8]
0000000145b22e81 49c1e007                       shl r8, 7
0000000145b22e85 4c01c2                         add rdx, r8
0000000145b22e88 4881c278040000                 add rdx, 0x478
0000000145b22e8f c1e107                         shl ecx, 7
0000000145b22e92 488d0cc9                       lea rcx, [rcx + rcx*8]
0000000145b22e96 4531c0                         xor r8d, r8d
0000000145b22e99 0f1f8000000000                 nop dword ptr [rax]
0000000145b22ea0 460fb60c02                     movzx r9d, byte ptr [rdx + r8]
0000000145b22ea5 4c01c8                         add rax, r9
0000000145b22ea8 4981c080040000                 add r8, 0x480
0000000145b22eaf 4c39c1                         cmp rcx, r8
0000000145b22eb2 75ec                           jne 0x145b22ea0
0000000145b22eb4 48ffc0                         inc rax
0000000145b22eb7 89442420                       mov dword ptr [rsp + 0x20], eax
0000000145b22ebb 4c8d0566cc7c01                 lea r8, [rip + 0x17ccc66]
0000000145b22ec2 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145b22ec6 488d55f0                       lea rdx, [rbp - 0x10]
0000000145b22eca 41b904000000                   mov r9d, 4
0000000145b22ed0 e8bbaaf7ff                     call 0x145a9d990
0000000145b22ed5 90                             nop
0000000145b22ed6 0fb686b1170000                 movzx eax, byte ptr [rsi + 0x17b1]
0000000145b22edd 3c05                           cmp al, 5
0000000145b22edf b905000000                     mov ecx, 5
0000000145b22ee4 0f43c1                         cmovae eax, ecx
0000000145b22ee7 4883ffff                       cmp rdi, -1
0000000145b22eeb 0fb6c0                         movzx eax, al
0000000145b22eee 0f44c1                         cmove eax, ecx
0000000145b22ef1 89442420                       mov dword ptr [rsp + 0x20], eax
0000000145b22ef5 4c8d0530cc7c01                 lea r8, [rip + 0x17ccc30]
0000000145b22efc 488d4df0                       lea rcx, [rbp - 0x10]
0000000145b22f00 488d55d0                       lea rdx, [rbp - 0x30]
0000000145b22f04 41b903000000                   mov r9d, 3
0000000145b22f0a e881aaf7ff                     call 0x145a9d990
0000000145b22f0f 90                             nop
0000000145b22f10 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b22f14 488b7d00                       mov rdi, qword ptr [rbp]
0000000145b22f18 4839f8                         cmp rax, rdi
0000000145b22f1b 7470                           je 0x145b22f8d
0000000145b22f1d 48894518                       mov qword ptr [rbp + 0x18], rax
0000000145b22f21 488b5df8                       mov rbx, qword ptr [rbp - 8]
0000000145b22f25 c6043b7d                       mov byte ptr [rbx + rdi], 0x7d
0000000145b22f29 48ffc7                         inc rdi
0000000145b22f2c 488b55b8                       mov rdx, qword ptr [rbp - 0x48]
0000000145b22f30 4885d2                         test rdx, rdx
0000000145b22f33 740f                           je 0x145b22f44
0000000145b22f35 41b801000000                   mov r8d, 1
0000000145b22f3b 488b4d10                       mov rcx, qword ptr [rbp + 0x10]
0000000145b22f3f e88cf24dfa                     call 0x1400021d0
0000000145b22f44 488b8ed0170000                 mov rcx, qword ptr [rsi + 0x17d0]
0000000145b22f4b 488b86d8170000                 mov rax, qword ptr [rsi + 0x17d8]
0000000145b22f52 48895d10                       mov qword ptr [rbp + 0x10], rbx
0000000145b22f56 4889da                         mov rdx, rbx
0000000145b22f59 4989f8                         mov r8, rdi
0000000145b22f5c ff5018                         call qword ptr [rax + 0x18]
0000000145b22f5f 90                             nop
0000000145b22f60 488b5518                       mov rdx, qword ptr [rbp + 0x18]
0000000145b22f64 4885d2                         test rdx, rdx
0000000145b22f67 7410                           je 0x145b22f79
0000000145b22f69 41b801000000                   mov r8d, 1
0000000145b22f6f 488b4d10                       mov rcx, qword ptr [rbp + 0x10]
0000000145b22f73 e858f24dfa                     call 0x1400021d0
0000000145b22f78 90                             nop
0000000145b22f79 4881c4a8000000                 add rsp, 0xa8
0000000145b22f80 5b                             pop rbx
0000000145b22f81 5f                             pop rdi
0000000145b22f82 5e                             pop rsi
0000000145b22f83 415c                           pop r12
0000000145b22f85 415d                           pop r13
0000000145b22f87 415e                           pop r14
0000000145b22f89 415f                           pop r15
0000000145b22f8b 5d                             pop rbp
0000000145b22f8c c3                             ret
0000000145b22f8d 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b22f96 488d4df0                       lea rcx, [rbp - 0x10]
0000000145b22f9a 41b801000000                   mov r8d, 1
0000000145b22fa0 41b901000000                   mov r9d, 1
0000000145b22fa6 4889fa                         mov rdx, rdi
0000000145b22fa9 e892824800                     call 0x145fab240
0000000145b22fae 90                             nop
0000000145b22faf 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b22fb3 e965ffffff                     jmp 0x145b22f1d
0000000145b22fb8 b901000000                     mov ecx, 1
0000000145b22fbd ba01000000                     mov edx, 1
0000000145b22fc2 e8e4f06200                     call 0x1461520ab
0000000145b22fc7 0f0b                           ud2
