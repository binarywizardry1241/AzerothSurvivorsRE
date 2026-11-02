0000000145b66e8c 4180bd4001000000               cmp byte ptr [r13 + 0x140], 0
0000000145b66e94 741e                           je 0x145b66eb4
0000000145b66e96 418bb528010000                 mov esi, dword ptr [r13 + 0x128]
0000000145b66e9d 83feff                         cmp esi, -1
0000000145b66ea0 0f843b020000                   je 0x145b670e1
0000000145b66ea6 498b8520010000                 mov rax, qword ptr [r13 + 0x120]
0000000145b66ead 89f2                           mov edx, esi
0000000145b66eaf e948020000                     jmp 0x145b670fc
0000000145b66eb4 488b8588000000                 mov rax, qword ptr [rbp + 0x88]
0000000145b66ebb 488b08                         mov rcx, qword ptr [rax]
0000000145b66ebe 48c700ffffffff                 mov qword ptr [rax], 0xffffffffffffffff
0000000145b66ec5 4883f9ff                       cmp rcx, -1
0000000145b66ec9 0f84e1020000                   je 0x145b671b0
0000000145b66ecf 48898db8020000                 mov qword ptr [rbp + 0x2b8], rcx
0000000145b66ed6 498b85e0000000                 mov rax, qword ptr [r13 + 0xe0]
0000000145b66edd 48898500030000                 mov qword ptr [rbp + 0x300], rax
0000000145b66ee4 4d8bbde8000000                 mov r15, qword ptr [r13 + 0xe8]
0000000145b66eeb 498b8d30010000                 mov rcx, qword ptr [r13 + 0x130]
0000000145b66ef2 498b8538010000                 mov rax, qword ptr [r13 + 0x138]
0000000145b66ef9 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145b66efd c6853003000001                 mov byte ptr [rbp + 0x330], 1
0000000145b66f04 ffd0                           call rax
0000000145b66f06 90                             nop
0000000145b66f07 c6853003000001                 mov byte ptr [rbp + 0x330], 1
0000000145b66f0e 488b8d00030000                 mov rcx, qword ptr [rbp + 0x300]
0000000145b66f15 4c89fa                         mov rdx, r15
0000000145b66f18 ffd7                           call rdi
0000000145b66f1a 488985d0020000                 mov qword ptr [rbp + 0x2d0], rax
0000000145b66f21 488995c8020000                 mov qword ptr [rbp + 0x2c8], rdx
