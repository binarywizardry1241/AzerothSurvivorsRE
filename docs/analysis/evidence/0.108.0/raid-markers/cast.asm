145950b00: 55 push rbp
145950b01: 56 push rsi
145950b02: 57 push rdi
145950b03: 4883ec60 sub rsp, 0x60
145950b07: 488d6c2460 lea rbp, [rsp + 0x60]
145950b0c: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
145950b14: 4585c0 test r8d, r8d
145950b17: 0f848b000000 je 0x145950ba8
145950b1d: 4889ce mov rsi, rcx
145950b20: f30f591dbc194a00 mulss xmm3, dword ptr [rip + 0x4a19bc]
145950b28: f3480f2cc3 cvttss2si rax, xmm3
145950b2d: 31c9 xor ecx, ecx
145950b2f: 0f57c0 xorps xmm0, xmm0
145950b32: 0f2ed8 ucomiss xmm3, xmm0
145950b35: 0f43c8 cmovae ecx, eax
145950b38: 0f2e1d39004800 ucomiss xmm3, dword ptr [rip + 0x480039]
145950b3f: 41b9ffffffff mov r9d, 0xffffffff
145950b45: 440f46c9 cmovbe r9d, ecx
145950b49: c745c802000000 mov dword ptr [rbp - 0x38], 2
145950b50: 488d45c8 lea rax, [rbp - 0x38]
145950b54: 4889442420 mov qword ptr [rsp + 0x20], rax
145950b59: 488d4dd8 lea rcx, [rbp - 0x28]
145950b5d: e84ea9f6ff call 0x1458bb4b0
145950b62: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
145950b69: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
145950b70: 750d jne 0x145950b7f
145950b72: 488d8e18060000 lea rcx, [rsi + 0x618]
145950b79: e862432a00 call 0x145bf4ee0
145950b7e: 90 nop
145950b7f: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
145950b86: 4889f9 mov rcx, rdi
145950b89: 48c1e105 shl rcx, 5
145950b8d: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
145950b91: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
145950b95: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145950b9a: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145950b9e: 48ffc7 inc rdi
145950ba1: 4889be28060000 mov qword ptr [rsi + 0x628], rdi
145950ba8: 4883c460 add rsp, 0x60
145950bac: 5f pop rdi
145950bad: 5e pop rsi
145950bae: 5d pop rbp
145950baf: c3 ret
