0000000145b2efcf 488d05a340b301                 lea rax, [rip + 0x1b340a3]
0000000145b2efd6 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b2efdb 48c744242806000000             mov qword ptr [rsp + 0x28], 6
0000000145b2efe4 4c8d05323db301                 lea r8, [rip + 0x1b33d32]
0000000145b2efeb 488d8da0000000                 lea rcx, [rbp + 0xa0]
0000000145b2eff2 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145b2eff9 41b904000000                   mov r9d, 4
0000000145b2efff e8ec0cf9ff                     call 0x145abfcf0
0000000145b2f004 90                             nop
0000000145b2f005 488b8560010000                 mov rax, qword ptr [rbp + 0x160]
0000000145b2f00c 48898588020000                 mov qword ptr [rbp + 0x288], rax
0000000145b2f013 488d05a6304dfa                 lea rax, [rip - 0x5b2cf5a]
0000000145b2f01a 48898590020000                 mov qword ptr [rbp + 0x290], rax
0000000145b2f021 c685be02000001                 mov byte ptr [rbp + 0x2be], 1
0000000145b2f028 488d155f324801                 lea rdx, [rip + 0x148325f]
0000000145b2f02f 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2f036 4c8d8588020000                 lea r8, [rbp + 0x288]
0000000145b2f03d e82ef94800                     call 0x145fbe970
0000000145b2f042 90                             nop
0000000145b2f043 488b8d78010000                 mov rcx, qword ptr [rbp + 0x178]
0000000145b2f04a 488b9580010000                 mov rdx, qword ptr [rbp + 0x180]
0000000145b2f051 48898db0020000                 mov qword ptr [rbp + 0x2b0], rcx
0000000145b2f058 e803bffbff                     call 0x145aeaf60
0000000145b2f05d 90                             nop
0000000145b2f05e 4889c3                         mov rbx, rax
0000000145b2f061 4889d7                         mov rdi, rdx
0000000145b2f064 488b9570010000                 mov rdx, qword ptr [rbp + 0x170]
0000000145b2f06b 4885d2                         test rdx, rdx
0000000145b2f06e 7412                           je 0x145b2f082
0000000145b2f070 41b801000000                   mov r8d, 1
0000000145b2f076 488b8db0020000                 mov rcx, qword ptr [rbp + 0x2b0]
0000000145b2f07d e84e314dfa                     call 0x1400021d0
0000000145b2f082 4885db                         test rbx, rbx
0000000145b2f085 488b8560020000                 mov rax, qword ptr [rbp + 0x260]
0000000145b2f08c 480f45c3                       cmovne rax, rbx
0000000145b2f090 480f44bd68010000               cmove rdi, qword ptr [rbp + 0x168]
0000000145b2f098 c685be02000000                 mov byte ptr [rbp + 0x2be], 0
0000000145b2f09f 48897c2428                     mov qword ptr [rsp + 0x28], rdi
0000000145b2f0a4 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b2f0a9 4c8d05a63db301                 lea r8, [rip + 0x1b33da6]
0000000145b2f0b0 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2f0b7 488d95a0000000                 lea rdx, [rbp + 0xa0]
0000000145b2f0be 41b902000000                   mov r9d, 2
0000000145b2f0c4 e8270cf9ff                     call 0x145abfcf0
0000000145b2f0c9 90                             nop
0000000145b2f0ca 0fb685a8020000                 movzx eax, byte ptr [rbp + 0x2a8]
0000000145b2f0d1 89442420                       mov dword ptr [rsp + 0x20], eax
0000000145b2f0d5 4c8d05db3fb301                 lea r8, [rip + 0x1b33fdb]
0000000145b2f0dc 488d8da0000000                 lea rcx, [rbp + 0xa0]
0000000145b2f0e3 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145b2f0ea 41b905000000                   mov r9d, 5
0000000145b2f0f0 e8fbaaf8ff                     call 0x145ab9bf0
0000000145b2f0f5 90                             nop
0000000145b2f0f6 410fb6c4                       movzx eax, r12b
0000000145b2f0fa 89442420                       mov dword ptr [rsp + 0x20], eax
0000000145b2f0fe 4c8d05b73fb301                 lea r8, [rip + 0x1b33fb7]
0000000145b2f105 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2f10c 488d95a0000000                 lea rdx, [rbp + 0xa0]
0000000145b2f113 41b904000000                   mov r9d, 4
0000000145b2f119 e8d2aaf8ff                     call 0x145ab9bf0
0000000145b2f11e 90                             nop
0000000145b2f11f 488bbd80010000                 mov rdi, qword ptr [rbp + 0x180]
0000000145b2f126 4839bd70010000                 cmp qword ptr [rbp + 0x170], rdi
0000000145b2f12d 0f84c6020000                   je 0x145b2f3f9
0000000145b2f133 488b8578010000                 mov rax, qword ptr [rbp + 0x178]
0000000145b2f13a c604387d                       mov byte ptr [rax + rdi], 0x7d
0000000145b2f13e 48ffc7                         inc rdi
0000000145b2f141 4889bdb0000000                 mov qword ptr [rbp + 0xb0], rdi
0000000145b2f148 0f108570010000                 movups xmm0, xmmword ptr [rbp + 0x170]
0000000145b2f14f 0f2985a0000000                 movaps xmmword ptr [rbp + 0xa0], xmm0
0000000145b2f156 488d4e10                       lea rcx, [rsi + 0x10]
0000000145b2f15a 833902                         cmp dword ptr [rcx], 2
0000000145b2f15d 7555                           jne 0x145b2f1b4
0000000145b2f15f 488b8e68190000                 mov rcx, qword ptr [rsi + 0x1968]
0000000145b2f166 488b8670190000                 mov rax, qword ptr [rsi + 0x1970]
0000000145b2f16d 488b95a0000000                 mov rdx, qword ptr [rbp + 0xa0]
0000000145b2f174 488995a8020000                 mov qword ptr [rbp + 0x2a8], rdx
0000000145b2f17b 488b95a8000000                 mov rdx, qword ptr [rbp + 0xa8]
0000000145b2f182 4c8b85b0000000                 mov r8, qword ptr [rbp + 0xb0]
0000000145b2f189 488995b0020000                 mov qword ptr [rbp + 0x2b0], rdx
0000000145b2f190 ff5018                         call qword ptr [rax + 0x18]
0000000145b2f193 90                             nop
0000000145b2f194 488b95a8020000                 mov rdx, qword ptr [rbp + 0x2a8]
0000000145b2f19b 4885d2                         test rdx, rdx
0000000145b2f19e 7421                           je 0x145b2f1c1
0000000145b2f1a0 41b801000000                   mov r8d, 1
0000000145b2f1a6 488b8db0020000                 mov rcx, qword ptr [rbp + 0x2b0]
0000000145b2f1ad e81e304dfa                     call 0x1400021d0
0000000145b2f1b2 eb0d                           jmp 0x145b2f1c1
0000000145b2f1b4 488d95a0000000                 lea rdx, [rbp + 0xa0]
0000000145b2f1bb e8e0070b00                     call 0x145bdf9a0
0000000145b2f1c0 90                             nop
