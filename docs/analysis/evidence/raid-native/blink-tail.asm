14595c0fd: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
14595c104: 4983c610 add r14, 0x10
14595c108: 488b9690020000 mov rdx, qword ptr [rsi + 0x290]
14595c10f: 4c8b8698020000 mov r8, qword ptr [rsi + 0x298]
14595c116: 488d8d10010000 lea rcx, [rbp + 0x110]
14595c11d: 4c8d4d30 lea r9, [rbp + 0x30]
14595c121: e84a20ffff call 0x14594e170
14595c126: f20f10bd10010000 movsd xmm7, qword ptr [rbp + 0x110]
14595c12e: f3440f16c7 movshdup xmm8, xmm7
14595c133: 4c89f1 mov rcx, r14
14595c136: 0f28cf movaps xmm1, xmm7
14595c139: 410f28d0 movaps xmm2, xmm8
14595c13d: e84eaef7ff call 0x1458d6f90
14595c142: 440f28c8 movaps xmm9, xmm0
14595c146: a801 test al, 1
14595c148: 7509 jne 0x14595c153
14595c14a: f3440f108d18010000 movss xmm9, dword ptr [rbp + 0x118]
14595c153: 488d9e18060000 lea rbx, [rsi + 0x618]
14595c15a: 8b85b0000000 mov eax, dword ptr [rbp + 0xb0]
14595c160: 89856c010000 mov dword ptr [rbp + 0x16c], eax
14595c166: 488b85a8000000 mov rax, qword ptr [rbp + 0xa8]
14595c16d: 48898564010000 mov qword ptr [rbp + 0x164], rax
14595c174: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
14595c17e: c745e400000000 mov dword ptr [rbp - 0x1c], 0
14595c185: 488d7de4 lea rdi, [rbp - 0x1c]
14595c189: 48897c2430 mov qword ptr [rsp + 0x30], rdi
14595c18e: 4c8dad60010000 lea r13, [rbp + 0x160]
14595c195: 4c896c2428 mov qword ptr [rsp + 0x28], r13
14595c19a: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14595c1a3: 4c8da510010000 lea r12, [rbp + 0x110]
14595c1aa: 41b908000000 mov r9d, 8
14595c1b0: 4c89e1 mov rcx, r12
14595c1b3: 4c8bbd80010000 mov r15, qword ptr [rbp + 0x180]
14595c1ba: 4c89fa mov rdx, r15
14595c1bd: 448bb550010000 mov r14d, dword ptr [rbp + 0x150]
14595c1c4: 4589f0 mov r8d, r14d
14595c1c7: e8a415f7ff call 0x1458cd770
14595c1cc: 4889d9 mov rcx, rbx
14595c1cf: 4c89e2 mov rdx, r12
14595c1d2: e899a883fb call 0x141196a70
14595c1d7: f20f11bd64010000 movsd qword ptr [rbp + 0x164], xmm7
14595c1df: f3440f118d6c010000 movss dword ptr [rbp + 0x16c], xmm9
14595c1e8: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
14595c1f2: 48897c2430 mov qword ptr [rsp + 0x30], rdi
14595c1f7: 4c896c2428 mov qword ptr [rsp + 0x28], r13
14595c1fc: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14595c205: 41b908000000 mov r9d, 8
14595c20b: 4589f0 mov r8d, r14d
14595c20e: 4c89e1 mov rcx, r12
14595c211: 4c89fa mov rdx, r15
14595c214: e85715f7ff call 0x1458cd770
14595c219: 4889d9 mov rcx, rbx
14595c21c: 4c89e2 mov rdx, r12
14595c21f: e84ca883fb call 0x141196a70
14595c224: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595c22b: 483995f0000000 cmp qword ptr [rbp + 0xf0], rdx
14595c232: 0f83370a0000 jae 0x14595cc6f
14595c238: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
14595c23f: 488b9d90000000 mov rbx, qword ptr [rbp + 0x90]
14595c246: 0f13bc1874010000 movlps qword ptr [rax + rbx + 0x174], xmm7
14595c24e: f3440f118c187c010000 movss dword ptr [rax + rbx + 0x17c], xmm9
14595c258: 0f13bc1880010000 movlps qword ptr [rax + rbx + 0x180], xmm7
14595c260: f3440f118c1888010000 movss dword ptr [rax + rbx + 0x188], xmm9
14595c26a: 0f57c0 xorps xmm0, xmm0
14595c26d: f3410f10c7 movss xmm0, xmm15
14595c272: 0f1384188c010000 movlps qword ptr [rax + rbx + 0x18c], xmm0
14595c27a: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
14595c281: f3410f5cc0 subss xmm0, xmm8
14595c286: 0f288dd0000000 movaps xmm1, xmmword ptr [rbp + 0xd0]
14595c28d: f30f5ccf subss xmm1, xmm7
14595c291: e88dde2900 call 0x145bfa123
14595c296: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14595c29c: f30f101500104400 movss xmm2, dword ptr [rip + 0x441000]
14595c2a4: 4889f1 mov rcx, rsi
14595c2a7: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595c2ae: 41b901000000 mov r9d, 1
14595c2b4: e867b0ffff call 0x145957320
14595c2b9: e9bab6ffff jmp 0x145957978
