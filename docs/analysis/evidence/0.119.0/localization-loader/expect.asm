0000000145b273b0  55                     push rbp
0000000145b273b1  4156                   push r14
0000000145b273b3  56                     push rsi
0000000145b273b4  57                     push rdi
0000000145b273b5  53                     push rbx
0000000145b273b6  4881eca0000000         sub rsp, 0xa0
0000000145b273bd  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145b273c5  48c74518feffffff       mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
0000000145b273cd  4889ce                 mov rsi, rcx
0000000145b273d0  4c8b7208               mov r14, qword ptr [rdx + 8]
0000000145b273d4  488b7a10               mov rdi, qword ptr [rdx + 0x10]
0000000145b273d8  4c39f7                 cmp rdi, r14
0000000145b273db  731f                   jae 0x145b273fc
0000000145b273dd  488b1a                 mov rbx, qword ptr [rdx]
0000000145b273e0  0fb6043b               movzx eax, byte ptr [rbx + rdi]
0000000145b273e4  48ffc7                 inc rdi
0000000145b273e7  48897a10               mov qword ptr [rdx + 0x10], rdi
0000000145b273eb  4438c0                 cmp al, r8b
0000000145b273ee  7516                   jne 0x145b27406
0000000145b273f0  48c706ffffffff         mov qword ptr [rsi], 0xffffffffffffffff
0000000145b273f7  e974010000             jmp 0x145b27570
0000000145b273fc  48ffc7                 inc rdi
0000000145b273ff  48897a10               mov qword ptr [rdx + 0x10], rdi
0000000145b27403  488b1a                 mov rbx, qword ptr [rdx]
0000000145b27406  410fb6c0               movzx eax, r8b
0000000145b2740a  8945d0                 mov dword ptr [rbp - 0x30], eax
0000000145b2740d  488d45d0               lea rax, [rbp - 0x30]
0000000145b27411  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145b27415  488d05e4314500         lea rax, [rip + 0x4531e4]
0000000145b2741c  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b27420  488d15166b7b01         lea rdx, [rip + 0x17b6b16]
0000000145b27427  488d4db8               lea rcx, [rbp - 0x48]
0000000145b2742b  4c8d45e8               lea r8, [rbp - 0x18]
0000000145b2742f  e8fcfa4300             call 0x145f66f30
0000000145b27434  488b4dc0               mov rcx, qword ptr [rbp - 0x40]
0000000145b27438  488b45c8               mov rax, qword ptr [rbp - 0x38]
0000000145b2743c  48894da8               mov qword ptr [rbp - 0x58], rcx
0000000145b27440  488945b0               mov qword ptr [rbp - 0x50], rax
0000000145b27444  4939fe                 cmp r14, rdi
0000000145b27447  490f42fe               cmovb rdi, r14
0000000145b2744b  4885ff                 test rdi, rdi
0000000145b2744e  48894d10               mov qword ptr [rbp + 0x10], rcx
0000000145b27452  740f                   je 0x145b27463
0000000145b27454  4883ff04               cmp rdi, 4
0000000145b27458  7310                   jae 0x145b2746a
0000000145b2745a  31c0                   xor eax, eax
0000000145b2745c  31c9                   xor ecx, ecx
0000000145b2745e  e98f000000             jmp 0x145b274f2
0000000145b27463  31c9                   xor ecx, ecx
0000000145b27465  e99c000000             jmp 0x145b27506
0000000145b2746a  4889f8                 mov rax, rdi
0000000145b2746d  4883e0fc               and rax, 0xfffffffffffffffc
0000000145b27471  660fefc0               pxor xmm0, xmm0
0000000145b27475  31c9                   xor ecx, ecx
0000000145b27477  660f6f0d41bb8b00       movdqa xmm1, xmmword ptr [rip + 0x8bbb41]
0000000145b2747f  660f6f1d89c96300       movdqa xmm3, xmmword ptr [rip + 0x63c989]
0000000145b27487  660fefd2               pxor xmm2, xmm2
0000000145b2748b  0f1f440000             nop dword ptr [rax + rax]
0000000145b27490  0fb7140b               movzx edx, word ptr [rbx + rcx]
0000000145b27494  660f6ee2               movd xmm4, edx
0000000145b27498  0fb7540b02             movzx edx, word ptr [rbx + rcx + 2]
0000000145b2749d  660f6eea               movd xmm5, edx
0000000145b274a1  660f74e1               pcmpeqb xmm4, xmm1
0000000145b274a5  660f60e4               punpcklbw xmm4, xmm4
0000000145b274a9  f20f70e4d4             pshuflw xmm4, xmm4, 0xd4
0000000145b274ae  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b274b3  660fdbe3               pand xmm4, xmm3
0000000145b274b7  660fd4d4               paddq xmm2, xmm4
0000000145b274bb  660f74e9               pcmpeqb xmm5, xmm1
0000000145b274bf  660f60ed               punpcklbw xmm5, xmm5
0000000145b274c3  f20f70e5d4             pshuflw xmm4, xmm5, 0xd4
0000000145b274c8  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b274cd  660fdbe3               pand xmm4, xmm3
0000000145b274d1  660fd4c4               paddq xmm0, xmm4
0000000145b274d5  4883c104               add rcx, 4
0000000145b274d9  4839c8                 cmp rax, rcx
0000000145b274dc  75b2                   jne 0x145b27490
0000000145b274de  660fd4c2               paddq xmm0, xmm2
0000000145b274e2  660f70c8ee             pshufd xmm1, xmm0, 0xee
0000000145b274e7  660fd4c8               paddq xmm1, xmm0
0000000145b274eb  66480f7ec9             movq rcx, xmm1
0000000145b274f0  eb0f                   jmp 0x145b27501
0000000145b274f2  31d2                   xor edx, edx
0000000145b274f4  803c030a               cmp byte ptr [rbx + rax], 0xa
0000000145b274f8  0f94c2                 sete dl
0000000145b274fb  4801d1                 add rcx, rdx
0000000145b274fe  48ffc0                 inc rax
0000000145b27501  4839c7                 cmp rdi, rax
0000000145b27504  75ec                   jne 0x145b274f2
0000000145b27506  48ffc1                 inc rcx
0000000145b27509  48894d08               mov qword ptr [rbp + 8], rcx
0000000145b2750d  488d4508               lea rax, [rbp + 8]
0000000145b27511  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145b27515  488d05b4234500         lea rax, [rip + 0x4523b4]
0000000145b2751c  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b27520  488d45a8               lea rax, [rbp - 0x58]
0000000145b27524  488945f8               mov qword ptr [rbp - 8], rax
0000000145b27528  488d0591ab4dfa         lea rax, [rip - 0x5b2546f]
0000000145b2752f  48894500               mov qword ptr [rbp], rax
0000000145b27533  488d15f7697b01         lea rdx, [rip + 0x17b69f7]
0000000145b2753a  488d4dd0               lea rcx, [rbp - 0x30]
0000000145b2753e  4c8d45e8               lea r8, [rbp - 0x18]
0000000145b27542  e8e9f94300             call 0x145f66f30
0000000145b27547  90                     nop
0000000145b27548  488b45e0               mov rax, qword ptr [rbp - 0x20]
0000000145b2754c  48894610               mov qword ptr [rsi + 0x10], rax
0000000145b27550  0f1045d0               movups xmm0, xmmword ptr [rbp - 0x30]
0000000145b27554  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145b27557  488b55b8               mov rdx, qword ptr [rbp - 0x48]
0000000145b2755b  4885d2                 test rdx, rdx
0000000145b2755e  7410                   je 0x145b27570
0000000145b27560  41b801000000           mov r8d, 1
0000000145b27566  488b4d10               mov rcx, qword ptr [rbp + 0x10]
0000000145b2756a  e861ac4dfa             call 0x1400021d0
0000000145b2756f  90                     nop
0000000145b27570  4881c4a0000000         add rsp, 0xa0
0000000145b27577  5b                     pop rbx
0000000145b27578  5f                     pop rdi
0000000145b27579  5e                     pop rsi
0000000145b2757a  415e                   pop r14
0000000145b2757c  5d                     pop rbp
0000000145b2757d  c3                     ret
