145952fed: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
145952ff4: 4180bfc70a000001 cmp byte ptr [r15 + 0xac7], 1
145952ffc: 0f94c0 sete al
145952fff: 8445f8 test byte ptr [rbp - 8], al
145953002: 0f8418010000 je 0x145953120
145953008: 458b8748050000 mov r8d, dword ptr [r15 + 0x548]
14595300f: 418d4001 lea eax, [r8 + 1]
145953013: 41898748050000 mov dword ptr [r15 + 0x548], eax
14595301a: 498b9760040000 mov rdx, qword ptr [r15 + 0x460]
145953021: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
145953028: 48898568020000 mov qword ptr [rbp + 0x268], rax
14595302f: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
145953036: 48898560020000 mov qword ptr [rbp + 0x260], rax
14595303d: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145953044: 48898558020000 mov qword ptr [rbp + 0x258], rax
14595304b: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
145953052: 48898550020000 mov qword ptr [rbp + 0x250], rax
145953059: 8b85d8010000 mov eax, dword ptr [rbp + 0x1d8]
14595305f: 8885a7020000 mov byte ptr [rbp + 0x2a7], al
145953065: 8b8528020000 mov eax, dword ptr [rbp + 0x228]
14595306b: 8885a6020000 mov byte ptr [rbp + 0x2a6], al
145953071: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
145953078: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14595307f: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145953086: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14595308d: c685a102000000 mov byte ptr [rbp + 0x2a1], 0
145953094: c685a002000000 mov byte ptr [rbp + 0x2a0], 0
14595309b: c6859f02000000 mov byte ptr [rbp + 0x29f], 0
1459530a2: f30f1085cc000000 movss xmm0, dword ptr [rbp + 0xcc]
1459530aa: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1459530b0: c74424280000e040 mov dword ptr [rsp + 0x28], 0x40e00000
1459530b8: 488d8de0010000 lea rcx, [rbp + 0x1e0]
1459530bf: f30f109d1c010000 movss xmm3, dword ptr [rbp + 0x11c]
1459530c7: e8a4ebf6ff call 0x1458c1c70
1459530cc: 90 nop
1459530cd: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
1459530d4: 498bb728060000 mov rsi, qword ptr [r15 + 0x628]
1459530db: 493bb718060000 cmp rsi, qword ptr [r15 + 0x618]
1459530e2: 750d jne 0x1459530f1
1459530e4: 488b8dd0000000 mov rcx, qword ptr [rbp + 0xd0]
1459530eb: e8207d2a00 call 0x145bfae10
1459530f0: 90 nop
1459530f1: 498b8720060000 mov rax, qword ptr [r15 + 0x620]
1459530f8: 4889f1 mov rcx, rsi
1459530fb: 48c1e105 shl rcx, 5
1459530ff: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145953106: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
14595310d: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145953112: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145953116: 48ffc6 inc rsi
145953119: 4989b728060000 mov qword ptr [r15 + 0x628], rsi
