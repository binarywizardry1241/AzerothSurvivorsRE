0000000145bd1e6c 488b4d20                       mov rcx, qword ptr [rbp + 0x20]
0000000145bd1e70 48c7811819000000000000         mov qword ptr [rcx + 0x1918], 0
0000000145bd1e7b 48c7812019000001000000         mov qword ptr [rcx + 0x1920], 1
0000000145bd1e86 48c7812819000000000000         mov qword ptr [rcx + 0x1928], 0
0000000145bd1e91 0f104500                       movups xmm0, xmmword ptr [rbp]
0000000145bd1e95 0f118130190000                 movups xmmword ptr [rcx + 0x1930], xmm0
0000000145bd1e9c 488b4510                       mov rax, qword ptr [rbp + 0x10]
0000000145bd1ea0 48898140190000                 mov qword ptr [rcx + 0x1940], rax
0000000145bd1ea7 48c78148190000ffffffff         mov qword ptr [rcx + 0x1948], 0xffffffffffffffff
0000000145bd1eb2 48c78160190000ffffffff         mov qword ptr [rcx + 0x1960], 0xffffffffffffffff
0000000145bd1ebd 48c781b0190000ffffffff         mov qword ptr [rcx + 0x19b0], 0xffffffffffffffff
0000000145bd1ec8 48c781281a0000ffffffff         mov qword ptr [rcx + 0x1a28], 0xffffffffffffffff
0000000145bd1ed3 488b4518                       mov rax, qword ptr [rbp + 0x18]
0000000145bd1ed7 488981401a0000                 mov qword ptr [rcx + 0x1a40], rax
