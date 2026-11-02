0000000145b59e40  55                     push rbp
0000000145b59e41  56                     push rsi
0000000145b59e42  4883ec58               sub rsp, 0x58
0000000145b59e46  488d6c2450             lea rbp, [rsp + 0x50]
0000000145b59e4b  48c74500feffffff       mov qword ptr [rbp], 0xfffffffffffffffe
0000000145b59e53  488b01                 mov rax, qword ptr [rcx]
0000000145b59e56  488b30                 mov rsi, qword ptr [rax]
0000000145b59e59  48c70000000000         mov qword ptr [rax], 0
0000000145b59e60  4885f6                 test rsi, rsi
0000000145b59e63  7477                   je 0x145b59edc
0000000145b59e65  e896834afa             call 0x140002200
0000000145b59e6a  b9a0020000             mov ecx, 0x2a0
0000000145b59e6f  ba08000000             mov edx, 8
0000000145b59e74  e847834afa             call 0x1400021c0
0000000145b59e79  4885c0                 test rax, rax
0000000145b59e7c  746c                   je 0x145b59eea
0000000145b59e7e  48c745e80e000000       mov qword ptr [rbp - 0x18], 0xe
0000000145b59e86  488945f0               mov qword ptr [rbp - 0x10], rax
0000000145b59e8a  488d4df8               lea rcx, [rbp - 8]
0000000145b59e8e  48c745f800000000       mov qword ptr [rbp - 8], 0
0000000145b59e96  488945e0               mov qword ptr [rbp - 0x20], rax
0000000145b59e9a  48894dd0               mov qword ptr [rbp - 0x30], rcx
0000000145b59e9e  48c745d800000000       mov qword ptr [rbp - 0x28], 0
0000000145b59ea6  488d0da3d4a701         lea rcx, [rip + 0x1a7d4a3]
0000000145b59ead  488d15acd7a701         lea rdx, [rip + 0x1a7d7ac]
0000000145b59eb4  4c8d45d0               lea r8, [rbp - 0x30]
0000000145b59eb8  e8439f0b00             call 0x145c13e00
0000000145b59ebd  90                     nop
0000000145b59ebe  0f1045e8               movups xmm0, xmmword ptr [rbp - 0x18]
0000000145b59ec2  0f2945d0               movaps xmmword ptr [rbp - 0x30], xmm0
0000000145b59ec6  488b45f8               mov rax, qword ptr [rbp - 8]
0000000145b59eca  488945e0               mov qword ptr [rbp - 0x20], rax
0000000145b59ece  48894610               mov qword ptr [rsi + 0x10], rax
0000000145b59ed2  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145b59ed5  4883c458               add rsp, 0x58
0000000145b59ed9  5e                     pop rsi
0000000145b59eda  5d                     pop rbp
0000000145b59edb  c3                     ret
0000000145b59edc  488d0d6d8ca801         lea rcx, [rip + 0x1a88c6d]
0000000145b59ee3  e8c8155e00             call 0x14613b4b0
0000000145b59ee8  0f0b                   ud2
0000000145b59eea  b908000000             mov ecx, 8
0000000145b59eef  baa0020000             mov edx, 0x2a0
0000000145b59ef4  e8c2125e00             call 0x14613b1bb
0000000145b59ef9  0f0b                   ud2
