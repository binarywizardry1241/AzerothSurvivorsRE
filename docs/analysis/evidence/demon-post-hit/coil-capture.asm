145957fd0 4c897de0 mov qword ptr [rbp - 0x20], r15
145957fd4 4c897d20 mov qword ptr [rbp + 0x20], r15
145957fd8 c7451800000000 mov dword ptr [rbp + 0x18], 0
145957fdf c745d400000000 mov dword ptr [rbp - 0x2c], 0
145957fe6 488d45d4 lea rax, [rbp - 0x2c]
145957fea 4889442430 mov qword ptr [rsp + 0x30], rax
145957fef 488d4518 lea rax, [rbp + 0x18]
145957ff3 4889442428 mov qword ptr [rsp + 0x28], rax
145957ff8 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145958001 488d4d40 lea rcx, [rbp + 0x40]
145958005 4c89f2 mov rdx, r14
145958008 41b8851a0000 mov r8d, 0x1a85
14595800e 4c8d4de0 lea r9, [rbp - 0x20]
145958012 e8b967f7ff call 0x1458ce7d0
145958017 90 nop
145958018 410f28fa movaps xmm7, xmm10
14595801c 450f28d7 movaps xmm10, xmm15
145958020 4c8ba330060000 mov r12, qword ptr [rbx + 0x630]
145958027 4c3ba320060000 cmp r12, qword ptr [rbx + 0x620]
14595802e 750d jne 0x14595803d
145958030 488d8b20060000 lea rcx, [rbx + 0x620]
145958037 e8945b2b00 call 0x145c0dbd0
14595803c 90 nop
14595803d f30f108dcc000000 movss xmm1, dword ptr [rbp + 0xcc]
145958045 440f28f9 movaps xmm15, xmm1
145958049 f30f105534 movss xmm2, dword ptr [rbp + 0x34]
14595804e f3440fc2fa01 cmpltss xmm15, xmm2
145958054 410f28c7 movaps xmm0, xmm15
145958058 410f55c4 andnps xmm0, xmm12
14595805c 440f547dc0 andps xmm15, xmmword ptr [rbp - 0x40]
145958061 440f56f8 orps xmm15, xmm0
145958065 0f2ed1 ucomiss xmm2, xmm1
145958068 0f9785cc000000 seta byte ptr [rbp + 0xcc]
14595806f f3450f58fe addss xmm15, xmm14
145958074 488b8328060000 mov rax, qword ptr [rbx + 0x628]
14595807b 4c89e1 mov rcx, r12
14595807e 48c1e105 shl rcx, 5
145958082 0f104540 movups xmm0, xmmword ptr [rbp + 0x40]
145958086 0f104d50 movups xmm1, xmmword ptr [rbp + 0x50]
14595808a 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14595808f 0f110408 movups xmmword ptr [rax + rcx], xmm0
145958093 49ffc4 inc r12
145958096 4c89a330060000 mov qword ptr [rbx + 0x630], r12
14595809d 450f5cc2 subps xmm8, xmm10
1459580a1 450f59c0 mulps xmm8, xmm8
1459580a5 f3410f16c0 movshdup xmm0, xmm8
1459580aa f3410f58c0 addss xmm0, xmm8
1459580af 450f57c0 xorps xmm8, xmm8
1459580b3 f3440f51c0 sqrtss xmm8, xmm0
1459580b8 f3440f5e05a3df4a00 divss xmm8, dword ptr [rip + 0x4adfa3]
1459580c1 f3440f593d9a514500 mulss xmm15, dword ptr [rip + 0x45519a]
