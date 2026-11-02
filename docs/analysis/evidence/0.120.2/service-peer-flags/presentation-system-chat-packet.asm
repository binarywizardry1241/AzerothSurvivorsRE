; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145c3f980 55                             push rbp
0000000145c3f981 4157                           push r15
0000000145c3f983 4156                           push r14
0000000145c3f985 56                             push rsi
0000000145c3f986 57                             push rdi
0000000145c3f987 53                             push rbx
0000000145c3f988 4881ec98000000                 sub rsp, 0x98
0000000145c3f98f 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c3f997 48c74510feffffff               mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0000000145c3f99f 4c89c7                         mov rdi, r8
0000000145c3f9a2 4889d3                         mov rbx, rdx
0000000145c3f9a5 4889ce                         mov rsi, rcx
0000000145c3f9a8 e853283cfa                     call 0x140002200
0000000145c3f9ad b920000000                     mov ecx, 0x20
0000000145c3f9b2 ba01000000                     mov edx, 1
0000000145c3f9b7 e804283cfa                     call 0x1400021c0
0000000145c3f9bc 4885c0                         test rax, rax
0000000145c3f9bf 0f84ee010000                   je 0x145c3fbb3
0000000145c3f9c5 c6000a                         mov byte ptr [rax], 0xa
0000000145c3f9c8 48c745b020000000               mov qword ptr [rbp - 0x50], 0x20
0000000145c3f9d0 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145c3f9d4 66c745c89600                   mov word ptr [rbp - 0x38], 0x96
0000000145c3f9da c7400100000000                 mov dword ptr [rax + 1], 0
0000000145c3f9e1 48c745c005000000               mov qword ptr [rbp - 0x40], 5
0000000145c3f9e9 488b4db0                       mov rcx, qword ptr [rbp - 0x50]
0000000145c3f9ed 4883c1fb                       add rcx, -5
0000000145c3f9f1 b805000000                     mov eax, 5
0000000145c3f9f6 4883f907                       cmp rcx, 7
0000000145c3f9fa 0f8632010000                   jbe 0x145c3fb32
0000000145c3fa00 488b4db8                       mov rcx, qword ptr [rbp - 0x48]
0000000145c3fa04 48c7040100000000               mov qword ptr [rcx + rax], 0
0000000145c3fa0c 4883c008                       add rax, 8
0000000145c3fa10 488945c0                       mov qword ptr [rbp - 0x40], rax
0000000145c3fa14 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145c3fa18 48894500                       mov qword ptr [rbp], rax
0000000145c3fa1c 0fb745c8                       movzx eax, word ptr [rbp - 0x38]
0000000145c3fa20 66894508                       mov word ptr [rbp + 8], ax
0000000145c3fa24 8b45ca                         mov eax, dword ptr [rbp - 0x36]
0000000145c3fa27 89450a                         mov dword ptr [rbp + 0xa], eax
0000000145c3fa2a 0fb745ce                       movzx eax, word ptr [rbp - 0x32]
0000000145c3fa2e 6689450e                       mov word ptr [rbp + 0xe], ax
0000000145c3fa32 0f1045b0                       movups xmm0, xmmword ptr [rbp - 0x50]
0000000145c3fa36 0f2945f0                       movaps xmmword ptr [rbp - 0x10], xmm0
0000000145c3fa3a 488b5500                       mov rdx, qword ptr [rbp]
0000000145c3fa3e 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145c3fa42 4829d0                         sub rax, rdx
0000000145c3fa45 4883f803                       cmp rax, 3
0000000145c3fa49 0f8610010000                   jbe 0x145c3fb5f
0000000145c3fa4f 8d4701                         lea eax, [rdi + 1]
0000000145c3fa52 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145c3fa56 890411                         mov dword ptr [rcx + rdx], eax
0000000145c3fa59 4883c204                       add rdx, 4
0000000145c3fa5d 48895500                       mov qword ptr [rbp], rdx
0000000145c3fa61 0f2845f0                       movaps xmm0, xmmword ptr [rbp - 0x10]
0000000145c3fa65 0f2945d0                       movaps xmmword ptr [rbp - 0x30], xmm0
0000000145c3fa69 488b4500                       mov rax, qword ptr [rbp]
0000000145c3fa6d 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145c3fa71 488b4508                       mov rax, qword ptr [rbp + 8]
0000000145c3fa75 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145c3fa79 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145c3fa7d 4c8b7dd0                       mov r15, qword ptr [rbp - 0x30]
0000000145c3fa81 4c89f8                         mov rax, r15
0000000145c3fa84 4c29f0                         sub rax, r14
0000000145c3fa87 4839c7                         cmp rdi, rax
0000000145c3fa8a 0f87f7000000                   ja 0x145c3fb87
0000000145c3fa90 4885ff                         test rdi, rdi
0000000145c3fa93 7412                           je 0x145c3faa7
0000000145c3fa95 488b4dd8                       mov rcx, qword ptr [rbp - 0x28]
0000000145c3fa99 4c01f1                         add rcx, r14
0000000145c3fa9c 4889da                         mov rdx, rbx
0000000145c3fa9f 4989f8                         mov r8, rdi
0000000145c3faa2 e884b33600                     call 0x145faae2b
0000000145c3faa7 4901fe                         add r14, rdi
0000000145c3faaa 4c8975e0                       mov qword ptr [rbp - 0x20], r14
0000000145c3faae 4d39fe                         cmp r14, r15
0000000145c3fab1 750a                           jne 0x145c3fabd
0000000145c3fab3 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145c3fab7 e8e4245100                     call 0x146151fa0
0000000145c3fabc 90                             nop
0000000145c3fabd 488b45d8                       mov rax, qword ptr [rbp - 0x28]
0000000145c3fac1 42c6043000                     mov byte ptr [rax + r14], 0
0000000145c3fac6 49ffc6                         inc r14
0000000145c3fac9 4c8975e0                       mov qword ptr [rbp - 0x20], r14
0000000145c3facd 0f2845d0                       movaps xmm0, xmmword ptr [rbp - 0x30]
0000000145c3fad1 0f2945f0                       movaps xmmword ptr [rbp - 0x10], xmm0
0000000145c3fad5 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145c3fad9 48894500                       mov qword ptr [rbp], rax
0000000145c3fadd 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145c3fae1 48894508                       mov qword ptr [rbp + 8], rax
0000000145c3fae5 488b7d00                       mov rdi, qword ptr [rbp]
0000000145c3fae9 483b7df0                       cmp rdi, qword ptr [rbp - 0x10]
0000000145c3faed 750a                           jne 0x145c3faf9
0000000145c3faef 488d4df0                       lea rcx, [rbp - 0x10]
0000000145c3faf3 e8a8245100                     call 0x146151fa0
0000000145c3faf8 90                             nop
0000000145c3faf9 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145c3fafd c6043800                       mov byte ptr [rax + rdi], 0
0000000145c3fb01 48ffc7                         inc rdi
0000000145c3fb04 48897d00                       mov qword ptr [rbp], rdi
0000000145c3fb08 0f2845f0                       movaps xmm0, xmmword ptr [rbp - 0x10]
0000000145c3fb0c 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145c3fb0f 488b4500                       mov rax, qword ptr [rbp]
0000000145c3fb13 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145c3fb17 488b4508                       mov rax, qword ptr [rbp + 8]
0000000145c3fb1b 48894618                       mov qword ptr [rsi + 0x18], rax
0000000145c3fb1f 4889f0                         mov rax, rsi
0000000145c3fb22 4881c498000000                 add rsp, 0x98
0000000145c3fb29 5b                             pop rbx
0000000145c3fb2a 5f                             pop rdi
0000000145c3fb2b 5e                             pop rsi
0000000145c3fb2c 415e                           pop r14
0000000145c3fb2e 415f                           pop r15
0000000145c3fb30 5d                             pop rbp
0000000145c3fb31 c3                             ret
0000000145c3fb32 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145c3fb3b 488d4db0                       lea rcx, [rbp - 0x50]
0000000145c3fb3f ba05000000                     mov edx, 5
0000000145c3fb44 41b808000000                   mov r8d, 8
0000000145c3fb4a 41b901000000                   mov r9d, 1
0000000145c3fb50 e8ebb63600                     call 0x145fab240
0000000145c3fb55 90                             nop
0000000145c3fb56 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145c3fb5a e9a1feffff                     jmp 0x145c3fa00
0000000145c3fb5f 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145c3fb68 488d4df0                       lea rcx, [rbp - 0x10]
0000000145c3fb6c 41b804000000                   mov r8d, 4
0000000145c3fb72 41b901000000                   mov r9d, 1
0000000145c3fb78 e8c3b63600                     call 0x145fab240
0000000145c3fb7d 90                             nop
0000000145c3fb7e 488b5500                       mov rdx, qword ptr [rbp]
0000000145c3fb82 e9c8feffff                     jmp 0x145c3fa4f
0000000145c3fb87 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145c3fb90 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145c3fb94 41b901000000                   mov r9d, 1
0000000145c3fb9a 4c89f2                         mov rdx, r14
0000000145c3fb9d 4989f8                         mov r8, rdi
0000000145c3fba0 e89bb63600                     call 0x145fab240
0000000145c3fba5 90                             nop
0000000145c3fba6 4c8b7dd0                       mov r15, qword ptr [rbp - 0x30]
0000000145c3fbaa 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145c3fbae e9e2feffff                     jmp 0x145c3fa95
0000000145c3fbb3 b901000000                     mov ecx, 1
0000000145c3fbb8 ba20000000                     mov edx, 0x20
0000000145c3fbbd e8e9245100                     call 0x1461520ab
0000000145c3fbc2 0f0b                           ud2
