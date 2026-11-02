0000000145c2a4e0  55                     push rbp
0000000145c2a4e1  4157                   push r15
0000000145c2a4e3  4156                   push r14
0000000145c2a4e5  4155                   push r13
0000000145c2a4e7  4154                   push r12
0000000145c2a4e9  56                     push rsi
0000000145c2a4ea  57                     push rdi
0000000145c2a4eb  53                     push rbx
0000000145c2a4ec  4881ecb8010000         sub rsp, 0x1b8
0000000145c2a4f3  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145c2a4fb  48c78530010000feffffff mov qword ptr [rbp + 0x130], 0xfffffffffffffffe
0000000145c2a506  4889d3                 mov rbx, rdx
0000000145c2a509  4989cf                 mov r15, rcx
0000000145c2a50c  488d8dc8000000         lea rcx, [rbp + 0xc8]
0000000145c2a513  e8583e0100             call 0x145c3e370
0000000145c2a518  4883bdc800000000       cmp qword ptr [rbp + 0xc8], 0
0000000145c2a520  741f                   je 0x145c2a541
0000000145c2a522  833bff                 cmp dword ptr [rbx], -1
0000000145c2a525  7436                   je 0x145c2a55d
0000000145c2a527  4883bbd000000000       cmp qword ptr [rbx + 0xd0], 0
0000000145c2a52f  488d4da8               lea rcx, [rbp - 0x58]
0000000145c2a533  4889da                 mov rdx, rbx
0000000145c2a536  e8e5430100             call 0x145c3e920
0000000145c2a53b  488b45a8               mov rax, qword ptr [rbp - 0x58]
0000000145c2a53f  eb1e                   jmp 0x145c2a55f
0000000145c2a541  49c70700000000         mov qword ptr [r15], 0
0000000145c2a548  49c7470808000000       mov qword ptr [r15 + 8], 8
0000000145c2a550  49c7471000000000       mov qword ptr [r15 + 0x10], 0
0000000145c2a558  e9b8010000             jmp 0x145c2a715
0000000145c2a55d  31c0                   xor eax, eax
0000000145c2a55f  48ffc0                 inc rax
0000000145c2a562  48c7c1ffffffff         mov rcx, 0xffffffffffffffff
0000000145c2a569  480f45c8               cmovne rcx, rax
0000000145c2a56d  4883f905               cmp rcx, 5
0000000145c2a571  be04000000             mov esi, 4
0000000145c2a576  480f43f1               cmovae rsi, rcx
0000000145c2a57a  4889f0                 mov rax, rsi
0000000145c2a57d  48c1e004               shl rax, 4
0000000145c2a581  488d3c40               lea rdi, [rax + rax*2]
0000000145c2a585  48b8aaaaaaaaaaaaaa02   movabs rax, 0x2aaaaaaaaaaaaaa
0000000145c2a58f  4839c1                 cmp rcx, rax
0000000145c2a592  7610                   jbe 0x145c2a5a4
0000000145c2a594  4531f6                 xor r14d, r14d
0000000145c2a597  4c89f1                 mov rcx, r14
0000000145c2a59a  4889fa                 mov rdx, rdi
0000000145c2a59d  e899075100             call 0x14613ad3b
0000000145c2a5a2  0f0b                   ud2
0000000145c2a5a4  4885ff                 test rdi, rdi
0000000145c2a5a7  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
0000000145c2a5ae  7422                   je 0x145c2a5d2
0000000145c2a5b0  e84b7c3dfa             call 0x140002200
0000000145c2a5b5  41be08000000           mov r14d, 8
0000000145c2a5bb  ba08000000             mov edx, 8
0000000145c2a5c0  4889f9                 mov rcx, rdi
0000000145c2a5c3  e8f87b3dfa             call 0x1400021c0
0000000145c2a5c8  4885c0                 test rax, rax
0000000145c2a5cb  74ca                   je 0x145c2a597
0000000145c2a5cd  4989c5                 mov r13, rax
0000000145c2a5d0  eb08                   jmp 0x145c2a5da
0000000145c2a5d2  41bd08000000           mov r13d, 8
0000000145c2a5d8  31f6                   xor esi, esi
0000000145c2a5da  0f1085c8000000         movups xmm0, xmmword ptr [rbp + 0xc8]
0000000145c2a5e1  0f108dd8000000         movups xmm1, xmmword ptr [rbp + 0xd8]
0000000145c2a5e8  0f1095e8000000         movups xmm2, xmmword ptr [rbp + 0xe8]
0000000145c2a5ef  410f115520             movups xmmword ptr [r13 + 0x20], xmm2
0000000145c2a5f4  410f114d10             movups xmmword ptr [r13 + 0x10], xmm1
0000000145c2a5f9  410f114500             movups xmmword ptr [r13], xmm0
0000000145c2a5fe  4889b518010000         mov qword ptr [rbp + 0x118], rsi
0000000145c2a605  4c89ad20010000         mov qword ptr [rbp + 0x120], r13
0000000145c2a60c  48c7852801000001000000 mov qword ptr [rbp + 0x128], 1
0000000145c2a617  488d7da8               lea rdi, [rbp - 0x58]
0000000145c2a61b  41b8f0000000           mov r8d, 0xf0
0000000145c2a621  4889f9                 mov rcx, rdi
0000000145c2a624  4889da                 mov rdx, rbx
0000000145c2a627  e82f973600             call 0x145f93d5b
0000000145c2a62c  bb01000000             mov ebx, 1
0000000145c2a631  be30000000             mov esi, 0x30
0000000145c2a636  4c8db598000000         lea r14, [rbp + 0x98]
0000000145c2a63d  49c7c4ffffffff         mov r12, 0xffffffffffffffff
0000000145c2a644  4c8dbd18010000         lea r15, [rbp + 0x118]
0000000145c2a64b  eb38                   jmp 0x145c2a685
0000000145c2a64d  0f1f00                 nop dword ptr [rax]
0000000145c2a650  0f108598000000         movups xmm0, xmmword ptr [rbp + 0x98]
0000000145c2a657  0f108da8000000         movups xmm1, xmmword ptr [rbp + 0xa8]
0000000145c2a65e  0f1095b8000000         movups xmm2, xmmword ptr [rbp + 0xb8]
0000000145c2a665  410f11543520           movups xmmword ptr [r13 + rsi + 0x20], xmm2
0000000145c2a66b  410f114c3510           movups xmmword ptr [r13 + rsi + 0x10], xmm1
0000000145c2a671  410f11443500           movups xmmword ptr [r13 + rsi], xmm0
0000000145c2a677  48ffc3                 inc rbx
0000000145c2a67a  48899d28010000         mov qword ptr [rbp + 0x128], rbx
0000000145c2a681  4883c630               add rsi, 0x30
0000000145c2a685  4c89f1                 mov rcx, r14
0000000145c2a688  4889fa                 mov rdx, rdi
0000000145c2a68b  e8e03c0100             call 0x145c3e370
0000000145c2a690  90                     nop
0000000145c2a691  4883bd9800000000       cmp qword ptr [rbp + 0x98], 0
0000000145c2a699  745d                   je 0x145c2a6f8
0000000145c2a69b  483b9d18010000         cmp rbx, qword ptr [rbp + 0x118]
0000000145c2a6a2  75ac                   jne 0x145c2a650
0000000145c2a6a4  837da8ff               cmp dword ptr [rbp - 0x58], -1
0000000145c2a6a8  741d                   je 0x145c2a6c7
0000000145c2a6aa  48837d7800             cmp qword ptr [rbp + 0x78], 0
0000000145c2a6af  488d8df8000000         lea rcx, [rbp + 0xf8]
0000000145c2a6b6  4889fa                 mov rdx, rdi
0000000145c2a6b9  e862420100             call 0x145c3e920
0000000145c2a6be  4c8b85f8000000         mov r8, qword ptr [rbp + 0xf8]
0000000145c2a6c5  eb03                   jmp 0x145c2a6ca
0000000145c2a6c7  4531c0                 xor r8d, r8d
0000000145c2a6ca  49ffc0                 inc r8
0000000145c2a6cd  4d0f44c4               cmove r8, r12
0000000145c2a6d1  48c744242030000000     mov qword ptr [rsp + 0x20], 0x30
0000000145c2a6da  41b908000000           mov r9d, 8
0000000145c2a6e0  4c89f9                 mov rcx, r15
0000000145c2a6e3  4889da                 mov rdx, rbx
0000000145c2a6e6  e8859a3600             call 0x145f94170
0000000145c2a6eb  90                     nop
0000000145c2a6ec  4c8bad20010000         mov r13, qword ptr [rbp + 0x120]
0000000145c2a6f3  e958ffffff             jmp 0x145c2a650
0000000145c2a6f8  488b8528010000         mov rax, qword ptr [rbp + 0x128]
0000000145c2a6ff  4c8bbd10010000         mov r15, qword ptr [rbp + 0x110]
0000000145c2a706  49894710               mov qword ptr [r15 + 0x10], rax
0000000145c2a70a  0f108518010000         movups xmm0, xmmword ptr [rbp + 0x118]
0000000145c2a711  410f1107               movups xmmword ptr [r15], xmm0
0000000145c2a715  4c89f8                 mov rax, r15
0000000145c2a718  4881c4b8010000         add rsp, 0x1b8
0000000145c2a71f  5b                     pop rbx
0000000145c2a720  5f                     pop rdi
0000000145c2a721  5e                     pop rsi
0000000145c2a722  415c                   pop r12
0000000145c2a724  415d                   pop r13
0000000145c2a726  415e                   pop r14
0000000145c2a728  415f                   pop r15
0000000145c2a72a  5d                     pop rbp
0000000145c2a72b  c3                     ret
