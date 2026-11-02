0000000145cb8b34 31c0                           xor eax, eax
0000000145cb8b36 49c784241002000000000000       mov qword ptr [r12 + 0x210], 0
0000000145cb8b42 4989842408020000               mov qword ptr [r12 + 0x208], rax
0000000145cb8b4a c6855803000001                 mov byte ptr [rbp + 0x358], 1
0000000145cb8b51 488b8df8020000                 mov rcx, qword ptr [rbp + 0x2f8]
0000000145cb8b58 31d2                           xor edx, edx
0000000145cb8b5a e8d119f2ff                     call 0x145bda530
0000000145cb8b5f 90                             nop 
0000000145cb8b60 49c744245000000000             mov qword ptr [r12 + 0x50], 0
0000000145cb8b69 6641c78424290200000000         mov word ptr [r12 + 0x229], 0
0000000145cb8b74 488b8550030000                 mov rax, qword ptr [rbp + 0x350]
0000000145cb8b7b 48898518020000                 mov qword ptr [rbp + 0x218], rax
0000000145cb8b82 488b8530030000                 mov rax, qword ptr [rbp + 0x330]
0000000145cb8b89 48898520020000                 mov qword ptr [rbp + 0x220], rax
0000000145cb8b90 4889bd28020000                 mov qword ptr [rbp + 0x228], rdi
0000000145cb8b97 48b80200000000000080           movabs rax, 0x8000000000000002
0000000145cb8ba1 48898510020000                 mov qword ptr [rbp + 0x210], rax
0000000145cb8ba8 498b0c24                       mov rcx, qword ptr [r12]
0000000145cb8bac 498b442418                     mov rax, qword ptr [r12 + 0x18]
0000000145cb8bb1 4839c8                         cmp rax, rcx
0000000145cb8bb4 0f857d030000                   jne 0x145cb8f37
0000000145cb8bba 4c89e1                         mov rcx, r12
0000000145cb8bbd e8ce1af2ff                     call 0x145bda690
0000000145cb8bc2 90                             nop 
0000000145cb8bc3 e966030000                     jmp 0x145cb8f2e
0000000145cb8bc8 31c0                           xor eax, eax
0000000145cb8bca 49c784241002000000000000       mov qword ptr [r12 + 0x210], 0
0000000145cb8bd6 4989842408020000               mov qword ptr [r12 + 0x208], rax
0000000145cb8bde c6855903000001                 mov byte ptr [rbp + 0x359], 1
0000000145cb8be5 488b8df8020000                 mov rcx, qword ptr [rbp + 0x2f8]
0000000145cb8bec 31d2                           xor edx, edx
0000000145cb8bee e83d19f2ff                     call 0x145bda530
0000000145cb8bf3 90                             nop 
0000000145cb8bf4 49c744245000000000             mov qword ptr [r12 + 0x50], 0
0000000145cb8bfd 6641c78424290200000000         mov word ptr [r12 + 0x229], 0
0000000145cb8c08 4d8bb424e0010000               mov r14, qword ptr [r12 + 0x1e0]
0000000145cb8c10 4d85f6                         test r14, r14
0000000145cb8c13 0f84ea000000                   je 0x145cb8d03
0000000145cb8c19 48899d10030000                 mov qword ptr [rbp + 0x310], rbx
0000000145cb8c20 488b4538                       mov rax, qword ptr [rbp + 0x38]
0000000145cb8c24 488b38                         mov rdi, qword ptr [rax]
0000000145cb8c27 660f6f07                       movdqa xmm0, xmmword ptr [rdi]
0000000145cb8c2b 4c8d6710                       lea r12, [rdi + 0x10]
0000000145cb8c2f 660fd7d8                       pmovmskb ebx, xmm0
0000000145cb8c33 f7d3                           not ebx
0000000145cb8c35 4889bd08030000                 mov qword ptr [rbp + 0x308], rdi
0000000145cb8c3c eb0e                           jmp 0x145cb8c4c
0000000145cb8c3e 6690                           nop 
0000000145cb8c40 8d43ff                         lea eax, [rbx - 1]
0000000145cb8c43 21d8                           and eax, ebx
0000000145cb8c45 89c3                           mov ebx, eax
0000000145cb8c47 49ffce                         dec r14
0000000145cb8c4a 7458                           je 0x145cb8ca4
0000000145cb8c4c 6685db                         test bx, bx
0000000145cb8c4f 752c                           jne 0x145cb8c7d
0000000145cb8c51 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145cb8c60 66410f6f0424                   movdqa xmm0, xmmword ptr [r12]
0000000145cb8c66 4881c700feffff                 add rdi, -0x200
0000000145cb8c6d 4983c410                       add r12, 0x10
0000000145cb8c71 660fd7d8                       pmovmskb ebx, xmm0
0000000145cb8c75 81f3ffff0000                   xor ebx, 0xffff
0000000145cb8c7b 74e3                           je 0x145cb8c60
0000000145cb8c7d f30fbccb                       tzcnt ecx, ebx
0000000145cb8c81 c1e105                         shl ecx, 5
0000000145cb8c84 4889f8                         mov rax, rdi
0000000145cb8c87 4829c8                         sub rax, rcx
0000000145cb8c8a 488b50e8                       mov rdx, qword ptr [rax - 0x18]
0000000145cb8c8e 4885d2                         test rdx, rdx
0000000145cb8c91 74ad                           je 0x145cb8c40
0000000145cb8c93 488b48f0                       mov rcx, qword ptr [rax - 0x10]
0000000145cb8c97 41b801000000                   mov r8d, 1
0000000145cb8c9d e82e9534fa                     call 0x1400021d0
0000000145cb8ca2 eb9c                           jmp 0x145cb8c40
0000000145cb8ca4 4c8ba548030000                 mov r12, qword ptr [rbp + 0x348]
0000000145cb8cab 498bbc24d0010000               mov rdi, qword ptr [r12 + 0x1d0]
0000000145cb8cb3 4885ff                         test rdi, rdi
0000000145cb8cb6 742e                           je 0x145cb8ce6
0000000145cb8cb8 4c8d4711                       lea r8, [rdi + 0x11]
0000000145cb8cbc 488b8d08030000                 mov rcx, qword ptr [rbp + 0x308]
0000000145cb8cc3 b2ff                           mov dl, 0xff
0000000145cb8cc5 e8638a3a00                     call 0x14606172d
0000000145cb8cca 488d4701                       lea rax, [rdi + 1]
0000000145cb8cce 4889c1                         mov rcx, rax
0000000145cb8cd1 48c1e903                       shr rcx, 3
0000000145cb8cd5 4883e0f8                       and rax, 0xfffffffffffffff8
0000000145cb8cd9 4829c8                         sub rax, rcx
0000000145cb8cdc 4883ff08                       cmp rdi, 8
0000000145cb8ce0 480f42c7                       cmovb rax, rdi
0000000145cb8ce4 eb02                           jmp 0x145cb8ce8
0000000145cb8ce6 31c0                           xor eax, eax
0000000145cb8ce8 488b9d10030000                 mov rbx, qword ptr [rbp + 0x310]
0000000145cb8cef 49c78424e001000000000000       mov qword ptr [r12 + 0x1e0], 0
0000000145cb8cfb 49898424d8010000               mov qword ptr [r12 + 0x1d8], rax
