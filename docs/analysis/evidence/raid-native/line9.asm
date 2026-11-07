14595a4d0: 8b19 mov ebx, dword ptr [rcx]
14595a4d2: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14595a4d7: f20f107904 movsd xmm7, qword ptr [rcx + 4]
14595a4dc: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
14595a4e2: f3440f108578010000 movss xmm8, dword ptr [rbp + 0x178]
14595a4eb: f3440f11442420 movss dword ptr [rsp + 0x20], xmm8
14595a4f2: 4889f1 mov rcx, rsi
14595a4f5: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595a4fc: 0f28d6 movaps xmm2, xmm6
14595a4ff: 41b901000000 mov r9d, 1
14595a505: e816ceffff call 0x145957320
14595a50a: 4889f1 mov rcx, rsi
14595a50d: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595a514: 4889fa mov rdx, rdi
14595a517: 4189d8 mov r8d, ebx
14595a51a: 0f28de movaps xmm3, xmm6
14595a51d: e8ced2ffff call 0x1459577f0
14595a522: f20f11bd64010000 movsd qword ptr [rbp + 0x164], xmm7
14595a52a: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
14595a534: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14595a53e: 488d8510010000 lea rax, [rbp + 0x110]
14595a545: 4889442448 mov qword ptr [rsp + 0x48], rax
14595a54a: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14595a551: 895c2438 mov dword ptr [rsp + 0x38], ebx
14595a555: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
14595a55b: f3440f11442428 movss dword ptr [rsp + 0x28], xmm8
14595a562: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
14595a569: 4c8d8560010000 lea r8, [rbp + 0x160]
14595a570: 4889f1 mov rcx, rsi
14595a573: 4889fa mov rdx, rdi
14595a576: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
14595a57d: e85ed0ffff call 0x1459575e0
14595a582: e9f1d3ffff jmp 0x145957978
