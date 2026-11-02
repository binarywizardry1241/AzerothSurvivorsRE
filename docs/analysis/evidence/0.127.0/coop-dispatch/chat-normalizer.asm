0000000145b53c70 55                             push rbp
0000000145b53c71 4157                           push r15
0000000145b53c73 4156                           push r14
0000000145b53c75 4155                           push r13
0000000145b53c77 4154                           push r12
0000000145b53c79 56                             push rsi
0000000145b53c7a 57                             push rdi
0000000145b53c7b 53                             push rbx
0000000145b53c7c 4881ecb8000000                 sub rsp, 0xb8
0000000145b53c83 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b53c8b 48c74530feffffff               mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
0000000145b53c93 4889ce                         mov rsi, rcx
0000000145b53c96 4a8d0402                       lea rax, [rdx + r8]
0000000145b53c9a 48c745a800000000               mov qword ptr [rbp - 0x58], 0
0000000145b53ca2 4c8945b0                       mov qword ptr [rbp - 0x50], r8
0000000145b53ca6 488955b8                       mov qword ptr [rbp - 0x48], rdx
0000000145b53caa 4c8945c0                       mov qword ptr [rbp - 0x40], r8
0000000145b53cae 488955c8                       mov qword ptr [rbp - 0x38], rdx
0000000145b53cb2 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145b53cb6 48c745d800000000               mov qword ptr [rbp - 0x28], 0
0000000145b53cbe 66c745e00100                   mov word ptr [rbp - 0x20], 1
0000000145b53cc4 488d4de8                       lea rcx, [rbp - 0x18]
0000000145b53cc8 488d55a8                       lea rdx, [rbp - 0x58]
0000000145b53ccc e86ff41900                     call 0x145cf3140
0000000145b53cd1 488b55f0                       mov rdx, qword ptr [rbp - 0x10]
0000000145b53cd5 4c8b45f8                       mov r8, qword ptr [rbp - 8]
0000000145b53cd9 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b53ce2 4c8d0dc7d24f01                 lea r9, [rip + 0x14fd2c7]
0000000145b53ce9 488d4d18                       lea rcx, [rbp + 0x18]
0000000145b53ced 48895500                       mov qword ptr [rbp], rdx
0000000145b53cf1 e8cad11400                     call 0x145ca0ec0
0000000145b53cf6 90                             nop 
0000000145b53cf7 488b4518                       mov rax, qword ptr [rbp + 0x18]
0000000145b53cfb 48894510                       mov qword ptr [rbp + 0x10], rax
0000000145b53cff 488b4520                       mov rax, qword ptr [rbp + 0x20]
0000000145b53d03 48894508                       mov qword ptr [rbp + 8], rax
0000000145b53d07 4c8b7528                       mov r14, qword ptr [rbp + 0x28]
0000000145b53d0b 488b55e8                       mov rdx, qword ptr [rbp - 0x18]
0000000145b53d0f 4885d2                         test rdx, rdx
0000000145b53d12 7413                           je 0x145b53d27
0000000145b53d14 48c1e204                       shl rdx, 4
0000000145b53d18 41b808000000                   mov r8d, 8
0000000145b53d1e 488b4d00                       mov rcx, qword ptr [rbp]
0000000145b53d22 e8a9e44afa                     call 0x1400021d0
0000000145b53d27 48c7451800000000               mov qword ptr [rbp + 0x18], 0
0000000145b53d2f 48c7452001000000               mov qword ptr [rbp + 0x20], 1
0000000145b53d37 48c7452800000000               mov qword ptr [rbp + 0x28], 0
0000000145b53d3f 4d85f6                         test r14, r14
0000000145b53d42 0f852d020000                   jne 0x145b53f75
0000000145b53d48 4c8b6d08                       mov r13, qword ptr [rbp + 8]
0000000145b53d4c 4d01ee                         add r14, r13
0000000145b53d4f 41bfa0000000                   mov r15d, 0xa0
0000000145b53d55 488d4d18                       lea rcx, [rbp + 0x18]
0000000145b53d59 41bc02000000                   mov r12d, 2
0000000145b53d5f eb32                           jmp 0x145b53d93
0000000145b53d61 4180c9c0                       or r9b, 0xc0
0000000145b53d65 44880c1a                       mov byte ptr [rdx + rbx], r9b
0000000145b53d69 88441a01                       mov byte ptr [rdx + rbx + 1], al
0000000145b53d6d b802000000                     mov eax, 2
0000000145b53d72 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b53d80 4801c3                         add rbx, rax
0000000145b53d83 49ffcf                         dec r15
0000000145b53d86 48895d28                       mov qword ptr [rbp + 0x28], rbx
0000000145b53d8a 4d85ff                         test r15, r15
0000000145b53d8d 0f84a4010000                   je 0x145b53f37
0000000145b53d93 4d39f5                         cmp r13, r14
0000000145b53d96 0f849b010000                   je 0x145b53f37
0000000145b53d9c 450fb64500                     movzx r8d, byte ptr [r13]
0000000145b53da1 410fb6c0                       movzx eax, r8b
0000000145b53da5 84c0                           test al, al
0000000145b53da7 7817                           js 0x145b53dc0
0000000145b53da9 49ffc5                         inc r13
0000000145b53dac 488b5518                       mov rdx, qword ptr [rbp + 0x18]
0000000145b53db0 488b5d28                       mov rbx, qword ptr [rbp + 0x28]
0000000145b53db4 89c7                           mov edi, eax
0000000145b53db6 eb68                           jmp 0x145b53e20
0000000145b53db8 0f1f840000000000               nop dword ptr [rax + rax]
0000000145b53dc0 89c7                           mov edi, eax
0000000145b53dc2 83e71f                         and edi, 0x1f
0000000145b53dc5 410fb65501                     movzx edx, byte ptr [r13 + 1]
0000000145b53dca 83e23f                         and edx, 0x3f
0000000145b53dcd 3cdf                           cmp al, 0xdf
0000000145b53dcf 762c                           jbe 0x145b53dfd
0000000145b53dd1 410fb64502                     movzx eax, byte ptr [r13 + 2]
0000000145b53dd6 c1e206                         shl edx, 6
0000000145b53dd9 83e03f                         and eax, 0x3f
0000000145b53ddc 09d0                           or eax, edx
0000000145b53dde 4180f8f0                       cmp r8b, 0xf0
0000000145b53de2 7257                           jb 0x145b53e3b
0000000145b53de4 410fb65503                     movzx edx, byte ptr [r13 + 3]
0000000145b53de9 4983c504                       add r13, 4
0000000145b53ded 83e707                         and edi, 7
0000000145b53df0 c1e712                         shl edi, 0x12
0000000145b53df3 c1e006                         shl eax, 6
0000000145b53df6 83e23f                         and edx, 0x3f
0000000145b53df9 09c2                           or edx, eax
0000000145b53dfb eb07                           jmp 0x145b53e04
0000000145b53dfd 4983c502                       add r13, 2
0000000145b53e01 c1e706                         shl edi, 6
0000000145b53e04 09d7                           or edi, edx
0000000145b53e06 488b5518                       mov rdx, qword ptr [rbp + 0x18]
0000000145b53e0a 488b5d28                       mov rbx, qword ptr [rbp + 0x28]
0000000145b53e0e 81ff80000000                   cmp edi, 0x80
0000000145b53e14 733e                           jae 0x145b53e54
0000000145b53e16 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b53e20 4839da                         cmp rdx, rbx
0000000145b53e23 0f84cb000000                   je 0x145b53ef4
0000000145b53e29 488b4520                       mov rax, qword ptr [rbp + 0x20]
0000000145b53e2d 40883c18                       mov byte ptr [rax + rbx], dil
0000000145b53e31 b801000000                     mov eax, 1
0000000145b53e36 e945ffffff                     jmp 0x145b53d80
0000000145b53e3b 4983c503                       add r13, 3
0000000145b53e3f c1e70c                         shl edi, 0xc
0000000145b53e42 09c7                           or edi, eax
0000000145b53e44 488b5518                       mov rdx, qword ptr [rbp + 0x18]
0000000145b53e48 488b5d28                       mov rbx, qword ptr [rbp + 0x28]
0000000145b53e4c 81ff80000000                   cmp edi, 0x80
0000000145b53e52 72cc                           jb 0x145b53e20
0000000145b53e54 81ff00000100                   cmp edi, 0x10000
0000000145b53e5a 41b804000000                   mov r8d, 4
0000000145b53e60 4983d800                       sbb r8, 0
0000000145b53e64 81ff00080000                   cmp edi, 0x800
0000000145b53e6a 4d0f42c4                       cmovb r8, r12
0000000145b53e6e 4829da                         sub rdx, rbx
0000000145b53e71 4939d0                         cmp r8, rdx
0000000145b53e74 0f879d000000                   ja 0x145b53f17
0000000145b53e7a 89f8                           mov eax, edi
0000000145b53e7c 243f                           and al, 0x3f
0000000145b53e7e 0c80                           or al, 0x80
0000000145b53e80 4189f9                         mov r9d, edi
0000000145b53e83 41c1e906                       shr r9d, 6
0000000145b53e87 488b5520                       mov rdx, qword ptr [rbp + 0x20]
0000000145b53e8b 81ff00080000                   cmp edi, 0x800
0000000145b53e91 0f82cafeffff                   jb 0x145b53d61
0000000145b53e97 4180e13f                       and r9b, 0x3f
0000000145b53e9b 4180c980                       or r9b, 0x80
0000000145b53e9f 4189f8                         mov r8d, edi
0000000145b53ea2 41c1e80c                       shr r8d, 0xc
0000000145b53ea6 81ffffff0000                   cmp edi, 0xffff
0000000145b53eac 771b                           ja 0x145b53ec9
0000000145b53eae 4180c8e0                       or r8b, 0xe0
0000000145b53eb2 4488041a                       mov byte ptr [rdx + rbx], r8b
0000000145b53eb6 44884c1a01                     mov byte ptr [rdx + rbx + 1], r9b
0000000145b53ebb 88441a02                       mov byte ptr [rdx + rbx + 2], al
0000000145b53ebf b803000000                     mov eax, 3
0000000145b53ec4 e9b7feffff                     jmp 0x145b53d80
0000000145b53ec9 4180e03f                       and r8b, 0x3f
0000000145b53ecd 4180c880                       or r8b, 0x80
0000000145b53ed1 c1ef12                         shr edi, 0x12
0000000145b53ed4 4080cff0                       or dil, 0xf0
0000000145b53ed8 40883c1a                       mov byte ptr [rdx + rbx], dil
0000000145b53edc 4488441a01                     mov byte ptr [rdx + rbx + 1], r8b
0000000145b53ee1 44884c1a02                     mov byte ptr [rdx + rbx + 2], r9b
0000000145b53ee6 88441a03                       mov byte ptr [rdx + rbx + 3], al
0000000145b53eea b804000000                     mov eax, 4
0000000145b53eef e98cfeffff                     jmp 0x145b53d80
0000000145b53ef4 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b53efd 41b801000000                   mov r8d, 1
0000000145b53f03 41b901000000                   mov r9d, 1
0000000145b53f09 e822dc5000                     call 0x146061b30
0000000145b53f0e 488d4d18                       lea rcx, [rbp + 0x18]
0000000145b53f12 e912ffffff                     jmp 0x145b53e29
0000000145b53f17 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b53f20 41b901000000                   mov r9d, 1
0000000145b53f26 4889da                         mov rdx, rbx
0000000145b53f29 e802dc5000                     call 0x146061b30
0000000145b53f2e 488d4d18                       lea rcx, [rbp + 0x18]
0000000145b53f32 e943ffffff                     jmp 0x145b53e7a
0000000145b53f37 488b4528                       mov rax, qword ptr [rbp + 0x28]
0000000145b53f3b 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145b53f3f 0f104518                       movups xmm0, xmmword ptr [rbp + 0x18]
0000000145b53f43 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145b53f46 488b5510                       mov rdx, qword ptr [rbp + 0x10]
0000000145b53f4a 4885d2                         test rdx, rdx
0000000145b53f4d 740f                           je 0x145b53f5e
0000000145b53f4f 41b801000000                   mov r8d, 1
0000000145b53f55 488b4d08                       mov rcx, qword ptr [rbp + 8]
0000000145b53f59 e872e24afa                     call 0x1400021d0
0000000145b53f5e 4889f0                         mov rax, rsi
0000000145b53f61 4881c4b8000000                 add rsp, 0xb8
0000000145b53f68 5b                             pop rbx
0000000145b53f69 5f                             pop rdi
0000000145b53f6a 5e                             pop rsi
0000000145b53f6b 415c                           pop r12
0000000145b53f6d 415d                           pop r13
0000000145b53f6f 415e                           pop r14
0000000145b53f71 415f                           pop r15
0000000145b53f73 5d                             pop rbp
0000000145b53f74 c3                             ret 
0000000145b53f75 4c89f0                         mov rax, r14
0000000145b53f78 48c1e802                       shr rax, 2
0000000145b53f7c 4489f1                         mov ecx, r14d
0000000145b53f7f 83e103                         and ecx, 3
0000000145b53f82 4883f901                       cmp rcx, 1
0000000145b53f86 4883d8ff                       sbb rax, -1
0000000145b53f8a 483da0000000                   cmp rax, 0xa0
0000000145b53f90 41b8a0000000                   mov r8d, 0xa0
0000000145b53f96 4c0f42c0                       cmovb r8, rax
0000000145b53f9a 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b53fa3 488d4d18                       lea rcx, [rbp + 0x18]
0000000145b53fa7 41b901000000                   mov r9d, 1
0000000145b53fad 31d2                           xor edx, edx
0000000145b53faf e87cdb5000                     call 0x146061b30
0000000145b53fb4 90                             nop 
0000000145b53fb5 e98efdffff                     jmp 0x145b53d48
