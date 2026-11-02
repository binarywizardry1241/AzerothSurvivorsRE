; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf92bd 49833eff                       cmp qword ptr [r14], -1
0000000145bf92c1 742a                           je 0x145bf92ed
0000000145bf92c3 4180bc242901000000             cmp byte ptr [r12 + 0x129], 0
0000000145bf92cc 0f8523040000                   jne 0x145bf96f5
0000000145bf92d2 4183bc2410010000ff             cmp dword ptr [r12 + 0x110], -1
0000000145bf92db 0f8514040000                   jne 0x145bf96f5
0000000145bf92e1 b820010000                     mov eax, 0x120
0000000145bf92e6 b918010000                     mov ecx, 0x118
0000000145bf92eb eb0a                           jmp 0x145bf92f7
0000000145bf92ed b870010000                     mov eax, 0x170
0000000145bf92f2 b968010000                     mov ecx, 0x168
0000000145bf92f7 498b0c0c                       mov rcx, qword ptr [r12 + rcx]
0000000145bf92fb 498b0404                       mov rax, qword ptr [r12 + rax]
0000000145bf92ff 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145bf9303 c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf930a ffd0                           call rax
0000000145bf930c 90                             nop
0000000145bf930d 3c01                           cmp al, 1
0000000145bf930f 0f85e0030000                   jne 0x145bf96f5
0000000145bf9315 498d8c2440010000               lea rcx, [r12 + 0x140]
0000000145bf931d c685c702000000                 mov byte ptr [rbp + 0x2c7], 0
0000000145bf9324 e837b83500                     call 0x145f54b60
0000000145bf9329 90                             nop
0000000145bf932a 4885c0                         test rax, rax
0000000145bf932d 780a                           js 0x145bf9339
0000000145bf932f 0f57c0                         xorps xmm0, xmm0
0000000145bf9332 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf9337 eb18                           jmp 0x145bf9351
0000000145bf9339 4889c1                         mov rcx, rax
0000000145bf933c 48d1e9                         shr rcx, 1
0000000145bf933f 83e001                         and eax, 1
0000000145bf9342 4809c8                         or rax, rcx
0000000145bf9345 0f57c0                         xorps xmm0, xmm0
0000000145bf9348 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf934d f30f58c0                       addss xmm0, xmm0
0000000145bf9351 0f57f6                         xorps xmm6, xmm6
0000000145bf9354 f30f2af2                       cvtsi2ss xmm6, edx
0000000145bf9358 f30f5e3590096000               divss xmm6, dword ptr [rip + 0x600990]
0000000145bf9360 f30f58f0                       addss xmm6, xmm0
0000000145bf9364 48c7850002000000000000         mov qword ptr [rbp + 0x200], 0
0000000145bf936f 48c7850802000008000000         mov qword ptr [rbp + 0x208], 8
0000000145bf937a 48c7851002000000000000         mov qword ptr [rbp + 0x210], 0
0000000145bf9385 498bb424b0010000               mov rsi, qword ptr [r12 + 0x1b0]
0000000145bf938d 4d8bb424c8010000               mov r14, qword ptr [r12 + 0x1c8]
0000000145bf9395 660f6f06                       movdqa xmm0, xmmword ptr [rsi]
0000000145bf9399 4c8d7e10                       lea r15, [rsi + 0x10]
0000000145bf939d 66440fd7e8                     pmovmskb r13d, xmm0
0000000145bf93a2 41f7d5                         not r13d
0000000145bf93a5 f30f103d43096000               movss xmm7, dword ptr [rip + 0x600943]
0000000145bf93ad f3440f1005faf75900             movss xmm8, dword ptr [rip + 0x59f7fa]
0000000145bf93b6 f3440f100d35145800             movss xmm9, dword ptr [rip + 0x581435]
0000000145bf93bf eb40                           jmp 0x145bf9401
0000000145bf93c1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145bf93d0 488b8508020000                 mov rax, qword ptr [rbp + 0x208]
0000000145bf93d7 488d0c9b                       lea rcx, [rbx + rbx*4]
0000000145bf93db 893cc8                         mov dword ptr [rax + rcx*8], edi
0000000145bf93de 48ba0100000000000080           movabs rdx, 0x8000000000000001
0000000145bf93e8 488954c808                     mov qword ptr [rax + rcx*8 + 8], rdx
0000000145bf93ed 4c8964c810                     mov qword ptr [rax + rcx*8 + 0x10], r12
0000000145bf93f2 c644c81800                     mov byte ptr [rax + rcx*8 + 0x18], 0
0000000145bf93f7 48ffc3                         inc rbx
0000000145bf93fa 48899d10020000                 mov qword ptr [rbp + 0x210], rbx
0000000145bf9401 4d85f6                         test r14, r14
0000000145bf9404 0f846b010000                   je 0x145bf9575
0000000145bf940a 664585ed                       test r13w, r13w
0000000145bf940e 751e                           jne 0x145bf942e
0000000145bf9410 66410f6f07                     movdqa xmm0, xmmword ptr [r15]
0000000145bf9415 4881c680f9ffff                 add rsi, -0x680
0000000145bf941c 4983c710                       add r15, 0x10
0000000145bf9420 66440fd7e8                     pmovmskb r13d, xmm0
0000000145bf9425 4181f5ffff0000                 xor r13d, 0xffff
0000000145bf942c 74e2                           je 0x145bf9410
0000000145bf942e 418d45ff                       lea eax, [r13 - 1]
0000000145bf9432 f3410fbccd                     tzcnt ecx, r13d
0000000145bf9437 4421e8                         and eax, r13d
0000000145bf943a 4189c5                         mov r13d, eax
0000000145bf943d 48f7d9                         neg rcx
0000000145bf9440 486bc168                       imul rax, rcx, 0x68
0000000145bf9444 488d1c06                       lea rbx, [rsi + rax]
0000000145bf9448 49ffce                         dec r14
0000000145bf944b 8b7c0698                       mov edi, dword ptr [rsi + rax - 0x68]
0000000145bf944f 807c06f800                     cmp byte ptr [rsi + rax - 8], 0
0000000145bf9454 746d                           je 0x145bf94c3
0000000145bf9456 8b43c8                         mov eax, dword ptr [rbx - 0x38]
0000000145bf9459 83f8ff                         cmp eax, -1
0000000145bf945c 0f84ce000000                   je 0x145bf9530
0000000145bf9462 488b4bc0                       mov rcx, qword ptr [rbx - 0x40]
0000000145bf9466 48898d00010000                 mov qword ptr [rbp + 0x100], rcx
0000000145bf946d 898508010000                   mov dword ptr [rbp + 0x108], eax
0000000145bf9473 c685c002000001                 mov byte ptr [rbp + 0x2c0], 1
0000000145bf947a 488d8d00010000                 lea rcx, [rbp + 0x100]
0000000145bf9481 e8dab63500                     call 0x145f54b60
0000000145bf9486 90                             nop
0000000145bf9487 4885c0                         test rax, rax
0000000145bf948a 780a                           js 0x145bf9496
0000000145bf948c 0f57c0                         xorps xmm0, xmm0
0000000145bf948f f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf9494 eb18                           jmp 0x145bf94ae
0000000145bf9496 4889c1                         mov rcx, rax
0000000145bf9499 48d1e9                         shr rcx, 1
0000000145bf949c 83e001                         and eax, 1
0000000145bf949f 4809c8                         or rax, rcx
0000000145bf94a2 0f57c0                         xorps xmm0, xmm0
0000000145bf94a5 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bf94aa f30f58c0                       addss xmm0, xmm0
0000000145bf94ae 0f57c9                         xorps xmm1, xmm1
0000000145bf94b1 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bf94b5 f30f5ecf                       divss xmm1, xmm7
0000000145bf94b9 f30f58c8                       addss xmm1, xmm0
0000000145bf94bd 410f2ec8                       ucomiss xmm1, xmm8
0000000145bf94c1 736d                           jae 0x145bf9530
0000000145bf94c3 410f2ef1                       ucomiss xmm6, xmm9
0000000145bf94c7 0f8234ffffff                   jb 0x145bf9401
0000000145bf94cd 4c8b63e8                       mov r12, qword ptr [rbx - 0x18]
0000000145bf94d1 4c3b63f0                       cmp r12, qword ptr [rbx - 0x10]
0000000145bf94d5 0f8626ffffff                   jbe 0x145bf9401
0000000145bf94db 4c8963f0                       mov qword ptr [rbx - 0x10], r12
0000000145bf94df 488b9d10020000                 mov rbx, qword ptr [rbp + 0x210]
0000000145bf94e6 483b9d00020000                 cmp rbx, qword ptr [rbp + 0x200]
0000000145bf94ed 7514                           jne 0x145bf9503
0000000145bf94ef c685c002000001                 mov byte ptr [rbp + 0x2c0], 1
0000000145bf94f6 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bf94fd e8ee203b00                     call 0x145fab5f0
0000000145bf9502 90                             nop
0000000145bf9503 488b8508020000                 mov rax, qword ptr [rbp + 0x208]
0000000145bf950a 488d0c9b                       lea rcx, [rbx + rbx*4]
0000000145bf950e 893cc8                         mov dword ptr [rax + rcx*8], edi
0000000145bf9511 48ba0000000000000080           movabs rdx, 0x8000000000000000
0000000145bf951b 488954c808                     mov qword ptr [rax + rcx*8 + 8], rdx
0000000145bf9520 4c8964c810                     mov qword ptr [rax + rcx*8 + 0x10], r12
0000000145bf9525 e9cdfeffff                     jmp 0x145bf93f7
0000000145bf952a 660f1f440000                   nop word ptr [rax + rax]
0000000145bf9530 c685c002000001                 mov byte ptr [rbp + 0x2c0], 1
0000000145bf9537 e8d4b43500                     call 0x145f54a10
0000000145bf953c 90                             nop
0000000145bf953d 488943c0                       mov qword ptr [rbx - 0x40], rax
0000000145bf9541 8953c8                         mov dword ptr [rbx - 0x38], edx
0000000145bf9544 4c8b63e8                       mov r12, qword ptr [rbx - 0x18]
0000000145bf9548 488b9d10020000                 mov rbx, qword ptr [rbp + 0x210]
0000000145bf954f 483b9d00020000                 cmp rbx, qword ptr [rbp + 0x200]
0000000145bf9556 0f8574feffff                   jne 0x145bf93d0
0000000145bf955c c685c002000001                 mov byte ptr [rbp + 0x2c0], 1
0000000145bf9563 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bf956a e881203b00                     call 0x145fab5f0
0000000145bf956f 90                             nop
0000000145bf9570 e95bfeffff                     jmp 0x145bf93d0
0000000145bf9575 0f2e3578125800                 ucomiss xmm6, dword ptr [rip + 0x581278]
0000000145bf957c 7221                           jb 0x145bf959f
0000000145bf957e c685c002000001                 mov byte ptr [rbp + 0x2c0], 1
0000000145bf9585 e886b43500                     call 0x145f54a10
0000000145bf958a 90                             nop
0000000145bf958b 488b8d88020000                 mov rcx, qword ptr [rbp + 0x288]
0000000145bf9592 48898140010000                 mov qword ptr [rcx + 0x140], rax
0000000145bf9599 899148010000                   mov dword ptr [rcx + 0x148], edx
0000000145bf959f 488b9d00020000                 mov rbx, qword ptr [rbp + 0x200]
0000000145bf95a6 488bbd08020000                 mov rdi, qword ptr [rbp + 0x208]
0000000145bf95ad 488b8510020000                 mov rax, qword ptr [rbp + 0x210]
0000000145bf95b4 488d0cc500000000               lea rcx, [rax*8]
0000000145bf95bc 4c8d3c89                       lea r15, [rcx + rcx*4]
0000000145bf95c0 4e8d343f                       lea r14, [rdi + r15]
0000000145bf95c4 4889bd80000000                 mov qword ptr [rbp + 0x80], rdi
0000000145bf95cb 48899d90000000                 mov qword ptr [rbp + 0x90], rbx
0000000145bf95d2 4c89b598000000                 mov qword ptr [rbp + 0x98], r14
0000000145bf95d9 4989f8                         mov r8, rdi
0000000145bf95dc 4885c0                         test rax, rax
0000000145bf95df 4c8ba588020000                 mov r12, qword ptr [rbp + 0x288]
0000000145bf95e6 0f848e000000                   je 0x145bf967a
0000000145bf95ec 4c8d4728                       lea r8, [rdi + 0x28]
0000000145bf95f0 488db500010000                 lea rsi, [rbp + 0x100]
0000000145bf95f7 4c8dad08010000                 lea r13, [rbp + 0x108]
0000000145bf95fe eb15                           jmp 0x145bf9615
0000000145bf9600 4c8b85a0020000                 mov r8, qword ptr [rbp + 0x2a0]
0000000145bf9607 4983c028                       add r8, 0x28
0000000145bf960b 4983c7d8                       add r15, -0x28
0000000145bf960f 0f84c5000000                   je 0x145bf96da
0000000145bf9615 498b40e0                       mov rax, qword ptr [r8 - 0x20]
0000000145bf9619 4883f8ff                       cmp rax, -1
0000000145bf961d 745b                           je 0x145bf967a
0000000145bf961f 418b50d8                       mov edx, dword ptr [r8 - 0x28]
0000000145bf9623 48898500010000                 mov qword ptr [rbp + 0x100], rax
0000000145bf962a 48898590020000                 mov qword ptr [rbp + 0x290], rax
0000000145bf9631 498b40f8                       mov rax, qword ptr [r8 - 8]
0000000145bf9635 49894510                       mov qword ptr [r13 + 0x10], rax
0000000145bf9639 4c8985a0020000                 mov qword ptr [rbp + 0x2a0], r8
0000000145bf9640 f3410f6f40e8                   movdqu xmm0, xmmword ptr [r8 - 0x18]
0000000145bf9646 f3410f7f4500                   movdqu xmmword ptr [r13], xmm0
0000000145bf964c 4c89e1                         mov rcx, r12
0000000145bf964f 4989f0                         mov r8, rsi
0000000145bf9652 e8c9d6ffff                     call 0x145bf6d20
0000000145bf9657 90                             nop
0000000145bf9658 488b9590020000                 mov rdx, qword ptr [rbp + 0x290]
0000000145bf965f 4885d2                         test rdx, rdx
0000000145bf9662 789c                           js 0x145bf9600
0000000145bf9664 749a                           je 0x145bf9600
0000000145bf9666 488b8d08010000                 mov rcx, qword ptr [rbp + 0x108]
0000000145bf966d 41b801000000                   mov r8d, 1
0000000145bf9673 e8588b40fa                     call 0x1400021d0
0000000145bf9678 eb86                           jmp 0x145bf9600
0000000145bf967a 4c89f0                         mov rax, r14
0000000145bf967d 4c29c0                         sub rax, r8
0000000145bf9680 48b9cdcccccccccccccc           movabs rcx, 0xcccccccccccccccd
0000000145bf968a 48f7e1                         mul rcx
0000000145bf968d 4c898588000000                 mov qword ptr [rbp + 0x88], r8
0000000145bf9694 4d39c6                         cmp r14, r8
0000000145bf9697 7441                           je 0x145bf96da
0000000145bf9699 4889d6                         mov rsi, rdx
0000000145bf969c 48c1ee05                       shr rsi, 5
0000000145bf96a0 4983c010                       add r8, 0x10
0000000145bf96a4 eb13                           jmp 0x145bf96b9
0000000145bf96a6 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145bf96b0 4983c028                       add r8, 0x28
0000000145bf96b4 48ffce                         dec rsi
0000000145bf96b7 7421                           je 0x145bf96da
0000000145bf96b9 498b50f8                       mov rdx, qword ptr [r8 - 8]
0000000145bf96bd 4885d2                         test rdx, rdx
0000000145bf96c0 78ee                           js 0x145bf96b0
0000000145bf96c2 74ec                           je 0x145bf96b0
0000000145bf96c4 498b08                         mov rcx, qword ptr [r8]
0000000145bf96c7 4d89c6                         mov r14, r8
0000000145bf96ca 41b801000000                   mov r8d, 1
0000000145bf96d0 e8fb8a40fa                     call 0x1400021d0
0000000145bf96d5 4d89f0                         mov r8, r14
0000000145bf96d8 ebd6                           jmp 0x145bf96b0
0000000145bf96da 4885db                         test rbx, rbx
0000000145bf96dd 7416                           je 0x145bf96f5
0000000145bf96df 48c1e303                       shl rbx, 3
0000000145bf96e3 488d149b                       lea rdx, [rbx + rbx*4]
0000000145bf96e7 41b808000000                   mov r8d, 8
0000000145bf96ed 4889f9                         mov rcx, rdi
0000000145bf96f0 e8db8a40fa                     call 0x1400021d0
