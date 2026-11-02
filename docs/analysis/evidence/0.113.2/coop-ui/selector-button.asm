14003b910 push rbp
14003b911 push r15
14003b913 push r14
14003b915 push r13
14003b917 push r12
14003b919 push rsi
14003b91a push rdi
14003b91b push rbx
14003b91c sub rsp, 0x5a8
14003b923 lea rbp, [rsp + 0x80]
14003b92b movaps xmmword ptr [rbp + 0x510], xmm6
14003b932 mov qword ptr [rbp + 0x508], 0xfffffffffffffffe
14003b93d mov rdi, r9
14003b940 mov r14, r8
14003b943 mov rsi, rdx
14003b946 mov rbx, rcx
14003b949 lea rax, [rbp + 0x474]
14003b950 cmp byte ptr [rbp + 0x598], 0
14003b957 je 0x14003b99d
14003b959 movups xmm0, xmmword ptr [rip + 0x5e8b0ec]
14003b960 movaps xmmword ptr [rbp + 0x4e0], xmm0
14003b967 mov dword ptr [rbp + 0x4f0], 0x3f800000
14003b971 movaps xmmword ptr [rbp + 0x4c0], xmm0
14003b978 mov dword ptr [rbp + 0x4d0], 0x3f800000
14003b982 movaps xmmword ptr [rbp + 0x460], xmm0
14003b989 mov dword ptr [rbp + 0x470], 0x3f800000
14003b993 movss xmm0, dword ptr [rip + 0x5e66755]
14003b99b jmp 0x14003b9e6
14003b99d movups xmm0, xmmword ptr [rip + 0x5e8a5a0]
14003b9a4 movaps xmmword ptr [rbp + 0x4e0], xmm0
14003b9ab mov dword ptr [rbp + 0x4f0], 0x3f800000
14003b9b5 movups xmm1, xmmword ptr [rip + 0x5e8a574]
14003b9bc movaps xmmword ptr [rbp + 0x4c0], xmm1
14003b9c3 mov dword ptr [rbp + 0x4d0], 0x3f800000
14003b9cd movaps xmmword ptr [rbp + 0x460], xmm0
14003b9d4 mov dword ptr [rbp + 0x470], 0x3f800000
14003b9de movss xmm0, dword ptr [rip + 0x5e6669e]
14003b9e6 movups xmm1, xmmword ptr [rip + 0x5e8b05f]
14003b9ed movups xmmword ptr [rax], xmm1
14003b9f0 mov dword ptr [rax + 0x10], 0x3f800000
14003b9f7 mov word ptr [rbp + 0x344], 0
14003ba00 mov byte ptr [rbp + 0x334], 1
14003ba07 xorps xmm1, xmm1
14003ba0a movups xmmword ptr [rbp + 0x248], xmm1
14003ba11 movups xmmword ptr [rbp + 0x258], xmm1
14003ba18 movups xmmword ptr [rbp + 0x268], xmm1
14003ba1f movabs rax, 0x4210000000000001
14003ba29 mov qword ptr [rbp + 0x278], rax
14003ba30 mov qword ptr [rbp + 0x240], 0
14003ba3b movaps xmmword ptr [rbp + 0x280], xmm1
14003ba42 mov qword ptr [rbp + 0x290], 0
14003ba4d mov dword ptr [rbp + 0x358], 0
14003ba57 mov word ptr [rbp + 0x35c], 0x500
14003ba60 movups xmm1, xmmword ptr [rip + 0x5e8adf1]
14003ba67 movups xmmword ptr [rbp + 0x298], xmm1
14003ba6e movups xmm1, xmmword ptr [rip + 0x5e8adf3]
14003ba75 movups xmmword ptr [rbp + 0x2a8], xmm1
14003ba7c movaps xmm1, xmmword ptr [rip + 0x5e6667d]
14003ba83 movups xmmword ptr [rbp + 0x2b8], xmm1
14003ba8a movaps xmm1, xmmword ptr [rip + 0x5e6662f]
14003ba91 movups xmmword ptr [rbp + 0x2c8], xmm1
14003ba98 mov dword ptr [rbp + 0x2d8], 1
14003baa2 movss dword ptr [rbp + 0x2dc], xmm0
14003baaa mov dword ptr [rbp + 0x2e0], 1
14003bab4 movss dword ptr [rbp + 0x2e4], xmm0
14003babc mov dword ptr [rbp + 0x2e8], 1
14003bac6 movss dword ptr [rbp + 0x2ec], xmm0
14003bace mov dword ptr [rbp + 0x2f0], 1
14003bad8 movss dword ptr [rbp + 0x2f4], xmm0
14003bae0 movaps xmm0, xmmword ptr [rip + 0x5e66589]
14003bae7 movups xmmword ptr [rbp + 0x2f8], xmm0
14003baee movups xmmword ptr [rbp + 0x308], xmm0
14003baf5 mov byte ptr [rbp + 0x356], 0
14003bafc mov dword ptr [rbp + 0x352], 0
14003bb06 mov qword ptr [rbp + 0x338], 0
14003bb11 mov dword ptr [rbp + 0x340], 0x3f800000
14003bb1b movaps xmm0, xmmword ptr [rip + 0x5e6650e]
14003bb22 movups xmmword ptr [rbp + 0x318], xmm0
14003bb29 mov dword ptr [rbp + 0x328], 1
14003bb33 mov qword ptr [rbp + 0x32c], 0
14003bb3e mov byte ptr [rbp + 0x357], 0
14003bb45 movups xmm0, xmmword ptr [rip + 0x5e8ac54]
14003bb4c movaps xmmword ptr [rbp + 0x1e0], xmm0
14003bb53 mov qword ptr [rbp + 0x1f0], 0
14003bb5e movups xmm0, xmmword ptr [rip + 0x5e8ac53]
14003bb65 movups xmmword ptr [rbp + 0x1f8], xmm0
14003bb6c mov qword ptr [rbp + 0x208], 0
14003bb77 movups xmm0, xmmword ptr [rip + 0x5e8ac52]
14003bb7e movaps xmmword ptr [rbp + 0x210], xmm0
14003bb85 mov qword ptr [rbp + 0x220], 0
14003bb90 movups xmm0, xmmword ptr [rip + 0x5e8ac51]
14003bb97 movups xmmword ptr [rbp + 0x228], xmm0
14003bb9e mov qword ptr [rbp + 0x238], 0
14003bba9 mov word ptr [rbp + 0x34a], 0
14003bbb2 mov dword ptr [rbp + 0x346], 0x10000
14003bbbc mov word ptr [rbp + 0x350], 0
14003bbc5 mov dword ptr [rbp + 0x34c], 0x10000
14003bbcf mov eax, dword ptr [rbp + 0x4f0]
14003bbd5 mov dword ptr [rbp + 0x420], eax
14003bbdb movaps xmm0, xmmword ptr [rbp + 0x4e0]
14003bbe2 movaps xmmword ptr [rbp + 0x410], xmm0
14003bbe9 movups xmmword ptr [rbp + 0x424], xmm0
14003bbf0 mov dword ptr [rbp + 0x434], eax
14003bbf6 movups xmmword ptr [rbp + 0x438], xmm0
14003bbfd mov dword ptr [rbp + 0x448], eax
14003bc03 movups xmmword ptr [rbp + 0x44c], xmm0
14003bc0a mov dword ptr [rbp + 0x45c], eax
14003bc10 call 0x140002200
14003bc15 mov ecx, 0x40
14003bc1a mov edx, 4
14003bc1f call 0x1400021c0
14003bc24 test rax, rax
14003bc27 je 0x14003bfa1
14003bc2d mov qword ptr [rbp + 0x500], rax
14003bc34 movaps xmm0, xmmword ptr [rip + 0x5e664d5]
14003bc3b movups xmmword ptr [rbp + 0x4b0], xmm0
14003bc42 mov dword ptr [rbp + 0x4ac], 0
14003bc4c lea rcx, [rbp + 0x490]
14003bc53 lea rdx, [rbp + 0x4ac]
14003bc5a call 0x144bf4410
14003bc5f nop
14003bc60 movaps xmm6, xmmword ptr [rbp + 0x490]
14003bc67 movaps xmm0, xmmword ptr [rip + 0x5e664b2]
14003bc6e movups xmmword ptr [rbp + 0x4b0], xmm0
14003bc75 mov dword ptr [rbp + 0x4ac], 0
14003bc7f lea rcx, [rbp + 0x490]
14003bc86 lea rdx, [rbp + 0x4ac]
14003bc8d call 0x144bf4410
14003bc92 nop
14003bc93 movaps xmm0, xmmword ptr [rbp + 0x490]
14003bc9a mov r13, qword ptr [rbp + 0x500]
14003bca1 mov dword ptr [r13], 0
14003bca9 mov dword ptr [r13 + 8], 1
14003bcb1 movups xmmword ptr [r13 + 0xc], xmm6
14003bcb6 mov qword ptr [r13 + 0x1c], 0x3f000000
14003bcbe mov dword ptr [r13 + 0x28], 1
14003bcc6 movups xmmword ptr [r13 + 0x2c], xmm0
14003bccb mov dword ptr [r13 + 0x3c], 0x3f000000
14003bcd3 call 0x140002200
14003bcd8 mov ecx, 0x48
14003bcdd mov edx, 8
14003bce2 call 0x1400021c0
14003bce7 test rax, rax
14003bcea je 0x14003bf8f
14003bcf0 mov r12, rax
14003bcf3 mov r15, qword ptr [rbp + 0x590]
14003bcfa mov qword ptr [rax + 8], 2
14003bd02 mov qword ptr [rax + 0x10], r13
14003bd06 mov qword ptr [rax + 0x18], 2
14003bd0e mov dword ptr [rax + 0x20], 0x40490fdb
14003bd15 mov byte ptr [rax + 0x24], 0
14003bd19 movabs rax, 0x8000000000000000
14003bd23 mov qword ptr [r12], rax
14003bd27 movups xmm0, xmmword ptr [r14]
14003bd2b movups xmmword ptr [rbp + 0x178], xmm0
14003bd32 movaps xmm0, xmmword ptr [rbp + 0x460]
14003bd39 movaps xmm1, xmmword ptr [rbp + 0x470]
14003bd40 movups xmmword ptr [rbp + 0x188], xmm0
14003bd47 movups xmmword ptr [rbp + 0x198], xmm1
14003bd4e mov rax, qword ptr [rbp + 0x480]
14003bd55 mov qword ptr [rbp + 0x1a8], rax
14003bd5c lea r14, [rbp - 0x58]
14003bd60 lea rdx, [rbp + 0x1e0]
14003bd67 mov r8d, 0x180
14003bd6d mov rcx, r14
14003bd70 call 0x145cf998b
14003bd75 movaps xmm0, xmmword ptr [rbp + 0x410]
14003bd7c movaps xmm1, xmmword ptr [rbp + 0x420]
14003bd83 movaps xmm2, xmmword ptr [rbp + 0x430]
14003bd8a movaps xmm3, xmmword ptr [rbp + 0x440]
14003bd91 movups xmmword ptr [rbp + 0x128], xmm0
14003bd98 movups xmmword ptr [rbp + 0x138], xmm1
14003bd9f movups xmmword ptr [rbp + 0x148], xmm2
14003bda6 movups xmmword ptr [rbp + 0x158], xmm3
14003bdad movaps xmm0, xmmword ptr [rbp + 0x450]
14003bdb4 movups xmmword ptr [rbp + 0x168], xmm0
14003bdbb mov r13, qword ptr [rbx]
14003bdbe add rbx, 8
14003bdc2 lea rcx, [rbp + 0x1e8]
14003bdc9 mov r8d, 0x208
14003bdcf mov rdx, r14
14003bdd2 call 0x145cf998b
14003bdd7 mov dword ptr [rbp + 0x3f0], 0x3f800000
14003bde1 mov byte ptr [rbp + 0x3f4], 2
14003bde8 mov qword ptr [rbp + 0x3f8], 1
14003bdf3 mov qword ptr [rbp + 0x400], r12
14003bdfa mov qword ptr [rbp + 0x408], 1
14003be05 mov qword ptr [rbp + 0x1e0], r13
14003be0c lea r9, [rip + 0x5eb67b5]
14003be13 lea rcx, [rbp + 0x1b0]
14003be1a lea r8, [rbp + 0x1e0]
14003be21 mov rdx, rbx
14003be24 call 0x14026b5a0
14003be29 test r15, r15
14003be2c jns 0x14003be3e
14003be2e xor r14d, r14d
14003be31 mov rcx, r14
14003be34 mov rdx, r15
14003be37 call 0x145e9bd8b
14003be3c ud2
14003be3e je 0x14003be8b
14003be40 call 0x140002200
14003be45 mov r14d, 1
14003be4b mov edx, 1
14003be50 mov rcx, r15
14003be53 call 0x1400021c0
14003be58 test rax, rax
14003be5b je 0x14003be31
14003be5d mov rbx, rax
14003be60 mov rcx, rax
14003be63 mov rdx, rdi
14003be66 mov r8, r15
14003be69 call 0x145cf998b
14003be6e cmp byte ptr [rsi], 1
14003be71 jne 0x14003be95
14003be73 mov eax, dword ptr [rsi + 1]
14003be76 mov ecx, dword ptr [rsi + 4]
14003be79 mov dword ptr [rbp - 0x55], ecx
14003be7c mov dword ptr [rbp - 0x58], eax
14003be7f mov rax, qword ptr [rsi + 8]
14003be83 movzx ecx, byte ptr [rsi + 0x10]
14003be87 mov dl, 1
14003be89 jmp 0x14003bea5
14003be8b mov ebx, 1
14003be90 cmp byte ptr [rsi], 1
14003be93 je 0x14003be73
14003be95 mov rax, qword ptr [rsi + 8]
14003be99 lock inc qword ptr [rax]
14003be9d jle 0x14003bfb1
14003bea3 xor edx, edx
14003bea5 mov qword ptr [rbp + 0x1e0], r15
14003beac mov qword ptr [rbp + 0x1e8], rbx
14003beb3 mov qword ptr [rbp + 0x1f0], r15
14003beba mov qword ptr [rbp + 0x1f8], 0
14003bec5 mov qword ptr [rbp + 0x200], 4
14003bed0 mov qword ptr [rbp + 0x208], 0
14003bedb mov byte ptr [rbp + 0x210], dl
14003bee1 mov edx, dword ptr [rbp - 0x58]
14003bee4 mov r8d, dword ptr [rbp - 0x55]
14003bee8 mov dword ptr [rbp + 0x211], edx
14003beee mov dword ptr [rbp + 0x214], r8d
14003bef5 mov qword ptr [rbp + 0x218], rax
14003befc mov qword ptr [rbp + 0x220], rcx
14003bf03 mov dword ptr [rbp + 0x228], 0x41700000
14003bf0d mov word ptr [rbp + 0x22c], 0x190
14003bf16 mov byte ptr [rbp + 0x22e], 1
14003bf1d movaps xmm0, xmmword ptr [rbp + 0x4c0]
14003bf24 movups xmmword ptr [rbp + 0x230], xmm0
14003bf2b mov eax, dword ptr [rbp + 0x4d0]
14003bf31 mov dword ptr [rbp + 0x240], eax
14003bf37 mov eax, dword ptr [rip + 0x5e9399b]
14003bf3d mov dword ptr [rbp + 0x254], eax
14003bf43 movups xmm0, xmmword ptr [rip + 0x5e9397e]
14003bf4a movups xmmword ptr [rbp + 0x244], xmm0
14003bf51 movsd xmm0, qword ptr [rip + 0x5e66177]
14003bf59 movsd qword ptr [rbp + 0x258], xmm0
14003bf61 lea rcx, [rbp + 0x1b0]
14003bf68 lea rdx, [rbp + 0x1e0]
14003bf6f call 0x14027ff50
14003bf74 movaps xmm6, xmmword ptr [rbp + 0x510]
14003bf7b add rsp, 0x5a8
14003bf82 pop rbx
14003bf83 pop rdi
14003bf84 pop rsi
14003bf85 pop r12
14003bf87 pop r13
14003bf89 pop r14
14003bf8b pop r15
14003bf8d pop rbp
14003bf8e ret
14003bf8f mov ecx, 8
14003bf94 mov edx, 0x48
14003bf99 call 0x145e9bd71
14003bf9e nop
14003bf9f jmp 0x14003bfb1
14003bfa1 mov ecx, 4
14003bfa6 mov edx, 0x40
14003bfab call 0x145e9bd71
14003bfb0 nop
14003bfb1 ud2
