14595c5ce: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
14595c5d5: f3410f5cc3 subss xmm0, xmm11
14595c5da: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
14595c5e1: f3410f5cca subss xmm1, xmm10
14595c5e6: f30f59c9 mulss xmm1, xmm1
14595c5ea: f30f59c0 mulss xmm0, xmm0
14595c5ee: f30f58c1 addss xmm0, xmm1
14595c5f2: 0f57f6 xorps xmm6, xmm6
14595c5f5: f30f51f0 sqrtss xmm6, xmm0
14595c5f9: f30f5eb5e0000000 divss xmm6, dword ptr [rbp + 0xe0]
14595c601: f30f5f35f30a4700 maxss xmm6, dword ptr [rip + 0x470af3]
14595c609: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595c60f: ffc7 inc edi
14595c611: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595c617: f30f10be340a0000 movss xmm7, dword ptr [rsi + 0xa34]
14595c61f: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
14595c626: 4883c110 add rcx, 0x10
14595c62a: 410f28ca movaps xmm1, xmm10
14595c62e: 410f28d3 movaps xmm2, xmm11
14595c632: e84977f7ff call 0x1458d3d80
14595c637: 440f28d8 movaps xmm11, xmm0
14595c63b: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595c642: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595c649: 750c jne 0x14595c657
14595c64b: 488d8e88050000 lea rcx, [rsi + 0x588]
14595c652: e8d9e62900 call 0x145bfad30
14595c657: f30f58f7 addss xmm6, xmm7
14595c65b: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595c662: 4c89f9 mov rcx, r15
14595c665: 48c1e107 shl rcx, 7
14595c669: 48c7040800000000 mov qword ptr [rax + rcx], 0
14595c671: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
14595c679: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595c680: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14595c685: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14595c68e: 48ba0000000000002040 movabs rdx, 0x4020000000000000
14595c698: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
14595c69d: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
14595c6a1: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
14595c6a7: f3440f115c0848 movss dword ptr [rax + rcx + 0x48], xmm11
14595c6ae: c744084c00000000 mov dword ptr [rax + rcx + 0x4c], 0
14595c6b6: f30f117c0850 movss dword ptr [rax + rcx + 0x50], xmm7
14595c6bc: f30f11740854 movss dword ptr [rax + rcx + 0x54], xmm6
14595c6c2: 48c744085800000000 mov qword ptr [rax + rcx + 0x58], 0
14595c6cb: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
14595c6d4: f3440f11740860 movss dword ptr [rax + rcx + 0x60], xmm14
14595c6db: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
14595c6e3: 49ffc7 inc r15
14595c6e6: 0f57c0 xorps xmm0, xmm0
14595c6e9: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
14595c6ee: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14595c6f7: 4c89be98050000 mov qword ptr [rsi + 0x598], r15
