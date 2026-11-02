0000000145bd659d 498b4108                       mov rax, qword ptr [r9 + 8]
0000000145bd65a1 48898578060000                 mov qword ptr [rbp + 0x678], rax
0000000145bd65a8 498b5110                       mov rdx, qword ptr [r9 + 0x10]
0000000145bd65ac 4d8b4118                       mov r8, qword ptr [r9 + 0x18]
0000000145bd65b0 488d8d18040000                 lea rcx, [rbp + 0x418]
0000000145bd65b7 48899560060000                 mov qword ptr [rbp + 0x660], rdx
0000000145bd65be e86d0d1400                     call 0x145d17330
0000000145bd65c3 90                             nop 
0000000145bd65c4 488b9518040000                 mov rdx, qword ptr [rbp + 0x418]
0000000145bd65cb 31c0                           xor eax, eax
0000000145bd65cd 4883faff                       cmp rdx, -1
0000000145bd65d1 488b8d28040000                 mov rcx, qword ptr [rbp + 0x428]
0000000145bd65d8 480f44c8                       cmove rcx, rax
0000000145bd65dc 480f44d0                       cmove rdx, rax
0000000145bd65e0 41bd08000000                   mov r13d, 8
0000000145bd65e6 4c0f45ad20040000               cmovne r13, qword ptr [rbp + 0x420]
0000000145bd65ee 4c69f138020000                 imul r14, rcx, 0x238
0000000145bd65f5 4d01ee                         add r14, r13
0000000145bd65f8 4c89ade0010000                 mov qword ptr [rbp + 0x1e0], r13
0000000145bd65ff 4c89ade8010000                 mov qword ptr [rbp + 0x1e8], r13
0000000145bd6606 48899558060000                 mov qword ptr [rbp + 0x658], rdx
0000000145bd660d 488995f0010000                 mov qword ptr [rbp + 0x1f0], rdx
0000000145bd6614 4c89b5f8010000                 mov qword ptr [rbp + 0x1f8], r14
0000000145bd661b 4c89ea                         mov rdx, r13
0000000145bd661e 4885c9                         test rcx, rcx
0000000145bd6621 0f8488000000                   je 0x145bd66af
0000000145bd6627 488dbd20040000                 lea rdi, [rbp + 0x420]
0000000145bd662e 498d8538020000                 lea rax, [r13 + 0x238]
0000000145bd6635 488d9d18040000                 lea rbx, [rbp + 0x418]
0000000145bd663c 0f1f4000                       nop dword ptr [rax]
0000000145bd6640 4889c2                         mov rdx, rax
0000000145bd6643 488b80c8fdffff                 mov rax, qword ptr [rax - 0x238]
0000000145bd664a 4883f8ff                       cmp rax, -1
0000000145bd664e 7458                           je 0x145bd66a8
0000000145bd6650 4c8dbac8fdffff                 lea r15, [rdx - 0x238]
0000000145bd6657 48898518040000                 mov qword ptr [rbp + 0x418], rax
0000000145bd665e 48899580060000                 mov qword ptr [rbp + 0x680], rdx
0000000145bd6665 498d5708                       lea rdx, [r15 + 8]
0000000145bd6669 41b830020000                   mov r8d, 0x230
0000000145bd666f 4889f9                         mov rcx, rdi
0000000145bd6672 e8a4b04800                     call 0x14606171b
0000000145bd6677 488b9568060000                 mov rdx, qword ptr [rbp + 0x668]
0000000145bd667e 4889f1                         mov rcx, rsi
0000000145bd6681 4989d8                         mov r8, rbx
0000000145bd6684 660f28de                       movapd xmm3, xmm6
0000000145bd6688 e8f3fbffff                     call 0x145bd6280
0000000145bd668d 90                             nop 
0000000145bd668e 488b9580060000                 mov rdx, qword ptr [rbp + 0x680]
0000000145bd6695 488d8238020000                 lea rax, [rdx + 0x238]
0000000145bd669c 4981c738020000                 add r15, 0x238
0000000145bd66a3 4d39f7                         cmp r15, r14
0000000145bd66a6 7598                           jne 0x145bd6640
0000000145bd66a8 488995e8010000                 mov qword ptr [rbp + 0x1e8], rdx
0000000145bd66af 4c89ad50060000                 mov qword ptr [rbp + 0x650], r13
0000000145bd66b6 4929d6                         sub r14, rdx
0000000145bd66b9 49c1ee03                       shr r14, 3
0000000145bd66bd 48b877a927e3b74b3d19           movabs rax, 0x193d4bb7e327a977
0000000145bd66c7 490fafc6                       imul rax, r14
0000000145bd66cb 48898588060000                 mov qword ptr [rbp + 0x688], rax
0000000145bd66d2 48c7859006000000000000         mov qword ptr [rbp + 0x690], 0
0000000145bd66dd 48899580060000                 mov qword ptr [rbp + 0x680], rdx
0000000145bd66e4 4889d1                         mov rcx, rdx
0000000145bd66e7 660f1f840000000000             nop word ptr [rax + rax]
0000000145bd66f0 488b8590060000                 mov rax, qword ptr [rbp + 0x690]
0000000145bd66f7 48398588060000                 cmp qword ptr [rbp + 0x688], rax
0000000145bd66fe 741c                           je 0x145bd671c
0000000145bd6700 48ffc0                         inc rax
0000000145bd6703 48898590060000                 mov qword ptr [rbp + 0x690], rax
0000000145bd670a 488db138020000                 lea rsi, [rcx + 0x238]
0000000145bd6711 e8fa481300                     call 0x145d0b010
0000000145bd6716 90                             nop 
0000000145bd6717 4889f1                         mov rcx, rsi
0000000145bd671a ebd4                           jmp 0x145bd66f0
0000000145bd671c 488b8558060000                 mov rax, qword ptr [rbp + 0x658]
0000000145bd6723 4885c0                         test rax, rax
0000000145bd6726 7419                           je 0x145bd6741
0000000145bd6728 4869d038020000                 imul rdx, rax, 0x238
0000000145bd672f 41b808000000                   mov r8d, 8
0000000145bd6735 488b8d50060000                 mov rcx, qword ptr [rbp + 0x650]
0000000145bd673c e88fba42fa                     call 0x1400021d0
0000000145bd6741 488bbd78060000                 mov rdi, qword ptr [rbp + 0x678]
0000000145bd6748 4885ff                         test rdi, rdi
0000000145bd674b 488bb598060000                 mov rsi, qword ptr [rbp + 0x698]
0000000145bd6752 7415                           je 0x145bd6769
0000000145bd6754 41b801000000                   mov r8d, 1
0000000145bd675a 488b8d60060000                 mov rcx, qword ptr [rbp + 0x660]
0000000145bd6761 4889fa                         mov rdx, rdi
0000000145bd6764 e867ba42fa                     call 0x1400021d0
0000000145bd6769 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145bd6773 4c31e1                         xor rcx, r12
0000000145bd6776 4d85e4                         test r12, r12
0000000145bd6779 b803000000                     mov eax, 3
0000000145bd677e 480f48c1                       cmovs rax, rcx
0000000145bd6782 4883f815                       cmp rax, 0x15
0000000145bd6786 0f8787080000                   ja 0x145bd7013
0000000145bd678c 488d0db1f54a01                 lea rcx, [rip + 0x14af5b1]
0000000145bd6793 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bd6797 4801c8                         add rax, rcx
0000000145bd679a ffe0                           jmp rax
