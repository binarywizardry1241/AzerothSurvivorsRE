0000000145b65098 488bbde0000000                 mov rdi, qword ptr [rbp + 0xe0]
0000000145b6509f 4080fe01                       cmp sil, 1
0000000145b650a3 0f8598000000                   jne 0x145b65141
0000000145b650a9 488b85e0020000                 mov rax, qword ptr [rbp + 0x2e0]
0000000145b650b0 488338ff                       cmp qword ptr [rax], -1
0000000145b650b4 0f8487000000                   je 0x145b65141
0000000145b650ba 48b80300000000000080           movabs rax, 0x8000000000000003
0000000145b650c4 4839c7                         cmp rdi, rax
0000000145b650c7 7565                           jne 0x145b6512e
0000000145b650c9 418ab540010000                 mov sil, byte ptr [r13 + 0x140]
0000000145b650d0 41c6854101000001               mov byte ptr [r13 + 0x141], 1
0000000145b650d8 498b8d30010000                 mov rcx, qword ptr [r13 + 0x130]
0000000145b650df 498b8538010000                 mov rax, qword ptr [r13 + 0x138]
0000000145b650e6 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145b650ea c6853603000001                 mov byte ptr [rbp + 0x336], 1
0000000145b650f1 c6853503000001                 mov byte ptr [rbp + 0x335], 1
0000000145b650f8 c6853403000001                 mov byte ptr [rbp + 0x334], 1
0000000145b650ff c6853303000001                 mov byte ptr [rbp + 0x333], 1
0000000145b65106 c6853203000001                 mov byte ptr [rbp + 0x332], 1
0000000145b6510d c6853103000001                 mov byte ptr [rbp + 0x331], 1
0000000145b65114 ffd0                           call rax
0000000145b65116 90                             nop
0000000145b65117 4084f6                         test sil, sil
0000000145b6511a 7425                           je 0x145b65141
0000000145b6511c 488d8de0000000                 lea rcx, [rbp + 0xe0]
0000000145b65123 e8d8caffff                     call 0x145b61c00
0000000145b65128 90                             nop
0000000145b65129 e9c6180000                     jmp 0x145b669f4
0000000145b6512e 41c6854001000001               mov byte ptr [r13 + 0x140], 1
0000000145b65136 41c78528010000ffffffff         mov dword ptr [r13 + 0x128], 0xffffffff
