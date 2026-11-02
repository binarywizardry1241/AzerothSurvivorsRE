0000000145c00150 488d8d80050000                 lea rcx, [rbp + 0x580]
0000000145c00157 488d55b8                       lea rdx, [rbp - 0x48]
0000000145c0015b 4c8d85b8000000                 lea r8, [rbp + 0xb8]
0000000145c00162 e8c923ffff                     call 0x145bf2530
0000000145c00167 90                             nop
0000000145c00168 0fb68580050000                 movzx eax, byte ptr [rbp + 0x580]
0000000145c0016f 83f802                         cmp eax, 2
0000000145c00172 741c                           je 0x145c00190
0000000145c00174 3dff000000                     cmp eax, 0xff
0000000145c00179 0f84b1000000                   je 0x145c00230
0000000145c0017f e902070000                     jmp 0x145c00886
0000000145c00184 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145c00190 488bb588050000                 mov rsi, qword ptr [rbp + 0x588]
0000000145c00197 89f7                           mov edi, esi
0000000145c00199 83e703                         and edi, 3
0000000145c0019c 488d0da51ca001                 lea rcx, [rip + 0x1a01ca5]
0000000145c001a3 486304b9                       movsxd rax, dword ptr [rcx + rdi*4]
0000000145c001a7 4801c8                         add rax, rcx
0000000145c001aa ffe0                           jmp rax
0000000145c001ac 0fb64610                       movzx eax, byte ptr [rsi + 0x10]
0000000145c001b0 eb31                           jmp 0x145c001e3
0000000145c001b2 c685d40e000001                 mov byte ptr [rbp + 0xed4], 1
0000000145c001b9 e812663800                     call 0x145f867d0
0000000145c001be 90                             nop
0000000145c001bf 4889f1                         mov rcx, rsi
0000000145c001c2 48c1e920                       shr rcx, 0x20
0000000145c001c6 488b4008                       mov rax, qword ptr [rax + 8]
0000000145c001ca c685d40e000001                 mov byte ptr [rbp + 0xed4], 1
0000000145c001d1 ffd0                           call rax
0000000145c001d3 90                             nop
0000000145c001d4 eb0d                           jmp 0x145c001e3
0000000145c001d6 4889f0                         mov rax, rsi
0000000145c001d9 48c1e820                       shr rax, 0x20
0000000145c001dd eb04                           jmp 0x145c001e3
0000000145c001df 0fb6461f                       movzx eax, byte ptr [rsi + 0x1f]
0000000145c001e3 3c0d                           cmp al, 0xd
0000000145c001e5 0f859b060000                   jne 0x145c00886
0000000145c001eb c685b100000001                 mov byte ptr [rbp + 0xb1], 1
0000000145c001f2 8d47fe                         lea eax, [rdi - 2]
0000000145c001f5 83f802                         cmp eax, 2
0000000145c001f8 7236                           jb 0x145c00230
0000000145c001fa 4885ff                         test rdi, rdi
0000000145c001fd 7431                           je 0x145c00230
0000000145c001ff 48ffce                         dec rsi
0000000145c00202 4889b5d80c0000                 mov qword ptr [rbp + 0xcd8], rsi
0000000145c00209 c685d00c000003                 mov byte ptr [rbp + 0xcd0], 3
0000000145c00210 c685d40e000000                 mov byte ptr [rbp + 0xed4], 0
0000000145c00217 488d8dd80c0000                 lea rcx, [rbp + 0xcd8]
0000000145c0021e e8ed023900                     call 0x145f90510
0000000145c00223 90                             nop
0000000145c00224 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
