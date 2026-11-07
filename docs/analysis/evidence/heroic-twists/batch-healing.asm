0000000145bcb438 f3440f5c96a8050000             subss xmm10, dword ptr [rsi + 0x5a8]
0000000145bcb441 f30f108618050000               movss xmm0, dword ptr [rsi + 0x518]
0000000145bcb449 f3410f59c0                     mulss xmm0, xmm8
0000000145bcb44e f3440f101d09ce5c00             movss xmm11, dword ptr [rip + 0x5cce09]
0000000145bcb457 f3450fc2da06                   cmpnless xmm11, xmm10
0000000145bcb45d 440f55d8                       andnps xmm11, xmm0
0000000145bcb461 31c0                           xor eax, eax
0000000145bcb463 80be6f03000005                 cmp byte ptr [rsi + 0x36f], 5
0000000145bcb46a 0f93c0                         setae al
0000000145bcb46d 488d0dac3fac01                 lea rcx, [rip + 0x1ac3fac]
0000000145bcb474 f3440f589eec040000             addss xmm11, dword ptr [rsi + 0x4ec]
0000000145bcb47d f30f100481                     movss xmm0, dword ptr [rcx + rax*4]
0000000145bcb482 f3440f59de                     mulss xmm11, xmm6
0000000145bcb487 f3440f59d8                     mulss xmm11, xmm0
0000000145bcb48c f3440f59c8                     mulss xmm9, xmm0
0000000145bcb491 f3440f109638050000             movss xmm10, dword ptr [rsi + 0x538]
0000000145bcb49a 450f2ec2                       ucomiss xmm8, xmm10
0000000145bcb49e 450f28e2                       movaps xmm12, xmm10
0000000145bcb4a2 0f86b6000000                   jbe 0x145bcb55e
0000000145bcb4a8 410f28ca                       movaps xmm1, xmm10
0000000145bcb4ac f3410f58cb                     addss xmm1, xmm11
0000000145bcb4b1 f3410f58c9                     addss xmm1, xmm9
0000000145bcb4b6 0f28d1                         movaps xmm2, xmm1
0000000145bcb4b9 f3410f5dd0                     minss xmm2, xmm8
0000000145bcb4be 0f28c2                         movaps xmm0, xmm2
0000000145bcb4c1 f30fc2c203                     cmpunordss xmm0, xmm2
0000000145bcb4c6 0f54c8                         andps xmm1, xmm0
0000000145bcb4c9 0f55c2                         andnps xmm0, xmm2
0000000145bcb4cc 0f56c1                         orps xmm0, xmm1
0000000145bcb4cf f30f118638050000               movss dword ptr [rsi + 0x538], xmm0
0000000145bcb4d7 450f57e4                       xorps xmm12, xmm12
0000000145bcb4db f3410f5fc4                     maxss xmm0, xmm12
0000000145bcb4e0 e87e074200                     call 0x145febc63
0000000145bcb4e5 f34c0f2cc0                     cvttss2si r8, xmm0
0000000145bcb4ea 31db                           xor ebx, ebx
0000000145bcb4ec 410f2ec4                       ucomiss xmm0, xmm12
0000000145bcb4f0 440f42c3                       cmovb r8d, ebx
0000000145bcb4f4 0f2e0575f95d00                 ucomiss xmm0, dword ptr [rip + 0x5df975]
0000000145bcb4fb 41beffffffff                   mov r14d, 0xffffffff
0000000145bcb501 450f47c6                       cmova r8d, r14d
0000000145bcb505 488dbef80b0000                 lea rdi, [rsi + 0xbf8]
0000000145bcb50c c6859700000001                 mov byte ptr [rbp + 0x97], 1
0000000145bcb513 4889f9                         mov rcx, rdi
0000000145bcb516 66ba1600                       mov dx, 0x16
0000000145bcb51a e811ececff                     call 0x145a9a130
0000000145bcb51f 90                             nop
0000000145bcb520 410f28c0                       movaps xmm0, xmm8
0000000145bcb524 e83a074200                     call 0x145febc63
0000000145bcb529 f34c0f2cc0                     cvttss2si r8, xmm0
0000000145bcb52e 410f2ec4                       ucomiss xmm0, xmm12
0000000145bcb532 440f42c3                       cmovb r8d, ebx
0000000145bcb536 0f2e0533f95d00                 ucomiss xmm0, dword ptr [rip + 0x5df933]
0000000145bcb53d 450f47c6                       cmova r8d, r14d
0000000145bcb541 c6859700000001                 mov byte ptr [rbp + 0x97], 1
0000000145bcb548 4889f9                         mov rcx, rdi
0000000145bcb54b 66ba1c00                       mov dx, 0x1c
0000000145bcb54f e8dcebecff                     call 0x145a9a130
0000000145bcb554 90                             nop
0000000145bcb555 f3440f10a638050000             movss xmm12, dword ptr [rsi + 0x538]
0000000145bcb55e c6859700000001                 mov byte ptr [rbp + 0x97], 1
0000000145bcb565 488d3d4450ac01                 lea rdi, [rip + 0x1ac5044]
0000000145bcb56c ba0c000000                     mov edx, 0xc
0000000145bcb571 4889f9                         mov rcx, rdi
0000000145bcb574 e8e7f9f1ff                     call 0x145aeaf60
0000000145bcb579 90                             nop
0000000145bcb57a f3450f5ce2                     subss xmm12, xmm10
0000000145bcb57f 450f57c0                       xorps xmm8, xmm8
0000000145bcb583 f3450f5fe0                     maxss xmm12, xmm8
0000000145bcb588 410f28c3                       movaps xmm0, xmm11
0000000145bcb58c f3410f5dc4                     minss xmm0, xmm12
0000000145bcb591 440f2ec0                       ucomiss xmm8, xmm0
0000000145bcb595 7362                           jae 0x145bcb5f9
0000000145bcb597 4885c0                         test rax, rax
0000000145bcb59a b90c000000                     mov ecx, 0xc
0000000145bcb59f 480f44d1                       cmove rdx, rcx
0000000145bcb5a3 480f45f8                       cmovne rdi, rax
0000000145bcb5a7 48c74528ffffffff               mov qword ptr [rbp + 0x28], 0xffffffffffffffff
0000000145bcb5af 48897d30                       mov qword ptr [rbp + 0x30], rdi
0000000145bcb5b3 48895538                       mov qword ptr [rbp + 0x38], rdx
0000000145bcb5b7 488d05fe4fac01                 lea rax, [rip + 0x1ac4ffe]
0000000145bcb5be 48894540                       mov qword ptr [rbp + 0x40], rax
0000000145bcb5c2 48c7454819000000               mov qword ptr [rbp + 0x48], 0x19
0000000145bcb5ca c6455000                       mov byte ptr [rbp + 0x50], 0
0000000145bcb5ce 488d8e30070000                 lea rcx, [rsi + 0x730]
0000000145bcb5d5 f30f5ad0                       cvtss2sd xmm2, xmm0
0000000145bcb5d9 c6859700000001                 mov byte ptr [rbp + 0x97], 1
0000000145bcb5e0 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145bcb5e9 488d5528                       lea rdx, [rbp + 0x28]
0000000145bcb5ed 41b908000000                   mov r9d, 8
0000000145bcb5f3 e8483d0800                     call 0x145c4f340
0000000145bcb5f8 90                             nop
0000000145bcb5f9 41b401                         mov r12b, 1
0000000145bcb5fc 450f2ec8                       ucomiss xmm9, xmm8
0000000145bcb600 0f868e010000                   jbe 0x145bcb794
0000000145bcb606 f30f108638050000               movss xmm0, dword ptr [rsi + 0x538]
0000000145bcb60e f3410f5cc2                     subss xmm0, xmm10
0000000145bcb613 f3410f5cc3                     subss xmm0, xmm11
0000000145bcb618 0f57c9                         xorps xmm1, xmm1
0000000145bcb61b f30f5fc8                       maxss xmm1, xmm0
0000000145bcb61f 450f28c1                       movaps xmm8, xmm9
0000000145bcb623 f3440f5dc1                     minss xmm8, xmm1
0000000145bcb628 488b4510                       mov rax, qword ptr [rbp + 0x10]
0000000145bcb62c 48898588000000                 mov qword ptr [rbp + 0x88], rax
0000000145bcb633 488b4518                       mov rax, qword ptr [rbp + 0x18]
0000000145bcb637 48898580000000                 mov qword ptr [rbp + 0x80], rax
0000000145bcb63e 488b4520                       mov rax, qword ptr [rbp + 0x20]
0000000145bcb642 4885c0                         test rax, rax
0000000145bcb645 7449                           je 0x145bcb690
0000000145bcb647 4c8bb580000000                 mov r14, qword ptr [rbp + 0x80]
0000000145bcb64e 498d1cc6                       lea rbx, [r14 + rax*8]
0000000145bcb652 488d7d28                       lea rdi, [rbp + 0x28]
0000000145bcb656 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145bcb660 458b06                         mov r8d, dword ptr [r14]
0000000145bcb663 f3410f104e04                   movss xmm1, dword ptr [r14 + 4]
0000000145bcb669 f3410f59c8                     mulss xmm1, xmm8
0000000145bcb66e f3410f5ec9                     divss xmm1, xmm9
0000000145bcb673 48c74528feffffff               mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
0000000145bcb67b 4889f1                         mov rcx, rsi
0000000145bcb67e 4989f9                         mov r9, rdi
0000000145bcb681 e83a590000                     call 0x145bd0fc0
0000000145bcb686 90                             nop
0000000145bcb687 4983c608                       add r14, 8
0000000145bcb68b 4939de                         cmp r14, rbx
0000000145bcb68e 75d0                           jne 0x145bcb660
0000000145bcb690 488b9588000000                 mov rdx, qword ptr [rbp + 0x88]
0000000145bcb697 4885d2                         test rdx, rdx
0000000145bcb69a 7416                           je 0x145bcb6b2
0000000145bcb69c 48c1e203                       shl rdx, 3
0000000145bcb6a0 41b804000000                   mov r8d, 4
0000000145bcb6a6 488b8d80000000                 mov rcx, qword ptr [rbp + 0x80]
0000000145bcb6ad e81e6b43fa                     call 0x1400021d0
0000000145bcb6b2 f3450f5cc8                     subss xmm9, xmm8
0000000145bcb6b7 0f57c0                         xorps xmm0, xmm0
0000000145bcb6ba 440f2ec8                       ucomiss xmm9, xmm0
0000000145bcb6be 0f8681000000                   jbe 0x145bcb745
0000000145bcb6c4 488b8ec8080000                 mov rcx, qword ptr [rsi + 0x8c8]
0000000145bcb6cb 488b96d0080000                 mov rdx, qword ptr [rsi + 0x8d0]
0000000145bcb6d2 48c1e206                       shl rdx, 6
0000000145bcb6d6 31c0                           xor eax, eax
0000000145bcb6d8 4531c0                         xor r8d, r8d
0000000145bcb6db 0f1f440000                     nop dword ptr [rax + rax]
0000000145bcb6e0 4c39c2                         cmp rdx, r8
0000000145bcb6e3 7421                           je 0x145bcb706
0000000145bcb6e5 4d8d4840                       lea r9, [r8 + 0x40]
0000000145bcb6e9 42803c0114                     cmp byte ptr [rcx + r8], 0x14
0000000145bcb6ee 4d89c8                         mov r8, r9
0000000145bcb6f1 75ed                           jne 0x145bcb6e0
0000000145bcb6f3 f3420f104c09c4                 movss xmm1, dword ptr [rcx + r9 - 0x3c]
0000000145bcb6fa b801000000                     mov eax, 1
0000000145bcb6ff 83f801                         cmp eax, 1
0000000145bcb702 7407                           je 0x145bcb70b
0000000145bcb704 eb3f                           jmp 0x145bcb745
0000000145bcb706 83f801                         cmp eax, 1
0000000145bcb709 753a                           jne 0x145bcb745
0000000145bcb70b f30f598ec8040000               mulss xmm1, dword ptr [rsi + 0x4c8]
0000000145bcb713 f30f10963c050000               movss xmm2, dword ptr [rsi + 0x53c]
0000000145bcb71b 0f2eca                         ucomiss xmm1, xmm2
0000000145bcb71e 7625                           jbe 0x145bcb745
0000000145bcb720 f3410f58d1                     addss xmm2, xmm9
0000000145bcb725 0f28da                         movaps xmm3, xmm2
0000000145bcb728 f30f5dd9                       minss xmm3, xmm1
0000000145bcb72c 0f28cb                         movaps xmm1, xmm3
0000000145bcb72f f30fc2cb03                     cmpunordss xmm1, xmm3
0000000145bcb734 0f54d1                         andps xmm2, xmm1
0000000145bcb737 0f55cb                         andnps xmm1, xmm3
0000000145bcb73a 0f56ca                         orps xmm1, xmm2
0000000145bcb73d f30f118e3c050000               movss dword ptr [rsi + 0x53c], xmm1
0000000145bcb745 f3450f58c1                     addss xmm8, xmm9
0000000145bcb74a 440f2ec0                       ucomiss xmm8, xmm0
0000000145bcb74e 7641                           jbe 0x145bcb791
0000000145bcb750 488b86c8080000                 mov rax, qword ptr [rsi + 0x8c8]
0000000145bcb757 488b8ed0080000                 mov rcx, qword ptr [rsi + 0x8d0]
0000000145bcb75e 48c1e106                       shl rcx, 6
0000000145bcb762 31d2                           xor edx, edx
0000000145bcb764 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145bcb770 4839d1                         cmp rcx, rdx
0000000145bcb773 741c                           je 0x145bcb791
0000000145bcb775 803c1015                       cmp byte ptr [rax + rdx], 0x15
0000000145bcb779 488d5240                       lea rdx, [rdx + 0x40]
0000000145bcb77d 75f1                           jne 0x145bcb770
0000000145bcb77f f3440f5886a0010000             addss xmm8, dword ptr [rsi + 0x1a0]
0000000145bcb788 f3440f1186a0010000             movss dword ptr [rsi + 0x1a0], xmm8
0000000145bcb791 4531e4                         xor r12d, r12d
