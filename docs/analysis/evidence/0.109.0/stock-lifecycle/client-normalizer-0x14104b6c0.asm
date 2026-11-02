0x14104b6c0: 55                       push rbp
0x14104b6c1: 4157                     push r15
0x14104b6c3: 4156                     push r14
0x14104b6c5: 4154                     push r12
0x14104b6c7: 56                       push rsi
0x14104b6c8: 57                       push rdi
0x14104b6c9: 53                       push rbx
0x14104b6ca: 4883ec50                 sub rsp, 0x50
0x14104b6ce: 488d6c2450               lea rbp, [rsp + 0x50]
0x14104b6d3: 48c745f8feffffff         mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14104b6db: 4889ce                   mov rsi, rcx
0x14104b6de: 498d40ef                 lea rax, [r8 - 0x11]
0x14104b6e2: 4883f8ef                 cmp rax, -0x11
0x14104b6e6: 7713                     ja 0x14104b6fb
0x14104b6e8: c74608ffffffff           mov dword ptr [rsi + 8], 0xffffffff
0x14104b6ef: 48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
0x14104b6f6: e988010000               jmp 0x14104b883
0x14104b6fb: 4c89c7                   mov rdi, r8
0x14104b6fe: 4889d3                   mov rbx, rdx
0x14104b701: e8fa6afbfe               call 0x140002200
0x14104b706: ba01000000               mov edx, 1
0x14104b70b: 4889f9                   mov rcx, rdi
0x14104b70e: e8ad6afbfe               call 0x1400021c0
0x14104b713: 4885c0                   test rax, rax
0x14104b716: 0f8479010000             je 0x14104b895
0x14104b71c: 48897de0                 mov qword ptr [rbp - 0x20], rdi
0x14104b720: 488945e8                 mov qword ptr [rbp - 0x18], rax
0x14104b724: 48c745f000000000         mov qword ptr [rbp - 0x10], 0
0x14104b72c: 4801df                   add rdi, rbx
0x14104b72f: 4531f6                   xor r14d, r14d
0x14104b732: 4c8d7de0                 lea r15, [rbp - 0x20]
0x14104b736: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x14104b740: 0fb613                   movzx edx, byte ptr [rbx]
0x14104b743: 0fb6ca                   movzx ecx, dl
0x14104b746: 84c9                     test cl, cl
0x14104b748: 7816                     js 0x14104b760
0x14104b74a: 48ffc3                   inc rbx
0x14104b74d: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14104b751: 4189cc                   mov r12d, ecx
0x14104b754: e997000000               jmp 0x14104b7f0
0x14104b759: 0f1f8000000000           nop dword ptr [rax]
0x14104b760: 4189cc                   mov r12d, ecx
0x14104b763: 4183e41f                 and r12d, 0x1f
0x14104b767: 440fb64301               movzx r8d, byte ptr [rbx + 1]
0x14104b76c: 4183e03f                 and r8d, 0x3f
0x14104b770: 80f9df                   cmp cl, 0xdf
0x14104b773: 7643                     jbe 0x14104b7b8
0x14104b775: 0fb64b02                 movzx ecx, byte ptr [rbx + 2]
0x14104b779: 41c1e006                 shl r8d, 6
0x14104b77d: 83e13f                   and ecx, 0x3f
0x14104b780: 4409c1                   or ecx, r8d
0x14104b783: 80faf0                   cmp dl, 0xf0
0x14104b786: 724d                     jb 0x14104b7d5
0x14104b788: 0fb65303                 movzx edx, byte ptr [rbx + 3]
0x14104b78c: 4883c304                 add rbx, 4
0x14104b790: 4183e407                 and r12d, 7
0x14104b794: 41c1e412                 shl r12d, 0x12
0x14104b798: c1e106                   shl ecx, 6
0x14104b79b: 83e23f                   and edx, 0x3f
0x14104b79e: 09ca                     or edx, ecx
0x14104b7a0: 4409e2                   or edx, r12d
0x14104b7a3: 4189d4                   mov r12d, edx
0x14104b7a6: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14104b7aa: 4181fc80000000           cmp r12d, 0x80
0x14104b7b1: 723d                     jb 0x14104b7f0
0x14104b7b3: e99b000000               jmp 0x14104b853
0x14104b7b8: 4883c302                 add rbx, 2
0x14104b7bc: 41c1e406                 shl r12d, 6
0x14104b7c0: 4509c4                   or r12d, r8d
0x14104b7c3: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14104b7c7: 4181fc80000000           cmp r12d, 0x80
0x14104b7ce: 7220                     jb 0x14104b7f0
0x14104b7d0: e97e000000               jmp 0x14104b853
0x14104b7d5: 4883c303                 add rbx, 3
0x14104b7d9: 41c1e40c                 shl r12d, 0xc
0x14104b7dd: 4409e1                   or ecx, r12d
0x14104b7e0: 4189cc                   mov r12d, ecx
0x14104b7e3: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14104b7e7: 4181fc80000000           cmp r12d, 0x80
0x14104b7ee: 7363                     jae 0x14104b853
0x14104b7f0: 4183fc20                 cmp r12d, 0x20
0x14104b7f4: 725d                     jb 0x14104b853
0x14104b7f6: 4183fc7f                 cmp r12d, 0x7f
0x14104b7fa: 7457                     je 0x14104b853
0x14104b7fc: 4939d6                   cmp r14, rdx
0x14104b7ff: 742b                     je 0x14104b82c
0x14104b801: 418d4c249f               lea ecx, [r12 - 0x61]
0x14104b806: 4489e2                   mov edx, r12d
0x14104b809: 80e25f                   and dl, 0x5f
0x14104b80c: 83f91a                   cmp ecx, 0x1a
0x14104b80f: 0fb6ca                   movzx ecx, dl
0x14104b812: 410f43cc                 cmovae ecx, r12d
0x14104b816: 42880c30                 mov byte ptr [rax + r14], cl
0x14104b81a: 49ffc6                   inc r14
0x14104b81d: 4c8975f0                 mov qword ptr [rbp - 0x10], r14
0x14104b821: 4839fb                   cmp rbx, rdi
0x14104b824: 0f8516ffffff             jne 0x14104b740
0x14104b82a: eb48                     jmp 0x14104b874
0x14104b82c: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x14104b835: 41b801000000             mov r8d, 1
0x14104b83b: 41b901000000             mov r9d, 1
0x14104b841: 4c89f9                   mov rcx, r15
0x14104b844: 4c89f2                   mov rdx, r14
0x14104b847: e824f1ba04               call 0x145bfa970
0x14104b84c: 90                       nop
0x14104b84d: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0x14104b851: ebae                     jmp 0x14104b801
0x14104b853: 44896608                 mov dword ptr [rsi + 8], r12d
0x14104b857: 48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
0x14104b85e: 4885d2                   test rdx, rdx
0x14104b861: 7420                     je 0x14104b883
0x14104b863: 488b4de8                 mov rcx, qword ptr [rbp - 0x18]
0x14104b867: 41b801000000             mov r8d, 1
0x14104b86d: e85e69fbfe               call 0x1400021d0
0x14104b872: eb0f                     jmp 0x14104b883
0x14104b874: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x14104b878: 48894610                 mov qword ptr [rsi + 0x10], rax
0x14104b87c: 0f1045e0                 movups xmm0, xmmword ptr [rbp - 0x20]
0x14104b880: 0f1106                   movups xmmword ptr [rsi], xmm0
0x14104b883: 4889f0                   mov rax, rsi
0x14104b886: 4883c450                 add rsp, 0x50
0x14104b88a: 5b                       pop rbx
0x14104b88b: 5f                       pop rdi
0x14104b88c: 5e                       pop rsi
0x14104b88d: 415c                     pop r12
0x14104b88f: 415e                     pop r14
0x14104b891: 415f                     pop r15
0x14104b893: 5d                       pop rbp
0x14104b894: c3                       ret
0x14104b895: b901000000               mov ecx, 1
0x14104b89a: 4889fa                   mov rdx, rdi
0x14104b89d: e819dad404               call 0x145d992bb
0x14104b8a2: 0f0b                     ud2
