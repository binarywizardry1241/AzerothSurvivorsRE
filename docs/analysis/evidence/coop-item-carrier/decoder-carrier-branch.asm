0000000145d10f1b 488d8d20040000                 lea rcx, [rbp + 0x420]
0000000145d10f22 4889f2                         mov rdx, rsi
0000000145d10f25 e8f62a1b00                     call 0x145ec3a20
0000000145d10f2a 90                             nop
0000000145d10f2b ba04000000                     mov edx, 4
0000000145d10f30 4889f1                         mov rcx, rsi
0000000145d10f33 e8d82b1b00                     call 0x145ec3b10
0000000145d10f38 90                             nop
0000000145d10f39 48c785e801000000000000         mov qword ptr [rbp + 0x1e8], 0
0000000145d10f44 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145d10f4b 4889b5e0010000                 mov qword ptr [rbp + 0x1e0], rsi
0000000145d10f52 488d8d50010000                 lea rcx, [rbp + 0x150]
0000000145d10f59 488d95e0010000                 lea rdx, [rbp + 0x1e0]
0000000145d10f60 e82b12ffff                     call 0x145d02190
0000000145d10f65 90                             nop
0000000145d10f66 448b9520040000                 mov r10d, dword ptr [rbp + 0x420]
0000000145d10f6d 8b8524040000                   mov eax, dword ptr [rbp + 0x424]
0000000145d10f73 48898548050000                 mov qword ptr [rbp + 0x548], rax
0000000145d10f7a f30f6f8528040000               movdqu xmm0, xmmword ptr [rbp + 0x428]
0000000145d10f82 4489d0                         mov eax, r10d
0000000145d10f85 c1e808                         shr eax, 8
0000000145d10f88 4489d1                         mov ecx, r10d
0000000145d10f8b 81e10000ffff                   and ecx, 0xffff0000
0000000145d10f91 48898d18050000                 mov qword ptr [rbp + 0x518], rcx
0000000145d10f98 660f6eb550010000               movd xmm6, dword ptr [rbp + 0x150]
0000000145d10fa0 8b9554010000                   mov edx, dword ptr [rbp + 0x154]
0000000145d10fa6 48899560050000                 mov qword ptr [rbp + 0x560], rdx
0000000145d10fad 488b9558010000                 mov rdx, qword ptr [rbp + 0x158]
0000000145d10fb4 488995d8040000                 mov qword ptr [rbp + 0x4d8], rdx
0000000145d10fbb 488b9560010000                 mov rdx, qword ptr [rbp + 0x160]
0000000145d10fc2 48899500050000                 mov qword ptr [rbp + 0x500], rdx
0000000145d10fc9 48ba1800000000000080           movabs rdx, 0x8000000000000018
0000000145d10fd3 48899568050000                 mov qword ptr [rbp + 0x568], rdx
0000000145d10fda 48c7852005000000000000         mov qword ptr [rbp + 0x520], 0
0000000145d10fe5 e9b6160000                     jmp 0x145d126a0
