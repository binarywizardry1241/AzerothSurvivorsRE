0000000145c2af10  55                     push rbp
0000000145c2af11  4157                   push r15
0000000145c2af13  4156                   push r14
0000000145c2af15  4155                   push r13
0000000145c2af17  4154                   push r12
0000000145c2af19  56                     push rsi
0000000145c2af1a  57                     push rdi
0000000145c2af1b  53                     push rbx
0000000145c2af1c  4881ecb8010000         sub rsp, 0x1b8
0000000145c2af23  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145c2af2b  48c78530010000feffffff mov qword ptr [rbp + 0x130], 0xfffffffffffffffe
0000000145c2af36  4889d3                 mov rbx, rdx
0000000145c2af39  4989cf                 mov r15, rcx
0000000145c2af3c  488d8dc8000000         lea rcx, [rbp + 0xc8]
0000000145c2af43  e8a8380100             call 0x145c3e7f0
0000000145c2af48  4883bdc800000000       cmp qword ptr [rbp + 0xc8], 0
0000000145c2af50  741f                   je 0x145c2af71
0000000145c2af52  833bff                 cmp dword ptr [rbx], -1
0000000145c2af55  7436                   je 0x145c2af8d
0000000145c2af57  4883bbd000000000       cmp qword ptr [rbx + 0xd0], 0
0000000145c2af5f  488d4da8               lea rcx, [rbp - 0x58]
0000000145c2af63  4889da                 mov rdx, rbx
0000000145c2af66  e8353e0100             call 0x145c3eda0
0000000145c2af6b  488b45a8               mov rax, qword ptr [rbp - 0x58]
0000000145c2af6f  eb1e                   jmp 0x145c2af8f
0000000145c2af71  49c70700000000         mov qword ptr [r15], 0
0000000145c2af78  49c7470808000000       mov qword ptr [r15 + 8], 8
0000000145c2af80  49c7471000000000       mov qword ptr [r15 + 0x10], 0
0000000145c2af88  e9b8010000             jmp 0x145c2b145
0000000145c2af8d  31c0                   xor eax, eax
0000000145c2af8f  48ffc0                 inc rax
0000000145c2af92  48c7c1ffffffff         mov rcx, 0xffffffffffffffff
0000000145c2af99  480f45c8               cmovne rcx, rax
0000000145c2af9d  4883f905               cmp rcx, 5
0000000145c2afa1  be04000000             mov esi, 4
0000000145c2afa6  480f43f1               cmovae rsi, rcx
0000000145c2afaa  4889f0                 mov rax, rsi
0000000145c2afad  48c1e004               shl rax, 4
0000000145c2afb1  488d3c40               lea rdi, [rax + rax*2]
0000000145c2afb5  48b8aaaaaaaaaaaaaa02   movabs rax, 0x2aaaaaaaaaaaaaa
0000000145c2afbf  4839c1                 cmp rcx, rax
0000000145c2afc2  7610                   jbe 0x145c2afd4
0000000145c2afc4  4531f6                 xor r14d, r14d
0000000145c2afc7  4c89f1                 mov rcx, r14
0000000145c2afca  4889fa                 mov rdx, rdi
0000000145c2afcd  e8e9015100             call 0x14613b1bb
0000000145c2afd2  0f0b                   ud2
0000000145c2afd4  4885ff                 test rdi, rdi
0000000145c2afd7  4c89bd10010000         mov qword ptr [rbp + 0x110], r15
0000000145c2afde  7422                   je 0x145c2b002
0000000145c2afe0  e81b723dfa             call 0x140002200
0000000145c2afe5  41be08000000           mov r14d, 8
0000000145c2afeb  ba08000000             mov edx, 8
0000000145c2aff0  4889f9                 mov rcx, rdi
0000000145c2aff3  e8c8713dfa             call 0x1400021c0
0000000145c2aff8  4885c0                 test rax, rax
0000000145c2affb  74ca                   je 0x145c2afc7
0000000145c2affd  4989c5                 mov r13, rax
0000000145c2b000  eb08                   jmp 0x145c2b00a
0000000145c2b002  41bd08000000           mov r13d, 8
0000000145c2b008  31f6                   xor esi, esi
0000000145c2b00a  0f1085c8000000         movups xmm0, xmmword ptr [rbp + 0xc8]
0000000145c2b011  0f108dd8000000         movups xmm1, xmmword ptr [rbp + 0xd8]
0000000145c2b018  0f1095e8000000         movups xmm2, xmmword ptr [rbp + 0xe8]
0000000145c2b01f  410f115520             movups xmmword ptr [r13 + 0x20], xmm2
0000000145c2b024  410f114d10             movups xmmword ptr [r13 + 0x10], xmm1
0000000145c2b029  410f114500             movups xmmword ptr [r13], xmm0
0000000145c2b02e  4889b518010000         mov qword ptr [rbp + 0x118], rsi
0000000145c2b035  4c89ad20010000         mov qword ptr [rbp + 0x120], r13
0000000145c2b03c  48c7852801000001000000 mov qword ptr [rbp + 0x128], 1
0000000145c2b047  488d7da8               lea rdi, [rbp - 0x58]
0000000145c2b04b  41b8f0000000           mov r8d, 0xf0
0000000145c2b051  4889f9                 mov rcx, rdi
0000000145c2b054  4889da                 mov rdx, rbx
0000000145c2b057  e87f913600             call 0x145f941db
0000000145c2b05c  bb01000000             mov ebx, 1
0000000145c2b061  be30000000             mov esi, 0x30
0000000145c2b066  4c8db598000000         lea r14, [rbp + 0x98]
0000000145c2b06d  49c7c4ffffffff         mov r12, 0xffffffffffffffff
0000000145c2b074  4c8dbd18010000         lea r15, [rbp + 0x118]
0000000145c2b07b  eb38                   jmp 0x145c2b0b5
0000000145c2b07d  0f1f00                 nop dword ptr [rax]
0000000145c2b080  0f108598000000         movups xmm0, xmmword ptr [rbp + 0x98]
0000000145c2b087  0f108da8000000         movups xmm1, xmmword ptr [rbp + 0xa8]
0000000145c2b08e  0f1095b8000000         movups xmm2, xmmword ptr [rbp + 0xb8]
0000000145c2b095  410f11543520           movups xmmword ptr [r13 + rsi + 0x20], xmm2
0000000145c2b09b  410f114c3510           movups xmmword ptr [r13 + rsi + 0x10], xmm1
0000000145c2b0a1  410f11443500           movups xmmword ptr [r13 + rsi], xmm0
0000000145c2b0a7  48ffc3                 inc rbx
0000000145c2b0aa  48899d28010000         mov qword ptr [rbp + 0x128], rbx
0000000145c2b0b1  4883c630               add rsi, 0x30
0000000145c2b0b5  4c89f1                 mov rcx, r14
0000000145c2b0b8  4889fa                 mov rdx, rdi
0000000145c2b0bb  e830370100             call 0x145c3e7f0
0000000145c2b0c0  90                     nop
0000000145c2b0c1  4883bd9800000000       cmp qword ptr [rbp + 0x98], 0
0000000145c2b0c9  745d                   je 0x145c2b128
0000000145c2b0cb  483b9d18010000         cmp rbx, qword ptr [rbp + 0x118]
0000000145c2b0d2  75ac                   jne 0x145c2b080
0000000145c2b0d4  837da8ff               cmp dword ptr [rbp - 0x58], -1
0000000145c2b0d8  741d                   je 0x145c2b0f7
0000000145c2b0da  48837d7800             cmp qword ptr [rbp + 0x78], 0
0000000145c2b0df  488d8df8000000         lea rcx, [rbp + 0xf8]
0000000145c2b0e6  4889fa                 mov rdx, rdi
0000000145c2b0e9  e8b23c0100             call 0x145c3eda0
0000000145c2b0ee  4c8b85f8000000         mov r8, qword ptr [rbp + 0xf8]
0000000145c2b0f5  eb03                   jmp 0x145c2b0fa
0000000145c2b0f7  4531c0                 xor r8d, r8d
0000000145c2b0fa  49ffc0                 inc r8
0000000145c2b0fd  4d0f44c4               cmove r8, r12
0000000145c2b101  48c744242030000000     mov qword ptr [rsp + 0x20], 0x30
0000000145c2b10a  41b908000000           mov r9d, 8
0000000145c2b110  4c89f9                 mov rcx, r15
0000000145c2b113  4889da                 mov rdx, rbx
0000000145c2b116  e8d5943600             call 0x145f945f0
0000000145c2b11b  90                     nop
0000000145c2b11c  4c8bad20010000         mov r13, qword ptr [rbp + 0x120]
0000000145c2b123  e958ffffff             jmp 0x145c2b080
0000000145c2b128  488b8528010000         mov rax, qword ptr [rbp + 0x128]
0000000145c2b12f  4c8bbd10010000         mov r15, qword ptr [rbp + 0x110]
0000000145c2b136  49894710               mov qword ptr [r15 + 0x10], rax
0000000145c2b13a  0f108518010000         movups xmm0, xmmword ptr [rbp + 0x118]
0000000145c2b141  410f1107               movups xmmword ptr [r15], xmm0
0000000145c2b145  4c89f8                 mov rax, r15
0000000145c2b148  4881c4b8010000         add rsp, 0x1b8
0000000145c2b14f  5b                     pop rbx
0000000145c2b150  5f                     pop rdi
0000000145c2b151  5e                     pop rsi
0000000145c2b152  415c                   pop r12
0000000145c2b154  415d                   pop r13
0000000145c2b156  415e                   pop r14
0000000145c2b158  415f                   pop r15
0000000145c2b15a  5d                     pop rbp
0000000145c2b15b  c3                     ret
