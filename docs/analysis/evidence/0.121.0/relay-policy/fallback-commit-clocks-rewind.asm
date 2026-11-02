0000000145c597ff 488b85b8020000                 mov rax, qword ptr [rbp + 0x2b8]
0000000145c59806 4989442460                     mov qword ptr [r12 + 0x60], rax
0000000145c5980b 488b85f8020000                 mov rax, qword ptr [rbp + 0x2f8]
0000000145c59812 4989442468                     mov qword ptr [r12 + 0x68], rax
0000000145c59817 4d897c2470                     mov qword ptr [r12 + 0x70], r15
0000000145c5981c c6853003000000                 mov byte ptr [rbp + 0x330], 0
0000000145c59823 e8d8bf3300                     call 0x145f95800
0000000145c59828 90                             nop
0000000145c59829 49898424f0000000               mov qword ptr [r12 + 0xf0], rax
0000000145c59831 41899424f8000000               mov dword ptr [r12 + 0xf8], edx
0000000145c59839 4989842400010000               mov qword ptr [r12 + 0x100], rax
0000000145c59841 4189942408010000               mov dword ptr [r12 + 0x108], edx
0000000145c59849 4989842410010000               mov qword ptr [r12 + 0x110], rax
0000000145c59851 4189942418010000               mov dword ptr [r12 + 0x118], edx
0000000145c59859 498b8424c8010000               mov rax, qword ptr [r12 + 0x1c8]
0000000145c59861 498b8c24e0010000               mov rcx, qword ptr [r12 + 0x1e0]
0000000145c59869 660f6f00                       movdqa xmm0, xmmword ptr [rax]
0000000145c5986d 488d5010                       lea rdx, [rax + 0x10]
0000000145c59871 66440fd7c0                     pmovmskb r8d, xmm0
0000000145c59876 41f7d0                         not r8d
0000000145c59879 eb27                           jmp 0x145c598a2
0000000145c5987b 0f1f440000                     nop dword ptr [rax + rax]
0000000145c59880 458d48ff                       lea r9d, [r8 - 1]
0000000145c59884 f3450fbcd0                     tzcnt r10d, r8d
0000000145c59889 4521c1                         and r9d, r8d
0000000145c5988c 49f7da                         neg r10
0000000145c5988f 4d6bc270                       imul r8, r10, 0x70
0000000145c59893 4ac74400d800000000             mov qword ptr [rax + r8 - 0x28], 0
0000000145c5989c 48ffc9                         dec rcx
0000000145c5989f 4589c8                         mov r8d, r9d
0000000145c598a2 664585c0                       test r8w, r8w
0000000145c598a6 75d8                           jne 0x145c59880
0000000145c598a8 4885c9                         test rcx, rcx
0000000145c598ab 0f84bd040000                   je 0x145c59d6e
0000000145c598b1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c598c0 660f6f02                       movdqa xmm0, xmmword ptr [rdx]
0000000145c598c4 480500f9ffff                   add rax, -0x700
0000000145c598ca 4883c210                       add rdx, 0x10
0000000145c598ce 66440fd7c0                     pmovmskb r8d, xmm0
0000000145c598d3 4181f0ffff0000                 xor r8d, 0xffff
0000000145c598da 74e4                           je 0x145c598c0
