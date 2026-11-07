14597b423: 488b8598010000 mov rax, qword ptr [rbp + 0x198]
14597b42a: 4889f1 mov rcx, rsi
14597b42d: 48c1e104 shl rcx, 4
14597b431: f3440f110c08 movss dword ptr [rax + rcx], xmm9
14597b437: 48897c0808 mov qword ptr [rax + rcx + 8], rdi
14597b43c: 48ffc6 inc rsi
14597b43f: 4889b5a0010000 mov qword ptr [rbp + 0x1a0], rsi
14597b446: 4c8bbd18030000 mov r15, qword ptr [rbp + 0x318]
