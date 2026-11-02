// data-next
0000000145bdcb99 498b46e8                       mov rax, qword ptr [r14 - 0x18]
0000000145bdcb9d 48ffc0                         inc rax
0000000145bdcba0 4939c5                         cmp r13, rax
0000000145bdcba3 0f85d3010000                   jne 0x145bdcd7c
0000000145bdcba9 4d896ee8                       mov qword ptr [r14 - 0x18], r13
// data-forward-gap
0000000145bdcd7c 0f86a3000000                   jbe 0x145bdce25
0000000145bdcd82 41807ef800                     cmp byte ptr [r14 - 8], 0
0000000145bdcd87 0f8598000000                   jne 0x145bdce25
0000000145bdcd8d 4d896ee8                       mov qword ptr [r14 - 0x18], r13
// ack-clamp
0000000145bdcaa9 498b46c8                       mov rax, qword ptr [r14 - 0x38]
0000000145bdcaad 4839f8                         cmp rax, rdi
0000000145bdcab0 480f43c7                       cmovae rax, rdi
0000000145bdcab4 488945b8                       mov qword ptr [rbp - 0x48], rax
// ack-drain-cursors
0000000145bdcb49 488d0c03                       lea rcx, [rbx + rax]
0000000145bdcb4d 4c2b4118                       sub r8, qword ptr [rcx + 0x18]
0000000145bdcb51 488b4c0310                     mov rcx, qword ptr [rbx + rax + 0x10]
0000000145bdcb56 4d8946d0                       mov qword ptr [r14 - 0x30], r8
0000000145bdcb5a 4983fb01                       cmp r11, 1
0000000145bdcb5e 4983d3ff                       adc r11, -1
0000000145bdcb62 4d895ed8                       mov qword ptr [r14 - 0x28], r11
0000000145bdcb66 4983ff01                       cmp r15, 1
0000000145bdcb6a 4983d7ff                       adc r15, -1
0000000145bdcb6e 4d897ee0                       mov qword ptr [r14 - 0x20], r15
// control-replay-reset
0000000145bdcde2 49c746d800000000               mov qword ptr [r14 - 0x28], 0
0000000145bdcdea 498946e0                       mov qword ptr [r14 - 0x20], rax
0000000145bdcdee 41c646f800                     mov byte ptr [r14 - 8], 0
0000000145bdcdf3 41c746c0ffffffff               mov dword ptr [r14 - 0x40], 0xffffffff
// replay-budget-gate
0000000145bdd1d0 483b47b0                       cmp rax, qword ptr [rdi - 0x50]
0000000145bdd1d4 738a                           jae 0x145bdd160
0000000145bdd1d6 488b57e0                       mov rdx, qword ptr [rdi - 0x20]
0000000145bdd1da f20f108668010000               movsd xmm0, qword ptr [rsi + 0x168]
0000000145bdd1e2 4839d0                         cmp rax, rdx
0000000145bdd1e5 730a                           jae 0x145bdd1f1
0000000145bdd1e7 660f2ec6                       ucomisd xmm0, xmm6
0000000145bdd1eb 0f866fffffff                   jbe 0x145bdd160
// replay-budget-charge
0000000145bdd214 4839d0                         cmp rax, rdx
0000000145bdd217 7315                           jae 0x145bdd22e
0000000145bdd219 0f57c9                         xorps xmm1, xmm1
0000000145bdd21c f2480f2a4918                   cvtsi2sd xmm1, qword ptr [rcx + 0x18]
0000000145bdd222 f20f5cc1                       subsd xmm0, xmm1
0000000145bdd226 f20f118668010000               movsd qword ptr [rsi + 0x168], xmm0
// pending-limit
0000000145bdda04 49817fd000000001               cmp qword ptr [r15 - 0x30], 0x1000000
0000000145bdda0c 0f86a1000000                   jbe 0x145bddab3
// ack-clock-input
0000000145bda809 f30f2af2                       cvtsi2ss xmm6, edx
0000000145bda80d f30f5e355bca6700               divss xmm6, dword ptr [rip + 0x67ca5b]
0000000145bda815 f30f58f0                       addss xmm6, xmm0
// ack-control-constants
0000000145bda85a f30f103d0eca6700               movss xmm7, dword ptr [rip + 0x67ca0e]
0000000145bda862 f3440f1005157b5d00             movss xmm8, dword ptr [rip + 0x5d7b15]
0000000145bda86b f3440f100d087a5d00             movss xmm9, dword ptr [rip + 0x5d7a08]
// control-clock-gate
0000000145bda949 4885c0                         test rax, rax
0000000145bda94c 780a                           js 0x145bda958
0000000145bda94e 0f57c0                         xorps xmm0, xmm0
0000000145bda951 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bda956 eb18                           jmp 0x145bda970
0000000145bda958 4889c1                         mov rcx, rax
0000000145bda95b 48d1e9                         shr rcx, 1
0000000145bda95e 83e001                         and eax, 1
0000000145bda961 4809c8                         or rax, rcx
0000000145bda964 0f57c0                         xorps xmm0, xmm0
0000000145bda967 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bda96c f30f58c0                       addss xmm0, xmm0
0000000145bda970 0f57c9                         xorps xmm1, xmm1
0000000145bda973 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bda977 f30f5ecf                       divss xmm1, xmm7
0000000145bda97b f30f58c8                       addss xmm1, xmm0
0000000145bda97f 410f2ec8                       ucomiss xmm1, xmm8
0000000145bda983 736b                           jae 0x145bda9f0
// ack-new-progress
0000000145bda985 410f2ef1                       ucomiss xmm6, xmm9
0000000145bda989 0f8223ffffff                   jb 0x145bda8b2
0000000145bda98f 488b7ee8                       mov rdi, qword ptr [rsi - 0x18]
0000000145bda993 483b7ef0                       cmp rdi, qword ptr [rsi - 0x10]
0000000145bda997 0f8615ffffff                   jbe 0x145bda8b2
0000000145bda99d 48897ef0                       mov qword ptr [rsi - 0x10], rdi
// ack-clock-reset
0000000145bdaa35 0f2e3540785d00                 ucomiss xmm6, dword ptr [rip + 0x5d7840]
0000000145bdaa3c 7221                           jb 0x145bdaa5f
0000000145bdaa3e c6850c03000001                 mov byte ptr [rbp + 0x30c], 1
0000000145bdaa45 e8e6413d00                     call 0x145faec30
0000000145bdaa4a 90                             nop
0000000145bdaa4b 488b8d00030000                 mov rcx, qword ptr [rbp + 0x300]
0000000145bdaa52 48898158010000                 mov qword ptr [rcx + 0x158], rax
0000000145bdaa59 899160010000                   mov dword ptr [rcx + 0x160], edx
