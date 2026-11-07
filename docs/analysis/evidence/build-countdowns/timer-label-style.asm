14025b6d5 4d89fe mov r14, r15
14025b6d8 48c7850802000000000000 mov qword ptr [rbp + 0x208], 0
14025b6e3 48c7851002000001000000 mov qword ptr [rbp + 0x210], 1
14025b6ee 4c8d85b8020000 lea r8, [rbp + 0x2b8]
14025b6f5 410f11b860ffffff movups xmmword ptr [r8 - 0xa0], xmm7
14025b6fd 48c7852802000004000000 mov qword ptr [rbp + 0x228], 4
14025b708 48c7853002000000000000 mov qword ptr [rbp + 0x230], 0
14025b713 889538020000 mov byte ptr [rbp + 0x238], dl
14025b719 8b95b0040000 mov edx, dword ptr [rbp + 0x4b0]
14025b71f 448b85b3040000 mov r8d, dword ptr [rbp + 0x4b3]
14025b726 4489463c mov dword ptr [rsi + 0x3c], r8d
14025b72a 895639 mov dword ptr [rsi + 0x39], edx
14025b72d 48898540020000 mov qword ptr [rbp + 0x240], rax
14025b734 48898d48020000 mov qword ptr [rbp + 0x248], rcx
14025b73b c7855002000000005041 mov dword ptr [rbp + 0x250], 0x41500000
14025b745 66c785540200009001 mov word ptr [rbp + 0x254], 0x190
14025b74e c6855602000001 mov byte ptr [rbp + 0x256], 1
14025b755 0f10054cb4ba05 movups xmm0, xmmword ptr [rip + 0x5bab44c]
14025b75c 0f114658 movups xmmword ptr [rsi + 0x58], xmm0
14025b760 c746680000803f mov dword ptr [rsi + 0x68], 0x3f800000
14025b767 f30f6f05d932b605 movdqu xmm0, xmmword ptr [rip + 0x5b632d9]
14025b76f f30f7f466c movdqu xmmword ptr [rsi + 0x6c], xmm0
14025b774 8b05de32b605 mov eax, dword ptr [rip + 0x5b632de]
14025b77a 89467c mov dword ptr [rsi + 0x7c], eax
