; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145c04d60 55                             push rbp
0000000145c04d61 4156                           push r14
0000000145c04d63 56                             push rsi
0000000145c04d64 57                             push rdi
0000000145c04d65 53                             push rbx
0000000145c04d66 4883ec40                       sub rsp, 0x40
0000000145c04d6a 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145c04d6f 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145c04d77 4889ce                         mov rsi, rcx
0000000145c04d7a 488b19                         mov rbx, qword ptr [rcx]
0000000145c04d7d b101                           mov cl, 1
0000000145c04d7f 31c0                           xor eax, eax
0000000145c04d81 f00fb04b10                     lock cmpxchg byte ptr [rbx + 0x10], cl
0000000145c04d86 7532                           jne 0x145c04dba
0000000145c04d88 488b3de9fd9202                 mov rdi, qword ptr [rip + 0x292fde9]
0000000145c04d8f 488b07                         mov rax, qword ptr [rdi]
0000000145c04d92 48d1e0                         shl rax, 1
0000000145c04d95 4885c0                         test rax, rax
0000000145c04d98 752b                           jne 0x145c04dc5
0000000145c04d9a 4531f6                         xor r14d, r14d
0000000145c04d9d 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145c04da1 48837b78ff                     cmp qword ptr [rbx + 0x78], -1
0000000145c04da6 7434                           je 0x145c04ddc
0000000145c04da8 0fb68341010000                 movzx eax, byte ptr [rbx + 0x141]
0000000145c04daf fec0                           inc al
0000000145c04db1 3c02                           cmp al, 2
0000000145c04db3 7551                           jne 0x145c04e06
0000000145c04db5 e9fc000000                     jmp 0x145c04eb6
0000000145c04dba 488d4b10                       lea rcx, [rbx + 0x10]
0000000145c04dbe e88db95400                     call 0x146150750
0000000145c04dc3 ebc3                           jmp 0x145c04d88
0000000145c04dc5 e816c75400                     call 0x1461514e0
0000000145c04dca 4189c6                         mov r14d, eax
0000000145c04dcd 4180f601                       xor r14b, 1
0000000145c04dd1 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145c04dd5 48837b78ff                     cmp qword ptr [rbx + 0x78], -1
0000000145c04dda 75cc                           jne 0x145c04da8
0000000145c04ddc 448975f4                       mov dword ptr [rbp - 0xc], r14d
0000000145c04de0 488b8b80010000                 mov rcx, qword ptr [rbx + 0x180]
0000000145c04de7 48895de8                       mov qword ptr [rbp - 0x18], rbx
0000000145c04deb 488b8388010000                 mov rax, qword ptr [rbx + 0x188]
0000000145c04df2 ff5028                         call qword ptr [rax + 0x28]
0000000145c04df5 90                             nop
0000000145c04df6 488b5de8                       mov rbx, qword ptr [rbp - 0x18]
0000000145c04dfa 448b75f4                       mov r14d, dword ptr [rbp - 0xc]
0000000145c04dfe 3c02                           cmp al, 2
0000000145c04e00 0f84b0000000                   je 0x145c04eb6
0000000145c04e06 4883bbb001000000               cmp qword ptr [rbx + 0x1b0], 0
0000000145c04e0e 0f84a2000000                   je 0x145c04eb6
0000000145c04e14 488d5608                       lea rdx, [rsi + 8]
0000000145c04e18 488d8bb8010000                 lea rcx, [rbx + 0x1b8]
0000000145c04e1f e83c3b91fa                     call 0x140518960
0000000145c04e24 4989c0                         mov r8, rax
0000000145c04e27 49c1e839                       shr r8, 0x39
0000000145c04e2b 488b8b98010000                 mov rcx, qword ptr [rbx + 0x198]
0000000145c04e32 488b93a0010000                 mov rdx, qword ptr [rbx + 0x1a0]
0000000145c04e39 66410f6ec0                     movd xmm0, r8d
0000000145c04e3e 660f60c0                       punpcklbw xmm0, xmm0
0000000145c04e42 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145c04e47 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145c04e4c 448b4608                       mov r8d, dword ptr [rsi + 8]
0000000145c04e50 4531c9                         xor r9d, r9d
0000000145c04e53 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c04e57 4821d0                         and rax, rdx
0000000145c04e5a f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145c04e5f 660f6fda                       movdqa xmm3, xmm2
0000000145c04e63 660f74d8                       pcmpeqb xmm3, xmm0
0000000145c04e67 66440fd7d3                     pmovmskb r10d, xmm3
0000000145c04e6c 4585d2                         test r10d, r10d
0000000145c04e6f 742a                           je 0x145c04e9b
0000000145c04e71 f3450fbcda                     tzcnt r11d, r10d
0000000145c04e76 4901c3                         add r11, rax
0000000145c04e79 4921d3                         and r11, rdx
0000000145c04e7c 49f7db                         neg r11
0000000145c04e7f 4f8d1c5b                       lea r11, [r11 + r11*2]
0000000145c04e83 49c1e304                       shl r11, 4
0000000145c04e87 463b4419d0                     cmp r8d, dword ptr [rcx + r11 - 0x30]
0000000145c04e8c 744f                           je 0x145c04edd
0000000145c04e8e 458d5aff                       lea r11d, [r10 - 1]
0000000145c04e92 664521d3                       and r11w, r10w
0000000145c04e96 4589da                         mov r10d, r11d
0000000145c04e99 75d6                           jne 0x145c04e71
0000000145c04e9b 660f74d1                       pcmpeqb xmm2, xmm1
0000000145c04e9f 66440fd7d2                     pmovmskb r10d, xmm2
0000000145c04ea4 4585d2                         test r10d, r10d
0000000145c04ea7 750d                           jne 0x145c04eb6
0000000145c04ea9 4c01c8                         add rax, r9
0000000145c04eac 4883c010                       add rax, 0x10
0000000145c04eb0 4983c110                       add r9, 0x10
0000000145c04eb4 eba1                           jmp 0x145c04e57
0000000145c04eb6 31c0                           xor eax, eax
0000000145c04eb8 4584f6                         test r14b, r14b
0000000145c04ebb 750b                           jne 0x145c04ec8
0000000145c04ebd 488b0f                         mov rcx, qword ptr [rdi]
0000000145c04ec0 48d1e1                         shl rcx, 1
0000000145c04ec3 4885c9                         test rcx, rcx
0000000145c04ec6 753c                           jne 0x145c04f04
0000000145c04ec8 31c9                           xor ecx, ecx
0000000145c04eca 864b10                         xchg byte ptr [rbx + 0x10], cl
0000000145c04ecd 80f902                         cmp cl, 2
0000000145c04ed0 7420                           je 0x145c04ef2
0000000145c04ed2 4883c440                       add rsp, 0x40
0000000145c04ed6 5b                             pop rbx
0000000145c04ed7 5f                             pop rdi
0000000145c04ed8 5e                             pop rsi
0000000145c04ed9 415e                           pop r14
0000000145c04edb 5d                             pop rbp
0000000145c04edc c3                             ret
0000000145c04edd 4c01d9                         add rcx, r11
0000000145c04ee0 b001                           mov al, 1
0000000145c04ee2 8079f800                       cmp byte ptr [rcx - 8], 0
0000000145c04ee6 75d0                           jne 0x145c04eb8
0000000145c04ee8 488379f000                     cmp qword ptr [rcx - 0x10], 0
0000000145c04eed 0f95c0                         setne al
0000000145c04ef0 ebc6                           jmp 0x145c04eb8
0000000145c04ef2 4883c310                       add rbx, 0x10
0000000145c04ef6 4889d9                         mov rcx, rbx
0000000145c04ef9 89c6                           mov esi, eax
0000000145c04efb e810b95400                     call 0x146150810
0000000145c04f00 89f0                           mov eax, esi
0000000145c04f02 ebce                           jmp 0x145c04ed2
0000000145c04f04 89c6                           mov esi, eax
0000000145c04f06 e8d5c55400                     call 0x1461514e0
0000000145c04f0b 89c1                           mov ecx, eax
0000000145c04f0d 89f0                           mov eax, esi
0000000145c04f0f 84c9                           test cl, cl
0000000145c04f11 75b5                           jne 0x145c04ec8
0000000145c04f13 c6431101                       mov byte ptr [rbx + 0x11], 1
0000000145c04f17 ebaf                           jmp 0x145c04ec8
