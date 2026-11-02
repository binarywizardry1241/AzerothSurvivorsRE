145959449: 8b19 mov ebx, dword ptr [rcx]
14595944b: f30f107904 movss xmm7, dword ptr [rcx + 4]
145959450: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
145959456: f30f1035f28d4800 movss xmm6, dword ptr [rip + 0x488df2]
14595945e: 4889f1 mov rcx, rsi
145959461: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145959468: 0f28d6 movaps xmm2, xmm6
14595946b: 4531c9 xor r9d, r9d
14595946e: e8addeffff call 0x145957320
145959473: 4889f1 mov rcx, rsi
145959476: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595947d: 4889fa mov rdx, rdi
145959480: 4189d8 mov r8d, ebx
145959483: 0f28de movaps xmm3, xmm6
145959486: e865e3ffff call 0x1459577f0
14595948b: f30f11bd64010000 movss dword ptr [rbp + 0x164], xmm7
145959493: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14595949d: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
1459594a7: 488d8510010000 lea rax, [rbp + 0x110]
1459594ae: 4889442448 mov qword ptr [rsp + 0x48], rax
1459594b3: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
1459594ba: 895c2438 mov dword ptr [rsp + 0x38], ebx
1459594be: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
1459594c5: c74424306666a63f mov dword ptr [rsp + 0x30], 0x3fa66666
1459594cd: c744242800000000 mov dword ptr [rsp + 0x28], 0
1459594d5: 4c8d8560010000 lea r8, [rbp + 0x160]
1459594dc: 4889f1 mov rcx, rsi
1459594df: 4889fa mov rdx, rdi
1459594e2: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
1459594e9: e8f2e0ffff call 0x1459575e0
1459594ee: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
1459594f5: 4839d0 cmp rax, rdx
1459594f8: 0f82f0290000 jb 0x14595beee
1459594fe: 4c8d050b168d01 lea r8, [rip + 0x18d160b]
145959505: 4889c1 mov rcx, rax
145959508: e846014400 call 0x145d99653
14595950d: 0f0b ud2
