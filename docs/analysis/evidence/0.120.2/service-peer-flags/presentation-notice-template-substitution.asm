; Current0.120.2 PE-declared helper extent; native decoded instructions, not original source.
0000000145b4f3f0 55                             push rbp
0000000145b4f3f1 4157                           push r15
0000000145b4f3f3 4156                           push r14
0000000145b4f3f5 4155                           push r13
0000000145b4f3f7 4154                           push r12
0000000145b4f3f9 56                             push rsi
0000000145b4f3fa 57                             push rdi
0000000145b4f3fb 53                             push rbx
0000000145b4f3fc 4881ec98000000                 sub rsp, 0x98
0000000145b4f403 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b4f40b 48c74510feffffff               mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0000000145b4f413 4c89c6                         mov rsi, r8
0000000145b4f416 4883c610                       add rsi, 0x10
0000000145b4f41a 790f                           jns 0x145b4f42b
0000000145b4f41c 31ff                           xor edi, edi
0000000145b4f41e 4889f9                         mov rcx, rdi
0000000145b4f421 4889f2                         mov rdx, rsi
0000000145b4f424 e8822c6000                     call 0x1461520ab
0000000145b4f429 0f0b                           ud2
0000000145b4f42b 4d89c7                         mov r15, r8
0000000145b4f42e 4889d3                         mov rbx, rdx
0000000145b4f431 48894dc8                       mov qword ptr [rbp - 0x38], rcx
0000000145b4f435 7424                           je 0x145b4f45b
0000000145b4f437 4d89ce                         mov r14, r9
0000000145b4f43a e8c12d4bfa                     call 0x140002200
0000000145b4f43f bf01000000                     mov edi, 1
0000000145b4f444 ba01000000                     mov edx, 1
0000000145b4f449 4889f1                         mov rcx, rsi
0000000145b4f44c e86f2d4bfa                     call 0x1400021c0
0000000145b4f451 4885c0                         test rax, rax
0000000145b4f454 74c8                           je 0x145b4f41e
0000000145b4f456 4d89f1                         mov r9, r14
0000000145b4f459 eb05                           jmp 0x145b4f460
0000000145b4f45b b801000000                     mov eax, 1
0000000145b4f460 488b8d80000000                 mov rcx, qword ptr [rbp + 0x80]
0000000145b4f467 488975f8                       mov qword ptr [rbp - 8], rsi
0000000145b4f46b 48894500                       mov qword ptr [rbp], rax
0000000145b4f46f 48c7450800000000               mov qword ptr [rbp + 8], 0
0000000145b4f477 48c1e105                       shl rcx, 5
0000000145b4f47b 48894dd8                       mov qword ptr [rbp - 0x28], rcx
0000000145b4f47f 4983c110                       add r9, 0x10
0000000145b4f483 4c894dd0                       mov qword ptr [rbp - 0x30], r9
0000000145b4f487 31c0                           xor eax, eax
0000000145b4f489 eb0e                           jmp 0x145b4f499
0000000145b4f48b 0f1f440000                     nop dword ptr [rax + rax]
0000000145b4f490 4c39f8                         cmp rax, r15
0000000145b4f493 0f870a040000                   ja 0x145b4f8a3
0000000145b4f499 4889c7                         mov rdi, rax
0000000145b4f49c 4d89f8                         mov r8, r15
0000000145b4f49f 4929c0                         sub r8, rax
0000000145b4f4a2 488d1403                       lea rdx, [rbx + rax]
0000000145b4f4a6 4983f810                       cmp r8, 0x10
0000000145b4f4aa 7334                           jae 0x145b4f4e0
0000000145b4f4ac 31f6                           xor esi, esi
0000000145b4f4ae 4d85c0                         test r8, r8
0000000145b4f4b1 741e                           je 0x145b4f4d1
0000000145b4f4b3 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145b4f4c0 803c327b                       cmp byte ptr [rdx + rsi], 0x7b
0000000145b4f4c4 7430                           je 0x145b4f4f6
0000000145b4f4c6 48ffc6                         inc rsi
0000000145b4f4c9 4939f0                         cmp r8, rsi
0000000145b4f4cc 75f2                           jne 0x145b4f4c0
0000000145b4f4ce 4c89c6                         mov rsi, r8
0000000145b4f4d1 31c0                           xor eax, eax
0000000145b4f4d3 4883f801                       cmp rax, 1
0000000145b4f4d7 7437                           je 0x145b4f510
0000000145b4f4d9 e9c5030000                     jmp 0x145b4f8a3
0000000145b4f4de 6690                           nop
0000000145b4f4e0 b17b                           mov cl, 0x7b
0000000145b4f4e2 e8c9704300                     call 0x145f865b0
0000000145b4f4e7 90                             nop
0000000145b4f4e8 4889d6                         mov rsi, rdx
0000000145b4f4eb 4883f801                       cmp rax, 1
0000000145b4f4ef 741f                           je 0x145b4f510
0000000145b4f4f1 e9ad030000                     jmp 0x145b4f8a3
0000000145b4f4f6 b801000000                     mov eax, 1
0000000145b4f4fb 4883f801                       cmp rax, 1
0000000145b4f4ff 0f859e030000                   jne 0x145b4f8a3
0000000145b4f505 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145b4f510 488d043e                       lea rax, [rsi + rdi]
0000000145b4f514 48ffc0                         inc rax
0000000145b4f517 4c8d343e                       lea r14, [rsi + rdi]
0000000145b4f51b 4d89fd                         mov r13, r15
0000000145b4f51e 4d29f5                         sub r13, r14
0000000145b4f521 0f8669ffffff                   jbe 0x145b4f490
0000000145b4f527 420fb60c33                     movzx ecx, byte ptr [rbx + r14]
0000000145b4f52c 4c39f8                         cmp rax, r15
0000000145b4f52f 7709                           ja 0x145b4f53a
0000000145b4f531 80f97b                         cmp cl, 0x7b
0000000145b4f534 0f855fffffff                   jne 0x145b4f499
0000000145b4f53a 80f97b                         cmp cl, 0x7b
0000000145b4f53d 0f8560030000                   jne 0x145b4f8a3
0000000145b4f543 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145b4f547 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f54b 4829d0                         sub rax, rdx
0000000145b4f54e 4939c6                         cmp r14, rax
0000000145b4f551 0f878e020000                   ja 0x145b4f7e5
0000000145b4f557 4d85f6                         test r14, r14
0000000145b4f55a 7416                           je 0x145b4f572
0000000145b4f55c 48035500                       add rdx, qword ptr [rbp]
0000000145b4f560 4889d1                         mov rcx, rdx
0000000145b4f563 4889da                         mov rdx, rbx
0000000145b4f566 4d89f0                         mov r8, r14
0000000145b4f569 e8bdb84500                     call 0x145faae2b
0000000145b4f56e 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f572 4c01f2                         add rdx, r14
0000000145b4f575 48895508                       mov qword ptr [rbp + 8], rdx
0000000145b4f579 4d8d4601                       lea r8, [r14 + 1]
0000000145b4f57d 4c89f8                         mov rax, r15
0000000145b4f580 4c29c0                         sub rax, r8
0000000145b4f583 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145b4f587 760b                           jbe 0x145b4f594
0000000145b4f589 42803c03c0                     cmp byte ptr [rbx + r8], 0xc0
0000000145b4f58e 0f8ca6030000                   jl 0x145b4f93a
0000000145b4f594 4a8d0433                       lea rax, [rbx + r14]
0000000145b4f598 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145b4f59c 4901d8                         add r8, rbx
0000000145b4f59f 4c8945f0                       mov qword ptr [rbp - 0x10], r8
0000000145b4f5a3 48f7d6                         not rsi
0000000145b4f5a6 4c01fe                         add rsi, r15
0000000145b4f5a9 4829fe                         sub rsi, rdi
0000000145b4f5ac 4531e4                         xor r12d, r12d
0000000145b4f5af eb1b                           jmp 0x145b4f5cc
0000000145b4f5b1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b4f5c0 4989c4                         mov r12, rax
0000000145b4f5c3 4839d0                         cmp rax, rdx
0000000145b4f5c6 0f87d3010000                   ja 0x145b4f79f
0000000145b4f5cc 4c8b45e8                       mov r8, qword ptr [rbp - 0x18]
0000000145b4f5d0 4d29e0                         sub r8, r12
0000000145b4f5d3 4983f810                       cmp r8, 0x10
0000000145b4f5d7 7337                           jae 0x145b4f610
0000000145b4f5d9 4d85c0                         test r8, r8
0000000145b4f5dc 7450                           je 0x145b4f62e
0000000145b4f5de 4889f0                         mov rax, rsi
0000000145b4f5e1 4c29e0                         sub rax, r12
0000000145b4f5e4 4a8d0c33                       lea rcx, [rbx + r14]
0000000145b4f5e8 48ffc1                         inc rcx
0000000145b4f5eb 4c01e1                         add rcx, r12
0000000145b4f5ee 31ff                           xor edi, edi
0000000145b4f5f0 803c397d                       cmp byte ptr [rcx + rdi], 0x7d
0000000145b4f5f4 7447                           je 0x145b4f63d
0000000145b4f5f6 48ffc7                         inc rdi
0000000145b4f5f9 4839f8                         cmp rax, rdi
0000000145b4f5fc 75f2                           jne 0x145b4f5f0
0000000145b4f5fe 4c89c7                         mov rdi, r8
0000000145b4f601 31c0                           xor eax, eax
0000000145b4f603 4883f801                       cmp rax, 1
0000000145b4f607 7447                           je 0x145b4f650
0000000145b4f609 e991010000                     jmp 0x145b4f79f
0000000145b4f60e 6690                           nop
0000000145b4f610 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b4f614 4a8d1420                       lea rdx, [rax + r12]
0000000145b4f618 b17d                           mov cl, 0x7d
0000000145b4f61a e8916f4300                     call 0x145f865b0
0000000145b4f61f 90                             nop
0000000145b4f620 4889d7                         mov rdi, rdx
0000000145b4f623 4883f801                       cmp rax, 1
0000000145b4f627 7427                           je 0x145b4f650
0000000145b4f629 e971010000                     jmp 0x145b4f79f
0000000145b4f62e 31ff                           xor edi, edi
0000000145b4f630 31c0                           xor eax, eax
0000000145b4f632 4883f801                       cmp rax, 1
0000000145b4f636 7418                           je 0x145b4f650
0000000145b4f638 e962010000                     jmp 0x145b4f79f
0000000145b4f63d b801000000                     mov eax, 1
0000000145b4f642 4883f801                       cmp rax, 1
0000000145b4f646 0f8553010000                   jne 0x145b4f79f
0000000145b4f64c 0f1f4000                       nop dword ptr [rax]
0000000145b4f650 4a8d0427                       lea rax, [rdi + r12]
0000000145b4f654 48ffc0                         inc rax
0000000145b4f657 4c01e7                         add rdi, r12
0000000145b4f65a 488b55e8                       mov rdx, qword ptr [rbp - 0x18]
0000000145b4f65e 4839d7                         cmp rdi, rdx
0000000145b4f661 0f8359ffffff                   jae 0x145b4f5c0
0000000145b4f667 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145b4f66b 0fb60c39                       movzx ecx, byte ptr [rcx + rdi]
0000000145b4f66f 4839d0                         cmp rax, rdx
0000000145b4f672 770c                           ja 0x145b4f680
0000000145b4f674 4989c4                         mov r12, rax
0000000145b4f677 80f97d                         cmp cl, 0x7d
0000000145b4f67a 0f854cffffff                   jne 0x145b4f5cc
0000000145b4f680 80f97d                         cmp cl, 0x7d
0000000145b4f683 0f8516010000                   jne 0x145b4f79f
0000000145b4f689 488b5dd8                       mov rbx, qword ptr [rbp - 0x28]
0000000145b4f68d 488b75d0                       mov rsi, qword ptr [rbp - 0x30]
0000000145b4f691 4883bd8000000000               cmp qword ptr [rbp + 0x80], 0
0000000145b4f699 4c8b75f0                       mov r14, qword ptr [rbp - 0x10]
0000000145b4f69d 0f858b000000                   jne 0x145b4f72e
0000000145b4f6a3 488b7508                       mov rsi, qword ptr [rbp + 8]
0000000145b4f6a7 483975f8                       cmp qword ptr [rbp - 8], rsi
0000000145b4f6ab 0f847b010000                   je 0x145b4f82c
0000000145b4f6b1 488b4500                       mov rax, qword ptr [rbp]
0000000145b4f6b5 c604307b                       mov byte ptr [rax + rsi], 0x7b
0000000145b4f6b9 48ffc6                         inc rsi
0000000145b4f6bc 48897508                       mov qword ptr [rbp + 8], rsi
0000000145b4f6c0 488b55f8                       mov rdx, qword ptr [rbp - 8]
0000000145b4f6c4 4889d0                         mov rax, rdx
0000000145b4f6c7 4829f0                         sub rax, rsi
0000000145b4f6ca 4839c7                         cmp rdi, rax
0000000145b4f6cd 0f8780010000                   ja 0x145b4f853
0000000145b4f6d3 4885ff                         test rdi, rdi
0000000145b4f6d6 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b4f6da 741a                           je 0x145b4f6f6
0000000145b4f6dc 48037500                       add rsi, qword ptr [rbp]
0000000145b4f6e0 4889f1                         mov rcx, rsi
0000000145b4f6e3 4889c2                         mov rdx, rax
0000000145b4f6e6 4989f8                         mov r8, rdi
0000000145b4f6e9 e83db74500                     call 0x145faae2b
0000000145b4f6ee 488b55f8                       mov rdx, qword ptr [rbp - 8]
0000000145b4f6f2 488b7508                       mov rsi, qword ptr [rbp + 8]
0000000145b4f6f6 4801fe                         add rsi, rdi
0000000145b4f6f9 48897508                       mov qword ptr [rbp + 8], rsi
0000000145b4f6fd 4839f2                         cmp rdx, rsi
0000000145b4f700 0f8479010000                   je 0x145b4f87f
0000000145b4f706 488b4500                       mov rax, qword ptr [rbp]
0000000145b4f70a c604307d                       mov byte ptr [rax + rsi], 0x7d
0000000145b4f70e 48ffc6                         inc rsi
0000000145b4f711 48897508                       mov qword ptr [rbp + 8], rsi
0000000145b4f715 eb63                           jmp 0x145b4f77a
0000000145b4f717 660f1f840000000000             nop word ptr [rax + rax]
0000000145b4f720 4883c620                       add rsi, 0x20
0000000145b4f724 4883c3e0                       add rbx, -0x20
0000000145b4f728 0f8475ffffff                   je 0x145b4f6a3
0000000145b4f72e 48397ef8                       cmp qword ptr [rsi - 8], rdi
0000000145b4f732 75ec                           jne 0x145b4f720
0000000145b4f734 488b4ef0                       mov rcx, qword ptr [rsi - 0x10]
0000000145b4f738 4c89f2                         mov rdx, r14
0000000145b4f73b 4989f8                         mov r8, rdi
0000000145b4f73e e8eeb64500                     call 0x145faae31
0000000145b4f743 85c0                           test eax, eax
0000000145b4f745 75d9                           jne 0x145b4f720
0000000145b4f747 488975c0                       mov qword ptr [rbp - 0x40], rsi
0000000145b4f74b 488d45c0                       lea rax, [rbp - 0x40]
0000000145b4f74f 488945b0                       mov qword ptr [rbp - 0x50], rax
0000000145b4f753 488d0546526cfa                 lea rax, [rip - 0x593adba]
0000000145b4f75a 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145b4f75e 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f762 488d156fd77a01                 lea rdx, [rip + 0x17ad76f]
0000000145b4f769 4c8d0560d77a01                 lea r8, [rip + 0x17ad760]
0000000145b4f770 4c8d4db0                       lea r9, [rbp - 0x50]
0000000145b4f774 e8075f4300                     call 0x145f85680
0000000145b4f779 90                             nop
0000000145b4f77a 48ffc7                         inc rdi
0000000145b4f77d 488b55e8                       mov rdx, qword ptr [rbp - 0x18]
0000000145b4f781 4989d7                         mov r15, rdx
0000000145b4f784 4929ff                         sub r15, rdi
0000000145b4f787 488b5df0                       mov rbx, qword ptr [rbp - 0x10]
0000000145b4f78b 760a                           jbe 0x145b4f797
0000000145b4f78d 803c3bbf                       cmp byte ptr [rbx + rdi], 0xbf
0000000145b4f791 0f8ec0010000                   jle 0x145b4f957
0000000145b4f797 4801fb                         add rbx, rdi
0000000145b4f79a e9e8fcffff                     jmp 0x145b4f487
0000000145b4f79f 4d85f6                         test r14, r14
0000000145b4f7a2 740d                           je 0x145b4f7b1
0000000145b4f7a4 4a8d0433                       lea rax, [rbx + r14]
0000000145b4f7a8 8038c0                         cmp byte ptr [rax], 0xc0
0000000145b4f7ab 0f8c69010000                   jl 0x145b4f91a
0000000145b4f7b1 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145b4f7b5 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f7b9 4829d0                         sub rax, rdx
0000000145b4f7bc 4939c5                         cmp r13, rax
0000000145b4f7bf 7749                           ja 0x145b4f80a
0000000145b4f7c1 48035500                       add rdx, qword ptr [rbp]
0000000145b4f7c5 4889d1                         mov rcx, rdx
0000000145b4f7c8 488b55e0                       mov rdx, qword ptr [rbp - 0x20]
0000000145b4f7cc 4d89e8                         mov r8, r13
0000000145b4f7cf e857b64500                     call 0x145faae2b
0000000145b4f7d4 4c016d08                       add qword ptr [rbp + 8], r13
0000000145b4f7d8 bb01000000                     mov ebx, 1
0000000145b4f7dd 4531ff                         xor r15d, r15d
0000000145b4f7e0 e9a2fcffff                     jmp 0x145b4f487
0000000145b4f7e5 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b4f7ee 41b901000000                   mov r9d, 1
0000000145b4f7f4 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f7f8 4d89f0                         mov r8, r14
0000000145b4f7fb e840ba4500                     call 0x145fab240
0000000145b4f800 90                             nop
0000000145b4f801 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f805 e952fdffff                     jmp 0x145b4f55c
0000000145b4f80a 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b4f813 41b901000000                   mov r9d, 1
0000000145b4f819 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f81d 4d89e8                         mov r8, r13
0000000145b4f820 e81bba4500                     call 0x145fab240
0000000145b4f825 90                             nop
0000000145b4f826 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f82a eb95                           jmp 0x145b4f7c1
0000000145b4f82c 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b4f835 41b801000000                   mov r8d, 1
0000000145b4f83b 41b901000000                   mov r9d, 1
0000000145b4f841 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f845 4889f2                         mov rdx, rsi
0000000145b4f848 e8f3b94500                     call 0x145fab240
0000000145b4f84d 90                             nop
0000000145b4f84e e95efeffff                     jmp 0x145b4f6b1
0000000145b4f853 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b4f85c 41b901000000                   mov r9d, 1
0000000145b4f862 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f866 4889f2                         mov rdx, rsi
0000000145b4f869 4989f8                         mov r8, rdi
0000000145b4f86c e8cfb94500                     call 0x145fab240
0000000145b4f871 90                             nop
0000000145b4f872 488b7508                       mov rsi, qword ptr [rbp + 8]
0000000145b4f876 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145b4f87a e95dfeffff                     jmp 0x145b4f6dc
0000000145b4f87f 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b4f888 41b801000000                   mov r8d, 1
0000000145b4f88e 41b901000000                   mov r9d, 1
0000000145b4f894 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f898 e8a3b94500                     call 0x145fab240
0000000145b4f89d 90                             nop
0000000145b4f89e e963feffff                     jmp 0x145b4f706
0000000145b4f8a3 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145b4f8a7 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f8ab 4829d0                         sub rax, rdx
0000000145b4f8ae 4939c7                         cmp r15, rax
0000000145b4f8b1 7745                           ja 0x145b4f8f8
0000000145b4f8b3 4d85ff                         test r15, r15
0000000145b4f8b6 7416                           je 0x145b4f8ce
0000000145b4f8b8 48035500                       add rdx, qword ptr [rbp]
0000000145b4f8bc 4889d1                         mov rcx, rdx
0000000145b4f8bf 4889da                         mov rdx, rbx
0000000145b4f8c2 4d89f8                         mov r8, r15
0000000145b4f8c5 e861b54500                     call 0x145faae2b
0000000145b4f8ca 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f8ce 4c01fa                         add rdx, r15
0000000145b4f8d1 48895508                       mov qword ptr [rbp + 8], rdx
0000000145b4f8d5 488b45c8                       mov rax, qword ptr [rbp - 0x38]
0000000145b4f8d9 48895010                       mov qword ptr [rax + 0x10], rdx
0000000145b4f8dd 0f1045f8                       movups xmm0, xmmword ptr [rbp - 8]
0000000145b4f8e1 0f1100                         movups xmmword ptr [rax], xmm0
0000000145b4f8e4 4881c498000000                 add rsp, 0x98
0000000145b4f8eb 5b                             pop rbx
0000000145b4f8ec 5f                             pop rdi
0000000145b4f8ed 5e                             pop rsi
0000000145b4f8ee 415c                           pop r12
0000000145b4f8f0 415d                           pop r13
0000000145b4f8f2 415e                           pop r14
0000000145b4f8f4 415f                           pop r15
0000000145b4f8f6 5d                             pop rbp
0000000145b4f8f7 c3                             ret
0000000145b4f8f8 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b4f901 488d4df8                       lea rcx, [rbp - 8]
0000000145b4f905 41b901000000                   mov r9d, 1
0000000145b4f90b 4d89f8                         mov r8, r15
0000000145b4f90e e82db94500                     call 0x145fab240
0000000145b4f913 90                             nop
0000000145b4f914 488b5508                       mov rdx, qword ptr [rbp + 8]
0000000145b4f918 eb9e                           jmp 0x145b4f8b8
0000000145b4f91a 488d0597d57a01                 lea rax, [rip + 0x17ad597]
0000000145b4f921 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b4f926 4889d9                         mov rcx, rbx
0000000145b4f929 4c89fa                         mov rdx, r15
0000000145b4f92c 4d89f0                         mov r8, r14
0000000145b4f92f 4d89f9                         mov r9, r15
0000000145b4f932 e889296000                     call 0x1461522c0
0000000145b4f937 90                             nop
0000000145b4f938 eb38                           jmp 0x145b4f972
0000000145b4f93a 488d055fd57a01                 lea rax, [rip + 0x17ad55f]
0000000145b4f941 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b4f946 4889d9                         mov rcx, rbx
0000000145b4f949 4c89fa                         mov rdx, r15
0000000145b4f94c 4d89f9                         mov r9, r15
0000000145b4f94f e86c296000                     call 0x1461522c0
0000000145b4f954 90                             nop
0000000145b4f955 eb1b                           jmp 0x145b4f972
0000000145b4f957 488d05aad57a01                 lea rax, [rip + 0x17ad5aa]
0000000145b4f95e 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145b4f963 4889d9                         mov rcx, rbx
0000000145b4f966 4989f8                         mov r8, rdi
0000000145b4f969 4989d1                         mov r9, rdx
0000000145b4f96c e84f296000                     call 0x1461522c0
0000000145b4f971 90                             nop
0000000145b4f972 0f0b                           ud2
