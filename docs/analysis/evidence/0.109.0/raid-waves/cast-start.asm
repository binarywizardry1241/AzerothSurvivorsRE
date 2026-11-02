1459577f0: 55 push rbp
1459577f1: 56 push rsi
1459577f2: 57 push rdi
1459577f3: 4883ec60 sub rsp, 0x60
1459577f7: 488d6c2460 lea rbp, [rsp + 0x60]
1459577fc: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
145957804: 4585c0 test r8d, r8d
145957807: 0f848b000000 je 0x145957898
14595780d: 4889ce mov rsi, rcx
145957810: f30f591d5c8d4900 mulss xmm3, dword ptr [rip + 0x498d5c]
145957818: f3480f2cc3 cvttss2si rax, xmm3
14595781d: 31c9 xor ecx, ecx
14595781f: 0f57c0 xorps xmm0, xmm0
145957822: 0f2ed8 ucomiss xmm3, xmm0
145957825: 0f43c8 cmovae ecx, eax
145957828: 0f2e1d11b64700 ucomiss xmm3, dword ptr [rip + 0x47b611]
14595782f: 41b9ffffffff mov r9d, 0xffffffff
145957835: 440f46c9 cmovbe r9d, ecx
145957839: c745c802000000 mov dword ptr [rbp - 0x38], 2
145957840: 488d45c8 lea rax, [rbp - 0x38]
145957844: 4889442420 mov qword ptr [rsp + 0x20], rax
145957849: 488d4dd8 lea rcx, [rbp - 0x28]
14595784d: e8cea9f6ff call 0x1458c2220
145957852: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
145957859: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
145957860: 750d jne 0x14595786f
145957862: 488d8e18060000 lea rcx, [rsi + 0x618]
145957869: e8a2352a00 call 0x145bfae10
14595786e: 90 nop
14595786f: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
145957876: 4889f9 mov rcx, rdi
145957879: 48c1e105 shl rcx, 5
14595787d: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
145957881: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
145957885: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14595788a: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14595788e: 48ffc7 inc rdi
145957891: 4889be28060000 mov qword ptr [rsi + 0x628], rdi
145957898: 4883c460 add rsp, 0x60
14595789c: 5f pop rdi
14595789d: 5e pop rsi
14595789e: 5d pop rbp
14595789f: c3 ret
