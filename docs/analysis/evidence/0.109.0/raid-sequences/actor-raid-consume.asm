14597c4bb: 488b8528020000 mov rax, qword ptr [rbp + 0x228]
14597c4c2: 48898520030000 mov qword ptr [rbp + 0x320], rax
14597c4c9: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
14597c4d0: 488b8538020000 mov rax, qword ptr [rbp + 0x238]
14597c4d7: 4885c0 test rax, rax
14597c4da: 7475 je 0x14597c551
14597c4dc: 486bf038 imul rsi, rax, 0x38
14597c4e0: 31db xor ebx, ebx
14597c4e2: 488dbd60020000 lea rdi, [rbp + 0x260]
14597c4e9: 48898df0020000 mov qword ptr [rbp + 0x2f0], rcx
14597c4f0: 0fb6441935 movzx eax, byte ptr [rcx + rbx + 0x35]
14597c4f5: 3cff cmp al, 0xff
14597c4f7: 7458 je 0x14597c551
14597c4f9: 488b1419 mov rdx, qword ptr [rcx + rbx]
14597c4fd: 440fb7441936 movzx r8d, word ptr [rcx + rbx + 0x36]
14597c503: 0f10441908 movups xmm0, xmmword ptr [rcx + rbx + 8]
14597c508: 0f104c1918 movups xmm1, xmmword ptr [rcx + rbx + 0x18]
14597c50d: 0f10541925 movups xmm2, xmmword ptr [rcx + rbx + 0x25]
14597c512: 0f11957d020000 movups xmmword ptr [rbp + 0x27d], xmm2
14597c519: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
14597c520: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
14597c527: 88858d020000 mov byte ptr [rbp + 0x28d], al
14597c52d: 664489858e020000 mov word ptr [rbp + 0x28e], r8w
14597c535: 4c89f9 mov rcx, r15
14597c538: 4989f8 mov r8, rdi
14597c53b: e8a0b3fdff call 0x1459578e0
14597c540: 90 nop
14597c541: 4883c338 add rbx, 0x38
14597c545: 4839de cmp rsi, rbx
14597c548: 488b8df0020000 mov rcx, qword ptr [rbp + 0x2f0]
14597c54f: 759f jne 0x14597c4f0
14597c551: 488b8520030000 mov rax, qword ptr [rbp + 0x320]
14597c558: 4885c0 test rax, rax
14597c55b: 740f je 0x14597c56c
14597c55d: 486bd038 imul rdx, rax, 0x38
14597c561: 41b808000000 mov r8d, 8
14597c567: e8645c68fa call 0x1400021d0
