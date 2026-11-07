; Current0.117.0 [0x14024a029,0x14024a167) SHA-256 fad6c8b4881805633ca96e83f0a1f177103f352216998e1f77dac048713b2904
14024a029  488bb5e8020000           mov rsi, qword ptr [rbp + 0x2e8]
14024a030  488b9d08030000           mov rbx, qword ptr [rbp + 0x308]
14024a037  0fb67e38                 movzx edi, byte ptr [rsi + 0x38]
14024a03b  4088bda7030000           mov byte ptr [rbp + 0x3a7], dil
14024a042  448a7639                 mov r14b, byte ptr [rsi + 0x39]
14024a046  488d4da8                 lea rcx, [rbp - 0x58]
14024a04a  4889da                   mov rdx, rbx
14024a04d  4189f8                   mov r8d, edi
14024a050  4589f1                   mov r9d, r14d
14024a053  e848178805               call 0x145acb7a0
14024a058  488d8d50020000           lea rcx, [rbp + 0x250]
14024a05f  4489f2                   mov edx, r14d
14024a062  4189f8                   mov r8d, edi
14024a065  e8a6b88605               call 0x145ab5910
14024a06a  488d057f02f505           lea rax, [rip + 0x5f5027f]
14024a071  48898590000000           mov qword ptr [rbp + 0x90], rax
14024a078  488d057d02f505           lea rax, [rip + 0x5f5027d]
14024a07f  48898598000000           mov qword ptr [rbp + 0x98], rax
14024a086  488d85a7030000           lea rax, [rbp + 0x3a7]
14024a08d  488985a0000000           mov qword ptr [rbp + 0xa0], rax
14024a094  48899da8000000           mov qword ptr [rbp + 0xa8], rbx
14024a09b  488d8d80030000           lea rcx, [rbp + 0x380]
14024a0a2  488dbd90000000           lea rdi, [rbp + 0x90]
14024a0a9  4889fa                   mov rdx, rdi
14024a0ac  e80f7ee9ff               call 0x1400e1ec0
14024a0b1  0fb695a7030000           movzx edx, byte ptr [rbp + 0x3a7]
14024a0b8  488d8d38020000           lea rcx, [rbp + 0x238]
14024a0bf  e8bcec8605               call 0x145ab8d80
14024a0c4  90                       nop
14024a0c5  4889b5a8010000           mov qword ptr [rbp + 0x1a8], rsi
14024a0cc  48899db0010000           mov qword ptr [rbp + 0x1b0], rbx
14024a0d3  488d8dc0000000           lea rcx, [rbp + 0xc0]
14024a0da  488d55a8                 lea rdx, [rbp - 0x58]
14024a0de  41b8e8000000             mov r8d, 0xe8
14024a0e4  e8f29bd405               call 0x145f93cdb
14024a0e9  0f108550020000           movups xmm0, xmmword ptr [rbp + 0x250]
14024a0f0  0f108d60020000           movups xmm1, xmmword ptr [rbp + 0x260]
14024a0f7  0f109570020000           movups xmm2, xmmword ptr [rbp + 0x270]
14024a0fe  0f109d80020000           movups xmm3, xmmword ptr [rbp + 0x280]
14024a105  0f1185b8010000           movups xmmword ptr [rbp + 0x1b8], xmm0
14024a10c  0f118dc8010000           movups xmmword ptr [rbp + 0x1c8], xmm1
14024a113  0f1195d8010000           movups xmmword ptr [rbp + 0x1d8], xmm2
14024a11a  0f119de8010000           movups xmmword ptr [rbp + 0x1e8], xmm3
14024a121  0f10858c020000           movups xmm0, xmmword ptr [rbp + 0x28c]
14024a128  0f1185f4010000           movups xmmword ptr [rbp + 0x1f4], xmm0
14024a12f  0f108580030000           movups xmm0, xmmword ptr [rbp + 0x380]
14024a136  0f298590000000           movaps xmmword ptr [rbp + 0x90], xmm0
14024a13d  488b8590030000           mov rax, qword ptr [rbp + 0x390]
14024a144  488985a0000000           mov qword ptr [rbp + 0xa0], rax
14024a14b  0f108538020000           movups xmm0, xmmword ptr [rbp + 0x238]
14024a152  0f1185a8000000           movups xmmword ptr [rbp + 0xa8], xmm0
14024a159  488b8548020000           mov rax, qword ptr [rbp + 0x248]
14024a160  488985b8000000           mov qword ptr [rbp + 0xb8], rax
; Current0.117.0 [0x14024a19f,0x14024a232) SHA-256 b232254c34e097e717ec23d299f3f6850dd0e3e4dbaf2f03367891f7cd097e42
14024a19f  488d85c8020000           lea rax, [rbp + 0x2c8]
14024a1a6  488d8de8020000           lea rcx, [rbp + 0x2e8]
14024a1ad  488d9508030000           lea rdx, [rbp + 0x308]
14024a1b4  4c8d8528030000           lea r8, [rbp + 0x328]
14024a1bb  4c8b4b08                 mov r9, qword ptr [rbx + 8]
14024a1bf  4c8d150afc1100           lea r10, [rip + 0x11fc0a]
14024a1c6  4f891431                 mov qword ptr [r9 + r14], r10
14024a1ca  4f89643108               mov qword ptr [r9 + r14 + 8], r12
14024a1cf  4983c610                 add r14, 0x10
14024a1d3  4c897310                 mov qword ptr [rbx + 0x10], r14
14024a1d7  4c8b9598030000           mov r10, qword ptr [rbp + 0x398]
14024a1de  4d8b4a20                 mov r9, qword ptr [r10 + 0x20]
14024a1e2  4c898d78020000           mov qword ptr [rbp + 0x278], r9
14024a1e9  410f104210               movups xmm0, xmmword ptr [r10 + 0x10]
14024a1ee  0f118568020000           movups xmmword ptr [rbp + 0x268], xmm0
14024a1f5  4c89a550020000           mov qword ptr [rbp + 0x250], r12
14024a1fc  0f11b558020000           movups xmmword ptr [rbp + 0x258], xmm6
14024a203  4c8d8d10020000           lea r9, [rbp + 0x210]
14024a20a  4c894da8                 mov qword ptr [rbp - 0x58], r9
14024a20e  488945b0                 mov qword ptr [rbp - 0x50], rax
14024a212  48897db8                 mov qword ptr [rbp - 0x48], rdi
14024a216  4c8945c0                 mov qword ptr [rbp - 0x40], r8
14024a21a  48894dc8                 mov qword ptr [rbp - 0x38], rcx
14024a21e  488955d0                 mov qword ptr [rbp - 0x30], rdx
14024a222  488d8d50020000           lea rcx, [rbp + 0x250]
14024a229  488d55a8                 lea rdx, [rbp - 0x58]
14024a22d  e85e350d00               call 0x14031d790
