1458c234a: 4c8b4550 mov r8, qword ptr [rbp + 0x50]
1458c234e: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2352: 893c10 mov dword ptr [rax + rdx], edi
1458c2355: 4883c204 add rdx, 4
1458c2359: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c235d: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2361: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2365: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2369: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c236d: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2371: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2375: 488d55b0 lea rdx, [rbp - 0x50]
1458c2379: 4889f1 mov rcx, rsi
1458c237c: e87faf0000 call 0x1458cd300
