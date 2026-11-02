0000000145bb528d 488d8d50060000                 lea rcx, [rbp + 0x650]
0000000145bb5294 4c89fa                         mov rdx, r15
0000000145bb5297 e8c4f30100                     call 0x145bd4660
0000000145bb529c 498b8fc0140000                 mov rcx, qword ptr [r15 + 0x14c0]
0000000145bb52a3 498b97c8140000                 mov rdx, qword ptr [r15 + 0x14c8]
0000000145bb52aa e85100f5ff                     call 0x145b05300
0000000145bb52af 4869c0f0000000                 imul rax, rax, 0xf0
0000000145bb52b6 488d0df3524801                 lea rcx, [rip + 0x14852f3]
0000000145bb52bd 488b740808                     mov rsi, qword ptr [rax + rcx + 8]
0000000145bb52c2 488b7c0810                     mov rdi, qword ptr [rax + rcx + 0x10]
0000000145bb52c7 e834cf44fa                     call 0x140002200
0000000145bb52cc ba01000000                     mov edx, 1
0000000145bb52d1 4889f9                         mov rcx, rdi
0000000145bb52d4 e8e7ce44fa                     call 0x1400021c0
0000000145bb52d9 4885c0                         test rax, rax
0000000145bb52dc 0f84e0580000                   je 0x145bbabc2
0000000145bb52e2 4889c3                         mov rbx, rax
0000000145bb52e5 4889c1                         mov rcx, rax
0000000145bb52e8 4889f2                         mov rdx, rsi
0000000145bb52eb 4989f8                         mov r8, rdi
0000000145bb52ee e828c44a00                     call 0x14606171b
0000000145bb52f3 498b8fc0140000                 mov rcx, qword ptr [r15 + 0x14c0]
0000000145bb52fa 498b97c8140000                 mov rdx, qword ptr [r15 + 0x14c8]
0000000145bb5301 e8fafff4ff                     call 0x145b05300
0000000145bb5306 498d8f08120000                 lea rcx, [r15 + 0x1208]
0000000145bb530d 410fb697d0140000               movzx edx, byte ptr [r15 + 0x14d0]
0000000145bb5315 4989c0                         mov r8, rax
0000000145bb5318 4889bd600d0000                 mov qword ptr [rbp + 0xd60], rdi
0000000145bb531f 48899d700d0000                 mov qword ptr [rbp + 0xd70], rbx
0000000145bb5326 e8658bf5ff                     call 0x145b0de90
0000000145bb532b 90                             nop 
0000000145bb532c 418bb7d8140000                 mov esi, dword ptr [r15 + 0x14d8]
0000000145bb5333 0fb6c0                         movzx eax, al
0000000145bb5336 4038f0                         cmp al, sil
0000000145bb5339 0f42f0                         cmovb esi, eax
0000000145bb533c 488b8560060000                 mov rax, qword ptr [rbp + 0x660]
0000000145bb5343 48898510030000                 mov qword ptr [rbp + 0x310], rax
0000000145bb534a 0f108550060000                 movups xmm0, xmmword ptr [rbp + 0x650]
0000000145bb5351 0f298500030000                 movaps xmmword ptr [rbp + 0x300], xmm0
0000000145bb5358 4c8bad600d0000                 mov r13, qword ptr [rbp + 0xd60]
0000000145bb535f 4c89ad18030000                 mov qword ptr [rbp + 0x318], r13
0000000145bb5366 488b85700d0000                 mov rax, qword ptr [rbp + 0xd70]
0000000145bb536d 48898520030000                 mov qword ptr [rbp + 0x320], rax
0000000145bb5374 4c89ad28030000                 mov qword ptr [rbp + 0x328], r13
0000000145bb537b 4088b530030000                 mov byte ptr [rbp + 0x330], sil
0000000145bb5382 4183bf980d000003               cmp dword ptr [r15 + 0xd98], 3
0000000145bb538a 0f855b030000                   jne 0x145bb56eb
0000000145bb5390 4138b7100e0000                 cmp byte ptr [r15 + 0xe10], sil
0000000145bb5397 7557                           jne 0x145bb53f0
0000000145bb5399 4d8b87f00d0000                 mov r8, qword ptr [r15 + 0xdf0]
0000000145bb53a0 4c3b8510030000                 cmp r8, qword ptr [rbp + 0x310]
0000000145bb53a7 7547                           jne 0x145bb53f0
0000000145bb53a9 488b9508030000                 mov rdx, qword ptr [rbp + 0x308]
0000000145bb53b0 498b8fe80d0000                 mov rcx, qword ptr [r15 + 0xde8]
0000000145bb53b7 e824241600                     call 0x145d177e0
0000000145bb53bc 90                             nop 
0000000145bb53bd 4c8bbd800d0000                 mov r15, qword ptr [rbp + 0xd80]
0000000145bb53c4 4d39af080e0000                 cmp qword ptr [r15 + 0xe08], r13
0000000145bb53cb 0f94c1                         sete cl
0000000145bb53ce 84c8                           test al, cl
0000000145bb53d0 741e                           je 0x145bb53f0
0000000145bb53d2 498b8f000e0000                 mov rcx, qword ptr [r15 + 0xe00]
0000000145bb53d9 488b95700d0000                 mov rdx, qword ptr [rbp + 0xd70]
0000000145bb53e0 4d89e8                         mov r8, r13
0000000145bb53e3 e839c34a00                     call 0x146061721
0000000145bb53e8 85c0                           test eax, eax
0000000145bb53ea 0f84fb020000                   je 0x145bb56eb
0000000145bb53f0 488d8df00b0000                 lea rcx, [rbp + 0xbf0]
0000000145bb53f7 488d9500030000                 lea rdx, [rbp + 0x300]
0000000145bb53fe e8bd2c1500                     call 0x145d080c0
0000000145bb5403 90                             nop 
0000000145bb5404 89b5500d0000                   mov dword ptr [rbp + 0xd50], esi
0000000145bb540a 488d9518030000                 lea rdx, [rbp + 0x318]
0000000145bb5411 488d8d500c0000                 lea rcx, [rbp + 0xc50]
0000000145bb5418 e813f54700                     call 0x146034930
0000000145bb541d 90                             nop 
0000000145bb541e 488b95800d0000                 mov rdx, qword ptr [rbp + 0xd80]
0000000145bb5425 488d82e00d0000                 lea rax, [rdx + 0xde0]
0000000145bb542c 488985400d0000                 mov qword ptr [rbp + 0xd40], rax
0000000145bb5433 488b85000c0000                 mov rax, qword ptr [rbp + 0xc00]
0000000145bb543a 48898560060000                 mov qword ptr [rbp + 0x660], rax
0000000145bb5441 0f1085f00b0000                 movups xmm0, xmmword ptr [rbp + 0xbf0]
0000000145bb5448 0f298550060000                 movaps xmmword ptr [rbp + 0x650], xmm0
0000000145bb544f 0f1085500c0000                 movups xmm0, xmmword ptr [rbp + 0xc50]
0000000145bb5456 0f118568060000                 movups xmmword ptr [rbp + 0x668], xmm0
0000000145bb545d 488b85600c0000                 mov rax, qword ptr [rbp + 0xc60]
0000000145bb5464 48898578060000                 mov qword ptr [rbp + 0x678], rax
0000000145bb546b 488b8ae80d0000                 mov rcx, qword ptr [rdx + 0xde8]
0000000145bb5472 488b92f00d0000                 mov rdx, qword ptr [rdx + 0xdf0]
0000000145bb5479 e8e2551300                     call 0x145ceaa60
0000000145bb547e 90                             nop 
0000000145bb547f 488bbd400d0000                 mov rdi, qword ptr [rbp + 0xd40]
0000000145bb5486 488b07                         mov rax, qword ptr [rdi]
0000000145bb5489 4885c0                         test rax, rax
0000000145bb548c 488bb5800d0000                 mov rsi, qword ptr [rbp + 0xd80]
0000000145bb5493 7419                           je 0x145bb54ae
0000000145bb5495 488b8ee80d0000                 mov rcx, qword ptr [rsi + 0xde8]
0000000145bb549c 4869d0b8000000                 imul rdx, rax, 0xb8
0000000145bb54a3 41b808000000                   mov r8d, 8
0000000145bb54a9 e822cd44fa                     call 0x1400021d0
0000000145bb54ae 488b96f80d0000                 mov rdx, qword ptr [rsi + 0xdf8]
0000000145bb54b5 4885d2                         test rdx, rdx
0000000145bb54b8 8b9d500d0000                   mov ebx, dword ptr [rbp + 0xd50]
0000000145bb54be 7412                           je 0x145bb54d2
0000000145bb54c0 488b8e000e0000                 mov rcx, qword ptr [rsi + 0xe00]
0000000145bb54c7 41b801000000                   mov r8d, 1
0000000145bb54cd e8fecc44fa                     call 0x1400021d0
0000000145bb54d2 0f288550060000                 movaps xmm0, xmmword ptr [rbp + 0x650]
0000000145bb54d9 660f288d60060000               movapd xmm1, xmmword ptr [rbp + 0x660]
0000000145bb54e1 660f289570060000               movapd xmm2, xmmword ptr [rbp + 0x670]
0000000145bb54e9 660f115720                     movupd xmmword ptr [rdi + 0x20], xmm2
0000000145bb54ee 660f114f10                     movupd xmmword ptr [rdi + 0x10], xmm1
0000000145bb54f3 0f1107                         movups xmmword ptr [rdi], xmm0
0000000145bb54f6 889e100e0000                   mov byte ptr [rsi + 0xe10], bl
0000000145bb54fc 4c8ba6d00d0000                 mov r12, qword ptr [rsi + 0xdd0]
0000000145bb5503 4869bed80d0000e8040000         imul rdi, qword ptr [rsi + 0xdd8], 0x4e8
0000000145bb550e 4c01e7                         add rdi, r12
0000000145bb5511 488d8db00c0000                 lea rcx, [rbp + 0xcb0]
0000000145bb5518 488d9500030000                 lea rdx, [rbp + 0x300]
0000000145bb551f 4939fc                         cmp r12, rdi
0000000145bb5522 0f846f010000                   je 0x145bb5697
0000000145bb5528 4981c4e8040000                 add r12, 0x4e8
0000000145bb552f 90                             nop 
0000000145bb5530 41807c24fc00                   cmp byte ptr [r12 - 4], 0
0000000145bb5536 7512                           jne 0x145bb554a
0000000145bb5538 4939fc                         cmp r12, rdi
0000000145bb553b 4d8da424e8040000               lea r12, [r12 + 0x4e8]
0000000145bb5543 75eb                           jne 0x145bb5530
0000000145bb5545 e94d010000                     jmp 0x145bb5697
0000000145bb554a 4889ce                         mov rsi, rcx
0000000145bb554d 4989d6                         mov r14, rdx
0000000145bb5550 e86b2b1500                     call 0x145d080c0
0000000145bb5555 90                             nop 
0000000145bb5556 4d89ef                         mov r15, r13
0000000145bb5559 488d8df00b0000                 lea rcx, [rbp + 0xbf0]
0000000145bb5560 488d9518030000                 lea rdx, [rbp + 0x318]
0000000145bb5567 e8c4f34700                     call 0x146034930
0000000145bb556c 90                             nop 
0000000145bb556d 488b85c00c0000                 mov rax, qword ptr [rbp + 0xcc0]
0000000145bb5574 488985600c0000                 mov qword ptr [rbp + 0xc60], rax
0000000145bb557b 0f1085b00c0000                 movups xmm0, xmmword ptr [rbp + 0xcb0]
0000000145bb5582 0f2985500c0000                 movaps xmmword ptr [rbp + 0xc50], xmm0
0000000145bb5589 488b85000c0000                 mov rax, qword ptr [rbp + 0xc00]
0000000145bb5590 488d8d680c0000                 lea rcx, [rbp + 0xc68]
0000000145bb5597 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb559b 0f1085f00b0000                 movups xmm0, xmmword ptr [rbp + 0xbf0]
0000000145bb55a2 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb55a5 0f2885500c0000                 movaps xmm0, xmmword ptr [rbp + 0xc50]
0000000145bb55ac 488b85600c0000                 mov rax, qword ptr [rbp + 0xc60]
0000000145bb55b3 488b8d680c0000                 mov rcx, qword ptr [rbp + 0xc68]
0000000145bb55ba 660f288d700c0000               movapd xmm1, xmmword ptr [rbp + 0xc70]
0000000145bb55c2 488d9558060000                 lea rdx, [rbp + 0x658]
0000000145bb55c9 660f114a20                     movupd xmmword ptr [rdx + 0x20], xmm1
0000000145bb55ce 48894210                       mov qword ptr [rdx + 0x10], rax
0000000145bb55d2 48894a18                       mov qword ptr [rdx + 0x18], rcx
0000000145bb55d6 0f1102                         movups xmmword ptr [rdx], xmm0
0000000145bb55d9 889d88060000                   mov byte ptr [rbp + 0x688], bl
0000000145bb55df 48b81100000000000080           movabs rax, 0x8000000000000011
0000000145bb55e9 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb55f0 498b4c24e0                     mov rcx, qword ptr [r12 - 0x20]
0000000145bb55f5 498b5424e8                     mov rdx, qword ptr [r12 - 0x18]
0000000145bb55fa 4d8d842490fdffff               lea r8, [r12 - 0x270]
0000000145bb5602 e829c6fdff                     call 0x145b91c30
0000000145bb5607 90                             nop 
0000000145bb5608 498b5c24e0                     mov rbx, qword ptr [r12 - 0x20]
0000000145bb560d 4d8b6c24e8                     mov r13, qword ptr [r12 - 0x18]
0000000145bb5612 488d8d500c0000                 lea rcx, [rbp + 0xc50]
0000000145bb5619 488d9550060000                 lea rdx, [rbp + 0x650]
0000000145bb5620 e86bf41500                     call 0x145d14a90
0000000145bb5625 90                             nop 
0000000145bb5626 488b95580c0000                 mov rdx, qword ptr [rbp + 0xc58]
0000000145bb562d 4c8b85600c0000                 mov r8, qword ptr [rbp + 0xc60]
0000000145bb5634 f04c01050cbcaa02               lock add qword ptr [rip + 0x2aabc0c], r8
0000000145bb563c f048ff0514bcaa02               lock inc qword ptr [rip + 0x2aabc14]
0000000145bb5644 4889d9                         mov rcx, rbx
0000000145bb5647 488995400d0000                 mov qword ptr [rbp + 0xd40], rdx
0000000145bb564e 41ff5518                       call qword ptr [r13 + 0x18]
0000000145bb5652 90                             nop 
0000000145bb5653 488b95500c0000                 mov rdx, qword ptr [rbp + 0xc50]
0000000145bb565a 4885d2                         test rdx, rdx
0000000145bb565d 4d89fd                         mov r13, r15
0000000145bb5660 7413                           je 0x145bb5675
0000000145bb5662 41b801000000                   mov r8d, 1
0000000145bb5668 488b8d400d0000                 mov rcx, qword ptr [rbp + 0xd40]
0000000145bb566f e85ccb44fa                     call 0x1400021d0
0000000145bb5674 90                             nop 
0000000145bb5675 488d8d50060000                 lea rcx, [rbp + 0x650]
0000000145bb567c e84f4fffff                     call 0x145baa5d0
0000000145bb5681 90                             nop 
0000000145bb5682 8b9d500d0000                   mov ebx, dword ptr [rbp + 0xd50]
0000000145bb5688 4889f1                         mov rcx, rsi
0000000145bb568b 4c89f2                         mov rdx, r14
0000000145bb568e 4939fc                         cmp r12, rdi
0000000145bb5691 0f8591feffff                   jne 0x145bb5528
0000000145bb5697 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb569e 488bb0481b0000                 mov rsi, qword ptr [rax + 0x1b48]
0000000145bb56a5 4883b818190000ff               cmp qword ptr [rax + 0x1918], -1
0000000145bb56ad 7455                           je 0x145bb5704
0000000145bb56af 4883b848190000ff               cmp qword ptr [rax + 0x1948], -1
0000000145bb56b7 744b                           je 0x145bb5704
0000000145bb56b9 488d9048190000                 lea rdx, [rax + 0x1948]
0000000145bb56c0 488d8d500c0000                 lea rcx, [rbp + 0xc50]
0000000145bb56c7 e864f24700                     call 0x146034930
0000000145bb56cc 90                             nop 
0000000145bb56cd 488b85500c0000                 mov rax, qword ptr [rbp + 0xc50]
0000000145bb56d4 488985500d0000                 mov qword ptr [rbp + 0xd50], rax
0000000145bb56db 4c8b8d580c0000                 mov r9, qword ptr [rbp + 0xc58]
0000000145bb56e2 488b85600c0000                 mov rax, qword ptr [rbp + 0xc60]
0000000145bb56e9 eb4d                           jmp 0x145bb5738
