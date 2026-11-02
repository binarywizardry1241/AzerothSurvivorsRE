0000000145bafde3 498b00                         mov rax, qword ptr [r8]
0000000145bafde6 8b00                           mov eax, dword ptr [rax]
0000000145bafde8 8986e80c0000                   mov dword ptr [rsi + 0xce8], eax
0000000145bafdee 498b4008                       mov rax, qword ptr [r8 + 8]
0000000145bafdf2 8b4808                         mov ecx, dword ptr [rax + 8]
0000000145bafdf5 898d98090000                   mov dword ptr [rbp + 0x998], ecx
0000000145bafdfb 488b00                         mov rax, qword ptr [rax]
0000000145bafdfe 48898590090000                 mov qword ptr [rbp + 0x990], rax
0000000145bafe05 498b4010                       mov rax, qword ptr [r8 + 0x10]
0000000145bafe09 f30f1010                       movss xmm2, dword ptr [rax]
0000000145bafe0d 488d9590090000                 lea rdx, [rbp + 0x990]
0000000145bafe14 4889f1                         mov rcx, rsi
0000000145bafe17 e884190200                     call 0x145bd17a0
