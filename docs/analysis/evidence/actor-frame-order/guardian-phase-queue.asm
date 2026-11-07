14597a1fe: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14597a205: 4889f1 mov rcx, rsi
14597a208: 48c1e105 shl rcx, 5
14597a20c: 4c893408 mov qword ptr [rax + rcx], r14
14597a210: 4c897c0808 mov qword ptr [rax + rcx + 8], r15
14597a215: 48897c0810 mov qword ptr [rax + rcx + 0x10], rdi
14597a21a: 48895c0818 mov qword ptr [rax + rcx + 0x18], rbx
14597a21f: 48ffc6 inc rsi
14597a222: 4889b520010000 mov qword ptr [rbp + 0x120], rsi
