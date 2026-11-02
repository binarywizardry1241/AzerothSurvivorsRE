// host-flag-sampling-loop
0000000145c0ecaa 48c785800c000000000000         mov qword ptr [rbp + 0xc80], 0
0000000145c0ecb5 48c785880c000008000000         mov qword ptr [rbp + 0xc88], 8
0000000145c0ecc0 48c785900c000000000000         mov qword ptr [rbp + 0xc90], 0
0000000145c0eccb 4869beb00d0000c8040000         imul rdi, qword ptr [rsi + 0xdb0], 0x4c8
0000000145c0ecd6 4c8bb6a80d0000                 mov r14, qword ptr [rsi + 0xda8]
0000000145c0ecdd 4c01f7                         add rdi, r14
0000000145c0ece0 4531ff                         xor r15d, r15d
0000000145c0ece3 488db5800c0000                 lea rsi, [rbp + 0xc80]
0000000145c0ecea eb2a                           jmp 0x145c0ed16
0000000145c0ecec 0f1f4000                       nop dword ptr [rax]
0000000145c0ecf0 488b8d880c0000                 mov rcx, qword ptr [rbp + 0xc88]
0000000145c0ecf7 4b8d1464                       lea rdx, [r12 + r12*2]
0000000145c0ecfb 48c704d101000000               mov qword ptr [rcx + rdx*8], 1
0000000145c0ed03 48895cd108                     mov qword ptr [rcx + rdx*8 + 8], rbx
0000000145c0ed08 8844d110                       mov byte ptr [rcx + rdx*8 + 0x10], al
0000000145c0ed0c 49ffc4                         inc r12
0000000145c0ed0f 4c89a5900c0000                 mov qword ptr [rbp + 0xc90], r12
0000000145c0ed16 4939fe                         cmp r14, rdi
0000000145c0ed19 0f846a010000                   je 0x145c0ee89
0000000145c0ed1f 4d89f4                         mov r12, r14
0000000145c0ed22 4c89fb                         mov rbx, r15
0000000145c0ed25 498b8eb0040000                 mov rcx, qword ptr [r14 + 0x4b0]
0000000145c0ed2c 498b86b8040000                 mov rax, qword ptr [r14 + 0x4b8]
0000000145c0ed33 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145c0ed37 c6851a0d000001                 mov byte ptr [rbp + 0xd1a], 1
0000000145c0ed3e ffd0                           call rax
0000000145c0ed40 90                             nop
0000000145c0ed41 4d8db424c8040000               lea r14, [r12 + 0x4c8]
0000000145c0ed49 4c8d7b01                       lea r15, [rbx + 1]
0000000145c0ed4d 84c0                           test al, al
0000000145c0ed4f 74c5                           je 0x145c0ed16
0000000145c0ed51 498b8c24b0040000               mov rcx, qword ptr [r12 + 0x4b0]
0000000145c0ed59 498b8424b8040000               mov rax, qword ptr [r12 + 0x4b8]
0000000145c0ed61 488b4038                       mov rax, qword ptr [rax + 0x38]
0000000145c0ed65 c6851a0d000001                 mov byte ptr [rbp + 0xd1a], 1
0000000145c0ed6c ffd0                           call rax
0000000145c0ed6e 90                             nop
0000000145c0ed6f 413a8424c2040000               cmp al, byte ptr [r12 + 0x4c2]
0000000145c0ed77 749d                           je 0x145c0ed16
0000000145c0ed79 41888424c2040000               mov byte ptr [r12 + 0x4c2], al
0000000145c0ed81 4c8ba5900c0000                 mov r12, qword ptr [rbp + 0xc90]
0000000145c0ed88 4c3ba5800c0000                 cmp r12, qword ptr [rbp + 0xc80]
0000000145c0ed8f 0f855bffffff                   jne 0x145c0ecf0
0000000145c0ed95 c6851a0d000001                 mov byte ptr [rbp + 0xd1a], 1
0000000145c0ed9c 4889f1                         mov rcx, rsi
0000000145c0ed9f 4188c5                         mov r13b, al
0000000145c0eda2 e819743f00                     call 0x1460061c0
0000000145c0eda7 4489e8                         mov eax, r13d
0000000145c0edaa e941ffffff                     jmp 0x145c0ecf0
// fanout-gates
0000000145c2bd59 83791002                       cmp dword ptr [rcx + 0x10], 2
0000000145c2bd5d 0f8483000000                   je 0x145c2bde6
0000000145c2bd63 4889ce                         mov rsi, rcx
0000000145c2bd66 80b9620d000000                 cmp byte ptr [rcx + 0xd62], 0
0000000145c2bd6d 7477                           je 0x145c2bde6
// online-slot-admission
0000000145ca8ac5 b201                           mov dl, 1
0000000145ca8ac7 4885ff                         test rdi, rdi
0000000145ca8aca 74e6                           je 0x145ca8ab2
0000000145ca8acc 4183b9700d000003               cmp dword ptr [r9 + 0xd70], 3
0000000145ca8ad4 75da                           jne 0x145ca8ab0
// online-assignment-and-retry
0000000145ca8b1a 42833c1e01                     cmp dword ptr [rsi + r11], 1
0000000145ca8b1f 75df                           jne 0x145ca8b00
0000000145ca8b21 4a397c1e08                     cmp qword ptr [rsi + r11 + 8], rdi
0000000145ca8b26 75d8                           jne 0x145ca8b00
0000000145ca8b28 498b32                         mov rsi, qword ptr [r10]
0000000145ca8b2b 833e03                         cmp dword ptr [rsi], 3
0000000145ca8b2e 7582                           jne 0x145ca8ab2
0000000145ca8b30 488b5640                       mov rdx, qword ptr [rsi + 0x40]
0000000145ca8b34 4939d5                         cmp r13, rdx
0000000145ca8b37 733c                           jae 0x145ca8b75
0000000145ca8b39 488b5638                       mov rdx, qword ptr [rsi + 0x38]
0000000145ca8b3d 420fb6941ac2040000             movzx edx, byte ptr [rdx + r11 + 0x4c2]
0000000145ca8b46 80f201                         xor dl, 1
// recipient-exclusion
0000000145c973ac 493b7d00                       cmp rdi, qword ptr [r13]
0000000145c973b0 74ee                           je 0x145c973a0
0000000145c973b2 48897df0                       mov qword ptr [rbp - 0x10], rdi
0000000145c973b6 488d45f0                       lea rax, [rbp - 0x10]
0000000145c973ba 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145c973bf 4c89f9                         mov rcx, r15
0000000145c973c2 4889da                         mov rdx, rbx
0000000145c973c5 4989f8                         mov r8, rdi
0000000145c973c8 4d89f1                         mov r9, r14
0000000145c973cb e88088e4ff                     call 0x145adfc50
// abandoned-context
0000000145adfca1 80bf430d000000                 cmp byte ptr [rdi + 0xd43], 0
0000000145adfca8 740d                           je 0x145adfcb7
0000000145adfcaa 48c785c0130000ffffffff         mov qword ptr [rbp + 0x13c0], 0xffffffffffffffff
0000000145adfcb5 eb56                           jmp 0x145adfd0d
// connected-predicate
0000000145405002 0fb6b8df030000                 movzx edi, byte ptr [rax + 0x3df]
0000000145405009 48ffca                         dec rdx
000000014540500c 4989542410                     mov qword ptr [r12 + 0x10], rdx
0000000145405011 49ff0c24                       dec qword ptr [r12]
0000000145405015 7508                           jne 0x14540501f
0000000145405017 4889d9                         mov rcx, rbx
000000014540501a e811040900                     call 0x145495430
000000014540501f 31c0                           xor eax, eax
0000000145405021 4084ff                         test dil, dil
0000000145405024 0f95c0                         setne al
0000000145405027 8d0440                         lea eax, [rax + rax*2]
// synchronization-caller-admission
0000000145c2ea9d 48833800                       cmp qword ptr [rax], 0
0000000145c2eaa1 0f8496000000                   je 0x145c2eb3d
0000000145c2eaa7 80b8c104000000                 cmp byte ptr [rax + 0x4c1], 0
0000000145c2eaae 0f8589000000                   jne 0x145c2eb3d
0000000145c2eab4 c685a706000001                 mov byte ptr [rbp + 0x6a7], 1
0000000145c2eabb c685a606000001                 mov byte ptr [rbp + 0x6a6], 1
0000000145c2eac2 c685a506000001                 mov byte ptr [rbp + 0x6a5], 1
0000000145c2eac9 c685a406000001                 mov byte ptr [rbp + 0x6a4], 1
0000000145c2ead0 4889f1                         mov rcx, rsi
0000000145c2ead3 4889fa                         mov rdx, rdi
0000000145c2ead6 e845c9ffff                     call 0x145c2b420
0000000145c2eadb 90                             nop
// synchronization-completion-before-fanout
0000000145c2b854 83be700d000003                 cmp dword ptr [rsi + 0xd70], 3
0000000145c2b85b 488b8da0020000                 mov rcx, qword ptr [rbp + 0x2a0]
0000000145c2b862 7522                           jne 0x145c2b886
0000000145c2b864 488b96b00d0000                 mov rdx, qword ptr [rsi + 0xdb0]
0000000145c2b86b 4839d1                         cmp rcx, rdx
0000000145c2b86e 733a                           jae 0x145c2b8aa
0000000145c2b870 488b86a80d0000                 mov rax, qword ptr [rsi + 0xda8]
0000000145c2b877 488b8dd0020000                 mov rcx, qword ptr [rbp + 0x2d0]
0000000145c2b87e c68408c104000001               mov byte ptr [rax + rcx + 0x4c1], 1
0000000145c2b886 c685df02000000                 mov byte ptr [rbp + 0x2df], 0
0000000145c2b88d 4889f1                         mov rcx, rsi
0000000145c2b890 e8ab040000                     call 0x145c2bd40
// remote-recipient-delivery-admission
0000000145c2e172 4885d2                         test rdx, rdx
0000000145c2e175 0f849f000000                   je 0x145c2e21a
0000000145c2e17b 83b9700d000003                 cmp dword ptr [rcx + 0xd70], 3
0000000145c2e182 0f8534010000                   jne 0x145c2e2bc
0000000145c2e188 488b81b00d0000                 mov rax, qword ptr [rcx + 0xdb0]
0000000145c2e18f 4885c0                         test rax, rax
0000000145c2e192 0f8424010000                   je 0x145c2e2bc
0000000145c2e198 488bb1a80d0000                 mov rsi, qword ptr [rcx + 0xda8]
0000000145c2e19f 4869c0c8040000                 imul rax, rax, 0x4c8
0000000145c2e1a6 4801f0                         add rax, rsi
0000000145c2e1a9 4881c660020000                 add rsi, 0x260
0000000145c2e1b0 eb2c                           jmp 0x145c2e1de
0000000145c2e1b2 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c2e1c0 488d8ea0fdffff                 lea rcx, [rsi - 0x260]
0000000145c2e1c7 4881c6c8040000                 add rsi, 0x4c8
0000000145c2e1ce 4881c1c8040000                 add rcx, 0x4c8
0000000145c2e1d5 4839c1                         cmp rcx, rax
0000000145c2e1d8 0f84de000000                   je 0x145c2e2bc
0000000145c2e1de 83bea0fdffff01                 cmp dword ptr [rsi - 0x260], 1
0000000145c2e1e5 75d9                           jne 0x145c2e1c0
0000000145c2e1e7 483996a8fdffff                 cmp qword ptr [rsi - 0x258], rdx
0000000145c2e1ee 75d0                           jne 0x145c2e1c0
0000000145c2e1f0 80be6102000001                 cmp byte ptr [rsi + 0x261], 1
0000000145c2e1f7 0f85bf000000                   jne 0x145c2e2bc
// cooperative-flag-publication
0000000145afc0ab 4889be300a0000                 mov qword ptr [rsi + 0xa30], rdi
0000000145afc0b2 c686520d000001                 mov byte ptr [rsi + 0xd52], 1
0000000145afc0b9 c6856724000000                 mov byte ptr [rbp + 0x2467], 0
0000000145afc0c0 4889f1                         mov rcx, rsi
0000000145afc0c3 e818ee0000                     call 0x145b0aee0
// host-receive-and-retirement-order
0000000145c0e492 31f6                           xor esi, esi
0000000145c0e494 4c8d75b8                       lea r14, [rbp - 0x48]
0000000145c0e498 f2440f1005ef507200             movsd xmm8, qword ptr [rip + 0x7250ef]
0000000145c0e4a1 4869fec8040000                 imul rdi, rsi, 0x4c8
0000000145c0e4a8 31db                           xor ebx, ebx
0000000145c0e4aa eb21                           jmp 0x145c0e4cd
0000000145c0e4ac 84c0                           test al, al
0000000145c0e4ae 0f85a4010000                   jne 0x145c0e658
0000000145c0e4b4 c6850f0d000001                 mov byte ptr [rbp + 0xd0f], 1
0000000145c0e4bb 488b8d400d0000                 mov rcx, qword ptr [rbp + 0xd40]
0000000145c0e4c2 4889f2                         mov rdx, rsi
0000000145c0e4c5 e846100200                     call 0x145c2f510
0000000145c0e4ca 90                             nop
0000000145c0e4cb 31db                           xor ebx, ebx
0000000145c0e4cd 4c8ba5400d0000                 mov r12, qword ptr [rbp + 0xd40]
0000000145c0e4d4 4183bc24700d000003             cmp dword ptr [r12 + 0xd70], 3
0000000145c0e4dd 0f851b020000                   jne 0x145c0e6fe
0000000145c0e4e3 498b9424b00d0000               mov rdx, qword ptr [r12 + 0xdb0]
0000000145c0e4eb 4839d6                         cmp rsi, rdx
0000000145c0e4ee 0f836c010000                   jae 0x145c0e660
0000000145c0e4f4 4881fbc7000000                 cmp rbx, 0xc7
0000000145c0e4fb 0f8757010000                   ja 0x145c0e658
0000000145c0e501 4839d6                         cmp rsi, rdx
0000000145c0e504 0f83b0560000                   jae 0x145c13bba
0000000145c0e50a 4c8ba5400d0000                 mov r12, qword ptr [rbp + 0xd40]
0000000145c0e511 498b8424a80d0000               mov rax, qword ptr [r12 + 0xda8]
0000000145c0e519 488b9438b0040000               mov rdx, qword ptr [rax + rdi + 0x4b0]
0000000145c0e521 4c8b8438b8040000               mov r8, qword ptr [rax + rdi + 0x4b8]
0000000145c0e529 4c89f1                         mov rcx, r14
0000000145c0e52c e85f60feff                     call 0x145bf4590
0000000145c0e531 4183bc24700d000003             cmp dword ptr [r12 + 0xd70], 3
0000000145c0e53a 7544                           jne 0x145c0e580
0000000145c0e53c 498b9424b00d0000               mov rdx, qword ptr [r12 + 0xdb0]
0000000145c0e544 4839d6                         cmp rsi, rdx
0000000145c0e547 0f83b2560000                   jae 0x145c13bff
0000000145c0e54d 498b8424a80d0000               mov rax, qword ptr [r12 + 0xda8]
0000000145c0e555 4c8b643810                     mov r12, qword ptr [rax + rdi + 0x10]
0000000145c0e55a 48837db8ff                     cmp qword ptr [rbp - 0x48], -1
0000000145c0e55f 7450                           je 0x145c0e5b1
0000000145c0e561 4d85e4                         test r12, r12
0000000145c0e564 7425                           je 0x145c0e58b
0000000145c0e566 48ffc3                         inc rbx
0000000145c0e569 4c89f1                         mov rcx, r14
0000000145c0e56c e8ef57ffff                     call 0x145c03d60
0000000145c0e571 e957ffffff                     jmp 0x145c0e4cd
0000000145c0e576 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145c0e580 48837db8ff                     cmp qword ptr [rbp - 0x48], -1
0000000145c0e585 0f8429ffffff                   je 0x145c0e4b4
0000000145c0e58b c6850f0d000000                 mov byte ptr [rbp + 0xd0f], 0
0000000145c0e592 488b8d400d0000                 mov rcx, qword ptr [rbp + 0xd40]
0000000145c0e599 4889f2                         mov rdx, rsi
0000000145c0e59c 4d89f0                         mov r8, r14
0000000145c0e59f 660f28de                       movapd xmm3, xmm6
0000000145c0e5a3 e8b8fe0100                     call 0x145c2e460
0000000145c0e5a8 90                             nop
0000000145c0e5a9 48ffc3                         inc rbx
0000000145c0e5ac e91cffffff                     jmp 0x145c0e4cd
0000000145c0e5b1 f2440f104c3818                 movsd xmm9, qword ptr [rax + rdi + 0x18]
0000000145c0e5b8 4801f8                         add rax, rdi
0000000145c0e5bb 488b88b0040000                 mov rcx, qword ptr [rax + 0x4b0]
0000000145c0e5c2 488b80b8040000                 mov rax, qword ptr [rax + 0x4b8]
0000000145c0e5c9 488b4028                       mov rax, qword ptr [rax + 0x28]
0000000145c0e5cd c6850f0d000001                 mov byte ptr [rbp + 0xd0f], 1
0000000145c0e5d4 ffd0                           call rax
0000000145c0e5d6 90                             nop
0000000145c0e5d7 4d85e4                         test r12, r12
0000000145c0e5da 0f84ccfeffff                   je 0x145c0e4ac
0000000145c0e5e0 660f28c6                       movapd xmm0, xmm6
0000000145c0e5e4 f2410f5cc1                     subsd xmm0, xmm9
0000000145c0e5e9 66410f2ec0                     ucomisd xmm0, xmm8
0000000145c0e5ee 0f96c1                         setbe cl
0000000145c0e5f1 84c1                           test cl, al
0000000145c0e5f3 7563                           jne 0x145c0e658
0000000145c0e5f5 66410f2ec0                     ucomisd xmm0, xmm8
0000000145c0e5fa 0f86b4feffff                   jbe 0x145c0e4b4
0000000145c0e600 488b85400d0000                 mov rax, qword ptr [rbp + 0xd40]
0000000145c0e607 488b80700d0000                 mov rax, qword ptr [rax + 0xd70]
0000000145c0e60e 83f803                         cmp eax, 3
0000000145c0e611 0f859dfeffff                   jne 0x145c0e4b4
0000000145c0e617 488b85400d0000                 mov rax, qword ptr [rbp + 0xd40]
0000000145c0e61e 488b90b00d0000                 mov rdx, qword ptr [rax + 0xdb0]
0000000145c0e625 4839d6                         cmp rsi, rdx
0000000145c0e628 0f8310560000                   jae 0x145c13c3e
0000000145c0e62e 488b80a80d0000                 mov rax, qword ptr [rax + 0xda8]
0000000145c0e635 488b8c38b0040000               mov rcx, qword ptr [rax + rdi + 0x4b0]
0000000145c0e63d 488b8438b8040000               mov rax, qword ptr [rax + rdi + 0x4b8]
0000000145c0e645 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145c0e649 c6850f0d000001                 mov byte ptr [rbp + 0xd0f], 1
0000000145c0e650 ffd0                           call rax
0000000145c0e652 90                             nop
0000000145c0e653 e95cfeffff                     jmp 0x145c0e4b4
0000000145c0e658 48ffc6                         inc rsi
0000000145c0e65b e941feffff                     jmp 0x145c0e4a1
// host-decoded-sync-dispatch
0000000145c2e491 4889d7                         mov rdi, rdx
0000000145c2e494 4889ce                         mov rsi, rcx
0000000145c2e497 48899550060000                 mov qword ptr [rbp + 0x650], rdx
0000000145c2e49e 488b81700d0000                 mov rax, qword ptr [rcx + 0xd70]
0000000145c2e4a5 4883f803                       cmp rax, 3
0000000145c2e4a9 4c898598060000                 mov qword ptr [rbp + 0x698], r8
0000000145c2e4b0 0f85b3010000                   jne 0x145c2e669
0000000145c2e4b6 488b96b00d0000                 mov rdx, qword ptr [rsi + 0xdb0]
0000000145c2e4bd 4839d7                         cmp rdi, rdx
0000000145c2e4c0 0f8313090000                   jae 0x145c2edd9
0000000145c2e4c6 4d8b20                         mov r12, qword ptr [r8]
0000000145c2e4c9 48ba0000000000000080           movabs rdx, 0x8000000000000000
0000000145c2e4d3 4c31e2                         xor rdx, r12
0000000145c2e4d6 4d85e4                         test r12, r12
0000000145c2e4d9 b903000000                     mov ecx, 3
0000000145c2e4de 480f48ca                       cmovs rcx, rdx
0000000145c2e4e2 4885c9                         test rcx, rcx
0000000145c2e4e5 0f84ad010000                   je 0x145c2e698
0000000145c2e4eb 4883f913                       cmp rcx, 0x13
0000000145c2e4ef 0f845d020000                   je 0x145c2e752
0000000145c2e4f5 488b86a80d0000                 mov rax, qword ptr [rsi + 0xda8]
0000000145c2e4fc 4c69ffc8040000                 imul r15, rdi, 0x4c8
0000000145c2e503 4280bc38c004000000             cmp byte ptr [rax + r15 + 0x4c0], 0
0000000145c2e50c 0f842b060000                   je 0x145c2eb3d
0000000145c2e512 4883c1fd                       add rcx, -3
0000000145c2e516 4883f90d                       cmp rcx, 0xd
0000000145c2e51a 0f871d060000                   ja 0x145c2eb3d
0000000145c2e520 4c01f8                         add rax, r15
0000000145c2e523 488d15e2e6a701                 lea rdx, [rip + 0x1a7e6e2]
0000000145c2e52a 48630c8a                       movsxd rcx, dword ptr [rdx + rcx*4]
0000000145c2e52e 4801d1                         add rcx, rdx
0000000145c2e531 ffe1                           jmp rcx
// world-actor-assignment-publication
0000000145c1f2e1 498b0e                         mov rcx, qword ptr [r14]
0000000145c1f2e4 488b96b00d0000                 mov rdx, qword ptr [rsi + 0xdb0]
0000000145c1f2eb 4839d1                         cmp rcx, rdx
0000000145c1f2ee 0f83b0030000                   jae 0x145c1f6a4
0000000145c1f2f4 498b4608                       mov rax, qword ptr [r14 + 8]
0000000145c1f2f8 488b96a80d0000                 mov rdx, qword ptr [rsi + 0xda8]
0000000145c1f2ff 4869f9c8040000                 imul rdi, rcx, 0x4c8
0000000145c1f306 48c7043a01000000               mov qword ptr [rdx + rdi], 1
0000000145c1f30e 4889443a08                     mov qword ptr [rdx + rdi + 8], rax
// begin-remote-context-construction
0000000145c1efbb e8d0700a00                     call 0x145cc6090
0000000145c1efc0 90                             nop
0000000145c1efc1 4c89e1                         mov rcx, r12
0000000145c1efc4 4889da                         mov rdx, rbx
0000000145c1efc7 e804ceedff                     call 0x145afbdd0
0000000145c1efcc 90                             nop
0000000145c1efcd 4883f801                       cmp rax, 1
0000000145c1efd1 0f8533ffffff                   jne 0x145c1ef0a
// begin-initial-group-publication
0000000145c1f220 c685dd30000001                 mov byte ptr [rbp + 0x30dd], 1
0000000145c1f227 488d8de02c0000                 lea rcx, [rbp + 0x2ce0]
0000000145c1f22e 4889f2                         mov rdx, rsi
0000000145c1f231 4531c0                         xor r8d, r8d
0000000145c1f234 e807e50000                     call 0x145c2d740
0000000145c1f239 90                             nop
0000000145c1f23a 4883bde02c0000ff               cmp qword ptr [rbp + 0x2ce0], -1
0000000145c1f242 7443                           je 0x145c1f287
0000000145c1f244 f30f6f85e02c0000               movdqu xmm0, xmmword ptr [rbp + 0x2ce0]
0000000145c1f24c 0f108df02c0000                 movups xmm1, xmmword ptr [rbp + 0x2cf0]
0000000145c1f253 0f298d301d0000                 movaps xmmword ptr [rbp + 0x1d30], xmm1
0000000145c1f25a 660f7f85201d0000               movdqa xmmword ptr [rbp + 0x1d20], xmm0
0000000145c1f262 488b8e88110000                 mov rcx, qword ptr [rsi + 0x1188]
0000000145c1f269 488b9690110000                 mov rdx, qword ptr [rsi + 0x1190]
0000000145c1f270 c685dd30000001                 mov byte ptr [rbp + 0x30dd], 1
0000000145c1f277 4c8d8d201d0000                 lea r9, [rbp + 0x1d20]
0000000145c1f27e 4d89e8                         mov r8, r13
0000000145c1f281 e8facafeff                     call 0x145c0bd80
0000000145c1f286 90                             nop
// flag-change-batch-fanout
0000000145c0f3c9 488b85b00c0000                 mov rax, qword ptr [rbp + 0xcb0]
0000000145c0f3d0 4885c0                         test rax, rax
0000000145c0f3d3 741a                           je 0x145c0f3ef
0000000145c0f3d5 48c1e003                       shl rax, 3
0000000145c0f3d9 488d1440                       lea rdx, [rax + rax*2]
0000000145c0f3dd 41b808000000                   mov r8d, 8
0000000145c0f3e3 488b8df00c0000                 mov rcx, qword ptr [rbp + 0xcf0]
0000000145c0f3ea e8e12d3ffa                     call 0x1400021d0
0000000145c0f3ef c6851a0d000000                 mov byte ptr [rbp + 0xd1a], 0
0000000145c0f3f6 488b8d400d0000                 mov rcx, qword ptr [rbp + 0xd40]
0000000145c0f3fd e83ec90100                     call 0x145c2bd40
0000000145c0f402 90                             nop
