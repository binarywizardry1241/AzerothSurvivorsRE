; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bfb420 55                             push rbp
0000000145bfb421 4157                           push r15
0000000145bfb423 4156                           push r14
0000000145bfb425 4155                           push r13
0000000145bfb427 4154                           push r12
0000000145bfb429 56                             push rsi
0000000145bfb42a 57                             push rdi
0000000145bfb42b 53                             push rbx
0000000145bfb42c 4881ec88010000                 sub rsp, 0x188
0000000145bfb433 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bfb43b 660f29b5f0000000               movapd xmmword ptr [rbp + 0xf0], xmm6
0000000145bfb443 48c785e8000000feffffff         mov qword ptr [rbp + 0xe8], 0xfffffffffffffffe
0000000145bfb44e 4889ce                         mov rsi, rcx
0000000145bfb451 48837960ff                     cmp qword ptr [rcx + 0x60], -1
0000000145bfb456 7426                           je 0x145bfb47e
0000000145bfb458 80be2901000000                 cmp byte ptr [rsi + 0x129], 0
0000000145bfb45f 0f8579050000                   jne 0x145bfb9de
0000000145bfb465 83be10010000ff                 cmp dword ptr [rsi + 0x110], -1
0000000145bfb46c 0f856c050000                   jne 0x145bfb9de
0000000145bfb472 b820010000                     mov eax, 0x120
0000000145bfb477 b918010000                     mov ecx, 0x118
0000000145bfb47c eb0a                           jmp 0x145bfb488
0000000145bfb47e b870010000                     mov eax, 0x170
0000000145bfb483 b968010000                     mov ecx, 0x168
0000000145bfb488 488b0c0e                       mov rcx, qword ptr [rsi + rcx]
0000000145bfb48c 488b0406                       mov rax, qword ptr [rsi + rax]
0000000145bfb490 ff5028                         call qword ptr [rax + 0x28]
0000000145bfb493 3c01                           cmp al, 1
0000000145bfb495 0f8543050000                   jne 0x145bfb9de
0000000145bfb49b f20f10b650010000               movsd xmm6, qword ptr [rsi + 0x150]
0000000145bfb4a3 488d8e58010000                 lea rcx, [rsi + 0x158]
0000000145bfb4aa e8b1963500                     call 0x145f54b60
0000000145bfb4af 66480f6ec0                     movq xmm0, rax
0000000145bfb4b4 660f620574f95700               punpckldq xmm0, xmmword ptr [rip + 0x57f974]
0000000145bfb4bc 660f5c057cf95700               subpd xmm0, xmmword ptr [rip + 0x57f97c]
0000000145bfb4c4 660f28c8                       movapd xmm1, xmm0
0000000145bfb4c8 660f15c8                       unpckhpd xmm1, xmm0
0000000145bfb4cc f20f58c8                       addsd xmm1, xmm0
0000000145bfb4d0 0f57c0                         xorps xmm0, xmm0
0000000145bfb4d3 f20f2ac2                       cvtsi2sd xmm0, edx
0000000145bfb4d7 f20f5e0571f95700               divsd xmm0, qword ptr [rip + 0x57f971]
0000000145bfb4df f20f58c1                       addsd xmm0, xmm1
0000000145bfb4e3 f20f100ded2da001               movsd xmm1, qword ptr [rip + 0x1a02ded]
0000000145bfb4eb f20f59c1                       mulsd xmm0, xmm1
0000000145bfb4ef f20f58c6                       addsd xmm0, xmm6
0000000145bfb4f3 f20f5dc1                       minsd xmm0, xmm1
0000000145bfb4f7 f20f118650010000               movsd qword ptr [rsi + 0x150], xmm0
0000000145bfb4ff e80c953500                     call 0x145f54a10
0000000145bfb504 48898658010000                 mov qword ptr [rsi + 0x158], rax
0000000145bfb50b 899660010000                   mov dword ptr [rsi + 0x160], edx
0000000145bfb511 48c785a800000000000000         mov qword ptr [rbp + 0xa8], 0
0000000145bfb51c 48c785b000000008000000         mov qword ptr [rbp + 0xb0], 8
0000000145bfb527 48c785b800000000000000         mov qword ptr [rbp + 0xb8], 0
0000000145bfb532 488b96c8010000                 mov rdx, qword ptr [rsi + 0x1c8]
0000000145bfb539 4885d2                         test rdx, rdx
0000000145bfb53c 0f840d030000                   je 0x145bfb84f
0000000145bfb542 4c8baeb0010000                 mov r13, qword ptr [rsi + 0x1b0]
0000000145bfb549 66410f6f4500                   movdqa xmm0, xmmword ptr [r13]
0000000145bfb54f 660fd7c0                       pmovmskb eax, xmm0
0000000145bfb553 f7d0                           not eax
0000000145bfb555 498d5d10                       lea rbx, [r13 + 0x10]
0000000145bfb559 660f57f6                       xorpd xmm6, xmm6
0000000145bfb55d 4531c0                         xor r8d, r8d
0000000145bfb560 eb1c                           jmp 0x145bfb57e
0000000145bfb562 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145bfb570 8d41ff                         lea eax, [rcx - 1]
0000000145bfb573 21c8                           and eax, ecx
0000000145bfb575 48ffca                         dec rdx
0000000145bfb578 0f847b040000                   je 0x145bfb9f9
0000000145bfb57e 6685c0                         test ax, ax
0000000145bfb581 7527                           jne 0x145bfb5aa
0000000145bfb583 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145bfb590 660f6f03                       movdqa xmm0, xmmword ptr [rbx]
0000000145bfb594 4981c580f9ffff                 add r13, -0x680
0000000145bfb59b 4883c310                       add rbx, 0x10
0000000145bfb59f 660fd7c0                       pmovmskb eax, xmm0
0000000145bfb5a3 35ffff0000                     xor eax, 0xffff
0000000145bfb5a8 74e6                           je 0x145bfb590
0000000145bfb5aa 89c1                           mov ecx, eax
0000000145bfb5ac f30fbcc1                       tzcnt eax, ecx
0000000145bfb5b0 48f7d8                         neg rax
0000000145bfb5b3 486bc068                       imul rax, rax, 0x68
0000000145bfb5b7 41807c05f800                   cmp byte ptr [r13 + rax - 8], 0
0000000145bfb5bd 75b1                           jne 0x145bfb570
0000000145bfb5bf 4a8d3c28                       lea rdi, [rax + r13]
0000000145bfb5c3 418b440598                     mov eax, dword ptr [r13 + rax - 0x68]
0000000145bfb5c8 8985a4000000                   mov dword ptr [rbp + 0xa4], eax
0000000145bfb5ce 488b47e0                       mov rax, qword ptr [rdi - 0x20]
0000000145bfb5d2 48898dc0000000                 mov qword ptr [rbp + 0xc0], rcx
0000000145bfb5d9 48899590000000                 mov qword ptr [rbp + 0x90], rdx
0000000145bfb5e0 483b47b8                       cmp rax, qword ptr [rdi - 0x48]
0000000145bfb5e4 738a                           jae 0x145bfb570
0000000145bfb5e6 f20f108650010000               movsd xmm0, qword ptr [rsi + 0x150]
0000000145bfb5ee 660f2ec6                       ucomisd xmm0, xmm6
0000000145bfb5f2 0f8678ffffff                   jbe 0x145bfb570
0000000145bfb5f8 480347b0                       add rax, qword ptr [rdi - 0x50]
0000000145bfb5fc 488b57a0                       mov rdx, qword ptr [rdi - 0x60]
0000000145bfb600 488b4fa8                       mov rcx, qword ptr [rdi - 0x58]
0000000145bfb604 4839d0                         cmp rax, rdx
0000000145bfb607 490f42d0                       cmovb rdx, r8
0000000145bfb60b 4829d0                         sub rax, rdx
0000000145bfb60e 48c1e005                       shl rax, 5
0000000145bfb612 0f57c9                         xorps xmm1, xmm1
0000000145bfb615 f2480f2a4c0118                 cvtsi2sd xmm1, qword ptr [rcx + rax + 0x18]
0000000145bfb61c f20f5cc1                       subsd xmm0, xmm1
0000000145bfb620 f20f118650010000               movsd qword ptr [rsi + 0x150], xmm0
0000000145bfb628 4c8b640118                     mov r12, qword ptr [rcx + rax + 0x18]
0000000145bfb62d 41bf00000000                   mov r15d, 0
0000000145bfb633 4d85e4                         test r12, r12
0000000145bfb636 0f88fb010000                   js 0x145bfb837
0000000145bfb63c 4c89a5d8000000                 mov qword ptr [rbp + 0xd8], r12
0000000145bfb643 4c8b2401                       mov r12, qword ptr [rcx + rax]
0000000145bfb647 7452                           je 0x145bfb69b
0000000145bfb649 4c89a5c8000000                 mov qword ptr [rbp + 0xc8], r12
0000000145bfb650 4c8b740110                     mov r14, qword ptr [rcx + rax + 0x10]
0000000145bfb655 e8a66b40fa                     call 0x140002200
0000000145bfb65a 41bf01000000                   mov r15d, 1
0000000145bfb660 ba01000000                     mov edx, 1
0000000145bfb665 4c8ba5d8000000                 mov r12, qword ptr [rbp + 0xd8]
0000000145bfb66c 4c89e1                         mov rcx, r12
0000000145bfb66f e84c6b40fa                     call 0x1400021c0
0000000145bfb674 4885c0                         test rax, rax
0000000145bfb677 0f84ba010000                   je 0x145bfb837
0000000145bfb67d 488985d0000000                 mov qword ptr [rbp + 0xd0], rax
0000000145bfb684 4889c1                         mov rcx, rax
0000000145bfb687 4c89f2                         mov rdx, r14
0000000145bfb68a 4d89e0                         mov r8, r12
0000000145bfb68d e899f73a00                     call 0x145faae2b
0000000145bfb692 4c8ba5c8000000                 mov r12, qword ptr [rbp + 0xc8]
0000000145bfb699 eb0c                           jmp 0x145bfb6a7
0000000145bfb69b b801000000                     mov eax, 1
0000000145bfb6a0 488985d0000000                 mov qword ptr [rbp + 0xd0], rax
0000000145bfb6a7 e8546b40fa                     call 0x140002200
0000000145bfb6ac b901000000                     mov ecx, 1
0000000145bfb6b1 ba01000000                     mov edx, 1
0000000145bfb6b6 e8056b40fa                     call 0x1400021c0
0000000145bfb6bb 4885c0                         test rax, rax
0000000145bfb6be 0f844f030000                   je 0x145bfba13
0000000145bfb6c4 c60000                         mov byte ptr [rax], 0
0000000145bfb6c7 48c745d001000000               mov qword ptr [rbp - 0x30], 1
0000000145bfb6cf 488945d8                       mov qword ptr [rbp - 0x28], rax
0000000145bfb6d3 48c745e001000000               mov qword ptr [rbp - 0x20], 1
0000000145bfb6db 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145bfb6e4 ba01000000                     mov edx, 1
0000000145bfb6e9 41b808000000                   mov r8d, 8
0000000145bfb6ef 41b901000000                   mov r9d, 1
0000000145bfb6f5 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145bfb6f9 e842fb3a00                     call 0x145fab240
0000000145bfb6fe 90                             nop
0000000145bfb6ff 4c8b7dd8                       mov r15, qword ptr [rbp - 0x28]
0000000145bfb703 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145bfb707 4f892437                       mov qword ptr [r15 + r14], r12
0000000145bfb70b 4983c608                       add r14, 8
0000000145bfb70f 4c8975e0                       mov qword ptr [rbp - 0x20], r14
0000000145bfb713 488b4dd0                       mov rcx, qword ptr [rbp - 0x30]
0000000145bfb717 4889c8                         mov rax, rcx
0000000145bfb71a 4c29f0                         sub rax, r14
0000000145bfb71d 4c8b85d8000000                 mov r8, qword ptr [rbp + 0xd8]
0000000145bfb724 4939c0                         cmp r8, rax
0000000145bfb727 0f87cf000000                   ja 0x145bfb7fc
0000000145bfb72d 48898dc8000000                 mov qword ptr [rbp + 0xc8], rcx
0000000145bfb734 4d85c0                         test r8, r8
0000000145bfb737 7410                           je 0x145bfb749
0000000145bfb739 4b8d0c37                       lea rcx, [r15 + r14]
0000000145bfb73d 488b95d0000000                 mov rdx, qword ptr [rbp + 0xd0]
0000000145bfb744 e8e2f63a00                     call 0x145faae2b
0000000145bfb749 4c89bd98000000                 mov qword ptr [rbp + 0x98], r15
0000000145bfb750 4c8bbdb8000000                 mov r15, qword ptr [rbp + 0xb8]
0000000145bfb757 4c3bbda8000000                 cmp r15, qword ptr [rbp + 0xa8]
0000000145bfb75e 750d                           jne 0x145bfb76d
0000000145bfb760 488d8da8000000                 lea rcx, [rbp + 0xa8]
0000000145bfb767 e814fe3a00                     call 0x145fab580
0000000145bfb76c 90                             nop
0000000145bfb76d 488b95d8000000                 mov rdx, qword ptr [rbp + 0xd8]
0000000145bfb774 4901d6                         add r14, rdx
0000000145bfb777 4c89f8                         mov rax, r15
0000000145bfb77a 48c1e005                       shl rax, 5
0000000145bfb77e 49ffc7                         inc r15
0000000145bfb781 488b8db0000000                 mov rcx, qword ptr [rbp + 0xb0]
0000000145bfb788 448b85a4000000                 mov r8d, dword ptr [rbp + 0xa4]
0000000145bfb78f 44890401                       mov dword ptr [rcx + rax], r8d
0000000145bfb793 4c8b85c8000000                 mov r8, qword ptr [rbp + 0xc8]
0000000145bfb79a 4c89440108                     mov qword ptr [rcx + rax + 8], r8
0000000145bfb79f 4c8b8598000000                 mov r8, qword ptr [rbp + 0x98]
0000000145bfb7a6 4c89440110                     mov qword ptr [rcx + rax + 0x10], r8
0000000145bfb7ab 4c89740118                     mov qword ptr [rcx + rax + 0x18], r14
0000000145bfb7b0 4c89bdb8000000                 mov qword ptr [rbp + 0xb8], r15
0000000145bfb7b7 4885d2                         test rdx, rdx
0000000145bfb7ba 7412                           je 0x145bfb7ce
0000000145bfb7bc 41b801000000                   mov r8d, 1
0000000145bfb7c2 488b8dd0000000                 mov rcx, qword ptr [rbp + 0xd0]
0000000145bfb7c9 e8026a40fa                     call 0x1400021d0
0000000145bfb7ce 488b47e0                       mov rax, qword ptr [rdi - 0x20]
0000000145bfb7d2 48ffc0                         inc rax
0000000145bfb7d5 488947e0                       mov qword ptr [rdi - 0x20], rax
0000000145bfb7d9 807ff800                       cmp byte ptr [rdi - 8], 0
0000000145bfb7dd 41b800000000                   mov r8d, 0
0000000145bfb7e3 488b8dc0000000                 mov rcx, qword ptr [rbp + 0xc0]
0000000145bfb7ea 488b9590000000                 mov rdx, qword ptr [rbp + 0x90]
0000000145bfb7f1 0f84e9fdffff                   je 0x145bfb5e0
0000000145bfb7f7 e974fdffff                     jmp 0x145bfb570
0000000145bfb7fc 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145bfb805 41b901000000                   mov r9d, 1
0000000145bfb80b 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145bfb80f 4c89f2                         mov rdx, r14
0000000145bfb812 e829fa3a00                     call 0x145fab240
0000000145bfb817 90                             nop
0000000145bfb818 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145bfb81c 488b45d0                       mov rax, qword ptr [rbp - 0x30]
0000000145bfb820 488985c8000000                 mov qword ptr [rbp + 0xc8], rax
0000000145bfb827 4c8b7dd8                       mov r15, qword ptr [rbp - 0x28]
0000000145bfb82b 4c8b85d8000000                 mov r8, qword ptr [rbp + 0xd8]
0000000145bfb832 e902ffffff                     jmp 0x145bfb739
0000000145bfb837 c685e700000000                 mov byte ptr [rbp + 0xe7], 0
0000000145bfb83e 4c89f9                         mov rcx, r15
0000000145bfb841 4c89e2                         mov rdx, r12
0000000145bfb844 e862685500                     call 0x1461520ab
0000000145bfb849 90                             nop
0000000145bfb84a e9d4010000                     jmp 0x145bfba23
0000000145bfb84f b908000000                     mov ecx, 8
0000000145bfb854 31c0                           xor eax, eax
0000000145bfb856 31d2                           xor edx, edx
0000000145bfb858 4889c3                         mov rbx, rax
0000000145bfb85b 48c1e305                       shl rbx, 5
0000000145bfb85f 4c8d2c19                       lea r13, [rcx + rbx]
0000000145bfb863 48894d70                       mov qword ptr [rbp + 0x70], rcx
0000000145bfb867 488995c0000000                 mov qword ptr [rbp + 0xc0], rdx
0000000145bfb86e 48899580000000                 mov qword ptr [rbp + 0x80], rdx
0000000145bfb875 4c89ad88000000                 mov qword ptr [rbp + 0x88], r13
0000000145bfb87c 48898dd0000000                 mov qword ptr [rbp + 0xd0], rcx
0000000145bfb883 4989cc                         mov r12, rcx
0000000145bfb886 4885c0                         test rax, rax
0000000145bfb889 0f84ea000000                   je 0x145bfb979
0000000145bfb88f 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000145bfb896 4883c020                       add rax, 0x20
0000000145bfb89a 4c8d75a8                       lea r14, [rbp - 0x58]
0000000145bfb89e 4c8d7dd0                       lea r15, [rbp - 0x30]
0000000145bfb8a2 eb2a                           jmp 0x145bfb8ce
0000000145bfb8a4 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145bfb8b0 4c89f9                         mov rcx, r15
0000000145bfb8b3 e88881ffff                     call 0x145bf3a40
0000000145bfb8b8 4c8ba5d8000000                 mov r12, qword ptr [rbp + 0xd8]
0000000145bfb8bf 498d442420                     lea rax, [r12 + 0x20]
0000000145bfb8c4 4883c3e0                       add rbx, -0x20
0000000145bfb8c8 0f84ab000000                   je 0x145bfb979
0000000145bfb8ce 4989c4                         mov r12, rax
0000000145bfb8d1 488b40e8                       mov rax, qword ptr [rax - 0x18]
0000000145bfb8d5 4883f8ff                       cmp rax, -1
0000000145bfb8d9 0f849a000000                   je 0x145bfb979
0000000145bfb8df 418b4c24e0                     mov ecx, dword ptr [r12 - 0x20]
0000000145bfb8e4 4c89a5d8000000                 mov qword ptr [rbp + 0xd8], r12
0000000145bfb8eb f3410f6f4424f0                 movdqu xmm0, xmmword ptr [r12 - 0x10]
0000000145bfb8f2 660f7f45c0                     movdqa xmmword ptr [rbp - 0x40], xmm0
0000000145bfb8f7 894df0                         mov dword ptr [rbp - 0x10], ecx
0000000145bfb8fa 488945d8                       mov qword ptr [rbp - 0x28], rax
0000000145bfb8fe 488d45e0                       lea rax, [rbp - 0x20]
0000000145bfb902 f30f7f00                       movdqu xmmword ptr [rax], xmm0
0000000145bfb906 48b80500000000000080           movabs rax, 0x8000000000000005
0000000145bfb910 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145bfb914 48837e60ff                     cmp qword ptr [rsi + 0x60], -1
0000000145bfb919 7435                           je 0x145bfb950
0000000145bfb91b 4c8ba618010000                 mov r12, qword ptr [rsi + 0x118]
0000000145bfb922 488bbe20010000                 mov rdi, qword ptr [rsi + 0x120]
0000000145bfb929 4c89f1                         mov rcx, r14
0000000145bfb92c 4c89fa                         mov rdx, r15
0000000145bfb92f e80cf52000                     call 0x145e0ae40
0000000145bfb934 90                             nop
0000000145bfb935 4c89e1                         mov rcx, r12
0000000145bfb938 4c89f2                         mov rdx, r14
0000000145bfb93b ff5718                         call qword ptr [rdi + 0x18]
0000000145bfb93e 90                             nop
0000000145bfb93f e96cffffff                     jmp 0x145bfb8b0
0000000145bfb944 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145bfb950 4c8ba668010000                 mov r12, qword ptr [rsi + 0x168]
0000000145bfb957 488bbe70010000                 mov rdi, qword ptr [rsi + 0x170]
0000000145bfb95e 4c89f1                         mov rcx, r14
0000000145bfb961 4c89fa                         mov rdx, r15
0000000145bfb964 e8d7f42000                     call 0x145e0ae40
0000000145bfb969 90                             nop
0000000145bfb96a 4c89e1                         mov rcx, r12
0000000145bfb96d 4c89f2                         mov rdx, r14
0000000145bfb970 ff5718                         call qword ptr [rdi + 0x18]
0000000145bfb973 90                             nop
0000000145bfb974 e937ffffff                     jmp 0x145bfb8b0
0000000145bfb979 4c896578                       mov qword ptr [rbp + 0x78], r12
0000000145bfb97d 4d29e5                         sub r13, r12
0000000145bfb980 488bb5d0000000                 mov rsi, qword ptr [rbp + 0xd0]
0000000145bfb987 488bbdc0000000                 mov rdi, qword ptr [rbp + 0xc0]
0000000145bfb98e 7434                           je 0x145bfb9c4
0000000145bfb990 49c1ed05                       shr r13, 5
0000000145bfb994 4983c410                       add r12, 0x10
0000000145bfb998 eb0f                           jmp 0x145bfb9a9
0000000145bfb99a 660f1f440000                   nop word ptr [rax + rax]
0000000145bfb9a0 4983c420                       add r12, 0x20
0000000145bfb9a4 49ffcd                         dec r13
0000000145bfb9a7 741b                           je 0x145bfb9c4
0000000145bfb9a9 498b5424f8                     mov rdx, qword ptr [r12 - 8]
0000000145bfb9ae 4885d2                         test rdx, rdx
0000000145bfb9b1 74ed                           je 0x145bfb9a0
0000000145bfb9b3 498b0c24                       mov rcx, qword ptr [r12]
0000000145bfb9b7 41b801000000                   mov r8d, 1
0000000145bfb9bd e80e6840fa                     call 0x1400021d0
0000000145bfb9c2 ebdc                           jmp 0x145bfb9a0
0000000145bfb9c4 4885ff                         test rdi, rdi
0000000145bfb9c7 7415                           je 0x145bfb9de
0000000145bfb9c9 48c1e705                       shl rdi, 5
0000000145bfb9cd 41b808000000                   mov r8d, 8
0000000145bfb9d3 4889f1                         mov rcx, rsi
0000000145bfb9d6 4889fa                         mov rdx, rdi
0000000145bfb9d9 e8f26740fa                     call 0x1400021d0
0000000145bfb9de 0f28b5f0000000                 movaps xmm6, xmmword ptr [rbp + 0xf0]
0000000145bfb9e5 4881c488010000                 add rsp, 0x188
0000000145bfb9ec 5b                             pop rbx
0000000145bfb9ed 5f                             pop rdi
0000000145bfb9ee 5e                             pop rsi
0000000145bfb9ef 415c                           pop r12
0000000145bfb9f1 415d                           pop r13
0000000145bfb9f3 415e                           pop r14
0000000145bfb9f5 415f                           pop r15
0000000145bfb9f7 5d                             pop rbp
0000000145bfb9f8 c3                             ret
0000000145bfb9f9 488b95a8000000                 mov rdx, qword ptr [rbp + 0xa8]
0000000145bfba00 488b8db0000000                 mov rcx, qword ptr [rbp + 0xb0]
0000000145bfba07 488b85b8000000                 mov rax, qword ptr [rbp + 0xb8]
0000000145bfba0e e945feffff                     jmp 0x145bfb858
0000000145bfba13 b901000000                     mov ecx, 1
0000000145bfba18 ba01000000                     mov edx, 1
0000000145bfba1d e86f665500                     call 0x146152091
0000000145bfba22 90                             nop
0000000145bfba23 0f0b                           ud2
