14593868c f30f59d0 mulss xmm2, xmm0
145938690 0f2ed7 ucomiss xmm2, xmm7
145938693 0f8637c8ffff jbe 0x145934ed0
145938699 49c7452000000000 mov qword ptr [r13 + 0x20], 0
1459386a1 418a9dad010000 mov bl, byte ptr [r13 + 0x1ad]
1459386a8 41c685ad01000003 mov byte ptr [r13 + 0x1ad], 3
1459386b0 c644243000 mov byte ptr [rsp + 0x30], 0
1459386b5 c644242800 mov byte ptr [rsp + 0x28], 0
1459386ba c644242005 mov byte ptr [rsp + 0x20], 5
1459386bf 4c89e9 mov rcx, r13
1459386c2 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
1459386c9 448b8d14020000 mov r9d, dword ptr [rbp + 0x214]
1459386d0 e8bb650000 call 0x14593ec90
1459386d5 90 nop
1459386d6 41889dad010000 mov byte ptr [r13 + 0x1ad], bl
1459386dd 49c7452001000000 mov qword ptr [r13 + 0x20], 1
1459386e5 488b85d8010000 mov rax, qword ptr [rbp + 0x1d8]
1459386ec 49894528 mov qword ptr [r13 + 0x28], rax
1459386f0 e9dbc7ffff jmp 0x145934ed0
