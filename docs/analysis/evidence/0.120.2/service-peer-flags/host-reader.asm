; 0.120.2 SHA256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
0000000145c03f90 4156                           push r14
0000000145c03f92 56                             push rsi
0000000145c03f93 57                             push rdi
0000000145c03f94 53                             push rbx
0000000145c03f95 4883ec28                       sub rsp, 0x28
0000000145c03f99 488b31                         mov rsi, qword ptr [rcx]
0000000145c03f9c b201                           mov dl, 1
0000000145c03f9e 31c0                           xor eax, eax
0000000145c03fa0 f00fb05610                     lock cmpxchg byte ptr [rsi + 0x10], dl
0000000145c03fa5 0f85f4000000                   jne 0x145c0409f
0000000145c03fab 488b1dc60b9302                 mov rbx, qword ptr [rip + 0x2930bc6]
0000000145c03fb2 488b03                         mov rax, qword ptr [rbx]
0000000145c03fb5 48d1e0                         shl rax, 1
0000000145c03fb8 4885c0                         test rax, rax
0000000145c03fbb 0f85f5000000                   jne 0x145c040b6
0000000145c03fc1 31ff                           xor edi, edi
0000000145c03fc3 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c03fc7 4883beb001000000               cmp qword ptr [rsi + 0x1b0], 0
0000000145c03fcf 0f8404010000                   je 0x145c040d9
0000000145c03fd5 488d5108                       lea rdx, [rcx + 8]
0000000145c03fd9 488d86b8010000                 lea rax, [rsi + 0x1b8]
0000000145c03fe0 4989ce                         mov r14, rcx
0000000145c03fe3 4889c1                         mov rcx, rax
0000000145c03fe6 e8754991fa                     call 0x140518960
0000000145c03feb 4989c0                         mov r8, rax
0000000145c03fee 49c1e839                       shr r8, 0x39
0000000145c03ff2 488b8e98010000                 mov rcx, qword ptr [rsi + 0x198]
0000000145c03ff9 488b96a0010000                 mov rdx, qword ptr [rsi + 0x1a0]
0000000145c04000 66410f6ec0                     movd xmm0, r8d
0000000145c04005 660f60c0                       punpcklbw xmm0, xmm0
0000000145c04009 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145c0400e 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145c04013 458b4608                       mov r8d, dword ptr [r14 + 8]
0000000145c04017 4531c9                         xor r9d, r9d
0000000145c0401a 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c0401e 4821d0                         and rax, rdx
0000000145c04021 f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145c04026 660f6fda                       movdqa xmm3, xmm2
0000000145c0402a 660f74d8                       pcmpeqb xmm3, xmm0
0000000145c0402e 66440fd7d3                     pmovmskb r10d, xmm3
0000000145c04033 4585d2                         test r10d, r10d
0000000145c04036 7438                           je 0x145c04070
0000000145c04038 f3450fbcda                     tzcnt r11d, r10d
0000000145c0403d 4901c3                         add r11, rax
0000000145c04040 4921d3                         and r11, rdx
0000000145c04043 49f7db                         neg r11
0000000145c04046 4f8d1c5b                       lea r11, [r11 + r11*2]
0000000145c0404a 49c1e304                       shl r11, 4
0000000145c0404e 463b4419d0                     cmp r8d, dword ptr [rcx + r11 - 0x30]
0000000145c04053 7436                           je 0x145c0408b
0000000145c04055 458d5aff                       lea r11d, [r10 - 1]
0000000145c04059 664521d3                       and r11w, r10w
0000000145c0405d 4589da                         mov r10d, r11d
0000000145c04060 75d6                           jne 0x145c04038
0000000145c04062 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c04070 660f74d1                       pcmpeqb xmm2, xmm1
0000000145c04074 66440fd7d2                     pmovmskb r10d, xmm2
0000000145c04079 4585d2                         test r10d, r10d
0000000145c0407c 755b                           jne 0x145c040d9
0000000145c0407e 4c01c8                         add rax, r9
0000000145c04081 4883c010                       add rax, 0x10
0000000145c04085 4983c110                       add r9, 0x10
0000000145c04089 eb93                           jmp 0x145c0401e
0000000145c0408b 4c01d9                         add rcx, r11
0000000145c0408e 8079f800                       cmp byte ptr [rcx - 8], 0
0000000145c04092 7445                           je 0x145c040d9
0000000145c04094 0fb641f9                       movzx eax, byte ptr [rcx - 7]
0000000145c04098 4084ff                         test dil, dil
0000000145c0409b 7443                           je 0x145c040e0
0000000145c0409d eb4c                           jmp 0x145c040eb
0000000145c0409f 488d4610                       lea rax, [rsi + 0x10]
0000000145c040a3 4889cf                         mov rdi, rcx
0000000145c040a6 4889c1                         mov rcx, rax
0000000145c040a9 e8a2c65400                     call 0x146150750
0000000145c040ae 4889f9                         mov rcx, rdi
0000000145c040b1 e9f5feffff                     jmp 0x145c03fab
0000000145c040b6 4889cf                         mov rdi, rcx
0000000145c040b9 e822d45400                     call 0x1461514e0
0000000145c040be 4889f9                         mov rcx, rdi
0000000145c040c1 89c7                           mov edi, eax
0000000145c040c3 4080f701                       xor dil, 1
0000000145c040c7 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c040cb 4883beb001000000               cmp qword ptr [rsi + 0x1b0], 0
0000000145c040d3 0f85fcfeffff                   jne 0x145c03fd5
0000000145c040d9 31c0                           xor eax, eax
0000000145c040db 4084ff                         test dil, dil
0000000145c040de 750b                           jne 0x145c040eb
0000000145c040e0 488b0b                         mov rcx, qword ptr [rbx]
0000000145c040e3 48d1e1                         shl rcx, 1
0000000145c040e6 4885c9                         test rcx, rcx
0000000145c040e9 7526                           jne 0x145c04111
0000000145c040eb 31c9                           xor ecx, ecx
0000000145c040ed 864e10                         xchg byte ptr [rsi + 0x10], cl
0000000145c040f0 80f902                         cmp cl, 2
0000000145c040f3 740a                           je 0x145c040ff
0000000145c040f5 4883c428                       add rsp, 0x28
0000000145c040f9 5b                             pop rbx
0000000145c040fa 5f                             pop rdi
0000000145c040fb 5e                             pop rsi
0000000145c040fc 415e                           pop r14
0000000145c040fe c3                             ret
0000000145c040ff 4883c610                       add rsi, 0x10
0000000145c04103 4889f1                         mov rcx, rsi
0000000145c04106 89c6                           mov esi, eax
0000000145c04108 e803c75400                     call 0x146150810
0000000145c0410d 89f0                           mov eax, esi
0000000145c0410f ebe4                           jmp 0x145c040f5
0000000145c04111 89c7                           mov edi, eax
0000000145c04113 e8c8d35400                     call 0x1461514e0
0000000145c04118 89c1                           mov ecx, eax
0000000145c0411a 89f8                           mov eax, edi
0000000145c0411c 84c9                           test cl, cl
0000000145c0411e 75cb                           jne 0x145c040eb
0000000145c04120 c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145c04124 ebc5                           jmp 0x145c040eb
