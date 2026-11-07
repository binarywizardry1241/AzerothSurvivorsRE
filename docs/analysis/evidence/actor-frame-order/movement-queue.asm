14597b2e1: 488b85b8020000 mov rax, qword ptr [rbp + 0x2b8]
14597b2e8: 488d0cb6 lea rcx, [rsi + rsi*4]
14597b2ec: 48893cc8 mov qword ptr [rax + rcx*8], rdi
14597b2f0: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
14597b2f7: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
14597b2fc: 8b95e8020000 mov edx, dword ptr [rbp + 0x2e8]
14597b302: 8954c810 mov dword ptr [rax + rcx*8 + 0x10], edx
14597b306: 66440f134cc814 movlpd qword ptr [rax + rcx*8 + 0x14], xmm9
14597b30d: f3440f1154c81c movss dword ptr [rax + rcx*8 + 0x1c], xmm10
14597b314: f3440f1174c820 movss dword ptr [rax + rcx*8 + 0x20], xmm14
14597b31b: 48ffc6 inc rsi
14597b31e: 4889b5c0020000 mov qword ptr [rbp + 0x2c0], rsi
