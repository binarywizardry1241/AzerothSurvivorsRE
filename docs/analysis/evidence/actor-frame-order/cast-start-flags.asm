1458c22cf: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c22d3: 891c10 mov dword ptr [rax + rdx], ebx
1458c22d6: 4883c204 add rdx, 4
1458c22da: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c22de: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c22e2: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c22e6: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c22ea: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c22ee: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c22f2: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c22f6: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c22fa: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c22fe: 4829d0 sub rax, rdx
1458c2301: 4883f801 cmp rax, 1
1458c2305: 0f86af000000 jbe 0x1458c23ba
1458c230b: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c230f: 66c704100200 mov word ptr [rax + rdx], 2
1458c2315: 4883c202 add rdx, 2
1458c2319: 488955c0 mov qword ptr [rbp - 0x40], rdx
