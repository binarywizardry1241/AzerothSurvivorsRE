0000000145bd68b8 498b4120                       mov rax, qword ptr [r9 + 0x20]
0000000145bd68bc 48898590060000                 mov qword ptr [rbp + 0x690], rax
0000000145bd68c3 4d8b4128                       mov r8, qword ptr [r9 + 0x28]
0000000145bd68c7 4d8b4930                       mov r9, qword ptr [r9 + 0x30]
0000000145bd68cb 4889f1                         mov rcx, rsi
0000000145bd68ce 4c898588060000                 mov qword ptr [rbp + 0x688], r8
0000000145bd68d5 e8460d0000                     call 0x145bd7620
0000000145bd68da 90                             nop 
0000000145bd68db 488b9590060000                 mov rdx, qword ptr [rbp + 0x690]
0000000145bd68e2 4885d2                         test rdx, rdx
0000000145bd68e5 0f844c020000                   je 0x145bd6b37
0000000145bd68eb 41b801000000                   mov r8d, 1
0000000145bd68f1 488b8d88060000                 mov rcx, qword ptr [rbp + 0x688]
0000000145bd68f8 e8d3b842fa                     call 0x1400021d0
0000000145bd68fd 31ff                           xor edi, edi
0000000145bd68ff e9cf060000                     jmp 0x145bd6fd3
0000000145bd6904 48833b00                       cmp qword ptr [rbx], 0
0000000145bd6908 0f84c5060000                   je 0x145bd6fd3
0000000145bd690e 80bbe504000000                 cmp byte ptr [rbx + 0x4e5], 0
0000000145bd6915 0f85b8060000                   jne 0x145bd6fd3
0000000145bd691b c685a706000001                 mov byte ptr [rbp + 0x6a7], 1
0000000145bd6922 c685a606000001                 mov byte ptr [rbp + 0x6a6], 1
0000000145bd6929 c685a506000001                 mov byte ptr [rbp + 0x6a5], 1
0000000145bd6930 c685a406000001                 mov byte ptr [rbp + 0x6a4], 1
0000000145bd6937 c685a306000001                 mov byte ptr [rbp + 0x6a3], 1
0000000145bd693e 4889f1                         mov rcx, rsi
0000000145bd6941 e8aac8ffff                     call 0x145bd31f0
0000000145bd6946 90                             nop 
0000000145bd6947 e987060000                     jmp 0x145bd6fd3
0000000145bd694c 418b7108                       mov esi, dword ptr [r9 + 8]
0000000145bd6950 488b8bc8040000                 mov rcx, qword ptr [rbx + 0x4c8]
0000000145bd6957 488b83d0040000                 mov rax, qword ptr [rbx + 0x4d0]
0000000145bd695e 488b4060                       mov rax, qword ptr [rax + 0x60]
0000000145bd6962 c685a706000001                 mov byte ptr [rbp + 0x6a7], 1
0000000145bd6969 c685a606000001                 mov byte ptr [rbp + 0x6a6], 1
0000000145bd6970 c685a506000001                 mov byte ptr [rbp + 0x6a5], 1
0000000145bd6977 c685a406000001                 mov byte ptr [rbp + 0x6a4], 1
0000000145bd697e c685a306000001                 mov byte ptr [rbp + 0x6a3], 1
0000000145bd6985 ffd0                           call rax
0000000145bd6987 90                             nop 
0000000145bd6988 f20f593520216700               mulsd xmm6, qword ptr [rip + 0x672120]
0000000145bd6990 f2480f2cce                     cvttsd2si rcx, xmm6
0000000145bd6995 4889ca                         mov rdx, rcx
0000000145bd6998 48c1fa3f                       sar rdx, 0x3f
0000000145bd699c 660f28ce                       movapd xmm1, xmm6
0000000145bd69a0 f20f5c0db0c76500               subsd xmm1, qword ptr [rip + 0x65c7b0]
0000000145bd69a8 f24c0f2cc1                     cvttsd2si r8, xmm1
0000000145bd69ad 4121d0                         and r8d, edx
0000000145bd69b0 4409c1                         or ecx, r8d
0000000145bd69b3 4531f6                         xor r14d, r14d
0000000145bd69b6 660f57c9                       xorpd xmm1, xmm1
0000000145bd69ba 660f2ef1                       ucomisd xmm6, xmm1
0000000145bd69be ba00000000                     mov edx, 0
0000000145bd69c3 480f43d1                       cmovae rdx, rcx
0000000145bd69c7 660f2e3591c76500               ucomisd xmm6, qword ptr [rip + 0x65c791]
0000000145bd69cf 48c7c1ffffffff                 mov rcx, 0xffffffffffffffff
0000000145bd69d6 480f46ca                       cmovbe rcx, rdx
0000000145bd69da 83f801                         cmp eax, 1
0000000145bd69dd 0f8500010000                   jne 0x145bd6ae3
0000000145bd69e3 e887ad4800                     call 0x14606176f
0000000145bd69e8 f3480f2cc0                     cvttss2si rax, xmm0
0000000145bd69ed 660f57c9                       xorpd xmm1, xmm1
0000000145bd69f1 0f2ec1                         ucomiss xmm0, xmm1
0000000145bd69f4 410f42c6                       cmovb eax, r14d
0000000145bd69f8 0f2e05f5616700                 ucomiss xmm0, dword ptr [rip + 0x6761f5]
0000000145bd69ff b9ffffffff                     mov ecx, 0xffffffff
0000000145bd6a04 0f46c8                         cmovbe ecx, eax
0000000145bd6a07 e9d9000000                     jmp 0x145bd6ae5
0000000145bd6a0c 410fb74120                     movzx eax, word ptr [r9 + 0x20]
0000000145bd6a11 66898576060000                 mov word ptr [rbp + 0x676], ax
0000000145bd6a18 498b4118                       mov rax, qword ptr [r9 + 0x18]
0000000145bd6a1c 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145bd6a23 f3410f6f4108                   movdqu xmm0, xmmword ptr [r9 + 8]
0000000145bd6a29 660f7f85e0010000               movdqa xmmword ptr [rbp + 0x1e0], xmm0
0000000145bd6a31 80bbe504000001                 cmp byte ptr [rbx + 0x4e5], 1
0000000145bd6a38 0f854c010000                   jne 0x145bd6b8a
0000000145bd6a3e 488d8d18040000                 lea rcx, [rbp + 0x418]
0000000145bd6a45 4989d0                         mov r8, rdx
0000000145bd6a48 4889f2                         mov rdx, rsi
0000000145bd6a4b e8900bfdff                     call 0x145ba75e0
0000000145bd6a50 90                             nop 
0000000145bd6a51 488b9528040000                 mov rdx, qword ptr [rbp + 0x428]
0000000145bd6a58 80bd1804000000                 cmp byte ptr [rbp + 0x418], 0
0000000145bd6a5f 0f84e5000000                   je 0x145bd6b4a
0000000145bd6a65 488b8d20040000                 mov rcx, qword ptr [rbp + 0x420]
0000000145bd6a6c e9db000000                     jmp 0x145bd6b4c
0000000145bd6a71 4d8b4108                       mov r8, qword ptr [r9 + 8]
0000000145bd6a75 c685a706000001                 mov byte ptr [rbp + 0x6a7], 1
0000000145bd6a7c c685a606000001                 mov byte ptr [rbp + 0x6a6], 1
0000000145bd6a83 c685a506000001                 mov byte ptr [rbp + 0x6a5], 1
0000000145bd6a8a c685a406000001                 mov byte ptr [rbp + 0x6a4], 1
0000000145bd6a91 c685a306000001                 mov byte ptr [rbp + 0x6a3], 1
0000000145bd6a98 4889f1                         mov rcx, rsi
0000000145bd6a9b e8a0dfffff                     call 0x145bd4a40
0000000145bd6aa0 90                             nop 
0000000145bd6aa1 e92d050000                     jmp 0x145bd6fd3
0000000145bd6aa6 488b8bc8040000                 mov rcx, qword ptr [rbx + 0x4c8]
0000000145bd6aad 488b83d0040000                 mov rax, qword ptr [rbx + 0x4d0]
0000000145bd6ab4 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145bd6ab8 c685a706000001                 mov byte ptr [rbp + 0x6a7], 1
0000000145bd6abf c685a606000001                 mov byte ptr [rbp + 0x6a6], 1
0000000145bd6ac6 c685a506000001                 mov byte ptr [rbp + 0x6a5], 1
0000000145bd6acd c685a406000001                 mov byte ptr [rbp + 0x6a4], 1
0000000145bd6ad4 c685a306000001                 mov byte ptr [rbp + 0x6a3], 1
0000000145bd6adb ffd0                           call rax
0000000145bd6add 90                             nop 
0000000145bd6ade e9f0040000                     jmp 0x145bd6fd3
0000000145bd6ae3 29f1                           sub ecx, esi
0000000145bd6ae5 81f90f270000                   cmp ecx, 0x270f
0000000145bd6aeb 0f87e2040000                   ja 0x145bd6fd3
0000000145bd6af1 6683bbe004000001               cmp word ptr [rbx + 0x4e0], 1
0000000145bd6af9 7517                           jne 0x145bd6b12
0000000145bd6afb 0fb783e2040000                 movzx eax, word ptr [rbx + 0x4e2]
0000000145bd6b02 8d0441                         lea eax, [rcx + rax*2]
0000000145bd6b05 b9abaaaaaa                     mov ecx, 0xaaaaaaab
0000000145bd6b0a 480fafc8                       imul rcx, rax
0000000145bd6b0e 48c1e921                       shr rcx, 0x21
0000000145bd6b12 66c783e00400000100             mov word ptr [rbx + 0x4e0], 1
0000000145bd6b1b 66898be2040000                 mov word ptr [rbx + 0x4e2], cx
0000000145bd6b22 e9ac040000                     jmp 0x145bd6fd3
