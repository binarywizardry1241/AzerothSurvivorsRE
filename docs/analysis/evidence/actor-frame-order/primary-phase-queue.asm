14597a801: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
14597a808: 488d0cb6 lea rcx, [rsi + rsi*4]
14597a80c: 4c892cc8 mov qword ptr [rax + rcx*8], r13
14597a810: 4c8974c808 mov qword ptr [rax + rcx*8 + 8], r14
14597a815: 4c897cc810 mov qword ptr [rax + rcx*8 + 0x10], r15
14597a81a: 48897cc818 mov qword ptr [rax + rcx*8 + 0x18], rdi
14597a81f: 48895cc820 mov qword ptr [rax + rcx*8 + 0x20], rbx
14597a824: 48ffc6 inc rsi
14597a827: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
