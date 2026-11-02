0000000145bb6475 488b96781a0000                 mov rdx, qword ptr [rsi + 0x1a78]
0000000145bb647c 488b86801a0000                 mov rax, qword ptr [rsi + 0x1a80]
0000000145bb6483 488d8d50060000                 lea rcx, [rbp + 0x650]
0000000145bb648a ff5028                         call qword ptr [rax + 0x28]
0000000145bb648d 488b8550060000                 mov rax, qword ptr [rbp + 0x650]
0000000145bb6494 48699d60060000e8000000         imul rbx, qword ptr [rbp + 0x660], 0xe8
0000000145bb649f 4c8bad58060000                 mov r13, qword ptr [rbp + 0x658]
0000000145bb64a6 4c01eb                         add rbx, r13
0000000145bb64a9 4c89adb00c0000                 mov qword ptr [rbp + 0xcb0], r13
0000000145bb64b0 4c89adb80c0000                 mov qword ptr [rbp + 0xcb8], r13
0000000145bb64b7 488985400d0000                 mov qword ptr [rbp + 0xd40], rax
0000000145bb64be 488985c00c0000                 mov qword ptr [rbp + 0xcc0], rax
0000000145bb64c5 48899dc80c0000                 mov qword ptr [rbp + 0xcc8], rbx
0000000145bb64cc 4c8db5f4010000                 lea r14, [rbp + 0x1f4]
0000000145bb64d3 488d4610                       lea rax, [rsi + 0x10]
0000000145bb64d7 488985500d0000                 mov qword ptr [rbp + 0xd50], rax
0000000145bb64de 488d86a0140000                 lea rax, [rsi + 0x14a0]
0000000145bb64e5 488985d00c0000                 mov qword ptr [rbp + 0xcd0], rax
0000000145bb64ec 488d86b8140000                 lea rax, [rsi + 0x14b8]
0000000145bb64f3 488985000d0000                 mov qword ptr [rbp + 0xd00], rax
0000000145bb64fa 488d86d3140000                 lea rax, [rsi + 0x14d3]
0000000145bb6501 488985280c0000                 mov qword ptr [rbp + 0xc28], rax
0000000145bb6508 488d8620190000                 lea rax, [rsi + 0x1920]
0000000145bb650f 488985600d0000                 mov qword ptr [rbp + 0xd60], rax
0000000145bb6516 488d86401a0000                 lea rax, [rsi + 0x1a40]
0000000145bb651d 488985f00c0000                 mov qword ptr [rbp + 0xcf0], rax
0000000145bb6524 488d8660190000                 lea rax, [rsi + 0x1960]
0000000145bb652b 488985f80c0000                 mov qword ptr [rbp + 0xcf8], rax
0000000145bb6532 488d86080e0000                 lea rax, [rsi + 0xe08]
0000000145bb6539 488985700b0000                 mov qword ptr [rbp + 0xb70], rax
0000000145bb6540 4c8dbdf0010000                 lea r15, [rbp + 0x1f0]
0000000145bb6547 488dbd500c0000                 lea rdi, [rbp + 0xc50]
0000000145bb654e 4c89ade80c0000                 mov qword ptr [rbp + 0xce8], r13
0000000145bb6555 eb11                           jmp 0x145bb6568
0000000145bb6557 660f1f840000000000             nop word ptr [rax + rax]
0000000145bb6560 4c89f9                         mov rcx, r15
0000000145bb6563 e8a828ffff                     call 0x145ba8e10
0000000145bb6568 4939dd                         cmp r13, rbx
0000000145bb656b 0f84820f0000                   je 0x145bb74f3
0000000145bb6571 4c89ea                         mov rdx, r13
0000000145bb6574 498d85e8000000                 lea rax, [r13 + 0xe8]
0000000145bb657b 4989c5                         mov r13, rax
0000000145bb657e 488985b80c0000                 mov qword ptr [rbp + 0xcb8], rax
0000000145bb6585 8b32                           mov esi, dword ptr [rdx]
0000000145bb6587 83feff                         cmp esi, -1
0000000145bb658a 0f84680f0000                   je 0x145bb74f8
0000000145bb6590 4883c204                       add rdx, 4
0000000145bb6594 89b5f0010000                   mov dword ptr [rbp + 0x1f0], esi
0000000145bb659a 41b8e4000000                   mov r8d, 0xe4
0000000145bb65a0 4c89f1                         mov rcx, r14
0000000145bb65a3 e873b14a00                     call 0x14606171b
0000000145bb65a8 c6853e0d000001                 mov byte ptr [rbp + 0xd3e], 1
0000000145bb65af 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb65b6 4c89fa                         mov rdx, r15
0000000145bb65b9 e8d2e40100                     call 0x145bd4a90
0000000145bb65be 90                             nop 
0000000145bb65bf 84c0                           test al, al
0000000145bb65c1 759d                           jne 0x145bb6560
0000000145bb65c3 83ee02                         sub esi, 2
0000000145bb65c6 b80b000000                     mov eax, 0xb
0000000145bb65cb 0f42f0                         cmovb esi, eax
0000000145bb65ce 8d46ec                         lea eax, [rsi - 0x14]
0000000145bb65d1 83f806                         cmp eax, 6
0000000145bb65d4 0f83d6000000                   jae 0x145bb66b0
0000000145bb65da 4d89f4                         mov r12, r14
0000000145bb65dd 41b8e8000000                   mov r8d, 0xe8
0000000145bb65e3 488d8d00030000                 lea rcx, [rbp + 0x300]
0000000145bb65ea 4c89fa                         mov rdx, r15
0000000145bb65ed e829b14a00                     call 0x14606171b
0000000145bb65f2 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb65f9 488338ff                       cmp qword ptr [rax], -1
0000000145bb65fd 740f                           je 0x145bb660e
0000000145bb65ff 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb6606 f20f11b0501a0000               movsd qword ptr [rax + 0x1a50], xmm6
0000000145bb660e 8b8500030000                   mov eax, dword ptr [rbp + 0x300]
0000000145bb6614 83e802                         sub eax, 2
0000000145bb6617 b90b000000                     mov ecx, 0xb
0000000145bb661c 0f42c1                         cmovb eax, ecx
0000000145bb661f 488985700d0000                 mov qword ptr [rbp + 0xd70], rax
0000000145bb6626 83c0ec                         add eax, -0x14
0000000145bb6629 83f805                         cmp eax, 5
0000000145bb662c 0f87a4040000                   ja 0x145bb6ad6
0000000145bb6632 488d0dcbf54c01                 lea rcx, [rip + 0x14cf5cb]
0000000145bb6639 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bb663d 4801c8                         add rax, rcx
0000000145bb6640 ffe0                           jmp rax
